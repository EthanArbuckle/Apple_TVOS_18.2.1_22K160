@interface RBSProcessInstance
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (RBSProcessInstance)instanceWithIdentifier:(id)a3 identity:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (RBSProcessIdentifier)identifier;
- (RBSProcessIdentity)identity;
- (RBSProcessInstance)init;
- (RBSProcessInstance)initWithRBSXPCCoder:(id)a3;
- (id)copyWithAuid:(unsigned int)a3;
- (id)copyWithPersonaString:(id)a3;
- (id)processPredicate;
- (int)rbs_pid;
- (unint64_t)hash;
- (void)_initWithIdentifier:(void *)a3 identity:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessInstance

+ (RBSProcessInstance)instanceWithIdentifier:(id)a3 identity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[RBSProcessInstance _initWithIdentifier:identity:](objc_alloc(&OBJC_CLASS___RBSProcessInstance), v6, v5);

  return (RBSProcessInstance *)v7;
}

- (void)_initWithIdentifier:(void *)a3 identity:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 handleFailureInMethod:sel__initWithIdentifier_identity_, a1, @"RBSProcessInstance.m", 31, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
    }

    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_CLASS___RBSProcessInstance;
    a1 = objc_msgSendSuper2(&v14, sel_init);
    if (a1)
    {
      uint64_t v8 = [v7 copy];
      v9 = (void *)a1[1];
      a1[1] = v8;

      uint64_t v10 = [v5 copy];
      v11 = (void *)a1[2];
      a1[2] = v10;
    }
  }

  return a1;
}

- (RBSProcessInstance)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSProcessInstance.m" lineNumber:26 description:@"-init is not allowed on RBSProcessInstance"];

  return 0LL;
}

- (id)copyWithAuid:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc(&OBJC_CLASS___RBSProcessInstance);
  identifier = self->_identifier;
  id v7 = -[RBSProcessIdentity copyWithAuid:](self->_identity, "copyWithAuid:", v3);
  uint64_t v8 = -[RBSProcessInstance _initWithIdentifier:identity:](v5, identifier, v7);

  return v8;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___RBSProcessInstance);
  identifier = self->_identifier;
  id v7 = -[RBSProcessIdentity copyWithPersonaString:](self->_identity, "copyWithPersonaString:", v4);

  uint64_t v8 = -[RBSProcessInstance _initWithIdentifier:identity:](v5, identifier, v7);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessInstance *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()
      || (int v6 = -[RBSProcessInstance rbs_pid](self, "rbs_pid"), v6 != -[RBSProcessInstance rbs_pid](v4, "rbs_pid")))
    {
      BOOL v11 = 0;
      goto LABEL_11;
    }

    -[RBSProcessInstance identity](v4, "identity");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    identity = self->_identity;
    p_identity = &self->_identity;
    if (!-[RBSProcessIdentity isEqual:](identity, "isEqual:", v7))
    {
      rbs_process_log();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[RBSProcessInstance isEqual:].cold.1((id *)p_identity, v7, v10);
      }
    }
  }

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentifier pid](self->_identifier, "pid");
}

- (NSString)description
{
  uint64_t v3 = (void *)NSString;
  -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"[%@:%d]", v4, -[RBSProcessIdentifier rbs_pid](self->_identifier, "rbs_pid")];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<pid=%d id=%@>", -[RBSProcessInstance rbs_pid](self, "rbs_pid"), self->_identity];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v5 = a3;
  int v4 = -[RBSProcessIdentifier pid](self->_identifier, "pid");
  if (v4 >= 1) {
    [v5 encodeInt64:v4 forKey:@"pid"];
  }
  [v5 encodeObject:self->_identity forKey:@"_identity"];
}

- (RBSProcessInstance)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessInstance;
  id v5 = -[RBSProcessInstance init](&v11, sel_init);
  if (v5)
  {
    if ([v4 decodeInt64ForKey:@"pid"])
    {
      uint64_t v6 = +[RBSProcessIdentifier identifierWithPid:](&OBJC_CLASS___RBSProcessIdentifier, "identifierWithPid:");
      identifier = v5->_identifier;
      v5->_identifier = (RBSProcessIdentifier *)v6;
    }

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v8;
  }

  return v5;
}

- (int)rbs_pid
{
  return -[RBSProcessIdentifier pid](self->_identifier, "pid");
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[RBSProcessInstance isEqual:](self, "isEqual:", v4);

  return (char)self;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  self);
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (RBSProcessIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (void)isEqual:(os_log_s *)a3 .cold.1(id *a1, void *a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [*a1 debugDescription];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 debugDescription];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_fault_impl( &dword_185F67000,  a3,  OS_LOG_TYPE_FAULT,  "Two equal instances have unequal identities. %{public}@ and %{public}@",  (uint8_t *)&v7,  0x16u);
}

@end