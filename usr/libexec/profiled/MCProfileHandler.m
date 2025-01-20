@interface MCProfileHandler
+ (id)payloadsOfClass:(Class)a3 installedBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 removedBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 setAsideBeforePayload:(id)a4;
+ (id)payloadsOfClass:(Class)a3 unsetAsideBeforePayload:(id)a4;
+ (id)userCancelledError;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (BOOL)isSetAside;
- (BOOL)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4 outError:(id *)a5;
- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5;
- (MCProfile)profile;
- (MCProfileHandler)initWithProfile:(id)a3;
- (NSArray)payloadHandlers;
- (id)_profileInstallationErrorWithUnderlyingError:(id)a3;
- (id)payloadHandlerWithUUID:(id)a3;
- (id)persistentIDForCertificateUUID:(id)a3;
- (id)userCancelledError;
- (id)userInputArray;
- (void)convertPayloadWithUUIDToUnknownPayload:(id)a3;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
- (void)unstageFromInstallationWithInstaller:(id)a3;
@end

@implementation MCProfileHandler

- (id)payloadHandlerWithUUID:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = self->_payloadHandlers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload", (void)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUID]);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (MCProfileHandler)initWithProfile:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MCProfileHandler;
  id v6 = -[MCProfileHandler init](&v31, "init");
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v8 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 payloads]);
    v10 = -[NSMutableArray initWithCapacity:](v8, "initWithCapacity:", [v9 count]);
    id v11 = p_isa[2];
    p_isa[2] = v10;

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloads", 0));
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          __int128 v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 handlerWithProfileHandler:p_isa]);
          if (!v18)
          {
            os_log_t v21 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              v23 = (void *)objc_opt_class(p_isa);
              id v24 = v23;
              v25 = (void *)objc_claimAutoreleasedReturnValue([v17 friendlyName]);
              *(_DWORD *)buf = 138543618;
              v33 = v23;
              __int16 v34 = 2114;
              v35 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%{public}@ Cannot instantiate a payload handler for payload “%{public}@”.",  buf,  0x16u);
            }

            v20 = 0LL;
            goto LABEL_15;
          }

          v19 = (void *)v18;
          [p_isa[2] addObject:v18];
        }

        id v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }

  v20 = p_isa;
LABEL_15:

  return v20;
}

+ (id)userCancelledError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = MCErrorArray(@"ERROR_PROFILE_USER_CANCELLED");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4004LL,  v4,  MCErrorTypeFatal,  0LL));

  return v5;
}

- (id)userCancelledError
{
  uint64_t v2 = MCInstallationErrorDomain;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 friendlyName]);
  uint64_t v5 = MCErrorArray(@"ERROR_PROFILE_USER_CANCELLED_P_ID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v2,  4004LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_profileInstallationErrorWithUnderlyingError:(id)a3
{
  uint64_t v4 = MCProfileErrorDomain;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 friendlyName]);
  uint64_t v8 = MCErrorArray(@"ERROR_PROFILE_INSTALLATION_FAIL_P_ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v4,  1009LL,  v9,  v5,  MCErrorTypeFatal,  v7,  0LL));

  return v10;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v66 = v9;
  v67 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_payloadHandlers, "count"));
  v73 = self;
  v65 = a5;
  if (v9)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableArray count](self->_payloadHandlers, "count")));
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    v10 = self->_payloadHandlers;
    id v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v88,  v99,  16LL);
    if (v70)
    {
      id v64 = v8;
      char v11 = 0;
      uint64_t v69 = *(void *)v89;
      uint64_t v12 = kMCIDFinePrintKey;
      uint64_t v13 = kMCIDFlagsKey;
      id v14 = v68;
      do
      {
        for (i = 0LL; i != v70; i = (char *)i + 1)
        {
          if (*(void *)v89 != v69) {
            objc_enumerationMutation(v10);
          }
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v88 + 1) + 8 * (void)i) userInputFields]);
          if ([v16 count])
          {
            v71 = v16;
            v72 = i;
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            __int128 v84 = 0u;
            __int128 v85 = 0u;
            id v17 = v16;
            id v18 = [v17 countByEnumeratingWithState:&v84 objects:v98 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v85;
              do
              {
                for (j = 0LL; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v85 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)j);
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v12]);

                  if (!v23)
                  {
                    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v13]);
                    unsigned __int8 v25 = [v24 intValue];

                    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile friendlyName](v73->_profile, "friendlyName"));
                    if ((v25 & 5) != 0) {
                      __int128 v27 = @"REQUESTED_BY_PROFILE_P_ID";
                    }
                    else {
                      __int128 v27 = @"REQUIRED_BY_PROFILE_P_ID";
                    }
                    uint64_t v28 = MCLocalizedFormat(v27);
                    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

                    objc_msgSend(v22, "setObject:forKey:", v29, v12, v26);
                  }
                }

                id v19 = [v17 countByEnumeratingWithState:&v84 objects:v98 count:16];
              }

              while (v19);
            }

            char v11 = 1;
            id v14 = v68;
            __int128 v16 = v71;
            i = v72;
          }

          [v14 addObject:v16];
        }

        id v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v88,  v99,  16LL);
      }

      while (v70);

      id v8 = v64;
      __int128 v30 = v65;
      id v9 = v66;
      self = v73;
      if ((v11 & 1) == 0) {
        goto LABEL_30;
      }
      id v83 = 0LL;
      unsigned int v31 = [v66 requestUserInput:v68 delegate:v73 outResult:&v83];
      v32 = (NSMutableArray *)v83;
      v10 = v32;
      if (!v31 || (id v33 = -[NSMutableArray count](v32, "count"), v33 != [v68 count]))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler userCancelledError](v73, "userCancelledError"));

        id v42 = v68;
LABEL_45:

        if (v48)
        {
          os_log_t v49 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v50 = v49;
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v73, "profile"));
            v52 = (void *)objc_claimAutoreleasedReturnValue([v51 identifier]);
            *(_DWORD *)buf = 138543362;
            v93 = v52;
            _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Rolling back staging of profile “%{public}@”...",  buf,  0xCu);
          }

          __int128 v76 = 0u;
          __int128 v77 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          v53 = v67;
          id v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v74,  v96,  16LL);
          if (v54)
          {
            id v55 = v54;
            uint64_t v56 = *(void *)v75;
            do
            {
              for (k = 0LL; k != v55; k = (char *)k + 1)
              {
                if (*(void *)v75 != v56) {
                  objc_enumerationMutation(v53);
                }
                [*(id *)(*((void *)&v74 + 1) + 8 * (void)k) unstageFromInstallationWithInstaller:v8];
              }

              id v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v74,  v96,  16LL);
            }

            while (v55);
          }

          os_log_t v58 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v59 = v58;
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v73, "profile"));
            v61 = (void *)objc_claimAutoreleasedReturnValue([v60 identifier]);
            v62 = (void *)objc_claimAutoreleasedReturnValue([v48 MCVerboseDescription]);
            *(_DWORD *)buf = 138543618;
            v93 = v61;
            __int16 v94 = 2114;
            v95 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_ERROR,  "Installation of profile “%{public}@” failed with error: %{public}@",  buf,  0x16u);
          }

          if (v30) {
            *__int128 v30 = v48;
          }
        }

        goto LABEL_59;
      }

      if (-[NSMutableArray count](v73->_payloadHandlers, "count"))
      {
        uint64_t v34 = 0LL;
        unsigned int v35 = 1;
        do
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v73->_payloadHandlers, "objectAtIndex:", v34));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v10, "objectAtIndex:", v34));
          [v36 setUserInputResponses:v37];

          uint64_t v34 = v35;
        }

        while ((unint64_t)-[NSMutableArray count](v73->_payloadHandlers, "count") > v35++);
      }
    }

LABEL_30:
  }

  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v39 = self->_payloadHandlers;
  id v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v79,  v97,  16LL);
  if (!v40)
  {
    id v42 = 0LL;
LABEL_43:

    v48 = 0LL;
LABEL_44:
    __int128 v30 = v65;
    goto LABEL_45;
  }

  id v41 = v40;
  id v42 = 0LL;
  uint64_t v43 = *(void *)v80;
LABEL_33:
  v44 = 0LL;
  v45 = v42;
  while (1)
  {
    if (*(void *)v80 != v43) {
      objc_enumerationMutation(v39);
    }
    v46 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)v44);
    id v78 = v45;
    unsigned int v47 = [v46 stageForInstallationWithInstaller:v8 interactionClient:v9 outError:&v78];
    id v42 = v78;

    if (!v47) {
      break;
    }
    -[NSMutableArray insertObject:atIndex:](v67, "insertObject:atIndex:", v46, 0LL);
    v44 = (char *)v44 + 1;
    v45 = v42;
    if (v41 == v44)
    {
      id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v79,  v97,  16LL);
      if (v41) {
        goto LABEL_33;
      }
      goto LABEL_43;
    }
  }

  if (v42)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue( -[MCProfileHandler _profileInstallationErrorWithUnderlyingError:]( v73,  "_profileInstallationErrorWithUnderlyingError:",  v42));
    goto LABEL_44;
  }

  v48 = 0LL;
LABEL_59:

  return v48 == 0LL;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v60 = a5;
  v62 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_payloadHandlers, "count"));
  id v61 = -[NSMutableArray mutableCopy](self->_payloadHandlers, "mutableCopy");
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  UUIDToPersistentIDMap = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = v12;

  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  id v14 = self->_payloadHandlers;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
  id v59 = v11;
  if (v15)
  {
    id v16 = v15;
    os_log_t v58 = self;
    v57 = a6;
    id v17 = 0LL;
    uint64_t v18 = *(void *)v74;
LABEL_3:
    id v19 = 0LL;
    uint64_t v20 = v17;
    while (1)
    {
      if (*(void *)v74 != v18) {
        objc_enumerationMutation(v14);
      }
      os_log_t v21 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v19);
      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v78 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Installing payload handler: %{public}@",  buf,  0xCu);
      }

      id v72 = v20;
      unsigned int v23 = [v21 installWithInstaller:v10 options:v11 interactionClient:v60 outError:&v72];
      id v17 = v72;

      if (!v23) {
        break;
      }
      -[NSMutableArray insertObject:atIndex:](v62, "insertObject:atIndex:", v21, 0LL);
      [v61 removeObject:v21];
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___MCNewCertificatePayloadHandler);
      if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0)
      {
        unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v21 payload]);
        v26 = v58->_UUIDToPersistentIDMap;
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 certificatePersistentID]);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 UUID]);
        -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, v28);

        id v11 = v59;
      }

      id v19 = (char *)v19 + 1;
      uint64_t v20 = v17;
      if (v16 == v19)
      {
        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }

    a6 = v57;
    self = v58;
    if (v17)
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue( -[MCProfileHandler _profileInstallationErrorWithUnderlyingError:]( v58,  "_profileInstallationErrorWithUnderlyingError:",  v17));
      goto LABEL_20;
    }
  }

  else
  {
  }

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if ([v17 isLocked]
    && (__int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v17 removalPasscode]), v30, v30))
  {
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v17 removalPasscode]);
    uint64_t v32 = kMCProfileRemovalPasscodeService;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v17 UUID]);
    id v34 = [v17 isInstalledForSystem];
    id v71 = 0LL;
    uint64_t v35 = v32;
    id v11 = v59;
    +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:]( &OBJC_CLASS___MCKeychain,  "setString:forService:account:label:description:useSystemKeychain:outError:",  v31,  v35,  v33,  0LL,  0LL,  v34,  &v71);
    id v29 = v71;
  }

  else
  {
    id v29 = 0LL;
  }

- (void)unstageFromInstallationWithInstaller:(id)a3
{
  id v4 = a3;
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unstaging profile “%{public}@”...", buf, 0xCu);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = self->_payloadHandlers;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v13),  "unstageFromInstallationWithInstaller:",  v4,  (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v11);
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 setInstallDate:v9];

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v10 = self->_payloadHandlers;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v14),  "didInstallOldGlobalRestrictions:newGlobalRestrictions:",  v6,  v7,  (void)v15);
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    }

    while (v12);
  }
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v8 = self->_payloadHandlers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v12),  "didRemoveOldGlobalRestrictions:newGlobalRestrictions:",  v6,  v7,  (void)v13);
        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v10);
  }
}

- (BOOL)isInstalled
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v2 = self->_payloadHandlers;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    int v6 = 1;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v9 = objc_autoreleasePoolPush();
        v6 &= objc_msgSend(v8, "isInstalled", (void)v11);
        objc_autoreleasePoolPop(v9);
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v4);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  os_log_t v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    int v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Profile “%{public}@” being set aside.",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = self->_payloadHandlers;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v13);
        __int128 v15 = objc_autoreleasePoolPush();
        objc_msgSend(v14, "setAsideWithInstaller:", v4, (void)v16);
        objc_autoreleasePoolPop(v15);
        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v11);
  }

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    id v4 = v3;
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    int v11 = 138543362;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Profile “%{public}@” being unset aside.",  (uint8_t *)&v11,  0xCu);
  }

  int v7 = -[NSMutableArray count](self->_payloadHandlers, "count");
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1LL;
    do
    {
      id v9 = objc_autoreleasePoolPush();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", (v8 - 2)));
      [v10 unsetAside];

      objc_autoreleasePoolPop(v9);
      --v8;
    }

    while (v8 > 1);
  }

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    int v20 = 138543362;
    os_log_t v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Profile “%{public}@” being removed.",  (uint8_t *)&v20,  0xCu);
  }

  int v12 = -[NSMutableArray count](self->_payloadHandlers, "count");
  if (v12 >= 1)
  {
    unint64_t v13 = v12 + 1LL;
    do
    {
      __int128 v14 = objc_autoreleasePoolPush();
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndex:]( self->_payloadHandlers,  "objectAtIndex:",  (v13 - 2)));
      [v15 removeWithInstaller:v6 options:v7];

      objc_autoreleasePoolPop(v14);
      --v13;
    }

    while (v13 > 1);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if ([v16 isLocked])
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 removalPasscode]);

    if (v17)
    {
      uint64_t v18 = kMCProfileRemovalPasscodeService;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 UUID]);
      +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  v18,  v19,  0,  0,  [v16 isInstalledForSystem],  0);
    }
  }
}

- (void)convertPayloadWithUUIDToUnknownPayload:(id)a3
{
  id v16 = a3;
  if (-[NSMutableArray count](self->_payloadHandlers, "count"))
  {
    uint64_t v4 = 0LL;
    unsigned int v5 = 1;
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", v4));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
      os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUID]);
      unsigned int v9 = [v8 isEqualToString:v16];

      if (v9)
      {
        id v10 = objc_autoreleasePoolPush();
        int v11 = objc_alloc(&OBJC_CLASS___MCUnknownPayload);
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
        unint64_t v13 = -[MCUnknownPayload initWithContentsOfPayload:profile:]( v11,  "initWithContentsOfPayload:profile:",  v12,  self->_profile);

        -[MCProfile replacePayloadWithUUID:withPayload:]( self->_profile,  "replacePayloadWithUUID:withPayload:",  v16,  v13);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCUnknownPayload handlerWithProfileHandler:](v13, "handlerWithProfileHandler:", self));
        -[NSMutableArray setObject:atIndexedSubscript:]( self->_payloadHandlers,  "setObject:atIndexedSubscript:",  v14,  v4);

        [v6 remove];
        objc_autoreleasePoolPop(v10);
      }

      uint64_t v4 = v5;
    }

    while ((unint64_t)-[NSMutableArray count](self->_payloadHandlers, "count") > v5++);
  }
}

+ (id)payloadsOfClass:(Class)a3 installedBeforePayload:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile", 0));
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloads]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(id *)(*((void *)&v15 + 1) + 8 * v12);
      if (v13 == v5) {
        break;
      }
      if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v15 + 1) + 8 * v12), a3) & 1) != 0) {
        [v6 addObject:v13];
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

+ (id)payloadsOfClass:(Class)a3 removedBeforePayload:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloads]);
  int v9 = [v8 count];

  if (v9 >= 1)
  {
    uint64_t v10 = v9 + 1LL;
    while (1)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 payloads]);
      id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:(v10 - 2)]);

      if (v13 == v5) {
        break;
      }
      if ((objc_opt_isKindOfClass(v13, a3) & 1) != 0) {
        [v6 addObject:v13];
      }
    }
  }

+ (id)payloadsOfClass:(Class)a3 setAsideBeforePayload:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile", 0));
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloads]);

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(id *)(*((void *)&v15 + 1) + 8 * v12);
      if (v13 == v5) {
        break;
      }
      if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v15 + 1) + 8 * v12), a3) & 1) != 0) {
        [v6 addObject:v13];
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

+ (id)payloadsOfClass:(Class)a3 unsetAsideBeforePayload:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloads]);
  int v9 = [v8 count];

  if (v9 >= 1)
  {
    uint64_t v10 = v9 + 1LL;
    while (1)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 payloads]);
      id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:(v10 - 2)]);

      if (v13 == v5) {
        break;
      }
      if ((objc_opt_isKindOfClass(v13, a3) & 1) != 0) {
        [v6 addObject:v13];
      }
    }
  }

- (id)userInputArray
{
  return 0LL;
}

- (BOOL)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4 outError:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_payloadHandlers, "count") <= a4)
  {
    uint64_t v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Received preflight request with out-of-bounds payload index.",  v13,  2u);
    }

    unsigned __int8 v10 = 0;
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", a4));
    unsigned __int8 v10 = [v9 preflightUserInputResponses:v8 outError:a5];
  }

  return v10;
}

- (id)persistentIDForCertificateUUID:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_UUIDToPersistentIDMap,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  return -[MCProfileHandler preflightUserInputResponses:forPayloadIndex:outError:]( self,  "preflightUserInputResponses:forPayloadIndex:outError:",  a4,  a5,  a6);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (NSArray)payloadHandlers
{
  return &self->_payloadHandlers->super;
}

- (void).cxx_destruct
{
}

@end