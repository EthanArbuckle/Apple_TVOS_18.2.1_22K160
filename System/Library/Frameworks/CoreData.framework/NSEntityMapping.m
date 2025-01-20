@interface NSEntityMapping
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributeMappings;
- (NSArray)relationshipMappings;
- (NSData)destinationEntityVersionHash;
- (NSData)sourceEntityVersionHash;
- (NSDictionary)userInfo;
- (NSEntityMapping)init;
- (NSEntityMapping)initWithCoder:(id)a3;
- (NSEntityMappingType)mappingType;
- (NSEntityMigrationPolicy)_migrationPolicy;
- (NSExpression)sourceExpression;
- (NSString)destinationEntityName;
- (NSString)entityMigrationPolicyClassName;
- (NSString)name;
- (NSString)sourceEntityName;
- (id)_initWithSourceEntityDescription:(id)a3 destinationEntityDescription:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_mappingsByName;
- (void)_setIsEditable:(BOOL)a3;
- (void)_throwIfNotEditable;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeMappings:(NSArray *)attributeMappings;
- (void)setDestinationEntityName:(NSString *)destinationEntityName;
- (void)setDestinationEntityVersionHash:(NSData *)destinationEntityVersionHash;
- (void)setEntityMigrationPolicyClassName:(NSString *)entityMigrationPolicyClassName;
- (void)setMappingType:(NSEntityMappingType)mappingType;
- (void)setName:(NSString *)name;
- (void)setRelationshipMappings:(NSArray *)relationshipMappings;
- (void)setSourceEntityName:(NSString *)sourceEntityName;
- (void)setSourceEntityVersionHash:(NSData *)sourceEntityVersionHash;
- (void)setSourceExpression:(NSExpression *)sourceExpression;
- (void)setUserInfo:(NSDictionary *)userInfo;
@end

@implementation NSEntityMapping

+ (void)initialize
{
}

- (NSEntityMapping)init
{
  return (NSEntityMapping *)-[NSEntityMapping _initWithSourceEntityDescription:destinationEntityDescription:]( self,  "_initWithSourceEntityDescription:destinationEntityDescription:",  0LL,  0LL);
}

- (void)dealloc
{
  self->_name = 0LL;
  self->_sourceEntityName = 0LL;

  self->_sourceEntityVersionHash = 0LL;
  self->_destinationEntityName = 0LL;

  self->_destinationEntityVersionHash = 0LL;
  self->_sourceExpression = 0LL;

  self->_userInfo = 0LL;
  self->_entityMigrationPolicyClassName = 0LL;

  self->_attributeMappings = 0LL;
  self->_relationshipMappings = 0LL;

  self->_mappingsByName = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSEntityMapping;
  -[NSEntityMapping dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[4] = -[NSString copy](self->_name, "copy");
    v5[5] = self->_mappingType;
    v5[6] = -[NSString copy](self->_sourceEntityName, "copy");
    v5[7] = -[NSData copy](self->_sourceEntityVersionHash, "copy");
    v5[8] = -[NSString copy](self->_destinationEntityName, "copy");
    v5[9] = -[NSData copy](self->_destinationEntityVersionHash, "copy");
    v5[10] = -[NSExpression copy](self->_sourceExpression, "copy");
    v5[11] = -[NSDictionary copy](self->_userInfo, "copy");
    v5[12] = -[NSString copy](self->_entityMigrationPolicyClassName, "copy");
    v6 = -[NSEntityMapping attributeMappings](self, "attributeMappings");
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603FA8], "allocWithZone:", a3), "init");
    uint64_t v8 = -[NSArray count](v6, "count");
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        v11 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "copy");
        [v7 addObject:v11];
      }
    }

    [v5 setAttributeMappings:v7];

    v12 = -[NSEntityMapping relationshipMappings](self, "relationshipMappings");
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603FA8], "allocWithZone:", a3), "init");
    uint64_t v14 = -[NSArray count](v12, "count");
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t j = 0LL; j != v15; ++j)
      {
        v17 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v12, "objectAtIndex:", j), "copy");
        [v13 addObject:v17];
      }
    }

    [v5 setRelationshipMappings:v13];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_46;
  }
  if (!a3) {
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  v5 = -[NSEntityMapping name](self, "name");
  uint64_t v6 = [a3 name];
  if (v5 != (NSString *)v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5) {
      return v6;
    }
    if (!v7) {
      return v6;
    }
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!(_DWORD)v6) {
      return v6;
    }
  }

  NSEntityMappingType v8 = -[NSEntityMapping mappingType](self, "mappingType");
  if (v8 != [a3 mappingType])
  {
LABEL_45:
    LOBYTE(v6) = 0;
    return v6;
  }

  uint64_t v9 = -[NSEntityMapping sourceEntityName](self, "sourceEntityName");
  uint64_t v6 = [a3 sourceEntityName];
  if (v9 == (NSString *)v6
    || (uint64_t v10 = v6, LOBYTE(v6) = 0, v9) && v10 && (LODWORD(v6) = -[NSString isEqual:](v9, "isEqual:"), (_DWORD)v6))
  {
    v11 = -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash");
    uint64_t v6 = [a3 sourceEntityVersionHash];
    if (v11 == (NSData *)v6
      || (uint64_t v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSData isEqual:](v11, "isEqual:"), (_DWORD)v6))
    {
      v13 = -[NSEntityMapping destinationEntityName](self, "destinationEntityName");
      uint64_t v6 = [a3 destinationEntityName];
      if (v13 == (NSString *)v6
        || (uint64_t v14 = v6, LOBYTE(v6) = 0, v13) && v14 && (LODWORD(v6) = -[NSString isEqual:](v13, "isEqual:"), (_DWORD)v6))
      {
        uint64_t v15 = -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash");
        uint64_t v6 = [a3 destinationEntityVersionHash];
        if (v15 == (NSData *)v6
          || (uint64_t v16 = v6, LOBYTE(v6) = 0, v15) && v16 && (LODWORD(v6) = -[NSData isEqual:](v15, "isEqual:"), (_DWORD)v6))
        {
          v17 = -[NSEntityMapping sourceExpression](self, "sourceExpression");
          uint64_t v6 = [a3 sourceExpression];
          if (v17 == (NSExpression *)v6
            || (uint64_t v18 = v6, LOBYTE(v6) = 0, v17)
            && v18
            && (LODWORD(v6) = -[NSExpression isEqual:](v17, "isEqual:"), (_DWORD)v6))
          {
            v19 = -[NSEntityMapping userInfo](self, "userInfo");
            uint64_t v6 = [a3 userInfo];
            if (v19 == (NSDictionary *)v6
              || (uint64_t v20 = v6, LOBYTE(v6) = 0, v19)
              && v20
              && (LODWORD(v6) = -[NSDictionary isEqual:](v19, "isEqual:"), (_DWORD)v6))
            {
              v21 = -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName");
              uint64_t v6 = [a3 entityMigrationPolicyClassName];
              if (v21 == (NSString *)v6
                || (uint64_t v22 = v6, LOBYTE(v6) = 0, v21)
                && v22
                && (LODWORD(v6) = -[NSString isEqual:](v21, "isEqual:"), (_DWORD)v6))
              {
                v23 = -[NSEntityMapping attributeMappings](self, "attributeMappings");
                uint64_t v6 = [a3 attributeMappings];
                if (v23 == (NSArray *)v6
                  || (uint64_t v24 = v6, LOBYTE(v6) = 0, v23)
                  && v24
                  && (LODWORD(v6) = -[NSArray isEqual:](v23, "isEqual:"), (_DWORD)v6))
                {
                  v25 = -[NSEntityMapping relationshipMappings](self, "relationshipMappings");
                  uint64_t v6 = [a3 relationshipMappings];
                  if (v25 != (NSArray *)v6)
                  {
                    uint64_t v26 = v6;
                    LOBYTE(v6) = 0;
                    if (v25 && v26) {
                      LOBYTE(v6) = -[NSArray isEqual:](v25, "isEqual:");
                    }
                    return v6;
                  }

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@), name %@, mappingType %u, sourceEntityName %@, sourceEntityVersionHash %@, destinationEntityName %@, destinationEntityVersionHash %@, attributeMappings %@, relationshipMappings %@, sourceExpression %@, entityMigrationPolicyClassName %@, userInfo %@", objc_opt_class(), -[NSEntityMapping name](self, "name"), -[NSEntityMapping mappingType](self, "mappingType"), -[NSEntityMapping sourceEntityName](self, "sourceEntityName"), -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash"), -[NSEntityMapping destinationEntityName](self, "destinationEntityName"), -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash"), -[NSEntityMapping attributeMappings](self, "attributeMappings"), -[NSEntityMapping relationshipMappings](self, "relationshipMappings"), -[NSEntityMapping sourceExpression](self, "sourceExpression"), -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName"), -[NSEntityMapping userInfo](self, "userInfo")];
}

- (NSString)name
{
  result = self->_name;
  if (!result) {
    return (NSString *)[NSString stringWithFormat:@"%@->%@", -[NSEntityMapping sourceEntityName](self, "sourceEntityName"), -[NSEntityMapping destinationEntityName](self, "destinationEntityName")];
  }
  return result;
}

- (void)setName:(NSString *)name
{
  v5 = self->_name;
  if (v5 != name)
  {

    self->_name = (NSString *)-[NSString copy](name, "copy");
  }

- (NSEntityMappingType)mappingType
{
  return self->_mappingType;
}

- (void)setMappingType:(NSEntityMappingType)mappingType
{
  self->_mappingType = mappingType;
}

- (NSString)sourceEntityName
{
  return self->_sourceEntityName;
}

- (void)setSourceEntityName:(NSString *)sourceEntityName
{
  v5 = self->_sourceEntityName;
  if (v5 != sourceEntityName)
  {

    self->_sourceEntityName = (NSString *)-[NSString copy](sourceEntityName, "copy");
  }

- (NSData)sourceEntityVersionHash
{
  return self->_sourceEntityVersionHash;
}

- (void)setSourceEntityVersionHash:(NSData *)sourceEntityVersionHash
{
  v5 = self->_sourceEntityVersionHash;
  if (v5 != sourceEntityVersionHash)
  {

    self->_sourceEntityVersionHash = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithData:sourceEntityVersionHash];
  }

- (NSString)destinationEntityName
{
  return self->_destinationEntityName;
}

- (void)setDestinationEntityName:(NSString *)destinationEntityName
{
  v5 = self->_destinationEntityName;
  if (v5 != destinationEntityName)
  {

    self->_destinationEntityName = (NSString *)-[NSString copy](destinationEntityName, "copy");
  }

- (NSData)destinationEntityVersionHash
{
  return self->_destinationEntityVersionHash;
}

- (void)setDestinationEntityVersionHash:(NSData *)destinationEntityVersionHash
{
  v5 = self->_destinationEntityVersionHash;
  if (v5 != destinationEntityVersionHash)
  {

    self->_destinationEntityVersionHash = (NSData *)[objc_alloc(MEMORY[0x189603F48]) initWithData:destinationEntityVersionHash];
  }

- (NSArray)attributeMappings
{
  return &self->_attributeMappings->super;
}

- (void)setAttributeMappings:(NSArray *)attributeMappings
{
  v5 = self->_attributeMappings;
  if (v5 != (NSMutableArray *)attributeMappings)
  {

    self->_attributeMappings = (NSMutableArray *)-[NSArray copy](attributeMappings, "copy");
  }

- (NSArray)relationshipMappings
{
  return &self->_relationshipMappings->super;
}

- (void)setRelationshipMappings:(NSArray *)relationshipMappings
{
  v5 = self->_relationshipMappings;
  if (v5 != (NSMutableArray *)relationshipMappings)
  {

    self->_relationshipMappings = (NSMutableArray *)-[NSArray copy](relationshipMappings, "copy");
  }

- (NSExpression)sourceExpression
{
  return self->_sourceExpression;
}

- (void)setSourceExpression:(NSExpression *)sourceExpression
{
  v5 = self->_sourceExpression;
  if (v5 != sourceExpression)
  {

    self->_sourceExpression = (NSExpression *)-[NSExpression copy](sourceExpression, "copy");
  }

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  v5 = self->_userInfo;
  if (v5 != userInfo)
  {

    self->_userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
  }

- (NSString)entityMigrationPolicyClassName
{
  return self->_entityMigrationPolicyClassName;
}

- (void)setEntityMigrationPolicyClassName:(NSString *)entityMigrationPolicyClassName
{
  v5 = self->_entityMigrationPolicyClassName;
  if (v5 != entityMigrationPolicyClassName)
  {

    self->_entityMigrationPolicyClassName = (NSString *)-[NSString copy](entityMigrationPolicyClassName, "copy");
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_name) {
    objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping name](self, "name"), @"NSMappingName");
  }
  objc_msgSend(a3, "encodeInt:forKey:", -[NSEntityMapping mappingType](self, "mappingType"), @"NSMappingType");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping sourceEntityName](self, "sourceEntityName"),  @"NSSourceEntityName");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping sourceEntityVersionHash](self, "sourceEntityVersionHash"),  @"NSSourceEntityVersionHash");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping destinationEntityName](self, "destinationEntityName"),  @"NSDestinationEntityName");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping destinationEntityVersionHash](self, "destinationEntityVersionHash"),  @"NSDestinationEntityVersionHash");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping sourceExpression](self, "sourceExpression"),  @"NSSourceExpression");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityMapping userInfo](self, "userInfo"), @"NSUserInfo");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping entityMigrationPolicyClassName](self, "entityMigrationPolicyClassName"),  @"NSEntityMigrationPolicyClassName");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping attributeMappings](self, "attributeMappings"),  @"NSAttributeMappings");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityMapping relationshipMappings](self, "relationshipMappings"),  @"NSRelationshipMappings");
}

- (NSEntityMapping)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NSEntityMapping;
  v4 = -[NSEntityMapping init](&v19, sel_init);
  if (v4)
  {
    v5 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSMappingName"];
    v4->_name = v5;
    if (v5 && (-[NSString isNSString](v5, "isNSString") & 1) == 0)
    {
      uint64_t v15 = (void *)MEMORY[0x189607870];
      uint64_t v16 = *MEMORY[0x189607460];
      v17 = &unk_189F03518;
    }

    else
    {
      v4->_mappingType = (int)[a3 decodeIntForKey:@"NSMappingType"];
      uint64_t v6 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSourceEntityName"];
      v4->_sourceEntityName = v6;
      if (v6 && (-[NSString isNSString](v6, "isNSString") & 1) == 0)
      {
        uint64_t v15 = (void *)MEMORY[0x189607870];
        uint64_t v16 = *MEMORY[0x189607460];
        v17 = &unk_189F03540;
      }

      else
      {
        v4->_sourceEntityVersionHash = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSourceEntityVersionHash"];
        uint64_t v7 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDestinationEntityName"];
        v4->_destinationEntityName = v7;
        if (v7 && (-[NSString isNSString](v7, "isNSString") & 1) == 0)
        {
          uint64_t v15 = (void *)MEMORY[0x189607870];
          uint64_t v16 = *MEMORY[0x189607460];
          v17 = &unk_189F03568;
        }

        else
        {
          v4->_destinationEntityVersionHash = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDestinationEntityVersionHash"];
          NSEntityMappingType v8 = (void *)MEMORY[0x189604010];
          uint64_t v9 = objc_opt_class();
          v4->_sourceExpression = (NSExpression *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v8,  "setWithObjects:",  v9,  objc_opt_class(),  0),  @"NSSourceExpression");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            -[NSExpression allowEvaluation](v4->_sourceExpression, "allowEvaluation");
          }
          v4->_userInfo = (NSDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines plistClassesForSecureCoding]() forKey:@"NSUserInfo"];
          uint64_t v10 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityMigrationPolicyClassName"];
          v4->_entityMigrationPolicyClassName = v10;
          if (!v10 || (-[NSString isNSString](v10, "isNSString") & 1) != 0)
          {
            v11 = (void *)MEMORY[0x189604010];
            uint64_t v12 = objc_opt_class();
            v4->_attributeMappings = (NSMutableArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v11,  "setWithObjects:",  v12,  objc_opt_class(),  0),  @"NSAttributeMappings");
            v13 = (void *)MEMORY[0x189604010];
            uint64_t v14 = objc_opt_class();
            v4->_relationshipMappings = (NSMutableArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v13,  "setWithObjects:",  v14,  objc_opt_class(),  0),  @"NSRelationshipMappings");
            *(_DWORD *)&v4->_entityMappingFlags &= ~1u;
            return v4;
          }

          uint64_t v15 = (void *)MEMORY[0x189607870];
          uint64_t v16 = *MEMORY[0x189607460];
          v17 = &unk_189F03590;
        }
      }
    }

    objc_msgSend(a3, "failWithError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4866, v17));

    return 0LL;
  }

  return v4;
}

- (NSEntityMigrationPolicy)_migrationPolicy
{
  if (result)
  {
    Class isa = result[12].super.isa;
    if (isa)
    {
      result = (NSEntityMigrationPolicy *)objc_alloc_init(NSClassFromString((NSString *)result[12].super.isa));
      if (!result)
      {
        id v2 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134110,  [NSString stringWithFormat:@"Couldn't create mapping policy for class named (%@)", isa],  0);
        objc_exception_throw(v2);
        return (NSEntityMigrationPolicy *)-[NSEntityMapping _initWithSourceEntityDescription:destinationEntityDescription:]( v3,  v4,  v5,  v6);
      }
    }

    else
    {
      return objc_alloc_init(&OBJC_CLASS___NSEntityMigrationPolicy);
    }
  }

  return result;
}

- (id)_initWithSourceEntityDescription:(id)a3 destinationEntityDescription:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSEntityMapping;
  id v6 = -[NSEntityMapping init](&v11, sel_init);
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_name = 0LL;
    v6->_mappingType = 0LL;
    v6->_attributeMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v7->_relationshipMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    if (a3)
    {
      v7->_sourceEntityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "versionHash"), "copy");
    }

    else
    {
      uint64_t v8 = 0LL;
      v7->_sourceEntityName = 0LL;
    }

    v7->_sourceEntityVersionHash = (NSData *)v8;
    if (a4)
    {
      v7->_destinationEntityName = (NSString *)objc_msgSend((id)objc_msgSend(a4, "name"), "copy");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "versionHash"), "copy");
    }

    else
    {
      uint64_t v9 = 0LL;
      v7->_destinationEntityName = 0LL;
    }

    v7->_destinationEntityVersionHash = (NSData *)v9;
    v7->_sourceExpression = 0LL;
    v7->_userInfo = 0LL;
    v7->_entityMigrationPolicyClassName = 0LL;
    *(_DWORD *)&v7->_entityMappingFlags &= ~1u;
  }

  return v7;
}

- (BOOL)isEditable
{
  return (*(_BYTE *)&self->_entityMappingFlags & 1) == 0;
}

- (void)_setIsEditable:(BOOL)a3
{
  __entityMappingFlags entityMappingFlags = self->_entityMappingFlags;
  if (!(*(_BYTE *)&entityMappingFlags & 1) != a3)
  {
    if ((*(_BYTE *)&entityMappingFlags & 1) != 0)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Entity Mappings cannot become mutable after being marked immutable." userInfo:0]);
      -[NSEntityMapping _throwIfNotEditable](v4, v5);
    }

    else
    {
      self->___entityMappingFlags entityMappingFlags = (__entityMappingFlags)(*(_DWORD *)&entityMappingFlags & 0xFFFFFFFE | !a3);
      -[NSEntityMapping _createCachesAndOptimizeState](self, "_createCachesAndOptimizeState");
    }
  }

- (void)_throwIfNotEditable
{
  if (!-[NSEntityMapping isEditable](self, "isEditable"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't modify an immutable entity mapping." userInfo:0]);
    -[NSEntityMapping _mappingsByName]();
  }

- (void)_mappingsByName
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    result = (void *)result[3];
    if (!result)
    {
      id v2 = (void *)[v1 attributeMappings];
      objc_super v3 = (void *)[v1 relationshipMappings];
      uint64_t v4 = [v2 count];
      uint64_t v5 = [v3 count] + v4;
      id v6 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v5];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v5];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      uint64_t v8 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v2);
            }
            uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            [v7 addObject:v12];
            objc_msgSend(v6, "addObject:", objc_msgSend(v12, "name"));
          }

          uint64_t v9 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }

        while (v9);
      }

      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v13 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t j = 0LL; j != v14; ++j)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v3);
            }
            v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
            [v7 addObject:v17];
            objc_msgSend(v6, "addObject:", objc_msgSend(v17, "name"));
          }

          uint64_t v14 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }

        while (v14);
      }

      v1[3] = [objc_alloc(MEMORY[0x189603FC8]) initWithObjects:v7 forKeys:v6];

      return (void *)v1[3];
    }
  }

  return result;
}

@end