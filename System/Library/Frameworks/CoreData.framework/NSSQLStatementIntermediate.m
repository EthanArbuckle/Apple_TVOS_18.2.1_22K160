@interface NSSQLStatementIntermediate
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSSQLStatementIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5;
- (id)governingAlias;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntity;
- (id)governingEntityForKeypathExpression:(id)a3;
- (void)dealloc;
- (void)setCorrelationToken:(uint64_t)a1;
- (void)setGoverningAlias:(id)a3;
- (void)setGoverningEntity:(id)a3;
- (void)setLimitIntermediate:(uint64_t)a1;
- (void)setOrderIntermediate:(uint64_t)a1;
- (void)setWhereIntermediate:(uint64_t)a1;
@end

@implementation NSSQLStatementIntermediate

- (NSSQLStatementIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  v7 = -[NSSQLIntermediate initWithScope:](self, "initWithScope:", a5);
  v8 = v7;
  if (v7)
  {
    v7->_governingEntity = (NSSQLEntity *)a3;
    v7->_governingAlias = (NSString *)a4;
  }

  return v8;
}

- (void)setWhereIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 40) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 40) = a2;
    }
  }

- (id)governingAlias
{
  return self->_governingAlias;
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  scope = self->super._scope;
  if (!scope)
  {
    if ([(id)objc_opt_class() isSimpleKeypath:a3]) {
      return self->_governingEntity;
    }
    scope = self->super._scope;
  }

  return -[NSSQLIntermediate governingEntityForKeypathExpression:](scope, "governingEntityForKeypathExpression:", a3);
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  scope = self->super._scope;
  if (!scope)
  {
    if ([(id)objc_opt_class() isSimpleKeypath:a3]) {
      return self->_governingAlias;
    }
    scope = self->super._scope;
  }

  return -[NSSQLIntermediate governingAliasForKeypathExpression:](scope, "governingAliasForKeypathExpression:", a3);
}

- (void)dealloc
{
  self->_governingAlias = 0LL;
  self->_whereClause = 0LL;

  self->_limitClause = 0LL;
  self->_orderIntermediate = 0LL;

  self->_correlationToken = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLStatementIntermediate;
  -[NSSQLStatementIntermediate dealloc](&v3, sel_dealloc);
}

- (void)setLimitIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 48) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 48) = a2;
    }
  }

- (id)governingEntity
{
  return self->_governingEntity;
}

- (void)setOrderIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 56) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 56) = a2;
    }
  }

- (void)setCorrelationToken:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 32) = a2;
    }
  }

- (void)setGoverningAlias:(id)a3
{
  if (self->_governingAlias != a3)
  {
    id v5 = a3;

    self->_governingAlias = (NSString *)a3;
  }

- (void)setGoverningEntity:(id)a3
{
  self->_governingEntity = (NSSQLEntity *)a3;
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  scope = self->super._scope;
  if (scope) {
    return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](scope, "keypathExpressionIsSafeLHSForIn:", a3);
  }
  if (([(id)objc_opt_class() isSimpleKeypath:a3] & 1) == 0)
  {
    scope = self->super._scope;
    return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](scope, "keypathExpressionIsSafeLHSForIn:", a3);
  }

  v6 = -[NSSQLStatementIntermediate governingEntityForKeypathExpression:]( self,  "governingEntityForKeypathExpression:",  a3);
  if ([a3 expressionType] == 3) {
    v7 = (void *)[a3 keyPath];
  }
  else {
    v7 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0),  "constantValue");
  }
  v9 = (void *)[v7 componentsSeparatedByString:@"."];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v20;
LABEL_10:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v9);
      }
      if (!v6) {
        return 1;
      }
      v15 = (unsigned __int8 *)[v6[5] objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
      if (!v15) {
        return 1;
      }
      v16 = v15;
      if ([v15 isToMany]) {
        break;
      }
      int v17 = v16[24];
      if (v17 == 7)
      {
        v6 = (id *)[v16 destinationEntity];
      }

      else
      {
        if (v17 == 9) {
          break;
        }
        v6 = 0LL;
      }

@end