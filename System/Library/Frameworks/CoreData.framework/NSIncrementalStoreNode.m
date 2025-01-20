@interface NSIncrementalStoreNode
+ (void)initialize;
- (NSIncrementalStoreNode)initWithObjectID:(NSManagedObjectID *)objectID withValues:(NSDictionary *)values version:(uint64_t)version;
- (NSIncrementalStoreNode)initWithObjectID:(id)a3 fromSQLRow:(id)a4;
- (NSManagedObjectID)objectID;
- (const)knownKeyValuesPointer;
- (id)_propertyCache;
- (id)_snapshot_;
- (id)description;
- (id)valueForPropertyDescription:(NSPropertyDescription *)prop;
- (uint64_t)version;
- (unsigned)_versionNumber;
- (void)dealloc;
- (void)updateWithValues:(NSDictionary *)values version:(uint64_t)version;
@end

@implementation NSIncrementalStoreNode

+ (void)initialize
{
}

- (NSIncrementalStoreNode)initWithObjectID:(id)a3 fromSQLRow:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NSIncrementalStoreNode;
  v6 = -[NSIncrementalStoreNode init](&v27, sel_init);
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_reserved1 = 0LL;
    v6->_versionNumber = [a4 _versionNumber];
    uint64_t v7 = [a3 entity];
    uint64_t v8 = v7;
    if (v7) {
      v9 = *(void **)(v7 + 104);
    }
    else {
      v9 = 0LL;
    }
    v10 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v9);
    uint64_t v11 = -[NSKnownKeysDictionary values](v10, "values");
    uint64_t v12 = [v9 keys];
    uint64_t v13 = v12;
    v14 = *(void **)(v8 + 112);
    unint64_t v15 = v14[6];
    uint64_t v16 = v14[7];
    if (v15 < v16 + v15)
    {
      v17 = (void *)(v11 + 8 * v15);
      v18 = (void *)(v12 + 8 * v15);
      do
      {
        v19 = (void *)[a4 valueForKey:*v18];
        if (v19) {
          void *v17 = v19;
        }
        ++v17;
        ++v18;
        --v16;
      }

      while (v16);
    }

    unint64_t v20 = v14[12];
    uint64_t v21 = v14[13];
    if (v20 < v21 + v20)
    {
      v22 = (void *)(v11 + 8 * v20);
      v23 = (void *)(v13 + 8 * v20);
      do
      {
        v24 = (void *)[a4 valueForKey:*v23];
        if (v24) {
          id v25 = v24;
        }
        else {
          id v25 = (id)NSKeyValueCoding_NullValue;
        }
        *v22++ = v25;
        ++v23;
        --v21;
      }

      while (v21);
    }

    v6->_propertyCache = v10;
  }

  return v6;
}

- (NSIncrementalStoreNode)initWithObjectID:(NSManagedObjectID *)objectID withValues:(NSDictionary *)values version:(uint64_t)version
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NSIncrementalStoreNode;
  uint64_t v8 = -[NSIncrementalStoreNode init](&v40, sel_init);
  if (v8)
  {
    v9 = objectID;
    v8->_reserved1 = 0LL;
    v8->_objectID = v9;
    v8->_versionNumber = version;
    v10 = -[NSManagedObjectID entity](objectID, "entity");
    uint64_t v11 = v10;
    if (v10) {
      id propertyMapping = v10->_propertyMapping;
    }
    else {
      id propertyMapping = 0LL;
    }
    uint64_t v13 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  propertyMapping);
    NSUInteger v14 = -[NSDictionary count](values, "count");
    uint64_t v15 = -[NSKnownKeysDictionary values](v13, "values");
    v38 = &v35;
    uint64_t v39 = v15;
    MEMORY[0x1895F8858](v15);
    v18 = (char *)&v35 - v17;
    size_t v19 = 8 * v16;
    if (v14 > 0x200)
    {
      v18 = (char *)NSAllocateScannedUncollectable();
      uint64_t v21 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v35 - v17, 8 * v16);
      MEMORY[0x1895F8858](v20);
      uint64_t v21 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v21, v19);
    }

    -[NSDictionary getObjects:andKeys:](values, "getObjects:andKeys:", v18, v21);
    propertyRanges = v11->_propertyRanges;
    NSUInteger location = propertyRanges[6].location;
    NSUInteger length = propertyRanges[6].length;
    if (location < length + location)
    {
      id v25 = (void *)(v39 + 8 * location);
      NSUInteger v26 = length;
      do
      {
        *v25++ = NSKeyValueCoding_NullValue;
        --v26;
      }

      while (v26);
    }

    if (v14)
    {
      v36 = v13;
      v37 = v8;
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        unint64_t v28 = [propertyMapping indexForKey:*(void *)&v21[8 * i]];
        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v29 = v28;
          v30 = *(void **)&v18[8 * i];
          id v33 = v30;
          *(void *)(v39 + 8 * v29) = v33;
        }
      }

      uint64_t v13 = v36;
      uint64_t v8 = v37;
      if (v14 >= 0x201)
      {
        NSZoneFree(0LL, v21);
        NSZoneFree(0LL, v18);
      }
    }

    v8->_propertyCache = v13;
  }

  return v8;
}

- (void)dealloc
{
  self->_objectID = 0LL;
  self->_propertyCache = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSIncrementalStoreNode;
  -[NSIncrementalStoreNode dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ - %u", self->_objectID, self->_versionNumber];
}

- (void)updateWithValues:(NSDictionary *)values version:(uint64_t)version
{
  uint64_t v30 = version;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v6 = -[NSManagedObjectID entity](self->_objectID, "entity");
  uint64_t v7 = v6;
  if (v6) {
    id propertyMapping = v6->_propertyMapping;
  }
  else {
    id propertyMapping = 0LL;
  }
  id propertyCache = self->_propertyCache;
  NSUInteger v10 = -[NSDictionary count](values, "count");
  unint64_t v11 = MEMORY[0x1895F8858](v10);
  NSUInteger v14 = (char *)&v28 - v13;
  size_t v15 = 8 * v12;
  unint64_t v29 = self;
  if (v11 > 0x200)
  {
    NSUInteger v14 = (char *)NSAllocateScannedUncollectable();
    uint64_t v17 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)&v28 - v13, 8 * v12);
    MEMORY[0x1895F8858](v16);
    uint64_t v17 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v17, v15);
  }

  -[NSDictionary getObjects:andKeys:](values, "getObjects:andKeys:", v14, v17);
  [propertyCache removeAllObjects];
  propertyRanges = v7->_propertyRanges;
  NSUInteger location = propertyRanges[6].location;
  NSUInteger length = propertyRanges[6].length;
  if (location < length + location)
  {
    NSUInteger v21 = propertyRanges[6].length;
    NSUInteger v22 = propertyRanges[6].location;
    do
    {
      [propertyCache setValue:NSKeyValueCoding_NullValue atIndex:v22++];
      --v21;
    }

    while (v21);
  }

  if (v10)
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      unint64_t v24 = [propertyMapping indexForKey:*(void *)&v17[8 * i]];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(void *)&v14[8 * i] == NSKeyValueCoding_NullValue && v24 - location < length && v24 >= location) {
          uint64_t v27 = 0LL;
        }
        else {
          uint64_t v27 = *(void *)&v14[8 * i];
        }
        [propertyCache setValue:v27 atIndex:v24];
      }
    }

    if (v10 >= 0x201)
    {
      NSZoneFree(0LL, v17);
      NSZoneFree(0LL, v14);
    }
  }

  v29->_versionNumber = v30;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (uint64_t)version
{
  return self->_versionNumber;
}

- (id)valueForPropertyDescription:(NSPropertyDescription *)prop
{
  v5 = -[NSPropertyDescription entity](prop, "entity");
  v6 = -[NSManagedObjectID entity](self->_objectID, "entity");
  uint64_t v7 = v6;
  if (prop && v5 == v6) {
    goto LABEL_3;
  }
  if (!prop
    || !-[NSEntityDescription isKindOfEntity:](v6, "isKindOfEntity:", -[NSPropertyDescription entity](prop, "entity")))
  {
    return 0LL;
  }

  unint64_t v16 = -[NSPropertyDescription _propertyType](prop, "_propertyType");
  if (-[NSPropertyDescription _isAttribute](prop, "_isAttribute"))
  {
LABEL_3:
    uint64_t v8 = -[NSPropertyDescription _entitysReferenceID](prop, "_entitysReferenceID");
  }

  else
  {
    if (v16 != 4) {
      return 0LL;
    }
    uint64_t v8 = -[NSEntityDescription _offsetRelationshipIndex:fromSuperEntity:andIsToMany:]( v7,  "_offsetRelationshipIndex:fromSuperEntity:andIsToMany:",  -[NSPropertyDescription _entitysReferenceID](prop, "_entitysReferenceID"),  v5,  -[NSPropertyDescription isToMany](prop, "isToMany"));
  }

  unint64_t v9 = v8;
  if (v8 < 0) {
    return 0LL;
  }
  id result = (id)[self->_propertyCache valueAtIndex:v8];
  propertyRanges = v7->_propertyRanges;
  unint64_t location = propertyRanges[6].location;
  NSUInteger length = propertyRanges[6].length;
  BOOL v15 = v9 >= location;
  unint64_t v14 = v9 - location;
  BOOL v15 = !v15 || v14 >= length;
  if (!v15)
  {
    if (result != (id)NSKeyValueCoding_NullValue)
    {
      if (!result) {
        return (id)NSKeyValueCoding_NullValue;
      }
      return result;
    }

    return 0LL;
  }

  return result;
}

- (id)_propertyCache
{
  return self->_propertyCache;
}

- (const)knownKeyValuesPointer
{
  return (const void **)[self->_propertyCache values];
}

- (id)_snapshot_
{
  return 0LL;
}

- (unsigned)_versionNumber
{
  return self->_versionNumber;
}

@end