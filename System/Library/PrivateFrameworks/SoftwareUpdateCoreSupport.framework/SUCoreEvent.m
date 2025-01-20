@interface SUCoreEvent
+ (BOOL)isSharediPad;
- (BOOL)changedSinceReported;
- (BOOL)isEqualErrorEvent:(id)a3;
- (BOOL)isSuccess;
- (NSMutableDictionary)allFields;
- (NSString)reportedUUID;
- (NSURL)serverURL;
- (SUCoreEvent)initWithEventDictionary:(id)a3 extendingWith:(id)a4 reportingToServer:(id)a5;
- (id)getAugmentedEvent;
- (void)incrementErrorCount;
- (void)setAllFields:(id)a3;
- (void)setChangedSinceReported:(BOOL)a3;
- (void)setReportedUUID:(id)a3;
- (void)setServerURL:(id)a3;
@end

@implementation SUCoreEvent

- (SUCoreEvent)initWithEventDictionary:(id)a3 extendingWith:(id)a4 reportingToServer:(id)a5
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v105.receiver = self;
  v105.super_class = (Class)&OBJC_CLASS___SUCoreEvent;
  v11 = -[SUCoreEvent init](&v105, sel_init);
  if (!v11) {
    goto LABEL_30;
  }
  uint64_t v12 = objc_opt_new();
  allFields = v11->_allFields;
  v11->_allFields = (NSMutableDictionary *)v12;

  [v8 safeStringForKey:@"event"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14) {
    -[NSMutableDictionary setSafeObject:forKey:]( v11->_allFields,  "setSafeObject:forKey:",  @"SUCoreEvent",  @"event");
  }
  id v93 = v10;
  [v8 safeStringForKey:@"UUID"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    [MEMORY[0x189607AB8] UUID];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 UUIDString];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:", v15, @"UUID");
  }

  v92 = v15;
  objc_storeStrong((id *)&v11->_reportedUUID, v15);
  objc_storeStrong((id *)&v11->_serverURL, a5);
  v17 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  [v17 buildVersion];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  uint64_t v20 = [v19 splatCryptex1BuildVersion];

  v90 = (void *)v20;
  if (v20) {
    v21 = (void *)v20;
  }
  else {
    v21 = v18;
  }
  id v22 = v21;
  v23 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  [v23 splatCryptex1ProductVersionExtra];
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x189607968];
  v25 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  objc_msgSend(v24, "numberWithBool:", objc_msgSend(v25, "hasSplatOnlyUpdateInstalled"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x189607968];
  v27 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "hasSemiSplatActive"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  [v29 releaseType];
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  [v31 deviceClass];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
  [v32 hwModelString];
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = (void *)MGCopyAnswer();
  v95 = (void *)MGCopyAnswer();
  v33 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  [v33 oslog];
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = v30;
      v36 = "non-nil currentOSType found with value of: %{public}@";
LABEL_14:
      _os_log_impl(&dword_187139000, v34, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
    }
  }

  else
  {
    v30 = @"user";
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v108 = @"user";
      v36 = "nil currentOSType found, setting the currentOSType to: %{public}@";
      goto LABEL_14;
    }
  }

  v86 = (void *)[objc_alloc(NSString) initWithFormat:@"SUCore-%@", @"2.1.0"];
  -[NSMutableDictionary setSafeObject:forKey:](v11->_allFields, "setSafeObject:forKey:");
  -[NSMutableDictionary setSafeObject:forKey:]( v11->_allFields,  "setSafeObject:forKey:",  @"1.2",  @"reportVersion");
  v37 = v11->_allFields;
  _currentTimeInMilliseconds();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _ensureNSString(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v37, "setSafeObject:forKey:", v39, @"eventTime");

  v40 = v11->_allFields;
  v87 = v30;
  _ensureNSString(v30);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v40, "setSafeObject:forKey:", v41, @"currentOSType");

  v42 = v11->_allFields;
  v89 = v22;
  _ensureNSString(v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v42, "setSafeObject:forKey:", v43, @"currentOSVersion");

  v44 = v11->_allFields;
  v91 = v18;
  _ensureNSString(v18);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v44, "setSafeObject:forKey:", v45, @"currentBaseOSVersion");

  v46 = v11->_allFields;
  _ensureNSString(v100);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v46, "setSafeObject:forKey:", v47, @"currentProductVersionExtra");

  v48 = v11->_allFields;
  _ensureNSNumber(v99);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:]( v48,  "setSafeObject:forKey:",  v49,  @"rapidSecurityResponseInstalled");

  v50 = v11->_allFields;
  v88 = v28;
  _ensureNSNumber(v28);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:]( v50,  "setSafeObject:forKey:",  v51,  @"rapidSecurityResponseSemiSplat");

  v52 = v11->_allFields;
  _ensureNSString(v98);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v52, "setSafeObject:forKey:", v53, @"deviceClass");

  v54 = v11->_allFields;
  _ensureNSString(v97);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v54, "setSafeObject:forKey:", v55, @"deviceModel");

  v56 = v11->_allFields;
  _ensureNSNumber(v96);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v56, "setSafeObject:forKey:", v57, @"batteryLevel");

  v58 = v11->_allFields;
  _ensureNSNumber(v95);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v58, "setSafeObject:forKey:", v59, @"batteryIsCharging");

  else {
    v60 = @"false";
  }
  v61 = v11->_allFields;
  _ensureNSString(v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v61, "setSafeObject:forKey:", v62, @"sharediPad");

  v63 = (void *)MGCopyAnswer();
  v64 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x189613778], v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v64, "setSafeObject:forKey:", v65, @"storageCapacity");

  v66 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x189613788], v63);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v66, "setSafeObject:forKey:", v67, @"systemFsCapacity");

  v68 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x189613780], v63);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v68, "setSafeObject:forKey:", v69, @"systemFsFree");

  v70 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x189613770], v63);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v70, "setSafeObject:forKey:", v71, @"dataFsCapacity");

  v72 = v11->_allFields;
  _ensureNSNumberFromDictionary(*MEMORY[0x189613768], v63);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](v72, "setSafeObject:forKey:", v73, @"dataFsFree");

  [v8 safeStringForKey:@"result"];
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v74) {
    -[NSMutableDictionary setSafeObject:forKey:]( v11->_allFields,  "setSafeObject:forKey:",  @"success",  @"result");
  }
  id v94 = v8;
  -[NSMutableDictionary addEntriesFromDictionary:](v11->_allFields, "addEntriesFromDictionary:", v8);
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id v75 = v9;
  id v76 = v9;
  uint64_t v77 = [v76 countByEnumeratingWithState:&v101 objects:v106 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v102;
    do
    {
      for (uint64_t i = 0LL; i != v78; ++i)
      {
        if (*(void *)v102 != v79) {
          objc_enumerationMutation(v76);
        }
        uint64_t v81 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        v82 = -[NSMutableDictionary objectForKey:](v11->_allFields, "objectForKey:", v81);
        if (!v82)
        {
          v83 = v11->_allFields;
          [v76 objectForKey:v81];
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setSafeObject:forKey:](v83, "setSafeObject:forKey:", v84, v81);
        }
      }

      uint64_t v78 = [v76 countByEnumeratingWithState:&v101 objects:v106 count:16];
    }

    while (v78);
  }

  v11->_changedSinceReported = 0;
  id v9 = v75;
  id v10 = v93;
  id v8 = v94;
LABEL_30:

  return v11;
}

- (BOOL)isSuccess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeStringForKey:@"result"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    char v4 = [v3 isEqualToString:@"success"];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isEqualErrorEvent:(id)a3
{
  char v4 = (SUCoreEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else if (-[SUCoreEvent isSuccess](self, "isSuccess") || -[SUCoreEvent isSuccess](v4, "isSuccess"))
  {
    BOOL v5 = 0;
  }

  else
  {
    v6 = -[SUCoreEvent serverURL](self, "serverURL");
    [v6 absoluteString];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreEvent serverURL](v4, "serverURL");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 absoluteString];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v7, v9))
    {
      v25 = -[SUCoreEvent allFields](self, "allFields");
      [v25 safeStringForKey:@"event"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SUCoreEvent allFields](v4, "allFields");
      [v24 safeStringForKey:@"event"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v10, v11))
      {
        v23 = v10;
        uint64_t v12 = -[SUCoreEvent reportedUUID](self, "reportedUUID");
        uint64_t v13 = -[SUCoreEvent reportedUUID](v4, "reportedUUID");
        id v22 = (void *)v12;
        uint64_t v14 = v12;
        v15 = (void *)v13;
        if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v13))
        {
          v21 = -[SUCoreEvent allFields](self, "allFields");
          uint64_t v16 = [v21 safeStringForKey:@"result"];
          -[SUCoreEvent allFields](v4, "allFields");
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 safeStringForKey:@"result"];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)v16;
          BOOL v5 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v16, v17);
        }

        else
        {
          BOOL v5 = 0;
        }

        id v10 = v23;
      }

      else
      {
        BOOL v5 = 0;
      }
    }

    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)incrementErrorCount
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_187139000,  log,  OS_LOG_TYPE_ERROR,  "incrementErrorCount when event does not represent an error (no result)",  v1,  2u);
}

- (id)getAugmentedEvent
{
  id v3 = objc_alloc(MEMORY[0x189603FC8]);
  -[SUCoreEvent allFields](self, "allFields");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (void *)[v3 initWithDictionary:v4];

  return v5;
}

+ (BOOL)isSharediPad
{
  if (!objc_opt_class())
  {
    v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v9 = "[EVENT_REPORTER] UMUserManager class does not exist.";
      id v10 = (uint8_t *)&v14;
LABEL_12:
      _os_log_impl(&dword_187139000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }

- (NSMutableDictionary)allFields
{
  return self->_allFields;
}

- (void)setAllFields:(id)a3
{
}

- (BOOL)changedSinceReported
{
  return self->_changedSinceReported;
}

- (void)setChangedSinceReported:(BOOL)a3
{
  self->_changedSinceReported = a3;
}

- (NSURL)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
}

- (NSString)reportedUUID
{
  return self->_reportedUUID;
}

- (void)setReportedUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end