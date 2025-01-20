@interface NSSQLEntity_DerivedAttributesExtension
- (NSSQLEntity_DerivedAttributesExtension)initWithEntity:(id)a3;
- (id)entity;
- (uint64_t)addDerivationKeypath:(void *)key forAttribute:;
- (void)_generateTriggerSQL;
- (void)dealloc;
@end

@implementation NSSQLEntity_DerivedAttributesExtension

- (NSSQLEntity_DerivedAttributesExtension)initWithEntity:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSQLEntity_DerivedAttributesExtension;
  v4 = -[NSSQLEntity_DerivedAttributesExtension init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_entity = (NSSQLEntity *)a3;
    memset(&v7, 0, 24);
    *(_OWORD *)&v7.copyDescription = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
    v7.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
    v4->_derivedAttributes = CFDictionaryCreateMutable(0LL, 0LL, &v7, MEMORY[0x189605250]);
  }

  return v5;
}

- (void)dealloc
{
  derivedAttributes = self->_derivedAttributes;
  if (derivedAttributes) {
    CFRelease(derivedAttributes);
  }

  self->_triggerSQL = 0LL;
  self->_migrationSQL = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLEntity_DerivedAttributesExtension;
  -[NSSQLEntity_DerivedAttributesExtension dealloc](&v4, sel_dealloc);
}

- (id)entity
{
  return self->_entity;
}

- (uint64_t)addDerivationKeypath:(void *)key forAttribute:
{
  if (result)
  {
    uint64_t v5 = result;
    id Value = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), key);
    if (!Value)
    {
      id Value = objc_alloc_init(MEMORY[0x189603FE0]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 16), key, Value);
    }

    result = [a2 count];
    if (result) {
      return [Value addObject:a2];
    }
  }

  return result;
}

- (void)_generateTriggerSQL
{
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
      *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(a1 + 32) = objc_alloc_init(MEMORY[0x189603FC8]);
      id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 32) setValue:v3 forKey:@"dropStatements"];

      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 32) setValue:v4 forKey:@"dataStatements"];

      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
      [*(id *)(a1 + 32) setValue:v5 forKey:@"triggerCreationStatements"];

      v6 = *(void **)(a1 + 16);
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke;
      v7[3] = &unk_189EAAE10;
      v7[4] = a1;
      [v6 enumerateKeysAndObjectsUsingBlock:v7];
      [v2 drain];
    }
  }

@end