@interface NSStoreMapNode
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSStoreMapNode)initWithCoder:(id)a3;
- (NSStoreMapNode)initWithObjectID:(id)a3;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)configurationName;
- (id)destinationsForRelationship:(id)a3;
- (id)entity;
- (id)key;
- (id)objectID;
- (unsigned)_versionNumber;
- (void)_setMap:(uint64_t)a1;
- (void)_setVersionNumber:(unsigned int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSStoreMapNode

+ (void)initialize
{
}

- (NSStoreMapNode)initWithObjectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSStoreMapNode;
  v4 = -[NSStoreMapNode init](&v6, sel_init);
  if (v4)
  {
    v4->_objectID = (NSManagedObjectID *)a3;
    v4->_relatedNodes = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x189603FC8]) init];
    v4->_map = 0LL;
    v4->_version = 1;
  }

  return v4;
}

- (NSStoreMapNode)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSStoreMapNode;
  v4 = -[NSStoreMapNode init](&v9, sel_init);
  v4->_version = 1;
  uint64_t v5 = [a3 decodeInt64ForKey:@"NSPrimaryKey64"];
  if (v5) {
    objc_super v6 = (NSManagedObjectID *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v5];
  }
  else {
    objc_super v6 = (NSManagedObjectID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSKey"];
  }
  v4->_objectID = v6;
  if (!v6) {
    objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 4864, &unk_189F03E28));
  }
  v7 = (NSMutableDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines attributeClassesForSecureCoding]() forKey:@"NSRelatedNodes"];
  v4->_relatedNodes = v7;
  if (!v7) {
    v4->_relatedNodes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  v4->_entityName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityName"];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = -[NSManagedObjectID _referenceData](self->_objectID, "_referenceData");
  else {
    [a3 encodeObject:v5 forKey:@"NSKey"];
  }
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityDescription name](-[NSManagedObjectID entity](self->_objectID, "entity"), "name"),  @"NSEntityName");
  if (-[NSMutableDictionary count](self->_relatedNodes, "count")) {
    [a3 encodeObject:self->_relatedNodes forKey:@"NSRelatedNodes"];
  }
}

- (void)dealloc
{
  self->_objectID = 0LL;
  self->_relatedNodes = 0LL;

  self->_entityName = 0LL;
  self->_map = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSStoreMapNode;
  -[NSStoreMapNode dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && objc_msgSend( -[NSStoreMapNode objectID](self, "objectID"),  "isEqual:",  objc_msgSend(a3, "objectID")))
  {
    if (self)
    {
      relatedNodes = self->_relatedNodes;
      if (a3)
      {
LABEL_5:
        uint64_t v7 = *((void *)a3 + 3);
        return -[NSMutableDictionary isEqual:](relatedNodes, "isEqual:", v7);
      }
    }

    else
    {
      relatedNodes = 0LL;
      if (a3) {
        goto LABEL_5;
      }
    }

    uint64_t v7 = 0LL;
    return -[NSMutableDictionary isEqual:](relatedNodes, "isEqual:", v7);
  }

  return 0;
}

- (id)objectID
{
  return self->_objectID;
}

- (id)key
{
  return -[NSManagedObjectID _referenceData](self->_objectID, "_referenceData");
}

- (id)entity
{
  return -[NSManagedObjectID entity](self->_objectID, "entity");
}

- (id)configurationName
{
  return -[NSPersistentStoreMap configurationName](self->_map, "configurationName");
}

- (id)destinationsForRelationship:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_relatedNodes, "objectForKey:", a3);
}

- (void)_setMap:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 8) = a2;
    if (*(void *)(a1 + 32))
    {
      if (!a2) {
        goto LABEL_10;
      }
      for (i = *(void **)(a2 + 8); ; i = 0LL)
      {
        v4 = *(void **)(a1 + 16);
        uint64_t v5 = objc_msgSend((id)objc_msgSend(i, "_persistentStoreCoordinator"), "managedObjectModel");
        uint64_t v6 = v5;
        if (v5)
        {
          uint64_t v7 = [*(id *)(v5 + 32) objectForKey:*(void *)(a1 + 32)];
          if (v7) {
            break;
          }
        }

        uint64_t v8 = [NSString stringWithFormat:@"Can't find entity %@ in model %@", *(void *)(a1 + 32), v6];

        *(void *)(a1 + 32) = 0LL;
        id v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A60],  134020LL,  v8,  0LL);
        objc_exception_throw(v9);
LABEL_10:
        ;
      }

      *(void *)(a1 + 16) = objc_msgSend( objc_alloc((Class)objc_msgSend(i, "objectIDFactoryForEntity:", v7)),  "initWithObject:",  v4);

      *(void *)(a1 + 32) = 0LL;
    }
  }

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->_version = a3;
}

- (const)knownKeyValuesPointer
{
  return 0LL;
}

- (id)_snapshot_
{
  return 0LL;
}

@end