@interface _NSHSTSStorage
+ (id)sharedPersistentStore;
- (BOOL)shouldPromoteHostToHTTPS:(id)a3;
- (BOOL)shouldPromoteHostToHTTPS:(id)a3 isPreload:(BOOL *)a4;
- (NSURL)path;
- (_CFHSTSPolicy)_policyRef;
- (id)initInMemoryStore;
- (id)initPersistentStoreWithURL:(id)a3;
- (id)nonPreloadedHosts;
- (void)dealloc;
- (void)handleSTSHeader:(id)a3 forURL:(id)a4;
- (void)resetHSTSForHost:(id)a3;
- (void)resetHSTSHostsSinceDate:(id)a3;
@end

@implementation _NSHSTSStorage

- (_CFHSTSPolicy)_policyRef
{
  return self->_policy;
}

+ (id)sharedPersistentStore
{
  if (+[_NSHSTSStorage sharedPersistentStore]::sOnce != -1) {
    dispatch_once(&+[_NSHSTSStorage sharedPersistentStore]::sOnce, &__block_literal_global_3083);
  }
  return (id)+[_NSHSTSStorage sharedPersistentStore]::store;
}

- (id)initPersistentStoreWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSHSTSStorage;
  v4 = -[_NSHSTSStorage init](&v6, sel_init);
  if (v4) {
    v4->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation((CFURLRef)a3);
  }
  return v4;
}

- (id)initInMemoryStore
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSHSTSStorage;
  v2 = -[_NSHSTSStorage init](&v4, sel_init);
  if (v2) {
    v2->_policy = (_CFHSTSPolicy *)_CFHSTSPolicyCreateWithStorageLocation(0LL);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSHSTSStorage;
  -[_NSHSTSStorage dealloc](&v3, sel_dealloc);
}

- (NSURL)path
{
  policy = self->_policy;
  objc_super v3 = (char *)policy + 16;
  if (!policy) {
    objc_super v3 = 0LL;
  }
  return *(NSURL **)(*((void *)v3 + 2) + 64LL);
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3
{
  policy = self->_policy;
  if (policy) {
    v5 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    v5 = 0LL;
  }
  return HSTSPolicy::isKnownHSTSHost(v5, (NSString *)a3, &v7) != 0;
}

- (BOOL)shouldPromoteHostToHTTPS:(id)a3 isPreload:(BOOL *)a4
{
  policy = self->_policy;
  if (policy) {
    unsigned __int8 v7 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    unsigned __int8 v7 = 0LL;
  }
  unsigned int v8 = HSTSPolicy::isKnownHSTSHost(v7, (NSString *)a3, &v10);
  if (a4) {
    *a4 = v10 != 0;
  }
  return v8 != 0;
}

- (id)nonPreloadedHosts
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)[MEMORY[0x189603FA8] array];
  policy = self->_policy;
  if (policy) {
    v5 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    v5 = 0LL;
  }
  CFDictionaryRef v6 = HSTSPolicy::copyExternalRepresentationOfHSTSPolicies(v5);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v8 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (!objc_msgSend( (id)-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v12),  "objectForKeyedSubscript:",  @"_kCFNetworkHSTSPreloaded")) {
            [v3 addObject:v12];
          }
        }

        uint64_t v9 = -[__CFDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v9);
    }
  }

  return v3;
}

- (void)resetHSTSForHost:(id)a3
{
  policy = self->_policy;
  v5 = (HSTSCache **)((char *)policy + 16);
  if (!policy) {
    v5 = 0LL;
  }
  HSTSCache::modifyHSTSStore(v5[2], a3, 0LL, 0LL);
}

- (void)resetHSTSHostsSinceDate:(id)a3
{
  policy = self->_policy;
  v5 = (HSTSCache **)((char *)policy + 16);
  if (!policy) {
    v5 = 0LL;
  }
  HSTSCache::modifyHSTSStore(v5[2], 0LL, 0LL, a3);
}

- (void)handleSTSHeader:(id)a3 forURL:(id)a4
{
  policy = self->_policy;
  if (policy) {
    CFDictionaryRef v7 = (HSTSPolicy *)((char *)policy + 16);
  }
  else {
    CFDictionaryRef v7 = 0LL;
  }
  HSTSPolicy::handleSTSHeader(v7, (const __CFString *)a3, (const __CFURL *)a4);
}

@end