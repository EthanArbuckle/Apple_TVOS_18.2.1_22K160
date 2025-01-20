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
      if (a3 == 152) {
        id result = @"The disk image is corrupted";
      }
      else {
LABEL_5:
      }
        id result = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Disk image operation failed with error code %d",  a3));
      break;
  }

  return result;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v15 = [v11 isEqualToString:NSPOSIXErrorDomain];
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

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(err code %d)",  v17));
  if (v12)
  {
    [v14 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];
    if (v13)
    {
      int v19 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v32 = sub_1000B85DC();
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158722;
          int v48 = 62;
          __int16 v49 = 2080;
          v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v51 = 2114;
          id v52 = v12;
          __int16 v53 = 2114;
          id v54 = v13;
          __int16 v55 = 2114;
          v56 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%.*s: %{public}@ - %{public}@ %{public}@",  buf,  0x30u);
        }

        goto LABEL_45;
      }

      uint64_t v46 = 0LL;
      uint64_t v20 = sub_1000B85DC();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 68158722;
      int v48 = 62;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        uint64_t v22 = 3LL;
      }
      else {
        uint64_t v22 = 2LL;
      }
      __int16 v49 = 2080;
      v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v51 = 2114;
      id v52 = v12;
      __int16 v53 = 2114;
      id v54 = v13;
      __int16 v55 = 2114;
      v56 = v18;
      v23 = (char *)_os_log_send_and_compose_impl( v22,  &v46,  0LL,  0LL,  &_mh_execute_header,  v21,  16LL,  "%.*s: %{public}@ - %{public}@ %{public}@",  buf,  48);

      if (v23) {
        goto LABEL_25;
      }
      goto LABEL_45;
    }

    int v27 = *__error();
    if (!sub_1000B8654())
    {
      uint64_t v39 = sub_1000B85DC();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        int v48 = 62;
        __int16 v49 = 2080;
        v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        __int16 v51 = 2114;
        id v52 = v12;
        __int16 v53 = 2114;
        id v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
      }

      goto LABEL_53;
    }

    uint64_t v46 = 0LL;
    uint64_t v28 = sub_1000B85DC();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 68158466;
    int v48 = 62;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      uint64_t v30 = 3LL;
    }
    else {
      uint64_t v30 = 2LL;
    }
    __int16 v49 = 2080;
    v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    __int16 v51 = 2114;
    id v52 = v12;
    __int16 v53 = 2114;
    id v54 = v18;
    v31 = (char *)_os_log_send_and_compose_impl( v30,  &v46,  0LL,  0LL,  &_mh_execute_header,  v29,  16LL,  "%.*s: %{public}@ %{public}@",  buf,  38);

    if (v31) {
      goto LABEL_41;
    }
  }

  else
  {
    if (v13)
    {
      int v19 = *__error();
      if (!sub_1000B8654())
      {
        uint64_t v37 = sub_1000B85DC();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          int v48 = 62;
          __int16 v49 = 2080;
          v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          __int16 v51 = 2114;
          id v52 = v13;
          __int16 v53 = 2114;
          id v54 = v18;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
        }

        goto LABEL_45;
      }

      uint64_t v46 = 0LL;
      uint64_t v24 = sub_1000B85DC();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 68158466;
      int v48 = 62;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        uint64_t v26 = 3LL;
      }
      else {
        uint64_t v26 = 2LL;
      }
      __int16 v49 = 2080;
      v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      __int16 v51 = 2114;
      id v52 = v13;
      __int16 v53 = 2114;
      id v54 = v18;
      v23 = (char *)_os_log_send_and_compose_impl( v26,  &v46,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%.*s: %{public}@ %{public}@",  buf,  38);

      if (v23)
      {
LABEL_25:
        fprintf(__stderrp, "%s\n", v23);
        free(v23);
      }

+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  0LL,  a4,  0LL));
}

+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  a4,  0LL,  a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  0LL,  a4,  a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  0LL,  0LL,  a4);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  a4,  0LL,  a5);
  return 0LL;
}

+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  a3,  0LL,  a4,  a5);
  return 0LL;
}

+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSOSStatusErrorDomain,  a3,  a4,  0LL,  a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSOSStatusErrorDomain,  a3,  0LL,  a4,  a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSOSStatusErrorDomain,  a3,  0LL,  a4,  a5);
  return 0LL;
}

+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue( +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  @"com.apple.DiskImages2.ErrorDomain",  a3,  0LL,  a4,  0LL));
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
  id v3 =  +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  NSPOSIXErrorDomain,  22LL,  0LL,  @"A mandatory argument is null in a DiskImages2 API call. Remember to check if init succeeded",  a3);
  return 0;
}

+ (NSBundle)frameworkBundle
{
  if (qword_100198F78 != -1) {
    dispatch_once(&qword_100198F78, &stru_10016C190);
  }
  return (NSBundle *)(id)qword_100198F70;
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
  id v13 = (__CFString *)NSPOSIXErrorDomain;
  v14 = v13;
  uint64_t v15 = (*(uint64_t (**)(const void *))(*(void *)a3 + 16LL))(a3);
  if (v10) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %s", v10, v15));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
  }
  int64_t v17 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithDomain:code:description:verboseInfo:error:]( &OBJC_CLASS___DIError,  "errorWithDomain:code:description:verboseInfo:error:",  v14,  v12,  v9,  v16,  a6));

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