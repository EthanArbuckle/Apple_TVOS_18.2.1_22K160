@interface NSConcreteMapTable
+ (BOOL)supportsSecureCoding;
- (BOOL)containsKeys:(const void *)a3 values:(const void *)a4 count:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5;
- (NSConcreteMapTable)init;
- (NSConcreteMapTable)initWithCoder:(id)a3;
- (NSConcreteMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5;
- (NSConcreteMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5;
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)dump;
- (id)keyEnumerator;
- (id)keyPointerFunctions;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)valuePointerFunctions;
- (unint64_t)__capacity;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4;
- (unint64_t)hash;
- (unint64_t)realCount;
- (unint64_t)rehashAround:(unint64_t)a3;
- (void)_setBackingStore;
- (void)assign:(unint64_t)a3 key:(const void *)a4 value:(const void *)a5 isNew:(BOOL)a6;
- (void)checkCount:(const char *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)grow;
- (void)raiseCountUnderflowException;
- (void)rehash;
- (void)removeAllItems;
- (void)removeObjectForKey:(id)a3;
- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4;
- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSConcreteMapTable

- (id)objectForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  char v8 = 0;
  uint64_t v4 = probeGC(self, (unint64_t)a3, &v8, 0LL, 0);
  if (!v8) {
    return 0LL;
  }
  p_values = &self->values;
  v6 = (void *)(*((uint64_t (**)(void **, void))self->values.internalProps + 3))( &self->values.items[v4],  0LL);
  (*((void (**)(void))p_values->internalProps + 5))();
  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      char v9 = 0;
      uint64_t v7 = probeGC(self, (unint64_t)a4, &v9, 0LL, 1);
      -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, v9 == 0);
      if (!v9)
      {
        unint64_t v8 = self->count + 1;
        self->count = v8;
        if (self->capacity < 2 * v8) {
          -[NSConcreteMapTable grow](self, "grow");
        }
      }
    }
  }

- (void)assign:(unint64_t)a3 key:(const void *)a4 value:(const void *)a5 isNew:(BOOL)a6
{
  if (a6)
  {
    p_keys = &self->keys;
    acquisitionProps = self->keys.acquisitionProps;
    v12 = (uint64_t (*)(const void *, void, void))*((void *)acquisitionProps + 1);
    if (v12) {
      a4 = (const void *)v12( a4,  *((void *)self->keys.personalityProps + 1),  *((unsigned __int8 *)acquisitionProps + 4));
    }
    (*((void (**)(void **, unint64_t, const void *))self->keys.internalProps + 7))( p_keys->items,  a3,  a4);
  }

  p_values = &self->values;
  v14 = p_values->acquisitionProps;
  v15 = (uint64_t (*)(const void *, void, void, const void *))*((void *)v14 + 1);
  if (v15) {
    a5 = (const void *)v15(a5, *((void *)p_values->personalityProps + 1), *((unsigned __int8 *)v14 + 4), a4);
  }
  if (!a6)
  {
    if (*((void *)p_values->acquisitionProps + 2))
    {
      uint64_t v16 = (*((uint64_t (**)(void **, void, unint64_t, const void *))p_values->internalProps + 3))( &p_values->items[a3],  0LL,  a3,  a4);
      (*((void (**)(uint64_t, void))p_values->acquisitionProps + 2))( v16,  *((void *)p_values->personalityProps + 1));
      (*((void (**)(uint64_t))p_values->internalProps + 4))(v16);
    }

    (*((void (**)(void **, SEL, unint64_t, const void *))p_values->internalProps + 6))( &p_values->items[a3],  a2,  a3,  a4);
  }

  (*((void (**)(void **, unint64_t, const void *))p_values->internalProps + 7))( p_values->items,  a3,  a5);
}

- (NSConcreteMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  if (a5 >= 5)
  {
    if ((a5 & (a5 - 1)) != 0)
    {
      unint64_t v7 = 0LL;
      do
      {
        char v8 = v7 + 1;
        if (a5 < 2) {
          break;
        }
        a5 >>= 1;
      }

      while (v7++ < 0x17);
      unsigned int v10 = 1 << v8;
      if (v10 <= 4) {
        a5 = 4LL;
      }
      else {
        a5 = v10;
      }
    }
  }

  else
  {
    a5 = 4LL;
  }

  self->capacity = a5;
  self->keyOptions = a3;
  self->valueOptions = a4;
  self->count = 0LL;
  self->mutations = 0LL;
  self->growLock._os_unfair_lock_opaque = 0;
  if (+[NSConcretePointerFunctions initializeSlice:withOptions:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeSlice:withOptions:",  &self->keys,  self->keyOptions)
    && +[NSConcretePointerFunctions initializeSlice:withOptions:]( &OBJC_CLASS___NSConcretePointerFunctions,  "initializeSlice:withOptions:",  &self->values,  self->valueOptions))
  {
    -[NSConcreteMapTable _setBackingStore](self, "_setBackingStore");
    allocateInitialCapacity_0((uint64_t *)&self->keys, self->capacity);
    allocateInitialCapacity_0((uint64_t *)&self->values, self->capacity);
    return self;
  }

  else
  {
    v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSMapTable %@] Requested configuration not supported.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v12 userInfo:0]);
    -[NSConcreteMapTable _setBackingStore](v13, v14);
  }

  return result;
}

- (void)_setBackingStore
{
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    char v10 = 0;
    uint64_t v9 = 0LL;
    uint64_t v4 = probeGC(self, (unint64_t)a3, &v10, &v9, 1);
    if (v10)
    {
      uint64_t v5 = v4;
      v6 = (void (*)(uint64_t, void))*((void *)self->keys.acquisitionProps + 2);
      if (v6) {
        v6(v9, *((void *)self->keys.personalityProps + 1));
      }
      p_values = &self->values;
      if (*((void *)self->values.acquisitionProps + 2))
      {
        uint64_t v8 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&p_values->items[v5], 0LL);
        (*((void (**)(uint64_t, void))self->values.acquisitionProps + 2))( v8,  *((void *)self->values.personalityProps + 1));
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      }

      (*((void (**)(void **))self->keys.internalProps + 6))(&self->keys.items[v5]);
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v5]);
      --self->count;
      ++self->mutations;
      -[NSConcreteMapTable rehashAround:](self, "rehashAround:", v5);
    }
  }

- (unint64_t)rehashAround:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  p_keys = &self->keys;
  internalProps = self->keys.internalProps;
  unint64_t capacity = self->capacity;
  items = self->keys.items;
  unint64_t v9 = a3;
  do
    unint64_t v9 = (v9 - 1) & (capacity - 1);
  while (items[v9] != (void *)*((unsigned __int8 *)internalProps + 3));
  while (1)
  {
    unint64_t v9 = (capacity - 1) & (v9 + 1);
    unint64_t v10 = (*((uint64_t (**)(void **, char *))internalProps + 3))(&items[v9], &v23);
    p_values = &self->values;
    uint64_t v12 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v9], 0LL);
    uint64_t v13 = v12;
    if (!v10 && v23 != 0) {
      break;
    }
    if (v10) {
      BOOL v15 = v12 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      if (v10)
      {
        uint64_t v16 = (void (*)(unint64_t, void))*((void *)p_keys->acquisitionProps + 2);
        if (v16) {
          v16(v10, *((void *)p_keys->personalityProps + 1));
        }
      }

      (*((void (**)(void **))p_keys->internalProps + 6))(&p_keys->items[v9]);
      v17 = (void (*)(uint64_t, void))*((void *)self->values.acquisitionProps + 2);
      if (v17) {
        BOOL v18 = v13 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18) {
        v17(v13, *((void *)self->values.personalityProps + 1));
      }
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
      unint64_t count = self->count;
      if (count) {
        self->unint64_t count = count - 1;
      }
      else {
        -[NSConcreteMapTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
      }
    }

    else
    {
      (*((void (**)(void **))p_keys->internalProps + 6))(&p_keys->items[v9]);
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
      uint64_t v21 = probeGC(self, v10, 0LL, 0LL, 0);
      (*((void (**)(void **, uint64_t, unint64_t))p_keys->internalProps + 7))(p_keys->items, v21, v10);
      (*((void (**)(void **, uint64_t, uint64_t))self->values.internalProps + 7))(p_values->items, v21, v13);
    }

    (*((void (**)(unint64_t))p_keys->internalProps + 4))(v10);
    (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
LABEL_31:
    unint64_t capacity = self->capacity;
    internalProps = p_keys->internalProps;
    items = p_keys->items;
  }

  if (v12)
  {
    NSLog((NSString *)@"NSMaptable %p isEmpty key but not value %p at index %ld", self, v12, v9);
    v20 = (void (*)(uint64_t, void))*((void *)self->values.acquisitionProps + 2);
    if (v20) {
      v20(v13, *((void *)self->values.personalityProps + 1));
    }
    (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
  }

  (*((void (**)(void))p_keys->internalProps + 4))(0LL);
  (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
  if (v9 == a3) {
    goto LABEL_31;
  }
  return v9;
}

- (id)allValues
{
  v3 = (void *)[MEMORY[0x189603FA8] array];
  if (self->capacity)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->keys.internalProps + 3))(&self->keys.items[v4], 0LL);
      uint64_t v7 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v4], 0LL);
      uint64_t v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        [v3 addObject:v7];
      }
      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v6);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      ++v5;
      ++v4;
    }

    while (v5 < self->capacity);
  }

  return v3;
}

- (void)removeAllItems
{
  self->unint64_t count = 0LL;
}

- (NSConcreteMapTable)init
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( self,  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  16LL);
}

- (void)raiseCountUnderflowException
{
  v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSMapTable %@] count underflow",  self);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v2 userInfo:0]);
  -[NSConcreteMapTable realCount](v3, v4);
}

- (unint64_t)realCount
{
  if (!self->capacity) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  unint64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  p_keys = &self->keys;
  do
  {
    uint64_t v7 = (*((uint64_t (**)(void **, void))p_keys->internalProps + 3))(&p_keys->items[v3], 0LL);
    uint64_t v8 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v3], 0LL);
    uint64_t v9 = v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      ++v4;
    }
    (*((void (**)(uint64_t))p_keys->internalProps + 4))(v7);
    (*((void (**)(uint64_t))self->values.internalProps + 4))(v9);
    ++v5;
    ++v3;
  }

  while (v5 < self->capacity);
  return v4;
}

- (void)checkCount:(const char *)a3
{
  unint64_t v4 = -[NSConcreteMapTable realCount](self, "realCount", a3);
  unint64_t count = self->count;
  if (v4 > count && !self->shouldRehash)
  {
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSMapTable %@] real count %ld exceeds count %ld when it shouldn't",  self,  v4,  count);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v6 userInfo:0]);
    -[NSConcreteMapTable copy](v7, v8);
  }

- (id)copy
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSConcreteMapTable);
  unint64_t v4 = v3;
  v3->unint64_t count = 0LL;
  v3->unint64_t capacity = self->capacity;
  v3->keyOptions = self->keyOptions;
  v3->valueOptions = self->valueOptions;
  v3->mutations = 0LL;
  p_keys = (uint64_t *)&v3->keys;
  uint64_t v6 = &self->keys;
  if (self->hasDynamicSlices)
  {
    NSSliceInitWithSlice(&v3->keys.items, &self->keys.items);
    NSSliceInitWithSlice(&v4->values.items, &self->values.items);
    v4->hasDynamicSlices = 1;
  }

  else
  {
    __int128 v7 = *(_OWORD *)&self->keys.personalityProps;
    *(_OWORD *)p_keys = *(_OWORD *)&v6->items;
    *(_OWORD *)&v3->keys.personalityProps = v7;
    __int128 v8 = *(_OWORD *)&self->values.personalityProps;
    *(_OWORD *)&v3->values.items = *(_OWORD *)&self->values.items;
    *(_OWORD *)&v3->values.personalityProps = v8;
  }

  allocateInitialCapacity_0(p_keys, self->capacity);
  allocateInitialCapacity_0((uint64_t *)&v4->values, self->capacity);
  if (self->capacity)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    do
    {
      uint64_t v11 = (*((uint64_t (**)(void **, void))self->keys.internalProps + 3))(&v6->items[v9], 0LL);
      uint64_t v12 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v9], 0LL);
      if (v11 | v12)
      {
        uint64_t v13 = v12;
        if (v12) {
          BOOL v14 = v11 != 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v12) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v11 == 0;
        }
        if (v15 && v14) {
          -[NSConcreteMapTable setObject:forKey:](v4, "setObject:forKey:", v12, v11);
        }
        else {
          self->shouldRehash = 1;
        }
        (*((void (**)(uint64_t))self->keys.internalProps + 4))(v11);
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
      }

      ++v10;
      ++v9;
    }

    while (v10 < self->capacity);
  }

  if (self->shouldRehash) {
    -[NSConcreteMapTable rehash](self, "rehash");
  }
  return v4;
}

- (NSConcreteMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5
{
  if (a3 && a4)
  {
    NSSliceInitWithSlice(&self->keys.items, (void *)a3 + 1);
    NSSliceInitWithSlice(&self->values.items, (void *)a4 + 1);
    self->hasDynamicSlices = 1;
    if (a5 >= 5)
    {
      if ((a5 & (a5 - 1)) != 0)
      {
        unint64_t v8 = 0LL;
        do
        {
          char v9 = v8 + 1;
          if (a5 < 2) {
            break;
          }
          a5 >>= 1;
        }

        while (v8++ < 0x17);
        unsigned int v11 = 1 << v9;
        if (v11 <= 4) {
          a5 = 4LL;
        }
        else {
          a5 = v11;
        }
      }
    }

    else
    {
      a5 = 4LL;
    }

    self->unint64_t capacity = a5;
    self->unint64_t count = 0LL;
    self->mutations = 0LL;
    self->keyOptions = 0x20000LL;
    self->valueOptions = 0x20000LL;
    self->growLock._os_unfair_lock_opaque = 0;
    -[NSConcreteMapTable _setBackingStore](self, "_setBackingStore");
    allocateInitialCapacity_0((uint64_t *)&self->keys, self->capacity);
    allocateInitialCapacity_0((uint64_t *)&self->values, self->capacity);
    return self;
  }

  else
  {
    uint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -[NSMapTable %@] Requested configuration not supported.",  NSStringFromSelector(a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v13 userInfo:0]);
    return (NSConcreteMapTable *)+[NSConcreteMapTable supportsSecureCoding](v14, v15);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcreteMapTable)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 containsValueForKey:@"NS.count"])
  {
    uint64_t v5 = [a3 decodeInt64ForKey:@"NS.count"];
    if (v5 < 0)
    {

      objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"NSMapTable archive contains negative count"));
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

  [a3 decodeValueOfObjCType:"i" at:&v22 size:4];
  [a3 decodeValueOfObjCType:"i" at:&v21 size:4];
  uint64_t v8 = (int)v22;
  if ((_NSPointerFunctionCoding_isValidOptions(v22) & 1) == 0)
  {

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Decoded unsupported NSMapTable key options %x",  v22));
    return 0LL;
  }

  uint64_t v9 = (int)v21;
  if ((_NSPointerFunctionCoding_isValidOptions(v21) & 1) == 0)
  {

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Decoded unsupported NSMapTable value options %x",  v21));
    return 0LL;
  }

  unint64_t v10 = -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( self,  "initWithKeyOptions:valueOptions:capacity:",  v8,  v9,  16LL);
  if ((v7 & 1) != 0)
  {
    if (!v6) {
      return v10;
    }
    int v11 = v22 & 5;
    int v12 = v21 & 5;
    while (1)
    {
      if (([a3 _containsNextUnkeyedObject] & 1) == 0)
      {
        id v18 = +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Missing expected key for key while decoding NSMapTable");

        [a3 failWithError:v18];
        return 0LL;
      }

      uint64_t v13 = [a3 decodeObject];
      if (([a3 _containsNextUnkeyedObject] & 1) == 0)
      {
        id v19 = +[NSError _readCorruptErrorWithFormat:]( &OBJC_CLASS___NSError,  "_readCorruptErrorWithFormat:",  @"Missing expected key for value while decoding NSMapTable");

        [a3 failWithError:v19];
        return 0LL;
      }

      uint64_t v14 = [a3 decodeObject];
      if (v13)
      {
        if (v14)
        {
          -[NSConcreteMapTable setObject:forKey:](v10, "setObject:forKey:", v14, v13);
        }

        else if (!v12)
        {
LABEL_31:

          objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:]( NSError,  "_readCorruptErrorWithFormat:",  @"Missing key while decoding NSMapTable"));
          return 0LL;
        }
      }

      else if (!v11)
      {
        goto LABEL_31;
      }

      if (!--v6) {
        return v10;
      }
    }
  }

  for (uint64_t i = [a3 decodeObject]; ; uint64_t i = objc_msgSend(a3, "decodeObject"))
  {
    uint64_t v16 = i;
    if (!i) {
      break;
    }
    uint64_t v17 = [a3 decodeObject];
    if (!v17)
    {

      [a3 failWithError:+[NSError _readCorruptErrorWithFormat:]( NSError, "_readCorruptErrorWithFormat:", @"Missing object for non-nil key %@ while decoding NSMapTable", v16)];
      return 0LL;
    }

    -[NSConcreteMapTable setObject:forKey:](v10, "setObject:forKey:", v17, v16);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  p_unint64_t keyOptions = &self->keyOptions;
  unint64_t keyOptions = self->keyOptions;
  p_unint64_t valueOptions = &self->valueOptions;
  unint64_t valueOptions = self->valueOptions;
  int v9 = [a3 allowsKeyedCoding];
  if ((_NSPointerFunctionCoding_isValidOptions(*p_keyOptions) & 1) == 0)
  {
    v29 = (void *)MEMORY[0x189603F70];
    uint64_t v30 = *MEMORY[0x189603A60];
    j = @"NSMapTable has invalid key options for encoding";
    goto LABEL_42;
  }

  if ((_NSPointerFunctionCoding_isValidOptions(*p_valueOptions) & 1) == 0)
  {
    v29 = (void *)MEMORY[0x189603F70];
    uint64_t v30 = *MEMORY[0x189603A60];
    j = @"NSMapTable has invalid value options for encoding";
    goto LABEL_42;
  }

  unint64_t count = self->count;
  if ((count & 0x8000000000000000LL) != 0) {
    goto LABEL_43;
  }
  int v11 = _NSPointerFunctionCoding_bufferForCount(2 * count);
  if (!v11) {
    goto LABEL_43;
  }
  int v12 = v11;
  char v35 = valueOptions;
  char v36 = keyOptions;
  v32 = p_keyOptions;
  v33 = p_valueOptions;
  int v34 = v9;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  unint64_t v13 = -[NSConcreteMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
  if (!v13)
  {
    unint64_t v15 = 0LL;
    goto LABEL_18;
  }

  unint64_t v14 = v13;
  unint64_t v15 = 0LL;
  uint64_t v16 = *(void *)v39;
  do
  {
    for (uint64_t i = 0LL; i != v14; ++i)
    {
      if (*(void *)v39 != v16) {
        objc_enumerationMutation(self);
      }
      uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * i);
      id v19 = -[NSConcreteMapTable objectForKey:](self, "objectForKey:", v18);
      if (v18) {
        BOOL v20 = v19 == 0LL;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20)
      {
        free(v12);
        v29 = (void *)MEMORY[0x189603F70];
        uint64_t v30 = *MEMORY[0x189603A60];
        j = @"NSMapTable has nil item that cannot be encoded";
        goto LABEL_42;
      }

      *((void *)v12 + v15) = v18;
      *((void *)v12 + count + v15++) = v19;
    }

    unint64_t v14 = -[NSConcreteMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
  }

  while (v14);
LABEL_18:
  uint64_t v21 = v36 & 7;
  uint64_t v22 = v35 & 7;
  BOOL v23 = v15 >= count;
  if (v21 == 5) {
    BOOL v23 = 1;
  }
  if (v22 == 5) {
    BOOL v23 = 1;
  }
  if (v15 > count || !v23)
  {
    free(v12);
    v29 = (void *)MEMORY[0x189603F70];
    uint64_t v30 = *MEMORY[0x189603A60];
    for (j = @"NSMapTable was modified during archival"; ; j = @"NSMapTable is too big to archive")
    {
LABEL_42:
      objc_exception_throw((id)[v29 exceptionWithName:v30 reason:j userInfo:0]);
LABEL_43:
      v29 = (void *)MEMORY[0x189603F70];
      uint64_t v30 = *MEMORY[0x189603A60];
    }
  }

  if (v21 != 5) {
    int v9 = 0;
  }
  if (v22 == 5) {
    int v24 = v34;
  }
  else {
    int v24 = 0;
  }
  [a3 encodeValueOfObjCType:"i" at:v32];
  [a3 encodeValueOfObjCType:"i" at:v33];
  if (v15)
  {
    v25 = (uint64_t *)v12;
    unint64_t v26 = v15;
    do
    {
      uint64_t v27 = *v25;
      if (v9) {
        [a3 encodeConditionalObject:v27];
      }
      else {
        [a3 encodeObject:v27];
      }
      uint64_t v28 = v25[count];
      if (v24) {
        [a3 encodeConditionalObject:v28];
      }
      else {
        [a3 encodeObject:v28];
      }
      ++v25;
      --v26;
    }

    while (v26);
  }

  [a3 encodeObject:0];
  free(v12);
  if ((v34 & 1) != 0) {
    [a3 encodeInt64:v15 forKey:@"NS.count"];
  }
}

- (id)keyPointerFunctions
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSConcretePointerFunctions);
  NSSliceInitWithSlice(&v3->slice.items, &self->keys.items);
  return v3;
}

- (id)valuePointerFunctions
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSConcretePointerFunctions);
  NSSliceInitWithSlice(&v3->slice.items, &self->values.items);
  return v3;
}

- (unint64_t)count
{
  if (!self->shouldRehash) {
    return self->count;
  }
  -[NSConcreteMapTable rehash](self, "rehash");
  unint64_t result = -[NSConcreteMapTable realCount](self, "realCount");
  self->unint64_t count = result;
  return result;
}

- (unint64_t)__capacity
{
  return self->capacity;
}

- (BOOL)containsKeys:(const void *)a3 values:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    BOOL v9 = 0;
    uint64_t v10 = 0LL;
    while (-[NSConcreteMapTable objectForKey:](self, "objectForKey:", a3[v10]))
    {
      char v14 = 0;
      uint64_t v11 = probeGC(self, (unint64_t)a3[v10], &v14, 0LL, 0);
      uint64_t v12 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v11], 0LL);
      if (!v14
        || ((*((uint64_t (**)(const void *, uint64_t, void))self->values.personalityProps + 3))( a4[v10],  v12,  *((void *)self->values.personalityProps + 1)) & 1) == 0)
      {
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v12);
        return v9;
      }

      (*((void (**)(uint64_t))self->values.internalProps + 4))(v12);
      BOOL v9 = ++v10 >= a5;
      if (a5 == v10) {
        return 1;
      }
    }

    NSLog((NSString *)@"*** not a member: %p\n", a3[v10]);
  }

  else
  {
    return 1;
  }

  return v9;
}

- (id)dump
{
  uint64_t v3 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  unint64_t capacity = self->capacity;
  if (capacity)
  {
    unint64_t v5 = 0LL;
    p_keys = &self->keys;
    char v7 = (void *)*((unsigned __int8 *)self->keys.internalProps + 3);
    do
    {
      uint64_t v8 = self->values.items[v5];
      if (p_keys->items[v5] != v7 || v8 != 0LL)
      {
        -[NSString appendFormat:](v3, "appendFormat:", @"[%lu] %p -> %p\n", v5, p_keys->items[v5], v8);
        unint64_t capacity = self->capacity;
      }

      ++v5;
    }

    while (v5 < capacity);
  }

  return v3;
}

- (void)grow
{
  v2 = self;
  p_keys = &self->keys;
  p_values = &self->values;
  items = self->keys.items;
  v31 = self->values.items;
  unint64_t capacity = self->capacity;
  if (!self->shouldRehash || (-[NSConcreteMapTable rehash](self, "rehash"), v2->capacity <= 2 * v2->count))
  {
    unint64_t v6 = capacity << (v2->capacity <= 2 * NSConcreteMapTable_reclaim((uint64_t)v2));
    uint64_t v7 = (*((uint64_t (**)(unint64_t))p_keys->internalProps + 1))(v6);
    if (v7
      && (uint64_t v8 = (void **)v7, (v9 = (*((uint64_t (**)(unint64_t))p_values->internalProps + 1))(v6)) != 0))
    {
      uint64_t v10 = (void **)v9;
      os_unfair_lock_lock(&v2->growLock);
      p_keys->items = v8;
      p_values->items = v10;
      v2->unint64_t capacity = v6;
      os_unfair_lock_unlock(&v2->growLock);
      v2->unint64_t count = 0LL;
      if (capacity)
      {
        uint64_t v11 = items;
        uint64_t v12 = v31;
        unint64_t v13 = capacity;
        v32 = v2;
        do
        {
          char v14 = (void *)MEMORY[0x186E1FF60]();
          unint64_t v15 = (*((uint64_t (**)(void **, void))p_keys->internalProps + 3))(v11, 0LL);
          uint64_t v16 = (*((uint64_t (**)(void **, void))p_values->internalProps + 3))(v12, 0LL);
          if (v15 | v16)
          {
            uint64_t v17 = v16;
            if (v15) {
              BOOL v18 = v16 == 0;
            }
            else {
              BOOL v18 = 0;
            }
            if (v18)
            {
              int v24 = (void (*)(unint64_t, void))*((void *)p_keys->acquisitionProps + 2);
              if (v24) {
                v24(v15, *((void *)p_keys->personalityProps + 1));
              }
              (*((void (**)(void **))p_keys->internalProps + 6))(v11);
              (*((void (**)(unint64_t))p_keys->internalProps + 4))(v15);
            }

            else
            {
              if (v15) {
                BOOL v19 = 1;
              }
              else {
                BOOL v19 = v16 == 0;
              }
              if (v19)
              {
                uint64_t v20 = probeGC(v2, v15, 0LL, 0LL, 1);
                unint64_t v21 = capacity;
                uint64_t v22 = v20;
                (*((void (**)(void **, uint64_t, unint64_t))p_keys->internalProps + 7))( p_keys->items,  v20,  v15);
                uint64_t v23 = v22;
                unint64_t capacity = v21;
                v2 = v32;
                (*((void (**)(void **, uint64_t, uint64_t))p_values->internalProps + 7))( p_values->items,  v23,  v17);
                (*((void (**)(unint64_t))p_keys->internalProps + 4))(v15);
                (*((void (**)(uint64_t))p_values->internalProps + 4))(v17);
                ++v32->count;
              }

              else
              {
                v25 = (void (*)(uint64_t, void))*((void *)p_values->acquisitionProps + 2);
                if (v25) {
                  v25(v16, *((void *)p_keys->personalityProps + 1));
                }
                (*((void (**)(void **))p_values->internalProps + 6))(v12);
                (*((void (**)(uint64_t))p_values->internalProps + 4))(v17);
              }
            }
          }

          objc_autoreleasePoolPop(v14);
          ++v12;
          ++v11;
          --v13;
        }

        while (v13);
      }

      (*((void (**)(void **, unint64_t))p_keys->internalProps + 2))(items, capacity);
      (*((void (**)(void **, unint64_t))p_values->internalProps + 2))(v31, capacity);
    }

    else
    {
      objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B38],  @"*** NSMapTable unable to allocate memory -- allocation function failed",  0,  items));
      -[NSConcreteMapTable setItem:forAbsentKey:](v26, v27, v28, v29);
    }
  }

- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      char v9 = 0;
      uint64_t v7 = probeGC(self, (unint64_t)a4, &v9, 0LL, 1);
      if (!v9)
      {
        -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1LL);
        unint64_t v8 = self->count + 1;
        self->unint64_t count = v8;
        if (self->capacity < 2 * v8) {
          -[NSConcreteMapTable grow](self, "grow");
        }
      }
    }
  }

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a3 && a4)
  {
    char v13 = 0;
    uint64_t v7 = probeGC(self, (unint64_t)a4, &v13, 0LL, 1);
    if (v13)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"value not absent" reason:@"value not absent" userInfo:0]);
      -[NSConcreteMapTable existingItemForSetItem:forAbsentKey:](v9, v10, v11, v12);
    }

    else
    {
      -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1LL);
      unint64_t v8 = self->count + 1;
      self->unint64_t count = v8;
      if (self->capacity < 2 * v8) {
        -[NSConcreteMapTable grow](self, "grow");
      }
    }
  }

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a4) {
    return 0LL;
  }
  char v12 = 0;
  uint64_t v7 = probeGC(self, (unint64_t)a4, &v12, 0LL, 1);
  if (!v12)
  {
    if (a3)
    {
      -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1LL);
      unint64_t v10 = self->count + 1;
      self->unint64_t count = v10;
      if (self->capacity < 2 * v10) {
        -[NSConcreteMapTable grow](self, "grow");
      }
    }

    return 0LL;
  }

  p_values = &self->values;
  char v9 = (void *)(*((uint64_t (**)(void **, void))self->values.internalProps + 3))( &self->values.items[v7],  0LL);
  (*((void (**)(void))p_values->internalProps + 5))();
  return v9;
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0;
  }
  char v13 = 0;
  uint64_t v8 = probeGC(self, (unint64_t)a3, &v13, 0LL, 0);
  BOOL v9 = v13 != 0;
  if (v13)
  {
    uint64_t v10 = v8;
    if (a5)
    {
      *a5 = (const void *)(*((uint64_t (**)(void **, void))self->values.internalProps + 3))( &self->values.items[v8],  0LL);
      (*((void (**)(void))self->values.internalProps + 5))();
    }

    if (a4)
    {
      p_keys = &self->keys;
      *a4 = (const void *)(*((uint64_t (**)(void **, void))p_keys->internalProps + 3))( &p_keys->items[v10],  0LL);
      (*((void (**)(void))p_keys->internalProps + 5))();
    }
  }

  return v9;
}

- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4)
    {
      char v9 = 0;
      uint64_t v7 = probeGC(self, (unint64_t)a4, &v9, 0LL, 1);
      if (v9)
      {
        uint64_t v8 = v7;
        if ((*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v7], 0LL))
        {
          (*((void (**)(void))self->values.internalProps + 4))();
          -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v8, a4, a3, 0LL);
        }
      }
    }
  }

- (void)rehash
{
  unint64_t capacity = self->capacity;
  if (capacity)
  {
    unint64_t v4 = 0LL;
    p_keys = &self->keys;
    unint64_t v6 = (void *)*((unsigned __int8 *)self->keys.internalProps + 3);
    do
    {
      if (p_keys->items[v4] == v6)
      {
        ++v4;
      }

      else
      {
        unint64_t v7 = -[NSConcreteMapTable rehashAround:](self, "rehashAround:", v4);
        if (v7 < v4) {
          break;
        }
        unint64_t capacity = self->capacity;
        unint64_t v4 = v7;
      }
    }

    while (v4 < capacity);
  }

  self->shouldRehash = 0;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  p_keys = &self->keys;
  dealloc((uint64_t)&self->keys, self->capacity);
  dealloc((uint64_t)&self->values, self->capacity);
  if (self->hasDynamicSlices)
  {
    NSSliceDealloc((void **)&p_keys->items);
    NSSliceDealloc((void **)&self->values.items);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSConcreteMapTable;
  -[NSConcreteMapTable dealloc](&v4, sel_dealloc);
}

- (id)description
{
  uint64_t v11 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  -[NSString appendFormat:](v11, "appendFormat:", @"NSMapTable {\n");
  if (self->capacity)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = (*((uint64_t (**)(void **, void))self->keys.internalProps + 3))(&self->keys.items[v3], 0LL);
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v3], 0LL);
      uint64_t v7 = v6;
      if (v5) {
        BOOL v8 = v6 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (!v8)
      {
        uint64_t v9 = (*((uint64_t (**)(uint64_t))self->keys.personalityProps + 4))(v5);
        -[NSString appendFormat:]( v11,  "appendFormat:",  @"[%lu] %@ -> %@\n",  v4,  v9,  (*((uint64_t (**)(uint64_t))self->values.personalityProps + 4))(v7));
      }

      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v5);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v7);
      ++v4;
      ++v3;
    }

    while (v4 < self->capacity);
  }

  -[NSString appendString:](v11, "appendString:", @"}\n");
  return v11;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  p_mutations = &self->mutations;
  a3->var2 = &self->mutations;
  if (a3->var0)
  {
    if (a3->var3[0] == *p_mutations)
    {
      (*((void (**)(unint64_t, SEL))self->keys.internalProps + 4))(a3->var3[1], a2);
      (*((void (**)(unint64_t))self->values.internalProps + 4))(a3->var3[2]);
    }

    else
    {
      objc_enumerationMutation(self);
    }
  }

  else
  {
    a3->var3[0] = *p_mutations;
  }

  unint64_t var0 = a3->var0;
  while (var0 < self->capacity)
  {
    uint64_t v9 = (*((uint64_t (**)(void **, void))self->keys.internalProps + 3))(&self->keys.items[var0], 0LL);
    uint64_t v10 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))( &self->values.items[a3->var0],  0LL);
    unint64_t var0 = a3->var0 + 1;
    a3->unint64_t var0 = var0;
    if (v9) {
      BOOL v11 = v10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      a3->var3[1] = v9;
      char v12 = &a3->var3[1];
      *(v12 - 3) = (unint64_t)v12;
      v12[1] = v10;
      return 1LL;
    }
  }

  return 0LL;
}

- (id)keyEnumerator
{
  return (id)[objc_allocWithZone(MEMORY[0x189604048]) initWithObject:self];
}

- (id)objectEnumerator
{
  return +[NSConcreteMapTableValueEnumerator enumeratorWithMapTable:]( &OBJC_CLASS___NSConcreteMapTableValueEnumerator,  "enumeratorWithMapTable:",  self);
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  if (self->capacity)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    p_keys = &self->keys;
    do
    {
      uint64_t v9 = (const void *)(*((uint64_t (**)(void **, void))p_keys->internalProps + 3))( &p_keys->items[v5],  0LL);
      uint64_t v10 = (const void *)(*((uint64_t (**)(void **, void))self->values.internalProps + 3))( &self->values.items[v5],  0LL);
      (*((void (**)(const void *))p_keys->internalProps + 5))(v9);
      (*((void (**)(const void *))self->values.internalProps + 5))(v10);
      if (v9) {
        BOOL v11 = v10 == 0LL;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        a3[v6] = v9;
        a4[v6++] = v10;
      }

      ++v7;
      ++v5;
    }

    while (v7 < self->capacity);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  char v12 = &a3[v6];
  if (v12 != a4) {
    memmove(v12, a4, 8 * v6);
  }
  return v6;
}

- (unint64_t)hash
{
  if (!*(_BYTE *)(*(void *)(self + 32) + 1LL) && !*(_BYTE *)(*(void *)(self + 64) + 1LL)) {
    return *(void *)(self + 72);
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }

  else if (a3 {
         && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
  }
         && !*((_BYTE *)self->keys.internalProps + 1)
         && !*((_BYTE *)self->values.internalProps + 1)
         && self->count == *((void *)a3 + 9)
         && (personalityProps = self->keys.personalityProps,
             uint64_t v7 = *((void *)a3 + 3),
             *((void *)personalityProps + 3) == *(void *)(v7 + 24))
         && (BOOL v8 = self->values.personalityProps, v9 = *((void *)a3 + 7), *((void *)v8 + 3) == *(void *)(v9 + 24))
         && *((void *)personalityProps + 1) == *(void *)(v7 + 8)
         && *((void *)v8 + 1) == *(void *)(v9 + 8))
  {
    unint64_t capacity = self->capacity;
    if (capacity)
    {
      unint64_t v12 = 0LL;
      while (1)
      {
        if (self->keys.items[v12])
        {
          uint64_t v10 = objc_msgSend(a3, "objectForKey:");
          if (!v10) {
            return v10;
          }
          LODWORD(v10) = (*((uint64_t (**)(void *, uint64_t, void))self->values.personalityProps + 3))( self->values.items[v12],  v10,  *((void *)self->values.personalityProps + 1));
          if (!(_DWORD)v10) {
            return v10;
          }
          unint64_t capacity = self->capacity;
        }

        ++v12;
        LOBYTE(v10) = 1;
        if (v12 >= capacity) {
          return v10;
        }
      }
    }

    LOBYTE(v10) = 1;
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)allKeys
{
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  if (self->capacity)
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(void **, void))self->keys.internalProps + 3))(&self->keys.items[v4], 0LL);
      uint64_t v7 = (*((uint64_t (**)(void **, void))self->values.internalProps + 3))(&self->values.items[v4], 0LL);
      uint64_t v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9) {
        [v3 addObject:v6];
      }
      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v6);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      ++v5;
      ++v4;
    }

    while (v5 < self->capacity);
  }

  return v3;
}

@end