@interface RSDLocalServiceListener
- (BOOL)canceled;
- (OS_dispatch_source)socket_source;
- (RSDLocalService)service;
- (RSDLocalServiceListener)initWithService:(id)a3 forDevice:(id)a4 withPort:(char *)a5 onSocket:(int)a6;
- (RSDRemoteDevice)device;
- (char)port;
- (id)copyServiceDescription;
- (int)socket;
- (void)cancel;
- (void)dealloc;
- (void)setCanceled:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setPort:(char *)a3;
- (void)setService:(id)a3;
- (void)setSocket:(int)a3;
- (void)setSocket_source:(id)a3;
@end

@implementation RSDLocalServiceListener

- (RSDLocalServiceListener)initWithService:(id)a3 forDevice:(id)a4 withPort:(char *)a5 onSocket:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v12 = -[RSDLocalServiceListener init](self, "init");
  v13 = v12;
  if (v12)
  {
    -[RSDLocalServiceListener setService:](v12, "setService:", v10);
    -[RSDLocalServiceListener setPort:](v13, "setPort:", a5);
    -[RSDLocalServiceListener setSocket:](v13, "setSocket:", v6);
    -[RSDLocalServiceListener setDevice:](v13, "setDevice:", v11);
    dispatch_source_t v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  (int)v6,  0LL,  (dispatch_queue_t)qword_100043070);
    -[RSDLocalServiceListener setSocket_source:](v13, "setSocket_source:", v14);

    v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v13, "socket_source"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000066B8;
    handler[3] = &unk_10003CF18;
    v16 = v13;
    v25 = v16;
    id v26 = v11;
    dispatch_source_set_event_handler(v15, handler);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v16, "socket_source"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000686C;
    v22[3] = &unk_10003CF40;
    v18 = v16;
    v23 = v18;
    dispatch_source_set_mandatory_cancel_handler(v17, v22);

    v19 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](v18, "socket_source"));
    dispatch_activate(v19);

    v20 = v18;
  }

  return v13;
}

- (id)copyServiceDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener service](self, "service"));
  id v4 = [v3 copyServiceDescription];

  if (!v4) {
    sub_100024954(&v6, v7);
  }
  xpc_dictionary_set_string(v4, "Port", -[RSDLocalServiceListener port](self, "port"));
  return v4;
}

- (void)cancel
{
  v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RSDLocalServiceListener socket_source](self, "socket_source"));
  dispatch_source_cancel(v3);
}

- (void)dealloc
{
  if (!self->_canceled) {
    sub_1000249BC(&v4, v5);
  }
  free(self->_port);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDLocalServiceListener;
  -[RSDLocalServiceListener dealloc](&v3, "dealloc");
}

- (RSDLocalService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (RSDRemoteDevice)device
{
  return (RSDRemoteDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)setDevice:(id)a3
{
}

- (char)port
{
  return self->_port;
}

- (void)setPort:(char *)a3
{
  self->_port = a3;
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (OS_dispatch_source)socket_source
{
  return self->_socket_source;
}

- (void)setSocket_source:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
}

@end