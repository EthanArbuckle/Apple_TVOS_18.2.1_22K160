@interface _NSFaultingMutableOrderedSet
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isIdenticalFault:(id)a3;
- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4;
- (BOOL)_shouldProcessKVOChange;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(id)a3;
- (BOOL)isFault;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_BYTE)willChange;
- (_NSFaultingMutableOrderedSet)initWithOrderedSet:(id)a3;
- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6;
- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)_newOrderKeys;
- (id)_orderedObjectsAndKeys;
- (id)_updateOrderKeysFromOrderOfObjectIDs:(id *)result;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (id)replacementObjectForCoder:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (uint64_t)_orderKeyForObject:(uint64_t)a1;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)_populateOrderKeysUsingSnapshot:(void *)a3 orderKeys:(void *)a4 newIndexes:(void *)a5 reorderedIndexes:;
- (void)_setProcessingIdempotentKVO:(BOOL)a3;
- (void)addObject:(id)a3;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(id)a3;
- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (void)turnIntoFault;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(id)a3;
- (void)willRead;
- (void)willReadWithContents:(id)a3;
@end

@implementation _NSFaultingMutableOrderedSet

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_NSFaultingMutableOrderedSet)initWithOrderedSet:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____NSFaultingMutableOrderedSet;
  v4 = -[_NSFaultingMutableOrderedSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_source = 0LL;
    v4->_realSet = a3;
    *(_DWORD *)&v5->_flags &= 0xFFE0u;
  }

  return v5;
}

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____NSFaultingMutableOrderedSet;
  v8 = -[_NSFaultingMutableOrderedSet init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    else {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    }
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)v10;
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v10 & 0xFFFF001F);
    unsigned int v11 = *(_DWORD *)&v9->_flags & 0xFFE3 | ([a4 _entitysReferenceID] << 16);
    if (v5)
    {
      id v12 = 0LL;
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 | 1);
    }

    else
    {
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 & 0xFFFFFFE2);
      id v12 = objc_alloc_init(MEMORY[0x189603FD0]);
    }

    v9->_realSet = v12;
    v9->_orderKeys = 0LL;
  }

  return v9;
}

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_super v7 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:]( self,  "initWithSource:forRelationship:asFault:",  a3,  a5,  0LL,  a6);
  if (v7)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a4);
          }
          CFSetAddValue((CFMutableSetRef)v7->_realSet, *(const void **)(*((void *)&v13 + 1) + 8 * v11++));
        }

        while (v9 != v11);
        uint64_t v9 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v9);
    }
  }

  return v7;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

- (void)dealloc
{
  realSet = (id *)self->_realSet;
  if (realSet && (*(_BYTE *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }

  else
  {
  }

  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    BOOL v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      BOOL v5 = malloc_default_zone();
      orderKeys = self->_orderKeys;
    }

    malloc_zone_free(v5, orderKeys);
    self->_orderKeys = 0LL;
  }

  self->_grottyHack = 0LL;
  self->_realSet = 0LL;
  self->_source = 0LL;

  self->_forcedKeys = 0LL;
  _PFDeallocateObject(self);
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)description
{
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  v4 = (void *)NSString;
  BOOL v5 = -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0) {
    return (id)[v4 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v5, self->_source, source, v8];
  }
  else {
    return (id)[v4 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v5, source, source, objc_msgSend(self->_realSet, "description")];
  }
}

- (id)descriptionWithLocale:(id)a3
{
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  v6 = (void *)NSString;
  objc_super v7 = -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0) {
    return (id)[v6 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v7, self->_source, source, v10];
  }
  else {
    return (id)[v6 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3)];
  }
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    -[_NSFaultingMutableOrderedSet willReadWithContents:](self, "willReadWithContents:", 0LL);
  }
}

- (void)willReadWithContents:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = self->_realSet;
    v6 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    objc_super v7 = -[NSManagedObject entity](self->_source, "entity");
    if (a3)
    {
      unint64_t v8 = [a3 count];
      unint64_t v9 = MEMORY[0x1895F8858](v8);
      id v12 = (char *)&v27 - v11;
      if (v9 > 0x200) {
        id v12 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v27 - v11, 8 * v10);
      }
      objc_msgSend(a3, "getObjects:range:", v12, 0, v8);
      self->_realSet = (id)[objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v12 count:v8];
      if (v8 >= 0x201) {
        NSZoneFree(0LL, v12);
      }
      if (!realSet) {
        goto LABEL_30;
      }
    }

    else
    {
      __int128 v13 = *(Class *)((char *)&v7->_properties[3].super.super.isa
                     + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
      source = self->_source;
      if (source) {
        uint64_t v15 = _insertion_fault_handler;
      }
      else {
        uint64_t v15 = 0LL;
      }
      id v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:]( v15,  source,  v13,  (uint64_t)v6);
      uint64_t v17 = [v16 count];
      if (v17)
      {
        unint64_t v18 = v17;
        uint64_t v27 = (uint64_t)&v27;
        unint64_t v19 = MEMORY[0x1895F8858](v17);
        v21 = (char *)&v27 - v20;
        if (v19 > 0x200) {
          v21 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v27 - v20, 8 * v19);
        }
        objc_msgSend(v16, "getObjects:", v21, v27, v28);
        for (uint64_t i = 0LL; i != v18; ++i)
          *(void *)&v21[8 * i] = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:]( v6,  *(void **)&v21[8 * i],  0LL);
        uint64_t v23 = 0LL;
        self->_realSet = (id)[objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v21 count:v18];
        do

        while (v18 != v23);
        if (v18 >= 0x201) {
          NSZoneFree(0LL, v21);
        }
      }

      else
      {
        self->_realSet = objc_alloc_init(MEMORY[0x189603FD0]);
      }

      if (!realSet) {
        goto LABEL_30;
      }
    }

    v25 = (void *)*realSet;
    v24 = (void *)realSet[1];
    if (*realSet)
    {
      [self->_realSet unionSet:*realSet];
    }

    if (v24)
    {
      [self->_realSet minusSet:v24];
    }

    PF_FREE_OBJECT_ARRAY(realSet);
LABEL_30:
    unint64_t flags = self->_flags;
    self->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }

- (_BYTE)willChange
{
  if (result)
  {
    v1 = result;
    result = (_BYTE *)[result willRead];
    if ((v1[12] & 0x10) != 0)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot mutate an immutable faulting NSOrderedSet" userInfo:0]);
      return (_BYTE *)-[_NSFaultingMutableOrderedSet _shouldProcessKVOChange](v2, v3);
    }
  }

  return result;
}

- (BOOL)_shouldProcessKVOChange
{
  return (*(_BYTE *)&self->_flags & 4) == 0;
}

- (void)_setProcessingIdempotentKVO:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (id)_updateOrderKeysFromOrderOfObjectIDs:(id *)result
{
  v46[128] = *MEMORY[0x1895F89C0];
  if (result)
  {
    int v3 = result;
    if ([result[2] count])
    {
      unsigned int v4 = [v3[2] count];
      if (!v3[4]) {
        v3[4] = PF_CALLOC_SCANNED_BYTES(4LL * v4);
      }
      uint64_t v5 = [a2 count];
      unint64_t v6 = MEMORY[0x1895F8858](v5);
      unint64_t v9 = (const void **)((char *)&v31 - v8);
      size_t v10 = 8 * v7;
      uint64_t v31 = v11;
      unint64_t v32 = v6;
      if (v6 > 0x200)
      {
        unint64_t v9 = (const void **)NSAllocateScannedUncollectable();
        v34 = (char *)NSAllocateScannedUncollectable();
      }

      else
      {
        bzero((char *)&v31 - v8, 8 * v7);
        MEMORY[0x1895F8858](v12);
        v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v34, v10);
      }

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      uint64_t v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, v31);
      v33 = v9;
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = 0LL;
        uint64_t v16 = *(void *)v41;
        do
        {
          uint64_t v17 = 0LL;
          unint64_t v18 = (char *)&v9[v15];
          unint64_t v19 = &v34[8 * v15];
          do
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(a2);
            }
            uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * v17);
            *(void *)&v19[8 * v17] = v15 + v17 + 1;
            *(void *)&v18[8 * v17++] = v20;
          }

          while (v14 != v17);
          uint64_t v14 = [a2 countByEnumeratingWithState:&v40 objects:v45 count:16];
          v15 += v17;
          unint64_t v9 = v33;
        }

        while (v14);
      }

      v21 = _PFStackAllocatorCreate(v46, 1024LL);
      memset(&v39, 0, 24);
      *(_OWORD *)&v39.copyDescription = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
      v39.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
      v22 = CFDictionaryCreate(v21, v9, (const void **)v34, v32, &v39, 0LL);
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v23 = v3[2];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        int v26 = 0;
        uint64_t v27 = *(void *)v36;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v23);
            }
            Value = CFDictionaryGetValue( v22,  (const void *)[*(id *)(*((void *)&v35 + 1) + 8 * i) objectID]);
            if (Value) {
              *((_DWORD *)v3[4] + (v26 + i)) = *(_DWORD *)(a2[4] + 4LL * ((_DWORD)Value - 1));
            }
          }

          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
          v26 += i;
        }

        while (v25);
      }

      if (v32 >= 0x201)
      {
        NSZoneFree(0LL, v34);
        NSZoneFree(0LL, v33);
      }

      if (v46[3])
      {
        if (v22) {
          CFRelease(v22);
        }
      }

      else
      {
        v46[1] = v46[0];
      }
    }

    id v30 = v3[5];
    if (v30) {

    }
    result = a2;
    v3[5] = result;
  }

  return result;
}

- (void)_populateOrderKeysUsingSnapshot:(void *)a3 orderKeys:(void *)a4 newIndexes:(void *)a5 reorderedIndexes:
{
  id v93 = a3;
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  size_t v9 = [*(id *)(a1 + 16) count];
  size_t v10 = v9;
  if (a5)
  {
    uint64_t v11 = *a4;
    uint64_t v12 = *a5;
    if (*(void *)(a1 + 32)) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v9 == 0;
    }
    if (v13)
    {
      memset(*a5, 1, v9);
      if (v10)
      {
        uint64_t v14 = *(unsigned int **)(a1 + 32);
        do
        {
          unsigned int v15 = *v14++;
          *v11++ = v15;
          --v10;
        }

        while (v10);
      }

      return;
    }
  }

  else
  {
    if (*(void *)(a1 + 32)) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v9 == 0;
    }
    if (v16) {
      return;
    }
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
  }

  unsigned int v17 = [a2 count];
  uint64_t v18 = v10;
  *(void *)(a1 + 32) = PF_CALLOC_SCANNED_BYTES(4LL * v10);
  id v89 = a2;
  if (!a2 || !v93 || !v17 || (unint64_t v19 = v17, v20 = [v93 count], v17 != v20))
  {
    if ((v10 + 1) < 0x400000)
    {
      if (!(_DWORD)v10) {
        goto LABEL_29;
      }
      unsigned int v24 = 1024;
    }

    else
    {
      unsigned int v24 = 0xFFFFFFFF / ((int)v10 + 1);
    }

    uint64_t v25 = 0LL;
    int v26 = 2 * v24;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 4 * v25) = v26;
      v26 += v24;
      ++v25;
    }

    while (v10 != v25);
LABEL_29:
    if (a5)
    {
      memset(v12, 1, v10);
      if ((_DWORD)v10)
      {
        uint64_t v27 = *(unsigned int **)(a1 + 32);
        do
        {
          unsigned int v28 = *v27++;
          *v11++ = v28;
          --v18;
        }

        while (v18);
      }
    }

    return;
  }

  v90 = v12;
  v88 = &v87;
  MEMORY[0x1895F8858](v20);
  id v23 = (char *)&v87 - v21;
  uint64_t v87 = v22;
  else {
    bzero((char *)&v87 - v21, 8 * v22);
  }
  v29 = *(void **)(a1 + 16);
  v95 = v23;
  objc_msgSend(v29, "getObjects:range:", v23, 0, v10, v87, v88);
  CFDictionaryRef v30 = 0LL;
  if (v17 >= 6)
  {
    memset(&keyCallBacks, 0, 24);
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x189605240] + 24LL);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x189605240] + 40LL);
    memset(&valueCallBacks, 0, 24);
    *(_OWORD *)&valueCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x189605250] + 24LL);
    MEMORY[0x1895F8858](0LL);
    unint64_t v32 = (const void **)((char *)&v87 - v31);
    if (v17 > 0x200uLL)
    {
      unint64_t v32 = (const void **)NSAllocateScannedUncollectable();
      objc_msgSend(v89, "getObjects:range:", v32, 0, v17);
      v34 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v87 - v31, 8LL * v17);
      uint64_t v33 = objc_msgSend(v89, "getObjects:range:", v32, 0, v17);
      MEMORY[0x1895F8858](v33);
      v34 = (char *)&v87 - ((8LL * v17 + 15) & 0xFFFFFFFF0LL);
      bzero(v34, 8 * v19);
    }

    objc_msgSend(v93, "getObjects:range:", v34, 0, v19);
    CFDictionaryRef v30 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  v32,  (const void **)v34,  v19,  &keyCallBacks,  &valueCallBacks);
    if (v19 >= 0x201)
    {
      __int128 v35 = v32;
      __int128 v36 = v30;
      NSZoneFree(0LL, v35);
      NSZoneFree(0LL, v34);
      CFDictionaryRef v30 = v36;
    }
  }

  v91 = v30;
  v92 = a5;
  if ((_DWORD)v10)
  {
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    int v94 = 0;
    char v39 = 1;
    __int128 v40 = v95;
    while (1)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      __int128 v42 = *(const void **)&v40[8 * v37];
      if ((isKindOfClass & 1) == 0) {
        __int128 v42 = (const void *)[*(id *)&v40[8 * v37] objectID];
      }
      __int128 v43 = *(void **)(a1 + 48);
      if (!v43) {
        goto LABEL_50;
      }
      uint64_t v44 = [v43 objectForKey:v42];
      v45 = (void *)v44;
      if (v92 && v44)
      {
        v90[v37] = 1;
        goto LABEL_56;
      }

      if (!v44)
      {
LABEL_50:
        if (v91)
        {
          Value = (void *)CFDictionaryGetValue(v91, v42);
        }

        else
        {
          uint64_t v47 = [v89 indexOfObject:v42];
          if (v47 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v45 = 0LL;
            goto LABEL_56;
          }

          Value = (void *)[v93 objectAtIndex:v47];
        }

        v45 = Value;
      }

- (uint64_t)_orderKeyForObject:(uint64_t)a1
{
  while (1)
  {
    if (!a1) {
      return 0LL;
    }
    unint64_t v4 = [*(id *)(a1 + 16) indexOfObject:a2];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    a1 = *(void *)(a1 + 40);
    if (!a1) {
      return 0LL;
    }
  }

  if (!*(void *)(a1 + 32)) {
    return 0LL;
  }
  unint64_t v5 = v4;
  if (v4 >= [*(id *)(a1 + 16) count]) {
    objc_msgSend( (id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Index of object > number of objects",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObject:forKey:", a1, @"_NSFaultingMutableOrderedSet")),  "raise");
  }
  return *(unsigned int *)(*(void *)(a1 + 32) + 4 * v5);
}

- (id)_newOrderKeys
{
  uint64_t v1 = a1;
  v19[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return (id)v1;
  }
  unint64_t v2 = [*(id *)(a1 + 16) count];
  unint64_t v9 = v2;
  uint64_t v10 = *(void *)(v1 + 32);
  if (v10) {
    BOOL v11 = v2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if (v2 >= 0x201) {
      uint64_t v14 = 1LL;
    }
    else {
      uint64_t v14 = v2;
    }
    unint64_t v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    BOOL v16 = (char *)v19 - v15;
    if (v2 > 0x200) {
      BOOL v16 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v19 - v15, 8 * v2);
    }
    uint64_t v17 = 0LL;
    do
    {
      *(void *)&v16[8 * v17] = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedInt:*(unsigned int *)(*(void *)(v1 + 32) + 4 * v17)];
      ++v17;
    }

    while (v9 != v17);
    uint64_t v1 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v16 count:v9];
    uint64_t v18 = 0LL;
    do

    while (v9 != v18);
    if (v9 >= 0x201) {
      NSZoneFree(0LL, v16);
    }
    return (id)v1;
  }

  if (v10) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v2 == 0;
  }
  if (!v12) {
    _NSCoreDataLog(1LL, (uint64_t)@"nil order keys and %d objects in real set", v3, v4, v5, v6, v7, v8, v2);
  }
  return (id)NSArray_EmptyArray;
}

- (void)turnIntoFault
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  realSet = (id *)self->_realSet;
  if (realSet && (*(_BYTE *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }

  else
  {
  }

  self->_realSet = 0LL;
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (NSPropertyDescription)relationship
{
  return *(NSPropertyDescription **)((void)-[NSManagedObject entity](self->_source, "entity")[96]
                                   + 24LL
                                   + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    uint64_t v6 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:]( objc_alloc(&OBJC_CLASS____NSFaultingMutableOrderedSet),  "initWithSource:forRelationship:asFault:",  self->_source,  -[_NSFaultingMutableOrderedSet relationship](self, "relationship"),  1LL);
    realSet = (id *)self->_realSet;
    if (realSet)
    {
      uint64_t v10 = PF_ALLOCATE_OBJECT_ARRAY(2LL);
      *uint64_t v10 = [*realSet mutableCopyWithZone:a3];
      v10[1] = [realSet[1] mutableCopyWithZone:a3];
      v6->_realSet = v10;
    }

    v6->_unint64_t flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&v6->_flags & 0xFFFFFFFD | (2
                                                                                          * ((*(_DWORD *)&self->_flags >> 1) & 1)));
    return v6;
  }

  if ([self->_realSet count])
  {
    uint64_t v5 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:]( objc_alloc(&OBJC_CLASS____NSFaultingMutableOrderedSet),  "initWithSource:forRelationship:asFault:",  self->_source,  -[_NSFaultingMutableOrderedSet relationship](self, "relationship"),  0LL);
    uint64_t v6 = v5;
    id v7 = self->_realSet;
    if (v7)
    {
      id v8 = v5->_realSet;
      if (v8)
      {

        id v7 = self->_realSet;
      }

      v6->_realSet = v7;
      *(_DWORD *)&self->_flags |= 8u;
      *(_DWORD *)&v6->_flags |= 0x10u;
    }

    return v6;
  }

  return (id)NSOrderedSet_EmptyOrderedSet;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(MEMORY[0x189603FD0]) initWithOrderedSet:self->_realSet];
}

- (unint64_t)count
{
  return [self->_realSet count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[self->_realSet objectAtIndex:a3];
}

- (unint64_t)indexOfObject:(id)a3
{
  return [self->_realSet indexOfObject:a3];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (self->_orderKeys && [self->_realSet indexOfObject:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    id v7 = (void *)[self->_realSet mutableCopy];

    self->_realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }

  [self->_realSet insertObject:a3 atIndex:a4];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [self->_realSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return [self->_realSet indexOfObjectWithOptions:a3 passingTest:a4];
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return [self->_realSet indexOfObjectAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)[self->_realSet indexesOfObjectsWithOptions:a3 passingTest:a4];
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return (id)[self->_realSet indexesOfObjectsAtIndexes:a3 options:a4 passingTest:a5];
}

- (id)objectEnumerator
{
  return (id)[self->_realSet objectEnumerator];
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "getObjects:range:", a3, location, length);
}

- (void)getObjects:(id *)a3
{
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    uint64_t v6 = (void *)[self->_realSet mutableCopy];

    self->_realSet = v6;
    *(_DWORD *)&self->_flags &= ~8u;
  }

  [self->_realSet removeObjectAtIndex:a3];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (self->_orderKeys)
  {
    uint64_t v7 = [self->_realSet indexOfObject:a4];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 != a3)
    {
      PF_FREE_OBJECT_ARRAY(self->_orderKeys);
      self->_orderKeys = 0LL;
    }
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    unint64_t v9 = (void *)[self->_realSet mutableCopy];

    self->_realSet = v9;
    *(_DWORD *)&self->_flags &= ~8u;
  }

  [self->_realSet replaceObjectAtIndex:a3 withObject:a4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    uint64_t v7 = (void *)[self->_realSet mutableCopy];

    self->_realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }

  [self->_realSet setValue:a3 forKey:a4];
}

- (id)valueForKey:(id)a3
{
  return (id)[self->_realSet valueForKey:a3];
}

- (id)valueForKeyPath:(id)a3
{
  return (id)[self->_realSet valueForKeyPath:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)replacementObjectForCoder:(id)a3
{
  return self->_realSet;
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if (a3 == self) {
    return 1;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ([a3 isFault])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        source = self->_source;
        if (source == (NSManagedObject *)[a3 source])
        {
          uint64_t v6 = -[_NSFaultingMutableOrderedSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }

  unint64_t v7 = -[_NSFaultingMutableOrderedSet count](self, "count");
  if (v7 != [a3 count]) {
    return 0;
  }
  if (v7 <= 1) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v7;
  }
  if (v7 >= 0x201) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = (char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v7 > 0x200) {
    uint64_t v10 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v8);
  }
  -[_NSFaultingMutableOrderedSet getObjects:](self, "getObjects:", v10);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0LL;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = &v10[8 * v14];
      v14 += v13;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(a3);
        }
        if (*(void *)&v17[8 * v16] != *(void *)(*((void *)&v19 + 1) + 8 * v16))
        {
          BOOL v11 = 0;
          goto LABEL_31;
        }

        ++v16;
      }

      while (v13 != v16);
      uint64_t v13 = [a3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_31:
  if (v7 >= 0x201) {
    NSZoneFree(0LL, v10);
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isNSOrderedSet];
    if (v5) {
      LOBYTE(v5) = -[_NSFaultingMutableOrderedSet isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
    }
  }

  return v5;
}

- (BOOL)_isIdenticalFault:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ([a3 isFault])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        source = self->_source;
        if (source == (NSManagedObject *)[a3 source])
        {
          uint64_t v6 = -[_NSFaultingMutableOrderedSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }

  return 0;
}

- (BOOL)containsObject:(id)a3
{
  return [self->_realSet containsObject:a3];
}

- (void)addObject:(id)a3
{
  if (self->_orderKeys && [self->_realSet indexOfObject:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    int v5 = (void *)[self->_realSet mutableCopy];

    self->_realSet = v5;
    *(_DWORD *)&self->_flags &= ~8u;
  }

  objc_msgSend(self->_realSet, "insertObject:atIndex:", a3, objc_msgSend(self->_realSet, "count"));
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v13[128] = *MEMORY[0x1895F89C0];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if (a4 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0) {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    }
    BOOL v11 = _PFStackAllocatorCreate(v13, 1024LL);
    CFArrayRef v12 = CFArrayCreate(v11, a3, a4, 0LL);
    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  self->_realSet,  v12);
    if (v13[3])
    {
      if (v12) {
        CFRelease(v12);
      }
    }

    else
    {
      v13[1] = v13[0];
    }
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v8 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v8;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet addObjects:a3 count:a4];
  }

- (void)addObjectsFromArray:(id)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet addObjectsFromArray:a3];
  }

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  v16[128] = *MEMORY[0x1895F89C0];
  -[_NSFaultingMutableOrderedSet willChange](self);
  unint64_t v9 = [self->_realSet count];
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if (v9 <= a5)
  {
    -[_NSFaultingMutableOrderedSet addObjects:count:](self, "addObjects:count:", a3, a4);
  }

  else if (a4 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0) {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    }
    uint64_t v14 = _PFStackAllocatorCreate(v16, 1024LL);
    CFArrayRef v15 = CFArrayCreate(v14, a3, a4, 0LL);
    self->_id realSet = (id)+[_PFRoutines newOrderedSetFromCollection:byInsertingItems:atIndex:]( (uint64_t)&OBJC_CLASS____PFRoutines,  self->_realSet,  v15,  a5);
    if (v16[3])
    {
      if (v15) {
        CFRelease(v15);
      }
    }

    else
    {
      v16[1] = v16[0];
    }
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      BOOL v11 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v11;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet insertObjects:a3 count:a4 atIndex:a5];
  }

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  unint64_t v8 = [a4 firstIndex];
  if (v8 >= [self->_realSet count])
  {
    -[_NSFaultingMutableOrderedSet addObjectsFromArray:](self, "addObjectsFromArray:", a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      unint64_t v9 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v9;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet insertObjects:a3 atIndexes:a4];
  }

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v21[1] = *MEMORY[0x1895F89C0];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if (length > 2)
  {
    unint64_t v8 = [self->_realSet count];
    if (location < v8)
    {
      unint64_t v9 = v8;
      unint64_t v10 = v8 + 1;
      uint64_t v11 = 1LL;
      if (v8 + 1 > 1) {
        uint64_t v11 = v8 + 1;
      }
      if (v10 >= 0x201) {
        uint64_t v12 = 1LL;
      }
      else {
        uint64_t v12 = v11;
      }
      uint64_t v13 = (char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      if (v10 > 0x200) {
        uint64_t v13 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v11);
      }
      [self->_realSet getObjects:v13];
      NSUInteger v14 = location + length;
      if (location + length >= v9) {
        NSUInteger v15 = v9;
      }
      else {
        NSUInteger v15 = location + length;
      }
      if (v9 > v14)
      {
        NSUInteger v16 = location;
        NSUInteger v17 = v15;
        do
        {
          *(void *)&v13[8 * v16++] = *(void *)&v13[8 * v17];
          if (v16 >= v9) {
            break;
          }
          ++v17;
        }

        while (v17 < v9);
      }

      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v13 count:v9 + location - v15];
      if (v10 >= 0x201) {
        NSZoneFree(0LL, v13);
      }
      id realSet = self->_realSet;
      _NSFaultingMutableOrderedSetFlags flags = self->_flags;
      if ((*(_BYTE *)&flags & 8) != 0) {
        self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      }
      self->_id realSet = v18;
    }
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      unint64_t v7 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    objc_msgSend(self->_realSet, "removeObjectsInRange:", location, length);
  }

- (void)removeAllObjects
{
  _NSFaultingMutableOrderedSetFlags flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0) {
    self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
  }
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  self->_id realSet = objc_alloc_init(MEMORY[0x189603FD0]);
}

- (void)removeObjectsInArray:(id)a3
{
  unint64_t v5 = [a3 count];
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if (v5 > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v10 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      unint64_t v7 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet removeObjectsInArray:a3];
  }

- (void)minusOrderedSet:(id)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet minusOrderedSet:a3];
  }

- (void)unionOrderedSet:(id)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet unionOrderedSet:a3];
  }

- (void)minusSet:(id)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet minusSet:a3];
  }

- (void)unionSet:(id)a3
{
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0LL;
  }

  if ((unint64_t)[a3 count] > 2)
  {
    id realSet = self->_realSet;
    _NSFaultingMutableOrderedSetFlags flags = self->_flags;
    id v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->__NSFaultingMutableOrderedSetFlags flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      id realSet = self->_realSet;
    }

    self->_id realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  realSet,  a3);
  }

  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      uint64_t v6 = (void *)[self->_realSet mutableCopy];

      self->_id realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }

    [self->_realSet unionSet:a3];
  }

- (void)sortUsingComparator:(id)a3
{
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  uint64_t v10 = 12LL;
  uint64_t v11 = objc_msgSend( *(id *)((void)-[NSManagedObject entity](self->_source, "entity")[96] + 24 + (((unint64_t)self->_flags >> 13) & 0x7FFF8)),  "name");
  if (-[NSManagedObject hasFaultForRelationshipNamed:](self->_source, "hasFaultForRelationshipNamed:", v11))
  {
    NSUInteger v12 = location;
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:](v13, "setEntity:", -[NSManagedObject entity](self->_source, "entity"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v13,  "setRelationshipKeyPathsForPrefetching:",  [MEMORY[0x189603F18] arrayWithObject:v11]);
    -[NSFetchRequest setPredicate:]( v13,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self == %@", -[NSManagedObject objectID](self->_source, "objectID")]);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v13, "setReturnsObjectsAsFaults:", 0LL);
    -[NSFetchRequest setIncludesPendingChanges:](v13, "setIncludesPendingChanges:", 0LL);
    if (!v13)
    {
LABEL_6:
      NSUInteger location = v12;
      goto LABEL_7;
    }

- (id)allObjects
{
  v10[1] = *MEMORY[0x1895F89C0];
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  unint64_t v3 = [self->_realSet count];
  unint64_t v4 = MEMORY[0x1895F8858](v3);
  unint64_t v7 = (char *)v10 - v6;
  if (v4 > 0x200) {
    unint64_t v7 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v10 - v6, 8 * v5);
  }
  objc_msgSend(self->_realSet, "getObjects:range:", v7, 0, v3);
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v7 count:v3];
  if (v3 >= 0x201) {
    NSZoneFree(0LL, v7);
  }
  return v8;
}

- (id)_orderedObjectsAndKeys
{
  source = self->_source;
  if (source && (source->_cd_stateFlags & 0x38) != 0)
  {
    unint64_t v3 = 0LL;
  }

  else
  {
    if (source) {
      uint64_t v4 = _insertion_fault_handler;
    }
    else {
      uint64_t v4 = 0LL;
    }
    unint64_t v3 = (void *)-[NSFaultHandler retainedOrderedFaultInformationForAggregateFaultForObject:andRelationship:withContext:error:]( v4,  source,  -[_NSFaultingMutableOrderedSet relationship](self, "relationship"),  (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  0LL);
  }

  return v3;
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1895F89C0];

  self->_forcedKeys = 0LL;
  if ([a3 count])
  {
    if (a4)
    {
      unint64_t v17 = (void *)MEMORY[0x189607870];
      uint64_t v18 = *MEMORY[0x189607460];
      uint64_t v19 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"bad input oidsAndLocations => should have an even number",  @"Reason",  0);
      __int128 v20 = v17;
      uint64_t v21 = v18;
LABEL_14:
      uint64_t v24 = (void *)[v20 errorWithDomain:v21 code:134060 userInfo:v19];
      LOBYTE(v9) = 0;
      *a4 = v24;
      return (char)v9;
    }

@end