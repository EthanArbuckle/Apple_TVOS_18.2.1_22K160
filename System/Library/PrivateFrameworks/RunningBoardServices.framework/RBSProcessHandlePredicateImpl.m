@interface RBSProcessHandlePredicateImpl
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessHandlePredicateImpl)initWithHandle:(id)a3;
- (RBSProcessHandlePredicateImpl)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processIdentifier;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessHandlePredicateImpl

- (RBSProcessHandlePredicateImpl)initWithHandle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Identifier.m", 128, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessHandlePredicateImpl;
  v6 = -[RBSProcessHandlePredicateImpl init](&v11, sel_init);
  if (v6)
  {
    uint64_t v7 = [v5 identity];
    identity = v6->_identity;
    v6->_identity = (RBSProcessIdentity *)v7;

    v6->_pid = [v5 pid];
  }

  return v6;
}

- (id)processIdentifier
{
  return (id)[MEMORY[0x189607968] numberWithInt:self->_pid];
}

- (BOOL)matchesProcess:(id)a3
{
  int pid = self->_pid;
  if (pid != -1) {
    return pid == [a3 pid];
  }
  identity = self->_identity;
  uint64_t v6 = [a3 identity];
  uint64_t v7 = (void *)v6;
  if (identity == (RBSProcessIdentity *)v6)
  {
    char v4 = 1;
  }

  else
  {
    if (identity) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      char v4 = 0;
    }
    else {
      char v4 = -[RBSProcessIdentity isEqual:](identity, "isEqual:", v6);
    }
  }

  return v4;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", self);
}

- (unint64_t)hash
{
  if (self->_pid == -1) {
    return -[RBSProcessIdentity hash](self->_identity, "hash");
  }
  else {
    return self->_pid;
  }
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (RBSProcessHandlePredicateImpl *)a3;
  if (self == v4) {
    goto LABEL_11;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_pid != v4->_pid)
  {
LABEL_10:
    char v10 = 0;
    goto LABEL_12;
  }

  identity = self->_identity;
  uint64_t v7 = v4->_identity;
  if (identity == v7)
  {
LABEL_11:
    char v10 = 1;
    goto LABEL_12;
  }

  if (identity) {
    BOOL v8 = v7 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_10;
  }
  char v10 = -[RBSProcessIdentity isEqual:](identity, "isEqual:");
LABEL_12:

  return v10;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@:%d>", v4, self->_identity, self->_pid];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"_identity"];
  [v5 encodeInt64:self->_pid forKey:@"_pid"];
}

- (RBSProcessHandlePredicateImpl)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBSProcessHandlePredicateImpl;
  id v5 = -[RBSProcessHandlePredicateImpl init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"];
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;

    v5->_int pid = [v4 decodeInt64ForKey:@"_pid"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end