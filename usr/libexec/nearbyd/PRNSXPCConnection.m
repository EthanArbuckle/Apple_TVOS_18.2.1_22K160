@interface PRNSXPCConnection
- (NSXPCConnection)connection;
- (PRNSXPCConnection)initWithConnection:(id)a3;
- (unint64_t)maxAllowedOutgoingMessages;
- (void)actOnRemoteObjectAndScheduleBarrierBlock:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setMaxAllowedOutgoingMessages:(unint64_t)a3;
@end

@implementation PRNSXPCConnection

- (PRNSXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PRNSXPCConnection;
  v6 = -[PRNSXPCConnection init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_maxAllowedOutgoingMessages = 1000LL;
    atomic_store(0LL, &v7->outgoingMessagesCount.__a_.__a_value);
  }

  return v7;
}

- (void)actOnRemoteObjectAndScheduleBarrierBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10025DA00;
  v23 = sub_10025DA10;
  id v24 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10025DA18;
  v18[3] = &unk_1007B8CA0;
  v18[4] = &v19;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v18]);

  if (v20[5])
  {
    v4[2](v4, 0LL);
  }

  else
  {
    p_outgoingMessagesCount = &self->outgoingMessagesCount;
    do
    {
      unint64_t v8 = __ldaxr(&p_outgoingMessagesCount->__a_.__a_value);
      unint64_t v9 = v8 + 1;
    }

    while (__stlxr(v8 + 1, &p_outgoingMessagesCount->__a_.__a_value));
    if (v9 <= -[PRNSXPCConnection maxAllowedOutgoingMessages](self, "maxAllowedOutgoingMessages"))
    {
      ((void (*)(void (**)(id, void), void *, uint64_t))v4[2])(v4, v6, v20[5]);
      if (__ROR8__(0x8F5C28F5C28F5C29LL * v9, 2) <= 0x28F5C28F5C28F5CuLL)
      {
        connection = self->_connection;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10025DA28;
        v17[3] = &unk_1007A3000;
        v17[4] = self;
        -[NSXPCConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v17);
      }
    }

    else
    {
      v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A25A8(v9, v10);
      }
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      v26 = @"FATAL CLIENT ERROR: Client hasn't dequeued xpc messages. Invalidating connection.";
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id v12 = PRErrorWithCodeAndUserInfo(2001LL, v11);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v20[5];
      v20[5] = v13;

      ((void (*)(void (**)(id, void), void, uint64_t))v4[2])(v4, 0LL, v20[5]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
      [v15 invalidate];
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
  [v3 invalidate];

  -[PRNSXPCConnection setConnection:](self, "setConnection:", 0LL);
}

- (unint64_t)maxAllowedOutgoingMessages
{
  return self->_maxAllowedOutgoingMessages;
}

- (void)setMaxAllowedOutgoingMessages:(unint64_t)a3
{
  self->_maxAllowedOutgoingMessages = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end