@interface LACPreboardAMFIHelper
+ (BOOL)installProfileWithUUID:(id)a3 signature:(id)a4 error:(id *)a5;
+ (id)createUPPControlForTeamID:(id)a3;
+ (id)getUPPProfile;
+ (int64_t)useCase;
+ (unsigned)_securityBootMode;
+ (void)completeCurrentBootModeWithSuccess:(BOOL)a3;
+ (void)getUPPProfile;
@end

@implementation LACPreboardAMFIHelper

+ (int64_t)useCase
{
  int v2 = [a1 _securityBootMode];
  v3 = &LACPreboardUseCaseUPP;
  v4 = &LACPreboardUseCaseDeveloperMode;
  if (v2 != 2) {
    v4 = &LACPreboardUseCaseUnknown;
  }
  if (v2 != 3) {
    v3 = v4;
  }
  return *v3;
}

+ (void)completeCurrentBootModeWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v4 = [a1 _securityBootMode];
  BOOL v5 = v4;
  if (v4 == 2)
  {
    int v11 = AMFIDeveloperModeCommit();
    LACLogPreboard();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109376;
      BOOL v15 = v3;
      __int16 v16 = 1024;
      int v17 = v11;
      v8 = "Committing developer mode value: %u with result: %u";
      v9 = v7;
      uint32_t v10 = 14;
      goto LABEL_8;
    }

+ (id)getUPPProfile
{
  int ScheduledProfile = AMFIProfileGetScheduledProfile();
  if (ScheduledProfile)
  {
    LACLogPreboard();
    BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[LACPreboardAMFIHelper getUPPProfile].cold.1(ScheduledProfile, v3);
    }

    int v4 = 0LL;
  }

  else
  {
    int v4 = -[LACPreboardUPPProfile initWithUUID:teamID:teamName:]( objc_alloc(&OBJC_CLASS___LACPreboardUPPProfile),  "initWithUUID:teamID:teamName:",  0LL,  0LL,  0LL);
  }

  return v4;
}

+ (id)createUPPControlForTeamID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  memset(v14, 0, 28);
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  __int128 v10 = 0u;
  __int128 v9 = 0u;
  __int128 v8 = 0u;
  int v6 = 2;
  *(void *)((char *)&v7 + 4) = 0x100000005LL;
  id v3 = a3;
  v14[7] = [v3 lengthOfBytesUsingEncoding:4];
  id v4 = v3;
  [v4 UTF8String];
  [v4 lengthOfBytesUsingEncoding:4];

  __memcpy_chk();
  [MEMORY[0x189603F48] dataWithBytes:&v6 length:148];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)installProfileWithUUID:(id)a3 signature:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = (id)[v8 copy];
  int v10 = AMFIProfileSetTrustWithOptions();
  LACLogDefault();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    int v18 = v10;
    _os_log_impl( &dword_189219000,  v11,  OS_LOG_TYPE_DEFAULT,  "AMFIProfileSetTrustWithOptions returned: %d",  (uint8_t *)&v17,  8u);
  }

  if (v10)
  {
    if (!a5)
    {
      BOOL v15 = 0;
      goto LABEL_13;
    }

    +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Unable to set profile trust");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  int v13 = AMFIProfileCommitProfile();
  LACLogDefault();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    int v18 = v13;
    _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "AMFIProfileCommitProfile returned: %d",  (uint8_t *)&v17,  8u);
  }

  BOOL v15 = v13 == 0;
  if (a5 && v13)
  {
    +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Unable to commit profile");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    BOOL v15 = 0;
    *a5 = v12;
  }

+ (unsigned)_securityBootMode
{
  return -1;
}

+ (void)getUPPProfile
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "AMFIProfileGetScheduledProfile returned error code: %d",  (uint8_t *)v2,  8u);
}

@end