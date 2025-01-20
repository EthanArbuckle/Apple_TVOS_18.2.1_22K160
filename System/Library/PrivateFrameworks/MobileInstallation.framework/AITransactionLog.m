@interface AITransactionLog
+ (id)_defaultLog;
+ (void)initializeWithLog:(id)a3;
+ (void)logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 description:(id)a7;
+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 description:(id)a8;
+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 persona:(id)a8 description:(id)a9;
- (id)_initWithLog:(id)a3;
- (void)_logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 persona:(id)a7 description:(id)a8;
@end

@implementation AITransactionLog

+ (void)initializeWithLog:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__AITransactionLog_initializeWithLog___block_invoke;
  block[3] = &unk_189E41A28;
  id v7 = v3;
  uint64_t v4 = initializeWithLog__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&initializeWithLog__onceToken, block);
  }
}

void __38__AITransactionLog_initializeWithLog___block_invoke(uint64_t a1)
{
  id v1 = -[AITransactionLog _initWithLog:]( objc_alloc(&OBJC_CLASS___AITransactionLog),  "_initWithLog:",  *(void *)(a1 + 32));
  v2 = (void *)__defaultLog;
  __defaultLog = (uint64_t)v1;
}

+ (void)logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 description:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  [a1 _defaultLog];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 _logScenario:v14 step:a4 success:v8 forBundleID:v13 persona:@"Unknown Persona" description:v12];
}

+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 description:(id)a8
{
}

+ (void)logStep:(unint64_t)a3 byParty:(unint64_t)a4 phase:(unint64_t)a5 success:(BOOL)a6 forBundleID:(id)a7 persona:(id)a8 description:(id)a9
{
  BOOL v10 = a6;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  if (logStep_byParty_phase_success_forBundleID_persona_description__onceToken != -1) {
    dispatch_once(&logStep_byParty_phase_success_forBundleID_persona_description__onceToken, &__block_literal_global_1);
  }
  v17 = (os_log_s *)logStep_byParty_phase_success_forBundleID_persona_description__sharedLog;
  if (os_log_type_enabled( (os_log_t)logStep_byParty_phase_success_forBundleID_persona_description__sharedLog,  OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544898;
    id v19 = v14;
    __int16 v20 = 2114;
    id v21 = v15;
    __int16 v22 = 2048;
    unint64_t v23 = a4;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 1024;
    BOOL v29 = v10;
    __int16 v30 = 2114;
    id v31 = v16;
    _os_log_impl( &dword_18635D000,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@/%{public}@:%lu:%lu:%lu:%u:%{public}@",  (uint8_t *)&v18,  0x44u);
  }
}

void __82__AITransactionLog_logStep_byParty_phase_success_forBundleID_persona_description___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.appinstallation", "TransactionLog");
  id v1 = (void *)logStep_byParty_phase_success_forBundleID_persona_description__sharedLog;
  logStep_byParty_phase_success_forBundleID_persona_description__sharedLog = (uint64_t)v0;
}

- (id)_initWithLog:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AITransactionLog;
  v6 = -[AITransactionLog init](&v9, sel_init);
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_log, a3);
  }

  return v7;
}

+ (id)_defaultLog
{
  id v3 = (void *)__defaultLog;
  if (!__defaultLog)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:a1 file:@"AITransactionLog.m" lineNumber:63 description:@"Transaction log must be initialized before use. Please call +[AITransactionLog initializeWithLog:]."];

    id v3 = (void *)__defaultLog;
  }

  return v3;
}

- (void)_logScenario:(id)a3 step:(unint64_t)a4 success:(BOOL)a5 forBundleID:(id)a6 persona:(id)a7 description:(id)a8
{
  BOOL v11 = a5;
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  uint64_t v18 = [v14 UTF8String];
  id v19 = v17;
  uint64_t v20 = [v19 UTF8String];

  id v21 = v16;
  uint64_t v22 = [v21 UTF8String];

  id v23 = v15;
  uint64_t v24 = [v23 UTF8String];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = "_";
    if (v24) {
      unint64_t v27 = (const char *)v24;
    }
    else {
      unint64_t v27 = "_";
    }
    int v31 = 136316418;
    if (v22) {
      __int16 v28 = (const char *)v22;
    }
    else {
      __int16 v28 = "_";
    }
    if (v20) {
      BOOL v29 = (const char *)v20;
    }
    else {
      BOOL v29 = "_";
    }
    uint64_t v32 = v29;
    __int16 v33 = 2080;
    v34 = v28;
    if (v18) {
      __int16 v26 = (const char *)v18;
    }
    __int16 v35 = 2080;
    v36 = v26;
    __int16 v30 = "Success";
    __int16 v37 = 2048;
    unint64_t v38 = a4;
    if (!v11) {
      __int16 v30 = "Fail";
    }
    __int16 v39 = 2080;
    v40 = v30;
    __int16 v41 = 2080;
    v42 = v27;
    _os_log_impl(&dword_18635D000, log, OS_LOG_TYPE_DEFAULT, "%s:%s:%s:%ld:%s:%s", (uint8_t *)&v31, 0x3Eu);
  }

- (void).cxx_destruct
{
}

@end