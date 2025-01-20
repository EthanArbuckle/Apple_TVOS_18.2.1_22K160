@interface NSSQLAliasGenerator
- (NSSQLAliasGenerator)init;
- (NSSQLAliasGenerator)initWithNestingLevel:(unsigned int)a3;
- (id)generateSubqueryVariableAlias;
- (id)generateTableAlias;
- (uint64_t)generateTempTableName;
- (uint64_t)generateVariableAlias;
- (void)dealloc;
@end

@implementation NSSQLAliasGenerator

- (NSSQLAliasGenerator)initWithNestingLevel:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLAliasGenerator;
  v4 = -[NSSQLAliasGenerator init](&v7, sel_init);
  if (v4)
  {
    if ((_DWORD)v3)
    {
      v4->_tableBase = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"n%u_t%cu",  v3,  37);
      v5 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"__n%u_var%cu",  v3,  37);
    }

    else
    {
      v4->_tableBase = (NSString *)@"t%u";
      v5 = @"__var%u";
    }

    v4->_variableBase = (NSString *)v5;
    *(void *)&v4->_nextTableAlias = 0LL;
    v4->_nextTempTableAlias = 0;
  }

  return v4;
}

- (id)generateTableAlias
{
  v2 = (void *)NSString;
  tableBase = self->_tableBase;
  uint64_t nextTableAlias = self->_nextTableAlias;
  self->_uint64_t nextTableAlias = nextTableAlias + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", tableBase, nextTableAlias);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLAliasGenerator;
  -[NSSQLAliasGenerator dealloc](&v3, sel_dealloc);
}

- (uint64_t)generateTempTableName
{
  if (result)
  {
    v1 = (void *)NSString;
    uint64_t v2 = *(unsigned int *)(result + 16);
    *(_DWORD *)(result + 16) = v2 + 1;
    return objc_msgSend(v1, "stringWithFormat:", @"_Z_intarray%u", v2);
  }

  return result;
}

- (NSSQLAliasGenerator)init
{
  return -[NSSQLAliasGenerator initWithNestingLevel:](self, "initWithNestingLevel:", 0LL);
}

- (uint64_t)generateVariableAlias
{
  if (result)
  {
    v1 = (void *)NSString;
    uint64_t v2 = *(void *)(result + 32);
    uint64_t v3 = *(unsigned int *)(result + 12);
    *(_DWORD *)(result + 12) = v3 + 1;
    return objc_msgSend(v1, "stringWithFormat:", v2, v3);
  }

  return result;
}

- (id)generateSubqueryVariableAlias
{
  if (self)
  {
    uint64_t v2 = (void *)NSString;
    uint64_t v3 = *((void *)self + 4);
    uint64_t v4 = *((unsigned int *)self + 3);
    *((_DWORD *)self + 3) = v4 + 1;
    return (id)objc_msgSend(v2, "stringWithFormat:", v3, v4);
  }

  return self;
}

@end