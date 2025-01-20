@interface NSFetchRequest
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (NSFetchRequest)fetchRequestWithEntityName:(NSString *)entityName;
+ (id)_newDenormalizedFetchProperties:(id)a3;
+ (id)_stringForFetchRequestResultType:(unint64_t)a3;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 andPolicy:(id)a5;
+ (void)initialize;
- (BOOL)_disablePersistentStoreResultCaching;
- (BOOL)_isAsyncRequest;
- (BOOL)_isCachingFetchRequest;
- (BOOL)_isEditable;
- (BOOL)includesPendingChanges;
- (BOOL)includesPropertyValues;
- (BOOL)includesSubentities;
- (BOOL)isEqual:(id)a3;
- (BOOL)purgeableResult;
- (BOOL)returnsDistinctResults;
- (BOOL)returnsObjectsAsFaults;
- (BOOL)shouldRefreshRefetchedObjects;
- (NSArray)affectedStores;
- (NSArray)execute:(NSError *)error;
- (NSArray)propertiesToFetch;
- (NSArray)propertiesToGroupBy;
- (NSArray)relationshipKeyPathsForPrefetching;
- (NSArray)sortDescriptors;
- (NSEntityDescription)entity;
- (NSFetchRequest)init;
- (NSFetchRequest)initWithCoder:(id)a3;
- (NSFetchRequest)initWithEntityName:(NSString *)entityName;
- (NSFetchRequestResultType)resultType;
- (NSPredicate)havingPredicate;
- (NSPredicate)predicate;
- (NSString)entityName;
- (NSUInteger)fetchBatchSize;
- (NSUInteger)fetchLimit;
- (NSUInteger)fetchOffset;
- (id)_XPCEncodedFlags;
- (id)_asyncResultHandle;
- (id)_newNormalizedFetchProperties:(uint64_t)a1;
- (id)_newValidatedProperties:(int)a3 groupBy:(void *)a4 error:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeForXPC;
- (uint64_t)_bindExpressionDescriptionProperties:(uint64_t)result;
- (unint64_t)_encodedFetchRequestFlagsForFlags:(unint64_t)a3;
- (unint64_t)_fetchBatchLRUEntriesLimit;
- (unint64_t)allocationSize;
- (unint64_t)allocationType;
- (unint64_t)hash;
- (unint64_t)requestType;
- (void)_incrementInUseCounter;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setAsyncResultHandle:(id)a3;
- (void)_setDisablePersistentStoreResultCaching:(BOOL)a3;
- (void)_setFetchBatchLRUEntriesLimit:(unint64_t)a3;
- (void)_setFlagsFromXPCEncoding:(id)a3;
- (void)_throwIfNotEditable;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9;
- (void)allowEvaluation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAffectedStores:(NSArray *)affectedStores;
- (void)setAllocationSize:(unint64_t)a3;
- (void)setAllocationType:(unint64_t)a3;
- (void)setEntity:(NSEntityDescription *)entity;
- (void)setFetchBatchSize:(NSUInteger)fetchBatchSize;
- (void)setFetchLimit:(NSUInteger)fetchLimit;
- (void)setFetchOffset:(NSUInteger)fetchOffset;
- (void)setHavingPredicate:(NSPredicate *)havingPredicate;
- (void)setIncludesPendingChanges:(BOOL)includesPendingChanges;
- (void)setIncludesPropertyValues:(BOOL)includesPropertyValues;
- (void)setIncludesSubentities:(BOOL)includesSubentities;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setPropertiesToFetch:(NSArray *)propertiesToFetch;
- (void)setPropertiesToGroupBy:(NSArray *)propertiesToGroupBy;
- (void)setPurgeableResult:(BOOL)a3;
- (void)setRelationshipKeyPathsForPrefetching:(NSArray *)relationshipKeyPathsForPrefetching;
- (void)setResultType:(NSFetchRequestResultType)resultType;
- (void)setReturnsDistinctResults:(BOOL)returnsDistinctResults;
- (void)setReturnsObjectsAsFaults:(BOOL)returnsObjectsAsFaults;
- (void)setShouldRefreshRefetchedObjects:(BOOL)shouldRefreshRefetchedObjects;
- (void)setSortDescriptors:(NSArray *)sortDescriptors;
@end

@implementation NSFetchRequest

- (NSFetchRequest)initWithEntityName:(NSString *)entityName
{
  v4 = -[NSFetchRequest init](self, "init");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_flags |= 0x200u;
    v4->_entity = (NSEntityDescription *)-[NSString copy](entityName, "copy");
  }

  return v5;
}

- (NSFetchRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  v2 = -[NSFetchRequest init](&v4, sel_init);
  if (v2)
  {
    v2->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3LL);
    v2->_flags = (_fetchRequestFlags)(*(_DWORD *)&v2->_flags & 0xFFBE1B00 | 0x46);
  }

  return v2;
}

- (void)setPredicate:(NSPredicate *)predicate
{
  v5 = self->_predicate;
  if (v5 != predicate)
  {

    self->_predicate = predicate;
  }

- (void)_throwIfNotEditable
{
  if (!-[NSFetchRequest _isEditable](self, "_isEditable"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't modify a named fetch request in an immutable model." userInfo:0]);
    -[NSFetchRequest _isEditable](v2, v3);
  }

- (BOOL)_isEditable
{
  return (*((_BYTE *)&self->_flags + 1) & 1) == 0;
}

- (void)_resolveEntityWithContext:(id)a3
{
  _fetchRequestFlags flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    entity = (NSArray *)self->_entity;
    v6 = +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  entity,  a3);
    if (!v6)
    {
LABEL_20:
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"NSFetchRequest could not locate an NSEntityDescription for entity name '%@'", entity), 0 reason userInfo]);
      +[NSEntityDescription entityForName:inManagedObjectContext:](v15, v16, v17, v18);
      return;
    }

    v7 = v6;

    self->_entity = v7;
    _fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF);
    self->__fetchRequestFlags flags = flags;
  }

  if ((*(_WORD *)&flags & 0x800) != 0) {
    goto LABEL_12;
  }
  id v19 = 0LL;
  valuesToFetch = self->_valuesToFetch;
  if (valuesToFetch)
  {
    v9 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, valuesToFetch, 0, &v19);
    if (!v9)
    {
LABEL_19:
      objc_exception_throw((id)objc_msgSend( (id)objc_msgSend(v19, "userInfo"),  "valueForKey:",  @"NSUnderlyingException"));
      goto LABEL_20;
    }

    entity = v9;

    self->_valuesToFetch = entity;
  }

  groupByProperties = self->_groupByProperties;
  if (groupByProperties)
  {
    v11 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, groupByProperties, 1, &v19);
    if (v11)
    {
      v12 = v11;

      self->_groupByProperties = v12;
      goto LABEL_11;
    }

    goto LABEL_19;
  }

- (NSEntityDescription)entity
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) == 0) {
    return self->_entity;
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607678], objc_msgSend( NSString, "stringWithFormat:", @"This fetch request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext", self, self->_entity, 0), 0 reason userInfo]);
  return (NSEntityDescription *)-[NSEntityDescription managedObjectModel](v3, v4);
}

- (NSFetchRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 3) & 7;
}

- (BOOL)includesPendingChanges
{
  return (*(_DWORD *)&self->_flags & 0x80) == 0 && (*(_DWORD *)&self->_flags & 0x38) != 16;
}

- (NSUInteger)fetchLimit
{
  return self->_fetchLimit;
}

- (NSArray)propertiesToFetch
{
  return self->_valuesToFetch;
}

- (NSArray)relationshipKeyPathsForPrefetching
{
  return self->_relationshipKeyPathsForPrefetching;
}

- (BOOL)includesPropertyValues
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)requestType
{
  return 1LL;
}

- (BOOL)_isAsyncRequest
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (NSArray)affectedStores
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  return -[NSPersistentStoreRequest affectedStores](&v3, sel_affectedStores);
}

- (NSUInteger)fetchBatchSize
{
  return self->_batchSize;
}

- (BOOL)returnsObjectsAsFaults
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSPredicate)havingPredicate
{
  return self->_havingPredicate;
}

- (BOOL)_isCachingFetchRequest
{
  return 0;
}

- (BOOL)includesSubentities
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (NSArray)propertiesToGroupBy
{
  return self->_groupByProperties;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (NSUInteger)fetchOffset
{
  return (NSUInteger)*self->_additionalPrivateIvars;
}

- (id)_asyncResultHandle
{
  return (id)*((void *)self->_additionalPrivateIvars + 1);
}

- (void)_setAsyncResultHandle:(id)a3
{
  id v5 = (id)*((void *)self->_additionalPrivateIvars + 1);
  if (v5) {
    BOOL v6 = v5 == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {

  }
  if (a3) {
    *(_DWORD *)&self->_flags |= 0x200000u;
  }
  *((void *)self->_additionalPrivateIvars + 1) = a3;
}

- (void)dealloc
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0) {

  }
  self->_entity = 0LL;
  self->_predicate = 0LL;

  self->_sortDescriptors = 0LL;
  self->_relationshipKeyPathsForPrefetching = 0LL;

  self->_valuesToFetch = 0LL;
  self->_groupByProperties = 0LL;

  self->_havingPredicate = 0LL;
  *((void *)self->_additionalPrivateIvars + 1) = 0LL;
  PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
  self->_additionalPrivateIvars = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

+ (NSFetchRequest)fetchRequestWithEntityName:(NSString *)entityName
{
  return (NSFetchRequest *)(id)[objc_alloc((Class)objc_opt_class()) initWithEntityName:entityName];
}

- (void)setFetchBatchSize:(NSUInteger)fetchBatchSize
{
  self->_batchSize = fetchBatchSize;
}

- (void)setPropertiesToFetch:(NSArray *)propertiesToFetch
{
  if (self->_valuesToFetch != propertiesToFetch)
  {
    if ((-[NSEntityDescription isNSString](self->_entity, "isNSString") & 1) != 0)
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      id v5 = (NSArray *)-[NSArray copy](propertiesToFetch, "copy");
    }

    else
    {
      id v11 = 0LL;
      BOOL v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToFetch, 0, &v11);
      if (!v6)
      {
        objc_exception_throw((id)objc_msgSend( (id)objc_msgSend(v11, "userInfo"),  "valueForKey:",  @"NSUnderlyingException"));
        -[NSFetchRequest _newValidatedProperties:groupBy:error:](v7, v8, v9, v10);
        return;
      }

      id v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_valuesToFetch = v5;
  }

- (id)_newValidatedProperties:(int)a3 groupBy:(void *)a4 error:
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  [a1 _throwIfNotEditable];
  id v76 = objc_alloc_init(MEMORY[0x189603FA8]);
  v70 = a1;
  if ((a1[26] & 0x38) != 0) {
    int v7 = 1;
  }
  else {
    int v7 = a3;
  }
  int v72 = v7;
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v73 = [a2 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v73)
  {
    uint64_t v74 = *(void *)v89;
    int v75 = a3;
    v71 = a2;
LABEL_7:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v89 != v74) {
        objc_enumerationMutation(a2);
      }
      int v9 = *(NSExpressionDescription **)(*((void *)&v88 + 1) + 8 * v8);
      uint64_t v77 = v8;
      if (-[NSExpressionDescription isNSString](v9, "isNSString"))
      {
        v10 = (void *)-[NSExpressionDescription componentsSeparatedByString:]( v9,  "componentsSeparatedByString:",  @".");
        id v11 = (void *)[v70 entity];
        uint64_t v12 = [v10 count];
        if (v12 == 1)
        {
          v13 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v9);
          if (v13)
          {
            v14 = v13;
            if (v72 && -[NSPropertyDescription isTransient](v13, "isTransient"))
            {
LABEL_118:

              v53 = (void *)MEMORY[0x189603F70];
              uint64_t v54 = *MEMORY[0x189603A60];
              v61 = @"setPropertiesToFetch:";
              if (a3) {
                v61 = @"setPropertiesToGroupBy:";
              }
              uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to %@", v9, v61];
              goto LABEL_132;
            }

            if (a3
              && -[NSExpressionDescription _propertyType](v14, "_propertyType") == 4
              && (unint64_t)-[NSExpressionDescription maxCount](v14, "maxCount") >= 2)
            {
LABEL_121:

              v53 = (void *)MEMORY[0x189603F70];
              uint64_t v54 = *MEMORY[0x189603A60];
              uint64_t v58 = [NSString stringWithFormat:@"Invalid keypath %@ passed to setPropertiesToGroupBy:", v9, v67];
LABEL_132:
              uint64_t v65 = [v53 exceptionWithName:v54 reason:v58 userInfo:0];
              if (!a4) {
                return 0LL;
              }
              id v76 = 0LL;
              *a4 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  v65,  @"NSUnderlyingException"));
              return v76;
            }
          }

          else
          {
            v49 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
            -[NSPropertyDescription setName:](v49, "setName:", @"objectID");
            -[NSExpressionDescription setExpression:]( v49,  "setExpression:",  [MEMORY[0x189607878] expressionForEvaluatedObject]);
            -[NSExpressionDescription setExpressionResultType:](v49, "setExpressionResultType:", 2000LL);
            v14 = v49;
          }

          goto LABEL_86;
        }

        uint64_t v18 = v12;
        uint64_t v19 = [v10 objectAtIndex:0];
        if (v11) {
          v20 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v19);
        }
        else {
          v20 = 0LL;
        }
        if (-[NSExpressionDescription _propertyType](v20, "_propertyType") == 7)
        {
          if ((unint64_t)[v10 count] >= 2)
          {
            char v21 = 0;
            unint64_t v22 = 1LL;
LABEL_28:
            v78 = v9;
            do
            {
              v23 = (void *)[v10 objectAtIndex:v22];
              __int128 v84 = 0u;
              __int128 v85 = 0u;
              __int128 v86 = 0u;
              __int128 v87 = 0u;
              v24 = (void *)-[NSExpressionDescription elements](v20, "elements");
              uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:v93 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v85;
LABEL_31:
                uint64_t v28 = 0LL;
                while (1)
                {
                  if (*(void *)v85 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v14 = *(NSExpressionDescription **)(*((void *)&v84 + 1) + 8 * v28);
                  if (objc_msgSend(v23, "isEqualToString:", -[NSPropertyDescription name](v14, "name"))) {
                    break;
                  }
                  if (v26 == ++v28)
                  {
                    uint64_t v26 = [v24 countByEnumeratingWithState:&v84 objects:v93 count:16];
                    if (v26) {
                      goto LABEL_31;
                    }
                    goto LABEL_37;
                  }
                }

                ++v22;
                char v21 = 1;
                int v9 = v14;
                v20 = v14;
                if ([v10 count] > v22) {
                  goto LABEL_28;
                }
                goto LABEL_86;
              }

- (uint64_t)_bindExpressionDescriptionProperties:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    objc_super v3 = (void *)result;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    result = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(a2);
          }
          int v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v8 = (void *)[v7 expression];
            if ([v8 expressionType] == 3) {
              id v9 = -[NSEntityDescription _attributeNamed:]([v3 entity], objc_msgSend(v8, "keyPath"));
            }
            else {
              id v9 = 0LL;
            }
            -[NSExpressionDescription setUnderlyingAttribute:](v7, v9);
          }

          ++v6;
        }

        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v4 = result;
      }

      while (result);
    }
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  uint64_t v4 = -[NSPersistentStoreRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    entity = self->_entity;
    if ((*((_BYTE *)&self->_flags + 1) & 2) != 0) {
      entity = entity;
    }
    v4[6] = entity;
    v4[7] = self->_predicate;
    v4[8] = -[NSArray copy](self->_sortDescriptors, "copy");
    v4[10] = self->_fetchLimit;
    v4[11] = self->_allocationSize;
    v4[9] = self->_batchSize;
    *((_DWORD *)v4 + 26) = v4[13] & 0xFFE1FFFF | (((*(_DWORD *)&self->_flags >> 17) & 0xF) << 17);
    *(void *)v4[4] = *self->_additionalPrivateIvars;
    *((_DWORD *)v4 + 26) = *(_DWORD *)&self->_flags & 0xFFFFF6FF;
    v4[12] = -[NSArray copy](self->_relationshipKeyPathsForPrefetching, "copy");
    v4[5] = -[NSArray copy](self->_valuesToFetch, "copy");
    v4[3] = -[NSPredicate copy](self->_havingPredicate, "copy");
    v4[2] = -[NSArray copy](self->_groupByProperties, "copy");
    unsigned int v6 = v4[13] & 0xFFFE3FFF | (((*(_DWORD *)&self->_flags >> 14) & 7) << 14);
    *((_DWORD *)v4 + 26) = v6;
    *((_DWORD *)v4 + 26) = v6 & 0xFFBFFFFF | (((*(_DWORD *)&self->_flags >> 22) & 1) << 22);
  }

  return v4;
}

- (unint64_t)allocationType
{
  return ((unint64_t)self->_flags >> 14) & 7;
}

- (void)setResultType:(NSFetchRequestResultType)resultType
{
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFC7 | (8 * (resultType & 7)));
  if (resultType == 4 || resultType == 1) {
    -[NSFetchRequest setIncludesPropertyValues:](self, "setIncludesPropertyValues:", 0LL);
  }
}

- (void)setIncludesPropertyValues:(BOOL)includesPropertyValues
{
  BOOL v3 = includesPropertyValues;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 4;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v5);
}

- (BOOL)_disablePersistentStoreResultCaching
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)setEntity:(NSEntityDescription *)entity
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    if ((-[NSString isEqual:](-[NSEntityDescription name](entity, "name"), "isEqual:", self->_entity) & 1) == 0) {
      -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
    }

    *(_DWORD *)&self->_flags &= ~0x200u;
  }

  else
  {
    -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  }

  self->_entity = entity;
}

- (void)setIncludesPendingChanges:(BOOL)includesPendingChanges
{
  BOOL v3 = includesPendingChanges;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 0;
  }
  else {
    int v5 = 128;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v5);
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  int v5 = self->_sortDescriptors;
  if (v5 != sortDescriptors)
  {

    self->_sortDescriptors = (NSArray *)-[NSArray copy](sortDescriptors, "copy");
  }

- (void)setFetchOffset:(NSUInteger)fetchOffset
{
  *self->_additionalPrivateIvars = (id)fetchOffset;
}

- (void)setHavingPredicate:(NSPredicate *)havingPredicate
{
  if (self->_havingPredicate != havingPredicate)
  {
    int v5 = havingPredicate;

    self->_havingPredicate = havingPredicate;
  }

- (void)setPropertiesToGroupBy:(NSArray *)propertiesToGroupBy
{
  if (self->_groupByProperties != propertiesToGroupBy)
  {
    if ((-[NSEntityDescription isNSString](self->_entity, "isNSString") & 1) != 0)
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      int v5 = (NSArray *)-[NSArray copy](propertiesToGroupBy, "copy");
    }

    else
    {
      id v10 = 0LL;
      unsigned int v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToGroupBy, 1, &v10);
      if (!v6)
      {
        objc_exception_throw((id)objc_msgSend( (id)objc_msgSend(v10, "userInfo"),  "valueForKey:",  @"NSUnderlyingException"));
        -[NSFetchRequest setAffectedStores:](v7, v8, v9);
        return;
      }

      int v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_groupByProperties = v5;
  }

- (void)setAffectedStores:(NSArray *)affectedStores
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  -[NSPersistentStoreRequest setAffectedStores:](&v5, sel_setAffectedStores_, affectedStores);
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  BOOL v3 = includesSubentities;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v5);
}

- (void)setReturnsObjectsAsFaults:(BOOL)returnsObjectsAsFaults
{
  BOOL v3 = returnsObjectsAsFaults;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 64;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
}

- (void)setRelationshipKeyPathsForPrefetching:(NSArray *)relationshipKeyPathsForPrefetching
{
  if (self->_relationshipKeyPathsForPrefetching != relationshipKeyPathsForPrefetching)
  {
    int v5 = (NSArray *)-[NSArray copy](relationshipKeyPathsForPrefetching, "copy");

    self->_relationshipKeyPathsForPrefetching = v5;
  }

- (BOOL)returnsDistinctResults
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setReturnsDistinctResults:(BOOL)returnsDistinctResults
{
  BOOL v3 = returnsDistinctResults;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v3);
}

- (BOOL)shouldRefreshRefetchedObjects
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setShouldRefreshRefetchedObjects:(BOOL)shouldRefreshRefetchedObjects
{
  BOOL v3 = shouldRefreshRefetchedObjects;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 1024;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v5);
}

- (unint64_t)_fetchBatchLRUEntriesLimit
{
  _fetchRequestFlags flags = self->_flags;
  BOOL v3 = ((*(unsigned int *)&flags >> 17) & 0xF) == 0;
  unsigned int v4 = 1 << (((*(unsigned int *)&flags >> 17) & 0xF) - 1);
  if (v3) {
    return 0LL;
  }
  else {
    return v4;
  }
}

- (void)setFetchLimit:(NSUInteger)fetchLimit
{
  unsigned int v3 = fetchLimit;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_fetchLimit = v3;
}

- (void)_incrementInUseCounter
{
  *(_DWORD *)&self->_flags |= 0x100u;
}

- (id)_newNormalizedFetchProperties:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (a2)
  {
    unsigned int v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v4) {
      return v3;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (1)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(a2);
        }
        SEL v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        if ([v8 isNSString])
        {
          id v9 = v3;
          uint64_t v10 = (uint64_t)v8;
LABEL_13:
          [v9 addObject:v10];
          goto LABEL_14;
        }

        unint64_t v11 = [v8 _propertyType];
        if (v11 > 7) {
          goto LABEL_14;
        }
        if (((1LL << v11) & 0xD4) != 0)
        {
          uint64_t v10 = [v8 name];
          id v9 = v3;
          goto LABEL_13;
        }

        if (v11 == 5)
        {
          __int128 v12 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:3];
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "name"));
          objc_msgSend( v12,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v8, "expressionResultType")));
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "expression"));
          [v3 addObject:v12];
        }

+ (id)_newDenormalizedFetchProperties:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if ((id)[MEMORY[0x189603FE8] null] == a3) {
    return 0LL;
  }
  uint64_t v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isNSString])
        {
          [v4 addObject:v9];
        }

        else
        {
          uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
          -[NSPropertyDescription setName:](v10, "setName:", [v9 objectAtIndex:0]);
          -[NSExpressionDescription setExpressionResultType:]( v10,  "setExpressionResultType:",  objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "unsignedIntegerValue"));
          -[NSExpressionDescription setExpression:](v10, "setExpression:", [v9 objectAtIndex:2]);
          [v4 addObject:v10];
        }
      }

      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 andPolicy:(id)a5
{
  SEL v8 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:a3 error:0];
  [v8 setDelegate:a4];
  uint64_t v9 = [MEMORY[0x189603FE8] null];
  uint64_t v10 = (void *)+[_NSXPCStoreUtilities classesForFetchArchive]();
  if (a5) {
    uint64_t v10 = (void *)objc_msgSend( v10,  "setByAddingObjectsFromSet:",  objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  }
  unint64_t v11 = (void *)[v8 decodeObjectOfClasses:v10 forKey:@"root"];

  __int128 v12 = +[NSFetchRequest fetchRequestWithEntityName:]( NSFetchRequest,  "fetchRequestWithEntityName:",  [v11 objectAtIndex:0]);
  -[NSFetchRequest _setFlagsFromXPCEncoding:]( v12,  "_setFlagsFromXPCEncoding:",  [v11 objectAtIndex:1]);
  uint64_t v13 = [v11 objectAtIndex:2];
  if (v9 != v13) {
    -[NSFetchRequest setSortDescriptors:](v12, "setSortDescriptors:", v13);
  }
  uint64_t v14 = [v11 objectAtIndex:3];
  if (v9 != v14) {
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v14);
  }
  uint64_t v15 = [v11 objectAtIndex:4];
  if (v9 != v15) {
    -[NSFetchRequest setHavingPredicate:](v12, "setHavingPredicate:", v15);
  }
  uint64_t v16 = [v11 objectAtIndex:5];
  if (v9 != v16) {
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v12, "setRelationshipKeyPathsForPrefetching:", v16);
  }
  -[NSFetchRequest setFetchOffset:]( v12,  "setFetchOffset:",  objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 6), "unsignedIntegerValue"));
  -[NSFetchRequest setFetchLimit:]( v12,  "setFetchLimit:",  objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 7), "unsignedLongValue"));
  -[NSFetchRequest setFetchBatchSize:]( v12,  "setFetchBatchSize:",  objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 8), "unsignedIntegerValue"));
  uint64_t v17 = [v11 objectAtIndex:9];
  if (v9 != v17)
  {
    __int128 v18 = (void *)[a1 _newDenormalizedFetchProperties:v17];
    -[NSFetchRequest setPropertiesToFetch:](v12, "setPropertiesToFetch:", v18);
  }

  uint64_t v19 = [v11 objectAtIndex:10];
  if (v9 != v19)
  {
    uint64_t v20 = (void *)[a1 _newDenormalizedFetchProperties:v19];
    -[NSFetchRequest setPropertiesToGroupBy:](v12, "setPropertiesToGroupBy:", v20);
  }

  return v12;
}

- (id)encodeForXPC
{
  id v3 = objc_alloc_init(MEMORY[0x1896077E8]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  objc_msgSend(v5, "addObject:", -[NSFetchRequest entityName](self, "entityName"));
  objc_msgSend(v5, "addObject:", -[NSFetchRequest _XPCEncodedFlags](self, "_XPCEncodedFlags"));
  uint64_t v6 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
  if (v6) {
    [v5 addObject:v6];
  }
  else {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
  }
  uint64_t v7 = -[NSFetchRequest predicate](self, "predicate");
  if (v7)
  {
    if ((isKindOfClass & 1) != 0) {
      uint64_t v8 = -[NSPredicate predicateWithSubstitutionVariables:]( v7,  "predicateWithSubstitutionVariables:",  -[NSFetchRequest substitutionVariables](self, "substitutionVariables"));
    }
    else {
      uint64_t v8 = (uint64_t)v7;
    }
    id v9 = -[_NSXPCStorePredicateRemapper createPredicateForFetchFromPredicate:]( +[_NSXPCStorePredicateRemapper defaultInstance]( &OBJC_CLASS____NSXPCStorePredicateRemapper,  "defaultInstance"),  "createPredicateForFetchFromPredicate:",  v8);
    [v5 addObject:v9];
  }

  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
  }

  uint64_t v10 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
  if (v10)
  {
    if ((isKindOfClass & 1) != 0) {
      uint64_t v10 = -[NSPredicate predicateWithSubstitutionVariables:]( v10,  "predicateWithSubstitutionVariables:",  -[NSFetchRequest substitutionVariables](self, "substitutionVariables"));
    }
    [v5 addObject:v10];
  }

  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
  }

  unint64_t v11 = -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching");
  if (v11) {
    [v5 addObject:v11];
  }
  else {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
  }
  objc_msgSend( v5,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[NSFetchRequest fetchOffset](self, "fetchOffset")));
  objc_msgSend( v5,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[NSFetchRequest fetchLimit](self, "fetchLimit")));
  objc_msgSend( v5,  "addObject:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize")));
  if (-[NSFetchRequest resultType](self, "resultType") == 2 || !-[NSFetchRequest resultType](self, "resultType"))
  {
    id v12 = -[NSFetchRequest _newNormalizedFetchProperties:]( (uint64_t)self,  -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch"));
    [v5 addObject:v12];
  }

  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603FE8], "null"));
  }

  id v13 = -[NSFetchRequest _newNormalizedFetchProperties:]( (uint64_t)self,  -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy"));
  [v5 addObject:v13];

  id v14 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]( (uint64_t)&OBJC_CLASS____NSXPCStoreUtilities,  (uint64_t)v5);
  [v3 drain];
  id v15 = 0LL;
  return v14;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {

    id v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL)) {
          _PF_XPCStore_DisableExplicitBufferedAllocations_91407470 = 1;
        }
      }
    }
  }

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)_encodedFetchRequestFlagsForFlags:(unint64_t)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0) {
    [a3 encodeObject:self->_entity forKey:@"NSEntity"];
  }
  else {
    objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSFetchRequest entity](self, "entity"), @"NSEntity");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest predicate](self, "predicate"), @"NSPredicate");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSFetchRequest sortDescriptors](self, "sortDescriptors"),  @"NSSortDescriptors");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchLimit](self, "fetchLimit"), @"NSFetchLimit");
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), @"NSBatchSize");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching"),  @"NSRelationshipKeyPathsForPrefetching");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest resultType](self, "resultType"), @"NSResultType");
  objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSFetchRequest allocationType](self, "allocationType"),  @"NSAllocationType");
  if (-[NSFetchRequest allocationSize](self, "allocationSize")) {
    objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSFetchRequest allocationSize](self, "allocationSize"),  @"NSAllocationSize");
  }
  uint64_t v5 = -[NSFetchRequest returnsDistinctResults](self, "returnsDistinctResults");
  if (-[NSFetchRequest includesSubentities](self, "includesSubentities")) {
    v5 |= 2uLL;
  }
  if (-[NSFetchRequest includesPropertyValues](self, "includesPropertyValues")) {
    v5 |= 4uLL;
  }
  if (-[NSFetchRequest returnsObjectsAsFaults](self, "returnsObjectsAsFaults")) {
    v5 |= 8uLL;
  }
  if (-[NSFetchRequest includesPendingChanges](self, "includesPendingChanges")) {
    v5 |= 0x10uLL;
  }
  if (-[NSFetchRequest shouldRefreshRefetchedObjects](self, "shouldRefreshRefetchedObjects")) {
    v5 |= 0x20uLL;
  }
  if (-[NSFetchRequest _disablePersistentStoreResultCaching](self, "_disablePersistentStoreResultCaching")) {
    v5 |= 0x40uLL;
  }
  if (-[NSFetchRequest purgeableResult](self, "purgeableResult")) {
    v5 |= 0x80uLL;
  }
  [a3 encodeBool:1 forKey:@"NSHasFetchRequestFlags"];
  objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSFetchRequest _encodedFetchRequestFlagsForFlags:](self, "_encodedFetchRequestFlagsForFlags:", v5),  @"NSFetchRequestFlags");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchRequest)initWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  uint64_t v4 = -[NSFetchRequest init](&v40, sel_init);
  if (v4)
  {
    uint64_t v5 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v37 = __32__NSFetchRequest_initWithCoder___block_invoke;
    uint64_t v38 = &unk_189EA7758;
    uint64_t v39 = v5;
    v4->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3LL);
    if ([a3 decodeBoolForKey:@"NSHasFetchRequestFlags"])
    {
      unint64_t v6 = [a3 decodeIntegerForKey:@"NSFetchRequestFlags"];
      -[NSFetchRequest setReturnsDistinctResults:](v4, "setReturnsDistinctResults:", v6 & 1);
      -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", (v6 >> 1) & 1);
      -[NSFetchRequest setIncludesPropertyValues:](v4, "setIncludesPropertyValues:", (v6 >> 2) & 1);
      -[NSFetchRequest setReturnsObjectsAsFaults:](v4, "setReturnsObjectsAsFaults:", (v6 >> 3) & 1);
      -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", (v6 >> 4) & 1);
      -[NSFetchRequest setShouldRefreshRefetchedObjects:](v4, "setShouldRefreshRefetchedObjects:", (v6 >> 5) & 1);
      -[NSFetchRequest _setDisablePersistentStoreResultCaching:]( v4,  "_setDisablePersistentStoreResultCaching:",  (v6 >> 6) & 1);
      -[NSFetchRequest setResultType:]( v4,  "setResultType:",  [a3 decodeIntegerForKey:@"NSResultType"]);
      -[NSFetchRequest setAllocationType:]( v4,  "setAllocationType:",  [a3 decodeIntegerForKey:@"NSAllocationType"]);
      -[NSFetchRequest setPurgeableResult:](v4, "setPurgeableResult:", (v6 >> 7) & 1);
    }

    else
    {
      v4->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&v4->_flags & 0xFFBE1B00 | 0x46);
    }

    uint64_t v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    id v9 = (NSEntityDescription *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0),  @"NSEntity");
    v4->_entity = v9;
    if (-[NSEntityDescription isNSString](v9, "isNSString"))
    {
      *(_DWORD *)&v4->_flags |= 0x200u;
      uint64_t v10 = v4->_entity;
    }

    else if (v4->_entity)
    {
      if (v5) {
        unint64_t v11 = (void *)v5[3];
      }
      else {
        unint64_t v11 = 0LL;
      }
      objc_msgSend(v11, "addObject:");
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0) {
        id v13 = &unk_189F03608;
      }
      else {
        id v13 = &unk_189F035E0;
      }
      if (v5 == 0LL || (isKindOfClass & 1) == 0) {
        goto LABEL_31;
      }
      if (!v5[1])
      {
        id v13 = &unk_189F03608;
        goto LABEL_31;
      }
    }

    id v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    v4->_predicate = (NSPredicate *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0),  @"NSPredicate");
    uint64_t v16 = (void *)MEMORY[0x189604010];
    uint64_t v17 = objc_opt_class();
    v4->_sortDescriptors = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0),  @"NSSortDescriptors");
    if (!byte_18C4ABDC6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        -[NSPredicate allowEvaluation](v4->_predicate, "allowEvaluation");
      }
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      sortDescriptors = v4->_sortDescriptors;
      uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( sortDescriptors,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t i = 0LL; i != v19; ++i)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(sortDescriptors);
            }
            unint64_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              [v22 allowEvaluation];
            }
          }

          uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( sortDescriptors,  "countByEnumeratingWithState:objects:count:",  &v32,  v41,  16LL);
        }

        while (v19);
      }
    }

    v4->_fetchLimit = (int)[a3 decodeIntForKey:@"NSFetchLimit"];
    *v4->_additionalPrivateIvars = (id)(int)[a3 decodeIntForKey:@"NSFetchOffset"];
    v4->_batchSize = [a3 decodeIntegerForKey:@"NSBatchSize"];
    v4->_allocationSize = [a3 decodeIntegerForKey:@"NSAllocationSize"];
    v23 = (void *)MEMORY[0x189604010];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0),  @"NSValuesToFetch");
    v4->_valuesToFetch = v27;
    if (!v27 || (-[NSArray isNSArray](v27, "isNSArray") & 1) != 0)
    {
      v4->_havingPredicate = (NSPredicate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSHavingPredicate"];
      uint64_t v28 = (void *)MEMORY[0x189604010];
      uint64_t v29 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      v4->_groupByProperties = (NSArray *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( v28,  "setWithObjects:",  v29,  v30,  objc_opt_class(),  0),  @"NSValuesToGroupBy");
LABEL_32:
      v37((uint64_t)v36);
      return v4;
    }

    id v13 = &unk_189F03630;
LABEL_31:
    objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 4866, v13));

    uint64_t v4 = 0LL;
    goto LABEL_32;
  }

  return v4;
}

void __32__NSFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{
}

- (unint64_t)hash
{
  unint64_t v3 = -[NSEntityDescription hash](-[NSFetchRequest entity](self, "entity"), "hash") ^ __rbit32( -[NSFetchRequest resultType]( self,  "resultType"));
  -[NSFetchRequest predicate](self, "predicate");
  uint64_t v4 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
  if (-[NSArray count](v4, "count"))
  {
    uint64_t v5 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "key");
    if (v5) {
      v3 ^= [v5 hash];
    }
  }

  unint64_t v6 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
  if (-[NSArray count](v6, "count"))
  {
    id v7 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0LL);
    if (([v7 isNSString] & 1) == 0) {
      id v7 = (id)[v7 name];
    }
    v3 ^= [v7 hash];
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_33;
  }
  if (!a3) {
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_32;
  }
  uint64_t v5 = -[NSFetchRequest entityName](self, "entityName");
  uint64_t v6 = [a3 entityName];
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

  if (((*((_DWORD *)a3 + 26) ^ *(_DWORD *)&self->_flags) & 0x7FE4FF) != 0
    || (NSUInteger v8 = -[NSFetchRequest fetchLimit](self, "fetchLimit"), v8 != [a3 fetchLimit])
    || (NSUInteger v9 = -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), v9 != [a3 fetchBatchSize])
    || (NSUInteger v10 = -[NSFetchRequest fetchOffset](self, "fetchOffset"), v10 != [a3 fetchOffset]))
  {
LABEL_32:
    LOBYTE(v6) = 0;
    return v6;
  }

  unint64_t v11 = -[NSFetchRequest predicate](self, "predicate");
  uint64_t v6 = [a3 predicate];
  if (v11 == (NSPredicate *)v6
    || (uint64_t v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSPredicate isEqual:](v11, "isEqual:"), (_DWORD)v6))
  {
    id v13 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
    uint64_t v6 = [a3 sortDescriptors];
    if (v13 == (NSArray *)v6
      || (uint64_t v14 = v6, LOBYTE(v6) = 0, v13) && v14 && (LODWORD(v6) = -[NSArray isEqual:](v13, "isEqual:"), (_DWORD)v6))
    {
      uint64_t v15 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
      uint64_t v6 = [a3 propertiesToFetch];
      if (v15 == (NSArray *)v6
        || (uint64_t v16 = v6, LOBYTE(v6) = 0, v15) && v16 && (LODWORD(v6) = -[NSArray isEqual:](v15, "isEqual:"), (_DWORD)v6))
      {
        uint64_t v17 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
        uint64_t v6 = [a3 havingPredicate];
        if (v17 == (NSPredicate *)v6
          || (uint64_t v18 = v6, LOBYTE(v6) = 0, v17)
          && v18
          && (LODWORD(v6) = -[NSPredicate isEqual:](v17, "isEqual:"), (_DWORD)v6))
        {
          uint64_t v19 = -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy");
          uint64_t v6 = [a3 propertiesToGroupBy];
          if (v19 != (NSArray *)v6)
          {
            uint64_t v20 = v6;
            LOBYTE(v6) = 0;
            if (v19 && v20) {
              LOBYTE(v6) = -[NSArray isEqual:](v19, "isEqual:");
            }
            return v6;
          }

- (id)description
{
  unint64_t v3 = -[NSFetchRequest entityName](self, "entityName");
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSFetchRequest;
  uint64_t v4 = (void *)objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  CFSTR("%@ (entity: %@; predicate: (%@); sortDescriptors: (%@); "),
                 -[NSFetchRequest description](&v21, sel_description),
                 v3,
                 -[NSFetchRequest predicate](self, "predicate"),
                 -[NSFetchRequest sortDescriptors](self, "sortDescriptors"));
  NSUInteger v5 = -[NSFetchRequest fetchLimit](self, "fetchLimit");
  if (v5) {
    objc_msgSend(v4, "appendFormat:", @"limit: %u; ", v5);
  }
  NSUInteger v6 = -[NSFetchRequest fetchOffset](self, "fetchOffset");
  if (v6) {
    objc_msgSend(v4, "appendFormat:", @"offset: %u; ", v6);
  }
  NSUInteger v7 = -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize");
  if (v7) {
    objc_msgSend(v4, "appendFormat:", @"batch size: %u; ", v7);
  }
  NSUInteger v8 = +[NSFetchRequest _stringForFetchRequestResultType:]( &OBJC_CLASS___NSFetchRequest,  "_stringForFetchRequestResultType:",  ((unint64_t)self->_flags >> 3) & 7);
  uint64_t v9 = -[__CFString length](v8, "length");
  NSUInteger v10 = @"unknown request type";
  if (v9) {
    NSUInteger v10 = v8;
  }
  [v4 appendFormat:@"type: %@; ", v10];
  id v11 = -[NSArray valueForKey:]( -[NSFetchRequest affectedStores](self, "affectedStores"),  "valueForKey:",  @"identifier");
  if (v11) {
    [v4 appendFormat:@"affected stores: (%@); ", v11];
  }
  if (!-[NSFetchRequest includesSubentities](self, "includesSubentities")) {
    [v4 appendString:@"includesSubentities: NO; "];
  }
  if (!-[NSFetchRequest includesPropertyValues](self, "includesPropertyValues")) {
    [v4 appendString:@"includesPropertyValues: NO; "];
  }
  if (!-[NSFetchRequest returnsObjectsAsFaults](self, "returnsObjectsAsFaults")) {
    [v4 appendString:@"returnsObjectsAsFaults: NO; "];
  }
  if (!-[NSFetchRequest includesPendingChanges](self, "includesPendingChanges")) {
    [v4 appendString:@"includesPendingChanges: NO; "];
  }
  if (-[NSFetchRequest returnsDistinctResults](self, "returnsDistinctResults")) {
    [v4 appendString:@"returnsDistinctResults: YES; "];
  }
  _fetchRequestFlags flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    [v4 appendString:@"shouldRefreshRefetchedObjects: YES; "];
    _fetchRequestFlags flags = self->_flags;
  }

  int v13 = (*(unsigned int *)&flags >> 14) & 7;
  if (v13 == 1)
  {
    uint64_t v14 = @"NSFetchRequestBufferAllocationType";
  }

  else
  {
    if (v13 != 2) {
      goto LABEL_28;
    }
    uint64_t v14 = @"NSFetchRequestVMBufferAllocationType";
  }

  [v4 appendFormat:@"allocation type: %@; ", v14];
LABEL_28:
  unint64_t v15 = -[NSFetchRequest allocationSize](self, "allocationSize");
  if (v15) {
    objc_msgSend(v4, "appendFormat:", @"allocation size: %u; ", v15);
  }
  uint64_t v16 = -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching");
  if (-[NSArray count](v16, "count")) {
    [v4 appendFormat:@"relationshipKeyPathsForPrefetching: (%@); ", v16];
  }
  uint64_t v17 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
  if (-[NSArray count](v17, "count")) {
    [v4 appendFormat:@"propertiesToFetch: (%@); ", v17];
  }
  uint64_t v18 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
  if (v18) {
    [v4 appendFormat:@"havingPredicate: (%@); ", v18];
  }
  uint64_t v19 = -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy");
  if (-[NSArray count](v19, "count")) {
    [v4 appendFormat:@"propertiesToGroupBy: (%@); ", v19];
  }
  [v4 appendString:@""]);
  return v4;
}

- (NSArray)execute:(NSError *)error
{
  uint64_t v4 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (!v4)
  {
    NSUInteger v7 = 0LL;
    char v8 = 1;
    if (!error) {
      return v7;
    }
    goto LABEL_8;
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0) {
    NSUInteger v7 = (NSArray *)[v4 executeFetchRequest:self error:error];
  }
  else {
    NSUInteger v7 = 0LL;
  }
  char v8 = isKindOfClass ^ 1;
  if (error)
  {
LABEL_8:
    if ((v8 & 1) != 0) {
      *error = (NSError *)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F03658];
    }
  }

  return v7;
}

- (void)allowEvaluation
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");
    }
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    sortDescriptors = self->_sortDescriptors;
    uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( sortDescriptors,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(sortDescriptors);
          }
          char v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            [v8 allowEvaluation];
          }
        }

        uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( sortDescriptors,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
      }

      while (v5);
    }

    *(_DWORD *)&self->_flags |= 0x800000u;
  }

- (void)setAllocationType:(unint64_t)a3
{
  else {
    int v5 = (a3 & 7) << 14;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | v5);
}

- (unint64_t)allocationSize
{
  return self->_allocationSize;
}

- (void)setAllocationSize:(unint64_t)a3
{
  unsigned int v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_allocationSize = v3;
}

- (BOOL)purgeableResult
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (void)setPurgeableResult:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 0x400000;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v5);
}

- (NSString)entityName
{
  p__fetchRequestFlags flags = &self->_flags;
  result = (NSString *)self->_entity;
  if ((*((_BYTE *)p_flags + 1) & 2) == 0) {
    return (NSString *)-[NSString name](result, "name");
  }
  return result;
}

- (void)_setDisablePersistentStoreResultCaching:(BOOL)a3
{
  BOOL v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3) {
    int v5 = 0x2000;
  }
  else {
    int v5 = 0;
  }
  self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v5);
}

- (void)_setFetchBatchLRUEntriesLimit:(unint64_t)a3
{
  if (a3)
  {
    unsigned int v3 = 1024;
    if (a3 < 0x400) {
      unsigned int v3 = a3;
    }
    self->__fetchRequestFlags flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFE1FFFF | (((((__clz(__rbit32(v3)) << 17) + 0x20000) >> 17) & 0xF) << 17));
  }

  else
  {
    *(_DWORD *)&self->_flags &= 0xFFE1FFFF;
  }

- (id)_XPCEncodedFlags
{
  return (id)[MEMORY[0x189607968] numberWithInteger:*(_DWORD *)&self->_flags & 0xFFFFFCFF | 0x200];
}

- (void)_setFlagsFromXPCEncoding:(id)a3
{
  self->__fetchRequestFlags flags = (_fetchRequestFlags)[a3 integerValue];
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0) {
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0 = objc_opt_class();
  }
  __int128 v12 = (void *)objc_msgSend(a9, "mapping", a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  uint64_t v32 = [a3 length];
  _writeInt32IntoData(a3, 0);
  unsigned int v13 = -[NSArray count](self->_groupByProperties, "count");
  _writeInt32IntoData(a3, v13);
  if (v13)
  {
    unsigned int v14 = v13;
    do
    {
      _writeInt64IntoData(a3, 0LL);
      --v14;
    }

    while (v14);
    uint64_t v15 = 0LL;
    uint64_t v16 = v13;
    do
    {
      id v17 = -[NSArray objectAtIndex:](self->_groupByProperties, "objectAtIndex:", v15, v32);
      uint64_t v18 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v18 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData( a3,  objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v17, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v17, a4);
      }

      else
      {
        if ([v17 isNSString])
        {
          _writeInt32IntoData(a3, 1u);
          id v19 = a5;
        }

        else
        {
          _writeInt32IntoData(a3, 2u);
          id v19 = a4;
        }

        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v19, "objectForKey:", v17), "unsignedIntegerValue"));
      }

      ++v15;
    }

    while (v16 != v15);
  }

  if (self->_havingPredicate) {
    unsigned int v20 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v20 = 0;
  }
  _writeInt32IntoData(a3, v20);
  _writeInt64IntoData(a3, -[NSFetchRequest fetchOffset](self, "fetchOffset"));
  unsigned int v21 = -[NSArray count](self->_valuesToFetch, "count");
  _writeInt32IntoData(a3, v21);
  if (v21)
  {
    unsigned int v22 = v21;
    do
    {
      _writeInt64IntoData(a3, 0LL);
      --v22;
    }

    while (v22);
    uint64_t v23 = 0LL;
    uint64_t v24 = v21;
    do
    {
      id v25 = -[NSArray objectAtIndex:](self->_valuesToFetch, "objectAtIndex:", v23, v32);
      uint64_t v26 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v26 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData( a3,  objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v25, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v25, a4);
      }

      else
      {
        if ([v25 isNSString])
        {
          _writeInt32IntoData(a3, 1u);
          id v27 = a5;
        }

        else
        {
          _writeInt32IntoData(a3, 2u);
          id v27 = a4;
        }

        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v27, "objectForKey:", v25), "unsignedIntegerValue"));
      }

      ++v23;
    }

    while (v24 != v23);
  }

  if (-[NSEntityDescription isNSString](self->_entity, "isNSString", v32))
  {
    _writeInt32IntoData(a3, 0);
    unsigned int v28 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_entity), "unsignedIntegerValue");
  }

  else
  {
    _writeInt32IntoData(a3, 1u);
    unsigned int v28 = objc_msgSend(v12, "indexForKey:", -[NSEntityDescription name](self->_entity, "name"));
  }

  _writeInt32IntoData(a3, v28);
  if (self->_predicate) {
    unsigned int v29 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  }
  else {
    unsigned int v29 = 0;
  }
  _writeInt32IntoData(a3, v29);
  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors && -[NSArray count](sortDescriptors, "count"))
  {
    _writeInt32IntoData(a3, -[NSArray count](self->_sortDescriptors, "count"));
    _writePFEncodedArrayShapeIntoData(a3, self->_sortDescriptors, a7, 0LL);
  }

  else
  {
    _writeInt32IntoData(a3, 0);
  }

  _writeInt64IntoData(a3, self->_batchSize);
  _writeInt64IntoData(a3, self->_fetchLimit);
  unsigned int v31 = -[NSArray count](self->_relationshipKeyPathsForPrefetching, "count");
  _writeInt32IntoData(a3, v31);
  if (v31) {
    _writePFEncodedArrayShapeIntoData(a3, self->_relationshipKeyPathsForPrefetching, a5, 0LL);
  }
  _writeInt32IntoData(a3, *(_DWORD *)&self->_flags);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  unsigned int v36 = bswap32([a3 length] - v33);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v33, 4, &v36);
}

+ (id)_stringForFetchRequestResultType:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 < 5 && ((0x17u >> a3) & 1) != 0) {
    return off_189EA7F38[a3];
  }
  uint64_t v4 = [NSString stringWithUTF8String:"Unknown fetch request result type: %ld"];
  _NSCoreDataLog(17LL, v4, v5, v6, v7, v8, v9, v10, a3);
  __int128 v11 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v14 = a3;
    _os_log_fault_impl( &dword_186681000,  v11,  OS_LOG_TYPE_FAULT,  "CoreData: Unknown fetch request result type: %ld",  buf,  0xCu);
  }

  return 0LL;
}

@end