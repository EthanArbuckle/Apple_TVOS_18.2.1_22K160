@interface OctaneListener
+ (void)start;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation OctaneListener

+ (void)start
{
  if (qword_10032EEB0 != -1) {
    dispatch_once(&qword_10032EEB0, &stru_1002E9E50);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v29 = a3;
  id v5 = a4;
  unsigned int v32 = [v5 processIdentifier];
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sk_clientID"));
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      v9 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v6, "mutableCopy");

      v6 = v9;
    }
  }

  if (!v6) {
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v33,  @"octaneClientUUID");
  [v5 setUserInfo:v6];
  if (qword_10032EF00 != -1) {
    dispatch_once(&qword_10032EF00, &stru_1002E9EC0);
  }
  v11 = (void *)qword_10032EEF0;
  if (os_log_type_enabled((os_log_t)qword_10032EEF0, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543874;
    uint64_t v43 = objc_opt_class(self);
    __int16 v44 = 1024;
    unsigned int v45 = v32;
    __int16 v46 = 2114;
    v47 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[%{public}@]: Got connection from pid: %i (%{public}@)",  buf,  0x1Cu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StoreKitTestingServiceProtocol));
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSError);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
  v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v15,  v16,  v17,  objc_opt_class(&OBJC_CLASS___NSArray),  0LL);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v13 setClasses:v19 forSelector:"sendTestPingbackForBundleID:completion:" argumentIndex:0 ofReply:1];

  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
  v23 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v20,  v21,  v22,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v13 setClasses:v24 forSelector:"showMessage:forBundleID:" argumentIndex:0 ofReply:0];

  [v5 setExportedInterface:v13];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[StoreKitTestingService defaultService](&OBJC_CLASS___StoreKitTestingService, "defaultService"));
  [v5 setExportedObject:v25];

  objc_initWeak((id *)buf, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000727D0;
  v39[3] = &unk_1002E9E78;
  objc_copyWeak(&v40, (id *)buf);
  unsigned int v41 = v32;
  [v5 setInterruptionHandler:v39];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100072858;
  v34[3] = &unk_1002E9EA0;
  objc_copyWeak(&v37, (id *)buf);
  unsigned int v38 = v32;
  id v26 = v33;
  id v35 = v26;
  id v27 = v30;
  id v36 = v27;
  [v5 setInvalidationHandler:v34];
  [v5 resume];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

  return 1;
}

@end