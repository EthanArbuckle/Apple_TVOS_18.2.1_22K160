@interface NSClassicHashTable
- (BOOL)isEqual:(id)a3;
- (id)allObjects;
- (id)copy;
- (id)description;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)getItem:(const void *)a3;
- (void)getKeys:(const void *)a3 count:(unint64_t *)a4;
- (void)insertItem:(const void *)a3;
- (void)insertKnownAbsentItem:(const void *)a3;
- (void)removeAllItems;
- (void)removeItem:(const void *)a3;
@end

@implementation NSClassicHashTable

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFRelease(self->_ht);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSClassicHashTable;
  -[NSClassicHashTable dealloc](&v3, sel_dealloc);
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
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      return CFBasicHashesAreEqual(self->_ht, *((void **)a3 + 6)) != 0;
    }
  }

  return 0;
}

- (id)copy
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __int128 v4 = *(_OWORD *)&self->_callBacks.retain;
  *(_OWORD *)&callBacks.hash = *(_OWORD *)&self->_callBacks.hash;
  *(_OWORD *)&callBacks.retain = v4;
  callBacks.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))self->_callBacks.describe;
  uint64_t v5 = NSCreateHashTableWithZone(&callBacks, (NSUInteger)a2, v2);
  ht = self->_ht;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __26__NSClassicHashTable_copy__block_invoke;
  v8[3] = &unk_189C9B0A0;
  v8[4] = v5;
  CFBasicHashApply(ht, (uint64_t)v8);
  return v5;
}

uint64_t __26__NSClassicHashTable_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

- (void)getItem:(const void *)a3
{
  v4[7] = *MEMORY[0x1895F89C0];
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v4);
  if (v4[5]) {
    return (void *)v4[3];
  }
  else {
    return 0LL;
  }
}

- (void)insertItem:(const void *)a3
{
  if (a3)
  {
    CFBasicHashSetValue((uint64_t)self->_ht, (unint64_t)a3);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSHashInsert(): attempt to insert NULL pointer" userInfo:0]);
    -[NSClassicHashTable addObject:](v3, v4, v5);
  }

- (void)addObject:(id)a3
{
  if (a3)
  {
    CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a3);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer" userInfo:0]);
    -[NSClassicHashTable insertKnownAbsentItem:](v3, v4, v5);
  }

- (void)insertKnownAbsentItem:(const void *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    id v5 = (void *)MEMORY[0x189603F70];
    uint64_t v6 = *MEMORY[0x189603A60];
    v7 = (NSString *)@"*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer";
    goto LABEL_6;
  }

  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v8);
  if (v9)
  {
    v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** NSHashInsertKnownAbsent(): item %p already in table",  a3);
    id v5 = (void *)MEMORY[0x189603F70];
    uint64_t v6 = *MEMORY[0x189603A60];
LABEL_6:
    objc_exception_throw((id)[v5 exceptionWithName:v6 reason:v7 userInfo:0]);
  }

  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a3);
}

- (void)removeItem:(const void *)a3
{
  if (a3)
  {
    CFBasicHashRemoveValue((uint64_t)self->_ht, (unint64_t)a3);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"*** NSHashRemove(): attempt to remove NULL pointer" userInfo:0]);
    -[NSClassicHashTable count](v3, v4);
  }

- (unint64_t)count
{
  return CFBasicHashGetCount(self->_ht);
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!CFBasicHashGetCount(self->_ht)) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<NSHashTable: %p> {}",  self);
  }
  id v3 = (id)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:CFBasicHashGetCount(self->_ht) << 6];
  objc_msgSend(v3, "appendFormat:", @"<NSHashTable: %p> ("), self;
  describe = self->_callBacks.describe;
  v8[0] = self;
  v8[1] = describe;
  v8[2] = v3;
  char v9 = 1;
  ht = self->_ht;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __33__NSClassicHashTable_description__block_invoke;
  v7[3] = &__block_descriptor_40_e18_C64__0___qQQQQQQ_8l;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  [v3 appendString:@""]);
  return v3;
}

uint64_t __33__NSClassicHashTable_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24)) {
    objc_msgSend(*(id *)(v3 + 16), "appendString:", @", ");
  }
  SEL v4 = *(uint64_t (**)(void, uint64_t))(v3 + 8);
  id v5 = *(void **)(v3 + 16);
  if (v4) {
    objc_msgSend(v5, "appendString:", v4(*(void *)v3, v2));
  }
  else {
    objc_msgSend(v5, "appendFormat:", @"%p", v2);
  }
  *(_BYTE *)(v3 + 24) = 0;
  return 1LL;
}

- (id)allObjects
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
  v15[2] = __32__NSClassicHashTable_allObjects__block_invoke;
  v15[3] = &unk_189C9B1B0;
  v15[4] = v16;
  CFBasicHashApply(ht, (uint64_t)v15);
  if (v5)
  {
    if (v4)
    {
      v7 = (id *)v5;
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

uint64_t __32__NSClassicHashTable_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1LL;
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  v8[4] = *MEMORY[0x1895F89C0];
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  ht = self->_ht;
  void v8[3] = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSClassicHashTable_getKeys_count___block_invoke;
  v7[3] = &unk_189C9B1B0;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  if (a4) {
    *a4 = CFBasicHashGetCount(self->_ht);
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __36__NSClassicHashTable_getKeys_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *unint64_t v4 = v2;
  return 1LL;
}

@end