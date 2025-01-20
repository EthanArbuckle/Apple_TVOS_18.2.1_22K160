@interface MCFeatureFlagsPayloadHandler
+ (BOOL)_reapplyConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5;
+ (BOOL)_reapplyPayloads:(id)a3 error:(id *)a4;
+ (id)_fullyInstalledPayloads;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCFeatureFlagsPayloadHandler

+ (id)_fullyInstalledPayloads
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
  id v3 = [v2 allInstalledPayloadsOfClass:objc_opt_class(MCFeatureFlagsPayload)];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

+ (BOOL)_reapplyPayloads:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Begin applying changes to feature flag settings.",  buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[FFConfiguration configurationForProfileManagement]( &OBJC_CLASS___FFConfiguration,  "configurationForProfileManagement"));
  v8 = v7;
  if (v7)
  {
    v32 = a4;
    [v7 prepareToAddProfilePayloads];
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v33 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v10)
    {
      id v11 = v10;
      id v12 = 0LL;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        v14 = 0LL;
        v15 = v12;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 featureFlagsConfiguration]);
          os_log_t v18 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            v19 = v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);
            *(_DWORD *)buf = 138543618;
            v41 = v20;
            __int16 v42 = 2112;
            id v43 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Adding feature flag settings from payload %{public}@: %@.",  buf,  0x16u);
          }

          id v35 = v15;
          unsigned __int8 v21 = [v8 addProfilePayload:v17 error:&v35];
          id v12 = v35;

          if ((v21 & 1) == 0)
          {
            os_log_t v22 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v23 = v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);
              *(_DWORD *)buf = 138543618;
              v41 = v24;
              __int16 v42 = 2114;
              id v43 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to apply feature flag configuration payload %{public}@ with error: %{public}@",  buf,  0x16u);
            }

            unsigned __int8 v25 = 0;
            goto LABEL_25;
          }

          v14 = (char *)v14 + 1;
          v15 = v12;
        }

        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    else
    {
      id v12 = 0LL;
    }

    v27 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Committing changes to feature flag settings.",  buf,  2u);
    }

    id v34 = v12;
    unsigned __int8 v25 = [v8 commitProfilePayloadsAndReturnError:&v34];
    id v28 = v34;

    id v12 = v28;
LABEL_25:
    a4 = v32;
    id v5 = v33;
  }

  else
  {
    v26 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_FAULT,  "Unable to communicate with feature flag manager",  buf,  2u);
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  MCFeatureFlagsErrorDomain,  58002LL,  0LL,  0LL,  MCErrorTypeFatal));
    unsigned __int8 v25 = 0;
  }

  v29 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "End applying changes to feature flag settings.",  buf,  2u);
  }

  if (a4) {
    char v30 = v25;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    *a4 = v12;
  }

  return v25;
}

+ (BOOL)_reapplyConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _fullyInstalledPayloads]);
  [v10 addObjectsFromArray:v11];

  [v10 addObjectsFromArray:v9];
  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100076D84;
    v18[3] = &unk_1000C4010;
    id v19 = v8;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v18));
    [v10 filterUsingPredicate:v12];
  }

  os_log_t v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    id v15 = [v10 count];
    *(_DWORD *)buf = 134217984;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Applying %lu feature flag payloads", buf, 0xCu);
  }

  unsigned __int8 v16 = [a1 _reapplyPayloads:v10 error:a5];

  return v16;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  id v9 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:installedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCFeatureFlagsPayload),  v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 mutableCopy];

  [v11 addObject:v8];
  id v21 = 0LL;
  unsigned __int8 v12 = [(id)objc_opt_class(self) _reapplyConfigurationIncludingPayloads:v11 excludingPayloads:0 error:&v21];
  id v13 = v21;
  if ((v12 & 1) == 0)
  {
    uint64_t v14 = MCInstallationErrorDomain;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 friendlyName]);
    uint64_t v17 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
    os_log_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v14,  4001LL,  v18,  v13,  MCErrorTypeFatal,  v16,  0LL));

    if (a6) {
      *a6 = v19;
    }
  }

  return v12;
}

- (void)remove
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v5 = [v4 isSetAside];

  if ((v5 & 1) == 0)
  {
    id v6 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:removedBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCFeatureFlagsPayload),  v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = [v7 mutableCopy];

    [v8 addObject:v3];
    id v18 = 0LL;
    unsigned int v9 = [(id)objc_opt_class(self) _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v8 error:&v18];
    id v10 = v18;
    os_log_t v11 = _MCLogObjects[0];
    if (v9)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v12 = v11;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        uint64_t v14 = "Removed Feature Flags with payload ID %{public}@";
        id v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
      }
    }

    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2114;
      id v22 = v10;
      uint64_t v14 = "Failed to remove Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 22;
      goto LABEL_7;
    }
  }
}

- (void)setAside
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = +[MCProfileHandler payloadsOfClass:setAsideBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:setAsideBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCFeatureFlagsPayload),  v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  id v6 = [(id)v5 mutableCopy];

  [v6 addObject:v3];
  id v11 = 0LL;
  LOBYTE(v5) = [(id)objc_opt_class(self) _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v6 error:&v11];
  id v7 = v11;
  if ((v5 & 1) == 0)
  {
    os_log_t v8 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2114;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to set aside Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@",  buf,  0x16u);
    }
  }
}

- (void)unsetAside
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v4 = +[MCProfileHandler payloadsOfClass:unsetAsideBeforePayload:]( &OBJC_CLASS___MCProfileHandler,  "payloadsOfClass:unsetAsideBeforePayload:",  objc_opt_class(&OBJC_CLASS___MCFeatureFlagsPayload),  v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 mutableCopy];

  [v6 addObject:v3];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 profile]);
  id v9 = [v8 payloadsOfKindOfClass:objc_opt_class(MCFeatureFlagsPayload)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 mutableCopy];

  [v11 removeObjectsInArray:v6];
  id v16 = 0LL;
  LOBYTE(v7) = [(id)objc_opt_class(self) _reapplyConfigurationIncludingPayloads:0 excludingPayloads:v11 error:&v16];
  id v12 = v16;
  if ((v7 & 1) == 0)
  {
    os_log_t v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
      *(_DWORD *)buf = 138543618;
      id v18 = v15;
      __int16 v19 = 2114;
      id v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to restore Feature Flags payload with payload ID %{public}@. Ignoring. Error: %{public}@",  buf,  0x16u);
    }
  }
}

@end