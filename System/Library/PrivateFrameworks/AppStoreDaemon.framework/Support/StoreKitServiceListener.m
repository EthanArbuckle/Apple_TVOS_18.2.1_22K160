@interface StoreKitServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (StoreKitServiceListener)init;
@end

@implementation StoreKitServiceListener

- (StoreKitServiceListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreKitServiceListener;
  return -[StoreKitServiceListener init](&v3, "init");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 processIdentifier];
  if (proc_name(v8, buffer, 0x20u) < 1) {
    v9 = 0LL;
  }
  else {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
  }
  pid_t v10 = getpid();
  if (v8 == v10)
  {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"SKServiceDelegateLocalConnection",  @"%@ received a connection from itself",  self);
  }

  else
  {
    uint64_t v11 = ASDLogHandleForCategory(36LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = objc_opt_class(self, v13);
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2114;
      v25 = (uint64_t (*)(uint64_t, uint64_t))v7;
      id v14 = *(id *)&buf[4];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Accepting new connection (%{public}@) %{public}@",  buf,  0x20u);
    }

    objc_opt_self(&OBJC_CLASS___StoreKitServiceListener);
    objc_msgSend( v7,  "setExportedInterface:",  +[NSXPCInterface interfaceWithProtocol:]( NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StoreKitServiceConnection));
    v15 = objc_alloc_init(&OBJC_CLASS___StoreKitServiceConnection);
    [v7 setExportedObject:v15];

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v25 = sub_1002F1238;
    v26 = sub_1002F1248;
    id v16 = v7;
    id v27 = v16;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1002F1250;
    v21[3] = &unk_1003E97A8;
    v21[4] = self;
    id v17 = v9;
    id v22 = v17;
    v23 = buf;
    [v16 setInvalidationHandler:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1002F1334;
    v19[3] = &unk_1003E9DC0;
    v19[4] = self;
    id v20 = v17;
    [v16 setInterruptionHandler:v19];
    [v16 resume];

    _Block_object_dispose(buf, 8);
  }

  return v8 != v10;
}

@end