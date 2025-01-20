@interface NSSQLGroupByIntermediate
- (NSSQLGroupByIntermediate)initWithProperties:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLGroupByIntermediate

- (NSSQLGroupByIntermediate)initWithProperties:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLGroupByIntermediate;
  v5 = -[NSSQLIntermediate initWithScope:](&v7, sel_initWithScope_, a4);
  if (v5) {
    v5->_properties = (NSArray *)[a3 copy];
  }
  return v5;
}

- (void)dealloc
{
  self->_properties = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLGroupByIntermediate;
  -[NSSQLGroupByIntermediate dealloc](&v3, sel_dealloc);
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (-[NSSQLIntermediate isUpdateScoped](self, "isUpdateScoped"))
  {
    [a3 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Unsupported clause (group by not allowed in updates)"), 0), @"NSUnderlyingException" forKey];
    return 0LL;
  }

  else
  {
    id v5 = -[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate");
    id v6 = objc_alloc_init(MEMORY[0x189607940]);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    obj = self->_properties;
    uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = -v9;
        uint64_t v19 = v8 + v9;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          if ([v13 _propertyType] == 5)
          {
            -[NSSQLFetchIntermediate addGroupByKeypath:]( (uint64_t)v5,  objc_msgSend((id)objc_msgSend(v13, "expression"), "predicateFormat"));
            v14 = (void *)[v13 expression];
          }

          else
          {
            uint64_t v15 = [v13 name];
            -[NSSQLFetchIntermediate addGroupByKeypath:]((uint64_t)v5, v15);
            v14 = (void *)[MEMORY[0x189607878] expressionForKeyPath:v15];
          }

          id v16 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v14, 0LL, a3);
          if (!v16)
          {
            if (![a3 valueForKey:@"NSUnderlyingException"]) {
              [a3 setValue:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Failed to generate SQL for group by property: %@", v13), 0), @"NSUnderlyingException" forKey];
            }

            return 0LL;
          }

          v17 = v16;
          if (v12 != v11) {
            objc_msgSend(v6, "appendString:", @", ");
          }
          [v6 appendString:v17];

          ++v11;
        }

        while (v8 != v11);
        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
        uint64_t v9 = v19;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }

  return v6;
}

@end