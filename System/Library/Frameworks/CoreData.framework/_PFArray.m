@interface _PFArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (void)initialize;
- (Class)classForCoder;
- (_PFArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5;
- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5 andContext:(id)a6;
- (id)_objectsPointer;
- (id)arrayFromObjectIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)subarrayWithRange:(_NSRange)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation _PFArray

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5 andContext:(id)a6
{
  char v7 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____PFArray;
  v10 = -[_PFArray init](&v17, sel_init);
  v11 = (_PFArray *)v10;
  if (v10)
  {
    *((_DWORD *)v10 + 3) = a4;
    v12 = v10 + 32;
    char v13 = v10[32] & 0xF0 | v7 & 0xB | 0x10;
    if ((v7 & 0x10) == 0) {
      char v13 = v10[32] & 0xE0 | v7 & 0xB;
    }
    if ((v7 & 0x20) != 0)
    {
      _BYTE *v12 = v13 | 0x20;
      if (a6
        && _PF_shouldAsyncProcessReferenceQueue
        && ([a6 concurrencyType] == 1 || objc_msgSend(a6, "concurrencyType") == 2))
      {
        v11->_weakContext = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  a6);
      }
    }

    else
    {
      _BYTE *v12 = v13 & 0xDB;
    }

    *((_DWORD *)&v11->_flags + 1) &= 0xF8000000;
    if (a4)
    {
      if ((*v12 & 0x10) != 0)
      {
        v11->_array = (id *)PF_ALLOCATE_OBJECT_ARRAY(a4);
        *v12 |= 8u;
        memmove(v11->_array, a3, 8LL * a4);
      }

      else
      {
        v11->_array = a3;
      }

      if ((*v12 & 1) != 0)
      {
        uint64_t v14 = 0LL;
        do
          id v15 = v11->_array[v14++];
        while (a4 != v14);
      }
    }
  }

  return v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)_objectsPointer
{
  return self->_array;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&self->_count;
  }
  unint64_t result = 0LL;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t count = self->_count;
    if (var0 < count)
    {
      unint64_t result = 0LL;
      do
        a4[result++] = self->_array[var0++];
      while (var0 < count && result < a5);
    }
  }

  a3->unint64_t var0 = var0;
  return result;
}

- (void)dealloc
{
  char flags = (char)self->_flags;
  if (self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 6) != 0)
    {
      unint64_t v4 = 0LL;
      do

      while (v4 < self->_count);
      char flags = (char)self->_flags;
    }

    if ((flags & 8) != 0)
    {
      array = self->_array;
LABEL_10:
      PF_FREE_OBJECT_ARRAY(array);
    }
  }

  else if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    array = self->_array;
    if (array) {
      goto LABEL_10;
    }
  }

  if (self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    {
      weakContext = self->_weakContext;
      if (weakContext)
      {
        id WeakRetained = objc_loadWeakRetained(&weakContext->_object);
        if (WeakRetained)
        {
          v8 = WeakRetained;
          -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);
        }
      }
    }
  }

  self->_weakContext = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PFArray;
  -[_PFArray dealloc](&v9, sel_dealloc);
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count > a3) {
    return self->_array[a3];
  }
  [MEMORY[0x189603F70] raise:*MEMORY[0x189603B40], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a3, self->_count format];
  return 0LL;
}

+ (void)initialize
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return -[_PFArray initWithObjects:count:andFlags:](self, "initWithObjects:count:andFlags:", a3, a4, 27LL);
}

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5
{
  return -[_PFArray initWithObjects:count:andFlags:andContext:]( self,  "initWithObjects:count:andFlags:andContext:",  a3,  *(void *)&a4,  *(void *)&a5,  0LL);
}

- (id)arrayFromObjectIDs
{
  return -[_PFArray newArrayFromObjectIDs](self, "newArrayFromObjectIDs");
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t count = self->_count;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0) {
    return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0LL, count);
  }
  else {
    return -[_PFArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0LL, count);
  }
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v8 = a4.location + a4.length;
  uint64_t v9 = [a3 methodForSelector:sel_isEqual_];
  if (location >= v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (uint64_t (*)(id, char *))v9;
  while (self->_array[location] != a3 && (v10(a3, sel_isEqual_) & 1) == 0)
  {
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return location;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0LL, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  if (!a3 || a4.location >= a4.location + a4.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (self->_array[a4.location] != a3)
  {
    ++a4.location;
    if (!--a4.length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return a4.location;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [a3 methodForSelector:sel_isEqual_];
  uint64_t count = self->_count;
  if (!(_DWORD)count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  char v7 = (uint64_t (*)(id, char *))v5;
  unint64_t v8 = 0LL;
  while (*((id *)self->_array[v8] + 5) != a3 && (v7(a3, sel_isEqual_) & 1) == 0)
  {
    if (count == ++v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v8;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  v3 = (id *)self->_array[a3];
  if ((*(_BYTE *)&self->_flags & 0x20) != 0) {
    return v3[5];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return v3;
  }
  else {
    return 0LL;
  }
}

- (id)subarrayWithRange:(_NSRange)a3
{
  if (a3.location + a3.length <= self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 0x20) != 0) {
      uint64_t v4 = 59LL;
    }
    else {
      uint64_t v4 = 27LL;
    }
    return  -[_PFArray initWithObjects:count:andFlags:]( objc_alloc(&OBJC_CLASS____PFArray),  "initWithObjects:count:andFlags:",  &self->_array[a3.location],  a3.length,  v4);
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS____PFArray;
    return -[_PFArray subarrayWithRange:](&v5, sel_subarrayWithRange_, a3.location, a3.length);
  }

- (id)newArrayFromObjectIDs
{
  v10[1] = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 0x20) == 0) {
    return (id)-[_PFArray copy](self, "copy");
  }
  uint64_t count = self->_count;
  if ((_DWORD)count) {
    uint64_t v5 = self->_count;
  }
  else {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  char v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0LL);
  if (count >= 0x201)
  {
    char v7 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0LL), 8 * v5);
    if (!(_DWORD)count) {
      goto LABEL_15;
    }
  }

  for (uint64_t i = 0LL; i != count; ++i)
    *(void *)&v7[8 * i] = [self->_array[i] objectID];
LABEL_15:
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v7 count:count];
  return v9;
}

- (void)getObjects:(id *)a3
{
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_count) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603B40], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count format];
  }
  if (length) {
    memmove(a3, &self->_array[location], 8 * length);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:self->_array count:self->_count];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:self->_array count:self->_count];
}

@end