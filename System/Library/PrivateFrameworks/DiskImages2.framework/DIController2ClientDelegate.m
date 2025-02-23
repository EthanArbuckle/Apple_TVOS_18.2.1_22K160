@interface DIController2ClientDelegate
- (DIDeviceHandle)deviceHandle;
- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4;
- (void)setDeviceHandle:(id)a3;
@end

@implementation DIController2ClientDelegate

- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  int v8 = *__error();
  if (DIForwardLogs())
  {
    v18[1] = 0LL;
    getDIOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v20 = 63;
    __int16 v21 = 2080;
    v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
    __int16 v23 = 2114;
    id v24 = v6;
    LODWORD(v17) = 28;
    v16 = buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
      free(v10);
    }
  }

  else
  {
    getDIOSLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v20 = 63;
      __int16 v21 = 2080;
      v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Received: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v8;
  [v6 xpcEndpoint];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v18[0] = 0LL;
    char v13 = [v6 addToRefCountWithError:v18];
    id v14 = v18[0];
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      v7[2](v7, v14);

      goto LABEL_12;
    }
  }

  -[DIController2ClientDelegate setDeviceHandle:](self, "setDeviceHandle:", v6, v16, v17);
  v7[2](v7, 0LL);
LABEL_12:
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