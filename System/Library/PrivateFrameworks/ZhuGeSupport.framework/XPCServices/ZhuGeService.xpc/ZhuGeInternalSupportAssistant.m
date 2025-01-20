@interface ZhuGeInternalSupportAssistant
+ (BOOL)isInternalAssistant;
+ (NSMutableArray)cacheList;
+ (_opaque_pthread_mutex_t)recursiveMutex;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getInternalSupportPath;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)serviceXpcName;
+ (id)xpcProxy;
+ (void)dylibHandler;
+ (void)executeCacheRefresh;
+ (void)getDylibHandlerWithError:(id *)a3;
+ (void)registerCacheRefresh:(id)a3;
+ (void)setCacheList:(id)a3;
+ (void)setDylibHandler:(void *)a3;
+ (void)setXpcProxy:(id)a3;
@end

@implementation ZhuGeInternalSupportAssistant

+ (_opaque_pthread_mutex_t)recursiveMutex
{
  if (qword_10001A048 != -1) {
    dispatch_once(&qword_10001A048, &stru_1000143E0);
  }
  return (_opaque_pthread_mutex_t *)&unk_10001A050;
}

+ (void)setDylibHandler:(void *)a3
{
  qword_10001A090 = (uint64_t)a3;
}

+ (void)dylibHandler
{
  return (void *)qword_10001A090;
}

+ (void)setXpcProxy:(id)a3
{
}

+ (id)xpcProxy
{
  return (id)qword_10001A098;
}

+ (void)setCacheList:(id)a3
{
}

+ (NSMutableArray)cacheList
{
  return (NSMutableArray *)(id)qword_10001A0A0;
}

+ (BOOL)isInternalAssistant
{
  return 1;
}

+ (id)classList
{
  return &off_100017608;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_ZhuGeInternalArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.ZhuGeInternalService";
}

+ (void)executeCacheRefresh
{
  if ([a1 dylibHandler])
  {
    dlclose([a1 dylibHandler]);
    [a1 setDylibHandler:0];
  }

  [a1 setXpcProxy:0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheList", 0));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) clearCache];
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getInternalSupportPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v44 = 0;
  if (isZhuGeInRestoreOS())
  {
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getInternalSupportPath]",  135LL,  @"Skip retrieving internal support path in restoreOS",  v4,  v5,  v6,  v38);
    id v7 = 0LL;
    __int128 v8 = 0LL;
LABEL_27:
    id v34 = 0LL;
    goto LABEL_28;
  }

  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    __int128 v8 = (__CFString *)(id)qword_10001A0A8;
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getInternalSupportPath]",  142LL,  @"Retrieving unchanged internal supported path: %@",  v30,  v31,  v32,  (uint64_t)v8);
    id v7 = 0LL;
    goto LABEL_27;
  }

  __int128 v8 = @"/usr/local/ZhuGe/ZhuGeInternalSupport";
  if ([v3 fileExistsAtPath:@"/usr/local/ZhuGe/ZhuGeInternalSupport" isDirectory:&v44]) {
    BOOL v17 = v44 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    id v43 = 0LL;
    ZhuGeFDIPathsWithError = getZhuGeFDIPathsWithError(&v43, v10, v11, v12, v13, v14, v15, v16);
    id v34 = (id)objc_claimAutoreleasedReturnValue(ZhuGeFDIPathsWithError);
    id v7 = v43;
    if (v34)
    {
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v34 = v34;
      id v22 = [v34 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v40;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(v34);
            }
            v26 = v8;
            __int128 v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)i),  v8,  (void)v39));
            else {
              BOOL v27 = 1;
            }
            if (!v27)
            {

              goto LABEL_29;
            }

            __int128 v8 = v26;
          }

          id v23 = [v34 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }

        while (v23);
      }

      v28 = @"Didn't find ZhuGe internal Support Path";
      uint64_t v29 = 167LL;
    }

    else
    {
      v28 = @"Failed to get FDI paths";
      uint64_t v29 = 155LL;
    }

    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getInternalSupportPath]",  v29,  v28,  v19,  v20,  v21,  v38);
    __int128 v8 = 0LL;
  }

  else
  {
    id v7 = 0LL;
    id v34 = 0LL;
LABEL_29:
    objc_storeStrong((id *)&qword_10001A0A8, v8);
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getInternalSupportPath]",  174LL,  @"ZhuGe internal support path is updated to: %@",  v35,  v36,  v37,  (uint64_t)v8);
    [a1 executeCacheRefresh];
  }

+ (void)getDylibHandlerWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0LL;
    __int128 v8 = 0LL;
    id v9 = 0LL;
    if (![a1 dylibHandler])
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([a1 getInternalSupportPath]);
      __int128 v8 = (void *)v10;
      if (!v10)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]",  207LL,  @"Failed to get ZhuGe internal support path for dylib handler!",  v11,  v12,  v13,  v22);
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  43LL,  0LL));
        id v9 = 0LL;
        goto LABEL_10;
      }

      v23[0] = v10;
      v23[1] = @"libZhuGeInternalArmory.dylib";
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 2LL));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v14));

      if ([a1 dylibHandler])
      {
        dlclose([a1 dylibHandler]);
        [a1 setDylibHandler:0];
      }

      id v9 = v15;
      objc_msgSend(a1, "setDylibHandler:", dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1));
      if (![a1 dylibHandler])
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]",  218LL,  @"Failed to dlopen ZhuGe internal armory dylib!",  v16,  v17,  v18,  v22);
        id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  13LL,  0LL));
LABEL_10:
        *a3 = v19;
      }
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getDylibHandlerWithError:]",  194LL,  @"error p-pointer is nil!",  v5,  v6,  v7,  v22);
    __int128 v8 = 0LL;
    id v9 = 0LL;
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  id v20 = [a1 dylibHandler];

  return v20;
}

+ (void)registerCacheRefresh:(id)a3
{
  id v9 = a3;
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ((isZhuGeInRestoreOS() & 1) == 0)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 cacheList]);

    if (!v4)
    {
      uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [a1 setCacheList:v5];
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 cacheList]);
    unsigned __int8 v7 = [v6 containsObject:v9];

    if ((v7 & 1) == 0)
    {
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 cacheList]);
      [v8 addObject:v9];
    }
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getXpcProxyWithError:(id *)a3
{
  if ((isZhuGeInRestoreOS() & 1) != 0) {
    goto LABEL_9;
  }
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]",  273LL,  @"error p-pointer is nil!",  v5,  v6,  v7,  v39);
LABEL_9:
    id v9 = 0LL;
    id v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_10;
  }

  *a3 = 0LL;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([a1 xpcProxy]);

  id v9 = 0LL;
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  if (v8) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_claimAutoreleasedReturnValue([a1 getInternalSupportPath]);
  id v9 = (void *)v13;
  if (!v13)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]",  286LL,  @"Failed to get ZhuGe internal support path for xpc proxy!",  v14,  v15,  v16,  v39);
    id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  43LL,  0LL));
    id v10 = 0LL;
    uint64_t v11 = 0LL;
LABEL_13:
    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  v47[0] = v13;
  v47[1] = @"ZhuGeInternalService.xpc";
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v17));

  id v10 = v18;
  xpc_add_bundle([v10 UTF8String], 2);
  uint64_t v11 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.ZhuGeInternalService");
  if (!v11)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]",  297LL,  @"Failed to connect %@!",  v19,  v20,  v21,  (uint64_t)@"com.apple.ZhuGeInternalService");
    id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  67LL,  0LL));
    goto LABEL_13;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ZhuGeInternalServiceProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v22);

  uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSSet);
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDate);
  v28 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v43,  v42,  v41,  v40,  v23,  v24,  v25,  v26,  v27,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
  [v29 setClasses:v12 forSelector:"setBulkKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
  [v30 setClasses:v12 forSelector:"setBulkMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100006058;
  v46[3] = &unk_100014400;
  v46[4] = a1;
  -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v46);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000060CC;
  v45[3] = &unk_100014400;
  v45[4] = a1;
  -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v45);
  -[NSXPCConnection activate](v11, "activate");
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100006140;
  v44[3] = &unk_100014420;
  v44[4] = a1;
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v11,  "synchronousRemoteObjectProxyWithErrorHandler:",  v44));
  [a1 setXpcProxy:v31];

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([a1 xpcProxy]);
  if (!v32)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]",  339LL,  @"Failed to get proxy for %@!",  v33,  v34,  v35,  (uint64_t)@"com.apple.ZhuGeInternalService");
    id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  66LL,  0LL));
LABEL_14:
    *a3 = v36;
  }

@end