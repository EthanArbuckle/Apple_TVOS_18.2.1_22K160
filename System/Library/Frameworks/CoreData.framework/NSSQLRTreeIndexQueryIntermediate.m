@interface NSSQLRTreeIndexQueryIntermediate
- (id)generateSQLStringInContext:(id)a3;
- (id)initForIndexNamed:(id)a3 onEntity:(id)a4 properties:(id)a5 ranges:(id)a6 inScope:(id)a7;
- (uint64_t)_validateCollection:(void *)a3 context:;
- (uint64_t)_validateExpression:(void *)a3 context:;
- (void)dealloc;
@end

@implementation NSSQLRTreeIndexQueryIntermediate

- (id)initForIndexNamed:(id)a3 onEntity:(id)a4 properties:(id)a5 ranges:(id)a6 inScope:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSSQLRTreeIndexQueryIntermediate;
  v11 = -[NSSQLIntermediate initWithScope:](&v13, sel_initWithScope_, a7);
  if (v11)
  {
    v11->_indexName = (NSExpression *)a3;
    v11->_entity = (NSSQLEntity *)a4;
    v11->_properties = (NSArray *)a5;
    v11->_ranges = (NSArray *)a6;
  }

  return v11;
}

- (void)dealloc
{
  self->_indexName = 0LL;
  self->_entity = 0LL;

  self->_properties = 0LL;
  self->_ranges = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLRTreeIndexQueryIntermediate;
  -[NSSQLRTreeIndexQueryIntermediate dealloc](&v3, sel_dealloc);
}

- (uint64_t)_validateCollection:(void *)a3 context:
{
  v17[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 isNSArray])
    {
      if ([a2 count] == 2) {
        return 1LL;
      }
      v6 = (void *)MEMORY[0x189603F70];
      uint64_t v7 = *MEMORY[0x189603A60];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS for rtree query (array should have 2 elements) %@", a2];
      v14[0] = @"entity";
      uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v14[1] = @"properties";
      v15[0] = v13;
      v15[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      v10 = (void *)MEMORY[0x189603F68];
      v11 = v15;
      v12 = v14;
    }

    else
    {
      v6 = (void *)MEMORY[0x189603F70];
      uint64_t v7 = *MEMORY[0x189603A60];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS for rtree query (should be an array but isn't) %@", a2];
      v16[0] = @"entity";
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v16[1] = @"properties";
      v17[0] = v9;
      v17[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      v10 = (void *)MEMORY[0x189603F68];
      v11 = v17;
      v12 = v16;
    }

    objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  v8,  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2)),  @"NSUnderlyingException");
    return 0LL;
  }

  return result;
}

- (uint64_t)_validateExpression:(void *)a3 context:
{
  v11[2] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 expressionType])
    {
      v6 = (void *)MEMORY[0x189603F70];
      uint64_t v7 = *MEMORY[0x189603A60];
      uint64_t v8 = [NSString stringWithFormat:@"Invalid RHS  element for rtree query (should be a constant value) %@", a2];
      v10[0] = @"entity";
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 16), "entityDescription"), "name");
      v10[1] = @"properties";
      v11[0] = v9;
      v11[1] = [*(id *)(v5 + 32) valueForKey:@"name"];
      objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( v6,  "exceptionWithName:reason:userInfo:",  v7,  v8,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v11, v10, 2)),  @"NSUnderlyingException");
      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (id)generateSQLStringInContext:(id)a3
{
  v99[2] = *MEMORY[0x1895F89C0];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0LL;
  }
  NSUInteger v5 = -[NSArray count](self->_properties, "count");
  if (v5 != -[NSArray count](self->_ranges, "count"))
  {
    v12 = (void *)MEMORY[0x189603F70];
    uint64_t v13 = *MEMORY[0x189603A60];
    properties = self->_properties;
    v98[0] = @"properties";
    v98[1] = @"ranges";
    ranges = self->_ranges;
    v99[0] = properties;
    v99[1] = ranges;
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:v99 forKeys:v98 count:2];
    v11 = @"Mismatch between number of properties and number of ranges for rtree query";
LABEL_7:
    v16 = v12;
    uint64_t v17 = v13;
    goto LABEL_56;
  }

  indexName = self->_indexName;
  if (indexName)
  {
    uint64_t v7 = -[NSExpression expressionType](indexName, "expressionType");
    indexName = self->_indexName;
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x189603F70];
      uint64_t v9 = *MEMORY[0x189603A60];
      v96 = @"indexNameExpression";
      v97 = indexName;
      uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      v11 = @"Invalid index name expression (should be a constant value)";
LABEL_55:
      v16 = v8;
      uint64_t v17 = v9;
      goto LABEL_56;
    }
  }

  id v18 = -[NSExpression constantValue](indexName, "constantValue");
  if (([v18 isNSString] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = *MEMORY[0x189603A60];
    v94 = @"indexName";
    id v95 = v18;
    uint64_t v10 = [MEMORY[0x189603F68] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    v11 = @"Invalid index name (should be a string)";
    goto LABEL_55;
  }

  v19 = -[NSSQLAliasGenerator initWithNestingLevel:]( [NSSQLAliasGenerator alloc],  "initWithNestingLevel:",  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"nestingLevel"), "integerValue") + 1);
  uint64_t v70 = -[NSSQLAliasGenerator generateTableAlias](v19, "generateTableAlias");

  v69 = (void *)[MEMORY[0x189603FA8] array];
  if (!-[NSArray count](self->_properties, "count"))
  {
    id v73 = 0LL;
    v74 = 0LL;
LABEL_59:
    uint64_t v52 = [v69 componentsJoinedByString:@" AND "];
    return (id)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"%@ IN (SELECT %@.Z_PK FROM %@ %@ WHERE (%@))", v73, v70, v74, v70, v52];
  }

  id v73 = 0LL;
  v74 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v68 = (uint64_t)v18;
  while (1)
  {
    id v21 = -[NSArray objectAtIndex:](self->_properties, "objectAtIndex:", v20);
    id v22 = -[NSArray objectAtIndex:](self->_ranges, "objectAtIndex:", v20);
    if (([(id)objc_opt_class() isSimpleKeypath:v21] & 1) == 0)
    {
      v53 = (void *)MEMORY[0x189603F70];
      uint64_t v54 = *MEMORY[0x189603A60];
      uint64_t v55 = [NSString stringWithFormat:@"Invalid LHS for rtree query %@", v21];
      v92[0] = @"entity";
      uint64_t v56 = objc_msgSend(-[NSSQLEntity entityDescription](self->_entity, "entityDescription"), "name");
      v92[1] = @"properties";
      v93[0] = v56;
      v93[1] = -[NSArray valueForKey:](self->_properties, "valueForKey:", @"name");
      v57 = (void *)MEMORY[0x189603F68];
      v58 = v93;
      v59 = v92;
      goto LABEL_70;
    }

    if (!-[NSSQLIntermediate keypathExpressionIsSafeLHSForIn:](self, "keypathExpressionIsSafeLHSForIn:", v21))
    {
      v53 = (void *)MEMORY[0x189603F70];
      uint64_t v54 = *MEMORY[0x189603A60];
      uint64_t v55 = objc_msgSend( NSString,  "stringWithFormat:",  @"Unsupported predicate; can't generate SQL for %@",
              v21);
      v60 = self->_properties;
      v90[0] = @"properties";
      v90[1] = @"ranges";
      v61 = self->_ranges;
      v91[0] = v60;
      v91[1] = v61;
      v57 = (void *)MEMORY[0x189603F68];
      v58 = v91;
      v59 = v90;
      goto LABEL_70;
    }

    if (!v73)
    {
      v23 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLKeypathExpressionIntermediate),  "initWithExpression:allowToMany:inScope:",  v21,  0LL,  self->super._scope);
      v24 = v23;
      if (v23) {
        *(&v23->super._allowToMany + 1) = 1;
      }
      id v25 = -[NSSQLKeypathExpressionIntermediate generateSQLStringInContext:](v23, "generateSQLStringInContext:", a3);

      id v73 = v25;
      if (!v25) {
        break;
      }
    }

    uint64_t v71 = v20;
    if ([v21 expressionType]) {
      v26 = (void *)[v21 keyPath];
    }
    else {
      v26 = (void *)[v21 constantValue];
    }
    v27 = v26;
    v28 = (void *)[v26 componentsSeparatedByString:@"."];
    entity = self->_entity;
    id v72 = v22;
    if ([v28 count] == 1)
    {
      v30 = self->_entity;
      if (v30)
      {
        v31 = (void *)-[NSMutableDictionary objectForKey:](v30->_properties, "objectForKey:", v27);
        goto LABEL_38;
      }

@end