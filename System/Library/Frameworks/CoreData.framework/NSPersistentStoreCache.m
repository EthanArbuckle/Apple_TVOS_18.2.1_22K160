@interface NSPersistentStoreCache
+ (void)initialize;
- (NSPersistentStoreCache)init;
- (NSPersistentStoreCache)initWithValueCallbacks:(void *)a3 preserveToManyRelationships:(BOOL)a4;
- (os_unfair_lock_s)ancillaryOrderKeysForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (os_unfair_lock_s)rowForObjectID:(double)a3 afterTimestamp:;
- (os_unfair_lock_s)toManyForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (uint64_t)_createExternalDataDictWithValueCallbacks:(uint64_t)result;
- (uint64_t)toManyInformationForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:;
- (void)_registerRow:(void *)key forObjectID:(char)a4 options:;
- (void)_registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)key options:(void *)a5 andTimestamp:(double)a6;
- (void)dealloc;
- (void)decrementRefCountForObjectID:(uint64_t)a1;
- (void)forgetAllExternalData;
- (void)forgetRowForObjectID:(uint64_t)a1;
- (void)incrementRefCountForObjectID:(uint64_t)a1;
- (void)registerRow:(void *)a3 forObjectID:(char)a4 options:;
- (void)registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)a4 options:(void *)a5 andTimestamp:(double)a6;
@end

@implementation NSPersistentStoreCache

- (uint64_t)toManyInformationForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (!a1) {
    return 0LL;
  }
  v8 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_lock_with_options();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
  if (!Value) {
    goto LABEL_8;
  }
  v10 = Value;
  if (!v10[3])
  {
    -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
    goto LABEL_8;
  }

  uint64_t v11 = *(void *)(v10[3] + 24LL * (void)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
  uint64_t v12 = -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
  if (!v11)
  {
LABEL_8:
    uint64_t v13 = 0LL;
    goto LABEL_9;
  }

  uint64_t v13 = objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", v11, v12, 0);
LABEL_9:
  os_unfair_lock_unlock(v8);
  return v13;
}

- (void)registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)a4 options:(void *)a5 andTimestamp:(double)a6
{
  if (a1)
  {
    uint64_t v12 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:]( a1,  a2,  a3,  a4,  a5,  a6);
    os_unfair_lock_unlock(v12);
  }

- (void)_registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)key options:(void *)a5 andTimestamp:(double)a6
{
  if (a1)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](Value, a2, a5, a6);
    if (a3) {
      -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](Value, a3, a5);
    }
  }

- (os_unfair_lock_s)rowForObjectID:(double)a3 afterTimestamp:
{
  if (result)
  {
    v5 = result;
    v6 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = (double *)CFDictionaryGetValue(*(CFDictionaryRef *)&v5[2]._os_unfair_lock_opaque, a2);
    if (Value && (v8 = Value, Value[4] > a3))
    {
      v9 = Value;
      [v8 knownKeyValuesPointer];
    }

    else
    {
      v8 = 0LL;
    }

    os_unfair_lock_unlock(v6);
    return (os_unfair_lock_s *)v8;
  }

  return result;
}

- (void)registerRow:(void *)a3 forObjectID:(char)a4 options:
{
  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerRow:forObjectID:options:](a1, a2, a3, a4);
    os_unfair_lock_unlock(v8);
  }

- (void)_registerRow:(void *)key forObjectID:(char)a4 options:
{
  if (a1)
  {
    Value = (unsigned int *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    if (Value != a2)
    {
      uint64_t v9 = (uint64_t)Value;
      if (Value)
      {
        v10 = Value + 3;
        do
          unsigned int v11 = __ldaxr(v10);
        while (__stlxr(v11, v10));
        if (a2)
        {
          uint64_t v12 = a2 + 3;
          do
            unsigned int v13 = __ldxr(v12);
          while (__stxr(v13 + v11, v12));
        }

        if ((a4 & 4) == 0 && (*(_BYTE *)(a1 + 32) & 1) != 0)
        {
          uint64_t v14 = [Value version];
          if (v14 == [a2 version]) {
            -[NSPersistentCacheRow copyRelationshipCachesFrom:](a2, v9);
          }
        }
      }

      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), key, a2);
    }
  }

- (void)incrementRefCountForObjectID:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value)
    {
      v6 = (unsigned int *)(Value + 12);
      do
        unsigned int v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }

    os_unfair_lock_unlock(v4);
  }

- (void)decrementRefCountForObjectID:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value)
    {
      v6 = (unsigned int *)(Value + 12);
      do
      {
        unsigned int v7 = __ldxr(v6);
        BOOL v8 = __OFSUB__(v7, 1);
        signed int v9 = v7 - 1;
      }

      while (__stxr(v9, v6));
      if ((v9 < 0) ^ v8 | (v9 == 0)) {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
      }
    }

    os_unfair_lock_unlock(v4);
  }

+ (void)initialize
{
}

- (uint64_t)_createExternalDataDictWithValueCallbacks:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v4.version = 0LL;
    v4.retain = (CFDictionaryRetainCallBack)_PFfastOidRetain;
    v3 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605240] + 24LL);
    v4.release = (CFDictionaryReleaseCallBack)_PFfastOidRelease;
    v4.copyDescription = v3;
    v4.equal = (CFDictionaryEqualCallBack)_PFObjectIDFastEquals64;
    v4.hash = (CFDictionaryHashCallBack)_PFObjectIDFastHash64;
    *(void *)(result + 8) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v4, valueCallBacks);
    result = _CFDictionarySetCapacity();
    *(void *)(v2 + 16) = 32LL;
  }

  return result;
}

- (NSPersistentStoreCache)initWithValueCallbacks:(void *)a3 preserveToManyRelationships:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSPersistentStoreCache;
  v6 = -[NSPersistentStoreCache init](&v11, sel_init);
  unsigned int v7 = v6;
  if (v6)
  {
    v6->_persistentStoreCacheFlags = (persistentStoreCacheFlags)(*(_DWORD *)&v6->_persistentStoreCacheFlags & 0xFFFFFFFE | v4);
    BOOL v8 = ($BA245B817A3E003E9697A149A0B100CB *)malloc(0x28uLL);
    v7->_externalDataValueCallbacks = v8;
    __int128 v9 = *((_OWORD *)a3 + 1);
    *(_OWORD *)&v8->var0 = *(_OWORD *)a3;
    *(_OWORD *)&v8->var2 = v9;
    v8->var4 = (void *)*((void *)a3 + 4);
    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:]((uint64_t)v7, (CFDictionaryValueCallBacks *)v8);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSPersistentStoreCache)init
{
  return -[NSPersistentStoreCache initWithValueCallbacks:preserveToManyRelationships:]( self,  "initWithValueCallbacks:preserveToManyRelationships:",  MEMORY[0x189605250],  0LL);
}

- (void)dealloc
{
  id externalData = self->_externalData;
  if (externalData)
  {
    CFRelease(externalData);
    self->_id externalData = 0LL;
  }

  externalDataValueCallbacks = self->_externalDataValueCallbacks;
  if (externalDataValueCallbacks) {
    free(externalDataValueCallbacks);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSPersistentStoreCache;
  -[NSPersistentStoreCache dealloc](&v5, sel_dealloc);
}

- (void)forgetAllExternalData
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();

    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:](a1, *(CFDictionaryValueCallBacks **)(a1 + 24));
    os_unfair_lock_unlock(v2);
  }

- (os_unfair_lock_s)toManyForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (result)
  {
    unsigned int v7 = result;
    BOOL v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    if (Value && (v10 = Value, -[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) > a4))
    {
      objc_super v11 = (void *)v10[3];
      if (v11) {
        objc_super v11 = *(void **)(v10[3] + 24LL * (void)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
      }
      id v12 = v11;
    }

    else
    {
      id v12 = 0LL;
    }

    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v12;
  }

  return result;
}

- (os_unfair_lock_s)ancillaryOrderKeysForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  if (result)
  {
    unsigned int v7 = result;
    BOOL v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    else {
      id v11 = 0LL;
    }
    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v11;
  }

  return result;
}

- (void)forgetRowForObjectID:(uint64_t)a1
{
  if (a1)
  {
    BOOL v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    os_unfair_lock_unlock(v4);
  }

@end