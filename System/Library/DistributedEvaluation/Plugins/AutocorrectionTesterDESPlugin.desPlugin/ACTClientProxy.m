@interface ACTClientProxy
- (ACTClientProtocol)client;
- (ACTClientProxy)initWithClient:(id)a3;
- (void)closeRequestToken:(id)a3;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)pushCandidates:(id)a3 requestToken:(id)a4;
@end

@implementation ACTClientProxy

- (ACTClientProxy)initWithClient:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACTClientProxy;
  v5 = -[ACTClientProxy init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_client, v4);
  }

  return v6;
}

- (void)pushCandidates:(id)a3 requestToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTClientProxy client](self, "client"));
  objc_super v8 = v7;
  if (v7) {
    [v7 pushAutocorrections:v9 requestToken:v6];
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTClientProxy client](self, "client"));
  objc_super v8 = v7;
  if (v7) {
    [v7 pushCandidateResultSet:v9 requestToken:v6];
  }
}

- (void)closeRequestToken:(id)a3
{
  id v6 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ACTClientProxy client](self, "client"));
  v5 = (void *)v4;
  if (v4 && (objc_opt_respondsToSelector(v4, "closeRequestToken:") & 1) != 0) {
    [v5 closeRequestToken:v6];
  }
}

- (ACTClientProtocol)client
{
  return (ACTClientProtocol *)objc_loadWeakRetained((id *)&self->_client);
}

- (void).cxx_destruct
{
}

@end