@interface TCCDPolicyOverride
+ (BOOL)isMDMPolicyOverrideActive;
+ (id)logHandle;
+ (id)orderedOverridePolicies;
+ (id)queue;
+ (id)useString:(id)a3 orReadFromDefaults:(__CFString *)a4;
+ (unint64_t)evaluateOverridePolicyForAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6;
+ (void)loadPolicyData;
- (BOOL)isActive;
- (BOOL)validateEntry:(id)a3 identifierType:(id)a4 codeRequirementString:(id)a5 serviceName:(id)a6 allowed:(id)a7 comment:(id)a8;
- (NSDictionary)plistDictionary;
- (NSMutableDictionary)policyAccessByIdentifier;
- (NSString)plistFilePath;
- (OS_dispatch_source)watchedFileVnodeSource;
- (TCCDPolicyOverride)init;
- (__CFData)parseCodeRequirements:(id)a3;
- (id)allowedParser:(id)a3;
- (id)watchedPath;
- (unint64_t)_locked_evaluateAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6;
- (void)loadAndParse;
- (void)loadPlist;
- (void)parsePlist;
- (void)setPlistDictionary:(id)a3;
- (void)setPlistFilePath:(id)a3;
- (void)setPolicyAccessByIdentifier:(id)a3;
- (void)setWatchedFileVnodeSource:(id)a3;
- (void)watchPlistChanges;
@end

@implementation TCCDPolicyOverride

+ (id)logHandle
{
  if (qword_1000783C0 != -1) {
    dispatch_once(&qword_1000783C0, &stru_100065DC8);
  }
  return (id)qword_1000783C8;
}

+ (id)queue
{
  if (qword_1000783B0 != -1) {
    dispatch_once(&qword_1000783B0, &stru_100065D80);
  }
  return (id)qword_1000783A8;
}

+ (id)useString:(id)a3 orReadFromDefaults:(__CFString *)a4
{
  return a3;
}

+ (id)orderedOverridePolicies
{
  v2 = (void *)qword_1000783B8;
  qword_1000783B8 = (uint64_t)&__NSArray0__struct;

  return &__NSArray0__struct;
}

+ (BOOL)isMDMPolicyOverrideActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedOverridePolicies]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
  unsigned __int8 v4 = [v3 isActive];

  return v4;
}

+ (void)loadPolicyData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedOverridePolicies]);
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) loadAndParse];
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

+ (unint64_t)evaluateOverridePolicyForAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 1LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 orderedOverridePolicies]);
  if ([v13 count])
  {
    v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 queue]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100031660;
    v17[3] = &unk_100065DA8;
    id v18 = v13;
    id v19 = v11;
    v22 = &v24;
    id v20 = v10;
    id v21 = v12;
    v23 = a6;
    dispatch_sync(v14, v17);
  }

  unint64_t v15 = v25[3];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (TCCDPolicyOverride)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TCCDPolicyOverride;
  v2 = -[TCCDPolicyOverride init](&v6, "init");
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[TCCDPolicyOverride setPolicyAccessByIdentifier:](v2, "setPolicyAccessByIdentifier:", v3);

    id v4 = v2;
  }

  return v2;
}

- (BOOL)isActive
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
    if ([v4 count])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
      BOOL v6 = [v5 count] != 0;
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)loadPlist
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistFilePath](self, "plistFilePath"));
  if (v3)
  {
    if (qword_1000783C0 != -1) {
      dispatch_once(&qword_1000783C0, &stru_100065DC8);
    }
    id v4 = (os_log_s *)qword_1000783C8;
    if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Override: loading from: %{public}@", buf, 0xCu);
    }

    id v18 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v3,  0LL,  &v18));
    id v6 = v18;
    __int128 v7 = v6;
    if (v5)
    {
      id v17 = 0LL;
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v17));
      id v9 = v17;

      -[TCCDPolicyOverride setPlistDictionary:](self, "setPlistDictionary:", v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));

      if (!v10)
      {
        if (qword_1000783C0 != -1) {
          dispatch_once(&qword_1000783C0, &stru_100065DC8);
        }
        id v11 = (os_log_s *)qword_1000783C8;
        if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
          sub_100032E4C((uint64_t)v3, (uint64_t)v9, v11);
        }
      }

      __int128 v7 = v9;
      goto LABEL_31;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v13 isEqualToString:NSCocoaErrorDomain])
    {
      if ([v7 code] == (id)4)
      {

LABEL_26:
        if (qword_1000783C0 != -1) {
          dispatch_once(&qword_1000783C0, &stru_100065DC8);
        }
        v16 = (os_log_s *)qword_1000783C8;
        if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v20 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Override: no file at: %{public}@",  buf,  0xCu);
        }

- (void)loadAndParse
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[TCCDPolicyOverride queue](&OBJC_CLASS___TCCDPolicyOverride, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031D08;
  block[3] = &unk_100064D50;
  block[4] = self;
  dispatch_barrier_async(v3, block);
}

- (__CFData)parseCodeRequirements:(id)a3
{
  return 0LL;
}

- (id)allowedParser:(id)a3
{
  return a3;
}

- (BOOL)validateEntry:(id)a3 identifierType:(id)a4 codeRequirementString:(id)a5 serviceName:(id)a6 allowed:(id)a7 comment:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v15 || !v13 || !v14 || !v17)
  {
    if (qword_1000783C0 != -1) {
      dispatch_once(&qword_1000783C0, &stru_100065DC8);
    }
    uint64_t v20 = qword_1000783C8;
    if (!os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v26 = 138544386;
    id v27 = v16;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    __int16 v32 = 2114;
    id v33 = v15;
    __int16 v34 = 2114;
    id v35 = v18;
    v23 = "Override: missing configuration info for Service: %{public}@: Identifier: %{public}@, type: %{public}@, code r"
          "equirement: %{public}@, comment: %{public}@";
    uint64_t v24 = (os_log_s *)v20;
    uint32_t v25 = 52;
    goto LABEL_18;
  }

  if (([v14 isEqualToString:@"bundleID"] & 1) == 0
    && ([v14 isEqualToString:@"path"] & 1) == 0)
  {
    if (qword_1000783C0 != -1) {
      dispatch_once(&qword_1000783C0, &stru_100065DC8);
    }
    uint64_t v22 = qword_1000783C8;
    if (!os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v26 = 138543874;
    id v27 = v16;
    __int16 v28 = 2114;
    id v29 = v13;
    __int16 v30 = 2114;
    id v31 = v14;
    v23 = "Override: invalid identifier type for Service %{public}@, Identifier: %{public}@, type: %{public}@";
    uint64_t v24 = (os_log_s *)v22;
    uint32_t v25 = 32;
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v26, v25);
LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }

  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (void)parsePlist
{
  if (qword_1000783C0 != -1) {
    dispatch_once(&qword_1000783C0, &stru_100065DC8);
  }
  uint64_t v5 = (os_log_s *)(id)qword_1000783C8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
    if (v6)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Services"]);
      uint64_t v7 = (uint64_t)[v3 count];
    }

    else
    {
      uint64_t v7 = -1LL;
    }

    *(_DWORD *)buf = 138412546;
    v68 = self;
    __int16 v69 = 2048;
    v70 = (TCCDPolicyOverride *)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Override: parsing plist for %@ with %ld entries.",  buf,  0x16u);
    if (v6)
    {
    }
  }

  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride policyAccessByIdentifier](self, "policyAccessByIdentifier"));
    [v9 removeAllObjects];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride plistDictionary](self, "plistDictionary"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"Services"]);

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obj = v11;
    id v41 = [obj countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (!v41) {
      goto LABEL_62;
    }
    uint64_t v40 = *(void *)v64;
    *(void *)&__int128 v12 = 138544386LL;
    __int128 v39 = v12;
    v53 = self;
    while (1)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v64 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v13;
        id v14 = *(TCCDPolicyOverride **)(*((void *)&v63 + 1) + 8 * v13);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"kTCCService", "stringByAppendingString:", v14, v39));
        unsigned int v50 = [v51 isEqualToString:@"kTCCServiceAppleEvents"];
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        v58 = v14;
        id v52 = (id)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v14]);
        id v57 = [v52 countByEnumeratingWithState:&v59 objects:v77 count:16];
        if (v57)
        {
          uint64_t v56 = *(void *)v60;
          do
          {
            id v15 = 0LL;
            do
            {
              if (*(void *)v60 != v56) {
                objc_enumerationMutation(v52);
              }
              id v16 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)v15);
              id v17 = (TCCDPolicyOverride *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Identifier"]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"IdentifierType"]);
              BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"CodeRequirement"]);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Comment"]);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Allowed"]);
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride allowedParser:](self, "allowedParser:", v21));

              v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"StaticCode"]);
              if (!-[TCCDPolicyOverride validateEntry:identifierType:codeRequirementString:serviceName:allowed:comment:]( self,  "validateEntry:identifierType:codeRequirementString:serviceName:allowed:comment:",  v17,  v18,  v19,  v58,  v22,  v20)) {
                goto LABEL_41;
              }
              v55 = -[TCCDPolicyOverride parseCodeRequirements:](self, "parseCodeRequirements:", v19);
              if (!v55)
              {
                if (qword_1000783C0 != -1) {
                  dispatch_once(&qword_1000783C0, &stru_100065DC8);
                }
                __int16 v34 = (os_log_s *)qword_1000783C8;
                if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138544130;
                  v68 = v58;
                  __int16 v69 = 2114;
                  v70 = v17;
                  __int16 v71 = 2114;
                  id v72 = v18;
                  __int16 v73 = 2114;
                  v74 = v19;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Override: invalid code requirements for Service %{public}@, Identifier: %{public}@, type: %{public}@ , requirement: %{public}@",  buf,  0x2Au);
                }

- (unint64_t)_locked_evaluateAccessByIdentity:(id)a3 toService:(id)a4 withIndirectObjectIdentityIdentity:(id)a5 authorizationReason:(unint64_t *)a6
{
  return 1LL;
}

- (id)watchedPath
{
  return 0LL;
}

- (void)watchPlistChanges
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride watchedFileVnodeSource](self, "watchedFileVnodeSource"));

  if (v3)
  {
    id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride watchedFileVnodeSource](self, "watchedFileVnodeSource"));
    dispatch_source_cancel(v4);

    -[TCCDPolicyOverride setWatchedFileVnodeSource:](self, "setWatchedFileVnodeSource:", 0LL);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDPolicyOverride watchedPath](self, "watchedPath"));
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    unsigned int v8 = open((const char *)[v7 UTF8String], 0x8000);
    if ((v8 & 0x80000000) != 0)
    {
      if (qword_1000783C0 != -1) {
        dispatch_once(&qword_1000783C0, &stru_100065DC8);
      }
      id v17 = (void *)qword_1000783C8;
      if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_ERROR)) {
        sub_100032F30((uint64_t)v7, v17);
      }
    }

    else
    {
      uintptr_t v9 = v8;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v9, 0x4FuLL, v11);
      -[TCCDPolicyOverride setWatchedFileVnodeSource:](self, "setWatchedFileVnodeSource:", v12);

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100032BB8;
      handler[3] = &unk_100065960;
      uint64_t v13 = (dispatch_source_s *)(id)objc_claimAutoreleasedReturnValue( -[TCCDPolicyOverride watchedFileVnodeSource]( self,  "watchedFileVnodeSource"));
      id v21 = v13;
      id v14 = v7;
      id v22 = v14;
      v23 = self;
      dispatch_source_set_event_handler(v13, handler);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100032CBC;
      v18[3] = &unk_100064D50;
      id v15 = v13;
      BOOL v19 = v15;
      dispatch_source_set_cancel_handler(v15, v18);
      dispatch_resume(v15);
      if (qword_1000783C0 != -1) {
        dispatch_once(&qword_1000783C0, &stru_100065DC8);
      }
      id v16 = (os_log_s *)qword_1000783C8;
      if (os_log_type_enabled((os_log_t)qword_1000783C8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Override: watchPlistChanges: watching: %{public}@",  buf,  0xCu);
      }
    }
  }
}

- (NSString)plistFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPlistFilePath:(id)a3
{
}

- (NSDictionary)plistDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPlistDictionary:(id)a3
{
}

- (NSMutableDictionary)policyAccessByIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPolicyAccessByIdentifier:(id)a3
{
}

- (OS_dispatch_source)watchedFileVnodeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setWatchedFileVnodeSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end