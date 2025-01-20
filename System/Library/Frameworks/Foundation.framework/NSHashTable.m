@interface NSHashTable
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSHashTable)alloc;
+ (NSHashTable)allocWithZone:(_NSZone *)a3;
+ (NSHashTable)hashTableWithOptions:(NSPointerFunctionsOptions)options;
+ (NSHashTable)weakObjectsHashTable;
+ (id)hashTableWithWeakObjects;
- (BOOL)containsObject:(id)anObject;
- (BOOL)intersectsHashTable:(NSHashTable *)other;
- (BOOL)isEqualToHashTable:(NSHashTable *)other;
- (BOOL)isSubsetOfHashTable:(NSHashTable *)other;
- (Class)classForCoder;
- (NSArray)allObjects;
- (NSEnumerator)objectEnumerator;
- (NSHashTable)init;
- (NSHashTable)initWithCoder:(id)a3;
- (NSHashTable)initWithOptions:(NSPointerFunctionsOptions)options capacity:(NSUInteger)initialCapacity;
- (NSHashTable)initWithPointerFunctions:(NSPointerFunctions *)functions capacity:(NSUInteger)initialCapacity;
- (NSPointerFunctions)pointerFunctions;
- (NSSet)setRepresentation;
- (NSUInteger)count;
- (id)anyObject;
- (id)copy;
- (id)description;
- (id)mutableSet;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)object;
- (void)encodeWithCoder:(id)a3;
- (void)getItem:(const void *)a3;
- (void)getKeys:(const void *)a3 count:(unint64_t *)a4;
- (void)insertKnownAbsentItem:(const void *)a3;
- (void)intersectHashTable:(NSHashTable *)other;
- (void)minusHashTable:(NSHashTable *)other;
- (void)removeAllItems;
- (void)removeItem:(const void *)a3;
- (void)unionHashTable:(NSHashTable *)other;
@end

@implementation NSHashTable

+ (NSHashTable)alloc
{
  v2 = (objc_class *)objc_opt_self();
  return (NSHashTable *)NSAllocateObject(v2, 0LL, 0LL);
}

+ (NSHashTable)weakObjectsHashTable
{
  return (NSHashTable *) -[NSConcreteHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
}

- (BOOL)containsObject:(id)anObject
{
  return -[NSHashTable getItem:](self, "getItem:", anObject) != 0;
}

+ (NSHashTable)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_self();
  return (NSHashTable *)NSAllocateObject(v3, 0LL, 0LL);
}

+ (id)hashTableWithWeakObjects
{
  return  -[NSConcreteHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteHashTable),  "initWithOptions:capacity:",  1LL,  0LL);
}

+ (NSHashTable)hashTableWithOptions:(NSPointerFunctionsOptions)options
{
  return (NSHashTable *) -[NSConcreteHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteHashTable),  "initWithOptions:capacity:",  options,  0LL);
}

- (NSHashTable)initWithCoder:(id)a3
{
  return (NSHashTable *)-[NSConcreteHashTable initWithCoder:]( objc_alloc(&OBJC_CLASS___NSConcreteHashTable),  "initWithCoder:",  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSHashTable)initWithOptions:(NSPointerFunctionsOptions)options capacity:(NSUInteger)initialCapacity
{
  v4 = raiseError((uint64_t)self, a2);
  return raiseError((uint64_t)v4, v5);
}

- (NSHashTable)init
{
  v2 = raiseError((uint64_t)self, a2);
  return (NSHashTable *)-[NSHashTable description](v2, v3);
}

- (id)description
{
  v2 = raiseError((uint64_t)self, a2);
  return -[NSHashTable objectEnumerator](v2, v3);
}

- (NSEnumerator)objectEnumerator
{
  v2 = raiseError((uint64_t)self, a2);
  -[NSHashTable encodeWithCoder:](v2, v3, v4);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SEL v3 = raiseError((uint64_t)self, a2);
  -[NSHashTable countByEnumeratingWithState:objects:count:](v3, v4, v5, v6, v7);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v5 = raiseError((uint64_t)self, a2);
  return -[NSHashTable count](v5, v6);
}

- (NSUInteger)count
{
  v2 = raiseError((uint64_t)self, a2);
  return (NSUInteger)-[NSHashTable allObjects](v2, v3);
}

- (NSArray)allObjects
{
  v2 = raiseError((uint64_t)self, a2);
  return (NSArray *)-[NSHashTable weakCount](v2, v3);
}

- (void)getItem:(const void *)a3
{
  SEL v3 = raiseError((uint64_t)self, a2);
  -[NSHashTable addObject:](v3, v4, v5);
  return result;
}

- (void)addObject:(id)object
{
  SEL v3 = raiseError((uint64_t)self, a2);
  -[NSHashTable insertKnownAbsentItem:](v3, v4, v5);
}

- (void)insertKnownAbsentItem:(const void *)a3
{
  SEL v3 = raiseError((uint64_t)self, a2);
  -[NSHashTable removeItem:](v3, v4, v5);
}

- (void)removeItem:(const void *)a3
{
  SEL v3 = raiseError((uint64_t)self, a2);
  -[NSHashTable copy](v3, v4);
}

- (id)copy
{
  v2 = raiseError((uint64_t)self, a2);
  -[NSHashTable removeAllItems](v2, v3);
  return result;
}

- (void)removeAllItems
{
  v2 = raiseError((uint64_t)self, a2);
  -[NSHashTable getKeys:count:](v2, v3, v4, v5);
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  SEL v4 = raiseError((uint64_t)self, a2);
  -[NSHashTable initWithPointerFunctions:capacity:](v4, v5, v6, v7);
}

- (NSHashTable)initWithPointerFunctions:(NSPointerFunctions *)functions capacity:(NSUInteger)initialCapacity
{
  SEL v4 = raiseError((uint64_t)self, a2);
  return (NSHashTable *)-[NSHashTable pointerFunctions](v4, v5);
}

- (NSPointerFunctions)pointerFunctions
{
  v2 = raiseError((uint64_t)self, a2);
  -[NSHashTable removeAllObjects](v2, v3);
  return result;
}

- (id)anyObject
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  memset(v4, 0, sizeof(v4));
  id result = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  v4,  &v3,  16LL);
  if (result) {
    return (id)**((void **)&v4[0] + 1);
  }
  return result;
}

- (BOOL)intersectsHashTable:(NSHashTable *)other
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(self);
        }
        if (-[NSHashTable member:](other, "member:", *(void *)(*((void *)&v11 + 1) + 8 * v8)))
        {
          LOBYTE(v5) = 1;
          return v5;
        }

        ++v8;
      }

      while (v6 != v8);
      unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      unint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return v5;
}

- (BOOL)isEqualToHashTable:(NSHashTable *)other
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (other == self) {
    goto LABEL_12;
  }
  NSUInteger v5 = -[NSHashTable count](other, "count");
  if (v5 != -[NSHashTable count](self, "count"))
  {
    LOBYTE(v10) = 0;
    return (char)v10;
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (!v6)
  {
LABEL_12:
    LOBYTE(v10) = 1;
  }

  else
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(self);
      }
      id v10 = -[NSHashTable member:](other, "member:", *(void *)(*((void *)&v13 + 1) + 8 * v9));
      if (!v10) {
        break;
      }
      if (v7 == ++v9)
      {
        unint64_t v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
        LOBYTE(v10) = 1;
        if (v7) {
          goto LABEL_5;
        }
        return (char)v10;
      }
    }
  }

  return (char)v10;
}

- (BOOL)isSubsetOfHashTable:(NSHashTable *)other
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(self);
      }
      id v9 = -[NSHashTable member:](other, "member:", *(void *)(*((void *)&v12 + 1) + 8 * v8));
      if (!v9) {
        break;
      }
      if (v6 == ++v8)
      {
        unint64_t v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }

  return (char)v9;
}

- (void)intersectHashTable:(NSHashTable *)other
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  NSUInteger v5 = -[NSHashTable count](self, "count");
  if (v5 >> 60)
  {
    CFStringRef v15 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5);
    uint64_t v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v15 userInfo:0];
    CFRelease(v15);
    objc_exception_throw(v16);
  }

  if (v5 <= 1) {
    NSUInteger v5 = 1LL;
  }
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (uint64_t *)&v18[-v6];
  if (v8 >= 0x101)
  {
    uint64_t v7 = (uint64_t *)_CFCreateArrayStorage();
    id v9 = v7;
  }

  else
  {
    id v9 = 0LL;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  unint64_t v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
  __int128 v11 = v7;
  if (v10)
  {
    uint64_t v12 = *(void *)v20;
    __int128 v11 = v7;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(self);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (!-[NSHashTable member:](other, "member:", v14)) {
          *v11++ = v14;
        }
      }

      unint64_t v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
    }

    while (v10);
  }

  while (v7 < v11)
    -[NSHashTable removeObject:](self, "removeObject:", *v7++);
  free(v9);
}

- (void)unionHashTable:(NSHashTable *)other
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (other != self)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( other,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(other);
          }
          -[NSHashTable addObject:](self, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v8++));
        }

        while (v6 != v8);
        unint64_t v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( other,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
      }

      while (v6);
    }
  }

- (void)minusHashTable:(NSHashTable *)other
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (other == self)
  {
    -[NSHashTable removeAllObjects](other, "removeAllObjects");
  }

  else
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( other,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(other);
          }
          -[NSHashTable removeObject:](self, "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * i));
        }

        unint64_t v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( other,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
      }

      while (v6);
    }
  }

- (id)mutableSet
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
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
      unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (NSSet)setRepresentation
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (NSSet *)[MEMORY[0x189603FE0] set];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v4 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
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
        -[NSSet addObject:](v3, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      unint64_t v5 = -[NSHashTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end