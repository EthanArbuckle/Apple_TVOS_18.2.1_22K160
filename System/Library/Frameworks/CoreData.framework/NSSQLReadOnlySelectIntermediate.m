@interface NSSQLReadOnlySelectIntermediate
- (BOOL)onlyFetchesAggregates;
- (NSSQLReadOnlySelectIntermediate)initWithScope:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)resolveVariableExpression:(id)a3 inContext:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLReadOnlySelectIntermediate

- (NSSQLReadOnlySelectIntermediate)initWithScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLReadOnlySelectIntermediate;
  v3 = -[NSSQLIntermediate initWithScope:](&v5, sel_initWithScope_, a3);
  if (v3)
  {
    *(void *)&v3->_onlyFetchesAggregates = objc_alloc_init(MEMORY[0x189603FC8]);
    v3->_variableToAliasMappings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v3;
}

- (id)generateSQLStringInContext:(id)a3
{
  id v3 = a3;
  uint64_t v129 = *MEMORY[0x1895F89C0];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  NSUInteger v7 = -[NSArray count](self->super._fetchColumns, "count");
  *(&self->super._isCount + 1) = 1;
  v8 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  -[NSArray count](self->super._fetchColumns, "count"));
  v9 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
  NSUInteger v103 = v7;
  uint64_t v98 = (uint64_t)v9;
  if (!v9 || !v9[9])
  {
    if (!v7)
    {
      char v15 = 1;
LABEL_37:
      char v100 = 1;
      goto LABEL_38;
    }

    uint64_t v16 = 0LL;
    while (1)
    {
      id v17 = -[NSArray objectAtIndex:](self->super._fetchColumns, "objectAtIndex:", v16);
      if ([v17 _propertyType] != 5) {
        goto LABEL_27;
      }
      v12 = (void *)[v17 expression];
      uint64_t v18 = [v12 expressionType];
      if (v18 == 3) {
        goto LABEL_28;
      }
      if (v18 == 4)
      {
        if (sel_valueForKey_ == (char *)[v12 selector]
          || sel_valueForKeyPath_ == (char *)[v12 selector])
        {
LABEL_28:
          uint64_t v19 = [v12 _mapKVCOperatorsToFunctionsInContext:v3];
          if ([v3 objectForKey:@"NSUnderlyingException"])
          {
LABEL_161:
            [v3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't generate select target token for expression: %@", v12), 0), @"NSUnderlyingException" forKey];
            return 0LL;
          }

          if (v19)
          {
            id v17 = (id)[v17 copy];
            [v17 setExpression:v19];
          }

          else
          {
            *(&self->super._isCount + 1) = 0;
          }

          NSUInteger v7 = v103;
          goto LABEL_33;
        }

        if (!+[NSSQLFunctionExpressionIntermediate functionIsAcceptableAsAggregate:]( (uint64_t)&OBJC_CLASS___NSSQLFunctionExpressionIntermediate,  v12)) {
LABEL_27:
        }
          *(&self->super._isCount + 1) = 0;
      }

void __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:a2];
  id v5 = -[NSSQLColumn initForReadOnlyFetching](objc_alloc(&OBJC_CLASS___NSSQLAttribute), "initForReadOnlyFetching");
  [v5 copyValuesForReadOnlyFetch:v3];
  v4 = v5;
  if (v5)
  {
    *((void *)v5 + 1) = *(void *)(a1 + 40);
    if ((*((_WORD *)v5 + 16) & 1) != 0)
    {
      [*(id *)(a1 + 48) appendString:*(void *)(*(void *)(a1 + 56) + 56)];
      [*(id *)(a1 + 48) appendString:@"."];
      v4 = v5;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "appendString:", objc_msgSend(v4, "columnName"));
  [*(id *)(a1 + 64) addObject:v5];
}

- (void)dealloc
{
  *(void *)&self->_onlyFetchesAggregates = 0LL;
  self->_variableToAliasMappings = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLReadOnlySelectIntermediate;
  -[NSSQLSelectIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)onlyFetchesAggregates
{
  return *(&self->super._isCount + 1);
}

- (id)resolveVariableExpression:(id)a3 inContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  NSUInteger v7 = (void *)[a4 objectForKey:@"storeRequest"];
  v8 = (void *)[*(id *)&self->_onlyFetchesAggregates objectForKey:a3];
  if (v8) {
    return (id)[v8 mutableCopy];
  }
  uint64_t v10 = [a3 variable];
  id v11 = (void *)[v7 propertiesToFetch];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
LABEL_5:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
      if ([v16 _propertyType] == 5
        && (objc_msgSend((id)objc_msgSend(v16, "name"), "isEqual:", v10) & 1) != 0)
      {
        break;
      }

      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v13) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }

    id v17 = (void *)-[NSSQLAliasGenerator generateVariableAlias]([a4 objectForKey:@"aliasGenerator"]);
    [*(id *)&self->_onlyFetchesAggregates setObject:v17 forKey:a3];
    -[NSMutableDictionary setObject:forKey:](self->_variableToAliasMappings, "setObject:forKey:", v17, v16);
    id result = (id)[v17 mutableCopy];
    if (result) {
      return result;
    }
  }

uint64_t __62__NSSQLReadOnlySelectIntermediate_generateSQLStringInContext___block_invoke_39( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    v4 = (void *)objc_msgSend(a2, "elements", 0);
    uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) + 16LL))();
          ++v8;
        }

        while (v6 != v8);
        uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v6 = result;
      }

      while (result);
    }
  }

  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [a2 _qualifiedName]);
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", @", ");
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

@end