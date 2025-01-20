@interface TCCDMDMPolicyOverride
+ (id)MDMOverridesFilePath;
- (TCCDMDMPolicyOverride)init;
- (void)addOrUpdateRecordsForCurrentPolicy;
- (void)parsePlist;
- (void)resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy;
- (void)updateDatabase;
- (void)updateDatabaseForPolicyAuthorizationRecord:(id)a3 service:(id)a4;
@end

@implementation TCCDMDMPolicyOverride

+ (id)MDMOverridesFilePath
{
  return @"/Library/Application Support/com.apple.TCC/MDMOverrides.plist";
}

- (TCCDMDMPolicyOverride)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TCCDMDMPolicyOverride;
  v2 = -[TCCDPolicyOverride init](&v15, "init");
  v4 = v2;
  if (v2)
  {
    id v5 = objc_msgSend((id)objc_opt_class(v2, v3), "MDMOverridesFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[TCCDPolicyOverride useString:orReadFromDefaults:]( &OBJC_CLASS___TCCDPolicyOverride,  "useString:orReadFromDefaults:",  v6,  @"sitePolicyOverridePath"));
    -[TCCDPolicyOverride setPlistFilePath:](v4, "setPlistFilePath:", v7);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100039620;
    handler[3] = &unk_100066070;
    v10 = v4;
    v14 = v10;
    notify_register_dispatch("com.apple.TCC.configuration-profile-changed", &dword_100078458, v9, handler);
    v11 = v10;
  }

  return v4;
}

- (void)updateDatabaseForPolicyAuthorizationRecord:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Authorization"]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Identifier"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"IdentifierType"]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CodeRequirementData"]);
  if ([v7 isEqualToString:@"bundleID"])
  {
    v9 = v8;
    v10 = v6;
    uint64_t v11 = 0LL;
    goto LABEL_5;
  }

  if ([v7 isEqualToString:@"path"])
  {
    v9 = v8;
    v10 = v6;
    uint64_t v11 = 1LL;
LABEL_5:
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x2020000000LL;
    char v53 = 0;
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    int v49 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100039C28;
    v42[3] = &unk_100066098;
    id v12 = v28;
    id v43 = v12;
    id v13 = v29;
    id v44 = v13;
    uint64_t v45 = v11;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100039CE4;
    v41[3] = &unk_100064F48;
    v41[4] = &v50;
    v41[5] = &v46;
    v6 = v10;
    v8 = v9;
    if (db_eval( (uint64_t)"SELECT flags FROM access WHERE service = ? AND client = ? AND client_type = ?",  v42,  v41))
    {
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        *(_DWORD *)buf = 138543874;
        v55 = v25;
        __int16 v56 = 2114;
        id v57 = v13;
        __int16 v58 = 2048;
        uint64_t v59 = v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Database query for MDM policy authorization record failed: serviceName=%{public}@, identifier=%{public}@, iden tifier_type=%lld",  buf,  0x20u);
      }

      goto LABEL_8;
    }

    if (!*((_BYTE *)v51 + 24))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100039DF8;
      v30[3] = &unk_1000660E8;
      v19 = (os_log_s *)v12;
      v31 = v19;
      id v20 = v13;
      id v32 = v20;
      uint64_t v34 = v11;
      id v33 = v9;
      int v35 = 12;
      if (db_eval( (uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reas on, auth_version, csreq, policy_id, indirect_object_identifier, flags) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",  v30,  0LL))
      {
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s name](v19, "name"));
          *(_DWORD *)buf = 138543874;
          v55 = v27;
          __int16 v56 = 2114;
          id v57 = v20;
          __int16 v58 = 2048;
          uint64_t v59 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to add new database record for MDM policy authorization record: serviceName=%{public}@, identifier=%{ public}@, identifier_type=%lld",  buf,  0x20u);
        }
      }

      v14 = v31;
      goto LABEL_8;
    }

    unsigned int v15 = *((_DWORD *)v47 + 6);
    if (v6)
    {
      if ([v6 isEqualToString:@"AllowStandardUserToSetSystemService"])
      {
        unsigned int v16 = v15 | 4;
        int v17 = *((_DWORD *)v47 + 6);
LABEL_29:
        if (v16 == v17) {
          goto LABEL_9;
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_100039D28;
        v36[3] = &unk_1000660C0;
        unsigned int v40 = v16;
        v22 = (os_log_s *)v12;
        v37 = v22;
        id v23 = v13;
        id v38 = v23;
        uint64_t v39 = v11;
        if (db_eval( (uint64_t)"UPDATE access SET flags = ? WHERE service = ? AND client = ? AND client_type = ?",  v36,  0LL))
        {
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s name](v22, "name"));
            *(_DWORD *)buf = 138543874;
            v55 = v26;
            __int16 v56 = 2114;
            id v57 = v23;
            __int16 v58 = 2048;
            uint64_t v59 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to update flags on existing database record: serviceName=%{public}@, identifier=%{public}@, identifier_type=%lld",  buf,  0x20u);
          }
        }

        v14 = v37;
LABEL_8:

LABEL_9:
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);
        goto LABEL_17;
      }

      int v17 = *((_DWORD *)v47 + 6);
    }

    else
    {
      int v17 = *((_DWORD *)v47 + 6);
    }

    unsigned int v16 = v15 & 0xFFFFFFF3;
    if ((v17 & 4) == 0) {
      unsigned int v16 = v15;
    }
    goto LABEL_29;
  }

  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10003A728((uint64_t)v7, v18);
  }

LABEL_17:
}

- (void)addOrUpdateRecordsForCurrentPolicy
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
  id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v3);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v7 = v6;
        id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v11);
              id v13 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
              v14 = (void *)objc_claimAutoreleasedReturnValue([v13 serviceByName:v12]);

              unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);
              -[TCCDMDMPolicyOverride updateDatabaseForPolicyAuthorizationRecord:service:]( self,  "updateDatabaseForPolicyAuthorizationRecord:service:",  v15,  v14);

              uint64_t v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v9);
        }

        uint64_t v3 = (char *)v3 + 1;
      }

      while (v3 != v18);
      id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v18);
  }
}

- (void)resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003A1F4;
  v4[3] = &unk_100066108;
  int v5 = 12;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10003A228;
  v2[3] = &unk_1000650B0;
  v2[4] = self;
  int v3 = 12;
  db_eval((uint64_t)"SELECT service, client, client_type, flags FROM access WHERE flags & ?", v4, v2);
}

- (void)updateDatabase
{
}

- (void)parsePlist
{
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride logHandle](&OBJC_CLASS___TCCDPolicyOverride, "logHandle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
    if (v5)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
      uint64_t v6 = (uint64_t)[v2 count];
    }

    else
    {
      uint64_t v6 = -1LL;
    }

    int v14 = 138412546;
    unsigned int v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Override: %@ MDM Plist with %ld entries.",  (uint8_t *)&v14,  0x16u);
    if (v5) {
  }
    }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
  [v7 removeAllObjects];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
    [v9 addEntriesFromDictionary:v10];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 server]);
  unsigned int v13 = objc_msgSend(v12, "macos_isSystemServer");

  if (v13) {
    -[TCCDMDMPolicyOverride updateDatabase](self, "updateDatabase");
  }
}

@end