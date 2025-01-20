@interface MCExtensibleSingleSignOnPayloadHandler
+ (BOOL)_writeConfiguration:(id)a3 withError:(id *)a4;
+ (BOOL)rebuildConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (id)_configurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCExtensibleSingleSignOnPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  id v9 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:installedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCExtensibleSingleSignOnPayload),  v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 mutableCopy];

  [v11 addObject:v8];
  id v17 = 0LL;
  [(id)objc_opt_class(self) rebuildConfigurationIncludingPayloads:v11 excludingPayloads:qword_1000DC220 error:&v17];
  id v12 = v17;

  if (v12)
  {
    if (a6) {
      *a6 = v12;
    }
  }

  else
  {
    os_log_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Installed Extensible SSO extension for %{public}@",  buf,  0xCu);
    }
  }

  return v12 == 0LL;
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned int v5 = [v4 isSetAside];

  if (!v5)
  {
    id v6 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:removedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCExtensibleSingleSignOnPayload),  v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 mutableCopy];

    [v8 addObject:v3];
    id v18 = 0LL;
    LODWORD(v7) = [(id)objc_opt_class(self) rebuildConfigurationIncludingPayloads:0 excludingPayloads:v8 error:&v18];
    id v9 = v18;
    if ((_DWORD)v7)
    {
      os_log_t v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        os_log_t v13 = "Removed Extensible SSO payload for extension ID %{public}@";
LABEL_11:
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 12;
        goto LABEL_12;
      }
    }

    else
    {
      os_log_t v14 = _MCLogObjects[0];
      if (v9)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          id v11 = v14;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
          *(_DWORD *)buf = 138543618;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v9;
          os_log_t v13 = "Failed to remove Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@";
          v15 = v11;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v17 = 22;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v13, buf, v17);
        }
      }

      else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v14;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        os_log_t v13 = "Remove Extensible SSO payload: no extension found with extension ID %{public}@";
        goto LABEL_11;
      }
    }

    goto LABEL_14;
  }

  [(id)qword_1000DC220 removeObject:v3];
LABEL_14:
}

- (void)setAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)qword_1000DC220;
  if (!qword_1000DC220)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v6 = (void *)qword_1000DC220;
    qword_1000DC220 = v5;

    v4 = (void *)qword_1000DC220;
  }

  [v4 addObject:v3];
  id v12 = 0LL;
  unsigned __int8 v7 = [(id)objc_opt_class(self) rebuildConfigurationIncludingPayloads:0 excludingPayloads:qword_1000DC220 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    os_log_t v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      os_log_t v10 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543618;
      os_log_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to set aside Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@",  buf,  0x16u);
    }
  }
}

- (void)unsetAside
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  [(id)qword_1000DC220 removeObject:v3];
  id v9 = 0LL;
  unsigned __int8 v4 = [(id)objc_opt_class(self) rebuildConfigurationIncludingPayloads:0 excludingPayloads:qword_1000DC220 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    os_log_t v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543618;
      id v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to restore Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@",  buf,  0x16u);
    }
  }
}

+ (BOOL)rebuildConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  os_log_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v11 = [v10 allInstalledPayloadsOfClass:objc_opt_class(MCExtensibleSingleSignOnPayload)];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v12 mutableCopy];

  id v20 = 0LL;
  os_log_t v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 _configurationForPayloads:v13 includingPayloads:v9 excludingPayloads:v8 error:&v20]);

  id v15 = v20;
  if (v15)
  {
    id v16 = v15;
    unsigned __int8 v17 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    id v19 = 0LL;
    unsigned __int8 v17 = [a1 _writeConfiguration:v14 withError:&v19];
    id v16 = v19;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (v16) {
    *a5 = v16;
  }
LABEL_7:

  return v17;
}

+ (id)_configurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472LL;
    v106[2] = sub_10007ABD0;
    v106[3] = &unk_1000C4080;
    id v107 = v9;
    id v108 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 indexesOfObjectsPassingTest:v106]);
    [v8 removeObjectsAtIndexes:v11];
  }

  v73 = v10;
  if ([v9 count]) {
    [v8 addObjectsFromArray:v9];
  }
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  id obj = v8;
  v84 = v12;
  v85 = v13;
  id v79 = [obj countByEnumeratingWithState:&v102 objects:v123 count:16];
  if (v79)
  {
    uint64_t v77 = *(void *)v103;
    uint64_t v75 = MCExtensibleSingleSignOnErrorDomain;
    uint64_t v74 = MCErrorTypeFatal;
LABEL_8:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v103 != v77) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v102 + 1) + 8 * v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_type"));
      unsigned int v17 = [v16 isEqualToString:@"Credential"];

      if (v17)
      {
        __int128 v100 = 0uLL;
        __int128 v101 = 0uLL;
        __int128 v98 = 0uLL;
        __int128 v99 = 0uLL;
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_hosts"));
        id v19 = [v18 countByEnumeratingWithState:&v98 objects:v122 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v81 = v14;
          uint64_t v21 = *(void *)v99;
          while (2)
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v99 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lowercaseString]);
              if ([v12 containsObject:v24])
              {
                if ([v9 containsObject:v15])
                {
                  v71 = v23;
                  uint64_t v38 = MCErrorArray(@"EXTENSIBLE_SSO_INTER_HOST_CONFLICT_P_HOST");
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  id v37 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v75,  54007LL,  v39,  0LL,  v74,  v71,  0LL));
                  goto LABEL_41;
                }

                os_log_t v25 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v26 = v25;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_extensionIdentifier"));
                  *(_DWORD *)buf = 138543618;
                  v119 = v27;
                  __int16 v120 = 2114;
                  v121 = v23;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Found pre-existing conflicting hosts while rebuilding configuration for Extensible SSO payload with extension ID %{public}@: %{public}@",  buf,  0x16u);

                  __int16 v12 = v84;
                }
              }

              else
              {
                [v12 addObject:v24];
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v98 objects:v122 count:16];
            if (v20) {
              continue;
            }
            break;
          }

+ (BOOL)_writeConfiguration:(id)a3 withError:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = MCExtensibleSingleSignOnErrorDomain;
    uint64_t v6 = MCErrorArray(@"EXTENSIBLE_SSO_CANNOT_WRITE_CONFIGURATION");
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v5,  54002LL,  v7,  0LL,  MCErrorTypeFatal,  0LL));
  }

  return 0;
}

@end