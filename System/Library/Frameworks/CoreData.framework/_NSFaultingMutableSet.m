@interface _NSFaultingMutableSet
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isIdenticalFault:(id)a3;
- (BOOL)_shouldProcessKVOChange;
- (BOOL)containsObject:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isFault;
- (BOOL)isSubsetOfSet:(id)a3;
- (Class)classForCoder;
- (NSManagedObject)source;
- (NSPropertyDescription)relationship;
- (_NSFaultingMutableSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6;
- (_NSFaultingMutableSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5;
- (id)allObjects;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)replacementObjectForCoder:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3;
- (void)intersectSet:(id)a3;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setSet:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)turnIntoFault;
- (void)unionSet:(id)a3;
- (void)willRead;
- (void)willReadWithContents:(id)a3;
@end

@implementation _NSFaultingMutableSet

- (_NSFaultingMutableSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  BOOL v5 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____NSFaultingMutableSet;
  v8 = -[_NSFaultingMutableSet init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    else {
      unsigned int v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    }
    v9->_flags = (_NSFaultingMutableSetFlags)v10;
    v9->_flags = (_NSFaultingMutableSetFlags)(v10 & 0xFFFF0003);
    unsigned int v11 = *(_WORD *)&v9->_flags | ([a4 _entitysReferenceID] << 16);
    if (v5)
    {
      v9->_flags = (_NSFaultingMutableSetFlags)(v11 | 1);
      v9->_realSet = 0LL;
    }

    else
    {
      v9->_flags = (_NSFaultingMutableSetFlags)(v11 & 0xFFFFFFFE);
      v14.version = *MEMORY[0x189605258];
      *(_OWORD *)&v14.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
      v12 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      v14.equal = 0LL;
      v14.hash = 0LL;
      v14.copyDescription = v12;
      v9->_realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v14);
    }
  }

  return v9;
}

- (unint64_t)count
{
  return CFSetGetCount((CFSetRef)self->_realSet);
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0) {
    -[_NSFaultingMutableSet willReadWithContents:](self, "willReadWithContents:", 0LL);
  }
}

- (void)willReadWithContents:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  BOOL v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = self->_realSet;
    callBacks.version = *MEMORY[0x189605258];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    callBacks.equal = 0LL;
    callBacks.hash = 0LL;
    callBacks.copyDescription = v7;
    v8 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    v9 = *(void **)((void)-[NSManagedObject entity](self->_source, "entity")[96]
                  + 24LL
                  + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
    self->_realSet = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
    ptr = realSet;
    if (a3)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(a3);
            }
            CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((void *)&v27 + 1) + 8 * i));
          }

          uint64_t v11 = [a3 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }

        while (v11);
      }
    }

    else
    {
      v25 = v5;
      source = self->_source;
      if (source) {
        uint64_t v15 = _insertion_fault_handler;
      }
      else {
        uint64_t v15 = 0LL;
      }
      id v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:]( v15,  source,  v9,  (uint64_t)v8);
      if ([v16 count])
      {
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v32;
          do
          {
            for (uint64_t j = 0LL; j != v18; ++j)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:]( v8,  *(void **)(*((void *)&v31 + 1) + 8 * j),  0LL);
              CFSetAddValue((CFMutableSetRef)self->_realSet, v21);
            }

            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }

          while (v18);
        }
      }

      BOOL v5 = v25;
    }

    if (ptr)
    {
      v23 = (void *)*ptr;
      v22 = (void *)ptr[1];
      if (*ptr)
      {
        [self->_realSet unionSet:*ptr];
      }

      if (v22)
      {
        [self->_realSet minusSet:v22];
      }

      PF_FREE_OBJECT_ARRAY(ptr);
    }

    unint64_t flags = self->_flags;
    self->_unint64_t flags = (_NSFaultingMutableSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
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

  self->_realSet = 0LL;
  self->_source = 0LL;
  _PFDeallocateObject(self);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_NSFaultingMutableSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v7 = -[_NSFaultingMutableSet initWithSource:forRelationship:asFault:]( self,  "initWithSource:forRelationship:asFault:",  a3,  a5,  0LL,  a6);
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

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)_shouldProcessKVOChange
{
  return 1;
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
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    CFSetRef v11 = -[_NSFaultingMutableSet initWithSource:forRelationship:asFault:]( objc_alloc(&OBJC_CLASS____NSFaultingMutableSet),  "initWithSource:forRelationship:asFault:",  self->_source,  -[_NSFaultingMutableSet relationship](self, "relationship"),  1LL);
    realSet = (id *)self->_realSet;
    if (realSet)
    {
      __int128 v13 = PF_ALLOCATE_OBJECT_ARRAY(2LL);
      *__int128 v13 = [*realSet mutableCopyWithZone:a3];
      v13[1] = [realSet[1] mutableCopyWithZone:a3];
      *((void *)v11 + 2) = v13;
    }

    *((_DWORD *)v11 + 3) = *((_DWORD *)v11 + 3) & 0xFFFFFFFD | (2 * ((*(_DWORD *)&self->_flags >> 1) & 1));
  }

  else
  {
    unint64_t Count = CFSetGetCount((CFSetRef)self->_realSet);
    if (!Count) {
      return (id)NSSet_EmptySet;
    }
    unint64_t v6 = Count;
    callBacks.version = *MEMORY[0x189605258];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    if (Count >= 0x201) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = Count;
    }
    callBacks.equal = 0LL;
    callBacks.hash = 0LL;
    callBacks.copyDescription = v7;
    unint64_t v9 = (8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v10 = (const void **)((char *)&v15 - v9);
    if (Count > 0x200) {
      uint64_t v10 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v15 - v9, 8 * Count);
    }
    CFSetGetValues((CFSetRef)self->_realSet, v10);
    CFSetRef v11 = CFSetCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, v6, &callBacks);
    if (v6 >= 0x201) {
      NSZoneFree(0LL, v10);
    }
  }

  return v11;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:CFSetGetCount((CFSetRef)self->_realSet)];
  [v4 setSet:self->_realSet];
  return v4;
}

- (id)description
{
  _NSFaultingMutableSetFlags flags = self->_flags;
  v4 = (void *)NSString;
  BOOL v5 = -[NSPropertyDescription name](-[_NSFaultingMutableSet relationship](self, "relationship"), "name");
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
  _NSFaultingMutableSetFlags flags = self->_flags;
  unint64_t v6 = (void *)NSString;
  v7 = -[NSPropertyDescription name](-[_NSFaultingMutableSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0) {
    return (id)[v6 stringWithFormat:@"Relationship '%@' fault on managed object (%p) %@", v7, self->_source, source, v10];
  }
  else {
    return (id)[v6 stringWithFormat:@"Relationship '%@' on managed object (%p) %@ with objects %@", v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3)];
  }
}

- (id)member:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0) {
    return (id)CFSetGetValue((CFSetRef)self->_realSet, a3);
  }
  realSet = (id *)self->_realSet;
  if (!realSet || (id result = (id)[*realSet member:a3]) == 0)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    return (id)CFSetGetValue((CFSetRef)self->_realSet, a3);
  }

  return result;
}

- (void)addObject:(id)a3
{
  realSet = (id *)self->_realSet;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2LL);
      id *realSet = 0LL;
      realSet[1] = 0LL;
      self->_realSet = realSet;
    }

    CFMutableSetRef v6 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      v8.version = *MEMORY[0x189605258];
      *(_OWORD *)&v8.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
      v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      v8.equal = 0LL;
      v8.hash = 0LL;
      v8.copyDescription = v7;
      CFMutableSetRef v6 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v8);
      id *realSet = v6;
    }

    -[__CFSet addObject:](v6, "addObject:", a3);
    [realSet[1] removeObject:a3];
  }

  else
  {
    CFSetAddValue((CFMutableSetRef)self->_realSet, a3);
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [self->_realSet countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)[self->_realSet objectsWithOptions:a3 passingTest:a4];
}

- (id)objectEnumerator
{
  return (id)[self->_realSet objectEnumerator];
}

- (void)getObjects:(id *)a3
{
}

- (id)allObjects
{
  return (id)[self->_realSet allObjects];
}

- (id)anyObject
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl( (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"),  a2);
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
  realSet = (id *)self->_realSet;
  if (!realSet || ![*realSet count])
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
LABEL_8:
    p_realSet = &self->_realSet;
    return (id)[*p_realSet anyObject];
  }

  p_realSet = (id *)self->_realSet;
  return (id)[*p_realSet anyObject];
}

- (BOOL)containsObject:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = (id *)self->_realSet;
    if (realSet && ([*realSet containsObject:a3] & 1) != 0) {
      return 1;
    }
    -[_NSFaultingMutableSet willRead](self, "willRead");
  }

  return CFSetContainsValue((CFSetRef)self->_realSet, a3) != 0;
}

- (BOOL)intersectsSet:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return [self->_realSet intersectsSet:a3];
}

- (BOOL)isEqualToSet:(id)a3
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
          CFMutableSetRef v6 = -[_NSFaultingMutableSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }

  -[_NSFaultingMutableSet willRead](self, "willRead");
  return [self->_realSet isEqualToSet:a3];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isNSSet];
    if (v5) {
      LOBYTE(v5) = -[_NSFaultingMutableSet isEqualToSet:](self, "isEqualToSet:", a3);
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
          CFMutableSetRef v6 = -[_NSFaultingMutableSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)[a3 relationship]) {
            return 1;
          }
        }
      }
    }
  }

  return 0;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  -[_NSFaultingMutableSet willRead](self, "willRead");
  return [self->_realSet isSubsetOfSet:a3];
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
}

- (void)removeObject:(id)a3
{
  realSet = (id *)self->_realSet;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2LL);
      id *realSet = 0LL;
      realSet[1] = 0LL;
      self->_realSet = realSet;
    }

    if (!realSet[1])
    {
      v7.version = *MEMORY[0x189605258];
      *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
      CFMutableSetRef v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      v7.equal = 0LL;
      v7.hash = 0LL;
      v7.copyDescription = v6;
      realSet[1] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v7);
    }

    [*realSet removeObject:a3];
    [realSet[1] addObject:a3];
  }

  else
  {
    CFSetRemoveValue((CFMutableSetRef)self->_realSet, a3);
  }

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  -[_NSFaultingMutableSet willRead](self, "willRead");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = (id *)self->_realSet;
    if (!realSet)
    {
      realSet = (id *)PF_ALLOCATE_OBJECT_ARRAY(2LL);
      id *realSet = 0LL;
      realSet[1] = 0LL;
      self->_realSet = realSet;
    }

    CFMutableSetRef v10 = (CFMutableSetRef)*realSet;
    if (!*realSet)
    {
      callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
      CFSetRef v11 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
      callBacks.equal = 0LL;
      callBacks.hash = 0LL;
      callBacks.copyDescription = v11;
      CFMutableSetRef v10 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &callBacks);
      id *realSet = v10;
    }

    -[__CFSet addObjectsFromArray:](v10, "addObjectsFromArray:", a3);
    if ([realSet[1] count])
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:a3];
      [realSet[1] minusSet:v12];
    }
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(a3);
          }
          CFSetAddValue((CFMutableSetRef)self->_realSet, *(const void **)(*((void *)&v13 + 1) + 8 * i));
        }

        uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v6);
    }
  }

- (void)intersectSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    [self->_realSet intersectSet:a3];
  }

- (void)minusSet:(id)a3
{
  if (a3 == self)
  {
    [a3 removeAllObjects];
  }

  else
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    [self->_realSet minusSet:a3];
  }

- (void)removeAllObjects
{
}

- (void)unionSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    [self->_realSet unionSet:a3];
  }

- (void)setSet:(id)a3
{
  if (a3 != self)
  {
    -[_NSFaultingMutableSet willRead](self, "willRead");
    [self->_realSet setSet:a3];
  }

- (void)setValue:(id)a3 forKey:(id)a4
{
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

@end