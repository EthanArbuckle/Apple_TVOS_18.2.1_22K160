@interface PPSClientDonation
+ (BOOL)isRegisteredSubsystem:(const char *)a3 category:(const char *)a4;
+ (PPSTelemetryIdentifier)createIdentifierForSubsystem:(const char *)a3 category:(const char *)a4;
+ (void)sendEventWithIdentifier:(const PPSTelemetryIdentifier *)a3 payload:(__CFDictionary *)a4;
@end

@implementation PPSClientDonation

+ (PPSTelemetryIdentifier)createIdentifierForSubsystem:(const char *)a3 category:(const char *)a4
{
  if (!+[PPSClientDonation isRegisteredSubsystem:category:]( &OBJC_CLASS___PPSClientDonation,  "isRegisteredSubsystem:category:")) {
    return 0LL;
  }
  v4 = (PPSTelemetryIdentifier *)malloc(0x400uLL);
  if (!v4)
  {
    logHandle_0();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation createIdentifierForSubsystem:category:].cold.1(v6);
    }

    return 0LL;
  }

  v5 = v4;
  __strlcpy_chk();
  __strlcpy_chk();
  return v5;
}

+ (void)sendEventWithIdentifier:(const PPSTelemetryIdentifier *)a3 payload:(__CFDictionary *)a4
{
  if (a3 && a4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s::%s", a3, a3->var1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    PLLogRegisteredEvent(110LL, v6, a4);
  }

  else
  {
    logHandle_0();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation sendEventWithIdentifier:payload:].cold.1((uint64_t)a4, v5);
    }
  }

+ (BOOL)isRegisteredSubsystem:(const char *)a3 category:(const char *)a4
{
  if (a3 && a4 && *a3 && *a4)
  {
    id v6 = (void *)objc_opt_new();
    [NSString stringWithUTF8String:a3];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:a4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v6 permissionsForSubsystem:v7 category:v8];

    if ((v9 & 1) == 0)
    {
      logHandle_0();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[PPSClientDonation isRegisteredSubsystem:category:].cold.2();
      }
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      +[PPSClientDonation isRegisteredSubsystem:category:].cold.1();
    }
    return 0;
  }

  return v9;
}

+ (void)createIdentifierForSubsystem:(os_log_t)log category:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  v2 = "+[PPSClientDonation createIdentifierForSubsystem:category:]";
  _os_log_error_impl(&dword_186654000, log, OS_LOG_TYPE_ERROR, "(%s) Failed to malloc identifier", (uint8_t *)&v1, 0xCu);
}

+ (void)sendEventWithIdentifier:(uint64_t)a1 payload:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  uint64_t v3 = "+[PPSClientDonation sendEventWithIdentifier:payload:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_186654000, a2, OS_LOG_TYPE_ERROR, "(%s) Invalid inputs: payload=%@", (uint8_t *)&v2, 0x16u);
}

+ (void)isRegisteredSubsystem:category:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_186654000, MEMORY[0x1895F8DA0], v0, "(%s) Invalid inputs: %s / %s", (uint8_t *)v1);
}

+ (void)isRegisteredSubsystem:category:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_186654000, v0, (uint64_t)v0, "(%s) Permission denied: %s / %s", (uint8_t *)v1);
}

@end