@interface NSSQLConstantValueIntermediate
- (BOOL)_addBindVarForConstId:(uint64_t)a3 ofType:(void *)a4 inContext:;
- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4 context:(id)a5;
- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 ofType:(unsigned __int8)a4 inScope:(id)a5 context:(id)a6;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLConstantValueIntermediate

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4 context:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSQLConstantValueIntermediate;
  v8 = -[NSSQLIntermediate initWithScope:](&v12, sel_initWithScope_, a4);
  if (v8)
  {
    v8->_constantValue = a3;
    v8->_type = 0;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = _sqlCoreLookupSQLEntityForEntityDescription( (void *)[a5 objectForKey:@"persistentStore"],  a3);
      uint64_t v10 = [a5 objectForKey:@"entitySpecificationKeypath"];
      if (v10) {
        objc_msgSend( a4,  "setDisambiguatingEntity:withKeypath:hasToMany:",  v9,  v10,  objc_msgSend( (id)objc_msgSend(a5, "objectForKey:", @"entitySpecificationKeypathContainsToMany"),  "BOOLValue"));
      }
    }
  }

  return v8;
}

- (id)generateSQLStringInContext:(id)a3
{
  v78[4] = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  if (-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    if (!self->_constantValue
      || (uint64_t v6 = [MEMORY[0x189603FE8] null], v7 = self->_constantValue, (id)v6 == v7))
    {
      uint64_t v10 = @"nil";
    }

    else
    {
      int v8 = [v7 isNSNumber];
      id constantValue = self->_constantValue;
      if (v8)
      {
        uint64_t v10 = (__CFString *)[constantValue description];
      }

      else if ([constantValue isNSString])
      {
        uint64_t v10 = (__CFString *)[NSString stringWithFormat:@"'%@'", self->_constantValue];
      }

      else if ([self->_constantValue isNSDate])
      {
        v38 = (void *)NSString;
        [self->_constantValue timeIntervalSinceReferenceDate];
        uint64_t v10 = (__CFString *)objc_msgSend(v38, "stringWithFormat:", @"%f", v39);
      }

      else
      {
        uint64_t v40 = *MEMORY[0x189603A60];
        id v41 = self->_constantValue;
        v75 = @"valueSpecified";
        id v76 = v41;
        objc_msgSend( a3,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v40,  @"Can't specify non string/number/date value as part of index",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1)),  @"NSUnderlyingException");
        uint64_t v10 = 0LL;
      }
    }

    goto LABEL_94;
  }

  uint64_t type = self->_type;
  objc_super v12 = self->_constantValue;
  if (!self->_type)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)[v12 objectID];
        if (!v15) {
          goto LABEL_24;
        }
LABEL_17:
        if (([v15 isTemporaryID] & 1) == 0
          && (uint64_t v16 = [v15 persistentStore],
              v16 == [a3 objectForKey:@"persistentStore"]))
        {
          if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")) {
            v42 = @"selectBindVars";
          }
          else {
            v42 = @"bindVars";
          }
          v18 = (void *)[a3 objectForKey:v42];
          if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"generatePairs"), "BOOLValue"))
          {
            uint64_t v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"persistentStore"), "model");
            if (v43) {
              v44 = *(void **)(v43 + 24);
            }
            else {
              v44 = 0LL;
            }
            uint64_t v45 = objc_msgSend(v44, "objectForKey:", objc_msgSend(v15, "entityName"));
            v46 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
            if (v45) {
              uint64_t v47 = *(unsigned int *)(v45 + 184);
            }
            else {
              uint64_t v47 = 0LL;
            }
            v48 = -[NSSQLBindVariable initWithInt64:sqlType:](v46, "initWithInt64:sqlType:", v47, 2LL);
            [v18 addObject:v48];
          }

          v20 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  [v15 _referenceData64],  2);
        }

        else
        {
          if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")) {
            v17 = @"selectBindVars";
          }
          else {
            v17 = @"bindVars";
          }
          v18 = (void *)[a3 objectForKey:v17];
          v19 = objc_alloc(&OBJC_CLASS___NSSQLBindVariable);
          v20 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( v19,  "initWithValue:sqlType:propertyDescription:",  [MEMORY[0x189607968] numberWithLongLong:0],  2,  0);
        }

        v21 = v20;
        [v18 addObject:v20];

        BOOL v22 = 1;
        goto LABEL_87;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v12;
        goto LABEL_17;
      }
    }

- (BOOL)_addBindVarForConstId:(uint64_t)a3 ofType:(void *)a4 inContext:
{
  if (a1)
  {
    else {
      int v8 = @"bindVars";
    }
    uint64_t v9 = (void *)[a4 objectForKey:v8];
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription( (void *)[a4 objectForKey:@"persistentStore"],  a2);
      if (v10) {
        uint64_t v11 = *(int *)(v10 + 184);
      }
      else {
        uint64_t v11 = 0LL;
      }
      a2 = (void *)[MEMORY[0x189607968] numberWithInteger:v11];
    }

    objc_opt_class();
    objc_super v12 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:allowCoercion:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithValue:sqlType:propertyDescription:allowCoercion:",  a2,  a3,  0LL,  (objc_opt_isKindOfClass() & 1) == 0);
    [v9 addObject:v12];
  }

  return a1 != 0LL;
}

- (void)dealloc
{
  self->_id constantValue = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLConstantValueIntermediate;
  -[NSSQLConstantValueIntermediate dealloc](&v3, sel_dealloc);
}

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 ofType:(unsigned __int8)a4 inScope:(id)a5 context:(id)a6
{
  uint64_t v10 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( self,  "initWithConstantValue:inScope:context:",  a3,  a5,  a6);
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_uint64_t type = a4;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v12 = _sqlCoreLookupSQLEntityForEntityDescription( (void *)[a6 objectForKey:@"persistentStore"],  a3);
      uint64_t v13 = [a6 objectForKey:@"entitySpecificationKeypath"];
      if (v13) {
        objc_msgSend( a5,  "setDisambiguatingEntity:withKeypath:hasToMany:",  v12,  v13,  objc_msgSend( (id)objc_msgSend(a6, "objectForKey:", @"entitySpecificationKeypathContainsToMany"),  "BOOLValue"));
      }
    }
  }

  return v11;
}

@end