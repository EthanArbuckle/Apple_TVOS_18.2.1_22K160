@interface RBAssertionTransientState
- (BOOL)isEqual:(id)a3;
- (NSSet)tags;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3;
- (void)addTag:(id)a3;
- (void)setMaxCPUUsageViolationPolicy:(unint64_t)a3 forRole:(unsigned __int8)a4;
- (void)unionState:(id)a3;
@end

@implementation RBAssertionTransientState

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:a3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](cpuUsageViolationPoliciesByRole, "objectForKeyedSubscript:", v4);
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (void)setMaxCPUUsageViolationPolicy:(unint64_t)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  if (!self->_cpuUsageViolationPoliciesByRole)
  {
    [MEMORY[0x189603FC8] dictionary];
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
    self->_cpuUsageViolationPoliciesByRole = v7;
  }

  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = self->_cpuUsageViolationPoliciesByRole;
  [MEMORY[0x189607968] numberWithUnsignedChar:v4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);
}

- (void)addTag:(id)a3
{
  id v4 = a3;
  tags = self->_tags;
  id v8 = v4;
  if (!tags)
  {
    [MEMORY[0x189603FE0] set];
    unint64_t v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tags;
    self->_tags = v6;

    id v4 = v8;
    tags = self->_tags;
  }

  -[NSMutableSet addObject:](tags, "addObject:", v4);
}

- (void)unionState:(id)a3
{
  id v4 = (RBAssertionTransientState *)a3;
  if (v4 && v4 != self)
  {
    v12 = v4;
    v5 = v4->_cpuUsageViolationPoliciesByRole;
    if (-[NSMutableDictionary count](v5, "count"))
    {
      if (self->_cpuUsageViolationPoliciesByRole)
      {
        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __40__RBAssertionTransientState_unionState___block_invoke;
        v13[3] = &unk_18A2560E8;
        v13[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v13);
      }

      else
      {
        unint64_t v6 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v5, "mutableCopy");
        cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
        self->_cpuUsageViolationPoliciesByRole = v6;
      }
    }

    id v8 = v12->_tags;
    if (-[NSMutableSet count](v8, "count"))
    {
      tags = self->_tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v8);
      }

      else
      {
        v10 = (NSMutableSet *)-[NSMutableSet mutableCopy](v8, "mutableCopy");
        id v11 = self->_tags;
        self->_tags = v10;
      }
    }

    id v4 = v12;
  }
}

void __40__RBAssertionTransientState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v6 = a3;
  id v7 = a2;
  [v5 objectForKeyedSubscript:v7];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)MEMORY[0x189607968];
  unint64_t v9 = [v13 unsignedIntegerValue];
  unint64_t v10 = [v6 unsignedIntegerValue];

  if (v9 <= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  [v8 numberWithUnsignedInteger:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKeyedSubscript:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = -[RBAssertionTransientState init]( +[RBAssertionTransientState allocWithZone:](&OBJC_CLASS___RBAssertionTransientState, "allocWithZone:"),  "init");
  uint64_t v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_cpuUsageViolationPoliciesByRole, "mutableCopyWithZone:", a3);
  cpuUsageViolationPoliciesByRole = v5->_cpuUsageViolationPoliciesByRole;
  v5->_cpuUsageViolationPoliciesByRole = (NSMutableDictionary *)v6;

  uint64_t v8 = -[NSMutableSet mutableCopyWithZone:](self->_tags, "mutableCopyWithZone:", a3);
  tags = v5->_tags;
  v5->_tags = (NSMutableSet *)v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBAssertionTransientState *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    if ((uint64_t v5 = objc_opt_class(), v5 != objc_opt_class())
      || (tags = self->_tags, tags != v4->_tags) && !-[NSMutableSet isEqualToSet:](tags, "isEqualToSet:")
      || (cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole,
          cpuUsageViolationPoliciesByRole != v4->_cpuUsageViolationPoliciesByRole)
      && !-[NSMutableDictionary isEqualToDictionary:]( cpuUsageViolationPoliciesByRole,  "isEqualToDictionary:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = -[NSMutableSet hash](self->_tags, "hash");
  return -[NSMutableDictionary hash](self->_cpuUsageViolationPoliciesByRole, "hash") ^ v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  -[NSMutableSet allObjects](self->_tags, "allObjects");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__RBAssertionTransientState_description__block_invoke;
  v15[3] = &unk_18A2560E8;
  id v7 = v3;
  id v16 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( cpuUsageViolationPoliciesByRole,  "enumerateKeysAndObjectsUsingBlock:",  v15);
  id v8 = objc_alloc(NSString);
  uint64_t v9 = [(id)objc_opt_class() description];
  unint64_t v10 = (void *)v9;
  if (v5)
  {
    -[NSMutableSet allObjects](self->_tags, "allObjects");
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 componentsJoinedByString:@",\n\t"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = (void *)[v8 initWithFormat:@"<%@| policies:[\n\t%@\n\t]%@%@>", v10, v7, @" tags:[\n\t", v12];
  }

  else
  {
    id v13 = (void *)[v8 initWithFormat:@"<%@| policies:[\n\t%@\n\t]%@%@>", v9, v7, &stru_18A257E48, &stru_18A257E48];
  }

  return v13;
}

void __40__RBAssertionTransientState_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 unsignedIntegerValue];
  NSStringFromRBSRole();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 unsignedIntegerValue];

  NSStringFromRBSCPUMaximumUsageViolationPolicy();
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 appendFormat:@"%@=%@\n\t", v7, v6];
}

- (NSSet)tags
{
  return &self->_tags->super;
}

- (void).cxx_destruct
{
}

@end