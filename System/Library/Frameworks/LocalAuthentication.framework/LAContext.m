@interface LAContext
+ (BOOL)supportsSecureCoding;
+ (id)_optionsForEvent:(int64_t)a3;
+ (unsigned)newCommandId;
+ (unsigned)newInstanceId;
+ (void)notifyEvent:(int64_t)a3;
+ (void)notifyEvent:(int64_t)a3 completionHandler:(id)a4;
- (BOOL)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7;
- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError *)error;
- (BOOL)checkContextValidWithError:(id *)a3;
- (BOOL)interactionNotAllowed;
- (BOOL)isCredentialSet:(LACredentialType)type;
- (BOOL)isEqual:(id)a3;
- (BOOL)setCredential:(NSData *)credential type:(LACredentialType)type;
- (BOOL)setCredential:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (BOOL)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (LABiometryType)biometryType;
- (LAClient)client;
- (LAContext)init;
- (LAContext)initWithCoder:(id)a3;
- (LAContext)initWithExternalizedContext:(id)a3;
- (LAContext)initWithExternalizedContext:(id)a3 uiDelegate:(id)a4;
- (LAContext)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4;
- (LAContext)initWithUIDelegate:(id)a3;
- (LADomainState)domainState;
- (LAUIDelegate)uiDelegate;
- (NSData)evaluatedPolicyDomainState;
- (NSData)externalizedContext;
- (NSHashTable)observers;
- (NSNumber)maxBiometryFailures;
- (NSNumber)touchIDAuthenticationRetryLimit;
- (NSString)localizedCancelTitle;
- (NSString)localizedFallbackTitle;
- (NSString)localizedReason;
- (NSTimeInterval)touchIDAuthenticationAllowableReuseDuration;
- (id)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7;
- (id)_evaluationMechanismsFromReturnedError:(id)a3 error:(id *)a4;
- (id)_hashWithBundleIdentifier:(id)a3;
- (id)_publicErrorFromInternalError:(id)a3 options:(id)a4;
- (id)_serverPropertyValueForOption:(int64_t)a3;
- (id)_serverPropertyValueForOption:(int64_t)a3 log:(int64_t)a4;
- (id)credentialOfType:(int64_t)a3 error:(id *)a4;
- (id)description;
- (id)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 error:(id *)a6;
- (id)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 error:(id *)a6;
- (id)evaluatePolicy:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (id)evaluationMechanismsForAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 error:(id *)a5;
- (id)evaluationMechanismsForPolicy:(int64_t)a3 error:(id *)a4;
- (id)optionCallerName;
- (id)optionCallerPID;
- (id)optionEventProcessing;
- (id)optionMaxCredentialAge;
- (id)optionNotInteractive;
- (id)optionTimeout;
- (id)uuid;
- (unint64_t)hash;
- (unsigned)instanceId;
- (void)_evaluateAccessControl:(__SecAccessControl *)a3 operation:(id)a4 options:(id)a5 log:(int64_t)a6 cid:(unsigned int)a7 synchronous:(BOOL)a8 reply:(id)a9;
- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 synchronous:(BOOL)a7 reply:(id)a8;
- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 synchronous:(BOOL)a5 reply:(id)a6;
- (void)_notifyObserversAfterInvalidation;
- (void)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 reply:(id)a7;
- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4;
- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4 log:(int64_t)a5;
- (void)addContextObserver:(id)a3;
- (void)authMethodWithReply:(id)a3;
- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)credentialOfType:(int64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateAccessControl:(SecAccessControlRef)accessControl operation:(LAAccessControlOperation)operation localizedReason:(NSString *)localizedReason reply:(void *)reply;
- (void)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 reply:(id)a6;
- (void)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 reply:(id)a6;
- (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void *)reply;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5;
- (void)prearmTouchIDWithReply:(id)a3;
- (void)removeContextObserver:(id)a3;
- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)resetWithReply:(id)a3;
- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4;
- (void)setBiometryType:(int64_t)a3;
- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6;
- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5;
- (void)setEvaluatedPolicyDomainState:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setInteractionNotAllowed:(BOOL)interactionNotAllowed;
- (void)setLocalizedCancelTitle:(NSString *)localizedCancelTitle;
- (void)setLocalizedFallbackTitle:(NSString *)localizedFallbackTitle;
- (void)setLocalizedReason:(NSString *)localizedReason;
- (void)setMaxBiometryFailures:(NSNumber *)maxBiometryFailures;
- (void)setObservers:(id)a3;
- (void)setOptionCallerName:(id)a3;
- (void)setOptionCallerPID:(id)a3;
- (void)setOptionEventProcessing:(id)a3;
- (void)setOptionMaxCredentialAge:(id)a3;
- (void)setOptionNotInteractive:(id)a3;
- (void)setOptionTimeout:(id)a3;
- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5;
- (void)setTouchIDAuthenticationAllowableReuseDuration:(NSTimeInterval)touchIDAuthenticationAllowableReuseDuration;
- (void)setTouchIDAuthenticationRetryLimit:(id)a3;
- (void)setUiDelegate:(id)a3;
@end

@implementation LAContext

+ (void)notifyEvent:(int64_t)a3
{
}

+ (void)notifyEvent:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  if (notifyEvent_completionHandler__onceToken != -1) {
    dispatch_once(&notifyEvent_completionHandler__onceToken, &__block_literal_global_4);
  }
  LALogForCategory();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = a3;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v7;
    _os_log_impl(&dword_186EAF000, v6, OS_LOG_TYPE_DEFAULT, "notifyEvent:%d cid:%u", buf, 0xEu);
  }

  *(void *)buf = 0LL;
  v19 = buf;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  id v23 = (id)objc_opt_new();
  v8 = (void *)*((void *)v19 + 5);
  v9 = +[LAContext _optionsForEvent:](&OBJC_CLASS___LAContext, "_optionsForEvent:", a3);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __43__LAContext_notifyEvent_completionHandler___block_invoke_5;
  v12[3] = &unk_189F99A40;
  v10 = v6;
  unsigned int v17 = v7;
  v13 = v10;
  v15 = buf;
  int64_t v16 = a3;
  id v11 = v5;
  id v14 = v11;
  [v8 notifyEvent:a3 options:v9 reply:v12];

  _Block_object_dispose(buf, 8);
}

uint64_t __43__LAContext_notifyEvent_completionHandler___block_invoke()
{
  return LALogSetProcessCategory();
}

void __43__LAContext_notifyEvent_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 64);
    v9 = @"success";
    if (!(_DWORD)a2) {
      v9 = v5;
    }
    v13[0] = 67109634;
    v13[1] = v7;
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 2114;
    unsigned int v17 = v9;
    _os_log_impl( &dword_186EAF000,  v6,  OS_LOG_TYPE_INFO,  "notifyEvent:%d cid:%u returned %{public}@",  (uint8_t *)v13,  0x18u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0LL;

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

+ (id)_optionsForEvent:(int64_t)a3
{
  return 0LL;
}

- (LAContext)init
{
  return -[LAContext initWithExternalizedContext:](self, "initWithExternalizedContext:", 0LL);
}

- (LAContext)initWithExternalizedContext:(id)a3
{
  return -[LAContext initWithExternalizedContext:userSession:]( self,  "initWithExternalizedContext:userSession:",  a3,  0LL);
}

- (LAContext)initWithExternalizedContext:(id)a3 userSession:(unsigned int *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LAContext;
  uint64_t v7 = -[LAContext init](&v15, sel_init);
  if (!v7) {
    goto LABEL_15;
  }
  if (initWithExternalizedContext_userSession__onceToken != -1) {
    dispatch_once(&initWithExternalizedContext_userSession__onceToken, &__block_literal_global_9);
  }
  LALogForCategory();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"with externalized context %x",  objc_msgSend(v6, "hash"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_10;
    }
LABEL_8:
    unsigned int v10 = *a4;
    if (v10 != geteuid()) {
      objc_msgSend(MEMORY[0x189603F70], "raise:format:", *MEMORY[0x189603A60], @"Invalid uid: %d", *a4);
    }
    goto LABEL_10;
  }

  v9 = @"new";
  if (a4) {
    goto LABEL_8;
  }
LABEL_10:
  unsigned int v11 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v17 = v9;
    __int16 v18 = 1024;
    LODWORD(v19) = v11;
    _os_log_impl(&dword_186EAF000, v8, OS_LOG_TYPE_DEFAULT, "Creating LAContext %{public}@ cid:%u", buf, 0x12u);
  }

  v7->_instanceId = +[LAContext newInstanceId](&OBJC_CLASS___LAContext, "newInstanceId");
  uint64_t v12 = -[LAClient initWithExternalizedContext:userSession:context:]( objc_alloc(&OBJC_CLASS___LAClient),  "initWithExternalizedContext:userSession:context:",  v6,  a4,  v7);
  client = v7->_client;
  v7->_client = v12;

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    unsigned int v17 = v7;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = v11;
    _os_log_impl(&dword_186EAF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created %{public}@ cid:%u", buf, 0x1Cu);
  }

LABEL_15:
  return v7;
}

uint64_t __53__LAContext_initWithExternalizedContext_userSession___block_invoke()
{
  return LALogSetProcessCategory();
}

- (LAContext)initWithUIDelegate:(id)a3
{
  return -[LAContext initWithExternalizedContext:uiDelegate:](self, "initWithExternalizedContext:uiDelegate:", 0LL, a3);
}

- (LAContext)initWithExternalizedContext:(id)a3 uiDelegate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = -[LAContext initWithExternalizedContext:](self, "initWithExternalizedContext:", a3);
  -[LAContext setUiDelegate:](v7, "setUiDelegate:", v6);

  return v7;
}

- (LAContext)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___LAContext;
  id v5 = -[LAContext init](&v18, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_18);
    }
    [v4 connection];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Token"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1896087B8];
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    [v9 auditTokenToData:v17];
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_instanceId = +[LAContext newInstanceId](&OBJC_CLASS___LAContext, "newInstanceId");
    unsigned int v11 = -[LAClient initWithUUID:token:senderAuditTokenData:context:]( objc_alloc(&OBJC_CLASS___LAClient),  "initWithUUID:token:senderAuditTokenData:context:",  v7,  v8,  v10,  v5);
    client = v5->_client;
    v5->_client = v11;

    LALogForCategory();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v7 hash];
      int v15 = [v8 hash];
      *(_DWORD *)buf = 138543874;
      __int16 v20 = v5;
      __int16 v21 = 1024;
      int v22 = v14;
      __int16 v23 = 1024;
      int v24 = v15;
      _os_log_impl(&dword_186EAF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ created with uuid: %x token: %x", buf, 0x18u);
    }
  }

  return v5;
}

uint64_t __27__LAContext_initWithCoder___block_invoke()
{
  return LALogSetProcessCategory();
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_186EAF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocated", buf, 0xCu);
  }

  -[LAClient invalidateWithMessage:](self->_client, "invalidateWithMessage:", @"context dealloc");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAContext;
  -[LAContext dealloc](&v4, sel_dealloc);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_super v4 = (void *)NSString;
  uint64_t v5 = -[LAContext instanceId](self, "instanceId");
  uint64_t v6 = -[LAClient proxyId](self->_client, "proxyId");
  uint64_t v7 = (void *)v6;
  if (v3)
  {
    -[LAContext uiDelegate](self, "uiDelegate");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"LAContext[%u:%@ uiDelegate:%@]", v5, v7, v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 stringWithFormat:@"LAContext[%u:%@]", v5, v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LAContext;
  if (-[LAContext isEqual:](&v9, sel_isEqual_, v4))
  {
    char v5 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LAClient uuid](self->_client, "uuid");
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v4[12] uuid];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v5 = [v6 isEqual:v7];
    }

    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LALogForCategory();
  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 connection];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAClient uuid](self->_client, "uuid");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"UUID"];

  uint64_t v10 = [v8 processIdentifier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    __int16 v30 = 1024;
    int v31 = v10;
    __int16 v32 = 1024;
    unsigned int v33 = v6;
    _os_log_impl( &dword_186EAF000,  v5,  OS_LOG_TYPE_DEFAULT,  "Encoding %{public}@ for transfer to pid:%d cid:%u",  buf,  0x18u);
  }

  if ((_DWORD)v10)
  {
    unsigned int v11 = (void *)MEMORY[0x1896087B8];
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    [v11 auditTokenToData:v22];
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    client = self->_client;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    objc_super v17[2] = __29__LAContext_encodeWithCoder___block_invoke_33;
    v17[3] = &unk_189F99AD0;
    objc_super v18 = v5;
    id v19 = v7;
    int v20 = v10;
    unsigned int v21 = v6;
    id v15 = v7;
    v13 = v5;
    -[LAClient allowTransferToProcess:receiverAuditTokenData:reply:]( client,  "allowTransferToProcess:receiverAuditTokenData:reply:",  v10,  v14,  v17);
  }

  else
  {
    uint64_t v12 = self->_client;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __29__LAContext_encodeWithCoder___block_invoke;
    v23[3] = &unk_189F99AA8;
    id v24 = v4;
    uint64_t v25 = v5;
    id v26 = v7;
    unsigned int v27 = v6;
    v13 = v7;
    int v14 = v5;
    -[LAClient tokenForTransferToUnknownProcess:](v12, "tokenForTransferToUnknownProcess:", v23);

    id v15 = v24;
  }
}

void __29__LAContext_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) encodeObject:v5 forKey:@"Token"];
    uint64_t v7 = *(void **)(a1 + 40);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      objc_super v9 = v7;
      int v10 = [v5 hash];
      int v11 = *(_DWORD *)(a1 + 56);
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 1024;
      int v17 = v11;
      _os_log_impl( &dword_186EAF000,  v9,  OS_LOG_TYPE_INFO,  "Encoded %{public}@ for transfer with token:%x cid:%u",  (uint8_t *)&v12,  0x18u);
    }
  }

  else if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_cold_1();
  }
}

void __29__LAContext_encodeWithCoder___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __29__LAContext_encodeWithCoder___block_invoke_33_cold_1(a1, v6);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __29__LAContext_encodeWithCoder___block_invoke_33_cold_2();
  }
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v4 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    int v15 = v5;
    __int16 v16 = 1024;
    unsigned int v17 = v4;
    _os_log_impl(&dword_186EAF000, v3, OS_LOG_TYPE_INFO, "Invalidating %{public}@ cid:%u", buf, 0x12u);
  }

  client = self->_client;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __23__LAContext_invalidate__block_invoke;
  v10[3] = &unk_189F99AF8;
  v10[4] = self;
  int v11 = v3;
  id v12 = v5;
  unsigned int v13 = v4;
  id v7 = v5;
  uint64_t v8 = v3;
  objc_super v9 = self;
  -[LAClient invalidateWithReply:](client, "invalidateWithReply:", v10);
}

void __23__LAContext_invalidate__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = 0LL;

  if (a2)
  {
    [*(id *)(a1 + 32) _notifyObserversAfterInvalidation];
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }

  else
  {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }

  objc_super v9 = *(os_log_s **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 56);
    id v12 = @"success";
    if (!a2) {
      id v12 = v5;
    }
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    _os_log_impl( &dword_186EAF000,  v9,  v8,  "invalidate %{public}@ cid:%u internally returned %{public}@",  (uint8_t *)&v13,  0x1Cu);
  }
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:]( self,  "_evaluatePolicy:options:log:cid:synchronous:reply:",  a3,  v9,  LALogCategoryForPolicy(),  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  0LL,  v8);
}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 synchronous:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v14 = a4;
  id v15 = a8;
  if (a5)
  {
    -[LAContext description](self, "description");
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    LALogForCategory();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = "async";
      *(_DWORD *)buf = 67110146;
      int v27 = a3;
      if (v9) {
        uint64_t v18 = "sync";
      }
      __int16 v28 = 2114;
      id v29 = v14;
      __int16 v30 = 2114;
      int v31 = v16;
      __int16 v32 = 2082;
      unsigned int v33 = v18;
      __int16 v34 = 1024;
      unsigned int v35 = a6;
      _os_log_impl( &dword_186EAF000,  v17,  OS_LOG_TYPE_DEFAULT,  "evaluatePolicy:%d options:%{public}@ on %{public}@ (%{public}s) cid:%u",  buf,  0x2Cu);
    }
  }

  else
  {
    int v16 = 0LL;
  }

  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke;
  v21[3] = &unk_189F99B20;
  id v23 = v15;
  int64_t v24 = a5;
  unsigned int v25 = a6;
  id v22 = v16;
  id v19 = v15;
  id v20 = v16;
  -[LAContext _evaluatePolicy:options:synchronous:reply:]( self,  "_evaluatePolicy:options:synchronous:reply:",  a3,  v14,  v9,  v21);
}

void __63__LAContext__evaluatePolicy_options_log_cid_synchronous_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    LALogForCategory();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(_DWORD *)(a1 + 56);
      if (v5) {
        id v10 = v5;
      }
      else {
        id v10 = v6;
      }
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl( &dword_186EAF000,  v7,  OS_LOG_TYPE_DEFAULT,  "evaluatePolicy on %{public}@ cid:%u returned %{public}@",  (uint8_t *)&v12,  0x1Cu);
    }
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (void)_evaluatePolicy:(int64_t)a3 options:(id)a4 synchronous:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  client = self->_client;
  id v12 = a4;
  -[LAContext uiDelegate](self, "uiDelegate");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke;
  v15[3] = &unk_189F98F88;
  id v16 = v10;
  id v14 = v10;
  -[LAClient evaluatePolicy:options:uiDelegate:synchronous:reply:]( client,  "evaluatePolicy:options:uiDelegate:synchronous:reply:",  a3,  v12,  v13,  v6,  v15);
}

void __55__LAContext__evaluatePolicy_options_synchronous_reply___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x189608798];
  id v6 = a2;
  [v5 redactInternalError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

- (id)_hashWithBundleIdentifier:(id)a3
{
  if (a3)
  {
    unint64_t v3 = (void *)MEMORY[0x189610798];
    uint64_t v4 = (void *)MEMORY[0x1896077F8];
    id v5 = a3;
    [v4 mainBundle];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 bundleIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 saltHash:v5 withBundleID:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)evaluatePolicy:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  -[LAContext _evaluatePolicy:options:log:cid:error:]( self,  "_evaluatePolicy:options:log:cid:error:",  a3,  v8,  LALogCategoryForPolicy(),  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  a5);
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_evaluatePolicy:(int64_t)a3 options:(id)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  unsigned int v25 = __Block_byref_object_copy__2;
  id v26 = __Block_byref_object_dispose__2;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke;
  v15[3] = &unk_189F99B48;
  void v15[4] = &v22;
  v15[5] = &v16;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:]( self,  "_evaluatePolicy:options:log:cid:synchronous:reply:",  a3,  v12,  a5,  v8,  1LL,  v15);
  if (a7) {
    *a7 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __51__LAContext__evaluatePolicy_options_log_cid_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_publicErrorFromInternalError:(id)a3 options:(id)a4
{
  id v4 = a3;
  [v4 domain];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isEqualToString:@"com.apple.LocalAuthentication"];

  uint64_t v7 = v4;
  if (v6)
  {
    uint64_t v8 = [v4 code];
    [v4 code];
    uint64_t v9 = (void *)MEMORY[0x189608798];
    [v4 userInfo];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKey:*MEMORY[0x189607490]];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithCode:v8 message:v11];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  v19[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = reply;
  uint64_t v18 = &unk_189FA1028;
  v19[0] = localizedReason;
  uint64_t v9 = (void *)MEMORY[0x189603F68];
  id v10 = localizedReason;
  [v9 dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke;
  v15[3] = &unk_189F99B78;
  id v16 = v11;
  id v17 = v8;
  void v15[4] = self;
  id v13 = v11;
  id v14 = v8;
  -[LAContext _evaluatePolicy:options:log:cid:synchronous:reply:]( self,  "_evaluatePolicy:options:log:cid:synchronous:reply:",  policy,  v13,  8LL,  v12,  0LL,  v15);
}

void __50__LAContext_evaluatePolicy_localizedReason_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  BOOL v4 = a2 != 0;
  [*(id *)(a1 + 32) _publicErrorFromInternalError:a3 options:*(void *)(a1 + 40)];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v4, v5);
}

- (id)_evaluationMechanismsFromReturnedError:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = v5;
  if (!v5)
  {
    [MEMORY[0x189608798] errorWithCode:-1011 message:@"No authentication required."];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = 0LL;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v7 = (void *)MEMORY[0x189604010];
  [v5 userInfo];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKey:@"AvailableMechanisms"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setWithArray:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = 0LL;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:

  return v10;
}

- (id)evaluationMechanismsForPolicy:(int64_t)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  LALogForPolicy();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v18 = a3;
    __int16 v19 = 2114;
    id v20 = self;
    __int16 v21 = 1024;
    int v22 = v7;
    _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_INFO,  "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u",  buf,  0x18u);
  }

  unsigned int v25 = &unk_189FA1040;
  v26[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  id v10 =  -[LAContext _evaluatePolicy:options:log:cid:error:]( self,  "_evaluatePolicy:options:log:cid:error:",  a3,  v9,  0LL,  v7,  &v16);
  id v11 = v16;

  -[LAContext _evaluationMechanismsFromReturnedError:error:]( self,  "_evaluationMechanismsFromReturnedError:error:",  v11,  a4);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v13 = 16 * (v12 == 0LL);
  if (os_log_type_enabled(v8, v13))
  {
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = v11;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = a3;
    __int16 v19 = 2114;
    id v20 = self;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl( &dword_186EAF000,  v8,  v13,  "evaluationMechanismsForPolicy:%d on %{public}@ cid:%u returned %{public}@",  buf,  0x22u);
  }

  return v12;
}

- (id)evaluationMechanismsForAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1895F89C0];
  LALogForCategory();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v10 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v21 = a3;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v10;
    _os_log_impl( &dword_186EAF000,  v9,  OS_LOG_TYPE_INFO,  "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u",  buf,  0x1Cu);
  }

  __int16 v28 = &unk_189FA1040;
  v29[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  id v13 =  -[LAContext evaluateAccessControl:operation:options:error:]( self,  "evaluateAccessControl:operation:options:error:",  a3,  a4,  v12,  &v19);
  id v14 = v19;

  -[LAContext _evaluationMechanismsFromReturnedError:error:]( self,  "_evaluationMechanismsFromReturnedError:error:",  v14,  a5);
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v16 = 16 * (v15 == 0LL);
  if (os_log_type_enabled(v9, v16))
  {
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = v14;
    }
    *(_DWORD *)buf = 138413058;
    __int16 v21 = a3;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    __int16 v24 = 1024;
    unsigned int v25 = v10;
    __int16 v26 = 2114;
    id v27 = v17;
    _os_log_impl( &dword_186EAF000,  v9,  v16,  "evaluationMechanismsForAccessControl:%@ on %{public}@ cid:%u returned %{public}@",  buf,  0x26u);
  }

  return v15;
}

- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError *)error
{
  v30[1] = *MEMORY[0x1895F89C0];
  id v29 = &unk_189FA1040;
  v30[0] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  LALogForPolicy();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v22 = policy;
    __int16 v23 = 2114;
    __int16 v24 = self;
    __int16 v25 = 1024;
    int v26 = v8;
    _os_log_impl(&dword_186EAF000, v9, OS_LOG_TYPE_INFO, "canEvaluatePolicy:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  id v20 = 0LL;
  -[LAContext _evaluatePolicy:options:log:cid:error:]( self,  "_evaluatePolicy:options:log:cid:error:",  policy,  v7,  0LL,  v8,  &v20);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v20;
  if (v10) {
    int v12 = 1;
  }
  else {
    int v12 = [MEMORY[0x189608798] error:v11 hasCode:-1004];
  }
  -[LAContext _publicErrorFromInternalError:options:](self, "_publicErrorFromInternalError:options:", v11, v7);
  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (error)
  {
    if (v12) {
      id v14 = 0LL;
    }
    else {
      id v14 = v13;
    }
    *error = (NSError *)v14;
  }

  int v15 = v9;
  if ((v12 & 1) != 0)
  {
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  }

  else
  {
    -[__CFString domain](v13, "domain");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    }
  }

  if (os_log_type_enabled(v15, v16))
  {
    int v18 = @"YES";
    *(_DWORD *)buf = 67109890;
    if (!v12) {
      int v18 = v13;
    }
    int v22 = policy;
    __int16 v23 = 2114;
    __int16 v24 = self;
    __int16 v25 = 1024;
    int v26 = v8;
    __int16 v27 = 2114;
    __int16 v28 = v18;
    _os_log_impl( &dword_186EAF000,  v15,  v16,  "canEvaluatePolicy:%d on %{public}@ cid:%u returned %{public}@",  buf,  0x22u);
  }

  return v12;
}

- (void)failProcessedEvent:(int64_t)a3 failureError:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  LALogForCategory();
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v11 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v26 = a3;
    __int16 v27 = 2114;
    id v28 = v8;
    __int16 v29 = 2114;
    __int16 v30 = v12;
    __int16 v31 = 1024;
    unsigned int v32 = v11;
    _os_log_impl( &dword_186EAF000,  v10,  OS_LOG_TYPE_INFO,  "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u",  buf,  0x22u);
  }

  client = self->_client;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __51__LAContext_failProcessedEvent_failureError_reply___block_invoke;
  v18[3] = &unk_189F99BA8;
  id v22 = v9;
  int64_t v23 = a3;
  id v19 = v10;
  id v20 = v8;
  unsigned int v24 = v11;
  id v21 = v12;
  id v14 = v9;
  id v15 = v12;
  id v16 = v8;
  id v17 = v10;
  -[LAClient failProcessedEvent:failureError:reply:](client, "failProcessedEvent:failureError:reply:", a3, v16, v18);
}

void __51__LAContext_failProcessedEvent_failureError_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  int v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 72);
    int v12 = @"success";
    if (!(_DWORD)a2) {
      int v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "failProcessedEvent:%d failureError:%{public}@ on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v14,  0x2Cu);
  }

  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)retryProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  LALogForCategory();
  os_log_type_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "retryProcessEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  client = self->_client;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  _DWORD v14[2] = __39__LAContext_retryProcessedEvent_reply___block_invoke;
  v14[3] = &unk_189F99BD0;
  __int16 v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  -[LAClient retryProcessedEvent:reply:](client, "retryProcessedEvent:reply:", a3, v14);
}

void __39__LAContext_retryProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!(_DWORD)a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    unsigned int v19 = v11;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "retryProcessEvent:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v13,  0x22u);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)resetProcessedEvent:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  LALogForCategory();
  os_log_type_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "resetProcessedEvent:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  client = self->_client;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  _DWORD v14[2] = __39__LAContext_resetProcessedEvent_reply___block_invoke;
  v14[3] = &unk_189F99BD0;
  uint64_t v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  -[LAClient resetProcessedEvent:reply:](client, "resetProcessedEvent:reply:", a3, v14);
}

void __39__LAContext_resetProcessedEvent_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!(_DWORD)a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    unsigned int v19 = v11;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "resetProcessedEvent:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v13,  0x22u);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)pauseProcessedEvent:(int64_t)a3 pause:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  LALogForCategory();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v10 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v5;
    __int16 v26 = 2114;
    __int16 v27 = v11;
    __int16 v28 = 1024;
    unsigned int v29 = v10;
    _os_log_impl( &dword_186EAF000,  v9,  OS_LOG_TYPE_INFO,  "pauseProcessedEvent:%d pause:%d on %{public}@ cid:%u",  buf,  0x1Eu);
  }

  client = self->_client;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke;
  v16[3] = &unk_189F99BD0;
  int v17 = v9;
  id v18 = v11;
  unsigned int v21 = v10;
  id v19 = v8;
  int64_t v20 = a3;
  id v13 = v8;
  id v14 = v11;
  uint64_t v15 = v9;
  -[LAClient pauseProcessedEvent:pause:reply:](client, "pauseProcessedEvent:pause:reply:", a3, v5, v16);
}

void __45__LAContext_pauseProcessedEvent_pause_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  BOOL v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 64);
    id v11 = @"success";
    if (!(_DWORD)a2) {
      id v11 = v5;
    }
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "pauseProcessedEvent:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v13,  0x22u);
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

- (void)setCredential:(id)a3 forProcessedEvent:(int64_t)a4 credentialType:(int64_t)a5 reply:(id)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v10 = a6;
  id v11 = a3;
  LALogForCategory();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v13 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v27 = a4;
    __int16 v28 = 1024;
    int v29 = a5;
    __int16 v30 = 2114;
    __int16 v31 = v14;
    __int16 v32 = 1024;
    unsigned int v33 = v13;
    _os_log_impl( &dword_186EAF000,  v12,  OS_LOG_TYPE_INFO,  "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u",  buf,  0x1Eu);
  }

  client = self->_client;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  void v19[2] = __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke;
  v19[3] = &unk_189F99BF8;
  int64_t v23 = a4;
  int64_t v24 = a5;
  uint64_t v20 = v12;
  id v21 = v14;
  unsigned int v25 = v13;
  id v22 = v10;
  id v16 = v10;
  id v17 = v14;
  __int16 v18 = v12;
  -[LAClient setCredential:forProcessedEvent:credentialType:reply:]( client,  "setCredential:forProcessedEvent:credentialType:reply:",  v11,  a4,  a5,  v19);
}

void __66__LAContext_setCredential_forProcessedEvent_credentialType_reply___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  BOOL v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 72);
    uint64_t v12 = @"success";
    if (!(_DWORD)a2) {
      uint64_t v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "setCredential:forProcessedEvent:%d credentialType:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v14,  0x28u);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 reply:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x189607968];
  id v11 = a6;
  id v12 = a5;
  [v10 numberWithInteger:a4];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:]( self,  "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:",  a3,  v13,  v12,  LALogCategoryForOptions(),  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  0LL,  v11);
}

- (void)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:]( self,  "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:",  a3,  a4,  v11,  LALogCategoryForOptions(),  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  0LL,  v10);
}

- (void)_evaluateAccessControl:(__SecAccessControl *)a3 operation:(id)a4 options:(id)a5 log:(int64_t)a6 cid:(unsigned int)a7 synchronous:(BOOL)a8 reply:(id)a9
{
  BOOL v25 = a8;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  if (a6)
  {
    -[LAContext description](self, "description");
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    LALogForCategory();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = "async";
      *(_DWORD *)buf = 138544642;
      unsigned int v33 = a3;
      if (v25) {
        __int16 v19 = "sync";
      }
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2114;
      id v37 = v15;
      __int16 v38 = 2114;
      v39 = v17;
      __int16 v40 = 2082;
      v41 = v19;
      __int16 v42 = 1024;
      unsigned int v43 = a7;
      _os_log_impl( &dword_186EAF000,  v18,  OS_LOG_TYPE_DEFAULT,  "evaluateAccessControl:%{public}@ operation:%{public}@ options:%{public}@ on %{public}@ (%{public}s) cid:%u",  buf,  0x3Au);
    }

    if (a3) {
      goto LABEL_7;
    }
LABEL_9:
    int v20 = 0LL;
    goto LABEL_10;
  }

  __int16 v17 = 0LL;
  if (!a3) {
    goto LABEL_9;
  }
LABEL_7:
  int v20 = (void *)SecAccessControlCopyData();
LABEL_10:
  client = self->_client;
  -[LAContext uiDelegate](self, "uiDelegate");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  void v26[2] = __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke;
  v26[3] = &unk_189F99C20;
  int v29 = a3;
  int64_t v30 = a6;
  unsigned int v31 = a7;
  id v27 = v17;
  id v28 = v16;
  id v23 = v16;
  id v24 = v17;
  -[LAClient evaluateACL:operation:options:uiDelegate:synchronous:reply:]( client,  "evaluateACL:operation:options:uiDelegate:synchronous:reply:",  v20,  v14,  v15,  v22,  v25,  v26);
}

void __80__LAContext__evaluateAccessControl_operation_options_log_cid_synchronous_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    *(void *)id v13 = 0LL;
    if (!LAUpdateAccessControl(*(void *)(a1 + 48), v5, v13))
    {

      os_log_type_t v7 = *(void **)v13;
      id v5 = 0LL;
      id v6 = v7;
    }
  }

  if (*(void *)(a1 + 56))
  {
    LALogForCategory();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(_DWORD *)(a1 + 64);
      if (v5) {
        id v11 = v5;
      }
      else {
        id v11 = v6;
      }
      *(_DWORD *)id v13 = 138543874;
      *(void *)&v13[4] = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "evaluateAccessControl on %{public}@ cid:%u returned %{public}@",  v13,  0x1Cu);
    }
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v5, v6);
  }
}

- (void)evaluateAccessControl:(SecAccessControlRef)accessControl operation:(LAAccessControlOperation)operation localizedReason:(NSString *)localizedReason reply:(void *)reply
{
  v23[1] = *MEMORY[0x1895F89C0];
  int v10 = reply;
  id v22 = &unk_189FA1028;
  v23[0] = localizedReason;
  id v11 = (void *)MEMORY[0x189603F68];
  uint64_t v12 = localizedReason;
  [v11 dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:operation];
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = LALogCategoryForOptions();
  uint64_t v16 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  void v19[2] = __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke;
  v19[3] = &unk_189F99B78;
  id v20 = v13;
  id v21 = v10;
  void v19[4] = self;
  id v17 = v13;
  id v18 = v10;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:]( self,  "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:",  accessControl,  v14,  v17,  v15,  v16,  0LL,  v19);
}

void __67__LAContext_evaluateAccessControl_operation_localizedReason_reply___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    BOOL v4 = a2 != 0;
    [*(id *)(a1 + 32) _publicErrorFromInternalError:a3 options:*(void *)(a1 + 40)];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v4, v5);
  }

- (id)evaluateAccessControl:(__SecAccessControl *)a3 operation:(int64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int16 v26 = __Block_byref_object_copy__2;
  id v27 = __Block_byref_object_dispose__2;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__2;
  id v21 = __Block_byref_object_dispose__2;
  id v22 = 0LL;
  [MEMORY[0x189607968] numberWithInteger:a4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = LALogCategoryForOptions();
  uint64_t v13 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke;
  v16[3] = &unk_189F99B48;
  void v16[4] = &v23;
  v16[5] = &v17;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:]( self,  "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:",  a3,  v11,  v10,  v12,  v13,  1LL,  v16);

  if (a6) {
    *a6 = (id) v18[5];
  }
  id v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __59__LAContext_evaluateAccessControl_operation_options_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)evaluateAccessControl:(__SecAccessControl *)a3 aksOperation:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__2;
  __int16 v26 = __Block_byref_object_dispose__2;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0LL;
  uint64_t v11 = LALogCategoryForOptions();
  uint64_t v12 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke;
  v15[3] = &unk_189F99B48;
  void v15[4] = &v22;
  void v15[5] = &v16;
  -[LAContext _evaluateAccessControl:operation:options:log:cid:synchronous:reply:]( self,  "_evaluateAccessControl:operation:options:log:cid:synchronous:reply:",  a3,  a4,  v10,  v11,  v12,  1LL,  v15);
  if (a6) {
    *a6 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __62__LAContext_evaluateAccessControl_aksOperation_options_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (LABiometryType)biometryType
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_impl(&dword_186EAF000, v2, OS_LOG_TYPE_DEFAULT, "returned biometryType: %d", (uint8_t *)v4, 8u);
  }

  return 0LL;
}

- (BOOL)setCredential:(NSData *)credential type:(LACredentialType)type
{
  id v6 = credential;
  LOBYTE(type) = -[LAContext _setCredential:type:log:cid:error:]( self,  "_setCredential:type:log:cid:error:",  v6,  type,  1LL,  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  0LL);

  return type;
}

- (BOOL)setCredential:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  LOBYTE(a5) = -[LAContext _setCredential:type:log:cid:error:]( self,  "_setCredential:type:log:cid:error:",  v8,  a4,  16LL,  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  a5);

  return (char)a5;
}

- (BOOL)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  -[LAContext description](self, "description");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  LALogForCategory();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = a4;
    LOWORD(v31) = 2114;
    *(void *)((char *)&v31 + 2) = v12;
    WORD5(v31) = 1024;
    HIDWORD(v31) = a6;
    _os_log_impl(&dword_186EAF000, v13, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v31 = buf;
  *((void *)&v31 + 1) = 0x3032000000LL;
  __int16 v32 = __Block_byref_object_copy__2;
  unsigned int v33 = __Block_byref_object_dispose__2;
  id v34 = 0LL;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  client = self->_client;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  _OWORD v22[2] = __47__LAContext__setCredential_type_log_cid_error___block_invoke;
  v22[3] = &unk_189F99C48;
  uint64_t v16 = v13;
  uint64_t v23 = v16;
  id v17 = v11;
  id v24 = v17;
  int64_t v28 = a4;
  id v18 = v12;
  unsigned int v29 = a6;
  id v25 = v18;
  id v27 = buf;
  uint64_t v19 = v14;
  __int16 v26 = v19;
  -[LAClient setCredential:type:reply:](client, "setCredential:type:reply:", v17, a4, v22);
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  if (a7) {
    *a7 = *(id *)(v31 + 40);
  }
  BOOL v20 = *(void *)(v31 + 40) == 0LL;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __47__LAContext__setCredential_type_log_cid_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = *(void *)(a1 + 40) != 0LL;
    uint64_t v10 = *(void *)(a1 + 72);
    int v11 = *(_DWORD *)(a1 + 80);
    uint64_t v12 = @"success";
    if (!a2) {
      uint64_t v12 = v5;
    }
    v16[0] = 67110146;
    v16[1] = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v16,  0x28u);
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8LL);
  dispatch_semaphore_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
  uint64_t v15 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)setCredential:(id)a3 type:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[LAContext _setCredential:type:log:cid:reply:]( self,  "_setCredential:type:log:cid:reply:",  v9,  a4,  16LL,  +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId"),  v8);
}

- (void)_setCredential:(id)a3 type:(int64_t)a4 log:(int64_t)a5 cid:(unsigned int)a6 reply:(id)a7
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a7;
  -[LAContext description](self, "description");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  LALogForCategory();
  dispatch_semaphore_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v28 = a4;
    __int16 v29 = 2114;
    int64_t v30 = v13;
    __int16 v31 = 1024;
    unsigned int v32 = a6;
    _os_log_impl(&dword_186EAF000, v14, OS_LOG_TYPE_INFO, "setCredential:type:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  client = self->_client;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __47__LAContext__setCredential_type_log_cid_reply___block_invoke;
  v20[3] = &unk_189F99BA8;
  __int16 v21 = v14;
  id v22 = v11;
  id v24 = v12;
  int64_t v25 = a4;
  unsigned int v26 = a6;
  id v23 = v13;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  __int16 v19 = v14;
  -[LAClient setCredential:type:reply:](client, "setCredential:type:reply:", v18, a4, v20);
}

void __47__LAContext__setCredential_type_log_cid_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  id v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    BOOL v9 = *(void *)(a1 + 40) != 0LL;
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = *(_DWORD *)(a1 + 72);
    id v12 = @"success";
    if (!(_DWORD)a2) {
      id v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v9;
    __int16 v15 = 1024;
    int v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "setCredential:%d type:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v14,  0x28u);
  }

  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (void)credentialOfType:(int64_t)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  LALogForCategory();
  os_log_type_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v8 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 1024;
    unsigned int v25 = v8;
    _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_INFO, "credentialOfType:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  client = self->_client;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  _DWORD v14[2] = __36__LAContext_credentialOfType_reply___block_invoke;
  v14[3] = &unk_189F99C70;
  __int16 v15 = v7;
  id v16 = v9;
  unsigned int v19 = v8;
  id v17 = v6;
  int64_t v18 = a3;
  id v11 = v6;
  id v12 = v9;
  uint64_t v13 = v7;
  -[LAClient credentialOfType:reply:](client, "credentialOfType:reply:", a3, v14);
}

void __36__LAContext_credentialOfType_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5 || [MEMORY[0x189608798] error:v6 hasCode:-1008])
  {
    os_log_type_t v7 = *(os_log_s **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *(_DWORD *)(a1 + 64);
      v11[0] = 67109634;
      v11[1] = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = v10;
      _os_log_impl( &dword_186EAF000,  v7,  OS_LOG_TYPE_DEFAULT,  "credentialOfType:%d on %{public}@ cid:%u returned",  (uint8_t *)v11,  0x18u);
    }
  }

  else if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
  {
    __36__LAContext_credentialOfType_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (id)credentialOfType:(int64_t)a3 error:(id *)a4
{
  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  __int16 v24 = __Block_byref_object_copy__2;
  unsigned int v25 = __Block_byref_object_dispose__2;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  int64_t v18 = __Block_byref_object_copy__2;
  unsigned int v19 = __Block_byref_object_dispose__2;
  id v20 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  _DWORD v11[2] = __36__LAContext_credentialOfType_error___block_invoke;
  v11[3] = &unk_189F99C98;
  uint64_t v13 = &v21;
  __int16 v14 = &v15;
  uint64_t v8 = v7;
  __int16 v12 = v8;
  -[LAContext credentialOfType:reply:](self, "credentialOfType:reply:", a3, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __36__LAContext_credentialOfType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8LL);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isCredentialSet:(LACredentialType)type
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = type;
    LOWORD(v23) = 2114;
    *(void *)((char *)&v23 + 2) = v7;
    WORD5(v23) = 1024;
    HIDWORD(v23) = v6;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "isCredentialSet:%d on %{public}@ cid:%u", buf, 0x18u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v23 = buf;
  *((void *)&v23 + 1) = 0x2020000000LL;
  char v24 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  client = self->_client;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __29__LAContext_isCredentialSet___block_invoke;
  v15[3] = &unk_189F99CC0;
  unsigned int v19 = buf;
  int v10 = v8;
  uint64_t v16 = v10;
  id v11 = v5;
  uint64_t v17 = v11;
  LACredentialType v20 = type;
  id v12 = v7;
  id v18 = v12;
  unsigned int v21 = v6;
  -[LAClient isCredentialSet:reply:](client, "isCredentialSet:reply:", type, v15);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v13 = *(_BYTE *)(v23 + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v13;
}

void __29__LAContext_isCredentialSet___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  unsigned int v6 = (os_log_s *)*(id *)(a1 + 40);
  if ((a2 & 1) != 0)
  {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }

  else if ([MEMORY[0x189608798] error:v5 hasCode:-1008])
  {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }

  else
  {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }

  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = *(_DWORD *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
      id v11 = @"YES";
    }
    else {
      id v11 = v5;
    }
    v12[0] = 67109890;
    v12[1] = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    id v18 = v11;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "isCredentialSet:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v12,  0x22u);
  }
}

- (void)prearmTouchIDWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LALogForCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "prearmTouchIDWithReply on %{public}@ cid:%u", buf, 0x12u);
  }

  client = self->_client;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  _DWORD v12[2] = __36__LAContext_prearmTouchIDWithReply___block_invoke;
  v12[3] = &unk_189F99CE8;
  void v12[4] = self;
  __int16 v13 = v5;
  unsigned int v16 = v6;
  id v14 = v7;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  id v11 = v5;
  -[LAClient prearmTouchIdWithReply:](client, "prearmTouchIdWithReply:", v12);
}

void __36__LAContext_prearmTouchIDWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  os_log_type_t v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8LL), a2);
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }

  else
  {
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }

  id v9 = *(os_log_s **)(a1 + 40);
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = *(_DWORD *)(a1 + 64);
    id v12 = @"success";
    if (!v6) {
      id v12 = v7;
    }
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    int v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_impl( &dword_186EAF000,  v9,  v8,  "prearmTouchIDWithReply on %{public}@ cid:%u returned %{public}@",  (uint8_t *)&v13,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)resetWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LALogForCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "resetWithReply on %{public}@ cid:%u", buf, 0x12u);
  }

  client = self->_client;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  _DWORD v12[2] = __28__LAContext_resetWithReply___block_invoke;
  v12[3] = &unk_189F99D10;
  int v13 = v5;
  id v14 = v7;
  unsigned int v16 = v6;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  int v11 = v5;
  -[LAClient resetProcessedEvent:reply:](client, "resetProcessedEvent:reply:", 0LL, v12);
}

void __28__LAContext_resetWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  unsigned int v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = *(_DWORD *)(a1 + 56);
    id v10 = @"success";
    if (!(_DWORD)a2) {
      id v10 = v5;
    }
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "resetWithReply on %{public}@ cid:%u returned %{public}@",  (uint8_t *)&v12,  0x1Cu);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v11 + 16))(v11, a2, v5);
  }
}

- (void)authMethodWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  LALogForCategory();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v6 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v7;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    _os_log_impl(&dword_186EAF000, v5, OS_LOG_TYPE_INFO, "authMethodWithReply on %{public}@ cid:%u", buf, 0x12u);
  }

  client = self->_client;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  _DWORD v12[2] = __33__LAContext_authMethodWithReply___block_invoke;
  v12[3] = &unk_189F99D38;
  uint64_t v13 = v5;
  id v14 = v7;
  unsigned int v16 = v6;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  uint64_t v11 = v5;
  -[LAClient authMethodWithReply:](client, "authMethodWithReply:", v12);
}

void __33__LAContext_authMethodWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  os_log_type_t v7 = (os_log_s *)*(id *)(a1 + 32);
  os_log_type_t v8 = 16 * (v5 == 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 56);
    if (v5)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v11 = v6;
    }

    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl( &dword_186EAF000,  v7,  v8,  "authMethodWithReply on %{public}@ cid:%u returned %{public}@",  (uint8_t *)&v12,  0x1Cu);
    if (v5) {
  }
    }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)setShowingCoachingHint:(BOOL)a3 event:(int64_t)a4 reply:(id)a5
{
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  LALogForCategory();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v10 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    BOOL v24 = v6;
    __int16 v25 = 1024;
    int v26 = a4;
    __int16 v27 = 2114;
    int v28 = v11;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    _os_log_impl( &dword_186EAF000,  v9,  OS_LOG_TYPE_INFO,  "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u",  buf,  0x1Eu);
  }

  client = self->_client;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  _DWORD v16[2] = __48__LAContext_setShowingCoachingHint_event_reply___block_invoke;
  v16[3] = &unk_189F99D60;
  BOOL v22 = v6;
  __int16 v17 = v9;
  id v18 = v11;
  unsigned int v21 = v10;
  id v19 = v8;
  int64_t v20 = a4;
  id v13 = v8;
  id v14 = v11;
  int v15 = v9;
  -[LAClient setShowingCoachingHint:event:reply:](client, "setShowingCoachingHint:event:reply:", v6, a4, v16);
}

void __48__LAContext_setShowingCoachingHint_event_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v6 = *(os_log_s **)(a1 + 32);
  if ((_DWORD)a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    int v8 = *(unsigned __int8 *)(a1 + 68);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = *(_DWORD *)(a1 + 64);
    int v12 = @"success";
    if (!(_DWORD)a2) {
      int v12 = v5;
    }
    v14[0] = 67110146;
    v14[1] = v8;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2114;
    BOOL v22 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "setShowingCoachingHint:%d event:%d on %{public}@ cid:%u returned %{public}@",  (uint8_t *)v14,  0x28u);
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v13 + 16))(v13, a2, v5);
  }
}

- (BOOL)checkContextValidWithError:(id *)a3
{
  if (a3)
  {
    -[LAClient permanentError](self->_client, "permanentError");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[LAClient permanentError](self->_client, "permanentError");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = v5 == 0LL;

  return v6;
}

- (BOOL)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  LALogForCategory();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v13 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v34) = a5;
    WORD2(v34) = 2114;
    *(void *)((char *)&v34 + 6) = v14;
    HIWORD(v34) = 1024;
    LODWORD(v35) = v13;
    _os_log_impl( &dword_186EAF000,  v12,  OS_LOG_TYPE_INFO,  "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ options:%u on %{public}@ cid:%u",  buf,  0x2Cu);
  }

  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&__int128 v34 = __Block_byref_object_copy__2;
  *((void *)&v34 + 1) = __Block_byref_object_dispose__2;
  id v35 = 0LL;
  client = self->_client;
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  _OWORD v22[2] = __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke;
  v22[3] = &unk_189F99D88;
  int v16 = v12;
  uint64_t v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v18 = v11;
  id v25 = v18;
  id v19 = v14;
  unsigned int v29 = v13;
  id v26 = v19;
  __int16 v27 = &v30;
  int v28 = buf;
  -[LAClient verifyFileVaultUser:volumeUuid:options:reply:]( client,  "verifyFileVaultUser:volumeUuid:options:reply:",  v17,  v18,  a5,  v22);
  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40LL);
  }
  BOOL v20 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);

  return v20;
}

void __58__LAContext_verifyFileVaultUser_volumeUuid_options_error___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v6 = *(os_log_s **)(a1 + 32);
  if (a2) {
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), v7))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = *(_DWORD *)(a1 + 80);
    int v12 = @"success";
    if (!a2) {
      int v12 = v5;
    }
    int v15 = 138544386;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    int v22 = v11;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( &dword_186EAF000,  v6,  v7,  "verifyFileVaultUser:%{public}@ volumeUuid:%{public}@ on %{public}@ cid:%u returned %{public}@",  (uint8_t *)&v15,  0x30u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a2;
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

- (id)_serverPropertyValueForOption:(int64_t)a3
{
  return -[LAContext _serverPropertyValueForOption:log:](self, "_serverPropertyValueForOption:log:", a3, 16LL);
}

- (id)_serverPropertyValueForOption:(int64_t)a3 log:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v7 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v19 = a3;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    _os_log_impl( &dword_186EAF000,  v6,  OS_LOG_TYPE_INFO,  "serverPropertyValueForOption:%d on %{public}@ cid:%u",  buf,  0x18u);
  }

  client = self->_client;
  id v17 = 0LL;
  -[LAClient serverPropertyForOption:error:](client, "serverPropertyForOption:error:", a3, &v17);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v17;
  [MEMORY[0x189603FE8] null];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v10 isEqual:v12];

  if (v13)
  {

    uint64_t v10 = 0LL;
  }

  os_log_type_t v14 = 16 * (v11 != 0LL);
  if (os_log_type_enabled(v6, v14))
  {
    if (v11) {
      id v15 = v11;
    }
    else {
      id v15 = v10;
    }
    *(_DWORD *)buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_impl( &dword_186EAF000,  v6,  v14,  "serverPropertyValueForOption:%d on %{public}@ cid:%u returned %{public}@",  buf,  0x22u);
  }

  return v10;
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4
{
}

- (void)_setServerPropertyForOption:(int64_t)a3 value:(id)a4 log:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  LALogForCategory();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v9 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    unsigned int v23 = v10;
    __int16 v24 = 1024;
    unsigned int v25 = v9;
    _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_INFO,  "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u",  buf,  0x22u);
  }

  client = self->_client;
  int v12 = v7;
  if (!v7)
  {
    [MEMORY[0x189603FE8] null];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v17 = 0LL;
  BOOL v13 = -[LAClient setServerPropertyForOption:value:error:]( client,  "setServerPropertyForOption:value:error:",  a3,  v12,  &v17);
  os_log_type_t v14 = (__CFString *)v17;
  if (!v7) {

  }
  os_log_type_t v15 = 16 * (v14 != 0LL);
  if (os_log_type_enabled(v8, v15))
  {
    uint64_t v16 = @"success";
    *(_DWORD *)buf = 67110146;
    if (!v13) {
      uint64_t v16 = v14;
    }
    int v19 = a3;
    __int16 v20 = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    unsigned int v23 = v10;
    __int16 v24 = 1024;
    unsigned int v25 = v9;
    __int16 v26 = 2114;
    __int16 v27 = v16;
    _os_log_impl( &dword_186EAF000,  v8,  v15,  "setServerPropertyForOption:%d value:%{public}@ on %{public}@ cid:%u returned %{public}@",  buf,  0x2Cu);
  }
}

- (NSString)localizedFallbackTitle
{
  return (NSString *)-[LAContext _serverPropertyValueForOption:log:]( self,  "_serverPropertyValueForOption:log:",  1LL,  8LL);
}

- (void)setLocalizedFallbackTitle:(NSString *)localizedFallbackTitle
{
}

- (NSString)localizedCancelTitle
{
  return (NSString *)-[LAContext _serverPropertyValueForOption:log:]( self,  "_serverPropertyValueForOption:log:",  1018LL,  8LL);
}

- (void)setLocalizedCancelTitle:(NSString *)localizedCancelTitle
{
}

- (NSData)externalizedContext
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v4 = +[LAContext newCommandId](&OBJC_CLASS___LAContext, "newCommandId");
  -[LAContext description](self, "description");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543618;
    int v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    _os_log_impl( &dword_186EAF000,  v3,  OS_LOG_TYPE_INFO,  "externalizedContext on %{public}@ cid:%u",  (uint8_t *)&v11,  0x12u);
  }

  -[LAClient externalizedContext](self->_client, "externalizedContext");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  os_log_type_t v8 = 16 * (v6 == 0LL);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = [v6 hash];
    int v11 = 138543874;
    int v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_impl( &dword_186EAF000,  v7,  v8,  "externalizedContext on %{public}@ cid:%u returned %x",  (uint8_t *)&v11,  0x18u);
  }

  return (NSData *)v6;
}

- (id)uuid
{
  return -[LAClient uuid](self->_client, "uuid");
}

- (LAUIDelegate)uiDelegate
{
  return -[LAClient uiDelegate](self->_client, "uiDelegate");
}

- (void)setUiDelegate:(id)a3
{
}

- (void)bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
}

- (void)addContextObserver:(id)a3
{
  id v4 = a3;
  -[LAContext observers](self, "observers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x1896078B8] weakObjectsHashTable];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAContext setObservers:](self, "setObservers:", v6);
  }

  -[LAContext observers](self, "observers");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v4];
}

- (void)removeContextObserver:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[LAContext observers](self, "observers");
  if (v4)
  {
    id v5 = (void *)v4;
    -[LAContext observers](self, "observers");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = [v6 containsObject:v9];

    if (v7)
    {
      -[LAContext observers](self, "observers");
      os_log_type_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 removeObject:v9];
    }
  }
}

- (void)_notifyObserversAfterInvalidation
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  LALogForCategory();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[LAContext observers](self, "observers");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    int v23 = [v4 count];
    __int16 v24 = 2114;
    unsigned int v25 = self;
    _os_log_impl( &dword_186EAF000,  v3,  OS_LOG_TYPE_INFO,  "Will notify %d observers of changes in %{public}@",  buf,  0x12u);
  }

  id v5 = (void *)MEMORY[0x189603F18];
  -[LAContext observers](self, "observers");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 allObjects];
  os_log_type_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x189604A58];
  }
  [v5 arrayWithArray:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend(v16, "contextDidBecomeInvalid:", self, (void)v17);
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v13);
  }
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter_0;
}

+ (unsigned)newCommandId
{
  return ++_commandCounter;
}

- (id)optionNotInteractive
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1000LL);
}

- (void)setOptionNotInteractive:(id)a3
{
}

- (id)optionTimeout
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1001LL);
}

- (void)setOptionTimeout:(id)a3
{
}

- (id)optionCallerName
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1021LL);
}

- (void)setOptionCallerName:(id)a3
{
}

- (id)optionCallerPID
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1027LL);
}

- (void)setOptionCallerPID:(id)a3
{
}

- (id)optionMaxCredentialAge
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1077LL);
}

- (void)setOptionMaxCredentialAge:(id)a3
{
}

- (BOOL)interactionNotAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setInteractionNotAllowed:(BOOL)interactionNotAllowed
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAContext _setServerPropertyForOption:value:log:](self, "_setServerPropertyForOption:value:log:", 1000LL, v4, 8LL);
}

- (id)optionEventProcessing
{
  return -[LAContext _serverPropertyValueForOption:](self, "_serverPropertyValueForOption:", 1007LL);
}

- (void)setOptionEventProcessing:(id)a3
{
}

- (NSNumber)maxBiometryFailures
{
  return self->_maxBiometryFailures;
}

- (void)setMaxBiometryFailures:(NSNumber *)maxBiometryFailures
{
}

- (NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  return self->_touchIDAuthenticationAllowableReuseDuration;
}

- (void)setTouchIDAuthenticationAllowableReuseDuration:(NSTimeInterval)touchIDAuthenticationAllowableReuseDuration
{
  self->_touchIDAuthenticationAllowableReuseDuration = touchIDAuthenticationAllowableReuseDuration;
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(NSString *)localizedReason
{
}

- (void)setBiometryType:(int64_t)a3
{
  self->_biometryType = a3;
}

- (NSData)evaluatedPolicyDomainState
{
  return self->_evaluatedPolicyDomainState;
}

- (void)setEvaluatedPolicyDomainState:(id)a3
{
}

- (LADomainState)domainState
{
  return self->_domainState;
}

- (void)setExternalizedContext:(id)a3
{
}

- (NSNumber)touchIDAuthenticationRetryLimit
{
  return self->_touchIDAuthenticationRetryLimit;
}

- (void)setTouchIDAuthenticationRetryLimit:(id)a3
{
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (LAClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

void __29__LAContext_encodeWithCoder___block_invoke_cold_1()
{
}

void __29__LAContext_encodeWithCoder___block_invoke_33_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 52);
  int v5 = 138543874;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_debug_impl( &dword_186EAF000,  a2,  OS_LOG_TYPE_DEBUG,  "Encoded %{public}@ for transfer to pid:%d cid:%u",  (uint8_t *)&v5,  0x18u);
  OUTLINED_FUNCTION_4_0();
}

void __29__LAContext_encodeWithCoder___block_invoke_33_cold_2()
{
}

void __36__LAContext_credentialOfType_reply___block_invoke_cold_1()
{
}

@end