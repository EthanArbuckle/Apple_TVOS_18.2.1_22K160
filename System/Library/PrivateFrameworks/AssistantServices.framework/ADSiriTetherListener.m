@interface ADSiriTetherListener
- (ADSiriTetherListener)init;
- (void)_handleNewConnection:(id)a3;
- (void)listen;
@end

@implementation ADSiriTetherListener

- (ADSiriTetherListener)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADSiriTetherListener;
  v2 = -[ADSiriTetherListener init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create(0LL, v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( [v7 createXPCListenerForMachService:AFSiriTetherMachService targetQueue:v2->_queue flags:0]);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (OS_xpc_object *)v8;

    if (!v2->_xpcListener)
    {
      v10 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v12 = v10;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
        *(_DWORD *)buf = 136315394;
        v16 = "-[ADSiriTetherListener init]";
        __int16 v17 = 2112;
        v18 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Unable to create XPC listener from %@.",  buf,  0x16u);
      }
    }
  }

  return v2;
}

- (void)listen
{
  if (self->_xpcListener)
  {
    objc_initWeak(&location, self);
    xpcListener = self->_xpcListener;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1002BCA64;
    v4[3] = &unk_1004FA008;
    objc_copyWeak(&v5, &location);
    xpc_connection_set_event_handler(xpcListener, v4);
    xpc_connection_activate(self->_xpcListener);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

- (void)_handleNewConnection:(id)a3
{
  v4 = (_xpc_connection_s *)a3;
  id v5 = (_xpc_connection_s *)kAssistantClientEntitlement;
  v6 = (void *)xpc_connection_copy_entitlement_value(v4, [kAssistantClientEntitlement UTF8String]);
  v7 = v6;
  if (v6 && xpc_BOOL_get_value(v6))
  {
    uint64_t v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v14 = "-[ADSiriTetherListener _handleNewConnection:]";
      __int16 v15 = 2048;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Tether attached %p", buf, 0x16u);
    }

    xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002BC88C;
    handler[3] = &unk_1004FA030;
    v9 = v4;
    v12 = v9;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_activate(v9);
  }

  else
  {
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v14 = "-[ADSiriTetherListener _handleNewConnection:]";
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Client missing entitlement %@",  buf,  0x16u);
    }

    xpc_connection_cancel(v4);
  }
}

- (void).cxx_destruct
{
}

@end