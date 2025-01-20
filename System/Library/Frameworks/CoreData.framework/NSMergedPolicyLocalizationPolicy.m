@interface NSMergedPolicyLocalizationPolicy
- (NSMergedPolicyLocalizationPolicy)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_ensureFullLocalizationDictionaryIsLoaded;
- (void)addPolicy:(id)a3;
- (void)dealloc;
@end

@implementation NSMergedPolicyLocalizationPolicy

- (NSMergedPolicyLocalizationPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMergedPolicyLocalizationPolicy;
  result = -[NSMergedPolicyLocalizationPolicy init](&v3, sel_init);
  if (result) {
    result->_mergedPolicies = 0LL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMergedPolicyLocalizationPolicy;
  -[NSValidationErrorLocalizationPolicy dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMergedPolicyLocalizationPolicy;
  v4 = -[NSValidationErrorLocalizationPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4) {
    v4[6] = -[NSSet copy](self->_mergedPolicies, "copy");
  }
  return v4;
}

- (void)addPolicy:(id)a3
{
  mergedPolicies = self->_mergedPolicies;
  if (!mergedPolicies)
  {
    mergedPolicies = (NSSet *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:4];
    self->_mergedPolicies = mergedPolicies;
  }

  -[NSSet addObject:](mergedPolicies, "addObject:", a3);
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!self->super._hasSetLocalizationDictionary)
  {
    self->super._localizationDictionary = (NSDictionary *)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  -[NSSet count](self->_mergedPolicies, "count"));
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    mergedPolicies = self->_mergedPolicies;
    uint64_t v4 = -[NSSet countByEnumeratingWithState:objects:count:]( mergedPolicies,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(mergedPolicies);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 _ensureFullLocalizationDictionaryIsLoaded];
          -[NSDictionary addEntriesFromDictionary:]( self->super._localizationDictionary,  "addEntriesFromDictionary:",  [v8 localizationDictionary]);
        }

        uint64_t v5 = -[NSSet countByEnumeratingWithState:objects:count:]( mergedPolicies,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v5);
    }

    self->super._hasSetLocalizationDictionary = 1;
  }

@end