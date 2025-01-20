@interface NSOwnedDictionaryProxy
- (NSOwnedDictionaryProxy)initWithOwner:(id)a3;
- (NSOwnedDictionaryProxy)retain;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)release;
- (void)superRelease;
@end

@implementation NSOwnedDictionaryProxy

- (NSOwnedDictionaryProxy)initWithOwner:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSOwnedDictionaryProxy;
  result = -[NSOwnedDictionaryProxy init](&v5, sel_init);
  if (result) {
    result->_owner = a3;
  }
  return result;
}

- (NSOwnedDictionaryProxy)retain
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = self->_owner;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSOwnedDictionaryProxy;
  return -[NSOwnedDictionaryProxy retain](&v5, sel_retain);
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSOwnedDictionaryProxy;
  -[NSOwnedDictionaryProxy release](&v3, sel_release);
}

- (void)superRelease
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSOwnedDictionaryProxy;
  -[NSOwnedDictionaryProxy release](&v2, sel_release);
}

- (unint64_t)count
{
  return [self->_owner ownedDictionaryCount];
}

- (id)keyEnumerator
{
  return (id)[self->_owner ownedDictionaryKeyEnumerator];
}

- (id)objectForKey:(id)a3
{
  return (id)[self->_owner ownedDictionaryObjectForKey:a3];
}

@end