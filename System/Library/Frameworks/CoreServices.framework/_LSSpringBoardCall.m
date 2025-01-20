@interface _LSSpringBoardCall
+ (id)springBoardDeadlockPreventionQueue;
+ (id)springBoardQueue;
- (BOOL)callCompletionHandlerWhenFullyComplete;
- (BSServiceConnectionEndpoint)targetServiceConnectionEndpoint;
- (NSDictionary)launchOptions;
- (NSString)bundleIdentifier;
- (NSXPCConnection)clientXPCConnection;
- (_LSSpringBoardCall)callWithCompletionHandler:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)callSpringBoardWithCompletionHandler:(id)a3;
- (void)lieWithCompletionHandler:(id)a3;
- (void)promptAndCallSpringBoardWithCompletionHandler:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCallCompletionHandlerWhenFullyComplete:(BOOL)a3;
- (void)setClientXPCConnection:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setTargetServiceConnectionEndpoint:(id)a3;
@end

@implementation _LSSpringBoardCall

- (NSDictionary)launchOptions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_launchOptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLaunchOptions:(id)a3
{
  id v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (NSDictionary *)[v17 mutableCopy];
  schemeIfNotFileURL = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = 0LL;

  uint64_t FBSOpenApplicationOptionKeyPayloadURL = getFBSOpenApplicationOptionKeyPayloadURL();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = -[NSDictionary objectForKey:](v5, "objectForKey:", FBSOpenApplicationOptionKeyPayloadURL);
  v10 = (void *)v9;
  if (v8 && v9)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = v10;
      v10 = 0LL;
      goto LABEL_8;
    }
  }

  else if (!v9)
  {
    goto LABEL_9;
  }

  if ([v10 isFileURL]) {
    goto LABEL_9;
  }
  [v10 scheme];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 copy];
  v13 = v4->_schemeIfNotFileURL;
  v4->_schemeIfNotFileURL = (NSString *)v12;

LABEL_8:
LABEL_9:
  if (getBSServiceConnectionEndpointClass())
  {
    v14 = -[NSDictionary objectForKey:](v5, "objectForKey:", @"LSTargetBSServiceConnectionEndpointKey");
    if (v14 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v14 = 0LL;
    }

    targetServiceConnectionEndpoint = v4->_targetServiceConnectionEndpoint;
    v4->_targetServiceConnectionEndpoint = (BSServiceConnectionEndpoint *)v14;

    -[NSDictionary removeObjectForKey:](v5, "removeObjectForKey:", @"LSTargetBSServiceConnectionEndpointKey");
  }

  launchOptions = v4->_launchOptions;
  v4->_launchOptions = v5;

  objc_sync_exit(v4);
}

- (_LSSpringBoardCall)callWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall callWithCompletionHandler:]");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 104, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }

  if (self->_schemeIfNotFileURL)
  {
    _LSServer_DatabaseExecutionContext();
    v6 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v6);
    v7 = -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __48___LSSpringBoardCall_callWithCompletionHandler___block_invoke;
    v12[3] = &unk_189D78898;
    v12[4] = self;
    id v13 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v7, v8, schemeIfNotFileURL, 0LL, v12);
  }

  else
  {
    -[_LSSpringBoardCall callSpringBoardWithCompletionHandler:](self, "callSpringBoardWithCompletionHandler:", v5);
  }

  return result;
}

- (id)debugDescription
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
  v7 = -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
  int v8 = [v7 processIdentifier];
  BOOL v9 = -[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete");
  v10 = @"no";
  if (v9) {
    v10 = @"yes";
  }
  [v3 stringWithFormat:@"<%@ %p> { bundleID = %@, client = %li, blocking = %@ }", v5, self, v6, v8, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setBundleIdentifier:v5];
    v6 = -[_LSSpringBoardCall launchOptions](self, "launchOptions");
    [v4 setLaunchOptions:v6];
    v7 = -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    [v4 setClientXPCConnection:v7];

    objc_msgSend( v4,  "setCallCompletionHandlerWhenFullyComplete:",  -[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"));
  }

  return v4;
}

- (BSServiceConnectionEndpoint)targetServiceConnectionEndpoint
{
  return (BSServiceConnectionEndpoint *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTargetServiceConnectionEndpoint:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSXPCConnection)clientXPCConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setClientXPCConnection:(id)a3
{
}

- (BOOL)callCompletionHandlerWhenFullyComplete
{
  return self->_callCompletionHandlerWhenFullyComplete;
}

- (void)setCallCompletionHandlerWhenFullyComplete:(BOOL)a3
{
  self->_callCompletionHandlerWhenFullyComplete = a3;
}

- (void).cxx_destruct
{
}

+ (id)springBoardQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardQueue]::once != -1) {
    dispatch_once(&+[_LSSpringBoardCall(Private) springBoardQueue]::once, &__block_literal_global_63);
  }
  return (id)+[_LSSpringBoardCall(Private) springBoardQueue]::result;
}

+ (id)springBoardDeadlockPreventionQueue
{
  if (+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken != -1) {
    dispatch_once( &+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::onceToken,  &__block_literal_global_57);
  }
  return (id)+[_LSSpringBoardCall(Private) springBoardDeadlockPreventionQueue]::result;
}

- (void)callSpringBoardWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 200, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  v6 = -[_LSSpringBoardCall targetServiceConnectionEndpoint](self, "targetServiceConnectionEndpoint");
  if (v6) {
    [(id)getFBSOpenApplicationServiceClass() serviceWithEndpoint:v6];
  }
  else {
    [(id)getFBSOpenApplicationServiceClass() serviceWithDefaultShellEndpoint];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    FBSOpenApplicationOptionsClass = (void *)getFBSOpenApplicationOptionsClass();
    -[_LSSpringBoardCall launchOptions](self, "launchOptions");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [FBSOpenApplicationOptionsClass optionsWithDictionary:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    if (v11)
    {
      FBSProcessHandleClass = (void *)getFBSProcessHandleClass();
      -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [FBSProcessHandleClass processHandleForNSXPCConnection:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [(id)getFBSProcessHandleClass() processHandle];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (-[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"))
    {
      MEMORY[0x186E2AFD4]();
      [(id)objc_opt_class() springBoardQueue];
      v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke;
      block[3] = &unk_189D78760;
      id v29 = v7;
      v30 = self;
      id v31 = v10;
      id v32 = v14;
      id v33 = v5;
      id v16 = v14;
      id v17 = v10;
      dispatch_async(v15, block);

      v18 = v29;
    }

    else
    {
      MEMORY[0x186E2AFD4]();
      [(id)objc_opt_class() springBoardDeadlockPreventionQueue];
      v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __68___LSSpringBoardCall_Private__callSpringBoardWithCompletionHandler___block_invoke_3;
      v23[3] = &unk_189D78760;
      v23[4] = self;
      id v24 = v7;
      id v25 = v10;
      id v26 = v14;
      id v27 = v5;
      id v20 = v14;
      id v21 = v10;
      dispatch_async(v19, v23);

      v18 = v24;
    }
  }

  else
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  45LL,  (uint64_t)"-[_LSSpringBoardCall(Private) callSpringBoardWithCompletionHandler:]",  300LL,  0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0LL, v10);
  }
}

- (void)lieWithCompletionHandler:(id)a3
{
  v7 = (void (**)(id, uint64_t, void))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) lieWithCompletionHandler:]");
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 308, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }

  id v5 = (void *)-[_LSSpringBoardCall copy](self, "copy");
  [v5 setCallCompletionHandlerWhenFullyComplete:1];
  [v5 callWithCompletionHandler:&__block_literal_global_65_0];
  v7[2](v7, 1LL, 0LL);
}

- (void)promptAndCallSpringBoardWithCompletionHandler:(id)a3
{
  id v5 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSSpringBoardCall(Private) promptAndCallSpringBoardWithCompletionHandler:]");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, self, @"LSSpringBoardCall.mm", 325, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }

  if (-[_LSSpringBoardCall callCompletionHandlerWhenFullyComplete](self, "callCompletionHandlerWhenFullyComplete"))
  {
    v6 = -[_LSSpringBoardCall clientXPCConnection](self, "clientXPCConnection");
    v7 = -[_LSSpringBoardCall bundleIdentifier](self, "bundleIdentifier");
    schemeIfNotFileURL = self->_schemeIfNotFileURL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __77___LSSpringBoardCall_Private__promptAndCallSpringBoardWithCompletionHandler___block_invoke;
    v10[3] = &unk_189D78898;
    v10[4] = self;
    id v11 = v5;
    _LSSchemeApprovalFindWithCompletionHandler(v6, v7, schemeIfNotFileURL, 3LL, v10);
  }

  else
  {
    -[_LSSpringBoardCall lieWithCompletionHandler:](self, "lieWithCompletionHandler:", v5);
  }
}

@end