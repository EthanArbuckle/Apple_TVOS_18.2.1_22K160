@interface LACClientInfoProvider
+ (BOOL)_isNonUiExtensionPointIdentifier:(id)a3;
+ (BOOL)processId:(int)a3 toAuditToken:(id *)a4;
+ (id)_infoForClientWithApplicationIdentityData:(id)a3;
+ (id)_infoForClientWithAuditToken:(id *)a3;
+ (id)_infoForClientWithAuditTokenData:(id)a3;
+ (id)applicationIdentityDataForProcessId:(int)a3;
+ (id)auditTokenDataForProcessId:(int)a3;
+ (id)infoForXPCClient:(id)a3;
+ (id)infoForXPCClient:(id)a3 evaluationOptions:(id)a4;
@end

@implementation LACClientInfoProvider

+ (id)infoForXPCClient:(id)a3
{
  return (id)[a1 infoForXPCClient:a3 evaluationOptions:0];
}

+ (id)infoForXPCClient:(id)a3 evaluationOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189607968] numberWithInteger:1038];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607968] numberWithInteger:1080];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v11 integerValue];

  [MEMORY[0x189607968] numberWithInteger:1021];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v7 objectForKeyedSubscript:v13];
  if (v14)
  {
    v15 = (void *)v14;
    int v16 = [v6 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerName"];

    if (!v16)
    {
      v17 = 0LL;
      if (v9) {
        goto LABEL_6;
      }
LABEL_10:
      if (v6)
      {
        [v6 auditToken];
      }

      else
      {
        __int128 v24 = 0u;
        __int128 v25 = 0u;
      }

      uint64_t v18 = [a1 _infoForClientWithAuditToken:&v24];
      goto LABEL_15;
    }

    [MEMORY[0x189607968] numberWithInteger:1021];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v13];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v17 = 0LL;
  }

  if (!v9) {
    goto LABEL_10;
  }
LABEL_6:
  if ((v12 & 4) != 0) {
    [a1 _infoForClientWithApplicationIdentityData:v9];
  }
  else {
  uint64_t v18 = [a1 _infoForClientWithAuditTokenData:v9];
  }
LABEL_15:
  v19 = (void *)v18;
  if (objc_msgSend(v17, "length", v24, v25))
  {
    v20 = objc_alloc(&OBJC_CLASS___LACClientInfo);
    [v19 bundleId];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = -[LACClientInfo initWithBundleId:displayName:](v20, "initWithBundleId:displayName:", v21, v17);

    v19 = (void *)v22;
  }

  return v19;
}

+ (id)auditTokenDataForProcessId:(int)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = [MEMORY[0x189607B18] value:v8 withObjCType:"{?=[8I]}"];
  NSGetSizeAndAlignment((const char *)[v3 objCType], &sizep, 0);
  v4 = &v8[-((sizep + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  [v3 getValue:v4];
  [MEMORY[0x189603F48] dataWithBytes:v4 length:sizep];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)applicationIdentityDataForProcessId:(int)a3
{
  return 0LL;
}

+ (BOOL)processId:(int)a3 toAuditToken:(id *)a4
{
  kern_return_t v14;
  os_log_s *v15;
  os_log_s *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  uint64_t v5 = *(void *)&a3;
  if (task_name_for_pid(*MEMORY[0x1895FBBE0], a3, &tn))
  {
    LACLogDefault();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[LACClientInfoProvider processId:toAuditToken:].cold.3(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    return 0;
  }

  else
  {
    task_info_outCnt = 8;
    uint64_t v14 = task_info(tn, 0xFu, (task_info_t)a4, &task_info_outCnt);
    BOOL v13 = v14 == 0;
    LACLogDefault();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider processId:toAuditToken:].cold.2(v5, v16, v17, v18, v19, v20, v21, v22);
      }
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      +[LACClientInfoProvider processId:toAuditToken:].cold.1(v5, v16);
    }
  }

  return v13;
}

+ (id)_infoForClientWithAuditTokenData:(id)a3
{
  if (a3)
  {
    objc_msgSend( MEMORY[0x189607B18],  "valueWithBytes:objCType:",  objc_msgSend(objc_retainAutorelease(a3), "bytes"),  "{?=[8I]}");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = v4;
    if (v4)
    {
      [v4 getValue:v11];
      v10[0] = v11[0];
      v10[1] = v11[1];
      uint64_t v6 = [a1 _infoForClientWithAuditToken:v10];
    }

    else
    {
      LACLogDefault();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[LACClientInfoProvider _infoForClientWithAuditTokenData:].cold.1(v8);
      }

      uint64_t v6 = +[LACClientInfo emptyClientInfo](&OBJC_CLASS___LACClientInfo, "emptyClientInfo");
    }

    uint64_t v9 = (void *)v6;

    return v9;
  }

  else
  {
    +[LACClientInfo emptyClientInfo](&OBJC_CLASS___LACClientInfo, "emptyClientInfo");
    return (id)objc_claimAutoreleasedReturnValue();
  }

+ (id)_infoForClientWithApplicationIdentityData:(id)a3
{
  return +[LACClientInfo emptyClientInfo](&OBJC_CLASS___LACClientInfo, "emptyClientInfo", a3);
}

+ (id)_infoForClientWithAuditToken:(id *)a3
{
  return +[LACClientInfo emptyClientInfo](&OBJC_CLASS___LACClientInfo, "emptyClientInfo", a3);
}

+ (BOOL)_isNonUiExtensionPointIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.services"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ctk-tokens"] & 1) != 0)
  {
    char v4 = 1;
  }

  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.Safari.web-extension"];
  }

  return v4;
}

+ (void)processId:(int)a1 toAuditToken:(os_log_s *)a2 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( &dword_189219000,  a2,  OS_LOG_TYPE_DEBUG,  "Successfully acquired audit token for PID %u",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1_1();
}

+ (void)processId:(uint64_t)a3 toAuditToken:(uint64_t)a4 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)processId:(uint64_t)a3 toAuditToken:(uint64_t)a4 .cold.3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)_infoForClientWithAuditTokenData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_189219000, log, OS_LOG_TYPE_ERROR, "Unable to get audit token from data", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end