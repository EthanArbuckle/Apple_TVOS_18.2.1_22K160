@interface PluginPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)doesPolicyContainGroup:(id)a3;
- (BOOL)isValid;
- (NSMutableArray)groups;
- (NSMutableArray)matchingFilters;
- (NSString)pluginName;
- (PluginPolicy)initWithCoder:(id)a3;
- (PluginPolicy)initWithPolicyDictionary:(id)a3 pluginName:(id)a4;
- (double)remoteFirmwareCheckInterval;
- (id)getMatchingFilterWithName:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)parsePolicyDict:(id)a3;
- (void)setGroups:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setMatchingFilters:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setRemoteFirmwareCheckInterval:(double)a3;
@end

@implementation PluginPolicy

- (PluginPolicy)initWithPolicyDictionary:(id)a3 pluginName:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PluginPolicy;
  v6 = -[PluginPolicy init](&v14, "init");
  v6->isValid = 0;
  v6->remoteFirmwareCheckInterval = -1.0;
  v6->matchingFilters = 0LL;
  v6->pluginName = 0LL;
  if (!a3)
  {
    v11 = @"Can't create policy obj from NULL dict";
LABEL_17:
    FudLog(3LL, v11);
    v12 = v6;
    return 0LL;
  }

  if (!a4)
  {
    v11 = @"Can't create policy witout plugin name";
    goto LABEL_17;
  }

  v6->pluginName = (NSString *)a4;
  v7 = (const void *)MGCopyAnswer(@"InternalBuild", 0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Use Alternate Accessory List for %@",  buf,  0xCu);
  }

  v8 = +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUP.plist");
  if (!v8) {
    goto LABEL_21;
  }
  v9 = v8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Alternate Accessory List for %@",  buf,  0xCu);
  }

  v10 = +[NSDictionary dictionaryWithContentsOfURL:](&OBJC_CLASS___NSDictionary, "dictionaryWithContentsOfURL:", v9);
  if (!v10)
  {
LABEL_21:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Native Accessory List for %@",  buf,  0xCu);
    }

    v10 = (NSDictionary *)a3;
  }

  -[PluginPolicy parsePolicyDict:](v6, "parsePolicyDict:", v10);
  return v6;
}

- (void)parsePolicyDict:(id)a3
{
  if (!a3)
  {
    v72 = @"Can't parse NULL dictionary";
LABEL_72:
    FudLog(3LL, v72);
    return;
  }

  if (![a3 objectForKey:@"MobileAccessoryUpdaterProperties"])
  {
    v73 = @"Dictionary does not contain required key: %@";
LABEL_74:
    FudLog(3LL, v73);
    return;
  }

  id v5 = [a3 objectForKey:@"MobileAccessoryUpdaterProperties"];
  self->isValid = 0;
  id v6 = [v5 objectForKey:@"RemoteFirmwareCheckInterval"];
  if (!v6) {
    goto LABEL_92;
  }
  v7 = v6;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
    goto LABEL_93;
  }
  [v7 doubleValue];
  self->remoteFirmwareCheckInterval = v9;
  id v10 = [v5 objectForKey:@"Groups"];
  if (!v10) {
    goto LABEL_92;
  }
  id v11 = v10;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0) {
    goto LABEL_93;
  }
  self->groups = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v11);
  id v13 = [v5 objectForKey:@"MatchingDevices"];
  if (!v13)
  {
LABEL_92:
    v73 = @"Policy is missing required key: %@";
    goto LABEL_74;
  }

  objc_super v14 = v13;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
LABEL_93:
    v73 = @"Policy value for %@ is of wrong type";
    goto LABEL_74;
  }

  id v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
  self->matchingFilters = v16;
  if (!v16)
  {
    v72 = @"Failed to allocate matching dictionary";
    goto LABEL_72;
  }

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id obj = v14;
  id v17 = [v14 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (!v17) {
    goto LABEL_70;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v84;
  while (2)
  {
    v20 = 0LL;
    do
    {
      if (*(void *)v84 != v19) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)v20);
      if (!v21)
      {
        v73 = @"Can't process NULL matching dictionary";
        goto LABEL_74;
      }

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0)
      {
        v73 = @"Policy matching dictionary if wrong type";
        goto LABEL_74;
      }

      v23 = objc_alloc_init(&OBJC_CLASS___MatchingFilter);
      id v24 = [v21 objectForKey:@"DeviceClass"];
      if (!v24) {
        goto LABEL_85;
      }
      id v25 = v24;
      uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0) {
        goto LABEL_86;
      }
      -[MatchingFilter setFilterName:](v23, "setFilterName:", v25);
      id v27 = [v21 objectForKey:@"DeviceClassName"];
      if (!v27) {
        goto LABEL_85;
      }
      id v28 = v27;
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0) {
        goto LABEL_86;
      }
      -[MatchingFilter setFilterReadableName:](v23, "setFilterReadableName:", v28);
      id v30 = [v21 objectForKey:@"MatchingType"];
      if (!v30) {
        goto LABEL_85;
      }
      id v31 = v30;
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0) {
        goto LABEL_86;
      }
      -[MatchingFilter setFilterType:](v23, "setFilterType:", v31);
      id v33 = [v21 objectForKey:@"NeedsBootstrapping"];
      if (!v33) {
        goto LABEL_85;
      }
      v34 = v33;
      uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v34, v35) & 1) == 0) {
        goto LABEL_86;
      }
      -[MatchingFilter setNeedsBootstrapping:](v23, "setNeedsBootstrapping:", [v34 BOOLValue]);
      id v36 = [v21 objectForKey:@"NeedsQueryDevices"];
      if (v36)
      {
        v37 = v36;
        uint64_t v38 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v37, v38) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsQueryDevices:](v23, "setNeedsQueryDevices:", [v37 BOOLValue]);
      }

      id v39 = [v21 objectForKey:@"NeedsPeriodicFirmwareCheck"];
      if (v39)
      {
        v40 = v39;
        uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v40, v41) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsPeriodicFirmwareCheck:]( v23,  "setNeedsPeriodicFirmwareCheck:",  [v40 BOOLValue]);
        v75 = v23;
        FudLog(7LL, @"aMatchingFilter %@ NeedsPeriodicFirmwareCheck");
      }

      else
      {
        -[MatchingFilter setNeedsPeriodicFirmwareCheck:](v23, "setNeedsPeriodicFirmwareCheck:", 0LL);
      }

      id v42 = objc_msgSend(v21, "objectForKey:", @"NeedsDeviceIdleCheck", v75);
      if (v42)
      {
        v43 = v42;
        uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v43, v44) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsDeviceIdleCheck:](v23, "setNeedsDeviceIdleCheck:", [v43 BOOLValue]);
        v76 = v23;
        FudLog(7LL, @"aMatchingFilter %@ NeedsDeviceIdleCheck");
      }

      else
      {
        -[MatchingFilter setNeedsDeviceIdleCheck:](v23, "setNeedsDeviceIdleCheck:", 0LL);
      }

      id v45 = objc_msgSend(v21, "objectForKey:", @"NoPowerAssertion", v76);
      if (v45)
      {
        v46 = v45;
        uint64_t v47 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNoPowerAssertion:](v23, "setNoPowerAssertion:", [v46 BOOLValue]);
        v77 = v23;
        FudLog(7LL, @"aMatchingFilter %@ noPowerAssertion");
      }

      else
      {
        -[MatchingFilter setNoPowerAssertion:](v23, "setNoPowerAssertion:", 0LL);
      }

      id v48 = objc_msgSend(v21, "objectForKey:", @"NeedsMayRebootCheck", v77);
      if (v48)
      {
        v49 = v48;
        uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v49, v50) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsMayRebootCheck:](v23, "setNeedsMayRebootCheck:", [v49 BOOLValue]);
        v78 = v23;
        FudLog(7LL, @"aMatchingFilter %@ NeedsMayRebootCheck");
      }

      else
      {
        -[MatchingFilter setNeedsMayRebootCheck:](v23, "setNeedsMayRebootCheck:", 0LL);
      }

      id v51 = objc_msgSend(v21, "objectForKey:", @"NeedsInstallerCheck", v78);
      if (v51)
      {
        v52 = v51;
        uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v52, v53) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsInstallerCheck:](v23, "setNeedsInstallerCheck:", [v52 BOOLValue]);
        v79 = v23;
        FudLog(7LL, @"aMatchingFilter %@ NeedsInstallerCheck");
      }

      else
      {
        -[MatchingFilter setNeedsInstallerCheck:](v23, "setNeedsInstallerCheck:", 0LL);
      }

      id v54 = objc_msgSend(v21, "objectForKey:", @"NeedsMultiUpdateCheck", v79);
      if (v54)
      {
        v55 = v54;
        uint64_t v56 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v55, v56) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setNeedsMultiUpdateCheck:](v23, "setNeedsMultiUpdateCheck:", [v55 BOOLValue]);
        v80 = v23;
        FudLog(7LL, @"aMatchingFilter %@ NeedsMultiUpdateCheck");
      }

      else
      {
        -[MatchingFilter setNeedsMultiUpdateCheck:](v23, "setNeedsMultiUpdateCheck:", 0LL);
      }

      id v57 = objc_msgSend(v21, "objectForKey:", @"EAOverHID", v80);
      if (v57)
      {
        v58 = v57;
        uint64_t v59 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v58, v59) & 1) == 0) {
          goto LABEL_86;
        }
        -[MatchingFilter setEaOverHIDAccessory:](v23, "setEaOverHIDAccessory:", [v58 BOOLValue]);
        v81 = v23;
        FudLog(7LL, @"aMatchingFilter %@ is EAOverHID Accessory");
      }

      else
      {
        -[MatchingFilter setEaOverHIDAccessory:](v23, "setEaOverHIDAccessory:", 0LL);
      }

      id v60 = objc_msgSend(v21, "objectForKey:", @"MatchingDictionary", v81);
      if (!v60)
      {
LABEL_85:
        v74 = @"Policy is missing required key: %@";
        goto LABEL_87;
      }

      id v61 = v60;
      uint64_t v62 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v61, v62) & 1) == 0) {
        goto LABEL_86;
      }
      -[MatchingFilter setFilter:](v23, "setFilter:", v61);
      v63 = (NSString *)[v21 objectForKey:@"ExclusionGroup"];
      if (!v63) {
        v63 = -[MatchingFilter filterName](v23, "filterName");
      }
      -[MatchingFilter setExclusionGroup:](v23, "setExclusionGroup:", v63);
      id v64 = [v21 objectForKey:@"SilentUpdateNoUI"];
      if (v64)
      {
        v65 = v64;
        uint64_t v66 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v65, v66) & 1) == 0) {
          goto LABEL_86;
        }
        id v67 = [v65 BOOLValue];
      }

      else
      {
        id v67 = 0LL;
      }

      -[MatchingFilter setSilentUpdateNoUI:](v23, "setSilentUpdateNoUI:", v67);
      id v68 = [v21 objectForKey:@"StopOnBootstrapFailure"];
      if (v68)
      {
        v69 = v68;
        uint64_t v70 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
        {
          id v71 = [v69 BOOLValue];
          goto LABEL_68;
        }

- (id)getMatchingFilterWithName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  matchingFilters = self->matchingFilters;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( matchingFilters,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(matchingFilters);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( matchingFilters,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (BOOL)doesPolicyContainGroup:(id)a3
{
  groups = self->groups;
  if (groups)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( groups,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(groups);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)i) isEqualToString:a3])
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( groups,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
        LOBYTE(v5) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    FudLog(3LL, @"Can't check group membership with no groups array!");
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  pluginName = self->pluginName;
  if (pluginName) {

  }
  groups = self->groups;
  if (groups) {

  }
  matchingFilters = self->matchingFilters;
  if (matchingFilters) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PluginPolicy;
  -[PluginPolicy dealloc](&v6, "dealloc");
}

- (PluginPolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PluginPolicy;
  v4 = -[PluginPolicy init](&v8, "init");
  if (v4)
  {
    v4->pluginName = (NSString *) [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"pluginName"];
    v4->isValid = [a3 decodeBoolForKey:@"isValid"];
    [a3 decodeDoubleForKey:@"remoteFirmwareCheckInterval"];
    v4->remoteFirmwareCheckInterval = v5;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v4->matchingFilters = (NSMutableArray *) objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithObjects:]( NSSet,  "setWithObjects:",  v6,  objc_opt_class(MatchingFilter),  0),  @"matchingFilters");
    v9[0] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    v9[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v4->groups = (NSMutableArray *) objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithArray:]( NSSet,  "setWithArray:",  +[NSArray arrayWithObjects:count:]( NSArray,  "arrayWithObjects:count:",  v9,  2)),  @"groups");
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)pluginName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPluginName:(id)a3
{
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (double)remoteFirmwareCheckInterval
{
  return self->remoteFirmwareCheckInterval;
}

- (void)setRemoteFirmwareCheckInterval:(double)a3
{
  self->remoteFirmwareCheckInterval = a3;
}

- (NSMutableArray)matchingFilters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMatchingFilters:(id)a3
{
}

- (NSMutableArray)groups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setGroups:(id)a3
{
}

@end