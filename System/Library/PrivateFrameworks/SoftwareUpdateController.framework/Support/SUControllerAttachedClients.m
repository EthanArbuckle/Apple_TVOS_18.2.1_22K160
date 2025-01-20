@interface SUControllerAttachedClients
- (BOOL)restrictingControlToExclusiveClients;
- (BOOL)underExclusiveControl;
- (NSMutableArray)activeClients;
- (OS_dispatch_queue)activeClientsQueue;
- (SUControllerAttachedClients)init;
- (SUControllerConfig)simulatedConfig;
- (SUControllerDescriptor)simulatedDescriptor;
- (SUControllerStatus)simulatedStatus;
- (id)_policyClientForConnection:(id)a3;
- (id)policyClientForConnection:(id)a3;
- (void)addPolicyClient:(id)a3;
- (void)broadcastMessage:(id)a3;
- (void)removeClientForConnection:(id)a3 forReason:(id)a4;
- (void)setActiveClients:(id)a3;
- (void)setActiveClientsQueue:(id)a3;
- (void)setSimulatedConfig:(id)a3;
- (void)setSimulatedDescriptor:(id)a3;
- (void)setSimulatedStatus:(id)a3;
- (void)setUnderExclusiveControl:(BOOL)a3;
@end

@implementation SUControllerAttachedClients

- (SUControllerAttachedClients)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SUControllerAttachedClients;
  v2 = -[SUControllerAttachedClients init](&v14, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerAttachedClients.activeClients", 0LL);
    activeClientsQueue = v2->_activeClientsQueue;
    v2->_activeClientsQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    activeClients = v2->_activeClients;
    v2->_activeClients = v5;

    simulatedConfig = v2->_simulatedConfig;
    v2->_simulatedConfig = 0LL;

    simulatedStatus = v2->_simulatedStatus;
    v2->_simulatedStatus = 0LL;

    simulatedDescriptor = v2->_simulatedDescriptor;
    v2->_simulatedDescriptor = 0LL;

    v2->_underExclusiveControl = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ATTACHED_CLIENTS(communal)] init under communal control",  v13,  2u);
    }
  }

  return v2;
}

- (void)addPolicyClient:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D02C;
  v7[3] = &unk_100065250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeClientForConnection:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D8B0;
  block[3] = &unk_100064860;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  v10 = (_xpc_connection_s *)v6;
  dispatch_async(v8, block);

  xpc_connection_cancel(v10);
}

- (void)broadcastMessage:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002DCC8;
  v7[3] = &unk_100065250;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)policyClientForConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0LL;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_10002E124;
  v17 = sub_10002E134;
  id v18 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E13C;
  block[3] = &unk_100065778;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)restrictingControlToExclusiveClients
{
  v2 = self;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](v2, "activeClientsQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002E24C;
  v6[3] = &unk_1000657A0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (id)_policyClientForConnection:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClientsQueue](self, "activeClientsQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerAttachedClients activeClients](self, "activeClients", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
        unsigned int v12 = [v4 isEqual:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (OS_dispatch_queue)activeClientsQueue
{
  return self->_activeClientsQueue;
}

- (void)setActiveClientsQueue:(id)a3
{
}

- (NSMutableArray)activeClients
{
  return self->_activeClients;
}

- (void)setActiveClients:(id)a3
{
}

- (SUControllerConfig)simulatedConfig
{
  return self->_simulatedConfig;
}

- (void)setSimulatedConfig:(id)a3
{
}

- (SUControllerStatus)simulatedStatus
{
  return self->_simulatedStatus;
}

- (void)setSimulatedStatus:(id)a3
{
}

- (SUControllerDescriptor)simulatedDescriptor
{
  return self->_simulatedDescriptor;
}

- (void)setSimulatedDescriptor:(id)a3
{
}

- (BOOL)underExclusiveControl
{
  return self->_underExclusiveControl;
}

- (void)setUnderExclusiveControl:(BOOL)a3
{
  self->_underExclusiveControl = a3;
}

- (void).cxx_destruct
{
}

@end