@interface DIBaseAgentXPCHandler
- (void)createConnection;
@end

@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  BOOL v3 = -[DIBaseXPCHandler isPrivileged](self, "isPrivileged");
  v4 = -[DIBaseXPCHandler serviceName](self, "serviceName");
  [v4 stringByAppendingString:@".xpc"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  int v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v15 = 41;
    __int16 v16 = 2080;
    v17 = "-[DIBaseAgentXPCHandler createConnection]";
    __int16 v18 = 2114;
    v19 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    getDIOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v15 = 41;
      __int16 v16 = 2080;
      v17 = "-[DIBaseAgentXPCHandler createConnection]";
      __int16 v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to %{public}@", buf, 0x1Cu);
    }
  }

  if (v3) {
    uint64_t v10 = 4096LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  *__error() = v6;
  v11 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:v5 options:v10];
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v11);

  -[DIBaseAgentXPCHandler setConnectionMode](self, "setConnectionMode");
  v12 = -[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface");
  v13 = -[DIBaseXPCHandler connection](self, "connection");
  [v13 setRemoteObjectInterface:v12];
}

@end