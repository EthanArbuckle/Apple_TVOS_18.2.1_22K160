@interface _NSPersistentHistoryTransactionPredicateParser
- (BOOL)parse:(id *)a3;
- (_NSPersistentHistoryTransactionPredicateParser)initWithPredicate:(id)a3;
- (id)storeTokens;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSPersistentHistoryTransactionPredicateParser

- (_NSPersistentHistoryTransactionPredicateParser)initWithPredicate:(id)a3
{
  v4 = -[_NSPersistentHistoryTransactionPredicateParser init](self, "init");
  if (v4)
  {
    v4->_predicate = (NSPredicate *)[a3 copy];
    v4->_storeTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    *(_WORD *)&v4->_hasDate = 0;
    v4->_localError = 0LL;
  }

  return v4;
}

- (void)dealloc
{
  self->_predicate = 0LL;
  self->_storeTokens = 0LL;

  self->_localError = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryTransactionPredicateParser;
  -[_NSPersistentHistoryTransactionPredicateParser dealloc](&v3, sel_dealloc);
}

- (BOOL)parse:(id *)a3
{
  predicate = self->_predicate;
  if (!predicate) {
    return 1;
  }
  -[NSPredicate acceptVisitor:flags:](predicate, "acceptVisitor:flags:", self, 1LL);
  localError = self->_localError;
  BOOL result = localError == 0LL;
  if (a3)
  {
    if (localError)
    {
      BOOL result = 0;
      *a3 = localError;
    }
  }

  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (self->_localError) {
    return;
  }
  if ([a3 expressionType])
  {
    if ([a3 expressionType] != 10
      || !objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", @"TIMESTAMP"))
    {
      return;
    }

    if (self->_hasDate)
    {
      uint64_t v12 = *MEMORY[0x1896075E0];
      v13 = @"Only one date predicate is allowed for history deletion.";
      v5 = (void *)MEMORY[0x189603F68];
      v6 = &v13;
      v7 = &v12;
LABEL_17:
      uint64_t v10 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
      id v11 = objc_alloc(MEMORY[0x189607870]);
      self->_localError = (NSError *)[v11 initWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v10];
      return;
    }

    goto LABEL_18;
  }

  [a3 constantValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)[a3 constantValue];
  if ((isKindOfClass & 1) != 0)
  {
    -[NSMutableDictionary addEntriesFromDictionary:]( self->_storeTokens,  "addEntriesFromDictionary:",  [v9 storeTokens]);
    return;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "constantValue"), "isEqualToString:", @"TIMESTAMP"))
  {
    self->_hasTimestamp = 1;
    return;
  }

  [a3 constantValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_hasTimestamp)
  {
    if (self->_hasDate)
    {
      uint64_t v14 = *MEMORY[0x1896075E0];
      v15[0] = @"Only one date predicate is allowed for history deletion.";
      v5 = (void *)MEMORY[0x189603F68];
      v6 = (const __CFString **)v15;
      v7 = &v14;
      goto LABEL_17;
    }

- (id)storeTokens
{
  return (id)[MEMORY[0x189603F68] dictionaryWithDictionary:self->_storeTokens];
}

@end