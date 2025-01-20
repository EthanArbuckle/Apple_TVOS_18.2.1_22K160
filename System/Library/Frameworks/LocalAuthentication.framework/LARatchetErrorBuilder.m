@interface LARatchetErrorBuilder
+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4;
+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)beforeFirstUnlockWithUserInfo:(id)a3;
+ (id)biometryNotEnrolledWithUserInfo:(id)a3;
+ (id)deviceTypeNotSupportedWithUserInfo:(id)a3;
+ (id)errorNotArmedWithRatchetState:(id)a3;
+ (id)genericErrorWithDebugDescription:(id)a3;
+ (id)genericErrorWithUnderlyingError:(id)a3;
+ (id)notInteractiveErrorWithUserInfo:(id)a3;
+ (id)passcodeNotSetWithUserInfo:(id)a3;
+ (id)ratchetErrorWithError:(id)a3;
+ (id)userCustomCancelErrorWithUserInfo:(id)a3;
@end

@implementation LARatchetErrorBuilder

+ (id)errorNotArmedWithRatchetState:(id)a3
{
  v11[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[LARatchetState initWithState:](objc_alloc(&OBJC_CLASS___LARatchetState), "initWithState:", v4);

  uint64_t v6 = *MEMORY[0x189607490];
  v10[0] = @"RatchetState";
  v10[1] = v6;
  v11[0] = v5;
  v11[1] = @"Ratchet not ready";
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 _errorWithCode:0 userInfo:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)genericErrorWithDebugDescription:(id)a3
{
  return (id)[a1 _errorWithCode:1 debugDescription:a3];
}

+ (id)genericErrorWithUnderlyingError:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = *MEMORY[0x189607798];
  v10[0] = a3;
  id v4 = (void *)MEMORY[0x189603F68];
  id v5 = a3;
  [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:1 userInfo:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)notInteractiveErrorWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:2 userInfo:a3];
}

+ (id)userCustomCancelErrorWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:3 userInfo:a3];
}

+ (id)passcodeNotSetWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:4 userInfo:a3];
}

+ (id)biometryNotEnrolledWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:5 userInfo:a3];
}

+ (id)beforeFirstUnlockWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:6 userInfo:a3];
}

+ (id)deviceTypeNotSupportedWithUserInfo:(id)a3
{
  return (id)[a1 _errorWithCode:7 userInfo:a3];
}

+ (id)ratchetErrorWithError:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x189608798] error:v4 hasCode:-1 subcode:6])
  {
    [v4 userInfo];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKeyedSubscript:@"RatchetState"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 errorNotArmedWithRatchetState:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if ([MEMORY[0x189608798] error:v4 hasCode:-1004])
    {
      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 notInteractiveErrorWithUserInfo:v5];
    }

    else if ([MEMORY[0x189608798] error:v4 hasCode:-1027])
    {
      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 deviceTypeNotSupportedWithUserInfo:v5];
    }

    else if ([MEMORY[0x189608798] error:v4 hasCode:-1025])
    {
      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 userCustomCancelErrorWithUserInfo:v5];
    }

    else if ([MEMORY[0x189608798] error:v4 hasCode:-5])
    {
      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 passcodeNotSetWithUserInfo:v5];
    }

    else if ([MEMORY[0x189608798] error:v4 hasCode:-7])
    {
      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 biometryNotEnrolledWithUserInfo:v5];
    }

    else
    {
      if (![MEMORY[0x189608798] error:v4 hasCode:-1008 subcode:1])
      {
        [a1 genericErrorWithUnderlyingError:v4];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }

      [v4 userInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [a1 beforeFirstUnlockWithUserInfo:v5];
    }

    v7 = (void *)v8;
  }

LABEL_17:
  return v7;
}

+ (id)_errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v11 = *MEMORY[0x189607490];
  v12[0] = a4;
  uint64_t v6 = (void *)MEMORY[0x189603F68];
  id v7 = a4;
  [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [a1 _errorWithCode:a3 userInfo:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x189607870] errorWithDomain:@"com.apple.LocalAuthentication.LARatchetErrorDomain" code:a3 userInfo:a4];
}

@end