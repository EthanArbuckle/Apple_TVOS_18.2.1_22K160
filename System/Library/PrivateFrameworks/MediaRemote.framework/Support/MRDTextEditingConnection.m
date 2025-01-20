@interface MRDTextEditingConnection
- (MRDTextEditingConnectionDelegate)mrDelegate;
- (MRTextEditingSession)currentSession;
- (MSVXPCTransaction)transaction;
- (NSString)bundleID;
- (NSXPCConnection)xpcConnection;
- (int)pid;
- (void)didInitializeWithConnection:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setMrDelegate:(id)a3;
- (void)setPid:(int)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRDTextEditingConnection

- (void)didInitializeWithConnection:(id)a3
{
  id v4 = a3;
  -[MRDTextEditingConnection setPid:](self, "setPid:", [v4 processIdentifier]);
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  v5 = sub_10013D0D8(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[MRDTextEditingConnection setBundleID:](self, "setBundleID:", v6);

  self->_skipNextTextChangedDelegation = 0;
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MediaRemote.MRDTextEditingConnection", v8);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v9;
}

- (MRTextEditingSession)currentSession
{
  return (MRTextEditingSession *)-[MRMutableTextEditingSession copy](self->_currentSession, "copy");
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (MRDTextEditingConnectionDelegate)mrDelegate
{
  return (MRDTextEditingConnectionDelegate *)objc_loadWeakRetained((id *)&self->_mrDelegate);
}

- (void)setMrDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (MSVXPCTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end