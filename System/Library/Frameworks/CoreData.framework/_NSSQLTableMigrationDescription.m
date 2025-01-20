@interface _NSSQLTableMigrationDescription
- (NSSQLEntity)rootEntity;
- (NSSQLiteStatement)createInsertStatementForEntityMigration:(uint64_t)a3 migrationContext:;
- (NSSQLiteStatement)createUpdateStatementForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2;
- (NSSQLiteStatement)newCopyAndInsertStatementForToOne:(void *)a1 toManyToMany:(__CFString *)a2 fromTableName:(uint64_t)a3 invertColumns:(int)a4 migrationContext:(uint64_t)a5;
- (id)_sourceRootEntity;
- (id)createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:(uint64_t)a3 migrationContext:;
- (id)createFEKUpdateStatementsForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2;
- (id)description;
- (uint64_t)_doAttributesHaveChangesRequiringCopyForMigration:(uint64_t)a3 withContext:;
- (uint64_t)_doRelationshipsHaveChangesRequiringCopyForMigration:(uint64_t)a3 inContext:;
- (uint64_t)_ownSourceRootTableNeedsRenameInMigrationContext:(uint64_t)a1;
- (uint64_t)_transformedManyToManys;
- (uint64_t)addEntityMigrationDescription:(uint64_t)result;
- (uint64_t)appendStatementsToCompleteMigration:(uint64_t)a3 migrationContext:;
- (uint64_t)appendStatementsToCreateOrDropTables:(uint64_t)a3 migrationContext:;
- (uint64_t)appendStatementsToRenameTables:(uint64_t)a3 migrationContext:;
- (uint64_t)newCloudKitMetadataUpdateStatements:(uint64_t)a1;
- (void)_determineSchemaTransformationComplexityInMigrationContext:(id *)a1;
- (void)_retainedRemovedSubEntitiesOfEntity:(uint64_t)a1;
- (void)_sourceRootTableNameInMigrationContext:(uint64_t)a1;
- (void)_tempNameForTableName:(uint64_t)a1;
- (void)appendDefaultValueStatementsToCompleteMigration:(uint64_t)a3 migrationContext:;
- (void)appendStatementsToPerformMigration:(uint64_t)a3 migrationContext:;
- (void)dealloc;
- (void)initWithRootEntity:(int)a3 migrationType:;
@end

@implementation _NSSQLTableMigrationDescription

- (void)initWithRootEntity:(int)a3 migrationType:
{
  if (!a1) {
    return 0LL;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_CLASS____NSSQLTableMigrationDescription;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    *((_DWORD *)v5 + 6) = a3;
    v5[8] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:8];
    v5[12] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:4];
    v5[14] = objc_alloc_init(MEMORY[0x189603FE0]);
    v5[15] = objc_alloc_init(MEMORY[0x189603FE0]);
    v5[16] = objc_alloc_init(MEMORY[0x189603FE0]);
    v5[17] = objc_alloc_init(MEMORY[0x189603FE0]);
    v5[22] = objc_alloc_init(MEMORY[0x189603FE0]);
  }

  return v5;
}

- (void)dealloc
{
  self->_rootEntity = 0LL;
  self->_sourceRootEntity = 0LL;

  self->_migrationByEntity = 0LL;
  self->_addedEntityMigrations = 0LL;

  self->_removedEntityMigrations = 0LL;
  self->_copiedEntityMigrations = 0LL;

  self->_transformedEntityMigrations = 0LL;
  self->_addedManyToManys = 0LL;

  self->_removedManyToManys = 0LL;
  self->_transformedManyToManys = 0LL;

  self->_tempTableNames = 0LL;
  self->_hasComplexSchemaTransformations = 0LL;

  self->_addedColumnSet = 0LL;
  self->_renamedTableSet = 0LL;

  self->_renamedColumnSet = 0LL;
  self->_renamedMTMSet = 0LL;

  self->_delayedDropColumnSet = 0LL;
  self->_raisedColumnSet = 0LL;

  self->_droppedEntitySet = 0LL;
  self->_collapsedEntitySet = 0LL;

  self->_columnsUpgradedToMandatory = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLTableMigrationDescription;
  -[_NSSQLTableMigrationDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLTableMigrationDescription;
  return (id)[NSString stringWithFormat:@"%@ : %@ ", -[_NSSQLTableMigrationDescription description](&v3, sel_description), -[NSSQLEntity name](self->_rootEntity, "name")];
}

- (uint64_t)addEntityMigrationDescription:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      if (*(_DWORD *)(a2 + 48) == 1) {
        v4 = (void *)[(id)a2 sourceEntity];
      }
      else {
        v4 = *(void **)(a2 + 32);
      }
      objc_msgSend(*(id *)(v3 + 64), "setObject:forKey:", a2, objc_msgSend(v4, "name"));
      if (*(_BYTE *)(a2 + 96) && !*(void *)(v3 + 104)) {
        *(void *)(v3 + 104) = (id)[MEMORY[0x189607968] numberWithBool:1];
      }
      switch(*(_DWORD *)(a2 + 48))
      {
        case 0:
          goto LABEL_10;
        case 1:
          v5 = *(void **)(v3 + 40);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
            *(void *)(v3 + 40) = v5;
          }

          return [v5 addObject:a2];
        case 2:
          v5 = *(void **)(v3 + 48);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
            *(void *)(v3 + 48) = v5;
          }

          return [v5 addObject:a2];
        case 3:
          v5 = *(void **)(v3 + 56);
          if (!v5)
          {
            v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
            *(void *)(v3 + 56) = v5;
          }

          return [v5 addObject:a2];
        default:
          objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Unrecognized entity migration type",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  a2,  @"entityMigration")));
          result = -[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]( v6,  v7,  v8);
          break;
      }
    }

    else
    {
      objc_msgSend(*(id *)(result + 64), "setObject:forKey:", 0, objc_msgSend(0, "name"));
LABEL_10:
      v5 = *(void **)(v3 + 32);
      if (!v5)
      {
        v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
        *(void *)(v3 + 32) = v5;
      }

      return [v5 addObject:a2];
    }
  }

  return result;
}

- (uint64_t)_doAttributesHaveChangesRequiringCopyForMigration:(uint64_t)a3 withContext:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (a2) {
    v4 = (void *)a2[4];
  }
  else {
    v4 = 0LL;
  }
  uint64_t v5 = [a2 sourceEntity];
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  if (v4) {
    v4 = -[NSSQLEntity entitySpecificPropertiesPassing:]((uint64_t)v4, (uint64_t)&__block_literal_global_15_0);
  }
  uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "renamingIdentifier");
      if (objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace")) {
        uint64_t v10 = [NSString stringWithFormat:@"%@.%@", objc_msgSend((id)objc_msgSend(v9, "propertyDescription"), "_namespace"), v10];
      }
      v11 = (_BYTE *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v5, v10);
      if (v11)
      {
        v12 = v9;
LABEL_18:
        int v14 = [v11 propertyType];
        int v15 = objc_msgSend((id)objc_msgSend(v11, "columnName"), "isEqual:", objc_msgSend(v12, "columnName"));
        if ((v15 & 1) == 0)
        {
          if (!v12) {
            return 1LL;
          }
          uint64_t result = 1LL;
          if (!v11 || v12[24] != 1 || v11[24] != 1) {
            return result;
          }
          if (!objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "renamingIdentifier"),  "isEqualToString:",  objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "renamingIdentifier"))) {
            return 1LL;
          }
          v17 = *(void **)(a1 + 128);
          v36[0] = v11;
          v36[1] = v12;
          objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v36, 2));
        }

        if (objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "userInfo"),  "objectForKey:",  @"NSMigrationAllowTypeTransformation"))
        {
          int v18 = 0;
        }

        else
        {
          int v18 = v15;
        }

        if (v18 == 1
          && !objc_msgSend( (id)objc_msgSend(v11, "propertyDescription"),  "_isSchemaEqual:",  objc_msgSend(v12, "propertyDescription")))
        {
          return 1LL;
        }

        if (v15
          && objc_msgSend((id)objc_msgSend(v11, "propertyDescription"), "isOptional")
          && (objc_msgSend((id)objc_msgSend(v12, "propertyDescription"), "isOptional") & 1) == 0)
        {
          id v19 = *(id *)(a1 + 168);
          if (!v19)
          {
            id v19 = objc_alloc_init(MEMORY[0x189603FE0]);
            *(void *)(a1 + 168) = v19;
          }

          [v19 addObject:v12];
        }

        continue;
      }

      v12 = -[NSSQLEntity subhierarchyColumnMatching:](v5, v9);
      if (v12)
      {
        id v13 = *(id *)(a1 + 144);
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x189603FE0]);
          *(void *)(a1 + 144) = v13;
        }

        [v13 addObject:v12];
        goto LABEL_18;
      }

      if (a3)
      {
        v20 = *(void **)(a3 + 48);
        if (v20)
        {
          uint64_t v26 = 0LL;
          v27 = &v26;
          uint64_t v28 = 0x3052000000LL;
          v29 = __Block_byref_object_copy__33;
          v30 = __Block_byref_object_dispose__33;
          uint64_t v31 = 0LL;
          id v21 = -[NSSQLiteConnection fetchTableCreationSQL](v20);
          v25[0] = MEMORY[0x1895F87A8];
          v25[1] = 3221225472LL;
          v25[2] = __97___NSSQLTableMigrationDescription__doAttributesHaveChangesRequiringCopyForMigration_withContext___block_invoke;
          v25[3] = &unk_189EAA968;
          v25[4] = v5;
          v25[5] = &v26;
          [v21 enumerateObjectsUsingBlock:v25];
          v22 = (void *)v27[5];
          if (!v22
          {
            _Block_object_dispose(&v26, 8);
            return 1LL;
          }

          _Block_object_dispose(&v26, 8);
        }
      }

      [*(id *)(a1 + 112) addObject:v9];
    }

    uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    uint64_t result = 0LL;
    if (v6) {
      continue;
    }
    return result;
  }

- (uint64_t)_doRelationshipsHaveChangesRequiringCopyForMigration:(uint64_t)a3 inContext:
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  if (a2) {
    uint64_t v4 = a2[4];
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = [a2 sourceEntity];
  if (a3) {
    uint64_t v6 = *(void **)(a3 + 32);
  }
  else {
    uint64_t v6 = 0LL;
  }
  int v56 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v6, "sqlCore"), "options"),  "objectForKey:",  @"NSPersistentStoreDeferredLightweightMigrationOptionKey"),  "BOOLValue");
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  if (v4) {
    uint64_t v7 = -[NSSQLEntity entitySpecificPropertiesPassing:](v4, (uint64_t)&__block_literal_global_14);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t result = [v7 countByEnumeratingWithState:&v60 objects:v69 count:16];
  uint64_t v9 = a1;
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v55 = a3;
    uint64_t v59 = *(void *)v61;
    v57 = v7;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v61 != v59) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v60 + 1) + 8 * v11);
        uint64_t v13 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:]( v5,  objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "renamingIdentifier"));
        if (!v13)
        {
          if ([(id)v12 propertyType] != 7)
          {
            if (!v12) {
              goto LABEL_79;
            }
            goto LABEL_38;
          }

          if (!v12) {
            goto LABEL_79;
          }
          if (!*(_BYTE *)(v12 + 88)) {
            goto LABEL_38;
          }
          uint64_t v31 = [(id)v12 name];
          if (!v5 || (uint64_t v13 = [*(id *)(v5 + 40) objectForKey:v31]) == 0)
          {
            __int128 v32 = *(void **)(v12 + 56);
            uint64_t v33 = objc_msgSend( (id)-[_NSSQLiteStoreMigrator entityMigrationDescriptionForEntity:]( v55,  (void *)objc_msgSend(v32, "sourceEntity")),  "sourceEntity");
            uint64_t v34 = objc_msgSend((id)objc_msgSend(v32, "propertyDescription"), "renamingIdentifier");
            uint64_t v35 = v33;
            uint64_t v7 = v57;
            uint64_t v36 = -[NSSQLEntity _sqlPropertyWithRenamingIdentifier:](v35, v34);
            if (v36 && *(void *)(v36 + 56)) {
              return 1LL;
            }
LABEL_38:
            if (*(_BYTE *)(v12 + 24) == 7)
            {
              objc_msgSend(*(id *)(v9 + 112), "addObject:", objc_msgSend((id)v12, "foreignKey"));
              if (*(void *)(v12 + 72)) {
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
              }
              if (*(void *)(v12 + 80)) {
                objc_msgSend(*(id *)(v9 + 112), "addObject:");
              }
            }

            goto LABEL_79;
          }
        }

        int v14 = [(id)v13 propertyType];
        uint64_t v15 = [(id)v12 destinationEntity];
        uint64_t v16 = [(id)v13 destinationEntity];
        if (v14 == 7)
        {
          uint64_t v17 = v16;
          if (objc_msgSend((id)objc_msgSend((id)v13, "propertyDescription"), "isOptional")
            && !objc_msgSend((id)objc_msgSend((id)v12, "propertyDescription"), "isOptional"))
          {
            return 1LL;
          }

          int v18 = (void *)[(id)v13 foreignKey];
          uint64_t v19 = [(id)v12 foreignKey];
          if (v18)
          {
            v20 = (void *)v19;
            if (v19)
            {
              uint64_t v21 = [v18 columnName];
              uint64_t v22 = [v20 columnName];
              v23 = (void *)v21;
              uint64_t v9 = a1;
              if (([v23 isEqual:v22] & 1) == 0)
              {
                v24 = *(void **)(a1 + 128);
                v68[0] = v18;
                v68[1] = v20;
                uint64_t v25 = [MEMORY[0x189603F18] arrayWithObjects:v68 count:2];
                uint64_t v26 = v24;
                uint64_t v9 = a1;
                [v26 addObject:v25];
              }
            }
          }

          if (v15 && *(_DWORD *)(v15 + 188) != *(_DWORD *)(v15 + 184))
          {
            if (v17) {
              v37 = *(void **)(v17 + 152);
            }
            else {
              v37 = 0LL;
            }
            if (![v37 count])
            {
              if (v12) {
                uint64_t v29 = *(void *)(v12 + 72);
              }
              else {
                uint64_t v29 = 0LL;
              }
              v30 = *(void **)(v9 + 112);
              goto LABEL_55;
            }

            if (v12)
            {
              uint64_t v38 = *(void *)(v13 + 72);
              if (v38)
              {
                v39 = *(void **)(v12 + 72);
                if (v39)
                {
                  uint64_t v40 = [*(id *)(v13 + 72) columnName];
                  uint64_t v41 = [v39 columnName];
                  v42 = (void *)v40;
                  uint64_t v9 = a1;
                  if (([v42 isEqual:v41] & 1) == 0)
                  {
                    v43 = *(void **)(a1 + 128);
                    v66[0] = v38;
                    v66[1] = v39;
                    uint64_t v44 = [MEMORY[0x189603F18] arrayWithObjects:v66 count:2];
                    v45 = v43;
                    uint64_t v9 = a1;
                    [v45 addObject:v44];
                  }
                }
              }

              v46 = *(void **)(v13 + 80);
              goto LABEL_57;
            }

            BOOL v49 = 0;
            v48 = 0LL;
            v46 = *(void **)(v13 + 80);
          }

          else
          {
            if (v17 && *(_DWORD *)(v17 + 188) != *(_DWORD *)(v17 + 184))
            {
              int v27 = v56;
              if (!*(void *)(v13 + 72)) {
                int v27 = 0;
              }
              if (v27 != 1) {
                return 1LL;
              }
              uint64_t v28 = *(void **)(v9 + 176);
              uint64_t v67 = *(void *)(v13 + 72);
              uint64_t v29 = [MEMORY[0x189603F18] arrayWithObjects:&v67 count:1];
              v30 = v28;
LABEL_55:
              [v30 addObject:v29];
            }

            v46 = *(void **)(v13 + 80);
            if (v12)
            {
LABEL_57:
              char v47 = 0;
              v48 = *(void **)(v12 + 80);
              BOOL v49 = v48 != 0LL;
              if (!v46 && v48)
              {
                [*(id *)(v9 + 112) addObject:v48];
LABEL_75:
                if (*(_BYTE *)(v12 + 88))
                {
                  uint64_t v7 = v57;
                  if (!*(_BYTE *)(v13 + 88)) {
                    return 1LL;
                  }
                  goto LABEL_79;
                }

- (void)_determineSchemaTransformationComplexityInMigrationContext:(id *)a1
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  if (a1[13]) {
    return;
  }
  if ((objc_msgSend( (id)objc_msgSend(a1[1], "tableName"),  "isEqualToString:",  objc_msgSend(-[_NSSQLTableMigrationDescription _sourceRootEntity]((uint64_t)a1), "tableName")) & 1) == 0)
  {
    if (!objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a1[1], "entityDescription"), "renamingIdentifier"),  "isEqualToString:",  objc_msgSend((id)objc_msgSend(a1[2], "entityDescription"), "renamingIdentifier")))
    {
      uint64_t v51 = [objc_alloc(MEMORY[0x189607968]) initWithBool:1];
      goto LABEL_100;
    }

    id v3 = a1[15];
    int8x16_t v91 = vextq_s8(*(int8x16_t *)(a1 + 1), *(int8x16_t *)(a1 + 1), 8uLL);
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v91, 2));
  }

  if (![a1[5] count]
    || [a1[4] count]
    || [a1[7] count]
    || [a1[6] count])
  {
    a1[19] = objc_alloc_init(MEMORY[0x189603FE0]);
    a1[20] = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v4 = a1[5];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v81;
LABEL_11:
      uint64_t v7 = 0LL;
      while (1)
      {
        if (*(void *)v81 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v80 + 1) + 8 * v7) sourceEntity];
        uint64_t v9 = (void *)v8;
        uint64_t v10 = v8 ? -[NSSQLEntity entitySpecificPropertiesPassing:](v8, (uint64_t)&__block_literal_global_14) : 0LL;
        if ([v10 count]) {
          break;
        }
        uint64_t v11 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "userInfo"),  "objectForKey:",  @"NSEntityRenamingShouldRebaseKey");
        if (!v11
          || (v12 = objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", v11), uint64_t v13 = a1 + 20, (v12 & 1) == 0))
        {
          uint64_t v13 = a1 + 19;
        }

        [*v13 addObject:v9];
        if (v5 == ++v7)
        {
          uint64_t v14 = [v4 countByEnumeratingWithState:&v80 objects:v90 count:16];
          uint64_t v5 = v14;
          if (v14) {
            goto LABEL_11;
          }
          goto LABEL_24;
        }
      }
    }

    else
    {
LABEL_24:
      if (![a1[4] count]
        || [a1[5] count]
        || [a1[7] count]
        || [a1[6] count])
      {
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        obuint64_t j = a1[4];
        uint64_t v15 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v15)
        {
          uint64_t v57 = *(void *)v77;
          do
          {
            uint64_t v16 = 0LL;
            uint64_t v59 = v15;
            do
            {
              if (*(void *)v77 != v57) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void *)(*((void *)&v76 + 1) + 8 * v16);
              if (v17)
              {
                uint64_t v18 = *(void *)(v17 + 32);
                __int128 v72 = 0u;
                __int128 v73 = 0u;
                __int128 v74 = 0u;
                __int128 v75 = 0u;
                if (v18) {
                  uint64_t v19 = -[NSSQLEntity entitySpecificPropertiesPassing:](v18, (uint64_t)&__block_literal_global_14);
                }
                else {
                  uint64_t v19 = 0LL;
                }
              }

              else
              {
                uint64_t v19 = 0LL;
                __int128 v74 = 0u;
                __int128 v75 = 0u;
                __int128 v72 = 0u;
                __int128 v73 = 0u;
              }

              uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v88 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v73;
                do
                {
                  for (uint64_t i = 0LL; i != v20; ++i)
                  {
                    if (*(void *)v73 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                    if (v23)
                    {
                      int v24 = *(unsigned __int8 *)(v23 + 24);
                      if (v24 == 1) {
                        goto LABEL_47;
                      }
                      if (v24 == 7)
                      {
                        objc_msgSend( a1[14],  "addObject:",  objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * i), "foreignKey"));
                        if (*(void *)(v23 + 72)) {
                          objc_msgSend(a1[14], "addObject:");
                        }
                        uint64_t v23 = *(void *)(v23 + 80);
                        if (v23) {
LABEL_47:
                        }
                          [a1[14] addObject:v23];
                      }
                    }
                  }

                  uint64_t v20 = [v19 countByEnumeratingWithState:&v72 objects:v88 count:16];
                }

                while (v20);
              }

              ++v16;
            }

            while (v16 != v59);
            uint64_t v25 = [obj countByEnumeratingWithState:&v76 objects:v89 count:16];
            uint64_t v15 = v25;
          }

          while (v25);
        }

        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        id v26 = a1[6];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v87 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v69;
          while (2)
          {
            for (uint64_t j = 0LL; j != v27; ++j)
            {
              if (*(void *)v69 != v28) {
                objc_enumerationMutation(v26);
              }
              v30 = *(void **)(*((void *)&v68 + 1) + 8 * j);
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]( (uint64_t)a1,  v30,  a2)
                || -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]( (uint64_t)a1,  v30,  a2))
              {
                uint64_t v51 = [objc_alloc(MEMORY[0x189607968]) initWithBool:1];
                goto LABEL_100;
              }
            }

            uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v87 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        id v31 = a1[7];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v64 objects:v86 count:16];
        if (v32)
        {
          uint64_t v53 = v32;
          id v33 = *(id *)v65;
          uint64_t v34 = &__block_literal_global_14;
          id obja = *(id *)v65;
          do
          {
            uint64_t v35 = 0LL;
            do
            {
              if (*(id *)v65 != v33) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v64 + 1) + 8 * v35);
              if (v36) {
                uint64_t v37 = v36[4];
              }
              else {
                uint64_t v37 = 0LL;
              }
              uint64_t v38 = [*(id *)(*((void *)&v64 + 1) + 8 * v35) sourceEntity];
              __int128 v62 = 0u;
              __int128 v63 = 0u;
              __int128 v60 = 0u;
              __int128 v61 = 0u;
              uint64_t v58 = v35;
              v39 = v34;
              if (v38) {
                uint64_t v40 = -[NSSQLEntity entitySpecificPropertiesPassing:](v38, (uint64_t)v34);
              }
              else {
                uint64_t v40 = 0LL;
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v85 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v61;
                v52 = v31;
                do
                {
                  uint64_t v43 = 0LL;
                  do
                  {
                    if (*(void *)v61 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v44 = *(_BYTE **)(*((void *)&v60 + 1) + 8 * v43);
                    if (!-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:]( v37,  objc_msgSend((id)objc_msgSend(v44, "propertyDescription", v52), "renamingIdentifier")))
                    {
                      if (a2) {
                        v45 = *(void **)(a2 + 32);
                      }
                      else {
                        v45 = 0LL;
                      }
                      int v46 = objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v45, "sqlCore"), "options"),  "objectForKey:",  @"NSPersistentStoreDeferredLightweightMigrationOptionKey"),  "BOOLValue") ^ 1;
                      if (!v44) {
                        LOBYTE(v46) = 1;
                      }
                      if ((v46 & 1) != 0 || v44[24] != 1) {
                        goto LABEL_121;
                      }
                      id v47 = a1[22];
                      v84 = v44;
                      objc_msgSend( v47,  "addObject:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v84, 1));
                    }

                    ++v43;
                  }

                  while (v41 != v43);
                  uint64_t v48 = [v40 countByEnumeratingWithState:&v60 objects:v85 count:16];
                  uint64_t v41 = v48;
                  id v31 = v52;
                }

                while (v48);
              }

              uint64_t v34 = v39;
              id v33 = obja;
              if (-[_NSSQLTableMigrationDescription _doAttributesHaveChangesRequiringCopyForMigration:withContext:]( (uint64_t)a1,  v36,  a2)
                || -[_NSSQLTableMigrationDescription _doRelationshipsHaveChangesRequiringCopyForMigration:inContext:]( (uint64_t)a1,  v36,  a2))
              {
LABEL_121:
                uint64_t v51 = [objc_alloc(MEMORY[0x189607968]) initWithBool:1];
                goto LABEL_100;
              }

              uint64_t v35 = v58 + 1;
            }

            while (v58 + 1 != v53);
            uint64_t v49 = [v31 countByEnumeratingWithState:&v64 objects:v86 count:16];
            char v50 = 1;
            uint64_t v53 = v49;
          }

          while (v49);
        }

        else
        {
          char v50 = 1;
        }

        goto LABEL_101;
      }
    }

    uint64_t v51 = [objc_alloc(MEMORY[0x189607968]) initWithBool:1];
  }

  else
  {
    uint64_t v51 = [objc_alloc(MEMORY[0x189607968]) initWithBool:1];
  }

- (id)_sourceRootEntity
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id result = *(id *)(a1 + 16);
  if (!result)
  {
    id v3 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", objc_msgSend(*(id *)(a1 + 8), "name")),  "sourceEntity");
    if (!v3)
    {
      __int128 v10 = 0u;
      __int128 v11 = 0u;
      __int128 v8 = 0u;
      __int128 v9 = 0u;
      id v4 = *(void **)(a1 + 64);
      id v3 = (void *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3)
      {
        uint64_t v5 = (uint64_t)v3;
        uint64_t v6 = *(void *)v9;
LABEL_7:
        uint64_t v7 = 0LL;
        while (1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          id v3 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v7)),  "sourceEntity");
          if (v3) {
            break;
          }
          if (v5 == ++v7)
          {
            uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
            id v3 = 0LL;
            if (v5) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }

    id result = (id)[v3 rootEntity];
    *(void *)(a1 + 16) = result;
  }

  return result;
}

- (uint64_t)_ownSourceRootTableNeedsRenameInMigrationContext:(uint64_t)a1
{
  if (*(_DWORD *)(a1 + 24) < 2u) {
    return 0LL;
  }
  id v4 = *(void **)(a1 + 104);
  if (!v4)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a2);
    id v4 = *(void **)(a1 + 104);
  }

  return [v4 BOOLValue];
}

- (void)_sourceRootTableNameInMigrationContext:(uint64_t)a1
{
  do
  {
    if (!a1) {
      return 0LL;
    }
    uint64_t v3 = a1;
    id v4 = -[_NSSQLTableMigrationDescription _sourceRootEntity](a1);
    a1 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v4);
  }

  while (a1 != v3);
  uint64_t v5 = [v4 tableName];
  return (void *)v5;
}

- (void)_tempNameForTableName:(uint64_t)a1
{
  id v4 = (void *)[*(id *)(a1 + 96) objectForKey:a2];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(NSString) initWithFormat:@"_T_%@", a2];
    [*(id *)(a1 + 96) setObject:v4 forKey:a2];
  }

  return v4;
}

- (uint64_t)appendStatementsToRenameTables:(uint64_t)a3 migrationContext:
{
  uint64_t v149 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    if (!a3) {
      goto LABEL_134;
    }
    v103 = *(NSSQLiteStatement **)(a3 + 32);
LABEL_4:
    id v7 = -[_NSSQLTableMigrationDescription _sourceRootEntity](v6);
    uint64_t v99 = v6;
    if (-[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](v4, v7) != v6) {
      goto LABEL_5;
    }
    if (-[_NSSQLTableMigrationDescription _ownSourceRootTableNeedsRenameInMigrationContext:](v6, v4))
    {
      uint64_t v47 = [-[_NSSQLTableMigrationDescription _sourceRootEntity](v6) tableName];
      uint64_t v48 = -[_NSSQLTableMigrationDescription _tempNameForTableName:](v6, v47);
      uint64_t v49 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:](v103, v47, (uint64_t)v48);
      [a2 addObject:v49];

      __int128 v134 = 0u;
      __int128 v135 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      char v50 = *(void **)(v6 + 56);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v132 objects:v148 count:16];
      if (!v51) {
        goto LABEL_5;
      }
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v133;
      while (1)
      {
        for (uint64_t i = 0LL; i != v52; ++i)
        {
          if (*(void *)v133 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * i), "sourceEntity"),  "rootEntity");
          if (([v55 isEqual:-[_NSSQLTableMigrationDescription _sourceRootEntity](v6)] & 1) == 0)
          {
            uint64_t v95 = *MEMORY[0x189603A58];
            v96 = (void *)objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"Cannot merge multiple root entity source tables into one destination entity root table",  @"message",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  objc_msgSend((id)objc_msgSend(v55, "entityDescription"), "name"),  objc_msgSend( (id)objc_msgSend( -[_NSSQLTableMigrationDescription _sourceRootEntity](v6),  "entityDescription"),  "name"),  0),  @"sourceRootEntities",  objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "entityDescription"), "name"),  @"destinationRootEntity",  0);
            id v97 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v95,  134190LL,  (uint64_t)@"Cannot merge multiple root entity source tables into one destination entity root table",  v96);
            objc_exception_throw(v97);
LABEL_133:
            uint64_t v4 = MEMORY[0x189603F70];
            a2 = (void *)*MEMORY[0x189603A58];
            objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Unrecognized source property type for many-to-many migration",  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  v3,  @"sourceRelationship")));
LABEL_134:
            v103 = 0LL;
            goto LABEL_4;
          }
        }

        uint64_t v52 = [v50 countByEnumeratingWithState:&v132 objects:v148 count:16];
        if (!v52) {
          goto LABEL_5;
        }
      }
    }

    if ([*(id *)(v6 + 176) count])
    {
      uint64_t v102 = v4;
      uint64_t v56 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(MEMORY[0x189607AB8], "UUID"), "UUIDString"),  "stringByReplacingOccurrencesOfString:withString:",  @"-",  &stru_189EAC2E8);
      id v57 = -[_NSSQLTableMigrationDescription _sourceRootEntity](v6);
      uint64_t v58 = [v57 tableName];
      __int128 v128 = 0u;
      __int128 v129 = 0u;
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      id obja = *(id *)(v6 + 176);
      uint64_t v59 = [obja countByEnumeratingWithState:&v128 objects:v147 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v129;
        do
        {
          for (uint64_t j = 0LL; j != v60; ++j)
          {
            if (*(void *)v129 != v61) {
              objc_enumerationMutation(obja);
            }
            __int128 v63 = (void *)[objc_alloc(NSString) initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO _DEFERRED_%@__%@", v58, objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * j), "firstObject"), "columnName"), v56, objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * j), "firstObject"), "columnName")];
            __int128 v64 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v57,  v63);

            [a2 addObject:v64];
          }

          uint64_t v60 = [obja countByEnumeratingWithState:&v128 objects:v147 count:16];
        }

        while (v60);
      }

      uint64_t v6 = v99;
      if (v102) {
        *(_BYTE *)(v102 + 217) = 1;
      }
    }

    __int128 v65 = *(void **)(v6 + 120);
    if (v65)
    {
      if ([v65 count])
      {
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        __int128 v66 = *(void **)(v6 + 120);
        uint64_t v67 = [v66 countByEnumeratingWithState:&v124 objects:v146 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v125;
          do
          {
            for (uint64_t k = 0LL; k != v68; ++k)
            {
              if (*(void *)v125 != v69) {
                objc_enumerationMutation(v66);
              }
              __int128 v71 = -[NSSQLiteAdapter newRenameTableStatementFrom:to:]( v103,  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 0),  "tableName"),  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * k), "objectAtIndexedSubscript:", 1),  "tableName"));
              [a2 addObject:v71];
            }

            uint64_t v68 = [v66 countByEnumeratingWithState:&v124 objects:v146 count:16];
          }

          while (v68);
        }
      }
    }

    __int128 v72 = *(void **)(v6 + 128);
    if (v72)
    {
      if ([v72 count])
      {
        __int128 v73 = (void *)[(id)v99 rootEntity];
        uint64_t v74 = [v73 tableName];
        __int128 v75 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(v99 + 128), "sortedArrayUsingDescriptors:", MEMORY[0x189604A58]),  "sortedArrayUsingComparator:",  &__block_literal_global_19);
        __int128 v120 = 0u;
        __int128 v121 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        id objb = v75;
        uint64_t v76 = [v75 countByEnumeratingWithState:&v120 objects:v145 count:16];
        if (v76)
        {
          uint64_t v77 = v76;
          uint64_t v78 = *(void *)v121;
          do
          {
            for (uint64_t m = 0LL; m != v77; ++m)
            {
              if (*(void *)v121 != v78) {
                objc_enumerationMutation(objb);
              }
              __int128 v80 = *(void **)(*((void *)&v120 + 1) + 8 * m);
              __int128 v81 = (void *)[v80 firstObject];
              __int128 v82 = (void *)[v80 lastObject];
              if ([v81 propertyType] == 3)
              {
                __int128 v83 = -[NSSQLiteAdapter newDropIndexStatementForColumn:](v103, v81);
                [a2 addObject:v83];
              }

              v84 = (void *)[objc_alloc(NSString) initWithFormat:@"ALTER TABLE %@ RENAME COLUMN %@ TO %@", v74, objc_msgSend(v81, "columnName"), objc_msgSend(v82, "columnName")];
              v85 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v73,  v84);

              [a2 addObject:v85];
            }

            uint64_t v77 = [objb countByEnumeratingWithState:&v120 objects:v145 count:16];
          }

          while (v77);
        }
      }
    }

    uint64_t v6 = v99;
    v86 = *(void **)(v99 + 112);
    if (v86)
    {
      if ([v86 count])
      {
        v87 = (void *)[(id)v99 rootEntity];
        uint64_t v88 = [v87 tableName];
        __int128 v116 = 0u;
        __int128 v117 = 0u;
        __int128 v118 = 0u;
        __int128 v119 = 0u;
        id objc = *(id *)(v99 + 112);
        uint64_t v89 = [objc countByEnumeratingWithState:&v116 objects:v144 count:16];
        if (v89)
        {
          uint64_t v90 = v89;
          uint64_t v91 = *(void *)v117;
          do
          {
            for (uint64_t n = 0LL; n != v90; ++n)
            {
              if (*(void *)v117 != v91) {
                objc_enumerationMutation(objc);
              }
              v93 = (void *)[objc_alloc(NSString) initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ %@", v88, objc_msgSend(*(id *)(*((void *)&v116 + 1) + 8 * n), "columnName"), NSSQLiteAdapter_typeStringForSQLType(objc_msgSend(*(id *)(*((void *)&v116 + 1) + 8 * n), "sqlType"))];
              v94 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v87,  v93);

              [a2 addObject:v94];
            }

            uint64_t v90 = [objc countByEnumeratingWithState:&v116 objects:v144 count:16];
            uint64_t v6 = v99;
          }

          while (v90);
        }
      }
    }

- (uint64_t)_transformedManyToManys
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (*(_DWORD *)(a1 + 24) < 2u) {
    return 0LL;
  }
  if (!*(void *)(a1 + 88))
  {
    *(void *)(a1 + 88) = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v3 = *(void **)(a1 + 48);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(a1 + 88) addObjectsFromArray:-[_NSSQLEntityMigrationDescription transformedManyToManys](*(void *)(*((void *)&v17 + 1) + 8 * i))];
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v5);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v8 = *(void **)(a1 + 56);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t j = 0LL; j != v10; ++j)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 88) addObjectsFromArray:-[_NSSQLEntityMigrationDescription transformedManyToManys](*(void *)(*((void *)&v13 + 1) + 8 * j))];
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }

      while (v10);
    }
  }

  return *(void *)(a1 + 88);
}

- (uint64_t)appendStatementsToCreateOrDropTables:(uint64_t)a3 migrationContext:
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a2;
    uint64_t v5 = result;
    if (a3) {
      uint64_t v6 = *(NSSQLiteStatement **)(a3 + 32);
    }
    else {
      uint64_t v6 = 0LL;
    }
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    if (*(_DWORD *)(result + 24))
    {
      if (!*(void *)(result + 80))
      {
        *(void *)(result + 80) = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        obuint64_t j = *(id *)(v5 + 40);
        uint64_t v67 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (v67)
        {
          uint64_t v65 = *(void *)v90;
          do
          {
            for (uint64_t i = 0LL; i != v67; ++i)
            {
              if (*(void *)v90 != v65) {
                objc_enumerationMutation(obj);
              }
              __int128 v8 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * i) sourceEntity];
              __int128 v85 = 0u;
              __int128 v86 = 0u;
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              uint64_t v9 = (void *)[v8 manyToManyRelationships];
              uint64_t v10 = [v9 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v10)
              {
                uint64_t v11 = v10;
                uint64_t v12 = *(void *)v86;
                do
                {
                  for (uint64_t j = 0LL; j != v11; ++j)
                  {
                    if (*(void *)v86 != v12) {
                      objc_enumerationMutation(v9);
                    }
                    uint64_t v14 = *(void *)(*((void *)&v85 + 1) + 8 * j);
                    if (v14
                      && *(void *)(v14 + 64)
                      && (void *)[*(id *)(*((void *)&v85 + 1) + 8 * j) entity] == v8)
                    {
                      [*(id *)(v5 + 80) addObject:v14];
                    }
                  }

                  uint64_t v11 = [v9 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }

                while (v11);
              }
            }

            uint64_t v67 = [obj countByEnumeratingWithState:&v89 objects:v98 count:16];
          }

          while (v67);
        }

        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v15 = *(void **)(v5 + 56);
        uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v96 count:16];
        uint64_t v4 = a2;
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v82;
          do
          {
            for (uint64_t k = 0LL; k != v17; ++k)
            {
              if (*(void *)v82 != v18) {
                objc_enumerationMutation(v15);
              }
              [*(id *)(v5 + 80) addObjectsFromArray:-[_NSSQLEntityMigrationDescription removedManyToManys](*(void *)(*((void *)&v81 + 1) + 8 * k))];
            }

            uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v96 count:16];
          }

          while (v17);
        }
      }

      __int128 v20 = *(void **)(v5 + 80);
      uint64_t v3 = a3;
    }

    else
    {
      __int128 v20 = 0LL;
    }

    uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v95 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v78;
      do
      {
        for (uint64_t m = 0LL; m != v22; ++m)
        {
          if (*(void *)v78 != v23) {
            objc_enumerationMutation(v20);
          }
          char v25 = *(void **)(*((void *)&v77 + 1) + 8 * m);
          if (v25 && v25[8])
          {
            id v26 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:]( v6,  [v25 correlationTableName]);
            [v4 addObject:v26];
          }
        }

        uint64_t v22 = [v20 countByEnumeratingWithState:&v77 objects:v95 count:16];
      }

      while (v22);
    }

    uint64_t v27 = *(void **)(v5 + 104);
    if (!v27)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v5, v3);
      uint64_t v27 = *(void **)(v5 + 104);
    }

    int v28 = [v27 BOOLValue];
    int v29 = *(_DWORD *)(v5 + 24);
    if (v29 == 1) {
      int v30 = 0;
    }
    else {
      int v30 = v28;
    }
    if (!v29 || v30)
    {
      id v31 = -[NSSQLiteAdapter newCreateTableStatementForEntity:]((const __CFString *)v6, *(void **)(v5 + 8));
      [v4 addObject:v31];

      int v29 = *(_DWORD *)(v5 + 24);
    }

    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    if (v29 == 1)
    {
      uint64_t v32 = 0LL;
    }

    else
    {
      if (!*(void *)(v5 + 72))
      {
        uint64_t v61 = v4;
        *(void *)(v5 + 72) = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:8];
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        id obja = *(id *)(v5 + 32);
        uint64_t v68 = [obja countByEnumeratingWithState:&v89 objects:v98 count:16];
        if (v68)
        {
          uint64_t v66 = *(void *)v90;
          do
          {
            uint64_t v33 = 0LL;
            do
            {
              if (*(void *)v90 != v66) {
                objc_enumerationMutation(obja);
              }
              uint64_t v34 = *(void *)(*((void *)&v89 + 1) + 8 * v33);
              if (v34) {
                uint64_t v35 = *(void **)(v34 + 32);
              }
              else {
                uint64_t v35 = 0LL;
              }
              __int128 v87 = 0u;
              __int128 v88 = 0u;
              __int128 v85 = 0u;
              __int128 v86 = 0u;
              uint64_t v36 = (void *)[v35 manyToManyRelationships];
              uint64_t v37 = [v36 countByEnumeratingWithState:&v85 objects:v97 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v86;
                do
                {
                  for (uint64_t n = 0LL; n != v38; ++n)
                  {
                    if (*(void *)v86 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v41 = *(void *)(*((void *)&v85 + 1) + 8 * n);
                    if (v41
                      && *(void *)(v41 + 64)
                      && (void *)[*(id *)(*((void *)&v85 + 1) + 8 * n) entity] == v35)
                    {
                      [*(id *)(v5 + 72) addObject:v41];
                    }
                  }

                  uint64_t v38 = [v36 countByEnumeratingWithState:&v85 objects:v97 count:16];
                }

                while (v38);
              }

              ++v33;
            }

            while (v33 != v68);
            uint64_t v42 = [obja countByEnumeratingWithState:&v89 objects:v98 count:16];
            uint64_t v68 = v42;
          }

          while (v42);
        }

        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        uint64_t v43 = *(void **)(v5 + 56);
        uint64_t v44 = [v43 countByEnumeratingWithState:&v81 objects:v96 count:16];
        uint64_t v4 = v61;
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v82;
          do
          {
            for (iuint64_t i = 0LL; ii != v45; ++ii)
            {
              if (*(void *)v82 != v46) {
                objc_enumerationMutation(v43);
              }
              [*(id *)(v5 + 72) addObjectsFromArray:-[_NSSQLEntityMigrationDescription addedManyToManys](*(void *)(*((void *)&v81 + 1) + 8 * ii))];
            }

            uint64_t v45 = [v43 countByEnumeratingWithState:&v81 objects:v96 count:16];
          }

          while (v45);
        }
      }

      uint64_t v32 = *(void **)(v5 + 72);
    }

    uint64_t v48 = [v32 countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v74;
      do
      {
        for (juint64_t j = 0LL; jj != v49; ++jj)
        {
          if (*(void *)v74 != v50) {
            objc_enumerationMutation(v32);
          }
          uint64_t v52 = *(__CFString **)(*((void *)&v73 + 1) + 8 * jj);
          if (v52 && v52[2].isa)
          {
            uint64_t v53 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v52);
            [v4 addObject:v53];
          }
        }

        uint64_t v49 = [v32 countByEnumeratingWithState:&v73 objects:v94 count:16];
      }

      while (v49);
    }

    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    char v54 = (void *)-[_NSSQLTableMigrationDescription _transformedManyToManys](v5);
    id result = [v54 countByEnumeratingWithState:&v69 objects:v93 count:16];
    if (result)
    {
      uint64_t v55 = result;
      uint64_t v56 = *(void *)v70;
      do
      {
        uint64_t v57 = 0LL;
        do
        {
          if (*(void *)v70 != v56) {
            objc_enumerationMutation(v54);
          }
          uint64_t v58 = *(__CFString **)(*((void *)&v69 + 1) + 8 * v57);
          if (v58
            && v58[2].isa
            && ([*(id *)(v5 + 136) containsObject:*(void *)(*((void *)&v69 + 1) + 8 * v57)] & 1) == 0)
          {
            uint64_t v59 = -[NSSQLiteAdapter newCreateTableStatementForManyToMany:](v6, v58);
            [v4 addObject:v59];
          }

          ++v57;
        }

        while (v55 != v57);
        id result = [v54 countByEnumeratingWithState:&v69 objects:v93 count:16];
        uint64_t v55 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)appendStatementsToPerformMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  int v3 = *(_DWORD *)(a1 + 24);
  if (!v3) {
    return;
  }
  uint64_t v4 = (NSSQLiteStatement *)a3;
  if (v3 == 1)
  {
    if (a3) {
      uint64_t v4 = *(NSSQLiteStatement **)(a3 + 32);
    }
    uint64_t v67 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:](v4, [*(id *)(a1 + 8) tableName]);
    objc_msgSend(a2, "addObject:");

    return;
  }

  id v65 = objc_alloc_init(MEMORY[0x189603FA8]);
  unint64_t v5 = (unint64_t)objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v62 = (void *)v5;
  if ([*(id *)(a1 + 40) count])
  {
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v7 = [objc_alloc(MEMORY[0x189607940]) initWithString:@"DELETE FROM "];
    objc_msgSend((id)v7, "appendString:", objc_msgSend(*(id *)(a1 + 8), "tableName"));
    [(id)v7 appendString:@" WHERE "];
    [(id)v7 appendString:@"Z_ENT"];
    objc_msgSend((id)v7, "appendString:", @" IN (");
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v89;
      char v10 = 1;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v89 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v88 + 1) + 8 * v11) sourceEntity];
          if (v12) {
            uint64_t v13 = *(unsigned int *)(v12 + 184);
          }
          else {
            uint64_t v13 = 0LL;
          }
          if ((v10 & 1) != 0) {
            uint64_t v14 = @"%d";
          }
          else {
            uint64_t v14 = @",%d";
          }
          objc_msgSend((id)v7, "appendFormat:", v14, v13);
          char v10 = 0;
          ++v11;
        }

        while (v8 != v11);
        uint64_t v15 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
        uint64_t v8 = v15;
        char v10 = 0;
      }

      while (v15);
    }

    unint64_t v5 = (unint64_t)v62;
    [(id)v7 appendString:@""]);
    if (v4) {
      sqlString = (NSSQLiteStatement *)v4->_sqlString;
    }
    else {
LABEL_101:
    }
      sqlString = 0LL;
    uint64_t v17 = -[NSSQLiteAdapter newStatementWithSQLString:](sqlString, v7);

    [v65 addObject:v17];
  }

  uint64_t v18 = *(void **)(a1 + 104);
  if (!v18)
  {
    -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]( (id *)a1,  (uint64_t)v4);
    uint64_t v18 = *(void **)(a1 + 104);
  }

  if ([v18 BOOLValue])
  {
    if ([*(id *)(a1 + 56) count])
    {
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v19 = *(void **)(a1 + 56);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:v96 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v85;
        do
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if (*(void *)v85 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            int v24 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:]( a1,  v23,  (uint64_t)v4);
            [v65 addObject:v24];

            id v25 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:]( (uint64_t)v23,  (uint64_t)v4);
            if (v25)
            {
              [(id)v5 addObjectsFromArray:v25];
            }

            while (1)
            {
              id v26 = -[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:]( (uint64_t)v23,  (uint64_t)v4);
              if (!v26) {
                break;
              }
              [v6 addObject:v26];
            }
          }

          uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:v96 count:16];
        }

        while (v20);
      }
    }

    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    uint64_t v27 = *(void **)(a1 + 48);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v95 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v81;
      do
      {
        for (uint64_t j = 0LL; j != v28; ++j)
        {
          if (*(void *)v81 != v29) {
            objc_enumerationMutation(v27);
          }
          id v31 = -[_NSSQLTableMigrationDescription createInsertStatementForEntityMigration:migrationContext:]( a1,  *(void **)(*((void *)&v80 + 1) + 8 * j),  (uint64_t)v4);
          [v65 addObject:v31];
        }

        uint64_t v28 = [v27 countByEnumeratingWithState:&v80 objects:v95 count:16];
        unint64_t v5 = (unint64_t)v62;
      }

      while (v28);
    }
  }

  else
  {
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    uint64_t v32 = *(void **)(a1 + 48);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v77;
      do
      {
        for (uint64_t k = 0LL; k != v33; ++k)
        {
          if (*(void *)v77 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void *)(*((void *)&v76 + 1) + 8 * k);
          if (v36 && !*(void *)(v36 + 16)) {
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:]( *(void *)(*((void *)&v76 + 1) + 8 * k),  (uint64_t)v4);
          }
          id v37 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:]( v36,  (uint64_t)v4);
          if (v37)
          {
            [v62 addObjectsFromArray:v37];
          }
        }

        uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v94 count:16];
      }

      while (v33);
    }

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    uint64_t v38 = *(void **)(a1 + 56);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v72 objects:v93 count:16];
    unint64_t v5 = (unint64_t)v62;
    if (v39)
    {
      uint64_t v40 = *(void *)v73;
      do
      {
        for (uint64_t m = 0LL; m != v39; ++m)
        {
          if (*(void *)v73 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void *)(*((void *)&v72 + 1) + 8 * m);
          if (v42 && !*(void *)(v42 + 16)) {
            -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:]( *(void *)(*((void *)&v72 + 1) + 8 * m),  (uint64_t)v4);
          }
          id v43 = -[_NSSQLTableMigrationDescription createFEKUpdateStatementsForEntityMigration:migrationContext:]( v42,  (uint64_t)v4);
          if (v43)
          {
            [v62 addObjectsFromArray:v43];
          }

          while (1)
          {
            uint64_t v44 = -[_NSSQLTableMigrationDescription createUpdateStatementForEntityMigration:migrationContext:]( v42,  (uint64_t)v4);
            if (!v44) {
              break;
            }
            [v6 addObject:v44];
          }
        }

        uint64_t v39 = [v38 countByEnumeratingWithState:&v72 objects:v93 count:16];
      }

      while (v39);
    }
  }

  [a2 addObjectsFromArray:v65];
  [a2 addObjectsFromArray:v5];
  [a2 addObjectsFromArray:v6];
  unint64_t v5 = 0LL;

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v6 = (id)-[_NSSQLTableMigrationDescription _transformedManyToManys](a1);
  uint64_t v45 = [v6 countByEnumeratingWithState:&v68 objects:v92 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v69;
    do
    {
      uint64_t v47 = 0LL;
      do
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(v6);
        }
        uint64_t v48 = *(__CFString **)(*((void *)&v68 + 1) + 8 * v47);
        if (v48 && v48[2].isa)
        {
          uint64_t v49 = (_BYTE *)-[NSSQLEntity _sqlPropertyWithRenamingIdentifier:]( objc_msgSend( (id)objc_msgSend( *(id *)(a1 + 64),  "objectForKey:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v68 + 1) + 8 * v47), "entity"),  "name")),  "sourceEntity"),  objc_msgSend( (id)-[__CFString propertyDescription](v48, "propertyDescription"),  "renamingIdentifier"));
          uint64_t v7 = (uint64_t)v49;
          if (v49)
          {
            if (v49[24] == 9)
            {
              if ([*(id *)(a1 + 136) containsObject:v48]) {
                goto LABEL_93;
              }
              unint64_t v5 = v4 == 0LL;
              uint64_t v50 = -[_NSSQLTableMigrationDescription _tempNameForTableName:]( a1,  [(id)v7 correlationTableName]);
              int v51 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend((id)v7, "propertyDescription"), "renamingIdentifier"),  "isEqualToString:",  objc_msgSend( (id)-[__CFString propertyDescription](v48, "propertyDescription"),  "renamingIdentifier"));
              if (v4) {
                uint64_t v52 = (NSSQLiteStatement *)v4->_sqlString;
              }
              else {
                uint64_t v52 = 0LL;
              }
              uint64_t v53 = -[NSSQLiteAdapter newCopyAndInsertStatementForManyToMany:toManyToMany:intermediateTableName:invertColumns:]( v52,  (__CFString *)v7,  v48,  (uint64_t)v50,  v51 ^ 1u);
              goto LABEL_92;
            }

            if ([v49 isToMany])
            {
              char v54 = *(void **)(v7 + 56);
              goto LABEL_89;
            }

            if (*(_BYTE *)(v7 + 24) != 7) {
              goto LABEL_100;
            }
            uint64_t v57 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](a1, (uint64_t)v4);
            uint64_t v53 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:]( (void *)v7,  v48,  (uint64_t)v57,  0,  (uint64_t)v4);
          }

          else
          {
            if (([0 isToMany] & 1) == 0)
            {
LABEL_100:
              uint64_t v60 = (void *)MEMORY[0x189603F70];
              uint64_t v61 = [MEMORY[0x189603F68] dictionaryWithObject:v7 forKey:@"sourceRelationship"];
              objc_exception_throw((id)[v60 exceptionWithName:*MEMORY[0x189603A58] reason:@"Unrecognized source property type for many-to-many migration" userInfo:v61]);
              __break(1u);
              goto LABEL_101;
            }

            char v54 = 0LL;
LABEL_89:
            uint64_t v55 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:]( (uint64_t)v4,  (void *)[v54 entity]);
            uint64_t v56 = -[_NSSQLTableMigrationDescription _sourceRootTableNameInMigrationContext:](v55, (uint64_t)v4);
            uint64_t v53 = -[_NSSQLTableMigrationDescription newCopyAndInsertStatementForToOne:toManyToMany:fromTableName:invertColumns:migrationContext:]( v54,  v48,  (uint64_t)v56,  1,  (uint64_t)v4);
          }

- (NSSQLiteStatement)createInsertStatementForEntityMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v67 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (a2) {
    uint64_t v8 = (_DWORD *)a2[4];
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = [a2 sourceEntity];
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v63 = a1;
  uint64_t v64 = a3;
  uint64_t v65 = (uint64_t)a2;
  if (v10)
  {
    while (v10)
    {
      uint64_t v11 = v10;
      uint64_t v10 = *(void *)(v10 + 168);
      if (v10 == v11)
      {
        uint64_t v12 = *(void **)(v11 + 72);
        goto LABEL_7;
      }
    }
  }

  uint64_t v12 = 0LL;
LABEL_7:
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  uint64_t v13 = (void *)[v12 sortedArrayUsingFunction:sortColumnsByType context:0];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (!v14) {
    goto LABEL_42;
  }
  uint64_t v15 = *(void *)v73;
  while (2)
  {
    uint64_t v16 = 0LL;
    do
    {
      if (*(void *)v73 != v15) {
        objc_enumerationMutation(v13);
      }
      uint64_t v17 = *(unsigned __int8 **)(*((void *)&v72 + 1) + 8 * v16);
      if (!v17)
      {
LABEL_18:
        uint64_t v20 = [*(id *)(*((void *)&v72 + 1) + 8 * v16) entity];
        if (v8)
        {
          unsigned int v21 = v8[46];
          if (v20)
          {
            if (v21 < *(_DWORD *)(v20 + 184)) {
              goto LABEL_23;
            }
            unsigned int v22 = *(_DWORD *)(v20 + 188);
          }

          else
          {
            unsigned int v22 = 0;
          }

          if (v21 <= v22)
          {
            uint64_t v26 = [v17 columnName];
            if (!v65) {
              goto LABEL_41;
            }
            uint64_t v27 = v26;
            uint64_t v28 = *(void **)(v65 + 16);
            if (!v28)
            {
              -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](v65, v64);
              uint64_t v28 = *(void **)(v65 + 16);
            }

            int v24 = (const __CFString *)[v28 objectForKey:v27];
            if (!v24)
            {
LABEL_41:
              int v30 = (void *)MEMORY[0x189603F70];
              uint64_t v31 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v8,  @"entity",  objc_msgSend(v17, "columnName"),  @"column",  0);
              uint64_t v32 = (void *)[v30 exceptionWithName:*MEMORY[0x189603A58] reason:@"Unrecognized column in entity" userInfo:v31];
              if (v32) {
                goto LABEL_51;
              }
              goto LABEL_42;
            }

            objc_msgSend(v6, "addObject:", objc_msgSend(v17, "columnName"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v67 addObject:v24];
              int v24 = @"?";
            }

            goto LABEL_24;
          }
        }

- (id)createFEKUpdateStatementsForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (a1) {
    uint64_t v4 = *(void **)(a1 + 24);
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (![v4 count]) {
    return 0LL;
  }
  id v27 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (a1)
  {
    unint64_t v5 = *(void **)(a1 + 32);
    if (v5)
    {
      uint64_t v26 = (void *)v5[5];
      goto LABEL_7;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  uint64_t v26 = 0LL;
LABEL_7:
  uint64_t v6 = [v5 tableName];
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * v9);
        uint64_t v11 = (void *)[v4 objectForKey:v10];
        uint64_t v12 = (void *)[v26 objectForKey:v10];
        uint64_t v13 = (void *)[v12 foreignKey];
        if (v12) {
          uint64_t v14 = (void *)v12[9];
        }
        else {
          uint64_t v14 = 0LL;
        }
        uint64_t v15 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a2, v11);
        if (!v15) {
          goto LABEL_19;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void **)(v15 + 104);
        if (!v17)
        {
          -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)v16, a2);
          uint64_t v17 = *(void **)(v16 + 104);
        }

        if ([v17 BOOLValue]) {
          id v18 = (id)[objc_alloc(NSString) initWithFormat:@"_T_%@", objc_msgSend(v11, "tableName")];
        }
        else {
LABEL_19:
        }
          id v18 = (id)objc_msgSend((id)objc_msgSend(v12, "destinationEntity"), "tableName");
        id v19 = v18;
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"UPDATE OR FAIL "];
        [v20 appendString:v6];
        [v20 appendString:@" SET "];
        objc_msgSend(v20, "appendString:", objc_msgSend(v14, "columnName"));
        objc_msgSend(v20, "appendString:", @" = (SELECT _EKT.");
        [v20 appendString:@"Z_ENT"];
        [v20 appendString:@" FROM "];
        [v20 appendString:v19];
        [v20 appendString:@" _EKT WHERE "];
        [v20 appendString:v6];
        [v20 appendString:@"."];
        objc_msgSend(v20, "appendString:", objc_msgSend(v13, "columnName"));
        [v20 appendString:@" = _EKT."];
        [v20 appendString:@"Z_PK"];
        [v20 appendString:@""]);
        if (a2) {
          unsigned int v21 = *(NSSQLiteStatement **)(a2 + 32);
        }
        else {
          unsigned int v21 = 0LL;
        }
        unsigned int v22 = -[NSSQLiteAdapter newStatementWithSQLString:](v21, (uint64_t)v20);

        [v27 addObject:v22];
        ++v9;
      }

      while (v8 != v9);
      uint64_t v23 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v8 = v23;
    }

    while (v23);
  }

  return v27;
}

- (NSSQLiteStatement)createUpdateStatementForEntityMigration:(uint64_t)a1 migrationContext:(uint64_t)a2
{
  int v3 = (void *)a1;
  -[_NSSQLEntityMigrationDescription nextPropertyTransform](a1);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = v3[4];
    uint64_t v7 = [v3 sourceEntity];
    if (v6)
    {
      int v3 = (void *)[*(id *)(v6 + 40) objectForKey:*(void *)(v5 + 16)];
      char v8 = 0;
      goto LABEL_5;
    }

    int v3 = 0LL;
  }

  else
  {
    uint64_t v7 = [0 sourceEntity];
    uint64_t v6 = 0LL;
  }

  char v8 = 1;
LABEL_5:
  uint64_t v9 = *(void **)(v5 + 8);
  uint64_t v10 = [v9 expressionType];
  if (v10 != 3)
  {
    if (!v10)
    {
      uint64_t v11 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]( [NSSQLBindVariable alloc],  "initWithValue:sqlType:propertyDescription:",  [v9 constantValue],  objc_msgSend(v3, "sqlType"),  0);
      uint64_t v12 = @"?";
      goto LABEL_12;
    }

    return 0LL;
  }

  uint64_t v14 = [v9 keyPath];
  if ((v8 & 1) != 0) {
    uint64_t v15 = 0LL;
  }
  else {
    uint64_t v15 = (void *)[*(id *)(v6 + 40) objectForKey:v14];
  }
  uint64_t v12 = (const __CFString *)[v15 columnName];
  uint64_t v11 = 0LL;
LABEL_12:
  if (*(_BYTE *)(v5 + 32))
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@" WHERE %@ is NULL", objc_msgSend(v3, "columnName"), 0];
    if ((v8 & 1) != 0) {
      goto LABEL_23;
    }
    if (!*(void *)(v6 + 160))
    {
      unsigned int v22 = *(void **)(v6 + 152);
      if (!v22 || ![v22 count]) {
        goto LABEL_23;
      }
    }

    if (v16)
    {
      [v16 appendString:@" AND "];
LABEL_20:
      [v16 appendString:@"Z_ENT"];
      [v16 appendString:@" = "];
      if (v7) {
        uint64_t v17 = *(unsigned int *)(v7 + 184);
      }
      else {
        uint64_t v17 = 0LL;
      }
      objc_msgSend(v16, "appendFormat:", @"%d", v17);
      goto LABEL_23;
    }

- (NSSQLiteStatement)newCopyAndInsertStatementForToOne:(void *)a1 toManyToMany:(__CFString *)a2 fromTableName:(uint64_t)a3 invertColumns:(int)a4 migrationContext:(uint64_t)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"INSERT INTO "];
  objc_msgSend(v10, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
  objc_msgSend(v10, "appendString:", @" (");
  if (a2) {
    data = a2[2].data;
  }
  else {
    data = 0LL;
  }
  uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a2);
  if (a4)
  {
    [v10 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    objc_msgSend(v10, "appendString:", @", ");
    objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
    if (v12)
    {
      objc_msgSend(v10, "appendString:", @", ");
      [v10 appendString:v12];
    }

    uint64_t v13 = (__CFString *)data;
    if (!data) {
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(v10, "appendString:", @", ");
    [v10 appendString:v13];
    goto LABEL_12;
  }

  objc_msgSend(v10, "appendString:", -[__CFString columnName](a2, "columnName"));
  objc_msgSend(v10, "appendString:", @", ");
  [v10 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
  if (data)
  {
    objc_msgSend(v10, "appendString:", @", ");
    [v10 appendString:data];
  }

  uint64_t v13 = v12;
  if (v12) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v14 = (void *)[a1 entity];
  if (v14) {
    uint64_t v14 = (void *)v14[16];
  }
  uint64_t v15 = [v14 columnName];
  [v10 appendString:@" SELECT "]);
  [v10 appendString:v15];
  objc_msgSend(v10, "appendString:", @", ");
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a1, "foreignKey"), "columnName");
  [v10 appendString:v16];
  if (a1) {
    uint64_t v17 = (void *)a1[10];
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v18 = [v17 columnName];
  if (data)
  {
    uint64_t v19 = v18;
    objc_msgSend(v10, "appendString:", @", ");
    if (v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v15;
    }
    [v10 appendString:v20];
  }

  if (v12) {
    objc_msgSend(v10, "appendString:", @", 2000");
  }
  [v10 appendString:@" FROM "];
  [v10 appendString:a3];
  [v10 appendString:@" WHERE "];
  [v10 appendString:v16];
  [v10 appendString:@" IS NOT NULL"];
  uint64_t v21 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:](a5, (void *)[a1 entity]);
  unsigned int v22 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:](v21, [a1 entity]);
  uint64_t v48 = a5;
  if ([v22 count])
  {
    uint64_t v23 = (void *)[a1 entity];
    uint64_t v47 = a1;
    if (v23) {
      uint64_t v23 = (void *)v23[17];
    }
    uint64_t v24 = [v23 columnName];
    [v10 appendString:@" AND "];
    [v10 appendString:v24];
    objc_msgSend(v10, "appendString:", @" NOT IN (");
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v25 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      char v27 = 0;
      uint64_t v28 = *(void *)v54;
      do
      {
        uint64_t v29 = 0LL;
        do
        {
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(v22);
          }
          uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * v29);
          if ((v27 & 1) != 0) {
            [v10 appendString:@","];
          }
          if (v30) {
            uint64_t v31 = *(unsigned int *)(v30 + 184);
          }
          else {
            uint64_t v31 = 0LL;
          }
          objc_msgSend(v10, "appendFormat:", @"%d", v31);
          ++v29;
          char v27 = 1;
        }

        while (v26 != v29);
        uint64_t v32 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
        uint64_t v26 = v32;
      }

      while (v32);
    }

    [v10 appendString:@""]);
    a1 = v47;
    a5 = v48;
  }

  if (a1)
  {
    uint64_t v33 = (void *)a1[9];
    if (v33)
    {
      uint64_t v34 = -[_NSSQLiteStoreMigrator tableMigrationDescriptionForEntity:]( a5,  (void *)[a1 destinationEntity]);
      uint64_t v35 = -[_NSSQLTableMigrationDescription _retainedRemovedSubEntitiesOfEntity:]( v34,  [a1 destinationEntity]);
      if ([v35 count])
      {
        [v10 appendString:@" AND "];
        objc_msgSend(v10, "appendString:", objc_msgSend(v33, "columnName"));
        objc_msgSend(v10, "appendString:", @" NOT IN (");
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          char v38 = 0;
          uint64_t v39 = *(void *)v50;
          do
          {
            uint64_t v40 = 0LL;
            do
            {
              if (*(void *)v50 != v39) {
                objc_enumerationMutation(v35);
              }
              uint64_t v41 = *(void *)(*((void *)&v49 + 1) + 8 * v40);
              if ((v38 & 1) != 0) {
                [v10 appendString:@","];
              }
              if (v41) {
                uint64_t v42 = *(unsigned int *)(v41 + 184);
              }
              else {
                uint64_t v42 = 0LL;
              }
              objc_msgSend(v10, "appendFormat:", @"%d", v42);
              ++v40;
              char v38 = 1;
            }

            while (v37 != v40);
            uint64_t v43 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
            uint64_t v37 = v43;
          }

          while (v43);
        }

        [v10 appendString:@""]);
        a5 = v48;
      }
    }
  }

  if (a5) {
    uint64_t v44 = *(NSSQLiteStatement **)(a5 + 32);
  }
  else {
    uint64_t v44 = 0LL;
  }
  unint64_t v45 = -[NSSQLiteAdapter newStatementWithSQLString:](v44, (uint64_t)v10);

  return v45;
}

- (uint64_t)appendStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (result)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v5 = (void *)objc_msgSend(*(id *)(result + 96), "allValues", 0);
    id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if (a3) {
            uint64_t v9 = *(NSSQLiteStatement **)(a3 + 32);
          }
          else {
            uint64_t v9 = 0LL;
          }
          uint64_t v10 = -[NSSQLiteAdapter newDropTableStatementOrFailForTableNamed:]( v9,  *(void *)(*((void *)&v11 + 1) + 8 * v8));
          [a2 addObject:v10];

          ++v8;
        }

        while (v6 != v8);
        id result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v6 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)appendDefaultValueStatementsToCompleteMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (a1 && *(_DWORD *)(a1 + 24) >= 2u)
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v7 = *(void **)(a1 + 104);
    if (!v7)
    {
      -[_NSSQLTableMigrationDescription _determineSchemaTransformationComplexityInMigrationContext:]((id *)a1, a3);
      uint64_t v7 = *(void **)(a1 + 104);
    }

    if (([v7 BOOLValue] & 1) == 0)
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      uint64_t v8 = *(void **)(a1 + 56);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v26;
        do
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:]( a1,  *(void *)(*((void *)&v25 + 1) + 8 * i),  a3);
            __int128 v13 = v12;
            if (v12)
            {
              if ([v12 count]) {
                [v6 addObjectsFromArray:v13];
              }
            }
          }

          uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v9);
      }

      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v14 = *(void **)(a1 + 112);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t j = 0LL; j != v15; ++j)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(_BYTE **)(*((void *)&v21 + 1) + 8 * j);
            if (v18)
            {
              if (v18[24] == 10)
              {
                id v19 = -[_NSSQLTableMigrationDescription createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:migrationContext:]( a1,  objc_msgSend( *(id *)(a1 + 64),  "objectForKey:",  objc_msgSend((id)objc_msgSend(v18, "entity"), "name")),  a3);
                uint64_t v20 = v19;
                if (v19)
                {
                  if ([v19 count]) {
                    [v6 addObjectsFromArray:v20];
                  }
                }
              }
            }
          }

          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }

        while (v15);
      }

      [a2 addObjectsFromArray:v6];
    }
  }

- (id)createDefaultValuePopulationStatementsForAddedColumnsEntityMigration:(uint64_t)a3 migrationContext:
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v46 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v47 = a1;
  id v6 = *(void **)(a1 + 112);
  if (v6)
  {
    uint64_t v7 = (void *)objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v6, "count"));
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v8 = *(void **)(a1 + 112);
    uint64_t v9 = [*(id *)(v47 + 112) countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          if (!v13
            || *(_BYTE *)(v13 + 24) != 1
            || objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "attributeDescription"),  "defaultValue"))
          {
            [v7 addObject:v13];
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }

      while (v10);
    }

    if ([v7 count]) {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v7, "allObjects"));
    }
  }

  __int128 v14 = *(void **)(v47 + 168);
  if (v14) {
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v14, "allObjects"));
  }
  uint64_t v15 = *(void **)(v47 + 144);
  if (v15) {
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v15, "allObjects"));
  }
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v16 = [v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    id v44 = v5;
    uint64_t v45 = *(void *)v49;
    do
    {
      uint64_t v19 = 0LL;
      uint64_t v42 = v17;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v20 = *(unsigned __int8 **)(*((void *)&v48 + 1) + 8 * v19);
        if (v20)
        {
          int v21 = v20[24];
          if (v21 == 10 || v21 == 1)
          {
            uint64_t v23 = [*(id *)(*((void *)&v48 + 1) + 8 * v19) columnName];
            if (a2)
            {
              uint64_t v24 = v23;
              __int128 v25 = *(void **)(a2 + 16);
              if (!v25)
              {
                -[_NSSQLEntityMigrationDescription _generateSQLValueMappingsWithMigrationContext:](a2, a3);
                __int128 v25 = *(void **)(a2 + 16);
              }

              uint64_t v26 = [v25 objectForKey:v24];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = objc_msgSend((id)objc_msgSend(v20, "entity"), "rootEntity");
                uint64_t v29 = [(id)v28 tableName];
                uint64_t v30 = (void *)[MEMORY[0x189607940] stringWithFormat:@"UPDATE %@ SET ", v29];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                uint64_t v32 = [v20 columnName];
                if ((isKindOfClass & 1) != 0)
                {
                  [v30 appendFormat:@"%@ = ?", v32];
                  uint64_t v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v27, 0);
                }

                else
                {
                  [v30 appendFormat:@"%@ = %@", v32, v27];
                  uint64_t v33 = 0LL;
                }

                if (!v28) {
                  goto LABEL_49;
                }
                if (*(void *)(v28 + 160) || (uint64_t v37 = *(void **)(v28 + 152)) != 0 && [v37 count])
                {
                  uint64_t v34 = *(void **)(v28 + 152);
                  if (!v34 || ![v34 count])
                  {
                    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@" WHERE "];
                    [v35 appendString:v29];
                    [v35 appendString:@"."];
                    [v35 appendString:@"Z_ENT"];
                    [v35 appendString:@" = "];
                    uint64_t v36 = &OBJC_IVAR___NSSQLEntity__entityID;
                    goto LABEL_48;
                  }
                }

                if (*(void *)(v28 + 160) && (char v38 = *(void **)(v28 + 152)) != 0 && [v38 count])
                {
                  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@" WHERE "];
                  objc_msgSend(v35, "appendFormat:", @"%d", *(unsigned int *)(v28 + 184));
                  [v35 appendString:@" <= "];
                  [v35 appendString:v29];
                  [v35 appendString:@"."];
                  [v35 appendString:@"Z_ENT"];
                  [v35 appendString:@" AND "];
                  [v35 appendString:v29];
                  [v35 appendString:@"."];
                  uint64_t v17 = v42;
                  [v35 appendString:@"Z_ENT"];
                  [v35 appendString:@" <= "];
                  uint64_t v36 = &OBJC_IVAR___NSSQLEntity__subentityMaxID;
LABEL_48:
                  objc_msgSend(v35, "appendFormat:", @"%d", *(unsigned int *)(v28 + *v36));
                }

                else
                {
LABEL_49:
                  uint64_t v35 = 0LL;
                }

                if ([*(id *)(v47 + 168) containsObject:v20])
                {
                  if (v35) {
                    [v35 appendString:@" AND "];
                  }
                  else {
                    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@" WHERE "];
                  }
                  [v35 appendFormat:@"%@ IS NULL", objc_msgSend(v20, "columnName")];
                }

                if (v35) {
                  [v30 appendString:v35];
                }

                uint64_t v39 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  0LL,  v30);
                uint64_t v40 = v39;
                if (v33)
                {
                  -[NSSQLiteAdapter _useModel:]((uint64_t)v39, v33);
                }

                [v46 addObject:v40];

                id v5 = v44;
                uint64_t v18 = v45;
              }
            }
          }
        }

        ++v19;
      }

      while (v17 != v19);
      uint64_t v17 = [v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }

    while (v17);
  }

  return v46;
}

- (void)_retainedRemovedSubEntitiesOfEntity:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0LL;
  uint64_t v8 = *(void *)v17;
  do
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) sourceEntity];
      if (v10)
      {
        uint64_t v11 = v10;
        unsigned int v12 = *(_DWORD *)(v10 + 184);
        if (a2)
        {
          if (v12 < *(_DWORD *)(a2 + 184)) {
            goto LABEL_15;
          }
          unsigned int v13 = *(_DWORD *)(a2 + 188);
        }

        else
        {
          unsigned int v13 = 0;
        }

        if (v12 <= v13)
        {
          if (!v7) {
            uint64_t v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(*(id *)(a1 + 40), "count"));
          }
          [v7 addObject:v11];
        }
      }

- (uint64_t)newCloudKitMetadataUpdateStatements:(uint64_t)a1
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v68 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 8) tableName];
    _NSCoreDataLog( 4LL,  (uint64_t)@"Migration: CloudKit tables detected. Adding migration statements for removed table: %@",  v4,  v5,  v6,  v7,  v8,  v9,  v3);
    id v10 = objc_alloc(MEMORY[0x189603FA8]);
    uint64_t v11 = *(void *)(a1 + 8);
    if (v11) {
      unsigned int v12 = *(void **)(v11 + 152);
    }
    else {
      unsigned int v12 = 0LL;
    }
    unsigned int v13 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v12, "count") + 1);
    uint64_t v14 = *(void *)(a1 + 8);
    if (v14) {
      uint64_t v15 = *(unsigned int *)(v14 + 184);
    }
    else {
      uint64_t v15 = 0LL;
    }
    objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v15));
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    uint64_t v16 = *(void *)(a1 + 8);
    if (v16) {
      __int128 v17 = *(void **)(v16 + 152);
    }
    else {
      __int128 v17 = 0LL;
    }
    uint64_t v18 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v82;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v82 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v81 + 1) + 8 * v20);
          if (v21) {
            uint64_t v22 = *(unsigned int *)(v21 + 184);
          }
          else {
            uint64_t v22 = 0LL;
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v22));
          ++v20;
        }

        while (v18 != v20);
        uint64_t v23 = [v17 countByEnumeratingWithState:&v81 objects:v90 count:16];
        uint64_t v18 = v23;
      }

      while (v23);
    }

    uint64_t v24 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
    __int128 v25 = -[NSSQLiteStatement initWithEntity:sqlString:]( v24,  "initWithEntity:sqlString:",  0,  [NSString stringWithFormat:@"DELETE FROM ANSCKRECORDMETADATA WHERE ZENTITYID IN %@", v13]);
    [v68 addObject:v25];

    goto LABEL_76;
  }

  uint64_t v62 = a1;
  if ([*(id *)(a1 + 56) count])
  {
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    obuint64_t j = *(id *)(a1 + 56);
    uint64_t v26 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v26)
    {
      uint64_t v64 = *(void *)v78;
      unint64_t v27 = 0x18C68F000uLL;
      do
      {
        uint64_t v28 = 0LL;
        uint64_t v65 = v26;
        do
        {
          if (*(void *)v78 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v77 + 1) + 8 * v28);
          [v29 validateCloudKitEntityMigration];
          uint64_t v30 = [v29 sourceEntity];
          if (v30)
          {
            int v31 = *(_DWORD *)(v30 + *(int *)(v27 + 3860));
            if (!v29) {
              goto LABEL_48;
            }
          }

          else
          {
            int v31 = 0;
            if (!v29)
            {
LABEL_48:
              LODWORD(v32) = 0;
              goto LABEL_31;
            }
          }

          uint64_t v32 = v29[4];
          if (v32) {
            LODWORD(v32) = *(_DWORD *)(v32 + *(int *)(v27 + 3860));
          }
LABEL_31:
          if (v31 != (_DWORD)v32)
          {
            uint64_t v33 = (void *)MEMORY[0x189607968];
            uint64_t v34 = [v29 sourceEntity];
            if (v34) {
              uint64_t v35 = *(unsigned int *)(v34 + *(int *)(v27 + 3860));
            }
            else {
              uint64_t v35 = 0LL;
            }
            v88[0] = [v33 numberWithUnsignedInt:v35];
            if (v29 && (uint64_t v36 = v29[4]) != 0) {
              uint64_t v37 = *(unsigned int *)(v36 + *(int *)(v27 + 3860));
            }
            else {
              uint64_t v37 = 0LL;
            }
            v88[1] = [MEMORY[0x189607968] numberWithUnsignedInt:v37];
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v88, 2));
          }

          uint64_t v66 = v28;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          char v38 = (void *)-[_NSSQLEntityMigrationDescription removedManyToManys]((uint64_t)v29);
          uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v87 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v74;
            do
            {
              for (uint64_t i = 0LL; i != v39; ++i)
              {
                if (*(void *)v74 != v40) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v42 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                uint64_t v43 = objc_alloc(&OBJC_CLASS___NSSQLiteStatement);
                id v44 = -[NSSQLiteStatement initWithEntity:sqlString:]( v43,  "initWithEntity:sqlString:",  0,  [NSString stringWithFormat:@"DELETE FROM ANSCKMIRROREDRELATIONSHIP WHERE ZCDENTITYNAME = '%@' AND ZRELATIONSHIPNAME = '%@'", objc_msgSend((id)objc_msgSend(v29, "sourceEntity"), "name"), objc_msgSend(v42, "name")]);
                [v68 addObject:v44];
              }

              uint64_t v39 = [v38 countByEnumeratingWithState:&v73 objects:v87 count:16];
            }

            while (v39);
          }

          uint64_t v28 = v66 + 1;
          unint64_t v27 = 0x18C68F000LL;
        }

        while (v66 + 1 != v65);
        uint64_t v45 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
        uint64_t v26 = v45;
      }

      while (v45);
    }
  }

  if ([*(id *)(v62 + 48) count])
  {
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    id v46 = *(void **)(v62 + 48);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v86 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v70;
      do
      {
        uint64_t v49 = 0LL;
        do
        {
          if (*(void *)v70 != v48) {
            objc_enumerationMutation(v46);
          }
          __int128 v50 = *(void **)(*((void *)&v69 + 1) + 8 * v49);
          [v50 validateCloudKitEntityMigration];
          uint64_t v51 = [v50 sourceEntity];
          if (v51)
          {
            int v52 = *(_DWORD *)(v51 + 184);
            if (!v50) {
              goto LABEL_72;
            }
          }

          else
          {
            int v52 = 0;
            if (!v50)
            {
LABEL_72:
              LODWORD(v53) = 0;
              goto LABEL_62;
            }
          }

          uint64_t v53 = v50[4];
          if (v53) {
            LODWORD(v53) = *(_DWORD *)(v53 + 184);
          }
LABEL_62:
          if (v52 != (_DWORD)v53)
          {
            __int128 v54 = (void *)MEMORY[0x189607968];
            uint64_t v55 = [v50 sourceEntity];
            if (v55) {
              uint64_t v56 = *(unsigned int *)(v55 + 184);
            }
            else {
              uint64_t v56 = 0LL;
            }
            v85[0] = [v54 numberWithUnsignedInt:v56];
            if (v50 && (uint64_t v57 = v50[4]) != 0) {
              uint64_t v58 = *(unsigned int *)(v57 + 184);
            }
            else {
              uint64_t v58 = 0LL;
            }
            v85[1] = [MEMORY[0x189607968] numberWithUnsignedInt:v58];
            objc_msgSend(a2, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v85, 2));
          }

          ++v49;
        }

        while (v47 != v49);
        uint64_t v59 = [v46 countByEnumeratingWithState:&v69 objects:v86 count:16];
        uint64_t v47 = v59;
      }

      while (v59);
    }
  }

- (NSSQLEntity)rootEntity
{
  return self->_rootEntity;
}

@end