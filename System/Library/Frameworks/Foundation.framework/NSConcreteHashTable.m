@interface NSConcreteHashTable
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSConcreteHashTable)init;
- (NSConcreteHashTable)initWithCoder:(id)a3;
- (NSConcreteHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4;
- (NSConcreteHashTable)initWithPointerFunctions:(id)a3 capacity:(unint64_t)a4;
- (id)allObjects;
- (id)copy;
- (id)description;
- (id)objectEnumerator;
- (id)pointerFunctions;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)rehashAround:(unint64_t)a3;
- (void)addObject:(id)a3;
- (void)assign:(unint64_t)a3 key:(const void *)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getItem:(const void *)a3;
- (void)getKeys:(const void *)a3 count:(unint64_t *)a4;
- (void)hashGrow;
- (void)insertItem:(const void *)a3;
- (void)insertKnownAbsentItem:(const void *)a3;
- (void)raiseCountUnderflowException;
- (void)rehash;
- (void)removeAllItems;
- (void)removeItem:(const void *)a3;
@end

@implementation NSConcreteHashTable

- (NSConcreteHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4
{
  *(void *)self->options = *(void *)self->options & 0x8000000000000000LL | a3 & 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
  {
    if ((a4 & (a4 - 1)) != 0)
    {
      char v6 = -1;
      do
      {
        ++v6;
        BOOL v7 = a4 > 1;
        a4 >>= 1;
      }

      while (v7);
      a4 = 2 << v6;
    }
  }

  else
  {
    a4 = 4LL;
  }

  self->capacity = a4;
  self->count = 0LL;
  self->mutations = 0LL;
  if (+[NSConcretePointerFunctions initializeSlice:withOptions:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeSlice:withOptions:",  &self->slice,  *(void *)self->options & 0x7FFFFFFFFFFFFFFFLL))
  {
    +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:",  &self->slice,  1LL,  *((unsigned __int8 *)self->slice.acquisitionProps + 3),  0LL);
    allocateInitialCapacity((uint64_t *)&self->slice, self->capacity);
    return self;
  }

  else
  {
    v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSHashTable %@] Requested configuration not supported.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v9 userInfo:0]);
    return (NSConcreteHashTable *)+[NSConcretePointerFunctions initializeSlice:withOptions:](v10, v11, v12, v13);
  }

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  p_slice = &self->slice;
  internalProps = self->slice.internalProps;
  if (internalProps)
  {
    unint64_t capacity = self->capacity;
    if (*((void *)internalProps + 3) && *((void *)internalProps + 6))
    {
      empty((uint64_t)&self->slice, capacity);
      internalProps = p_slice->internalProps;
    }

    char v6 = (void (*)(void **, unint64_t))*((void *)internalProps + 2);
    if (v6) {
      v6(p_slice->items, capacity);
    }
    p_slice->items = 0LL;
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSConcreteHashTable;
  -[NSConcreteHashTable dealloc](&v7, sel_dealloc);
}

- (void)addObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    char v7 = 0;
    uint64_t v5 = hashProbe(self, (uint64_t)a3, 0LL, &v7, 1);
    if (!v7)
    {
      -[NSConcreteHashTable assign:key:](self, "assign:key:", v5, a3);
      unint64_t v6 = self->count + 1;
      self->count = v6;
      if (self->capacity < 2 * v6) {
        -[NSConcreteHashTable hashGrow](self, "hashGrow");
      }
    }
  }

- (void)assign:(unint64_t)a3 key:(const void *)a4
{
  p_slice = &self->slice;
  acquisitionProps = self->slice.acquisitionProps;
  char v7 = (uint64_t (*)(const void *, void, void))*((void *)acquisitionProps + 1);
  if (v7) {
    a4 = (const void *)v7(a4, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
  }
  (*((void (**)(void **, unint64_t, const void *))p_slice->internalProps + 7))(p_slice->items, a3, a4);
}

- (unint64_t)count
{
  return self->count;
}

- (void)removeItem:(const void *)a3
{
  v7[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v7[0] = 0LL;
    uint64_t v4 = hashProbe(self, (uint64_t)a3, v7, 0LL, 1);
    if (v7[0])
    {
      uint64_t v5 = (void (*)(void))*((void *)self->slice.acquisitionProps + 2);
      if (v5) {
        v5();
      }
      (*((void (**)(void **))self->slice.internalProps + 6))(&self->slice.items[v4]);
      unint64_t count = self->count;
      if (count) {
        self->unint64_t count = count - 1;
      }
      else {
        -[NSConcreteHashTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
      }
      ++self->mutations;
      -[NSConcreteHashTable rehashAround:](self, "rehashAround:", v4);
    }
  }

- (unint64_t)rehashAround:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  p_slice = &self->slice;
  unint64_t capacity = self->capacity;
  unint64_t v7 = a3;
  do
    unint64_t v7 = (v7 - 1) & (capacity - 1);
  while (self->slice.items[v7] != (void *)*((unsigned __int8 *)self->slice.internalProps + 3));
  while (1)
  {
    unint64_t v8 = capacity - 1;
    do
      unint64_t v7 = (v7 + 1) & v8;
    while (v7 == a3);
    uint64_t v9 = (*((uint64_t (**)(void **, char *))p_slice->internalProps + 3))(&p_slice->items[v7], &v14);
    if (v9)
    {
      uint64_t v10 = v9;
      (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
      uint64_t v11 = hashProbe(self, v10, 0LL, 0LL, 0);
      (*((void (**)(void **, uint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v11, v10);
      (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
      goto LABEL_11;
    }

    if (v14) {
      return v7;
    }
    (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
    unint64_t count = self->count;
    if (count) {
      self->unint64_t count = count - 1;
    }
    else {
      -[NSConcreteHashTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
    }
LABEL_11:
    unint64_t capacity = self->capacity;
  }

- (id)allObjects
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v4 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }

      while (v5 != v7);
      unint64_t v5 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  p_mutations = &self->mutations;
  a3->var2 = &self->mutations;
  if (a3->var0)
  {
    if (a3->var3[1] == *p_mutations) {
      (*((void (**)(id, SEL))self->slice.internalProps + 4))(*a3->var1, a2);
    }
    else {
      objc_enumerationMutation(self);
    }
  }

  else
  {
    a3->var3[1] = *p_mutations;
  }

  unint64_t var0 = a3->var0;
  while (var0 < self->capacity)
  {
    uint64_t v9 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[var0], 0LL);
    unint64_t var0 = a3->var0 + 1;
    a3->unint64_t var0 = var0;
    if (v9)
    {
      a3->var3[0] = v9;
      a3->var1 = (id *)a3->var3;
      return 1LL;
    }
  }

  return 0LL;
}

- (void)getItem:(const void *)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  v4[0] = 0LL;
  hashProbe(self, (uint64_t)a3, v4, 0LL, 0);
  return (void *)v4[0];
}

- (void)hashGrow
{
  p_slice = &self->slice;
  unint64_t capacity = self->capacity;
  items = self->slice.items;
  self->unint64_t capacity = 2 * capacity;
  uint64_t v6 = (*((uint64_t (**)(void))self->slice.internalProps + 1))();
  p_slice->items = (void **)v6;
  if (v6)
  {
    self->unint64_t count = 0LL;
    if (capacity)
    {
      uint64_t v7 = items;
      unint64_t v8 = capacity;
      do
      {
        uint64_t v9 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(v7, 0LL);
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = hashProbe(self, v9, 0LL, 0LL, 0);
          (*((void (**)(void **, uint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v11, v10);
          (*((void (**)(void **))p_slice->internalProps + 6))(v7);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
          ++self->count;
        }

        ++v7;
        --v8;
      }

      while (v8);
    }

    (*((void (**)(void **, unint64_t))p_slice->internalProps + 2))(items, capacity);
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"*** NSHashTable unable to allocate memory -- allocation function failed" userInfo:0]);
    freeWeakStorage(v12);
  }

- (NSConcreteHashTable)init
{
  return -[NSConcreteHashTable initWithOptions:capacity:](self, "initWithOptions:capacity:", 0LL, 16LL);
}

- (id)copy
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = objc_alloc(&OBJC_CLASS___NSConcreteHashTable);
  unint64_t v4 = v3;
  v3->unint64_t capacity = self->capacity;
  v3->unint64_t count = 0LL;
  *(void *)v3->options = *(void *)v3->options & 0x8000000000000000LL | *(void *)self->options & 0x7FFFFFFFFFFFFFFFLL;
  v3->mutations = 0LL;
  p_slice = (uint64_t *)&v3->slice;
  uint64_t v6 = &self->slice;
  if ((char)self->options[7] < 0)
  {
    NSSliceInitWithSlice(&v3->slice.items, v6);
    v4->options[7] |= 0x80u;
  }

  else
  {
    __int128 v7 = *(_OWORD *)&self->slice.personalityProps;
    *(_OWORD *)p_slice = *(_OWORD *)&v6->items;
    *(_OWORD *)&v3->slice.personalityProps = v7;
  }

  allocateInitialCapacity(p_slice, self->capacity);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v8 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(self);
        }
        -[NSConcreteHashTable insertItem:](v4, "insertItem:", *(void *)(*((void *)&v14 + 1) + 8 * v11++));
      }

      while (v9 != v11);
      unint64_t v9 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    }

    while (v9);
  }

  return v4;
}

- (NSConcreteHashTable)initWithPointerFunctions:(id)a3 capacity:(unint64_t)a4
{
  if (a3)
  {
    NSSliceInitWithSlice(&self->slice.items, (void *)a3 + 1);
    self->options[7] |= 0x80u;
    if (a4)
    {
      if ((a4 & (a4 - 1)) != 0)
      {
        char v6 = -1;
        do
        {
          ++v6;
          BOOL v7 = a4 > 1;
          a4 >>= 1;
        }

        while (v7);
        a4 = 2 << v6;
      }
    }

    else
    {
      a4 = 4LL;
    }

    self->unint64_t capacity = a4;
    self->unint64_t count = 0LL;
    self->mutations = 0LL;
    *(void *)self->options |= 0x7FFFFFFFFFFFFFFFuLL;
    +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:",  &self->slice,  1LL,  *((unsigned __int8 *)self->slice.acquisitionProps + 3),  self->options[7] >> 7);
    allocateInitialCapacity((uint64_t *)&self->slice, self->capacity);
    return self;
  }

  else
  {
    unint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSPointerArray %@] Functions cannot be NULL.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v9 userInfo:0]);
    return (NSConcreteHashTable *)+[NSConcreteHashTable supportsSecureCoding](v10, v11);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcreteHashTable)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 containsValueForKey:@"NS.count"])
  {
    uint64_t v5 = [a3 decodeInt64ForKey:@"NS.count"];
    if (v5 < 0)
    {

      objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"NSHashTable archive contains negative count"));
      return 0LL;
    }

    uint64_t v6 = v5;
    char v7 = 1;
  }

  else
  {
    uint64_t v6 = 0LL;
    char v7 = 0;
  }

  unsigned int v15 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v15 size:4];
  uint64_t v8 = (int)v15;
  if ((_NSPointerFunctionCoding_isValidOptions(v15) & 1) == 0)
  {

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Decoded unsupported NSHashTable options %x",  v15));
    return 0LL;
  }

  unint64_t v9 = -[NSConcreteHashTable initWithOptions:capacity:](self, "initWithOptions:capacity:", v8, 16LL);
  if ((v7 & 1) == 0)
  {
    for (uint64_t i = [a3 decodeObject]; i; uint64_t i = objc_msgSend(a3, "decodeObject"))
      -[NSConcreteHashTable addObject:](v9, "addObject:", i);
    return v9;
  }

  if (!v6) {
    return v9;
  }
  int v10 = v15 & 5;
  while (1)
  {
    if (([a3 _containsNextUnkeyedObject] & 1) == 0)
    {
      id v14 = +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Missing expected key while decoding NSHashTable");

      [a3 failWithError:v14];
      return 0LL;
    }

    uint64_t v11 = [a3 decodeObject];
    if (!v11) {
      break;
    }
    -[NSConcreteHashTable addObject:](v9, "addObject:", v11);
LABEL_14:
    if (!--v6) {
      return v9;
    }
  }

  if (v10) {
    goto LABEL_14;
  }

  objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Unexpected nil object encountered while decoding NSHashTable."));
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)self->options;
  int v6 = [a3 allowsKeyedCoding];
  unint64_t count = self->count;
  uint64_t v8 = _NSPointerFunctionCoding_bufferForCount(count);
  if (!v8)
  {
    v21 = (void *)MEMORY[0x189603F70];
    uint64_t v22 = *MEMORY[0x189603B38];
    for (uint64_t i = @"NSHashTable is too big to encode"; ; uint64_t i = @"NSHashTable has invalid options for encoding")
    {
LABEL_32:
      objc_exception_throw((id)[v21 exceptionWithName:v22 reason:i userInfo:0]);
LABEL_33:
      v21 = (void *)MEMORY[0x189603F70];
      uint64_t v22 = *MEMORY[0x189603A60];
    }
  }

  unint64_t v9 = v8;
  int v24 = v6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  unint64_t v10 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
  if (!v10)
  {
    unint64_t v12 = 0LL;
    goto LABEL_14;
  }

  unint64_t v11 = v10;
  unint64_t v12 = 0LL;
  uint64_t v13 = *(void *)v28;
  do
  {
    for (uint64_t j = 0LL; j != v11; ++j)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(self);
      }
      if (v12 > count) {
        goto LABEL_30;
      }
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * j);
      if (!v15)
      {
        v21 = (void *)MEMORY[0x189603F70];
        uint64_t v22 = *MEMORY[0x189603A60];
        uint64_t i = @"NSHashTable contained an invalid nil element that was found while encoding";
        goto LABEL_32;
      }

      v9[v12++] = v15;
    }

    unint64_t v11 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
  }

  while (v11);
LABEL_14:
  BOOL v16 = v12 >= count;
  if ((v5 & 7) == 5) {
    BOOL v16 = 1;
  }
  if (v12 > count || !v16)
  {
LABEL_30:
    free(v9);
    v21 = (void *)MEMORY[0x189603F70];
    uint64_t v22 = *MEMORY[0x189603A60];
    uint64_t i = @"NSHashTable was modified while encoding";
    goto LABEL_32;
  }

  if ((v5 & 7) == 5) {
    int v17 = v24;
  }
  else {
    int v17 = 0;
  }
  uint64_t v25 = *(void *)self->options & 0x7FFFFFFFFFFFFFFFLL;
  [a3 encodeValueOfObjCType:"i" at:&v25];
  if (v12)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v12;
    do
    {
      uint64_t v20 = *v18;
      if (v17) {
        [a3 encodeConditionalObject:v20];
      }
      else {
        [a3 encodeObject:v20];
      }
      ++v18;
      --v19;
    }

    while (v19);
  }

  [a3 encodeObject:0];
  if ((v24 & 1) != 0) {
    [a3 encodeInt64:v12 forKey:@"NS.count"];
  }
  free(v9);
}

- (id)pointerFunctions
{
  v3 = objc_alloc(&OBJC_CLASS___NSConcretePointerFunctions);
  NSSliceInitWithSlice(&v3->slice.items, &self->slice.items);
  return v3;
}

- (unint64_t)hash
{
  if (!*(_BYTE *)(*(void *)(self + 32) + 1LL)) {
    return *(void *)(self + 40);
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (self->count != *((void *)a3 + 5)) {
    return 0;
  }
  personalityProps = self->slice.personalityProps;
  uint64_t v6 = *((void *)a3 + 3);
  if (*((void *)personalityProps + 3) != *(void *)(v6 + 24)
    || *((void *)personalityProps + 1) != *(void *)(v6 + 8))
  {
    return 0;
  }

  if (self->capacity)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    while (1)
    {
      uint64_t v10 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[v8], 0LL);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [a3 getItem:v10];
        if (!v12)
        {
          (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
          return 0;
        }

        int v13 = (*((uint64_t (**)(uint64_t, uint64_t, void))self->slice.personalityProps + 3))( v11,  v12,  *((void *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
        if (!v13) {
          return 0;
        }
      }

      ++v9;
      ++v8;
      BOOL result = 1;
      if (v9 >= self->capacity) {
        return result;
      }
    }
  }

  return 1;
}

- (void)raiseCountUnderflowException
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSHashTable %@] count underflow",  self);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v2 userInfo:0]);
  -[NSConcreteHashTable rehash](v3, v4);
}

- (void)rehash
{
  unint64_t count = self->count;
  if (count)
  {
    unint64_t v4 = 0LL;
    p_slice = &self->slice;
    uint64_t v6 = (void *)*((unsigned __int8 *)self->slice.internalProps + 3);
    do
    {
      if (p_slice->items[v4] == v6)
      {
        ++v4;
      }

      else
      {
        unint64_t v7 = -[NSConcreteHashTable rehashAround:](self, "rehashAround:", v4);
        if (v7 < v4) {
          return;
        }
        unint64_t count = self->count;
        unint64_t v4 = v7;
      }
    }

    while (v4 < count);
  }

- (void)insertItem:(const void *)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    char v5 = 0;
    -[NSConcreteHashTable assign:key:](self, "assign:key:", hashProbe(self, (uint64_t)a3, 0LL, &v5, 1), a3);
    if (!v5)
    {
      unint64_t v4 = self->count + 1;
      self->unint64_t count = v4;
      if (self->capacity < 2 * v4) {
        -[NSConcreteHashTable hashGrow](self, "hashGrow");
      }
    }
  }

- (void)insertKnownAbsentItem:(const void *)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v10[0] = 0LL;
    uint64_t v5 = hashProbe(self, (uint64_t)a3, v10, 0LL, 1);
    if (v10[0])
    {
      unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSConcreteHashTable (%p) insertKnownAbsentItem (%p) already has (%p)",  self,  a3,  v10[0]);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v7 userInfo:0]);
      -[NSConcreteHashTable removeAllItems](v8, v9);
    }

    else
    {
      -[NSConcreteHashTable assign:key:](self, "assign:key:", v5, a3);
      unint64_t v6 = self->count + 1;
      self->unint64_t count = v6;
      if (self->capacity < 2 * v6) {
        -[NSConcreteHashTable hashGrow](self, "hashGrow");
      }
    }
  }

- (void)removeAllItems
{
  self->unint64_t count = 0LL;
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  if (!self->capacity)
  {
    unint64_t v8 = 0LL;
    if (!a4) {
      return;
    }
    goto LABEL_7;
  }

  uint64_t v7 = 0LL;
  unint64_t v8 = 0LL;
  unint64_t v9 = 0LL;
  p_slice = &self->slice;
  do
  {
    uint64_t v11 = (const void *)(*((uint64_t (**)(void **, void))p_slice->internalProps + 3))( &p_slice->items[v7],  0LL);
    (*((void (**)(void))p_slice->internalProps + 5))();
    if (v11) {
      a3[v8++] = v11;
    }
    ++v9;
    ++v7;
  }

  while (v9 < self->capacity);
  if (a4) {
LABEL_7:
  }
    *a4 = v8;
}

- (id)description
{
  v3 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  -[NSString appendString:](v3, "appendString:", @"NSHashTable {\n");
  if (self->capacity)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[v4], 0LL);
      if (v6)
      {
        uint64_t v7 = v6;
        -[NSString appendFormat:]( v3,  "appendFormat:",  @"[%lu] %@\n",  v5,  (*((uint64_t (**)(void))self->slice.personalityProps + 4))());
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
      }

      ++v5;
      ++v4;
    }

    while (v5 < self->capacity);
  }

  -[NSString appendString:](v3, "appendString:", @"}\n");
  return v3;
}

- (id)objectEnumerator
{
  return (id)[objc_allocWithZone(MEMORY[0x189604048]) initWithObject:self];
}

@end