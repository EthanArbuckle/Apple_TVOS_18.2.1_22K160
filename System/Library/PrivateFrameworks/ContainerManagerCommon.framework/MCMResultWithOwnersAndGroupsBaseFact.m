@interface MCMResultWithOwnersAndGroupsBaseFact
- (BOOL)isEqual:(id)a3;
- (MCMResultWithOwnersAndGroupsBaseFact)initWithOwnerIndex:(unint64_t)a3 groupIndex:(unint64_t)a4;
- (unint64_t)groupIndex;
- (unint64_t)hash;
- (unint64_t)ownerIndex;
@end

@implementation MCMResultWithOwnersAndGroupsBaseFact

- (MCMResultWithOwnersAndGroupsBaseFact)initWithOwnerIndex:(unint64_t)a3 groupIndex:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCMResultWithOwnersAndGroupsBaseFact;
  result = -[MCMResultWithOwnersAndGroupsBaseFact init](&v7, sel_init);
  if (result)
  {
    result->_ownerIndex = a3;
    result->_groupIndex = a4;
  }

  return result;
}

- (unint64_t)hash
{
  unint64_t v3 = -[MCMResultWithOwnersAndGroupsBaseFact ownerIndex](self, "ownerIndex");
  return -[MCMResultWithOwnersAndGroupsBaseFact groupIndex](self, "groupIndex") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 ownerIndex];
    BOOL v8 = 0;
    if (v6 == -[MCMResultWithOwnersAndGroupsBaseFact ownerIndex](self, "ownerIndex"))
    {
      uint64_t v7 = [v5 groupIndex];
      if (v7 == -[MCMResultWithOwnersAndGroupsBaseFact groupIndex](self, "groupIndex")) {
        BOOL v8 = 1;
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)ownerIndex
{
  return self->_ownerIndex;
}

- (unint64_t)groupIndex
{
  return self->_groupIndex;
}

@end