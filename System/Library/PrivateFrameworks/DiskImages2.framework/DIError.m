@interface DIError
+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5;
+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4;
+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (BOOL)mandatoryArgumentFailWithError:(id *)a3;
+ (NSBundle)frameworkBundle;
+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3;
+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7;
+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4;
+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4;
+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5;
+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5;
@end

@implementation DIError

+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3
{
  switch(a3)
  {
    case 160LL:
      id result = @"The disk image format is obsolete. Please convert it to a new format using Disk Utility";
      break;
    case 161LL:
      id result = @"The disk image format is not supported by this OS";
      break;
    case 162LL:
    case 163LL:
    case 164LL:
      goto LABEL_5;
    case 165LL:
      id result = @"Failed to mount filesystems";
      break;
    case 166LL:
      id result = @"Corrupted shadow file(s) chain";
      break;
    default:
      if (a3 == 152)
      {
        id result = @"The disk image is corrupted";
      }

      else
      {
LABEL_5:
        objc_msgSend( NSString,  "stringWithFormat:",  @"Disk image operation failed with error code %d",  a3);
        id result = (id)objc_claimAutoreleasedReturnValue();
      }

      break;
  }

  return result;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  [MEMORY[0x189603FC8] dictionary];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v11 isEqualToString:*MEMORY[0x189607688]];
  if (a4 >= 0) {
    int64_t v16 = a4;
  }
  else {
    int64_t v16 = -a4;
  }
  if (v15) {
    int64_t v17 = v16;
  }
  else {
    int64_t v17 = a4;
  }
  if (!v12)
  {
    if ([v11 isEqualToString:@"com.apple.DiskImages2.ErrorDomain"]) {
      id v12 = +[DIError copyDefaultLocalizedStringForDIErrorCode:]( &OBJC_CLASS___DIError,  "copyDefaultLocalizedStringForDIErrorCode:",  v17);
    }
    else {
      id v12 = 0LL;
    }
  }

  objc_msgSend(NSString, "stringWithFormat:", @"(err code %d)", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x1896075E0]];
    if (v13)
    {
      int v19 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158722;
          int v37 = 62;
          __int16 v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v40 = 2114;
          id v41 = v12;
          __int16 v42 = 2114;
          id v43 = v13;
          __int16 v44 = 2114;
          v45 = v18;
          _os_log_impl(&dword_188046000, v26, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ - %{public}@ %{public}@", buf, 0x30u);
        }

        goto LABEL_33;
      }

      getDIOSLog();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158722;
      int v37 = 62;
      __int16 v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v40 = 2114;
      id v41 = v12;
      __int16 v42 = 2114;
      id v43 = v13;
      __int16 v44 = 2114;
      v45 = v18;
      LODWORD(v35) = 48;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21) {
        goto LABEL_19;
      }
      goto LABEL_33;
    }

    int v23 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        int v37 = 62;
        __int16 v38 = 2080;
        v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        __int16 v40 = 2114;
        id v41 = v12;
        __int16 v42 = 2114;
        id v43 = v18;
        _os_log_impl(&dword_188046000, v29, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
      }

      goto LABEL_41;
    }

    getDIOSLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68158466;
    int v37 = 62;
    __int16 v38 = 2080;
    v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    __int16 v40 = 2114;
    id v41 = v12;
    __int16 v42 = 2114;
    id v43 = v18;
    LODWORD(v35) = 38;
    v34 = buf;
    v25 = (char *)_os_log_send_and_compose_impl();

    if (v25) {
      goto LABEL_29;
    }
  }

  else
  {
    if (v13)
    {
      int v19 = *__error();
      if (!DIForwardLogs())
      {
        getDIOSLog();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          int v37 = 62;
          __int16 v38 = 2080;
          v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v40 = 2114;
          id v41 = v13;
          __int16 v42 = 2114;
          id v43 = v18;
          _os_log_impl(&dword_188046000, v28, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
        }

        goto LABEL_33;
      }

      getDIOSLog();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158466;
      int v37 = 62;
      __int16 v38 = 2080;
      v39 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v40 = 2114;
      id v41 = v13;
      __int16 v42 = 2114;
      id v43 = v18;
      LODWORD(v35) = 38;
      v34 = buf;
      v21 = (char *)_os_log_send_and_compose_impl();

      if (v21)
      {
LABEL_19:
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v21);
        free(v21);
      }

+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  a3,  a4,  0LL,  a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  a3,  0LL,  a4,  a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  a3,  0LL,  0LL,  a4);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  a3,  a4,  0LL,  a5);
  return 0LL;
}

+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  a3,  0LL,  a4,  a5);
  return 0LL;
}

+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607670],  a3,  a4,  0LL,  a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607670],  a3,  0LL,  a4,  a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607670],  a3,  0LL,  a4,  a5);
  return 0LL;
}

+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  @"com.apple.DiskImages2.ErrorDomain",  a3,  a4,  0LL,  a5);
  return 0;
}

+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  @"com.apple.DiskImages2.ErrorDomain",  a3,  0LL,  a4,  a5);
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  @"com.apple.DiskImages2.ErrorDomain",  a3,  a4,  0LL,  a5);
  return 0LL;
}

+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  @"com.apple.DiskImages2.ErrorDomain",  a3,  0LL,  a4,  a5);
  return 0LL;
}

+ (BOOL)mandatoryArgumentFailWithError:(id *)a3
{
  id v3 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  *MEMORY[0x189607688],  22LL,  0LL,  @"A mandatory argument is null in a DiskImages2 API call. Remember to check if init succeeded",  a3);
  return 0;
}

+ (NSBundle)frameworkBundle
{
  if (+[DIError frameworkBundle]::onceToken != -1) {
    dispatch_once(&+[DIError frameworkBundle]::onceToken, &__block_literal_global_0);
  }
  return (NSBundle *)(id)+[DIError frameworkBundle]::_bundle;
}

void __26__DIError_frameworkBundle__block_invoke()
{
  v0 = (void *)MEMORY[0x1896077F8];
  [MEMORY[0x189604030] fileURLWithPath:@"/System/Library/PrivateFrameworks/DiskImages2.framework"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "bundleWithURL:");
  v2 = (void *)+[DIError frameworkBundle]::_bundle;
  +[DIError frameworkBundle]::_bundle = v1;
}

+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  int v11 = *((_DWORD *)a3 + 2);
  if (v11 >= 0) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = -v11;
  }
  id v13 = (__CFString *)*MEMORY[0x189607688];
  v14 = v13;
  int v15 = (void *)NSString;
  uint64_t v16 = (*(uint64_t (**)(const void *))(*(void *)a3 + 16LL))(a3);
  if (v10) {
    [v15 stringWithFormat:@"%@: %s", v10, v16];
  }
  else {
    [v15 stringWithUTF8String:v16];
  }
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  v14,  v12,  v9,  v17,  a6);
  return v18;
}

+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDIException:description:prefix:error:]( &OBJC_CLASS___DIError,  "errorWithDIException:description:prefix:error:",  a3,  a4,  0LL,  a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDIException:description:prefix:error:]( &OBJC_CLASS___DIError,  "errorWithDIException:description:prefix:error:",  a3,  a4,  0LL,  a5);
  return 0LL;
}

+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDIException:description:prefix:error:]( &OBJC_CLASS___DIError,  "errorWithDIException:description:prefix:error:",  a3,  0LL,  a4,  a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDIException:description:prefix:error:]( &OBJC_CLASS___DIError,  "errorWithDIException:description:prefix:error:",  a3,  0LL,  a4,  a5);
  return 0LL;
}

@end