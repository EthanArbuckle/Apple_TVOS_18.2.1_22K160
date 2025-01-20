@interface NSSQLUpdateColumnsIntermediate
- (BOOL)isUpdateColumnsScoped;
- (NSDictionary)propertiesToUpdate;
- (NSSQLConstantValueIntermediate)_generateSQLForAttributeUpdate:(uint64_t)a3 value:(void *)a4 inContext:;
- (NSSQLUpdateColumnsIntermediate)initWithPropertiesToUpdate:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAliasForKeypathExpression:(id)a3;
- (void)dealloc;
- (void)setPropertiesToUpdate:(id)a3;
@end

@implementation NSSQLUpdateColumnsIntermediate

- (NSSQLUpdateColumnsIntermediate)initWithPropertiesToUpdate:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLUpdateColumnsIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5) {
    v5->_propertiesToUpdate = (NSDictionary *)a3;
  }
  return v5;
}

- (void)dealloc
{
  self->_propertiesToUpdate = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLUpdateColumnsIntermediate;
  -[NSSQLUpdateColumnsIntermediate dealloc](&v3, sel_dealloc);
}

- (BOOL)isUpdateColumnsScoped
{
  return 1;
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return &stru_189EAC2E8;
}

- (NSSQLConstantValueIntermediate)_generateSQLForAttributeUpdate:(uint64_t)a3 value:(void *)a4 inContext:
{
  if (!a1) {
    return 0LL;
  }
  v8 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"%@ ", objc_msgSend(a2, "columnName")];
  v9 = -[NSSQLConstantValueIntermediate initWithConstantValue:ofType:inScope:context:]( [NSSQLConstantValueIntermediate alloc],  "initWithConstantValue:ofType:inScope:context:",  a3,  [a2 sqlType],  a1,  a4);
  uint64_t v10 = -[NSSQLConstantValueIntermediate generateSQLStringInContext:](v9, "generateSQLStringInContext:", a4);
  if (v10)
  {
    v11 = (void *)v10;
    -[NSSQLConstantValueIntermediate appendFormat:](v8, "appendFormat:", @"= %@", v10);
  }

  else
  {
    if (![a4 objectForKey:@"NSUnderlyingException"]) {
      [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't generate new column value from value: %@", a3), 0), @"NSUnderlyingException" forKey];
    }

    v9 = v8;
    v8 = 0LL;
  }

  return v8;
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v108 = *MEMORY[0x1895F89C0];
  id v5 = objc_alloc_init(MEMORY[0x189607940]);
  v6 = (id *)[a3 objectForKey:@"entity"];
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  obj = self->_propertiesToUpdate;
  uint64_t v100 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v102,  v107,  16LL);
  if (!v100) {
    goto LABEL_103;
  }
  uint64_t v7 = 0LL;
  v98 = self;
  uint64_t v99 = *(void *)v103;
  id v95 = v5;
  do
  {
    uint64_t v8 = 0LL;
    uint64_t v92 = v100 + v7;
    do
    {
      if (*(void *)v103 != v99) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v102 + 1) + 8 * v8);
      if (v7) {
        objc_msgSend(v5, "appendString:", @", ");
      }
      id v10 = -[NSDictionary objectForKey:](self->_propertiesToUpdate, "objectForKey:", v9);
      uint64_t v11 = [v9 _propertyType];
      uint64_t v12 = [v9 _qualifiedName];
      if (!v6 || (v13 = (id *)[v6[5] objectForKey:v12]) == 0)
      {
        v63 = (void *)MEMORY[0x189603F70];
        uint64_t v64 = *MEMORY[0x189603A60];
        id v65 = a3;
        uint64_t v66 = [NSString stringWithFormat:@"Can't find property %@ on entity %@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
        goto LABEL_111;
      }

      v14 = v13;
      int v15 = [v13 propertyType];
      if (v15 == 1)
      {
        if (objc_msgSend((id)objc_msgSend(v14, "propertyDescription"), "_propertyType") == 6)
        {
          v63 = (void *)MEMORY[0x189603F70];
          uint64_t v64 = *MEMORY[0x189603A60];
          id v65 = a3;
          uint64_t v66 = [NSString stringWithFormat:@"Invalid property for update (can't batch update derived attributes) %@/%@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
          goto LABEL_111;
        }
      }

      else if (v15 != 7)
      {
        v63 = (void *)MEMORY[0x189603F70];
        uint64_t v64 = *MEMORY[0x189603A60];
        id v65 = a3;
        uint64_t v66 = [NSString stringWithFormat:@"Invalid property for update (not an attribute or a to one) %@/%@", objc_msgSend(v9, "name"), objc_msgSend(v6, "entityDescription")];
LABEL_111:
        uint64_t v67 = [v63 exceptionWithName:v64 reason:v66 userInfo:0];
        id v68 = v65;
        goto LABEL_136;
      }

      uint64_t v16 = [v10 expressionType];
      if (v16 > 9)
      {
        if (v16 == 10) {
          goto LABEL_30;
        }
        if (v16 == 13)
        {
          id v97 = v10;
          v33 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]( objc_alloc(&OBJC_CLASS___NSSQLSubqueryExpressionIntermediate),  "initWithExpression:trailingKeypath:inScope:",  v10,  0LL,  self);
          id v34 = -[NSSQLSubqueryExpressionIntermediate generateSQLStringInContext:]( v33,  "generateSQLStringInContext:",  a3);

          if (!v34)
          {
            id v10 = v97;
            if (![a3 objectForKey:@"NSUnderlyingException"])
            {
              v76 = (void *)MEMORY[0x189603F70];
              uint64_t v77 = *MEMORY[0x189603A60];
              uint64_t v78 = [NSString stringWithFormat:@"Unable to generate sql for update expression %@", v97, v89];
              goto LABEL_131;
            }

            goto LABEL_133;
          }

          v17 = (NSSQLConstantValueIntermediate *)objc_msgSend((id)objc_msgSend(v14, "columnName"), "mutableCopy");
          -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", @" = ");
          -[NSSQLConstantValueIntermediate appendString:](v17, "appendString:", v34);

          id v10 = v97;
          goto LABEL_45;
        }

        if (v16 != 50)
        {
LABEL_112:
          v69 = (void *)MEMORY[0x189603F70];
          id v70 = v10;
          uint64_t v71 = *MEMORY[0x189603A60];
          uint64_t v72 = [NSString stringWithFormat:@"Invalid expression (%@) in propertiesToUpdate", v70];
          goto LABEL_135;
        }

        v20 = (void *)[v10 expressionValueWithObject:0 context:0];
        if (!v20)
        {
          v69 = (void *)MEMORY[0x189603F70];
          id v74 = v10;
          uint64_t v71 = *MEMORY[0x189603A60];
          uint64_t v72 = [NSString stringWithFormat:@"Fetch request expression evaluation (%@) failed", v74];
          goto LABEL_135;
        }

        v21 = v20;
        uint64_t v22 = [v21 count];
        if (v22)
        {
          if (v22 != 1) {
            goto LABEL_148;
          }
          v21 = (void *)[v21 lastObject];
          objc_opt_class();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = (void *)[v21 objectID];
            goto LABEL_79;
          }

          objc_opt_class();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_79:
            self = v98;
LABEL_93:
            if (v11 == 4)
            {
              id v97 = v10;
              v76 = (void *)MEMORY[0x189603F70];
              uint64_t v77 = *MEMORY[0x189603A60];
              uint64_t v78 = [NSString stringWithFormat:@"Can't generate new column values for %@ - incompatible destination: %@", objc_msgSend(v14, "name"), v21];
              goto LABEL_131;
            }

            v30 = self;
            v31 = v14;
            uint64_t v32 = (uint64_t)v21;
            goto LABEL_95;
          }

          self = v98;
          if ([v21 isNSDictionary] && objc_msgSend(v21, "count"))
          {
            if ([v21 count] != 1)
            {
LABEL_148:
              v69 = (void *)MEMORY[0x189603F70];
              id v88 = v10;
              uint64_t v71 = *MEMORY[0x189603A60];
              uint64_t v72 = [NSString stringWithFormat:@"Invalid fetch expression (%@) in propertiesToUpdate - fetch has multiple results", v88];
              goto LABEL_135;
            }

            memset(v101, 0, sizeof(v101));
            if ([v21 countByEnumeratingWithState:v101 objects:v106 count:16])
            {
              v21 = (void *)[v21 objectForKey:**((void **)&v101[0] + 1)];
              goto LABEL_93;
            }
          }
        }

        v21 = 0LL;
        goto LABEL_93;
      }

      if (v16)
      {
        if (v16 != 3)
        {
          if (v16 != 4) {
            goto LABEL_112;
          }
          if (v11 == 4)
          {
            v69 = (void *)MEMORY[0x189603F70];
            id v73 = v10;
            uint64_t v71 = *MEMORY[0x189603A60];
            uint64_t v72 = [NSString stringWithFormat:@"Invalid value expression (%@) in propertiesToUpdate : what does it mean to update a relationship to the result of a function?", v73];
            goto LABEL_135;
          }

          v17 = (NSSQLConstantValueIntermediate *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"%@ ", objc_msgSend(v14, "columnName")];
          id v18 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v10, 0LL, a3);
          if (!v18)
          {
            if (![a3 objectForKey:@"NSUnderlyingException"]) {
              [a3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Fetch request expression evaluation (%@) failed", v10), 0), @"NSUnderlyingException" forKey];
            }

LABEL_137:
            return 0LL;
          }

          v19 = v18;
          -[NSSQLConstantValueIntermediate appendFormat:](v17, "appendFormat:", @" = %@", v18);

LABEL_45:
          self = v98;
          if (!v17) {
            goto LABEL_133;
          }
          goto LABEL_96;
        }

- (NSDictionary)propertiesToUpdate
{
  return self->_propertiesToUpdate;
}

- (void)setPropertiesToUpdate:(id)a3
{
}

@end