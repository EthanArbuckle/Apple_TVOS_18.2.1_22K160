@interface DIController2ClientDelegate
- (DIDeviceHandle)deviceHandle;
- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4;
- (void)setDeviceHandle:(id)a3;
@end

@implementation DIController2ClientDelegate

- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  int v8 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v20 = 0LL;
    uint64_t v9 = sub_1000BE278();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v22 = 63;
    __int16 v23 = 2080;
    v24 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
    __int16 v25 = 2114;
    id v26 = v6;
    v12 = (char *)_os_log_send_and_compose_impl( v11,  &v20,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: Received: %{public}@",  buf,  28);

    if (v12)
    {
      fprintf(__stderrp, "%s\n", v12);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = sub_1000BE278();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v22 = 63;
      __int16 v23 = 2080;
      v24 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Received: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 xpcEndpoint]);

  if (v15)
  {
    id v19 = 0LL;
    unsigned __int8 v16 = [v6 addToRefCountWithError:&v19];
    id v17 = v19;
    v18 = v17;
    if ((v16 & 1) == 0)
    {
      v7[2](v7, v17);

      goto LABEL_15;
    }
  }

  -[DIController2ClientDelegate setDeviceHandle:](self, "setDeviceHandle:", v6);
  v7[2](v7, 0LL);
LABEL_15:
}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end