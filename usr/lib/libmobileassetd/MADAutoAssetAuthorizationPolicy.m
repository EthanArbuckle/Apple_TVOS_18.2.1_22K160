@interface MADAutoAssetAuthorizationPolicy
+ (BOOL)_accessibleAssetTypes:(id)a3 containsAssetType:(id)a4;
+ (BOOL)isConnection:(id)a3 authorizedForMessage:(id)a4;
+ (BOOL)isConnectionAuthorized:(id)a3;
+ (id)_allowListedAutoAssetTypes;
+ (id)authorizationAssetTypeFromMessage:(id)a3 alreadyOnStateQueue:(BOOL)a4;
+ (id)issueSandboxExtensionForAuditToken:(id *)a3 path:(id)a4;
@end

@implementation MADAutoAssetAuthorizationPolicy

+ (BOOL)isConnectionAuthorized:(id)a3
{
  return 1;
}

+ (BOOL)isConnection:(id)a3 authorizedForMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"com.apple.private.assets.bypass-asset-types-check"));
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "valueForEntitlement:",  *(void *)(*((void *)&v23 + 1) + 8 * (void)i),  (void)v23));
        v13 = v12;
        if (v12 && ([v12 BOOLValue] & 1) != 0)
        {
          BOOL v17 = 1;
          v14 = v7;
          goto LABEL_24;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetAuthorizationPolicy authorizationAssetTypeFromMessage:alreadyOnStateQueue:]( &OBJC_CLASS___MADAutoAssetAuthorizationPolicy,  "authorizationAssetTypeFromMessage:alreadyOnStateQueue:",  v6,  0LL));
  if (!v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetAuthorizationPolicy isConnection:authorizedForMessage:].cold.1( (uint64_t)v5,  (uint64_t)v6,  (os_log_t)v13);
    }
    goto LABEL_23;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetAuthorizationPolicy _allowListedAutoAssetTypes]( &OBJC_CLASS___MADAutoAssetAuthorizationPolicy,  "_allowListedAutoAssetTypes"));
  unsigned __int8 v16 = [v15 containsObject:v14];

  if ((v16 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.assets.accessible-asset-types"]);
    if (v13)
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v13, v19) & 1) != 0)
      {
        if (+[MADAutoAssetAuthorizationPolicy _accessibleAssetTypes:containsAssetType:]( &OBJC_CLASS___MADAutoAssetAuthorizationPolicy,  "_accessibleAssetTypes:containsAssetType:",  v13,  v14))
        {
          BOOL v17 = 1;
LABEL_24:

          goto LABEL_25;
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v28 = v5;
          __int16 v29 = 2112;
          v30 = v14;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "{MADAutoAssetAuthorizationPolicy}(%{public}@) Client does not have requested asset type: %@ (found: %@)",  buf,  0x20u);
        }
      }
    }

+ (BOOL)_accessibleAssetTypes:(id)a3 containsAssetType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if (v11)
        {
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            if ((objc_msgSend(v11, "isEqualToString:", v6, (void)v16) & 1) != 0
              || [v11 hasPrefix:@"com.asset.MobileAsset."]
              && [v11 hasSuffix:@".*"]
              && ([v11 isEqualToString:@"com.asset.MobileAsset.*"] & 1) == 0
              && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", (char *)objc_msgSend(v11, "length") - 1)),
                  unsigned __int8 v14 = [v6 hasPrefix:v13],
                  v13,
                  (v14 & 1) != 0))
            {
              LOBYTE(v8) = 1;
              goto LABEL_17;
            }
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

+ (id)_allowListedAutoAssetTypes
{
  else {
    v2 = &off_38FB68;
  }
  return v2;
}

+ (id)issueSandboxExtensionForAuditToken:(id *)a3 path:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5)
  {
LABEL_9:
    unsigned __int8 v14 = 0LL;
    goto LABEL_10;
  }

  id v7 = v5;
  id v8 = [v7 fileSystemRepresentation];
  __int128 v9 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  __int128 v17 = v9;
  uint64_t v10 = (void *)sandbox_extension_issue_file_to_process("com.apple.assets.read", v8, 0LL, buf);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "{MADAutoAssetAuthorizationPolicy}(issueSandboxExtensionForAuditToken) Failed to set sandbox extension for audit token path: %{public}@",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  if (v13)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "{MADAutoAssetAuthorizationPolicy}(issueSandboxExtensionForAuditToken) Set sandbox extension for audit token at path: %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v10));
  free(v10);
LABEL_10:

  return v14;
}

+ (id)authorizationAssetTypeFromMessage:(id)a3 alreadyOnStateQueue:(BOOL)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
  id v8 = [v7 safeObjectForKey:@"instance" ofClass:objc_opt_class(MAAutoAssetInfoInstance)];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientAssetSelector]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetType]);

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 clientAssetSelector]);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetType]);
      -[NSMutableSet addObject:](v6, "addObject:", v13);
    }
  }

  if (__isPlatformVersionAtLeast(3, 17, 0, 0))
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    id v15 = [v14 safeObjectForKey:@"setInstance" ofClass:objc_opt_class(MAAutoAssetSetInfoInstance)];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 autoAssetEntries]);

      if (v17)
      {
        unsigned int v58 = v4;
        v59 = v9;
        id v60 = v5;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 autoAssetEntries]);
        id v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v72;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v72 != v21) {
                objc_enumerationMutation(v18);
              }
              __int128 v23 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetSelector]);
              __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 assetType]);

              if (v25)
              {
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v23 assetSelector]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v26 assetType]);
                -[NSMutableSet addObject:](v6, "addObject:", v27);
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
          }

          while (v20);
        }

        __int128 v69 = 0u;
        __int128 v70 = 0u;
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        v57 = v16;
        id obj = (id)objc_claimAutoreleasedReturnValue([v16 entriesWhenTargeting]);
        id v28 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v62 = *(void *)v68;
          do
          {
            for (j = 0LL; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v68 != v62) {
                objc_enumerationMutation(obj);
              }
              __int16 v31 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)j);
              __int128 v63 = 0u;
              __int128 v64 = 0u;
              __int128 v65 = 0u;
              __int128 v66 = 0u;
              v32 = (void *)objc_claimAutoreleasedReturnValue([v31 autoAssetEntries]);
              id v33 = [v32 countByEnumeratingWithState:&v63 objects:v79 count:16];
              if (v33)
              {
                id v34 = v33;
                uint64_t v35 = *(void *)v64;
                do
                {
                  for (k = 0LL; k != v34; k = (char *)k + 1)
                  {
                    if (*(void *)v64 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    v37 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)k);
                    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 assetSelector]);
                    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 assetType]);

                    if (v39)
                    {
                      v40 = (void *)objc_claimAutoreleasedReturnValue([v37 assetSelector]);
                      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 assetType]);
                      -[NSMutableSet addObject:](v6, "addObject:", v41);
                    }
                  }

                  id v34 = [v32 countByEnumeratingWithState:&v63 objects:v79 count:16];
                }

                while (v34);
              }
            }

            id v29 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
          }

          while (v29);
        }

        __int128 v9 = v59;
        id v5 = v60;
        uint64_t v4 = v58;
        __int128 v16 = v57;
      }

      uint64_t v42 = objc_claimAutoreleasedReturnValue([v16 clientDomainName]);
      if (v42)
      {
        v43 = (void *)v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSetIdentifier]);

        if (v44)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue([v16 clientDomainName]);
          v46 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSetIdentifier]);
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager assetTypeForClientDomainName:forSetIdentifier:alreadyOnStateQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "assetTypeForClientDomainName:forSetIdentifier:alreadyOnStateQueue:",  v45,  v46,  v4));

          if (v47) {
            -[NSMutableSet addObject:](v6, "addObject:", v47);
          }
        }
      }
    }
  }

  if ((unint64_t)-[NSMutableSet count](v6, "count") >= 2)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138543618;
      v76 = v6;
      __int16 v77 = 2114;
      v78 = v50;
      _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "{MADAutoAssetAuthorizationPolicy}(authorizationAssetTypeFromMessage) Found multiple asset types: %{public}@, for message: %{public}@",  buf,  0x16u);
    }
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v6, "allObjects"));
  v52 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v51 firstObject]);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v53 oslog]);

  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
    *(_DWORD *)buf = 138543618;
    v76 = v52;
    __int16 v77 = 2114;
    v78 = v55;
    _os_log_impl( &dword_0,  v54,  OS_LOG_TYPE_DEFAULT,  "{MADAutoAssetAuthorizationPolicy}(authorizationAssetTypeFromMessage) Found asset type: %{public}@, for message: %{public}@",  buf,  0x16u);
  }

  return v52;
}

+ (void)isConnection:(os_log_t)log authorizedForMessage:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{MADAutoAssetAuthorizationPolicy}(%{public}@) Request had no asset type listed for message: %{public}@",  (uint8_t *)&v3,  0x16u);
}

@end