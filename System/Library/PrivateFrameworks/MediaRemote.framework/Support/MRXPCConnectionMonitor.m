@interface MRXPCConnectionMonitor
- (BOOL)_canSendMessage;
- (BOOL)pendingBarrierCompletion;
- (MRXPCConnectionMonitor)initWithConnection:(id)a3 label:(id)a4;
- (MRXPCConnectionMonitor)initWithXPCConnection:(id)a3 label:(id)a4;
- (MRXPCConnectionMonitorDelegate)delegate;
- (NSDate)lastMessageSentDate;
- (NSDate)lastStatusChangeDate;
- (NSDate)lastStatusCheckDate;
- (NSString)bundleID;
- (NSString)label;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)calloutQueue;
- (OS_xpc_object)connection_t;
- (id)_initWithLabel:(id)a3;
- (id)debugDescription;
- (id)description;
- (int)pid;
- (unint64_t)currentMessageCount;
- (unint64_t)status;
- (unint64_t)totalMessageCount;
- (void)_checkConnectionStatus;
- (void)_onCalloutQueue_notifyStatusDidChange:(unint64_t)a3;
- (void)canSendMessage:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnection_t:(id)a3;
- (void)setCurrentMessageCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLastMessageSentDate:(id)a3;
- (void)setLastStatusChangeDate:(id)a3;
- (void)setLastStatusCheckDate:(id)a3;
- (void)setPendingBarrierCompletion:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTotalMessageCount:(unint64_t)a3;
@end

@implementation MRXPCConnectionMonitor

- (MRXPCConnectionMonitor)initWithConnection:(id)a3 label:(id)a4
{
  id v7 = a3;
  v8 = -[MRXPCConnectionMonitor _initWithLabel:](self, "_initWithLabel:", a4);
  v9 = (MRXPCConnectionMonitor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 4, a3);
    v9->_pid = [v7 processIdentifier];
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    v10 = sub_10013D0D8(v14);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v11;
  }

  return v9;
}

- (MRXPCConnectionMonitor)initWithXPCConnection:(id)a3 label:(id)a4
{
  id v7 = (_xpc_connection_s *)a3;
  v8 = -[MRXPCConnectionMonitor _initWithLabel:](self, "_initWithLabel:", a4);
  v9 = (MRXPCConnectionMonitor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 5, a3);
    v9->_pid = xpc_connection_get_pid(v7);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    xpc_connection_get_audit_token(v7, &v15);
    v14[0] = v15;
    v14[1] = v16;
    v10 = sub_10013D0D8(v14);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    bundleID = v9->_bundleID;
    v9->_bundleID = (NSString *)v11;
  }

  return v9;
}

- (id)_initWithLabel:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRXPCConnectionMonitor;
  v6 = -[MRXPCConnectionMonitor init](&v12, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaRemote.connectionMonitor", v8);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_label, a3);
  }

  return v6;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnectionMonitor label](self, "label"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ %p : %@>", v4, self, v5);

  return v6;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p {\n",  objc_opt_class(v2),  v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t status = v2->_status;
  v6 = @"?";
  if (status == 1) {
    v6 = @"Suspended";
  }
  if (status) {
    dispatch_queue_attr_t v7 = (__CFString *)v6;
  }
  else {
    dispatch_queue_attr_t v7 = @"Running";
  }
  v8 = v7;
  [v4 appendFormat:@"    unint64_t status = %@\n", v8];

  objc_msgSend(v4, "appendFormat:", @"    currentMessageCount = %lu\n", v2->_currentMessageCount);
  objc_msgSend(v4, "appendFormat:", @"    totalMessageCount = %lu\n", v2->_totalMessageCount);
  lastMessageSentDate = v2->_lastMessageSentDate;
  if (lastMessageSentDate)
  {
    -[NSDate timeIntervalSinceNow](lastMessageSentDate, "timeIntervalSinceNow");
    objc_msgSend(v4, "appendFormat:", @"    lastMessageSent = %f seconds ago\n", -v10);
  }

  lastStatusCheckDate = v2->_lastStatusCheckDate;
  if (lastStatusCheckDate)
  {
    -[NSDate timeIntervalSinceNow](lastStatusCheckDate, "timeIntervalSinceNow");
    objc_msgSend(v4, "appendFormat:", @"    lastStatusCheck = %f seconds ago\n", -v12);
  }

  lastStatusChangeDate = v2->_lastStatusChangeDate;
  if (lastStatusChangeDate)
  {
    -[NSDate timeIntervalSinceNow](lastStatusChangeDate, "timeIntervalSinceNow");
    objc_msgSend(v4, "appendFormat:", @"    lastStatusChange = %f seconds ago\n", -v14);
  }

  if (v2->_pendingBarrierCompletion) {
    [v4 appendString:@"    pendingBarrierCompletion = YES\n"];
  }
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  id v16 = [v15 checkXPCConnectionStatusDefaultInterval];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v17 checkXPCConnectionStatusDefaultResponseTimeout];
  objc_msgSend(v4, "appendFormat:", @"    params = {%lu x %f}\n", v16, v18);

  [v4 appendFormat:@"}>\n"];
  objc_sync_exit(v2);

  return v4;
}

- (NSString)label
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%@-%d",  self->_label,  self->_bundleID,  self->_pid);
}

- (void)canSendMessage:(id)a3
{
  id v4 = a3;
  calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100107F20;
  v7[3] = &unk_10039AD10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

- (BOOL)_canSendMessage
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_currentMessageCount + 1;
  v2->_currentMessageCount = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  id v5 = [v4 checkXPCConnectionStatusDefaultInterval];

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lastMessageSentDate = v2->_lastMessageSentDate;
  v2->_lastMessageSentDate = (NSDate *)v6;

  unint64_t status = v2->_status;
  ++v2->_totalMessageCount;
  objc_sync_exit(v2);

  if ((id)v3 == v5) {
    -[MRXPCConnectionMonitor _checkConnectionStatus](v2, "_checkConnectionStatus");
  }
  return status == 0;
}

- (void)_checkConnectionStatus
{
  id v3 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v4 checkXPCConnectionStatusDefaultResponseTimeout];
  double v6 = v5;
  calloutQueue = self->_calloutQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001082A8;
  v27[3] = &unk_10039C500;
  objc_copyWeak(&v28, &location);
  id v8 = [v3 initWithTimeout:@"XPCConnectionBarrier" reason:calloutQueue queue:v27 handler:v6];

  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_1001082D8;
  v24 = &unk_100398E60;
  v25 = self;
  id v9 = v8;
  id v26 = v9;
  double v10 = objc_retainBlock(&v21);
  uint64_t v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingBarrierCompletion)
  {
    objc_sync_exit(v11);
  }

  else
  {
    v11->_pendingBarrierCompletion = 1;
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now", v21, v22, v23, v24, v25));
    lastStatusCheckDate = v11->_lastStatusCheckDate;
    v11->_lastStatusCheckDate = (NSDate *)v12;

    objc_sync_exit(v11);
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v15 = [v14 verboseConnectionMonitorLogging];

    if (v15)
    {
      uint64_t v17 = _MRLogForCategory(8LL, v16);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[ConnectionMonitor] Checking connection %@",  buf,  0xCu);
      }
    }

    connection = v11->_connection;
    if (connection)
    {
      -[NSXPCConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v10);
    }

    else
    {
      connection_t = v11->_connection_t;
      if (connection_t) {
        xpc_connection_send_barrier(connection_t, v10);
      }
    }
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_onCalloutQueue_notifyStatusDidChange:(unint64_t)a3
{
  double v5 = self;
  objc_sync_enter(v5);
  uint64_t v7 = _MRLogForCategory(8LL, v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"?";
    if (a3 == 1) {
      id v9 = @"Suspended";
    }
    if (!a3) {
      id v9 = @"Running";
    }
    double v10 = v9;
    -[NSDate timeIntervalSinceNow](v5->_lastStatusChangeDate, "timeIntervalSinceNow");
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    __int16 v32 = 2112;
    v33 = v5;
    __int16 v34 = 2048;
    double v35 = -v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[ConnectionMonitor] Updated connectionStatus = %@ for %@ after %lf seconds",  buf,  0x20u);
  }

  v5->_unint64_t status = a3;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  lastStatusChangeDate = v5->_lastStatusChangeDate;
  v5->_lastStatusChangeDate = (NSDate *)v12;

  id WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  objc_sync_exit(v5);

  if (a3)
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "connectionDidInvalidate:") & 1) != 0) {
      [WeakRetained connectionDidInvalidate:v5];
    }
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v16 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
    id v17 = (id)-[MRXPCConnectionMonitor pid](v5, "pid");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnectionMonitor bundleID](v5, "bundleID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRXPCConnectionMonitor label](v5, "label"));
    v20 = -[MRDTaskAssertion initWithType:pid:bundleID:name:]( v16,  "initWithType:pid:bundleID:name:",  5LL,  v17,  v18,  v19);

    if ((objc_opt_respondsToSelector(WeakRetained, "connectionDidResume:") & 1) != 0) {
      [WeakRetained connectionDidResume:v5];
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100108728;
    v26[3] = &unk_100398F40;
    v21 = v20;
    v27 = v21;
    id v28 = v5;
    id v22 = v15;
    id v29 = v22;
    v23 = objc_retainBlock(v26);
    connection = v5->_connection;
    if (connection)
    {
      -[NSXPCConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v23);
    }

    else
    {
      connection_t = v5->_connection_t;
      if (connection_t) {
        xpc_connection_send_barrier(connection_t, v23);
      }
    }
  }
}

- (MRXPCConnectionMonitorDelegate)delegate
{
  return (MRXPCConnectionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection_t
{
  return self->_connection_t;
}

- (void)setConnection_t:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (unint64_t)currentMessageCount
{
  return self->_currentMessageCount;
}

- (void)setCurrentMessageCount:(unint64_t)a3
{
  self->_currentMessageCount = a3;
}

- (unint64_t)totalMessageCount
{
  return self->_totalMessageCount;
}

- (void)setTotalMessageCount:(unint64_t)a3
{
  self->_totalMessageCount = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (BOOL)pendingBarrierCompletion
{
  return self->_pendingBarrierCompletion;
}

- (void)setPendingBarrierCompletion:(BOOL)a3
{
  self->_pendingBarrierCompletion = a3;
}

- (NSDate)lastStatusCheckDate
{
  return self->_lastStatusCheckDate;
}

- (void)setLastStatusCheckDate:(id)a3
{
}

- (NSDate)lastStatusChangeDate
{
  return self->_lastStatusChangeDate;
}

- (void)setLastStatusChangeDate:(id)a3
{
}

- (NSDate)lastMessageSentDate
{
  return self->_lastMessageSentDate;
}

- (void)setLastMessageSentDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end