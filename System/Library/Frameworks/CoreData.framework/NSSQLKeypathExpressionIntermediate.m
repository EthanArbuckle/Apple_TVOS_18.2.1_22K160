@interface NSSQLKeypathExpressionIntermediate
- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)generateSQLStringInContext:(id)a3;
- (uint64_t)_propertyDescriptionsForKeypath:(uint64_t)a3 rootedAtEntity:(uint64_t)a4 allowToMany:(uint64_t)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:;
- (unsigned)_propertyDescriptionForKeypath:(uint64_t)a3 startingAtEntity:(char)a4 allowToMany:(char)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:;
@end

@implementation NSSQLKeypathExpressionIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  v38[1] = *MEMORY[0x1895F89C0];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  v5 = (void *)objc_msgSend( -[NSArray objectAtIndex:]( -[NSExpression arguments](self->super._expression, "arguments"),  "objectAtIndex:",  0),  "constantValue");
  [v5 rangeOfString:@".@"];
  if (v6)
  {
    v7 = (void *)MEMORY[0x189603F70];
    uint64_t v8 = *MEMORY[0x189603A60];
    uint64_t v9 = objc_msgSend( NSString,  "stringWithFormat:",  @"Keypath containing KVC aggregate where there shouldn't be one; failed to handle %@",
           self->super._expression);
LABEL_4:
    v10 = (const __CFString *)v9;
    v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = 0LL;
LABEL_5:
    objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v13),  @"NSUnderlyingException");
    return 0LL;
  }

  if (-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    v15 = -[NSSQLIntermediate governingEntity](self, "governingEntity");
    if (!v15 || (uint64_t v16 = [v15[5] objectForKey:v5]) == 0)
    {
      v19 = (void *)MEMORY[0x189603F70];
      uint64_t v20 = *MEMORY[0x189603A58];
      expression = self->super._expression;
      v37 = @"expression";
      v38[0] = expression;
      uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      v10 = @"Bad keypath: can't find property";
      goto LABEL_29;
    }

    v17 = (unsigned __int8 *)v16;
    if ((*(_WORD *)(v16 + 32) & 0x20) == 0)
    {
      [v5 rangeOfString:@"."];
      if (v18)
      {
        v19 = (void *)MEMORY[0x189603F70];
        uint64_t v20 = *MEMORY[0x189603A58];
        v21 = self->super._expression;
        v35 = @"expression";
        v36 = v21;
        uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v10 = @"Bad keypath: too many joins for an index";
LABEL_29:
        v11 = v19;
        uint64_t v12 = v20;
        goto LABEL_5;
      }
    }

    int v27 = v17[24];
    if (v27 != 1)
    {
      if ((v27 - 7) >= 3)
      {
        v19 = (void *)MEMORY[0x189603F70];
        uint64_t v20 = *MEMORY[0x189603A58];
        v29 = self->super._expression;
        v33 = @"expression";
        v34 = v29;
        uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v10 = @"Unable to generate SQL for keypath";
        goto LABEL_29;
      }

      if (v27 != 7)
      {
        v19 = (void *)MEMORY[0x189603F70];
        uint64_t v20 = *MEMORY[0x189603A58];
        v30 = self->super._expression;
        v31 = @"expression";
        v32 = v30;
        uint64_t v13 = [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v10 = @"Bad keypath: indexes may not contain to many relationshps";
        goto LABEL_29;
      }
    }

    return (id)objc_msgSend((id)objc_msgSend(v17, "columnName"), "mutableCopy");
  }

  else
  {
    if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
    {
      v22 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
      if (v22
        && v22[9]
        && !-[NSSQLIntermediate isFunctionScoped](self, "isFunctionScoped")
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:]( (uint64_t)-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"),  (void *)-[NSExpression predicateFormat](self->super._expression, "predicateFormat")) & 1) == 0)
      {
        v7 = (void *)MEMORY[0x189603F70];
        uint64_t v8 = *MEMORY[0x189603A60];
        uint64_t v9 = [NSString stringWithFormat:@"SELECT clauses in queries with GROUP BY components can only contain properties named in the GROUP BY or aggregate functions (%@ is not in the GROUP BY)", self->super._expression];
        goto LABEL_4;
      }

      v23 = self->super._expression;
      BOOL allowToMany = -[NSSQLIntermediate isFunctionScoped](self, "isFunctionScoped");
      v25 = self;
      v26 = v23;
    }

    else
    {
      v26 = self->super._expression;
      BOOL allowToMany = self->super._allowToMany;
      v25 = self;
    }

    return -[NSSQLKeypathExpressionIntermediate _generateSQLForKeyPathExpression:allowToMany:inContext:]( v25,  "_generateSQLForKeyPathExpression:allowToMany:inContext:",  v26,  allowToMany,  a3);
  }

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  v75[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)MEMORY[0x186E3E5D8](self, a2);
  v10 = (void *)[a5 objectForKey:@"storeRequest"];
  uint64_t v11 = [v10 requestType];
  if (v11 != 8)
  {
    if (v11 == 6)
    {
      context = v9;
      goto LABEL_8;
    }

    if (v11 != 1)
    {
      objc_msgSend( a5,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"this should be inside a fetch or an update",  0),  @"NSUnderlyingException");
      objc_autoreleasePoolPop(v9);
      return 0LL;
    }
  }

  context = v9;
  if (!v6)
  {
LABEL_8:
    uint64_t v12 = 0LL;
    goto LABEL_9;
  }

  if (([v10 returnsDistinctResults] & 1) != 0
    || (v32 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate")) == 0LL)
  {
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v33 = v32[8];
    uint64_t v12 = 1LL;
    if (v33) {
      *(_BYTE *)(v33 + 48) = 1;
    }
  }

- (unsigned)_propertyDescriptionForKeypath:(uint64_t)a3 startingAtEntity:(char)a4 allowToMany:(char)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v13 = [a2 count];
  if (!v13) {
    return 0LL;
  }
  uint64_t v14 = v13;
  v36 = a7;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = v13 - 1;
  while (1)
  {
    uint64_t v18 = [a2 objectAtIndex:v15];
    *a6 = v18;
    uint64_t v19 = [@"entity" compare:v18 options:1];
    if (v17 == v15 && !v19) {
      break;
    }
    id v20 = -[NSEntityDescription _attributeNamed:]([(id)a3 entityDescription], *a6);
    if (v20 && [v20 attributeType] == 2100) {
      uint64_t v21 = [a2 componentsJoinedByString:@"."];
    }
    else {
      uint64_t v21 = *a6;
    }
    if (a3) {
      v22 = (unsigned __int8 *)[*(id *)(a3 + 40) objectForKey:v21];
    }
    else {
      v22 = 0LL;
    }
    if (v14 != 1 || v22) {
      goto LABEL_22;
    }
    uint64_t v23 = [v36 objectForKeyedSubscript:@"fabricatedSQLEntityForReadOnlyFetch"];
    if (v23)
    {
      int v24 = *(_DWORD *)(v23 + 184);
      if (a3) {
        goto LABEL_16;
      }
    }

    else
    {
      int v24 = 0;
      if (a3)
      {
LABEL_16:
        int v25 = *(_DWORD *)(a3 + 184);
        goto LABEL_17;
      }
    }

    int v25 = 0;
LABEL_17:
    if (v24 == v25)
    {
      if (v23) {
        uint64_t v23 = *(void *)(v23 + 40);
      }
      v22 = (unsigned __int8 *)[(id)v23 objectForKeyedSubscript:*a6];
    }

    else
    {
      v22 = 0LL;
    }

- (uint64_t)_propertyDescriptionsForKeypath:(uint64_t)a3 rootedAtEntity:(uint64_t)a4 allowToMany:(uint64_t)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = a3 ? *(void **)(a3 + 152) : 0LL;
    result = [v13 count];
    if (result)
    {
      uint64_t v14 = (void *)[MEMORY[0x189603FE0] set];
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id obj = v13;
        uint64_t v22 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v24 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v19 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]( v12,  a2,  v18,  a4,  a5,  a6,  a7);
            if (v19)
            {
              [v14 addObject:v19];
            }

            else if ([a7 objectForKey:@"NSUnderlyingException"])
            {
              return 0LL;
            }

            id v20 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]( v12,  a2,  v18,  a4,  a5,  a6,  a7);
            if (v20)
            {
              objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v20, "allObjects"));
            }

            else if ([a7 objectForKey:@"NSUnderlyingException"])
            {
              return 0LL;
            }
          }

          uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      if (objc_msgSend(v14, "count", obj)) {
        return (uint64_t)v14;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

@end