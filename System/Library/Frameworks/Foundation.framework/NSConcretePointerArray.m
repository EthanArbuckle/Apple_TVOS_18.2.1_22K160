@interface NSConcretePointerArray
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSConcretePointerArray)init;
- (NSConcretePointerArray)initWithCoder:(id)a3;
- (NSConcretePointerArray)initWithOptions:(unint64_t)a3;
- (NSConcretePointerArray)initWithPointerFunctions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pointerFunctions;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)indexOfPointer:(void *)a3;
- (void)_markNeedsCompaction;
- (void)addPointer:(void *)a3;
- (void)arrayGrow:(unint64_t)a3;
- (void)compact;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)insertPointer:(void *)a3 atIndex:(unint64_t)a4;
- (void)pointerAtIndex:(unint64_t)a3;
- (void)removePointer:(void *)a3;
- (void)removePointerAtIndex:(unint64_t)a3;
- (void)replacePointerAtIndex:(unint64_t)a3 withPointer:(void *)a4;
- (void)setCount:(unint64_t)a3;
@end

@implementation NSConcretePointerArray

- (NSConcretePointerArray)init
{
  return -[NSConcretePointerArray initWithOptions:](self, "initWithOptions:", 0LL);
}

- (NSConcretePointerArray)initWithOptions:(unint64_t)a3
{
  self->options = a3;
  self->capacity = 4LL;
  self->count = 0LL;
  self->mutations = 0LL;
  if (+[NSConcretePointerFunctions initializeSlice:withOptions:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeSlice:withOptions:",  &self->slice,  self->options))
  {
    +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:",  &self->slice,  0LL,  *((unsigned __int8 *)self->slice.acquisitionProps + 3),  0LL);
    allocateInitialCapacity_1(&self->slice.items, self->capacity);
    return self;
  }

  else
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSPointerArray %@] Requested configuration not supported.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v6 userInfo:0]);
    return -[NSConcretePointerArray initWithPointerFunctions:](v7, v8, v9);
  }

- (NSConcretePointerArray)initWithPointerFunctions:(id)a3
{
  if (a3)
  {
    NSSliceInitWithSlice(&self->slice.items, (void *)a3 + 1);
    self->hasDynamicSlice = 1;
    self->capacity = 16LL;
    self->count = 0LL;
    self->mutations = 0LL;
    +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:",  &self->slice,  0LL,  *((unsigned __int8 *)self->slice.acquisitionProps + 3),  1LL);
    self->options = -1LL;
    allocateInitialCapacity_1(&self->slice.items, self->capacity);
    return self;
  }

  else
  {
    v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSPointerArray %@] Functions cannot be NULL.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v5 userInfo:0]);
    return (NSConcretePointerArray *)+[NSConcretePointerArray supportsSecureCoding](v6, v7);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcretePointerArray)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a3 decodeValueOfObjCType:"i" at:&v11 size:4];
  if ((_NSPointerFunctionCoding_isValidOptions(v11) & 1) == 0)
  {

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Invalid NSPointerArray options for %d",  v11));
    return 0LL;
  }

  int v10 = 0;
  [a3 decodeValueOfObjCType:"i" at:&v10 size:4];
  if (v10 < 0)
  {

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"NSPointerArray archive contains negative count"));
    return 0LL;
  }

  v5 = -[NSConcretePointerArray initWithOptions:](self, "initWithOptions:", (int)v11);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v10 >= 1)
    {
      uint64_t v6 = 0LL;
      while (([a3 _containsNextUnkeyedObject] & 1) != 0)
      {
        -[NSConcretePointerArray addPointer:](v5, "addPointer:", [a3 decodeObject]);
        if (++v6 >= v10) {
          return v5;
        }
      }

      id v8 = +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Missing expected key while decoding NSPointerArray");

      [a3 failWithError:v8];
      return 0LL;
    }
  }

  else if (v10 >= 1)
  {
    for (uint64_t i = 0LL; i < v10; ++i)
      -[NSConcretePointerArray addPointer:](v5, "addPointer:", [a3 decodeObject]);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  p_slice = &self->slice;
  internalProps = self->slice.internalProps;
  if (internalProps)
  {
    unint64_t capacity = self->capacity;
    if (*((void *)internalProps + 3))
    {
      if (capacity && *((void *)internalProps + 6) != 0LL)
      {
        uint64_t v7 = 0LL;
        unint64_t v8 = self->capacity;
        do
        {
          uint64_t v9 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[v7], 0LL);
          uint64_t v10 = v9;
          if (v9)
          {
            unsigned int v11 = (void (*)(uint64_t, void))*((void *)p_slice->acquisitionProps + 2);
            if (v11) {
              v11(v9, *((void *)p_slice->personalityProps + 1));
            }
          }

          (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
          ++v7;
          --v8;
        }

        while (v8);
        internalProps = p_slice->internalProps;
      }
    }

    uint64_t v12 = (void (*)(void **, unint64_t))*((void *)internalProps + 2);
    if (v12) {
      v12(p_slice->items, capacity);
    }
    p_slice->items = 0LL;
  }

  if (self->hasDynamicSlice) {
    NSSliceDealloc((void **)&p_slice->items);
  }
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSConcretePointerArray;
  -[NSConcretePointerArray dealloc](&v13, sel_dealloc);
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
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  uint64_t v6 = *((void *)a3 + 5);
  if (v6 != self->count) {
    return 0;
  }
  personalityProps = self->slice.personalityProps;
  unint64_t v8 = (char *)a3 + 8;
  uint64_t v9 = *((void *)a3 + 3);
  if (*((void *)personalityProps + 3) != *(void *)(v9 + 24)
    || *((void *)personalityProps + 1) != *(void *)(v9 + 8))
  {
    return 0;
  }

  if (v6)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    p_internalProps = (NSSliceInternalProperties **)((char *)a3 + 32);
    while (1)
    {
      uint64_t v14 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[v11], 0LL);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, void))(v8[3] + 24LL))(*v8 + v11 * 8, 0LL);
      if (v14) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        p_internalProps = &self->slice.internalProps;
        goto LABEL_26;
      }

      uint64_t v17 = v15;
      if (v15 && v14 == 0) {
        break;
      }
      if (v14 | v15)
      {
        int v19 = (*((uint64_t (**)(uint64_t, uint64_t, void))self->slice.personalityProps + 3))( v14,  v15,  *((void *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v14);
        (*((void (**)(uint64_t))*p_internalProps + 4))(v17);
        if (!v19) {
          return 0;
        }
      }

      ++v12;
      ++v11;
      BOOL result = 1;
      if (v12 >= self->count) {
        return result;
      }
    }

    uint64_t v14 = v15;
LABEL_26:
    (*((void (**)(uint64_t))*p_internalProps + 4))(v14);
    return 0;
  }

  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (encodeWithCoder__onceToken != -1) {
    goto LABEL_27;
  }
  while (1)
  {
    unint64_t options = self->options;
    if ((_NSPointerFunctionCoding_isValidOptions(options) & 1) == 0)
    {
      v18 = (void *)MEMORY[0x189603F70];
      uint64_t v19 = *MEMORY[0x189603A60];
      v20 = @"NSHashTable has invalid options for encoding";
      goto LABEL_26;
    }

    unint64_t count = self->count;
    uint64_t v7 = _NSPointerFunctionCoding_bufferForCount(count);
    if (!v7)
    {
      v18 = (void *)MEMORY[0x189603F70];
      uint64_t v19 = *MEMORY[0x189603B38];
      v20 = @"NSPointerArray is too big to encode";
      goto LABEL_26;
    }

    unint64_t v8 = v7;
    unint64_t v21 = 0LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    unint64_t v9 = -[NSConcretePointerArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v23,  v22,  16LL);
    if (!v9) {
      break;
    }
    unint64_t v10 = v9;
    unint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v24;
LABEL_6:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(self);
      }
      if (v11 > count) {
        break;
      }
      v8[v11++] = *(void *)(*((void *)&v23 + 1) + 8 * v13);
      unint64_t v21 = v11;
      if (v10 == ++v13)
      {
        unint64_t v10 = -[NSConcretePointerArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v23,  v22,  16LL);
        if (v10) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }

void __42__NSConcretePointerArray_encodeWithCoder___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v0 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    (*((void (**)(unint64_t, SEL))self->slice.internalProps + 4))(a3->var3[0], a2);
    unint64_t var0 = a3->var0;
  }

  else
  {
    a3->var2 = &self->mutations;
    if (!*((_BYTE *)self->slice.internalProps + 1))
    {
      a3->var1 = self->slice.items;
      a3->unint64_t var0 = self->count;
      return self->count;
    }

    unint64_t var0 = 0LL;
    a3->var1 = (id *)a3->var3;
  }

  if (var0 >= self->count) {
    return 0LL;
  }
  uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[var0], 0LL);
  ++a3->var0;
  a3->var3[0] = v8;
  return 1LL;
}

- (id)pointerFunctions
{
  v3 = objc_alloc(&OBJC_CLASS___NSConcretePointerFunctions);
  NSSliceInitWithSlice(&v3->slice.items, &self->slice.items);
  return v3;
}

- (void)arrayGrow:(unint64_t)a3
{
  p_slice = &self->slice;
  items = self->slice.items;
  uint64_t v7 = (*((uint64_t (**)(unint64_t, SEL))self->slice.internalProps + 1))(a3, a2);
  p_slice->items = (void **)v7;
  if (v7)
  {
    if (self->capacity)
    {
      unint64_t v8 = 0LL;
      unint64_t v9 = items;
      do
      {
        if (*v9)
        {
          uint64_t v10 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(v9, 0LL);
          if (v10)
          {
            uint64_t v11 = v10;
            (*((void (**)(void **, unint64_t, uint64_t))p_slice->internalProps + 7))( p_slice->items,  v8,  v10);
            (*((void (**)(uint64_t))p_slice->internalProps + 4))(v11);
          }
        }

        ++v8;
        unint64_t capacity = self->capacity;
        ++v9;
      }

      while (v8 < capacity);
    }

    else
    {
      unint64_t capacity = 0LL;
    }

    (*((void (**)(void **, unint64_t))p_slice->internalProps + 2))(items, capacity);
    self->unint64_t capacity = a3;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"*** NSPointerArray unable to allocate memory -- allocation function failed" userInfo:0]);
    -[NSConcretePointerArray pointerAtIndex:](v13, v14, v15);
  }

- (void)pointerAtIndex:(unint64_t)a3
{
  unint64_t count = self->count;
  if (count <= a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to access pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
      objc_exception_throw(v10);
      -[NSConcretePointerArray addPointer:](v11, v12, v13);
      return result;
    }

    unint64_t count = self->count;
  }

  if (count <= a3) {
    return 0LL;
  }
  p_slice = &self->slice;
  unint64_t v8 = (void *)(*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[a3], 0LL);
  (*((void (**)(void))p_slice->internalProps + 5))();
  return v8;
}

- (void)addPointer:(void *)a3
{
  unint64_t count = self->count;
  if (count == self->capacity) {
    -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", 2 * count);
  }
  if (a3)
  {
    acquisitionProps = self->slice.acquisitionProps;
    uint64_t v7 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
    if (v7) {
      a3 = (void *)v7(a3, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
    }
  }

  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))( self->slice.items,  self->count,  a3);
  if (!a3) {
    self->needsCompaction = 1;
  }
  ++self->count;
  ++self->mutations;
}

- (void)removePointerAtIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (self->count <= a3)
  {
    uint64_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to remove pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
    objc_exception_throw(v13);
    -[NSConcretePointerArray insertPointer:atIndex:](v14, v15, v16, v17);
  }

  else
  {
    p_slice = &self->slice;
    uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[a3], 0LL);
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
      if (v8) {
        v8(v6, *((void *)self->slice.personalityProps + 1));
      }
      (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[v3]);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
    }

    unint64_t count = self->count;
    if (v3 + 1 < count)
    {
      uint64_t v10 = 8 * v3 + 8;
      do
      {
        uint64_t v11 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))( (char *)p_slice->items + v10,  0LL);
        (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))( p_slice->items,  v3,  v11);
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
        (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v10);
        unint64_t count = self->count;
        unint64_t v12 = v3 + 2;
        ++v3;
        v10 += 8LL;
      }

      while (v12 < count);
    }

    self->unint64_t count = count - 1;
    ++self->mutations;
  }

- (void)insertPointer:(void *)a3 atIndex:(unint64_t)a4
{
  unint64_t count = self->count;
  if (count < a4)
  {
    unint64_t v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to insert pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a4, self->count), 0 reason userInfo];
    objc_exception_throw(v12);
    -[NSConcretePointerArray replacePointerAtIndex:withPointer:](v13, v14, v15, v16);
  }

  else
  {
    if (count == self->capacity)
    {
      -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", 2 * count);
      unint64_t count = self->count;
    }

    if (count > a4)
    {
      uint64_t v8 = 8 * count - 8;
      do
      {
        uint64_t v9 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))( (char *)self->slice.items + v8,  0LL);
        (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))( self->slice.items,  count,  v9);
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
        (*((void (**)(char *))self->slice.internalProps + 6))((char *)self->slice.items + v8);
        v8 -= 8LL;
        --count;
      }

      while (count > a4);
    }

    if (a3)
    {
      acquisitionProps = self->slice.acquisitionProps;
      uint64_t v11 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
      if (v11) {
        a3 = (void *)v11(a3, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
      }
    }

    (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))( self->slice.items,  a4,  a3);
    if (!a3) {
      self->needsCompaction = 1;
    }
    ++self->count;
    ++self->mutations;
  }

- (void)replacePointerAtIndex:(unint64_t)a3 withPointer:(void *)a4
{
  if (self->count <= a3)
  {
    uint64_t v13 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to replace pointer at index %lu beyond bounds %lu", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0 reason userInfo];
    objc_exception_throw(v13);
    -[NSConcretePointerArray _markNeedsCompaction](v14, v15);
  }

  else
  {
    p_slice = &self->slice;
    uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&self->slice.items[a3], 0LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
      if (v10) {
        v10(v8, *((void *)self->slice.personalityProps + 1));
      }
      (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[a3]);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
    }

    if (a4)
    {
      acquisitionProps = self->slice.acquisitionProps;
      unint64_t v12 = (uint64_t (*)(void *, void, void))*((void *)acquisitionProps + 1);
      if (v12) {
        a4 = (void *)v12(a4, *((void *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
      }
    }

    (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(p_slice->items, a3, a4);
    if (!a4) {
      self->needsCompaction = 1;
    }
    ++self->mutations;
  }

- (void)_markNeedsCompaction
{
  self->needsCompaction = 1;
}

- (void)compact
{
  if (self->needsCompaction && self->count)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    p_slice = &self->slice;
    while ((*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&p_slice->items[v3], 0LL))
    {
      (*((void (**)(void))self->slice.internalProps + 4))();
      ++v4;
      unint64_t count = self->count;
      ++v3;
      if (v4 >= count) {
        goto LABEL_8;
      }
    }

    unint64_t count = self->count;
LABEL_8:
    if (v4 != count)
    {
      unint64_t v7 = v4 + 1;
      if (v4 + 1 < count)
      {
        uint64_t v8 = 8 * v4 + 8;
        do
        {
          uint64_t v9 = (*((uint64_t (**)(char *, void))self->slice.internalProps + 3))( (char *)p_slice->items + v8,  0LL);
          if (v9)
          {
            uint64_t v10 = v9;
            (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))( p_slice->items,  v4,  v9);
            (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v8);
            (*((void (**)(uint64_t))self->slice.internalProps + 4))(v10);
            ++v4;
          }

          ++v7;
          v8 += 8LL;
        }

        while (v7 < self->count);
      }

      self->unint64_t count = v4;
      ++self->mutations;
      self->needsCompaction = 0;
    }
  }

- (unint64_t)count
{
  return self->count;
}

- (void)setCount:(unint64_t)a3
{
  if (self->count != a3)
  {
    ++self->mutations;
    unint64_t count = self->count;
    if (count >= a3)
    {
      if (count > a3)
      {
        p_slice = &self->slice;
        do
        {
          unint64_t v7 = count - 1;
          self->unint64_t count = v7;
          uint64_t v8 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(&p_slice->items[v7], 0LL);
          uint64_t v9 = v8;
          uint64_t v10 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
          if (v10) {
            BOOL v11 = v8 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          if (!v11) {
            v10(v8, *((void *)self->slice.personalityProps + 1));
          }
          (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
          (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
          unint64_t count = self->count;
        }

        while (count > a3);
      }
    }

    else
    {
      if (self->capacity < a3) {
        -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", a3);
      }
      self->unint64_t count = a3;
    }
  }

- (unint64_t)indexOfPointer:(void *)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->count)
  {
    p_slice = &self->slice;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(p_slice->items, 0LL);
      if (v6)
      {
        uint64_t v7 = v6;
        char v8 = (*((uint64_t (**)(uint64_t, void *, void))self->slice.personalityProps + 3))( v6,  a3,  *((void *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
        if ((v8 & 1) != 0) {
          return 0LL;
        }
      }

      else
      {
        (*((void (**)(void))self->slice.internalProps + 4))();
      }
    }

    while (self->count);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removePointer:(void *)a3
{
  if (a3 && self->count)
  {
    p_slice = &self->slice;
    while (1)
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->slice.internalProps + 3))(p_slice->items, 0LL);
      if (v6)
      {
        uint64_t v7 = v6;
        if ((*((unsigned int (**)(uint64_t, void *, void))self->slice.personalityProps + 3))( v6,  a3,  *((void *)self->slice.personalityProps + 1)))
        {
          break;
        }
      }

      if (!self->count) {
        return;
      }
    }

    char v8 = (void (*)(uint64_t, void))*((void *)self->slice.acquisitionProps + 2);
    if (v8) {
      v8(v7, *((void *)self->slice.personalityProps + 1));
    }
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = -[NSConcretePointerArray initWithPointerFunctions:]( +[NSPointerArray allocWithZone:](&OBJC_CLASS___NSConcretePointerArray, "allocWithZone:", a3),  "initWithPointerFunctions:",  -[NSConcretePointerArray pointerFunctions](self, "pointerFunctions"));
  unint64_t count = self->count;
  if (count)
  {
    uint64_t v6 = 0LL;
    p_slice = &self->slice;
    do
    {
      uint64_t v8 = (*((uint64_t (**)(void **, void))p_slice->internalProps + 3))(&p_slice->items[v6], 0LL);
      -[NSConcretePointerArray addPointer:](v4, "addPointer:", v8);
      (*((void (**)(uint64_t))p_slice->internalProps + 4))(v8);
      ++v6;
      --count;
    }

    while (count);
  }

  return v4;
}

@end