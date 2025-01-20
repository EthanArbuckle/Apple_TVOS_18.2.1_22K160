@interface NSClassicMapTable
- (BOOL)isEqual:(id)a3;
- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5;
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4;
- (void)dealloc;
- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)removeAllItems;
- (void)removeObjectForKey:(id)a3;
- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSClassicMapTable

- (id)objectForKey:(id)a3
{
  v4[7] = *MEMORY[0x1895F89C0];
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v4);
  if (v4[5]) {
    return (id)v4[3];
  }
  else {
    return 0LL;
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (self->_keyCallBacks.notAKeyMarker == a4)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSMapInsert(): attempt to insert notAKeyMarker" userInfo:0]);
  }

  else
  {
    ht = self->_ht;
    id v5 = a4;
  }

  CFBasicHashSetValue((uint64_t)ht, (unint64_t)v5);
}

- (void)removeObjectForKey:(id)a3
{
  if (self->_keyCallBacks.notAKeyMarker == a3)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSMapRemove(): attempt to remove notAKeyMarker" userInfo:0]);
  }

  else
  {
    ht = self->_ht;
    id v4 = a3;
  }

  CFBasicHashRemoveValue((uint64_t)ht, (unint64_t)v4);
}

- (unint64_t)count
{
  return CFBasicHashGetCount(self->_ht);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFRelease(self->_ht);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSClassicMapTable;
  -[NSClassicMapTable dealloc](&v3, sel_dealloc);
}

- (void)removeAllItems
{
  ht = self->_ht;
  if ((*((_BYTE *)ht + 18) & 0x3F) != 0) {
    __CFBasicHashDrain((uint64_t)ht, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class() && CFBasicHashesAreEqual(self->_ht, *((void **)a3 + 10)) != 0;
}

- (id)copy
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v5 = *(_OWORD *)&self->_keyCallBacks.retain;
  *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&self->_keyCallBacks.hash;
  *(_OWORD *)&keyCallBacks.retain = v5;
  *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&self->_keyCallBacks.describe;
  NSMapTableValueCallBacks valueCallBacks = (NSMapTableValueCallBacks)self->_valueCallBacks;
  v6 = NSCreateMapTableWithZone(&keyCallBacks, &valueCallBacks, v2, v3);
  ht = self->_ht;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __25__NSClassicMapTable_copy__block_invoke;
  v9[3] = &unk_189C9B0A0;
  v9[4] = v6;
  CFBasicHashApply(ht, (uint64_t)v9);
  return v6;
}

uint64_t __25__NSClassicMapTable_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v9);
  uint64_t v7 = v10;
  if (v10)
  {
    if (a5) {
      *a5 = (const void *)v9[3];
    }
    if (a4) {
      *a4 = (const void *)v9[1];
    }
  }

  return v7 != 0;
}

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self->_keyCallBacks.notAKeyMarker == a4)
  {
    v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
    v8 = (NSString *)@"*** NSMapInsertKnownAbsent(): attempt to insert notAKeyMarker";
    goto LABEL_6;
  }

  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a4, (uint64_t)v9);
  if (v10)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** NSMapInsertKnownAbsent(): key %p already in table",  a4);
    v6 = (void *)MEMORY[0x189603F70];
    uint64_t v7 = *MEMORY[0x189603A60];
LABEL_6:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }

  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a4);
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (self->_keyCallBacks.notAKeyMarker == a4) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSMapInsertIfAbsent(): attempt to insert notAKeyMarker" userInfo:0]);
  }
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a4, (uint64_t)v7);
  if (v7[5]) {
    return (void *)v7[3];
  }
  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a4);
  return 0LL;
}

- (id)description
{
  v8[8] = *MEMORY[0x1895F89C0];
  if (!CFBasicHashGetCount(self->_ht)) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<NSMapTable: %p> {}",  self);
  }
  id v3 = (id)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:CFBasicHashGetCount(self->_ht) << 6];
  objc_msgSend(v3, "appendFormat:", @"<NSMapTable: %p> {", self);
  describe = self->_keyCallBacks.describe;
  __int128 v5 = self->_valueCallBacks.describe;
  ht = self->_ht;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __32__NSClassicMapTable_description__block_invoke;
  v8[3] = &__block_descriptor_64_e18_C64__0___qQQQQQQ_8ls32l8s56l8;
  v8[4] = self;
  v8[5] = describe;
  v8[6] = v5;
  v8[7] = v3;
  CFBasicHashApply(ht, (uint64_t)v8);
  [v3 appendString:@"}"];
  return v3;
}

uint64_t __32__NSClassicMapTable_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  v6 = *(uint64_t (**)(void, uint64_t))(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 56);
  if (v6) {
    objc_msgSend(v7, "appendString:", v6(*(void *)(a1 + 32), v4));
  }
  else {
    objc_msgSend(v7, "appendFormat:", @"%p", v4);
  }
  [*(id *)(a1 + 56) appendString:@" = "];
  v8 = *(uint64_t (**)(void, uint64_t))(a1 + 48);
  v9 = *(void **)(a1 + 56);
  if (v8) {
    objc_msgSend(v9, "appendString:", v8(*(void *)(a1 + 32), v5));
  }
  else {
    objc_msgSend(v9, "appendFormat:", @"%p", v5);
  }
  [*(id *)(a1 + 56) appendString:@";\n"];
  return 1LL;
}

- (id)allKeys
{
  v16[5] = *MEMORY[0x1895F89C0];
  unint64_t Count = CFBasicHashGetCount(self->_ht);
  unint64_t v4 = Count;
  if (Count >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
    v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }

  uint64_t v5 = _CFCreateArrayStorage();
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  ht = self->_ht;
  v16[3] = v5;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __28__NSClassicMapTable_allKeys__block_invoke;
  v15[3] = &unk_189C9B1B0;
  v15[4] = v16;
  CFBasicHashApply(ht, (uint64_t)v15);
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = (id *)v5;
      unint64_t v8 = v4;
      do
      {
        id v9 = *v7++;
        --v8;
      }

      while (v8);
    }

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v5 count:v4 size:v4];
  }

  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v4];
  }

  id v11 = v10;
  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __28__NSClassicMapTable_allKeys__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1LL;
}

- (id)allValues
{
  v16[5] = *MEMORY[0x1895F89C0];
  unint64_t Count = CFBasicHashGetCount(self->_ht);
  unint64_t v4 = Count;
  if (Count >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
    v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }

  uint64_t v5 = _CFCreateArrayStorage();
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x2020000000LL;
  ht = self->_ht;
  v16[3] = v5;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __30__NSClassicMapTable_allValues__block_invoke;
  v15[3] = &unk_189C9B1B0;
  v15[4] = v16;
  CFBasicHashApply(ht, (uint64_t)v15);
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = (id *)v5;
      unint64_t v8 = v4;
      do
      {
        id v9 = *v7++;
        --v8;
      }

      while (v8);
    }

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v5 count:v4 size:v4];
  }

  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v4];
  }

  id v11 = v10;
  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __30__NSClassicMapTable_allValues__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1LL;
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  v10[4] = *MEMORY[0x1895F89C0];
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x2020000000LL;
  v10[3] = a3;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = a4;
  ht = self->_ht;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __36__NSClassicMapTable_getKeys_values___block_invoke;
  v8[3] = &unk_189C9ECA8;
  v8[4] = v10;
  v8[5] = v9;
  CFBasicHashApply(ht, (uint64_t)v8);
  unint64_t Count = CFBasicHashGetCount(self->_ht);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  return Count;
}

uint64_t __36__NSClassicMapTable_getKeys_values___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7 + 1;
  *uint64_t v7 = v5;
  return 1LL;
}

@end