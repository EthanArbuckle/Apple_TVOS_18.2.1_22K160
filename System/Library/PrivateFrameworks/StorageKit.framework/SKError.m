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
  if (frameworkBundle_onceToken != -1) {
    dispatch_once(&frameworkBundle_onceToken, &__block_literal_global_9);
  }
  return (NSBundle *)(id)frameworkBundle__bundle;
}

void __26__SKError_frameworkBundle__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x1896077F8];
  [MEMORY[0x189604030] fileURLWithPath:@"/System/Library/PrivateFrameworks/StorageKit.framework"];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 bundleWithURL:v1];
  v3 = (void *)frameworkBundle__bundle;
  frameworkBundle__bundle = v2;

  if (!frameworkBundle__bundle)
  {
    v4 = +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    [v4 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_20];

    SKGetOSLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      v7 = "+[SKError frameworkBundle]_block_invoke";
      _os_log_impl( &dword_188F75000,  v5,  OS_LOG_TYPE_FAULT,  "%s: FATAL ERROR: Failed to get the NSBundle of StorageKit framework",  (uint8_t *)&v6,  0xCu);
    }
  }

id __26__SKError_frameworkBundle__block_invoke_2()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKError.m", 55LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)localizedDescriptionForCode:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896077F8] bundleForClass:a1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 localizedStringForKey:v4 value:0 table:@"SKError"];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = 0LL;
  if (([v6 isEqualToString:v4] & 1) == 0) {
    id v7 = v6;
  }

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", a3, 0LL, a4);
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x189607490];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x189603F68];
  id v6 = a4;
  [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", a3, 0LL, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v12 = *MEMORY[0x189607490];
  v13[0] = a4;
  id v7 = (void *)MEMORY[0x189603F68];
  id v8 = a4;
  [v7 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:disks:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:disks:userInfo:", a3, 0LL, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5) {
    *a5 = v10;
  }
  return v10;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v10 = *MEMORY[0x189607798];
  v11[0] = a4;
  v5 = (void *)MEMORY[0x189603F68];
  id v6 = a4;
  [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 disks:(id)a4 userInfo:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = (void *)[v9 mutableCopy];
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v12 = *MEMORY[0x1896075E0];
  [v11 objectForKey:*MEMORY[0x1896075E0]];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (v8)
    {
      SKGetOSLog();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [a1 localizedDescriptionForCode:a3];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v15;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_188F75000, v14, OS_LOG_TYPE_ERROR, "%s: %@ : %@", buf, 0x20u);
      }

      v16 = (void *)NSString;
      [a1 localizedDescriptionForCode:a3];
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      commaSeparatedDiskListFromArray(v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 stringWithFormat:@"%@ : %@", v17, v18];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [a1 localizedDescriptionForCode:a3];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = *MEMORY[0x189607490];
      [v11 objectForKeyedSubscript:*MEMORY[0x189607490]];
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      SKGetOSLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v23)
      {
        if (v24)
        {
          [v11 objectForKeyedSubscript:v22];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v27 = "+[SKError errorWithCode:disks:userInfo:]";
          __int16 v28 = 2112;
          v29 = v19;
          __int16 v30 = 2112;
          id v31 = v25;
          _os_log_impl(&dword_188F75000, v17, OS_LOG_TYPE_ERROR, "%s: %@ [%@]", buf, 0x20u);
        }
      }

      else if (v24)
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[SKError errorWithCode:disks:userInfo:]";
        __int16 v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_188F75000, v17, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

    if (v19) {
      [v11 setObject:v19 forKey:v12];
    }
  }

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.StorageKit" code:a3 userInfo:v11];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)nilWithError:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  SKGetOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_188F75000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0LL;
}

+ (BOOL)failWithError:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  SKGetOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_188F75000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
  }

  if (a4) {
    *a4 = v5;
  }

  return 0;
}

+ (id)errorWithPOSIXCode:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *MEMORY[0x189607688];
  uint64_t v8 = a3;
  userInfoWithDebugDescription(a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 errorWithDomain:v7 code:v8 userInfo:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  if (a5) {
    *a5 = v10;
  }
  return v10;
}

+ (id)errorWithPOSIXCode:(int)a3 error:(id *)a4
{
  return (id)[(id)objc_opt_class() errorWithPOSIXCode:*(void *)&a3 debugDescription:0 error:a4];
}

+ (id)errorWithOSStatus:(int)a3 debugDescription:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = (void *)MEMORY[0x189607870];
  if ((a3 - 49152) > 0x6A)
  {
    uint64_t v10 = *MEMORY[0x189607670];
    uint64_t v11 = a3;
  }

  else
  {
    uint64_t v10 = *MEMORY[0x189607688];
    uint64_t v11 = a3 & 0xFFFF3FFF;
  }

  userInfoWithDebugDescription(v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 errorWithDomain:v10 code:v11 userInfo:v12];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_188F75000, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
  }

  if (a5) {
    *a5 = v13;
  }

  return v13;
}

+ (id)errorWithOSStatus:(int)a3 error:(id *)a4
{
  return (id)[(id)objc_opt_class() errorWithOSStatus:*(void *)&a3 debugDescription:0 error:a4];
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v8, a5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)nilWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v5, a4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

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
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", a3, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v8, a5);

  return (char)a5;
}

+ (BOOL)failWithSKErrorCode:(int64_t)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[SKError failWithError:error:](&OBJC_CLASS___SKError, "failWithError:error:", v5, a4);

  return (char)a4;
}

@end