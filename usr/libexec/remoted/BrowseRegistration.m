@interface BrowseRegistration
- (BOOL)canceled;
- (BrowseRegistration)initWithRequest:(id)a3;
- (OS_xpc_object)connection;
- (unsigned)type;
- (void)cancel;
- (void)deliverDevice:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation BrowseRegistration

- (BrowseRegistration)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = -[BrowseRegistration init](self, "init");
  if (v5)
  {
    -[BrowseRegistration setType:](v5, "setType:", xpc_dictionary_get_uint64(v4, "device_type"));
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
    -[BrowseRegistration setConnection:](v5, "setConnection:", v7);

    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](v5, "connection"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10001AF20;
    handler[3] = &unk_10003CDB8;
    v9 = v5;
    v13 = v9;
    xpc_connection_set_event_handler(v8, handler);

    [(id)qword_1000431A8 addObject:v9];
    v10 = v9;
  }

  return v5;
}

- (void)deliverDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  if (v5 == -[BrowseRegistration type](self, "type") || -[BrowseRegistration type](self, "type") == 0xFFFF)
  {
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    v7 = sub_100013A90(v6);

    v8 = (os_log_s *)qword_100043198;
    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Delivering device (client=%s)",  (uint8_t *)&v12,  0xCu);
    }

    free(v7);
    xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    sub_10001B184(v4, v10, v9);

    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    xpc_connection_send_message(v11, v9);
  }
}

- (void)cancel
{
  if (!-[BrowseRegistration canceled](self, "canceled"))
  {
    -[BrowseRegistration setCanceled:](self, "setCanceled:", 1LL);
    [(id)qword_1000431A8 removeObject:self];
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    id v4 = sub_100013A90(v3);

    if (os_log_type_enabled((os_log_t)qword_100043198, OS_LOG_TYPE_DEBUG)) {
      sub_10002AC38();
    }
    free(v4);
    unsigned int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BrowseRegistration connection](self, "connection"));
    barrier[0] = _NSConcreteStackBlock;
    barrier[1] = 3221225472LL;
    barrier[2] = sub_10001B34C;
    barrier[3] = &unk_10003CF40;
    barrier[4] = self;
    xpc_connection_send_barrier(v5, barrier);
  }

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
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

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end