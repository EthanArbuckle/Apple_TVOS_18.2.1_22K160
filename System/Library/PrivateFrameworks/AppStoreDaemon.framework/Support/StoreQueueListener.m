@interface StoreQueueListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (StoreQueueListener)init;
- (void)checkQueueWithOptions:(id)a3 completionBlock:(id)a4;
- (void)claimApplicationsWithOptions:(id)a3 completionBlock:(id)a4;
- (void)managedApplicationRequestWithOptions:(id)a3 completionBlock:(id)a4;
@end

@implementation StoreQueueListener

- (StoreQueueListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreQueueListener;
  return -[StoreQueueListener init](&v3, "init");
}

- (void)checkQueueWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ASDLogHandleForCategory(9LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    id v13 = sub_10018ECAC((uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v23 = 138543618;
    v24 = v11;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: checkQueueWithOptionsclient: %{public}@",  (uint8_t *)&v23,  0x16u);
  }

  id v15 = sub_1002C5858((uint64_t)&OBJC_CLASS___StoreQueueManager);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ([v6 reason] == (id)1)
  {
    id v17 = sub_10018ECAC((uint64_t)self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = (uint64_t)v16;
    uint64_t v20 = 0LL;
LABEL_7:
    sub_1002C58F4(v19, v20, (uint64_t)v18, v7);
    goto LABEL_8;
  }

  if ([v6 reason] == (id)2)
  {
    id v21 = sub_10018ECAC((uint64_t)self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v19 = (uint64_t)v16;
    uint64_t v20 = 1LL;
    goto LABEL_7;
  }

  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v22 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 951LL, @"Invalid or missing reason", 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
  (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v18);
LABEL_8:

LABEL_9:
}

- (void)claimApplicationsWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = ASDLogHandleForCategory(9LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class(self, v10);
    id v12 = v11;
    id v13 = sub_10018ECAC((uint64_t)self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v19 = 138543618;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@]: claimApplicationsWithOptions client: %{public}@",  (uint8_t *)&v19,  0x16u);
  }

  id v15 = sub_1002C5858((uint64_t)&OBJC_CLASS___StoreQueueManager);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = sub_10018ECAC((uint64_t)self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  sub_1002C5968((uint64_t)v16, (uint64_t)v7, v18);
}

- (void)managedApplicationRequestWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v9 = sub_1001F4BE8((uint64_t)&OBJC_CLASS___AMSProcessInfo, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
  uint64_t v12 = qos_class_self();
  uint64_t v13 = ASDLogHandleForCategory(41LL);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_opt_class(self, v15);
    id v17 = v16;
    v18 = sub_10027010C(v12);
    int v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v22 = 138544130;
    int v23 = v16;
    __int16 v24 = 2114;
    __int16 v25 = v11;
    __int16 v26 = 2114;
    v27 = v19;
    __int16 v28 = 1024;
    int v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "[%{public}@] ASDManagedApplicationRequest start with clientID: %{public}@ qoS: %{public}@ (0x%x)",  (uint8_t *)&v22,  0x26u);
  }

  id v20 = sub_1002C5858((uint64_t)&OBJC_CLASS___StoreQueueManager);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  sub_1002C5A1C((uint64_t)v21, v7, v11, v12, v6);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  if (sub_1001D2660((uint64_t)self, v5, @"com.apple.appstored.private")
    || sub_1001D2660((uint64_t)self, v5, @"com.apple.appstored.install-apps")
    || sub_1001D2924((uint64_t)self, v5, @"Queue"))
  {
    goto LABEL_7;
  }

  uint64_t v7 = ASDLogHandleForCategory(9LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class(self, v9);
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    id v24 = *(id *)&buf[4];
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Treating %i as legacy client",  buf,  0x12u);
  }

  if (sub_1001D2660((uint64_t)self, v5, @"com.apple.itunesstored.private"))
  {
LABEL_7:
    id v10 = v5;
    v11 = v10;
    if (self)
    {
      unsigned int v12 = [v10 processIdentifier];
      uint64_t v13 = ASDLogHandleForCategory(9LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_opt_class(self, v15);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        id v17 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "[%{public}@]: Got connection from pid: %i",  buf,  0x12u);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASDStoreQueueProtocol));
      [v11 setExportedInterface:v18];
      [v11 setExportedObject:self];
      objc_initWeak(&location, self);
      objc_initWeak(&from, v11);
      v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472LL;
      int v29 = sub_10018F3E4;
      v30 = &unk_1003E9E60;
      objc_copyWeak(&v31, &location);
      unsigned int v32 = v12;
      [v11 setInterruptionHandler:&v27];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10018F4C8;
      v36 = &unk_1003E9E88;
      objc_copyWeak(&v37, &location);
      objc_copyWeak(&v38, &from);
      unsigned int v39 = v12;
      objc_msgSend(v11, "setInvalidationHandler:", buf, v27, v28, v29, v30);
      [v11 resume];
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

    BOOL v19 = 1;
  }

  else
  {
    uint64_t v21 = ASDLogHandleForCategory(9LL);
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = (void *)objc_opt_class(self, v23);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      id v26 = v25;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "[%{public}@]: Connection denied for pid: %i for non entitled client",  buf,  0x12u);
    }

    BOOL v19 = 0;
  }

  return v19;
}

@end