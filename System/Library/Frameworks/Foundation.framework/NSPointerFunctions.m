@interface NSPointerFunctions
+ (NSPointerFunctions)allocWithZone:(_NSZone *)a3;
+ (NSPointerFunctions)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options;
- (BOOL)isEqualFunction;
- (BOOL)usesStrongWriteBarrier;
- (BOOL)usesWeakReadAndWriteBarriers;
- (NSPointerFunctions)initWithOptions:(NSPointerFunctionsOptions)options;
- (NSString)descriptionFunction;
- (NSUInteger)hashFunction;
- (NSUInteger)sizeFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (void)acquireFunction;
- (void)relinquishFunction;
- (void)setAcquireFunction:(void *(__cdecl *)acquireFunction;
- (void)setDescriptionFunction:(NSString *(__cdecl *)descriptionFunction;
- (void)setHashFunction:(NSUInteger (__cdecl *)hashFunction;
- (void)setIsEqualFunction:(BOOL (__cdecl *)isEqualFunction;
- (void)setRelinquishFunction:(void (__cdecl *)relinquishFunction;
- (void)setSizeFunction:(NSUInteger (__cdecl *)sizeFunction;
- (void)setUsesStrongWriteBarrier:(BOOL)usesStrongWriteBarrier;
- (void)setUsesWeakReadAndWriteBarriers:(BOOL)usesWeakReadAndWriteBarriers;
@end

@implementation NSPointerFunctions

+ (NSPointerFunctions)allocWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_self();
  return (NSPointerFunctions *)NSAllocateObject(v3, 0LL, 0LL);
}

+ (NSPointerFunctions)pointerFunctionsWithOptions:(NSPointerFunctionsOptions)options
{
  v4 = (objc_class *)objc_opt_self();
  return (NSPointerFunctions *)(id)objc_msgSend( NSAllocateObject(v4, 0, 0),  "initWithOptions:",  options);
}

- (NSPointerFunctions)initWithOptions:(NSPointerFunctionsOptions)options
{
  v3 = raiseError_1((uint64_t)self, a2);
  return (NSPointerFunctions *)-[NSPointerFunctions copyWithZone:]((NSPointerFunctions *)v3, v4, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setSizeFunction:]((NSPointerFunctions *)v3, v4, v5);
  return result;
}

- (void)setSizeFunction:(NSUInteger (__cdecl *)sizeFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setHashFunction:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setHashFunction:(NSUInteger (__cdecl *)hashFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setIsEqualFunction:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setIsEqualFunction:(BOOL (__cdecl *)isEqualFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setDescriptionFunction:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setDescriptionFunction:(NSString *(__cdecl *)descriptionFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setAcquireFunction:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setAcquireFunction:(void *(__cdecl *)acquireFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setRelinquishFunction:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setRelinquishFunction:(void (__cdecl *)relinquishFunction
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setUsesStrongWriteBarrier:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setUsesStrongWriteBarrier:(BOOL)usesStrongWriteBarrier
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions setUsesWeakReadAndWriteBarriers:]((NSPointerFunctions *)v3, v4, v5);
}

- (void)setUsesWeakReadAndWriteBarriers:(BOOL)usesWeakReadAndWriteBarriers
{
  v3 = raiseError_1((uint64_t)self, a2);
  -[NSPointerFunctions sizeFunction]((NSPointerFunctions *)v3, v4);
}

- (NSUInteger)sizeFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (NSUInteger (__cdecl *)(const void *))-[NSPointerFunctions hashFunction]((NSPointerFunctions *)v2, v3);
}

- (NSUInteger)hashFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (NSUInteger (__cdecl *)(const void *, NSUInteger (__cdecl *)(const void *)))-[NSPointerFunctions isEqualFunction]( (NSPointerFunctions *)v2,  v3);
}

- (BOOL)isEqualFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (BOOL (__cdecl *)(const void *, const void *, NSUInteger (__cdecl *)(const void *)))-[NSPointerFunctions descriptionFunction]( (NSPointerFunctions *)v2,  v3);
}

- (NSString)descriptionFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (NSString *(__cdecl *)(const void *))-[NSPointerFunctions acquireFunction]((NSPointerFunctions *)v2, v3);
}

- (void)acquireFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (void *(__cdecl *)(const void *, NSUInteger (__cdecl *)(const void *), BOOL))-[NSPointerFunctions relinquishFunction]( (NSPointerFunctions *)v2,  v3);
}

- (void)relinquishFunction
{
  v2 = raiseError_1((uint64_t)self, a2);
  return (void (__cdecl *)(const void *, NSUInteger (__cdecl *)(const void *)))-[NSPointerFunctions usesStrongWriteBarrier]( (NSPointerFunctions *)v2,  v3);
}

- (BOOL)usesStrongWriteBarrier
{
  v2 = raiseError_1((uint64_t)self, a2);
  return -[NSPointerFunctions usesWeakReadAndWriteBarriers]((NSPointerFunctions *)v2, v3);
}

- (BOOL)usesWeakReadAndWriteBarriers
{
  __int16 v2 = (unsigned __int16)raiseError_1((uint64_t)self, a2);
  return _NSPointerFunctionCoding_isValidOptions(v2);
}

@end