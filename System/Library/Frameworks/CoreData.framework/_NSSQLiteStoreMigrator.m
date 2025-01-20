@interface _NSSQLiteStoreMigrator
+ (BOOL)_annotatesMigrationMetadata;
+ (void)_setAnnotatesMigrationMetadata:(BOOL)a3;
- (BOOL)clearTombstoneColumnsForRange:(uint64_t)a3;
- (BOOL)performMigration:(uint64_t)a1;
- (NSSQLiteStatement)updateStatementsForHistoryChanges;
- (NSString)destinationConfigurationForCloudKitValidation;
- (uint64_t)_addEntityMigration:(void *)a3 toTableMigrationForRootEntity:(int)a4 tableMigrationType:;
- (uint64_t)_countNullsInColumn:(uint64_t)a3 forEntity:;
- (uint64_t)_countUnreferencedPrimaryKeysForEntity:(uint64_t)a3 inForeignKeyColumnName:(uint64_t)a4 fromTable:;
- (uint64_t)deleteStatementsForHistory;
- (uint64_t)enforceCloudKitConstraintsForEntity:(uint64_t)result;
- (uint64_t)entityMigrationDescriptionForEntity:(uint64_t)result;
- (uint64_t)shiftTombstones;
- (uint64_t)tableMigrationDescriptionForEntity:(uint64_t)result;
- (void)_determineAttributeTriggerToMigrateForAttributeNamed:(uint64_t)a3 withSourceEntity:(uint64_t)a4 andDestinationEntity:;
- (void)_determineRTreeExtensionsToMigrateForAttributeNamed:(void *)a3 withSourceEntity:(void *)a4 andDestinationEntity:;
- (void)_disconnect;
- (void)_originalRootsForAddedEntity:(uint64_t)a1;
- (void)dealloc;
- (void)initWithStore:(void *)a3 destinationModel:(void *)a4 mappingModel:;
- (void)setDestinationConfigurationForCloudKitValidation:(id)a3;
@end

@implementation _NSSQLiteStoreMigrator

+ (BOOL)_annotatesMigrationMetadata
{
  return _annotatesMigrationMetadata
      || +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") > 0;
}

+ (void)_setAnnotatesMigrationMetadata:(BOOL)a3
{
  _annotatesMigrationMetadata = a3;
}

- (void)initWithStore:(void *)a3 destinationModel:(void *)a4 mappingModel:
{
  if (!a1) {
    return 0LL;
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_CLASS____NSSQLiteStoreMigrator;
  v7 = objc_msgSendSuper2(&v15, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = (id)[a2 model];
    v7[6] = -[NSSQLCore connectionForMigration](a2);
    v7[4] = (id)[a2 adapter];
    v7[5] = a4;
    uint64_t v8 = v7[6];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __70___NSSQLiteStoreMigrator_initWithStore_destinationModel_mappingModel___block_invoke;
    v14[3] = &unk_189EA7758;
    v14[4] = v7;
    -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v14);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "entityMappings"), "count");
    v7[12] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[15] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[13] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[14] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[9] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[10] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[11] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    v7[16] = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v9];
    id v10 = objc_alloc(MEMORY[0x189603FC8]);
    uint64_t v11 = [MEMORY[0x189603FA8] array];
    uint64_t v12 = [MEMORY[0x189603FA8] array];
    v7[19] = objc_msgSend( v10,  "initWithObjectsAndKeys:",  v11,  @"inserted",  v12,  @"updated",  objc_msgSend(MEMORY[0x189603FA8], "array"),  @"deleted",  0);
    v7[23] = objc_alloc_init(MEMORY[0x189603FA8]);
    v7[24] = objc_alloc_init(MEMORY[0x189603FA8]);
    v7[20] = objc_alloc_init(MEMORY[0x189603FA8]);
    v7[21] = objc_alloc_init(MEMORY[0x189603FA8]);
    v7[25] = objc_alloc_init(MEMORY[0x189603FC8]);
    v7[26] = objc_alloc_init(MEMORY[0x189603FA8]);
    *((_WORD *)v7 + 108) = 0;
  }

  return v7;
}

- (void)dealloc
{
  self->_adapter = 0LL;
  self->_connection = 0LL;

  self->_dstModel = 0LL;
  self->_srcModel = 0LL;

  self->_store = 0LL;
  self->_mappingModel = 0LL;

  self->_existingTableNames = 0LL;
  self->_tableGenerationSQL = 0LL;

  self->_addedEntityMigrations = 0LL;
  self->_removedEntityMigrations = 0LL;

  self->_transformedEntityMigrations = 0LL;
  self->_copiedEntityMigrations = 0LL;

  self->_reindexedEntities = 0LL;
  self->_reindexedPropertiesByEntity = 0LL;

  self->_sourceToDestinationEntityMap = 0LL;
  self->_tableMigrationDescriptionsByEntity = 0LL;

  self->_pkTableUpdateStatements = 0LL;
  self->_attributeExtensionsToUpdate = 0LL;

  self->_derivationsToDrop = 0LL;
  self->_derivationsToRun = 0LL;

  self->_defaultValueStatements = 0LL;
  self->_indexesToCreate = 0LL;

  self->_indexesToDrop = 0LL;
  self->_historyMigrationPropertyDataForEntityCache = 0LL;

  self->_cloudKitUpdateStatements = 0LL;
  self->_destinationConfigurationForCloudKitValidation = 0LL;

  self->_stageLabel = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSSQLiteStoreMigrator;
  -[_NSSQLiteStoreMigrator dealloc](&v3, sel_dealloc);
}

- (void)_disconnect
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 48);
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __37___NSSQLiteStoreMigrator__disconnect__block_invoke;
    v2[3] = &unk_189EA7758;
    v2[4] = a1;
    -[NSSQLiteConnection performAndWait:](v1, (uint64_t)v2);
  }

- (void)_originalRootsForAddedEntity:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v4 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  if (a2) {
    a2 = (void *)a2[19];
  }
  uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 96), "objectForKey:", objc_msgSend(v9, "name", (void)v11))) {
          objc_msgSend(v4, "addObjectsFromArray:", -[_NSSQLiteStoreMigrator _originalRootsForAddedEntity:](a1, v9));
        }
        else {
          objc_msgSend( v4,  "addObject:",  objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 112), "valueForKey:", objc_msgSend(v9, "name")),  "sourceEntity"),  "rootEntity"));
        }
      }

      uint64_t v6 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v4;
}

- (BOOL)performMigration:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  v20 = __Block_byref_object_copy__34;
  v21 = __Block_byref_object_dispose__34;
  uint64_t v22 = 0LL;
  BOOL v4 = +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") > 0;
  uint64_t v5 = getprogname();
  if (v5)
  {
    BOOL v6 = !strncmp("assetsd", v5, 7uLL) || !strncmp("photolibraryd", v5, 0xDuLL);
    BOOL v7 = strncmp("homed", v5, 5uLL) == 0;
  }

  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __43___NSSQLiteStoreMigrator_performMigration___block_invoke;
  v13[3] = &unk_189EAAA30;
  BOOL v14 = v4;
  BOOL v15 = v6;
  v13[4] = a1;
  v13[5] = &v17;
  v13[6] = &v23;
  v13[7] = a2;
  BOOL v16 = v7;
  -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v13);
  uint64_t v9 = (void *)v18[5];
  if (v9)
  {
    id v10 = v9;
    if (a2) {
      *a2 = v18[5];
    }
  }

  BOOL v11 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

- (uint64_t)deleteStatementsForHistory
{
  uint64_t v160 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  context = (void *)MEMORY[0x186E3E5D8]();
  int v148 = +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel");
  if ([*(id *)(v1 + 104) count])
  {
    v2 = *(void **)(v1 + 16);
    [*(id *)(v1 + 8) options];
    id v3 =  +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v2);
    BOOL v4 = (id *)[v3 entityNamed:@"CHANGE"];
    uint64_t v5 = [v3 entityNamed:@"TRANSACTION"];
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      goto LABEL_77;
    }
    v146 = (void *)v5;
    __int128 v156 = 0u;
    __int128 v157 = 0u;
    __int128 v154 = 0u;
    __int128 v155 = 0u;
    uint64_t v149 = v1;
    BOOL v7 = *(void **)(v1 + 104);
    uint64_t v8 = 0LL;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v154 objects:v159 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v155;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v155 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v154 + 1) + 8 * v11);
          __int128 v13 = (void *)MEMORY[0x186E3E5D8]();
          BOOL v14 = (void *)[*(id *)(v149 + 104) objectForKey:v12];
          BOOL v15 = v14;
          if (v8)
          {
            uint64_t v16 = [v14 sourceEntity];
            if (v16) {
              uint64_t v17 = *(unsigned int *)(v16 + 184);
            }
            else {
              uint64_t v17 = 0LL;
            }
            objc_msgSend(v8, "appendFormat:", @",%u", v17);
          }

          else
          {
            id v18 = objc_alloc(MEMORY[0x189607940]);
            uint64_t v19 = [v15 sourceEntity];
            if (v19) {
              uint64_t v20 = *(unsigned int *)(v19 + 184);
            }
            else {
              uint64_t v20 = 0LL;
            }
            uint64_t v8 = (void *)objc_msgSend(v18, "initWithFormat:", @"%u", v20);
          }

          objc_autoreleasePoolPop(v13);
          ++v11;
        }

        while (v9 != v11);
        uint64_t v21 = [v7 countByEnumeratingWithState:&v154 objects:v159 count:16];
        uint64_t v9 = v21;
      }

      while (v21);
    }

    objc_msgSend((id)objc_msgSend(v4[5], "objectForKey:", @"ENTITY"), "columnName");
    uint64_t v22 = objc_msgSend((id)objc_msgSend(v4[5], "objectForKey:", @"TRANSACTIONID"), "columnName");
    id v23 = objc_alloc(NSString);
    uint64_t v138 = v22;
    [v4 tableName];
    v24 = (void *)[v23 initWithFormat:@"SELECT MAX(%@) FROM %@ WHERE %@ IN (%@)"];
    uint64_t v25 = -[NSSQLiteStatement initWithEntity:sqlString:]( objc_alloc(&OBJC_CLASS___NSSQLiteStatement),  "initWithEntity:sqlString:",  v4,  v24);
    -[NSSQLiteConnection prepareSQLStatement:](*(void *)(v149 + 48), v25);
    [*(id *)(v149 + 48) execute];
    char v26 = -[NSSQLiteConnection newFetchedArray](*(void *)(v149 + 48));
    v27 = v26;
    if (v26)
    {
      if ((unint64_t)[v26 count] < 2)
      {
        id v30 = 0LL;
      }

      else
      {
        uint64_t v28 = [v27 objectAtIndex:0];
        if (v28 == NSKeyValueCoding_NullValue) {
          v29 = 0LL;
        }
        else {
          v29 = (void *)[v27 objectAtIndex:0];
        }
        id v30 = v29;
      }
    }

    else
    {
      id v30 = 0LL;
    }

    -[NSSQLiteConnection endFetchAndRecycleStatement:](*(void *)(v149 + 48), 0);

    if (!v30 || [v30 longLongValue] < 1) {
      goto LABEL_56;
    }
    v31 = (void *)objc_msgSend( (id)objc_msgSend(*(id *)(v149 + 8), "options"),  "valueForKey:",  @"NSPersistentHistoryTrackingKey");
    if ([v31 isNSDictionary]
      && objc_msgSend( (id)objc_msgSend(v31, "valueForKey:", @"NSPersistentHistoryAllowPartialHistoryMigration"),  "BOOLValue"))
    {
      uint64_t v32 = [*(id *)(v149 + 104) allKeys];
      _NSCoreDataLog( 2LL,  (uint64_t)@"Warning: Persistent History will be removing entries that tracked the following entities being removed: %@",  v33,  v34,  v35,  v36,  v37,  v38,  v32);
      id v39 = objc_alloc(NSString);
      uint64_t v138 = [v4 tableName];
      v144 = (void *)[v39 initWithFormat:@"DELETE FROM %@ WHERE %@ IN (%@)"];
      v145 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(v149 + 32), (uint64_t)v144);
      if (v148 <= 0)
      {
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(v149 + 48), v145);
      }

      else
      {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Begin executing mass delete of removed entries from history statement: %@",  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v145);
        -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(v149 + 48), v145);
        _NSCoreDataLog( 4LL,  (uint64_t)@"Completed execution mass delete of removed entries from history statement.",  v46,  v47,  v48,  v49,  v50,  v51,  v139);
      }

- (NSSQLiteStatement)updateStatementsForHistoryChanges
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)MEMORY[0x186E3E5D8]();
    id v3 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:1];
    BOOL v4 = v1[2];
    -[NSSQLiteStatement options](v1[1], "options");
    uint64_t v74 =  +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v4);
    uint64_t v5 = [v74 entityNamed:@"CHANGE"];
    if (v5)
    {
      BOOL v6 = (id *)v5;
      uint64_t v75 = v2;
      uint64_t v76 = (id *)v5;
      uint64_t v84 = v1;
      uint64_t v77 = v3;
      if (-[NSSQLiteStatement count](v1[9], "count"))
      {
        BOOL v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  -[NSSQLiteStatement count](v1[9], "count"));
        __int128 v102 = 0u;
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        __int128 v105 = 0u;
        obuint64_t j = v1[9];
        uint64_t v8 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v102,  v113,  16LL);
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0LL;
          id v88 = *(id *)v103;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(id *)v103 != v88) {
                objc_enumerationMutation(obj);
              }
              uint64_t v12 = *(void *)(*((void *)&v102 + 1) + 8 * v11);
              __int128 v13 = (void *)MEMORY[0x186E3E5D8]();
              uint64_t v14 = -[NSSQLiteStatement entityNamed:](v1[3], "entityNamed:", v12);
              uint64_t v15 = -[NSSQLiteStatement objectForKey:](v1[9], "objectForKey:", v12);
              if (v15) {
                uint64_t v16 = *(unsigned int *)(v15 + 184);
              }
              else {
                uint64_t v16 = 0LL;
              }
              uint64_t v17 = [MEMORY[0x189607968] numberWithUnsignedInt:v16];
              if (v14) {
                uint64_t v18 = *(unsigned int *)(v14 + 184);
              }
              else {
                uint64_t v18 = 0LL;
              }
              objc_msgSend( v7,  "setObject:forKey:",  v17,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v18));
              if (v10)
              {
                uint64_t v1 = v84;
                if (v14) {
                  uint64_t v19 = *(unsigned int *)(v14 + 184);
                }
                else {
                  uint64_t v19 = 0LL;
                }
                objc_msgSend(v10, "appendFormat:", @",%u", v19);
              }

              else
              {
                id v20 = objc_alloc(MEMORY[0x189607940]);
                uint64_t v1 = v84;
                if (v14) {
                  uint64_t v21 = *(unsigned int *)(v14 + 184);
                }
                else {
                  uint64_t v21 = 0LL;
                }
                uint64_t v10 = (void *)objc_msgSend(v20, "initWithFormat:", @"%u", v21);
              }

              objc_autoreleasePoolPop(v13);
              ++v11;
            }

            while (v9 != v11);
            uint64_t v22 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v102,  v113,  16LL);
            uint64_t v9 = v22;
          }

          while (v22);
        }

        else
        {
          uint64_t v10 = 0LL;
        }

        uint64_t v23 = objc_msgSend((id)objc_msgSend(v76[5], "objectForKey:", @"ENTITY"), "columnName");
        v24 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"UPDATE OR FAIL "];
        objc_msgSend(v24, "appendString:", objc_msgSend(v76, "tableName"));
        [v24 appendString:@" SET "];
        [v24 appendString:v23];
        objc_msgSend(v24, "appendString:", @" =(CASE");
        __int128 v100 = 0u;
        __int128 v101 = 0u;
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        uint64_t v25 = [v7 countByEnumeratingWithState:&v98 objects:v112 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v99;
          do
          {
            for (uint64_t i = 0LL; i != v26; ++i)
            {
              if (*(void *)v99 != v27) {
                objc_enumerationMutation(v7);
              }
              v29 = *(void **)(*((void *)&v98 + 1) + 8 * i);
              id v30 = (void *)[v7 objectForKey:v29];
              [v24 appendString:@" WHEN "];
              [v24 appendString:v23];
              objc_msgSend( v24,  "appendFormat:",  @" = %d THEN %d",  objc_msgSend(v29, "intValue"),  objc_msgSend(v30, "intValue"));
            }

            uint64_t v26 = [v7 countByEnumeratingWithState:&v98 objects:v112 count:16];
          }

          while (v26);
        }

        [v24 appendString:@" ELSE "];
        [v24 appendString:v23];
        [v24 appendString:@" END WHERE "]);
        [v24 appendString:v23];
        objc_msgSend(v24, "appendString:", @" IN (");
        [v24 appendString:v10];
        [v24 appendString:@""]);
        uint64_t v1 = v84;
        v31 = -[NSSQLiteAdapter newStatementWithSQLString:](v84[4], (uint64_t)v24);
        id v3 = v77;
        [v77 addObject:v31];

        v2 = v75;
        BOOL v6 = v76;
      }

      if (-[NSSQLiteStatement count](v1[14], "count"))
      {
        -[NSSQLiteConnection registerMigrationUpdateFunctionWithMigrator:]((uint64_t)v1[6], v1);
        uint64_t v82 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", @"ENTITY"), "columnName");
        uint64_t v81 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", @"COLUMNS"), "columnName");
        uint64_t v80 = objc_msgSend((id)objc_msgSend(v6[5], "objectForKey:", @"CHANGETYPE"), "columnName");
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        __int128 v97 = 0u;
        uint64_t v79 = v1[14];
        uint64_t v32 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:]( v79,  "countByEnumeratingWithState:objects:count:",  &v94,  v111,  16LL);
        if (v32)
        {
          uint64_t v33 = (char *)v32;
          uint64_t v83 = *(void *)v95;
          do
          {
            uint64_t v34 = 0LL;
            uint64_t v78 = v33;
            do
            {
              if (*(void *)v95 != v83) {
                objc_enumerationMutation(v79);
              }
              uint64_t v35 = *(void *)(*((void *)&v94 + 1) + 8LL * (void)v34);
              uint64_t v36 = MEMORY[0x186E3E5D8]();
              uint64_t v37 = (void *)-[NSSQLiteStatement objectForKey:](v1[14], "objectForKey:", v35);
              context = (void *)v36;
              obja = v34;
              if (v37) {
                uint64_t v38 = (unsigned int *)v37[4];
              }
              else {
                uint64_t v38 = 0LL;
              }
              id v39 = (char *)[v37 sourceEntity];
              uint64_t v40 = [(id)-[NSSQLEntity properties]((uint64_t)v39) count];
              uint64_t v41 = (void *)[MEMORY[0x189603FA8] array];
              __int128 v106 = 0u;
              __int128 v107 = 0u;
              __int128 v108 = 0u;
              __int128 v109 = 0u;
              id v89 = (id)[v38 entityDescription];
              uint64_t v42 = [v89 countByEnumeratingWithState:&v106 objects:v114 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v107;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v43; ++j)
                  {
                    if (*(void *)v107 != v44) {
                      objc_enumerationMutation(v89);
                    }
                    uint64_t v46 = *(void **)(*((void *)&v106 + 1) + 8 * j);
                    uint64_t v47 = (void *)MEMORY[0x186E3E5D8]();
                    uint64_t v48 = (void *)[v39 entityDescription];
                    uint64_t v49 = [v46 name];
                    if (!v48
                      || (uint64_t v50 = objc_msgSend((id)objc_msgSend(v48, "propertiesByName"), "objectForKey:", v49)) == 0
                      || (uint64_t v51 = (void *)v50,
                          [v41 addObject:v50],
                          ([v51 _isSchemaEqual:v46] & 1) == 0)
                      && (![v51 _isRelationship]
                       || (uint64_t v52 = (void *)[v46 destinationEntity]) == 0
                       || !objc_msgSend( (id)objc_msgSend(v52, "userInfo"),  "valueForKey:",  @"NSEntityRenamingShouldRebaseKey")))
                    {
                      objc_autoreleasePoolPop(v47);
                      v2 = v75;
                      BOOL v6 = v76;
                      uint64_t v1 = v84;
                      id v3 = v77;
                      uint64_t v33 = v78;
                      goto LABEL_63;
                    }

                    objc_autoreleasePoolPop(v47);
                  }

                  uint64_t v43 = [v89 countByEnumeratingWithState:&v106 objects:v114 count:16];
                  v2 = v75;
                  BOOL v6 = v76;
                  uint64_t v1 = v84;
                  if (v43) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v53 = objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v39, "entityDescription"), "propertiesByName"),  "count");
              uint64_t v54 = [v41 count];
              id v3 = v77;
              uint64_t v33 = v78;
              if (v53 != v54)
              {
LABEL_63:
                id v55 = objc_alloc(NSString);
                uint64_t v56 = [v6 tableName];
                if (v38)
                {
                  unint64_t v57 = 0x18C68F000uLL;
                  uint64_t v58 = v38[46];
                  if (v39) {
                    goto LABEL_65;
                  }
LABEL_72:
                  uint64_t v59 = 0LL;
                  if (!v38) {
                    goto LABEL_73;
                  }
LABEL_66:
                  uint64_t v60 = *(unsigned int *)((char *)v38 + *(int *)(v57 + 3860));
                }

                else
                {
                  uint64_t v58 = 0LL;
                  unint64_t v57 = 0x18C68F000LL;
                  if (!v39) {
                    goto LABEL_72;
                  }
LABEL_65:
                  uint64_t v59 = *(unsigned int *)&v39[*(int *)(v57 + 3860)];
                  if (v38) {
                    goto LABEL_66;
                  }
LABEL_73:
                  uint64_t v60 = 0LL;
                }

                uint64_t v61 = (void *)objc_msgSend( v55,  "initWithFormat:",  @"UPDATE OR FAIL %@ SET %@ = NSPersistentHistoryMigrateUpdates(3, %d, %d, %@) WHERE %@ == %d AND %@ == %ld;",
                                v56,
                                v81,
                                v58,
                                v59,
                                v81,
                                v82,
                                v60,
                                v80,
                                1LL);
                uint64_t v62 = -[NSSQLiteAdapter newStatementWithSQLString:](v1[4], (uint64_t)v61);
                [v3 addObject:v62];
              }

              objc_autoreleasePoolPop(context);
              uint64_t v34 = obja + 1;
            }

            while (obja + 1 != v33);
            uint64_t v63 = -[NSSQLiteStatement countByEnumeratingWithState:objects:count:]( v79,  "countByEnumeratingWithState:objects:count:",  &v94,  v111,  16LL);
            uint64_t v33 = (char *)v63;
          }

          while (v63);
        }
      }

      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      if (v74) {
        uint64_t v64 = (void *)v74[4];
      }
      else {
        uint64_t v64 = 0LL;
      }
      uint64_t v65 = [v64 countByEnumeratingWithState:&v90 objects:v110 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v91;
        do
        {
          uint64_t v68 = 0LL;
          do
          {
            if (*(void *)v91 != v67) {
              objc_enumerationMutation(v64);
            }
            uint64_t v69 = *(void *)(*((void *)&v90 + 1) + 8 * v68);
            id v70 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v71 = (uint64_t)v1[4];
            if (v71) {
              id v72 = -[NSSQLiteAdapter newCreateIndexStatementsForEntity:defaultIndicesOnly:](v71, v69, 0);
            }
            else {
              id v72 = 0LL;
            }
            [v3 addObjectsFromArray:v72];

            objc_autoreleasePoolPop(v70);
            ++v68;
          }

          while (v66 != v68);
          uint64_t v73 = [v64 countByEnumeratingWithState:&v90 objects:v110 count:16];
          uint64_t v66 = v73;
        }

        while (v73);
      }

      objc_autoreleasePoolPop(v2);
      return (NSSQLiteStatement **)v3;
    }

    else
    {

      objc_autoreleasePoolPop(v2);
      return 0LL;
    }
  }

  return result;
}

- (uint64_t)_countNullsInColumn:(uint64_t)a3 forEntity:
{
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"SELECT count(*) FROM "];
  objc_msgSend(v6, "appendString:", objc_msgSend((id)a3, "tableName"));
  [v6 appendString:@" WHERE "];
  objc_msgSend(v6, "appendString:", objc_msgSend(a2, "columnName"));
  [v6 appendString:@" is NULL"];
  if (!a3)
  {
    [v6 appendString:@" AND "];
    [v6 appendString:@"Z_ENT"];
    uint64_t v8 = 0LL;
    goto LABEL_6;
  }

  BOOL v7 = *(void **)(a3 + 152);
  if (v7 && [v7 count] || *(void *)(a3 + 160))
  {
    [v6 appendString:@" AND "];
    [v6 appendString:@"Z_ENT"];
    uint64_t v8 = *(unsigned int *)(a3 + 184);
LABEL_6:
    objc_msgSend(v6, "appendFormat:", @" = %d", v8);
  }

  uint64_t v9 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(void *)(a1 + 48), v6);
  uint64_t v10 = v9;
  if (v9)
  {
    if (CFArrayGetCount(v9) >= 1 && *(void *)CFArrayGetValueAtIndex(v10, 0LL)) {
      uint64_t v11 = *(void *)CFArrayGetValueAtIndex(v10, 1LL);
    }
    else {
      uint64_t v11 = -1LL;
    }
    CFRelease(v10);
  }

  else
  {
    uint64_t v11 = -1LL;
  }

  return v11;
}

- (uint64_t)_countUnreferencedPrimaryKeysForEntity:(uint64_t)a3 inForeignKeyColumnName:(uint64_t)a4 fromTable:
{
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"SELECT count(*) FROM "];
  objc_msgSend(v8, "appendString:", objc_msgSend((id)a2, "tableName"));
  [v8 appendString:@" WHERE "];
  [v8 appendString:@"Z_PK"];
  objc_msgSend(v8, "appendString:", @" NOT IN (SELECT ");
  [v8 appendString:a3];
  [v8 appendString:@" FROM "];
  [v8 appendString:a4];
  [v8 appendString:@" WHERE "];
  [v8 appendString:a3];
  [v8 appendString:@" IS NOT NULL"]);
  if (!a2)
  {
    [v8 appendString:@" AND "];
    [v8 appendString:@"Z_ENT"];
    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  uint64_t v9 = *(void **)(a2 + 152);
  if (v9 && [v9 count] || *(void *)(a2 + 160))
  {
    [v8 appendString:@" AND "];
    [v8 appendString:@"Z_ENT"];
    uint64_t v10 = *(unsigned int *)(a2 + 184);
LABEL_6:
    objc_msgSend(v8, "appendFormat:", @" = %d", v10);
  }

  uint64_t v11 = -[NSSQLiteConnection copyRawIntegerRowsForSQL:](*(void *)(a1 + 48), v8);
  uint64_t v12 = v11;
  if (v11)
  {
    if (CFArrayGetCount(v11) >= 1 && *(void *)CFArrayGetValueAtIndex(v12, 0LL)) {
      uint64_t v13 = *(void *)CFArrayGetValueAtIndex(v12, 1LL);
    }
    else {
      uint64_t v13 = -1LL;
    }
    CFRelease(v12);
  }

  else
  {
    uint64_t v13 = -1LL;
  }

  return v13;
}

- (uint64_t)enforceCloudKitConstraintsForEntity:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    if (*(_BYTE *)(result + 216))
    {
      if (objc_msgSend((id)objc_msgSend((id)result, "destinationConfigurationForCloudKitValidation"), "length")
        && objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "managedObjectModel"),  "configurations"),  "containsObject:",  objc_msgSend(v2, "destinationConfigurationForCloudKitValidation")))
      {
        return objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "managedObjectModel"),  "entitiesForConfiguration:",  objc_msgSend(v2, "destinationConfigurationForCloudKitValidation")),  "containsObject:",  objc_msgSend(a2, "entityDescription"));
      }

      else
      {
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)_determineAttributeTriggerToMigrateForAttributeNamed:(uint64_t)a3 withSourceEntity:(uint64_t)a4 andDestinationEntity:
{
  if (!a3)
  {
    BOOL v7 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t v8 = 0LL;
    goto LABEL_4;
  }

  BOOL v7 = (void *)[*(id *)(a3 + 40) objectForKey:a2];
  if (!a4) {
    goto LABEL_19;
  }
LABEL_3:
  uint64_t v8 = (void *)[*(id *)(a4 + 40) objectForKey:a2];
LABEL_4:
  uint64_t v9 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v7, "propertyDescription"), "userInfo"),  "objectForKey:",  @"NSTriggerKey");
  uint64_t v10 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v8, "propertyDescription"), "userInfo"),  "objectForKey:",  @"NSTriggerKey");
  uint64_t v11 = v10;
  if (!v9 && v10)
  {
    id v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v10,  v8);
    uint64_t v12 = *(void **)(a1 + 152);
    uint64_t v13 = &NSInsertedObjectsKey;
LABEL_10:
    objc_msgSend((id)objc_msgSend(v12, "objectForKey:", *v13), "addObject:", v15);
LABEL_11:

    return;
  }

  if (v9 && !v10)
  {
    id v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v9,  v7);
    uint64_t v12 = *(void **)(a1 + 152);
    uint64_t v13 = &NSDeletedObjectsKey;
    goto LABEL_10;
  }

  if (v9 && v10)
  {
    uint64_t v14 = (void *)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v9,  v7);
    id v15 = (id)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]( (uint64_t)&OBJC_CLASS___NSSQLAttributeExtensionFactory,  v11,  v8);
    if (([v15 isEqualToExtension:v14] & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", @"deleted"), "addObject:", v14);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", @"inserted"), "addObject:", v15);
    }

    goto LABEL_11;
  }

- (void)_determineRTreeExtensionsToMigrateForAttributeNamed:(void *)a3 withSourceEntity:(void *)a4 andDestinationEntity:
{
  uint64_t v8 = objc_msgSend( (id)objc_msgSend( -[NSEntityDescription _attributeNamed:](objc_msgSend(a3, "entityDescription"), a2),  "userInfo"),  "objectForKey:",  @"_NSLocationAttributeDerivedComponents");
  uint64_t v9 = objc_msgSend( (id)objc_msgSend( -[NSEntityDescription _attributeNamed:](objc_msgSend(a4, "entityDescription"), a2),  "userInfo"),  "objectForKey:",  @"_NSLocationAttributeDerivedComponents");
  uint64_t v10 = v9;
  if (!v8 && v9)
  {
    uint64_t v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]( objc_alloc(&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension),  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v9,  a2,  a4);
    uint64_t v11 = *(void **)(a1 + 152);
    uint64_t v12 = &NSInsertedObjectsKey;
LABEL_7:
    objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *v12), "addObject:", v14);
LABEL_8:

    return;
  }

  if (v8 && !v9)
  {
    uint64_t v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]( objc_alloc(&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension),  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v8,  a2,  a3);
    uint64_t v11 = *(void **)(a1 + 152);
    uint64_t v12 = &NSDeletedObjectsKey;
    goto LABEL_7;
  }

  if (v8 && v9)
  {
    uint64_t v13 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]( objc_alloc(&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension),  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v8,  a2,  a3);
    uint64_t v14 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]( objc_alloc(&OBJC_CLASS___NSSQLLocationAttributeRTreeExtension),  "initWithObjectFromUserInfo:onAttributeNamed:onEntity:",  v10,  a2,  a4);
    if (!-[NSSQLLocationAttributeRTreeExtension isEqualToExtension:](v14, "isEqualToExtension:", v13))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", @"deleted"), "addObject:", v13);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "objectForKey:", @"inserted"), "addObject:", v14);
    }

    goto LABEL_8;
  }

- (uint64_t)entityMigrationDescriptionForEntity:(uint64_t)result
{
  if (result)
  {
    id v3 = (__objc2_class *)result;
    BOOL v4 = a2;
    if ([a2 model] == *(void *)(result + 24)) {
      goto LABEL_7;
    }
    while (1)
    {
      result = -[__objc2_class_ro objectForKey:](v3[2].info, "objectForKey:", [v4 name]);
      if (result) {
        break;
      }
      result = -[__objc2_class objectForKey:](v3[3].isa, "objectForKey:", [v4 name]);
      if (result) {
        break;
      }
      result = objc_msgSend(v3[2].cache, "objectForKey:", objc_msgSend(v4, "name"));
      if (result) {
        break;
      }
      id v3 = &OBJC_CLASS____NSCoreDataException;
      id v5 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)_NSCoreDataException,  *MEMORY[0x189603A58],  134110,  (uint64_t)@"Can't find entity migration description for entity",  (void *)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjectsAndKeys:", a2, @"entity", 0));
      objc_exception_throw(v5);
LABEL_7:
      result = objc_msgSend(v3[2].vtable, "objectForKey:", objc_msgSend(a2, "name"));
      if (result) {
        break;
      }
      BOOL v4 = (void *)-[__objc2_class objectForKey:](v3[2].superclass, "objectForKey:", [a2 name]);
    }
  }

  return result;
}

- (uint64_t)tableMigrationDescriptionForEntity:(uint64_t)result
{
  if (result)
  {
    v2 = a2;
    uint64_t v3 = result;
    if ([a2 model] != *(void *)(result + 24)) {
      return objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    }
    result = objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    if (!result)
    {
      v2 = (void *)objc_msgSend(*(id *)(v3 + 88), "objectForKey:", objc_msgSend(v2, "name"));
      return objc_msgSend(*(id *)(v3 + 128), "objectForKey:", objc_msgSend((id)objc_msgSend(v2, "rootEntity"), "name"));
    }
  }

  return result;
}

- (uint64_t)_addEntityMigration:(void *)a3 toTableMigrationForRootEntity:(int)a4 tableMigrationType:
{
  uint64_t v8 = (void *)objc_msgSend(*(id *)(a1 + 128), "objectForKey:", objc_msgSend(a3, "name"));
  if (!v8)
  {
    uint64_t v8 = -[_NSSQLTableMigrationDescription initWithRootEntity:migrationType:]( objc_alloc(&OBJC_CLASS____NSSQLTableMigrationDescription),  a3,  a4);
    objc_msgSend(*(id *)(a1 + 128), "setObject:forKey:", v8, objc_msgSend(a3, "name"));
  }

  return -[_NSSQLTableMigrationDescription addEntityMigrationDescription:]((uint64_t)v8, a2);
}

- (BOOL)clearTombstoneColumnsForRange:(uint64_t)a3
{
  BOOL v6 = *(void **)(a1 + 16);
  [*(id *)(a1 + 8) options];
  id v18 = +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v6);
  BOOL v7 = (void *)[v18 entityNamed:@"CHANGE"];
  if (v7)
  {
    for (uint64_t i = a2 - 1; i >= a3; --i)
    {
      uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"UPDATE %@ SET Z%@%lu = NULL", objc_msgSend(v7, "tableName"), @"TOMBSTONE", i];
      uint64_t v10 = -[NSSQLiteAdapter newStatementWithSQLString:](*(NSSQLiteStatement **)(a1 + 32), (uint64_t)v9);
      if (+[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel") >= 1) {
        _NSCoreDataLog( 4LL,  (uint64_t)@"Executing clearing tombstone column statement: %@",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v10);
      }
      -[NSSQLiteConnection prepareAndExecuteSQLStatement:](*(void *)(a1 + 48), v10);
    }
  }

  return v7 != 0LL;
}

- (uint64_t)shiftTombstones
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  uint64_t v51 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v2 = (void *)[a1[5] entityMappings];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v61 objects:v68 count:16];
  uint64_t v52 = a1;
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v62;
    uint64_t v49 = v2;
    uint64_t v53 = *(void *)v62;
    do
    {
      uint64_t v6 = 0LL;
      uint64_t v55 = v4;
      do
      {
        if (*(void *)v62 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v61 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(a1[3], "entityNamed:", objc_msgSend(v7, "sourceEntityName"));
        uint64_t v9 = objc_msgSend(a1[2], "entityNamed:", objc_msgSend(v7, "destinationEntityName"));
        if ((v8 != 0) == (v9 != 0))
        {
          uint64_t v10 = (void *)v9;
          id v11 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  (void *)v8);
          id v12 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v10);
          if (([v11 isEqualToArray:v12] & 1) == 0)
          {
            if ([v11 count])
            {
              uint64_t v13 = (void *)[MEMORY[0x189603FA8] array];
              if ([v12 count])
              {
                char v14 = 0;
                unint64_t v15 = 0LL;
                do
                {
                  uint64_t v16 = objc_msgSend(v11, "indexOfObject:", objc_msgSend(v12, "objectAtIndex:", v15));
                  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v66 = [MEMORY[0x189607968] numberWithUnsignedInteger:v15];
                    uint64_t v17 = (void *)MEMORY[0x189603F18];
                    id v18 = &v66;
                    uint64_t v19 = 1LL;
                  }

                  else
                  {
                    uint64_t v20 = v16;
                    v14 |= v15 != v16;
                    v67[0] = [MEMORY[0x189607968] numberWithUnsignedInteger:v15];
                    v67[1] = [MEMORY[0x189607968] numberWithUnsignedInteger:v20];
                    uint64_t v17 = (void *)MEMORY[0x189603F18];
                    id v18 = v67;
                    uint64_t v19 = 2LL;
                  }

                  objc_msgSend(v13, "addObject:", objc_msgSend(v17, "arrayWithObjects:count:", v18, v19));
                  ++v15;
                }

                while (v15 < [v12 count]);
                a1 = v52;
                v2 = v49;
                if ((v14 & 1) != 0)
                {
                  if (v8) {
                    uint64_t v21 = *(unsigned int *)(v8 + 184);
                  }
                  else {
                    uint64_t v21 = 0LL;
                  }
                  objc_msgSend( v51,  "setObject:forKey:",  v13,  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", v21));
                }
              }
            }
          }

          uint64_t v5 = v53;
          uint64_t v4 = v55;
        }

        ++v6;
      }

      while (v6 != v4);
      uint64_t v22 = [v2 countByEnumeratingWithState:&v61 objects:v68 count:16];
      uint64_t v4 = v22;
    }

    while (v22);
  }

  if (![v51 count]) {
    return 1LL;
  }
  uint64_t v23 = a1[2];
  [a1[1] options];
  uint64_t result = objc_msgSend(  +[_PFPersistentHistoryModel newPersistentHistorySQLModelForSQLModel:options:]( (uint64_t)_PFPersistentHistoryModel,  v23),  "entityNamed:",  @"CHANGE");
  if (result)
  {
    uint64_t v25 = (id *)result;
    uint64_t v48 = objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "objectForKey:", @"ENTITY"), "columnName");
    uint64_t v47 = objc_msgSend((id)objc_msgSend(v25[5], "objectForKey:", @"CHANGETYPE"), "columnName");
    uint64_t v46 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 2);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    obuint64_t j = (id)[v51 allKeys];
    uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (!v50) {
      return 1LL;
    }
    uint64_t v44 = *(void *)v58;
    uint64_t v45 = v25;
    while (1)
    {
      uint64_t v26 = 0LL;
      do
      {
        if (*(void *)v58 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void *)(*((void *)&v57 + 1) + 8 * v26);
        uint64_t v56 = v26;
        uint64_t v27 = (void *)objc_msgSend(v51, "objectForKey:");
        uint64_t v28 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"UPDATE "];
        objc_msgSend(v28, "appendString:", objc_msgSend(v25, "tableName"));
        [v28 appendString:@" SET "];
        if ([v27 count])
        {
          uint64_t v29 = 0LL;
          char v30 = 1;
          while (1)
          {
            v31 = (void *)[v27 objectAtIndex:v29];
            uint64_t v32 = [NSString stringWithFormat:@"Z%@%lu", @"TOMBSTONE", v29];
            if ([v31 count] == 1) {
              break;
            }
            if ((objc_msgSend( (id)objc_msgSend(v31, "objectAtIndexedSubscript:", 0),  "isEqualToValue:",  objc_msgSend(v31, "objectAtIndexedSubscript:", 1)) & 1) == 0)
            {
              if ((v30 & 1) == 0) {
                objc_msgSend(v28, "appendString:", @" , ");
              }
              uint64_t v35 = [NSString stringWithFormat:@"Z%@%lu", @"TOMBSTONE", objc_msgSend((id)objc_msgSend(v31, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue")];
              [v28 appendString:v32];
              [v28 appendString:@" = "];
              uint64_t v33 = v28;
              uint64_t v34 = (const __CFString *)v35;
              goto LABEL_41;
            }

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
}

@end