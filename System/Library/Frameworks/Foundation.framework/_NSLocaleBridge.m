@interface _NSLocaleBridge
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)_prefForKey:(id)a3;
- (id)localizedStringForCurrencySymbol:(id)a3;
@end

@implementation _NSLocaleBridge

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)_prefForKey:(id)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSLocaleBridge;
  return -[_NSLocaleBridge _prefForKey:](&v4, sel__prefForKey_, a3);
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  return 0LL;
}

@end