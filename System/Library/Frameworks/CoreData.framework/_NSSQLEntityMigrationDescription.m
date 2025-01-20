@interface _NSSQLEntityMigrationDescription
- (NSSQLEntity)sourceEntity;
- (id)description;
- (uint64_t)_generateSQLValueMappingsWithMigrationContext:(uint64_t)result;
- (uint64_t)_populateSQLValuesForDestinationToOne:(void *)a3 fromSourceToOne:;
- (uint64_t)addedManyToManys;
- (uint64_t)removedManyToManys;
- (uint64_t)transformedManyToManys;
- (void)dealloc;
- (void)initWithEntityMapping:(void *)a3 sourceEntity:(void *)a4 destinationEntity:;
- (void)nextPropertyTransform;
- (void)validateCloudKitEntityMigration;
@end

@implementation _NSSQLEntityMigrationDescription

- (void)initWithEntityMapping:(void *)a3 sourceEntity:(void *)a4 destinationEntity:
{
  if (!a1) {
    return 0LL;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_CLASS____NSSQLEntityMigrationDescription;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[5] = a3;
    v7[4] = a4;
    *((_DWORD *)v7 + 12) = [a2 mappingType] - 2;
  }

  return v7;
}

- (void)dealloc
{
  self->_entityMapping = 0LL;
  self->_srcEntity = 0LL;

  self->_dstEntity = 0LL;
  self->_sqlValuesByColumnName = 0LL;

  self->_addedManyToManys = 0LL;
  self->_removedManyToManys = 0LL;

  self->_transformedManyToManys = 0LL;
  self->_processedTransforms = 0LL;

  self->_pendingTransforms = 0LL;
  self->_sourceEntitiesByToOneWithNewEntityKey = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLEntityMigrationDescription;
  -[_NSSQLEntityMigrationDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLEntityMigrationDescription;
  return (id)[NSString stringWithFormat:@"%@ : %@ -> %@", -[_NSSQLEntityMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_srcEntity, "name"), -[NSSQLEntity name](self->_dstEntity, "name")];
}

- (uint64_t)_generateSQLValueMappingsWithMigrationContext:(uint64_t)result
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v2 = result;
  objc_super v3 = -[NSEntityMapping _mappingsByName](*(void **)(result + 8));
  *(void *)(v2 + 80) = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  2 * objc_msgSend(v3, "count"));
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id obj = (id)[v3 allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v99 objects:v108 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v100;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v100 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v99 + 1) + 8 * v7);
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        __int128 v98 = 0u;
        if (v8) {
          objc_super v9 = *(void **)(v8 + 24);
        }
        else {
          objc_super v9 = 0LL;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v107 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v96;
          do
          {
            for (uint64_t i = 0LL; i != v11; ++i)
            {
              if (*(void *)v96 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v95 + 1) + 8 * i);
              if (v14 && *(void *)(v14 + 24))
              {
                v15 = *(void **)(v2 + 88);
                if (!v15)
                {
                  v15 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:4];
                  *(void *)(v2 + 88) = v15;
                }
              }

              else
              {
                v15 = *(void **)(v2 + 80);
              }

              [v15 addObject:v14];
            }

            uint64_t v11 = [v9 countByEnumeratingWithState:&v95 objects:v107 count:16];
          }

          while (v11);
        }

        ++v7;
      }

      while (v7 != v5);
      uint64_t v16 = [obj countByEnumeratingWithState:&v99 objects:v108 count:16];
      uint64_t v5 = v16;
    }

    while (v16);
  }

  v17 = *(void **)(v2 + 80);
  if (!*(void *)(v2 + 16)) {
    *(void *)(v2 + 16) = objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  2 * objc_msgSend(v17, "count"));
  }
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  id obja = (id)[v17 countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (!obja) {
    goto LABEL_88;
  }
  uint64_t v91 = *(void *)v104;
  id v89 = v17;
  do
  {
    v18 = 0LL;
    do
    {
      if (*(void *)v104 != v91) {
        objc_enumerationMutation(v89);
      }
      uint64_t v19 = *(void *)(*((void *)&v103 + 1) + 8LL * (void)v18);
      uint64_t v20 = *(void *)(v2 + 32);
      if (v19)
      {
        uint64_t v21 = *(void *)(v19 + 16);
        if (!v20) {
          goto LABEL_82;
        }
      }

      else
      {
        uint64_t v21 = 0LL;
        if (!v20)
        {
LABEL_82:
          if ((objc_msgSend(0, "isToMany", v21) & 1) == 0) {
            goto LABEL_117;
          }
          goto LABEL_79;
        }
      }

      v22 = (unsigned __int8 *)[*(id *)(v20 + 40) objectForKey:v21];
      if (!v22) {
        goto LABEL_82;
      }
      v23 = v22;
      int v24 = v22[24];
      if (v24 == 1)
      {
        v26 = 0LL;
        v25 = 0LL;
        v27 = 0LL;
      }

      else
      {
        if (v24 != 7)
        {
          if (([v22 isToMany] & 1) == 0 && v23[24] != 9)
          {
LABEL_117:
            v79 = (void *)MEMORY[0x189603F70];
            uint64_t v80 = *MEMORY[0x189603A58];
            uint64_t v81 = [MEMORY[0x189603F68] dictionaryWithObject:v19 forKey:@"transform"];
            v82 = @"Unrecognized destination property type in transform";
            goto LABEL_122;
          }

          goto LABEL_79;
        }

        v22 = (unsigned __int8 *)[v22 foreignKey];
        v25 = (void *)*((void *)v23 + 9);
        v26 = (void *)*((void *)v23 + 10);
        v27 = v22;
      }

      uint64_t v28 = [v22 columnName];
      if (v19) {
        v29 = *(void **)(v19 + 8);
      }
      else {
        v29 = 0LL;
      }
      uint64_t v30 = [v29 expressionType];
      if (v30 == 4)
      {
        if (!objc_msgSend(@"_prependExternalBlobToken:", "isEqual:", objc_msgSend(v29, "function")))
        {
LABEL_115:
          v79 = (void *)MEMORY[0x189603F70];
          uint64_t v80 = *MEMORY[0x189603A58];
          uint64_t v81 = [MEMORY[0x189603F68] dictionaryWithObject:v19 forKey:@"transform"];
          v82 = @"Unsupported value expression type in transform";
          goto LABEL_122;
        }

        if (v23[24] != 1)
        {
          v79 = (void *)MEMORY[0x189603F70];
          uint64_t v80 = *MEMORY[0x189603A58];
          uint64_t v81 = [MEMORY[0x189603F68] dictionaryWithObject:v19 forKey:@"transform"];
          v82 = @"Invalid source property type in transform";
          goto LABEL_122;
        }

        uint64_t v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "arguments"), "objectAtIndex:", 0), "keyPath");
        uint64_t v37 = *(void *)(v2 + 40);
        if (v37) {
          v38 = (void *)[*(id *)(v37 + 40) objectForKey:v36];
        }
        else {
          v38 = 0LL;
        }
        v39 = *(void **)(v2 + 16);
        uint64_t v40 = [NSString stringWithFormat:@"NSCoreDataPrependExternalReferenceMarker(length(%@), %@)", objc_msgSend(v38, "columnName"), objc_msgSend(v38, "columnName")];
        v41 = v39;
        goto LABEL_63;
      }

      if (v30 == 3)
      {
        uint64_t v42 = *(void *)(v2 + 40);
        uint64_t v43 = [v29 keyPath];
        if (v42) {
          v44 = (void *)[*(id *)(v42 + 40) objectForKey:v43];
        }
        else {
          v44 = 0LL;
        }
        if (a2
          && -[_NSSQLiteStoreMigrator enforceCloudKitConstraintsForEntity:]( a2,  (void *)[v23 entity])
          && !objc_msgSend((id)objc_msgSend(v44, "name"), "isEqualToString:", objc_msgSend(v23, "name")))
        {
          uint64_t v87 = [NSString stringWithFormat:@"Properties cannot be renamed in stores that are used with CloudKit. Cannot rename '%@.%@' to '%@.%@'.", objc_msgSend(*(id *)(v2 + 40), "name"), objc_msgSend(v44, "name"), objc_msgSend(*(id *)(v2 + 32), "name"), objc_msgSend(v23, "name")];
          id v88 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134110LL,  v87,  0LL);
          objc_exception_throw(v88);
LABEL_121:
          v79 = (void *)MEMORY[0x189603F70];
          uint64_t v80 = *MEMORY[0x189603A58];
          uint64_t v81 = [MEMORY[0x189603F68] dictionaryWithObject:v19 forKey:@"transform"];
          v82 = @"Unrecognized source property type in transform";
LABEL_122:
          v85 = v79;
          uint64_t v86 = v80;
LABEL_123:
          objc_exception_throw((id)[v85 exceptionWithName:v86 reason:v82 userInfo:v81]);
        }

        int v45 = v23[24];
        if (v45 != 7)
        {
          if (v45 != 1) {
            goto LABEL_121;
          }
          v46 = *(void **)(v2 + 16);
          uint64_t v40 = [v44 columnName];
          v41 = v46;
LABEL_63:
          [v41 setObject:v40 forKey:v28];
          goto LABEL_79;
        }

        uint64_t v55 = v2;
        v56 = v23;
        v54 = v44;
        goto LABEL_73;
      }

      if (v30) {
        goto LABEL_115;
      }
      int v31 = v23[24];
      if (v31 != 7)
      {
        if (v31 != 1)
        {
          v79 = (void *)MEMORY[0x189603F70];
          uint64_t v80 = *MEMORY[0x189603A58];
          uint64_t v81 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v19,  @"transform",  v23,  @"property",  0);
          v82 = @"Invalid constant expression type for property type in transform";
          goto LABEL_122;
        }

        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  [v29 constantValue],  objc_msgSend(v23, "sqlType"),  0);
        v33 = *(void **)(v2 + 16);
        v34 = v32;
        uint64_t v35 = v28;
        goto LABEL_78;
      }

      uint64_t v47 = objc_msgSend((id)objc_msgSend(v23, "propertyDescription"), "inverseRelationship");
      if (v47)
      {
        v48 = (void *)v47;
        v49 = (id *)objc_msgSend( (id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:]( a2,  (void *)objc_msgSend(v23, "destinationEntity")),  "sourceEntity");
        v50 = (void *)objc_msgSend( (id)objc_msgSend(v49, "entityDescription"),  "_propertyWithRenamingIdentifier:",  objc_msgSend(v48, "renamingIdentifier"));
        if (v50)
        {
          v51 = v50;
          if (![v50 inverseRelationship])
          {
            uint64_t v52 = [v51 name];
            if (v49)
            {
              uint64_t v53 = [v49[5] objectForKey:v52];
              if (v53)
              {
                v54 = *(_BYTE **)(v53 + 56);
                if (v54)
                {
                  if (v54[24] == 7)
                  {
                    uint64_t v55 = v2;
                    v56 = v23;
LABEL_73:
                    -[_NSSQLEntityMigrationDescription _populateSQLValuesForDestinationToOne:fromSourceToOne:]( v55,  v56,  v54);
                    goto LABEL_79;
                  }
                }
              }
            }
          }
        }
      }

      v57 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  0,  [v27 sqlType],  0);
      [*(id *)(v2 + 16) setObject:v57 forKey:v28];

      if (v25)
      {
        v58 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  0,  [v25 sqlType],  0);
        objc_msgSend(*(id *)(v2 + 16), "setObject:forKey:", v58, objc_msgSend(v25, "columnName"));
      }

      if (v26)
      {
        v32 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  0,  [v26 sqlType],  0);
        v59 = *(void **)(v2 + 16);
        uint64_t v35 = [v26 columnName];
        v33 = v59;
        v34 = v32;
LABEL_78:
        [v33 setObject:v34 forKey:v35];
      }

- (uint64_t)_populateSQLValuesForDestinationToOne:(void *)a3 fromSourceToOne:
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 16),  "setObject:forKey:",  objc_msgSend((id)objc_msgSend(a3, "foreignKey"), "columnName"),  objc_msgSend((id)objc_msgSend(a2, "foreignKey"), "columnName"));
  if (!a2) {
    return result;
  }
  uint64_t v7 = (void *)a2[9];
  uint64_t v8 = (void *)a2[10];
  if (!v7) {
    goto LABEL_11;
  }
  if (a3)
  {
    objc_super v9 = (void *)a3[9];
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 16);
      uint64_t v11 = [v9 columnName];
      uint64_t v12 = [v7 columnName];
      v13 = v10;
      uint64_t v14 = v11;
LABEL_10:
      uint64_t result = [v13 setObject:v14 forKey:v12];
LABEL_11:
      if (v8) {
        goto LABEL_12;
      }
      return result;
    }
  }

  uint64_t v15 = [a3 destinationEntity];
  if (v15) {
    uint64_t v16 = *(unsigned int *)(v15 + 184);
  }
  else {
    uint64_t v16 = 0LL;
  }
  v17 = -[NSSQLBindVariable initWithInt64:sqlType:]( [NSSQLBindVariable alloc],  "initWithInt64:sqlType:",  v16,  [v7 sqlType]);
  objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v17, objc_msgSend(v7, "columnName"));

  uint64_t v18 = [a3 destinationEntity];
  uint64_t v19 = *(void **)(a1 + 24);
  if (v19)
  {
    uint64_t v12 = [a2 name];
    v13 = v19;
    uint64_t v14 = v18;
    goto LABEL_10;
  }

  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithObjectsAndKeys:", v18, objc_msgSend(a2, "name"), 0);
  *(void *)(a1 + 24) = result;
  if (v8)
  {
LABEL_12:
    if (a3)
    {
      uint64_t v20 = (void *)a3[10];
      uint64_t v21 = *(void **)(a1 + 16);
      if (v20) {
        return objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v20, "columnName"), objc_msgSend(v8, "columnName"));
      }
    }

    else
    {
      uint64_t v21 = *(void **)(a1 + 16);
    }

    uint64_t v20 = (void *)[a3 foreignKey];
    return objc_msgSend(v21, "setObject:forKey:", objc_msgSend(v20, "columnName"), objc_msgSend(v8, "columnName"));
  }

  return result;
}

- (uint64_t)addedManyToManys
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 56))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredAddedPropertiesKey];
      *(void *)(v1 + 56) = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v3, "count"));
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      uint64_t v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && [*(id *)(*((void *)&v10 + 1) + 8 * v8) entity] == *(void *)(v1 + 32))
            {
            }

            ++v8;
          }

          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v6);
      }
    }

    return *(void *)(v1 + 56);
  }

  return result;
}

- (uint64_t)removedManyToManys
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 64))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredRemovedPropertiesKey];
      *(void *)(v1 + 64) = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v3, "count"));
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      uint64_t v4 = (void *)objc_msgSend(*(id *)(v1 + 40), "manyToManyRelationships", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0LL;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_super v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
            if (v9 && v9[8] && [*(id *)(*((void *)&v10 + 1) + 8 * v8) entity] == *(void *)(v1 + 40))
            {
            }

            ++v8;
          }

          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }

        while (v6);
      }
    }

    return *(void *)(v1 + 64);
  }

  return result;
}

- (uint64_t)transformedManyToManys
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 72))
    {
      uint64_t v2 = (void *)[*(id *)(result + 8) userInfo];
      objc_super v3 = (void *)[v2 objectForKey:_NSInferredMappedPropertiesKey];
      *(void *)(v1 + 72) = objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v3, "count"));
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      uint64_t v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "manyToManyRelationships", 0);
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
            objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
            if (v9
              && v9[8]
              && [*(id *)(*((void *)&v11 + 1) + 8 * v8) entity] == *(void *)(v1 + 32)
              && objc_msgSend(v3, "containsObject:", objc_msgSend(v9, "name")))
            {
              __int128 v10 = (__CFString *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:]( *(void *)(v1 + 40),  objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier"));
            }

            ++v8;
          }

          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v6);
      }
    }

    return *(void *)(v1 + 72);
  }

  return result;
}

- (void)nextPropertyTransform
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v2 = *(void **)(a1 + 88);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
          if (v7) {
            uint64_t v8 = *(void *)(v7 + 24);
          }
          else {
            uint64_t v8 = 0LL;
          }
          if ([*(id *)(a1 + 80) containsObject:v8])
          {
            [*(id *)(a1 + 80) addObject:v7];
            [*(id *)(a1 + 88) removeObject:v7];
            return;
          }

          ++v6;
        }

        while (v4 != v6);
        uint64_t v9 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v4 = v9;
      }

      while (v9);
    }

    if ([*(id *)(a1 + 88) count])
    {
      objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Entity mapping includes property transform with unresolved prerequisite",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  *(void *)(a1 + 88),  @"pendingTransforms")));
      -[_NSSQLEntityMigrationDescription validateCloudKitEntityMigration](v10, v11);
    }
  }

- (void)validateCloudKitEntityMigration
{
  uint64_t v2 = self;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v3 = (void *)-[_NSSQLEntityMigrationDescription transformedManyToManys]((uint64_t)self);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * v7) propertyDescription];
        }
        else {
          uint64_t v9 = 0LL;
        }
        if (objc_msgSend((id)objc_msgSend(v9, "renamingIdentifier"), "length"))
        {
          if (v8)
          {
            __int128 v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "name");
            SEL v11 = (void *)[v8 propertyDescription];
          }

          else
          {
            __int128 v10 = (void *)[0 name];
            SEL v11 = 0LL;
          }

          if ((objc_msgSend(v10, "isEqualToString:", objc_msgSend(v11, "renamingIdentifier")) & 1) == 0)
          {
            uint64_t v2 = (_NSSQLEntityMigrationDescription *)NSString;
            if (v8)
            {
              uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "renamingIdentifier");
              __int128 v14 = (void *)[v8 propertyDescription];
            }

            else
            {
              uint64_t v13 = [0 renamingIdentifier];
              __int128 v14 = 0LL;
            }

            uint64_t v19 = [v14 name];
            uint64_t v15 = -[_NSSQLEntityMigrationDescription stringWithFormat:]( v2,  "stringWithFormat:",  @"CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new relationships.",  v13,  v19,  (void)v21);
            goto LABEL_22;
          }
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v5 = v12;
    }

    while (v12);
  }

  if ((objc_msgSend( -[NSSQLEntity name](v2->_srcEntity, "name"),  "isEqualToString:",  -[NSSQLEntity name](v2->_dstEntity, "name")) & 1) == 0)
  {
    while (1)
    {
      uint64_t v17 = (void *)NSString;
      uint64_t v18 = -[NSSQLEntity name](v2->_srcEntity, "name");
      uint64_t v20 = -[NSSQLEntity name](v2->_dstEntity, "name");
      uint64_t v15 = [v17 stringWithFormat:@"CloudKit integration forbids renaming '%@' to '%@'. Older devices can't process the new records.", v18, v20, (void)v21];
LABEL_22:
      id v16 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  *MEMORY[0x189603A58],  134110LL,  v15,  0LL);
      objc_exception_throw(v16);
    }
  }

- (NSSQLEntity)sourceEntity
{
  return self->_srcEntity;
}

@end