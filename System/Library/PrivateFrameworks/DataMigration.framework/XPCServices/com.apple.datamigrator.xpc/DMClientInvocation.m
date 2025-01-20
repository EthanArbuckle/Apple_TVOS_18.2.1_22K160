@interface DMClientInvocation
- (BOOL)checkNecessity;
- (BOOL)isProgressHost;
- (NSString)earlyResultsPluginIdentifier;
- (OS_xpc_object)connection;
- (id)resultsHandler;
- (int)pid;
- (void)setCheckNecessity:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setEarlyResultsPluginIdentifier:(id)a3;
- (void)setResultsHandler:(id)a3;
@end

@implementation DMClientInvocation

- (BOOL)isProgressHost
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMClientInvocation connection](self, "connection"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMClientInvocation connection](self, "connection"));
    xpc_connection_get_audit_token(v5, &v15);

    audit_token_t token = v15;
    v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    v7 = v6;
    if (v6)
    {
      v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0LL);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[DMClientInvocation pid](self, "pid")));
      v10 = (void *)v9;
      if (v8)
      {
        uint64_t v13 = v9;
        _DMLogFunc(v2, 6LL);

        unsigned __int8 v11 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"com.apple.backboardd",  v13,  v8);
LABEL_9:

        return v11;
      }

      _DMLogFunc(v2, 3LL);
    }

    else
    {
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[DMClientInvocation pid](self, "pid")));
      _DMLogFunc(v2, 3LL);
    }

    unsigned __int8 v11 = 0;
    goto LABEL_9;
  }

  return 0;
}

- (int)pid
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMClientInvocation connection](self, "connection"));

  if (!v3) {
    return 0;
  }
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DMClientInvocation connection](self, "connection"));
  pid_t pid = xpc_connection_get_pid(v4);

  return pid;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)checkNecessity
{
  return self->_checkNecessity;
}

- (void)setCheckNecessity:(BOOL)a3
{
  self->_checkNecessity = a3;
}

- (NSString)earlyResultsPluginIdentifier
{
  return self->_earlyResultsPluginIdentifier;
}

- (void)setEarlyResultsPluginIdentifier:(id)a3
{
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end