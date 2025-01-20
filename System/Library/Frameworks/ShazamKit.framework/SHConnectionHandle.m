@interface SHConnectionHandle
- (NSXPCConnection)connection;
- (SHConnectionHandle)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteInterface:(id)a5;
- (SHServiceDelegate)serviceStateHandler;
- (id)exportedObject;
- (id)remoteObject;
- (void)dealloc;
- (void)setExportedObject:(id)a3;
- (void)setServiceStateHandler:(id)a3;
@end

@implementation SHConnectionHandle

- (void)dealloc
{
  uint64_t v3 = sh_log_object(self, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deallocating the XPC connection", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHConnectionHandle;
  -[SHConnectionHandle dealloc](&v5, "dealloc");
}

- (SHConnectionHandle)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteInterface:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHConnectionHandle;
  v12 = -[SHConnectionHandle init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    -[NSXPCConnection setExportedInterface:](v13->_connection, "setExportedInterface:", v10);
    -[NSXPCConnection setRemoteObjectInterface:](v13->_connection, "setRemoteObjectInterface:", v11);
  }

  return v13;
}

- (id)exportedObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle connection](self, "connection"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 exportedObject]);

  return v3;
}

- (void)setExportedObject:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle connection](self, "connection"));
  [v5 setExportedObject:v4];
}

- (id)remoteObject
{
  id remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHConnectionHandle connection](self, "connection"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100003F48;
    v8[3] = &unk_10006CC28;
    objc_copyWeak(&v9, &location);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:v8]);
    id v6 = self->_remoteObject;
    self->_id remoteObject = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id remoteObject = self->_remoteObject;
  }

  return remoteObject;
}

- (SHServiceDelegate)serviceStateHandler
{
  return self->_serviceStateHandler;
}

- (void)setServiceStateHandler:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end