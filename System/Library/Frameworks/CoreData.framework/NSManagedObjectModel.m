@interface NSManagedObjectModel
+ (BOOL)supportsSecureCoding;
+ (BOOL)versionHashes:(id)a3 compatibleWithStoreMetadata:(id)a4;
+ (NSDictionary)checksumsForVersionedModelAtURL:(NSURL *)modelURL error:(NSError *)error;
+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles;
+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles forStoreMetadata:(NSDictionary *)metadata;
+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models;
+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models forStoreMetadata:(NSDictionary *)metadata;
+ (id)versionsHashesForModelAtURL:(id)a3 error:(id *)a4;
+ (int64_t)_debugOptimizedModelLayout;
+ (uint64_t)_deepCollectEntitiesInArray:(void *)a3 entity:;
+ (void)_modelPathsFromBundles:(uint64_t)a1;
+ (void)_newModelFromOptimizedEncoding:(uint64_t)a1 error:(const __CFData *)a2;
- (BOOL)isConfiguration:(NSString *)configuration compatibleWithStoreMetadata:(NSDictionary *)metadata;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (NSArray)configurations;
- (NSArray)entities;
- (NSArray)entitiesForConfiguration:(NSString *)configuration;
- (NSDictionary)entitiesByName;
- (NSDictionary)entityVersionHashesByName;
- (NSDictionary)fetchRequestTemplatesByName;
- (NSDictionary)localizationDictionary;
- (NSFetchRequest)fetchRequestFromTemplateWithName:(NSString *)name substitutionVariables:(NSDictionary *)variables;
- (NSFetchRequest)fetchRequestTemplateForName:(NSString *)name;
- (NSManagedObjectModel)init;
- (NSManagedObjectModel)initWithCoder:(id)a3;
- (NSManagedObjectModel)initWithContentsOfOptimizedURL:(id)a3;
- (NSManagedObjectModel)initWithContentsOfURL:(NSURL *)url;
- (NSManagedObjectModel)initWithContentsOfURL:(id)a3 forStoreMetadata:(id)a4;
- (NSSet)versionIdentifiers;
- (NSString)versionChecksum;
- (id)_entitiesByVersionHash;
- (id)_entityVersionHashesByNameInStyle:(id)result;
- (id)_entityVersionHashesDigest;
- (id)_entityVersionHashesDigestFrom:(id)result;
- (id)_initWithContentsOfURL:(id)a3 options:(unint64_t)a4;
- (id)_initWithEntities:(id)a3;
- (id)_localizationPolicy;
- (id)_modelForVersionHashes:(id)a3;
- (id)_optimizedEncoding:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)immutableCopy;
- (id)versionHash;
- (int64_t)_modelsReferenceIDOffset;
- (uint64_t)_allowedClassesFromTransformableAttributes;
- (uint64_t)_hasEntityWithDerivedAttribute;
- (uint64_t)_hasEntityWithUniquenessConstraints;
- (uint64_t)_isConfiguration:(uint64_t)a3 inStyle:(void *)a4 compatibleWithStoreMetadata:;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_addEntity:(id)a3;
- (void)_createCachesAndOptimizeState;
- (void)_finalizeIndexes;
- (void)_flattenProperties;
- (void)_removeEntity:(uint64_t)a1;
- (void)_restoreValidation;
- (void)_setIsEditable:(BOOL)a3;
- (void)_setIsEditable:(BOOL)a3 optimizationStyle:(unint64_t)a4;
- (void)_setLocalizationPolicy:(id)a3;
- (void)_setModelsReferenceIDOffset:(int64_t)a3;
- (void)_sortedEntitiesForConfiguration:(void *)result;
- (void)_stripForMigration;
- (void)_throwIfNotEditable;
- (void)_traverseTombstonesAndMark:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEntities:(NSArray *)entities;
- (void)setEntities:(NSArray *)entities forConfiguration:(NSString *)configuration;
- (void)setFetchRequestTemplate:(NSFetchRequest *)fetchRequestTemplate forName:(NSString *)name;
- (void)setLocalizationDictionary:(NSDictionary *)localizationDictionary;
- (void)setVersionIdentifiers:(NSSet *)versionIdentifiers;
@end

@implementation NSManagedObjectModel

- (int64_t)_modelsReferenceIDOffset
{
  return [self->_additionalPrivateIvars[1] longValue];
}

- (NSArray)entitiesForConfiguration:(NSString *)configuration
{
  if ((*(_BYTE *)&self->_managedObjectModelFlags & 2) != 0)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }

  if (configuration)
  {
    configurations = self->_configurations;
    return (NSArray *)-[NSMutableDictionary objectForKey:](configurations, "objectForKey:");
  }

  return -[NSManagedObjectModel entities](self, "entities");
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  uint64_t v4 = objc_opt_class();
  context = (void *)MEMORY[0x186E3E5D8](v4);
  v5 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)&OBJC_CLASS___NSManagedObjectModel, bundles);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
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
        v12 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v13 = [MEMORY[0x189604030] fileURLWithPath:v11];
        v20 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v13);
        if (v20) {
          [v5 addObject:v20];
        }
        else {
          _NSCoreDataLog( 1LL,  (uint64_t)@"+mergedModelFromBundles: Failed to load model at URL '%@'",  v14,  v15,  v16,  v17,  v18,  v19,  v13);
        }

        objc_autoreleasePoolPop(v12);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v8);
  }

  if ([v5 count] == 1) {
    v21 = (void *)[v5 objectAtIndex:0];
  }
  else {
    v21 = (void *)[a1 modelByMergingModels:v5];
  }
  id v22 = v21;
  objc_autoreleasePoolPop(context);
  return (NSManagedObjectModel *)v22;
}

+ (void)_modelPathsFromBundles:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2)
  {
    if ((unint64_t)[a2 count] >= 2)
    {
      BOOL v3 = BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88) != 0;
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  uint64_t v4 = [MEMORY[0x1896077F8] mainBundle];
  if (v4)
  {
    a2 = (void *)[MEMORY[0x189603F18] arrayWithObject:v4];
LABEL_6:
    BOOL v3 = 0;
    goto LABEL_8;
  }

  BOOL v3 = 0;
  a2 = 0LL;
LABEL_8:
  if (a2) {
    v5 = a2;
  }
  else {
    v5 = (void *)MEMORY[0x189604A58];
  }
  v6 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x186E3E5D8]();
        if (!v3
          || (uint64_t v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "bundlePath"), "pathComponents"),
              (unint64_t)[v13 count] < 5)
          || !objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "isEqual:", @"System")
          || (objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 2), "isEqual:", @"Library") & 1) == 0)
        {
          objc_msgSend( v6,  "addObjectsFromArray:",  objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", @"mom", 0));
          objc_msgSend( v6,  "addObjectsFromArray:",  objc_msgSend(v11, "pathsForResourcesOfType:inDirectory:", @"momd", 0));
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v6;
}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models
{
  uint64_t v145 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  objc_opt_class();
  if (!models) {
    return 0LL;
  }
  NSUInteger v4 = -[NSArray count](models, "count");
  if (v4 == 1)
  {
    v6 = (NSManagedObjectModel *)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
    return v6;
  }

  unint64_t v5 = v4;
  if (!v4)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSManagedObjectModel);
    return v6;
  }

  id v98 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v8 = 0LL;
  unint64_t v105 = v5 - 2;
  unint64_t v102 = v5;
  v103 = models;
  do
  {
    context = (void *)MEMORY[0x186E3E5D8]();
    uint64_t v9 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v8);
    if (v8 + 1 >= v5) {
      goto LABEL_31;
    }
    uint64_t v10 = v9;
    uint64_t v11 = v8 + 1;
    do
    {
      id v12 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v11);
      uint64_t v13 = (void *)[v12 entitiesByName];
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v133 = 0u;
      uint64_t v14 = (void *)[v13 allValues];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v130 objects:v143 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v131;
        do
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v131 != v17) {
              objc_enumerationMutation(v14);
            }
            __int128 v19 = *(void **)(*((void *)&v130 + 1) + 8 * i);
            uint64_t v20 = [v19 name];
            if (v10)
            {
              uint64_t v21 = v20;
              id v22 = (void *)[v10[4] objectForKey:v20];
              if (v22)
              {
                if (([v22 isEqual:v19] & 1) == 0)
                {
                  [v98 drain];
                  v90 = (void *)MEMORY[0x189603F70];
                  uint64_t v91 = *MEMORY[0x189603A60];
                  uint64_t v92 = [NSString stringWithFormat:@"Can't merge models with two different entities named '%@'", v21];
                  v93 = v90;
                  uint64_t v94 = v91;
                  goto LABEL_112;
                }
              }
            }
          }

          uint64_t v16 = [v14 countByEnumeratingWithState:&v130 objects:v143 count:16];
        }

        while (v16);
      }

      v23 = (void *)[v12 fetchRequestTemplatesByName];
      __int128 v126 = 0u;
      __int128 v127 = 0u;
      __int128 v128 = 0u;
      __int128 v129 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v126 objects:v142 count:16];
      if (!v24) {
        goto LABEL_30;
      }
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v127;
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v127 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v126 + 1) + 8 * j);
          uint64_t v29 = [v12 fetchRequestTemplateForName:v28];
          v30 = (void *)[v10 fetchRequestTemplateForName:v28];
          if (v30 && ([v30 isEqual:v29] & 1) == 0)
          {
            [v98 drain];
            v95 = (void *)MEMORY[0x189603F70];
            uint64_t v96 = *MEMORY[0x189603A60];
            uint64_t v92 = [NSString stringWithFormat:@"Can't merge models with two different fetch request templates for name'%@'", v28];
            v93 = v95;
            uint64_t v94 = v96;
LABEL_112:
            objc_exception_throw((id)[v93 exceptionWithName:v94 reason:v92 userInfo:0]);
          }
        }

        uint64_t v25 = [v23 countByEnumeratingWithState:&v126 objects:v142 count:16];
      }

      while (v25);
LABEL_30:
      ++v11;
      unint64_t v5 = v102;
      models = v103;
    }

    while (v11 != v102);
LABEL_31:
    objc_autoreleasePoolPop(context);
  }

  while (v8++ != v105);
  v32 = (id *)(id)objc_msgSend(-[NSArray objectAtIndex:](models, "objectAtIndex:", 0), "copy");
  id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
  v34 = objc_alloc_init(&OBJC_CLASS___NSMergedPolicyLocalizationPolicy);
  if ([v32 _localizationPolicy]) {
    -[NSMergedPolicyLocalizationPolicy addPolicy:](v34, "addPolicy:", [v32 _localizationPolicy]);
  }
  v99 = v34;
  uint64_t v35 = [v32 _setLocalizationPolicy:v34];
  if (v5 >= 2)
  {
    uint64_t v36 = 1LL;
    v37 = &off_189EA5000;
    do
    {
      v100 = (void *)MEMORY[0x186E3E5D8](v35);
      uint64_t v101 = v36;
      v38 = -[NSArray objectAtIndex:](models, "objectAtIndex:", v36);
      [v33 removeAllObjects];
      v39 = (void *)[v38 entitiesByName];
      __int128 v122 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v125 = 0u;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v122 objects:v141 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v123;
        do
        {
          for (uint64_t k = 0LL; k != v41; ++k)
          {
            if (*(void *)v123 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = (void *)[v39 objectForKey:*(void *)(*((void *)&v122 + 1) + 8 * k)];
            if (![v44 superentity])
            {
              v45 = (void *)[v44 copy];
              +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)v37[116], v33, v45);
            }
          }

          uint64_t v41 = [v39 countByEnumeratingWithState:&v122 objects:v141 count:16];
        }

        while (v41);
      }

      uint64_t v46 = [v33 count];
      if (v46)
      {
        uint64_t v47 = v46;
        for (uint64_t m = 0LL; m != v47; ++m)
        {
          v49 = (void *)[v33 objectAtIndex:m];
          uint64_t v50 = [v49 name];
          if (!v32 || ![v32[4] objectForKey:v50]) {
            [v32 _addEntity:v49];
          }
        }
      }

      if ([v38 _localizationPolicy]) {
        -[NSMergedPolicyLocalizationPolicy addPolicy:](v99, "addPolicy:", [v38 _localizationPolicy]);
      }
      contexta = v38;
      if ([v38[5] count])
      {
        __int128 v120 = 0u;
        __int128 v121 = 0u;
        __int128 v118 = 0u;
        __int128 v119 = 0u;
        id obj = v38[5];
        uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v140 count:16];
        if (v109)
        {
          uint64_t v106 = *(void *)v119;
          do
          {
            for (uint64_t n = 0LL; n != v109; ++n)
            {
              if (*(void *)v119 != v106) {
                objc_enumerationMutation(obj);
              }
              uint64_t v52 = *(void *)(*((void *)&v118 + 1) + 8 * n);
              [v33 removeAllObjects];
              v53 = (void *)[contexta entitiesForConfiguration:v52];
              __int128 v114 = 0u;
              __int128 v115 = 0u;
              __int128 v116 = 0u;
              __int128 v117 = 0u;
              uint64_t v54 = [v53 countByEnumeratingWithState:&v114 objects:v139 count:16];
              if (v54)
              {
                uint64_t v55 = v54;
                uint64_t v56 = *(void *)v115;
                do
                {
                  uint64_t v57 = 0LL;
                  do
                  {
                    if (*(void *)v115 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    uint64_t v58 = [*(id *)(*((void *)&v114 + 1) + 8 * v57) name];
                    if (v32) {
                      uint64_t v59 = [v32[4] objectForKey:v58];
                    }
                    else {
                      uint64_t v59 = 0LL;
                    }
                    [v33 addObject:v59];
                    ++v57;
                  }

                  while (v55 != v57);
                  uint64_t v60 = [v53 countByEnumeratingWithState:&v114 objects:v139 count:16];
                  uint64_t v55 = v60;
                }

                while (v60);
              }

              if (v32)
              {
                if (((_BYTE)v32[8] & 3) != 0)
                {
                  uint64_t v61 = [NSString stringWithUTF8String:"_addEntities called on immutable NSManagedObjectModel"];
                  _NSCoreDataLog(17LL, v61, v62, v63, v64, v65, v66, v67, v97);
                  v68 = (os_log_s *)__pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_fault_impl( &dword_186681000,  v68,  OS_LOG_TYPE_FAULT,  "CoreData: _addEntities called on immutable NSManagedObjectModel",  buf,  2u);
                  }
                }

                id v69 = v32[5];
                if (!v69)
                {
                  id v69 = objc_alloc_init(MEMORY[0x189603FC8]);
                  v32[5] = v69;
                }

                uint64_t v70 = [v69 objectForKey:v52];
                if (v70)
                {
                  v71 = (void *)v70;
                  __int128 v136 = 0u;
                  __int128 v137 = 0u;
                  __int128 v134 = 0u;
                  __int128 v135 = 0u;
                  uint64_t v72 = [v33 countByEnumeratingWithState:&v134 objects:buf count:16];
                  if (v72)
                  {
                    uint64_t v73 = v72;
                    uint64_t v74 = *(void *)v135;
                    do
                    {
                      for (iuint64_t i = 0LL; ii != v73; ++ii)
                      {
                        if (*(void *)v135 != v74) {
                          objc_enumerationMutation(v33);
                        }
                        uint64_t v76 = *(void *)(*((void *)&v134 + 1) + 8 * ii);
                        if ([v71 indexOfObjectIdenticalTo:v76] == 0x7FFFFFFFFFFFFFFFLL) {
                          [v71 addObject:v76];
                        }
                      }

                      uint64_t v73 = [v33 countByEnumeratingWithState:&v134 objects:buf count:16];
                    }

                    while (v73);
                  }
                }

                else
                {
                  v77 = (void *)[v33 mutableCopy];
                  [v32[5] setObject:v77 forKey:v52];
                }

                if (!*((void *)v32[3] + 3)) {
                  *((void *)v32[3] + 3) = objc_alloc_init(MEMORY[0x189603FC8]);
                }
                objc_msgSend( *((id *)v32[3] + 3),  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  objc_msgSend(v32[5], "objectForKeyedSubscript:", v52)),  v52);
              }
            }

            uint64_t v109 = [obj countByEnumeratingWithState:&v118 objects:v140 count:16];
          }

          while (v109);
        }
      }

      v78 = (void *)[contexta fetchRequestTemplatesByName];
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v113 = 0u;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v110 objects:v138 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v111;
        do
        {
          for (juint64_t j = 0LL; jj != v80; ++jj)
          {
            if (*(void *)v111 != v81) {
              objc_enumerationMutation(v78);
            }
            uint64_t v83 = *(void *)(*((void *)&v110 + 1) + 8 * jj);
            if (![v32 fetchRequestTemplateForName:v83])
            {
              v84 = (void *)objc_msgSend((id)objc_msgSend(v78, "objectForKey:", v83), "copy");
              [v32 setFetchRequestTemplate:v84 forName:v83];
            }
          }

          uint64_t v80 = [v78 countByEnumeratingWithState:&v110 objects:v138 count:16];
        }

        while (v80);
      }

      uint64_t v85 = [contexta versionIdentifiers];
      v37 = &off_189EA5000;
      if (v85 && v32)
      {
        uint64_t v86 = v85;
        v87 = (void *)[v32 versionIdentifiers];
        if (v87)
        {
          v88 = (void *)[v87 mutableCopy];
          [v88 unionSet:v86];
          objc_msgSend(v32, "setVersionIdentifiers:", (id)objc_msgSend(v88, "copy"));
        }

        else
        {
          [v32 setVersionIdentifiers:v86];
        }
      }

      objc_autoreleasePoolPop(v100);
      uint64_t v36 = v101 + 1;
      models = v103;
    }

    while (v101 + 1 != v102);
  }

  v89 = v32;
  [v98 drain];
  return (NSManagedObjectModel *)v32;
}

+ (uint64_t)_deepCollectEntitiesInArray:(void *)a3 entity:
{
  unint64_t v5 = (void *)[a3 subentities];
  uint64_t result = [v5 count];
  if (result)
  {
    uint64_t v7 = result;
    for (uint64_t i = 0LL; i != v7; ++i)
      uint64_t result = +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]( NSManagedObjectModel,  a2,  [v5 objectAtIndex:i]);
  }

  return result;
}

+ (NSManagedObjectModel)mergedModelFromBundles:(NSArray *)bundles forStoreMetadata:(NSDictionary *)metadata
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x186E3E5D8](a1, a2);
  unint64_t v5 = (void *)[MEMORY[0x189603FA8] array];
  v6 = +[NSManagedObjectModel _modelPathsFromBundles:]((uint64_t)&OBJC_CLASS___NSManagedObjectModel, bundles);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x186E3E5D8]();
        if (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "fileExistsAtPath:isDirectory:",  v11,  &v21)) {
          BOOL v13 = v21 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13) {
          uint64_t v14 = -[NSManagedObjectModel initWithContentsOfURL:]( [NSManagedObjectModel alloc],  "initWithContentsOfURL:",  [MEMORY[0x189604030] fileURLWithPath:v11 isDirectory:0]);
        }
        else {
          uint64_t v14 = -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  v11);
        }
        uint64_t v15 = v14;
        if (v15) {
          [v5 addObject:v15];
        }
        objc_autoreleasePoolPop(v12);
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v8);
  }

  id v16 = (id)[a1 modelByMergingModels:v5 forStoreMetadata:metadata];
  objc_autoreleasePoolPop(context);
  return (NSManagedObjectModel *)v16;
}

+ (NSManagedObjectModel)modelByMergingModels:(NSArray *)models forStoreMetadata:(NSDictionary *)metadata
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  id v7 = (id)objc_msgSend( -[NSDictionary objectForKey:]( metadata,  "objectForKey:",  @"NSStoreModelVersionHashes"),  "mutableCopy");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( models,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(models);
        }
        BOOL v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v15 = [v13 _modelForVersionHashes:v7];
        if (v15)
        {
          id v16 = (void *)v15;
          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
          }
          [v10 addObject:v16];
          objc_msgSend(v7, "removeObjectsForKeys:", objc_msgSend((id)objc_msgSend(v16, "entitiesByName"), "allKeys"));
          if (![v7 count])
          {
            objc_autoreleasePoolPop(v14);
            goto LABEL_15;
          }
        }

        objc_autoreleasePoolPop(v14);
      }

      uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( models,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v10 = 0LL;
  }

- (NSManagedObjectModel)init
{
  return (NSManagedObjectModel *)-[NSManagedObjectModel _initWithEntities:](self, "_initWithEntities:", 0LL);
}

- (NSManagedObjectModel)initWithContentsOfURL:(NSURL *)url
{
  return (NSManagedObjectModel *)-[NSManagedObjectModel _initWithContentsOfURL:options:]( self,  "_initWithContentsOfURL:options:",  url,  byte_18C4ABDBC);
}

- (void)dealloc
{
  if (self->_optimizationHints)
  {
    uint64_t v3 = -[NSMutableDictionary count](self->_entities, "count") - 1;
    if (v3 >= 0)
    {
      do

      while (v3 != -1);
    }
  }

  self->_optimizationHints = 0LL;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (fetchRequestTemplates)
  {

    self->_fetchRequestTemplates = 0LL;
  }

  self->_configurations = 0LL;
  self->_entities = 0LL;

  self->_versionIdentifiers = 0LL;
  additionalPrivateIvars = self->_additionalPrivateIvars;
  if (additionalPrivateIvars)
  {

    *self->_additionalPrivateIvars = 0LL;
    *((void *)self->_additionalPrivateIvars + 1) = 0LL;

    *((void *)self->_additionalPrivateIvars + 2) = 0LL;
    *((void *)self->_additionalPrivateIvars + 3) = 0LL;
    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
    self->_additionalPrivateIvars = 0LL;
  }

  self->_dataForOptimizatiouint64_t n = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSManagedObjectModel;
  -[NSManagedObjectModel dealloc](&v6, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  if (self->_entities)
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:self->_entities];
    entities = self->_entities;
  }

  else
  {
    entities = 0LL;
    objc_super v6 = 0LL;
  }

  [a3 encodeObject:entities forKey:@"NSEntities"];

  uint64_t v8 = -[NSMutableDictionary count](self->_configurations, "count");
  if (v8 != (-[NSMutableDictionary objectForKey:]( self->_configurations,  "objectForKey:",  @"PF_DEFAULT_CONFIGURATION_NAME") != 0))
  {
    uint64_t v15 = v5;
    uint64_t v9 = (void *)[MEMORY[0x189603FC8] dictionary];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    configurations = self->_configurations;
    uint64_t v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( configurations,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(configurations);
          }
          objc_msgSend( v9,  "setObject:forKey:",  objc_msgSend( MEMORY[0x189604010],  "setWithArray:",  -[NSMutableDictionary objectForKey:]( self->_configurations,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * i))),  *(void *)(*((void *)&v16 + 1) + 8 * i));
        }

        uint64_t v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( configurations,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v12);
    }

    [v9 removeObjectForKey:@"PF_DEFAULT_CONFIGURATION_NAME"];
    [a3 encodeObject:v9 forKey:@"NSConfigurations"];
    unint64_t v5 = v15;
  }

  [a3 encodeObject:self->_fetchRequestTemplates forKey:@"NSFetchRequestTemplates"];
  [a3 encodeObject:self->_versionIdentifiers forKey:@"NSVersionIdentifiers"];
  objc_autoreleasePoolPop(v5);
}

- (void)_finalizeIndexes
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1 = result;
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    uint64_t result = (void *)[result countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      v2 = result;
      uint64_t v3 = *(void *)v6;
      do
      {
        NSUInteger v4 = 0LL;
        do
        {
          if (*(void *)v6 != v3) {
            objc_enumerationMutation(v1);
          }
          -[NSEntityDescription _finalizeIndexes](*(void *)(*((void *)&v5 + 1) + 8LL * (void)v4));
          NSUInteger v4 = (char *)v4 + 1;
        }

        while (v2 != v4);
        uint64_t result = (void *)[v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
        v2 = result;
      }

      while (result);
    }
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSManagedObjectModel)initWithCoder:(id)a3
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  objc_opt_class();
  v89.receiver = self;
  v89.super_class = (Class)&OBJC_CLASS___NSManagedObjectModel;
  newValue = -[NSManagedObjectModel init](&v89, sel_init);
  if (newValue)
  {
    +[PFModelDecoderContext assertNoContext](&OBJC_CLASS___PFModelDecoderContext, "assertNoContext");
    id v4 = +[PFModelDecoderContext retainedContext](&OBJC_CLASS___PFModelDecoderContext, "retainedContext");
    id v6 = v4;
    if (v4) {
      objc_setProperty_nonatomic(v4, v5, newValue, 8LL);
    }
    v85[0] = MEMORY[0x1895F87A8];
    v85[1] = 3221225472LL;
    uint64_t v86 = __38__NSManagedObjectModel_initWithCoder___block_invoke;
    v87 = &unk_189EA7758;
    id v88 = v6;
    __int128 v7 = (void *)MEMORY[0x189604010];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = (NSMutableDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( (id)objc_msgSend( v7,  "setWithObjects:",  v8,  v9,  v10,  v11,  objc_opt_class(),  0),  "setByAddingObjectsFromArray:",  +[NSKnownKeysDictionary classesForArchiving]( NSKnownKeysDictionary,  "classesForArchiving")),  @"NSEntities");
    newValue->_entities = v12;
    if (v12)
    {
      if ((-[NSMutableDictionary isNSDictionary](v12, "isNSDictionary") & 1) == 0)
      {
        objc_msgSend( a3,  "failWithError:",  objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  4866,  &unk_189F037C0));

        goto LABEL_68;
      }

      uint64_t v13 = (void *)[MEMORY[0x189603FE0] set];
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      __int128 v81 = 0u;
      __int128 v82 = 0u;
      uint64_t v14 = (void *)-[NSMutableDictionary allKeys](newValue->_entities, "allKeys");
      uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v93 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v82;
        uint64_t v17 = *MEMORY[0x189607460];
LABEL_8:
        uint64_t v18 = 0LL;
        while (1)
        {
          if (*(void *)v82 != v16) {
            objc_enumerationMutation(v14);
          }
          __int128 v19 = *(void **)(*((void *)&v81 + 1) + 8 * v18);
          uint64_t v20 = (void *)MEMORY[0x186E3E5D8]();
          uint64_t v21 = (void *)-[NSMutableDictionary objectForKeyedSubscript:]( newValue->_entities,  "objectForKeyedSubscript:",  v19);
          if ([v19 isNSString]
            && (objc_opt_class(), __int128 v22 = v21, (objc_opt_isKindOfClass() & 1) != 0))
          {
            while (1)
            {
              __int128 v22 = (void *)[v22 superentity];
              if (!v22 || ([v13 containsObject:v22] & 1) != 0) {
                break;
              }
              uint64_t v23 = [v22 name];
              if (!v23
                || (void *)-[NSMutableDictionary objectForKeyedSubscript:]( newValue->_entities,  "objectForKeyedSubscript:",  v23) != v22)
              {
                objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", v17, 4866, &unk_189F03810));

                goto LABEL_19;
              }

              [v13 addObject:v22];
            }

            if ([v21 performPostDecodeValidationInModel:newValue error:&v80])
            {
              int v24 = 0;
              goto LABEL_20;
            }

            [a3 failWithError:v80];
          }

          else
          {
            objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", v17, 4866, &unk_189F037E8));
          }

void __38__NSManagedObjectModel_initWithCoder___block_invoke(uint64_t a1)
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend( v4,  "_setModelsReferenceIDOffset:",  -[NSManagedObjectModel _modelsReferenceIDOffset](self, "_modelsReferenceIDOffset"));
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    entities = self->_entities;
    uint64_t v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( entities,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(entities);
          }
          uint64_t v11 = (void *)-[NSMutableDictionary objectForKey:]( self->_entities,  "objectForKey:",  *(void *)(*((void *)&v42 + 1) + 8 * i));
          if (![v11 superentity])
          {
            uint64_t v12 = (void *)[v11 copy];
            +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]( (uint64_t)&OBJC_CLASS___NSManagedObjectModel,  v5,  v12);
          }
        }

        uint64_t v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( entities,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
      }

      while (v8);
    }

    [v4 setEntities:v5];

    id v13 = *self->_additionalPrivateIvars;
    if (v13)
    {
      uint64_t v14 = (void *)[v13 copy];
      [v4 _setLocalizationPolicy:v14];
    }

    id obj = self->_configurations;
    if (obj)
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      uint64_t v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t j = 0LL; j != v16; ++j)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            id v20 = objc_alloc_init(MEMORY[0x189603FA8]);
            uint64_t v21 = -[NSManagedObjectModel entitiesForConfiguration:](self, "entitiesForConfiguration:", v19);
            uint64_t v22 = -[NSArray count](v21, "count");
            if (v22)
            {
              uint64_t v23 = v22;
              for (uint64_t k = 0LL; k != v23; ++k)
                objc_msgSend( v20,  "addObject:",  objc_msgSend( v4[4],  "objectForKey:",  objc_msgSend(-[NSArray objectAtIndex:](v21, "objectAtIndex:", k), "name")));
            }

            [v4 setEntities:v20 forConfiguration:v19];
          }

          uint64_t v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v47,  16LL);
        }

        while (v16);
      }
    }

    fetchRequestTemplates = self->_fetchRequestTemplates;
    if (fetchRequestTemplates)
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      uint64_t v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v35;
        do
        {
          for (uint64_t m = 0LL; m != v27; ++m)
          {
            if (*(void *)v35 != v28) {
              objc_enumerationMutation(fetchRequestTemplates);
            }
            uint64_t v30 = *(void *)(*((void *)&v34 + 1) + 8 * m);
            uint64_t v31 = (void *)objc_msgSend( (id)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", v30),  "copy");
            [v4 setFetchRequestTemplate:v31 forName:v30];
          }

          uint64_t v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v34,  v46,  16LL);
        }

        while (v27);
      }
    }

    [v4 setVersionIdentifiers:self->_versionIdentifiers];
  }

  return v4;
}

- (unint64_t)hash
{
  return [(id)objc_opt_class() hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_13;
  }
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  id v5 = -[NSManagedObjectModel entitiesByName](self, "entitiesByName");
  uint64_t v6 = [a3 entitiesByName];
  if (v5 == (NSDictionary *)v6
    || (uint64_t v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSDictionary isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    uint64_t v8 = -[NSManagedObjectModel fetchRequestTemplatesByName](self, "fetchRequestTemplatesByName");
    uint64_t v6 = [a3 fetchRequestTemplatesByName];
    if (v8 != (NSDictionary *)v6)
    {
      uint64_t v9 = v6;
      LOBYTE(v6) = 0;
      if (v8 && v9) {
        LOBYTE(v6) = -[NSDictionary isEqual:](v8, "isEqual:");
      }
      return v6;
    }

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSManagedObjectModel;
  return (id)[NSString stringWithFormat:@"(%@) isEditable %u, entities %@, fetch request templates %@", -[NSManagedObjectModel description](&v3, sel_description), -[NSManagedObjectModel isEditable](self, "isEditable"), -[NSManagedObjectModel entitiesByName](self, "entitiesByName"), -[NSManagedObjectModel fetchRequestTemplatesByName](self, "fetchRequestTemplatesByName")];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!a3->var1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = -[NSManagedObjectModel entities](self, "entities");
      a3->var3[3] = 0LL;
      a3->var3[4] = (unint64_t)v9;
    }
  }

  uint64_t v10 = (NSArray *)a3->var3[4];
  if (!v10) {
    return -[NSMutableDictionary _valueCountByEnumeratingWithState:objects:count:]( self->_entities,  "_valueCountByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
  }
  if (!a3->var3[3]) {
    uint64_t v10 = -[NSManagedObjectModel entities](self, "entities");
  }
  return -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (NSDictionary)entitiesByName
{
  return &self->_entities->super;
}

- (NSArray)entities
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_entities, "allValues");
}

- (void)setEntities:(NSArray *)entities
{
  if ((+[_PFRoutines _doNameAndTypeCheck:]((uint64_t)&OBJC_CLASS____PFRoutines, entities) & 1) != 0)
  {
    id v5 = (void *)-[NSMutableDictionary allValues](self->_entities, "allValues");
    uint64_t v6 = [v5 count];
    if (v6)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v9 = (void *)[v5 objectAtIndex:i];
        if (-[NSArray indexOfObjectIdenticalTo:](entities, "indexOfObjectIdenticalTo:", v9) == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSManagedObjectModel _removeEntity:]((uint64_t)self, v9);
        }
      }
    }

    NSUInteger v10 = -[NSArray count](entities, "count");
    if (v10)
    {
      NSUInteger v11 = v10;
      for (uint64_t j = 0LL; j != v11; ++j)
      {
        id v13 = -[NSArray objectAtIndex:](entities, "objectAtIndex:", j);
        if ([v5 indexOfObjectIdenticalTo:v13] == 0x7FFFFFFFFFFFFFFFLL) {
          -[NSManagedObjectModel _addEntity:](self, "_addEntity:", v13);
        }
      }
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't add an entity to a managed object model (missing name or bad properties)." userInfo:0]);
    -[NSManagedObjectModel _removeEntity:](v14, v15);
  }

- (void)_removeEntity:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if ([a2 managedObjectModel] != a1) {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Can't remove entity - doesn't belong to this model." userInfo:0]);
    }
    uint64_t v4 = [a2 name];
    [(id)a1 _throwIfNotEditable];
    if (v4)
    {
      uint64_t v31 = (void *)[*(id *)(a1 + 32) objectForKey:v4];
      if (v31)
      {
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        uint64_t v29 = v4;
        id obj = *(id *)(a1 + 40);
        uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v33;
          do
          {
            for (uint64_t i = 0LL; i != v6; ++i)
            {
              if (*(void *)v33 != v7) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              NSUInteger v10 = (void *)[MEMORY[0x189603F18] arrayWithObject:v31];
              NSUInteger v11 = *(void **)(a1 + 40);
              if (v11)
              {
                uint64_t v12 = [v11 objectForKey:v9];
                if (v12)
                {
                  id v13 = (void *)v12;
                  if ((*(_BYTE *)(a1 + 64) & 3) != 0)
                  {
                    uint64_t v14 = [NSString stringWithUTF8String:"_removeEntities called on immutable NSManagedObjectModel"];
                    _NSCoreDataLog(17LL, v14, v15, v16, v17, v18, v19, v20, v28);
                    uint64_t v21 = (os_log_s *)__pflogFaultLog;
                    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl( &dword_186681000,  v21,  OS_LOG_TYPE_FAULT,  "CoreData: _removeEntities called on immutable NSManagedObjectModel",  buf,  2u);
                    }
                  }

                  __int128 v38 = 0u;
                  __int128 v39 = 0u;
                  __int128 v36 = 0u;
                  __int128 v37 = 0u;
                  uint64_t v22 = [v10 countByEnumeratingWithState:&v36 objects:buf count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v37;
                    do
                    {
                      for (uint64_t j = 0LL; j != v23; ++j)
                      {
                        if (*(void *)v37 != v24) {
                          objc_enumerationMutation(v10);
                        }
                        uint64_t v26 = [v13 indexOfObjectIdenticalTo:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                        if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
                          [v13 removeObjectAtIndex:v26];
                        }
                      }

                      uint64_t v23 = [v10 countByEnumeratingWithState:&v36 objects:buf count:16];
                    }

                    while (v23);
                  }
                }
              }
            }

            uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
          }

          while (v6);
        }

        uint64_t v27 = v31;
        [*(id *)(a1 + 32) removeObjectForKey:v29];
        -[NSEntityDescription _setManagedObjectModel:](v31, 0LL);
      }
    }
  }

- (NSArray)configurations
{
  configurations = self->_configurations;
  if (configurations) {
    return (NSArray *)-[NSMutableDictionary allKeys](configurations, "allKeys");
  }
  else {
    return (NSArray *)NSArray_EmptyArray;
  }
}

- (void)setEntities:(NSArray *)entities forConfiguration:(NSString *)configuration
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_managedObjectModelFlags & 3) != 0)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"setEntities called on immutable NSManagedObjectModel"];
    _NSCoreDataLog(17LL, v7, v8, v9, v10, v11, v12, v13, v25);
    uint64_t v14 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_186681000,  v14,  OS_LOG_TYPE_FAULT,  "CoreData: setEntities called on immutable NSManagedObjectModel",  buf,  2u);
    }
  }

  NSUInteger v15 = -[NSArray count](entities, "count");
  if (v15)
  {
    NSUInteger v16 = v15;
    for (uint64_t i = 0LL; i != v16; ++i)
    {
      id v18 = -[NSArray objectAtIndex:](entities, "objectAtIndex:", i);
      if ((objc_msgSend( v18,  "isEqual:",  -[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", objc_msgSend(v18, "name"))) & 1) == 0) {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Entities for a configuration must already be in the model." userInfo:0]);
      }
    }
  }

  if (!self->_configurations) {
    self->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }
  uint64_t v19 = (void *)-[NSArray mutableCopy](entities, "mutableCopy");
  -[NSMutableDictionary setObject:forKey:](self->_configurations, "setObject:forKey:", v19, configuration);
  if (!*((void *)self->_additionalPrivateIvars + 3)) {
    *((void *)self->_additionalPrivateIvars + 3) = objc_opt_new();
  }
  uint64_t v20 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v21 = -[NSArray countByEnumeratingWithState:objects:count:]( entities,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(entities);
        }
        objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24++), "name"));
      }

      while (v22 != v24);
      uint64_t v22 = -[NSArray countByEnumeratingWithState:objects:count:]( entities,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v22);
  }

  [self->_additionalPrivateIvars[3] setObject:v20 forKeyedSubscript:configuration];
}

- (NSDictionary)fetchRequestTemplatesByName
{
  if (self->_fetchRequestTemplates) {
    return &self->_fetchRequestTemplates->super;
  }
  else {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
}

- (NSFetchRequest)fetchRequestTemplateForName:(NSString *)name
{
  uint64_t result = (NSFetchRequest *)self->_fetchRequestTemplates;
  if (result) {
    return (NSFetchRequest *)-[NSFetchRequest objectForKey:](result, "objectForKey:", name);
  }
  return result;
}

- (void)setFetchRequestTemplate:(NSFetchRequest *)fetchRequestTemplate forName:(NSString *)name
{
  fetchRequestTemplates = self->_fetchRequestTemplates;
  if (!fetchRequestTemplates)
  {
    fetchRequestTemplates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    self->_fetchRequestTemplates = fetchRequestTemplates;
  }

  uint64_t v8 = (NSFetchRequest *)-[NSMutableDictionary objectForKey:](fetchRequestTemplates, "objectForKey:", name);
  if (v8 != fetchRequestTemplate)
  {
    if (fetchRequestTemplate)
    {
      uint64_t v9 = -[NSFetchRequest entity](fetchRequestTemplate, "entity");
      uint64_t v10 = -[NSMutableDictionary objectForKey:]( self->_entities,  "objectForKey:",  -[NSEntityDescription name](v9, "name"));
      if (v10)
      {
        uint64_t v11 = v10;
        if ((NSEntityDescription *)v10 == v9)
        {
          -[NSMutableDictionary setObject:forKey:]( self->_fetchRequestTemplates,  "setObject:forKey:",  fetchRequestTemplate,  name);
        }

        else
        {
          id v16 = (id)-[NSFetchRequest copy](fetchRequestTemplate, "copy");
          [v16 setEntity:v11];
          -[NSMutableDictionary setObject:forKey:](self->_fetchRequestTemplates, "setObject:forKey:", v16, name);
        }
      }

      else if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"Cannot set fetch request template.  This model does not contain entity '%@'.", -[NSEntityDescription name](v9, "name")), 0 reason userInfo]);
        -[NSManagedObjectModel fetchRequestFromTemplateWithName:substitutionVariables:](v12, v13, v14, v15);
      }
    }

    else if (v8)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_fetchRequestTemplates, "removeObjectForKey:", name);
    }
  }

- (NSFetchRequest)fetchRequestFromTemplateWithName:(NSString *)name substitutionVariables:(NSDictionary *)variables
{
  uint64_t v5 = -[NSManagedObjectModel fetchRequestTemplateForName:](self, "fetchRequestTemplateForName:", name);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = (NSFetchRequest *)(id)-[NSFetchRequest copy](v5, "copy");
  -[NSFetchRequest setPredicate:]( v6,  "setPredicate:",  -[NSPredicate predicateWithSubstitutionVariables:]( -[NSFetchRequest predicate](v6, "predicate"),  "predicateWithSubstitutionVariables:",  variables));
  return v6;
}

- (NSDictionary)localizationDictionary
{
  uint64_t result = -[NSManagedObjectModel _localizationPolicy](self, "_localizationPolicy");
  if (result)
  {
    objc_super v3 = result;
    -[NSDictionary _ensureFullLocalizationDictionaryIsLoaded](result, "_ensureFullLocalizationDictionaryIsLoaded");
    return (NSDictionary *)-[NSDictionary localizationDictionary](v3, "localizationDictionary");
  }

  return result;
}

- (void)setLocalizationDictionary:(NSDictionary *)localizationDictionary
{
  uint64_t v5 = -[NSManagedObjectModel _localizationPolicy](self, "_localizationPolicy");
  if (!v5)
  {
    uint64_t v5 = -[NSValidationErrorLocalizationPolicy initWithURL:]( objc_alloc(&OBJC_CLASS___NSValidationErrorLocalizationPolicy),  "initWithURL:",  0LL);
    -[NSManagedObjectModel _setLocalizationPolicy:](self, "_setLocalizationPolicy:", v5);
  }

  -[NSValidationErrorLocalizationPolicy setLocalizationDictionary:]( v5,  "setLocalizationDictionary:",  localizationDictionary);
}

- (NSSet)versionIdentifiers
{
  return self->_versionIdentifiers;
}

- (void)setVersionIdentifiers:(NSSet *)versionIdentifiers
{
  if (self->_versionIdentifiers != versionIdentifiers)
  {
    if (versionIdentifiers) {
      uint64_t v4 = (NSSet *)-[NSSet copy](versionIdentifiers, "copy");
    }
    else {
      uint64_t v4 = (NSSet *)objc_alloc_init(MEMORY[0x189604010]);
    }
    uint64_t v5 = v4;

    self->_versionIdentifiers = v5;
  }

- (NSDictionary)entityVersionHashesByName
{
  return (NSDictionary *)-[NSManagedObjectModel _entityVersionHashesByNameInStyle:](self, 0LL);
}

- (id)_entityVersionHashesByNameInStyle:(id)result
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (result)
  {
    objc_super v3 = (void *)[result entitiesByName];
    uint64_t v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          uint64_t v10 = (void *)MEMORY[0x186E3E5D8]();
          objc_msgSend( v4,  "setValue:forKey:",  -[NSEntityDescription _versionHashInStyle:]((unint64_t *)objc_msgSend(v3, "objectForKey:", v9), a2),  v9);
          objc_autoreleasePoolPop(v10);
          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v6);
    }

    return v4;
  }

  return result;
}

- (BOOL)isConfiguration:(NSString *)configuration compatibleWithStoreMetadata:(NSDictionary *)metadata
{
  return -[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]( (uint64_t)self,  (uint64_t)a2,  0LL,  metadata);
}

- (uint64_t)_isConfiguration:(uint64_t)a3 inStyle:(void *)a4 compatibleWithStoreMetadata:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v6 = (void *)result;
  uint64_t v7 = (void *)[a4 objectForKey:0x189EBA2A8];
  unsigned int v8 = [v7 intValue];
  uint64_t result = [a4 objectForKey:@"NSStoreModelVersionHashes"];
  if (!result) {
    return result;
  }
  uint64_t v9 = (void *)result;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "entitiesByName"), "count");
  if (v10 != [v9 count]) {
    return 0LL;
  }
  id v11 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v6, a3);
  __int128 v12 = v11;
  if (v8 < 3)
  {
    __int128 v23 = 0uLL;
    __int128 v24 = 0uLL;
    __int128 v21 = 0uLL;
    __int128 v22 = 0uLL;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_8:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t result = [v9 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v16)];
        if (!result) {
          return result;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          uint64_t result = 1LL;
          if (v14) {
            goto LABEL_8;
          }
          return result;
        }
      }
    }

    return 1LL;
  }

  __int128 v27 = 0uLL;
  __int128 v28 = 0uLL;
  __int128 v25 = 0uLL;
  __int128 v26 = 0uLL;
  uint64_t v17 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v17) {
    return 1LL;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v26;
LABEL_19:
  uint64_t v20 = 0LL;
  while (1)
  {
    if (*(void *)v26 != v19) {
      objc_enumerationMutation(v12);
    }
    uint64_t result = objc_msgSend( (id)objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v20)),  "isEqual:",  objc_msgSend(v9, "objectForKey:", *(void *)(*((void *)&v25 + 1) + 8 * v20)));
    if (!(_DWORD)result) {
      return result;
    }
    if (v18 == ++v20)
    {
      uint64_t v18 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      uint64_t result = 1LL;
      if (v18) {
        goto LABEL_19;
      }
      return result;
    }
  }

- (NSString)versionChecksum
{
  if (-[NSManagedObjectModel isEditable](self, "isEditable"))
  {
    _NSCoreDataLog( 1LL,  (uint64_t)@"Attempting to retrieve an NSManagedObjectModel version checksum while the model is still editable. This may result in an unstable verison checksum. Add model to NSPersistentStoreCoordinator and try again.",  v3,  v4,  v5,  v6,  v7,  v8,  v11);
    -[NSManagedObjectModel _setIsEditable:](self, "_setIsEditable:", 0LL);
  }

  uint64_t v9 = (void *)objc_msgSend( -[NSManagedObjectModel versionHash](self, "versionHash"),  "base64EncodedStringWithOptions:",  0);
  return (NSString *)objc_msgSend( v9,  "stringByTrimmingCharactersInSet:",  objc_msgSend(MEMORY[0x189607810], "whitespaceAndNewlineCharacterSet"));
}

+ (NSDictionary)checksumsForVersionedModelAtURL:(NSURL *)modelURL error:(NSError *)error
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v6 = (id)[MEMORY[0x189603F68] dictionary];
  uint64_t v7 = -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  -[NSURL path](modelURL, "path"));
  if (v7)
  {
    uint64_t v8 = v7;
    id v6 = -[NSManagedObjectModelBundle versionChecksums](v7, "versionChecksums");
    if (!v6) {
      id v6 = (id)[MEMORY[0x189603F68] dictionary];
    }
    id v9 = v6;
  }

  else
  {
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = *MEMORY[0x189607460];
    uint64_t v21 = *MEMORY[0x1896075E0];
    v22[0] = [NSString stringWithFormat:@"Failed to load model at URL '%@'", modelURL];
    uint64_t v13 = (NSError *)objc_msgSend( v11,  "errorWithDomain:code:userInfo:",  v12,  258,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
    id v14 = v6;
    if (v13)
    {
      _NSCoreDataLog( 1LL,  (uint64_t)@"+checksumsForVersionedModelAtURL:error: Failed to load model at URL '%@' due to error %@",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)modelURL);
      if (error) {
        *error = v13;
      }
    }
  }

  return (NSDictionary *)v6;
}

+ (id)versionsHashesForModelAtURL:(id)a3 error:(id *)a4
{
  v27[2] = *MEMORY[0x1895F89C0];
  id v25 = 0LL;
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v7 = (void *)[a3 path];
  if (!objc_msgSend((id)objc_msgSend(v7, "pathExtension"), "isEqualToString:", @"momd")
    || (uint64_t v8 = objc_msgSend( MEMORY[0x189604030],  "fileURLWithPath:isDirectory:",  objc_msgSend(v7, "stringByAppendingPathComponent:", @"VersionInfo.plist"),  0),  (v9 = (void *)objc_msgSend(MEMORY[0x189603F68], "dictionaryWithContentsOfURL:error:", v8, &v25)) == 0)
    || (v10 = objc_msgSend( (id)objc_msgSend(v9, "objectForKey:", @"NSManagedObjectModel_VersionHashes"),  "objectForKey:",  objc_msgSend(v9, "objectForKey:", @"NSManagedObjectModel_CurrentVersionName")),  id v11 = (id)v10,  !v10))
  {
    uint64_t v12 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  a3);
    uint64_t v13 = v12;
    if (v12)
    {
      uint64_t v10 = -[NSManagedObjectModel entityVersionHashesByName](v12, "entityVersionHashesByName");
      id v14 = (id)v10;
    }

    else
    {
      uint64_t v10 = 0LL;
    }
  }

  id v15 = v25;
  id v16 = (id)v10;
  [v6 drain];
  id v17 = 0LL;
  id v18 = v25;
  id v19 = (id)v10;
  id v20 = v25;
  if (!(v10 | (unint64_t)v25))
  {
    uint64_t v21 = (void *)MEMORY[0x189607870];
    v27[0] = @"Unable to model NSManagedObjectModel";
    uint64_t v22 = *MEMORY[0x1896074F8];
    v26[0] = @"reason";
    v26[1] = v22;
    v27[1] = [a3 path];
    uint64_t v23 = [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
    id v20 = (id)[v21 errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:v23];
    id v25 = v20;
  }

  if (a4 && v20) {
    *a4 = v20;
  }
  return (id)v10;
}

+ (BOOL)versionHashes:(id)a3 compatibleWithStoreMetadata:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v6 = [a4 objectForKey:@"NSStoreModelVersionHashes"];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [a3 count];
  if (v8 != [v7 count])
  {
LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_6:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(a3);
      }
      LODWORD(v6) = objc_msgSend( (id)objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v12)),  "isEqual:",  objc_msgSend(v7, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v12)));
      if (!(_DWORD)v6) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(v6) = 1;
        if (v10) {
          goto LABEL_6;
        }
        return v6;
      }
    }
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_optimizedEncoding:(id *)a3
{
  uint64_t v3 = (_BYTE *)MEMORY[0x1895F8858](self);
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  uint64_t v468 = *MEMORY[0x1895F89C0];
  [v3 _setIsEditable:0 optimizationStyle:1];
  if ((v6[64] & 4) == 0)
  {
    uint64_t v7 = (void *)[v6 copy];
    uint64_t v8 = (void *)[v7 _optimizedEncoding:v5];

    return v8;
  }

  v328 = v5;
  uint64_t v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
  v349 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x189605240] + 8LL);
  v444.versiouint64_t n = 0LL;
  v444.retaiuint64_t n = v349;
  __int128 v348 = *(_OWORD *)(MEMORY[0x189605240] + 16LL);
  *(_OWORD *)&v444.release = v348;
  uint64_t v11 = *(CFHashCode (__cdecl **)(const void *))(MEMORY[0x189605240] + 40LL);
  v444.equal = 0LL;
  v444.hash = v11;
  v443.versiouint64_t n = 0LL;
  *(_OWORD *)&v443.retaiuint64_t n = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
  v443.copyDescriptiouint64_t n = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x189605250] + 24LL);
  v443.equal = 0LL;
  uint64_t v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v340 = v6;
  uint64_t v13 = (const CFArrayCallBacks *)MEMORY[0x189605228];
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v12, 0LL, MEMORY[0x189605228]);
  v347 = CFDictionaryCreateMutable(v12, 0LL, &v444, &v443);
  v333 = CFArrayCreateMutable(v12, 0LL, v13);
  CFArrayAppendValue(v333, &stru_189EAC2E8);
  v334 = CFDictionaryCreateMutable(v12, 0LL, v10, &v443);
  CFDictionarySetValue( v334,  &stru_189EAC2E8,  (const void *)[MEMORY[0x189607968] numberWithUnsignedInteger:0]);
  v345 = CFArrayCreateMutable(v12, 0LL, v13);
  CFArrayAppendValue(v345, &stru_189EAC2E8);
  v350 = CFDictionaryCreateMutable(v12, 0LL, v10, &v443);
  CFDictionarySetValue( v350,  &stru_189EAC2E8,  (const void *)[MEMORY[0x189607968] numberWithUnsignedInteger:0]);
  v344 = CFArrayCreateMutable(v12, 0LL, v13);
  CFArrayAppendValue(v344, (const void *)[MEMORY[0x189603F48] data]);
  __int128 v14 = CFDictionaryCreateMutable(v12, 0LL, v10, &v443);
  __int128 v15 = (const void *)[MEMORY[0x189603FE8] null];
  CFDictionarySetValue(v14, v15, (const void *)[MEMORY[0x189607968] numberWithUnsignedInteger:0]);
  CFMutableArrayRef v16 = CFArrayCreateMutable(v12, 0LL, v13);
  uint64_t v17 = [*((id *)v340 + 4) mapping];
  CFMutableArrayRef v330 = v16;
  -[__CFArray addObject:](v16, "addObject:", v17);
  id v18 = CFDictionaryCreateMutable(v12, 0LL, &v444, &v443);
  uint64_t v19 = (const void *)[*((id *)v340 + 4) mapping];
  CFDictionarySetValue(v18, v19, (const void *)[MEMORY[0x189607968] numberWithUnsignedInteger:0]);
  id v20 = v13;
  uint64_t v21 = v340;
  CFMutableArrayRef v336 = CFArrayCreateMutable(v12, 0LL, v20);
  v442.versiouint64_t n = 0LL;
  v442.retaiuint64_t n = v349;
  v442.release = (CFDictionaryReleaseCallBack)v348;
  v442.equal = 0LL;
  v442.copyDescriptiouint64_t n = 0LL;
  v442.hash = v11;
  uint64_t v22 = CFDictionaryCreateMutable(v12, 0LL, &v442, &v443);
  uint64_t v23 = [*((id *)v340 + 6) count];
  v331 = v18;
  CFMutableDictionaryRef v337 = v22;
  if (v23)
  {
    __int128 v24 = -[NSKnownKeysDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithDictionary:",  *((void *)v340 + 6));
    if (!-[__CFDictionary objectForKey:](v18, "objectForKey:", -[NSKnownKeysDictionary mapping](v24, "mapping")))
    {
      uint64_t v25 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
      uint64_t v21 = v340;
      -[__CFArray addObject:](v330, "addObject:", -[NSKnownKeysDictionary mapping](v24, "mapping"));
      __int128 v26 = -[NSKnownKeysDictionary mapping](v24, "mapping");
      __int128 v27 = (const void *)v25;
      uint64_t v22 = v337;
      CFDictionarySetValue(v18, v26, v27);
    }

    v326 = v24;
    __int128 v441 = 0u;
    __int128 v440 = 0u;
    __int128 v439 = 0u;
    __int128 v438 = 0u;
    v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((void *)v21 + 6);
    uint64_t v28 = [v349 countByEnumeratingWithState:&v438 objects:v467 count:16];
    uint64_t v29 = v345;
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v439;
      do
      {
        for (uint64_t i = 0LL; i != v30; ++i)
        {
          if (*(void *)v439 != v31) {
            objc_enumerationMutation(v349);
          }
          uint64_t v33 = *(void *)(*((void *)&v438 + 1) + 8 * i);
          if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v33))
          {
            uint64_t v34 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v345, "count"));
            -[__CFArray addObject:](v345, "addObject:", v33);
            -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v34, v33);
          }

          __int128 v35 = (const void *)[*((id *)v340 + 6) objectForKey:v33];
          if (!CFDictionaryGetValue(v22, v35))
          {
            __int128 v36 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v336, "count"));
            uint64_t v22 = v337;
            -[__CFArray addObject:](v336, "addObject:", v35);
            CFDictionarySetValue(v337, v35, v36);
          }
        }

        uint64_t v30 = [v349 countByEnumeratingWithState:&v438 objects:v467 count:16];
      }

      while (v30);
    }

    uint64_t v21 = v340;
  }

  else
  {
    v326 = 0LL;
    uint64_t v29 = v345;
  }

  v325 = (objc_class *)objc_opt_class();
  v346 = (objc_class *)objc_opt_class();
  v327 = -[NSSQLModel initWithManagedObjectModel:configurationName:retainHashHack:]( objc_alloc(&OBJC_CLASS___NSSQLModel),  "initWithManagedObjectModel:configurationName:retainHashHack:",  v21,  0LL,  1LL);
  if (!v327)
  {
    if (v328) {
      uint64_t *v328 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:0];
    }
LABEL_211:
    id v193 = 0LL;
    goto LABEL_212;
  }

  __int128 v437 = 0u;
  __int128 v436 = 0u;
  __int128 v435 = 0u;
  __int128 v434 = 0u;
  __int128 v37 = (void *)*((void *)v21 + 5);
  uint64_t v38 = [v37 countByEnumeratingWithState:&v434 objects:v466 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v435;
    do
    {
      for (uint64_t j = 0LL; j != v39; ++j)
      {
        if (*(void *)v435 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v434 + 1) + 8 * j);
        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v42))
        {
          uint64_t v43 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v42);
          -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v43, v42);
        }
      }

      uint64_t v39 = [v37 countByEnumeratingWithState:&v434 objects:v466 count:16];
    }

    while (v39);
  }

  __int128 v433 = 0u;
  __int128 v432 = 0u;
  __int128 v431 = 0u;
  __int128 v430 = 0u;
  v349 = (const void *(__cdecl *)(CFAllocatorRef, const void *))*((void *)v340 + 7);
  uint64_t v44 = [v349 countByEnumeratingWithState:&v430 objects:v465 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v431;
    do
    {
      for (uint64_t k = 0LL; k != v45; ++k)
      {
        if (*(void *)v431 != v46) {
          objc_enumerationMutation(v349);
        }
        v48 = *(const void **)(*((void *)&v430 + 1) + 8 * k);
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v48))
        {
          uint64_t v49 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
          -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v48 requiringSecureCoding:1 error:0]);
          CFDictionarySetValue(v14, v48, v49);
        }
      }

      uint64_t v45 = [v349 countByEnumeratingWithState:&v430 objects:v465 count:16];
    }

    while (v45);
  }

  __int128 v429 = 0u;
  __int128 v428 = 0u;
  __int128 v427 = 0u;
  __int128 v426 = 0u;
  id v50 = (id)[*((id *)v340 + 4) allValues];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v426 objects:v464 count:16];
  *(void *)&__int128 v348 = v14;
  if (!v51)
  {
    unsigned int v342 = 0;
    unsigned int v332 = 0;
    uint64_t v323 = 0LL;
    uint64_t v324 = 0LL;
    LODWORD(v349) = 0;
    goto LABEL_244;
  }

  unsigned int v342 = 0;
  unsigned int v332 = 0;
  uint64_t v323 = 0LL;
  uint64_t v324 = 0LL;
  LODWORD(v349) = 0;
  uint64_t v52 = *(void *)v427;
  v53 = v347;
  id v318 = v50;
  uint64_t v320 = v52;
  do
  {
    uint64_t v54 = 0LL;
    uint64_t v319 = v51;
    do
    {
      if (*(void *)v427 != v52)
      {
        uint64_t v55 = v54;
        objc_enumerationMutation(v50);
        uint64_t v54 = v55;
      }

      uint64_t v321 = v54;
      id v56 = *(id *)(*((void *)&v426 + 1) + 8 * v54);
      uint64_t v322 = objc_msgSend(v56, "name", v318);
      id v329 = v56;
      if (!-[__CFDictionary objectForKey:](v350, "objectForKey:"))
      {
        uint64_t v57 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
        -[__CFArray addObject:](v29, "addObject:", v322);
        id v56 = v329;
        -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v57, v322);
      }

      uint64_t v58 = [v56 versionHashModifier];
      if (v58)
      {
        uint64_t v59 = v58;
        if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v58))
        {
          uint64_t v60 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          -[__CFArray addObject:](v333, "addObject:", v59);
          uint64_t v61 = v60;
          id v56 = v329;
          -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v61, v59);
        }
      }

      uint64_t v62 = [v56 versionHash];
      if (v62)
      {
        uint64_t v63 = (const void *)v62;
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v62))
        {
          uint64_t v64 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:](v344, "addObject:", v63);
          uint64_t v65 = (const void *)v64;
          id v56 = v329;
          CFDictionarySetValue(v14, v63, v65);
        }
      }

      uint64_t v66 = [v56 managedObjectClassName];
      if (v66)
      {
        uint64_t v67 = v66;
        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v66))
        {
          uint64_t v68 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v67);
          uint64_t v69 = v68;
          id v56 = v329;
          -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v69, v67);
        }
      }

      uint64_t v70 = [v56 renamingIdentifier];
      if (v70)
      {
        uint64_t v71 = v70;
        if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v70))
        {
          uint64_t v72 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
          -[__CFArray addObject:](v333, "addObject:", v71);
          uint64_t v73 = v72;
          id v56 = v329;
          -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v73, v71);
        }
      }

      uint64_t v74 = [v56 coreSpotlightDisplayNameExpression];
      if (v74)
      {
        __int128 v75 = (const void *)v74;
        if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v74))
        {
          uint64_t v76 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
          -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v75 requiringSecureCoding:1 error:0]);
          __int128 v77 = (const void *)v76;
          id v56 = v329;
          CFDictionarySetValue(v14, v75, v77);
        }
      }

      __int128 v424 = 0u;
      __int128 v425 = 0u;
      __int128 v422 = 0u;
      __int128 v423 = 0u;
      id v335 = (id)[v56 indexes];
      uint64_t v339 = [v335 countByEnumeratingWithState:&v422 objects:v463 count:16];
      if (v339)
      {
        uint64_t v338 = *(void *)v423;
        do
        {
          __int128 v78 = 0LL;
          do
          {
            if (*(void *)v423 != v338) {
              objc_enumerationMutation(v335);
            }
            v341 = v78;
            __int128 v79 = *(void **)(*((void *)&v422 + 1) + 8LL * (void)v78);
            uint64_t v80 = [v79 name];
            if (v80)
            {
              uint64_t v81 = v80;
              if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v80))
              {
                uint64_t v82 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                -[__CFArray addObject:](v29, "addObject:", v81);
                -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v82, v81);
              }
            }

            uint64_t v83 = [v79 partialIndexPredicate];
            if (v83)
            {
              __int128 v84 = (const void *)v83;
              if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v83))
              {
                uint64_t v85 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v84 requiringSecureCoding:1 error:0]);
                CFDictionarySetValue(v14, v84, v85);
              }
            }

            __int128 v420 = 0u;
            __int128 v421 = 0u;
            __int128 v418 = 0u;
            __int128 v419 = 0u;
            uint64_t v86 = (void *)[v79 elements];
            uint64_t v87 = [v86 countByEnumeratingWithState:&v418 objects:v462 count:16];
            if (v87)
            {
              uint64_t v88 = v87;
              uint64_t v89 = *(void *)v419;
              do
              {
                for (uint64_t m = 0LL; m != v88; ++m)
                {
                  if (*(void *)v419 != v89) {
                    objc_enumerationMutation(v86);
                  }
                  uint64_t v91 = *(void **)(*((void *)&v418 + 1) + 8 * m);
                  uint64_t v92 = [v91 propertyName];
                  if (v92)
                  {
                    uint64_t v93 = v92;
                    if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v92))
                    {
                      uint64_t v94 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v345, "count"));
                      __int128 v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v345, "addObject:", v93);
                      uint64_t v95 = v94;
                      v53 = v347;
                      -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v95, v93);
                    }
                  }

                  uint64_t v96 = (void *)[v91 property];
                  if ([v96 _propertyType] == 5)
                  {
                    if (!-[__CFDictionary objectForKey:](v53, "objectForKey:", v96))
                    {
                      uint64_t v97 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](Mutable, "count"));
                      v53 = v347;
                      -[__CFArray addObject:](Mutable, "addObject:", v96);
                      CFDictionarySetValue(v347, v96, v97);
                    }

                    uint64_t v98 = [v96 name];
                    if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v98))
                    {
                      uint64_t v99 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v345, "count"));
                      __int128 v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v345, "addObject:", v98);
                      uint64_t v100 = v99;
                      v53 = v347;
                      -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v100, v98);
                    }

                    LODWORD(v349) = (_DWORD)v349 + 1;
                    uint64_t v101 = [v96 expression];
                    if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v101))
                    {
                      uint64_t v102 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                      __int128 v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v101 requiringSecureCoding:1 error:0]);
                      [(id)v348 setObject:v102 forKey:v101];
                    }
                  }
                }

                v342 += v88;
                uint64_t v88 = [v86 countByEnumeratingWithState:&v418 objects:v462 count:16];
              }

              while (v88);
            }

            __int128 v78 = v341 + 1;
            uint64_t v29 = v345;
          }

          while (v341 + 1 != (char *)v339);
          v332 += v339;
          uint64_t v339 = [v335 countByEnumeratingWithState:&v422 objects:v463 count:16];
        }

        while (v339);
      }

      id v103 = v329;
      v104 = (void *)[v329 userInfo];
      if ([v104 count] && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v104))
      {
        uint64_t v105 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v344, "count"));
        -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v104 requiringSecureCoding:1 error:0]);
        uint64_t v106 = (const void *)v105;
        id v103 = v329;
        CFDictionarySetValue(v14, v104, v106);
      }

      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v103 _propertySearchMapping]))
      {
        v107 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v330, "count"));
        id v103 = v329;
        -[__CFArray addObject:](v330, "addObject:", [v329 _propertySearchMapping]);
        CFDictionarySetValue(v331, (const void *)[v329 _propertySearchMapping], v107);
      }

      if ([v103 subentitiesByName])
      {
        if (objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "count"))
        {
          v108 = (const void *)objc_msgSend((id)objc_msgSend(v103, "subentitiesByName"), "mapping");
          if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", v108))
          {
            uint64_t v109 = (void *)MEMORY[0x189607968];
            uint64_t v110 = -[__CFArray count](v330, "count");
            __int128 v111 = v109;
            id v103 = v329;
            CFDictionarySetValue(v331, v108, (const void *)[v111 numberWithUnsignedInteger:v110]);
            -[__CFArray addObject:](v330, "addObject:", v108);
          }
        }
      }

      __int128 v112 = (void *)[v103 attributesByName];
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v112 mapping]))
      {
        uint64_t v113 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", [v112 mapping]);
        __int128 v114 = (const void *)[v112 mapping];
        __int128 v115 = (const void *)v113;
        id v103 = v329;
        CFDictionarySetValue(v331, v114, v115);
      }

      __int128 v116 = (void *)[v103 relationshipsByName];
      if (!-[__CFDictionary objectForKey:](v331, "objectForKey:", [v116 mapping]))
      {
        uint64_t v117 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v330, "count"));
        -[__CFArray addObject:](v330, "addObject:", [v116 mapping]);
        __int128 v118 = (const void *)[v116 mapping];
        __int128 v119 = (const void *)v117;
        id v103 = v329;
        CFDictionarySetValue(v331, v118, v119);
      }

      __int128 v416 = 0u;
      __int128 v417 = 0u;
      __int128 v414 = 0u;
      __int128 v415 = 0u;
      __int128 v120 = (void *)[v103 properties];
      uint64_t v121 = [v120 countByEnumeratingWithState:&v414 objects:v461 count:16];
      if (v121)
      {
        uint64_t v122 = v121;
        id v123 = *(id *)v415;
        uint64_t v338 = (uint64_t)v120;
        id v335 = v123;
LABEL_105:
        id v124 = 0LL;
        uint64_t v339 = v122;
        while (1)
        {
          if (*(id *)v415 != v123) {
            objc_enumerationMutation(v120);
          }
          __int128 v125 = *(void **)(*((void *)&v414 + 1) + 8LL * (void)v124);
          uint64_t v126 = [v125 name];
          if (object_getClass(v125) != v325) {
            break;
          }
LABEL_192:
          id v124 = (char *)v124 + 1;
          if (v124 == (id)v122)
          {
            uint64_t v122 = [v120 countByEnumeratingWithState:&v414 objects:v461 count:16];
            v53 = v347;
            if (!v122) {
              goto LABEL_194;
            }
            goto LABEL_105;
          }
        }

        if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v126))
        {
          uint64_t v127 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
          -[__CFArray addObject:](v29, "addObject:", v126);
          -[__CFDictionary setValue:forKey:](v350, "setValue:forKey:", v127, v126);
        }

        uint64_t v128 = [v125 versionHashModifier];
        if (v128)
        {
          uint64_t v129 = v128;
          if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v128))
          {
            uint64_t v130 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            -[__CFArray addObject:](v333, "addObject:", v129);
            -[__CFDictionary setValue:forKey:](v334, "setValue:forKey:", v130, v129);
          }
        }

        uint64_t v131 = [v125 versionHash];
        if (v131)
        {
          __int128 v132 = (const void *)v131;
          if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v131))
          {
            __int128 v133 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
            -[__CFArray addObject:](v344, "addObject:", v132);
            CFDictionarySetValue(v14, v132, v133);
          }
        }

        __int128 v134 = (void *)[v125 renamingIdentifier];
        if (v134)
        {
          __int128 v135 = v134;
          if ((objc_msgSend(v134, "isEqualToString:", objc_msgSend(v125, "name")) & 1) == 0
            && !-[__CFDictionary objectForKey:](v334, "objectForKey:", v135))
          {
            uint64_t v136 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
            -[__CFArray addObject:](v333, "addObject:", v135);
            -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v136, v135);
          }
        }

        __int128 v137 = (void *)[v125 userInfo];
        if ([v137 count] && !-[__CFDictionary objectForKey:](v14, "objectForKey:", v137))
        {
          v138 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
          -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v137 requiringSecureCoding:1 error:0]);
          CFDictionarySetValue(v14, v137, v138);
        }

        v139 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](Mutable, "count"));
        -[__CFArray addObject:](Mutable, "addObject:", v125);
        CFDictionarySetValue(v347, v125, v139);
        uint64_t v140 = [v125 _propertyType];
        v341 = (char *)v124;
        switch(v140)
        {
          case 2LL:
          case 6LL:
            uint64_t v141 = v140;
            uint64_t v142 = [v125 attributeValueClassName];
            if (v142)
            {
              uint64_t v143 = v142;
              if (!-[__CFDictionary objectForKey:](v350, "objectForKey:", v142))
              {
                uint64_t v144 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
                -[__CFArray addObject:](v29, "addObject:", v143);
                -[__CFDictionary setObject:forKey:](v350, "setObject:forKey:", v144, v143);
              }
            }

            uint64_t v145 = [v125 valueTransformerName];
            if (v145)
            {
              uint64_t v146 = v145;
              if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v145))
              {
                uint64_t v147 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v333, "count"));
                -[__CFArray addObject:](v333, "addObject:", v146);
                -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v147, v146);
              }
            }

            uint64_t v148 = [v125 defaultValue];
            if (!v148) {
              goto LABEL_157;
            }
            v149 = (void *)v148;
            uint64_t v150 = [v125 attributeType];
            if (v150 <= 499)
            {
              if (v150 <= 299)
              {
                if (v150 != 100 && v150 != 200) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }

              if (v150 == 300) {
                goto LABEL_157;
              }
              if (v150 != 400)
              {
LABEL_155:
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v149))
                {
                  uint64_t v155 = [MEMORY[0x1896078F8] archivedDataWithRootObject:v149 requiringSecureCoding:1 error:0];
                  v156 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                  __int128 v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:](v344, "addObject:", v155);
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v149, v156);
                }

                goto LABEL_157;
              }

              v149 = (void *)[v149 stringValue];
              if (-[__CFDictionary objectForKey:](v350, "objectForKey:", v149))
              {
LABEL_157:
                if (v141 == 6)
                {
                  uint64_t v157 = [v125 derivationExpression];
                  if (v157)
                  {
                    v158 = (const void *)v157;
                    if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v157))
                    {
                      uint64_t v159 = [MEMORY[0x1896078F8] archivedDataWithRootObject:v158 requiringSecureCoding:1 error:0];
                      v160 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                      __int128 v14 = (__CFDictionary *)v348;
                      -[__CFArray addObject:](v344, "addObject:", v159);
                      CFDictionarySetValue((CFMutableDictionaryRef)v348, v158, v160);
                    }
                  }

                  if (v125)
                  {
                    v161 = (const void *)v125[16];
                    if (v161)
                    {
                      if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v125[16]))
                      {
                        uint64_t v162 = [MEMORY[0x1896078F8] archivedDataWithRootObject:v161 requiringSecureCoding:1 error:0];
                        v163 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                        __int128 v14 = (__CFDictionary *)v348;
                        -[__CFArray addObject:](v344, "addObject:", v162);
                        CFDictionarySetValue((CFMutableDictionaryRef)v348, v161, v163);
                      }
                    }
                  }

                  ++HIDWORD(v323);
                }

                else
                {
                  LODWORD(v323) = v323 + 1;
                }

                goto LABEL_167;
              }

              uint64_t v153 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v29, "count"));
              -[__CFArray addObject:](v29, "addObject:", v149);
              v154 = v350;
            }

            else
            {
              if (v150 <= 699)
              {
                if (v150 != 500 && v150 != 600) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }

              if (v150 != 700)
              {
                if (v150 != 800 && v150 != 900) {
                  goto LABEL_155;
                }
                goto LABEL_157;
              }

              if (-[__CFDictionary objectForKey:](v334, "objectForKey:", v149)) {
                goto LABEL_157;
              }
              uint64_t v153 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[__CFArray count](v333, "count"));
              -[__CFArray addObject:](v333, "addObject:", v149);
              v154 = v334;
            }

            -[__CFDictionary setObject:forKey:](v154, "setObject:forKey:", v153, v149);
            goto LABEL_157;
          case 3LL:
            ++HIDWORD(v324);
            v151 = (const void *)[v125 fetchRequest];
            if (!CFDictionaryGetValue(v337, v151))
            {
              v152 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v336, "count"));
              -[__CFArray addObject:](v336, "addObject:", v151);
              CFDictionarySetValue(v337, v151, v152);
            }

            goto LABEL_167;
          case 4LL:
            LODWORD(v324) = v324 + 1;
LABEL_167:
            __int128 v412 = 0u;
            __int128 v413 = 0u;
            __int128 v410 = 0u;
            __int128 v411 = 0u;
            v164 = v125;
            v165 = (void *)[v125 _rawValidationPredicates];
            uint64_t v166 = [v165 countByEnumeratingWithState:&v410 objects:v460 count:16];
            if (v166)
            {
              uint64_t v167 = v166;
              uint64_t v168 = *(void *)v411;
              do
              {
                for (uint64_t n = 0LL; n != v167; ++n)
                {
                  if (*(void *)v411 != v168) {
                    objc_enumerationMutation(v165);
                  }
                  v170 = *(const void **)(*((void *)&v410 + 1) + 8 * n);
                  if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v170))
                  {
                    v171 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                    __int128 v14 = (__CFDictionary *)v348;
                    -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v170 requiringSecureCoding:1 error:0]);
                    CFDictionarySetValue((CFMutableDictionaryRef)v348, v170, v171);
                  }
                }

                uint64_t v167 = [v165 countByEnumeratingWithState:&v410 objects:v460 count:16];
              }

              while (v167);
            }

            __int128 v408 = 0u;
            __int128 v409 = 0u;
            __int128 v406 = 0u;
            __int128 v407 = 0u;
            v172 = (void *)[v164 _rawValidationWarnings];
            uint64_t v173 = [v172 countByEnumeratingWithState:&v406 objects:v459 count:16];
            if (!v173)
            {
              uint64_t v29 = v345;
              goto LABEL_191;
            }

            uint64_t v174 = v173;
            uint64_t v175 = *(void *)v407;
            uint64_t v29 = v345;
            while (2)
            {
              uint64_t v176 = 0LL;
LABEL_179:
              if (*(void *)v407 != v175) {
                objc_enumerationMutation(v172);
              }
              v177 = *(void **)(*((void *)&v406 + 1) + 8 * v176);
              if ([v177 isNSString])
              {
                if (!-[__CFDictionary objectForKey:](v334, "objectForKey:", v177))
                {
                  uint64_t v178 = objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v333, "count"));
                  uint64_t v29 = v345;
                  -[__CFArray addObject:](v333, "addObject:", v177);
                  -[__CFDictionary setObject:forKey:](v334, "setObject:forKey:", v178, v177);
                }

                goto LABEL_187;
              }

              if ([v177 isNSNumber])
              {
                if (!-[__CFDictionary objectForKey:](v14, "objectForKey:", v177))
                {
                  v179 = (const void *)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[__CFArray count](v344, "count"));
                  __int128 v14 = (__CFDictionary *)v348;
                  -[__CFArray addObject:]( v344,  "addObject:",  [MEMORY[0x1896078F8] archivedDataWithRootObject:v177 requiringSecureCoding:1 error:0]);
                  CFDictionarySetValue((CFMutableDictionaryRef)v348, v177, v179);
                }

- (NSManagedObjectModel)initWithContentsOfURL:(id)a3 forStoreMetadata:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v7 = (void *)[MEMORY[0x1896078A8] defaultManager];
  uint64_t v8 = [a3 path];
  if (![v7 fileExistsAtPath:v8 isDirectory:&v14])
  {
LABEL_6:
    uint64_t v10 = 0LL;
    goto LABEL_12;
  }

  if (v14)
  {
    uint64_t v9 =  -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  v8);
    if (v9)
    {
      uint64_t v10 = (NSManagedObjectModel *) -[NSManagedObjectModelBundle _modelForVersionHashes:]( v9,  "_modelForVersionHashes:",  [a4 objectForKey:@"NSStoreModelVersionHashes"]);
      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }

    goto LABEL_6;
  }

  uint64_t v11 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  a3);
  if (!-[NSManagedObjectModel isConfiguration:compatibleWithStoreMetadata:]( v11,  "isConfiguration:compatibleWithStoreMetadata:",  0LL,  a4)
    && !-[NSManagedObjectModel _isConfiguration:inStyle:compatibleWithStoreMetadata:]( (uint64_t)v11,  v12,  1LL,  a4))
  {
    uint64_t v10 = 0LL;
    goto LABEL_11;
  }

  uint64_t v10 = v11;
  if (v11)
  {
LABEL_10:
    uint64_t v11 = -[NSValidationErrorLocalizationPolicy initWithURL:]( objc_alloc(&OBJC_CLASS___NSValidationErrorLocalizationPolicy),  "initWithURL:",  a3);
    -[NSManagedObjectModel _setLocalizationPolicy:](v10, "_setLocalizationPolicy:", v11);
LABEL_11:
  }

- (void)_addEntity:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [a3 name];
    if (v5)
    {
      uint64_t v6 = v5;
      if (!-[NSMutableDictionary objectForKey:](self->_entities, "objectForKey:", v5))
      {
        -[NSMutableDictionary setObject:forKey:](self->_entities, "setObject:forKey:", a3, v6);
        -[NSEntityDescription _setManagedObjectModel:](a3, (uint64_t)self);
        return;
      }

      uint64_t v10 = (void *)MEMORY[0x189603F70];
      uint64_t v11 = *MEMORY[0x189603A58];
      uint64_t v9 = (const __CFString *)[NSString stringWithFormat:@"Model already contains an entity named %@.", v6];
      uint64_t v7 = v10;
      uint64_t v8 = v11;
    }

    else
    {
      uint64_t v7 = (void *)MEMORY[0x189603F70];
      uint64_t v8 = *MEMORY[0x189603A60];
      uint64_t v9 = @"Can't add unnamed entity to model.";
    }

    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
    -[NSManagedObjectModel versionHash](v12, v13);
  }

- (id)versionHash
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v3 = malloc_default_zone();
  }
  uint64_t v4 = (unsigned __int8 *)malloc_zone_malloc(v3, 0x20uLL);
  CC_SHA256_Init(&c);
  uint64_t v5 = (void *)objc_msgSend( (id)-[NSMutableDictionary allValues](self->_entities, "allValues"),  "sortedArrayUsingFunction:context:",  _compareEntitiesByName,  0);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        CC_SHA256_Update( &c,  (const void *)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9++), "versionHash"),  "bytes"),  0x20u);
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v7);
  }

  CC_SHA256_Final(v4, &c);
  uint64_t v10 = (void *)[MEMORY[0x189603F48] dataWithBytes:v4 length:32];
  uint64_t v11 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v11 = malloc_default_zone();
  }
  malloc_zone_free(v11, v4);
  return v10;
}

- (NSManagedObjectModel)initWithContentsOfOptimizedURL:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v5 = (void *)[MEMORY[0x1896078A8] defaultManager];
  uint64_t v6 = (_PFVMData *)[a3 path];
  char v15 = 0;
  char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v15];
  if (v15) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  if ((v8 & 1) != 0)
  {
    uint64_t v6 = 0LL;
LABEL_6:
    uint64_t v9 = 0LL;
    int v10 = 1;
    goto LABEL_13;
  }

  if (v6)
  {
    uint64_t v6 = -[_PFVMData initWithContentsOfFile:options:error:]( objc_alloc(&OBJC_CLASS____PFVMData),  "initWithContentsOfFile:options:error:",  v6,  0LL,  0LL);
    if (!-[_PFVMData length](v6, "length")) {
      goto LABEL_6;
    }
    +[NSManagedObjectModel _newModelFromOptimizedEncoding:error:]( (uint64_t)&OBJC_CLASS___NSManagedObjectModel,  (const __CFData *)v6);
    uint64_t v9 = v11;
    if (v11)
    {
      uint64_t v12 = -[NSValidationErrorLocalizationPolicy initWithURL:]( objc_alloc(&OBJC_CLASS___NSValidationErrorLocalizationPolicy),  "initWithURL:",  a3);
      -[NSManagedObjectModel _setLocalizationPolicy:](v9, "_setLocalizationPolicy:", v12);
    }

    int v10 = 0;
  }

  else
  {
    int v10 = 0;
    uint64_t v9 = 0LL;
  }

+ (void)_newModelFromOptimizedEncoding:(uint64_t)a1 error:(const __CFData *)a2
{
  v308[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2)
  {
    objc_opt_class();
    objc_opt_class();
    v308[0] = 0LL;
    BytePtr = (unsigned int *)CFDataGetBytePtr(a2);
    if ((unint64_t)-[__CFData length](a2, "length") >= 0x40)
    {
      if (!memcmp("momv2$srsraori55717101jhus-[6910aathnnhi86786714[-;uadmiraenv143", BytePtr, 0x40uLL))
      {
        uint64_t v4 = 13LL;
      }

      else
      {
        if ((unint64_t)-[__CFData length](a2, "length") < 0x40
          || memcmp("momv2$8129374fj;a30[5yo-]0-87ujuhok'p0907ljnlmmji870-oi43902[349", BytePtr, 0x40uLL))
        {
          return;
        }

        uint64_t v4 = 12LL;
      }

      unint64_t v5 = -[__CFData length](a2, "length");
      if (v5 >= 0x9C)
      {
        unint64_t v6 = v5;
        unint64_t v307 = bswap32(BytePtr[16]);
        unsigned int v7 = BytePtr[18];
        char v8 = (char *)bswap32(v7);
        if (v8 <= 0x10000)
        {
          unsigned int v9 = BytePtr[20];
          uint64_t v10 = bswap32(v9);
          if (v10 <= 0x10000)
          {
            uint64_t v11 = (void *)bswap32(BytePtr[21]);
            if (v11 <= 0x10000)
            {
              unsigned int v12 = BytePtr[22];
              uint64_t v13 = bswap32(v12);
              if (v13 <= 0x10000)
              {
                unsigned int v14 = BytePtr[23];
                uint64_t v15 = bswap32(v14);
                if (v15 <= 0x10000)
                {
                  unsigned int v16 = BytePtr[24];
                  uint64_t v17 = bswap32(v16);
                  if (v17 <= 0x10000)
                  {
                    unsigned int v18 = BytePtr[25];
                    uint64_t v19 = bswap32(v18);
                    if (v19 <= 0x10000)
                    {
                      unsigned int v20 = BytePtr[27];
                      uint64_t v21 = bswap32(v20);
                      if (v21 <= 0x10000)
                      {
                        unsigned int v22 = BytePtr[29];
                        uint64_t v23 = bswap32(v22);
                        if (v23 <= 0x10000)
                        {
                          unsigned int v24 = BytePtr[31];
                          uint64_t v25 = bswap32(v24);
                          if (v25 <= 0x10000)
                          {
                            unsigned int v26 = BytePtr[33];
                            uint64_t v27 = bswap32(v26);
                            if (v27 <= 0x10000)
                            {
                              unsigned int v28 = BytePtr[35];
                              unint64_t v29 = bswap32(v28);
                              if (v29 <= 0x10000)
                              {
                                LODWORD(v295) = BytePtr[21];
                                LODWORD(v296) = v12;
                                unsigned int v30 = BytePtr[36];
                                uint64_t v31 = bswap32(v30);
                                if (v31 <= 0x10000)
                                {
                                  LODWORD(v293) = v18;
                                  LODWORD(v294) = v9;
                                  unint64_t v32 = bswap32(BytePtr[37]);
                                  if (v32 <= 0x10000)
                                  {
                                    unint64_t v33 = bswap32(BytePtr[38]);
                                    if (v33 <= 0x10000 && v31 + v19 <= v29)
                                    {
                                      unsigned int v273 = v14;
                                      unint64_t v277 = v32;
                                      unsigned int v268 = v30;
                                      unsigned int v272 = v16;
                                      uint64_t v274 = (unint64_t **)v4;
                                      unsigned int v269 = v28;
                                      unsigned int v270 = v7;
                                      uint64_t v280 = v19;
                                      uint64_t v289 = v23;
                                      unint64_t v276 = v33;
                                      unsigned int v285 = v20;
                                      uint64_t v288 = v21;
                                      unsigned int v278 = v8;
                                      unint64_t v279 = v29;
                                      uint64_t v281 = v17;
                                      uint64_t v282 = v15;
                                      uint64_t v283 = v13;
                                      id v286 = v11;
                                      uint64_t v287 = v10;
                                      unsigned int v292 = v24;
                                      uint64_t v290 = v25;
                                      v297 = &v249;
                                      unsigned int v271 = BytePtr[17];
                                      LODWORD(v275) = BytePtr[19];
                                      unsigned int v34 = BytePtr[28];
                                      unsigned int v35 = BytePtr[30];
                                      unint64_t v36 = bswap32(BytePtr[32]);
                                      unsigned int v267 = BytePtr[34];
                                      MEMORY[0x1895F8858](v8);
                                      if (v27 > 0x200)
                                      {
                                        uint64_t v39 = (char *)NSAllocateScannedUncollectable();
                                        uint64_t v291 = v39;
                                      }

                                      else
                                      {
                                        uint64_t v291 = (char *)&v249 - v38;
                                        bzero((char *)&v249 - v38, 8 * v37);
                                      }

                                      unint64_t v306 = v36;
                                      uint64_t v40 = (v36 + 3) & 0x1FFFFFFFCLL;
                                      unint64_t v41 = v40 + 4;
                                      if (v40 + 4 <= v6)
                                      {
                                        unsigned int v42 = bswap32(*(unsigned int *)((char *)BytePtr + v40));
                                        unint64_t v306 = v41;
                                      }

                                      else
                                      {
                                        unsigned int v42 = 0;
                                      }

                                      if (v42 == (_DWORD)v27)
                                      {
                                        if (v26)
                                        {
                                          uint64_t v43 = v291;
                                          uint64_t v44 = v27;
                                          while (1)
                                          {
                                            uint64_t v39 = (char *)_readPFEncodedStringFromData( (uint64_t)a2,  (uint64_t)BytePtr,  &v306,  v6);
                                            if (!v39) {
                                              break;
                                            }
                                            *v43++ = v39;
                                            if (!--v44) {
                                              goto LABEL_37;
                                            }
                                          }
                                        }

                                        else
                                        {
LABEL_37:
                                          uint64_t v45 = bswap32(v35);
                                          unsigned int v46 = v290;
                                          MEMORY[0x1895F8858](v39);
                                          uint64_t v49 = (unint64_t **)((char *)&v249 - v48);
                                          if (v46 > 0x200)
                                          {
                                            uint64_t v50 = NSAllocateScannedUncollectable();
                                            uint64_t v49 = (unint64_t **)v50;
                                          }

                                          else
                                          {
                                            bzero((char *)&v249 - v48, 8 * v47);
                                          }

                                          uint64_t v305 = v45;
                                          uint64_t v51 = (v45 + 3) & 0x1FFFFFFFCLL;
                                          uint64_t v52 = v51 + 4;
                                          if (v51 + 4 <= v6)
                                          {
                                            unsigned int v53 = bswap32(*(unsigned int *)((char *)BytePtr + v51));
                                            uint64_t v305 = v52;
                                          }

                                          else
                                          {
                                            unsigned int v53 = 0;
                                          }

                                          if (v53 != v46) {
                                            return;
                                          }
                                          v266 = v49;
                                          if (v292)
                                          {
                                            uint64_t v54 = v266;
                                            uint64_t v55 = v290;
                                            while (1)
                                            {
                                              id v56 = _newReadStringFromBytes((uint64_t)BytePtr, &v305, v6);
                                              uint64_t v57 = v56;
                                              if (!v56) {
                                                break;
                                              }
                                              *v54++ = (unint64_t *)[v56 mutableCopy];

                                              if (!--v55) {
                                                goto LABEL_48;
                                              }
                                            }
                                          }

                                          else
                                          {
LABEL_48:
                                            unint64_t v58 = bswap32(v34);
                                            uint64_t v59 = v289;
                                            MEMORY[0x1895F8858](v50);
                                            uint64_t v62 = (uint64_t *)((char *)&v249 - v61);
                                            if (v59 > 0x200)
                                            {
                                              uint64_t v63 = NSAllocateScannedUncollectable();
                                              uint64_t v62 = (uint64_t *)v63;
                                            }

                                            else
                                            {
                                              bzero((char *)&v249 - v61, 8 * v60);
                                            }

                                            unint64_t v304 = v58;
                                            uint64_t v64 = (v58 + 3) & 0x1FFFFFFFCLL;
                                            unint64_t v65 = v64 + 4;
                                            if (v64 + 4 <= v6)
                                            {
                                              unsigned int v66 = bswap32(*(unsigned int *)((char *)BytePtr + v64));
                                              unint64_t v304 = v65;
                                            }

                                            else
                                            {
                                              unsigned int v66 = 0;
                                            }

                                            if (v66 != (_DWORD)v59) {
                                              return;
                                            }
                                            if (v22)
                                            {
                                              uint64_t v67 = v62;
                                              while (1)
                                              {
                                                uint64_t v63 = (uint64_t)_readPFEncodedDataFromData( (uint64_t)a2,  (uint64_t)BytePtr,  &v304,  v6);
                                                if (!v63) {
                                                  break;
                                                }
                                                *v67++ = v63;
                                                if (!--v59) {
                                                  goto LABEL_59;
                                                }
                                              }
                                            }

                                            else
                                            {
LABEL_59:
                                              uint64_t v68 = v288;
                                              uint64_t v69 = 8 * v288;
                                              uint64_t v70 = MEMORY[0x1895F8858](v63);
                                              uint64_t v71 = (void **)((char *)&v249 - ((v69 + 15) & 0xFFFFFFFF0LL));
                                              unint64_t v303 = v72;
                                              uint64_t v73 = (v72 + 3) & 0x1FFFFFFFCLL;
                                              unint64_t v74 = v73 + 4;
                                              if (v73 + 4 <= v6)
                                              {
                                                unsigned int v75 = bswap32(*(unsigned int *)((char *)BytePtr + v73));
                                                unint64_t v303 = v74;
                                              }

                                              else
                                              {
                                                unsigned int v75 = 0;
                                              }

                                              if (v75 != (_DWORD)v68) {
                                                return;
                                              }
                                              if (v285)
                                              {
                                                uint64_t v76 = (char *)v62;
                                                __int128 v77 = (uint64_t *)((char *)&v249 - ((v69 + 15) & 0xFFFFFFFF0LL));
                                                uint64_t v78 = v68;
                                                while (1)
                                                {
                                                  uint64_t v79 = _newReadKKDMappingStrategyFromByes( (uint64_t)a2,  (uint64_t)BytePtr,  &v303,  v6,  (uint64_t)v291);
                                                  if (!v79) {
                                                    break;
                                                  }
                                                  *v77++ = v79;
                                                  if (!--v78)
                                                  {
                                                    MEMORY[0x1895F8858](v79);
                                                    uint64_t v80 = (char *)&v249 - ((v69 + 15) & 0xFFFFFFFF0LL);
                                                    Class v81 = NSClassFromString((NSString *)@"NSKnownKeysDictionary2");
                                                    uint64_t v82 = 0LL;
                                                    do
                                                    {
                                                      Class v83 = (Class)-[objc_class newInstanceWithSearchStrategy:inData:]( v81,  "newInstanceWithSearchStrategy:inData:",  v71[v82],  a2);
                                                      *(void *)&v80[8 * v82++] = v83;
                                                    }

                                                    while (v68 != v82);
                                                    __int128 v84 = v80;
                                                    uint64_t v265 = v71;
                                                    uint64_t v62 = (uint64_t *)v76;
                                                    goto LABEL_71;
                                                  }
                                                }
                                              }

                                              else
                                              {
                                                uint64_t v265 = (void **)((char *)&v249 - ((v69 + 15) & 0xFFFFFFFF0LL));
                                                MEMORY[0x1895F8858](v70);
                                                __int128 v84 = (char *)&v249 - ((v69 + 15) & 0xFFFFFFFF0LL);
                                                Class v83 = NSClassFromString((NSString *)@"NSKnownKeysDictionary2");
LABEL_71:
                                                MEMORY[0x1895F8858](v83);
                                                uint64_t v87 = (char *)&v249 - v86;
                                                if (v88 >= 0x1FF)
                                                {
                                                  uint64_t v89 = NSAllocateScannedUncollectable();
                                                  uint64_t v87 = (char *)v89;
                                                  if (!v89)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v114 = v290;
                                                      __int128 v115 = (void **)v266;
                                                      do
                                                      {
                                                        __int128 v116 = *v115++;

                                                        --v114;
                                                      }

                                                      while (v114);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  bzero((char *)&v249 - v86, 8 * v85);
                                                }

                                                MEMORY[0x1895F8858](v89);
                                                uint64_t v92 = (uint64_t *)((char *)&v249 - v91);
                                                if (v93 > 0x1FE)
                                                {
                                                  uint64_t v94 = NSAllocateScannedUncollectable();
                                                  uint64_t v92 = (uint64_t *)v94;
                                                  if (!v94)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v121 = v290;
                                                      uint64_t v122 = (void **)v266;
                                                      do
                                                      {
                                                        id v123 = *v122++;

                                                        --v121;
                                                      }

                                                      while (v121);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  bzero((char *)&v249 - v91, 8 * v90);
                                                }

                                                uint64_t v95 = MEMORY[0x1895F8858](v94);
                                                uint64_t v264 = (void **)v248;
                                                v248[0] = 0LL;
                                                v248[1] = 0LL;
                                                MEMORY[0x1895F8858](v95);
                                                uint64_t v98 = (char *)&v249 - v97;
                                                if (v99 > 0x1FE)
                                                {
                                                  uint64_t v100 = NSAllocateScannedUncollectable();
                                                  uint64_t v98 = (char *)v100;
                                                  if (!v100)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v129 = v290;
                                                      uint64_t v130 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v131 = *v130++;

                                                        --v129;
                                                      }

                                                      while (v129);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  bzero((char *)&v249 - v97, 8 * v96);
                                                }

                                                MEMORY[0x1895F8858](v100);
                                                id v103 = (char *)&v249 - v102;
                                                if (v104 > 0x1FE)
                                                {
                                                  uint64_t v105 = NSAllocateScannedUncollectable();
                                                  id v103 = (char *)v105;
                                                  if (!v105)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v136 = v290;
                                                      __int128 v137 = (void **)v266;
                                                      do
                                                      {
                                                        v138 = *v137++;

                                                        --v136;
                                                      }

                                                      while (v136);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  bzero((char *)&v249 - v102, 8 * v101);
                                                }

                                                MEMORY[0x1895F8858](v105);
                                                if (v108 > 0x1FE)
                                                {
                                                  uint64_t v109 = (uint64_t *)NSAllocateScannedUncollectable();
                                                  uint64_t v263 = v109;
                                                  if (!v109)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v143 = v290;
                                                      uint64_t v144 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v145 = *v144++;

                                                        --v143;
                                                      }

                                                      while (v143);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t v263 = (uint64_t *)((char *)&v249 - v107);
                                                  bzero((char *)&v249 - v107, 8 * v106);
                                                }

                                                MEMORY[0x1895F8858](v109);
                                                if (v112 > 0x1FE)
                                                {
                                                  uint64_t v113 = (uint64_t *)NSAllocateScannedUncollectable();
                                                  v262 = v113;
                                                  if (!v113)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v178 = v290;
                                                      v179 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v180 = *v179++;

                                                        --v178;
                                                      }

                                                      while (v178);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  v262 = (uint64_t *)((char *)&v249 - v111);
                                                  bzero((char *)&v249 - v111, 8 * v110);
                                                }

                                                MEMORY[0x1895F8858](v113);
                                                if (v119 > 0x1FE)
                                                {
                                                  __int128 v120 = (char *)NSAllocateScannedUncollectable();
                                                  uint64_t v259 = v120;
                                                  if (!v120)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v181 = v290;
                                                      uint64_t v182 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v183 = *v182++;

                                                        --v181;
                                                      }

                                                      while (v181);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t v259 = (char *)&v249 - v118;
                                                  bzero((char *)&v249 - v118, 8 * v117);
                                                }

                                                uint64_t v260 = (uint64_t *)v103;
                                                uint64_t v261 = (uint64_t *)v98;
                                                uint64_t v257 = v62;
                                                v258 = v87;
                                                MEMORY[0x1895F8858](v120);
                                                if (v126 > 0x1FE)
                                                {
                                                  uint64_t v128 = NSAllocateScannedUncollectable();
                                                  uint64_t v127 = (char *)v128;
                                                  if (!v128)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v184 = v290;
                                                      v185 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v186 = *v185++;

                                                        --v184;
                                                      }

                                                      while (v184);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t v127 = (char *)&v249 - v125;
                                                  bzero((char *)&v249 - v125, 8 * v124);
                                                }

                                                MEMORY[0x1895F8858](v128);
                                                if (v134 > 0x1FE)
                                                {
                                                  __int128 v135 = (char *)NSAllocateScannedUncollectable();
                                                  uint64_t v256 = v135;
                                                  if (!v135)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v187 = v290;
                                                      uint64_t v188 = (void **)v266;
                                                      do
                                                      {
                                                        v189 = *v188++;

                                                        --v187;
                                                      }

                                                      while (v187);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t v256 = (char *)&v249 - v133;
                                                  bzero((char *)&v249 - v133, 8 * v132);
                                                }

                                                MEMORY[0x1895F8858](v135);
                                                if (v141 > 0x1FE)
                                                {
                                                  uint64_t v142 = (void **)NSAllocateScannedUncollectable();
                                                  if (!v142)
                                                  {
                                                    if (v292)
                                                    {
                                                      uint64_t v190 = v290;
                                                      uint64_t v191 = (void **)v266;
                                                      do
                                                      {
                                                        uint64_t v192 = *v191++;

                                                        --v190;
                                                      }

                                                      while (v190);
                                                    }

                                                    return;
                                                  }
                                                }

                                                else
                                                {
                                                  uint64_t v142 = (void **)((char *)&v249 - v140);
                                                  bzero((char *)&v249 - v140, 8 * v139);
                                                }

                                                uint64_t v146 = (objc_class *)objc_opt_class();
                                                uint64_t v147 = (void **)v92;
                                                int v148 = (int)v286;
                                                unsigned int v149 = _PFAllocateObjects(v146, (void **)v92, v286, 0LL);
                                                if (v149 == v148)
                                                {
                                                  objc_opt_class();
                                                  uint64_t v150 = (objc_class *)objc_opt_class();
                                                  int v151 = v283;
                                                  unsigned int v152 = _PFAllocateObjects(v150, (void **)v261, v283, 0LL);
                                                  if (v152 == v151)
                                                  {
                                                    uint64_t v153 = (objc_class *)objc_opt_class();
                                                    int v154 = v282;
                                                    unsigned int v155 = _PFAllocateObjects(v153, (void **)v260, v282, 0LL);
                                                    if (v155 == v154)
                                                    {
                                                      v156 = (objc_class *)objc_opt_class();
                                                      int v157 = v281;
                                                      unsigned int v158 = _PFAllocateObjects(v156, (void **)v263, v281, 0LL);
                                                      if (v158 == v157)
                                                      {
                                                        uint64_t v159 = (objc_class *)objc_opt_class();
                                                        int v160 = v280;
                                                        unsigned int v161 = _PFAllocateObjects(v159, (void **)v262, v280, 0LL);
                                                        if (v161 == v160)
                                                        {
                                                          uint64_t v162 = (objc_class *)objc_opt_class();
                                                          int v163 = v279;
                                                          unsigned int v164 = _PFAllocateObjects(v162, (void **)v259, v279, 0LL);
                                                          if (v164 == v163)
                                                          {
                                                            v165 = (objc_class *)objc_opt_class();
                                                            int v166 = (int)v278;
                                                            unsigned int v167 = _PFAllocateObjects( v165,  (void **)v127,  v278,  0LL);
                                                            if (v167 == v166)
                                                            {
                                                              uint64_t v168 = (objc_class *)objc_opt_class();
                                                              int v169 = v277;
                                                              unsigned int v170 = _PFAllocateObjects(v168, (void **)v256, v277, 0LL);
                                                              if (v170 == v169)
                                                              {
                                                                v171 = (objc_class *)objc_opt_class();
                                                                int v172 = v276;
                                                                unsigned int v173 = _PFAllocateObjects(v171, v142, v276, 0LL);
                                                                if (v173 == v172)
                                                                {
                                                                  unint64_t v174 = bswap32(v275);
                                                                  unint64_t v302 = v174;
                                                                  uint64_t v175 = (v174 + 3) & 0x1FFFFFFFCLL;
                                                                  unint64_t v176 = v175 + 4;
                                                                  if (v175 + 4 <= v6)
                                                                  {
                                                                    unsigned int v177 = bswap32(*(unsigned int *)((char *)BytePtr + v175));
                                                                    unint64_t v302 = v176;
                                                                    unint64_t v174 = v176;
                                                                  }

                                                                  else
                                                                  {
                                                                    unsigned int v177 = 0;
                                                                  }

                                                                  if (v177 == (_DWORD)v286)
                                                                  {
                                                                    uint64_t v193 = (v174 + 3) & 0x7FFFFFFFCLL;
                                                                    unint64_t v194 = v193 + 4;
                                                                    if (v193 + 4 <= v6)
                                                                    {
                                                                      unsigned int v195 = bswap32(*(unsigned int *)((char *)BytePtr + v193));
                                                                      unint64_t v302 = v194;
                                                                      unint64_t v174 = v194;
                                                                    }

                                                                    else
                                                                    {
                                                                      unsigned int v195 = 0;
                                                                    }

                                                                    if (v195 == (_DWORD)v283)
                                                                    {
                                                                      uint64_t v196 = (v174 + 3) & 0x1FFFFFFFFCLL;
                                                                      unint64_t v197 = v196 + 4;
                                                                      if (v196 + 4 <= v6)
                                                                      {
                                                                        unsigned int v198 = bswap32(*(unsigned int *)((char *)BytePtr + v196));
                                                                        unint64_t v302 = v197;
                                                                        unint64_t v174 = v197;
                                                                      }

                                                                      else
                                                                      {
                                                                        unsigned int v198 = 0;
                                                                      }

                                                                      if (v198 == (_DWORD)v282)
                                                                      {
                                                                        uint64_t v199 = (v174 + 3) & 0x7FFFFFFFFCLL;
                                                                        unint64_t v200 = v199 + 4;
                                                                        if (v199 + 4 <= v6)
                                                                        {
                                                                          unsigned int v201 = bswap32(*(unsigned int *)((char *)BytePtr + v199));
                                                                          unint64_t v302 = v200;
                                                                          unint64_t v174 = v200;
                                                                        }

                                                                        else
                                                                        {
                                                                          unsigned int v201 = 0;
                                                                        }

                                                                        if (v201 == (_DWORD)v281)
                                                                        {
                                                                          uint64_t v202 = (v174 + 3) & 0x1FFFFFFFFFCLL;
                                                                          unint64_t v203 = v202 + 4;
                                                                          if (v202 + 4 <= v6)
                                                                          {
                                                                            unsigned int v204 = bswap32(*(unsigned int *)((char *)BytePtr + v202));
                                                                            unint64_t v302 = v203;
                                                                          }

                                                                          else
                                                                          {
                                                                            unsigned int v204 = 0;
                                                                          }

                                                                          if (v204 == (_DWORD)v280)
                                                                          {
                                                                            if ((_DWORD)v295) {
                                                                              uint64_t v295 = *v92;
                                                                            }
                                                                            else {
                                                                              uint64_t v295 = 0LL;
                                                                            }
                                                                            if ((_DWORD)v296) {
                                                                              uint64_t v275 = *v261;
                                                                            }
                                                                            else {
                                                                              uint64_t v275 = 0LL;
                                                                            }
                                                                            if (v273) {
                                                                              uint64_t v254 = *v260;
                                                                            }
                                                                            else {
                                                                              uint64_t v254 = 0LL;
                                                                            }
                                                                            if (v272) {
                                                                              uint64_t v253 = *v263;
                                                                            }
                                                                            else {
                                                                              uint64_t v253 = 0LL;
                                                                            }
                                                                            if ((_DWORD)v293) {
                                                                              uint64_t v255 = *v262;
                                                                            }
                                                                            else {
                                                                              uint64_t v255 = 0LL;
                                                                            }
                                                                            if ((_DWORD)v294)
                                                                            {
                                                                              uint64_t v205 = 0LL;
                                                                              uint64_t v249 = 0LL;
                                                                              uint64_t v250 = 0LL;
                                                                              uint64_t v251 = 0LL;
                                                                              uint64_t v252 = 0LL;
                                                                              v293 = 0LL;
                                                                              uint64_t v294 = 0LL;
                                                                              id v296 = 0LL;
                                                                              while (1)
                                                                              {
                                                                                v206 = (void *)_readPropertyIntoShellFromBytes( (uint64_t)a2,  (uint64_t)BytePtr,  &v302,  v6,  (uint64_t)v127,  (uint64_t)v258,  (uint64_t)v259,  v295,  v275,  (uint64_t)v293,  v254,  v253,  v255,  (uint64_t)v291,  (uint64_t)v266,  (uint64_t)v257,  (unint64_t)v274,  (unint64_t *)v308);
                                                                                if (!v206) {
                                                                                  break;
                                                                                }
                                                                                *((void *)v258 + v205) = v206;
                                                                                if ((void *)v92[(void)v296] == v206)
                                                                                {
                                                                                  id v296 = (char *)v296 + 1;
                                                                                  if (v296 == v286)
                                                                                  {
                                                                                    uint64_t v295 = 0LL;
                                                                                    id v296 = v286;
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    uint64_t v295 = v92[(void)v296];
                                                                                  }
                                                                                }

                                                                                else if (v264[v294] == v206)
                                                                                {
                                                                                  if (__CFADD__(v294++, 1LL))
                                                                                  {
                                                                                    v293 = 0LL;
                                                                                    uint64_t v294 = 0LL;
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    v293 = v264[v294];
                                                                                  }
                                                                                }

                                                                                else
                                                                                {
                                                                                  if ((void *)v261[v252] == v206)
                                                                                  {
                                                                                    if (++v252 == v283)
                                                                                    {
                                                                                      uint64_t v275 = 0LL;
                                                                                      uint64_t v207 = v283;
                                                                                      uint64_t v208 = &v288;
                                                                                    }

                                                                                    else
                                                                                    {
                                                                                      uint64_t v207 = v261[v252];
                                                                                      uint64_t v208 = v308;
                                                                                    }
                                                                                  }

                                                                                  else if ((void *)v260[v251] == v206)
                                                                                  {
                                                                                    if (++v251 == v282)
                                                                                    {
                                                                                      uint64_t v254 = 0LL;
                                                                                      uint64_t v207 = v282;
                                                                                      uint64_t v208 = &v287;
                                                                                    }

                                                                                    else
                                                                                    {
                                                                                      uint64_t v207 = v260[v251];
                                                                                      uint64_t v208 = &v290;
                                                                                    }
                                                                                  }

                                                                                  else if ((void *)v263[v250] == v206)
                                                                                  {
                                                                                    if (++v250 == v281)
                                                                                    {
                                                                                      uint64_t v253 = 0LL;
                                                                                      uint64_t v207 = v281;
                                                                                      uint64_t v208 = (uint64_t *)&v286;
                                                                                    }

                                                                                    else
                                                                                    {
                                                                                      uint64_t v207 = v263[v250];
                                                                                      uint64_t v208 = &v289;
                                                                                    }
                                                                                  }

                                                                                  else if (++v249 == v280)
                                                                                  {
                                                                                    uint64_t v255 = 0LL;
                                                                                    uint64_t v207 = v280;
                                                                                    uint64_t v208 = (uint64_t *)&v284;
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    uint64_t v207 = v262[v249];
                                                                                    uint64_t v208 = (uint64_t *)&v291;
                                                                                  }

                                                                                  *(v208 - 32) = v207;
                                                                                }

                                                                                if (v287 == ++v205) {
                                                                                  goto LABEL_303;
                                                                                }
                                                                              }
                                                                            }

                                                                            else
                                                                            {
LABEL_303:
                                                                              uint64_t v294 = objc_opt_class();
                                                                              if (v273)
                                                                              {
                                                                                v210 = (id *)v260;
                                                                                uint64_t v211 = v282;
                                                                                do
                                                                                {
                                                                                  id v296 = *v210;
                                                                                  uint64_t v212 = (void *)objc_msgSend( v296,  "inverseRelationship",  v249);
                                                                                  if (v212)
                                                                                  {
                                                                                    uint64_t v213 = [v212 unsignedIntegerValue];
                                                                                    uint64_t v295 = *((void *)v258 + v213);
                                                                                    if (objc_opt_class() != v294) {
                                                                                      goto LABEL_341;
                                                                                    }
                                                                                    if (v296)
                                                                                    {

                                                                                      *((void *)v296 + 14) = v295;
                                                                                    }
                                                                                  }

                                                                                  ++v210;
                                                                                  --v211;
                                                                                }

                                                                                while (v211);
                                                                              }

                                                                              uint64_t v301 = bswap32(v271);
                                                                              uint64_t v214 = (v301 + 3) & 0x1FFFFFFFCLL;
                                                                              uint64_t v215 = v214 + 4;
                                                                              if (v214 + 4 <= v6)
                                                                              {
                                                                                unsigned int v216 = bswap32(*(unsigned int *)((char *)BytePtr + v214));
                                                                                uint64_t v301 = v215;
                                                                              }

                                                                              else
                                                                              {
                                                                                unsigned int v216 = 0;
                                                                              }

                                                                              if (v216 == (_DWORD)v278)
                                                                              {
                                                                                if (v270)
                                                                                {
                                                                                  uint64_t v295 = (uint64_t)v142;
                                                                                  id v296 = 0LL;
                                                                                  unint64_t v217 = 0LL;
                                                                                  unint64_t v218 = 0LL;
                                                                                  uint64_t v294 = (uint64_t)v256;
                                                                                  while (1)
                                                                                  {
                                                                                    unint64_t v300 = v277 - v218;
                                                                                    unint64_t v299 = v276 - v217;
                                                                                    v218 += v300;
                                                                                    if (v218 > v277
                                                                                      || (v217 += v299, v217 > v276))
                                                                                    {
                                                                                      _NSCoreDataLog( 1LL,  (uint64_t)@"Bad: decoding optimized model smashed memory. Bailing.",  v219,  v220,  v221,  v222,  v223,  v224,  v249);
                                                                                      __break(1u);
                                                                                      return;
                                                                                    }

                                                                                    v294 += 8 * v300;
                                                                                    v295 += 8 * v299;
                                                                                    id v296 = (char *)v296 + 1;
                                                                                    if (v278 == v296) {
                                                                                      goto LABEL_320;
                                                                                    }
                                                                                  }
                                                                                }

                                                                                else
                                                                                {
LABEL_320:
                                                                                  unint64_t v298 = bswap32(v267);
                                                                                  unint64_t v225 = (v298 + 3) & 0x1FFFFFFFCLL;
                                                                                  unint64_t v226 = v225 + 4;
                                                                                  if (v225 + 4 <= v6)
                                                                                  {
                                                                                    unsigned int v227 = bswap32(*(unsigned int *)((char *)BytePtr + v225));
                                                                                    unint64_t v298 = v226;
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    unsigned int v227 = 0;
                                                                                  }

                                                                                  if (v227 == (_DWORD)v279)
                                                                                  {
                                                                                    if (!v269)
                                                                                    {
LABEL_328:
                                                                                      if (v272)
                                                                                      {
                                                                                        uint64_t v230 = 0LL;
                                                                                        do

                                                                                        while (v281 != v230);
                                                                                      }

                                                                                      if (v268) {
                                                                                        uint64_t v231 = (NSMutableDictionary *)*((void *)v84 + 1);
                                                                                      }
                                                                                      else {
                                                                                        uint64_t v231 = 0LL;
                                                                                      }
                                                                                      uint64_t v238 = _newReadModelFromBytes( (uint64_t)a2,  (uint64_t)BytePtr,  &v307,  v6,  *(NSMutableDictionary **)v84,  v231,  (uint64_t)v127,  (uint64_t)v259,  (uint64_t)v291,  (uint64_t)v257);
                                                                                      if (v238 && v270)
                                                                                      {
                                                                                        v239 = (uint64_t *)v127;
                                                                                        uint64_t v240 = v278;
                                                                                        do
                                                                                        {
                                                                                          uint64_t v241 = *v239++;
                                                                                          *(void *)(v241 + 40) = v238;
                                                                                          --v240;
                                                                                        }

                                                                                        while (v240);
                                                                                      }

                                                                                      if (v292)
                                                                                      {
                                                                                        v242 = (void **)v266;
                                                                                        uint64_t v243 = v290;
                                                                                        do
                                                                                        {
                                                                                          uint64_t v244 = *v242++;

                                                                                          --v243;
                                                                                        }

                                                                                        while (v243);
                                                                                      }

                                                                                      if (v269)
                                                                                      {
                                                                                        uint64_t v245 = (void **)v259;
                                                                                        unint64_t v246 = v279;
                                                                                        do
                                                                                        {
                                                                                          uint64_t v247 = *v245++;

                                                                                          --v246;
                                                                                        }

                                                                                        while (v246);
                                                                                      }

                                                                                      return;
                                                                                    }

                                                                                    v228 = (uint64_t *)v259;
                                                                                    unint64_t v229 = v279;
                                                                                    while (_readFetchRequestIntoShellFromData(a2, (uint64_t)BytePtr, &v298, v6, *v228, (uint64_t)v84, (uint64_t)v258, (uint64_t)v291, (uint64_t)v266, (uint64_t)v257, (uint64_t)v127, (uint64_t)v265, (uint64_t)v274, v308))
                                                                                    {
                                                                                      ++v228;
                                                                                      if (!--v229) {
                                                                                        goto LABEL_328;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }

- (id)_modelForVersionHashes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unint64_t v5 = -[NSManagedObjectModel entitiesByName](self, "entitiesByName");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v12 = -[NSDictionary objectForKey:](v5, "objectForKey:", v11);
        uint64_t v13 = [a3 objectForKey:v11];
        if (v12)
        {
          uint64_t v14 = v13;
          if ((objc_msgSend((id)objc_msgSend(v12, "versionHash"), "isEqual:", v13) & 1) != 0
            || -[NSEntityDescription _hasPotentialHashSkew]((uint64_t)v12)
            && objc_msgSend( (id)-[NSEntityDescription _newVersionHashInStyle:]((uint64_t)v12, 1),  "isEqual:",  v14))
          {
            if (!v8) {
              id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
            }
            objc_msgSend(v8, "addObject:", (id)objc_msgSend(v12, "copy"));
          }
        }
      }

      uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  if (![v8 count])
  {
    id v15 = 0LL;
    if (!v8) {
      return v15;
    }
    goto LABEL_28;
  }

  id v15 =  -[NSManagedObjectModel _initWithEntities:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "_initWithEntities:",  v8);
  objc_msgSend(v15, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](self, "versionIdentifiers"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  fetchRequestTemplates = self->_fetchRequestTemplates;
  uint64_t v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0LL; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(fetchRequestTemplates);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        unsigned int v22 = (void *)-[NSMutableDictionary objectForKey:](self->_fetchRequestTemplates, "objectForKey:", v21);
      }

      uint64_t v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v24,  v32,  16LL);
    }

    while (v18);
  }

  if (v8) {
LABEL_28:
  }

  return v15;
}

- (id)_initWithContentsOfURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  objc_opt_class();
  objc_opt_class();
  if (a3)
  {
    id v14 = objc_alloc_init(MEMORY[0x1896077E8]);
    id v15 = (void *)[MEMORY[0x1896078A8] defaultManager];
    unsigned int v16 = (void *)[a3 path];
    char v76 = 0;
    int v17 = [v15 fileExistsAtPath:v16 isDirectory:&v76];
    if (v17) {
      BOOL v18 = v76 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      char v19 = v17;
      int v20 = objc_msgSend((id)objc_msgSend(v16, "pathExtension"), "isEqualToString:", @"omo");
      char v21 = v19 | v20;
      if (v20) {
        uint64_t v22 = (uint64_t)v16;
      }
      else {
        uint64_t v22 = 0LL;
      }
      if ((v21 & 1) != 0)
      {
        int v23 = v20;
LABEL_16:

        if (v22)
        {
          uint64_t v39 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
          __int128 v24 = -[NSManagedObjectModel initWithContentsOfOptimizedURL:]( v39,  "initWithContentsOfOptimizedURL:",  [MEMORY[0x189604030] fileURLWithPath:v22 isDirectory:0]);
          if (v24)
          {
LABEL_41:
            uint64_t v71 = -[NSValidationErrorLocalizationPolicy initWithURL:]( objc_alloc(&OBJC_CLASS___NSValidationErrorLocalizationPolicy),  "initWithURL:",  a3);
            -[NSManagedObjectModel _setLocalizationPolicy:](v24, "_setLocalizationPolicy:", v71);

LABEL_45:
            [v14 drain];
            return v24;
          }

          if (!PFUseToolchainBehaviors()) {
            _NSCoreDataLog( 4LL,  (uint64_t)@" Failed to load optimized model at path '%@'",  v33,  v34,  v35,  v36,  v37,  v38,  v22);
          }
          if (v23)
          {
            uint64_t v40 = (void *)[v16 stringByDeletingLastPathComponent];
            if (objc_msgSend((id)objc_msgSend(v40, "pathExtension"), "isEqualToString:", @"momd"))
            {
              unint64_t v41 =  -[NSManagedObjectModelBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModelBundle),  "initWithPath:",  v40);
              if (v41)
              {
                unsigned int v16 = (void *)objc_msgSend( -[NSManagedObjectModelBundle currentVersionURL](v41, "currentVersionURL"),  "path");
                uint64_t v22 = 0LL;
                if (!v16) {
                  goto LABEL_44;
                }
              }

              else
              {
                _NSCoreDataLog( 1LL,  (uint64_t)@" Failed to load model bundle at path '%@'",  v42,  v43,  v44,  v45,  v46,  v47,  (uint64_t)v16);
                if (!v16) {
                  goto LABEL_44;
                }
              }

+ (int64_t)_debugOptimizedModelLayout
{
  if (qword_18C4ABA30 != -1) {
    dispatch_once(&qword_18C4ABA30, &__block_literal_global_8);
  }
  return _MergedGlobals_73;
}

uint64_t __70__NSManagedObjectModel__NSInternalMethods___debugOptimizedModelLayout__block_invoke()
{
  uint64_t result = +[_PFRoutines integerValueForOverride:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)@"com.apple.CoreData.OptimizedModelLayoutDebug");
  _MergedGlobals_73 = result;
  return result;
}

- (id)immutableCopy
{
  if ((*(_BYTE *)&self->_managedObjectModelFlags & 2) != 0) {
    return self;
  }
  v2 = (void *)MEMORY[0x186E3E5D8]();
  uint64_t v3 = (void *)-[NSManagedObjectModel copy](self, "copy");
  [v3 _createCachesAndOptimizeState];
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (id)_entityVersionHashesDigestFrom:(id)result
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v3 = CC_SHA512_Init(&c);
    char v4 = (void *)MEMORY[0x186E3E5D8](v3);
    unint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend(a2, "allKeys"),  "sortedArrayUsingComparator:",  &__block_literal_global_330);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = (void *)[a2 objectForKey:v10];
          uint64_t v12 = (const char *)[v10 UTF8String];
          CC_LONG v13 = strlen(v12);
          CC_SHA512_Update(&c, v12, v13);
          LODWORD(v12) = [v11 length];
          [v11 getBytes:data length:v12];
          CC_SHA512_Update(&c, data, (CC_LONG)v12);
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }

      while (v7);
    }

    CC_SHA512_Final(md, &c);
    id v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:64];
    id v15 = (id)[v14 base64EncodedStringWithOptions:0];

    objc_autoreleasePoolPop(v4);
    return v15;
  }

  return result;
}

uint64_t __75__NSManagedObjectModel__NSInternalMethods___entityVersionHashesDigestFrom___block_invoke( uint64_t a1,  void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)_entityVersionHashesDigest
{
  if (result)
  {
    v1 = result;
    id v2 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](result, 1LL);
    return -[NSManagedObjectModel _entityVersionHashesDigestFrom:](v1, v2);
  }

  return result;
}

- (id)_initWithEntities:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSManagedObjectModel;
  unint64_t v5 = -[NSManagedObjectModel init](&v10, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    *(_DWORD *)&v5->_managedObjectModelFlags &= 0xFFFFFFFC;
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v6->_configurations = 0LL;
    v6->_fetchRequestTemplates = 0LL;
    v6->_entities = v7;
    v6->_versionIdentifiers = (NSSet *)objc_alloc_init(MEMORY[0x189604010]);
    uint64_t v8 = (id *)PF_CALLOC_OBJECT_ARRAY(4LL);
    v6->_additionalPrivateIvars = v8;
    *uint64_t v8 = 0LL;
    *((void *)v6->_additionalPrivateIvars + 3) = 0LL;
    *((void *)v6->_additionalPrivateIvars + 1) = 0LL;
    *((void *)v6->_additionalPrivateIvars + 2) = 0LL;
    if (a3) {
      -[NSManagedObjectModel setEntities:](v6, "setEntities:", a3);
    }
  }

  return v6;
}

- (BOOL)isEditable
{
  return (*(_BYTE *)&self->_managedObjectModelFlags & 1) == 0;
}

- (void)_flattenProperties
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = (void *)-[NSMutableDictionary allValues](self->_entities, "allValues", 0LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _flattenProperties];
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

- (void)_createCachesAndOptimizeState
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  __managedObjectModelFlags managedObjectModelFlags = self->_managedObjectModelFlags;
  if ((*(_BYTE *)&managedObjectModelFlags & 2) == 0)
  {
    self->___managedObjectModelFlags managedObjectModelFlags = (__managedObjectModelFlags)(*(_DWORD *)&managedObjectModelFlags | 2);
    id v4 = objc_alloc_init(MEMORY[0x1896077E8]);
    entities = self->_entities;
    id v61 = v4;
    uint64_t v6 = (void *)objc_msgSend( (id)-[NSMutableDictionary allValues](entities, "allValues"),  "sortedArrayUsingFunction:context:",  _compareEntitiesByName,  0);
    unint64_t v7 = [v6 count];
    v60[1] = v60;
    unint64_t v8 = MEMORY[0x1895F8858](v7);
    uint64_t v11 = (char *)v60 - v10;
    size_t v12 = 8 * v9;
    if (v8 >= 0x201)
    {
      uint64_t v11 = (char *)NSAllocateScannedUncollectable();
      id v14 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)v60 - v10, 8 * v9);
      MEMORY[0x1895F8858](v13);
      id v14 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v14, v12);
    }

    objc_msgSend(v6, "getObjects:range:", v11, 0, v7);
    if (v7)
    {
      id v15 = (id *)v11;
      __int128 v16 = v14;
      unint64_t v17 = v7;
      do
      {
        *(void *)__int128 v16 = [*v15 name];
        v16 += 8;
        ++v15;
        --v17;
      }

      while (v17);
    }

    uint64_t v62 = -[NSKnownKeysDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithObjects:forKeys:count:",  v11,  v14,  v7);
    if (v7 >= 0x201)
    {
      NSZoneFree(0LL, v11);
      NSZoneFree(0LL, v14);
    }

    __int128 v18 = v62;
    self->_entities = &v62->super;
    uint64_t v19 = -[NSKnownKeysDictionary values](v18, "values");
    if (!self->_configurations) {
      self->_configurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
    -[NSMutableDictionary setObject:forKey:]( self->_configurations,  "setObject:forKey:",  [MEMORY[0x189603F18] arrayWithObjects:v19 count:v7],  @"PF_DEFAULT_CONFIGURATION_NAME");
    if (!*((void *)self->_additionalPrivateIvars + 3)) {
      *((void *)self->_additionalPrivateIvars + 3) = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    objc_msgSend( self->_additionalPrivateIvars[3],  "setObject:forKeyedSubscript:",  objc_msgSend(MEMORY[0x189604010], "setWithArray:", -[NSKnownKeysDictionary allKeys](v62, "allKeys")),  @"PF_DEFAULT_CONFIGURATION_NAME");
    CFMutableArrayRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    uint64_t v21 = -[NSKnownKeysDictionary count](v62, "count");
    if (v21)
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        uint64_t v23 = *(void *)(v19 + 8 * i);
        [(id)v23 _flattenProperties];
        if (v23) {
          *(void *)(v23 + 160) = i;
        }
        CFSetAddValue(Mutable, (const void *)v23);
        if (v23)
        {
          uint64_t v24 = *(void *)(v23 + 128);
        }

        else
        {
          __int128 v25 = 0LL;
        }

        if ([v25 count])
        {
          *(_DWORD *)&self->_managedObjectModelFlags |= 8u;
          if (v23) {
            *(_DWORD *)(v23 + 120) |= 0x800u;
          }
        }
      }
    }

    uint64_t v26 = (void *)[MEMORY[0x189603FA8] array];
    unint64_t v27 = 0LL;
LABEL_29:
    if (CFSetGetCount(Mutable) >= 1)
    {
      __int128 v73 = 0u;
      __int128 v74 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      uint64_t v28 = -[__CFSet countByEnumeratingWithState:objects:count:]( Mutable,  "countByEnumeratingWithState:objects:count:",  &v71,  v77,  16LL);
      if (!v28) {
        goto LABEL_55;
      }
      uint64_t v29 = *(void *)v72;
      while (1)
      {
        uint64_t v30 = 0LL;
        do
        {
          if (*(void *)v72 != v29) {
            objc_enumerationMutation(Mutable);
          }
          uint64_t v31 = *(_DWORD **)(*((void *)&v71 + 1) + 8 * v30);
          if (v31)
          {
            uint64_t v32 = -1LL;
            uint64_t v33 = *(void *)(*((void *)&v71 + 1) + 8 * v30);
            do
            {
              uint64_t v33 = *(void *)(v33 + 80);
              ++v32;
            }

            while (v33);
          }

          else
          {
            uint64_t v32 = 0LL;
          }

          if (v27 > 0x3E7 || v32 == v27)
          {
            [v26 addObject:v31];
            uint64_t v34 = [v31 superentity];
            if (v34 && (*(_BYTE *)(v34 + 121) & 8) != 0)
            {
              if (!v31) {
                goto LABEL_50;
              }
              int v35 = v31[30] | 0x800;
              v31[30] = v35;
              if ((v35 & 0x800) == 0) {
                goto LABEL_50;
              }
            }

            else if (!v31 || (v31[30] & 0x800) == 0)
            {
LABEL_50:
              [v31 _createCachesAndOptimizeState];
              goto LABEL_51;
            }

            uint64_t v36 = v31;
            do
            {
              int v37 = v36[30];
              if ((v37 & 0x1000) != 0) {
                break;
              }
              v36[30] = v37 | 0x1000;
              uint64_t v36 = (_DWORD *)*((void *)v36 + 10);
            }

            while (v36);
            goto LABEL_50;
          }

- (uint64_t)_hasEntityWithUniquenessConstraints
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = *(_DWORD *)(result + 64);
    if ((v2 & 4) != 0)
    {
      return (v2 >> 3) & 1;
    }

    else
    {
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      uint64_t v3 = *(void **)(result + 32);
      uint64_t result = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v8;
        while (2)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            if (*(void *)v8 != v5) {
              objc_enumerationMutation(v3);
            }
            if (-[NSEntityDescription _hasUniqueProperties]([*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v7 + 1) + 8 * i)])) {
              return 1LL;
            }
          }

          uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
          uint64_t result = 0LL;
          if (v4) {
            continue;
          }
          break;
        }
      }
    }
  }

  return result;
}

- (uint64_t)_hasEntityWithDerivedAttribute
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    unsigned int v2 = *(void **)(result + 32);
    uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          if (-[NSEntityDescription _hasDerivedAttributes]([*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v6 + 1) + 8 * v5)])) {
            return 1LL;
          }
          ++v5;
        }

        while (v3 != v5);
        uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }

  return result;
}

- (void)_traverseTombstonesAndMark:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (a1 && (*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v19)
    {
      char v5 = 0;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          __int128 v6 = (void *)[*(id *)(a1 + 32) objectForKey:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          __int128 v7 = (void *)objc_msgSend( (id)objc_msgSend(v6, "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes");
          __int128 v8 = v7;
          if (v7)
          {
            if ([v7 isNSString])
            {
              if ([v8 length])
              {
                id v21 = (id)[v8 componentsSeparatedByString:@","];
                __int128 v36 = 0u;
                __int128 v37 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                uint64_t v9 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
                if (v9)
                {
                  uint64_t v10 = *(void *)v35;
                  do
                  {
                    for (uint64_t j = 0LL; j != v9; ++j)
                    {
                      if (*(void *)v35 != v10) {
                        objc_enumerationMutation(v21);
                      }
                      if (v6)
                      {
                        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * j);
                        uint64_t v13 = v6;
                        do
                        {
                          if (!-[NSEntityDescription _attributeNamed:]([v13 superentity], v12))
                          {
                            objc_msgSend( -[NSEntityDescription _attributeNamed:]((uint64_t)v13, v12),  "setPreservesValueInHistoryOnDeletion:",  a2);
                            v43[0] = v13;
                            v43[1] = v12;
                            objc_msgSend( v4,  "addObject:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v43, 2));
                            uint64_t v13 = 0LL;
                            char v5 = 1;
                          }

                          uint64_t v13 = (void *)[v13 superentity];
                        }

                        while (v13);
                      }
                    }

                    uint64_t v9 = [v21 countByEnumeratingWithState:&v34 objects:v44 count:16];
                  }

                  while (v9);
                }
              }
            }
          }
        }

        uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      }

      while (v19);
      if ((v5 & 1) != 0)
      {
        uint64_t v28 = 0LL;
        uint64_t v29 = &v28;
        uint64_t v30 = 0x3052000000LL;
        uint64_t v31 = __Block_byref_object_copy__12;
        uint64_t v32 = __Block_byref_object_dispose__12;
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        void v26[2] = __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke;
        v26[3] = &unk_189EA87C8;
        char v27 = a2;
        v26[4] = &v28;
        uint64_t v33 = v26;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        uint64_t v14 = [v4 countByEnumeratingWithState:&v22 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t k = 0LL; k != v14; ++k)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v4);
              }
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v29[5] + 16))( v29[5],  [*(id *)(*((void *)&v22 + 1) + 8 * k) objectAtIndexedSubscript:0],  objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * k), "objectAtIndexedSubscript:", 1));
            }

            uint64_t v14 = [v4 countByEnumeratingWithState:&v22 objects:v42 count:16];
          }

          while (v14);
        }

        _Block_object_dispose(&v28, 8);
      }
    }
  }

uint64_t __71__NSManagedObjectModel__NSInternalMethods___traverseTombstonesAndMark___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_msgSend( -[NSEntityDescription _attributeNamed:]((uint64_t)a2, a3),  "setPreservesValueInHistoryOnDeletion:",  *(unsigned __int8 *)(a1 + 40));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  char v5 = (void *)objc_msgSend(a2, "subentities", 0);
  uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
        ++v9;
      }

      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }

    while (result);
  }

  return result;
}

- (void)_setIsEditable:(BOOL)a3 optimizationStyle:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v7 = objc_sync_enter(self);
  uint64_t v8 = (void *)MEMORY[0x186E3E5D8](v7);
  __managedObjectModelFlags managedObjectModelFlags = self->_managedObjectModelFlags;
  if (!(*(_BYTE *)&managedObjectModelFlags & 1) == v5)
  {
    if (BYTE6(z9dsptsiQ80etb9782fsrs98bfdle88))
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      fetchRequestTemplates = self->_fetchRequestTemplates;
      uint64_t v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(fetchRequestTemplates);
            }
            uint64_t v14 = (void *)-[NSMutableDictionary objectForKey:]( self->_fetchRequestTemplates,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8 * i));
            [v14 allowEvaluation];
            [v14 _incrementInUseCounter];
          }

          uint64_t v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( fetchRequestTemplates,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        }

        while (v11);
      }
    }

- (void)_setIsEditable:(BOOL)a3
{
}

- (void)_throwIfNotEditable
{
  if (!-[NSManagedObjectModel isEditable](self, "isEditable"))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Can't modify an immutable model." userInfo:0]);
    -[NSManagedObjectModel _localizationPolicy](v2, v3);
  }

- (id)_localizationPolicy
{
  return *self->_additionalPrivateIvars;
}

- (void)_setLocalizationPolicy:(id)a3
{
  id v3 = *self->_additionalPrivateIvars;
  if (v3 != a3)
  {

    *self->_additionalPrivateIvars = a3;
  }

- (void)_sortedEntitiesForConfiguration:(void *)result
{
  if (result)
  {
    unsigned int v2 = (void *)[result entitiesForConfiguration:a2];
    id v3 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"name" ascending:1 selector:sel_caseInsensitiveCompare_];
    id v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v3, 0);
    uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

    return (void *)v5;
  }

  return result;
}

- (id)_entitiesByVersionHash
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = (void *)[result entities];
    unsigned int v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
            objc_enumerationMutation(v1);
          }
          objc_msgSend( v2,  "setObject:forKey:",  *(void *)(*((void *)&v7 + 1) + 8 * v6),  objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "versionHash"));
          ++v6;
        }

        while (v4 != v6);
        uint64_t v4 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }

      while (v4);
    }

    return v2;
  }

  return result;
}

- (void)_stripForMigration
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned int v2 = -[NSManagedObjectModel entities](self, "entities", 0LL);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _stripForMigration];
      }

      while (v4 != v6);
      uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }

- (void)_restoreValidation
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  unsigned int v2 = -[NSManagedObjectModel entities](self, "entities", 0LL);
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

- (void)_setModelsReferenceIDOffset:(int64_t)a3
{
  if (a3 < 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot assign a negative reference ID offset to a managed object model." userInfo:0]);
    -[NSManagedObjectModel _allowedClassesFromTransformableAttributes](v5);
  }

  else if ([self->_additionalPrivateIvars[1] longValue] != a3)
  {

    *((void *)self->_additionalPrivateIvars + 1) = [objc_alloc(MEMORY[0x189607968]) initWithLong:a3];
  }

- (uint64_t)_allowedClassesFromTransformableAttributes
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(*(void *)(result + 24) + 16LL);
    if (!result)
    {
      id v2 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id obj = *(id *)(v1 + 32);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v16)
      {
        uint64_t v14 = *(void *)v23;
        uint64_t v15 = v1;
        do
        {
          uint64_t v3 = 0LL;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = v3;
            uint64_t v4 = (void *)[*(id *)(v1 + 32) objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * v3)];
            __int128 v18 = 0u;
            __int128 v19 = 0u;
            __int128 v20 = 0u;
            __int128 v21 = 0u;
            uint64_t v5 = (void *)[v4 attributesByName];
            uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v19;
              do
              {
                for (uint64_t i = 0LL; i != v7; ++i)
                {
                  if (*(void *)v19 != v8) {
                    objc_enumerationMutation(v5);
                  }
                  __int128 v10 = (void *)objc_msgSend( (id)objc_msgSend(v4, "attributesByName"),  "valueForKey:",  *(void *)(*((void *)&v18 + 1) + 8 * i));
                  if ([v10 valueTransformerName])
                  {
                    objc_msgSend( MEMORY[0x189607B20],  "valueTransformerForName:",  objc_msgSend(v10, "valueTransformerName"));
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0) {
                      objc_msgSend( v2,  "addObjectsFromArray:",  objc_msgSend((id)objc_opt_class(), "allowedTopLevelClasses"));
                    }
                  }
                }

                uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }

              while (v7);
            }

            uint64_t v3 = v17 + 1;
            uint64_t v1 = v15;
          }

          while (v17 + 1 != v16);
          uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
        }

        while (v16);
      }

      uint64_t v11 = (unint64_t *)(*(void *)(v1 + 24) + 16LL);
      while (!__ldaxr(v11))
      {
      }

      __clrex();

      return *(void *)(*(void *)(v1 + 24) + 16LL);
    }
  }

  return result;
}

@end