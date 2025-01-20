@interface CFPrefsSuiteSearchListSource
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)a4;
- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5;
- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4;
@end

@implementation CFPrefsSuiteSearchListSource

- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)a4
{
}

- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5
{
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
}

- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __85__CFPrefsSuiteSearchListSource_handleChangeNotificationForDomainIdentifier_isRemote___block_invoke;
  v4[3] = &__block_descriptor_33_e8_v16__0_8l;
  BOOL v5 = a4;
  -[CFPrefsSource forEachObserver:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __85__CFPrefsSuiteSearchListSource_handleChangeNotificationForDomainIdentifier_isRemote___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend( a2,  "handleChangeNotificationForDomainIdentifier:isRemote:",  objc_msgSend(a2, "domainIdentifier"),  *(unsigned __int8 *)(a1 + 32));
}

@end