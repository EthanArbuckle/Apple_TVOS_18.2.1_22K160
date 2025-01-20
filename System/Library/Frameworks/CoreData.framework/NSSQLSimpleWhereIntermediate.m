@interface NSSQLSimpleWhereIntermediate
- (BOOL)isWhereScoped;
- (NSSQLSimpleWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4;
- (__CFString)_sqlTokenForPredicateOperator:(unint64_t)a1 inContext:(void *)a2;
- (id)_generateSQLBeginsWithStringInContext:(uint64_t)a1;
- (id)_generateSQLBoundByStringInContext:(uint64_t)a1;
- (id)_generateSQLForConst:(void *)a3 inToMany:(void *)a4 inContext:;
- (id)_generateSQLType3InContext:(uint64_t)a1;
- (id)_lastScopedItem;
- (id)generateSQLStringInContext:(id)a3;
- (uint64_t)_upperBoundSearchStringForString:(__CFString *)a1 context:(void *)a2;
- (void)_generateSQLBetweenStringInContext:(uint64_t)a1;
- (void)_generateSQLForConst:(__CFString *)a3 inManyToMany:(uint64_t)a4 expression:(void *)a5 inContext:;
- (void)_generateSQLForConst:(uint64_t)a1 inAttribute:(uint64_t)a2 expression:(uint64_t)a3 inContext:(uint64_t)a4;
- (void)_generateSQLForMatchingOperator:(void *)a3 inContext:;
- (void)_generateSQLForString:(void *)a3 expressionPath:(int)a4 wildStart:(int)a5 wildEnd:(uint64_t)a6 allowToMany:(void *)a7 inContext:;
- (void)_generateSQLSubstringWildStart:(int)a3 wildEnd:(void *)a4 inContext:;
- (void)dealloc;
@end

@implementation NSSQLSimpleWhereIntermediate

- (NSSQLSimpleWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSQLSimpleWhereIntermediate;
  v5 = -[NSSQLWhereIntermediate initWithPredicate:inScope:](&v11, sel_initWithPredicate_inScope_, a3, a4);
  if (v5)
  {
    v5->_effectiveLeftExpression = (NSExpression *)(id)[a3 leftExpression];
    v5->_effectiveRightExpression = (NSExpression *)(id)[a3 rightExpression];
    if (-[NSExpression expressionType](v5->_effectiveLeftExpression, "expressionType") == NSFunctionExpressionType
      && -[NSExpression expressionType]( -[NSExpression operand](v5->_effectiveLeftExpression, "operand"),  "expressionType") == NSConstantValueExpressionType && (sel_valueForKey_ == (char *)-[NSExpression selector](v5->_effectiveLeftExpression, "selector")
       || sel_valueForKeyPath_ == (char *)-[NSExpression selector](v5->_effectiveLeftExpression, "selector")))
    {
      uint64_t v6 = -[NSExpression expressionValueWithObject:context:]( v5->_effectiveLeftExpression,  "expressionValueWithObject:context:",  0LL,  0LL);
      v7 = (void *)[MEMORY[0x189607878] expressionForConstantValue:v6];

      v5->_effectiveLeftExpression = (NSExpression *)v7;
    }

    if (-[NSExpression expressionType](v5->_effectiveRightExpression, "expressionType") == NSFunctionExpressionType
      && -[NSExpression expressionType]( -[NSExpression operand](v5->_effectiveRightExpression, "operand"),  "expressionType") == NSConstantValueExpressionType && (sel_valueForKey_ == (char *)-[NSExpression selector](v5->_effectiveRightExpression, "selector")
       || sel_valueForKeyPath_ == (char *)-[NSExpression selector](v5->_effectiveRightExpression, "selector")))
    {
      uint64_t v8 = -[NSExpression expressionValueWithObject:context:]( v5->_effectiveRightExpression,  "expressionValueWithObject:context:",  0LL,  0LL);
      v9 = (void *)[MEMORY[0x189607878] expressionForConstantValue:v8];

      v5->_effectiveRightExpression = (NSExpression *)v9;
    }
  }

  return v5;
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  uint64_t v5 = -[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType");
  if (-[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier") != 1)
  {
    effectiveLeftExpression = self->_effectiveLeftExpression;
    if (-[NSExpression expressionType](effectiveLeftExpression, "expressionType") == NSConstantValueExpressionType)
    {
      uint64_t v20 = -[NSExpression constantValue](effectiveLeftExpression, "constantValue");
      if (!v20 || [MEMORY[0x189603FE8] null] == v20)
      {
        uint64_t v6 = (void *)MEMORY[0x189603F70];
        uint64_t v7 = *MEMORY[0x189603A60];
        uint64_t v8 = @"can't use NULL on left hand side";
        goto LABEL_4;
      }
    }

    unint64_t v12 = 0x18C4A5000uLL;
    if (v5 <= 98)
    {
      switch(v5)
      {
        case 0LL:
        case 1LL:
        case 2LL:
        case 3LL:
          v13 = self->_effectiveLeftExpression;
          effectiveRightExpression = self->_effectiveRightExpression;
          uint64_t v15 = -[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier");
          if (-[NSExpression expressionType](v13, "expressionType") == NSConstantValueExpressionType
            && ((uint64_t v38 = -[NSExpression constantValue](v13, "constantValue")) == 0
             || [MEMORY[0x189603FE8] null] == v38)
            || -[NSExpression expressionType](effectiveRightExpression, "expressionType") == NSConstantValueExpressionType
            && ((uint64_t v39 = -[NSExpression constantValue](effectiveRightExpression, "constantValue")) == 0
             || [MEMORY[0x189603FE8] null] == v39))
          {
            v40 = (void *)MEMORY[0x189603F70];
            uint64_t v41 = *MEMORY[0x189603A60];
            v42 = @"illegal comparison with NULL";
            goto LABEL_48;
          }

          if (-[NSPredicate options](self->super._predicate, "options")) {
            goto LABEL_101;
          }
          if (!self->_comparisonPredicateScopedItem) {
            self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
          }
          if (-[NSExpression expressionType](v13, "expressionType") == NSKeyPathExpressionType
            && (uint64_t v17 = -[NSExpression expressionType](effectiveRightExpression, "expressionType"), v16 = v13, !v17)
            || -[NSExpression expressionType](effectiveRightExpression, "expressionType", v16) == NSKeyPathExpressionType
            && (uint64_t v18 = -[NSExpression expressionType](v13, "expressionType"), v16 = effectiveRightExpression, !v18))
          {
            -[NSMutableArray addObject:](self->_comparisonPredicateScopedItem, "addObject:", v16);
            int v19 = 1;
          }

          else
          {
            int v19 = 0;
          }

          v55 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]( self,  v13,  v15 == 2,  a3);
          if (!v55) {
            goto LABEL_104;
          }
          v9 = v55;
          id v56 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]( self,  effectiveRightExpression,  v15 == 2,  a3);
          if (v56)
          {
            v57 = v56;
            v58 = -[NSSQLSimpleWhereIntermediate _sqlTokenForPredicateOperator:inContext:]( -[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType"),  a3);
            if (v58) {
              goto LABEL_141;
            }
          }

          else
          {
          }

          goto LABEL_104;
        case 4LL:
        case 5LL:
          if (-[NSPredicate predicateOperatorType](self->super._predicate, "predicateOperatorType") == 5) {
            v33 = @"IS NOT NULL";
          }
          else {
            v33 = @"IS NULL";
          }
          v34 = self->_effectiveLeftExpression;
          v35 = self->_effectiveRightExpression;
          uint64_t v36 = -[NSPredicate comparisonPredicateModifier](self->super._predicate, "comparisonPredicateModifier");
          if (-[NSExpression expressionType](v34, "expressionType"))
          {
            BOOL v37 = 0;
          }

          else
          {
            uint64_t v47 = -[NSExpression constantValue](v34, "constantValue");
            if (v47) {
              BOOL v37 = [MEMORY[0x189603FE8] null] == v47;
            }
            else {
              BOOL v37 = 1;
            }
          }

          if (-[NSExpression expressionType](v35, "expressionType"))
          {
            BOOL v59 = 0;
          }

          else
          {
            uint64_t v60 = -[NSExpression constantValue](v35, "constantValue");
            if (!v60)
            {
              if (v37) {
                v62 = v35;
              }
              else {
                v62 = v34;
              }
LABEL_121:
              id v72 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v62, v36 == 2, a3);
              if (!v72) {
                goto LABEL_104;
              }
              v73 = v72;
              -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:]((uint64_t)self, v62);
              v9 = (__CFString *)[objc_alloc(MEMORY[0x189607940]) initWithString:v73];
              -[__CFString appendString:](v9, "appendString:", @" ");
              -[__CFString appendString:](v9, "appendString:", v33);

LABEL_103:
              if (v9)
              {
LABEL_109:
                uint64_t v66 = *(int *)(v12 + 1420);

                *(Class *)((char *)&self->super.super.super.isa + v66) = 0LL;
                [a3 setValue:0 forKey:@"entitySpecificationKeypath"];
                [a3 setValue:0 forKey:@"entitySpecificationKeypathContainsToMany"];
                [a3 setValue:0 forKey:@"generatePairs"];
                return v9;
              }

- (id)_lastScopedItem
{
  return (id)-[NSMutableArray lastObject](self->_comparisonPredicateScopedItem, "lastObject");
}

- (__CFString)_sqlTokenForPredicateOperator:(unint64_t)a1 inContext:(void *)a2
{
  if (![a2 objectForKey:@"NSUnderlyingException"])
  {
    if (a1 < 6) {
      return off_189EAA6E0[a1];
    }
    objc_msgSend( a2,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Unknown predicate operator type parameter",  0),  @"NSUnderlyingException");
  }

  return 0LL;
}

- (void)dealloc
{
  self->_comparisonPredicateScopedItem = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLSimpleWhereIntermediate;
  -[NSSQLSimpleWhereIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isWhereScoped
{
  return 1;
}

- (id)_generateSQLType3InContext:(uint64_t)a1
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 16) comparisonPredicateModifier];
  uint64_t v7 = [*(id *)(a1 + 16) options];
  unint64_t v8 = [*(id *)(a1 + 16) predicateOperatorType];
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  if ([v4 expressionType] == 3 && (uint64_t v10 = objc_msgSend(v5, "expressionType"), v9 = v4, !v10)
    || objc_msgSend(v5, "expressionType", v9) == 3 && (uint64_t v11 = objc_msgSend(v4, "expressionType"), v9 = v5, !v11))
  {
    [*(id *)(a1 + 24) addObject:v9];
    int v12 = 1;
  }

  else
  {
    int v12 = 0;
  }

  id v13 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v4, v6 == 2, a2);
  if (!v13) {
    return 0LL;
  }
  v14 = v13;
  id v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v5, v6 == 2, a2);
  if (!v15)
  {

    return 0LL;
  }

  v16 = v15;
  if ((v7 & 4) != 0)
  {
    v21 = (void *)[*(id *)(a1 + 16) predicateOperator];
    id v20 = v14;
    [v20 appendString:@" "];
    objc_msgSend(v20, "appendString:", objc_msgSend(v21, "symbol"));
    [v20 appendString:@" "];
    [v20 appendString:v16];
  }

  else
  {
    uint64_t v17 = (v7 << 63 >> 63) & 0x101;
    if ((v7 & 2) != 0) {
      uint64_t v17 = (v7 << 63 >> 63) & 1 | 0x180;
    }
    if ((v7 & 8) != 0) {
      uint64_t v18 = v17 | 0x120;
    }
    else {
      uint64_t v18 = v17;
    }
    if (v8 >= 6)
    {
      NSLog((NSString *)@"You really shouldn't be here");
      uint64_t v19 = 7LL;
    }

    else
    {
      uint64_t v19 = dword_1868D628C[v8];
    }

    id v20 = (id)objc_msgSend(@"NSCoreDataStringCompare("), "mutableCopy";
    [v20 appendString:v14];
    objc_msgSend(v20, "appendString:", @" , ");
    [v20 appendString:v16];
    objc_msgSend(v20, "appendFormat:", @" , %d, %lu, %d"), v19, v18, (v7 >> 3) & 1);
  }

  if (v12) {
    [*(id *)(a1 + 24) removeLastObject];
  }
  return v20;
}

- (void)_generateSQLForMatchingOperator:(void *)a3 inContext:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  if (([(id)objc_opt_class() isSimpleKeypath:v6] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v6))
  {
    goto LABEL_12;
  }

  if (![v7 expressionType])
  {
    v14 = (void *)[v7 constantValue];
    if (([v14 isNSString] & 1) != 0 || !v14)
    {
      char v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
      uint64_t v17 = objc_msgSend( (id)a1,  "_generateSQLForKeyPathExpression:allowToMany:inContext:",  v6,  objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2,  a3);
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        uint64_t v11 = (void *)[a2 mutableCopy];
        [v11 appendString:v18];

        uint64_t v19 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]( objc_alloc(&OBJC_CLASS___NSSQLConstantValueIntermediate),  "initWithConstantValue:ofType:inScope:context:",  v14,  5LL,  a1,  a3);
        id v20 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v19, "generateSQLStringInContext:", a3);
        objc_msgSend(v11, "appendString:", @", ");
        [v11 appendString:v20];
        objc_msgSend(v11, "appendString:", @", ");
        [v11 appendFormat:@"%lu "], v16 & 3);

        return v11;
      }

      return 0LL;
    }

    goto LABEL_12;
  }

  if (([(id)objc_opt_class() isSimpleKeypath:v7] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v7))
  {
LABEL_12:
    [a3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unimplemented SQL generation for predicate (%@)", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
    return 0LL;
  }

  char v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  uint64_t v9 = objc_msgSend( (id)a1,  "_generateSQLForKeyPathExpression:allowToMany:inContext:",  v6,  objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2,  a3);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = (void *)[a2 mutableCopy];
  [v11 appendString:v10];

  uint64_t v12 = [(id)a1 _generateSQLForKeyPathExpression:v7 allowToMany:0 inContext:a3];
  if (!v12)
  {

    return 0LL;
  }

  id v13 = (void *)v12;
  objc_msgSend(v11, "appendString:", @", ");
  [v11 appendString:v13];
  objc_msgSend(v11, "appendString:", @", ");
  [v11 appendFormat:@"%lu "], v8 & 3);

  return v11;
}

- (void)_generateSQLForString:(void *)a3 expressionPath:(int)a4 wildStart:(int)a5 wildEnd:(uint64_t)a6 allowToMany:(void *)a7 inContext:
{
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a1[2], "predicateOperator"), "options");
  unsigned int v15 = v14;
  if ((v14 & 4) != 0)
  {
    uint64_t v17 = 2LL;
    if (!a5) {
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v16 = (v14 << 63 >> 63) & 0x101;
    if ((v14 & 2) != 0) {
      uint64_t v16 = (v14 << 63 >> 63) & 1 | 0x180;
    }
    if ((v14 & 8) != 0) {
      uint64_t v17 = v16 | 0x120;
    }
    else {
      uint64_t v17 = v16;
    }
    if (!a5) {
      goto LABEL_12;
    }
  }

  if ((a4 & 1) == 0)
  {
    v17 |= 8uLL;
    goto LABEL_18;
  }

- (void)_generateSQLSubstringWildStart:(int)a3 wildEnd:(void *)a4 inContext:
{
  if (a1)
  {
    char v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    if ((([(id)objc_opt_class() isSimpleKeypath:v8] & 1) != 0
       || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v8))
      && ![v9 expressionType])
    {
      uint64_t v10 = (void *)[v9 constantValue];
      if ([v10 isNSString]) {
        return -[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]( (id *)a1,  (uint64_t)v10,  v8,  a2,  a3,  [*(id *)(a1 + 16) comparisonPredicateModifier] == 2,  a4);
      }
    }

    [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"unimplemented SQL generation for predicate (%@).", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
  }

  return 0LL;
}

- (uint64_t)_upperBoundSearchStringForString:(__CFString *)a1 context:(void *)a2
{
  v20[1] = *MEMORY[0x1895F89C0];
  uint64_t Length = CFStringGetLength(a1);
  uint64_t result = 0LL;
  if (a1 && Length <= 0x3FFFFFFF)
  {
    if (CFStringGetCharactersPtr(a1))
    {
      int v6 = CFStringEncodingUnicodeToBytes();
      if (v6)
      {
        uint64_t v7 = @"Unknown error during string conversion";
        if (v6 == 1) {
          uint64_t v7 = @"Invalid input string";
        }
        char v8 = (void *)MEMORY[0x189603F70];
        uint64_t v9 = *MEMORY[0x189603A60];
        uint64_t v10 = [NSString stringWithFormat:@"Malformed string (%@)", v7];
        objc_msgSend( a2,  "setValue:forKey:",  objc_msgSend( v8,  "exceptionWithName:reason:userInfo:",  v9,  v10,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", a1, @"Bad string")),  @"NSUnderlyingException");
        return 0LL;
      }
    }

    else
    {
      MEMORY[0x1895F8858](0LL);
      uint64_t v12 = (UniChar *)((char *)v20 - v11);
      if (Length >= 256) {
        uint64_t v12 = (UniChar *)malloc(4 * Length);
      }
      v21.location = 0LL;
      v21.length = Length;
      CFStringGetCharacters(a1, v21, v12);
      int v13 = CFStringEncodingUnicodeToBytes();
      if (v13)
      {
        if (v13 == 1) {
          uint64_t v14 = @"Invalid input string";
        }
        else {
          uint64_t v14 = @"Unknown error during string conversion";
        }
        if (Length >= 256) {
          free(v12);
        }
        unsigned int v15 = (void *)MEMORY[0x189603F70];
        uint64_t v16 = *MEMORY[0x189603A60];
        uint64_t v17 = [NSString stringWithFormat:@"Malformed string 2 (%@)", v14];
        objc_msgSend( a2,  "setValue:forKey:",  objc_msgSend( v15,  "exceptionWithName:reason:userInfo:",  v16,  v17,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", a1, @"Bad string")),  @"NSUnderlyingException");
        return 0LL;
      }

      if (Length >= 256) {
        free(v12);
      }
    }

    if (Length < 2) {
      uint64_t v18 = &stru_189EAC2E8;
    }
    else {
      uint64_t v18 = (const __CFString *)-[__CFString substringToIndex:](a1, "substringToIndex:", Length - 1);
    }
    int v19 = -[__CFString characterAtIndex:](a1, "characterAtIndex:", Length - 1);
    uint64_t result = 0LL;
    if (v19 != 55295 && v19 != 57343 && v19 != 0xFFFF) {
      return [objc_alloc(NSString) initWithFormat:@"%@%C", v18, (unsigned __int16)(v19 + 1)];
    }
  }

  return result;
}

- (id)_generateSQLBeginsWithStringInContext:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v4 = (void *)[*(id *)(a1 + 16) predicateOperator];
  if ([*(id *)(a1 + 40) expressionType]
    || ([v4 options] & 4) == 0
    || (uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) constantValue],
        !-[__CFString isNSString](v5, "isNSString"))
    || (uint64_t v6 = -[NSSQLSimpleWhereIntermediate _upperBoundSearchStringForString:context:](v5, a2)) == 0)
  {
    id v9 = 0LL;
    goto LABEL_11;
  }

  uint64_t v7 = (void *)v6;
  char v8 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]( [NSSQLSimpleWhereIntermediate alloc],  "initWithPredicate:inScope:",  objc_msgSend( MEMORY[0x189607818],  "predicateWithLeftExpression:rightExpression:modifier:type:options:",  *(void *)(a1 + 32),  *(void *)(a1 + 40),  objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier"),  3,  0),  a1);
  id v9 = -[NSSQLSimpleWhereIntermediate generateSQLStringInContext:](v8, "generateSQLStringInContext:", a2);

  if (v9)
  {
    id v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]( (void *)a1,  (void *)[MEMORY[0x189607878] expressionForConstantValue:v7],  0,  a2);
    if (!v10)
    {
      int v13 = v9;
      id v9 = 0LL;
      goto LABEL_18;
    }

    uint64_t v11 = v10;
    uint64_t v12 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "rangeOfString:", @">") - 1);
    [v9 appendString:@" AND "];
    [v9 appendString:v12];
    [v9 appendString:@" < "];
    [v9 appendString:v11];
  }

  int v13 = 0LL;
LABEL_18:

LABEL_11:
  if ([a2 objectForKey:@"NSUnderlyingException"])
  {

    return 0LL;
  }

  if (v9) {
    return v9;
  }
  return -[NSSQLSimpleWhereIntermediate _generateSQLSubstringWildStart:wildEnd:inContext:](a1, 0, 1, a2);
}

- (void)_generateSQLForConst:(__CFString *)a3 inManyToMany:(uint64_t)a4 expression:(void *)a5 inContext:
{
  if ([a1 isUpdateScoped])
  {
    [a5 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported join (not allowed in updates): %@", a4), 0), @"NSUnderlyingException" forKey];
    return 0LL;
  }

  id v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", -[__CFString name](a3, "name"), 0);
  uint64_t v11 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]( (uint64_t)NSSQLJoinIntermediate,  v10,  -[__CFString entity](a3, "entity"),  (void *)[a1 governingAlias],  a1,  objc_msgSend(a1, "fetchIntermediateForKeypathExpression:", a4),  a5);

  if ([a5 objectForKey:@"NSUnderlyingException"])
  {

    return 0LL;
  }

  uint64_t v14 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLForeignKeyIntermediate),  "initWithConstantValue:inScope:",  a2,  a1);
  id v15 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v14, "generateSQLStringInContext:", a5);
  if (v11) {
    uint64_t v16 = (void *)v11[5];
  }
  else {
    uint64_t v16 = 0LL;
  }
  uint64_t v12 = (void *)[v16 mutableCopy];
  [v12 appendString:@"."];
  [v12 appendString:-[NSSQLManyToMany inverseColumnName](a3)];
  [v12 appendString:@" = "];
  [v12 appendString:v15];

  return v12;
}

- (id)_generateSQLForConst:(void *)a3 inToMany:(void *)a4 inContext:
{
  if ([a1 isUpdateScoped])
  {
    [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported clause (not allowed in updates): %@.", a1[4]), 0), @"NSUnderlyingException" forKey];
    return 0LL;
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate);
    id v10 = (void *)MEMORY[0x189607878];
    uint64_t v11 = (void *)[a3 entity];
    if (v11) {
      uint64_t v11 = (void *)v11[16];
    }
    uint64_t v12 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( v9,  "initWithExpression:allowToMany:inScope:",  objc_msgSend(v10, "expressionForKeyPath:", objc_msgSend(v11, "name")),  0,  a1);
    id v8 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v12, "generateSQLStringInContext:", a4);

    if (v8)
    {
      objc_msgSend(v8, "appendString:", @" IN (SELECT ");
      if (a3) {
        int v13 = (void *)a3[7];
      }
      else {
        int v13 = 0LL;
      }
      uint64_t v14 = [a3 destinationEntity];
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "foreignKey"), "columnName"));
      [v8 appendString:@" FROM "];
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "entity"), "tableName"));
      [v8 appendString:@" WHERE "];
      if (v14) {
        id v15 = *(void **)(v14 + 128);
      }
      else {
        id v15 = 0LL;
      }
      objc_msgSend(v8, "appendString:", objc_msgSend(v15, "columnName"));
      uint64_t v16 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLForeignKeyIntermediate),  "initWithConstantValue:inScope:",  a2,  a1);
      id v17 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v16, "generateSQLStringInContext:", a4);
      [v8 appendString:@" = "];
      [v8 appendString:v17];
      [v8 appendString:@" "]);
    }
  }

  return v8;
}

- (void)_generateSQLForConst:(uint64_t)a1 inAttribute:(uint64_t)a2 expression:(uint64_t)a3 inContext:(uint64_t)a4
{
  uint64_t v7 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  a3,  0LL,  a1);
  id v8 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v7, "generateSQLStringInContext:", a4);

  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  unsigned int v10 = v9;
  uint64_t v11 = (v9 << 63 >> 63) & 0x101;
  if ((v9 & 2) != 0) {
    uint64_t v11 = (v9 << 63 >> 63) & 1 | 0x180;
  }
  if ((v9 & 8) != 0) {
    v11 |= 0x120uLL;
  }
  if ((v9 & 4) != 0) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @" NSCoreDataStringSearch(");
  [v13 appendString:v8];

  uint64_t v14 = -[NSSQLForeignKeyIntermediate initWithConstantValue:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLForeignKeyIntermediate),  "initWithConstantValue:inScope:",  a2,  a1);
  id v15 = -[NSSQLForeignKeyIntermediate generateSQLStringInContext:](v14, "generateSQLStringInContext:", a4);
  objc_msgSend(v13, "appendString:", @", ");
  [v13 appendString:v15];
  objc_msgSend(v13, "appendString:", @", ");
  objc_msgSend(v13, "appendFormat:", @"%lu, %u"), v12, (v10 >> 3) & 1);

  return v13;
}

- (void)_generateSQLBetweenStringInContext:(uint64_t)a1
{
  v51[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  objc_super v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v3 expressionType];
  id v6 = *(id *)(a1 + 24);
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    *(void *)(a1 + 24) = v6;
  }

  [v6 addObject:v3];
  if (v5)
  {
    if (([(id)objc_opt_class() isSimpleKeypath:v3] & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v3))
    {
      if (v5 != 4 || sel_indexed_by_ != (char *)[*(id *)(a1 + 32) selector])
      {
        [*(id *)(a1 + 24) removeLastObject];
        uint64_t v7 = 0LL;
        goto LABEL_45;
      }

      uint64_t v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "lastObject");
      v51[0] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "firstObject");
      uint64_t v37 = [MEMORY[0x189603F18] arrayWithObjects:v51 count:1];
      uint64_t v50 = *(void *)(a1 + 40);
      id v38 = -[NSSQLRTreeIndexQueryIntermediate initForIndexNamed:onEntity:properties:ranges:inScope:]( [NSSQLRTreeIndexQueryIntermediate alloc],  "initForIndexNamed:onEntity:properties:ranges:inScope:",  v36,  [*(id *)(a1 + 8) governingEntity],  v37,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v50, 1),  *(void *)(a1 + 8));
      uint64_t v7 = (void *)[v38 generateSQLStringInContext:a2];

      v34 = *(void **)(a1 + 24);
      goto LABEL_53;
    }

    uint64_t v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @"(");
    uint64_t v8 = [(id)a1 _generateSQLForKeyPathExpression:v3 allowToMany:0 inContext:a2];
    if (!v8)
    {
LABEL_46:

      return 0LL;
    }

    uint64_t v9 = (void *)v8;
    [v7 appendString:v8];
  }

  else
  {
    unsigned int v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189607940]), "initWithString:", @"(");
    [*(id *)(a1 + 24) addObject:a1];
    uint64_t v11 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( [NSSQLConstantValueIntermediate alloc],  "initWithConstantValue:inScope:context:",  [v3 constantValue],  a1,  a2);
    id v12 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v11, "generateSQLStringInContext:", a2);
    [v10 appendString:v12];

    uint64_t v7 = v10;
    [*(id *)(a1 + 24) removeLastObject];
  }

  [v7 appendString:@" BETWEEN "];
  uint64_t v13 = [v4 expressionType];
  if (!v13)
  {
    v25 = (void *)[v4 constantValue];
    if ([v25 count] != 2) {
      goto LABEL_44;
    }
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v26) {
      goto LABEL_44;
    }
    uint64_t v27 = v26;
    uint64_t v28 = a1;
    uint64_t v29 = *(void *)v41;
    char v30 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( [NSSQLConstantValueIntermediate alloc],  "initWithConstantValue:inScope:context:",  [*(id *)(*((void *)&v40 + 1) + 8 * i) constantValue],  v28,  a2);
        id v33 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v32, "generateSQLStringInContext:", a2);
        [v7 appendString:v33];

        if ((v30 & 1) != 0) {
          [v7 appendString:@" AND "];
        }
        char v30 = 0;
      }

      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
      char v30 = 0;
    }

    while (v27);
    [v7 appendString:@""]);
    v34 = *(void **)(v28 + 24);
LABEL_53:
    [v34 removeLastObject];
    return v7;
  }

  if (v13 != 14
    || (uint64_t v14 = (void *)[v4 constantValue], objc_msgSend(v14, "count") != 2)
    || (__int128 v46 = 0u,
        __int128 v47 = 0u,
        __int128 v44 = 0u,
        __int128 v45 = 0u,
        (uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16]) == 0))
  {
LABEL_44:
    [v7 appendString:@""]);
    [*(id *)(a1 + 24) removeLastObject];
LABEL_45:
    [a2 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unimplemented SQL generation for predicate : (%@)", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
    goto LABEL_46;
  }

  uint64_t v16 = v15;
  int v17 = 0;
  char v18 = 0;
  uint64_t v19 = *(void *)v45;
  do
  {
    for (uint64_t j = 0LL; j != v16; ++j)
    {
      if (*(void *)v45 != v19) {
        objc_enumerationMutation(v14);
      }
      CFRange v21 = *(void **)(*((void *)&v44 + 1) + 8 * j);
      if ([v21 expressionType])
      {
        if (([(id)objc_opt_class() isSimpleKeypath:v21] & 1) == 0
          && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v21))
        {
          int v17 = -12;
          continue;
        }

        uint64_t v22 = [(id)a1 _generateSQLForKeyPathExpression:v21 allowToMany:0 inContext:a2];
        if (!v22) {
          goto LABEL_46;
        }
        uint64_t v23 = (NSSQLConstantValueIntermediate *)v22;
        [v7 appendString:v22];
      }

      else
      {
        uint64_t v23 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( [NSSQLConstantValueIntermediate alloc],  "initWithConstantValue:inScope:context:",  [v21 constantValue],  a1,  a2);
        id v24 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v23, "generateSQLStringInContext:", a2);
        [v7 appendString:v24];
      }

      if (v17)
      {
        char v18 = 1;
      }

      else
      {
        [v7 appendString:@" AND "];
        char v18 = 1;
        int v17 = 1;
      }
    }

    uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  }

  while (v16);
  [v7 appendString:@""]);
  [*(id *)(a1 + 24) removeLastObject];
  if (v17 <= 0 && (v18 & 1) == 0) {
    goto LABEL_45;
  }
  return v7;
}

- (id)_generateSQLBoundByStringInContext:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  if ([*(id *)(a1 + 32) expressionType] != 3)
  {
    uint64_t v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: must be a keypath";
    goto LABEL_27;
  }

  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "keyPath"), "componentsSeparatedByString:", @".");
  if (!v4 || (uint64_t v5 = v4, ![v4 count]))
  {
    uint64_t v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: is a bad keypath a keypath";
    goto LABEL_27;
  }

  id v6 = (void *)[(id)a1 governingEntityForKeypathExpression:*(void *)(a1 + 32)];
  uint64_t v7 = [v5 count];
  uint64_t v8 = [v6 entityDescription];
  if (!v7)
  {
    uint64_t v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A60];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: can't find location attribute";
LABEL_27:
    uint64_t v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];
    uint64_t v23 = a2;
LABEL_28:
    [v23 setObject:v22 forKey:@"NSUnderlyingException"];
    return 0LL;
  }

  uint64_t v9 = (void *)v8;
  v34 = a2;
  unsigned int v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v35 = v7 - 1;
  do
  {
    uint64_t v12 = [v5 objectAtIndex:v11];
    if (!v9 || (uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v12)) == 0)
    {
      uint64_t v28 = (void *)MEMORY[0x189603F70];
      uint64_t v29 = *MEMORY[0x189603A60];
      uint64_t v30 = [NSString stringWithFormat:@"Unsupported predicate, LHS of boundedBy: has a keypath (can't find %@)", v12];
LABEL_35:
      uint64_t v27 = (const __CFString *)v30;
      v25 = v28;
      uint64_t v26 = v29;
      goto LABEL_38;
    }

    uint64_t v14 = v13;
    uint64_t v15 = [v13 _propertyType];
    if (![v14 _isAttribute])
    {
      if (v15 != 4)
      {
        v25 = (void *)MEMORY[0x189603F70];
        uint64_t v26 = *MEMORY[0x189603A60];
        uint64_t v27 = @"Unsupported predicate, LHS of boundedBy: does not terminate with a location";
        goto LABEL_38;
      }

      uint64_t v9 = (void *)[v14 destinationEntity];
      goto LABEL_20;
    }

    if (v35 != v11)
    {
      uint64_t v28 = (void *)MEMORY[0x189603F70];
      uint64_t v29 = *MEMORY[0x189603A60];
      uint64_t v30 = [NSString stringWithFormat:@"Malformed keypath: non-terminal attribute %@", v12];
      goto LABEL_35;
    }

    if ([v14 attributeType])
    {
      v25 = (void *)MEMORY[0x189603F70];
      uint64_t v26 = *MEMORY[0x189603A60];
      uint64_t v27 = @"Unsupported predicate, LHS of boundedBy: does not terminate with a location attribute";
      goto LABEL_38;
    }

    unsigned int v10 = (void *)objc_msgSend( (id)objc_msgSend(v14, "userInfo"),  "objectForKey:",  @"_NSLocationAttributeDerivedComponents");
    if (([v10 isNSArray] & 1) == 0)
    {
      unsigned int v10 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v10, "description"),  "stringByReplacingOccurrencesOfString:withString:",  @" ",  &stru_189EAC2E8),  "componentsSeparatedByString:",  @",");
    }

    if (!v10 || [v10 count] != 2)
    {
LABEL_32:
      v25 = (void *)MEMORY[0x189603F70];
      uint64_t v26 = *MEMORY[0x189603A60];
      uint64_t v27 = @"Bad LHS attribute, missing derived lat/long names";
LABEL_38:
      uint64_t v22 = [v25 exceptionWithName:v26 reason:v27 userInfo:0];
      uint64_t v23 = v34;
      goto LABEL_28;
    }

@end