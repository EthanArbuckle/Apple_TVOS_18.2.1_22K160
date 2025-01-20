@interface NSCountedSet
+ (BOOL)supportsSecureCoding;
- (NSCountedSet)init;
- (NSCountedSet)initWithArray:(NSArray *)array;
- (NSCountedSet)initWithCapacity:(NSUInteger)numItems;
- (NSCountedSet)initWithCoder:(id)a3;
- (NSCountedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (NSCountedSet)initWithSet:(NSSet *)set;
- (NSCountedSet)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (NSEnumerator)objectEnumerator;
- (NSUInteger)countForObject:(id)object;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)object;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)object;
@end

@implementation NSCountedSet

- (NSUInteger)countForObject:(id)object
{
  v7[1] = *(const void **)MEMORY[0x1895F89C0];
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    if (object) {
      JUMPOUT(0x186E1D35CLL);
    }
    return 0LL;
  }

  if (!object) {
    return 0LL;
  }
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v7)) {
    return (NSUInteger)v7[0];
  }
  else {
    return 0LL;
  }
}

- (void)addObject:(id)object
{
  v9[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!object) {
    _NSSetRaiseInsertNilException((objc_class *)self, a2);
  }
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFBagAddValue((CFMutableBagRef)self->_table, object);
  }

  else
  {
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, v9))
    {
      uint64_t v6 = (uint64_t)++v9[0];
      table = (__CFDictionary *)self->_table;
      id v8 = object;
    }

    else
    {
      table = (__CFDictionary *)self->_table;
      id v8 = object;
      uint64_t v6 = 1LL;
    }

    CFDictionarySetValue(table, v8, (const void *)v6);
  }

- (void)removeObject:(id)object
{
  value[1] = *(void **)MEMORY[0x1895F89C0];
  if (!object)
  {
    id v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to remove nil", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }

  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    CFBagRemoveValue((CFMutableBagRef)self->_table, object);
  }

  else if (CFDictionaryGetValueIfPresent((CFDictionaryRef)self->_table, object, (const void **)value))
  {
    table = (__CFDictionary *)self->_table;
    v7 = --value[0];
    if (value[0]) {
      CFDictionarySetValue(table, object, v7);
    }
    else {
      CFDictionaryRemoveValue(table, object);
    }
  }

- (unint64_t)count
{
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table)) {
    JUMPOUT(0x186E1E604LL);
  }
  return CFDictionaryGetCount((CFDictionaryRef)self->_table);
}

- (id)member:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table)) {
    return (id)CFBagGetValue((CFBagRef)self->_table, a3);
  }
  return 0LL;
}

- (NSEnumerator)objectEnumerator
{
  CFTypeID TypeID = CFBagGetTypeID();
  CFTypeID v4 = CFGetTypeID(self->_table);
  id v5 = objc_allocWithZone(MEMORY[0x189604048]);
  if (TypeID == v4) {
    table = self;
  }
  else {
    table = self->_table;
  }
  return (NSEnumerator *)(id)[v5 initWithObject:table];
}

- (void)removeAllObjects
{
  CFTypeID TypeID = CFBagGetTypeID();
  CFTypeID v4 = CFGetTypeID(self->_table);
  table = (__CFBag *)self->_table;
  if (TypeID == v4) {
    CFBagRemoveAllValues(table);
  }
  else {
    CFDictionaryRemoveAllValues(table);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_allocWithZone((Class)objc_opt_class()) initWithSet:self copyItems:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_allocWithZone((Class)objc_opt_class()) initWithSet:self copyItems:0];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  CFTypeID TypeID = CFBagGetTypeID();
  if (TypeID == CFGetTypeID(self->_table))
  {
    unint64_t v10 = _CFBagFastEnumeration();
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSCountedSet;
    return -[NSCountedSet countByEnumeratingWithState:objects:count:]( &v12,  sel_countByEnumeratingWithState_objects_count_,  a3,  a4,  a5);
  }

  return v10;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v7 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(self);
      }
      if (a4 == v10) {
        break;
      }
      *a3++ = *(id *)(*((void *)&v12 + 1) + 8 * v10);
      if (v8 == ++v10)
      {
        unint64_t v8 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
        a4 -= v10;
        if (v8) {
          goto LABEL_3;
        }
        return;
      }
    }
  }

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  char v5 = [a3 allowsKeyedCoding];
  unint64_t v6 = -[NSCountedSet count](self, "count");
  uint64_t v7 = v6;
  if ((v5 & 1) != 0)
  {
    [a3 encodeInt64:v6 forKey:@"NS.count"];
    unint64_t v8 = -[NSCountedSet objectEnumerator](self, "objectEnumerator");
    uint64_t v9 = -[NSEnumerator nextObject](v8, "nextObject");
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0LL;
      do
      {
        [a3 encodeObject:v10, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object%qd", v11) forKey];
        [a3 encodeInt64:-[NSCountedSet countForObject:](self, "countForObject:", v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.count%qd", v11++) forKey];
        uint64_t v10 = -[NSEnumerator nextObject](v8, "nextObject");
      }

      while (v10);
    }
  }

  else
  {
    int v20 = v6;
    uint64_t v12 = [a3 encodeValueOfObjCType:"I" at:&v20];
    if (v7 >= 1)
    {
      if ((unint64_t)v7 >> 60)
      {
        CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
        v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v17 userInfo:0];
        CFRelease(v17);
        objc_exception_throw(v18);
        __break(1u);
      }

      else
      {
        *(void *)&double v13 = MEMORY[0x1895F8858](v12).n128_u64[0];
        __int128 v15 = (uint64_t *)((char *)&v19 - v14);
        if ((unint64_t)v7 >= 0x101)
        {
          __int128 v15 = (void *)_CFCreateArrayStorage();
          uint64_t v16 = v15;
        }

        else
        {
          uint64_t v16 = 0LL;
        }

        -[NSCountedSet getObjects:count:](self, "getObjects:count:", v15, v7, v13);
        do
        {
          [a3 encodeBycopyObject:*v15];
          int v20 = -[NSCountedSet countForObject:](self, "countForObject:", *v15);
          [a3 encodeValueOfObjCType:"I" at:&v20];
          ++v15;
          --v7;
        }

        while (v7);
        free(v16);
      }
    }
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCountedSet)initWithCoder:(id)a3
{
  v44[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    unint64_t v6 = [a3 decodeInt64ForKey:@"NS.count"];
    if (v6 >> 60)
    {
      uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: cannot decode set with %qd elements in this version",  _NSMethodExceptionProem((objc_class *)self, a2),  v6);

      uint64_t v8 = *MEMORY[0x189604F40];
      v43 = @"NSLocalizedDescription";
      v44[0] = v7;
      uint64_t v9 = (void *)MEMORY[0x189603F68];
      uint64_t v10 = (NSString **)v44;
      uint64_t v11 = &v43;
    }

    else
    {
      uint64_t v12 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v6);
      if (!v12 || !v6) {
        return v12;
      }
      uint64_t v16 = 0LL;
      while (1)
      {
        CFStringRef v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.object%qd", v16);
        v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.count%qd", v16);
        if (![a3 containsValueForKey:v17]
          || ![a3 containsValueForKey:v18])
        {
          v24 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: mismatch in count stored (%llu) vs count present (%llu)",  _NSMethodExceptionProem((objc_class *)v12, a2),  v6,  v16);

          uint64_t v8 = *MEMORY[0x189604F40];
          v35 = @"NSLocalizedDescription";
          v36 = v24;
          uint64_t v9 = (void *)MEMORY[0x189603F68];
          uint64_t v10 = &v36;
          uint64_t v11 = &v35;
          goto LABEL_4;
        }

        uint64_t v19 = [a3 decodeObjectForKey:v17];
        if (!v19)
        {
          v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: decode failure at index %llu - item nil",  _NSMethodExceptionProem((objc_class *)v12, a2),  v16);

          uint64_t v8 = *MEMORY[0x189604F40];
          v41 = @"NSLocalizedDescription";
          v42 = v25;
          uint64_t v9 = (void *)MEMORY[0x189603F68];
          uint64_t v10 = &v42;
          uint64_t v11 = &v41;
          goto LABEL_4;
        }

        uint64_t v20 = v19;
        unint64_t v21 = [a3 decodeInt64ForKey:v18];
        if (!v21)
        {
          v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: decode failure at index %llu -- itemCount zero",  _NSMethodExceptionProem((objc_class *)v12, a2),  v16);

          uint64_t v8 = *MEMORY[0x189604F40];
          v39 = @"NSLocalizedDescription";
          v40 = v26;
          uint64_t v9 = (void *)MEMORY[0x189603F68];
          uint64_t v10 = &v40;
          uint64_t v11 = &v39;
          goto LABEL_4;
        }

        unint64_t v22 = v21;
        if (v21 >> 60) {
          break;
        }
        do
        {
          --v22;
          -[NSCountedSet addObject:](v12, "addObject:", v20);
        }

        while (v22);
        if (++v16 == v6) {
          return v12;
        }
      }

      v27 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: cannot store %qd instances of item '%@' in this version",  _NSMethodExceptionProem((objc_class *)v12, a2),  v21,  v20);

      uint64_t v8 = *MEMORY[0x189604F40];
      v37 = @"NSLocalizedDescription";
      v38 = v27;
      uint64_t v9 = (void *)MEMORY[0x189603F68];
      uint64_t v10 = &v38;
      uint64_t v11 = &v37;
    }

- (id)descriptionWithLocale:(id)a3
{
  v22[3] = *MEMORY[0x1895F89C0];
  unint64_t v5 = -[NSCountedSet count](self, "count");
  if (v5)
  {
    unint64_t v6 = v5;
    id v7 = (id)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:v5 << 6];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "appendFormat:", @"<%@: %p> ("), NSStringFromClass(v8), self;
    if (v6 >> 60)
    {
      CFStringRef v19 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
      uint64_t v20 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v19 userInfo:0];
      CFRelease(v19);
      objc_exception_throw(v20);
      _Unwind_Resume(v21);
    }

    v22[1] = v22;
    *(void *)&double v10 = MEMORY[0x1895F8858](v9).n128_u64[0];
    uint64_t v12 = (id *)((char *)v22 - v11);
    if (v6 >= 0x101)
    {
      uint64_t v12 = (id *)_CFCreateArrayStorage();
      unint64_t v13 = v12;
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    -[NSCountedSet getObjects:count:](self, "getObjects:count:", v12, v6, v10);
    char v16 = 1;
    do
    {
      if ((v16 & 1) == 0) {
        objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length"), 0, @", ");
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v17 = [v7 length];
        uint64_t v18 = [*v12 descriptionWithLocale:a3];
      }

      else
      {
        uint64_t v17 = [v7 length];
        uint64_t v18 = [*v12 description];
      }

      objc_msgSend(v7, "replaceCharactersInRange:withString:", v17, 0, v18);
      objc_msgSend(v7, "appendFormat:", @" [%ld]", -[NSCountedSet countForObject:](self, "countForObject:", *v12));
      char v16 = 0;
      ++v12;
      --v6;
    }

    while (v6);
    objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length"), 0, @""));
    free(v13);
    return v7;
  }

  else
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> ()",  NSStringFromClass(v14),  self);
  }

- (NSCountedSet)init
{
  return -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", 0LL);
}

- (NSCountedSet)initWithCapacity:(NSUInteger)numItems
{
  self->_table = CFBagCreateMutable(0LL, 0LL, MEMORY[0x189605230]);
  return self;
}

- (NSCountedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  _NSSetCheckSize((objc_class *)self, a2, a4, (uint64_t)"count");
  uint64_t v8 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v4);
  if (!v4) {
    return v8;
  }
  while (*a3)
  {
    --v4;
    -[NSCountedSet addObject:](v8, "addObject:");
    ++a3;
    if (!v4) {
      return v8;
    }
  }

  _NSSetRaiseInsertNilException((objc_class *)v8, a2);
  return -[NSCountedSet initWithSet:copyItems:](v10, v11, v12, v13);
}

- (NSCountedSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 count];
  uint64_t v8 = -[NSCountedSet initWithCapacity:](self, "initWithCapacity:", v7);
  if (v7)
  {
    uint64_t v9 = (void *)[a3 objectEnumerator];
    uint64_t v10 = [v9 nextObject];
    if (v10)
    {
      SEL v11 = (void *)v10;
      do
      {
        uint64_t v12 = [a3 countForObject:v11];
        if (v4) {
          id v13 = (id)[v11 copyWithZone:0];
        }
        else {
          id v13 = v11;
        }
        uint64_t v14 = v13;
        while (v12)
        {
          --v12;
          -[NSCountedSet addObject:](v8, "addObject:", v14);
        }

        SEL v11 = (void *)[v9 nextObject];
      }

      while (v11);
    }
  }

  return v8;
}

- (NSCountedSet)initWithArray:(NSArray *)array
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCountedSet;
  return -[NSCountedSet initWithArray:](&v4, sel_initWithArray_, array);
}

- (NSCountedSet)initWithSet:(NSSet *)set
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCountedSet;
  return -[NSCountedSet initWithSet:](&v4, sel_initWithSet_, set);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id table = self->_table;
  if (table)
  {

    self->_id table = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSCountedSet;
  -[NSCountedSet dealloc](&v4, sel_dealloc);
}

@end