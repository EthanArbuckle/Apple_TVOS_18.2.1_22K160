@interface NSRelationshipDescription
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)_isRelationship;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isToMany;
- (NSData)versionHash;
- (NSDeleteRule)deleteRule;
- (NSEntityDescription)destinationEntity;
- (NSRelationshipDescription)init;
- (NSRelationshipDescription)initWithCoder:(id)a3;
- (NSRelationshipDescription)inverseRelationship;
- (NSUInteger)maxCount;
- (NSUInteger)minCount;
- (id)_initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4;
- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4 proxyContext:(id)a5;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleteRule:(NSDeleteRule)deleteRule;
- (void)setDestinationEntity:(NSEntityDescription *)destinationEntity;
- (void)setInverseRelationship:(NSRelationshipDescription *)inverseRelationship;
- (void)setMaxCount:(NSUInteger)maxCount;
- (void)setMinCount:(NSUInteger)minCount;
@end

@implementation NSRelationshipDescription

- (BOOL)_isRelationship
{
  return 1;
}

- (NSDeleteRule)deleteRule
{
  return self->_deleteRule;
}

- (unint64_t)_propertyType
{
  return 4LL;
}

- (BOOL)isToMany
{
  return self->_maxCount != 1;
}

+ (void)initialize
{
}

- (NSRelationshipDescription)init
{
  return (NSRelationshipDescription *)-[NSRelationshipDescription _initWithName:](self, "_initWithName:", 0LL);
}

- (void)dealloc
{
  self->_destinationEntity = 0LL;

  self->_lazyDestinationEntityName = 0LL;
  self->_inverseRelationship = 0LL;

  self->_lazyInverseRelationshipName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  -[NSPropertyDescription dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  id v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  v6 = (void *)MEMORY[0x186E3E5D8](v5);
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription maxCount](self, "maxCount"), @"NSMaxCount");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSRelationshipDescription minCount](self, "minCount"), @"NSMinCount");
  objc_msgSend( a3,  "encodeInt:forKey:",  -[NSRelationshipDescription deleteRule](self, "deleteRule"),  @"NSDeleteRule");
  objc_msgSend( a3,  "encodeConditionalObject:forKey:",  -[NSRelationshipDescription destinationEntity](self, "destinationEntity"),  @"NSDestinationEntity");
  if (-[NSRelationshipDescription destinationEntity](self, "destinationEntity")) {
    lazyDestinationEntityName = -[NSEntityDescription name]( -[NSRelationshipDescription destinationEntity](self, "destinationEntity"),  "name");
  }
  else {
    lazyDestinationEntityName = self->_lazyDestinationEntityName;
  }
  [a3 encodeObject:lazyDestinationEntityName forKey:@"_NSDestinationEntityName"];
  objc_msgSend( a3,  "encodeConditionalObject:forKey:",  -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"),  @"NSInverseRelationship");
  if (-[NSRelationshipDescription inverseRelationship](self, "inverseRelationship")) {
    lazyInverseRelationshipName = -[NSPropertyDescription name]( -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"),  "name");
  }
  else {
    lazyInverseRelationshipName = self->_lazyInverseRelationshipName;
  }
  [a3 encodeObject:lazyInverseRelationshipName forKey:@"_NSInverseRelationshipName"];
  objc_autoreleasePoolPop(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSRelationshipDescription)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    id v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v16 = __43__NSRelationshipDescription_initWithCoder___block_invoke;
    v17 = &unk_189EA7758;
    v18 = v5;
    v4->_maxCount = (int)[a3 decodeIntForKey:@"NSMaxCount"];
    v4->_minCount = (int)[a3 decodeIntForKey:@"NSMinCount"];
    v4->_deleteRule = (int)[a3 decodeIntForKey:@"NSDeleteRule"];
    v4->_destinationEntity = (NSEntityDescription *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDestinationEntity"];
    v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSDestinationEntityName"];
    if (!v4->_destinationEntity)
    {
      v10 = v6;
      if (v6 && ([v6 isNSString] & 1) == 0)
      {
        objc_super v9 = &unk_189F03C48;
        goto LABEL_30;
      }

      v4->_lazyDestinationEntityName = (NSString *)[v10 copy];
      goto LABEL_14;
    }

    if (v5) {
      v7 = (void *)v5[3];
    }
    else {
      v7 = 0LL;
    }
    objc_msgSend(v7, "addObject:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v9 = &unk_189F03C70;
      goto LABEL_30;
    }

    if (v5)
    {
      if (v5[1]) {
        goto LABEL_14;
      }
      v8 = (NSEntityDescription *)v5[2];
    }

    else
    {
      v8 = 0LL;
    }

    if (v4->_destinationEntity != v8)
    {
      objc_super v9 = &unk_189F03C98;
      goto LABEL_30;
    }

void __43__NSRelationshipDescription_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  v4 = -[NSPropertyDescription copyWithZone:](&v11, sel_copyWithZone_, a3);
  id v5 = v4;
  if (v4)
  {
    v4[16] = self->_maxCount;
    v4[17] = self->_minCount;
    v4[18] = self->_deleteRule;
    destinationEntity = self->_destinationEntity;
    if (destinationEntity) {
      uint64_t v7 = -[NSString copy](-[NSEntityDescription name](destinationEntity, "name"), "copy");
    }
    else {
      uint64_t v7 = -[NSString copy](self->_lazyDestinationEntityName, "copy");
    }
    v5[13] = v7;
    inverseRelationship = self->_inverseRelationship;
    if (inverseRelationship) {
      uint64_t v9 = -[NSString copy](-[NSPropertyDescription name](inverseRelationship, "name"), "copy");
    }
    else {
      uint64_t v9 = -[NSString copy](self->_lazyInverseRelationshipName, "copy");
    }
    v5[15] = v9;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v20 = v3;
    uint64_t v21 = v4;
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v19, sel_isEqual_);
    if ((_DWORD)v7)
    {
      NSUInteger v8 = -[NSRelationshipDescription maxCount](self, "maxCount");
      if (v8 == [a3 maxCount]
        && (NSUInteger v9 = -[NSRelationshipDescription minCount](self, "minCount"), v9 == [a3 minCount])
        && (NSDeleteRule v10 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v10 == [a3 deleteRule])
        && (int v11 = -[NSRelationshipDescription isOrdered](self, "isOrdered"),
            v11 == [a3 isOrdered]))
      {
        v12 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
        uint64_t v7 = -[NSEntityDescription name]( -[NSRelationshipDescription destinationEntity](self, "destinationEntity"),  "name");
        if (v12 == v7
          || (v13 = v7, LOBYTE(v7) = 0, v12) && v13 && (LODWORD(v7) = -[NSString isEqual:](v12, "isEqual:"), (_DWORD)v7))
        {
          v14 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
          v15 = (void *)[a3 inverseRelationship];
          v16 = -[NSPropertyDescription name](v14, "name");
          uint64_t v7 = (NSString *)[v15 name];
          if (v16 == v7)
          {
            LOBYTE(v7) = 1;
          }

          else
          {
            v17 = v7;
            LOBYTE(v7) = 0;
            if (v16 && v17) {
              LOBYTE(v7) = -[NSString isEqual:](v16, "isEqual:");
            }
          }
        }
      }

      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }

  return (char)v7;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  LODWORD(v5) = -[NSPropertyDescription isEqual:](&v13, sel_isEqual_);
  if ((_DWORD)v5)
  {
    NSUInteger v6 = -[NSRelationshipDescription maxCount](self, "maxCount");
    if (v6 == [a3 maxCount]
      && (NSUInteger v7 = -[NSRelationshipDescription minCount](self, "minCount"), v7 == [a3 minCount])
      && (NSDeleteRule v8 = -[NSRelationshipDescription deleteRule](self, "deleteRule"), v8 == [a3 deleteRule])
      && (int v9 = -[NSRelationshipDescription isOrdered](self, "isOrdered"),
          v9 == [a3 isOrdered]))
    {
      NSDeleteRule v10 = (NSString *)objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name");
      id v5 = -[NSEntityDescription name]( -[NSRelationshipDescription destinationEntity](self, "destinationEntity"),  "name");
      if (v10 == v5)
      {
        LOBYTE(v5) = 1;
      }

      else
      {
        int v11 = v5;
        LOBYTE(v5) = 0;
        if (v10 && v11) {
          LOBYTE(v5) = -[NSString isEqual:](v10, "isEqual:");
        }
      }
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  return (id)[NSString stringWithFormat:@"%@, destination entity %@, inverseRelationship %@, minCount %lu, maxCount %lu, isOrdered %d, deleteRule %lu", -[NSPropertyDescription description](&v3, sel_description), -[NSEntityDescription name]( -[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name"), -[NSPropertyDescription name]( -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"), "name"), -[NSRelationshipDescription minCount](self, "minCount"), -[NSRelationshipDescription maxCount](self, "maxCount"), -[NSRelationshipDescription isOrdered](self, "isOrdered"), -[NSRelationshipDescription deleteRule](self, "deleteRule")];
}

- (NSUInteger)maxCount
{
  return self->_maxCount;
}

- (NSUInteger)minCount
{
  return self->_minCount;
}

- (void)setMaxCount:(NSUInteger)maxCount
{
  unsigned int v3 = maxCount;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_maxCount = v3;
}

- (void)setMinCount:(NSUInteger)minCount
{
  unsigned int v3 = minCount;
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_minCount = v3;
}

- (BOOL)isIndexed
{
  return 1;
}

- (NSEntityDescription)destinationEntity
{
  result = self->_destinationEntity;
  if (!result)
  {
    if (self->_lazyDestinationEntityName)
    {
      result = -[NSEntityDescription managedObjectModel]( -[NSPropertyDescription entity](self, "entity"),  "managedObjectModel");
      if (result) {
        return (NSEntityDescription *)[result->_versionHash objectForKey:self->_lazyDestinationEntityName];
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)setDestinationEntity:(NSEntityDescription *)destinationEntity
{
  self->_destinationEntity = destinationEntity;

  self->_lazyDestinationEntityName = 0LL;
}

- (void)setDeleteRule:(NSDeleteRule)deleteRule
{
  self->_deleteRule = deleteRule;
}

- (NSRelationshipDescription)inverseRelationship
{
  result = self->_inverseRelationship;
  if (!result)
  {
    if (self->_lazyInverseRelationshipName) {
      return (NSRelationshipDescription *)-[NSEntityDescription _relationshipNamed:]( (void *)-[NSRelationshipDescription destinationEntity]( self,  "destinationEntity"),  (uint64_t)self->_lazyInverseRelationshipName);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)setInverseRelationship:(NSRelationshipDescription *)inverseRelationship
{
  self->_inverseRelationship = inverseRelationship;

  self->_lazyInverseRelationshipName = 0LL;
}

- (NSData)versionHash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  return -[NSPropertyDescription versionHash](&v3, sel_versionHash);
}

- (id)_initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  id result = -[NSPropertyDescription _initWithName:](&v4, sel__initWithName_, a3);
  if (result)
  {
    *((void *)result + 17) = 0LL;
    *((void *)result + 16) = 0LL;
    *((void *)result + 18) = 1LL;
  }

  return result;
}

- (void)_createCachesAndOptimizeState
{
  v27[1] = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  -[NSPropertyDescription _createCachesAndOptimizeState](&v19, sel__createCachesAndOptimizeState);
  if (!self->_destinationEntity) {
    -[NSRelationshipDescription setDestinationEntity:]( self,  "setDestinationEntity:",  -[NSRelationshipDescription destinationEntity](self, "destinationEntity"));
  }
  if (!self->_inverseRelationship) {
    -[NSRelationshipDescription setInverseRelationship:]( self,  "setInverseRelationship:",  -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"));
  }
  if (objc_msgSend( -[NSDictionary objectForKey:]( -[NSPropertyDescription userInfo](self, "userInfo"),  "objectForKey:",  @"NSRelationshipDescriptionOrderKeyIndexOption"),  "BOOLValue"))
  {
    if (-[NSRelationshipDescription isToMany](self, "isToMany"))
    {
      if (-[NSRelationshipDescription isOrdered](self, "isOrdered")) {
        return;
      }
      uint64_t v11 = *MEMORY[0x189607460];
      uint64_t v22 = *MEMORY[0x1896075F0];
      v23 = @"Relationship is not ordered";
      uint64_t v12 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v11,  1591,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      id v5 = (void *)MEMORY[0x189603F70];
      uint64_t v6 = *MEMORY[0x189603A60];
      uint64_t v13 = *MEMORY[0x189607798];
      v20[0] = @"unsupported relationship";
      v20[1] = v13;
      v21[0] = self;
      v21[1] = v12;
      NSDeleteRule v8 = (void *)MEMORY[0x189603F68];
      int v9 = v21;
      NSDeleteRule v10 = v20;
    }

    else
    {
      uint64_t v3 = *MEMORY[0x189607460];
      uint64_t v26 = *MEMORY[0x1896075F0];
      v27[0] = @"Relationship is not a toMany";
      uint64_t v4 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v3,  1591,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
      id v5 = (void *)MEMORY[0x189603F70];
      uint64_t v6 = *MEMORY[0x189603A60];
      uint64_t v7 = *MEMORY[0x189607798];
      v24[0] = @"unsupported relationship";
      v24[1] = v7;
      v25[0] = self;
      v25[1] = v4;
      NSDeleteRule v8 = (void *)MEMORY[0x189603F68];
      int v9 = v25;
      NSDeleteRule v10 = v24;
    }

    objc_exception_throw((id)objc_msgSend( v5,  "exceptionWithName:reason:userInfo:",  v6,  @"Unsupported relationship type for ordered index",  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 2)));
    -[NSRelationshipDescription _versionHash:inStyle:proxyContext:](v14, v15, v16, v17, v18);
  }

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4 proxyContext:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  CC_SHA256_Init(&c);
  int v9 = -[NSRelationshipDescription destinationEntity](self, "destinationEntity");
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  -[NSPropertyDescription _versionHash:inStyle:](&v29, sel__versionHash_inStyle_, data, a4);
  CC_SHA256_Update(&c, data, 0x20u);
  if (v9)
  {
    NSDeleteRule v10 = -[NSEntityDescription name](v9, "name");
    if (v10)
    {
      uint64_t v11 = (__CFString *)v10;
      CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
      if (!CStringPtr) {
        CStringPtr = (const char *)-[__CFString UTF8String](v11, "UTF8String");
      }
      CC_LONG v13 = strlen(CStringPtr);
      CC_SHA256_Update(&c, CStringPtr, v13);
    }
  }

  v14 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
  if (v14)
  {
    SEL v15 = v14;
    if (v14 != self || a4 == 1 && a5)
    {
      v16 = -[NSEntityDescription superentity](-[NSPropertyDescription entity](self, "entity"), "superentity");
      unint64_t v17 = -[NSPropertyDescription name](self, "name");
      if (!v16) {
        goto LABEL_19;
      }
      uint64_t v18 = (uint64_t)v17;
      objc_super v19 = 0LL;
      do
      {
        id v20 = -[NSEntityDescription _relationshipNamed:](v16, v18);
        if (v20) {
          objc_super v19 = v20;
        }
        v16 = -[NSEntityDescription superentity](v16, "superentity");
      }

      while (v16);
      if (a5 || !v19 || (uint64_t v21 = [v19 inverseRelationship], a4) || v19 != (void *)v21)
      {
LABEL_19:
        uint64_t v22 = -[NSPropertyDescription name](v15, "name");
        v23 = (__CFString *)v22;
        if (v22 && (v24 = CFStringGetCStringPtr(v22, 0x8000100u)) != 0LL
          || (v24 = (const char *)-[__CFString UTF8String](v23, "UTF8String")) != 0LL)
        {
          CC_LONG v25 = strlen(v24);
          CC_SHA256_Update(&c, v24, v25);
        }
      }
    }
  }

  int maxCount = self->_maxCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  int maxCount = self->_minCount;
  CC_SHA256_Update(&c, &maxCount, 4u);
  BOOL v26 = -[NSRelationshipDescription isOrdered](self, "isOrdered");
  __int16 v27 = v26;
  if (v26) {
    CC_SHA256_Update(&c, &v27, 2u);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
}

- (BOOL)_nonPredicateValidateValue:(id *)a3 forKey:(id)a4 inObject:(id)a5 error:(id *)a6
{
  uint64_t v101 = *MEMORY[0x1895F89C0];
  v95.receiver = self;
  v95.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  unsigned int v11 = -[NSPropertyDescription _nonPredicateValidateValue:forKey:inObject:error:]( &v95,  sel__nonPredicateValidateValue_forKey_inObject_error_);
  if (v11)
  {
    if (!*a3) {
      goto LABEL_78;
    }
    v93 = a6;
    int v12 = [a5 isInserted];
    int v13 = [*a3 isFault];
    v14 = (void *)[a5 managedObjectContext];
    int v91 = [v14 _isSwiftBound];
    if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
    {
      if (!-[NSRelationshipDescription isToMany](self, "isToMany"))
      {
        SEL v15 = *a3;
        if (*a3)
        {
          if ((v15[16] & 0x24) != 0)
          {
            [a5 objectID];
            [v15 objectID];
            _NSCoreDataLog( 4LL,  (uint64_t)@"repairing missing delete propagation for to-one relationship %@ on object %p (%@) with bad fault %p (%@)",  v16,  v17,  v18,  v19,  v20,  v21,  (uint64_t)a4);
            if (-[NSRelationshipDescription deleteRule]( -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship"),  "deleteRule") == NSCascadeDeleteRule)
            {
              if (![a5 managedObjectContext]) {
                -[NSManagedObjectContext _forceRegisterLostFault:]([a5 managedObjectContext], a5);
              }
              objc_msgSend((id)objc_msgSend(a5, "managedObjectContext"), "deleteObject:", a5);
            }

            [a5 setValue:0 forKey:a4];
          }

          else
          {
            if (v91 && ![*a3 managedObjectContext]) {
              [v14 insertObject:v15];
            }
            if ((-[NSManagedObject _isValidRelationshipDestination__]((uint64_t)v15) & 1) == 0)
            {
              v38 = v93;
              if (v93)
              {
                id v70 = *a3;
                v71 = (void *)MEMORY[0x189603F68];
                uint64_t v72 = [MEMORY[0x189603F18] arrayWithObject:v15];
                uint64_t v73 = [MEMORY[0x189603FE8] null];
                uint64_t v43 = objc_msgSend( v71,  "dictionaryWithObjectsAndKeys:",  v72,  @"NSAffectedObjectsErrorKey",  v73,  @"Dangling reference to an invalid object.",  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1),  @"NSValidationErrorShouldAttemptRecoveryKey",  0);
                id v40 = a5;
                int v41 = 1550;
                id v42 = a4;
                id v39 = v70;
                goto LABEL_49;
              }

              goto LABEL_89;
            }
          }
        }
      }
    }

    if (!-[NSRelationshipDescription isToMany](self, "isToMany"))
    {
      id v36 = *a3;
      v37 = -[NSRelationshipDescription destinationEntity](self, "destinationEntity");
      if (!v36
        || !v37
        || !-[NSEntityDescription _subentitiesIncludes:](v37, "_subentitiesIncludes:", _PFEntityForManagedObject(v36)))
      {
        goto LABEL_46;
      }

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  uint64_t v16 = [a3 length];
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NSRelationshipDescription;
  -[NSPropertyDescription _appendPropertyFieldsToData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:]( &v22,  sel__appendPropertyFieldsToData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_,  a3,  a4,  a5,  a6,  a7,  a8);
  _writeInt32IntoData( a3,  objc_msgSend( a8,  "indexForKey:",  -[NSEntityDescription name](-[NSRelationshipDescription destinationEntity](self, "destinationEntity"), "name")));
  uint64_t v17 = -[NSRelationshipDescription inverseRelationship](self, "inverseRelationship");
  if (v17)
  {
    uint64_t v18 = v17;
    _writeInt32IntoData(a3, 1u);
    unsigned int v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v18), "unsignedIntegerValue");
  }

  else
  {
    unsigned int v19 = 0;
  }

  _writeInt32IntoData(a3, v19);
  uint64_t v20 = v16 - 4;
  _writeInt32IntoData(a3, self->_maxCount);
  _writeInt32IntoData(a3, self->_minCount);
  _writeInt32IntoData(a3, self->_deleteRule);
  unsigned int v21 = bswap32([a3 length] - v20);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v20, 4, &v21);
}

@end