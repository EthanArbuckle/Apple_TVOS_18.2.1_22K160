@interface NSCachingFetchRequest
+ (id)_generateIdentifier;
- (BOOL)_isCachingFetchRequest;
- (NSCachingFetchRequest)init;
- (NSCachingFetchRequest)initWithCoder:(id)a3;
- (NSDictionary)substitutionVariables;
- (id)_cachedInfoForRequestor:(id)a3;
- (id)_copyForDirtyContext;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_cacheInfo:(id)a3 forRequestor:(id)a4;
- (void)_disableSQLStatementCaching;
- (void)dealloc;
- (void)setSubstitutionVariables:(id)a3;
@end

@implementation NSCachingFetchRequest

- (NSCachingFetchRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCachingFetchRequest;
  v2 = -[NSFetchRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_cachedInfo = CFDictionaryCreateMutable(0LL, 5LL, 0LL, MEMORY[0x189605250]);
    v3->_identifier = (id)[(id)objc_opt_class() _generateIdentifier];
    v3->_substitutionVariables = 0LL;
  }

  return v3;
}

+ (id)_generateIdentifier
{
  do
    unint64_t v2 = __ldaxr(&_generateIdentifier_tracker);
  while (__stlxr(v2 + 1, &_generateIdentifier_tracker));
  return (id)[MEMORY[0x189607968] numberWithLongLong:v2 + 1];
}

- (void)_disableSQLStatementCaching
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id cachedInfo = self->_cachedInfo;
  if (cachedInfo) {
    CFRelease(cachedInfo);
  }
  self->_id cachedInfo = 0LL;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSubstitutionVariables:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables != a3)
  {
    if (substitutionVariables)
    {
      BOOL v6 = -[NSFetchRequest _isEditable](self, "_isEditable");
      v7 = self->_substitutionVariables;
      if (!v6)
      {
        NSUInteger v8 = -[NSDictionary count](self->_substitutionVariables, "count");
        if (v8 == [a3 count])
        {
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          obj = self->_substitutionVariables;
          uint64_t v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
          if (!v9) {
            goto LABEL_35;
          }
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
          while (1)
          {
            for (uint64_t i = 0LL; i != v10; ++i)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(obj);
              }
              v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v14 = -[NSDictionary valueForKey:](self->_substitutionVariables, "valueForKey:", v13);
              uint64_t v15 = [a3 valueForKey:v13];
              if (v15)
              {
                v16 = (void *)v15;
                if ([v14 expressionType])
                {
                  v29 = (void *)MEMORY[0x189603F70];
                  uint64_t v30 = *MEMORY[0x189603A60];
                  v25 = (void *)NSString;
                  v32 = v13;
                  goto LABEL_39;
                }

                v17 = (void *)[v14 constantValue];
                v18 = (void *)[v16 constantValue];
                if ((([v17 isNSArray] & 1) != 0
                   || ([v17 isNSSet] & 1) != 0
                   || [v17 isNSOrderedSet])
                  && ([v18 isNSArray] & 1) == 0
                  && ([v18 isNSSet] & 1) == 0
                  && ([v18 isNSOrderedSet] & 1) == 0)
                {
                  v29 = (void *)MEMORY[0x189603F70];
                  uint64_t v30 = *MEMORY[0x189603A60];
                  uint64_t v31 = [NSString stringWithFormat:@"Mismatch: that which was once a collection is no longer (%@)", v13];
                  goto LABEL_40;
                }
              }

              else if ((![v13 isEqual:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"] {
                      || !-[NSFetchRequest fetchLimit](self, "fetchLimit"))
              }
                     && (![v13 isEqual:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"]
                      || !-[NSFetchRequest fetchOffset](self, "fetchOffset")))
              {
                goto LABEL_42;
              }
            }

            uint64_t v10 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
            if (!v10)
            {
LABEL_35:
              v24 = (NSDictionary *)[a3 copy];

              self->_substitutionVariables = v24;
              return;
            }
          }
        }

        v27 = (void *)MEMORY[0x189603F70];
        uint64_t v28 = *MEMORY[0x189603A60];
        for (j = @"Mismatched variables dictionaries (count)";
              ;
              j = @"Mismatched variables dictionaries (missing value)")
        {
LABEL_41:
          objc_exception_throw((id)[v27 exceptionWithName:v28 reason:j userInfo:0]);
LABEL_42:
          v27 = (void *)MEMORY[0x189603F70];
          uint64_t v28 = *MEMORY[0x189603A60];
        }
      }
    }

    else
    {
      v7 = 0LL;
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v19 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
    if (!v19) {
      goto LABEL_35;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    while (1)
    {
      for (uint64_t k = 0LL; k != v20; ++k)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v7);
        }
        v23 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", v23), "expressionType"))
        {
          v29 = (void *)MEMORY[0x189603F70];
          uint64_t v30 = *MEMORY[0x189603A60];
          v25 = (void *)NSString;
          v32 = v23;
LABEL_39:
          uint64_t v31 = [v25 stringWithFormat:@"Unsupported substitution variable type for key %@", v32];
LABEL_40:
          j = (const __CFString *)v31;
          v27 = v29;
          uint64_t v28 = v30;
          goto LABEL_41;
        }
      }

      uint64_t v20 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
      if (!v20) {
        goto LABEL_35;
      }
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSCachingFetchRequest;
  id v4 = -[NSFetchRequest copyWithZone:](&v10, sel_copyWithZone_, a3);
  uint64_t v5 = -[NSDictionary mutableCopy](self->_substitutionVariables, "mutableCopy");

  *((void *)v4 + 14) = v5;
  os_unfair_lock_lock_with_options();
  BOOL v6 = (const void *)*((void *)v4 + 15);
  id cachedInfo = (const __CFDictionary *)self->_cachedInfo;
  if (cachedInfo)
  {
    CFIndex Count = CFDictionaryGetCount(cachedInfo);
    *((void *)v4 + 15) = CFDictionaryCreateMutableCopy(0LL, Count, (CFDictionaryRef)self->_cachedInfo);
    if (v6) {
      CFRelease(v6);
    }
  }

  else if (v6)
  {
    CFRelease(*((CFTypeRef *)v4 + 15));
    *((void *)v4 + 15) = 0LL;
  }

  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

- (NSDictionary)substitutionVariables
{
  substitutionVariables = self->_substitutionVariables;
  if (substitutionVariables) {
    return (NSDictionary *)(id)-[NSDictionary copy](substitutionVariables, "copy");
  }
  else {
    return (NSDictionary *)[MEMORY[0x189603F68] dictionary];
  }
}

- (BOOL)_isCachingFetchRequest
{
  return self->_cachedInfo != 0LL;
}

- (void)dealloc
{
  id cachedInfo = self->_cachedInfo;
  if (cachedInfo) {
    CFRelease(cachedInfo);
  }
  self->_id cachedInfo = 0LL;

  self->_identifier = 0LL;
  self->_substitutionVariables = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCachingFetchRequest;
  -[NSFetchRequest dealloc](&v4, sel_dealloc);
}

- (NSCachingFetchRequest)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSCachingFetchRequest;
  objc_super v4 = -[NSFetchRequest initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    NSUInteger v8 = __39__NSCachingFetchRequest_initWithCoder___block_invoke;
    uint64_t v9 = &unk_189EA7758;
    objc_super v10 = v5;
    if (v5 && (v5[1] || v5[2]))
    {
      __39__NSCachingFetchRequest_initWithCoder___block_invoke((uint64_t)v7);
    }

    else
    {
      objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F04148));

      objc_super v4 = 0LL;
      v8((uint64_t)v7);
    }
  }

  return v4;
}

void __39__NSCachingFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)_copyForDirtyContext
{
  v3 = (id *)-[NSCachingFetchRequest copy](self, "copy");

  v3[16] = self->_identifier;
  objc_super v4 = (void *)-[NSDictionary mutableCopy](self->_substitutionVariables, "mutableCopy");
  if (![v4 objectForKey:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"])
  {
    NSUInteger v5 = -[NSFetchRequest fetchLimit](self, "fetchLimit");
    objc_msgSend( v4,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189607878],  "expressionForConstantValue:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", v5)),  @"FETCH_REQUEST_LIMIT_SUBSTITUTION");
  }

  v3[14] = v4;
  [v3 _incrementInUseCounter];
  return v3;
}

- (void)_cacheInfo:(id)a3 forRequestor:(id)a4
{
  if (self->_cachedInfo)
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    CFDictionarySetValue((CFMutableDictionaryRef)self->_cachedInfo, a4, a3);
    os_unfair_lock_unlock(p_lock);
    -[NSFetchRequest _incrementInUseCounter](self, "_incrementInUseCounter");
  }

- (id)_cachedInfoForRequestor:(id)a3
{
  if (self->_cachedInfo)
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    BOOL v6 = (id)CFDictionaryGetValue((CFDictionaryRef)self->_cachedInfo, a3);
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

- (id)_identifier
{
  return self->_identifier;
}

@end