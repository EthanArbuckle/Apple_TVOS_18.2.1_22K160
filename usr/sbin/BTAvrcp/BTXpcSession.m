@interface BTXpcSession
- (BTWatchdog)watchdog;
- (BTXpcSession)init;
- (BTXpcSession)initWithConnection:(id)a3;
- (OS_os_transaction)transaction;
- (OS_xpc_object)connection;
- (id)_objectForKey:(const char *)a3 dict:(id)a4 optional:(BOOL)a5 converters:(id)a6;
- (id)numberForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (id)stringForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (id)xpcDictForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5;
- (void)_handleEvent:(id)a3;
- (void)_sendMsg:(id)a3 isReply:(BOOL)a4;
- (void)handleMsg:(id)a3;
- (void)sendMsg:(id)a3;
- (void)sendReply:(id)a3;
@end

@implementation BTXpcSession

- (BTXpcSession)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[BTXpcSession init]"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Calling %@ is not allowed",  v3);

  return 0LL;
}

- (BTXpcSession)initWithConnection:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___BTXpcSession;
  v6 = -[BTXpcSession init](&v21, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.%@",  objc_opt_class(v7));
    id v9 = objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = os_transaction_create([v9 UTF8String]);
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___BTWatchdog);
    watchdog = v7->_watchdog;
    v7->_watchdog = v12;

    v14 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](v7, "connection"));
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Started XPC session: %@", buf, 0xCu);
    }

    xpc_connection_set_target_queue(v7->_connection, &_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000040C4;
    handler[3] = &unk_1000187D0;
    v20 = v7;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (void)sendMsg:(id)a3
{
}

- (void)sendReply:(id)a3
{
}

- (void)handleMsg:(id)a3
{
}

- (id)numberForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F190;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F190, &stru_100018810);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[BTXpcSession _objectForKey:dict:optional:converters:]( self,  "_objectForKey:dict:optional:converters:",  a3,  v9,  v5,  qword_10001F188));

  return v10;
}

- (id)stringForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F1A0;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F1A0, &stru_1000188D0);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[BTXpcSession _objectForKey:dict:optional:converters:]( self,  "_objectForKey:dict:optional:converters:",  a3,  v9,  v5,  qword_10001F198));

  return v10;
}

- (id)xpcDictForKey:(const char *)a3 optional:(BOOL)a4 dict:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = qword_10001F1B0;
  id v9 = a5;
  if (v8 != -1) {
    dispatch_once(&qword_10001F1B0, &stru_100018930);
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[BTXpcSession _objectForKey:dict:optional:converters:]( self,  "_objectForKey:dict:optional:converters:",  a3,  v9,  v5,  qword_10001F1A8));

  return v10;
}

- (void)_sendMsg:(id)a3 isReply:(BOOL)a4
{
  id v6 = a3;
  v7 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FD68(a4, v7);
  }
  uint64_t v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](self, "connection"));
  xpc_connection_send_message(v8, v6);
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
      sub_10000FE34(v6);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession watchdog](self, "watchdog"));
    [v7 beginTransaction];

    -[BTXpcSession handleMsg:](self, "handleMsg:", v4);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession watchdog](self, "watchdog"));
    [v8 endTransaction];
  }

  else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    id v9 = (void *)qword_10001F1C0;
    if (v4 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTXpcSession connection](self, "connection"));
        int v12 = 138412290;
        v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Ended XPC session: %@",  (uint8_t *)&v12,  0xCu);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR))
    {
      sub_10000FEC8(v9);
    }
  }

  else
  {
    BOOL v5 = (void *)qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_10000FF4C(v5);
    }
  }
}

- (id)_objectForKey:(const char *)a3 dict:(id)a4 optional:(BOOL)a5 converters:(id)a6
{
  id v11 = a6;
  xpc_object_t value = xpc_dictionary_get_value(a4, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(value);
  v14 = v13;
  if (v13)
  {
    v15 = +[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", xpc_get_type(v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v16]);
    if (!v17)
    {
      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v21 handleFailureInMethod:a2, self, @"BTXpcSession.m", 150, @"Invalid XPC value type for key %s: %@", a3, v14 object file lineNumber description];
    }

    uint64_t v18 = ((uint64_t (**)(void, void *))v17)[2](v17, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }

  else
  {
    if (a5)
    {
      v19 = 0LL;
      goto LABEL_8;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    objc_msgSend( v16,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"BTXpcSession.m",  154,  @"Missing XPC value for key \"%s\"",  a3);
    v19 = 0LL;
  }

LABEL_8:
  return v19;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (BTWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
}

  ;
}

@end