@interface DIDiskArbEmulation
- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4;
- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4;
- (BOOL)waitForDAIdleWithError:(id *)a3;
- (id)copyDescriptionWithBSDName:(id)a3;
@end

@implementation DIDiskArbEmulation

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  return 1;
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  int v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v24 = 45;
    __int16 v25 = 2080;
    v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    __int16 v27 = 2112;
    id v28 = v5;
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
      int v24 = 45;
      __int16 v25 = 2080;
      v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }
  }

  *__error() = v6;
  id v10 = [NSString stringWithFormat:@"/dev/%@", v5];
  int v11 = open((const char *)[v10 fileSystemRepresentation], 0);
  if (v11 < 0)
  {
    uint64_t v16 = *__error();
    v15 = @"Failed to eject - cannot open device";
    goto LABEL_11;
  }

  int v12 = v11;
  int v13 = ioctl(v11, 0x20006415uLL, 0LL);
  uint64_t v14 = *__error();
  close(v12);
  if (v13)
  {
    v15 = @"Failed to eject";
    uint64_t v16 = v14;
LABEL_11:
    BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v16,  v15,  a4);
    goto LABEL_19;
  }

  close(v12);
  int v18 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v24 = 45;
    __int16 v25 = 2080;
    v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    __int16 v27 = 2112;
    id v28 = v5;
    v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v20);
      free(v20);
    }
  }

  else
  {
    getDIOSLog();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v24 = 45;
      __int16 v25 = 2080;
      v26 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_188046000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
    }
  }

  *__error() = v18;
  BOOL v17 = 1;
LABEL_19:

  return v17;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  int v6 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158211;
    int v15 = 50;
    __int16 v16 = 2080;
    BOOL v17 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
    __int16 v18 = 2113;
    id v19 = v5;
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
      *(_DWORD *)buf = 68158211;
      int v15 = 50;
      __int16 v16 = 2080;
      BOOL v17 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
      __int16 v18 = 2113;
      id v19 = v5;
      _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v6;
  id v13 = v5;
  [MEMORY[0x189603F18] arrayWithObjects:&v13 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = +[DIHelpers executeWithPath:arguments:error:]( &OBJC_CLASS___DIHelpers,  "executeWithPath:arguments:error:",  @"/sbin/umount",  v10,  a4);

  return v11;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  return 0LL;
}

@end