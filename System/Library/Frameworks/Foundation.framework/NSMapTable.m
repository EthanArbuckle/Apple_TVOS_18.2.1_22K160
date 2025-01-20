@interface NSMapTable
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSMapTable)alloc;
+ (NSMapTable)allocWithZone:(_NSZone *)a3;
+ (NSMapTable)mapTableWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions;
+ (NSMapTable)strongToStrongObjectsMapTable;
+ (NSMapTable)strongToWeakObjectsMapTable;
+ (NSMapTable)weakToStrongObjectsMapTable;
+ (NSMapTable)weakToWeakObjectsMapTable;
+ (id)mapTableWithStrongToStrongObjects;
+ (id)mapTableWithStrongToWeakObjects;
+ (id)mapTableWithWeakToStrongObjects;
+ (id)mapTableWithWeakToWeakObjects;
- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5;
- (Class)classForCoder;
- (NSDictionary)dictionaryRepresentation;
- (NSEnumerator)keyEnumerator;
- (NSEnumerator)objectEnumerator;
- (NSMapTable)init;
- (NSMapTable)initWithCoder:(id)a3;
- (NSMapTable)initWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions capacity:(NSUInteger)initialCapacity;
- (NSMapTable)initWithKeyPointerFunctions:(NSPointerFunctions *)keyFunctions valuePointerFunctions:(NSPointerFunctions *)valueFunctions capacity:(NSUInteger)initialCapacity;
- (NSPointerFunctions)keyPointerFunctions;
- (NSPointerFunctions)valuePointerFunctions;
- (NSUInteger)count;
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)enumerator;
- (id)mutableDictionary;
- (id)objectForKey:(id)aKey;
- (unint64_t)__capacity;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)removeAllItems;
- (void)removeObjectForKey:(id)aKey;
- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4;
- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4;
- (void)setItem:(const void *)a3 forKey:(const void *)a4;
- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4;
- (void)setObject:(id)anObject forKey:(id)aKey;
@end

@implementation NSMapTable

+ (NSMapTable)strongToWeakObjectsMapTable
{
  return (NSMapTable *) -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  5LL,  16LL);
}

+ (NSMapTable)alloc
{
  v2 = (objc_class *)objc_opt_self();
  return (NSMapTable *)NSAllocateObject(v2, 0LL, 0LL);
}

+ (NSMapTable)mapTableWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions
{
  return (NSMapTable *) -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  keyOptions,  valueOptions,  16LL);
}

+ (NSMapTable)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_self();
  return (NSMapTable *)NSAllocateObject(v3, 0LL, 0LL);
}

+ (id)mapTableWithStrongToStrongObjects
{
  return  -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  16LL);
}

+ (id)mapTableWithWeakToStrongObjects
{
  return  -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  1LL,  0LL,  16LL);
}

+ (id)mapTableWithStrongToWeakObjects
{
  return  -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  1LL,  16LL);
}

+ (id)mapTableWithWeakToWeakObjects
{
  return  -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  1LL,  1LL,  16LL);
}

+ (NSMapTable)strongToStrongObjectsMapTable
{
  return (NSMapTable *) -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  16LL);
}

+ (NSMapTable)weakToStrongObjectsMapTable
{
  return (NSMapTable *) -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  5LL,  0LL,  16LL);
}

+ (NSMapTable)weakToWeakObjectsMapTable
{
  return (NSMapTable *) -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithKeyOptions:valueOptions:capacity:",  5LL,  5LL,  16LL);
}

- (NSMapTable)initWithCoder:(id)a3
{
  return (NSMapTable *)-[NSConcreteMapTable initWithCoder:]( objc_alloc(&OBJC_CLASS___NSConcreteMapTable),  "initWithCoder:",  a3);
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

- (NSMapTable)initWithKeyOptions:(NSPointerFunctionsOptions)keyOptions valueOptions:(NSPointerFunctionsOptions)valueOptions capacity:(NSUInteger)initialCapacity
{
  v5 = raiseError_0((uint64_t)self, a2);
  return raiseError_0((uint64_t)v5, v6);
}

- (NSMapTable)initWithKeyPointerFunctions:(NSPointerFunctions *)keyFunctions valuePointerFunctions:(NSPointerFunctions *)valueFunctions capacity:(NSUInteger)initialCapacity
{
  v5 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable init](v5, v6);
}

- (NSMapTable)init
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (NSMapTable *)-[NSMapTable description](v2, v3);
}

- (id)description
{
  v2 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable encodeWithCoder:](v2, v3, v4);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SEL v3 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable count](v3, v4);
}

- (NSUInteger)count
{
  v2 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable __capacity](v2, v3);
}

- (unint64_t)__capacity
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (unint64_t)-[NSMapTable keyEnumerator](v2, v3);
}

- (NSEnumerator)keyEnumerator
{
  v2 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable objectEnumerator](v2, v3);
}

- (NSEnumerator)objectEnumerator
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (NSEnumerator *)-[NSMapTable copy](v2, v3);
}

- (id)copy
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v2, v3, v4, v5, v6);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v5 = raiseError_0((uint64_t)self, a2);
  return (unint64_t)-[NSMapTable keyPointerFunctions](v5, v6);
}

- (NSPointerFunctions)keyPointerFunctions
{
  v2 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable valuePointerFunctions](v2, v3);
}

- (NSPointerFunctions)valuePointerFunctions
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (NSPointerFunctions *)-[NSMapTable objectForKey:](v2, v3, v4);
}

- (id)objectForKey:(id)aKey
{
  SEL v3 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable setObject:forKey:](v3, v4, v5, v6);
  return result;
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable removeObjectForKey:](v4, v5, v6);
}

- (void)removeObjectForKey:(id)aKey
{
  SEL v3 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable setItem:forKey:](v3, v4, v5, v6);
}

- (void)setItem:(const void *)a3 forKey:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable setItem:forAbsentKey:](v4, v5, v6, v7);
}

- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable setItem:forKnownAbsentKey:](v4, v5, v6, v7);
}

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable existingItemForSetItem:forAbsentKey:](v4, v5, v6, v7);
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable replaceItem:forExistingKey:](v4, v5, v6, v7);
  return result;
}

- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable allKeys](v4, v5);
}

- (id)allKeys
{
  v2 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable allValues](v2, v3);
}

- (id)allValues
{
  v2 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable removeAllItems](v2, v3);
  return result;
}

- (void)removeAllItems
{
  v2 = raiseError_0((uint64_t)self, a2);
  -[NSMapTable enumerator](v2, v3);
}

- (id)enumerator
{
  v2 = raiseError_0((uint64_t)self, a2);
  return (id)-[NSMapTable mapMember:originalKey:value:](v2, v3, v4, v5, v6);
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  SEL v5 = raiseError_0((uint64_t)self, a2);
  return -[NSMapTable getKeys:values:](v5, v6, v7, v8);
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  SEL v4 = raiseError_0((uint64_t)self, a2);
  return (unint64_t)-[NSMapTable mutableDictionary](v4, v5);
}

- (id)mutableDictionary
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  SEL v3 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = -[NSMapTable objectForKey:](self, "objectForKey:", v8);
        if (v9) {
          [v3 setObject:v9 forKey:v8];
        }
      }

      unint64_t v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  SEL v3 = (NSDictionary *)[MEMORY[0x189603FC8] dictionary];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v4 = -[NSMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = -[NSMapTable objectForKey:](self, "objectForKey:", v8);
        if (v9) {
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v9, v8);
        }
      }

      unint64_t v5 = -[NSMapTable countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end