@interface DICommonAttach
+ (BOOL)DI1_attachWithDictionary:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)DI2_attachWithParams:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)defaultDiskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)diskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5;
+ (BOOL)diskImageAttach:(id)a3 readOnly:(BOOL)a4 autoMount:(BOOL)a5 BSDName:(id *)a6 error:(id *)a7;
@end

@implementation DICommonAttach

+ (BOOL)DI2_attachWithParams:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  int v8 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v27 = 0LL;
    getDIOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v29 = 53;
    __int16 v30 = 2080;
    v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
    LODWORD(v25) = 18;
    v24 = buf;
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
      *(_DWORD *)buf = 68157954;
      int v29 = 53;
      __int16 v30 = 2080;
      v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
      _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }

  LOBYTE(v12) = 0;
  *__error() = v8;
  if (v7 && a4 && a5)
  {
    [v7 inputURL];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 pathExtension];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 isEqualToString:@"sparseimage"];

    if (v15)
    {
      LOBYTE(v12) = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Sparse images are not supported by DI2",  a5);
    }

    else
    {
      id v26 = 0LL;
      BOOL v12 = +[DiskImages2 attachWithParams:handle:error:]( &OBJC_CLASS___DiskImages2,  "attachWithParams:handle:error:",  v7,  &v26,  a5);
      id v16 = v26;
      if (v12)
      {
        int v17 = *__error();
        if (DIForwardLogs())
        {
          uint64_t v27 = 0LL;
          getDIOSLog();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v16, "BSDName", v24, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158210;
          int v29 = 53;
          __int16 v30 = 2080;
          v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
          __int16 v32 = 2114;
          v33 = v19;
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
            [v16 BSDName];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158210;
            int v29 = 53;
            __int16 v30 = 2080;
            v31 = "+[DICommonAttach DI2_attachWithParams:BSDName:error:]";
            __int16 v32 = 2114;
            v33 = v22;
            _os_log_impl( &dword_188046000,  v21,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk image attached (with DI2) as %{public}@",  buf,  0x1Cu);
          }
        }

        *__error() = v17;
        [v16 BSDName];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v12;
}

+ (BOOL)DI1_attachWithDictionary:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v8 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v15 = 57;
    __int16 v16 = 2080;
    int v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
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
      *(_DWORD *)buf = 68157954;
      int v15 = 57;
      __int16 v16 = 2080;
      int v17 = "+[DICommonAttach DI1_attachWithDictionary:BSDName:error:]";
      _os_log_impl(&dword_188046000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }

  BOOL v12 = __error();
  BOOL result = 0;
  *BOOL v12 = v8;
  if (a3 && a4)
  {
    if (a5) {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Attach with legacy DiskImages framework is not supported on embedded platforms",  a5);
    }
  }

  return result;
}

+ (BOOL)defaultDiskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  if (a3) {
    return [a1 diskImageAttach:a3 readOnly:0 autoMount:1 BSDName:a4 error:a5];
  }
  else {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"nil URL specified",  a5);
  }
}

+ (BOOL)diskImageAttach:(id)a3 readOnly:(BOOL)a4 autoMount:(BOOL)a5 BSDName:(id *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  if (v12)
  {
    int v13 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v42 = 0LL;
      getDIOSLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      [v12 path];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      int v44 = 67;
      __int16 v45 = 2080;
      v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
      __int16 v47 = 2113;
      v48 = v15;
      LODWORD(v36) = 28;
      v35 = buf;
      __int16 v16 = (char *)_os_log_send_and_compose_impl();

      if (v16)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v16);
        free(v16);
      }
    }

    else
    {
      getDIOSLog();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        [v12 path];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        int v44 = 67;
        __int16 v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        __int16 v47 = 2113;
        v48 = v19;
        _os_log_impl(&dword_188046000, v18, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
      }
    }

    v20 = __error();
    int *v20 = v13;
    v22 = (void *)MEMORY[0x1895BC8C0](v20, v21);
    id v41 = 0LL;
    v23 = -[DIAttachParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DIAttachParams),  "initWithURL:error:",  v12,  &v41);
    id v24 = v41;
    id v25 = v24;
    if (v23)
    {
      -[DIAttachParams setAutoMount:](v23, "setAutoMount:", v9);
      if (v10) {
        uint64_t v26 = 2LL;
      }
      else {
        uint64_t v26 = 1LL;
      }
      -[DIAttachParams setFileMode:](v23, "setFileMode:", v26, v35, v36);
      id v39 = v25;
      id v40 = 0LL;
      char v17 = [a1 diskImageAttach:v23 BSDName:&v40 error:&v39];
      id v27 = v40;
      id v28 = v39;

      id v25 = v28;
    }

    else if ([v24 code] == 45)
    {

      int v29 = *__error();
      if (DIForwardLogs())
      {
        uint64_t v42 = 0LL;
        getDIOSLog();
        __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v44 = 67;
        __int16 v45 = 2080;
        v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
        v31 = (char *)_os_log_send_and_compose_impl();

        if (v31)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v31);
          free(v31);
        }
      }

      else
      {
        getDIOSLog();
        __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v44 = 67;
          __int16 v45 = 2080;
          v46 = "+[DICommonAttach diskImageAttach:readOnly:autoMount:BSDName:error:]";
          _os_log_impl(&dword_188046000, v32, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }
      }

      *__error() = v29;
      id v37 = 0LL;
      id v38 = 0LL;
      char v17 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", MEMORY[0x189604A60], &v38, &v37);
      id v27 = v38;
      id v25 = v37;
    }

    else
    {
      char v17 = 0;
      id v27 = 0LL;
    }

    objc_autoreleasePoolPop(v22);
    if (a7 && (v33 = v25) != 0LL || a6 && (v33 = v27, a7 = a6, !v25)) {
      *a7 = v33;
    }
  }

  else
  {
    char v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"nil URL specified",  a7);
  }

  return v17;
}

+ (BOOL)diskImageAttach:(id)a3 BSDName:(id *)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (v8)
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v38 = 0LL;
      getDIOSLog();
      BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      [v8 inputURL];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 path];
      *(_DWORD *)buf = 68158211;
      int v40 = 48;
      __int16 v41 = 2080;
      uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
      __int16 v43 = 2113;
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      getDIOSLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        [v8 inputURL];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 path];
        __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        int v40 = 48;
        __int16 v41 = 2080;
        uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        __int16 v43 = 2113;
        id v44 = v16;
        _os_log_impl(&dword_188046000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);
      }
    }

    char v17 = __error();
    *char v17 = v9;
    v19 = (void *)MEMORY[0x1895BC8C0](v17, v18);
    id v36 = 0LL;
    id v37 = 0LL;
    char v20 = objc_msgSend(a1, "DI2_attachWithParams:BSDName:error:", v8, &v37, &v36);
    id v21 = v37;
    id v22 = v36;
    id v23 = v22;
    if ((v20 & 1) != 0)
    {
      char v13 = 1;
    }

    else if ([v22 code] == 45 || objc_msgSend(v23, "code") == 35)
    {

      int v24 = *__error();
      if (DIForwardLogs())
      {
        uint64_t v38 = 0LL;
        getDIOSLog();
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v40 = 48;
        __int16 v41 = 2080;
        uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
        uint64_t v26 = (char *)_os_log_send_and_compose_impl();

        if (v26)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v26);
          free(v26);
        }
      }

      else
      {
        getDIOSLog();
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v40 = 48;
          __int16 v41 = 2080;
          uint64_t v42 = "+[DICommonAttach diskImageAttach:BSDName:error:]";
          _os_log_impl(&dword_188046000, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Falling back to attach with di1", buf, 0x12u);
        }
      }

      *__error() = v24;
      id v35 = 0LL;
      [v8 toDI1ParamsWithError:&v35];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      id v29 = v35;
      id v33 = v29;
      id v34 = v21;
      char v13 = objc_msgSend(a1, "DI1_attachWithDictionary:BSDName:error:", v28, &v34, &v33);
      id v30 = v34;

      id v23 = v33;
      id v21 = v30;
    }

    else
    {
      char v13 = 0;
    }

    objc_autoreleasePoolPop(v19);
    if (a5 && (v31 = v23) != 0LL || a4 && (v31 = v21, a5 = a4, !v23)) {
      *a5 = v31;
    }
  }

  else
  {
    char v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"nil params specified",  a5);
  }

  return v13;
}

@end