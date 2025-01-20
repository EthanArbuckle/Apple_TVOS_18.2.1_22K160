@interface NSPointerArray
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSPointerArray)allocWithZone:(_NSZone *)a3;
+ (NSPointerArray)pointerArrayWithOptions:(NSPointerFunctionsOptions)options;
+ (NSPointerArray)pointerArrayWithPointerFunctions:(NSPointerFunctions *)functions;
+ (NSPointerArray)strongObjectsPointerArray;
+ (NSPointerArray)weakObjectsPointerArray;
+ (id)pointerArrayWithStrongObjects;
+ (id)pointerArrayWithWeakObjects;
- (Class)classForCoder;
- (NSArray)allObjects;
- (NSPointerArray)init;
- (NSPointerArray)initWithCoder:(id)a3;
- (NSPointerArray)initWithOptions:(NSPointerFunctionsOptions)options;
- (NSPointerArray)initWithPointerFunctions:(NSPointerFunctions *)functions;
- (NSPointerFunctions)pointerFunctions;
- (NSUInteger)count;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableArray;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addPointer:(void *)pointer;
- (void)compact;
- (void)encodeWithCoder:(id)a3;
- (void)insertPointer:(void *)item atIndex:(NSUInteger)index;
- (void)pointerAtIndex:(NSUInteger)index;
- (void)removePointerAtIndex:(NSUInteger)index;
- (void)replacePointerAtIndex:(NSUInteger)index withPointer:(void *)item;
- (void)setCount:(NSUInteger)count;
@end

@implementation NSPointerArray

- (NSPointerArray)init
{
  v2 = raiseError_1((uint64_t)self, a2);
  return raiseError_1((uint64_t)v2, v3);
}

- (NSPointerArray)initWithOptions:(NSPointerFunctionsOptions)options
{
  v3 = raiseError_1((uint64_t)self, a2);
  return -[NSPointerArray initWithPointerFunctions:](v3, v4, v5);
}

- (NSPointerArray)initWithPointerFunctions:(NSPointerFunctions *)functions
{
  v3 = raiseError_1((uint64_t)self, a2);
  return +[NSPointerArray pointerArrayWithOptions:](v3, v4, v5);
}

+ (NSPointerArray)pointerArrayWithOptions:(NSPointerFunctionsOptions)options
{
  SEL v4 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)(id)objc_msgSend( NSAllocateObject(v4, 0, 0),  "initWithOptions:",  options);
}

+ (NSPointerArray)pointerArrayWithPointerFunctions:(NSPointerFunctions *)functions
{
  SEL v4 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)(id)objc_msgSend( NSAllocateObject(v4, 0, 0),  "initWithPointerFunctions:",  functions);
}

+ (NSPointerArray)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_self();
  return (NSPointerArray *)NSAllocateObject(v3, 0LL, 0LL);
}

- (NSPointerArray)initWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSPointerArray;
  -[NSPointerArray dealloc](&v5, sel_dealloc);
  return (NSPointerArray *)-[NSConcretePointerArray initWithCoder:]( objc_alloc(&OBJC_CLASS___NSConcretePointerArray),  "initWithCoder:",  a3);
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

- (NSPointerFunctions)pointerFunctions
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (NSPointerFunctions *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v2, v3, v4, v5, v6);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  objc_super v5 = raiseError_1((uint64_t)self, a2);
  return (unint64_t)-[NSPointerArray pointerAtIndex:](v5, v6, v7);
}

- (void)pointerAtIndex:(NSUInteger)index
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray addPointer:](v3, v4, v5);
  return result;
}

- (void)addPointer:(void *)pointer
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray removePointerAtIndex:](v3, v4, v5);
}

- (void)removePointerAtIndex:(NSUInteger)index
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray insertPointer:atIndex:](v3, v4, v5, v6);
}

- (void)insertPointer:(void *)item atIndex:(NSUInteger)index
{
  SEL v4 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray replacePointerAtIndex:withPointer:](v4, v5, v6, v7);
}

- (void)replacePointerAtIndex:(NSUInteger)index withPointer:(void *)item
{
  SEL v4 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray compact](v4, v5);
}

- (void)compact
{
  v2 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray count](v2, v3);
}

- (NSUInteger)count
{
  v2 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray setCount:](v2, v3, v4);
  return result;
}

- (void)setCount:(NSUInteger)count
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray copyWithZone:](v3, v4, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerArray encodeWithCoder:](v3, v4, v5);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SEL v3 = raiseError_1((uint64_t)self, a2);
  +[NSPointerArray pointerArrayWithStrongObjects](v3, v4);
}

+ (id)pointerArrayWithStrongObjects
{
  return objc_alloc_init(&OBJC_CLASS___NSConcretePointerArray);
}

+ (id)pointerArrayWithWeakObjects
{
  return  -[NSConcretePointerArray initWithOptions:]( objc_alloc(&OBJC_CLASS___NSConcretePointerArray),  "initWithOptions:",  1LL);
}

+ (NSPointerArray)strongObjectsPointerArray
{
  return (NSPointerArray *)objc_alloc_init(&OBJC_CLASS___NSConcretePointerArray);
}

+ (NSPointerArray)weakObjectsPointerArray
{
  return (NSPointerArray *) -[NSConcretePointerArray initWithOptions:]( objc_alloc(&OBJC_CLASS___NSConcretePointerArray),  "initWithOptions:",  5LL);
}

- (id)mutableArray
{
  v2 = raiseError_1((uint64_t)self, a2);
  return -[NSPointerArray allObjects](v2, v3);
}

- (NSArray)allObjects
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  SEL v3 = (NSArray *)[MEMORY[0x189603FA8] array];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
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
        if (*(void *)(*((void *)&v10 + 1) + 8 * v7)) {
          -[NSArray addObject:](v3, "addObject:");
        }
        ++v7;
      }

      while (v5 != v7);
      unint64_t v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

@end