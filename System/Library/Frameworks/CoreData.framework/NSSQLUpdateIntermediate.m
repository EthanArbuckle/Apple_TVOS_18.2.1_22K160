@interface NSSQLUpdateIntermediate
- (BOOL)isUpdateScoped;
- (NSSQLUpdateIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)setUpdateColumnsIntermediate:(uint64_t)a1;
@end

@implementation NSSQLUpdateIntermediate

- (NSSQLUpdateIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLUpdateIntermediate;
  return -[NSSQLStatementIntermediate initWithEntity:alias:inScope:](&v6, sel_initWithEntity_alias_inScope_, a3, a4, a5);
}

- (void)dealloc
{
  self->_updateColumns = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLUpdateIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isUpdateScoped
{
  return 1;
}

- (void)setUpdateColumnsIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 64) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 64) = a2;
    }
  }

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  if (-[NSSQLStatementIntermediate governingAlias](self, "governingAlias")) {
    v5 = (const __CFString *)[NSString stringWithFormat:@" AS %@", -[NSSQLStatementIntermediate governingAlias](self, "governingAlias")];
  }
  else {
    v5 = &stru_189EAC2E8;
  }
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"UPDATE OR FAIL %@%@ SET ", objc_msgSend(-[NSSQLStatementIntermediate governingEntity](self, "governingEntity"), "tableName"), v5];
  id v7 = -[NSSQLUpdateColumnsIntermediate generateSQLStringInContext:]( self->_updateColumns,  "generateSQLStringInContext:",  a3);
  if (!v7)
  {
LABEL_19:

    return 0LL;
  }

  v8 = v7;
  [v6 appendString:v7];
  whereClause = self->super._whereClause;
  if (whereClause)
  {
    id v10 = -[NSSQLIntermediate generateSQLStringInContext:](whereClause, "generateSQLStringInContext:", a3);
    if (!v10) {
      goto LABEL_18;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  orderIntermediate = self->super._orderIntermediate;
  if (orderIntermediate)
  {
    id v12 = -[NSSQLOrderIntermediate generateSQLStringInContext:](orderIntermediate, "generateSQLStringInContext:", a3);
    if (!v12) {
      goto LABEL_17;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  limitClause = self->super._limitClause;
  if (limitClause)
  {
    id v14 = -[NSSQLLimitIntermediate generateSQLStringInContext:](limitClause, "generateSQLStringInContext:", a3);
    if (!v14)
    {

LABEL_17:
LABEL_18:

      goto LABEL_19;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  if (v10)
  {
    [v6 appendString:@"WHERE "];
    [v6 appendString:v10];
    [v6 appendString:@" "];
  }

  if (v12) {
    [v6 appendString:v12];
  }
  if (v14) {
    [v6 appendString:v14];
  }

  return v6;
}

@end