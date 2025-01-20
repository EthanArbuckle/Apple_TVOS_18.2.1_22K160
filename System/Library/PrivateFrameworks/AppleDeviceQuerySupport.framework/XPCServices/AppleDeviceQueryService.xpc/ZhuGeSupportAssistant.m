@interface ZhuGeSupportAssistant
+ (BOOL)isInternalAssistant;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)isKey:(id)a3 withError:(id *)a4;
+ (id)serviceXpcName;
+ (void)getDylibHandlerWithError:(id *)a3;
@end

@implementation ZhuGeSupportAssistant

+ (BOOL)isInternalAssistant
{
  return 0;
}

+ (id)classList
{
  return &off_100017620;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_AppleDeviceQueryArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.AppleDeviceQueryService";
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0LL;
    if (qword_10001A240 != -1) {
      dispatch_once(&qword_10001A240, &stru_100014680);
    }
    *a3 = (id) qword_10001A248;
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getDylibHandlerWithError:]",  60LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v8);
  }

  return (void *)qword_10001A250;
}

+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]",  95LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v31);
LABEL_10:
    id v19 = 0LL;
    id v15 = 0LL;
    goto LABEL_15;
  }

  *a4 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 classList]);
  unsigned __int8 v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]",  101LL,  @"Unknown class name!",  v12,  v13,  v14,  v31);
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  38LL,  0LL));
    id v19 = 0LL;
LABEL_12:
    id v15 = 0LL;
LABEL_14:
    *a4 = v29;
    goto LABEL_15;
  }

  id v32 = 0LL;
  id v15 = [a1 getDylibHandlerWithError:&v32];
  id v19 = v32;
  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]",  109LL,  @"Failed to get ZhuGe armory handler!",  v16,  v17,  v18,  v31);
    id v29 = v19;
    id v19 = v29;
    goto LABEL_14;
  }

  id v20 = v6;
  v21 = dlsym(v15, (const char *)[v20 UTF8String]);
  if (!v21)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]",  116LL,  @"Failed to find class symbol for %@!",  v22,  v23,  v24,  (uint64_t)v20);
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  13LL,  0LL));
    goto LABEL_12;
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue([v21 sharedInstance]);
  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getSharedInstanceByName:withError:]",  123LL,  @"Failed to have shared instance for %@!",  v25,  v26,  v27,  (uint64_t)v20);
    uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  38LL,  0LL));

    id v19 = (id)v28;
  }

+ (id)isKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant isKey:withError:]",  146LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v24);
LABEL_9:
    id v17 = 0LL;
    id v15 = 0LL;
    unsigned __int8 v11 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_11;
  }

  *a4 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 armoryClassName]);
  id v26 = 0LL;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([a1 getSharedInstanceByName:v10 withError:&v26]);
  id v12 = v26;

  if (v11)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 helper]);
    id v25 = v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 getConfigOfKey:v6 withError:&v25]);
    id v15 = v25;

    uint64_t v16 = &__kCFBooleanTrue;
    if (!v14) {
      uint64_t v16 = &__kCFBooleanFalse;
    }
    id v17 = v16;
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1 armoryClassName]);
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant isKey:withError:]",  154LL,  @"Failed to get a shared instance for %@!",  v19,  v20,  v21,  (uint64_t)v18);

    id v15 = v12;
    id v17 = 0LL;
    unsigned __int8 v11 = 0LL;
    uint64_t v14 = 0LL;
    *a4 = v15;
  }

+ (id)getXpcProxyWithError:(id *)a3
{
  if (![a1 isInternalAssistant] || (isZhuGeInRestoreOS() & 1) == 0)
  {
    if (a3)
    {
      *a3 = 0LL;
      if (qword_10001A258 != -1) {
        dispatch_once(&qword_10001A258, &stru_1000146A0);
      }
      pthread_mutex_lock(&stru_10001A260);
      if (!qword_10001A2A0)
      {
        id v15 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceXpcName]);
        unsigned __int8 v11 = -[NSXPCConnection initWithServiceName:](v15, "initWithServiceName:", v16);

        if (v11)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ZhuGeServiceProtocol));
          -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v17);

          uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
          uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString);
          uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSNull);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSSet);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
          uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSData);
          uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDate);
          uint64_t v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v43,  v42,  v41,  v18,  v19,  v20,  v21,  v22,  v23,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(v24);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
          [v25 setClasses:v12 forSelector:"setBulkKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
          [v26 setClasses:v12 forSelector:"setBulkInternalKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
          [v27 setClasses:v12 forSelector:"setBulkMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v11, "remoteObjectInterface"));
          [v28 setClasses:v12 forSelector:"setBulkInternalMGKeys:getValuesAndError:" argumentIndex:0 ofReply:1];

          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_1000098A8;
          v45[3] = &unk_100014400;
          v45[4] = a1;
          -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v45);
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_10000992C;
          v44[3] = &unk_100014400;
          v44[4] = a1;
          -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v44);
          -[NSXPCConnection activate](v11, "activate");
          uint64_t v29 = objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v11,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1000146C0));
          v30 = (void *)qword_10001A2A0;
          qword_10001A2A0 = v29;

          if (qword_10001A2A0) {
            goto LABEL_11;
          }
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceXpcName]);
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]",  257LL,  @"Failed to get proxy for %@!",  v32,  v33,  v34,  (uint64_t)v31);

          id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  66LL,  0LL));
        }

        else
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([a1 serviceXpcName]);
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]",  200LL,  @"Failed to connect %@!",  v37,  v38,  v39,  (uint64_t)v36);

          id v35 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  67LL,  0LL));
          unsigned __int8 v11 = 0LL;
          id v12 = 0LL;
        }

        *a3 = v35;
        goto LABEL_11;
      }

      uint64_t v8 = @"XPC proxy is already available";
      int v9 = 524544;
      uint64_t v10 = 193LL;
    }

    else
    {
      uint64_t v8 = @"error p-pointer is nil!";
      int v9 = 1040;
      uint64_t v10 = 181LL;
    }

    ZhuGeLog( v9,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[ZhuGeSupportAssistant getXpcProxyWithError:]",  v10,  v8,  v5,  v6,  v7,  v40);
  }

  unsigned __int8 v11 = 0LL;
  id v12 = 0LL;
LABEL_11:
  pthread_mutex_unlock(&stru_10001A260);
  id v13 = (id)qword_10001A2A0;

  return v13;
}

@end