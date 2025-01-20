@interface RDCommServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RDCommServer)init;
@end

@implementation RDCommServer

- (RDCommServer)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RDCommServer;
  v2 = -[RDCommServer init](&v15, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___RDXPCHandler);
    server = v2->server;
    v2->server = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RDXPCProtocol));
    interface = v2->interface;
    v2->interface = (NSXPCInterface *)v5;

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___RDEstimate),  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v2->interface,  "setClasses:forSelector:argumentIndex:ofReply:",  v9,  "updatePeer:withEstimate:",  0LL,  0LL);
    if (v2->interface)
    {
      v10 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.countryd.update");
      v11 = v10;
      if (v10)
      {
        -[NSXPCListener setDelegate:](v10, "setDelegate:", v2);
        if (qword_100019350 != -1) {
          dispatch_once(&qword_100019350, &stru_100014A08);
        }
        v12 = (os_log_s *)qword_100019358;
        if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v17 = 0;
          __int16 v18 = 2082;
          v19 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:listener is starting connection...}",  buf,  0x12u);
        }

        -[NSXPCListener resume](v11, "resume");
        v13 = v2;
      }

      else
      {
        v13 = 0LL;
      }
    }

    else
    {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedInterface:self->interface];
  [v5 setExportedObject:self->server];
  if (qword_100019350 != -1) {
    dispatch_once(&qword_100019350, &stru_100014A08);
  }
  v6 = (os_log_s *)qword_100019358;
  if (os_log_type_enabled((os_log_t)qword_100019358, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:listener is resuming connection...}",  (uint8_t *)v8,  0x12u);
  }

  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end