@interface _PFContextMapTable
- (_DWORD)initWithWeaksReferences:(_DWORD *)result;
- (unint64_t)getAllObjects:(unint64_t)result;
- (void)dealloc;
- (void)setForUseWithCoordinator:(void *)result;
@end

@implementation _PFContextMapTable

- (unint64_t)getAllObjects:(unint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    v4 = *(const __CFDictionary **)(result + 16);
    v5 = a2;
    if (v4)
    {
      CFIndex Count = CFDictionaryGetCount(v4);
      v5 = a2;
      if (Count)
      {
        CFIndex v7 = Count;
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 16), 0LL, a2);
        v5 = &a2[v7];
      }
    }

    if (*(void *)(v3 + 24) && *(void *)(v3 + 8))
    {
      unint64_t v8 = 0LL;
      do
      {
        uint64_t v9 = *(void *)(v3 + 24);
        v10 = *(const __CFDictionary **)(v9 + 8 * v8);
        if (v10)
        {
          CFIndex v11 = CFDictionaryGetCount(*(CFDictionaryRef *)(v9 + 8 * v8));
          if (v11)
          {
            CFIndex v12 = v11;
            CFDictionaryGetKeysAndValues(v10, 0LL, v5);
            v5 += v12;
          }
        }

        ++v8;
      }

      while (v8 < *(void *)(v3 + 8));
    }

    if (*(void *)(v3 + 32) && *(void *)(v3 + 8))
    {
      unint64_t v13 = 0LL;
      do
      {
        uint64_t v14 = *(void *)(v3 + 32);
        v15 = *(const __CFDictionary **)(v14 + 8 * v13);
        if (v15)
        {
          CFIndex v16 = CFDictionaryGetCount(*(CFDictionaryRef *)(v14 + 8 * v13));
          if (v16)
          {
            CFIndex v17 = v16;
            CFDictionaryGetKeysAndValues(v15, 0LL, v5);
            v5 += v17;
          }
        }

        ++v13;
      }

      while (v13 < *(void *)(v3 + 8));
    }

    return (unint64_t)((char *)v5 - (char *)a2) >> 3;
  }

  return result;
}

- (_DWORD)initWithWeaksReferences:(_DWORD *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)&OBJC_CLASS____PFContextMapTable;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[12] = result[12] & 0xFFFFFFFE | a2;
    }
  }

  return result;
}

- (void)setForUseWithCoordinator:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    v4 = (void *)result[7];
    if (v4) {

    }
    if (a2) {
      v5 = *(void **)(a2 + 96);
    }
    else {
      v5 = 0LL;
    }
    result = v5;
    v3[7] = result;
    if (result) {
      uint64_t v6 = result[6];
    }
    else {
      uint64_t v6 = 0LL;
    }
    v3[1] = v6;
  }

  return result;
}

- (void)dealloc
{
  if (self)
  {
    objectsByTemporaryID = self->_objectsByTemporaryID;
    if (objectsByTemporaryID)
    {
      CFRelease(objectsByTemporaryID);
      self->_objectsByTemporaryID = 0LL;
    }

    if (self->_objectsByPermanentObjectID)
    {
      unint64_t slotLimit = self->_slotLimit;
      if (slotLimit)
      {
        for (unint64_t i = 0LL; i < slotLimit; ++i)
        {
          uint64_t v6 = self->_objectsByPermanentObjectID[i];
          if (v6)
          {
            CFRelease(v6);
            unint64_t slotLimit = self->_slotLimit;
          }
        }
      }

      CFIndex v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        CFIndex v7 = malloc_default_zone();
      }
      malloc_zone_free(v7, self->_objectsByPermanentObjectID);
      self->_objectsByPermanentObjectID = 0LL;
    }

    if (self->_objectsBy64bitPKID)
    {
      unint64_t v8 = self->_slotLimit;
      if (v8)
      {
        for (unint64_t j = 0LL; j < v8; ++j)
        {
          v10 = self->_objectsBy64bitPKID[j];
          if (v10)
          {
            CFRelease(v10);
            unint64_t v8 = self->_slotLimit;
          }
        }
      }

      CFIndex v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        CFIndex v11 = malloc_default_zone();
      }
      malloc_zone_free(v11, self->_objectsBy64bitPKID);
      self->_objectsByPermanentObjectID = 0LL;
    }

    capacitiesFor64bitPKMappings = self->_capacitiesFor64bitPKMappings;
    if (capacitiesFor64bitPKMappings)
    {
      unint64_t v13 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
      {
        unint64_t v13 = malloc_default_zone();
        capacitiesFor64bitPKMappings = self->_capacitiesFor64bitPKMappings;
      }

      malloc_zone_free(v13, capacitiesFor64bitPKMappings);
      self->_capacitiesFor64bitPKMappings = 0LL;
    }

    self->_unint64_t slotLimit = 0LL;

    self->_modelMap = 0LL;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PFContextMapTable;
  -[_PFContextMapTable dealloc](&v14, sel_dealloc);
}

@end