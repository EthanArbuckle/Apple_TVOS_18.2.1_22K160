@interface NSAtomicStoreCacheNode
+ (BOOL)accessInstanceVariablesDirectly;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSAtomicStoreCacheNode)init;
- (NSAtomicStoreCacheNode)initWithObjectID:(NSManagedObjectID *)moid;
- (NSManagedObjectID)objectID;
- (NSMutableDictionary)propertyCache;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)valueForKey:(NSString *)key;
- (unsigned)_versionNumber;
- (void)_setVersionNumber:(unsigned int)a3;
- (void)dealloc;
- (void)setPropertyCache:(NSMutableDictionary *)propertyCache;
- (void)setValue:(id)value forKey:(NSString *)key;
@end

@implementation NSAtomicStoreCacheNode

+ (void)initialize
{
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSAtomicStoreCacheNode)init
{
  return -[NSAtomicStoreCacheNode initWithObjectID:](v2, v3, v4);
}

- (NSAtomicStoreCacheNode)initWithObjectID:(NSManagedObjectID *)moid
{
  if (moid)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSAtomicStoreCacheNode;
    v4 = -[NSAtomicStoreCacheNode init](&v8, sel_init);
    if (v4)
    {
      v4->_objectID = moid;
      v4->__versionNumber = 1LL;
      v4->_propertyCache = 0LL;
    }

    return v4;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSAtomicStoreCacheNodes must be created with an objectID" userInfo:0]);
    -[NSAtomicStoreCacheNode dealloc](v6, v7);
  }

  return result;
}

- (void)dealloc
{
  self->_objectID = 0LL;
  self->_propertyCache = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAtomicStoreCacheNode;
  -[NSAtomicStoreCacheNode dealloc](&v3, sel_dealloc);
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unsigned)_versionNumber
{
  return self->__versionNumber;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->__versionNumber = a3;
}

- (const)knownKeyValuesPointer
{
  return 0LL;
}

- (id)_snapshot_
{
  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    return -[NSManagedObjectID isEqual:](self->_objectID, "isEqual:", *((void *)a3 + 1));
  }
  else {
    return 0;
  }
}

- (NSMutableDictionary)propertyCache
{
  return self->_propertyCache;
}

- (void)setPropertyCache:(NSMutableDictionary *)propertyCache
{
  v4 = self->_propertyCache;
  if (v4 != propertyCache)
  {
    uint64_t v5 = v4;
    self->_propertyCache = propertyCache;
  }

- (id)valueForKey:(NSString *)key
{
  uint64_t v5 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v5) {
    uint64_t v5 = (NSEntityDescription *)v5->_propertyMapping;
  }
  if (-[NSEntityDescription indexForKey:](v5, "indexForKey:", key) == 0x7FFFFFFFFFFFFFFFLL) {
    return -[NSAtomicStoreCacheNode valueForKey:]( &v9,  sel_valueForKey_,  key,  v8.receiver,  v8.super_class,  self,  &OBJC_CLASS___NSAtomicStoreCacheNode);
  }
  SEL v7 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v7) {
    SEL v7 = -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName](v7, "propertiesByName"),  "objectForKey:",  key);
  }
  if (-[NSEntityDescription isTransient](v7, "isTransient")) {
    return -[NSAtomicStoreCacheNode valueForKey:]( &v8,  sel_valueForKey_,  key,  self,  &OBJC_CLASS___NSAtomicStoreCacheNode,  v9.receiver,  v9.super_class);
  }
  else {
    return (id)-[NSMutableDictionary valueForKey:](self->_propertyCache, "valueForKey:", key);
  }
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  SEL v7 = -[NSManagedObjectID entity](self->_objectID, "entity");
  if (v7) {
    SEL v7 = (NSEntityDescription *)v7->_propertyMapping;
  }
  if (-[NSEntityDescription indexForKey:](v7, "indexForKey:", key) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSAtomicStoreCacheNode;
    -[NSAtomicStoreCacheNode setValue:forKey:](&v9, sel_setValue_forKey_, value, key);
  }

  propertyCache = self->_propertyCache;
  if (propertyCache)
  {
    if (value)
    {
LABEL_7:
      -[NSMutableDictionary setValue:forKey:](propertyCache, "setValue:forKey:", value, key);
      return;
    }
  }

  else
  {
    propertyCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    self->_propertyCache = propertyCache;
    if (value) {
      goto LABEL_7;
    }
  }

  -[NSMutableDictionary removeObjectForKey:](propertyCache, "removeObjectForKey:", key);
}

@end