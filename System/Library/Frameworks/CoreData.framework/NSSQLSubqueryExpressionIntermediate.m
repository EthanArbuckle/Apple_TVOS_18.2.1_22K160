@interface NSSQLSubqueryExpressionIntermediate
- (BOOL)_isKeypathScopedToSubquery:(BOOL)result;
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSSQLSubqueryExpressionIntermediate)initWithExpression:(id)a3 trailingKeypath:(id)a4 inScope:(id)a5;
- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)fetchIntermediateForKeypathExpression:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntityForKeypathExpression:(id)a3;
- (uint64_t)canDoDirectJoinGivenPredicate:(void *)a1;
- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3;
- (void)_promoteJoinsForSubqueryScopedKeypaths;
- (void)_setVariableColumn:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSSQLSubqueryExpressionIntermediate

- (NSSQLSubqueryExpressionIntermediate)initWithExpression:(id)a3 trailingKeypath:(id)a4 inScope:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate;
  v7 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( &v11,  sel_initWithExpression_allowToMany_inScope_,  a3,  0LL,  a5);
  if (v7)
  {
    v7->_trailingKeypath = (NSExpression *)a4;
    if (a4)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "constantValue"), "rangeOfString:", @"@") != 0x7FFFFFFFFFFFFFFFLL) {
        v7->_hasTrailingFunction = 1;
      }
      int v8 = objc_msgSend((id)objc_msgSend(a4, "constantValue"), "hasSuffix:", @"@count");
      v7->_isCount = v8;
      if (v8)
      {
        v7->_onlyTrailIsCount = objc_msgSend( (id)objc_msgSend(a4, "constantValue"),  "isEqualToString:",  @".@count");
        uint64_t v9 = [MEMORY[0x189607A48] defaultInstance];
        v7->_subqueryHasTruePredicate = v9 == [a3 predicate];
      }
    }

    v7->_variableExpression = (NSExpression *)[a3 variableExpression];
    v7->_useDistinct = 0;
  }

  return v7;
}

- (void)dealloc
{
  self->_trailingKeypath = 0LL;
  self->_selectFromEntity = 0LL;
  self->_variableExpression = 0LL;
  self->_governingEntityForVariable = 0LL;

  self->_selectFromCorrelationTarget = 0LL;
  self->_fetchIntermediate = 0LL;

  self->_selectEntityAlias = 0LL;
  self->_variableAlias = 0LL;

  self->_variableColumn = 0LL;
  self->_keypathsToPromote = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate;
  -[NSSQLSubqueryExpressionIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)_isKeypathScopedToSubquery:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    return [a2 expressionType] == 4
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2
        && (sel_valueForKey_ == (char *)[a2 selector]
  }

  return result;
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_fetchIntermediate;
  }
  else {
    return -[NSSQLIntermediate fetchIntermediateForKeypathExpression:]( self->super.super._scope,  "fetchIntermediateForKeypathExpression:",  a3);
  }
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_governingEntityForVariable;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate;
  return -[NSSQLIntermediate governingEntityForKeypathExpression:](&v6, sel_governingEntityForKeypathExpression_, a3);
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3)) {
    return self->_variableAlias;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate;
  return -[NSSQLIntermediate governingAliasForKeypathExpression:](&v6, sel_governingAliasForKeypathExpression_, a3);
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  if (!objc_msgSend( a3,  "isEqual:",  -[NSExpression variableExpression](self->super._expression, "variableExpression"))) {
    return -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:]( self->super.super._scope,  "_generateSQLForVariableExpression:allowToMany:inContext:",  a3,  v6,  a5);
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@" "];
  [v9 appendString:self->_variableAlias];
  [v9 appendString:@"."];
  objc_msgSend(v9, "appendString:", -[NSSQLColumn columnName](self->_variableColumn, "columnName"));
  return v9;
}

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  if (objc_msgSend( (id)objc_msgSend(a3, "operand"),  "isEqual:",  -[NSExpression variableExpression](self->super._expression, "variableExpression")))
  {
    if ([a3 expressionType] == 3) {
      v5 = (void *)[a3 keyPath];
    }
    else {
      v5 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0),  "constantValue");
    }
    uint64_t v6 = [v5 componentsSeparatedByString:@"."];
    keypathsToPromote = self->_keypathsToPromote;
    if (!keypathsToPromote)
    {
      keypathsToPromote = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      self->_keypathsToPromote = keypathsToPromote;
    }

    -[NSMutableArray addObject:](keypathsToPromote, "addObject:", v6);
  }

  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypath:]( self->super.super._scope,  "_promoteJoinsForSubqueryScopedKeypath:",  a3);
}

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  keypathsToPromote = self->_keypathsToPromote;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( keypathsToPromote,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(keypathsToPromote);
        }
        -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]( (uint64_t)self->_fetchIntermediate,  *(void **)(*((void *)&v8 + 1) + 8 * i));
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( keypathsToPromote,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypaths]( self->super.super._scope,  "_promoteJoinsForSubqueryScopedKeypaths");
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (-[NSSQLSubqueryExpressionIntermediate _isKeypathScopedToSubquery:]((BOOL)self, a3))
  {
    uint64_t v5 = -[NSSQLSubqueryExpressionIntermediate governingEntityForKeypathExpression:]( self,  "governingEntityForKeypathExpression:",  a3);
    if ([a3 expressionType] == 3) {
      uint64_t v6 = (void *)[a3 keyPath];
    }
    else {
      uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0),  "constantValue");
    }
    __int128 v8 = (void *)[v6 componentsSeparatedByString:@"."];
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v20;
LABEL_8:
      uint64_t v13 = 0LL;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        if (!v5) {
          return 1;
        }
        v14 = (unsigned __int8 *)[v5[5] objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v13)];
        if (!v14) {
          return 1;
        }
        v15 = v14;
        if ([v14 isToMany]) {
          break;
        }
        int v16 = v15[24];
        if (v16 == 7)
        {
          uint64_t v5 = (id *)[v15 destinationEntity];
        }

        else
        {
          if (v16 == 9) {
            break;
          }
          uint64_t v5 = 0LL;
        }

- (void)_setVariableColumn:(uint64_t)a1
{
  if (*(void **)(a1 + 88) != a2)
  {
    id v4 = a2;

    *(void *)(a1 + 88) = a2;
  }

- (uint64_t)canDoDirectJoinGivenPredicate:(void *)a1
{
  id v4 = objc_alloc(&OBJC_CLASS___NSSQLSubqueryExpressionIntermediatePredicateVisitor);
  if (v4)
  {
    v8.receiver = v4;
    v8.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediatePredicateVisitor;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel_init);
    if (v5)
    {
      v5[1] = a1;
      *((_BYTE *)v5 + 16) = 0;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = [v5 checkPredicate:a2];

  return v6;
}

- (id)generateSQLStringInContext:(id)a3
{
  id v3 = a3;
  uint64_t v154 = *MEMORY[0x1895F89C0];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  if (!-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    trailingKeypath = self->_trailingKeypath;
    if (trailingKeypath)
    {
      uint64_t v12 = (void *)-[NSExpression predicateFormat](trailingKeypath, "predicateFormat");
      uint64_t v13 = [v12 rangeOfString:@".@"];
      if (v13 != [v12 rangeOfString:@".@" options:4])
      {
        v14 = (void *)MEMORY[0x189603F70];
        uint64_t v15 = *MEMORY[0x189603A60];
        uint64_t v16 = [NSString stringWithFormat:@"Unsupported subquery (too many functions): %@", self->super._expression];
LABEL_7:
        objc_super v8 = (const __CFString *)v16;
        uint64_t v9 = v14;
        uint64_t v10 = v15;
        uint64_t v7 = 0LL;
        goto LABEL_8;
      }
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    if ((-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")
       || -[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
      && !self->_trailingKeypath
      && ([v12 hasSuffix:@".@count"] & 1) == 0
      && ([v12 hasSuffix:@".@min"] & 1) == 0
      && ([v12 hasSuffix:@".@max"] & 1) == 0
      && ([v12 hasSuffix:@".@sum"] & 1) == 0
      && ([v12 hasSuffix:@".@avg"] & 1) == 0)
    {
      v14 = (void *)MEMORY[0x189603F70];
      uint64_t v15 = *MEMORY[0x189603A60];
      uint64_t v16 = [NSString stringWithFormat:@"Unsupported subquery (non-aggregate not allowed in select or update column): %@", self->super._expression];
      goto LABEL_7;
    }

    self->_fetchIntermediate = -[NSSQLFetchIntermediate initWithScope:]( objc_alloc(&OBJC_CLASS___NSSQLFetchIntermediate),  "initWithScope:",  self);
    id v19 = -[NSExpression collection](self->super._expression, "collection");
    if (([(id)objc_opt_class() isSimpleKeypath:v19] & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v19))
    {
      [v3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported subquery collection type (%@)", v19), 0), @"NSUnderlyingException" forKey];
      goto LABEL_139;
    }

    __int128 v20 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v19, "arguments"), "objectAtIndex:", 0),  "constantValue"),  "componentsSeparatedByString:",  @".");
    else {
      uint64_t v21 = objc_msgSend(v20, "subarrayWithRange:", 1, objc_msgSend(v20, "count") - 1);
    }
    v147 = (void *)v21;
    __int128 v22 = -[NSSQLIntermediate governingEntityForKeypathExpression:]( self->super.super._scope,  "governingEntityForKeypathExpression:",  v19);
    self->_selectFromEntity = v22;
    BOOL v23 = -[NSSQLIntermediate isUpdateColumnsScoped](self, "isUpdateColumnsScoped");
    scope = self->super.super._scope;
    if (v23)
    {
      id v25 = -[NSSQLIntermediate governingAlias](scope, "governingAlias");
      if (v25) {
        goto LABEL_30;
      }
      uint64_t v26 = -[NSSQLEntity tableName](v22, "tableName");
    }

    else
    {
      uint64_t v26 = -[NSSQLIntermediate governingAliasForKeypathExpression:](scope, "governingAliasForKeypathExpression:", v19);
    }

    id v25 = (id)v26;
LABEL_30:
    id v144 = v19;
    uint64_t v27 = [v20 objectAtIndex:0];
    if (v22)
    {
      v28 = (void *)-[NSMutableDictionary objectForKey:](v22->_properties, "objectForKey:", v27);
      v29 = (void *)[v3 valueForKey:@"explicitRestrictingEntityQualifier"];
      if (v28) {
        goto LABEL_38;
      }
    }

    else
    {
      v29 = (void *)[v3 valueForKey:@"explicitRestrictingEntityQualifier"];
    }

    v30 = v29;
    if ([v29 count])
    {
      uint64_t v31 = [v30 lastObject];
      uint64_t v32 = [v20 objectAtIndex:0];
      if (v31) {
        v28 = (void *)[*(id *)(v31 + 40) objectForKey:v32];
      }
      else {
        v28 = 0LL;
      }
      [v30 removeLastObject];
    }

    else
    {
      v28 = 0LL;
    }

@end