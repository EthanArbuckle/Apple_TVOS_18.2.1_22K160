@interface _NSPersistentHistoryPredicateRemapper
+ (id)defaultInstance;
- (_BYTE)replacementValueForKeyPath:(_BYTE *)result;
- (_NSPersistentHistoryPredicateRemapper)initWithStoreIdentifier:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4;
- (id)replacementValueForValue:(uint64_t)a1;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSPersistentHistoryPredicateRemapper

+ (id)defaultInstance
{
  id result = (id)defaultInstance_di_34;
  if (!defaultInstance_di_34)
  {
    id result = objc_alloc_init(&OBJC_CLASS____NSPersistentHistoryPredicateRemapper);
    defaultInstance_di_34 = (uint64_t)result;
  }

  return result;
}

- (_NSPersistentHistoryPredicateRemapper)initWithStoreIdentifier:(id)a3
{
  v4 = -[_NSPersistentHistoryPredicateRemapper init](self, "init");
  if (v4) {
    v4->_storeID = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryPredicateRemapper;
  -[_NSPersistentHistoryPredicateRemapper dealloc](&v3, sel_dealloc);
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  return -[_NSPersistentHistoryPredicateRemapper createPredicateForFetchFromPredicate:withContext:]( self,  "createPredicateForFetchFromPredicate:withContext:",  a3,  0LL);
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  if (a3)
  {
    v6 = (void *)objc_msgSend(a3, "copy", a3, a4);
    [v6 acceptVisitor:self flags:1];
    if (self->_storeID) {
      return v6;
    }
  }

  return (id)objc_msgSend(MEMORY[0x1896079C8], "predicateWithValue:", a3 == 0, a4);
}

- (id)replacementValueForValue:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!a2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      *(_BYTE *)(a1 + 16) = 0;
      return (id)[objc_alloc(MEMORY[0x189607968]) initWithInt:0];
    }

    return 0LL;
  }

  obuint64_t j = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v3 = [obj objectID];
LABEL_10:
    obuint64_t j = (id)v3;
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [obj _backingObjectID];
    goto LABEL_10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    obuint64_t j = (id)objc_msgSend((id)objc_msgSend(obj, "storeTokens"), "valueForKey:", *(void *)(a1 + 8));
    if (!obj)
    {
      id v5 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      return v5;
    }
  }

- (_BYTE)replacementValueForKeyPath:(_BYTE *)result
{
  v8[4] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v2 = result;
    v7[0] = @"author";
    v7[1] = @"bundleID";
    v8[0] = @"AUTHORTS";
    v8[1] = @"BUNDLEIDTS";
    v7[2] = @"contextName";
    v7[3] = @"processID";
    v8[2] = @"CONTEXTNAMETS";
    v8[3] = @"PROCESSIDTS";
    uint64_t v3 = objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v8, v7, 4),  "objectForKey:",  a2);
    if (v3) {
      return (_BYTE *)[objc_alloc(NSString) initWithFormat:@"%@.%@", v3, @"NAME"];
    }
    if ([a2 isEqualToString:@"transactionNumber"]
      || ([a2 isEqualToString:@"changeID"] & 1) != 0
      || [a2 isEqualToString:@"token"])
    {
      id v4 = objc_alloc(NSString);
      id v5 = NSSQLPrimaryKeyPropertyName;
    }

    else if ([a2 isEqualToString:@"timestamp"])
    {
      id v4 = objc_alloc(NSString);
      id v5 = PFPersistentHistoryTransactionTimestamp;
    }

    else if ([a2 isEqualToString:@"changeType"])
    {
      id v4 = objc_alloc(NSString);
      id v5 = PFPersistentHistoryChangeType;
    }

    else
    {
      id v4 = objc_alloc(NSString);
      id v5 = PFPersistentHistoryChangeEntity;
    }

    return (_BYTE *)[v4 initWithString:*v5];
  }

  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_previousKeyPathExpressionWasToken = 0;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
      id v10 = (id)[a3 constantValue];
      if (v10 || self->_previousKeyPathExpressionWasToken)
      {
        id v11 = -[_NSPersistentHistoryPredicateRemapper replacementValueForValue:]((uint64_t)self, v10);
        uint64_t v8 = v11;
        if (v11 && v11 != v10)
        {
          v9 = "constantValue";
          goto LABEL_8;
        }

        goto LABEL_16;
      }

      goto LABEL_15;
    }
  }

  id v5 = (_BYTE *)[a3 keyPath];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = -[_NSPersistentHistoryPredicateRemapper replacementValueForKeyPath:](self, v5);
    uint64_t v8 = v7;
    if (v7 && v7 != v6)
    {
      v9 = "_value";
LABEL_8:
      uint64_t v12 = v8;
      object_setInstanceVariableWithStrongDefault(a3, v9, v8);

      return;
    }

    goto LABEL_16;
  }

@end