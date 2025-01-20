@interface LACError
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4;
+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 debugDescription:(id)a5;
+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 userInfo:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 debugDescription:(id)a5;
+ (id)missingEntitlementError:(id)a3;
@end

@implementation LACError

+ (id)missingEntitlementError:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 errorWithCode:-1007 debugDescription:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 _errorWithCode:a3 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  v10 = @"Subcode";
  [MEMORY[0x189607968] numberWithInteger:a4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _errorWithCode:a3 userInfo:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 debugDescription:(id)a5
{
  v15[2] = *MEMORY[0x1895F89C0];
  v14[0] = @"Subcode";
  v8 = (void *)MEMORY[0x189607968];
  id v9 = a5;
  [v8 numberWithInteger:a4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = *MEMORY[0x189607490];
  v15[0] = v10;
  v15[1] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 userInfo:(id)a5
{
  if (a5) {
    id v8 = a5;
  }
  else {
    id v8 = (id)MEMORY[0x189604A60];
  }
  id v9 = (void *)[v8 mutableCopy];
  [MEMORY[0x189607968] numberWithInteger:a4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v10 forKeyedSubscript:@"Subcode"];

  [a1 _errorWithCode:a3 userInfo:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = *MEMORY[0x189607490];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x189603F68];
  id v7 = a4;
  [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = *MEMORY[0x1896075E0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x189603F68];
  id v7 = a4;
  [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5
{
  v16[2] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x189607798];
  v15[0] = *MEMORY[0x1896075E0];
  v15[1] = v8;
  v16[0] = a4;
  v16[1] = a5;
  id v9 = (void *)MEMORY[0x189603F68];
  id v10 = a5;
  id v11 = a4;
  [v9 dictionaryWithObjects:v16 forKeys:v15 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v11 = *MEMORY[0x189607798];
    v12[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 _errorWithCode:a3 userInfo:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [a1 errorWithCode:a3];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 debugDescription:(id)a5
{
  v16[2] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x189607798];
  v15[0] = *MEMORY[0x189607490];
  v15[1] = v8;
  v16[0] = a5;
  v16[1] = a4;
  id v9 = (void *)MEMORY[0x189603F68];
  id v10 = a5;
  id v11 = a4;
  [v9 dictionaryWithObjects:v16 forKeys:v15 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4
{
  return [a1 error:a3 hasCode:a4 subcode:0];
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5
{
  id v7 = a3;
  [v7 domain];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 isEqualToString:@"com.apple.LocalAuthentication"];

  if (v9 && [v7 code] == a4)
  {
    [v7 userInfo];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"Subcode"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11) {
      uint64_t v12 = [v11 integerValue];
    }
    else {
      uint64_t v12 = 0LL;
    }
    BOOL v13 = v12 == a5;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x189607870] errorWithDomain:@"com.apple.LocalAuthentication" code:a3 userInfo:a4];
}

@end