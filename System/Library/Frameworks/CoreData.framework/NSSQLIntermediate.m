@interface NSSQLIntermediate
+ (BOOL)expressionIsBasicKeypath:(id)a3;
+ (BOOL)isSimpleKeypath:(id)a3;
- (BOOL)_functionExpressionIsSubqueryFollowedByKeypath:(BOOL)result;
- (BOOL)disambiguationKeypathHasToMany;
- (BOOL)isFunctionScoped;
- (BOOL)isHavingScoped;
- (BOOL)isIndexExpressionScoped;
- (BOOL)isIndexScoped;
- (BOOL)isOrScoped;
- (BOOL)isTargetColumnsScoped;
- (BOOL)isUpdateColumnsScoped;
- (BOOL)isUpdateScoped;
- (BOOL)isWhereScoped;
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSArray)disambiguationKeypath;
- (NSSQLEntity)disambiguatingEntity;
- (NSSQLIntermediate)initWithScope:(id)a3;
- (id)_generateSQLForExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)_lastScopedItem;
- (id)fetchIntermediate;
- (id)fetchIntermediateForKeypathExpression:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAlias;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntity;
- (id)governingEntityForKeypathExpression:(id)a3;
- (uint64_t)_generateSQLForConstantCollection:(uint64_t)a3 reboundFrom:(void *)a4 inContext:;
- (uint64_t)_generateSQLForConstantValue:(uint64_t)a3 inContext:;
- (uint64_t)_generateSQLForFetchExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (uint64_t)_generateSQLForSubqueryExpression:(uint64_t)a3 trailingKeypath:(void *)a4 inContext:;
- (uint64_t)isSimpleNoIndexFunction:(uint64_t)a1;
- (uint64_t)isVariableBasedKeypathScopedBySubquery:(uint64_t)result;
- (uint64_t)promoteJoinsInKeypathsForExpression:(uint64_t)result;
- (void)_generateSQLForExpressionCollection:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3;
- (void)_promoteJoinsForSubqueryScopedKeypaths;
- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5;
@end

@implementation NSSQLIntermediate

- (NSSQLIntermediate)initWithScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLIntermediate;
  result = -[NSSQLIntermediate init](&v5, sel_init);
  if (result) {
    result->_scope = (NSSQLIntermediate *)a3;
  }
  return result;
}

- (id)_generateSQLForExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  id v4 = a1;
  if (a1)
  {
    if (![a4 objectForKey:@"NSUnderlyingException"])
    {
      uint64_t v9 = [a2 expressionType];
      switch(v9)
      {
        case 0LL:
          return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]( (uint64_t)v4,  [a2 constantValue],  (uint64_t)a4);
        case 1LL:
          uint64_t v11 = [MEMORY[0x189607878] expressionForKeyPath:@"_pk"];
          v10 = v4;
          uint64_t v12 = 0LL;
          return (id)[v10 _generateSQLForKeyPathExpression:v11 allowToMany:v12 inContext:a4];
        case 2LL:
          return (id)[v4 _generateSQLForVariableExpression:a2 allowToMany:a3 inContext:a4];
        case 3LL:
        case 10LL:
          goto LABEL_7;
        case 4LL:
          if (([(id)objc_opt_class() expressionIsBasicKeypath:a2] & 1) != 0
            || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v4, a2))
          {
LABEL_7:
            v10 = v4;
            uint64_t v11 = (uint64_t)a2;
            uint64_t v12 = a3;
            return (id)[v10 _generateSQLForKeyPathExpression:v11 allowToMany:v12 inContext:a4];
          }

          else
          {
            if (!-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((BOOL)v4, a2))
            {
              v19 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLFunctionExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  a2,  0LL,  v4);
              id v4 = -[NSSQLFunctionExpressionIntermediate generateSQLStringInContext:]( v19,  "generateSQLStringInContext:",  a4);
              if (!v4 && ![a4 objectForKey:@"NSUnderlyingExceptionKey"]) {
                [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported function expression %@", a2), 0), @"NSUnderlyingException" forKey];
              }

              return v4;
            }

            uint64_t v13 = [a2 operand];
            uint64_t v14 = objc_msgSend((id)objc_msgSend(a2, "arguments"), "objectAtIndex:", 0);
            uint64_t v15 = (uint64_t)v4;
            v16 = (void *)v13;
            return (id)-[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:]( v15,  v16,  v14,  a4);
          }

        case 5LL:
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
        case 11LL:
        case 12LL:
        case 15LL:
        case 16LL:
        case 17LL:
        case 18LL:
        case 19LL:
          goto LABEL_10;
        case 13LL:
          uint64_t v15 = (uint64_t)v4;
          v16 = a2;
          uint64_t v14 = 0LL;
          return (id)-[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:]( v15,  v16,  v14,  a4);
        case 14LL:
          return -[NSSQLIntermediate _generateSQLForExpressionCollection:allowToMany:inContext:]( v4,  (void *)[a2 constantValue],  a3,  a4);
        case 20LL:
          v17 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLTernaryExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  a2,  a3,  v4);
          uint64_t v18 = -[NSSQLTernaryExpressionIntermediate generateSQLStringInContext:]( v17,  "generateSQLStringInContext:",  a4);

          return (id)v18;
        default:
          if (v9 == 50) {
            return (id)-[NSSQLIntermediate _generateSQLForFetchExpression:allowToMany:inContext:](v4, a2, 0LL, a4);
          }
LABEL_10:
          [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported expression type (%u, %@)", objc_msgSend(a2, "expressionType"), a2), 0), @"NSUnderlyingException" forKey];
          break;
      }
    }

    return 0LL;
  }

  return v4;
}

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  if (objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    uint64_t v9 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  a3,  v6,  self);
    id v10 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v9, "generateSQLStringInContext:", a5);

    return v10;
  }

  else
  {
    uint64_t v12 = (void *)[a3 constantValue];
    if (([v12 isNSArray] & 1) != 0
      || ([v12 isNSSet] & 1) != 0
      || [v12 isNSOrderedSet])
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]( (uint64_t)self,  v12,  0LL,  a5);
    }

    else
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, (uint64_t)v12, (uint64_t)a5);
    }
  }

- (BOOL)isIndexScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isIndexScoped](scope, "isIndexScoped");
  }
  return (char)scope;
}

- (BOOL)isTargetColumnsScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isTargetColumnsScoped](scope, "isTargetColumnsScoped");
  }
  return (char)scope;
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate governingEntityForKeypathExpression:]( self->_scope,  "governingEntityForKeypathExpression:",  a3);
}

+ (BOOL)isSimpleKeypath:(id)a3
{
  if ([a3 expressionType] == 3) {
    return 1;
  }
  else {
    return [a1 expressionIsBasicKeypath:a3];
  }
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate governingAliasForKeypathExpression:]( self->_scope,  "governingAliasForKeypathExpression:",  a3);
}

- (BOOL)isUpdateScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isUpdateScoped](scope, "isUpdateScoped");
  }
  return (char)scope;
}

- (NSSQLEntity)disambiguatingEntity
{
  return -[NSSQLIntermediate disambiguatingEntity](self->_scope, "disambiguatingEntity");
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  return -[NSSQLIntermediate fetchIntermediateForKeypathExpression:]( self->_scope,  "fetchIntermediateForKeypathExpression:",  a3);
}

- (BOOL)isOrScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isOrScoped](scope, "isOrScoped");
  }
  return (char)scope;
}

- (NSArray)disambiguationKeypath
{
  return -[NSSQLIntermediate disambiguationKeypath](self->_scope, "disambiguationKeypath");
}

- (uint64_t)_generateSQLForConstantValue:(uint64_t)a3 inContext:
{
  if (result)
  {
    id v4 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( objc_alloc(&OBJC_CLASS___NSSQLConstantValueIntermediate),  "initWithConstantValue:inScope:context:",  a2,  result,  a3);
    uint64_t v5 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v4, "generateSQLStringInContext:", a3);

    return v5;
  }

  return result;
}

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
}

- (uint64_t)isVariableBasedKeypathScopedBySubquery:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    if ([a2 expressionType] == 4 && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2)
    {
      result = [v3 governingEntityForKeypathExpression:a2];
      if (result) {
    }
      }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (id)fetchIntermediate
{
  return -[NSSQLIntermediate fetchIntermediate](self->_scope, "fetchIntermediate");
}

- (id)generateSQLStringInContext:(id)a3
{
  return 0LL;
}

- (BOOL)isFunctionScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isFunctionScoped](scope, "isFunctionScoped");
  }
  return (char)scope;
}

- (BOOL)isHavingScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isHavingScoped](scope, "isHavingScoped");
  }
  return (char)scope;
}

- (BOOL)isWhereScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isWhereScoped](scope, "isWhereScoped");
  }
  return (char)scope;
}

- (BOOL)isUpdateColumnsScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isUpdateColumnsScoped](scope, "isUpdateColumnsScoped");
  }
  return (char)scope;
}

- (BOOL)isIndexExpressionScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = -[NSSQLIntermediate isIndexExpressionScoped](scope, "isIndexExpressionScoped");
  }
  return (char)scope;
}

- (BOOL)disambiguationKeypathHasToMany
{
  return -[NSSQLIntermediate disambiguationKeypathHasToMany](self->_scope, "disambiguationKeypathHasToMany");
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
}

+ (BOOL)expressionIsBasicKeypath:(id)a3
{
  if ([a3 expressionType] != 4
    || objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType") != 1
    && objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    return 0;
  }

  return sel_valueForKeyPath_ == (char *)[a3 selector];
}

- (uint64_t)isSimpleNoIndexFunction:(uint64_t)a1
{
  if (a1
    && [a2 expressionType] == 4
    && sel_noindex_ == (char *)[a2 selector]
    && (id v4 = (void *)[a2 arguments]) != 0
    && (uint64_t v5 = v4, [v4 count] == 1))
  {
    return objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", objc_msgSend(v5, "lastObject"));
  }

  else
  {
    return 0LL;
  }

- (id)governingAlias
{
  return -[NSSQLIntermediate governingAlias](self->_scope, "governingAlias");
}

- (id)governingEntity
{
  return -[NSSQLIntermediate governingEntity](self->_scope, "governingEntity");
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  return -[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](self->_scope, "keypathExpressionIsSafeLHSForIn:", a3);
}

- (id)_lastScopedItem
{
  id result = self->_scope;
  if (result) {
    return (id)[result _lastScopedItem];
  }
  return result;
}

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  scope = self->_scope;
  if (scope) {
    -[NSSQLIntermediate _promoteJoinsForSubqueryScopedKeypath:](scope, "_promoteJoinsForSubqueryScopedKeypath:", a3);
  }
}

- (uint64_t)promoteJoinsInKeypathsForExpression:(uint64_t)result
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v3 = (void *)result;
    while (1)
    {
      id result = [a2 expressionType];
      if (result != 20) {
        break;
      }
      -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, [a2 trueExpression]);
      a2 = (void *)[a2 falseExpression];
    }

    if (result > 9)
    {
      if (result == 14)
      {
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        id v4 = (void *)objc_msgSend(a2, "constantValue", 0);
        id result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (result)
        {
          uint64_t v5 = result;
          uint64_t v6 = *(void *)v13;
          do
          {
            uint64_t v7 = 0LL;
            do
            {
              if (*(void *)v13 != v6) {
                objc_enumerationMutation(v4);
              }
              -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:]( v3,  *(void *)(*((void *)&v12 + 1) + 8 * v7++));
            }

            while (v5 != v7);
            id result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
            uint64_t v5 = result;
          }

          while (result);
        }
      }

      else if (result == 10)
      {
        return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]( [v3 fetchIntermediate],  (void *)objc_msgSend( (id)objc_msgSend(a2, "predicateFormat"),  "componentsSeparatedByString:",  @"."));
      }
    }

    else
    {
      if (result == 3) {
        return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]( [v3 fetchIntermediate],  (void *)objc_msgSend( (id)objc_msgSend(a2, "predicateFormat"),  "componentsSeparatedByString:",  @"."));
      }
      if (result == 4)
      {
        id result = [a2 selector];
        if (sel_max_ != (char *)result && sel_min_ != (char *)result && sel_count_ != (char *)result)
        {
          if ([(id)objc_opt_class() isSimpleKeypath:a2]) {
            return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]( [v3 fetchIntermediate],  (void *)objc_msgSend( (id)objc_msgSend(a2, "predicateFormat"),  "componentsSeparatedByString:",  @"."));
          }
          if (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v3, a2))
          {
            return [v3 _promoteJoinsForSubqueryScopedKeypath:a2];
          }

          else
          {
            __int128 v14 = 0u;
            __int128 v15 = 0u;
            __int128 v12 = 0u;
            __int128 v13 = 0u;
            v8 = (void *)objc_msgSend(a2, "arguments", 0);
            id result = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
            if (result)
            {
              uint64_t v9 = result;
              uint64_t v10 = *(void *)v13;
              do
              {
                uint64_t v11 = 0LL;
                do
                {
                  if (*(void *)v13 != v10) {
                    objc_enumerationMutation(v8);
                  }
                  -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:]( v3,  *(void *)(*((void *)&v12 + 1) + 8 * v11++));
                }

                while (v9 != v11);
                id result = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
                uint64_t v9 = result;
              }

              while (result);
            }
          }
        }
      }
    }
  }

  return result;
}

- (BOOL)_functionExpressionIsSubqueryFollowedByKeypath:(BOOL)result
{
  if (result) {
    return [a2 expressionType] == 4
  }
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 13
        && (sel_valueForKey_ == (char *)[a2 selector]
  return result;
}

- (uint64_t)_generateSQLForSubqueryExpression:(uint64_t)a3 trailingKeypath:(void *)a4 inContext:
{
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "collection"), "expressionType") - 3 <= 1)
    {
      v8 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate),  "initWithExpression:trailingKeypath:inScope:",  a2,  a3,  a1);
      uint64_t v9 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:](v8, "generateSQLStringInContext:", a4);

      return v9;
    }

    objc_msgSend( a4,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Unsupported subquery collection expression type",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", a2, @"subquery")),  @"NSUnderlyingException");
  }

  return 0LL;
}

- (uint64_t)_generateSQLForConstantCollection:(uint64_t)a3 reboundFrom:(void *)a4 inContext:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  int v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"nestingLevel"), "intValue");
  if ([a2 isNSArray] & 1) != 0 || (objc_msgSend(a2, "isNSSet")) {
    int v9 = 1;
  }
  else {
    int v9 = [a2 isNSOrderedSet];
  }
  if (v8 <= 0 && v9 && (unint64_t)[a2 count] >= 0x65)
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (!v10)
    {
LABEL_34:
      id v26 = (id)[a4 objectForKey:@"bindIntarrays"];
      if (!v26)
      {
        id v26 = objc_alloc_init(MEMORY[0x189603FA8]);
        [a4 setObject:v26 forKey:@"bindIntarrays"];
      }

      v27 = -[NSSQLBindIntarray initWithValue:](objc_alloc(&OBJC_CLASS___NSSQLBindIntarray), "initWithValue:", a2);
      -[NSSQLBindIntarray setTableName:]( v27,  "setTableName:",  -[NSSQLAliasGenerator generateTempTableName]([a4 objectForKey:@"aliasGenerator"]));
      uint64_t v28 = [v26 count];
      [v26 addObject:v27];
      -[NSSQLBindIntarray setIndex:](v27, "setIndex:", v28);

      if (a3)
      {
        uint64_t v29 = [v26 count];
        uint64_t v30 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"entity"), "entityDescription");
        id v31 = (id)[a4 objectForKey:@"bindIntarraysSubstitutionOrder"];
        if (!v31)
        {
          id v31 = objc_alloc_init(MEMORY[0x189603FA8]);
          [a4 setObject:v31 forKey:@"bindIntarraysSubstitutionOrder"];
        }

        [v31 addObject:a3];
        [v31 addObject:v30];
        objc_msgSend(v31, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", v29));
      }

      return [objc_alloc(MEMORY[0x189607940]) initWithFormat:@"(SELECT * FROM %@) ", -[NSSQLBindIntarray tableName](v27, "tableName")];
    }

    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
LABEL_11:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v51 != v12) {
        objc_enumerationMutation(a2);
      }
      __int128 v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
      __int128 v15 = (char *)[v14 objCType];
      if (v15)
      {
        unsigned int v16 = *v15 - 66;
        BOOL v17 = v16 > 0x31;
        uint64_t v18 = (1LL << v16) & 0x2848200028483LL;
        if (v17 || v18 == 0) {
          break;
        }
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [a2 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_34;
      }
    }

    +[_PFRoutines anyObjectFromCollection:]((uint64_t)&OBJC_CLASS____PFRoutines, a2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      a2 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  a2);
    }
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"entity"), "entityDescription");
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v21 = [a2 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (!v21) {
      goto LABEL_34;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
LABEL_27:
    uint64_t v24 = 0LL;
    while (1)
    {
      if (*(void *)v47 != v23) {
        objc_enumerationMutation(a2);
      }
      v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend((id)objc_msgSend(v25, "entity"), "isKindOfEntity:", v20))
      {
        break;
      }

      if (v22 == ++v24)
      {
        uint64_t v22 = [a2 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v22) {
          goto LABEL_27;
        }
        goto LABEL_34;
      }
    }
  }

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @" (");
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v33 = [a2 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v43;
    char v36 = 1;
    while (2)
    {
      for (uint64_t i = 0LL; i != v34; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(a2);
        }
        uint64_t v38 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if ((v36 & 1) == 0) {
          [v32 appendString:@","];
        }
        uint64_t v39 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](a1, v38, (uint64_t)a4);
        if (!v39)
        {

          return 0LL;
        }

        v40 = (void *)v39;
        [v32 appendString:v39];

        char v36 = 0;
      }

      uint64_t v34 = [a2 countByEnumeratingWithState:&v42 objects:v54 count:16];
      char v36 = 0;
      if (v34) {
        continue;
      }
      break;
    }
  }

  [v32 appendString:@" "]);
  return (uint64_t)v32;
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  scope = self->_scope;
  if (scope) {
    return -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:]( scope,  "_generateSQLForVariableExpression:allowToMany:inContext:",  a3,  a4,  a5);
  }
  uint64_t v10 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLVariableExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  a3,  a4,  self);
  id v11 = -[NSSQLVariableExpressionIntermediate generateSQLStringInContext:](v10, "generateSQLStringInContext:", a5);

  if (!v11)
  {
    if (![a5 objectForKey:@"NSUnderlyingException"]) {
      [a5 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend(NSString, "stringWithFormat:", @"Undefined variable expression %@", a3), 0), @"NSUnderlyingException" forKey];
    }
    return 0LL;
  }

  return v11;
}

- (void)_generateSQLForExpressionCollection:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if ([a1 isIndexExpressionScoped]) {
    objc_msgSend( a4,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Unsupported: collections not allowed in index expressions.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", a2, @"Bad value")),  @"NSUnderlyingException");
  }
  int v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @" (");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    while (2)
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(a2);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        if ((v12 & 1) == 0) {
          [v8 appendString:@","];
        }
        uint64_t v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v14, a3, a4);
        if (!v15)
        {

          [a4 setValue:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported element in aggregate expression %@", v14), 0), @"NSUnderlyingException" forKey];
          return 0LL;
        }

        unsigned int v16 = (void *)v15;
        [v8 appendString:v15];

        char v12 = 0;
        ++v13;
      }

      while (v10 != v13);
      uint64_t v10 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      char v12 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }

  [v8 appendString:@" "]);
  return v8;
}

- (uint64_t)_generateSQLForFetchExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  if (!a1 || [a4 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  if ([a1 isIndexScoped])
  {
    uint64_t v7 = (void *)MEMORY[0x189603F70];
    uint64_t v8 = *MEMORY[0x189603A60];
    uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObject:a2 forKey:@"expression"];
    uint64_t v10 = @"Fetch request expressions not allowed in indexes";
    uint64_t v11 = v7;
    uint64_t v12 = v8;
LABEL_5:
    objc_msgSend( a4,  "setObject:forKey:",  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v9),  @"NSUnderlyingException");
    return 0LL;
  }

  uint64_t v15 = (void *)[a2 requestExpression];
  unsigned int v16 = (void *)[v15 expressionValueWithObject:0 context:0];
  uint64_t v17 = [a4 objectForKey:@"persistentStore"];
  __int128 v18 = (void *)[a2 requestExpression];
  __int128 v19 = (void *)[a2 contextExpression];
  if (![v18 expressionType])
  {
    __int128 v20 = (void *)objc_msgSend((id)objc_msgSend(v18, "constantValue"), "affectedStores");
    __int128 v21 = v20;
    if ((!v20 || ![v20 count]) && !objc_msgSend(v19, "expressionType")) {
      __int128 v21 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v19, "constantValue"), "persistentStoreCoordinator"),  "persistentStores");
    }
    if ([v21 count] == 1 && (objc_msgSend(v21, "containsObject:", v17) & 1) != 0)
    {
      id v22 = objc_alloc_init(MEMORY[0x1896077E8]);
      uint64_t v23 = (void *)[a4 objectForKey:@"nestingLevel"];
      uint64_t v24 = [a4 objectForKey:@"persistentStore"];
      int v25 = ([a2 isCountOnlyRequest] & 1) != 0 || objc_msgSend(v16, "resultType") == 4;
      uint64_t v30 = -[NSSQLGenerator initWithPersistentStore:]( objc_alloc(&OBJC_CLASS___NSSQLGenerator),  "initWithPersistentStore:",  v24);
      objc_msgSend( v16,  "_resolveEntityWithContext:",  objc_msgSend((id)objc_msgSend(a2, "contextExpression"), "expressionValueWithObject:context:", 0, 0));
      int v31 = [v23 unsignedIntValue];
      int v32 = [a1 isWhereScoped];
      if (v30) {
        uint64_t v33 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]( (uint64_t)v30,  v16,  0LL,  v25,  (v31 + 1),  v32,  0LL);
      }
      else {
        uint64_t v33 = 0LL;
      }

      if (v33)
      {
        uint64_t v13 = (void *)objc_msgSend(@"("), "mutableCopy";
        objc_msgSend(v13, "appendString:", -[NSSQLiteStatement sqlString](v33, "sqlString"));
        [v13 appendString:@""]);
        objc_msgSend( (id)objc_msgSend(a4, "objectForKey:", @"bindVars"),  "addObjectsFromArray:",  -[NSSQLiteStatement bindVariables](v33, "bindVariables"));
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      [v22 drain];
      return (uint64_t)v13;
    }
  }

  id v26 = (void *)objc_msgSend( a2,  "expressionValueWithObject:context:",  0,  objc_msgSend(MEMORY[0x189603FC8], "dictionary"));
  v27 = v26;
  if (!v26 || [v26 isNSNumber])
  {
    uint64_t v28 = (uint64_t)a1;
    uint64_t v29 = (uint64_t)v27;
    return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v28, v29, (uint64_t)a4);
  }

  if ([a1 isUpdateScoped])
  {
    if ([v27 count])
    {
      if ([v27 count] != 1)
      {
        uint64_t v34 = (void *)MEMORY[0x189603F70];
        uint64_t v35 = *MEMORY[0x189603A60];
        uint64_t v9 = [MEMORY[0x189603F68] dictionaryWithObject:v15 forKey:@"expression"];
        uint64_t v10 = @"Unsupported fetch request expression in update - too many results";
        uint64_t v11 = v34;
        uint64_t v12 = v35;
        goto LABEL_5;
      }

      uint64_t v29 = [v27 objectAtIndex:0];
      uint64_t v28 = (uint64_t)a1;
    }

    else
    {
      uint64_t v28 = (uint64_t)a1;
      uint64_t v29 = 0LL;
    }

    return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v28, v29, (uint64_t)a4);
  }

  return -[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)a1, v27, 0LL, a4);
}

@end