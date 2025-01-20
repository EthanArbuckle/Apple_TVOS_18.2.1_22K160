@interface RBSProcessHandle
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)_cachedHandleForKey:(uint64_t)a1;
+ (id)currentProcess;
+ (id)handleForIdentifier:(id)a3 error:(id *)a4;
+ (id)handleForKey:(unint64_t)a3 fetchIfNeeded:(BOOL)a4;
+ (id)handleForLegacyHandle:(id)a3 error:(id *)a4;
+ (id)handleForPredicate:(id)a3 error:(id *)a4;
+ (id)observeForImminentAssertionsExpiration:(id)a3;
+ (void)_cacheHandle:(uint64_t)a1;
+ (void)clearAllHandles;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)isApplication;
- (BOOL)isDaemon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLifecycleManaged;
- (BOOL)isReported;
- (BOOL)isValid;
- (BOOL)isXPCService;
- (BOOL)matchesProcess:(id)a3;
- (NSString)beforeTranslocationBundlePath;
- (NSString)consistentJobLabel;
- (NSString)daemonJobLabel;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)executablePath;
- (NSString)name;
- (NSString)xpcServiceIdentifier;
- (NSUUID)uuid;
- (RBSProcessBundle)bundle;
- (RBSProcessExitContext)lastExitContext;
- (RBSProcessHandle)hostProcess;
- (RBSProcessHandle)init;
- (RBSProcessHandle)initWithIdentity:(id)a3;
- (RBSProcessHandle)initWithInstance:(id)a3 auditToken:(id)a4 bundleData:(id)a5 manageFlags:(unsigned __int8)a6 beforeTranslocationBundlePath:(id)a7 executablePath:(id)a8 cache:(BOOL)a9;
- (RBSProcessHandle)initWithLaunchContext:(id)a3;
- (RBSProcessHandle)initWithRBSXPCCoder:(id)a3;
- (RBSProcessIdentity)identity;
- (RBSProcessInstance)instance;
- (RBSProcessLimitations)activeLimitations;
- (RBSProcessState)currentState;
- (_DWORD)_initWithIdentity:(void *)a3 beforeTranslocationBundlePath:(void *)a4 executablePath:;
- (double)elapsedCPUTimeForFrontBoard;
- (id)currentStateMatchingDescriptor:(id)a3;
- (id)endowmentInfoForHandle;
- (id)legacyHandle;
- (id)processPredicate;
- (int)pid;
- (int)platform;
- (unint64_t)hash;
- (unsigned)euid;
- (void)_fullEncode:(uint64_t)a1;
- (void)_keepAlive;
- (void)dealloc;
- (void)elapsedCPUTimeForFrontBoard;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)fullEncode:(id)a3 forKey:(id)a4;
- (void)intendToExitWith:(id)a3;
- (void)monitorForDeath:(id)a3;
@end

@implementation RBSProcessHandle

- (NSString)beforeTranslocationBundlePath
{
  return 0LL;
}

- (NSString)executablePath
{
  return 0LL;
}

+ (id)currentProcess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[RBSConnection handle]((uint64_t)v2);
  return v3;
}

+ (id)handleForIdentifier:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "rbs_pid");
  if ((int)v7 <= 0)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x189607870];
      uint64_t v16 = *MEMORY[0x1896075F0];
      v17[0] = @"Invalid process identifier";
      [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 errorWithDomain:@"RBSRequestErrorDomain" code:1 userInfo:v11];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = 0LL;
  }

  else
  {
    uint64_t v8 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = v6;
LABEL_9:
      v12 = v9;
      goto LABEL_10;
    }

    if ((_DWORD)v8 == getpid())
    {
      [a1 currentProcess];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }

    [MEMORY[0x189607968] numberWithInt:v8];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)&OBJC_CLASS___RBSProcessHandle, v14);
    if (!v12)
    {
      v15 = +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v6);
      [a1 handleForPredicate:v15 error:a4];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

+ (id)_cachedHandleForKey:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
  [(id)__ProcessHandles objectForKey:v2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  -[RBSProcessHandle _keepAlive](v3);
  return v3;
}

+ (id)handleForPredicate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 handleForPredicate:v5 error:a4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[RBSProcessHandle _cacheHandle:]((uint64_t)&OBJC_CLASS___RBSProcessHandle, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (void)_cacheHandle:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  uint64_t v3 = v2[6] & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v4 = [v2 pid];
  if (v3) {
    BOOL v5 = (int)v4 <= 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    rbs_process_log();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[RBSProcessHandle _cacheHandle:].cold.1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
    }

    v13 = v2;
  }

  else
  {
    uint64_t v14 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
    if (!__ProcessHandles)
    {
      uint64_t v15 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
      uint64_t v16 = (void *)__ProcessHandles;
      __ProcessHandles = v15;
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v3];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)__ProcessHandles objectForKey:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      [(id)__ProcessHandles objectForKey:v17];
      v19 = v2;
      id v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [(id)__ProcessHandles setObject:v2 forKey:v17];
      v20 = (void *)__ProcessHandles;
      [MEMORY[0x189607968] numberWithInt:v14];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 setObject:v2 forKey:v19];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    -[RBSProcessHandle _keepAlive](v2);
    v13 = v2;
  }

  return v13;
}

- (RBSProcessHandle)init
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSProcessHandle.m" lineNumber:148 description:@"-init is not allowed on RBSProcessHandle"];

  return 0LL;
}

- (void)dealloc
{
  unint64_t v3 = self->_data & 0x1FFFFFFFFFFFFFFFLL;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x189607968] numberWithUnsignedLongLong:v3];
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  if (self->_pid < 1)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x189607968], "numberWithInt:");
  }

  if (v4 | v5)
  {
    id v6 = +[RBSWorkloop sharedBackgroundWorkloop](&OBJC_CLASS___RBSWorkloop, "sharedBackgroundWorkloop");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __27__RBSProcessHandle_dealloc__block_invoke;
    block[3] = &unk_189DE0C40;
    id v9 = (id)v4;
    id v10 = (id)v5;
    dispatch_async(v6, block);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBSProcessHandle;
  -[RBSProcessHandle dealloc](&v7, sel_dealloc);
}

void __27__RBSProcessHandle_dealloc__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    id v2 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  }
  if (*(void *)(a1 + 40)) {
    id v3 = (id)objc_msgSend((id)__ProcessHandles, "objectForKey:");
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (BOOL)isReported
{
  return self->_data >> 63;
}

- (BOOL)isLifecycleManaged
{
  return (HIBYTE(self->_data) >> 5) & 1;
}

- (NSString)name
{
  p_cachedName = &self->_cachedName;
  cachedName = self->_cachedName;
  if (cachedName)
  {
    uint64_t v5 = cachedName;
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
LABEL_4:
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock_0);
    objc_storeStrong((id *)p_cachedName, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
    return v5;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
  [MEMORY[0x189607968] numberWithInt:self->_pid];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 processName:v6];
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    goto LABEL_4;
  }
  return v5;
}

- (RBSProcessState)currentState
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    +[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setValues:-1];
    -[RBSProcessHandle currentStateMatchingDescriptor:](self, "currentStateMatchingDescriptor:", v4);
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = 0LL;
  }

  return (RBSProcessState *)v2;
}

- (RBSProcessExitContext)lastExitContext
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 lastExitContextForInstance:v5 error:0];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = 0LL;
  }

  return (RBSProcessExitContext *)v2;
}

- (RBSProcessLimitations)activeLimitations
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 limitationsForInstance:v5 error:0];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = 0LL;
  }

  return (RBSProcessLimitations *)v2;
}

- (RBSProcessHandle)hostProcess
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle instance](self, "instance");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 hostProcessForInstance:v5 error:0];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v2 = 0LL;
  }

  return (RBSProcessHandle *)v2;
}

- (void)monitorForDeath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    rbs_process_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = self;
      _os_log_impl(&dword_185F67000, v5, OS_LOG_TYPE_DEFAULT, "Starting death monitoring for handle %@", buf, 0xCu);
    }

    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  self->_pid);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __36__RBSProcessHandle_monitorForDeath___block_invoke;
    v8[3] = &unk_189DE1300;
    v8[4] = self;
    id v9 = v4;
    [v6 subscribeToProcessDeath:v7 handler:v8];
  }
}

void __36__RBSProcessHandle_monitorForDeath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  rbs_process_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v5;
    _os_log_impl( &dword_185F67000,  v4,  OS_LOG_TYPE_DEFAULT,  "Calling process death completion block for handle %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = a1 + 32;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v8 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v6, v3);
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___RBSProcessExitContext);
    (*(void (**)(uint64_t, uint64_t, RBSProcessExitContext *))(v7 + 16))(v7, v6, v9);
  }
}

- (void)intendToExitWith:(id)a3
{
  id v4 = a3;
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    v13 = +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    -[RBSProcessHandle instance](self, "instance");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 intendToExit:v14 withStatus:v4];
  }

  else
  {
    rbs_general_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessHandle intendToExitWith:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (BOOL)isValid
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isRunning];

  return v3;
}

- (id)endowmentInfoForHandle
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setValues:32];
  +[RBSProcessPredicate predicateMatchingHandle:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatchingHandle:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle handleForPredicate:error:](&OBJC_CLASS___RBSProcessHandle, "handleForPredicate:error:", v4, 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 currentStateMatchingDescriptor:v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 endowmentInfos];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (RBSProcessHandle)initWithInstance:(id)a3 auditToken:(id)a4 bundleData:(id)a5 manageFlags:(unsigned __int8)a6 beforeTranslocationBundlePath:(id)a7 executablePath:(id)a8 cache:(BOOL)a9
{
  int v11 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 handleFailureInMethod:a2, self, @"RBSProcessHandle.m", 281, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 handleFailureInMethod:a2, self, @"RBSProcessHandle.m", 282, @"Invalid parameter not satisfying: %@", @"auditToken" object file lineNumber description];

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___RBSProcessHandle;
  v21 = -[RBSProcessHandle init](&v41, sel_init);
  if (v21)
  {
    uint32_t v22 = objc_msgSend(v16, "rbs_pid");
    uint32_t v23 = arc4random();
    if (v23 <= v22) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v23;
    }
    v21->_data = ((unint64_t)(v11 != 0) << 63) | ((unint64_t)(v11 & 1) << 61) | ((int)v22 | (unint64_t)(v24 << 32)) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000LL;
    uint64_t v25 = [v16 identity];
    identity = v21->_identity;
    v21->_identity = (RBSProcessIdentity *)v25;

    v21->_pid = objc_msgSend(v16, "rbs_pid");
    if (v17) {
      [v17 realToken];
    }
    else {
      memset(&atoken, 0, sizeof(atoken));
    }
    v21->_euid = audit_token_to_euid(&atoken);
    if (objc_opt_class())
    {
      v27 = (void *)MEMORY[0x18960D508];
      if (v17) {
        [v17 realToken];
      }
      else {
        memset(v39, 0, sizeof(v39));
      }
      uint64_t v28 = [v27 tokenFromAuditToken:v39];
      bsAuditToken = v21->_bsAuditToken;
      v21->_bsAuditToken = (BSAuditToken *)v28;
    }

    uint64_t v30 = +[RBSProcessBundle bundleWithDataSource:](&OBJC_CLASS___RBSProcessBundle, "bundleWithDataSource:", v18);
    bundle = v21->_bundle;
    v21->_bundle = (RBSProcessBundle *)v30;

    if (a9) {
      id v32 = +[RBSProcessHandle _cacheHandle:]((uint64_t)&OBJC_CLASS___RBSProcessHandle, v21);
    }
    v33 = objc_alloc_init(&OBJC_CLASS___RBSXPCCoder);
    -[RBSProcessHandle _fullEncode:]((uint64_t)v21, v33);
    uint64_t v34 = -[RBSXPCCoder createMessage](v33, "createMessage");
    codedHandle = v21->_codedHandle;
    v21->_codedHandle = (OS_xpc_object *)v34;
  }

  return v21;
}

- (void)_fullEncode:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      [v3 encodeObject:v5 forKey:@"_codedHandle"];
    }

    else
    {
      rbs_general_log();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v8 = *(_DWORD *)(a1 + 64);
        int v10 = 138412802;
        uint64_t v11 = a1;
        __int16 v12 = 2048;
        uint64_t v13 = v7;
        __int16 v14 = 1024;
        int v15 = v8;
        _os_log_impl( &dword_185F67000,  v6,  OS_LOG_TYPE_DEFAULT,  "Full encoding handle %@, with data %llx, and pid %d",  (uint8_t *)&v10,  0x1Cu);
      }

      [v4 encodeObject:*(void *)(a1 + 72) forKey:@"_identity"];
      [v4 encodeUInt64:*(int *)(a1 + 64) forKey:@"_pid"];
      if (objc_opt_class()) {
        [v4 encodeObject:*(void *)(a1 + 40) forKey:@"_bsAuditToken"];
      }
      [v4 encodeObject:*(void *)(a1 + 80) forKey:@"_bundle"];
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9) {
        [v4 encodeUInt64:v9 forKey:@"_data"];
      }
    }
  }
}

- (RBSProcessHandle)initWithIdentity:(id)a3
{
  return (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:]( self,  a3,  0LL,  0LL);
}

- (_DWORD)_initWithIdentity:(void *)a3 beforeTranslocationBundlePath:(void *)a4 executablePath:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    if (!v8)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 handleFailureInMethod:sel__initWithIdentity_beforeTranslocationBundlePath_executablePath_, a1, @"RBSProcessHandle.m", 328, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
    }

    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_CLASS___RBSProcessHandle;
    id v11 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v11;
    if (v11)
    {
      *((void *)v11 + 6) = 0LL;
      objc_storeStrong((id *)v11 + 9, a2);
      a1[16] = -1;
    }
  }

  return a1;
}

- (RBSProcessHandle)initWithLaunchContext:(id)a3
{
  id v4 = a3;
  [v4 identity];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 beforeTranslocationBundlePath];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 _overrideExecutablePath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = (RBSProcessHandle *)-[RBSProcessHandle _initWithIdentity:beforeTranslocationBundlePath:executablePath:]( self,  v5,  v6,  v7);
  return v8;
}

- (id)currentStateMatchingDescriptor:(id)a3
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    id v5 = a3;
    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessHandle processPredicate](self, "processPredicate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 statesForPredicate:v7 withDescriptor:v5 error:0];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 firstObject];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

+ (id)handleForKey:(unint64_t)a3 fetchIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle _cachedHandleForKey:]((uint64_t)&OBJC_CLASS___RBSProcessHandle, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleForKey:v6];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    rbs_process_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218242;
      unint64_t v20 = a3;
      __int16 v21 = 2114;
      uint32_t v22 = v10;
      _os_log_impl( &dword_185F67000,  v11,  OS_LOG_TYPE_DEFAULT,  "Hit the server for a process handle %llx that resolved to: %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    if (v10)
    {
      +[RBSProcessHandle _cacheHandle:]((uint64_t)&OBJC_CLASS___RBSProcessHandle, v10);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      rbs_process_log();
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        +[RBSProcessHandle handleForKey:fetchIfNeeded:].cold.1(a3, (os_log_s *)v10, v12, v13, v14, v15, v16, v17);
      }
      uint64_t v7 = 0LL;
    }
  }

  return v7;
}

- (void)_keepAlive
{
  if (a1)
  {
    id v1 = a1;
    dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL);
    id v3 = +[RBSWorkloop sharedBackgroundWorkloop](&OBJC_CLASS___RBSWorkloop, "sharedBackgroundWorkloop");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __30__RBSProcessHandle__keepAlive__block_invoke;
    block[3] = &unk_189DE0C68;
    id v6 = v1;
    id v4 = v1;
    dispatch_after(v2, v3, block);
  }

+ (void)clearAllHandles
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_185F67000, v0, OS_LOG_TYPE_DEFAULT, "Removing all cached process handles", v1, 2u);
  }

  [(id)__ProcessHandles removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&__Lock_0);
}

- (void)fullEncode:(id)a3 forKey:(id)a4
{
  id v6 = (void *)MEMORY[0x189607A40];
  id v7 = a4;
  id v8 = a3;
  [v6 currentThread];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 threadDictionary];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 setObject:MEMORY[0x189604A88] forKey:@"RBSProcessHandleFullEncode"];
  [v8 encodeObject:self forKey:v7];

  [v10 removeObjectForKey:@"RBSProcessHandleFullEncode"];
}

- (RBSProcessInstance)instance
{
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  self->_pid);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v4,  self->_identity);
    dispatch_time_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    dispatch_time_t v2 = 0LL;
  }

  return (RBSProcessInstance *)v2;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_bsAuditToken;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 realToken](result, "realToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (int)platform
{
  return -[RBSProcessIdentity platform](self->_identity, "platform");
}

+ (id)handleForLegacyHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v6, "pid"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessHandle handleForIdentifier:error:](&OBJC_CLASS___RBSProcessHandle, "handleForIdentifier:error:", v7, a4);
    id v8 = (id *)objc_claimAutoreleasedReturnValue();

    if (v8) {
      objc_storeStrong(v8 + 3, a3);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)legacyHandle
{
  if (objc_opt_class())
  {
    id v3 = self;
    objc_sync_enter(v3);
    legacyHandle = v3->_legacyHandle;
    if (!legacyHandle)
    {
      uint64_t v5 = [MEMORY[0x18960D510] processHandleForAuditToken:v3->_bsAuditToken];
      id v6 = v3->_legacyHandle;
      v3->_legacyHandle = (BSProcessHandle *)v5;

      legacyHandle = v3->_legacyHandle;
    }

    id v7 = legacyHandle;
    objc_sync_exit(v3);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (double)elapsedCPUTimeForFrontBoard
{
  if ((self->_data & 0x4000000000000000LL) == 0)
  {
    rbs_process_log();
    dispatch_time_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
LABEL_15:

    return 0.0;
  }

  taskPort = self->_taskPort;
  if (!taskPort)
  {
    +[RBSMachPortTaskNameRight taskNameForPID:]( &OBJC_CLASS___RBSMachPortTaskNameRight,  "taskNameForPID:",  self->_pid);
    uint64_t v12 = (RBSMachPortTaskNameRight *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = self->_taskPort;
    self->_taskPort = v12;

    taskPort = self->_taskPort;
    if (!taskPort)
    {
      +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  self->_pid);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 portForIdentifier:v15];
      uint64_t v16 = (RBSMachPortTaskNameRight *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = self->_taskPort;
      self->_taskPort = v16;

      taskPort = self->_taskPort;
    }
  }

  task_name_t v18 = -[RBSMachPortTaskNameRight port](taskPort, "port");
  if (v18 - 1 > 0xFFFFFFFD)
  {
    rbs_process_log();
    dispatch_time_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.4(v2, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_15;
  }

  task_name_t v19 = v18;
  mach_msg_type_number_t task_info_outCnt = 10;
  uint64_t v20 = task_info(v18, 0x12u, task_info_out, &task_info_outCnt);
  if ((_DWORD)v20)
  {
    uint64_t v21 = v20;
    double v22 = 0.0;
    if (RBSPIDExists(self->_pid))
    {
      rbs_process_log();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.2(v21, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }

  else
  {
    double v22 = (double)task_info_out[6] / 1000000.0
        + (double)task_info_out[5]
        + (double)task_info_out[8] / 1000000.0
        + (double)task_info_out[7];
  }

  mach_msg_type_number_t v47 = 4;
  uint64_t v38 = task_info(v19, 3u, v48, &v47);
  if (!(_DWORD)v38) {
    return v22 + (double)v48[1] / 1000000.0 + (double)v48[0] + (double)v48[3] / 1000000.0 + (double)v48[2];
  }
  uint64_t v39 = v38;
  if (RBSPIDExists(self->_pid))
  {
    rbs_process_log();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[RBSProcessHandle elapsedCPUTimeForFrontBoard].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);
    }
  }

  return v22;
}

- (BOOL)isDaemon
{
  return -[RBSProcessIdentity osServiceType](self->_identity, "osServiceType") == 2;
}

- (NSString)daemonJobLabel
{
  if (-[RBSProcessHandle isDaemon](self, "isDaemon"))
  {
    -[RBSProcessIdentity consistentLaunchdJobLabel](self->_identity, "consistentLaunchdJobLabel");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return (NSString *)v3;
}

- (BOOL)isXPCService
{
  return -[RBSProcessIdentity isXPCService](self->_identity, "isXPCService");
}

- (NSString)xpcServiceIdentifier
{
  return -[RBSProcessIdentity xpcServiceIdentifier](self->_identity, "xpcServiceIdentifier");
}

- (NSUUID)uuid
{
  return -[RBSProcessIdentity uuid](self->_identity, "uuid");
}

- (BOOL)isApplication
{
  return -[RBSProcessIdentity isApplication](self->_identity, "isApplication");
}

- (BOOL)hasConsistentLaunchdJob
{
  return -[RBSProcessIdentity hasConsistentLaunchdJob](self->_identity, "hasConsistentLaunchdJob");
}

- (NSString)consistentJobLabel
{
  return -[RBSProcessIdentity consistentLaunchdJobLabel](self->_identity, "consistentLaunchdJobLabel");
}

+ (id)observeForImminentAssertionsExpiration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"RBSProcessHandle.m", 558, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }

  +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection observeProcessAssertionsExpirationWarningWithBlock:]((uint64_t)v6, v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v4 = (RBSProcessHandle *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }

  else if (-[RBSProcessHandle rbs_pid](v4, "rbs_pid") == -1)
  {
    identity = self->_identity;
    -[RBSProcessHandle identity](v5, "identity");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v9);
  }

  else
  {
    int pid = self->_pid;
    char v7 = pid == -[RBSProcessHandle rbs_pid](v5, "rbs_pid");
  }

  return v7;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingHandle:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingHandle:",  self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RBSProcessHandle *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && -[RBSProcessHandle matchesProcess:](self, "matchesProcess:", v4);
  }

  return v6;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash") ^ self->_pid;
}

- (NSString)description
{
  uint64_t v3 = (void *)NSString;
  if ((self->_data & 0x4000000000000000LL) != 0)
  {
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v3 stringWithFormat:@"[%@:%d]", v5, self->_pid];
  }

  else
  {
    id v4 = objc_alloc(NSString);
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v4 initWithFormat:@"<inert:[%@:%d]*>", v5, 0xFFFFFFFFLL];
  }

  char v7 = (void *)v6;

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  if ((self->_data & 0x4000000000000000LL) == 0)
  {
    id v3 = objc_alloc(NSString);
    [(id)objc_opt_class() description];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v3 initWithFormat:@"<%@| inert %@>", v4, v5, v15, v16, v17, v18];
LABEL_6:
    uint64_t v13 = (void *)v6;
    goto LABEL_7;
  }

  -[RBSProcessHandle identity](self, "identity");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 auid];

  id v9 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  uint64_t v5 = (void *)v10;
  uint64_t pid = self->_pid;
  if (!(_DWORD)v8)
  {
    uint64_t v6 = [v9 initWithFormat:@"<%@| %@:%d%@%@%@>", v4, v10, pid, &stru_189DE1D08, &stru_189DE1D08, &stru_189DE1D08];
    goto LABEL_6;
  }

  [MEMORY[0x189607968] numberWithUnsignedInt:v8];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)[v9 initWithFormat:@"<%@| %@:%d%@%@%@>", v4, v5, pid, @"("), v12, @""];

LABEL_7:
  return (NSString *)v13;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189607A40] currentThread];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 threadDictionary];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:@"RBSProcessHandleFullEncode"];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 && (self->_data & 0x4000000000000000LL) != 0)
  {
    p_data = &self->_data;
    rbs_process_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RBSProcessHandle encodeWithRBSXPCCoder:].cold.1((uint64_t)p_data, v9, v10, v11, v12, v13, v14, v15);
    }

    [v4 encodeUInt64:*p_data & 0x1FFFFFFFFFFFFFFFLL forKey:@"&"];
  }

  else
  {
    -[RBSProcessHandle _fullEncode:]((uint64_t)self, v4);
  }
}

- (RBSProcessHandle)initWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 decodeUInt64ForKey:@"&"];
  if (v6)
  {
    uint64_t v7 = v6;
    rbs_process_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RBSProcessHandle initWithRBSXPCCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    +[RBSProcessHandle handleForKey:fetchIfNeeded:]( &OBJC_CLASS___RBSProcessHandle,  "handleForKey:fetchIfNeeded:",  v7,  1LL);
    uint64_t v15 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v5 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"_codedHandle"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      uint64_t v17 = +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v16);

      id v5 = (id)v17;
    }

    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___RBSProcessHandle;
    uint64_t v18 = -[RBSProcessHandle init](&v30, sel_init);
    if (v18)
    {
      v18->_data = [v5 decodeUInt64ForKey:@"_data"];
      uint64_t v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
      identity = v18->_identity;
      v18->_identity = (RBSProcessIdentity *)v19;

      if (!v18->_identity)
      {
        [MEMORY[0x1896077D8] currentHandler];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 handleFailureInMethod:a2 object:v18 file:@"RBSProcessHandle.m" lineNumber:698 description:@"Expect nonnil identity"];
      }

      v18->_uint64_t pid = [v5 decodeUInt64ForKey:@"_pid"];
      if (objc_opt_class())
      {
        uint64_t v21 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_bsAuditToken"];
        bsAuditToken = v18->_bsAuditToken;
        v18->_bsAuditToken = (BSAuditToken *)v21;
      }

      uint64_t v23 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_bundle"];
      bundle = v18->_bundle;
      v18->_bundle = (RBSProcessBundle *)v23;

      if ((v18->_data & 0x4000000000000000LL) != 0)
      {
        uint64_t v25 = v18->_bundle;
        +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v18->_pid);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v26,  v18->_identity);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBSProcessBundle setInstance:](v25, "setInstance:", v27);
      }
    }

    self = v18;

    uint64_t v15 = self;
  }

  return v15;
}

- (int)pid
{
  return self->_pid;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (unsigned)euid
{
  return self->_euid;
}

- (RBSProcessBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
}

+ (void)_cacheHandle:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)intendToExitWith:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)handleForKey:(uint64_t)a3 fetchIfNeeded:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)elapsedCPUTimeForFrontBoard
{
}

- (void)encodeWithRBSXPCCoder:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end