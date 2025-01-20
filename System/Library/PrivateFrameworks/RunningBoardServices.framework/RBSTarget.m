@interface RBSTarget
+ (BOOL)supportsRBSXPCSecureCoding;
+ (RBSTarget)targetWithEndpoint:(id)a3;
+ (RBSTarget)targetWithPid:(int)a3;
+ (RBSTarget)targetWithPid:(int)a3 environmentIdentifier:(id)a4;
+ (RBSTarget)targetWithProcessIdentifier:(id)a3;
+ (RBSTarget)targetWithProcessIdentifier:(id)a3 environmentIdentifier:(id)a4;
+ (RBSTarget)targetWithProcessIdentity:(id)a3;
+ (RBSTarget)targetWithProcessIdentity:(id)a3 environmentIdentifier:(id)a4;
+ (id)currentProcess;
+ (id)systemTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystem;
- (BOOL)matchesProcess:(id)a3;
- (NSString)debugDescription;
- (NSString)environment;
- (NSString)shortDescription;
- (OS_xpc_object)endpoint;
- (RBSProcessIdentifier)processIdentifier;
- (RBSProcessIdentity)processIdentity;
- (RBSTarget)init;
- (RBSTarget)initWithRBSXPCCoder:(id)a3;
- (id)copyWithPersonaString:(id)a3;
- (id)processPredicate;
- (unint64_t)hash;
- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(uint64_t)a5 euid:;
- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(void *)a5 endpoint:(uint64_t)a6 euid:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSTarget

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1) {
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_8);
  }
  return (id)systemTarget_systemTarget;
}

void __25__RBSTarget_systemTarget__block_invoke()
{
  v0 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  0LL,  0LL,  0LL,  0LL);
  v1 = (void *)systemTarget_systemTarget;
  systemTarget_systemTarget = (uint64_t)v0;
}

- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(uint64_t)a5 euid:
{
  if (a1)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    v12 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  v11,  v10,  v9,  0LL,  a5);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1) {
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_1);
  }
  return (id)currentProcess_currentProcess;
}

void __27__RBSTarget_currentProcess__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___RBSTarget);
  +[RBSProcessIdentifier identifierForCurrentProcess](&OBJC_CLASS___RBSProcessIdentifier, "identifierForCurrentProcess");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:](v0, v3, 0LL, 0LL, 0LL);
  v2 = (void *)currentProcess_currentProcess;
  currentProcess_currentProcess = (uint64_t)v1;
}

+ (RBSTarget)targetWithProcessIdentity:(id)a3
{
  id v3 = a3;
  v4 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  0LL,  v3,  0LL,  0LL);

  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithProcessIdentity:(id)a3 environmentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  0LL,  v6,  v5,  0LL);

  return (RBSTarget *)v7;
}

+ (RBSTarget)targetWithPid:(int)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RBSTarget targetWithProcessIdentifier:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentifier:", v3);
  return (RBSTarget *)v4;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3
{
  id v5 = a3;
  if ((int)objc_msgSend(v5, "rbs_pid") <= 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:73 description:@"must specify a valid pid"];
  }

  id v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  v5,  0LL,  0LL,  0LL);

  return (RBSTarget *)v6;
}

+ (RBSTarget)targetWithPid:(int)a3 environmentIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if ((int)v4 <= 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:78 description:@"must specify a valid pid"];
  }

  [MEMORY[0x189607968] numberWithInt:v4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSTarget targetWithProcessIdentifier:environmentIdentifier:]( &OBJC_CLASS___RBSTarget,  "targetWithProcessIdentifier:environmentIdentifier:",  v8,  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSTarget *)v9;
}

+ (RBSTarget)targetWithProcessIdentifier:(id)a3 environmentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  v6,  0LL,  v5,  0LL);

  return (RBSTarget *)v7;
}

+ (RBSTarget)targetWithEndpoint:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:87 description:@"must specify an endpoint"];
  }

  if (MEMORY[0x186E30AB4](v5) != MEMORY[0x1895F9260])
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2 object:a1 file:@"RBSTarget.m" lineNumber:88 description:@"must specify a valid endpoint"];
  }

  id v6 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]( objc_alloc(&OBJC_CLASS___RBSTarget),  0LL,  0LL,  0LL,  v5,  0LL);

  return (RBSTarget *)v6;
}

- (void)_initWithProcessIdentifier:(void *)a3 processIdentity:(void *)a4 environmentIdentifier:(void *)a5 endpoint:(uint64_t)a6 euid:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)&OBJC_CLASS___RBSTarget;
    v15 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v15;
    if (v15)
    {
      if (v11)
      {
        uint64_t v16 = +[RBSProcessIdentifier identifierForIdentifier:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierForIdentifier:",  v11);
        v17 = (void *)a1[1];
        a1[1] = v16;
      }

      else
      {
        v17 = (void *)v15[1];
        v15[1] = 0LL;
      }

      if ((_DWORD)a6) {
        uint64_t v18 = [v12 copyWithAuid:a6];
      }
      else {
        uint64_t v18 = [v12 copy];
      }
      v19 = (void *)a1[2];
      a1[2] = v18;

      uint64_t v20 = [v13 copy];
      v21 = (void *)a1[3];
      a1[3] = v20;

      if (v14)
      {
        xpc_object_t v22 = xpc_copy(v14);
        v23 = (void *)a1[4];
        a1[4] = v22;
      }
    }
  }

  return a1;
}

- (RBSTarget)init
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSTarget.m" lineNumber:93 description:@"-init is not allowed on RBSTarget"];

  return 0LL;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  if (self->_endpoint)
  {
    char v5 = 0;
  }

  else
  {
    processIdentity = self->_processIdentity;
    if (!processIdentity) {
      processIdentity = self->_processIdentifier;
    }
    char v5 = [processIdentity matchesProcess:v4];
  }

  return v5;
}

- (id)processPredicate
{
  if (self->_endpoint)
  {
    v2 = (void *)objc_opt_new();
  }

  else
  {
    if (self->_processIdentity) {
      +[RBSProcessPredicate predicateMatchingIdentity:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatchingIdentity:");
    }
    else {
      +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  self->_processIdentifier);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  processIdentifier = self->_processIdentifier;
  id v5 = a3;
  [v5 encodeObject:processIdentifier forKey:@"processIdentifier"];
  [v5 encodeObject:self->_processIdentity forKey:@"processIdentity"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeXPCObject:self->_endpoint forKey:@"endpoint"];
}

- (RBSTarget)initWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 decodeXPCObjectOfType:MEMORY[0x1895F9260] forKey:@"endpoint"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    [v5 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentity"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    [v5 decodeObjectOfClass:objc_opt_class() forKey:@"processIdentifier"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    self =  -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]( self,  v10,  v8,  v11,  0LL,  0LL);

    id v9 = self;
    goto LABEL_10;
  }

  Class v7 = NSClassFromString(@"RBLaunchdProperties");
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2 object:self file:@"RBSTarget.m" lineNumber:138 description:@"attempt to decode endpoint-based target outside the daemon"];
  }
  v8 = -[objc_class processIdentityForEndpoint:](v7, "processIdentityForEndpoint:", v6);
  if (v8) {
    goto LABEL_9;
  }
  rbs_coder_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    -[RBSTarget initWithRBSXPCCoder:].cold.1((uint64_t)v6, (os_log_s *)v8);
  }
  id v9 = 0LL;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  endpoint = self->_endpoint;
  unint64_t v5 = -[RBSProcessIdentifier hash](self->_processIdentifier, "hash");
  unint64_t v6 = -[RBSProcessIdentity hash](self->_processIdentity, "hash") ^ v5;
  return v6 ^ -[NSString hash](self->_environment, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSTarget *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && ((processIdentifier = self->_processIdentifier, processIdentifier == v4->_processIdentifier)
       || -[RBSProcessIdentifier isEqual:](processIdentifier, "isEqual:"))
      && ((processIdentity = self->_processIdentity, processIdentity == v4->_processIdentity)
       || -[RBSProcessIdentity isEqual:](processIdentity, "isEqual:"))
      && ((environment = self->_environment, environment == v4->_environment)
       || -[NSString isEqualToString:](environment, "isEqualToString:")))
    {
      endpoint = self->_endpoint;
      id v12 = v4->_endpoint;
      else {
        BOOL v6 = endpoint == v12;
      }
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)debugDescription
{
  endpoint = self->_endpoint;
  id v4 = (void *)NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  Class v7 = (void *)v6;
  if (endpoint)
  {
    [v4 stringWithFormat:@"<%@: %p; endpoint: %@>", v6, self, self->_endpoint];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    processIdentifier = self->_processIdentifier;
    if (processIdentifier)
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[RBSProcessIdentifier pid](self->_processIdentifier, "pid"));
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v10 = @"(n/a)";
    }

    -[RBSProcessIdentity shortDescription](self->_processIdentity, "shortDescription");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; pid: %@; identity: %@; environment: %@>",
      v7,
      self,
      v10,
      v11,
      self->_environment);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (processIdentifier) {
  }
    }

  return (NSString *)v8;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___RBSTarget);
  processIdentifier = self->_processIdentifier;
  id v7 = -[RBSProcessIdentity copyWithPersonaString:](self->_processIdentity, "copyWithPersonaString:", v4);

  v8 = -[RBSTarget _initWithProcessIdentifier:processIdentity:environmentIdentifier:endpoint:euid:]( v5,  processIdentifier,  v7,  self->_environment,  self->_endpoint,  0LL);
  return v8;
}

- (NSString)shortDescription
{
  v2 = self;
  objc_sync_enter(v2);
  shortDescription = v2->_shortDescription;
  if (!shortDescription)
  {
    if (v2->_processIdentifier)
    {
      p_environment = &v2->_environment;
      uint64_t v5 = (void *)NSString;
      if (v2->_environment)
      {
        uint64_t v6 = objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
LABEL_8:
        v8 = (NSString *)v6;
        uint64_t v9 = [v5 stringWithFormat:@"%@<%@>", v6, *p_environment];
LABEL_14:
        id v12 = v2->_shortDescription;
        v2->_shortDescription = (NSString *)v9;

        shortDescription = v8;
LABEL_15:

        goto LABEL_16;
      }

      uint64_t v10 = objc_msgSend(MEMORY[0x189607968], "numberWithInt:", -[RBSProcessIdentifier pid](v2->_processIdentifier, "pid"));
    }

    else
    {
      processIdentity = v2->_processIdentity;
      if (!processIdentity)
      {
        if (v2->_endpoint)
        {
          uint64_t v11 = [NSString stringWithFormat:@"<%@>", v2->_endpoint];
          shortDescription = v2->_shortDescription;
          v2->_shortDescription = (NSString *)v11;
        }

        else
        {
          v2->_shortDescription = (NSString *)@"system";
        }

        goto LABEL_15;
      }

      p_environment = &v2->_environment;
      uint64_t v5 = (void *)NSString;
      if (v2->_environment)
      {
        uint64_t v6 = -[RBSProcessIdentity shortDescription](processIdentity, "shortDescription");
        goto LABEL_8;
      }

      uint64_t v10 = -[RBSProcessIdentity shortDescription](processIdentity, "shortDescription");
    }

    v8 = (NSString *)v10;
    uint64_t v9 = [v5 stringWithFormat:@"%@", v10];
    goto LABEL_14;
  }

- (BOOL)isSystem
{
  return !self->_processIdentifier && !self->_processIdentity && !self->_environment && self->_endpoint == 0LL;
}

- (RBSProcessIdentifier)processIdentifier
{
  return self->_processIdentifier;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (NSString)environment
{
  return self->_environment;
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
}

- (void)initWithRBSXPCCoder:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_185F67000, a2, OS_LOG_TYPE_ERROR, "no identity found for endpoint %@", (uint8_t *)&v2, 0xCu);
}

@end