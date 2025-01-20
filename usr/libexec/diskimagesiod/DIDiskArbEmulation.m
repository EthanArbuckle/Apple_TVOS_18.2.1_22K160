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
  id v5 = a3;
  int v6 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v30 = 0LL;
    uint64_t v7 = sub_1000B85DC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v32 = 45;
    __int16 v33 = 2080;
    v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    __int16 v35 = 2112;
    id v36 = v5;
    v10 = (char *)_os_log_send_and_compose_impl( v9,  &v30,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Ejecting %@",  buf,  28);

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
      int v32 = 45;
      __int16 v33 = 2080;
      v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }
  }

  *__error() = v6;
  id v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v5));
  int v14 = open((const char *)[v13 fileSystemRepresentation], 0);
  if (v14 < 0)
  {
    uint64_t v19 = *__error();
    v18 = @"Failed to eject - cannot open device";
    goto LABEL_14;
  }

  int v15 = v14;
  int v16 = ioctl(v14, 0x20006415uLL, 0LL);
  uint64_t v17 = *__error();
  close(v15);
  if (v16)
  {
    v18 = @"Failed to eject";
    uint64_t v19 = v17;
LABEL_14:
    BOOL v20 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v19,  v18,  a4);
    goto LABEL_25;
  }

  close(v15);
  int v21 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v30 = 0LL;
    uint64_t v22 = sub_1000B85DC();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = 3LL;
    }
    else {
      uint64_t v24 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v32 = 45;
    __int16 v33 = 2080;
    v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    __int16 v35 = 2112;
    id v36 = v5;
    LODWORD(v29) = 28;
    v25 = (char *)_os_log_send_and_compose_impl( v24,  &v30,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "%.*s: %@ ejected successfully",  buf,  v29);

    if (v25)
    {
      fprintf(__stderrp, "%s\n", v25);
      free(v25);
    }
  }

  else
  {
    uint64_t v26 = sub_1000B85DC();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v32 = 45;
      __int16 v33 = 2080;
      v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      __int16 v35 = 2112;
      id v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
    }
  }

  *__error() = v21;
  BOOL v20 = 1;
LABEL_25:

  return v20;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v17 = 0LL;
    uint64_t v7 = sub_1000B85DC();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    *(_DWORD *)buf = 68158211;
    int v20 = 50;
    __int16 v21 = 2080;
    uint64_t v22 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
    __int16 v23 = 2113;
    id v24 = v5;
    int v16 = 28;
    v10 = (char *)_os_log_send_and_compose_impl( v9,  &v17,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Ejecting %{private}@",  buf,  v16);

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
      *(_DWORD *)buf = 68158211;
      int v20 = 50;
      __int16 v21 = 2080;
      uint64_t v22 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
      __int16 v23 = 2113;
      id v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %{private}@", buf, 0x1Cu);
    }
  }

  *__error() = v6;
  id v18 = v5;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  BOOL v14 = +[DIHelpers executeWithPath:arguments:error:]( &OBJC_CLASS___DIHelpers,  "executeWithPath:arguments:error:",  @"/sbin/umount",  v13,  a4);

  return v14;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  return 0LL;
}

@end