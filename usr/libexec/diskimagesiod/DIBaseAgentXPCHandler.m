@interface DIBaseAgentXPCHandler
- (void)createConnection;
@end

@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  unsigned int v3 = -[DIBaseXPCHandler isPrivileged](self, "isPrivileged");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler serviceName](self, "serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@".xpc"]);

  int v6 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    uint64_t v7 = sub_1000B85DC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v20 = 41;
    __int16 v21 = 2080;
    v22 = "-[DIBaseAgentXPCHandler createConnection]";
    __int16 v23 = 2114;
    v24 = v5;
    int v17 = 28;
    v10 = (char *)_os_log_send_and_compose_impl( v9,  &v18,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Creating connection to %{public}@",  buf,  v17);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = sub_1000B85DC();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v20 = 41;
      __int16 v21 = 2080;
      v22 = "-[DIBaseAgentXPCHandler createConnection]";
      __int16 v23 = 2114;
      v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creating connection to %{public}@",  buf,  0x1Cu);
    }
  }

  if (v3) {
    uint64_t v13 = 4096LL;
  }
  else {
    uint64_t v13 = 0LL;
  }
  *__error() = v6;
  v14 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v5,  v13);
  -[DIBaseXPCHandler setConnection:](self, "setConnection:", v14);

  -[DIBaseAgentXPCHandler setConnectionMode](self, "setConnectionMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler remoteObjectInterface](self, "remoteObjectInterface"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseXPCHandler connection](self, "connection"));
  [v16 setRemoteObjectInterface:v15];
}

@end