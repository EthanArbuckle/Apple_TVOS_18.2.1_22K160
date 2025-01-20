@interface _NSCoreDataTaggedObjectIDFactory
- (_NSCoreDataTaggedObjectIDFactory)initWithPK64:(int64_t)a3;
- (_NSCoreDataTaggedObjectIDFactory)retain;
- (id)_fallbackFactory;
- (id)_storeInfo1;
- (id)managedObjectIDFromURIRepresentation:(id)a3;
- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
- (unint64_t)retainCount;
- (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4;
- (void)_storeDeallocated;
- (void)dealloc;
- (void)release;
- (void)setObjectStoreIdentifier:(id)a3;
@end

@implementation _NSCoreDataTaggedObjectIDFactory

- (id)_storeInfo1
{
  v2 = (unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex);
  v3 = (void *)atomic_load(v2);
  unint64_t v4 = atomic_load(v2 + 1);
  if (!v3 || v4 == 0) {
    return 0LL;
  }
  else {
    return (id)objc_msgSend(v3, "_storeInfoForEntityDescription:");
  }
}

- (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unint64_t v5 = (16LL * self->_taggedPoolIndex) | 0x8000000000000005LL;
  unint64_t v6 = v5 ^ *MEMORY[0x189616658];
  if ((~v6 & 0xC000000000000007LL) != 0) {
    unint64_t v5 = v6 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v6 & 7));
  }
  unint64_t __pattern8 = v5;
  memset_pattern8(a3, &__pattern8, 8LL * a4);
  return a4;
}

- (_NSCoreDataTaggedObjectIDFactory)initWithPK64:(int64_t)a3
{
  if (a3 > 0x3FFFFFFFFFFLL) {
    return (_NSCoreDataTaggedObjectIDFactory *)objc_msgSend( (id)objc_msgSend( -[_NSCoreDataTaggedObjectIDFactory _fallbackFactory]( self,  "_fallbackFactory"),  "alloc"),  "initWithPK64:",  a3);
  }
  result = (_NSCoreDataTaggedObjectIDFactory *)((a3 << 21) | (16LL * self->_taggedPoolIndex) | 0x8000000000000005LL);
  unint64_t v4 = (unint64_t)result ^ *MEMORY[0x189616658];
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (_NSCoreDataTaggedObjectIDFactory *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648]
  }
                                                                                               + (v4 & 7)));
  return result;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  __endptr = 0LL;
  unint64_t v6 = strtouq(a3, &__endptr, 0);
  id result = 0LL;
  if (__endptr) {
    BOOL v8 = __endptr == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (v6 >> 42)
    {
      return (id)objc_msgSend( (id)objc_msgSend( -[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"),  "alloc"),  "initWithPK64:",  v6);
    }

    else
    {
      id result = (id)((v6 << 21) | (16LL * self->_taggedPoolIndex) | 0x8000000000000005LL);
      unint64_t v9 = (unint64_t)result ^ *MEMORY[0x189616658];
      if ((~v9 & 0xC000000000000007LL) != 0) {
        return (id)(v9 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v9 & 7)));
      }
    }
  }

  return result;
}

- (_NSCoreDataTaggedObjectIDFactory)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  p_cd_rc = &self->_cd_rc;
  do
    int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    self->_cd_rc += 0x20000000;
    -[_NSCoreDataTaggedObjectIDFactory dealloc](self, "dealloc");
  }

- (unint64_t)retainCount
{
  return self->_cd_rc + 1LL;
}

- (void)dealloc
{
  int v3 = (unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex);
  atomic_store(0LL, v3 + 1);
  unint64_t v4 = atomic_load(v3);
  while (1)
  {
    unint64_t v5 = __ldaxr(v3);
    if (v5 != v4) {
      break;
    }
    if (!__stlxr(0LL, v3)) {
      goto LABEL_6;
    }
  }

  __clrex();
LABEL_6:

  self->_fallbackFactories = 0LL;
  _PFDeallocateObject(self);
}

- (id)_fallbackFactory
{
  id result = self->_fallbackFactories;
  if (!result)
  {
    unint64_t v4 = (void *)objc_opt_class();
    uint64_t v5 = _PFTaggedPointersPool;
    unint64_t v6 = atomic_load((unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex));
    unint64_t v7 = atomic_load((unint64_t *)(v5 + 32LL * self->_taggedPoolIndex + 8));
    id result = (id)[v4 classWithStore:v6 andEntity:v7];
    self->_fallbackFactories = result;
  }

  return result;
}

- (id)managedObjectIDFromURIRepresentation:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  unint64_t v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  unint64_t v16 = 0LL;
  uint64_t v7 = _PFTaggedPointersPool;
  unint64_t v8 = atomic_load((unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex));
  unint64_t v9 = atomic_load((unint64_t *)(v7 + 32LL * self->_taggedPoolIndex + 8));
  char v10 = [v6 characterAtIndex:0];
  v11 = (void *)[v6 substringFromIndex:1];
  if (v10 == 116)
  {
    v12 = -[NSTemporaryObjectID initWithEntity:andUUIDString:]( objc_alloc(&OBJC_CLASS___NSTemporaryObjectID),  "initWithEntity:andUUIDString:",  v9,  v11);
    -[NSTemporaryObjectID _setPersistentStore:](v12, "_setPersistentStore:", v8);
    if (v12) {
      goto LABEL_10;
    }
  }

  if (!+[_PFRoutines convertCString:toUnsignedInt64:withBase:]( (uint64_t)_PFRoutines,  (const char *)[v11 UTF8String],  &v16,  0))
  {
    v12 = 0LL;
LABEL_10:
    objc_autoreleasePoolPop(v5);
    return v12;
  }

  if (v16 >> 42)
  {
    v12 = (NSTemporaryObjectID *)objc_msgSend( (id)objc_msgSend( -[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"),  "alloc"),  "initWithPK64:",  v16);
    goto LABEL_10;
  }

  unint64_t v13 = (v16 << 21) | (16LL * self->_taggedPoolIndex) | 0x8000000000000005LL;
  unint64_t v14 = v13 ^ *MEMORY[0x189616658];
  if ((~v14 & 0xC000000000000007LL) != 0) {
    unint64_t v13 = v14 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v14 & 7));
  }
  objc_autoreleasePoolPop(v5);
  return (id)v13;
}

- (void)setObjectStoreIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex + 16);
  uint64_t v5 = (void *)atomic_load(v4);
  unint64_t v9 = v5;
  if ((objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    unint64_t v6 = (void *)[a3 copy];
    uint64_t v7 = v9;
    while (1)
    {
      unint64_t v8 = __ldaxr(v4);
    }

    __clrex();

    uint64_t v7 = v9;
LABEL_7:
  }

- (void)_storeDeallocated
{
  v2 = (unint64_t *)(_PFTaggedPointersPool + 32LL * self->_taggedPoolIndex);
  unint64_t v3 = atomic_load(v2);
  while (1)
  {
    unint64_t v4 = __ldaxr(v2);
    if (v4 != v3) {
      break;
    }
    if (!__stlxr(0LL, v2)) {
      return;
    }
  }

  __clrex();
}

@end