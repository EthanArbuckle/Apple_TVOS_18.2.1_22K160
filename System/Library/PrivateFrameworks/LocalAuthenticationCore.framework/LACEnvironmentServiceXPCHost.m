@interface LACEnvironmentServiceXPCHost
- (LACEnvironmentServiceXPCHost)initWithDependencies:(id)a3 workQueue:(id)a4;
- (void)environmentStateForUser:(id)a3 completion:(id)a4;
@end

@implementation LACEnvironmentServiceXPCHost

- (LACEnvironmentServiceXPCHost)initWithDependencies:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACEnvironmentServiceXPCHost;
  v9 = -[LACEnvironmentServiceXPCHost init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencies, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)environmentStateForUser:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v8 = [MEMORY[0x189607B30] currentConnection];
  if (!v8) {
    -[LACEnvironmentServiceXPCHost environmentStateForUser:completion:].cold.1();
  }
  v9 = (void *)v8;
  uint64_t v10 = [v6 unsignedIntValue];
  [v9 auditToken];
  dependencies = self->_dependencies;
  id v17 = 0LL;
  +[LACEnvironmentState environmentStateForUser:auditToken:dependencies:error:]( &OBJC_CLASS___LACEnvironmentState,  "environmentStateForUser:auditToken:dependencies:error:",  v10,  v18,  dependencies,  &v17);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v17;
  LACLogEnvironment();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v9 processIdentifier];
    if (v12) {
      id v16 = v12;
    }
    else {
      id v16 = v13;
    }
    *(_DWORD *)buf = 67109378;
    int v20 = v15;
    __int16 v21 = 2112;
    id v22 = v16;
    _os_log_impl(&dword_189219000, v14, OS_LOG_TYPE_DEFAULT, "Environment state for PID %u: %@", buf, 0x12u);
  }

  v7[2](v7, v12, v13);
}

- (void).cxx_destruct
{
}

- (void)environmentStateForUser:completion:.cold.1()
{
}

@end