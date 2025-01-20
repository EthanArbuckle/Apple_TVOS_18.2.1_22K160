@interface NSPersistentHistoryToken
+ (BOOL)supportsSecureCoding;
- (NSPersistentHistoryToken)initWithCoder:(id)a3;
- (NSPersistentHistoryToken)initWithDictionary:(id)a3;
- (NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4;
- (id)storeTokens;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPersistentHistoryToken

uint64_t __48___NSPersistentHistoryToken_compareToken_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __48___NSPersistentHistoryToken_compareToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __33___NSPersistentHistoryToken_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4
{
  v6 = -[NSPersistentHistoryToken init](self, "init");
  if (v6) {

  }
  return (NSPersistentHistoryToken *)-[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:]( objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken),  "initWithTransactionNumber:andStoreID:",  a3,  a4);
}

- (NSPersistentHistoryToken)initWithDictionary:(id)a3
{
  v4 = -[NSPersistentHistoryToken init](self, "init");
  if (v4) {

  }
  return (NSPersistentHistoryToken *)-[_NSPersistentHistoryToken initWithDictionary:]( objc_alloc(&OBJC_CLASS____NSPersistentHistoryToken),  "initWithDictionary:",  a3);
}

- (NSPersistentHistoryToken)initWithCoder:(id)a3
{
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)storeTokens
{
  return (id)MEMORY[0x189604A60];
}

@end