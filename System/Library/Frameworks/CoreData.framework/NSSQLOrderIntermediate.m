@interface NSSQLOrderIntermediate
- (NSSQLOrderIntermediate)initWithSortDescriptors:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLOrderIntermediate

- (NSSQLOrderIntermediate)initWithSortDescriptors:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLOrderIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5) {
    v5->_sortDescriptors = (NSArray *)a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLOrderIntermediate;
  -[NSSQLOrderIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  NSUInteger v46 = -[NSArray count](self->_sortDescriptors, "count");
  if (!v46) {
    return objc_alloc_init(MEMORY[0x189607940]);
  }
  id v45 = a3;
  id v7 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
  v5 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"ORDER BY"];
  uint64_t v8 = 0LL;
  v44 = self;
  uint64_t v43 = *MEMORY[0x189603A60];
  while (1)
  {
    id v9 = -[NSArray objectAtIndex:](self->_sortDescriptors, "objectAtIndex:", v8);
    v10 = (__CFString *)[v9 key];
    int v47 = [v9 ascending];
    if (v8) {
      [v5 appendString:@","];
    }
    if (-[__CFString rangeOfString:](v10, "rangeOfString:", @".") != 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v11 = [v7 governingEntity]) == 0)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      goto LABEL_39;
    }

    uint64_t v12 = [*(id *)(v11 + 40) objectForKey:v10];
    uint64_t v13 = v12;
    if (!v12) {
      goto LABEL_39;
    }
    int v14 = *(unsigned __int8 *)(v12 + 24);
    if (v14 == 9)
    {
      if (!*(void *)(v12 + 80)) {
        goto LABEL_15;
      }
      if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
      {
        [v45 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", v43, objc_msgSend( NSString, "stringWithFormat:", @"Unsupported join (ordering by mtm not allowed in updates): %@", self->_sortDescriptors), 0), @"NSUnderlyingException" forKey];
      }

      else
      {
        id v17 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
        v18 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F18]),  "initWithObjects:",  objc_msgSend((id)v13, "name"),  0);
        v19 = (id)-[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)v17, v18);
        if (!v19) {
          v19 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]( (uint64_t)NSSQLJoinIntermediate,  v18,  [(id)v13 entity],  -[NSSQLIntermediate governingAlias](v44, "governingAlias"),  v44,  (uint64_t)-[NSSQLIntermediate fetchIntermediate](v44, "fetchIntermediate"),  v45);
        }

        if (![v45 objectForKey:@"NSUnderlyingException"])
        {
          if (v19) {
            v22 = (void *)v19[5];
          }
          else {
            v22 = 0LL;
          }
          id v16 = (id)[v22 mutableCopy];

          [v16 appendString:@"."];
          [v16 appendString:*(void *)(v13 + 80)];
          goto LABEL_22;
        }
      }

      id v16 = 0LL;
LABEL_22:
      BOOL v15 = v16 != 0LL;
      int v14 = *(unsigned __int8 *)(v13 + 24);
      goto LABEL_23;
    }

    BOOL v15 = 0;
    id v16 = 0LL;
LABEL_23:
    if (v14 == 7)
    {
      v20 = *(void **)(v13 + 56);
      if ([v20 isToMany])
      {
        v21 = v20 ? (void *)[v20 propertyDescription] : 0;
        if ([v21 isOrdered])
        {

          if (-[NSSQLIntermediate isUpdateScoped](v44, "isUpdateScoped"))
          {
            [v45 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", v43, objc_msgSend( NSString, "stringWithFormat:", @"Unsupported join (ordering by tm not allowed in updates): %@", v44->_sortDescriptors), 0), @"NSUnderlyingException" forKey];
            id v16 = 0LL;
          }

          else
          {
            uint64_t v23 = [*(id *)(v13 + 80) name];
            v24 = objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate);
            v25 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( v24,  "initWithExpression:allowToMany:inScope:",  [MEMORY[0x189607878] expressionForKeyPath:v23],  0,  v44);
            id v16 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:]( v25,  "generateSQLStringInContext:",  v45);
          }

          if (v16) {
            BOOL v15 = 1;
          }
        }
      }
    }

    LOBYTE(v13) = v15;
    if (v16)
    {
      [v5 appendString:@" "];
      self = v44;
      goto LABEL_44;
    }

    self = v44;
LABEL_39:
    v26 = @"_pk";
    if (-[__CFString caseInsensitiveCompare:](v10, "caseInsensitiveCompare:", @"self"))
    {
      if (-[__CFString compare:](v10, "compare:", @"objectID")) {
        v26 = v10;
      }
      else {
        v26 = @"_pk";
      }
    }

    v27 = objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate);
    v28 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( v27,  "initWithExpression:allowToMany:inScope:",  [MEMORY[0x189607878] expressionForKeyPath:v26],  0,  self);
    id v16 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v28, "generateSQLStringInContext:", v45);

    if (!v16) {
      goto LABEL_88;
    }
LABEL_44:
    [v5 appendString:v16];

    if ((v13 & 1) != 0) {
      goto LABEL_73;
    }
    v29 = (void *)objc_msgSend((id)objc_msgSend(v7, "governingEntity"), "entityDescription");
    v30 = (void *)-[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", @".");
    unint64_t v31 = [v30 count];
    uint64_t v32 = [v30 objectAtIndex:0];
    if (v29) {
      v33 = (void *)objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v32);
    }
    else {
      v33 = 0LL;
    }
    if ([v33 _propertyType] != 2
      && [v33 _propertyType] != 6
      && [v33 _propertyType] != 7)
    {
      v29 = (void *)[v33 destinationEntity];
    }

    v34 = (void *)[MEMORY[0x189603FA8] array];
    [v34 addObject:v32];
    if (v31 >= 2)
    {
      for (uint64_t i = 1LL; i != v31; ++i)
      {
        -[NSSQLFetchIntermediate promoteToOuterJoinAtKeypathWithComponents:]((uint64_t)v7, v34);
        uint64_t v36 = [v30 objectAtIndex:i];
        if (v29) {
          v29 = (void *)objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v36);
        }
        if ([v29 _isAttribute]) {
          break;
        }
        [v34 addObject:v36];
        v29 = (void *)[v29 destinationEntity];
      }
    }

    v37 = (char *)[v9 selector];
    if (!v37 || v37 == sel_compare_) {
      break;
    }
    self = v44;
    if (v37 == sel_caseInsensitiveCompare_)
    {
      v38 = @" COLLATE NSCollateNoCase ";
    }

    else if (v37 == sel__caseInsensitiveNumericCompare_)
    {
      v38 = @" COLLATE NSCollateNumericallyNoCase ";
    }

    else if (v37 == sel_localizedCompare_)
    {
      v38 = @" COLLATE NSCollateLocaleSensitive ";
    }

    else if (v37 == sel_localizedCaseInsensitiveCompare_)
    {
      v38 = @" COLLATE NSCollateLocaleSensitiveNoCase ";
    }

    else
    {
      v38 = @" COLLATE NSCollateFinderlike ";
      if (v37 != sel_localizedStandardCompare_)
      {
        v40 = (void *)MEMORY[0x189603F70];
        v41 = (const __CFString *)[NSString stringWithFormat:@"unsupported NSSortDescriptor selector: %@", NSStringFromSelector(v37)];
        v42 = v40;
        goto LABEL_87;
      }
    }

    [v5 appendString:v38];
LABEL_73:
    if ((v47 & 1) == 0) {
      [v5 appendString:@" DESC"];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 reverseNullOrder])
    {
      if (v47) {
        v39 = @" ASC NULLS LAST";
      }
      else {
        v39 = @" NULLS FIRST";
      }
      [v5 appendString:v39];
    }

    if (++v8 == v46) {
      return v5;
    }
  }

  self = v44;
  if (![v9 comparator] || !HIBYTE(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    goto LABEL_73;
  }
  v42 = (void *)MEMORY[0x189603F70];
  v41 = @"unsupported NSSortDescriptor (comparator blocks are not supported)";
LABEL_87:
  objc_msgSend( v45,  "setObject:forKey:",  objc_msgSend(v42, "exceptionWithName:reason:userInfo:", v43, v41, 0),  @"NSUnderlyingException");
LABEL_88:

  return 0LL;
}

@end