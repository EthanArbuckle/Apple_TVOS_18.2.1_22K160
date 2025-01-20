@interface DIBaseAgentDelegate
- (void)createListener;
@end

@implementation DIBaseAgentDelegate

- (void)createListener
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@".xpc"]);

  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v16 = 0LL;
    uint64_t v6 = sub_1000B85DC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
    *(_DWORD *)buf = 68158210;
    int v18 = 37;
    __int16 v19 = 2080;
    v20 = "-[DIBaseAgentDelegate createListener]";
    __int16 v21 = 2114;
    v22 = v9;
    int v15 = 28;
    v10 = (char *)_os_log_send_and_compose_impl( v8,  &v16,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: Creating NSXPC listener on %{public}@",  buf,  v15);

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
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate serviceName](self, "serviceName"));
      *(_DWORD *)buf = 68158210;
      int v18 = 37;
      __int16 v19 = 2080;
      v20 = "-[DIBaseAgentDelegate createListener]";
      __int16 v21 = 2114;
      v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Creating NSXPC listener on %{public}@",  buf,  0x1Cu);
    }
  }

  *__error() = v5;
  v14 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v4);
  -[DIBaseServiceDelegate setListener:](self, "setListener:", v14);
}

@end