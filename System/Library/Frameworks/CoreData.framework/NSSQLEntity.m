@interface NSSQLEntity
+ (void)initialize;
- (NSSQLEntity)initWithModel:(id)a3 entityDescription:(id)a4;
- (NSSQLEntity_DerivedAttributesExtension)derivedAttributesExtension;
- (NSSQLToOne)_addVirtualToOneForToMany:(NSSQLToOne *)a3 withInheritedProperty:;
- (id)_generateMulticolumnUniquenessConstraints;
- (id)attributeColumns;
- (id)attributes;
- (id)description;
- (id)entityDescription;
- (id)foreignEntityKeyColumns;
- (id)foreignKeyColumns;
- (id)foreignOrderKeyColumns;
- (id)indexForIndexDescription:(id *)result;
- (id)manyToManyRelationships;
- (id)model;
- (id)name;
- (id)rootEntity;
- (id)tableName;
- (id)toManyRelationships;
- (uint64_t)_addForeignOrderKeyForToOne:(void *)a3 entity:;
- (uint64_t)_addSubentity:(uint64_t)result;
- (uint64_t)_collectFKSlots:(void *)a3 error:;
- (uint64_t)_entityIsBroken:(uint64_t)a1;
- (uint64_t)_generateAttributeDerivations:(uint64_t)result;
- (uint64_t)_generateIDWithSuperEntity:(int)a3 nextID:;
- (uint64_t)_sqlPropertyWithRenamingIdentifier:(uint64_t)result;
- (uint64_t)addDerivedAttribute:(uint64_t)result;
- (uint64_t)addPropertiesForReadOnlyFetch:(uint64_t)a3 keys:(void *)a4 context:;
- (uint64_t)properties;
- (uint64_t)rtreeIndexForIndexNamed:(uint64_t)a1;
- (uint64_t)sqlAttributesForCompositeAttributeName:(uint64_t)a1;
- (uint64_t)tempTableName;
- (unint64_t)virtualForeignKeyColumns;
- (void)_addColumnToFetch:(void *)result;
- (void)_generateInverseRelationshipsAndMore;
- (void)_generateProperties;
- (void)_organizeConstraints;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)entitySpecificPropertiesPassing:(uint64_t)a1;
- (void)rtreeIndexes;
- (void)subhierarchyColumnMatching:(uint64_t)a1;
@end

@implementation NSSQLEntity

- (id)model
{
  return self->_model;
}

- (id)entityDescription
{
  return self->_entityDescription;
}

- (id)tableName
{
  return self->_tableName;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_model = (NSSQLModel *)[a3 model];
  self->_entityDescription = (NSEntityDescription *)(id)[a3 entityDescription];
  self->_tableName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "tableName"), "copy");
  v5 = objc_alloc_init(&OBJC_CLASS___NSSQLPrimaryKey);
  self->_primaryKey = v5;
  if (a3) {
    uint64_t v6 = *((void *)a3 + 16);
  }
  else {
    uint64_t v6 = 0LL;
  }
  -[NSSQLPrimaryKey copyValuesForReadOnlyFetch:](v5, "copyValuesForReadOnlyFetch:", v6);
  v7 = objc_alloc_init(&OBJC_CLASS___NSSQLEntityKey);
  self->_entityKey = v7;
  if (a3)
  {
    -[NSSQLColumn copyValuesForReadOnlyFetch:](v7, "copyValuesForReadOnlyFetch:", *((void *)a3 + 17));
    self->_entityID = *((_DWORD *)a3 + 46);
    unsigned int v8 = *((_DWORD *)a3 + 47);
  }

  else
  {
    -[NSSQLColumn copyValuesForReadOnlyFetch:](v7, "copyValuesForReadOnlyFetch:", 0LL);
    unsigned int v8 = 0;
    self->_entityID = 0;
  }

  self->_subentityMaxID = v8;
  self->_columnsToFetch = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  self->_attrColumns = 0LL;
  self->_ekColumns = 0LL;
  self->_fokColumns = 0LL;
  self->_fkColumns = 0LL;
  self->_properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  self->_rootEntity = self;
  self->_propertyMapping = (NSKnownKeysMappingStrategy *)[MEMORY[0x189603FE8] null];
}

- (uint64_t)addPropertiesForReadOnlyFetch:(uint64_t)a3 keys:(void *)a4 context:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v6 = result;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a2);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v11) {
            v11[2] = v6;
          }
          int v12 = [v11 propertyType];
          if (v12 == 7)
          {
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
            if (v11)
            {
              uint64_t v13 = v11[9];
              if (v13)
              {
                *(void *)(v13 + 16) = v6;
                -[NSSQLEntity _addColumnToFetch:]((void *)v6, (_WORD *)v13);
              }
            }

            uint64_t v14 = [v11 foreignKey];
            if (v14) {
              *(void *)(v14 + 16) = v6;
            }
            -[NSSQLEntity _addColumnToFetch:]((void *)v6, (_WORD *)v14);
          }

          else
          {
            if (v12 != 1)
            {
              [a4 setObject:objc_msgSend( MEMORY[0x189603F70], "exceptionWithName:reason:userInfo:", *MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"Trying to add a non-attribute, non-to-one property to an entity: %@", objc_msgSend(v11, "name")), 0), @"NSUnderlyingException" forKey];
              return 0LL;
            }

            -[NSSQLEntity _addColumnToFetch:]((void *)v6, v11);
            objc_msgSend(*(id *)(v6 + 40), "setObject:forKey:", v11, objc_msgSend(v11, "name"));
          }
        }

        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    *(void *)(v6 + 240) = -[NSKnownKeysMappingStrategy initForKeys:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:",  a3);
    return 1LL;
  }

  return result;
}

- (void)_addColumnToFetch:(void *)result
{
  if (result && a2)
  {
    v3 = result;
    uint64_t v4 = result[21];
    if (v4)
    {
      __int16 v5 = [*(id *)(v4 + 72) count];
      [*(id *)(v4 + 72) addObject:a2];
      a2[13] = v5;
    }

    switch([a2 propertyType])
    {
      case 1u:
        uint64_t v6 = &OBJC_IVAR___NSSQLEntity__attrColumns;
        goto LABEL_10;
      case 3u:
        uint64_t v6 = &OBJC_IVAR___NSSQLEntity__fkColumns;
        goto LABEL_10;
      case 4u:
        uint64_t v6 = &OBJC_IVAR___NSSQLEntity__ekColumns;
        goto LABEL_10;
      case 0xAu:
        uint64_t v6 = &OBJC_IVAR___NSSQLEntity__fokColumns;
LABEL_10:
        uint64_t v7 = *(void **)((char *)v3 + *v6);
        if (v7 || (uint64_t v7 = (void *)objc_opt_new(), (*(void *)((char *)v3 + *v6) = v7) != 0LL))
        {
          __int16 v8 = [v7 count];
          [v7 addObject:a2];
        }

        break;
      default:
        break;
    }

    result = (void *)v3[10];
    if (result)
    {
      unint64_t v9 = (unsigned __int16)a2[13];
      if ([result count] < v9)
      {
        do
        {
          uint64_t v10 = [(id)v3[10] count];
          objc_opt_self();
          os_unfair_lock_lock_with_options();
          v11 = (NSSQLColumn *)objc_msgSend( (id)qword_18C4AB7D8,  "objectForKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v10));
          if (!v11)
          {
            int v12 = -[NSSQLColumn initWithColumnName:sqlType:]( objc_alloc(&OBJC_CLASS___NSSQLColumn),  "initWithColumnName:sqlType:",  @"0",  1LL);
            v11 = v12;
            if (v12)
            {
              *(_WORD *)&v12->super._flags &= ~1u;
              v12->super._fetchIndex = v10;
            }

            objc_msgSend( (id)qword_18C4AB7D8,  "setObject:forKey:",  v12,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v10));
          }

          os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_95);
          [(id)v3[10] addObject:v11];
        }

        while ([(id)v3[10] count] < v9);
      }

      return (void *)[(id)v3[10] addObject:a2];
    }
  }

  return result;
}

- (id)foreignKeyColumns
{
  if (self->_fkColumns) {
    return self->_fkColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (id)foreignEntityKeyColumns
{
  if (self->_ekColumns) {
    return self->_ekColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (id)foreignOrderKeyColumns
{
  if (self->_fokColumns) {
    return self->_fokColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (id)attributeColumns
{
  if (self->_attrColumns) {
    return self->_attrColumns;
  }
  else {
    return (id)NSArray_EmptyArray;
  }
}

- (void)dealloc
{
  if (self)
  {
    if (atomic_load((unint64_t *)&self->_fetch_entity_plan))
    {
      uint64_t v4 = (CFTypeRef *)atomic_load((unint64_t *)&self->_fetch_entity_plan);
      _deallocateFetchEntityPlan(v4);
      atomic_store(0LL, (unint64_t *)&self->_fetch_entity_plan);
    }
  }

  odiousHashHackStorage = self->_odiousHashHackStorage;
  if (odiousHashHackStorage)
  {
    _PF_Leopard_CFDictionaryDestroy(odiousHashHackStorage);
    self->_odiousHashHackStorage = 0LL;
  }

  self->_superentity = 0LL;
  uint64_t v6 = (void *)atomic_load((unint64_t *)&self->_virtualFKs);

  if (self->_propertyMapping)
  {

    self->_primaryKey = 0LL;
    self->_propertyMapping = 0LL;

    self->_entityKey = 0LL;
  }

  self->_subentities = 0LL;
  self->_tableName = 0LL;
  self->_columnsToFetch = 0LL;
  self->_columnsToFetchNoSubentities = 0LL;
  self->_fkColumns = 0LL;
  self->_ekColumns = 0LL;
  self->_fokColumns = 0LL;
  self->_attrColumns = 0LL;
  self->_entityDescription = 0LL;
  self->_properties = 0LL;
  self->_mappingGenerator = 0LL;
  atomic_store(0LL, (unint64_t *)&self->_fetch_entity_plan);
  self->_propertyAllCache = 0LL;
  self->_propertiesAllToManysCache = 0LL;
  self->_propertyManyToManyCache = 0LL;
  self->_multicolumnUniquenessConstraints = 0LL;
  self->_uniqueProperties = 0LL;
  self->_rtreeIndices = 0LL;
  self->_derivedAttributes = 0LL;
  self->_derivedAttributeExtension = 0LL;
  self->_compositeAttributeNameToSQLProperties = 0LL;
  self->_model = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSSQLEntity;
  -[NSStoreMapping dealloc](&v7, sel_dealloc);
}

- (unint64_t)virtualForeignKeyColumns
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (result)
  {
    unint64_t v1 = result;
    if (!atomic_load((unint64_t *)(result + 120)))
    {
      v3 = *(void **)(result + 96);
      if (v3)
      {
        if ([v3 count])
        {
          id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
          __int128 v14 = 0u;
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int16 v5 = *(void **)(v1 + 96);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v15;
            do
            {
              for (uint64_t i = 0LL; i != v7; ++i)
              {
                if (*(void *)v15 != v8) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
                uint64_t v11 = [v10 toOneRelationship];
                if (v11)
                {
                  if (*(_BYTE *)(v11 + 88)) {
                    [v4 addObject:v10];
                  }
                }
              }

              uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
            }

            while (v7);
          }

          int v12 = (unint64_t *)(v1 + 120);
          while (!__ldaxr(v12))
          {
          }

          __clrex();
        }
      }
    }

    return atomic_load((unint64_t *)(v1 + 120));
  }

  return result;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    qword_18C4AB7D8 = (uint64_t)objc_alloc_init(MEMORY[0x189603FC8]);
  }
}

- (NSSQLEntity)initWithModel:(id)a3 entityDescription:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NSSQLEntity;
  id v6 = -[NSSQLEntity init](&v26, sel_init);
  if (v6)
  {
    uint64_t v7 = +[NSSQLStoreMappingGenerator defaultMappingGenerator]();
    if (a3) {
      BOOL v8 = *((_DWORD *)a3 + 15) >> 7 > 0x7Cu;
    }
    else {
      BOOL v8 = 0;
    }
    *((void *)v6 + 4) = -[NSSQLStoreMappingGenerator generateTableName:isAncillary:]((uint64_t)v7, a4, v8);
    *((void *)v6 + 3) = a4;
    *((void *)v6 + 2) = a3;
    atomic_store(0LL, (unint64_t *)v6 + 28);
    if (a4) {
      uint64_t v9 = *((void *)a4 + 14);
    }
    else {
      uint64_t v9 = 0LL;
    }
    *((_OWORD *)v6 + 12) = *(_OWORD *)(v9 + 96);
    *((_DWORD *)v6 + 70) = *((_DWORD *)v6 + 70) & 0xFFFFFFFE | -[NSEntityDescription _hasAttributesWithExternalDataReferences]((uint64_t)a4);
    else {
      int v10 = 0;
    }
    *((_DWORD *)v6 + 70) = *((_DWORD *)v6 + 70) & 0xFFFFFFFD | v10;
    if (![a4 superentity])
    {
      *((void *)v6 + 27) = objc_alloc_init(MEMORY[0x189603FA8]);
      *((void *)v6 + 26) = objc_alloc_init(MEMORY[0x189603FA8]);
    }

    if ([a4 indexes] && objc_msgSend((id)objc_msgSend(a4, "indexes"), "count"))
    {
      id v25 = (id)*((void *)v6 + 29);
      if (!v25)
      {
        id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
        *((void *)v6 + 29) = v25;
      }

      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      uint64_t v11 = (NSSQLEntity *)v6;
      int v12 = (void *)[*((id *)v6 + 3) indexes];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            __int128 v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v17, "elements"), "count")
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "elements"), "firstObject"), "collationType") == 1)
            {
              __int128 v29 = 0u;
              __int128 v30 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              __int128 v18 = (void *)[v17 elements];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v28;
LABEL_25:
                uint64_t v22 = 0LL;
                while (1)
                {
                  if (*(void *)v28 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  if (objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "property"),  "isOptional")) {
                    break;
                  }
                  if (v20 == ++v22)
                  {
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
                    if (v20) {
                      goto LABEL_25;
                    }
                    goto LABEL_31;
                  }
                }
              }

              else
              {
LABEL_31:
                id v23 = -[NSSQLRTreeIndex initForIndexDescription:sqlEntity:]( objc_alloc(&OBJC_CLASS___NSSQLRTreeIndex),  "initForIndexDescription:sqlEntity:",  v17,  v11);
                objc_msgSend(v25, "setObject:forKey:", v23, objc_msgSend(v17, "name"));
              }
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }

        while (v14);
      }

      return v11;
    }
  }

  return (NSSQLEntity *)v6;
}

- (id)name
{
  return -[NSEntityDescription name](self->_entityDescription, "name");
}

- (uint64_t)tempTableName
{
  if (result) {
    return [NSString stringWithFormat:@"TEMP_CD%@", *(void *)(result + 32)];
  }
  return result;
}

- (uint64_t)properties
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 48);
    if (!result)
    {
      uint64_t v2 = (void *)[*(id *)(v1 + 40) allValues];
      unint64_t v3 = [v2 count];
      unint64_t v4 = MEMORY[0x1895F8858](v3);
      uint64_t v7 = (const void **)((char *)v9 - v6);
      if (v4 > 0x200) {
        uint64_t v7 = (const void **)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v9 - v6, 8 * v5);
      }
      objc_msgSend(v2, "getObjects:range:", v7, 0, v3);
      CFArrayRef v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v7, v3, 0LL);
      if (v3 >= 0x201) {
        NSZoneFree(0LL, v7);
      }
      *(void *)(v1 + 48) = v8;
      return *(void *)(v1 + 48);
    }
  }

  return result;
}

- (id)toManyRelationships
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  propertiesAllToManysCache = (__CFArray *)self->_propertiesAllToManysCache;
  if (!propertiesAllToManysCache)
  {
    propertiesAllToManysCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    unint64_t v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    self->_propertiesAllToManysCache = (NSArray *)propertiesAllToManysCache;
  }

  return propertiesAllToManysCache;
}

- (id)manyToManyRelationships
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  propertyManyToManyCache = (__CFArray *)self->_propertyManyToManyCache;
  if (!propertyManyToManyCache)
  {
    propertyManyToManyCache = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    unint64_t v4 = (void *)-[NSSQLEntity properties]((uint64_t)self);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(_BYTE **)(*((void *)&v11 + 1) + 8 * v8);
          if (v9 && v9[24] == 9) {
            CFArrayAppendValue(propertyManyToManyCache, v9);
          }
          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    self->_propertyManyToManyCache = (NSArray *)propertyManyToManyCache;
  }

  return propertyManyToManyCache;
}

- (void)entitySpecificPropertiesPassing:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v13 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unint64_t v4 = (void *)[*(id *)(a1 + 40) allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a2 + 16))(a2, [v9 propertyType]))
        {
          uint64_t v10 = *(void *)(a1 + 160);
          uint64_t v11 = [v9 name];
          if (!v10 || ![*(id *)(v10 + 40) objectForKey:v11]) {
            [v13 addObject:v9];
          }
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  return v13;
}

uint64_t __39__NSSQLEntity_entitySpecificProperties__block_invoke(uint64_t a1, unsigned int a2)
{
  return (a2 < 0xA) & (0x382u >> a2);
}

BOOL __42__NSSQLEntity_entitySpecificRelationships__block_invoke(uint64_t a1, int a2)
{
  return (a2 - 7) < 3;
}

BOOL __39__NSSQLEntity_entitySpecificAttributes__block_invoke(uint64_t a1, int a2)
{
  return a2 == 1;
}

- (void)subhierarchyColumnMatching:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  unint64_t v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(a2, "name"));
  if (!v4
    || (uint64_t v5 = v4, [v4 propertyType] != 1)
    || !objc_msgSend( (id)objc_msgSend(a2, "propertyDescription"),  "_isSchemaEqual:",  objc_msgSend(v5, "propertyDescription"))
    || (objc_msgSend((id)objc_msgSend(a2, "columnName"), "isEqual:", objc_msgSend(v5, "columnName")) & 1) == 0)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v6 = *(void **)(a1 + 152);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = -[NSSQLEntity subhierarchyColumnMatching:](*(void *)(*((void *)&v13 + 1) + 8 * v10), a2);
          if (v11) {
            return (void *)v11;
          }
          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    return 0LL;
  }

  return v5;
}

- (uint64_t)_addSubentity:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 152);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(v3 + 152) = v4;
    }

    return [v4 addObject:a2];
  }

  return result;
}

- (uint64_t)_sqlPropertyWithRenamingIdentifier:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = result;
    id v4 = (void *)[*(id *)(result + 24) propertiesByName];
    if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v4, "objectForKey:", a2), "renamingIdentifier"),  "isEqualToString:",  a2))
    {
      return [*(id *)(v3 + 40) objectForKey:a2];
    }

    else
    {
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      uint64_t v5 = (void *)objc_msgSend(v4, "allValues", 0);
      result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
            ++v8;
          }

          while (v6 != v8);
          result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          uint64_t v6 = result;
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

- (uint64_t)_addForeignOrderKeyForToOne:(void *)a3 entity:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  result = [a2 sourceEntity];
  if (!a2) {
    return result;
  }
  uint64_t v6 = a2[10];
  if (!v6) {
    return result;
  }
  uint64_t v7 = (void *)result;
  result = objc_msgSend(*(id *)(v5 + 40), "objectForKey:", objc_msgSend(a2[10], "name"));
  if (result) {
    return result;
  }
  objc_msgSend(*(id *)(v5 + 40), "setObject:forKey:", v6, objc_msgSend(v6, "name"));
  uint64_t v8 = *(void **)(v5 + 248);
  if (v8) {
    _PF_Leopard_CFDictionarySetValue(v8, (__CFString *)[v6 name], v6);
  }
  if (v7 != a3)
  {
    uint64_t v9 = *(void **)(v5 + 104);
    if (!v9)
    {
      uint64_t v9 = (void *)objc_opt_new();
      *(void *)(v5 + 104) = v9;
    }

    [v9 addObject:v6];
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  -[NSSQLEntity _addColumnToFetch:]((void *)v5, v6);
  if (a3) {
LABEL_11:
  }
    a3 = (void *)a3[19];
LABEL_12:
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  result = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(a3);
        }
        -[NSSQLEntity _addForeignOrderKeyForToOne:entity:]( *(void *)(*((void *)&v13 + 1) + 8 * v12),  a2,  *(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }

      while (v10 != v12);
      result = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = result;
    }

    while (result);
  }

  return result;
}

- (NSSQLToOne)_addVirtualToOneForToMany:(NSSQLToOne *)a3 withInheritedProperty:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = a3;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    BOOL v7 = *(_BYTE *)(v6 + 57) != 0;
    if (a3)
    {
      int v8 = 0;
      goto LABEL_7;
    }

    *(_BYTE *)(v6 + 58) = 1;
    goto LABEL_6;
  }

  BOOL v7 = 0;
  int v8 = 0;
  if (!a3)
  {
LABEL_6:
    uint64_t v3 = -[NSSQLToOne initWithEntity:inverseToMany:]( objc_alloc(&OBJC_CLASS___NSSQLToOne),  "initWithEntity:inverseToMany:",  a1,  a2);
    int v8 = 1;
  }

- (void)_generateInverseRelationshipsAndMore
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = [result model];
    if (v2 && (*(_BYTE *)(v2 + 48) & 1) != 0)
    {
      uint64_t v10 = [MEMORY[0x189603FA8] array];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = **(void **)(v1 + 248);
      if (v12 < 1) {
        goto LABEL_56;
      }
      MEMORY[0x1895F8858](v10);
      __int128 v14 = (char *)&v72 - v13;
      else {
        bzero((char *)&v72 - v13, 8 * v12);
      }
      uint64_t v17 = *(void **)(v1 + 248);
      uint64_t v18 = v17[1];
      if (v18 > 0)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = (uint64_t *)v17[9];
        do
        {
          uint64_t v22 = *v20++;
          uint64_t v21 = v22;
          uint64_t v23 = v17[8];
          if (v23 != v22 && v21 != ~v23) {
            *(void *)&v14[8 * v19++] = v21;
          }
          --v18;
        }

        while (v18);
      }

      for (uint64_t i = 0LL;
            i != v12;
            objc_msgSend( v11,  "addObject:",  _PF_Leopard_CFDictionaryGetValue(*(void **)(v1 + 248), *(__CFString **)&v14[8 * i++])))
      {
        ;
      }
    }

    else
    {
      uint64_t v3 = [(id)v1 model];
      if (v3 && (*(_BYTE *)(v3 + 48) & 2) != 0)
      {
        unsigned int v15 = [*(id *)(v1 + 40) count];
        if ((int)v15 >= 1)
        {
          BOOL v7 = PF_Tiger_CFDictionaryCreate(0LL, v15, 1);
          v73 = &v72;
          unint64_t v6 = v15;
          MEMORY[0x1895F8858](v7);
          if (v15 > 0x200uLL)
          {
            unint64_t v72 = NSAllocateScannedUncollectable();
          }

          else
          {
            unint64_t v72 = (unint64_t)&v72 - v16;
            bzero((char *)&v72 - v16, 8LL * v15);
          }

          __int128 v84 = 0u;
          __int128 v85 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v28 = *(void **)(v1 + 40);
          uint64_t v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v88, 16, v72);
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v83;
            do
            {
              for (uint64_t j = 0LL; j != v30; ++j)
              {
                if (*(void *)v83 != v31) {
                  objc_enumerationMutation(v28);
                }
                PF_Tiger_CFDictionarySetValue( (uint64_t)v7,  *(const __CFString **)(*((void *)&v82 + 1) + 8 * j),  [*(id *)(v1 + 40) objectForKey:*(void *)(*((void *)&v82 + 1) + 8 * j)]);
              }

              uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v88 count:16];
            }

            while (v30);
          }

          goto LABEL_54;
        }

        goto LABEL_34;
      }

      uint64_t v4 = *(void *)(v1 + 16);
      if (v4 && *(_BYTE *)(v4 + 57))
      {
        uint64_t v5 = (void *)-[NSSQLModel _precomputedKeyOrderForEntity:](v4, (void *)v1);
        LODWORD(v6) = [*(id *)(v1 + 40) count];
        if ((int)v6 >= 1)
        {
          BOOL v7 = PF_Tiger_CFDictionaryCreate(0LL, v6, 1);
          unint64_t v6 = v6;
          MEMORY[0x1895F8858](v7);
          v73 = v9;
          if (v6 > 0x200uLL)
          {
            unint64_t v72 = NSAllocateScannedUncollectable();
          }

          else
          {
            unint64_t v72 = (unint64_t)&v72 - v8;
            bzero((char *)&v72 - v8, 8LL * v6);
          }

          __int128 v80 = 0u;
          __int128 v81 = 0u;
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          uint64_t v33 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v78, v87, 16, v72);
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v79;
            do
            {
              for (uint64_t k = 0LL; k != v34; ++k)
              {
                if (*(void *)v79 != v35) {
                  objc_enumerationMutation(v5);
                }
                uint64_t v37 = *(const __CFString **)(*((void *)&v78 + 1) + 8 * k);
                uint64_t v38 = [*(id *)(v1 + 40) objectForKey:v37];
                if (v38) {
                  PF_Tiger_CFDictionarySetValue((uint64_t)v7, v37, v38);
                }
              }

              uint64_t v34 = [v5 countByEnumeratingWithState:&v78 objects:v87 count:16];
            }

            while (v34);
          }

- (void)_generateProperties
{
  uint64_t v143 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = (void *)result[20];
    id v118 = (id)[result entityDescription];
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3 && *(_BYTE *)(v3 + 57))
    {
      v123 = 0LL;
      v124 = 0LL;
      int v121 = 1;
    }

    else
    {
      v124 = (unint64_t *)[v118 _leopardStyleAttributesByName];
      v123 = (unint64_t *)[v118 _leopardStyleRelationshipsByName];
      int v121 = 0;
    }

    uint64_t v4 = [(id)v1 model];
    if (v4) {
      int v120 = (*(unsigned __int8 *)(v4 + 48) >> 1) & 1;
    }
    else {
      int v120 = 0;
    }
    uint64_t v5 = *(void *)(v1 + 160);
    unint64_t v6 = 0x18C68F000LL;
    if (v5)
    {
      *(void *)(v1 + 80) = [*(id *)(v5 + 80) mutableCopy];
      id v7 = objc_alloc(MEMORY[0x189603FC8]);
      if (v2) {
        uint64_t v8 = v2[5];
      }
      else {
        uint64_t v8 = 0LL;
      }
      *(void *)(v1 + 40) = [v7 initWithDictionary:v8];
      id v9 = objc_alloc(MEMORY[0x189603FC8]);
      if (v2)
      {
        unint64_t v10 = 0x18C4A5000uLL;
        uint64_t v11 = v2[34];
      }

      else
      {
        uint64_t v11 = 0LL;
        unint64_t v10 = 0x18C4A5000LL;
      }

      *(void *)(v1 + *(int *)(v10 + 1356)) = [v9 initWithDictionary:v11];
      if ((v121 & 1) == 0)
      {
        uint64_t v12 = _PF_Leopard_CFDictionaryCreate();
        v122 = &v116;
        *(void *)(v1 + 248) = v12;
        uint64_t v13 = (uint64_t *)v2[31];
        uint64_t v14 = *v13;
        MEMORY[0x1895F8858](v12);
        uint64_t v17 = (__CFString **)((char *)&v116 - v16);
        else {
          bzero((char *)&v116 - v16, 8 * v15);
        }
        uint64_t v22 = v13[1];
        if (v22 >= 1)
        {
          uint64_t v23 = 0LL;
          __int128 v24 = (__CFString **)v13[9];
          do
          {
            uint64_t v26 = *v24++;
            __int128 v25 = v26;
            uint64_t v27 = v13[8];
            if ((__CFString *)v27 != v26 && v25 != (__CFString *)~v27) {
              v17[v23++] = v25;
            }
            --v22;
          }

          while (v22);
        }

        if (v14 >= 1)
        {
          uint64_t v29 = v17;
          uint64_t v30 = v14;
          do
          {
            uint64_t v31 = *v29++;
            uint64_t Value = (const void *)_PF_Leopard_CFDictionaryGetValue(v13, v31);
            _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), v31, Value);
            --v30;
          }

          while (v30);
        }

        unint64_t v6 = 0x18C68F000uLL;
      }

      if (objc_msgSend((id)objc_msgSend(v2, "foreignKeyColumns"), "count")) {
        *(void *)(v1 + 96) = objc_msgSend((id)objc_msgSend(v2, "foreignKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "foreignEntityKeyColumns"), "count")) {
        *(void *)(v1 + 88) = objc_msgSend((id)objc_msgSend(v2, "foreignEntityKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "foreignOrderKeyColumns"), "count")) {
        *(void *)(v1 + 104) = objc_msgSend((id)objc_msgSend(v2, "foreignOrderKeyColumns"), "mutableCopy");
      }
      if (objc_msgSend((id)objc_msgSend(v2, "attributeColumns"), "count")) {
        *(void *)(v1 + 112) = objc_msgSend((id)objc_msgSend(v2, "attributeColumns"), "mutableCopy");
      }
      if (v2)
      {
        *(void *)(v1 + 128) = v2[16];
        *(void *)(v1 + 136) = v2[17];
        *(void *)(v1 + 144) = v2[18];
        uint64_t v33 = *(void **)((char *)v2 + *(int *)(v6 + 3832));
      }

      else
      {
        uint64_t v33 = 0LL;
        *(void *)(v1 + 128) = 0LL;
        *(void *)(v1 + 136) = 0LL;
        *(void *)(v1 + 144) = 0LL;
      }

      uint64_t v21 = v33;
    }

    else
    {
      *(void *)(v1 + 40) = objc_opt_new();
      *(void *)(v1 + 272) = objc_alloc_init(MEMORY[0x189603FC8]);
      if ((v121 & 1) == 0) {
        *(void *)(v1 + 248) = _PF_Leopard_CFDictionaryCreate();
      }
      *(void *)(v1 + 72) = objc_opt_new();
      *(void *)(v1 + 80) = objc_opt_new();
      *(void *)(v1 + 96) = 0LL;
      *(void *)(v1 + 88) = 0LL;
      *(void *)(v1 + 104) = 0LL;
      *(void *)(v1 + 112) = 0LL;
      uint64_t v18 = -[NSSQLEntityKey initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLEntityKey),  "initWithEntity:propertyDescription:",  v1,  0LL);
      *(void *)(v1 + 136) = v18;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v18);
      objc_msgSend( *(id *)(v1 + 40),  "setObject:forKey:",  *(void *)(v1 + 136),  objc_msgSend(*(id *)(v1 + 136), "name"));
      if ((v121 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue( *(void **)(v1 + 248),  (__CFString *)[*(id *)(v1 + 136) name],  *(const void **)(v1 + 136));
      }

      uint64_t v19 = -[NSSQLPrimaryKey initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLPrimaryKey),  "initWithEntity:propertyDescription:",  v1,  0LL);
      *(void *)(v1 + 128) = v19;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v19);
      objc_msgSend( *(id *)(v1 + 40),  "setObject:forKey:",  *(void *)(v1 + 128),  objc_msgSend(*(id *)(v1 + 128), "name"));
      if ((v121 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue( *(void **)(v1 + 248),  (__CFString *)[*(id *)(v1 + 128) name],  *(const void **)(v1 + 128));
      }

      uint64_t v20 = -[NSSQLOptLockKey initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLOptLockKey),  "initWithEntity:propertyDescription:",  v1,  0LL);
      *(void *)(v1 + 144) = v20;
      -[NSSQLEntity _addColumnToFetch:]((void *)v1, v20);
      objc_msgSend( *(id *)(v1 + 40),  "setObject:forKey:",  *(void *)(v1 + 144),  objc_msgSend(*(id *)(v1 + 144), "name"));
      if ((v121 & 1) == 0) {
        _PF_Leopard_CFDictionarySetValue( *(void **)(v1 + 248),  (__CFString *)[*(id *)(v1 + 144) name],  *(const void **)(v1 + 144));
      }

      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSSQLStoreMappingGenerator);
    }

    *(void *)(v1 + *(int *)(v6 + 3832)) = v21;
    if ((v121 & 1) != 0) {
      v122 = 0LL;
    }
    else {
      v122 = (__int128 *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
    if (v120)
    {
      v119 = (unsigned int *)[v118 _newSnowLeopardStyleDictionaryContainingPropertiesOfType:1];
      v117 = &v116;
      uint64_t v34 = v119[2];
      uint64_t v35 = MEMORY[0x1895F8858](v119);
      uint64_t v37 = (id *)((char *)&v116 - v36);
      _PF_SnowLeopard_CFDictionaryGetValues(v35, (uint64_t)&v116 - v36);
    }

    else
    {
      v119 = (unsigned int *)[v118 _newMappingForPropertiesOfRange:1];
      uint64_t v34 = [v119 count];
      v117 = &v116;
      MEMORY[0x1895F8858](v34);
      uint64_t v37 = (id *)((char *)&v116 - v39);
      [v119 getObjects:(char *)&v116 - v39];
    }

    if (v34)
    {
      *(void *)&__int128 v38 = 138412546LL;
      __int128 v116 = v38;
      do
      {
        id v40 = *v37;
        if ((objc_msgSend(*v37, "isTransient", (void)v116, *((void *)&v116 + 1)) & 1) == 0)
        {
          if (v40 && [v40 attributeType] == 2100)
          {
            id v41 = objc_alloc_init(MEMORY[0x189603FA8]);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              *(void *)buf = 0LL;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3052000000LL;
              v140 = __Block_byref_object_copy__24;
              v141 = __Block_byref_object_dispose__24;
              v129[0] = MEMORY[0x1895F87A8];
              v129[1] = 3221225472LL;
              v130 = __34__NSSQLEntity__generateProperties__block_invoke;
              v131 = &unk_189EA9C48;
              id v135 = v40;
              v136 = buf;
              uint64_t v132 = v1;
              id v133 = v41;
              char v137 = v121;
              v134 = v122;
              v142 = v129;
              uint64_t v42 = [v40 elements];
              uint64_t v43 = [v40 name];
              v130((uint64_t)v129, (void *)v42, v43);
              uint64_t v44 = [v40 name];
              if (v44)
              {
                v45 = (void *)[*(id *)(v1 + 272) objectForKey:v44];
                if (v45)
                {
                  [v45 addObjectsFromArray:v41];
                }

                else
                {
                  uint64_t v63 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:v41];
                  [*(id *)(v1 + 272) setObject:v63 forKey:v44];
                }
              }

              _Block_object_dispose(buf, 8);
            }

            else
            {
              uint64_t v48 = [NSString stringWithUTF8String:"Unexpected multi-column attribute description class (expected %@): %@"];
              v49 = (objc_class *)objc_opt_class();
              uint64_t v50 = NSStringFromClass(v49);
              uint64_t v51 = (objc_class *)objc_opt_class();
              NSStringFromClass(v51);
              _NSCoreDataLog(17LL, v48, v52, v53, v54, v55, v56, v57, (uint64_t)v50);
              uint64_t v58 = (os_log_s *)__pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                uint64_t v59 = (objc_class *)objc_opt_class();
                v60 = NSStringFromClass(v59);
                signed int v61 = (objc_class *)objc_opt_class();
                v62 = NSStringFromClass(v61);
                *(_DWORD *)buf = v116;
                *(void *)&buf[4] = v60;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v62;
                _os_log_fault_impl( &dword_186681000,  v58,  OS_LOG_TYPE_FAULT,  "CoreData: Unexpected multi-column attribute description class (expected %@): %@",  buf,  0x16u);
              }
            }
          }

          else
          {
            uint64_t v46 = [v40 name];
            if (![*(id *)(v1 + 40) objectForKey:v46])
            {
              uint64_t v47 = -[NSSQLAttribute initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLAttribute),  "initWithEntity:propertyDescription:",  v1,  v40);
              -[NSSQLEntity _addColumnToFetch:]((void *)v1, v47);
              [*(id *)(v1 + 40) setObject:v47 forKey:v46];
              if ((v121 & 1) == 0) {
                [v122 setObject:v47 forKey:v46];
              }
              if ([v40 _propertyType] == 6) {
                -[NSSQLEntity addDerivedAttribute:](v1, (uint64_t)v47);
              }
            }
          }
        }

        ++v37;
        --v34;
      }

      while (v34);
    }

    if ((v120 & 1) != 0) {
      _PF_SnowLeopard_CFDictionaryDestroy((uint64_t)v119);
    }
    else {

    }
    if ((v121 & 1) == 0)
    {
      unint64_t v65 = *v124;
      if ((uint64_t)*v124 >= 1)
      {
        MEMORY[0x1895F8858](v64);
        v67 = (char *)&v116 - v66;
        if (v65 > 0x200) {
          v67 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v116 - v66, 8 * v65);
        }
        uint64_t v68 = v124[1];
        if (v68 > 0)
        {
          uint64_t v69 = 0LL;
          v70 = (uint64_t *)v124[9];
          do
          {
            uint64_t v72 = *v70++;
            uint64_t v71 = v72;
            unint64_t v73 = v124[8];
            if (v73 != v72 && v71 != ~v73) {
              *(void *)&v67[8 * v69++] = v71;
            }
            --v68;
          }

          while (v68);
        }

        uint64_t v75 = 0LL;
        do
        {
          __int128 v76 = (void *)_PF_Leopard_CFDictionaryGetValue(v124, *(__CFString **)&v67[8 * v75]);
          if (([v76 isTransient] & 1) == 0)
          {
            __int128 v77 = (__CFString *)[v76 name];
            __int128 v78 = (const void *)[v122 objectForKey:v77];
            if (v78) {
              _PF_Leopard_CFDictionarySetValue(*(void **)(v1 + 248), v77, v78);
            }
          }

          ++v75;
        }

        while (v65 != v75);
        if (v65 >= 0x201) {
          NSZoneFree(0LL, v67);
        }
      }

      [v122 removeAllObjects];
    }

    if (v120)
    {
      __int128 v79 = (unsigned int *)[v118 _newSnowLeopardStyleDictionaryContainingPropertiesOfType:2];
      uint64_t v80 = v79[2];
      uint64_t v81 = MEMORY[0x1895F8858](v79);
      __int128 v83 = (id *)((char *)&v116 - v82);
      _PF_SnowLeopard_CFDictionaryGetValues(v81, (uint64_t)&v116 - v82);
    }

    else
    {
      __int128 v79 = (unsigned int *)[v118 _newMappingForPropertiesOfRange:2];
      uint64_t v80 = [v79 count];
      MEMORY[0x1895F8858](v80);
      __int128 v83 = (id *)((char *)&v116 - v84);
      [v79 getObjects:(char *)&v116 - v84];
    }

    for (; v80; --v80)
    {
      id v85 = *v83;
      if (([*v83 isTransient] & 1) == 0)
      {
        uint64_t v86 = [v85 name];
        if (![*(id *)(v1 + 40) objectForKey:v86])
        {
          if ([v85 maxCount] == 1)
          {
            v87 = -[NSSQLToOne initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLToOne),  "initWithEntity:propertyDescription:",  v1,  v85);
            v88 = -[NSSQLToOne foreignKey](v87, "foreignKey");
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKey:", v88, objc_msgSend(v88, "name"));
            if ((v121 & 1) == 0)
            {
              uint64_t v89 = [v88 name];
              [v122 setObject:v88 forKey:v89];
            }

            -[NSSQLEntity _addColumnToFetch:]((void *)v1, v88);
            if (!v87) {
              goto LABEL_121;
            }
            foreignEntityKey = v87->_foreignEntityKey;
            if (foreignEntityKey)
            {
              objc_msgSend( *(id *)(v1 + 40),  "setObject:forKey:",  foreignEntityKey,  -[NSSQLForeignEntityKey name](v87->_foreignEntityKey, "name"));
              if ((v121 & 1) == 0)
              {
                uint64_t v91 = -[NSSQLForeignEntityKey name](foreignEntityKey, "name");
                [v122 setObject:foreignEntityKey forKey:v91];
              }

              -[NSSQLEntity _addColumnToFetch:]((void *)v1, foreignEntityKey);
            }
          }

          else
          {
            v92 = (void *)[v85 inverseRelationship];
            if (!v92 || (uint64_t v93 = [v92 maxCount], v94 = off_189EA5590, v93 == 1)) {
              v94 = off_189EA5598;
            }
            v87 = (NSSQLToOne *)[objc_alloc(*v94) initWithEntity:v1 propertyDescription:v85];
            if (!v87) {
              goto LABEL_121;
            }
          }

          [*(id *)(v1 + 40) setObject:v87 forKey:v86];
          if ((v121 & 1) == 0) {
            [v122 setObject:v87 forKey:v86];
          }
        }
      }

uint64_t __34__NSSQLEntity__generateProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (result)
  {
    uint64_t v6 = result;
    id v7 = &off_189EA5000;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(a2);
        }
        unint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
          (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v10, a3);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
            uint64_t v13 = v7;
            uint64_t v14 = [v10 elements];
            uint64_t v15 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v10, "name")];
            uint64_t v16 = v14;
            id v7 = v13;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v16, v15);
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uint64_t v17 = [v10 name];
              uint64_t v18 = (__CFString *)[NSString stringWithFormat:@"%@.%@", a3, v17];
              if (![*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v18])
              {
                uint64_t v19 = -[NSSQLAttribute initWithEntity:propertyDescription:]( objc_alloc(&OBJC_CLASS___NSSQLAttribute),  "initWithEntity:propertyDescription:",  *(void *)(a1 + 32),  v10);
                -[NSSQLEntity _addColumnToFetch:](*(void **)(a1 + 32), v19);
                [*(id *)(a1 + 40) addObject:v19];
                [*(id *)(*(void *)(a1 + 32) + 40) setObject:v19 forKey:v18];
                if (!*(_BYTE *)(a1 + 72)) {
                  [*(id *)(a1 + 48) setObject:v19 forKey:v18];
                }
                if ([*(id *)(a1 + 56) _propertyType] == 6) {
                  -[NSSQLEntity addDerivedAttribute:](*(void *)(a1 + 32), (uint64_t)v19);
                }
                _PF_Leopard_CFDictionarySetValue(*(void **)(*(void *)(a1 + 32) + 248LL), v18, v19);
              }
            }
          }
        }

        ++v9;
      }

      while (v6 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v6 = result;
    }

    while (result);
  }

  return result;
}

- (uint64_t)addDerivedAttribute:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 256);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
      *(void *)(v3 + 256) = v4;
    }

    return [v4 addObject:a2];
  }

  return result;
}

- (uint64_t)_generateIDWithSuperEntity:(int)a3 nextID:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = (void *)[(id)a1 entityDescription];
  if (a2)
  {
    *(void *)(a1 + 168) = [a2 rootEntity];
    *(void *)(a1 + 160) = a2;
    -[NSSQLEntity _addSubentity:]((uint64_t)a2, a1);
  }

  else
  {
    *(void *)(a1 + 168) = a1;
  }

  *(_DWORD *)(a1 + 184) = a3;
  uint64_t v7 = [(id)a1 model];
  if (v7)
  {
    [*(id *)(v7 + 32) addObject:a1];
    CFRetain((CFTypeRef)a1);
  }

  uint64_t v8 = (a3 + 1);
  uint64_t v9 = -[NSEntityDescription _sortedSubentities](v6);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v8 = -[NSSQLEntity _generateIDWithSuperEntity:nextID:]( objc_msgSend( *(id *)(a1 + 16),  "entityNamed:",  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "name")),  a1,  v8);
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v11);
  }

  *(_DWORD *)(a1 + 188) = v8 - 1;
  return v8;
}

- (void)_organizeConstraints
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 216) count];
    if (!*(void *)(a1 + 160) && v2 != 0)
    {
      CFIndex v4 = v2;
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v2];
      keyCallBacks.version = *MEMORY[0x189605240];
      *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x189605240] + 8LL);
      uint64_t v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605240] + 24LL);
      keyCallBacks.equal = 0LL;
      keyCallBacks.hash = 0LL;
      keyCallBacks.copyDescription = v6;
      CFIndex v19 = v4;
      uint64_t v7 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], v4, &keyCallBacks, MEMORY[0x189605250]);
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v20 = a1;
      obuint64_t j = *(id *)(a1 + 216);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = (void *)objc_msgSend( *(id *)(*((void *)&v26 + 1) + 8 * i),  "sortedArrayUsingDescriptors:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607A20], "sortDescriptorWithKey:ascending:", @"name", 1)));
            uint64_t v13 = (const void *)objc_msgSend( (id)objc_msgSend(v12, "valueForKey:", @"columnName"),  "componentsJoinedByString:",  @"_");
            [v5 addObject:v13];
            CFDictionaryAddValue(v7, v13, v12);
          }

          uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
        }

        while (v9);
      }

      [v5 sortUsingComparator:&__block_literal_global_37];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v19];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      uint64_t v15 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (uint64_t j = 0LL; j != v16; ++j)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(v14, "addObject:", CFDictionaryGetValue(v7, *(const void **)(*((void *)&v22 + 1) + 8 * j)));
          }

          uint64_t v16 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
        }

        while (v16);
      }

      *(void *)(v20 + 216) = v14;
      CFRelease(v7);
    }
  }

uint64_t __35__NSSQLEntity__organizeConstraints__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_generateMulticolumnUniquenessConstraints
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result rootEntity];
    if (v2) {
      uint64_t v15 = *(void **)(v2 + 216);
    }
    else {
      uint64_t v15 = 0LL;
    }
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v3 = [v1 entityDescription];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 128);
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    uint64_t result = (id *)[v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (result)
    {
      uint64_t v6 = result;
      obuint64_t j = v5;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v7);
          if ((unint64_t)[v8 count] >= 2)
          {
            id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
            [v15 addObject:v9];

            __int128 v20 = 0u;
            __int128 v21 = 0u;
            __int128 v18 = 0u;
            __int128 v19 = 0u;
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v19;
              do
              {
                for (uint64_t i = 0LL; i != v11; ++i)
                {
                  if (*(void *)v19 != v12) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v14 = (void *)[v1[5] objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * i)];
                  [v14 setConstrained:1];
                  [v9 addObject:v14];
                }

                uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }

              while (v11);
            }
          }

          uint64_t v7 = (id *)((char *)v7 + 1);
        }

        while (v7 != v6);
        uint64_t result = (id *)[obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v6 = result;
      }

      while (result);
    }
  }

  return result;
}

- (uint64_t)_collectFKSlots:(void *)a3 error:
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v6 = objc_alloc_init(MEMORY[0x189607938]);
  uint64_t v7 = (void *)[*(id *)(a1 + 160) foreignKeyColumns];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v22 = a1;
  uint64_t v8 = *(void **)(a1 + 96);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = [v13 slot];
        if ([a2 containsIndex:v14]
          && ([v7 containsObject:v13] & 1) == 0)
        {
          if (a3) {
            *a3 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134060,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  objc_msgSend((id)objc_msgSend(v13, "toOneRelationship"), "propertyDescription"),  @"relationship"));
          }
          goto LABEL_22;
        }

        [v6 addIndex:v14];
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  [v6 addIndexes:a2];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v15 = *(void **)(v22 + 152);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_13:
    uint64_t v19 = 0LL;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v15);
      }
      if ((-[NSSQLEntity _collectFKSlots:error:](*(void *)(*((void *)&v23 + 1) + 8 * v19), v6, a3) & 1) != 0) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        uint64_t v20 = 0LL;
        if (v17) {
          goto LABEL_13;
        }
        goto LABEL_23;
      }
    }

- (uint64_t)_entityIsBroken:(uint64_t)a1
{
  if (!a1 || *(void *)(a1 + 168) != a1) {
    return 0LL;
  }
  id v5 = objc_alloc_init(MEMORY[0x189607938]);
  uint64_t v6 = -[NSSQLEntity _collectFKSlots:error:](a1, v5, a2);

  return v6;
}

- (NSSQLEntity_DerivedAttributesExtension)derivedAttributesExtension
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (NSSQLEntity_DerivedAttributesExtension *)result[6]._triggerSQL;
    if (!result)
    {
      uint64_t result = -[NSSQLEntity_DerivedAttributesExtension initWithEntity:]( objc_alloc(&OBJC_CLASS___NSSQLEntity_DerivedAttributesExtension),  "initWithEntity:",  v1);
      v1[6]._triggerSQL = (NSMutableArray *)result;
    }
  }

  return result;
}

- (uint64_t)_generateAttributeDerivations:(uint64_t)result
{
  uint64_t v145 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = (NSSQLEntity_DerivedAttributesExtension *)result;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  uint64_t v4 = *(void **)(result + 256);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v111 objects:v144 count:16];
  if (!v5) {
    return 1LL;
  }
  uint64_t v6 = v5;
  uint64_t v100 = a2;
  unint64_t v7 = 0x189603000uLL;
  uint64_t v8 = (void *)MEMORY[0x189604A58];
  uint64_t v9 = *(void *)v112;
  uint64_t v10 = &OBJC_IVAR____NSPersistentHistoryToken__storeTokens;
  while (2)
  {
    uint64_t v11 = 0LL;
    do
    {
      if (*(void *)v112 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v105 = v11;
      uint64_t v12 = *(void **)(*((void *)&v111 + 1) + 8 * v11);
      uint64_t v13 = (void *)[*(id *)(v7 + 4064) set];
      uint64_t v14 = (char *)[v12 propertyDescription];
      uint64_t v110 = 0LL;
      uint64_t v15 = (void *)objc_msgSend( (id)objc_msgSend(v14, "derivationExpression"),  "_keypathsForDerivedPropertyValidation:",  &v110);
      if (!v15)
      {
        uint64_t v55 = *MEMORY[0x189603A60];
        uint64_t v56 = *MEMORY[0x189607798];
        v142[0] = @"derived attribute";
        v142[1] = v56;
        v143[0] = v14;
        v143[1] = v110;
        uint64_t v57 = objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  v55,  @"Invalid keypaths found in derived attribute (derivationExpression)",  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v143, v142, 2));
        uint64_t v58 = *MEMORY[0x189607460];
        v140 = @"NSUnderlyingException";
        uint64_t v141 = v57;
        uint64_t v36 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v58,  134097,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
        if (!v36)
        {
          uint64_t v59 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog( 17LL,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m");
          uint64_t v44 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            char v137 = "/Library/Caches/com.apple.xbs/Sources/Persistence/sqlcore/NSSQLEntity.m";
            __int16 v138 = 1024;
            int v139 = 1504;
LABEL_65:
            _os_log_fault_impl( &dword_186681000,  v44,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
          }

          return 0LL;
        }

- (uint64_t)sqlAttributesForCompositeAttributeName:(uint64_t)a1
{
  if (a1 && a2 && (uint64_t v2 = [*(id *)(a1 + 272) objectForKey:a2]) != 0) {
    return [MEMORY[0x189603F18] arrayWithArray:v2];
  }
  else {
    return 0LL;
  }
}

- (id)rootEntity
{
  return self->_rootEntity;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  id v4 = -[NSSQLEntity name](self, "name");
  if (self) {
    uint64_t entityID = self->_entityID;
  }
  else {
    uint64_t entityID = 0LL;
  }
  return (id)[v3 stringWithFormat:@"<NSSQLEntity %@ id=%d>", v4, entityID];
}

- (void)rtreeIndexes
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[29];
    if (!result)
    {
      uint64_t result = objc_alloc_init(MEMORY[0x189603FC8]);
      v1[29] = result;
    }
  }

  return result;
}

- (id)indexForIndexDescription:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 && [a2[2] count] && !objc_msgSend((id)objc_msgSend(a2[2], "firstObject"), "collationType")) {
      return (id *) -[NSSQLIndex initForIndexDescription:sqlEntity:]( objc_alloc(&OBJC_CLASS___NSSQLBinaryIndex),  "initForIndexDescription:sqlEntity:",  a2,  v3);
    }
    else {
      return (id *)objc_msgSend(v3[29], "objectForKey:", objc_msgSend(a2, "name"));
    }
  }

  return result;
}

- (uint64_t)rtreeIndexForIndexNamed:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = *(void **)(a1 + 232);
  if (a2) {
    return [v3 objectForKey:a2];
  }
  if ([v3 count] == 1) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 232), "allValues"), "firstObject");
  }
  else {
    return 0LL;
  }
}

- (id)attributes
{
  while (self)
  {
    uint64_t v2 = (id *)self;
    self = (id)*((void *)self + 21);
    if (self == v2) {
      return v2[9];
    }
  }

  return self;
}

uint64_t __61__NSSQLEntity_DerivedAttributesExtension__generateTriggerSQL__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = +[NSSQLDerivedAttributeSQLGenerator generateSQLForDerivedAttribute:keypaths:]( (uint64_t)&OBJC_CLASS___NSSQLDerivedAttributeSQLGenerator,  a2,  a3);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = (void *)-[PFCloudKitImportZoneContext objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0LL, 0LL);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"dropStatements"),  "addObjectsFromArray:",  objc_msgSend( (id)-[PFCloudKitImportZoneContext objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1),  "valueForKey:",  @"dropStatements"));
  objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"dataStatements"),  "addObjectsFromArray:",  objc_msgSend( (id)-[PFCloudKitImportZoneContext objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1),  "valueForKey:",  @"dataStatements"));
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "valueForKey:", @"triggerCreationStatements"),  "addObjectsFromArray:",  objc_msgSend( (id)-[PFCloudKitImportZoneContext objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1),  "valueForKey:",  @"triggerCreationStatements"));
}

@end