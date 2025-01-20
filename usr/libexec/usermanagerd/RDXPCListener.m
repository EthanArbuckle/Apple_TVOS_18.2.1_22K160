@interface RDXPCListener
+ (id)sharedListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)xpcListener;
- (void)setXpcListener:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation RDXPCListener

+ (id)sharedListener
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100082C90;
  block[3] = &unk_1000CCDB8;
  block[4] = a1;
  if (qword_1000DBC18 != -1) {
    dispatch_once(&qword_1000DBC18, block);
  }
  return (id)qword_1000DBC10;
}

- (void)startListening
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDXPCListener xpcListener](self, "xpcListener"));
  [v2 resume];
}

- (void)stopListening
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RDXPCListener xpcListener](self, "xpcListener"));
  [v2 suspend];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _xpcConnection]);
  __xpc_connection_set_logging(v5, 0LL);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient clientWithXPCConnection:](&OBJC_CLASS___RDClient, "clientWithXPCConnection:", v4));
  if ([v6 hasEntitlement:@"com.apple.mobile.keybagd.bubbled.sync"])
  {
    if (qword_1000DBC38 != -1) {
      dispatch_once(&qword_1000DBC38, &stru_1000CDBC8);
    }
    v7 = (os_log_s *)(id)qword_1000DBC30;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = 0LL;
      unsigned int v8 = sub_100053B4C(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v8 & 0xFFFFFFFE;
      }
      if ((_DWORD)v9)
      {
        __int16 v37 = 0;
        v10 = (const char *)_os_log_send_and_compose_impl( v9,  &v38,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "BUBBLED Client ARRIVED",  &v37,  2);
        v11 = (char *)v10;
        if (v10) {
          sub_100053B7C(v10);
        }
      }

      else
      {
        v11 = 0LL;
      }

      free(v11);
    }

    if (qword_1000DBC38 != -1) {
      dispatch_once(&qword_1000DBC38, &stru_1000CDBC8);
    }
    v19 = (os_log_s *)(id)qword_1000DBC30;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = 0LL;
      unsigned int v20 = sub_100053B4C(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v20 & 0xFFFFFFFE;
      }
      if ((_DWORD)v21)
      {
        __int16 v37 = 0;
        LODWORD(v30) = 2;
        v22 = (const char *)_os_log_send_and_compose_impl( v21,  &v38,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "BUBBLE Client XPC CONN SETUP",  &v37,  v30);
        v23 = (char *)v22;
        if (v22) {
          sub_100053B7C(v22);
        }
      }

      else
      {
        v23 = 0LL;
      }

      free(v23);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](&OBJC_CLASS___RDServer, "sharedServer"));
    [v24 addBubbleClient:v6];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedBubbleXPCInterface](&OBJC_CLASS___RDClient, "sharedBubbleXPCInterface"));
    [v4 setRemoteObjectInterface:v25];

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedBubbleXPCInterface](&OBJC_CLASS___RDServer, "sharedBubbleXPCInterface"));
    [v4 setExportedInterface:v26];

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](&OBJC_CLASS___RDServer, "sharedServer"));
    [v4 setExportedObject:v27];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100083254;
    v32[3] = &unk_1000CCF28;
    v16 = &v33;
    id v33 = v6;
    [v4 setInvalidationHandler:v32];
    v31 = _NSConcreteStackBlock;
    v17 = sub_100083298;
    v18 = &v31;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](&OBJC_CLASS___RDServer, "sharedServer"));
    [v12 addClient:v6];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedXPCInterface](&OBJC_CLASS___RDClient, "sharedXPCInterface"));
    [v4 setRemoteObjectInterface:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](&OBJC_CLASS___RDServer, "sharedXPCInterface"));
    [v4 setExportedInterface:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedServer](&OBJC_CLASS___RDServer, "sharedServer"));
    [v4 setExportedObject:v15];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000831CC;
    v35[3] = &unk_1000CCF28;
    v16 = &v36;
    id v36 = v6;
    [v4 setInvalidationHandler:v35];
    v34 = _NSConcreteStackBlock;
    v17 = sub_100083210;
    v18 = &v34;
  }

  v18[1] = (void **)3221225472LL;
  v18[2] = (void **)v17;
  v18[3] = (void **)&unk_1000CCF28;
  v18[4] = (void **)v6;
  id v28 = v6;
  [v4 setInterruptionHandler:v18];

  [v4 resume];
  return 1;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end