@interface NSSQLForeignKeyIntermediate
- (NSSQLForeignKeyIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLForeignKeyIntermediate

- (NSSQLForeignKeyIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSSQLForeignKeyIntermediate;
  return -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]( &v5,  sel_initWithConstantValue_inScope_context_,  a3,  a4,  0LL);
}

- (id)generateSQLStringInContext:(id)a3
{
  id constantValue = self->super._constantValue;
  if ((id)[MEMORY[0x189603FE8] null] == constantValue) {
    v6 = 0LL;
  }
  else {
    v6 = constantValue;
  }
  if (!v6) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      goto LABEL_7;
    }
LABEL_11:
    unsigned int v8 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:]( objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"persistentStore"), "adapter"),  v6);
    if (v8 == 1) {
      uint64_t v9 = 2LL;
    }
    else {
      uint64_t v9 = v8;
    }
    if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")) {
      v10 = @"selectBindVars";
    }
    else {
      v10 = @"bindVars";
    }
    v11 = (void *)[a3 objectForKey:v10];
    v12 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLBindVariable),  "initWithValue:sqlType:propertyDescription:",  v6,  v9,  0LL);
    goto LABEL_18;
  }

  id constantValue = (id)[v6 objectID];
  if (!constantValue) {
    goto LABEL_11;
  }
LABEL_7:
  if (([constantValue isTemporaryID] & 1) == 0)
  {
    uint64_t v7 = [constantValue persistentStore];
    if (v7 == [a3 objectForKey:@"persistentStore"])
    {
      if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped")) {
        v15 = @"selectBindVars";
      }
      else {
        v15 = @"bindVars";
      }
      v11 = (void *)[a3 objectForKey:v15];
      v12 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  [constantValue _referenceData64],  2);
LABEL_18:
      v13 = v12;
      [v11 addObject:v12];

      return (id)[@"?" mutableCopy];
    }
  }

  -[NSSQLConstantValueIntermediate _addBindVarForConstId:ofType:inContext:]( self,  (void *)[MEMORY[0x189607968] numberWithLongLong:0],  2,  a3);
  return (id)[@"?" mutableCopy];
}

@end