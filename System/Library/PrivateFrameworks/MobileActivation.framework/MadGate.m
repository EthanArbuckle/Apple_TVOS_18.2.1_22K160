@interface MadGate
- (BOOL)deactivateDevice:(id *)a3;
- (BOOL)deleteLegacyDeviceIdentity:(id *)a3;
- (BOOL)handleActivationInfo:(id)a3 withError:(id *)a4;
- (BOOL)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 error:(id *)a5;
- (BOOL)isDeviceABrick:(id *)a3;
- (BOOL)isInFieldCollected:(id *)a3;
- (BOOL)isUCRTAvailable:(id *)a3;
- (BOOL)issueUCRT:(id)a3 withError:(id *)a4;
- (BOOL)reactivateDevice:(id *)a3;
- (BOOL)recertifyDeviceWithError:(id *)a3;
- (BOOL)ucrtUpgradeRequired:(id *)a3;
- (BOOL)unbrickDevice:(id *)a3;
- (MadGate)init;
- (NSXPCConnection)connection;
- (__SecIdentity)copyLegacyDeviceIdentity:(id *)a3;
- (id)copyActivationRecord:(id *)a3;
- (id)copyDCRT:(id)a3 withError:(id *)a4;
- (id)copyPCRTToken:(id *)a3;
- (id)copyUCRTVersionInfo:(id *)a3;
- (id)createActivationInfo:(id *)a3;
- (id)createTunnel1ActivationInfo:(id)a3 options:(id)a4 error:(id *)a5;
- (id)createTunnel1SessionInfo:(id *)a3;
- (id)getActivationBuild:(id *)a3;
- (id)getActivationState:(id *)a3;
- (id)getDCRTState:(id)a3 withError:(id *)a4;
- (id)getUCRTActivationLockState:(id *)a3;
- (id)issueClientCertificateLegacy:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)issueCollection:(id)a3 withCompletion:(id)a4;
- (void)issueDCRT:(id)a3 withCompletion:(id)a4;
- (void)updateBasebandTicket:(__SecKey *)a3 baaCert:(__SecCertificate *)a4 baaIntermediateCert:(__SecCertificate *)a5 options:(id)a6 withCompletion:(id)a7;
@end

@implementation MadGate

- (MadGate)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MadGate;
  v2 = -[MadGate init](&v7, sel_init);
  if (v2)
  {
    id v3 = (id)[MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D9058];
    uint64_t v4 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.mobileactivationd" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  id v3 = -[MadGate connection](self, "connection");
  -[NSXPCConnection invalidate](v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MadGate;
  -[MadGate dealloc](&v4, sel_dealloc);
}

- (id)getUCRTActivationLockState:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 =  createMobileActivationError( (uint64_t)"-[MadGate getUCRTActivationLockState:]",  59LL,  @"com.apple.MobileActivation.ErrorDomain",  -3LL,  0LL,  @"SPI not supported on iOS.");
  if (v4 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (a3) {
    *a3 = v4;
  }

  return 0LL;
}

- (id)getActivationState:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  id v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __30__MadGate_getActivationState___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __30__MadGate_getActivationState___block_invoke_91;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 getActivationStateWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __30__MadGate_getActivationState___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate getActivationState:]_block_invoke",  91LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_getActivationState___block_invoke_91(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"ActivationState"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"ActivationState"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (id)getActivationBuild:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __30__MadGate_getActivationBuild___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __30__MadGate_getActivationBuild___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 getActivationBuildWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  id v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    id v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __30__MadGate_getActivationBuild___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate getActivationBuild:]_block_invoke",  122LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_getActivationBuild___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"LastActivated"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"LastActivated"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (BOOL)isUCRTAvailable:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __27__MadGate_isUCRTAvailable___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __27__MadGate_isUCRTAvailable___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 copyUCRTWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __27__MadGate_isUCRTAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate isUCRTAvailable:]_block_invoke",  154LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __27__MadGate_isUCRTAvailable___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = (id)[a2 objectForKeyedSubscript:@"UCRTData"];
  id v7 = isNSData(v6);

  if (v7) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)copyPCRTToken:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __25__MadGate_copyPCRTToken___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __25__MadGate_copyPCRTToken___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 copyPCRTTokenWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __25__MadGate_copyPCRTToken___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate copyPCRTToken:]_block_invoke",  186LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __25__MadGate_copyPCRTToken___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"PCRTToken"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"PCRTToken"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (BOOL)isDeviceABrick:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 1;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __26__MadGate_isDeviceABrick___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __26__MadGate_isDeviceABrick___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 isDeviceBrickedWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && *((_BYTE *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __26__MadGate_isDeviceABrick___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate isDeviceABrick:]_block_invoke",  219LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __26__MadGate_isDeviceABrick___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"BrickState"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"BrickState"];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (id)createTunnel1SessionInfo:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __36__MadGate_createTunnel1SessionInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 createTunnel1SessionInfoWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  id v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    id v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __36__MadGate_createTunnel1SessionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate createTunnel1SessionInfo:]_block_invoke",  251LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_createTunnel1SessionInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)createTunnel1ActivationInfo:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v10 = -[MadGate connection](self, "connection");
  uint64_t v11 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3254779904LL;
  v18[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke;
  v18[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v18[4] = &v19;
  id v12 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v10,  "synchronousRemoteObjectProxyWithErrorHandler:",  v18);

  v17[0] = v11;
  v17[1] = 3254779904LL;
  v17[2] = __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2;
  v17[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v17[4] = &v25;
  v17[5] = &v19;
  [v12 createTunnel1ActivationInfo:v8 options:v9 withCompletionBlock:v17];
  if (v20[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v20[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v13;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  v14 = (void *)v26[5];
  if (a5 && !v14)
  {
    *a5 = (id) v20[5];
    v14 = (void *)v26[5];
  }

  id v15 = v14;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate createTunnel1ActivationInfo:options:error:]_block_invoke",  280LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __53__MadGate_createTunnel1ActivationInfo_options_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)createActivationInfo:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __32__MadGate_createActivationInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __32__MadGate_createActivationInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  v11[5] = &v13;
  [v6 createActivationInfoWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  id v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    id v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __32__MadGate_createActivationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate createActivationInfo:]_block_invoke",  309LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MadGate_createActivationInfo___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)handleActivationInfo:(id)a3 withError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0LL;
  uint64_t v7 = -[MadGate connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3254779904LL;
  v14[2] = __42__MadGate_handleActivationInfo_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  id v9 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v7,  "synchronousRemoteObjectProxyWithErrorHandler:",  v14);

  v13[0] = v8;
  v13[1] = 3254779904LL;
  v13[2] = __42__MadGate_handleActivationInfo_withError___block_invoke_2;
  v13[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v15;
  [v9 handleActivationInfo:v6 withCompletionBlock:v13];
  uint64_t v10 = v16[5];
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v16[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a4) {
      *a4 = (id) v16[5];
    }
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __42__MadGate_handleActivationInfo_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate handleActivationInfo:withError:]_block_invoke",  338LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __42__MadGate_handleActivationInfo_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)handleActivationInfoWithSession:(id)a3 activationSignature:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0LL;
  uint64_t v10 = -[MadGate connection](self, "connection");
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3254779904LL;
  v17[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke;
  v17[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v17[4] = &v18;
  id v12 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v10,  "synchronousRemoteObjectProxyWithErrorHandler:",  v17);

  v16[0] = v11;
  v16[1] = 3254779904LL;
  v16[2] = __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2;
  v16[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v16[4] = &v18;
  [v12 handleActivationInfoWithSession:v8 activationSignature:v9 completionBlock:v16];
  uint64_t v13 = v19[5];
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v19[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a5) {
      *a5 = (id) v19[5];
    }
  }

  _Block_object_dispose(&v18, 8);
  return v13 == 0;
}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke( uint64_t a1,  void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate handleActivationInfoWithSession:activationSignature:error:]_block_invoke",  368LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __69__MadGate_handleActivationInfoWithSession_activationSignature_error___block_invoke_2( uint64_t a1,  int a2,  id obj)
{
}

- (BOOL)deactivateDevice:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3254779904LL;
  v11[2] = __28__MadGate_deactivateDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);

  v10[0] = v5;
  v10[1] = 3254779904LL;
  v10[2] = __28__MadGate_deactivateDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v6 deactivateDeviceWithCompletionBlock:v10];
  uint64_t v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __28__MadGate_deactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate deactivateDevice:]_block_invoke",  398LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __28__MadGate_deactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)reactivateDevice:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3254779904LL;
  v11[2] = __28__MadGate_reactivateDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);

  v10[0] = v5;
  v10[1] = 3254779904LL;
  v10[2] = __28__MadGate_reactivateDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v6 requestDeviceReactivationWithCompletionBlock:v10];
  uint64_t v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __28__MadGate_reactivateDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate reactivateDevice:]_block_invoke",  428LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __28__MadGate_reactivateDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)copyActivationRecord:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __32__MadGate_copyActivationRecord___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __32__MadGate_copyActivationRecord___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  void v11[5] = &v13;
  [v6 copyActivationRecordWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __32__MadGate_copyActivationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate copyActivationRecord:]_block_invoke",  458LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __32__MadGate_copyActivationRecord___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (BOOL)unbrickDevice:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3254779904LL;
  v11[2] = __25__MadGate_unbrickDevice___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);

  v10[0] = v5;
  v10[1] = 3254779904LL;
  v10[2] = __25__MadGate_unbrickDevice___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v6 unbrickDeviceWithCompletionBlock:v10];
  uint64_t v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __25__MadGate_unbrickDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate unbrickDevice:]_block_invoke",  487LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __25__MadGate_unbrickDevice___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)recertifyDeviceWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3254779904LL;
  v11[2] = __36__MadGate_recertifyDeviceWithError___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);

  v10[0] = v5;
  v10[1] = 3254779904LL;
  v10[2] = __36__MadGate_recertifyDeviceWithError___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v6 recertifyDeviceWithCompletionBlock:v10];
  uint64_t v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __36__MadGate_recertifyDeviceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate recertifyDeviceWithError:]_block_invoke",  517LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_recertifyDeviceWithError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)issueClientCertificateLegacy:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0LL;
  uint64_t v7 = -[MadGate connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3254779904LL;
  v15[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  id v9 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v7,  "synchronousRemoteObjectProxyWithErrorHandler:",  v15);

  v14[0] = v8;
  v14[1] = 3254779904LL;
  v14[2] = __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  void v14[5] = &v16;
  [v9 issueClientCertificateLegacy:v6 WithCompletionBlock:v14];
  if (v17[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = (id) v17[5];
    uint64_t v11 = (void *)v23[5];
  }

  id v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate issueClientCertificateLegacy:error:]_block_invoke",  547LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46__MadGate_issueClientCertificateLegacy_error___block_invoke_2(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = (id)[a2 objectForKeyedSubscript:@"RKCertification"];
  id v7 = isNSData(v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (BOOL)isInFieldCollected:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __30__MadGate_isInFieldCollected___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __30__MadGate_isInFieldCollected___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  void v11[5] = &v13;
  [v6 isInFieldCollectedWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __30__MadGate_isInFieldCollected___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate isInFieldCollected:]_block_invoke",  576LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_isInFieldCollected___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"CollectionLastPerformed"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"CollectionLastPerformed"];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (void)updateBasebandTicket:(__SecKey *)a3 baaCert:(__SecCertificate *)a4 baaIntermediateCert:(__SecCertificate *)a5 options:(id)a6 withCompletion:(id)a7
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v12 = a6;
  id v13 = a7;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0LL;
  if (a3 && a4 && a5)
  {
    uint64_t v14 = (void *)[v12 mutableCopy];
    uint64_t v15 = (id *)(v35 + 5);
    id obj = (id)v35[5];
    id v33 = 0LL;
    id v16 = security_create_external_representation(a3, (uint64_t)&v33, &obj);
    id v17 = v33;
    objc_storeStrong(v15, obj);
    if (v16)
    {
      [v14 setObject:v17 forKeyedSubscript:@"SigningKeyAttributes"];
      CFDataRef v18 = SecCertificateCopyData(a4);
      if (v18)
      {
        CFDataRef v19 = SecCertificateCopyData(a5);
        if (v19)
        {
          uint64_t v20 = -[MadGate connection](self, "connection");
          v29[0] = MEMORY[0x1895F87A8];
          v29[1] = 3254779904LL;
          v29[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke;
          v29[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
          v31 = &v34;
          id v21 = v13;
          id v30 = v21;
          id v25 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v20, "remoteObjectProxyWithErrorHandler:", v29);

          v26[0] = MEMORY[0x1895F87A8];
          v26[1] = 3254779904LL;
          v26[2] = __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_99;
          v26[3] = &__block_descriptor_56_e8_32s40bs48r_e34_v24__0__NSDictionary_8__NSError_16l;
          v28 = &v34;
          v26[4] = self;
          id v27 = v21;
          [v25 updateBasebandTicket:v16 baaCertData:v18 baaIntermediateCert:v19 options:v14 withCompletionBlock:v26];

          goto LABEL_17;
        }

        id v22 =  createMobileActivationError( (uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]",  640LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy certificate data.");
      }

      else
      {
        id v22 =  createMobileActivationError( (uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]",  634LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to copy certificate data.");
        CFDataRef v18 = 0LL;
      }
    }

    else
    {
      id v22 =  createMobileActivationError( (uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]",  626LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  (void *)v35[5],  @"Failed to encode RK as data.");
      CFDataRef v18 = 0LL;
      id v16 = 0LL;
    }
  }

  else
  {
    id v22 =  createMobileActivationError( (uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]",  618LL,  @"com.apple.MobileActivation.ErrorDomain",  -2LL,  0LL,  @"Invalid input(s).");
    CFDataRef v18 = 0LL;
    uint64_t v14 = 0LL;
    id v16 = 0LL;
    id v17 = 0LL;
  }

  id v23 = (void *)v35[5];
  v35[5] = (uint64_t)v22;

  if (v35[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v35[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v41 = v24;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v13) {
    (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0LL, v35[5]);
  }
LABEL_17:

  _Block_object_dispose(&v34, 8);
}

uint64_t __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:]_block_invoke",  648LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  0LL,  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }
  return result;
}

void __83__MadGate_updateBasebandTicket_baaCert_baaIntermediateCert_options_withCompletion___block_invoke_99( uint64_t a1,  int a2,  id a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))( v7,  0LL,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  }
  id v8 = (id)[*(id *)(a1 + 32) connection];
  [v8 invalidate];
}

- (id)getDCRTState:(id)a3 withError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  CFDataRef v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0LL;
  uint64_t v7 = -[MadGate connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3254779904LL;
  v15[2] = __34__MadGate_getDCRTState_withError___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  id v9 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v7,  "synchronousRemoteObjectProxyWithErrorHandler:",  v15);

  v14[0] = v8;
  v14[1] = 3254779904LL;
  v14[2] = __34__MadGate_getDCRTState_withError___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  void v14[5] = &v16;
  [v9 getDCRTStateWithCompletionBlock:v6 withCompletion:v14];
  if (v17[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = (id) v17[5];
    uint64_t v11 = (void *)v23[5];
  }

  id v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __34__MadGate_getDCRTState_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate getDCRTState:withError:]_block_invoke",  696LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __34__MadGate_getDCRTState_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"DCRTState"];
  id v8 = isNSString(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"DCRTState"];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
}

- (id)copyDCRT:(id)a3 withError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  CFDataRef v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0LL;
  id v7 = -[MadGate connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3254779904LL;
  v15[2] = __30__MadGate_copyDCRT_withError___block_invoke;
  v15[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  id v9 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v7,  "synchronousRemoteObjectProxyWithErrorHandler:",  v15);

  v14[0] = v8;
  v14[1] = 3254779904LL;
  v14[2] = __30__MadGate_copyDCRT_withError___block_invoke_2;
  v14[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v14[4] = &v22;
  void v14[5] = &v16;
  [v9 copyDCRTWithCompletionBlock:v6 withCompletion:v14];
  if (v17[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v17[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v10;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v11 = (void *)v23[5];
  if (a4 && !v11)
  {
    *a4 = (id) v17[5];
    uint64_t v11 = (void *)v23[5];
  }

  id v12 = v11;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __30__MadGate_copyDCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate copyDCRT:withError:]_block_invoke",  728LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __30__MadGate_copyDCRT_withError___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"DCRTData"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"DCRTData"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (void)issueDCRT:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v23 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0LL;
  id v8 = -[MadGate connection](self, "connection");
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3254779904LL;
  v17[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke;
  v17[3] = &__block_descriptor_48_e8_32bs40r_e17_v16__0__NSError_8l;
  CFDataRef v19 = v20;
  id v10 = v7;
  id v18 = v10;
  id v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v17);

  v13[0] = v9;
  v13[1] = 3254779904LL;
  v13[2] = __36__MadGate_issueDCRT_withCompletion___block_invoke_100;
  v13[3] = &__block_descriptor_64_e8_32s40bs48r56r_e34_v24__0__NSDictionary_8__NSError_16l;
  uint64_t v15 = v22;
  uint64_t v16 = v20;
  id v12 = v10;
  v13[4] = self;
  id v14 = v12;
  [v11 issueDCRT:v6 withCompletionBlock:v13];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

uint64_t __36__MadGate_issueDCRT_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate issueDCRT:withCompletion:]_block_invoke",  763LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __36__MadGate_issueDCRT_withCompletion___block_invoke_100(uint64_t a1, id a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"RKCertification"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"RKCertification"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
    && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    int v16 = 138543362;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, void, void))(v14 + 16))( v14,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  }
  id v15 = (id)[*(id *)(a1 + 32) connection];
  [v15 invalidate];
}

- (BOOL)issueUCRT:(id)a3 withError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = __Block_byref_object_copy_;
  CFDataRef v19 = __Block_byref_object_dispose_;
  id v20 = 0LL;
  id v7 = -[MadGate connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3254779904LL;
  v14[2] = __31__MadGate_issueUCRT_withError___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  id v9 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v7,  "synchronousRemoteObjectProxyWithErrorHandler:",  v14);

  v13[0] = v8;
  v13[1] = 3254779904LL;
  v13[2] = __31__MadGate_issueUCRT_withError___block_invoke_2;
  v13[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v13[4] = &v15;
  [v9 issueUCRT:v6 withCompletionBlock:v13];
  uint64_t v10 = v16[5];
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v16[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a4) {
      *a4 = (id) v16[5];
    }
  }

  _Block_object_dispose(&v15, 8);
  return v10 == 0;
}

void __31__MadGate_issueUCRT_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate issueUCRT:withError:]_block_invoke",  807LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_issueUCRT_withError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (void)issueCollection:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  int v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v8 = -[MadGate connection](self, "connection");
  uint64_t v9 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __42__MadGate_issueCollection_withCompletion___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v10 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v8,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v9;
  v11[1] = 3254779904LL;
  v11[2] = __42__MadGate_issueCollection_withCompletion___block_invoke_2;
  v11[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v13;
  [v10 issueCollection:v6 withCompletionBlock:v11];
  v7[2](v7, v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __42__MadGate_issueCollection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate issueCollection:withCompletion:]_block_invoke",  836LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __42__MadGate_issueCollection_withCompletion___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)ucrtUpgradeRequired:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  int v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __31__MadGate_ucrtUpgradeRequired___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  void v11[5] = &v13;
  [v6 ucrtUpgradeRequiredWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  int v8 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = (id) v14[5];
    int v8 = *((unsigned __int8 *)v20 + 24);
  }

  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

void __31__MadGate_ucrtUpgradeRequired___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate ucrtUpgradeRequired:]_block_invoke",  856LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_ucrtUpgradeRequired___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"UCRTUpgradeRequired"];
  id v8 = isNSNumber(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"UCRTUpgradeRequired"];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v9 BOOLValue];
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (__SecIdentity)copyLegacyDeviceIdentity:(id *)a3
{
  v44[2] = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = __Block_byref_object_copy_;
  id v39 = __Block_byref_object_dispose_;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = __Block_byref_object_copy_;
  id v33 = __Block_byref_object_dispose_;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = 0LL;
  CFErrorRef error = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3254779904LL;
  v21[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke;
  v21[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v21[4] = &v35;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v21);

  v20[0] = v5;
  v20[1] = 3254779904LL;
  v20[2] = __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2;
  v20[3] = &__block_descriptor_56_e8_32r40r48r_e34_v24__0__NSDictionary_8__NSError_16l;
  v20[4] = &v29;
  void v20[5] = &v23;
  v20[6] = &v35;
  [v6 copyLegacyDeviceIdentityWithCompletionBlock:v20];
  if (!v36[5])
  {
    uint64_t v11 = (const __CFData *)v30[5];
    if (v11 && v24[5])
    {
      SecCertificateRef v9 = SecCertificateCreateWithData(0LL, v11);
      if (v9)
      {
        uint64_t v12 = *MEMORY[0x18960B9D0];
        uint64_t v13 = *MEMORY[0x18960B968];
        v43[0] = *MEMORY[0x18960B998];
        v43[1] = v13;
        uint64_t v14 = *MEMORY[0x18960B970];
        v44[0] = v12;
        v44[1] = v14;
        uint64_t v10 = id[MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:v43 count:2];
        SecKeyRef v8 = SecKeyCreateWithData((CFDataRef)v24[5], v10, &error);
        if (v8)
        {
          id v7 = (__SecIdentity *)SecIdentityCreate();
          if (v7) {
            goto LABEL_12;
          }
          id v15 =  createMobileActivationError( (uint64_t)"-[MadGate copyLegacyDeviceIdentity:]",  938LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  0LL,  @"Failed to create identity.");
        }

        else
        {
          id v15 =  createMobileActivationError( (uint64_t)"-[MadGate copyLegacyDeviceIdentity:]",  932LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  error,  @"Failed to decode private key.");
          SecKeyRef v8 = 0LL;
        }

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate copyLegacyDeviceIdentity:]_block_invoke",  895LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __36__MadGate_copyLegacyDeviceIdentity___block_invoke_2(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityCertificateDataBlob"];
  id v8 = isNSData(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityCertificateDataBlob"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(a1[4] + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  id v13 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityPrivateKeyDataBlob"];
  id v14 = isNSData(v13);

  if (v14)
  {
    id v15 = (id)[v5 objectForKeyedSubscript:@"LegacyDeviceIdentityPrivateKeyDataBlob"];
    uint64_t v16 = [v15 copy];
    uint64_t v17 = *(void *)(a1[5] + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }

  uint64_t v19 = *(void *)(a1[6] + 8LL);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;
}

- (BOOL)deleteLegacyDeviceIdentity:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3254779904LL;
  v11[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);

  v10[0] = v5;
  v10[1] = 3254779904LL;
  v10[2] = __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2;
  v10[3] = &__block_descriptor_40_e8_32r_e34_v24__0__NSDictionary_8__NSError_16l;
  v10[4] = &v12;
  [v6 deleteLegacyDeviceIdentityWithCompletionBlock:v10];
  uint64_t v7 = v13[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v13[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v8;
      _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (a3) {
      *a3 = (id) v13[5];
    }
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0;
}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate deleteLegacyDeviceIdentity:]_block_invoke",  972LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __38__MadGate_deleteLegacyDeviceIdentity___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (id)copyUCRTVersionInfo:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  uint64_t v4 = -[MadGate connection](self, "connection");
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3254779904LL;
  v12[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke;
  v12[3] = &__block_descriptor_40_e8_32r_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  id v6 =  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v4,  "synchronousRemoteObjectProxyWithErrorHandler:",  v12);

  v11[0] = v5;
  v11[1] = 3254779904LL;
  v11[2] = __31__MadGate_copyUCRTVersionInfo___block_invoke_2;
  v11[3] = &__block_descriptor_48_e8_32r40r_e34_v24__0__NSDictionary_8__NSError_16l;
  v11[4] = &v19;
  void v11[5] = &v13;
  [v6 copyUCRTVersionInfoWithCompletionBlock:v11];
  if (v14[5] && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v14[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_log_impl(&dword_1874AC000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  uint64_t v8 = (void *)v20[5];
  if (a3 && !v8)
  {
    *a3 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __31__MadGate_copyUCRTVersionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 =  createMobileActivationError( (uint64_t)"-[MadGate copyUCRTVersionInfo:]_block_invoke",  1002LL,  @"com.apple.MobileActivation.ErrorDomain",  -1LL,  a2,  @"IPC Error.");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __31__MadGate_copyUCRTVersionInfo___block_invoke_2(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id)[v5 objectForKeyedSubscript:@"UCRTVersionInfo"];
  id v8 = isNSDictionary(v7);

  if (v8)
  {
    id v9 = (id)[v5 objectForKeyedSubscript:@"UCRTVersionInfo"];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end