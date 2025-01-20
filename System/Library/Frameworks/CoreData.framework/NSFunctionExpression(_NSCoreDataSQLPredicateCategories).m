@interface NSFunctionExpression(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
- (uint64_t)_mapKVCOperatorsToFunctionsInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSFunctionExpression(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v4 = a1;
  v5 = (char *)[a1 selector];
  if (v5 != sel_valueForKey_ && v5 != sel_valueForKeyPath_) {
    return v4;
  }
  v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "operand"), "minimalFormInContext:", a3);
  uint64_t v8 = [v7 expressionType];
  if (v8 == 1)
  {
    if (!objc_msgSend((id)objc_msgSend(v4, "arguments"), "count")) {
      return v4;
    }
    goto LABEL_30;
  }

  if (v8 == 3
    || v8 == 4
    && (sel_valueForKey_ == (char *)[v7 selector]
     || sel_valueForKeyPath_ == (char *)[v7 selector]))
  {
    v9 = (void *)objc_msgSend((id)objc_msgSend(v7, "arguments"), "objectAtIndex:", 0);
    v10 = (void *)objc_msgSend((id)objc_msgSend(v4, "arguments"), "objectAtIndex:", 0);
    uint64_t v11 = [v9 expressionType];
    uint64_t v12 = v11;
    if (v11 == 10
      || !v11
      && (objc_msgSend((id)objc_msgSend(v7, "operand"), "constantValue"),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v13 = [v10 expressionType];
      if (v13 == 10
        || !v13 && ([v10 constantValue], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v12 == 10) {
          uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "arguments"), "objectAtIndex:", 0), "keyPath");
        }
        else {
          uint64_t v14 = [v9 constantValue];
        }
        uint64_t v15 = v14;
        if ([v10 expressionType] == 10) {
          uint64_t v16 = [v10 keyPath];
        }
        else {
          uint64_t v16 = [v10 constantValue];
        }
        v17 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v15, v16)];
        uint64_t v18 = [MEMORY[0x189607A18] defaultInstance];
        if (v18 == [v7 operand])
        {
          v22 = (void *)objc_msgSend( objc_alloc(MEMORY[0x1896078E0]),  "initWithOperand:andKeyPath:",  objc_msgSend(v7, "operand"),  v17);
        }

        else
        {
          id v19 = objc_alloc((Class)objc_opt_class());
          uint64_t v20 = [v7 expressionType];
          uint64_t v21 = [v7 operand];
          v22 = (void *)objc_msgSend( v19,  "initWithExpressionType:operand:selector:argumentArray:",  v20,  v21,  sel_valueForKeyPath_,  objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", v17));
        }

        id v4 = v22;

LABEL_30:
        uint64_t v23 = [v4 _mapKVCOperatorsToFunctionsInContext:a3];
        if (v23) {
          return (id)v23;
        }
      }
    }
  }

  return v4;
}

- (uint64_t)_mapKVCOperatorsToFunctionsInContext:()_NSCoreDataSQLPredicateCategories
{
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "arguments"), "objectAtIndex:", 0);
  uint64_t v6 = [v5 expressionType];
  if (v6)
  {
    uint64_t v7 = 0LL;
    if (v6 != 10) {
      return v7;
    }
    uint64_t v8 = (const __CFString *)[v5 keyPath];
  }

  else
  {
    uint64_t v8 = (const __CFString *)[v5 constantValue];
  }

  v9 = (__CFString *)v8;
  CFIndex location = CFStringFind(v8, @"@", 0LL).location;
  if (location == -1) {
    return 0LL;
  }
  CFIndex v11 = location;
  if (CFStringFind(v9, @"@", 4uLL).location != location)
  {
    uint64_t v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    uint64_t v18 = [NSString stringWithFormat:@"Too many KVC aggregates in keypath: %@", v9];
LABEL_15:
    objc_msgSend( a3,  "setValue:forKey:",  objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0),  @"NSUnderlyingException");
    return 0LL;
  }

  if (CFStringGetLength(v9) <= v11 + 1)
  {
LABEL_14:
    uint64_t v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    uint64_t v18 = [NSString stringWithFormat:@"Malformed keypath: %@", v9];
    goto LABEL_15;
  }

  if (CFStringGetCharacterAtIndex(v9, v11 + 1) != 99)
  {
    uint64_t v20 = (void *)-[__CFString componentsSeparatedByString:](v9, "componentsSeparatedByString:", @".");
    id v21 = objc_alloc_init(MEMORY[0x189607940]);
    uint64_t v22 = [v20 count];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = 0LL;
      char v25 = 0;
      v26 = 0LL;
      do
      {
        v27 = (void *)[v20 objectAtIndex:v24];
        if ([v27 characterAtIndex:0] == 64)
        {
          v26 = v27;
        }

        else
        {
          if ((v25 & 1) != 0) {
            [v21 appendString:@"."];
          }
          [v21 appendString:v27];
          char v25 = 1;
        }

        ++v24;
      }

      while (v23 != v24);
    }

    else
    {
      v26 = 0LL;
    }

    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"supportedKVCAggregates"), "containsObject:", v26))
    {
      if (objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType") == 1 && objc_msgSend(v21, "length"))
      {
        uint64_t v28 = [v26 substringFromIndex:1];
        else {
          v29 = (__CFString *)v28;
        }
        v30 = (void *)-[__CFString mutableCopy](v29, "mutableCopy");
        [v30 appendString:@":"];
        uint64_t v31 = [MEMORY[0x189607878] expressionForKeyPath:v21];
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v31, 0);
        uint64_t v7 = [MEMORY[0x189607878] expressionForFunction:v30 arguments:v32];
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      return v7;
    }

    [a3 setValue:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported KVC aggregate in keypath: %@", v9), 0), @"NSUnderlyingException" forKey];

    return 0LL;
  }

  uint64_t v12 = objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType");
  if (v12 != 13)
  {
    if (v12 == 1)
    {
      if (v11)
      {
        uint64_t v13 = -[__CFString substringWithRange:](v9, "substringWithRange:", 0LL, v11 - 1);
        uint64_t v14 = [MEMORY[0x189607878] expressionForKeyPath:v13];
        uint64_t v15 = (objc_class *)MEMORY[0x189603F18];
        goto LABEL_46;
      }

      goto LABEL_14;
    }

    return 0LL;
  }

  id v33 = (id)objc_msgSend( (id)-[__CFString componentsSeparatedByString:]( v9,  "componentsSeparatedByString:",  @"."),  "mutableCopy");
  [v33 removeLastObject];
  if ([v33 count]
    && objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 0), "isEqualToString:", &stru_189EAC2E8))
  {
    [v33 removeObjectAtIndex:0];
  }

  if (![v33 count])
  {
    id v40 = objc_alloc(MEMORY[0x189603F18]);
    uint64_t v39 = [a1 operand];
    id v38 = v40;
    goto LABEL_48;
  }

  uint64_t v34 = [v33 componentsJoinedByString:@"."];
  v35 = (void *)MEMORY[0x189607878];
  uint64_t v36 = [a1 operand];
  if ([v33 count] == 1) {
    v37 = @"valueForKey:";
  }
  else {
    v37 = @"valueForKeyPath:";
  }
  uint64_t v14 = objc_msgSend( v35,  "expressionForFunction:selectorName:arguments:",  v36,  v37,  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", v34)));
  uint64_t v15 = (objc_class *)MEMORY[0x189603F18];
LABEL_46:
  id v38 = objc_alloc(v15);
  uint64_t v39 = v14;
LABEL_48:
  v41 = (void *)[v38 initWithObject:v39];
  uint64_t v42 = [MEMORY[0x189607878] expressionForFunction:@"count:" arguments:v41];

  return v42;
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  v62[1] = *MEMORY[0x1895F89C0];
  id v44 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v5 = [a1 expressionType];
  id v43 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v57 = 0LL;
  if (v5 == 3)
  {
    uint64_t v6 = (void *)[a1 keyPath];
    unint64_t v7 = [v6 rangeOfString:@"@"];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v17 = [v6 rangeOfString:@"." options:4];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL && v7 < v17)
      {
        uint64_t v18 = (void *)MEMORY[0x189607870];
        v61 = @"expression";
        v62[0] = a1;
        uint64_t v19 = [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:&v61 count:1];
        int v8 = 0;
        id v57 = (id)[v18 errorWithDomain:*MEMORY[0x189607460] code:134097 userInfo:v19];
        goto LABEL_21;
      }
    }

    objc_msgSend(v44, "addObject:", objc_msgSend(a1, "keyPath"));
    goto LABEL_4;
  }

  v9 = (void *)objc_msgSend((id)objc_msgSend(a1, "operand"), "_keypathsForDerivedPropertyValidation:", &v57);
  if (!v9)
  {
LABEL_17:
    int v8 = 0;
    goto LABEL_21;
  }

  v10 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  CFIndex v11 = (void *)[a1 arguments];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v54;
LABEL_8:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v54 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v14) _keypathsForDerivedPropertyValidation:&v57];
      if (!v15) {
        goto LABEL_17;
      }
      objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (v12) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  uint64_t v16 = (char *)[a1 selector];
  if (sel_valueForKey_ == v16 || sel_valueForKeyPath_ == v16)
  {
    if ([v9 count])
    {
      if ([v10 count])
      {
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v25 = [v9 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v25)
        {
          id v38 = v9;
          uint64_t v39 = v25;
          uint64_t v40 = *(void *)v50;
          v41 = a3;
LABEL_31:
          uint64_t v26 = 0LL;
          v27 = v38;
          uint64_t v28 = v39;
          while (1)
          {
            if (*(void *)v50 != v40) {
              objc_enumerationMutation(v27);
            }
            uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 8 * v26);
            uint64_t v30 = MEMORY[0x186E3E5D8]();
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            uint64_t v31 = [v10 countByEnumeratingWithState:&v45 objects:v58 count:16];
            uint64_t v42 = (void *)v30;
            if (v31)
            {
              uint64_t v32 = *(void *)v46;
              while (2)
              {
                for (uint64_t i = 0LL; i != v31; ++i)
                {
                  if (*(void *)v46 != v32) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  if ([v34 hasPrefix:@"$"])
                  {
                    int v35 = 0;
                    goto LABEL_44;
                  }

                  [v44 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v29, v34)];
                }

                uint64_t v31 = [v10 countByEnumeratingWithState:&v45 objects:v58 count:16];
                if (v31) {
                  continue;
                }
                break;
              }

              int v35 = 1;
LABEL_44:
              v27 = v38;
              uint64_t v28 = v39;
            }

            else
            {
              int v35 = 1;
            }

            a3 = v41;
            objc_autoreleasePoolPop(v42);
            if (!v35) {
              goto LABEL_17;
            }
            if (++v26 == v28)
            {
              int v8 = 1;
              uint64_t v39 = [v27 countByEnumeratingWithState:&v49 objects:v59 count:16];
              if (v39) {
                goto LABEL_31;
              }
              goto LABEL_21;
            }
          }
        }

        goto LABEL_4;
      }

      uint64_t v36 = [v9 allObjects];
    }

    else
    {
      uint64_t v36 = [v10 allObjects];
    }

    [v44 addObjectsFromArray:v36];
    goto LABEL_4;
  }

  if (objc_msgSend((id)objc_msgSend(a1, "operand"), "expressionType")) {
    goto LABEL_17;
  }
  v37 = (objc_class *)objc_msgSend((id)objc_msgSend(a1, "operand"), "constantValue");
  if (NSClassFromString((NSString *)@"_NSPredicateUtilities") == v37)
  {
    [a1 selector];
    if (!object_getMethodImplementation()) {
      goto LABEL_17;
    }
    objc_msgSend(v44, "addObjectsFromArray:", objc_msgSend(v10, "allObjects"));
  }

  else if (sel_canonical_ != (char *)[a1 selector])
  {
    goto LABEL_17;
  }

@end