@interface _LSPlistHint
- (id)cachedValueForKey:(uint64_t)a1;
- (id)completeDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (uint64_t)setCachedValue:(uint64_t)a3 forKey:;
- (void)initWithKeys:(char)a3 compacted:;
- (void)setCompleteDictionary:(uint64_t)a1;
@end

@implementation _LSPlistHint

- (void)initWithKeys:(char)a3 compacted:
{
  if (!a1) {
    return 0LL;
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_CLASS____LSPlistHint;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [a2 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = (void *)v5[2];
    v5[2] = 0LL;

    *((_BYTE *)v5 + 24) = 0;
    *((_BYTE *)v5 + 25) = a3;
  }

  return v5;
}

- (id)completeDictionary
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24)) {
      return *(id *)(a1 + 16);
    }
    a1 = 0LL;
  }

  return (id)a1;
}

- (id)cachedValueForKey:(uint64_t)a1
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24)) {
      return 0LL;
    }
    a1 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
  }

  return (id)a1;
}

- (uint64_t)setCachedValue:(uint64_t)a3 forKey:
{
  if (result)
  {
    if (a3)
    {
      uint64_t v4 = result;
      if (!*(_BYTE *)(result + 24))
      {
        uint64_t v6 = *(void **)(result + 16);
        if (!v6)
        {
          id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
          v8 = *(void **)(v4 + 16);
          *(void *)(v4 + 16) = v7;

          uint64_t v6 = *(void **)(v4 + 16);
        }

        return [v6 setObject:a2 forKeyedSubscript:a3];
      }
    }
  }

  return result;
}

- (void)setCompleteDictionary:(uint64_t)a1
{
  if (a1 && a2 && !*(_BYTE *)(a1 + 24))
  {
    uint64_t v3 = [a2 copy];
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v3;

    *(_BYTE *)(a1 + 24) = 1;
  }

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = -[NSSet copy](self->_keys, "copy");
    uint64_t v6 = (void *)v4[1];
    v4[1] = v5;

    cachedValues = self->_cachedValues;
    if (self->_cachedValuesAreComplete) {
      uint64_t v8 = -[NSDictionary copy](cachedValues, "copy");
    }
    else {
      uint64_t v8 = -[NSDictionary mutableCopy](cachedValues, "mutableCopy");
    }
    v9 = (void *)v4[2];
    v4[2] = v8;

    *((_BYTE *)v4 + 24) = self->_cachedValuesAreComplete;
    *((_BYTE *)v4 + 25) = self->_keysAreCompacted;
  }

  return v4;
}

- (id)debugDescription
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end