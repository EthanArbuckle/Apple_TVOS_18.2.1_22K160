@interface RBSProcessIdentifier
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (RBSProcessIdentifier)identifierWithPid:(int)a3;
+ (id)identifierForCurrentProcess;
+ (id)identifierForIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)description;
- (RBSProcessIdentifier)init;
- (RBSProcessIdentifier)initWithPid:(int)a3;
- (RBSProcessIdentifier)initWithRBSXPCCoder:(id)a3;
- (id)processPredicate;
- (int)pid;
- (int)rbs_pid;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentifier

+ (RBSProcessIdentifier)identifierWithPid:(int)a3
{
  return  -[RBSProcessIdentifier initWithPid:]( objc_alloc(&OBJC_CLASS___RBSProcessIdentifier),  "initWithPid:",  *(void *)&a3);
}

+ (id)identifierForCurrentProcess
{
  return (id)[a1 identifierWithPid:getpid()];
}

+ (id)identifierForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v6 = v4;
  }

  else
  {
    objc_msgSend(a1, "identifierWithPid:", objc_msgSend(v4, "rbs_pid"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  v7 = v6;

  return v7;
}

- (RBSProcessIdentifier)init
{
  return -[RBSProcessIdentifier initWithPid:](self, "initWithPid:", getpid());
}

- (RBSProcessIdentifier)initWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (initWithPid__onceToken != -1) {
    dispatch_once(&initWithPid__onceToken, &__block_literal_global_5);
  }
  if ((int)v3 < 1)
  {
    v7 = 0LL;
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock);
    uint64_t v5 = (void *)__ProcessIdentifiers;
    [MEMORY[0x189607968] numberWithInt:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:v6];
    v7 = (RBSProcessIdentifier *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = self;
      v7->_pid = v3;
      v8 = (void *)__ProcessIdentifiers;
      [MEMORY[0x189607968] numberWithInt:v3];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v7 forKey:v9];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock);
  }

  return v7;
}

void __36__RBSProcessIdentifier_initWithPid___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
  v1 = (void *)__ProcessIdentifiers;
  __ProcessIdentifiers = v0;
}

- (int)rbs_pid
{
  return self->_pid;
}

- (BOOL)matchesProcess:(id)a3
{
  int pid = self->_pid;
  return pid == objc_msgSend(a3, "rbs_pid");
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  self);
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessIdentifier *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (objc_opt_respondsToSelector() & 1) != 0)
    {
      int pid = self->_pid;
      BOOL v7 = pid == -[RBSProcessIdentifier rbs_pid](v4, "rbs_pid");
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  v2 = self;
  objc_sync_enter(v2);
  description = v2->_description;
  if (!description)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%d", v2->_pid);
    uint64_t v5 = v2->_description;
    v2->_description = (NSString *)v4;

    description = v2->_description;
  }

  id v6 = description;
  objc_sync_exit(v2);

  return v6;
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
}

- (RBSProcessIdentifier)initWithRBSXPCCoder:(id)a3
{
  return -[RBSProcessIdentifier initWithPid:]( self,  "initWithPid:",  [a3 decodeInt64ForKey:@"_pid"]);
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
}

@end