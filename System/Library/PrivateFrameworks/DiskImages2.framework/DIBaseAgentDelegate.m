@interface DIBaseAgentDelegate
- (void)createListener;
@end

@implementation DIBaseAgentDelegate

- (void)createListener
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = -[DIBaseServiceDelegate serviceName](self, "serviceName");
  [v3 stringByAppendingString:@".xpc"];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  int v5 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    -[DIBaseServiceDelegate serviceName](self, "serviceName");
    *(_DWORD *)buf = 68158210;
    int v12 = 37;
    __int16 v13 = 2080;
    v14 = "-[DIBaseAgentDelegate createListener]";
    __int16 v15 = 2114;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    getDIOSLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[DIBaseServiceDelegate serviceName](self, "serviceName");
      *(_DWORD *)buf = 68158210;
      int v12 = 37;
      __int16 v13 = 2080;
      v14 = "-[DIBaseAgentDelegate createListener]";
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_188046000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Creating NSXPC listener on %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v5;
  v10 = (void *)[objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:v4];
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v10);
}

@end