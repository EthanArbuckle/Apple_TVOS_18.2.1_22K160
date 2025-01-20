@interface NDUserEventAgentConnection
+ (id)sharedUserEventAgentConnection;
- (BOOL)canLaunchProcessWithIdentifier:(id)a3;
- (NDUserEventAgentConnection)init;
- (void)handleNewConnection:(id)a3;
- (void)launchProcessWithIdentifier:(id)a3 sessionIdentifier:(id)a4;
- (void)performWake:(id)a3 uponNotification:(id)a4 sessionIdentifier:(id)a5;
- (void)removePendingWakeForClient:(id)a3 sessionIdentifier:(id)a4;
- (void)start;
@end

@implementation NDUserEventAgentConnection

- (NDUserEventAgentConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NDUserEventAgentConnection;
  v2 = -[NDUserEventAgentConnection init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nsurlsessiond.UserEventAgentConnectionQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    pendingWakes = v2->_pendingWakes;
    v2->_pendingWakes = v9;
  }

  return v2;
}

- (void)start
{
  mach_service = xpc_connection_create_mach_service( "com.apple.nsurlsessiond-launchondemand",  (dispatch_queue_t)self->_queue,  1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  dispatch_queue_attr_t v5 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_listener;
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created xpc listener: %@", buf, 0xCu);
  }

  dispatch_queue_t v7 = self->_listener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002EA68;
  handler[3] = &unk_1000793C0;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->_listener);
}

- (void)handleNewConnection:(id)a3
{
  dispatch_queue_attr_t v5 = (_xpc_connection_s *)a3;
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    v8 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Received a new connection from UserEventAgent! Canceling the old one",  buf,  2u);
      connection = *p_connection;
    }

    xpc_connection_cancel(connection);
    v9 = *p_connection;
    *p_connection = 0LL;
  }

  objc_storeStrong((id *)&self->_connection, a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002E730;
  handler[3] = &unk_1000793C0;
  handler[4] = self;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_set_target_queue(v5, (dispatch_queue_t)self->_queue);
  xpc_connection_resume(*p_connection);
}

- (BOOL)canLaunchProcessWithIdentifier:(id)a3
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_registeredClients, "objectForKey:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)launchProcessWithIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E57C;
  block[3] = &unk_100079968;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)performWake:(id)a3 uponNotification:(id)a4 sessionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10002E42C;
  v15[3] = &unk_1000793E8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (void)removePendingWakeForClient:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E37C;
  block[3] = &unk_100079968;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void).cxx_destruct
{
}

+ (id)sharedUserEventAgentConnection
{
  if (qword_100083930 != -1) {
    dispatch_once(&qword_100083930, &stru_100079398);
  }
  return (id)qword_100083928;
}

@end