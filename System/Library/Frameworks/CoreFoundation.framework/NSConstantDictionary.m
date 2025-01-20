@interface NSConstantDictionary
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSConstantDictionary)new;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSConstantDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)allKeys;
- (id)allValues;
- (id)keyEnumerator;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation NSConstantDictionary

- (NSConstantDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  qword_18C539A70 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t options = self->_options;
  size_t count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  id v11 = a3;
  if (!count) {
    return 0LL;
  }
  if (count == 1 && *keys == a3) {
    return (id)*objects;
  }
  if ((options & 2) != 0)
  {
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0LL;
    }

    if ((options & 1) == 0)
    {
LABEL_22:
      while (1)
      {
        v10 = (void *)*keys;
        if (*keys == a3) {
          break;
        }
        if ((options & 2) != 0)
        {
          if (objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12)) {
            return (id)*objects;
          }
        }

        else if ([v10 isEqualToString:a3])
        {
          return (id)*objects;
        }

        id result = 0LL;
        ++objects;
        ++keys;
        if (!--count) {
          return result;
        }
      }

      return (id)*objects;
    }

    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
  }

  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          id result = 0LL;
          ++objects;
          ++keys;
          if (!--count) {
            return result;
          }
        }

        return (id)*objects;
      }

      return 0LL;
    }

    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToString:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0LL;
    }

    if ((options & 1) == 0) {
      goto LABEL_22;
    }
    v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
  }

  id result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result) {
    return result;
  }
  objects = (const void **)((char *)objects + (_BYTE *)result - (_BYTE *)keys);
  return (id)*objects;
}

- (id)keyEnumerator
{
  return  -[__NSConstantDictionaryEnumerator initWithConstantDictionary:enumerateKeys:]( objc_alloc(&OBJC_CLASS_____NSConstantDictionaryEnumerator),  "initWithConstantDictionary:enumerateKeys:",  self,  1LL);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  unint64_t v7 = a5 >> 61;
  if (a3 && v7 || a4 && v7)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSConstantDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSConstantDictionary getObjects:andKeys:count:]",  a5);
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
    objc_exception_throw(v12);
  }

  size_t v8 = 8 * self->_count;
  if (a4) {
    memmove(a4, self->_keys, v8);
  }
  if (a3) {
    memmove(a3, self->_objects, v8);
  }
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (a3)
  {
    if (self->_count)
    {
      unint64_t v7 = 0LL;
      do
      {
        ((void (*)(const void *, const void *, void *))a3)(self->_keys[v7], self->_objects[v7], a4);
        ++v7;
      }

      while (v7 < self->_count);
    }
  }

  else
  {
    uint64_t v8 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v8);
    v9 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v9);
    -[NSConstantDictionary allKeys](v10, v11);
  }

- (id)allKeys
{
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", self->_keys, self->_count);
}

- (id)allValues
{
  return +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  self->_objects,  self->_count);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_18;
  }

  if (a5 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSConstantDictionary countByEnumeratingWithState:objects:count:]",  a5);
LABEL_18:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v16);
  }

  unint64_t count = self->_count;
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_4;
  }
  if (count <= var0) {
    return 0LL;
  }
  a3->var1 = a4;
  if (!a5) {
    return 0LL;
  }
  unint64_t v7 = 0LL;
  do
  {
    uint64_t v8 = (void *)self->_keys[var0++];
    a3->unint64_t var0 = var0;
    if (v8)
    {
      a4[v7++] = v8;
      unint64_t var0 = a3->var0;
    }
  }

  while (var0 < count && v7 < a5);
  return v7;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSConstantDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v9);
    objc_exception_throw(v11);
  }

  unint64_t count = self->_count;
  v12[7] = 0;
  if (count)
  {
    for (unint64_t i = 0LL; i < count; ++i)
    {
      if (self->_keys[i])
      {
        uint64_t v8 = (void *)_CFAutoreleasePoolPush();
        __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v8);
      }
    }
  }

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t count = self->_count;
  char v13 = 0;
  if (!count) {
    return 0LL;
  }
  unint64_t v7 = 0LL;
  for (uint64_t i = 0LL; i != count; ++i)
  {
    uint64_t v9 = (void *)self->_keys[i];
    if (v9)
    {
      uint64_t v10 = self->_objects[i];
      uint64_t v11 = (void *)_CFAutoreleasePoolPush();
      if ((*((unsigned int (**)(id, void *, const void *, char *))a4 + 2))(a4, v9, v10, &v13))
      {
        char v13 = 1;
        unint64_t v7 = v9;
      }

      _CFAutoreleasePoolPop(v11);
      if (v13) {
        break;
      }
    }
  }

  return v7;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSConstantDictionary keysOfEntriesWithOptions:passingTest:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v13);
    objc_exception_throw(v15);
  }

  unint64_t count = self->_count;
  unint64_t v7 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set", a3);
  HIBYTE(v16) = 0;
  if (count)
  {
    for (unint64_t i = 0LL; i < count; ++i)
    {
      uint64_t v9 = self->_keys[i];
      if (v9)
      {
        uint64_t v10 = self->_objects[i];
        uint64_t v11 = (void *)_CFAutoreleasePoolPush();
        if ((*((unsigned int (**)(id, const void *, const void *, char *))a4 + 2))( a4,  v9,  v10,  (char *)&v16 + 7))
        {
          -[NSSet addObject:](v7, "addObject:", v9);
        }

        _CFAutoreleasePoolPop(v11);
        if (HIBYTE(v16)) {
          break;
        }
      }
    }
  }

  return +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v7);
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t options = self->_options;
  size_t count = self->_count;
  keys = self->_keys;
  objects = self->_objects;
  id v11 = a3;
  if (!count) {
    return 0LL;
  }
  if (count == 1 && *keys == a3) {
    return (id)*objects;
  }
  if ((options & 2) != 0)
  {
    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToNumber:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0LL;
    }

    if ((options & 1) == 0)
    {
LABEL_22:
      while (1)
      {
        uint64_t v10 = (void *)*keys;
        if (*keys == a3) {
          break;
        }
        if ((options & 2) != 0)
        {
          if (objc_msgSend(v10, "isEqualToNumber:", a3, v11, v12)) {
            return (id)*objects;
          }
        }

        else if ([v10 isEqualToString:a3])
        {
          return (id)*objects;
        }

        id result = 0LL;
        ++objects;
        ++keys;
        if (!--count) {
          return result;
        }
      }

      return (id)*objects;
    }

    uint64_t v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForNumericKeys;
  }

  else
  {
    if ((_NSIsNSString((uint64_t)a3) & 1) == 0)
    {
      if (!options)
      {
        while (*keys != a3 && (objc_msgSend((id)*keys, "isEqual:", a3, v11, v12) & 1) == 0)
        {
          id result = 0LL;
          ++objects;
          ++keys;
          if (!--count) {
            return result;
          }
        }

        return (id)*objects;
      }

      return 0LL;
    }

    if (count == 1)
    {
      if (objc_msgSend(a3, "isEqualToString:", *keys, v11, v12)) {
        return (id)*objects;
      }
      return 0LL;
    }

    if ((options & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v9 = (int (__cdecl *)(const void *, const void *))comparisonUsingOrderingForStringKeys;
  }

  id result = bsearch(&v11, keys, count, 8uLL, v9);
  if (!result) {
    return result;
  }
  objects = (const void **)((char *)objects + (_BYTE *)result - (_BYTE *)keys);
  return (id)*objects;
}

- (id)objectEnumerator
{
  return  -[__NSConstantDictionaryEnumerator initWithConstantDictionary:enumerateKeys:]( objc_alloc(&OBJC_CLASS_____NSConstantDictionaryEnumerator),  "initWithConstantDictionary:enumerateKeys:",  self,  0LL);
}

+ (NSConstantDictionary)new
{
  return (NSConstantDictionary *)objc_opt_new();
}

- (id)mutableCopy
{
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return result;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end