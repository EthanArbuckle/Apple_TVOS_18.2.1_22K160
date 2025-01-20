@interface _PFMutableProxyArray
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFMutableProxyArray)initWithPFArray:(id)a3;
- (_PFMutableProxyArray)initWithPFArray:(id)a3 inRange:(_NSRange)a4;
- (id)arrayFromObjectIDs;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectIDAtIndex:(unint64_t)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newArrayFromObjectIDs;
- (id)objectAtIndex:(unint64_t)a3;
- (id)subarrayWithRange:(_NSRange)a3;
- (id)valueForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfManagedObjectForObjectID:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation _PFMutableProxyArray

- (_PFMutableProxyArray)initWithPFArray:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unsigned int location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____PFMutableProxyArray;
  v7 = -[_PFMutableProxyArray init](&v10, sel_init);
  if (v7)
  {
    v7->_originalArray = (_PFArray *)a3;
    v7->_offset = location;
    v7->_limit = location + length;
    v7->_updatedObjectsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7->_editCount = length + 1;
    v7->_indicesVeneer = CFArrayCreateMutable(0LL, 0LL, 0LL);
    if (length)
    {
    }
  }

  return v7;
}

- (_PFMutableProxyArray)initWithPFArray:(id)a3
{
  return -[_PFMutableProxyArray initWithPFArray:inRange:]( self,  "initWithPFArray:inRange:",  a3,  0,  [a3 count]);
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = -[_PFMutableProxyArray initWithPFArray:inRange:]( objc_alloc(&OBJC_CLASS____PFMutableProxyArray),  "initWithPFArray:inRange:",  self->_originalArray,  a3.location,  a3.length);
  v6->_offset = self->_offset;
  indicesVeneer = v6->_indicesVeneer;
  v14 = v6;
  updatedObjectsArray = v6->_updatedObjectsArray;
  int v9 = -[NSMutableArray count](updatedObjectsArray, "count");
  if (length)
  {
    int v10 = v9;
    for (CFIndex i = 0LL; i != length; ++i)
    {
      unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, location + i);
      if ((ValueAtIndex & 0x80000000) != 0)
      {
        -[NSMutableArray addObject:]( updatedObjectsArray,  "addObject:",  -[NSMutableArray objectAtIndex:](self->_updatedObjectsArray, "objectAtIndex:", ValueAtIndex & 0x7FFFFFFF));
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)(v10++ | 0x80000000));
      }

      else
      {
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)ValueAtIndex);
      }
    }
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFMutableProxyArray;
  -[_PFMutableProxyArray dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return CFArrayGetCount(self->_indicesVeneer);
}

- (id)copy
{
  return -[_PFMutableProxyArray copyWithZone:](self, "copyWithZone:", 0LL);
}

- (id)mutableCopy
{
  return -[_PFMutableProxyArray mutableCopyWithZone:](self, "mutableCopyWithZone:", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  unint64_t v4 = -[_PFMutableProxyArray count](self, "count", a3);
  v5 = (void *)MEMORY[0x186E3E5D8]();
  if (v4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v4 >= 0x201) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v4 >= 0x201)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v6);
    if (!v4) {
      goto LABEL_13;
    }
  }

  for (uint64_t i = 0LL; i != v4; ++i)
    *(void *)&v8[8 * i] = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", i);
LABEL_13:
  int v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v8 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v8);
  }
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  unint64_t v4 = -[_PFMutableProxyArray count](self, "count", a3);
  v5 = (void *)MEMORY[0x186E3E5D8]();
  if (v4 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v4 >= 0x201) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v4 >= 0x201)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v6);
    if (!v4) {
      goto LABEL_13;
    }
  }

  for (uint64_t i = 0LL; i != v4; ++i)
    *(void *)&v8[8 * i] = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", i);
LABEL_13:
  int v10 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:v8 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v8);
  }
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v17[1] = *MEMORY[0x1895F89C0];
  unint64_t v8 = -[_PFMutableProxyArray count](self, "count");
  if (v8 < location + length) {
    unint64_t v8 = [MEMORY[0x189603F70] raise:*MEMORY[0x189603B40], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), location + length - 1, v8 format];
  }
  if (length)
  {
    int v9 = (void *)MEMORY[0x186E3E5D8](v8);
    if (length >= 0x201) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = length;
    }
    unint64_t v11 = (8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    v12 = (char *)v17 - v11;
    if (length > 0x200) {
      v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v17 - v11, 8 * length);
    }
    for (uint64_t i = 0LL; i != length; ++i)
    {
      id v14 = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", location + i);
      *(void *)&v12[8 * i] = v14;
      a3[i] = v14;
    }

    v15 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v12 count:length];
    if (length >= 0x201) {
      NSZoneFree(0LL, v12);
    }
    objc_autoreleasePoolPop(v9);
    id v16 = v15;
  }

- (id)objectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    updatedObjectsArray = self->_updatedObjectsArray;
    uint64_t v6 = ValueAtIndex & 0x7FFFFFFF;
  }

  else
  {
    updatedObjectsArray = self->_originalArray;
    uint64_t v6 = self->_offset + ValueAtIndex;
  }

  return (id)[updatedObjectsArray objectAtIndex:v6];
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0) {
    return (id)objc_msgSend( (id)-[NSMutableArray objectAtIndex:]( self->_updatedObjectsArray,  "objectAtIndex:",  ValueAtIndex & 0x7FFFFFFF),  "objectID");
  }
  else {
    return -[_PFArray managedObjectIDAtIndex:]( self->_originalArray,  "managedObjectIDAtIndex:",  self->_offset + ValueAtIndex);
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:]( self,  "indexOfObjectIdenticalTo:inRange:",  a3,  0LL,  -[_PFMutableProxyArray count](self, "count"));
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:]( self,  "indexOfObjectIdenticalTo:inRange:",  a3,  0LL,  -[_PFMutableProxyArray count](self, "count", a3, a4.location, a4.length));
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:]( self,  "indexOfObjectIdenticalTo:inRange:",  a3,  0LL,  -[_PFMutableProxyArray count](self, "count"));
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = (id)[a3 objectID];
  uint64_t v8 = [v7 methodForSelector:sel_isEqual_];
  if (location >= location + length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v9 = (uint64_t (*)(id, char *, id))v8;
  while (1)
  {
    id v10 = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", location);
    if (v7 == v10 || (v9(v7, sel_isEqual_, v10) & 1) != 0) {
      break;
    }
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return location;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  unint64_t v5 = -[_PFMutableProxyArray count](self, "count");
  uint64_t v6 = [a3 methodForSelector:sel_isEqual_];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = (uint64_t (*)(id, char *, id))v6;
  unint64_t v8 = 0LL;
  while (1)
  {
    id v9 = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", v8);
    if (v9 == a3 || (v7(a3, sel_isEqual_, v9) & 1) != 0) {
      break;
    }
    if (v5 == ++v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v8;
}

- (id)arrayFromObjectIDs
{
  return -[_PFMutableProxyArray newArrayFromObjectIDs](self, "newArrayFromObjectIDs");
}

- (id)newArrayFromObjectIDs
{
  v11[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[_PFMutableProxyArray count](self, "count");
  unint64_t v4 = v3;
  if (v3 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  if (v3 >= 0x201) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v3 >= 0x201)
  {
    id v7 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v5);
    if (!v4) {
      goto LABEL_13;
    }
  }

  uint64_t v8 = 0LL;
  do
  {
    *(void *)&v7[8 * v8] = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", v8);
    ++v8;
  }

  while (v4 != v8);
LABEL_13:
  id v9 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v7 count:v4];
  if (v4 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v9;
}

- (id)valueForKey:(id)a3
{
  if (![a3 isEqual:@"objectID"]
    || (id v5 = -[_PFMutableProxyArray arrayFromObjectIDs](self, "arrayFromObjectIDs"),
        uint64_t v6 = [v5 count],
        v6 != -[_PFMutableProxyArray count](self, "count")))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS____PFMutableProxyArray;
    return -[_PFMutableProxyArray valueForKey:](&v8, sel_valueForKey_, a3);
  }

  return v5;
}

- (void)addObject:(id)a3
{
  int v5 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a3);
  CFArrayAppendValue(self->_indicesVeneer, (const void *)(v5 & 0x7FFFFFFF | 0x80000000LL));
}

- (void)removeLastObject
{
  CFIndex Count = CFArrayGetCount(self->_indicesVeneer);
  if (Count)
  {
    CFIndex v4 = Count;
    unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, Count - 1);
    if ((ValueAtIndex & 0x80000000) != 0)
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:]( self->_updatedObjectsArray,  "replaceObjectAtIndex:withObject:",  ValueAtIndex & 0x7FFFFFFF,  NSKeyValueCoding_NullValue);
      editCFIndex Count = self->_editCount;
      if (editCount) {
        self->_editCFIndex Count = editCount - 1;
      }
    }

    CFArrayRemoveValueAtIndex(self->_indicesVeneer, v4);
  }

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  int v7 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a3);
  CFArrayInsertValueAtIndex(self->_indicesVeneer, a4, (const void *)(v7 & 0x7FFFFFFF | 0x80000000LL));
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  CFArrayRemoveValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:]( self->_updatedObjectsArray,  "replaceObjectAtIndex:withObject:",  ValueAtIndex & 0x7FFFFFFF,  NSKeyValueCoding_NullValue);
    editCFIndex Count = self->_editCount;
    if (editCount) {
      self->_editCFIndex Count = editCount - 1;
    }
  }

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  int v7 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a4);
  CFArraySetValueAtIndex(self->_indicesVeneer, a3, (const void *)(v7 & 0x7FFFFFFF | 0x80000000LL));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end