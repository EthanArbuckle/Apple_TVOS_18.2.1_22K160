@interface SKDaemon
+ (id)sharedDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OS_dispatch_source)sigtermHandler;
- (SKDaemon)init;
- (unsigned)numConnectedClients;
- (void)handleWithMatchingEvent:(id)a3;
- (void)setListener:(id)a3;
- (void)setNumConnectedClients:(unsigned int)a3;
- (void)setSigtermHandler:(id)a3;
- (void)setupSigtermHandler;
- (void)startServer;
@end

@implementation SKDaemon

+ (id)sharedDaemon
{
  if (qword_100051B70 != -1) {
    dispatch_once(&qword_100051B70, &stru_1000450D0);
  }
  return (id)qword_100051B78;
}

- (void)setupSigtermHandler
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  &_dispatch_main_q);
  sigtermHandler = self->_sigtermHandler;
  self->_sigtermHandler = v3;

  dispatch_source_set_event_handler((dispatch_source_t)self->_sigtermHandler, &stru_1000450F0);
  dispatch_resume((dispatch_object_t)self->_sigtermHandler);
}

- (SKDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SKDaemon;
  v2 = -[SKDaemon init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SKDaemon setupSigtermHandler](v2, "setupSigtermHandler");
  }
  return v3;
}

- (void)handleWithMatchingEvent:(id)a3
{
  string = xpc_dictionary_get_string(a3, _xpc_event_key_name);
  v4 = string;
  if (string && !strcmp(string, "com.apple.storagekit.resize-match"))
  {
    int v19 = 0;
    *(void *)buf = 4LL;
    if (sysctlbyname("kern.hv_vmm_present", &v19, (size_t *)buf, 0LL, 0LL) || v19 != 1)
    {
      id v15 = sub_10000E2BC();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
      v8 = "%s: Ignoring disk resize event, not a VM";
      v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_7;
    }

    v6 = -[SKIOObject initWithIOObject:]( objc_alloc(&OBJC_CLASS___SKIOObject),  "initWithIOObject:",  IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults"));
    if (v6)
    {
      id v11 = -[os_log_s copyPropertyWithClass:key:]( v6,  "copyPropertyWithClass:key:",  objc_opt_class(&OBJC_CLASS___NSData),  @"sk-disk-resize");
      v12 = v11;
      if (v11 && [v11 length] == (id)8)
      {
        uint64_t v13 = *(void *)[v12 bytes];
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
        [v14 performVMDiskResizeWithSize:v13];
      }

      else
      {
        id v16 = sub_10000E2BC();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
        {
          if (v12) {
            v17 = (const char *)[v12 length];
          }
          else {
            v17 = 0LL;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
          __int16 v21 = 2048;
          v22 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to retrieve size to resize (data object length %ld)",  buf,  0x16u);
        }
      }
    }

    else
    {
      id v18 = sub_10000E2BC();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "%s: Failed to retrieve device tree defaults",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v5 = sub_10000E2BC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = "empty";
      if (v4) {
        v7 = v4;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SKDaemon handleWithMatchingEvent:]";
      __int16 v21 = 2080;
      v22 = v7;
      v8 = "%s: xpcEventName is %s";
      v9 = v6;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    }
  }

- (void)startServer
{
  id v3 = sub_10000E2BC();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting SKDaemon...", buf, 2u);
  }

  id v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.storagekitd");
  -[SKDaemon setListener:](self, "setListener:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));
  [v6 setDelegate:self];

  id v7 = +[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100014B64;
  handler[3] = &unk_100045138;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0LL, handler);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));
  [v8 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemon listener](self, "listener"));

  BOOL v9 = v8 == v7;
  if (v9)
  {
    v12 = -[SKDaemonConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___SKDaemonConnection),  "initWithConnection:",  v6);
    if (!v12)
    {
      BOOL v9 = 0;
      goto LABEL_11;
    }

    uint64_t v13 = v12;
    -[SKDaemon setNumConnectedClients:]( self,  "setNumConnectedClients:",  -[SKDaemon numConnectedClients](self, "numConnectedClients") + 1);
    id v14 = sub_10000E2BC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v13;
      __int16 v27 = 1024;
      unsigned int v28 = -[SKDaemon numConnectedClients](self, "numConnectedClients");
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%@ added. There are now %u client(s) connected to storagetkid",  buf,  0x12u);
    }

    int v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    __int16 v21 = sub_100014D80;
    v22 = &unk_100044EB0;
    id v11 = v13;
    v23 = v11;
    v24 = self;
    [v6 setInvalidationHandler:&v19];
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___SKDaemonConnection);
    if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[SKDaemonManager sharedManager]( &OBJC_CLASS___SKDaemonManager,  "sharedManager",  v19,  v20,  v21,  v22));
      [v17 addListener:v11];
    }

    objc_msgSend(v6, "resume", v19, v20, v21, v22);
  }

  else
  {
    id v10 = sub_10000E2BC();
    id v11 = (SKDaemonConnection *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Unknown listener (!) rejecting connection",  buf,  2u);
    }
  }

LABEL_11:
  return v9;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (unsigned)numConnectedClients
{
  return self->_numConnectedClients;
}

- (void)setNumConnectedClients:(unsigned int)a3
{
  self->_numConnectedClients = a3;
}

- (OS_dispatch_source)sigtermHandler
{
  return self->_sigtermHandler;
}

- (void)setSigtermHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end