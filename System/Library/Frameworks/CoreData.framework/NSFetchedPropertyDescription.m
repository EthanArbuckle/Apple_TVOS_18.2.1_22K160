@interface NSFetchedPropertyDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)isTransient;
- (NSFetchRequest)fetchRequest;
- (NSFetchedPropertyDescription)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchRequest:(NSFetchRequest *)fetchRequest;
@end

@implementation NSFetchedPropertyDescription

- (void)dealloc
{
  self->_fetchRequest = 0LL;
  self->_lazyFetchRequestEntityName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  id v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  v6 = (void *)MEMORY[0x186E3E5D8](v5);
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"),  @"NSFetchRequest");
  v7 = -[NSFetchRequest entity](-[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"), "entity");
  if (v7) {
    lazyFetchRequestEntityName = -[NSEntityDescription name](v7, "name");
  }
  else {
    lazyFetchRequestEntityName = self->_lazyFetchRequestEntityName;
  }
  [a3 encodeObject:lazyFetchRequestEntityName forKey:@"_NSFetchRequestEntityName"];
  objc_autoreleasePoolPop(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchedPropertyDescription)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSFetchRequest *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFetchRequest"];
    id v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSFetchRequestEntityName"];
    if (!-[NSFetchRequest entity](v4->_fetchRequest, "entity"))
    {
      if (v5 && ([v5 isNSString] & 1) == 0)
      {
        objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F035B8));

        return 0LL;
      }

      else
      {
        v4->_lazyFetchRequestEntityName = (NSString *)v5;
      }
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    id v5 = (void *)-[NSFetchRequest copy](self->_fetchRequest, "copy");
    v4[12] = v5;
    [v5 setEntity:0];
    v6 = -[NSFetchRequest entity](self->_fetchRequest, "entity");
    if (v6) {
      uint64_t v7 = -[NSString copy](-[NSEntityDescription name](v6, "name"), "copy");
    }
    else {
      uint64_t v7 = -[NSString copy](self->_lazyFetchRequestEntityName, "copy");
    }
    v4[13] = v7;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v11, sel_isEqual_);
    if ((_DWORD)v7)
    {
      v8 = -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest");
      uint64_t v7 = [a3 fetchRequest];
      if (v8 == (NSFetchRequest *)v7)
      {
        LOBYTE(v7) = 1;
      }

      else
      {
        uint64_t v9 = v7;
        LOBYTE(v7) = 0;
        if (v8 && v9) {
          LOBYTE(v7) = -[NSFetchRequest isEqual:](v8, "isEqual:");
        }
      }
    }
  }

  return v7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  return (id)[NSString stringWithFormat:@"%@, fetchRequest %@", -[NSPropertyDescription description](&v3, sel_description), -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest")];
}

- (NSFetchRequest)fetchRequest
{
  if (!self->_lazyFetchRequestEntityName) {
    return self->_fetchRequest;
  }
  fetchRequest = self->_fetchRequest;
  if (!fetchRequest || -[NSFetchRequest entity](fetchRequest, "entity")) {
    return self->_fetchRequest;
  }
  uint64_t v4 = (NSFetchRequest *)(id)-[NSFetchRequest copy](self->_fetchRequest, "copy");
  v6 = -[NSEntityDescription managedObjectModel](-[NSPropertyDescription entity](self, "entity"), "managedObjectModel");
  if (v6) {
    uint64_t v7 = -[NSMutableDictionary objectForKey:](v6->_entities, "objectForKey:", self->_lazyFetchRequestEntityName);
  }
  else {
    uint64_t v7 = 0LL;
  }
  -[NSFetchRequest setEntity:](v4, "setEntity:", v7);
  return v4;
}

- (void)setFetchRequest:(NSFetchRequest *)fetchRequest
{
  if (self->_fetchRequest != fetchRequest)
  {
    if (fetchRequest)
    {
      id v5 = -[NSEntityDescription managedObjectModel]( -[NSPropertyDescription entity](self, "entity"),  "managedObjectModel");
      if (v5 != -[NSEntityDescription managedObjectModel]( -[NSFetchRequest entity](fetchRequest, "entity"),  "managedObjectModel")) {
        [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"Can't use fetch request with fetched property description (entity model mismatch)."];
      }
    }

    fetchRequest = fetchRequest;
    self->_fetchRequest = fetchRequest;
  }

  if (self->_lazyFetchRequestEntityName) {
    BOOL v6 = fetchRequest == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && !-[NSFetchRequest entity](fetchRequest, "entity"))
  {
    uint64_t v7 = self->_fetchRequest;
    v8 = -[NSEntityDescription managedObjectModel]( -[NSPropertyDescription entity](self, "entity"),  "managedObjectModel");
    if (v8) {
      uint64_t v9 = -[NSMutableDictionary objectForKey:](v8->_entities, "objectForKey:", self->_lazyFetchRequestEntityName);
    }
    else {
      uint64_t v9 = 0LL;
    }
    -[NSFetchRequest setEntity:](v7, "setEntity:", v9);
  }

  self->_lazyFetchRequestEntityName = 0LL;
}

- (BOOL)isTransient
{
  return 1;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (unint64_t)_propertyType
{
  return 3LL;
}

- (void)_createCachesAndOptimizeState
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v3, sel__createCachesAndOptimizeState);
  -[NSFetchedPropertyDescription setFetchRequest:]( self,  "setFetchRequest:",  -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"));
  -[NSFetchRequest allowEvaluation](self->_fetchRequest, "allowEvaluation");
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  uint64_t v16 = [a3 length] - 4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NSFetchedPropertyDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:]( &v18,  sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_,  a3,  a4,  a5,  a6,  a7,  a8);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a9, "objectForKey:", self->_fetchRequest), "unsignedIntValue"));
  unsigned int v17 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v16, 4, &v17);
}

@end