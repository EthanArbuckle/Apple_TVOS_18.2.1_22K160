@interface SUControllerPolicyClient
- (BOOL)communalAfterDisconnecting;
- (BOOL)usingExclusiveControl;
- (NSString)clientName;
- (OS_xpc_object)connection;
- (SUControllerPolicyClient)initWithClientName:(id)a3 forConnection:(id)a4 withExclusiveControl:(BOOL)a5 communalUponDisconnect:(BOOL)a6;
- (id)description;
- (id)summary;
- (int64_t)uniqueInstance;
- (void)setClientName:(id)a3;
- (void)setCommunalAfterDisconnecting:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setUniqueInstance:(int64_t)a3;
- (void)setUsingExclusiveControl:(BOOL)a3;
@end

@implementation SUControllerPolicyClient

- (SUControllerPolicyClient)initWithClientName:(id)a3 forConnection:(id)a4 withExclusiveControl:(BOOL)a5 communalUponDisconnect:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SUControllerPolicyClient;
  v13 = -[SUControllerPolicyClient init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clientName, a3);
    v14->_uniqueInstance = 1LL;
    objc_storeStrong((id *)&v14->_connection, a4);
    v14->_usingExclusiveControl = a5;
    v14->_communalAfterDisconnecting = a6;
  }

  return v14;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyClient clientName](self, "clientName"));
  int64_t v4 = -[SUControllerPolicyClient uniqueInstance](self, "uniqueInstance");
  if (-[SUControllerPolicyClient usingExclusiveControl](self, "usingExclusiveControl")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (-[SUControllerPolicyClient communalAfterDisconnecting](self, "communalAfterDisconnecting")) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n                    clientName: %@\n                uniqueInstance: %ld\n         usingExclusiveControl: %@\n    communalAfterDisconnecting: %@\n<<<]",  v3,  v4,  v5,  v6));

  return v7;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyClient clientName](self, "clientName"));
  int64_t v4 = -[SUControllerPolicyClient uniqueInstance](self, "uniqueInstance");
  if (-[SUControllerPolicyClient usingExclusiveControl](self, "usingExclusiveControl")) {
    v5 = @"[ex]";
  }
  else {
    v5 = &stru_100066480;
  }
  unsigned int v6 = -[SUControllerPolicyClient communalAfterDisconnecting](self, "communalAfterDisconnecting");
  v7 = @"[cad]";
  if (!v6) {
    v7 = &stru_100066480;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%ld%@%@",  v3,  v4,  v5,  v7));

  return v8;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (int64_t)uniqueInstance
{
  return self->_uniqueInstance;
}

- (void)setUniqueInstance:(int64_t)a3
{
  self->_uniqueInstance = a3;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)usingExclusiveControl
{
  return self->_usingExclusiveControl;
}

- (void)setUsingExclusiveControl:(BOOL)a3
{
  self->_usingExclusiveControl = a3;
}

- (BOOL)communalAfterDisconnecting
{
  return self->_communalAfterDisconnecting;
}

- (void)setCommunalAfterDisconnecting:(BOOL)a3
{
  self->_communalAfterDisconnecting = a3;
}

- (void).cxx_destruct
{
}

@end