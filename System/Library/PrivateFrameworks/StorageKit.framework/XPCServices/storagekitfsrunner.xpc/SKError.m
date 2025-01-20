@interface SKError
+ (BOOL)failWithError:(id)a3 error:(id *)a4;
+ (BOOL)failWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithOSStatus:(int)a3 error:(id *)a4;
+ (BOOL)failWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4;
+ (BOOL)failWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4;
+ (NSBundle)frameworkBundle;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithOSStatus:(int)a3 error:(id *)a4;
+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4;
+ (id)localizedDescriptionForCode:(int64_t)a3;
+ (id)nilWithError:(id)a3 error:(id *)a4;
+ (id)nilWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithOSStatus:(int)a3 error:(id *)a4;
+ (id)nilWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithPOSIXCode:(int)a3 error:(id *)a4;
+ (id)nilWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5;
+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4;
@end

@implementation SKError

+ (NSBundle)frameworkBundle
{
  if (qword_10000DBE8 != -1) {
    dispatch_once(&qword_10000DBE8, &stru_100008320);
  }
  return (NSBundle *)(id)qword_10000DBE0;
}

+ (id)localizedDescriptionForCode:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v4 value:0 table:@"SKError"]);

  id v7 = 0LL;
  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", a3, 0LL, a4);
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  NSErrorUserInfoKey v9 = NSDebugDescriptionErrorKey;
  id v10 = a4;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  a3,  0LL,  v6));

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
  id v12 = a4;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  NSErrorUserInfoKey v9 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  a3,  0LL,  v8));

  if (a5) {
    *a5 = v9;
  }
  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
  id v10 = a4;
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v6));

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = v9;
    id v11 = [v9 mutableCopy];
  }

  else
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:NSLocalizedDescriptionKey]);

  if (!v12)
  {
    if (v8)
    {
      id v13 = SKGetOSLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescriptionForCode:a3]);
        *(_DWORD *)buf = 136315650;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v15;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: %@ : %@", buf, 0x20u);
      }

      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 localizedDescriptionForCode:a3]);
      v17 = commaSeparatedDiskListFromArray(v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ : %@",  v16,  v18));
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescriptionForCode:a3]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);

      id v23 = SKGetOSLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      BOOL v24 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v22)
      {
        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);
          *(_DWORD *)buf = 136315650;
          v27 = "+[SKError errorWithCode:disks:userInfo:]";
          __int16 v28 = 2112;
          v29 = v19;
          __int16 v30 = 2112;
          id v31 = v25;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: %@ [%@]", buf, 0x20u);
        }
      }

      else if (v24)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

    if (v19) {
      [v11 setObject:v19 forKey:NSLocalizedDescriptionKey];
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.StorageKit",  a3,  v11));

  return v20;
}

+ (id)nilWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = SKGetOSLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0LL;
}

+ (BOOL)failWithError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = SKGetOSLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v7 = sub_1000034B0(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v6,  v8));

  id v10 = SKGetOSLog();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  if (a5) {
    *a5 = v9;
  }
  return v9;
}

+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4
{
  return [(id)objc_opt_class(a1) errorWithPOSIXCode:*(void *)&a3 debugDescription:0 error:a4];
}

+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = v7;
  if ((a3 - 49152) > 0x6A)
  {
    NSErrorDomain v9 = NSOSStatusErrorDomain;
    uint64_t v10 = a3;
  }

  else
  {
    NSErrorDomain v9 = NSPOSIXErrorDomain;
    uint64_t v10 = a3 & 0xFFFF3FFF;
  }

  id v11 = sub_1000034B0(v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  v10,  v12));

  id v14 = SKGetOSLog();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);
  }

  if (a5) {
    *a5 = v13;
  }

  return v13;
}

+ (id)errorWithOSStatus:(int)a3 error:(id *)a4
{
  return [(id)objc_opt_class(a1) errorWithOSStatus:*(void *)&a3 debugDescription:0 error:a4];
}

+ (id)nilWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithPOSIXCode:error:](&OBJC_CLASS___SKError, "errorWithPOSIXCode:error:", *(void *)&a3, a4);
  return 0LL;
}

+ (id)nilWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 =  +[SKError errorWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithPOSIXCode:debugDescription:error:",  *(void *)&a3,  a4,  a5);
  return 0LL;
}

+ (id)nilWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 =  +[SKError errorWithOSStatus:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithOSStatus:debugDescription:error:",  *(void *)&a3,  a4,  a5);
  return 0LL;
}

+ (id)nilWithOSStatus:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithOSStatus:error:](&OBJC_CLASS___SKError, "errorWithOSStatus:error:", *(void *)&a3, a4);
  return 0LL;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = sub_1000034B0(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSErrorDomain v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v9, a5));

  return v10;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, 0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v5, a4));

  return v6;
}

+ (BOOL)failWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 =  +[SKError errorWithPOSIXCode:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithPOSIXCode:debugDescription:error:",  *(void *)&a3,  a4,  a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithPOSIXCode:error:](&OBJC_CLASS___SKError, "errorWithPOSIXCode:error:", *(void *)&a3, a4);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v5 =  +[SKError errorWithOSStatus:debugDescription:error:]( &OBJC_CLASS___SKError,  "errorWithOSStatus:debugDescription:error:",  *(void *)&a3,  a4,  a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 error:(id *)a4
{
  id v4 = +[SKError errorWithOSStatus:error:](&OBJC_CLASS___SKError, "errorWithOSStatus:error:", *(void *)&a3, a4);
  return 0;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  id v7 = sub_1000034B0(a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSErrorDomain v9 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v8));
  LOBYTE(a5) = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v9, a5);

  return (char)a5;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, 0LL));
  LOBYTE(a4) = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v5, a4);

  return (char)a4;
}

@end