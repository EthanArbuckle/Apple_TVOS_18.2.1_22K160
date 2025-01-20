@interface MCAirPlayPayloadHandler
+ (void)recomputeAirPlaySettings;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_addDependency;
- (void)_removeDependency;
- (void)remove;
@end

@implementation MCAirPlayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v33 = self;
  -[MCAirPlayPayloadHandler _addDependency](self, "_addDependency");
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  v30 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationsWithPasswords]);
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    uint64_t v31 = kMCAppleKeychainGroup;
    uint64_t v32 = kMCAirPlayPasswordServiceKey;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 deviceName]);
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue([v13 password]);

          if (v16)
          {
            os_log_t v17 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              v19 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceName]);
              *(_DWORD *)buf = 138543362;
              v40 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Setting AirPlay password for device name %{public}@",  buf,  0xCu);
            }

            v20 = (void *)objc_claimAutoreleasedReturnValue([v13 password]);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceName]);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v33, "profileHandler"));
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 profile]);
            unsigned __int8 v24 = [v23 isInstalledForSystem];
            id v34 = 0LL;
            LOBYTE(v28) = v24;
            +[MCKeychain setString:forService:account:label:description:group:useSystemKeychain:outError:]( &OBJC_CLASS___MCKeychain,  "setString:forService:account:label:description:group:useSystemKeychain:outError:",  v20,  v32,  v21,  0LL,  0LL,  v31,  v28,  &v34);
            id v25 = v34;

            if (v25)
            {

              -[MCAirPlayPayloadHandler _removeDependency](v33, "_removeDependency");
              BOOL v26 = 0;
              if (a6) {
                *a6 = [v25 MCCopyAsPrimaryError];
              }
              goto LABEL_16;
            }
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v25 = 0LL;
  BOOL v26 = 1;
LABEL_16:

  return v26;
}

- (void)_addDependency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allowListDestinations]);
  id v4 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    uint64_t v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    uint64_t v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    uint64_t v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName", v31, v32));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceName]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v18 = v7;
          uint64_t v19 = v8;
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceID]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v19 = v31;
          uint64_t v18 = v32;
        }

        [v15 addDependent:v16 ofParent:v17 inDomain:v18 reciprocalDomain:v19];
      }

      id v5 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v5);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v2 destinationsWithPasswords]);
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    uint64_t v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    uint64_t v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceName]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
        [v28 addDependent:v29 ofParent:v30 inDomain:v24 reciprocalDomain:v25];
      }

      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v22);
  }
}

- (void)_removeDependency
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allowListDestinations]);
  id v4 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v7 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
    uint64_t v8 = kMCDMAirPlayAllowlistDeviceNameToPayloadUUIDDependencyKey;
    uint64_t v32 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
    uint64_t v31 = kMCDMAirPlayAllowlistMACToPayloadUUIDDependencyKey;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceName", v31, v32));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceName]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v18 = v7;
          uint64_t v19 = v8;
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceID]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
          v15 = v12;
          v16 = v13;
          os_log_t v17 = v14;
          uint64_t v19 = v31;
          uint64_t v18 = v32;
        }

        [v15 removeDependent:v16 fromParent:v17 inDomain:v18 reciprocalDomain:v19];
      }

      id v5 = [v3 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v5);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v2 destinationsWithPasswords]);
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v34;
    uint64_t v24 = kMCDMPayloadUUIDToAirPlayPasswordDeviceNameDependencyKey;
    uint64_t v25 = kMCDMAirPlayPasswordDeviceNameToPayloadUUIDDependencyKey;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)j);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceName]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v2 UUID]);
        [v28 removeDependent:v29 fromParent:v30 inDomain:v24 reciprocalDomain:v25];
      }

      id v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v22);
  }
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCAirPlayPayloadHandler _removeDependency](self, "_removeDependency");
  }
}

+ (void)recomputeAirPlaySettings
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Recomputing AirPlay settings.", buf, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  uint64_t v4 = kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 parentsInDomain:kMCDMPayloadUUIDToAirPlayAllowlistMACDependencyKey]);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v3 dependentsOfParent:*(void *)(*((void *)&v43 + 1) + 8 * (void)i) inDomain:v4]);
        if ([v11 count])
        {
          if (v8)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
            [(id)v8 intersectSet:v12];
          }

          else
          {
            uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v11));
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if ([(id)v8 count])
  {
    os_log_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v13;
      id v15 = [(id)v8 count];
      *(_DWORD *)buf = 134217984;
      id v49 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Setting AirPlay allowlist to %lu devices.",  buf,  0xCu);
    }
  }

  else
  {

    uint64_t v8 = 0LL;
  }

  __int128 v38 = v5;
  uint64_t v16 = kMCDMPayloadUUIDToDeviceNameDependencyKey;
  os_log_t v17 = (void *)objc_claimAutoreleasedReturnValue([v3 parentsInDomain:kMCDMPayloadUUIDToDeviceNameDependencyKey]);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = 0LL;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (j = 0LL; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( [v3 dependentsOfParent:*(void *)(*((void *)&v39 + 1) + 8 * (void)j) inDomain:v16]);
        if ([v23 count])
        {
          if (v20)
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));
            [(id)v20 intersectSet:v24];
          }

          else
          {
            uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v23));
          }
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }

    while (v19);
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  if ([(id)v20 count])
  {
    os_log_t v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      BOOL v26 = v25;
      id v27 = [(id)v8 count];
      *(_DWORD *)buf = 134217984;
      id v49 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Setting AirPlay allowlist to %lu devices.",  buf,  0xCu);
    }
  }

  else
  {

    uint64_t v20 = 0LL;
  }

  unint64_t v28 = (unint64_t)CFPreferencesCopyAppValue(@"deviceFilter", @"com.apple.airplay");
  if (v28 | v8
    && (v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v8 allObjects]),
        unsigned __int8 v30 = [(id)v28 isEqualToArray:v29],
        v29,
        (v30 & 1) == 0))
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([(id)v8 allObjects]);
    CFPreferencesSetAppValue(@"deviceFilter", v32, @"com.apple.airplay");

    int v31 = 1;
  }

  else
  {
    int v31 = 0;
  }

  unint64_t v33 = (unint64_t)CFPreferencesCopyAppValue(@"deviceNameFilter", @"com.apple.airplay");
  if (v33 | v20
    && (__int128 v34 = (void *)objc_claimAutoreleasedReturnValue([(id)v20 allObjects]),
        unsigned __int8 v35 = [(id)v33 isEqualToArray:v34],
        v34,
        (v35 & 1) == 0))
  {
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v20 allObjects]);
    CFPreferencesSetAppValue(@"deviceNameFilter", v36, @"com.apple.airplay");
  }

  else if (!v31)
  {
    goto LABEL_47;
  }

  uint64_t v37 = CFPreferencesAppSynchronize(@"com.apple.airplay");
  MCSendAirPlayPreferencesChangedNotification(v37);
LABEL_47:
}

@end