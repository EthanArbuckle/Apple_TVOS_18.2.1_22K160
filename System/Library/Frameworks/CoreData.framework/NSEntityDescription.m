@interface NSEntityDescription
+ (BOOL)supportsSecureCoding;
+ (NSEntityDescription)entityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSManagedObject)insertNewObjectForEntityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context;
+ (id)_MOClassName;
+ (void)initialize;
- (BOOL)_isEditable;
- (BOOL)_isSchemaEqual:(id)a3;
- (BOOL)_skipValidation;
- (BOOL)_subentitiesIncludes:(id)a3;
- (BOOL)isAbstract;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfEntity:(NSEntityDescription *)entity;
- (BOOL)performPostDecodeValidationInModel:(id)a3 error:(id *)a4;
- (NSArray)compoundIndexes;
- (NSArray)indexes;
- (NSArray)properties;
- (NSArray)relationshipsWithDestinationEntity:(NSEntityDescription *)entity;
- (NSArray)subentities;
- (NSArray)uniquenessConstraints;
- (NSData)versionHash;
- (NSDictionary)attributesByName;
- (NSDictionary)propertiesByName;
- (NSDictionary)relationshipsByName;
- (NSDictionary)subentitiesByName;
- (NSDictionary)userInfo;
- (NSEntityDescription)init;
- (NSEntityDescription)initWithCoder:(id)a3;
- (NSEntityDescription)superentity;
- (NSExpression)coreSpotlightDisplayNameExpression;
- (NSManagedObjectModel)managedObjectModel;
- (NSString)managedObjectClassName;
- (NSString)name;
- (NSString)renamingIdentifier;
- (NSString)versionHashModifier;
- (_NSRange)_propertyRangesByType;
- (__CFSet)_collectSubentities;
- (id)_attributeNamed:(uint64_t)a1;
- (id)_initWithName:(id)a3;
- (id)_localRelationshipNamed:(id)a3;
- (id)_newMappingForPropertiesOfRange:(unsigned int)a3;
- (id)_new_implicitlyObservedKeys;
- (id)_propertiesOnlySubsetFromIndexes:(uint64_t)a1;
- (id)_propertySearchMapping;
- (id)_propertyWithRenamingIdentifier:(id)a3;
- (id)_relationshipNamed:(void *)a1;
- (id)_uniquenessConstraintsAsFetchIndexes;
- (id)attributeKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)inverseForRelationshipKey:(id)a3;
- (id)toManyRelationshipKeys;
- (id)toOneRelationshipKeys;
- (uint64_t)_constraintIsExtension:(uint64_t)result;
- (uint64_t)_dropIndexes;
- (uint64_t)_finalizeIndexes;
- (uint64_t)_hasAttributesWithExternalDataReferences;
- (uint64_t)_hasAttributesWithFileBackedFutures;
- (uint64_t)_hasDerivedAttributes;
- (uint64_t)_hasIndexForProperty:(uint64_t)result;
- (uint64_t)_hasPotentialHashSkew;
- (uint64_t)_hasUniqueProperties;
- (uint64_t)_hasUniquedProperty:(uint64_t)result;
- (uint64_t)_isPathologicalForConstraintMerging:(uint64_t)result;
- (uint64_t)_keypathsForDeletions;
- (uint64_t)_keypathsToPrefetchForDeletePropagationPrefixedWith:(uint64_t)a3 toDepth:(void *)a4 processedEntities:;
- (uint64_t)_newVersionHashInStyle:(uint64_t)result;
- (uint64_t)_propertyKeys:(uint64_t)a3 matchingBlock:;
- (uint64_t)_relationshipNamesByType:(uint64_t)result;
- (uint64_t)_removeIndexForProperty:(uint64_t)result;
- (uint64_t)_validateIndexNameChangeFrom:(uint64_t)a3 to:;
- (unint64_t)_entityClass;
- (unint64_t)_keypathsToPrefetchForDeletePropagation;
- (unint64_t)_offsetRelationshipIndex:(unint64_t)a3 fromSuperEntity:(id)a4 andIsToMany:(BOOL)a5;
- (unint64_t)_versionHashInStyle:(unint64_t *)result;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_addFactoryToRetainList:(id)a3;
- (void)_addIndexForProperty:(uint64_t)a1;
- (void)_addProperty:(id)a3;
- (void)_addSubentity:(id)a3;
- (void)_addSupplementalIndexes:(uint64_t)a1;
- (void)_checkAttributeMembership:(void *)a1 hashes:(void *)a2;
- (void)_checkForNonCascadeNoInverses;
- (void)_checkSelfForNonCascadeNoInverses;
- (void)_commonCachesAndOptimizedState;
- (void)_createCachesAndOptimizeState;
- (void)_extensionsOfParentConstraint:(void *)result;
- (void)_flattenProperties;
- (void)_initializeExtraIVars;
- (void)_leopardStyleAttributesByName;
- (void)_leopardStyleRelationshipsByName;
- (void)_newSnowLeopardStyleDictionaryContainingPropertiesOfType:(unint64_t)a3;
- (void)_propertiesMatchingBlock:(uint64_t)a1;
- (void)_removeProperty:(id *)a1;
- (void)_removeSubentity:(id *)a1;
- (void)_restoreValidation;
- (void)_setIndexes:(uint64_t)a1;
- (void)_setIndexesFromJSONObject:(int)a3 supplemental:;
- (void)_setIsEditable:(BOOL)a3;
- (void)_setManagedObjectModel:(void *)result;
- (void)_setProperties:(char)a3 preserveIndices:;
- (void)_setSubentities:(char)a3 preserveIndices:;
- (void)_setSuperentity:(uint64_t)a1;
- (void)_setUniquenessConstraints:(uint64_t)a1;
- (void)_sortedSubentities;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)knownKeysMappingStrategy;
- (void)setAbstract:(BOOL)abstract;
- (void)setCompoundIndexes:(NSArray *)compoundIndexes;
- (void)setCoreSpotlightDisplayNameExpression:(NSExpression *)coreSpotlightDisplayNameExpression;
- (void)setIndexes:(NSArray *)indexes;
- (void)setManagedObjectClassName:(NSString *)managedObjectClassName;
- (void)setName:(NSString *)name;
- (void)setProperties:(NSArray *)properties;
- (void)setRenamingIdentifier:(NSString *)renamingIdentifier;
- (void)setSubentities:(NSArray *)subentities;
- (void)setUniquenessConstraints:(NSArray *)uniquenessConstraints;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setVersionHashModifier:(NSString *)versionHashModifier;
@end

@implementation NSEntityDescription

+ (NSEntityDescription)entityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  if (!context)
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: nil is not a legal NSManagedObjectContext parameter searching for entity name '%@'", entityName];
LABEL_11:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
    goto LABEL_12;
  }

  v5 = -[NSManagedObjectContext persistentStoreCoordinator](context, "persistentStoreCoordinator");
  if (!v5)
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A60];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: nil is not a legal NSPersistentStoreCoordinator for searching for entity name '%@'", entityName];
    goto LABEL_11;
  }

  v6 = v5;
  if (!-[NSPersistentStoreCoordinator managedObjectModel](v5, "managedObjectModel"))
  {
    v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = *MEMORY[0x189603A58];
    uint64_t v12 = [NSString stringWithFormat:@"+entityForName: could not locate an NSManagedObjectModel for entity name '%@'", entityName];
    goto LABEL_11;
  }

  modelMap = v6->_modelMap;
  if (!modelMap)
  {
LABEL_12:
    v9 = 0LL;
    return (NSEntityDescription *)-[_PFModelMap ancillaryEntityWithName:](v9, (uint64_t)entityName);
  }

  result = -[NSDictionary objectForKey:](modelMap->_entitiesByPath, "objectForKey:", entityName);
  if (result) {
    return result;
  }
  v9 = v6->_modelMap;
  return (NSEntityDescription *)-[_PFModelMap ancillaryEntityWithName:](v9, (uint64_t)entityName);
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_model;
}

- (id)_attributeNamed:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  if (*(void *)(a1 + 112))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = v4;
      uint64_t v6 = *(void *)(a1 + 112);
      unint64_t v7 = *(void *)(v6 + 16);
      unint64_t v8 = *(void *)(v6 + 24);
      uint64_t v9 = objc_msgSend((id)objc_msgSend((id)a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8) {
        return *(id *)(v9 + 8 * v5);
      }
    }

    return 0LL;
  }

  id v11 = (id)[*(id *)(a1 + 96) objectForKey:a2];
  char v12 = [v11 _isAttribute];
  if (!v11 || (v12 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 120) & 8) == 0)
    {
      uint64_t v15 = 0LL;
      v16 = &v15;
      uint64_t v17 = 0x3052000000LL;
      v18 = __Block_byref_object_copy__9;
      v19 = __Block_byref_object_dispose__9;
      uint64_t v20 = 0LL;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke;
      v14[3] = &unk_189EA7ED0;
      v14[4] = a2;
      v14[5] = &v15;
      -[NSEntityDescription _propertyKeys:matchingBlock:](a1, 0LL, (uint64_t)v14);
      id v11 = (id)[(id)v16[5] copy];
      [v11 _setEntity:a1];
      _Block_object_dispose(&v15, 8);
      return v11;
    }

    return 0LL;
  }

  return v11;
}

- (id)_propertySearchMapping
{
  return self->_propertyMapping;
}

- (NSDictionary)propertiesByName
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = -[NSEntityDescription superentity](self, "superentity");
  uint64_t v4 = v3;
  if (self && ((*(_BYTE *)&self->_entityDescriptionFlags >> 3) & 1) != 0 || !v3) {
    return &self->_properties->super;
  }
  unint64_t v5 = (NSDictionary *)[MEMORY[0x189603FC8] dictionary];
  uint64_t v6 = -[NSEntityDescription propertiesByName](v4, "propertiesByName");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v12 = (void *)objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", v11), "copy");
        [v12 _setEntity:self];
        -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", v12, v11);
      }

      uint64_t v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  -[NSDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", self->_properties);
  return v5;
}

- (NSEntityDescription)superentity
{
  return self->_superentity;
}

- (void)_removeProperty:(id *)a1
{
  if (a1)
  {
    if ((id *)[a2 entity] == a1)
    {
      uint64_t v4 = [a2 name];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = [a1[12] objectForKey:v4];
        if (v6)
        {
          uint64_t v7 = (void *)v6;
          [a1 _throwIfNotEditable];
          id v8 = v7;
          [a1[12] removeObjectForKey:v5];
          [v7 _setEntityAndMaintainIndices:0];
        }
      }
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Can't remove property '%@' - doesn't belong to this entity.", objc_msgSend(a2, "name")), 0 reason userInfo]);
      -[NSExpressionDescription setExpression:](v9, v10, v11);
    }
  }

- (BOOL)isKindOfEntity:(NSEntityDescription *)entity
{
  return -[NSEntityDescription _subentitiesIncludes:](entity, "_subentitiesIncludes:", self);
}

- (BOOL)_subentitiesIncludes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a3 == self)
  {
LABEL_14:
    LOBYTE(v5) = 1;
    return v5;
  }

  uint64_t v5 = -[NSMutableDictionary count](self->_subentities, "count");
  if (v5)
  {
    if (-[NSEntityDescription _isEditable](self, "_isEditable"))
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      subentities = self->_subentities;
      uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( subentities,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      if (v5)
      {
        uint64_t v7 = v5;
        uint64_t v8 = *(void *)v14;
LABEL_6:
        uint64_t v9 = 0LL;
        while (1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(subentities);
          }
          id v10 = (id)-[NSMutableDictionary objectForKey:]( self->_subentities,  "objectForKey:",  *(void *)(*((void *)&v13 + 1) + 8 * v9));
          if (v10 == a3 || ([v10 _subentitiesIncludes:a3] & 1) != 0) {
            goto LABEL_14;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( subentities,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
            LOBYTE(v5) = 0;
            if (v7) {
              goto LABEL_6;
            }
            return v5;
          }
        }
      }
    }

    else
    {
      flattenedSubentities = self->_flattenedSubentities;
      if (!flattenedSubentities)
      {
        flattenedSubentities = -[NSEntityDescription _collectSubentities](self);
        self->_flattenedSubentities = flattenedSubentities;
      }

      LOBYTE(v5) = CFSetContainsValue((CFSetRef)flattenedSubentities, a3) != 0;
    }
  }

  return v5;
}

- (uint64_t)_hasUniquedProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    result = [a2 _qualifiedName];
    if (result)
    {
      uint64_t v3 = *(void *)(v2 + 128);
      if (v3)
      {
        uint64_t v4 = result;
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v10 = 0u;
        __int128 v11 = 0u;
        uint64_t v5 = *(void **)(v3 + 24);
        result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (result)
        {
          uint64_t v6 = result;
          uint64_t v7 = *(void *)v11;
          while (2)
          {
            for (uint64_t i = 0LL; i != v6; ++i)
            {
              if (*(void *)v11 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
              if ([v9 count] == 1 && (objc_msgSend(v9, "containsObject:", v4) & 1) != 0) {
                return 1LL;
              }
            }

            uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
            result = 0LL;
            if (v6) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

+ (void)initialize
{
  if (!_MergedGlobals_68)
  {
    _MergedGlobals_68 = (uint64_t)objc_getClass("NSKeyValueUndefinedSetter");
    qword_18C4AB980 = (uint64_t)objc_getClass("NSKeyValueUndefinedGetter");
  }

+ (NSManagedObject)insertNewObjectForEntityForName:(NSString *)entityName inManagedObjectContext:(NSManagedObjectContext *)context
{
  uint64_t v6 = (unint64_t *)objc_msgSend(a1, "entityForName:inManagedObjectContext:");
  if (v6) {
    return (NSManagedObject *)(id)objc_msgSend( (id)objc_msgSend(_PFFastEntityClass(v6), "allocWithEntity:", v6),  "initWithEntity:insertIntoManagedObjectContext:",  v6,  context);
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"+entityForName: could not locate an entity named '%@' in this model.", entityName), 0 reason userInfo]);
  return (NSManagedObject *)-[NSEntityDescription _entityClass]();
}

- (unint64_t)_entityClass
{
  if (result) {
    return _PFFastEntityClass(result);
  }
  return result;
}

- (NSEntityDescription)init
{
  return (NSEntityDescription *)-[NSEntityDescription _initWithName:](self, "_initWithName:", 0LL);
}

- (void)dealloc
{
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {

    uint64_t v4 = self->_extraIvars;
    v4->var0 = 0LL;
    uint64_t v5 = (void *)atomic_load((unint64_t *)&v4->var2);

    uint64_t v6 = self->_extraIvars;
    atomic_store(0LL, (unint64_t *)&v6->var2);

    uint64_t v7 = self->_extraIvars;
    v7->var3 = 0LL;

    uint64_t v8 = self->_extraIvars;
    v8->var4 = 0LL;

    uint64_t v9 = self->_extraIvars;
    v9->var5 = 0LL;
    if (v9->var1)
    {
      os_unfair_lock_lock_with_options();

      __int128 v10 = self->_extraIvars;
      v10->var1 = 0LL;
      os_unfair_lock_unlock(&v10->var6);
    }

    if ((*(_BYTE *)&self->_entityDescriptionFlags & 0x80) == 0)
    {
      __int128 v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        __int128 v11 = malloc_default_zone();
      }
      malloc_zone_free(v11, self->_extraIvars);
    }

    self->_extraIvars = 0LL;
  }

  p_instanceClass = (unint64_t *)&self->_instanceClass;
  if (atomic_load((unint64_t *)&self->_instanceClass))
  {
    __int128 v14 = (void *)atomic_load(p_instanceClass);
    [v14 _entityDeallocated];
    uint64_t v15 = (void *)atomic_load(p_instanceClass);

    atomic_store(0LL, p_instanceClass);
  }

  p_snapshotClass = (unint64_t *)&self->_snapshotClass;
  if (atomic_load((unint64_t *)&self->_snapshotClass))
  {
    uint64_t v18 = (void *)atomic_load(p_snapshotClass);
    [v18 _entityDeallocated];
    uint64_t v19 = (void *)atomic_load(p_snapshotClass);

    atomic_store(0LL, p_snapshotClass);
  }

  id propertyMapping = self->_propertyMapping;
  if (propertyMapping) {
    uint64_t v21 = [propertyMapping length];
  }
  else {
    uint64_t v21 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_properties, "allKeys"), "count");
  }
  unint64_t v22 = v21;
  propertyRanges = self->_propertyRanges;
  if (propertyRanges && (*(_BYTE *)&self->_entityDescriptionFlags & 0x80) == 0)
  {
    v24 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v24 = malloc_default_zone();
      propertyRanges = self->_propertyRanges;
    }

    malloc_zone_free(v24, propertyRanges);
  }

  self->_model = 0LL;
  self->_classNameForEntity = 0LL;

  self->_properties = 0LL;
  self->_id propertyMapping = 0LL;

  self->_name = 0LL;
  self->_superentity = 0LL;

  self->_subentities = 0LL;
  self->_userInfo = 0LL;

  self->_flattenedSubentities = 0LL;
  if (self->_kvcPropertyAccessors)
  {
    for (uint64_t i = 0LL; i != 6; ++i)
    {
      v26 = self->_kvcPropertyAccessors[i];
      if (v26)
      {
        if (i != 4 && v22)
        {
          uint64_t v27 = 0LL;
          unsigned int v28 = 1;
          do
          {
            id v29 = v26[v27];
            if (v29) {

            }
            uint64_t v27 = v28;
          }

          while (v22 > v28++);
        }

        v31 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone) {
          v31 = malloc_default_zone();
        }
        malloc_zone_free(v31, v26);
      }
    }

    PF_FREE_OBJECT_ARRAY(*((void **)self->_kvcPropertyAccessors + 9));
    v32 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      v32 = malloc_default_zone();
    }
    malloc_zone_free(v32, self->_kvcPropertyAccessors);
  }

  v33 = (void *)atomic_load((unint64_t *)&self->_versionHash);

  atomic_store(0LL, (unint64_t *)&self->_versionHash);
  self->_versionHashModifier = 0LL;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NSEntityDescription;
  -[NSEntityDescription dealloc](&v34, sel_dealloc);
}

- (void)_initializeExtraIVars
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  uint64_t v3 = malloc_zone_calloc(v2, 1uLL, 0x40uLL);
  uint64_t v4 = v3;
  uint64_t v5 = (unint64_t *)(a1 + 128);
  while (!__ldaxr(v5))
  {
    if (!__stlxr((unint64_t)v3, v5))
    {
      *(_DWORD *)(*v5 + 48) = 0;
      return;
    }
  }

  __clrex();
  uint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v7 = malloc_default_zone();
  }
  malloc_zone_free(v7, v4);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription name](self, "name"), @"NSEntityName");
  [a3 encodeObject:self->_classNameForEntity forKey:@"NSClassNameForEntity"];
  if (-[NSEntityDescription isAbstract](self, "isAbstract")) {
    [a3 encodeBool:1 forKey:@"NSIsAbstract"];
  }
  objc_msgSend( a3,  "encodeConditionalObject:forKey:",  -[NSEntityDescription managedObjectModel](self, "managedObjectModel"),  @"NSManagedObjectModel");
  objc_msgSend( a3,  "encodeConditionalObject:forKey:",  -[NSEntityDescription superentity](self, "superentity"),  @"NSSuperentity");
  if (self->_subentities) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:self->_subentities];
  }
  else {
    uint64_t v6 = 0LL;
  }
  [a3 encodeObject:v6 forKey:@"NSSubentities"];

  if (self->_properties) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:self->_properties];
  }
  else {
    uint64_t v7 = 0LL;
  }
  [a3 encodeObject:v7 forKey:@"NSProperties"];

  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription userInfo](self, "userInfo"), @"NSUserInfo");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[NSEntityDescription versionHashModifier](self, "versionHashModifier"),  @"NSVersionHashModifier");
  uint64_t v8 = -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier");
  if (v8) {
    [a3 encodeObject:v8 forKey:@"NSRenamingIdentifier"];
  }
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    id var3 = extraIvars->var3;
    if (!var3
      || ([a3 encodeObject:var3 forKey:@"NSUniqueTuples"],
          (extraIvars = self->_extraIvars) != 0LL))
    {
      id var4 = extraIvars->var4;
      if (!var4
        || ([a3 encodeObject:var4 forKey:@"NSCoreSpotlightDisplayName"],
            (extraIvars = self->_extraIvars) != 0LL))
      {
        id var5 = extraIvars->var5;
        if (var5)
        {
          [a3 encodeObject:var5 forKey:@"NSFetchIndexDescriptions"];
          __int128 v13 = self->_extraIvars;
          if (v13 && v13->var5)
          {
            __int128 v14 = (void *)[MEMORY[0x189603FA8] array];
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            id v15 = self->_extraIvars->var5;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v22;
              do
              {
                for (uint64_t i = 0LL; i != v17; ++i)
                {
                  if (*(void *)v22 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v21 + 1) + 8 * i);
                  if (-[NSFetchIndexDescription _compoundIndexRepresentation](v20)) {
                    [v14 addObject:-[NSFetchIndexDescription _compoundIndexRepresentation](v20)];
                  }
                }

                uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
              }

              while (v17);
            }
          }

          else
          {
            __int128 v14 = 0LL;
          }

          [a3 encodeObject:v14 forKey:@"NSCompoundIndexes"];
        }
      }
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_setIndexesFromJSONObject:(int)a3 supplemental:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v20 = [a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v20) {
    return;
  }
  uint64_t v3 = 0LL;
  uint64_t v22 = *(void *)v27;
  do
  {
    for (uint64_t i = 0LL; i != v20; ++i)
    {
      __int128 v23 = v3;
      if (*(void *)v27 != v22) {
        objc_enumerationMutation(a2);
      }
      uint64_t v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      unint64_t v6 = [v5 count];
      uint64_t v7 = (void *)[v5 objectAtIndexedSubscript:0];
      if (v6 >= 2)
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = 1LL;
        while (1)
        {
          __int128 v10 = (void *)[v5 objectAtIndexedSubscript:v9];
          uint64_t v11 = [v10 count];
          int v12 = 1;
          if (v11 == 1) {
            goto LABEL_26;
          }
          if (v11 == 2) {
            goto LABEL_22;
          }
          __int128 v13 = 0LL;
          uint64_t v14 = 0LL;
          if (v11 == 3) {
            break;
          }
LABEL_28:
          uint64_t v17 = -[NSFetchIndexElementDescription initWithPropertyName:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  v13,  v14);
          if (!v17) {
            return;
          }
          uint64_t v18 = v17;
          v17[10] = v17[10] & 0xFFFFFFFE | v12;
          if (!v8) {
            uint64_t v8 = (void *)[MEMORY[0x189603FA8] array];
          }
          [v8 addObject:v18];

          if (v6 == ++v9) {
            goto LABEL_34;
          }
        }

        id v15 = (void *)[v10 objectAtIndexedSubscript:2];
        if ([@"asc" caseInsensitiveCompare:v15]
          && [@"ascending" caseInsensitiveCompare:v15])
        {
          if ([@"desc" caseInsensitiveCompare:v15]
            && [@"descending" caseInsensitiveCompare:v15])
          {
            return;
          }

          int v12 = 0;
        }

- (void)_addSupplementalIndexes:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    uint64_t v4 = *(void *)(a1 + 128);
  }

  uint64_t v5 = *(void **)(v4 + 40);
  if (v5)
  {
    unint64_t v6 = (void *)[v5 mutableCopy];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v11 _setEntity:a1];
          [v6 addObject:v11];
        }

        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v8);
    }
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v12 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0LL; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * j) _setEntity:a1];
        }

        uint64_t v13 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v13);
    }

    unint64_t v6 = (void *)[a2 mutableCopy];
  }

  *(void *)(v4 + 40) = v6;
}

- (void)_setIndexes:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 128);
  if (!v4)
  {
    -[NSEntityDescription _initializeExtraIVars](a1);
    uint64_t v4 = *(void *)(a1 + 128);
  }

  uint64_t v5 = *(void **)(v4 + 40);
  if (v5)
  {
    id v6 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:](a1, v5);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v11 _setEntity:a1];
          [v6 addObject:v11];
        }

        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v8);
    }
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v12 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0LL; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * j) _setEntity:a1];
        }

        uint64_t v13 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v13);
    }

    id v6 = (id)[a2 mutableCopy];
  }

  *(void *)(v4 + 40) = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSEntityDescription)initWithCoder:(id)a3
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  objc_opt_class();
  v94.receiver = self;
  v94.super_class = (Class)&OBJC_CLASS___NSEntityDescription;
  uint64_t v5 = -[NSEntityDescription init](&v94, sel_init);
  if (v5)
  {
    id v6 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    uint64_t v8 = v6;
    if (v6)
    {
      uint64_t v9 = v6[2];
      objc_setProperty_nonatomic(v6, v7, v5, 16LL);
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    v89[0] = MEMORY[0x1895F87A8];
    v89[1] = 3221225472LL;
    v90 = __37__NSEntityDescription_initWithCoder___block_invoke;
    v91 = &unk_189EA7648;
    v92 = v8;
    uint64_t v93 = v9;
    __int128 v10 = (void *)MEMORY[0x189604010];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = (NSString *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0),  @"NSVersionHashModifier");
    v5->_versionHashModifier = v12;
    if (v12 && (-[NSString isNSString](v12, "isNSString") & 1) == 0)
    {
      id v15 = &unk_189F032C0;
    }

    else
    {
      uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSManagedObjectModel"];
      v5->_model = (NSManagedObjectModel *)v13;
      if (v8) {
        uint64_t v14 = v8[1];
      }
      else {
        uint64_t v14 = 0LL;
      }
      if (v13 == v14)
      {
        __int128 v16 = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSClassNameForEntity"];
        v5->_classNameForEntity = v16;
        if (v16 && !-[NSString isNSString](v16, "isNSString"))
        {
          id v15 = &unk_189F03310;
        }

        else
        {
          v5->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityName"];
          uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSSuperentity"];
          v5->_superentity = (NSEntityDescription *)v17;
          if (!v17) {
            goto LABEL_24;
          }
          if (v8) {
            __int128 v18 = (void *)v8[3];
          }
          else {
            __int128 v18 = 0LL;
          }
          [v18 addObject:v17];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0) {
            uint64_t v20 = 4866LL;
          }
          else {
            uint64_t v20 = 4864LL;
          }
          if ((isKindOfClass & 1) != 0) {
            id v15 = &unk_189F03360;
          }
          else {
            id v15 = &unk_189F03338;
          }
          if (v8 == 0LL || (isKindOfClass & 1) == 0) {
            goto LABEL_76;
          }
          if (v8[1])
          {
LABEL_24:
            __int128 v21 = (void *)MEMORY[0x189604010];
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = objc_opt_class();
            __int128 v24 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0),  @"NSSubentities");
            v25 = v24;
            if (v24 && ([v24 isNSDictionary] & 1) == 0)
            {
              objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4864,  &unk_189F03388));
            }

            else
            {
              v5->_subentities = (NSMutableDictionary *)v25;
              uint64_t v26 = (void *)MEMORY[0x189604010];
              uint64_t v27 = objc_opt_class();
              uint64_t v28 = objc_opt_class();
              uint64_t v29 = objc_opt_class();
              v30 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v26, "setWithObjects:", v27, v28, v29, objc_opt_class(), 0),  @"NSProperties");
              if ([v30 isNSDictionary])
              {
                uint64_t v31 = v30;
                v5->_properties = v31;
                __int128 v85 = 0u;
                __int128 v86 = 0u;
                __int128 v87 = 0u;
                __int128 v88 = 0u;
                v32 = (void *)-[NSMutableDictionary allKeys](v31, "allKeys");
                uint64_t v33 = [v32 countByEnumeratingWithState:&v85 objects:v97 count:16];
                if (v33)
                {
                  uint64_t v34 = *(void *)v86;
                  v75 = &unk_189F033D8;
                  obuint64_t j = v32;
                  while (2)
                  {
                    for (uint64_t i = 0LL; i != v33; ++i)
                    {
                      if (*(void *)v86 != v34) {
                        objc_enumerationMutation(obj);
                      }
                      v36 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                      v37 = (void *)-[NSMutableDictionary objectForKeyedSubscript:]( v5->_properties,  "objectForKeyedSubscript:",  v36);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        goto LABEL_81;
                      }
                      if ((NSEntityDescription *)[v37 entity] != v5)
                      {
                        v75 = &unk_189F03400;
LABEL_81:
                        objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  v75));

                        goto LABEL_77;
                      }

                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0) {
                        v38 = v37;
                      }
                      else {
                        v38 = 0LL;
                      }
                      v39 = (void *)[v38 inverseRelationship];
                      if (v39 && (NSEntityDescription *)[v39 entity] != v5 && (!v8 || !v8[1]))
                      {
                        objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03428));

                        goto LABEL_77;
                      }
                    }

                    uint64_t v33 = [obj countByEnumeratingWithState:&v85 objects:v97 count:16];
                    if (v33) {
                      continue;
                    }
                    break;
                  }
                }

                v5->_entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&v5->_entityDescriptionFlags & 0xFFFF788A | [a3 decodeBoolForKey:@"NSIsAbstract"]);
                v5->_userInfo = (NSMutableDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines plistClassesForSecureCoding]() forKey:@"NSUserInfo"];
                v40 = (void *)MEMORY[0x189604010];
                uint64_t v41 = objc_opt_class();
                v42 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0),  @"NSRenamingIdentifier");
                v43 = v42;
                if (!v42 || ([v42 isNSString] & 1) != 0)
                {
                  -[NSEntityDescription setRenamingIdentifier:](v5, "setRenamingIdentifier:", v43);
                  v44 = (void *)MEMORY[0x189604010];
                  uint64_t v45 = objc_opt_class();
                  uint64_t v46 = objc_opt_class();
                  -[NSEntityDescription setCompoundIndexes:]( v5,  "setCompoundIndexes:",  objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0),  @"NSCompoundIndexes"));
                  v47 = (void *)MEMORY[0x189604010];
                  uint64_t v48 = objc_opt_class();
                  uint64_t v49 = objc_opt_class();
                  v50 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v47, "setWithObjects:", v48, v49, objc_opt_class(), 0),  @"NSUniqueTuples");
                  v51 = v50;
                  if (v50)
                  {
                    __int128 v83 = 0u;
                    __int128 v84 = 0u;
                    __int128 v81 = 0u;
                    __int128 v82 = 0u;
                    uint64_t v52 = [v50 countByEnumeratingWithState:&v81 objects:v96 count:16];
                    if (v52)
                    {
                      int v53 = 0;
                      uint64_t v54 = *(void *)v82;
                      do
                      {
                        for (uint64_t j = 0LL; j != v52; ++j)
                        {
                          if (*(void *)v82 != v54) {
                            objc_enumerationMutation(v51);
                          }
                          v53 += [*(id *)(*((void *)&v81 + 1) + 8 * j) count];
                        }

                        uint64_t v52 = [v51 countByEnumeratingWithState:&v81 objects:v96 count:16];
                      }

                      while (v52);
                      if (v53) {
                        -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)v5, v51);
                      }
                    }
                  }

                  v56 = (void *)MEMORY[0x189604010];
                  uint64_t v57 = objc_opt_class();
                  v58 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0),  @"NSCoreSpotlightDisplayName");
                  if (v58)
                  {
                    id v59 = v58;
                    extraIvars = v5->_extraIvars;
                    if (!extraIvars)
                    {
                      -[NSEntityDescription _initializeExtraIVars]((uint64_t)v5);
                      extraIvars = v5->_extraIvars;
                    }

                    extraIvars->id var4 = v59;
                  }

                  v61 = (void *)MEMORY[0x189604010];
                  uint64_t v62 = objc_opt_class();
                  v63 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0),  @"NSFetchIndexDescriptions");
                  v64 = v63;
                  if (v63)
                  {
                    if (([v63 isNSArray] & 1) == 0)
                    {
                      objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03478));

                      goto LABEL_77;
                    }

                    __int128 v79 = 0u;
                    __int128 v80 = 0u;
                    __int128 v77 = 0u;
                    __int128 v78 = 0u;
                    uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:v95 count:16];
                    if (v65)
                    {
                      uint64_t v66 = *(void *)v78;
                      while (2)
                      {
                        for (uint64_t k = 0LL; k != v65; ++k)
                        {
                          if (*(void *)v78 != v66) {
                            objc_enumerationMutation(v64);
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F034A0));

                            goto LABEL_77;
                          }
                        }

                        uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:v95 count:16];
                        if (v65) {
                          continue;
                        }
                        break;
                      }
                    }

                    -[NSEntityDescription _setIndexes:]((uint64_t)v5, v64);
                  }

                  else
                  {
                    v69 = (void *)-[NSMutableDictionary objectForKey:]( v5->_userInfo,  "objectForKey:",  @"NSFetchIndexDescriptions");
                    if (v69)
                    {
                      v70 = (const char *)[v69 UTF8String];
                      v71 = (void *)objc_msgSend( MEMORY[0x1896078D8],  "JSONObjectWithData:options:error:",  objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v70, strlen(v70)),  0,  0);
                      if (v71) {
                        -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v71, 0);
                      }
                    }
                  }

                  v72 = (void *)-[NSMutableDictionary objectForKey:]( v5->_userInfo,  "objectForKey:",  @"NSSupplementalIndexes");
                  if (v72)
                  {
                    v73 = (const char *)[v72 UTF8String];
                    v74 = (void *)objc_msgSend( MEMORY[0x1896078D8],  "JSONObjectWithData:options:error:",  objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v73, strlen(v73)),  0,  0);
                    if (v74) {
                      -[NSEntityDescription _setIndexesFromJSONObject:supplemental:]((uint64_t)v5, v74, 1);
                    }
                  }

                  v5->_id propertyMapping = 0LL;
                  v5->_propertyRanges = 0LL;
                  v5->_flattenedSubentities = 0LL;
                  v5->_kvcPropertyAccessors = 0LL;
                  v5->_modelsReferenceIDForEntity = -1LL;
                  goto LABEL_78;
                }

                objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F03450));
              }

              else
              {
                objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4864,  &unk_189F033B0));
              }
            }

void __37__NSEntityDescription_initWithCoder___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic(v3, a2, *(id *)(a1 + 40), 16LL);
    uint64_t v3 = *(void **)(a1 + 32);
  }
}

- (void)_setUniquenessConstraints:(uint64_t)a1
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = (void *)a1;
    uint64_t v3 = *(void *)(a1 + 128);
    if (!v3)
    {
      uint64_t v4 = a2;
      -[NSEntityDescription _initializeExtraIVars](a1);
      a2 = v4;
      uint64_t v3 = v2[16];
    }

    if (*(void **)(v3 + 24) != a2)
    {
      uint64_t v56 = v3;
      obuint64_t j = a2;
      v58 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      uint64_t v60 = [obj countByEnumeratingWithState:&v80 objects:v97 count:16];
      if (!v60) {
        goto LABEL_71;
      }
      uint64_t v59 = *(void *)v81;
      v63 = v2;
      while (1)
      {
        for (uint64_t i = 0LL; i != v60; ++i)
        {
          if (*(void *)v81 != v59) {
            objc_enumerationMutation(obj);
          }
          id v66 = *(id *)(*((void *)&v80 + 1) + 8 * i);
          if (![v66 count]) {
            continue;
          }
          uint64_t v61 = i;
          id v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v66, "count"));
          [v58 addObject:v6];
          id v67 = v6;

          __int128 v78 = 0u;
          __int128 v79 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          uint64_t v7 = [v66 countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (!v7) {
            goto LABEL_56;
          }
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v77;
          uint64_t v64 = *(void *)v77;
          do
          {
            uint64_t v10 = 0LL;
            uint64_t v65 = v8;
            do
            {
              if (*(void *)v77 != v9) {
                objc_enumerationMutation(v66);
              }
              uint64_t v11 = *(__CFString **)(*((void *)&v76 + 1) + 8 * v10);
              if (-[__CFString isNSString](v11, "isNSString"))
              {
                uint64_t v12 = (void *)-[__CFString componentsSeparatedByString:]( v11,  "componentsSeparatedByString:",  @".");
                uint64_t v62 = v11;
                if ((unint64_t)[v12 count] < 2)
                {
                  uint64_t v13 = (__CFString *)objc_msgSend((id)objc_msgSend(v2, "propertiesByName"), "objectForKey:", v11);
                }

                else
                {
                  uint64_t v13 = (__CFString *)objc_msgSend( (id)objc_msgSend(v2, "propertiesByName"),  "objectForKey:",  objc_msgSend(v12, "objectAtIndex:", 0));
                  if ((unint64_t)[v12 count] >= 2)
                  {
                    unint64_t v14 = 1LL;
                    do
                    {
                      id v15 = (void *)[v12 objectAtIndex:v14];
                      __int128 v72 = 0u;
                      __int128 v73 = 0u;
                      __int128 v74 = 0u;
                      __int128 v75 = 0u;
                      __int128 v16 = (void *)-[__CFString elements](v13, "elements");
                      uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v95 count:16];
                      if (v17)
                      {
                        uint64_t v18 = v17;
                        uint64_t v19 = *(void *)v73;
                        while (2)
                        {
                          for (uint64_t j = 0LL; j != v18; ++j)
                          {
                            if (*(void *)v73 != v19) {
                              objc_enumerationMutation(v16);
                            }
                            __int128 v21 = *(__CFString **)(*((void *)&v72 + 1) + 8 * j);
                            if (objc_msgSend(v15, "isEqualToString:", -[__CFString name](v21, "name")))
                            {
                              uint64_t v13 = v21;
                              goto LABEL_30;
                            }
                          }

                          uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v95 count:16];
                          if (v18) {
                            continue;
                          }
                          break;
                        }
                      }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 64) = -[NSString copy](self->_name, "copy");
    *(void *)(v4 + 48) = -[NSString copy](self->_classNameForEntity, "copy");
    unsigned int v5 = *(_DWORD *)(v4 + 120) & 0xFFFFF9FA | *(_DWORD *)&self->_entityDescriptionFlags & 1;
    *(_DWORD *)(v4 + 120) = v5;
    *(_DWORD *)(v4 + 120) = v5 & 0xFFFFFF8F | *(_DWORD *)&self->_entityDescriptionFlags & 0x10;
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    subentities = self->_subentities;
    uint64_t v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( subentities,  "countByEnumeratingWithState:objects:count:",  &v47,  v54,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(subentities);
          }
          uint64_t v12 = (void *)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_subentities,  "objectForKey:",  *(void *)(*((void *)&v47 + 1) + 8 * i)),  "copy");
          [v6 addObject:v12];
        }

        uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( subentities,  "countByEnumeratingWithState:objects:count:",  &v47,  v54,  16LL);
      }

      while (v9);
    }

    -[NSEntityDescription _setSubentities:preserveIndices:](v4, v6, 1);

    id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    properties = self->_properties;
    uint64_t v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v43,  v53,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t j = 0LL; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(properties);
          }
          uint64_t v19 = (void *)objc_msgSend( (id)-[NSMutableDictionary objectForKey:]( self->_properties,  "objectForKey:",  *(void *)(*((void *)&v43 + 1) + 8 * j)),  "copy");
          [v13 addObject:v19];
        }

        uint64_t v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v43,  v53,  16LL);
      }

      while (v16);
    }

    -[NSEntityDescription _setProperties:preserveIndices:](v4, v13, 1);

    *(void *)(v4 + 136) = -[NSMutableDictionary copy](self->_userInfo, "copy");
    *(void *)(v4 + 24) = -[NSString copy](self->_versionHashModifier, "copy");
    atomic_store(0LL, (unint64_t *)(v4 + 32));
    *(void *)(v4 + 160) = -1LL;
    objc_msgSend( (id)v4,  "setRenamingIdentifier:",  -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier"));
    uint64_t v20 = (void *)[MEMORY[0x189603FA8] array];
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v21 = -[NSEntityDescription indexes](self, "indexes");
    uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v39,  v52,  16LL);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t k = 0LL; k != v23; ++k)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * k) copy];
          [v20 addObject:v26];
        }

        uint64_t v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v39,  v52,  16LL);
      }

      while (v23);
      -[NSEntityDescription _setIndexes:](v4, v20);
      if (!self) {
        goto LABEL_38;
      }
    }

    else
    {
      -[NSEntityDescription _setIndexes:](v4, v20);
    }

    extraIvars = self->_extraIvars;
    if (extraIvars && (id var3 = extraIvars->var3) != 0LL || (id var3 = (id)NSArray_EmptyArray) != 0LL)
    {
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      uint64_t v29 = [var3 countByEnumeratingWithState:&v35 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        int v31 = 0;
        uint64_t v32 = *(void *)v36;
        do
        {
          for (uint64_t m = 0LL; m != v30; ++m)
          {
            if (*(void *)v36 != v32) {
              objc_enumerationMutation(var3);
            }
            v31 += [*(id *)(*((void *)&v35 + 1) + 8 * m) count];
          }

          uint64_t v30 = [var3 countByEnumeratingWithState:&v35 objects:v51 count:16];
        }

        while (v30);
        if (v31) {
          [(id)v4 setUniquenessConstraints:var3];
        }
      }
    }

- (void)_setSubentities:(char)a3 preserveIndices:
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [(id)a1 _throwIfNotEditable];
    if ((a3 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 120) & 4) != 0)
      {
        uint64_t v7 = *(void *)(a1 + 72);
      }

      else
      {
        id v6 = (void *)a1;
        do
        {
          uint64_t v7 = (uint64_t)v6;
          id v6 = (void *)[v6 superentity];
        }

        while (v6);
      }

      -[NSEntityDescription _dropIndexes](v7);
    }

    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)&OBJC_CLASS____PFRoutines, a2) & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't add a subentity to an entity (missing name or bad properties)." userInfo:0]);
    }
    unint64_t v8 = [*(id *)(a1 + 88) count];
    unint64_t v9 = v8;
    if (v8 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v8 > 0x200) {
      uint64_t v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v10);
    }
    [*(id *)(a1 + 88) getObjects:v12 andKeys:0 count:v9];
    id v13 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v12 count:v9];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        uint64_t v17 = (void *)[v13 objectAtIndex:i];
        if ([a2 indexOfObjectIdenticalTo:v17] == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSEntityDescription _removeSubentity:]((id *)a1, v17);
        }
      }
    }

    uint64_t v18 = [a2 count];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t j = 0LL; j != v19; ++j)
      {
        uint64_t v21 = [a2 objectAtIndex:j];
        if ([v13 indexOfObjectIdenticalTo:v21] == 0x7FFFFFFFFFFFFFFFLL) {
          [(id)a1 _addSubentity:v21];
        }
      }
    }

    if (v9 >= 0x201) {
      NSZoneFree(0LL, v12);
    }
  }

- (void)_setProperties:(char)a3 preserveIndices:
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [(id)a1 _throwIfNotEditable];
    if ((a3 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 120) & 4) != 0)
      {
        uint64_t v7 = *(void *)(a1 + 72);
      }

      else
      {
        id v6 = (void *)a1;
        do
        {
          uint64_t v7 = (uint64_t)v6;
          id v6 = (void *)[v6 superentity];
        }

        while (v6);
      }

      -[NSEntityDescription _dropIndexes](v7);
    }

    if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)&OBJC_CLASS____PFRoutines, a2) & 1) == 0) {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Invalid property passed to setProperties: property has nil name or is an NSExpressionDescription." userInfo:0]);
    }
    unint64_t v8 = [*(id *)(a1 + 96) count];
    unint64_t v9 = v8;
    if (v8 <= 1) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v8;
    }
    if (v8 >= 0x201) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = (char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v8 > 0x200) {
      uint64_t v12 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v22 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v10);
    }
    [*(id *)(a1 + 96) getObjects:v12 andKeys:0 count:v9];
    id v13 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v12 count:v9];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      uint64_t v15 = v14;
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        uint64_t v17 = (void *)[v13 objectAtIndex:i];
        if ([a2 indexOfObjectIdenticalTo:v17] == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSEntityDescription _removeProperty:]((id *)a1, v17);
        }
      }
    }

    uint64_t v18 = [a2 count];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t j = 0LL; j != v19; ++j)
      {
        uint64_t v21 = [a2 objectAtIndex:j];
        if ([v13 indexOfObjectIdenticalTo:v21] == 0x7FFFFFFFFFFFFFFFLL) {
          [(id)a1 _addProperty:v21];
        }
      }
    }

    if (v9 >= 0x201) {
      NSZoneFree(0LL, v12);
    }
  }

- (unint64_t)hash
{
  return -[NSString hash](-[NSEntityDescription name](self, "name"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_30;
  }
  if (!a3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  unsigned int v5 = -[NSEntityDescription name](self, "name");
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    int v8 = -[NSEntityDescription isAbstract](self, "isAbstract");
    if (v8 != [a3 isAbstract])
    {
LABEL_9:
      LOBYTE(v6) = 0;
      return v6;
    }

    unint64_t v9 = -[NSEntityDescription managedObjectClassName](self, "managedObjectClassName");
    uint64_t v6 = [a3 managedObjectClassName];
    if (v9 == (NSString *)v6
      || (uint64_t v10 = v6, LOBYTE(v6) = 0, v9) && v10 && (LODWORD(v6) = -[NSString isEqual:](v9, "isEqual:"), (_DWORD)v6))
    {
      uint64_t v11 = -[NSEntityDescription versionHash](self, "versionHash");
      uint64_t v6 = [a3 versionHash];
      if (v11 == (NSData *)v6
        || (uint64_t v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSData isEqual:](v11, "isEqual:"), (_DWORD)v6))
      {
        id v13 = -[NSEntityDescription userInfo](self, "userInfo");
        uint64_t v6 = [a3 userInfo];
        if (v13 == (NSDictionary *)v6
          || (uint64_t v14 = v6, LOBYTE(v6) = 0, v13)
          && v14
          && (LODWORD(v6) = -[NSDictionary isEqual:](v13, "isEqual:"), (_DWORD)v6))
        {
          uint64_t v15 = -[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression");
          uint64_t v6 = [a3 coreSpotlightDisplayNameExpression];
          if (v15 == (NSExpression *)v6
            || (uint64_t v16 = v6, LOBYTE(v6) = 0, v15)
            && v16
            && (LODWORD(v6) = -[NSExpression isEqual:](v15, "isEqual:"), (_DWORD)v6))
          {
            uint64_t v17 = -[NSEntityDescription indexes](self, "indexes");
            uint64_t v6 = [a3 indexes];
            if (v17 != (NSArray *)v6)
            {
              uint64_t v18 = v6;
              LOBYTE(v6) = 0;
              if (v17 && v18) {
                LOBYTE(v6) = -[NSArray isEqual:](v17, "isEqual:");
              }
              return v6;
            }

- (id)description
{
  uint64_t v16 = (void *)NSString;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSEntityDescription;
  id v3 = -[NSEntityDescription description](&v17, sel_description);
  uint64_t v4 = -[NSEntityDescription name](self, "name");
  unsigned int v5 = -[NSEntityDescription managedObjectClassName](self, "managedObjectClassName");
  uint64_t v6 = -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier");
  BOOL v7 = -[NSEntityDescription isAbstract](self, "isAbstract");
  int v8 = -[NSEntityDescription name](-[NSEntityDescription superentity](self, "superentity"), "name");
  unint64_t v9 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  uint64_t v10 = -[NSEntityDescription subentitiesByName](self, "subentitiesByName");
  uint64_t v11 = -[NSEntityDescription userInfo](self, "userInfo");
  uint64_t v12 = -[NSEntityDescription versionHashModifier](self, "versionHashModifier");
  if (self)
  {
    extraIvars = self->_extraIvars;
  }

  else
  {
    uint64_t var3 = 0LL;
  }

  return (id)[v16 stringWithFormat:@"(%@) name %@, managedObjectClassName %@, renamingIdentifier %@, isAbstract %u, superentity name %@, properties %@, subentities %@, userInfo %@, versionHashModifier %@, uniquenessConstraints %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, var3];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)managedObjectClassName
{
  if (self->_classNameForEntity) {
    return self->_classNameForEntity;
  }
  else {
    return (NSString *)@"NSManagedObject";
  }
}

- (NSDictionary)attributesByName
{
  if (self->_propertyRanges) {
    return (NSDictionary *)*((void *)self->_kvcPropertyAccessors + 7);
  }
  else {
    return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]( (uint64_t)self,  (uint64_t)&__block_literal_global_6);
  }
}

uint64_t __39__NSEntityDescription_attributesByName__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isAttribute];
}

- (void)_propertiesMatchingBlock:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = (void *)[MEMORY[0x189603FC8] dictionary];
  if ((*(_BYTE *)(a1 + 120) & 8) == 0)
  {
    unsigned int v5 = (void *)[(id)a1 superentity];
    if (v5)
    {
      uint64_t v6 = (void *)[v5 propertiesByName];
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          for (uint64_t i = 0LL; i != v8; ++i)
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v12 = (void *)[v6 objectForKey:v11];
            if ((*(unsigned int (**)(uint64_t, void *))(a2 + 16))(a2, v12))
            {
              id v13 = (void *)[v12 copy];
              [v13 _setEntity:a1];
              [v4 setObject:v13 forKey:v11];
            }
          }

          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }

        while (v8);
      }
    }
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v14 = *(void **)(a1 + 96);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0LL; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v20 = [*(id *)(a1 + 96) objectForKey:v19];
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v16);
  }

  return v4;
}

- (NSDictionary)relationshipsByName
{
  if (self->_propertyRanges) {
    return (NSDictionary *)*((void *)self->_kvcPropertyAccessors + 8);
  }
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e31_B16__0__NSPropertyDescription_8l;
  v3[4] = 4LL;
  return (NSDictionary *)-[NSEntityDescription _propertiesMatchingBlock:]((uint64_t)self, (uint64_t)v3);
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  unsigned int v5 = self->_userInfo;
  if (v5 != (NSMutableDictionary *)userInfo)
  {

    self->_userInfo = (NSMutableDictionary *)-[NSDictionary copy](userInfo, "copy");
  }

  objc_sync_exit(self);
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return &self->_userInfo->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (BOOL)isAbstract
{
  return *(_DWORD *)&self->_entityDescriptionFlags & 1;
}

- (NSArray)subentities
{
  subentities = self->_subentities;
  if (subentities) {
    return (NSArray *)-[NSMutableDictionary allValues](subentities, "allValues");
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (uint64_t)_dropIndexes
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (result && byte_18C4ABDBC)
  {
    v1 = (void *)result;
    uint64_t v2 = *(void *)(result + 128);
    if (v2)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      id v3 = *(void **)(v2 + 40);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v5; ++i)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v3);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * i) _setEntity:0];
          }

          uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }

        while (v5);
      }

      *(void *)(v1[16] + 40LL) = 0LL;
    }

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v8 = (void *)objc_msgSend(v1, "subentities", 0);
    result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (result)
    {
      uint64_t v9 = result;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          -[NSEntityDescription _dropIndexes](*(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }

        while (v9 != v11);
        result = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
        uint64_t v9 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)_removeSubentity:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 name];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = [a1[11] objectForKey:v3];
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        [a1 _throwIfNotEditable];
        id v7 = v6;
        [a1[11] removeObjectForKey:v4];
        -[NSEntityDescription _setSuperentity:]((uint64_t)v6, 0LL);
      }
    }
  }

- (void)setSubentities:(NSArray *)subentities
{
}

- (NSDictionary)subentitiesByName
{
  if (self->_subentities) {
    return &self->_subentities->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (NSArray)relationshipsWithDestinationEntity:(NSEntityDescription *)entity
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (NSArray *)[MEMORY[0x189603FA8] array];
  if (self->_propertyRanges)
  {
    uint64_t v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
    propertyRanges = self->_propertyRanges;
    NSUInteger location = propertyRanges[2].location;
    NSUInteger length = propertyRanges[2].length;
    if (location < length + location)
    {
      uint64_t v10 = (id *)(v6 + 8 * location);
      do
      {
        id v11 = *v10;
        if ((NSEntityDescription *)[*v10 destinationEntity] == entity) {
          -[NSArray addObject:](v5, "addObject:", v11);
        }
        ++v10;
        --length;
      }

      while (length);
    }
  }

  else
  {
    __int128 v12 = -[NSEntityDescription relationshipsByName](self, "relationshipsByName");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v13 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = -[NSDictionary objectForKey:](v12, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * v16));
          if ((NSEntityDescription *)[v17 destinationEntity] == entity) {
            -[NSArray addObject:](v5, "addObject:", v17);
          }
          ++v16;
        }

        while (v14 != v16);
        uint64_t v14 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      }

      while (v14);
    }
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var1)
  {
    uint64_t v9 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = -[NSDictionary allValues](v9, "allValues");
      a3->var3[3] = 0LL;
      a3->var3[4] = v10;
    }
  }

  id v11 = (NSArray *)a3->var3[4];
  if (!v11) {
    return -[NSMutableDictionary _valueCountByEnumeratingWithState:objects:count:]( self->_properties,  "_valueCountByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
  }
  if (!a3->var3[3]) {
    id v11 = -[NSDictionary allValues](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "allValues");
  }
  return -[NSArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (NSArray)properties
{
  return -[NSDictionary allValues](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "allValues");
}

- (void)setProperties:(NSArray *)properties
{
}

- (NSExpression)coreSpotlightDisplayNameExpression
{
  extraIvars = self->_extraIvars;
  if (extraIvars && (extraIvars = (_ExtraEntityIVars *)extraIvars->var4) == 0LL) {
    return -[NSEntityDescription coreSpotlightDisplayNameExpression]( self->_superentity,  "coreSpotlightDisplayNameExpression");
  }
  else {
    return (NSExpression *)extraIvars;
  }
}

- (void)setCoreSpotlightDisplayNameExpression:(NSExpression *)coreSpotlightDisplayNameExpression
{
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }

  else
  {
    extraIvars = 0LL;
  }

  if (extraIvars->var4 != coreSpotlightDisplayNameExpression)
  {
    uint64_t v6 = coreSpotlightDisplayNameExpression;

    extraIvars->id var4 = coreSpotlightDisplayNameExpression;
  }

- (void)setManagedObjectClassName:(NSString *)managedObjectClassName
{
  if (-[NSString isEqualToString:]( managedObjectClassName,  "isEqualToString:",  +[NSEntityDescription _MOClassName](&OBJC_CLASS___NSEntityDescription, "_MOClassName")))
  {
    managedObjectClassName = 0LL;
  }

  classNameForEntity = self->_classNameForEntity;
  if (classNameForEntity != managedObjectClassName)
  {

    self->_classNameForEntity = (NSString *)-[NSString copy](managedObjectClassName, "copy");
  }

  atomic_store(0LL, (unint64_t *)&self->_instanceClass);
}

- (void)setAbstract:(BOOL)abstract
{
  BOOL v3 = abstract;
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_entityDescriptionFlags = (__entityDescriptionFlags)(*(_DWORD *)&self->_entityDescriptionFlags & 0xFFFFFFFE | v3);
}

- (void)setName:(NSString *)name
{
  if (self->_name != name)
  {
    uint64_t v5 = -[NSEntityDescription managedObjectModel](self, "managedObjectModel");
    uint64_t v6 = -[NSEntityDescription superentity](self, "superentity");
    if (v5 && -[NSMutableDictionary objectForKey:](v5->_entities, "objectForKey:", name)
      || v6
      && -[NSDictionary objectForKey:]( -[NSEntityDescription subentitiesByName](v6, "subentitiesByName"),  "objectForKey:",  name))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Can't change name of entity from %@ to %@", self->_name, name), 0 reason userInfo]);
      -[NSEntityDescription _newVersionHashInStyle:]();
    }

    else
    {
      -[NSEntityDescription _removeSubentity:]((id *)&v6->super.isa, self);
      -[NSManagedObjectModel _removeEntity:]((uint64_t)v5, self);

      self->_name = (NSString *)-[NSString copy](name, "copy");
      -[NSManagedObjectModel _addEntity:](v5, "_addEntity:", self);
      -[NSEntityDescription _addSubentity:](v6, "_addSubentity:", self);
    }
  }

- (uint64_t)_newVersionHashInStyle:(uint64_t)result
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = *(__CFString **)(result + 64);
  if (!v4) {
    goto LABEL_5;
  }
  CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
  if (!CStringPtr)
  {
    uint64_t v4 = *(__CFString **)(v3 + 64);
LABEL_5:
    CStringPtr = (const char *)-[__CFString UTF8String](v4, "UTF8String");
  }

  char data = [(id)v3 isAbstract];
  CC_SHA256_Init(&c);
  if (CStringPtr)
  {
    CC_LONG v6 = strlen(CStringPtr);
    CC_SHA256_Update(&c, CStringPtr, v6);
  }

  CC_SHA256_Update(&c, &data, 1u);
  if ([(id)v3 superentity])
  {
    objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)v3, "superentity"), "versionHash"),  "getBytes:length:",  v47,  32);
    CC_SHA256_Update(&c, v47, 0x20u);
  }

  id v7 = (void *)objc_msgSend( (id)objc_msgSend((id)v3, "properties"),  "sortedArrayUsingFunction:context:",  _comparePropertiesByName,  0);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }

        if (([v12 isTransient] & 1) == 0)
        {
          [v12 _versionHash:v47 inStyle:a2];
          CC_SHA256_Update(&c, v47, 0x20u);
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v9);
  }

  uint64_t v13 = *(const __CFString **)(v3 + 24);
  if (v13)
  {
    uint64_t v14 = CFStringGetCStringPtr(v13, 0x8000100u);
    if (!v14) {
      uint64_t v14 = (const char *)[*(id *)(v3 + 24) UTF8String];
    }
    CC_LONG v15 = strlen(v14);
    CC_SHA256_Update(&c, v14, v15);
  }

  uint64_t v16 = *(void *)(v3 + 128);
  if (v16 && *(void *)(v16 + 24))
  {
    id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v18 = *(void **)(*(void *)(v3 + 128) + 24LL);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend( v17,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "componentsJoinedByString:", @"."));
        }

        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }

      while (v20);
    }

    objc_msgSend( v17,  "sortUsingDescriptors:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607A20], "sortDescriptorWithKey:ascending:", @"self", 1)));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v23 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t k = 0LL; k != v24; ++k)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v17);
          }
          __int128 v27 = *(__CFString **)(*((void *)&v30 + 1) + 8 * k);
          if (-[__CFString length](v27, "length"))
          {
            __int128 v28 = CFStringGetCStringPtr(v27, 0x8000100u);
            if (!v28) {
              __int128 v28 = (const char *)-[__CFString UTF8String](v27, "UTF8String");
            }
            CC_LONG v29 = strlen(v28);
            CC_SHA256_Update(&c, v28, v29);
          }
        }

        uint64_t v24 = [v17 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }

      while (v24);
    }
  }

  CC_SHA256_Final(md, &c);
  return [objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:32];
}

- (NSData)versionHash
{
  return (NSData *)-[NSEntityDescription _versionHashInStyle:]((unint64_t *)self, 0LL);
}

- (unint64_t)_versionHashInStyle:(unint64_t *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 == 1)
    {
      uint64_t v4 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)result, 1LL);
      return (unint64_t *)v4;
    }

    uint64_t v5 = result + 4;
    unint64_t v6 = atomic_load(result + 4);
    if (!v6 || [result _isEditable])
    {
      id v7 = (void *)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v3, a2);
      if ([v3 _isEditable])
      {
        uint64_t v4 = v7;
        return (unint64_t *)v4;
      }

      while (!__ldaxr(v5))
      {
      }

      __clrex();
    }

    return (unint64_t *)atomic_load(v5);
  }

  return result;
}

- (NSString)versionHashModifier
{
  return self->_versionHashModifier;
}

- (void)setVersionHashModifier:(NSString *)versionHashModifier
{
  uint64_t v5 = self->_versionHashModifier;
  if (v5 != versionHashModifier)
  {

    self->_versionHashModifier = (NSString *)-[NSString copy](versionHashModifier, "copy");
  }

- (NSArray)indexes
{
  extraIvars = self->_extraIvars;
  if (!extraIvars) {
    return (NSArray *)NSArray_EmptyArray;
  }
  result = (NSArray *)extraIvars->var5;
  if (!result) {
    return (NSArray *)NSArray_EmptyArray;
  }
  return result;
}

- (uint64_t)_validateIndexNameChangeFrom:(uint64_t)a3 to:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (*(void *)(result + 128))
    {
      result = objc_msgSend(a2, "isEqual:");
      if ((result & 1) == 0)
      {
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        unint64_t v6 = *(void **)(v3[16] + 40LL);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v24;
          do
          {
            for (uint64_t i = 0LL; i != v8; ++i)
            {
              if (*(void *)v24 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * i) name];
              if (([v11 isEqual:a2] & 1) == 0 && objc_msgSend(v11, "isEqual:", a3))
              {
                uint64_t v16 = (void *)MEMORY[0x189603F70];
                uint64_t v17 = *MEMORY[0x189603A60];
                uint64_t v18 = [NSString stringWithFormat:@"Entity %@ already has an index with name %@", objc_msgSend(v3, "name"), a3];
                __int128 v28 = @"Entity";
                CC_LONG v29 = v3;
                objc_exception_throw((id)objc_msgSend( v16,  "exceptionWithName:reason:userInfo:",  v17,  v18,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1)));
              }
            }

            uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
          }

          while (v8);
        }

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v12 = (void *)[v3 subentities];
        result = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (result)
        {
          uint64_t v13 = result;
          uint64_t v14 = *(void *)v20;
          do
          {
            uint64_t v15 = 0LL;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              -[NSEntityDescription _validateIndexNameChangeFrom:to:]( *(void *)(*((void *)&v19 + 1) + 8 * v15++),  a2,  a3);
            }

            while (v13 != v15);
            result = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            uint64_t v13 = result;
          }

          while (result);
        }
      }
    }
  }

  return result;
}

- (id)_relationshipNamed:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  if (a1[14])
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_propertySearchMapping"), "indexForKey:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v5 = v4;
      uint64_t v6 = a1[14];
      unint64_t v7 = *(void *)(v6 + 32);
      unint64_t v8 = *(void *)(v6 + 40);
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
      if (v5 >= v7 && v5 - v7 < v8) {
        return *(id *)(v9 + 8 * v5);
      }
    }

    return 0LL;
  }

  id v14 = (id)[a1 _localRelationshipNamed:a2];
  if (!v14)
  {
    for (uint64_t i = a1; ; uint64_t i = v14)
    {
      __int128 v12 = (void *)[i superentity];
      id v14 = v12;
      if (!v12) {
        break;
      }
      uint64_t v13 = (void *)[v12 _localRelationshipNamed:a2];
      if (v13)
      {
        id v14 = (id)[v13 copy];
        [v14 _setEntity:a1];
        return v14;
      }
    }
  }

  return v14;
}

- (void)setIndexes:(NSArray *)indexes
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  obuint64_t j = indexes;
  uint64_t v37 = -[NSArray countByEnumeratingWithState:objects:count:]( indexes,  "countByEnumeratingWithState:objects:count:",  &v43,  v52,  16LL);
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v37; ++i)
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        if (self)
        {
          uint64_t v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) != 0)
          {
            rootentity = self->_rootentity;
          }

          else
          {
            unint64_t v7 = self;
            do
            {
              rootentity = v7;
              unint64_t v7 = -[NSEntityDescription superentity](v7, "superentity");
            }

            while (v7);
          }

          -[NSEntityDescription _validateIndexNameChangeFrom:to:]((uint64_t)rootentity, 0, [v6 name]);
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v38 = v6;
          uint64_t v9 = (void *)[v6 elements];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v48;
            do
            {
              for (uint64_t j = 0LL; j != (void *)v11; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v48 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
                uint64_t v15 = (__CFString *)[v14 property];
                uint64_t v16 = -[__CFString _propertyType](v15, "_propertyType");
                uint64_t v17 = (__CFString *)-[__CFString name](v15, "name");
                if (-[__CFString _isAttribute](v15, "_isAttribute"))
                {
                  if (v15 && -[__CFString superCompositeAttribute](v15, "superCompositeAttribute")) {
                    uint64_t v17 = -[NSPropertyDescription _rootName](v15);
                  }
                  if (!-[NSEntityDescription _attributeNamed:]((uint64_t)self, (uint64_t)v17))
                  {
                    __int128 v25 = (void *)MEMORY[0x189603F70];
                    uint64_t v26 = *MEMORY[0x189603A60];
                    uint64_t v27 = [NSString stringWithFormat:@"can't find attribute named %@", v17];
LABEL_47:
                    uint64_t v34 = v27;
                    __int128 v32 = v25;
                    uint64_t v33 = v26;
                    uint64_t v31 = 0LL;
                    while (1)
                    {
                      objc_exception_throw((id)[v32 exceptionWithName:v33 reason:v34 userInfo:v31]);
LABEL_49:
                      __int128 v28 = (void *)MEMORY[0x189603F70];
                      uint64_t v29 = *MEMORY[0x189603A60];
                      uint64_t v30 = [NSString stringWithFormat:@"Indexes must be declared at the highest applicable level. All properties are declared on superentity."];
                      uint64_t v53 = @"index";
                      uint64_t v54 = j;
LABEL_46:
                      uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
                      __int128 v32 = v28;
                      uint64_t v33 = v29;
                      uint64_t v34 = v30;
                    }
                  }
                }

                else if (-[__CFString _isRelationship](v15, "_isRelationship"))
                {
                  if (!-[NSEntityDescription _relationshipNamed:](self, (uint64_t)v17))
                  {
                    __int128 v25 = (void *)MEMORY[0x189603F70];
                    uint64_t v26 = *MEMORY[0x189603A60];
                    uint64_t v27 = [NSString stringWithFormat:@"can't find relationship named %@", v17];
                    goto LABEL_47;
                  }
                }

                else if (v16 != 5)
                {
                  __int128 v28 = (void *)MEMORY[0x189603F70];
                  uint64_t v29 = *MEMORY[0x189603A60];
                  uint64_t v30 = [NSString stringWithFormat:@"can't create index %@, unsupported index element property type", objc_msgSend(v38, "name")];
                  uint64_t v53 = @"element";
                  uint64_t v54 = v14;
                  goto LABEL_46;
                }
              }

              uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v55 count:16];
            }

            while (v11);
          }

          uint64_t j = v38;
          if (!objc_msgSend((id)objc_msgSend(v38, "elements"), "count")) {
            goto LABEL_49;
          }
        }
      }

      uint64_t v37 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v43,  v52,  16LL);
    }

    while (v37);
  }

  uint64_t v18 = (void *)-[NSArray mutableCopy](obj, "mutableCopy");
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }

  else
  {
    extraIvars = 0LL;
  }

  id var5 = extraIvars->var5;
  if (var5)
  {

    extraIvars->id var5 = 0LL;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v21 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t k = 0LL; k != v22; ++k)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * k) _setEntity:self];
      }

      uint64_t v22 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }

    while (v22);
  }

  extraIvars->id var5 = v18;
}

- (NSArray)compoundIndexes
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!self->_extraIvars) {
    return (NSArray *)NSArray_EmptyArray;
  }
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id var5 = self->_extraIvars->var5;
  uint64_t v5 = [var5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(var5);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)v9) & 1) == 0)
        {
          uint64_t v10 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend((id)objc_msgSend(v9, "elements"), "count"));
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          uint64_t v11 = (void *)objc_msgSend(v9, "elements", 0);
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (uint64_t j = 0LL; j != v13; ++j)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "property"));
              }

              uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            }

            while (v13);
          }

          [v3 addObject:v10];
        }
      }

      uint64_t v6 = [var5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setCompoundIndexes:(NSArray *)compoundIndexes
{
  id v3 = self;
  uint64_t v74 = *MEMORY[0x1895F89C0];
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = v3->_extraIvars;
    }
  }

  else
  {
    extraIvars = 0LL;
  }

  uint64_t v34 = extraIvars;
  id v42 = -[NSEntityDescription _propertiesOnlySubsetFromIndexes:]((uint64_t)v3, extraIvars->var5);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v38 = -[NSArray countByEnumeratingWithState:objects:count:]( compoundIndexes,  "countByEnumeratingWithState:objects:count:",  &v59,  v73,  16LL);
  if (!v38) {
    goto LABEL_50;
  }
  uint64_t v37 = *(void *)v60;
  uint64_t v40 = (uint64_t)v3;
  do
  {
    uint64_t v5 = 0LL;
    do
    {
      if (*(void *)v60 != v37) {
        objc_enumerationMutation(compoundIndexes);
      }
      uint64_t v6 = *(void **)(*((void *)&v59 + 1) + 8 * v5);
      __int128 v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      uint64_t v7 = (void *)[MEMORY[0x189607940] string];
      uint64_t v39 = v5;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v55 objects:v72 count:16];
      if (!v8) {
        goto LABEL_46;
      }
      uint64_t v9 = *(void *)v56;
      char v10 = 1;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v56 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if ((v10 & 1) == 0) {
            [v7 appendString:@"_"];
          }
          if (!objc_msgSend(v12, "isNSString", v34))
          {
            if ((unint64_t)[v6 count] <= 1
              && (-[NSEntityDescription _hasIndexForProperty:](v40, v12) & 1) != 0)
            {
              goto LABEL_44;
            }

            if ([v12 _propertyType] == 7 || objc_msgSend(v12, "superCompositeAttribute"))
            {
              __int128 v28 = (void *)MEMORY[0x189603F70];
              uint64_t v65 = @"Property";
              id v66 = v12;
              uint64_t v29 = [MEMORY[0x189603F68] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
              objc_exception_throw((id)[v28 exceptionWithName:*MEMORY[0x189603A60] reason:@"Composite property type is unsupported." userInfo:v29]);
              goto LABEL_71;
            }

            uint64_t v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]( [NSFetchIndexElementDescription alloc],  (void *)[v12 name],  v12,  0,  1);
            objc_msgSend(v7, "appendString:", -[NSFetchIndexElementDescription propertyName](v14, "propertyName"));
            goto LABEL_42;
          }

          if (objc_msgSend(@"self", "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
          {
            [v7 appendString:@"self"];
            uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
            -[NSPropertyDescription setName:](v13, "setName:", @"self");
            -[NSExpressionDescription setExpression:]( v13,  "setExpression:",  [MEMORY[0x189607878] expressionForEvaluatedObject]);
            -[NSExpressionDescription setExpressionResultType:](v13, "setExpressionResultType:", 2000LL);
            uint64_t v14 = -[NSFetchIndexElementDescription initWithProperty:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  "initWithProperty:collationType:",  v13,  0LL);

            goto LABEL_42;
          }

          if (objc_msgSend(@"entity", "isEqualToString:", objc_msgSend(v12, "lowercaseString")))
          {
            [v7 appendString:@"entity"];
            uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSExpressionDescription);
            -[NSPropertyDescription setName:](v15, "setName:", @"entity");
            -[NSExpressionDescription setExpression:]( v15,  "setExpression:",  [MEMORY[0x189607878] expressionForKeyPath:@"entity"]);
            -[NSExpressionDescription setExpressionResultType:](v15, "setExpressionResultType:", 0LL);
            uint64_t v14 = -[NSFetchIndexElementDescription initWithProperty:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  "initWithProperty:collationType:",  v15,  0LL);

            goto LABEL_42;
          }

          if ([v12 containsString:@"."])
          {
            if (objc_msgSend( (id)objc_msgSend( *(id *)(v40 + 96),  "objectForKey:",  objc_msgSend((id)objc_msgSend(v12, "componentsSeparatedByString:", @"."), "firstObject")),  "_propertyType") == 7)
            {
              uint64_t v30 = (void *)MEMORY[0x189603F70];
              __int128 v70 = @"Property";
              __int128 v71 = v12;
              uint64_t v31 = [MEMORY[0x189603F68] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
              objc_exception_throw((id)[v30 exceptionWithName:*MEMORY[0x189603A60] reason:@"Composite property type is unsupported." userInfo:v31]);
LABEL_71:
              __break(1u);
              return;
            }
          }

          else
          {
            if ([v6 count] != 1) {
              goto LABEL_41;
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(v40 + 96), "objectForKey:", v12), "_propertyType") == 7)
            {
              __int128 v32 = (void *)MEMORY[0x189603F70];
              __int128 v68 = @"Property";
              __int128 v69 = v12;
              uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
              objc_exception_throw((id)[v32 exceptionWithName:*MEMORY[0x189603A60] reason:@"Composite property type is unsupported." userInfo:v33]);
              goto LABEL_71;
            }

            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            uint64_t v16 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
            if (!v16)
            {
LABEL_41:
              uint64_t v14 = (NSFetchIndexElementDescription *)-[NSFetchIndexElementDescription initWithPropertyName:property:collationType:ascending:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  v12,  0LL,  0LL,  1);
              [v7 appendString:v12];
LABEL_42:
              if (v14)
              {
                [v41 addObject:v14];
              }

              goto LABEL_44;
            }

            uint64_t v17 = *(void *)v52;
LABEL_33:
            uint64_t v18 = 0LL;
            while (1)
            {
              if (*(void *)v52 != v17) {
                objc_enumerationMutation(v42);
              }
              __int128 v19 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v18), "elements"),  "firstObject");
              if (objc_msgSend(v12, "isEqual:", objc_msgSend(v19, "propertyName")))
              {
                if (![v19 collationType] && (objc_msgSend(v19, "isAscending") & 1) != 0) {
                  break;
                }
              }

              if (v16 == ++v18)
              {
                uint64_t v16 = [v42 countByEnumeratingWithState:&v51 objects:v67 count:16];
                if (v16) {
                  goto LABEL_33;
                }
                goto LABEL_41;
              }
            }
          }

- (id)_propertiesOnlySubsetFromIndexes:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
      }

      uint64_t v5 = [a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v3;
}

- (uint64_t)_hasIndexForProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 128);
    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + 40);
      if (v5)
      {
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v10 = 0u;
        __int128 v11 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v11;
          while (2)
          {
            uint64_t v9 = 0LL;
            do
            {
              if (*(void *)v11 != v8) {
                objc_enumerationMutation(v5);
              }
              if ((-[NSFetchIndexDescription _isIndexForProperty:](*(void *)(*((void *)&v10 + 1) + 8 * v9), a2) & 1) != 0) {
                return 1LL;
              }
              ++v9;
            }

            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
    }

    return -[NSEntityDescription _hasIndexForProperty:](*(void *)(v3 + 80), a2);
  }

  return result;
}

- (NSArray)uniquenessConstraints
{
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  superentity = self->_superentity;
  if (superentity)
  {
    uint64_t v5 = -[NSEntityDescription uniquenessConstraints](superentity, "uniquenessConstraints");
    if (v5) {
      [v3 addObjectsFromArray:v5];
    }
  }

  extraIvars = self->_extraIvars;
  if (extraIvars && extraIvars->var3) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  return (NSArray *)v3;
}

- (void)_checkForNonCascadeNoInverses
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v1 = -[NSEntityDescription _collectSubentities](a1);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  uint64_t v2 = -[__CFSet countByEnumeratingWithState:objects:count:]( v1,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
LABEL_4:
    uint64_t v4 = 0LL;
    while (1)
    {
      if (*(void *)v8 != v3) {
        objc_enumerationMutation(v1);
      }
      uint64_t v5 = -[NSEntityDescription _checkSelfForNonCascadeNoInverses](*(void *)(*((void *)&v7 + 1) + 8 * v4));
      if (v5) {
        break;
      }
      if (v2 == ++v4)
      {
        uint64_t v2 = -[__CFSet countByEnumeratingWithState:objects:count:]( v1,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
        if (v2) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (__CFSet)_collectSubentities
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  uint64_t v4 = CFSetCreateMutable(v2, 0LL, 0LL);
  CFSetAddValue(v4, a1);
  if (CFSetGetCount(v4) >= 1)
  {
    do
    {
      uint64_t v5 = (void *)-[__CFSet anyObject](v4, "anyObject");
      if (v5)
      {
        uint64_t v6 = v5;
        CFSetAddValue(Mutable, v5);
        CFSetRemoveValue(v4, v6);
        __int128 v7 = (void *)[v6 subentitiesByName];
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = (const void *)[v7 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
              if (v12) {
                CFSetAddValue(v4, v12);
              }
              ++v11;
            }

            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }

          while (v9);
        }
      }
    }

    while (CFSetGetCount(v4) > 0);
  }

  CFRelease(v4);
  return Mutable;
}

- (void)_checkSelfForNonCascadeNoInverses
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 96);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_4:
  uint64_t v6 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(v2);
    }
    __int128 v7 = (void *)[*(id *)(a1 + 96) objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
    if ([v7 _isRelationship])
    {
      if ([v7 deleteRule] != 2)
      {
        uint64_t v8 = (void *)[v7 inverseRelationship];
        if (v8)
        {
          uint64_t v9 = v8;
        }
      }
    }

    if (v4 == ++v6)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_4;
      }
      return 0LL;
    }
  }

- (void)setUniquenessConstraints:(NSArray *)uniquenessConstraints
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( uniquenessConstraints,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(uniquenessConstraints);
        }
        v7 += [*(id *)(*((void *)&v18 + 1) + 8 * i) count];
      }

      uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( uniquenessConstraints,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v6);
    if (v7)
    {
      uint64_t v10 = -[NSEntityDescription _checkForNonCascadeNoInverses](self);
      if (v10)
      {
        __int128 v11 = v10;
        -[NSEntityDescription name](self, "name");
        [v11 name];
        objc_msgSend((id)objc_msgSend(v11, "inverseRelationship"), "name");
        [v11 name];
        _NSCoreDataLog( 1LL,  (uint64_t)@"Cannot merge uniqueness constraints { %@ } on entity '%@' due to relationship '%@' having a mandatory to-one inverse relationship '%@' and not using a cascade delete rule on '%@'",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)uniquenessConstraints);
      }
    }
  }

  -[NSEntityDescription _setUniquenessConstraints:]((uint64_t)self, uniquenessConstraints);
}

- (void)setRenamingIdentifier:(NSString *)renamingIdentifier
{
  if (!renamingIdentifier
    || -[NSString isNSString](renamingIdentifier, "isNSString")
    && -[NSString isEqualToString:](-[NSEntityDescription name](self, "name"), "isEqualToString:", renamingIdentifier))
  {
    extraIvars = self->_extraIvars;
    if (extraIvars)
    {

      self->_extraIvars->var0 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = -[NSString copy](renamingIdentifier, "copy");
    int v7 = self->_extraIvars;
    if (!v7)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      int v7 = self->_extraIvars;
    }

    v7->var0 = (id)v6;
  }

- (NSString)renamingIdentifier
{
  extraIvars = self->_extraIvars;
  if (extraIvars && (var0 = (NSString *)extraIvars->var0) != 0LL) {
    return var0;
  }
  else {
    return -[NSEntityDescription name](self, "name");
  }
}

- (unint64_t)_keypathsToPrefetchForDeletePropagation
{
  do
  {
    if (!a1) {
      return 0LL;
    }
    v1 = (void *)a1;
    uint64_t v2 = *(void *)(a1 + 128);
    if (!v2)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      uint64_t v2 = v1[16];
    }

    a1 = [v1 superentity];
  }

  while (a1);
  uint64_t v3 = (unint64_t *)(v2 + 16);
  unint64_t v4 = atomic_load((unint64_t *)(v2 + 16));
  __dmb(0xBu);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1896077E8]);
    uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend( (id)-[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:]( v1,  0,  1,  (void *)objc_msgSend(MEMORY[0x189603FE0], "set")),  "allObjects"),  "copy");
    while (!__ldaxr(v3))
    {
    }

    __clrex();

LABEL_11:
    unint64_t v4 = atomic_load(v3);
    [v5 drain];
    id v8 = 0LL;
  }

  return v4;
}

- (void)_addSubentity:(id)a3
{
  id v5 = (NSEntityDescription *)[a3 superentity];
  if (v5 != self)
  {
    if (v5)
    {
      __int128 v11 = (void *)MEMORY[0x189603F70];
      uint64_t v12 = *MEMORY[0x189603A58];
      uint64_t v13 = @"Can't add an entity to multiple superentities.";
    }

    else
    {
      uint64_t v6 = [a3 name];
      if (v6)
      {
        uint64_t v7 = v6;
        id v8 = (id)-[NSMutableDictionary objectForKey:](self->_subentities, "objectForKey:", v6);
        if (!v8 || v8 == a3)
        {
          -[NSMutableDictionary setObject:forKey:](self->_subentities, "setObject:forKey:", a3, v7);
          id v9 = a3;
          uint64_t v10 = self;
LABEL_7:
          -[NSEntityDescription _setSuperentity:]((uint64_t)v9, (uint64_t)v10);
          return;
        }

        __int128 v11 = (void *)MEMORY[0x189603F70];
        uint64_t v12 = *MEMORY[0x189603A58];
        uint64_t v13 = @"Can't add multiple entities with duplicate names.";
      }

      else
      {
        __int128 v11 = (void *)MEMORY[0x189603F70];
        uint64_t v12 = *MEMORY[0x189603A58];
        uint64_t v13 = @"Can't add unnamed subentity.";
      }
    }

    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
    goto LABEL_7;
  }

- (void)_setSuperentity:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 80) != a2)
  {
    if (a1 == a2)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't set superentity of self to self." userInfo:0]);
      -[NSEntityDescription _addProperty:](v2, v3, v4);
    }

    else
    {
      *(void *)(a1 + 80) = a2;
    }
  }

- (void)_addProperty:(id)a3
{
  if (!a3) {
    return;
  }
  uint64_t v5 = [a3 name];
  if (!v5)
  {
    uint64_t v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    __int128 v18 = @"Can't add unnamed property to entity.";
LABEL_13:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v18 userInfo:0]);
    -[NSEntityDescription _addFactoryToRetainList:](v21, v22, v23);
    return;
  }

  uint64_t v6 = v5;
  if (-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v5))
  {
    __int128 v19 = (void *)MEMORY[0x189603F70];
    uint64_t v20 = *MEMORY[0x189603A58];
    __int128 v18 = (const __CFString *)[NSString stringWithFormat:@"Entity already contains a property named %@.", v6];
    uint64_t v16 = v19;
    uint64_t v17 = v20;
    goto LABEL_13;
  }

  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    uint64_t v16 = (void *)MEMORY[0x189603F70];
    uint64_t v17 = *MEMORY[0x189603A60];
    __int128 v18 = @"Can't add NSExpressionDescriptions to NSEntityDescriptions";
    goto LABEL_13;
  }

  id v8 = (NSEntityDescription *)[a3 entity];
  if (v8)
  {
    id v9 = v8;
    if (v8 != self)
    {
      [a3 name];
      -[NSEntityDescription name](self, "name");
      -[NSEntityDescription name](v9, "name");
      _NSCoreDataLog( 1LL,  (uint64_t)@"tried to add property %p '%@' to entity %p '%@' but it already belongs to entity %p '%@'",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)a3);
      a3 = (id)[a3 copy];
    }
  }

  -[NSMutableDictionary setObject:forKey:](self->_properties, "setObject:forKey:", a3, v6);
  [a3 _setEntityAndMaintainIndices:self];
}

- (void)_addFactoryToRetainList:(id)a3
{
  if (self)
  {
    extraIvars = self->_extraIvars;
    if (!extraIvars)
    {
      -[NSEntityDescription _initializeExtraIVars]((uint64_t)self);
      extraIvars = self->_extraIvars;
    }
  }

  else
  {
    extraIvars = 0LL;
  }

  os_unfair_lock_lock_with_options();
  id var1 = extraIvars->var1;
  if (!var1)
  {
    id var1 = objc_alloc_init(MEMORY[0x189603FA8]);
    extraIvars->id var1 = var1;
  }

  [var1 addObject:a3];
  os_unfair_lock_unlock(&extraIvars->var6);
}

- (id)_uniquenessConstraintsAsFetchIndexes
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v32 = self;
  extraIvars = self->_extraIvars;
  if (extraIvars)
  {
    id var3 = extraIvars->var3;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    obuint64_t j = var3;
    uint64_t v28 = [var3 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v38;
      do
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v5;
          uint64_t v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
          id v35 = objc_alloc_init(MEMORY[0x189603FA8]);
          uint64_t v34 = (void *)[@"UNIQUE" mutableCopy];
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id v30 = v6;
          uint64_t v36 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v36)
          {
            uint64_t v33 = *(void *)v46;
            do
            {
              for (uint64_t i = 0LL; i != v36; ++i)
              {
                if (*(void *)v46 != v33) {
                  objc_enumerationMutation(v30);
                }
                id v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                id v9 = (void *)[v8 componentsSeparatedByString:@"."];
                uint64_t v31 = v8;
                if ((unint64_t)[v9 count] < 2)
                {
                  id v10 = -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName](v32, "propertiesByName"),  "objectForKey:",  v8);
                }

                else
                {
                  id v10 = -[NSDictionary objectForKey:]( -[NSEntityDescription propertiesByName](v32, "propertiesByName"),  "objectForKey:",  [v9 objectAtIndex:0]);
                  if ((unint64_t)[v9 count] >= 2)
                  {
                    unint64_t v11 = 1LL;
                    do
                    {
                      uint64_t v12 = (void *)[v9 objectAtIndex:v11];
                      __int128 v41 = 0u;
                      __int128 v42 = 0u;
                      __int128 v43 = 0u;
                      __int128 v44 = 0u;
                      uint64_t v13 = (void *)[v10 elements];
                      uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
                      if (v14)
                      {
                        uint64_t v15 = v14;
                        uint64_t v16 = *(void *)v42;
                        while (2)
                        {
                          for (uint64_t j = 0LL; j != v15; ++j)
                          {
                            if (*(void *)v42 != v16) {
                              objc_enumerationMutation(v13);
                            }
                            __int128 v18 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                            if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v18, "name")))
                            {
                              id v10 = v18;
                              goto LABEL_25;
                            }
                          }

                          uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
                          if (v15) {
                            continue;
                          }
                          break;
                        }
                      }

- (id)_propertyWithRenamingIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", a3);
  if ((objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3) & 1) == 0)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        id v5 = -[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v9));
        if (objc_msgSend((id)objc_msgSend(v5, "renamingIdentifier"), "isEqualToString:", a3)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
          id v5 = 0LL;
          if (v7) {
            goto LABEL_4;
          }
          return v5;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v5;
}

- (void)knownKeysMappingStrategy
{
  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "managedObjectModel"), "isEditable"))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:@"Model must be immutable before mapping strategy can be created" userInfo:0]);
      return (void *)-[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:]( v2,  v3,  v4,  v5);
    }

    else
    {
      return (void *)v1[13];
    }
  }

  return result;
}

- (uint64_t)_keypathsToPrefetchForDeletePropagationPrefixedWith:(uint64_t)a3 toDepth:(void *)a4 processedEntities:
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = a4;
  uint64_t v7 = a1;
  int v8 = objc_msgSend(a4, "containsObject:", objc_msgSend(a1, "name"));
  if (a3 < 0 || v8) {
    return NSSet_EmptySet;
  }
  uint64_t v39 = a2;
  uint64_t v37 = a3;
  __int128 v38 = (void *)[MEMORY[0x189603FE0] set];
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v9 addObject:v7];
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  while (1)
  {
    objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(v7, "subentities"));
    if (![v10 count]) {
      break;
    }
    uint64_t v7 = (void *)[v10 lastObject];
    [v10 removeLastObject];
    [v9 addObject:v7];
  }

  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v41 = *(void *)v51;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        uint64_t v15 = v4;
        if (*(void *)v51 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v17 = (void *)[v16 relationshipsByName];
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v47;
          do
          {
            for (uint64_t j = 0LL; j != v19; ++j)
            {
              if (*(void *)v47 != v20) {
                objc_enumerationMutation(v17);
              }
              objc_msgSend( v11,  "setObject:forKey:",  objc_msgSend(v17, "objectForKey:", *(void *)(*((void *)&v46 + 1) + 8 * j)),  *(void *)(*((void *)&v46 + 1) + 8 * j));
            }

            uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }

          while (v19);
        }

        uint64_t v4 = v15;
        objc_msgSend(v15, "addObject:", objc_msgSend(v16, "name"));
      }

      uint64_t v13 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }

    while (v13);
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v22 = [v11 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v43;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v11);
        }
        uint64_t v26 = (void *)[v11 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * v25)];
        uint64_t v27 = [v26 deleteRule];
        uint64_t v28 = [v26 inverseRelationship];
        if (v27) {
          BOOL v29 = v27 == 3;
        }
        else {
          BOOL v29 = 1;
        }
        if (!v29)
        {
          uint64_t v30 = v28;
          if (v27 != 1 || v28 != 0)
          {
            if (v39) {
              id v32 = (id)[objc_alloc(NSString) initWithFormat:@"%@.%@", v39, objc_msgSend(v26, "name")];
            }
            else {
              id v32 = (id)[v26 name];
            }
            uint64_t v33 = v32;
            if (v27 != 1 || v30 == 0)
            {
              if (v27 == 2)
              {
                [v38 addObject:v32];
                if (v37 >= 1) {
                  objc_msgSend( v38,  "unionSet:",  -[NSEntityDescription _keypathsToPrefetchForDeletePropagationPrefixedWith:toDepth:processedEntities:]( objc_msgSend(v26, "destinationEntity"),  v33,  v37 - 1,  v4));
                }
              }
            }

            else
            {
              [v38 addObject:v32];
            }
          }
        }

        ++v25;
      }

      while (v23 != v25);
      uint64_t v35 = [v11 countByEnumeratingWithState:&v42 objects:v54 count:16];
      uint64_t v23 = v35;
    }

    while (v35);
  }

  return (uint64_t)v38;
}

- (uint64_t)_keypathsForDeletions
{
  if (!a1) {
    return 0LL;
  }
  if (a1[14])
  {
    uint64_t v2 = (void *)[MEMORY[0x189603FA8] array];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "propertiesByName"), "values");
    uint64_t v4 = v3;
    id v5 = (void *)a1[14];
    unint64_t v6 = v5[12];
    uint64_t v7 = v5[13];
    if (v6 < v7 + v6)
    {
      int v8 = (id *)(v3 + 8 * v6);
      do
      {
        id v9 = *v8;
        if ([*v8 inverseRelationship]) {
          objc_msgSend(v2, "addObject:", objc_msgSend(v9, "name"));
        }
        ++v8;
        --v7;
      }

      while (v7);
      id v5 = (void *)a1[14];
    }

    unint64_t v10 = v5[18];
    uint64_t v11 = v5[19];
    if (v10 < v11 + v10)
    {
      uint64_t v12 = (id *)(v4 + 8 * v10);
      do
      {
        id v13 = *v12;
        if ([*v12 inverseRelationship]) {
          objc_msgSend(v2, "addObject:", objc_msgSend(v13, "name"));
        }
        ++v12;
        --v11;
      }

      while (v11);
    }

    return (uint64_t)v2;
  }

  return objc_msgSend((id)objc_msgSend(a1, "relationshipsByName"), "allKeys");
}

- (id)_newMappingForPropertiesOfRange:(unsigned int)a3
{
  uint64_t v5 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  uint64_t v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
  uint64_t v7 = &self->_propertyRanges[a3];
  return -[NSKnownKeysDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithObjects:forKeys:count:",  v6 + 8 * v7->location,  v5 + 8 * v7->location,  v7->length);
}

+ (id)_MOClassName
{
  id result = (id)_MOClassName__NSManagedObjectClassName;
  if (!_MOClassName__NSManagedObjectClassName)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id result = (id)-[NSString copy](NSStringFromClass(v3), "copy");
    _MOClassName__NSManagedObjectClassName = (uint64_t)result;
  }

  return result;
}

- (id)_initWithName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSEntityDescription;
  id v4 = -[NSEntityDescription init](&v9, sel_init);
  uint64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 5) = 0LL;
    *((void *)v4 + 6) = 0LL;
    atomic_store(0LL, (unint64_t *)v4 + 7);
    uint64_t v6 = [a3 copy];
    v5[9] = 0LL;
    v5[10] = 0LL;
    v5[8] = v6;
    v5[11] = objc_alloc_init(MEMORY[0x189603FC8]);
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    v5[13] = 0LL;
    v5[14] = 0LL;
    v5[12] = v7;
    *((_DWORD *)v5 + 30) &= 0xFFFFF988;
    v5[17] = 0LL;
    v5[18] = 0LL;
    v5[19] = 0LL;
    v5[20] = -1LL;
    atomic_store(0LL, v5 + 4);
    v5[3] = 0LL;
    atomic_store(0LL, v5 + 2);
  }

  return v5;
}

- (void)_setManagedObjectModel:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    id result = (void *)[result _throwIfNotEditable];
    uint64_t v4 = v3[5];
    if (v4 != a2)
    {
      if (a2 && v4)
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't use an entity in two models." userInfo:0]);
        return (void *)__61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke(v5, v6);
      }

      else
      {
        void v3[5] = a2;
      }
    }
  }

  return result;
}

BOOL __61__NSEntityDescription__NSInternalMethods___propertiesOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 _propertyType];
}

- (uint64_t)_propertyKeys:(uint64_t)a3 matchingBlock:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    char v16 = 0;
    if ((*(_BYTE *)(result + 120) & 8) == 0)
    {
      uint64_t v6 = [(id)result superentity];
      if (v6)
      {
        char v16 = -[NSEntityDescription _propertyKeys:matchingBlock:](v6, a2, a3);
        if ((v16 & 1) != 0) {
          return 1LL;
        }
      }
    }

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = *(void **)(v5 + 96);
    id result = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (result)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)v13;
LABEL_8:
      uint64_t v10 = 0LL;
      while (1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a3 + 16))( a3,  [*(id *)(v5 + 96) objectForKey:v11],  &v16))
        {
          [a2 addObject:v11];
        }

        if (v16) {
          return 1LL;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v8) {
            goto LABEL_8;
          }
          return v16 != 0;
        }
      }
    }
  }

  return result;
}

- (uint64_t)_relationshipNamesByType:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSPropertyDescription_8_B16l;
    char v7 = a2;
    -[NSEntityDescription _propertyKeys:matchingBlock:](v3, v4, (uint64_t)v6);
    uint64_t v5 = [v4 allObjects];

    return v5;
  }

  return result;
}

uint64_t __68__NSEntityDescription__NSInternalMethods___relationshipNamesByType___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 _isRelationship];
  if ((_DWORD)result)
  {
    uint64_t v5 = [a2 maxCount];
    if (*(_BYTE *)(a1 + 32))
    {
      if (v5 == 1) {
        return 1LL;
      }
    }

    else if (v5 != 1)
    {
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

- (id)attributeKeys
{
  if (self->_propertyRanges)
  {
    uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
    return (id)[MEMORY[0x189603F18] arrayWithObjects:v3 + 8 * self->_propertyRanges[1].location count:self->_propertyRanges[1].length];
  }

  else
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v5, (uint64_t)&__block_literal_global_357);
    uint64_t v6 = (void *)[v5 allObjects];

    return v6;
  }

uint64_t __56__NSEntityDescription__NSInternalMethods__attributeKeys__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isAttribute];
}

- (id)toManyRelationshipKeys
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!self->_propertyRanges) {
    return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 0);
  }
  uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  propertyRanges = self->_propertyRanges;
  NSUInteger location = propertyRanges[9].location;
  NSUInteger length = propertyRanges[9].length;
  NSUInteger v8 = propertyRanges[13].location;
  NSUInteger v7 = propertyRanges[13].length;
  unint64_t v9 = v7 + length;
  if (v7 + length <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v7 + length;
  }
  if (v9 >= 0x201) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v10;
  }
  __int128 v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v9 <= 0x200)
  {
    bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v10);
    if (!length) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  __int128 v12 = (char *)NSAllocateScannedUncollectable();
  if (length) {
LABEL_13:
  }
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
LABEL_14:
  if (v7) {
    memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
  }
  __int128 v14 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v12 count:v7 + length];
  if (v9 >= 0x201) {
    NSZoneFree(0LL, v12);
  }
  return v14;
}

- (id)toOneRelationshipKeys
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!self->_propertyRanges) {
    return (id)-[NSEntityDescription _relationshipNamesByType:]((uint64_t)self, 1);
  }
  uint64_t v3 = objc_msgSend(-[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"), "keys");
  propertyRanges = self->_propertyRanges;
  NSUInteger location = propertyRanges[6].location;
  NSUInteger length = propertyRanges[6].length;
  NSUInteger v8 = propertyRanges[10].location;
  NSUInteger v7 = propertyRanges[10].length;
  unint64_t v9 = v7 + length;
  if (v7 + length <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v7 + length;
  }
  if (v9 >= 0x201) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v10;
  }
  __int128 v12 = (char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v9 <= 0x200)
  {
    bzero((char *)v15 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v10);
    if (!length) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  __int128 v12 = (char *)NSAllocateScannedUncollectable();
  if (length) {
LABEL_13:
  }
    memcpy(v12, (const void *)(v3 + 8 * location), 8 * length);
LABEL_14:
  if (v7) {
    memcpy(&v12[8 * length], (const void *)(v3 + 8 * v8), 8 * v7);
  }
  __int128 v14 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v12 count:v7 + length];
  if (v9 >= 0x201) {
    NSZoneFree(0LL, v12);
  }
  return v14;
}

- (id)inverseForRelationshipKey:(id)a3
{
  if (self->_propertyRanges)
  {
    id v5 = -[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping");
    uint64_t v6 = -[NSDictionary values](-[NSEntityDescription propertiesByName](self, "propertiesByName"), "values");
    uint64_t v7 = [v5 indexForKey:a3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v8 = 0LL;
    }
    else {
      NSUInteger v8 = (void *)[*(id *)(v6 + 8 * v7) inverseRelationship];
    }
    return (id)[v8 name];
  }

  else
  {
    uint64_t v13 = 0LL;
    __int128 v14 = &v13;
    uint64_t v15 = 0x3052000000LL;
    char v16 = __Block_byref_object_copy__9;
    uint64_t v17 = __Block_byref_object_dispose__9;
    uint64_t v18 = 0LL;
    id v9 = objc_alloc_init(MEMORY[0x189603FE0]);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke;
    v12[3] = &unk_189EA7ED0;
    v12[4] = a3;
    v12[5] = &v13;
    -[NSEntityDescription _propertyKeys:matchingBlock:]((uint64_t)self, v9, (uint64_t)v12);

    uint64_t v10 = (void *)v14[5];
    _Block_object_dispose(&v13, 8);
    return v10;
  }

uint64_t __69__NSEntityDescription__NSInternalMethods__inverseForRelationshipKey___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  if ([a2 _isRelationship]
    && objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( (id)objc_msgSend(a2, "inverseRelationship"),  "name");
    *a3 = 1;
  }

  return 0LL;
}

uint64_t __59__NSEntityDescription__NSInternalMethods___attributeNamed___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  uint64_t result = [a2 _isAttribute];
  if ((_DWORD)result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32));
    if ((_DWORD)result)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
      *a3 = 0;
      return 1LL;
    }
  }

  return result;
}

- (id)_localRelationshipNamed:(id)a3
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", a3);
  if ([v3 _propertyType] == 4) {
    return v3;
  }
  else {
    return 0LL;
  }
}

- (void)_setIsEditable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_sync_enter(self);
  uint64_t v6 = (void *)MEMORY[0x186E3E5D8](v5);
  __entityDescriptionFlags entityDescriptionFlags = self->_entityDescriptionFlags;
  if (v3)
  {
    if ((*(_BYTE *)&entityDescriptionFlags & 4) == 0) {
      goto LABEL_8;
    }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Cannot make an immutable entity editable again." userInfo:0]);
    __break(1u);
  }

  if ((*(_BYTE *)&entityDescriptionFlags & 4) == 0)
  {
    model = self->_model;
    if (model)
    {
      -[NSManagedObjectModel _setIsEditable:](model, "_setIsEditable:", 0LL);
    }

    else
    {
      self->_modelsReferenceIDForEntity = 0LL;
      -[NSEntityDescription _flattenProperties](self, "_flattenProperties");
      -[NSEntityDescription _createCachesAndOptimizeState](self, "_createCachesAndOptimizeState");
      -[NSEntityDescription versionHash](self, "versionHash");
      __dmb(0xBu);
    }
  }

- (BOOL)_isEditable
{
  return (*(_BYTE *)&self->_entityDescriptionFlags & 4) == 0;
}

- (void)_throwIfNotEditable
{
  if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) != 0) {
    -[NSManagedObjectModel _throwIfNotEditable]( -[NSEntityDescription managedObjectModel](self, "managedObjectModel"),  "_throwIfNotEditable");
  }
}

- (uint64_t)_hasPotentialHashSkew
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 88) count];
    if (result)
    {
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      uint64_t v2 = *(void **)(v1 + 96);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v10;
        while (2)
        {
          uint64_t v5 = 0LL;
          do
          {
            if (*(void *)v10 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = (void *)[*(id *)(v1 + 96) objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v5)];
            if ([v6 _propertyType] == 4)
            {
              uint64_t v7 = [v6 inverseRelationship];
            }

            ++v5;
          }

          while (v3 != v5);
          uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
          uint64_t v3 = result;
          if (result) {
            continue;
          }
          break;
        }
      }
    }
  }

  return result;
}

- (_NSRange)_propertyRangesByType
{
  return self->_propertyRanges;
}

- (unint64_t)_offsetRelationshipIndex:(unint64_t)a3 fromSuperEntity:(id)a4 andIsToMany:(BOOL)a5
{
  uint64_t v5 = (void *)*((void *)a4 + 14);
  unint64_t v6 = v5[8];
  BOOL v8 = a3 >= v6;
  unint64_t v7 = a3 - v6;
  BOOL v8 = !v8 || v7 >= v5[9];
  if (v8)
  {
    unint64_t v9 = v5[4];
    BOOL v8 = a3 >= v9;
    unint64_t v10 = a3 - v9;
    if (!v8 || v10 >= v5[5]) {
      return a3;
    }
    unint64_t v12 = v5[24];
    unint64_t v13 = v5[25];
    unint64_t v14 = a3 - v12;
    BOOL v15 = !a5;
    uint64_t v16 = 10LL;
    uint64_t v17 = 13LL;
  }

  else
  {
    unint64_t v12 = v5[16];
    unint64_t v13 = v5[17];
    unint64_t v14 = a3 - v12;
    BOOL v15 = !a5;
    uint64_t v16 = 6LL;
    uint64_t v17 = 9LL;
  }

  if (!v15) {
    uint64_t v16 = v17;
  }
  BOOL v18 = v14 < v13 && a3 >= v12;
  uint64_t v19 = 8LL;
  if (!v18) {
    uint64_t v19 = v16;
  }
  return self->_propertyRanges[v19].location + a3 - v5[2 * v19];
}

- (void)_commonCachesAndOptimizedState
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = (void *)[a1 managedObjectClassName];
    if (v2)
    {
      uint64_t v3 = v2;
      if (([v2 isEqualToString:@"NSManagedObject"] & 1) == 0)
      {
        Class Class = objc_getClass((const char *)[v3 UTF8String]);
        if (Class)
        {
          Class v5 = Class;
          id AssociatedObject = objc_getAssociatedObject(Class, PFEntityDescriptionAssociationKey);
          if (AssociatedObject)
          {
            unint64_t v7 = AssociatedObject;
            BOOL v8 = (void *)[MEMORY[0x189603FA8] array];
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v21;
              do
              {
                uint64_t v12 = 0LL;
                do
                {
                  if (*(void *)v21 != v11) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
                  if (v13)
                  {
                    id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
                    if (WeakRetained)
                    {
                      BOOL v15 = WeakRetained;
                      if (WeakRetained != a1) {
                        [v8 addObject:v13];
                      }
                    }
                  }

                  ++v12;
                }

                while (v10 != v12);
                uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
              }

              while (v10);
            }

            objc_msgSend( v8,  "addObject:",  +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a1));
          }

          else
          {
            id v24 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)&OBJC_CLASS____PFWeakReference, (uint64_t)a1);
            BOOL v8 = (void *)[MEMORY[0x189603F18] arrayWithObjects:&v24 count:1];
          }

          objc_setAssociatedObject(v5, PFEntityDescriptionAssociationKey, v8, (void *)0x303);
          id v16 = objc_getAssociatedObject(v5, &PFEntityNameAssociationKey);
          uint64_t v17 = (void *)objc_msgSend(objc_alloc(NSString), "initWithString:", objc_msgSend(a1, "name"));
          if (v16)
          {
            BOOL v18 = (void *)[MEMORY[0x189603FE0] setWithArray:v16];
            [v18 addObject:v17];
            uint64_t v19 = (void *)[v18 allObjects];
          }

          else
          {
            uint64_t v19 = (void *)[MEMORY[0x189603F18] arrayWithObject:v17];
          }

          objc_setAssociatedObject(v5, &PFEntityNameAssociationKey, v19, (void *)0x303);
        }
      }
    }
  }

- (void)_checkAttributeMembership:(void *)a1 hashes:(void *)a2
{
  v19[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v5 = [a1 _qualifiedName];
  if ([a2 objectForKey:v5])
  {
    uint64_t v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v18[0] = @"attributeName";
    v18[1] = @"compositeName";
    v19[0] = [a1 name];
    v19[1] = objc_msgSend((id)objc_msgSend(a1, "superCompositeAttribute"), "name");
    objc_exception_throw((id)objc_msgSend( v11,  "exceptionWithName:reason:userInfo:",  v12,  @"An attribute cannot be part of multiple composite attributes.",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v19, v18, 2)));
  }

  [a2 setObject:a1 forKey:v5];
  if ([a1 attributeType] == 2100)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    unint64_t v6 = (void *)objc_msgSend(a1, "elements", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSEntityDescription _checkAttributeMembership:hashes:](*(void *)(*((void *)&v13 + 1) + 8 * v10++), a2);
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_createCachesAndOptimizeState
{
  uint64_t v201 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_entityDescriptionFlags & 4) == 0)
  {
    id v160 = objc_alloc_init(MEMORY[0x1896077E8]);
    self->_rootentity = self;
    v168 = self;
    superentity = self->_superentity;
    if (superentity)
    {
      if (!-[NSMutableDictionary objectForKey:](superentity->_subentities, "objectForKey:", v168->_name))
      {
        v155 = (void *)MEMORY[0x189603F70];
        uint64_t v156 = [NSString stringWithFormat:@"Bad model.  For entity '%@' superentity '%@' does not think I am a subentity", v168->_name, v168->_superentity->_name];
        objc_exception_throw((id)[v155 exceptionWithName:*MEMORY[0x189603A58] reason:v156 userInfo:0]);
LABEL_208:
        __break(1u);
        return;
      }

      -[NSEntityDescription _createCachesAndOptimizeState](v168->_superentity, "_createCachesAndOptimizeState");
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
        && !-[NSString isEqualToString:](v168->_classNameForEntity, "isEqualToString:", @"NSManagedObject"))
      {
        NSClassFromString(v168->_classNameForEntity);
        objc_opt_self();
      }

      for (uint64_t i = v168->_rootentity; ; v168->_rootentity = i)
      {
        uint64_t i = -[NSEntityDescription superentity](i, "superentity");
        if (!i) {
          break;
        }
      }
    }

    if (-[NSMutableDictionary count](v168->_subentities, "count"))
    {
      __int128 v179 = 0u;
      __int128 v180 = 0u;
      __int128 v177 = 0u;
      __int128 v178 = 0u;
      uint64_t v5 = (void *)-[NSMutableDictionary allValues](v168->_subentities, "allValues");
      uint64_t v6 = [v5 countByEnumeratingWithState:&v177 objects:v197 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v178;
        do
        {
          for (uint64_t j = 0LL; j != v6; ++j)
          {
            if (*(void *)v178 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v177 + 1) + 8 * j);
            if (*(NSEntityDescription **)(v9 + 80) != v168)
            {
              v149 = (void *)MEMORY[0x189603F70];
              uint64_t v150 = [NSString stringWithFormat:@"Bad model.  For entity '%@' subentity '%@' does not think I am its superentity", v168->_name, *(void *)(v9 + 64)];
              objc_exception_throw((id)[v149 exceptionWithName:*MEMORY[0x189603A58] reason:v150 userInfo:0]);
              goto LABEL_208;
            }

            p_isa = (id *)&v168->_model->super.isa;
            uint64_t v11 = [*(id *)(*((void *)&v177 + 1) + 8 * j) name];
            if (p_isa) {
              p_isa = (id *)[p_isa[4] objectForKey:v11];
            }
            if (p_isa != (id *)v9)
            {
              v147 = (void *)MEMORY[0x189603F70];
              uint64_t v148 = [NSString stringWithFormat:@"Bad model.  For entity '%@' subentity '%@ (%p)' is not registered in NSManagedModelModel.  Model has a reference to %@ (%p)", v168->_name, *(void *)(v9 + 64), v9, objc_msgSend(p_isa, "name"), p_isa];
              objc_exception_throw((id)[v147 exceptionWithName:*MEMORY[0x189603A58] reason:v148 userInfo:0]);
              goto LABEL_208;
            }
          }

          uint64_t v6 = [v5 countByEnumeratingWithState:&v177 objects:v197 count:16];
        }

        while (v6);
      }
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = (id)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithArray:",  -[NSMutableDictionary allValues](v168->_properties, "allValues"));
      [v12 sortUsingFunction:_comparePropertiesByName context:0];
      v159 = (NSArray *)objc_alloc_init(MEMORY[0x1896077E8]);
      id v165 = v12;
      __int128 v13 = (NSArray *)[MEMORY[0x189603FE0] set];
      v167 = (NSArray *)[MEMORY[0x189603FC8] dictionary];
      v161 = v13;
      __int128 v175 = 0u;
      __int128 v176 = 0u;
      __int128 v173 = 0u;
      __int128 v174 = 0u;
      __int128 v14 = (NSArray *)[v12 countByEnumeratingWithState:&v173 objects:v196 count:16];
      if (v14)
      {
        __int128 v15 = *(NSArray **)v174;
        v164 = *(NSArray **)v174;
LABEL_25:
        uint64_t v16 = 0LL;
        v162 = v14;
        while (1)
        {
          if (*(NSArray **)v174 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v173 + 1) + 8 * v16);
          BOOL v18 = (void *)MEMORY[0x186E3E5D8]();
          [v17 _createCachesAndOptimizeState];
          unsigned int entityDescriptionFlags = v168->_entityDescriptionFlags;
          if ((entityDescriptionFlags & 0x20) != 0)
          {
            int v28 = *(_DWORD *)&v168->_entityDescriptionFlags & 0x20;
          }

          else
          {
            if (-[NSEntityDescription _isEditable](v168, "_isEditable"))
            {
              __int128 v187 = 0u;
              __int128 v188 = 0u;
              __int128 v185 = 0u;
              __int128 v186 = 0u;
              __int128 v20 = -[NSEntityDescription properties](v168, "properties");
              uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v185,  v199,  16LL);
              if (v21)
              {
                v166 = *(NSArray **)v186;
                v163 = v20;
                while (2)
                {
                  uint64_t v22 = 0LL;
                  do
                  {
                    if (*(NSArray **)v186 != v166) {
                      objc_enumerationMutation(v20);
                    }
                    __int128 v23 = *(void **)(*((void *)&v185 + 1) + 8 * v22);
                    if ([v23 _propertyType] == 7)
                    {
                      id v24 = (void *)[v23 _flattenedElements];
                      __int128 v183 = 0u;
                      __int128 v184 = 0u;
                      __int128 v181 = 0u;
                      __int128 v182 = 0u;
                      uint64_t v25 = [v24 countByEnumeratingWithState:&v181 objects:v198 count:16];
                      if (v25)
                      {
                        uint64_t v26 = *(void *)v182;
LABEL_38:
                        uint64_t v27 = 0LL;
                        while (1)
                        {
                          if (*(void *)v182 != v26) {
                            objc_enumerationMutation(v24);
                          }
                          if ([*(id *)(*((void *)&v181 + 1) + 8 * v27) isIndexedBySpotlight]) {
                            break;
                          }
                          if (v25 == ++v27)
                          {
                            uint64_t v25 = [v24 countByEnumeratingWithState:&v181 objects:v198 count:16];
                            if (v25) {
                              goto LABEL_38;
                            }
                            goto LABEL_46;
                          }
                        }

- (void)_newSnowLeopardStyleDictionaryContainingPropertiesOfType:(unint64_t)a3
{
  return (void *)_PF_SnowLeopard_CFDictionaryCreateWithObjectsAndKeys( (uint64_t *)(-[NSDictionary values]( -[NSEntityDescription propertiesByName](self, "propertiesByName"),  "values")
                             + 8 * self->_propertyRanges[a3].location),
                   (__CFString **)(objc_msgSend( -[NSEntityDescription _propertySearchMapping](self, "_propertySearchMapping"),  "keys")
                                 + 8 * self->_propertyRanges[a3].location),
                   self->_propertyRanges[a3].length);
}

- (void)_leopardStyleRelationshipsByName
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v3 = _PF_Leopard_CFDictionaryCreate();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  properties = self->_properties;
  uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(properties);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v9);
        if ([v10 _propertyType] == 4) {
          _PF_Leopard_CFDictionarySetValue(v3, v9, v10);
        }
      }

      uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)_leopardStyleAttributesByName
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v3 = _PF_Leopard_CFDictionaryCreate();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  properties = self->_properties;
  uint64_t v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(properties);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v9);
      }

      uint64_t v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)_new_implicitlyObservedKeys
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = (void *)[a1 _propertySearchMapping];
    uint64_t v3 = (void *)[v1 propertiesByName];
    uint64_t v4 = [v1 _propertyRangesByType];
    uint64_t v5 = [v2 keys];
    uint64_t v6 = [v3 values];
    id v1 = objc_alloc_init(MEMORY[0x189603FE0]);
    unint64_t v7 = *(void *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 40);
    if (v7 < v8 + v7)
    {
      uint64_t v9 = (void *)(v5 + 8 * v7);
      uint64_t v10 = (void **)(v6 + 8 * v7);
      do
      {
        uint64_t v11 = *v10;
        __int128 v12 = (void *)[objc_alloc(NSString) initWithString:*v9];
        if ([v11 inverseRelationship] || (objc_msgSend(v11, "isOrdered") & 1) == 0) {
          [v1 addObject:*v9];
        }

        ++v9;
        ++v10;
        --v8;
      }

      while (v8);
    }
  }

  return v1;
}

- (void)_sortedSubentities
{
  if (result)
  {
    id v1 = (void *)[result subentities];
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"name" ascending:1 selector:sel_caseInsensitiveCompare_];
    uint64_t v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v2, 0);
    uint64_t v4 = [v1 sortedArrayUsingDescriptors:v3];

    return (void *)v4;
  }

  return result;
}

- (void)_flattenProperties
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (!self || (*(_BYTE *)&self->_entityDescriptionFlags & 8) == 0)
  {
    uint64_t v3 = -[NSEntityDescription superentity](self, "superentity");
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v4 = v3;
    -[NSEntityDescription _flattenProperties](v3, "_flattenProperties");
    uint64_t v5 = -[NSEntityDescription propertiesByName](v4, "propertiesByName");
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    if (v6)
    {
      uint64_t v7 = v6;
      id v24 = v4;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v11 = -[NSDictionary objectForKey:](v5, "objectForKey:", v10);
          __int128 v12 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v10);
          if (v12)
          {
            __int128 v13 = v12;
            if (([v12 isEqual:v11] & 1) == 0)
            {
              if (([v13 _isEqualWithoutIndex:v11] & 1) == 0) {
                objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Property named '%@' in entity '%@' conflicts with property inherited from parent entity '%@'", objc_msgSend(v13, "name"), -[NSEntityDescription name](self, "name"), -[NSEntityDescription name](v24, "name")), 0 reason userInfo]);
              }
              _NSCoreDataLog( 2LL,  (uint64_t)@"Subentity has an index on parent property: %@",  v14,  v15,  v16,  v17,  v18,  v19,  v10);
            }
          }

          else
          {
            model = self->_model;
            if (model && (*(_BYTE *)&model->_managedObjectModelFlags & 4) != 0)
            {
              Class Class = object_getClass(v11);
              if (Class == (Class)objc_opt_class()) {
                id v11 = (id)[v11 _underlyingProperty];
              }
              uint64_t v21 = -[_NSPropertyDescriptionProxy initWithPropertyDescription:]( objc_alloc(&OBJC_CLASS____NSPropertyDescriptionProxy),  "initWithPropertyDescription:",  v11);
            }

            else
            {
              uint64_t v21 = (_NSPropertyDescriptionProxy *)[v11 copyWithZone:0];
            }

            __int128 v23 = v21;
            -[NSEntityDescription _addProperty:](self, "_addProperty:", v21);
          }
        }

        uint64_t v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      }

      while (v7);
    }

    else
    {
LABEL_23:
      if (!self) {
        return;
      }
    }

    -[NSEntityDescription _throwIfNotEditable](self, "_throwIfNotEditable");
    *(_DWORD *)&self->_entityDescriptionFlags |= 8u;
  }

- (void)_stripForMigration
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[NSEntityDescription setManagedObjectClassName:](self, "setManagedObjectClassName:", 0LL);
  *(_DWORD *)&self->_entityDescriptionFlags |= 0x10u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  uint64_t v3 = -[NSEntityDescription properties](self, "properties", 0LL);
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _stripForMigration];
      }

      while (v5 != v7);
      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

- (BOOL)_skipValidation
{
  return (*(_BYTE *)&self->_entityDescriptionFlags >> 4) & 1;
}

- (void)_restoreValidation
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(_DWORD *)&self->_entityDescriptionFlags &= ~0x10u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v2 = -[NSEntityDescription properties](self, "properties", 0LL);
  uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _restoreValidation];
      }

      while (v4 != v6);
      uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (uint64_t)_hasAttributesWithFileBackedFutures
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id v1 = (unsigned __int8 *)result;
    if ([(id)result _isEditable])
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      uint64_t v2 = (void *)[v1 properties];
      uint64_t result = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0LL; i != v3; ++i)
          {
            if (*(void *)v17 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v6 _propertyType] == 7)
            {
              __int128 v7 = (void *)[v6 _flattenedElements];
              __int128 v12 = 0u;
              __int128 v13 = 0u;
              __int128 v14 = 0u;
              __int128 v15 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v13;
LABEL_11:
                uint64_t v11 = 0LL;
                while (1)
                {
                  if (*(void *)v13 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  if ([*(id *)(*((void *)&v12 + 1) + 8 * v11) isFileBackedFuture]) {
                    return 1LL;
                  }
                  if (v9 == ++v11)
                  {
                    uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
                    if (v9) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
            }

            else if ([v6 _propertyType] == 2 && (objc_msgSend(v6, "isFileBackedFuture") & 1) != 0)
            {
              return 1LL;
            }
          }

          uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
          uint64_t result = 0LL;
          if (v3) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      return v1[121] >> 7;
    }
  }

  return result;
}

- (uint64_t)_hasAttributesWithExternalDataReferences
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id v1 = (_BYTE *)result;
    if ([(id)result _isEditable])
    {
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      uint64_t v2 = (void *)[v1 properties];
      uint64_t result = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (result)
      {
        uint64_t v3 = result;
        uint64_t v4 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0LL; i != v3; ++i)
          {
            if (*(void *)v18 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v6 _propertyType] == 7)
            {
              __int128 v7 = (void *)[v6 _flattenedElements];
              __int128 v13 = 0u;
              __int128 v14 = 0u;
              __int128 v15 = 0u;
              __int128 v16 = 0u;
              uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v14;
LABEL_11:
                uint64_t v11 = 0LL;
                while (1)
                {
                  if (*(void *)v14 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
                  if ([v12 storesBinaryDataExternally])
                  {
                  }

                  if (v9 == ++v11)
                  {
                    uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
                    if (v9) {
                      goto LABEL_11;
                    }
                    break;
                  }
                }
              }
            }

            else if ([v6 _propertyType] == 2 {
                   && [v6 storesBinaryDataExternally]
            }
                   && ![v6 isFileBackedFuture])
            {
              return 1LL;
            }
          }

          uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
          uint64_t result = 0LL;
          if (v3) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      return v1[121] & 1;
    }
  }

  return result;
}

- (uint64_t)_hasDerivedAttributes
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id v1 = (void *)result;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v2 = (void *)[(id)result attributesByName];
    uint64_t result = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v17 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(v1, "attributesByName"),  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * i));
          if ([v6 _propertyType] == 7)
          {
            __int128 v7 = (void *)[v6 _flattenedElements];
            __int128 v12 = 0u;
            __int128 v13 = 0u;
            __int128 v14 = 0u;
            __int128 v15 = 0u;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v13;
LABEL_10:
              uint64_t v11 = 0LL;
              while (1)
              {
                if (*(void *)v13 != v10) {
                  objc_enumerationMutation(v7);
                }
                if ([*(id *)(*((void *)&v12 + 1) + 8 * v11) _propertyType] == 6) {
                  return 1LL;
                }
                if (v9 == ++v11)
                {
                  uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
                  if (v9) {
                    goto LABEL_10;
                  }
                  break;
                }
              }
            }
          }

          else if ([v6 _propertyType] == 6)
          {
            return 1LL;
          }
        }

        uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
        uint64_t result = 0LL;
        if (v3) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (void)_addIndexForProperty:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 128);
    if (!v4)
    {
      -[NSEntityDescription _initializeExtraIVars](a1);
      uint64_t v4 = *(void *)(a1 + 128);
    }

    if (!*(void *)(v4 + 40)) {
      *(void *)(v4 + 40) = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    uint64_t v5 = -[NSFetchIndexElementDescription initWithProperty:collationType:]( objc_alloc(&OBJC_CLASS___NSFetchIndexElementDescription),  "initWithProperty:collationType:",  a2,  0LL);
    uint64_t v6 = objc_alloc(&OBJC_CLASS___NSFetchIndexDescription);
    uint64_t v7 = [a2 name];
    v9[0] = v5;
    uint64_t v8 = -[NSFetchIndexDescription initWithName:elements:]( v6,  "initWithName:elements:",  v7,  [MEMORY[0x189603F18] arrayWithObjects:v9 count:1]);

    [*(id *)(v4 + 40) addObject:v8];
  }

- (uint64_t)_removeIndexForProperty:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 128);
    if (v3)
    {
      uint64_t v4 = *(void **)(v3 + 40);
      if (v4)
      {
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v10 = 0u;
        __int128 v11 = 0u;
        uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (result)
        {
          uint64_t v6 = result;
          uint64_t v7 = *(void *)v11;
          while (2)
          {
            uint64_t v8 = 0LL;
            do
            {
              if (*(void *)v11 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
              uint64_t result = -[NSFetchIndexDescription _isIndexForProperty:](v9, a2);
              if ((result & 1) != 0)
              {
                if (v9) {
                  return [*(id *)(*(void *)(v2 + 128) + 40) removeObject:v9];
                }
                return result;
              }

              ++v8;
            }

            while (v6 != v8);
            uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
            uint64_t v6 = result;
            if (result) {
              continue;
            }
            break;
          }
        }
      }
    }
  }

  return result;
}

- (uint64_t)_finalizeIndexes
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 128);
    if (v2)
    {
      uint64_t v3 = *(void **)(v2 + 40);
      if (v3)
      {
        __int128 v9 = 0u;
        __int128 v10 = 0u;
        __int128 v7 = 0u;
        __int128 v8 = 0u;
        uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (result)
        {
          uint64_t v4 = result;
          uint64_t v5 = *(void *)v8;
          do
          {
            uint64_t v6 = 0LL;
            do
            {
              if (*(void *)v8 != v5) {
                objc_enumerationMutation(v3);
              }
              [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _setEntity:v1];
            }

            while (v4 != v6);
            uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
            uint64_t v4 = result;
          }

          while (result);
        }
      }
    }
  }

  return result;
}

- (uint64_t)_isPathologicalForConstraintMerging:(uint64_t)result
{
  v15[3] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = (void *)result;
    if ((*(_BYTE *)(result + 121) & 0x20) != 0)
    {
      if (a2)
      {
        uint64_t v4 = -[NSEntityDescription _checkForNonCascadeNoInverses]((const void *)result);
        uint64_t v5 = (void *)MEMORY[0x189607870];
        uint64_t v6 = *MEMORY[0x189607460];
        if (v4)
        {
          __int128 v7 = v4;
          v14[0] = @"Reason";
          v15[0] = [NSString stringWithFormat:@"Entity '%@' has unique constraints { %@ } with relationship '%@' and mandatory to-one inverse '%@' but is not using a cascade delete rule .", objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints"), objc_msgSend(v7, "name"), objc_msgSend((id)objc_msgSend(v7, "inverseRelationship"), "name")];
          v15[1] = v7;
          v14[1] = @"relationship";
          v14[2] = @"inverse";
          void v15[2] = [v7 inverseRelationship];
          __int128 v8 = (void *)MEMORY[0x189603F68];
          __int128 v9 = v15;
          __int128 v10 = (const __CFString **)v14;
          uint64_t v11 = 3LL;
        }

        else
        {
          uint64_t v12 = @"Reason";
          uint64_t v13 = [NSString stringWithFormat:@"Entity '%@' has unique constraints { %@ } with a relationship and mandatory to-one inverse but is not using a cascade delete rule .", objc_msgSend(v2, "name"), objc_msgSend(v2, "uniquenessConstraints")];
          __int128 v8 = (void *)MEMORY[0x189603F68];
          __int128 v9 = &v13;
          __int128 v10 = &v12;
          uint64_t v11 = 1LL;
        }

        *a2 = objc_msgSend( v5,  "errorWithDomain:code:userInfo:",  v6,  134111,  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11));
      }

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (uint64_t)_hasUniqueProperties
{
  if (result)
  {
    if ((*(_DWORD *)(result + 120) & 4) != 0)
    {
      return (*(_DWORD *)(result + 120) & 0x1800) != 0;
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Entity wasn't finalized properly before use" userInfo:0]);
      return -[NSEntityDescription _constraintIsExtension:]();
    }
  }

  return result;
}

- (uint64_t)_constraintIsExtension:(uint64_t)result
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 128);
    if (v4)
    {
      uint64_t v5 = *(void **)(v4 + 24);
      if (v5)
      {
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          uint64_t v14 = v3;
          while (2)
          {
            for (uint64_t i = 0LL; i != v7; ++i)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              unint64_t v11 = [v10 count];
              if ([a2 count] > v11)
              {
                uint64_t v12 = 0LL;
                if (v11)
                {
                  for (uint64_t j = 0LL; j != v11; ++j)
                    v12 += objc_msgSend( (id)objc_msgSend(v10, "objectAtIndex:", j),  "isEqual:",  objc_msgSend(a2, "objectAtIndex:", j));
                }

                if (v12 == v11) {
                  return 1LL;
                }
              }
            }

            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
            uint64_t v3 = v14;
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
    }

    uint64_t result = *(void *)(v3 + 80);
    if (result) {
      return -[NSEntityDescription _constraintIsExtension:](result, a2);
    }
  }

  return result;
}

- (void)_extensionsOfParentConstraint:(void *)result
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = result[16];
    if (v3 && *(void *)(v3 + 24))
    {
      id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      obuint64_t j = *(id *)(v2[16] + 24LL);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v20;
        do
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(obj);
            }
            __int128 v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            unint64_t v10 = [v9 count];
            unint64_t v11 = [a2 count];
            BOOL v12 = v10 > v11;
            unint64_t v13 = v10 - v11;
            if (v12)
            {
              uint64_t v14 = 0LL;
              unint64_t v15 = v11;
              if (v11)
              {
                uint64_t v16 = 0LL;
                do
                {
                  v14 += objc_msgSend( (id)objc_msgSend(v9, "objectAtIndex:", v16),  "isEqual:",  objc_msgSend(a2, "objectAtIndex:", v16));
                  ++v16;
                }

                while (v15 != v16);
              }

              if (v14 == v15)
              {
                v23[0] = v9;
                v23[1] = objc_msgSend(v9, "subarrayWithRange:", 0, v15);
                v23[2] = objc_msgSend(v9, "subarrayWithRange:", v15, v13);
                objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v23, 3));
              }
            }
          }

          uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
        }

        while (v6);
      }

      return v17;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)_isSchemaEqual:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (!a3) {
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  uint64_t v5 = -[NSEntityDescription name](self, "name");
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

  uint64_t v8 = -[NSEntityDescription superentity](self, "superentity");
  uint64_t v6 = [a3 superentity];
  if (v8 != (NSEntityDescription *)v6)
  {
    uint64_t v9 = v6;
    LOBYTE(v6) = 0;
    if (!v8) {
      return v6;
    }
    if (!v9) {
      return v6;
    }
    LODWORD(v6) = -[NSEntityDescription _isSchemaEqual:](v8, sel__isSchemaEqual_);
    if (!(_DWORD)v6) {
      return v6;
    }
  }

  unint64_t v10 = -[NSEntityDescription propertiesByName](self, "propertiesByName");
  unint64_t v11 = (void *)[a3 propertiesByName];
  uint64_t v12 = -[NSDictionary count](v10, "count");
  if (v12 != [v11 count])
  {
LABEL_26:
    LOBYTE(v6) = 0;
    return v6;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  unint64_t v13 = -[NSDictionary allKeys](v10, "allKeys", 0LL);
  uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v19 = -[NSDictionary objectForKey:](v10, "objectForKey:", v18);
        uint64_t v20 = [v11 objectForKey:v18];
        if (v19 != (id)v20)
        {
          if (v19) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21) {
            goto LABEL_26;
          }
          LODWORD(v6) = objc_msgSend(v19, sel__isSchemaEqual_, v20);
          if (!(_DWORD)v6) {
            return v6;
          }
        }
      }

      uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      LOBYTE(v6) = 1;
    }

    while (v15);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass) {
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass Class = objc_opt_class();
  }
  uint64_t v16 = (void *)[a9 mapping];
  _writeInt32IntoData(a3, 0xDAEDFEEB);
  unsigned int v60 = [a3 length];
  _writeInt32IntoData(a3, 0);
  _writeInt32IntoData( a3,  objc_msgSend((id)objc_msgSend(a6, "objectForKey:", self->_versionHashModifier), "unsignedIntegerValue"));
  unint64_t v17 = atomic_load((unint64_t *)&self->_versionHash);
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a7, "objectForKey:", v17), "unsignedIntegerValue"));
  _writeInt32IntoData( a3,  objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_classNameForEntity), "unsignedIntegerValue"));
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_name), "unsignedIntegerValue"));
  if (self->_superentity)
  {
    LOBYTE(v63) = 1;
    [a3 appendBytes:&v63 length:1];
    _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_superentity, "name")));
  }

  else
  {
    LOBYTE(v63) = 0;
    [a3 appendBytes:&v63 length:1];
  }

  id v62 = a7;
  _writeInt32IntoData(a3, objc_msgSend(v16, "indexForKey:", -[NSEntityDescription name](self->_rootentity, "name")));
  subentities = self->_subentities;
  if (subentities && -[NSMutableDictionary count](subentities, "count"))
  {
    LOBYTE(v63) = 1;
    [a3 appendBytes:&v63 length:1];
    id v19 = (void *)-[NSMutableDictionary mapping](self->_subentities, "mapping");
    _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a8, "objectForKey:", v19), "unsignedIntegerValue"));
    LODWORD(v21) = [v19 length];
    _writeInt32IntoData(a3, v21);
    uint64_t v20 = [v19 keys];
    uint64_t v21 = v21;
    if ((_DWORD)v21)
    {
      __int128 v22 = (uint64_t *)v20;
      do
      {
        uint64_t v23 = *v22++;
        _writeInt64IntoData(a3, [v16 indexForKey:v23]);
        --v21;
      }

      while (v21);
    }
  }

  else
  {
    LOBYTE(v63) = 0;
    [a3 appendBytes:&v63 length:1];
  }

  __int128 v59 = v16;
  id v61 = a8;
  _writeInt32IntoData( a3,  objc_msgSend((id)objc_msgSend(a8, "objectForKey:", self->_propertyMapping), "unsignedIntegerValue"));
  uint64_t v24 = -[NSMutableDictionary count](self->_properties, "count");
  if (v24)
  {
    uint64_t v25 = v24;
    __int128 v26 = (void *)[self->_propertyMapping keys];
    uint64_t v27 = v25;
    do
    {
      _writeInt64IntoData(a3, 0LL);
      --v27;
    }

    while (v27);
    do
    {
      uint64_t v28 = (void *)-[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", *v26);
      __entityDescriptionFlags v29 = (objc_class *)_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass;
      if (v29 == object_getClass(v28))
      {
        _writeInt32IntoData(a3, 1u);
        _writeNSPropertyProxyIntoData(a3, v28, a4);
      }

      else
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v28), "unsignedIntegerValue"));
      }

      ++v26;
      --v25;
    }

    while (v25);
  }

  for (uint64_t i = 0LL; i != 18; ++i)
  {
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].location));
    _writeInt64IntoData(a3, LODWORD(self->_propertyRanges[i].length));
  }

  _writeInt32IntoData(a3, *(_DWORD *)&self->_entityDescriptionFlags);
  int v31 = 8;
  do
  {
    _writeInt64IntoData(a3, 0LL);
    --v31;
  }

  while (v31);
  if (-[NSEntityDescription renamingIdentifier](self, "renamingIdentifier")) {
    unint64_t v32 = objc_msgSend( (id)objc_msgSend( a6,  "objectForKey:",  -[NSEntityDescription renamingIdentifier](self, "renamingIdentifier")),  "unsignedIntegerValue");
  }
  else {
    unint64_t v32 = 0LL;
  }
  _writeInt64IntoData(a3, v32);
  if (-[NSEntityDescription coreSpotlightDisplayNameExpression](self, "coreSpotlightDisplayNameExpression")) {
    unint64_t v33 = objc_msgSend( (id)objc_msgSend( v62,  "objectForKey:",  -[NSEntityDescription coreSpotlightDisplayNameExpression]( self,  "coreSpotlightDisplayNameExpression")),  "unsignedIntegerValue");
  }
  else {
    unint64_t v33 = 0LL;
  }
  _writeInt64IntoData(a3, v33);
  uint64_t v34 = -[NSEntityDescription indexes](self, "indexes");
  unint64_t v35 = -[NSArray count](v34, "count");
  if (v34 && v35)
  {
    _writeInt64IntoData(a3, v35);
    if (-[NSArray count](v34, "count"))
    {
      uint64_t v36 = 0LL;
      while (1)
      {
        id v37 = -[NSArray objectAtIndex:](v34, "objectAtIndex:", v36);
        _writeInt64IntoData( a3,  objc_msgSend( (id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v37, "name")),  "unsignedIntegerValue"));
        uint64_t v38 = [v37 partialIndexPredicate];
        if (v38)
        {
          uint64_t v39 = v38;
          _writeInt64IntoData(a3, 1uLL);
          unint64_t v40 = objc_msgSend((id)objc_msgSend(v62, "objectForKey:", v39), "unsignedIntegerValue");
        }

        else
        {
          unint64_t v40 = 0LL;
        }

        _writeInt64IntoData(a3, v40);
        uint64_t v41 = (void *)[v37 elements];
        unint64_t v42 = [v41 count];
        unint64_t v43 = v42;
        if (v41)
        {
          if (v42) {
            break;
          }
        }

        _writeInt64IntoData(a3, 0LL);
        if (v43) {
          goto LABEL_41;
        }
LABEL_46:
        if (++v36 >= -[NSArray count](v34, "count")) {
          goto LABEL_49;
        }
      }

      _writeInt64IntoData(a3, v42);
LABEL_41:
      uint64_t v44 = 0LL;
      do
      {
        __int128 v45 = (void *)[v41 objectAtIndex:v44];
        _writeInt64IntoData( a3,  objc_msgSend( (id)objc_msgSend(a5, "objectForKey:", objc_msgSend(v45, "propertyName")),  "unsignedIntegerValue"));
        _writeInt64IntoData(a3, [v45 collationType]);
        _writeInt64IntoData(a3, [v45 isAscending]);
        __int128 v46 = (void *)[v45 property];
        if ([v46 _propertyType] == 5)
        {
          _writeInt64IntoData(a3, 1uLL);
          unint64_t v47 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", v46), "unsignedIntegerValue");
        }

        else
        {
          unint64_t v47 = 0LL;
        }

        _writeInt64IntoData(a3, v47);
        ++v44;
      }

      while (v43 != v44);
      goto LABEL_46;
    }
  }

  else
  {
    _writeInt64IntoData(a3, 0LL);
  }

- (BOOL)performPostDecodeValidationInModel:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  properties = self->_properties;
  uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( properties,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    CFIndex v30 = *MEMORY[0x189605258];
    __int128 v29 = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    uint64_t v28 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    __int128 v26 = a4;
    uint64_t v27 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v25 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(properties);
        }
        unint64_t v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x186E3E5D8]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          unint64_t v13 = (void *)[v11 destinationEntity];
          uint64_t v14 = [v13 name];
          if (v13
            && (!v14
             || (void *)objc_msgSend((id)objc_msgSend(a3, "entitiesByName"), "objectForKeyedSubscript:", v14) != v13))
          {
            uint64_t v21 = v26;
            if (v26)
            {
              __int128 v22 = (void *)MEMORY[0x189607870];
              uint64_t v23 = *MEMORY[0x189607460];
              uint64_t v24 = &unk_189F034C8;
LABEL_28:
              *uint64_t v21 = (id)[v22 errorWithDomain:v23 code:4866 userInfo:v24];
            }

@end