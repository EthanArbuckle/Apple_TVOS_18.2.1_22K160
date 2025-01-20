@interface NSSQLiteStoreMigrator
@end

@implementation NSSQLiteStoreMigrator

id __70___NSSQLiteStoreMigrator_initWithStore_destinationModel_mappingModel___block_invoke(uint64_t a1)
{
  id result = -[NSSQLiteConnection fetchTableNames](*(id *)(*(void *)(a1 + 32) + 48LL));
  *(void *)(*(void *)(a1 + 32) + 64LL) = result;
  return result;
}

void __37___NSSQLiteStoreMigrator__disconnect__block_invoke(uint64_t a1)
{
}

void __43___NSSQLiteStoreMigrator_performMigration___block_invoke(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  uint64_t v1379 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v3 = v2;
  v1053 = (void *)[MEMORY[0x189603FC8] dictionary];
  uint64_t v1141 = v1;
  if (*(_BYTE *)(v1 + 64))
  {
    _NSCoreDataLog( 4LL,  (uint64_t)@"Beginning lightweight migration on connection",  v4,  v5,  v6,  v7,  v8,  v9,  (uint64_t)v1035);
    v1041 = (_BYTE *)(v1 + 65);
    int v16 = *(unsigned __int8 *)(v1 + 64);
    if (!*(_BYTE *)(v1 + 65)) {
      goto LABEL_7;
    }
    if (*(_BYTE *)(v1 + 64)) {
      _NSCoreDataLog( 4LL,  (uint64_t)@"Increasing SQLite cache size to 117MB",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v1035);
    }
  }

  else
  {
    v1041 = (_BYTE *)(v1 + 65);
    if (!*(_BYTE *)(v1 + 65)) {
      goto LABEL_9;
    }
  }

  -[NSSQLiteConnection _executeSQLString:](*(void *)(*(void *)(v1 + 32) + 48LL), @"pragma cache_size = 30000");
  int v16 = *(unsigned __int8 *)(v1 + 64);
LABEL_7:
  if (v16) {
    _NSCoreDataLog( 4LL,  (uint64_t)@"Beginning creation of schema migration statements",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)v1035);
  }
LABEL_9:
  uint64_t v17 = [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
  double v19 = v18;
  id v1045 = (id)MEMORY[0x186E3E5D8](v17);
  uint64_t v20 = *(void *)(v1 + 32);
  if (!v20)
  {
    id v1049 = 0LL;
    goto LABEL_313;
  }

  v1042 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v21 = *(void *)(v20 + 24);
  if (v21) {
    uint64_t v22 = *(void *)(v21 + 32);
  }
  else {
    uint64_t v22 = 0LL;
  }
  obuint64_t j = (id)[MEMORY[0x189603FA8] arrayWithArray:v22];
  __int128 v1277 = 0u;
  __int128 v1276 = 0u;
  __int128 v1275 = 0u;
  __int128 v1274 = 0u;
  uint64_t v23 = *(void *)(v20 + 16);
  if (v23) {
    v24 = *(void **)(v23 + 32);
  }
  else {
    v24 = 0LL;
  }
  uint64_t v25 = [v24 countByEnumeratingWithState:&v1274 objects:&v1358 count:16];
  if (v25)
  {
    uint64_t v1050 = *(void *)v1275;
    id v1095 = v24;
    do
    {
      uint64_t v1068 = 0LL;
      id v1048 = (id)v25;
      do
      {
        if (*(void *)v1275 != v1050) {
          objc_enumerationMutation(v24);
        }
        uint64_t v26 = *(void *)(*((void *)&v1274 + 1) + 8 * v1068);
        context = (void *)MEMORY[0x186E3E5D8]();
        v1063 = (void *)[(id)v26 entityDescription];
        v27 = (NSSQLEntity_DerivedAttributesExtension *)-[NSSQLModel _sqlEntityWithRenamingIdentifier:]( *(void *)(v20 + 24),  (void *)[v1063 renamingIdentifier]);
        v1058 = (void *)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription");
        if (v27)
        {
          int v28 = v26 ? *(_DWORD *)(v26 + 184) : 0;
          if (LODWORD(v27[4]._triggerSQL) != v28)
          {
            objc_msgSend( *(id *)(v20 + 72),  "setObject:forKey:",  v26,  -[NSSQLEntity_DerivedAttributesExtension name](v27, "name"));
            *(_BYTE *)(v20 + 136) = 1;
            __int128 v1350 = 0u;
            __int128 v1351 = 0u;
            __int128 v1352 = 0u;
            __int128 v1353 = 0u;
            v29 = (void *)[(id)v26 toManyRelationships];
            uint64_t v30 = [v29 countByEnumeratingWithState:&v1350 objects:&v1372 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v1351;
              do
              {
                for (uint64_t i = 0LL; i != v30; ++i)
                {
                  if (*(void *)v1351 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v1350 + 1) + 8 * i);
                  if (v33)
                  {
                    v34 = *(_BYTE **)(v33 + 56);
                    if (v34)
                    {
                      if (v34[88])
                      {
                        v35 = (void *)[v34 entity];
                        v36 = (void *)objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend(v35, "name"));
                        if (v36)
                        {
                          [v36 addObject:v34];
                        }

                        else
                        {
                          v1035 = 0LL;
                          v37 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v34];
                          objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v37, objc_msgSend(v35, "name"));
                        }
                      }
                    }
                  }
                }

                uint64_t v30 = [v29 countByEnumeratingWithState:&v1350 objects:&v1372 count:16];
              }

              while (v30);
            }

            v24 = v1095;
            if (v26)
            {
              v38 = *(void **)(v26 + 152);
              if (v38)
              {
                if ([v38 count])
                {
                  __int128 v1349 = 0u;
                  __int128 v1348 = 0u;
                  __int128 v1347 = 0u;
                  __int128 v1346 = 0u;
                  uint64_t v39 = [(id)v26 model];
                  v40 = v39 ? *(void **)(v39 + 32) : 0LL;
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v1346 objects:&v1370 count:16];
                  if (v41)
                  {
                    id v1080 = v40;
                    id v1084 = *(id *)v1347;
                    do
                    {
                      v42 = 0LL;
                      v1108 = (char *)v41;
                      do
                      {
                        if (*(id *)v1347 != v1084) {
                          objc_enumerationMutation(v40);
                        }
                        v43 = *(void **)(*((void *)&v1346 + 1) + 8LL * (void)v42);
                        __int128 v1342 = 0u;
                        __int128 v1343 = 0u;
                        __int128 v1344 = 0u;
                        __int128 v1345 = 0u;
                        v44 = (void *)[v43 foreignEntityKeyColumns];
                        uint64_t v45 = [v44 countByEnumeratingWithState:&v1342 objects:&v1366 count:16];
                        v1125 = v42;
                        if (v45)
                        {
                          uint64_t v46 = *(void *)v1343;
                          do
                          {
                            for (uint64_t j = 0LL; j != v45; ++j)
                            {
                              if (*(void *)v1343 != v46) {
                                objc_enumerationMutation(v44);
                              }
                              v48 = *(void **)(*((void *)&v1342 + 1) + 8 * j);
                              if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v48, "foreignKey"),  "toOneRelationship"),  "destinationEntity"),  "isEqual:",  v26))
                              {
                                v49 = (void *)objc_msgSend( *(id *)(v20 + 80),  "objectForKey:",  objc_msgSend(v43, "name"));
                                if (v49)
                                {
                                  [v49 addObject:v48];
                                }

                                else
                                {
                                  v1035 = 0LL;
                                  v50 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v48];
                                  objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v50, objc_msgSend(v43, "name"));
                                }
                              }
                            }

                            uint64_t v45 = [v44 countByEnumeratingWithState:&v1342 objects:&v1366 count:16];
                          }

                          while (v45);
                        }

                        v42 = v1125 + 1;
                        v24 = v1095;
                        v40 = v1080;
                      }

                      while (v1125 + 1 != v1108);
                      uint64_t v41 = [v1080 countByEnumeratingWithState:&v1346 objects:&v1370 count:16];
                    }

                    while (v41);
                  }
                }
              }
            }

            __int128 v1281 = 0u;
            __int128 v1280 = 0u;
            __int128 v1279 = 0u;
            __int128 v1278 = 0u;
            v51 = (void *)[(id)v26 manyToManyRelationships];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v1278 objects:&v1362 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v1279;
              do
              {
                for (uint64_t k = 0LL; k != v52; ++k)
                {
                  if (*(void *)v1279 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v1278 + 1) + 8 * k);
                  v56 = (void *)objc_msgSend(*(id *)(v20 + 80), "objectForKey:", objc_msgSend((id)v26, "name"));
                  if (v56)
                  {
                    [v56 addObject:v55];
                  }

                  else
                  {
                    v1035 = 0LL;
                    v57 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithObjects:v55];
                    objc_msgSend(*(id *)(v20 + 80), "setObject:forKey:", v57, objc_msgSend((id)v26, "name"));
                  }
                }

                uint64_t v52 = [v51 countByEnumeratingWithState:&v1278 objects:&v1362 count:16];
              }

              while (v52);
            }

            uint64_t v25 = (uint64_t)v1048;
          }
        }

        id v58 = objc_alloc_init(MEMORY[0x189603FE0]);
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1058, "attributeKeys"));
        objc_msgSend(v58, "addObjectsFromArray:", objc_msgSend(v1063, "attributeKeys"));
        __int128 v1273 = 0u;
        __int128 v1272 = 0u;
        __int128 v1271 = 0u;
        __int128 v1270 = 0u;
        uint64_t v59 = [v58 countByEnumeratingWithState:&v1270 objects:&v1354 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v1271;
          do
          {
            for (uint64_t m = 0LL; m != v59; ++m)
            {
              if (*(void *)v1271 != v60) {
                objc_enumerationMutation(v58);
              }
              uint64_t v62 = *(void *)(*((void *)&v1270 + 1) + 8 * m);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:]( v20,  v62,  (uint64_t)v27,  v26);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:]( v20,  v62,  v27,  (void *)v26);
            }

            uint64_t v59 = [v58 countByEnumeratingWithState:&v1270 objects:&v1354 count:16];
          }

          while (v59);
        }

        v63 = (void *)objc_msgSend( (id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"),  "indexes");
        v64 = (void *)objc_msgSend((id)objc_msgSend((id)v26, "entityDescription"), "indexes");
        uint64_t v65 = [v63 sortedArrayUsingComparator:&__block_literal_global_425];
        uint64_t v66 = [v64 sortedArrayUsingComparator:&__block_literal_global_426];
        uint64_t v1372 = MEMORY[0x1895F87A8];
        uint64_t v1373 = 3221225472LL;
        v1374 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1375 = &unk_189EAAAB8;
        uint64_t v1376 = v20;
        uint64_t v1377 = v26;
        v1378 = v27;
        v67 = (void (**)(void, void, void))[&v1372 copy];
        v67[2](v67, v65, v66);

        v68 = (void *)objc_msgSend( (id)-[NSSQLEntity_DerivedAttributesExtension entityDescription](v27, "entityDescription"),  "_uniquenessConstraintsAsFetchIndexes");
        v69 = (void *)objc_msgSend( (id)objc_msgSend((id)v26, "entityDescription"),  "_uniquenessConstraintsAsFetchIndexes");
        uint64_t v70 = [v68 sortedArrayUsingComparator:&__block_literal_global_427];
        uint64_t v71 = [v69 sortedArrayUsingComparator:&__block_literal_global_428];
        uint64_t v1372 = MEMORY[0x1895F87A8];
        uint64_t v1373 = 3221225472LL;
        v1374 = __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke;
        v1375 = &unk_189EAAAB8;
        uint64_t v1376 = v20;
        uint64_t v1377 = v26;
        v1378 = v27;
        v72 = (void (**)(void, void, void))[&v1372 copy];
        v72[2](v72, v70, v71);

        v73 = -[NSSQLEntity derivedAttributesExtension](v27);
        if (v73) {
          [*(id *)(v20 + 184) addObject:v73];
        }
        v74 = -[NSSQLEntity derivedAttributesExtension]((NSSQLEntity_DerivedAttributesExtension *)v26);
        if (v74) {
          [*(id *)(v20 + 192) addObject:v74];
        }
        if (v27) {
          [obj removeObject:v27];
        }
        objc_autoreleasePoolPop(context);
        ++v1068;
      }

      while (v1068 != v25);
      uint64_t v75 = [v24 countByEnumeratingWithState:&v1274 objects:&v1358 count:16];
      uint64_t v25 = v75;
    }

    while (v75);
  }

  __int128 v1369 = 0u;
  __int128 v1368 = 0u;
  __int128 v1367 = 0u;
  __int128 v1366 = 0u;
  uint64_t v76 = [obj countByEnumeratingWithState:&v1366 objects:&v1372 count:16];
  if (v76)
  {
    id v1126 = *(id *)v1367;
    do
    {
      for (uint64_t n = 0LL; n != v76; ++n)
      {
        if (*(id *)v1367 != v1126) {
          objc_enumerationMutation(obj);
        }
        v78 = *(void **)(*((void *)&v1366 + 1) + 8 * n);
        v79 = (void *)MEMORY[0x186E3E5D8]();
        __int128 v1365 = 0u;
        __int128 v1364 = 0u;
        __int128 v1363 = 0u;
        __int128 v1362 = 0u;
        v80 = (void *)objc_msgSend((id)objc_msgSend(v78, "entityDescription"), "attributeKeys");
        uint64_t v81 = [v80 countByEnumeratingWithState:&v1362 objects:&v1370 count:16];
        if (v81)
        {
          uint64_t v82 = *(void *)v1363;
          do
          {
            for (iuint64_t i = 0LL; ii != v81; ++ii)
            {
              if (*(void *)v1363 != v82) {
                objc_enumerationMutation(v80);
              }
              uint64_t v84 = *(void *)(*((void *)&v1362 + 1) + 8 * ii);
              -[_NSSQLiteStoreMigrator _determineAttributeTriggerToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:]( v20,  v84,  (uint64_t)v78,  0LL);
              -[_NSSQLiteStoreMigrator _determineRTreeExtensionsToMigrateForAttributeNamed:withSourceEntity:andDestinationEntity:]( v20,  v84,  v78,  0LL);
            }

            uint64_t v81 = [v80 countByEnumeratingWithState:&v1362 objects:&v1370 count:16];
          }

          while (v81);
        }

        objc_autoreleasePoolPop(v79);
      }

      uint64_t v76 = [obj countByEnumeratingWithState:&v1366 objects:&v1372 count:16];
    }

    while (v76);
  }

  __int128 v1364 = 0u;
  __int128 v1365 = 0u;
  __int128 v1362 = 0u;
  __int128 v1363 = 0u;
  v85 = (void *)[*(id *)(v20 + 40) entityMappings];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v1362 objects:&v1370 count:16];
  if (v86)
  {
    v87 = *(void **)v1363;
    contexta = *(void **)v1363;
    v1059 = v85;
    do
    {
      id v1127 = 0LL;
      v1064 = (void *)v86;
      do
      {
        v88 = *(_BYTE **)(*((void *)&v1362 + 1) + 8LL * (void)v1127);
        id v1096 = (id)MEMORY[0x186E3E5D8]();
        v89 = (void *)objc_msgSend(*(id *)(v20 + 16), "entityNamed:", objc_msgSend(v88, "destinationEntityName"));
        v90 = (void *)objc_msgSend(*(id *)(v20 + 24), "entityNamed:", objc_msgSend(v88, "sourceEntityName"));
        v1109 = -[_NSSQLEntityMigrationDescription initWithEntityMapping:sourceEntity:destinationEntity:]( objc_alloc(&OBJC_CLASS____NSSQLEntityMigrationDescription),  v88,  v90,  v89);
        if (v90) {
          BOOL v91 = v89 == 0LL;
        }
        else {
          BOOL v91 = 1;
        }
        if (!v91) {
          objc_msgSend(*(id *)(v20 + 88), "setObject:forKey:", v89, objc_msgSend(v90, "name"));
        }
        if ([v88 mappingType] != 3 && !objc_msgSend((id)objc_msgSend(v89, "name"), "length"))
        {
LABEL_985:
          v1021 = (void *)MEMORY[0x189603F68];
          uint64_t v1022 = [v88 name];
          v1018 = (void *)objc_msgSend( v1021,  "dictionaryWithObjectsAndKeys:",  v1022,  @"entityMapping",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v88, "mappingType")),  @"mappingType",  0);
          uint64_t v1019 = *MEMORY[0x189603A58];
          v1020 = @"Unsupported entity mapping type with empty entity name";
LABEL_986:
          id v1023 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]( (uint64_t)&OBJC_CLASS____NSCoreDataException,  v1019,  134110LL,  (uint64_t)v1020,  v1018);
          objc_exception_throw(v1023);
          goto LABEL_1015;
        }

        uint64_t v92 = [v89 name];
        switch([v88 mappingType])
        {
          case 2LL:
            *(_BYTE *)(v20 + 136) = 1;
            v93 = (id *)(v20 + 96);
            if (!v92) {
              goto LABEL_143;
            }
            goto LABEL_142;
          case 3LL:
            *(_BYTE *)(v20 + 136) = 1;
            if (!objc_msgSend((id)objc_msgSend(v90, "name"), "length")) {
              goto LABEL_985;
            }
            uint64_t v102 = [v90 name];
            v103 = (void *)[*(id *)(v20 + 16) entityNamed:v102];
            v104 = v103;
            if (v103
              && (v105 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v103, "entityDescription"), "userInfo"),  "objectForKey:",  @"NSEntityRenamingShouldRebaseKey")) != 0 && objc_msgSend(v105, "isEqualToString:", v102))
            {
              _NSCoreDataLog( 2LL,  (uint64_t)@"Collapsing Entity Hierarchy for: %@",  v106,  v107,  v108,  v109,  v110,  v111,  v102);
              objc_msgSend(*(id *)(v20 + 72), "setObject:forKey:", v104, objc_msgSend(v90, "name"));
            }

            else
            {
              [*(id *)(v20 + 104) setObject:v1109 forKey:v102];
            }

            goto LABEL_143;
          case 4LL:
            goto LABEL_141;
          case 5LL:
            if (!v88 || (v88[120] & 2) == 0) {
              goto LABEL_137;
            }
            if (!*(void *)(v20 + 56)) {
              *(void *)(v20 + 56) = -[NSSQLiteConnection fetchTableCreationSQL](*(id *)(v20 + 48));
            }
            v94 = (void *)objc_msgSend((id)objc_msgSend(v90, "rootEntity"), "tableName");
            __int128 v1369 = 0u;
            __int128 v1368 = 0u;
            __int128 v1367 = 0u;
            __int128 v1366 = 0u;
            v95 = *(void **)(v20 + 56);
            uint64_t v96 = [v95 countByEnumeratingWithState:&v1366 objects:&v1372 count:16];
            if (!v96) {
              goto LABEL_129;
            }
            uint64_t v97 = *(void *)v1367;
            break;
          default:
            v1016 = (void *)MEMORY[0x189603F68];
            uint64_t v1017 = [v88 name];
            v1018 = (void *)objc_msgSend( v1016,  "dictionaryWithObjectsAndKeys:",  v1017,  @"entityMapping",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v88, "mappingType")),  @"mappingType",  0);
            uint64_t v1019 = *MEMORY[0x189603A58];
            v1020 = @"Unsupported entity mapping type";
            goto LABEL_986;
        }

        while (2)
        {
          for (juint64_t j = 0LL; jj != v96; ++jj)
          {
            if (*(void *)v1367 != v97) {
              objc_enumerationMutation(v95);
            }
            v99 = *(void **)(*((void *)&v1366 + 1) + 8 * jj);
            uint64_t v100 = [v99 firstObject];
            v101 = (void *)[v99 lastObject];
            if ([v94 isEqual:v100])
            {
              uint64_t v112 = [v101 rangeOfString:@" UNIQUE"];
              v85 = v1059;
              uint64_t v86 = (uint64_t)v1064;
              v87 = contexta;
              if (v112 != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_139;
              }
LABEL_137:
              v93 = (id *)(v20 + 112);
              if (!v92) {
                goto LABEL_143;
              }
LABEL_142:
              [*v93 setObject:v1109 forKey:v92];
              goto LABEL_143;
            }
          }

          uint64_t v96 = [v95 countByEnumeratingWithState:&v1366 objects:&v1372 count:16];
          if (v96) {
            continue;
          }
          break;
        }

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke( uint64_t a1,  _DWORD *a2,  _DWORD *a3)
{
  if (a2)
  {
    int v5 = a2[6];
    if (a3)
    {
LABEL_3:
      int v6 = a3[6];
      goto LABEL_4;
    }
  }

  else
  {
    int v5 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }

  int v6 = 0;
LABEL_4:
  if (v5 != v6)
  {
    if (a2)
    {
      uint64_t v12 = (int)a2[6];
      if (v12 <= 3)
      {
        unint64_t v13 = qword_1868D6400[v12];
        if (!a3) {
          goto LABEL_41;
        }
LABEL_23:
        uint64_t v18 = (int)a3[6];
        else {
          unint64_t v19 = qword_1868D6400[v18];
        }
LABEL_26:
        if (v13 < v19) {
          return -1LL;
        }
        if (v13 > v19) {
          return 1LL;
        }
        if (a2)
        {
          unsigned int v20 = a2[6];
          if (a3)
          {
LABEL_32:
            unsigned int v21 = a3[6];
            goto LABEL_33;
          }
        }

        else
        {
          unsigned int v20 = 0;
          if (a3) {
            goto LABEL_32;
          }
        }

        unsigned int v21 = 0;
LABEL_33:
        if (v20 > v21) {
          return 1LL;
        }
        else {
          return -1LL;
        }
      }

      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (a3) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v13 = 3LL;
      if (a3) {
        goto LABEL_23;
      }
    }

uint64_t __57___NSSQLiteStoreMigrator_createEntityMigrationStatements__block_invoke_382( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_msgSend( (id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0),  "compare:",  objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  if (v5 == 1)
  {
    uint64_t v18 = [a2 objectAtIndexedSubscript:0];
    uint64_t v7 = [a3 objectAtIndexedSubscript:0];
    int v8 = (void *)v18;
    return [v8 compare:v7];
  }

  if (!v5)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"CloudKit metadata migration generated a source / destination id mapping for identical ids: %@"];
    _NSCoreDataLog(17LL, v9, v10, v11, v12, v13, v14, v15, (uint64_t)a2);
    uint64_t v16 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v20 = a2;
      _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: CloudKit metadata migration generated a source / destination id mapping for identical ids: %@",  buf,  0xCu);
    }

    return 0LL;
  }

  if (v5 != -1) {
    return 0LL;
  }
  uint64_t v6 = [a3 objectAtIndexedSubscript:0];
  uint64_t v7 = [a2 objectAtIndexedSubscript:0];
  int v8 = (void *)v6;
  return [v8 compare:v7];
}

void __83___NSSQLiteStoreMigrator__indexMigrationBlockForSourceEntity_andDestinationEntity___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  uint64_t v6 = [a2 count];
  if (v6 | [a3 count])
  {
    obuint64_t j = (id)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a2];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithArray:a3];
    id v36 = objc_alloc_init(MEMORY[0x189603FE0]);
    int v8 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:v7];
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    uint64_t v35 = a1;
    uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) entityMappings];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v58;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v58 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x186E3E5D8]();
          if (objc_msgSend( (id)objc_msgSend(v14, "destinationEntityName"),  "isEqualToString:",  objc_msgSend(*(id *)(v35 + 40), "name"))
            && [v14 mappingType] == 5)
          {
            [v36 unionSet:obj];
            objc_autoreleasePoolPop(v15);
            goto LABEL_35;
          }

          objc_autoreleasePoolPop(v15);
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v67 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t j = 0LL; j != v39; ++j)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(obj);
          }
          unsigned int v17 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          context = (void *)MEMORY[0x186E3E5D8]();
          char v18 = [v7 containsObject:v17];
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          uint64_t v19 = [v7 countByEnumeratingWithState:&v49 objects:v65 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v50;
            do
            {
              for (uint64_t k = 0LL; k != v20; ++k)
              {
                if (*(void *)v50 != v21) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v23 = *(void **)(*((void *)&v49 + 1) + 8 * k);
                if (![v17 _compare:v23])
                {
                  int v24 = -[NSFetchIndexDescription _isUnique]((uint64_t)v17);
                  if (v24 == -[NSFetchIndexDescription _isUnique]((uint64_t)v23))
                  {
                    if ((v18 & 1) == 0
                      || (objc_msgSend((id)objc_msgSend(v17, "name"), "isEqualToString:", objc_msgSend(v23, "name")) & 1) == 0)
                    {
                      [v8 removeObject:v23];
                    }

                    char v18 = 1;
                  }
                }
              }

              uint64_t v20 = [v7 countByEnumeratingWithState:&v49 objects:v65 count:16];
            }

            while (v20);
          }

          if ((v18 & 1) == 0) {
            [v36 addObject:v17];
          }
          objc_autoreleasePoolPop(context);
        }

        uint64_t v39 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      }

      while (v39);
    }

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __89___NSSQLiteStoreMigrator__determineIndexesToMigrateForSourceEntity_andDestinationEntity___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

uint64_t __103___NSSQLiteStoreMigrator__determineUniquenessConstraintsToMigrateForSourceEntity_andDestinationEntity___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "name"), "compare:", objc_msgSend(a3, "name"));
}

@end