@interface PFCloudKitModelValidator
- (PFCloudKitModelValidator)initWithManagedObjectModel:(id)a3 configuration:(id)a4 mirroringDelegateOptions:(id)a5;
- (uint64_t)_validateManagedObjectModel:(void *)a3 error:;
- (void)dealloc;
@end

@implementation PFCloudKitModelValidator

- (PFCloudKitModelValidator)initWithManagedObjectModel:(id)a3 configuration:(id)a4 mirroringDelegateOptions:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PFCloudKitModelValidator;
  v8 = -[PFCloudKitModelValidator init](&v10, sel_init);
  if (v8)
  {
    v8->_model = (NSManagedObjectModel *)a3;
    v8->_configurationName = (NSString *)a4;
    v8->_options = (NSCloudKitMirroringDelegateOptions *)a5;
    *(_WORD *)&v8->_skipValueTransformerValidation = 0;
    v8->_supportsMergeableTransformable = 0;
  }

  return v8;
}

- (void)dealloc
{
  self->_model = 0LL;
  self->_configurationName = 0LL;

  self->_options = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitModelValidator;
  -[PFCloudKitModelValidator dealloc](&v3, sel_dealloc);
}

- (uint64_t)_validateManagedObjectModel:(void *)a3 error:
{
  uint64_t v161 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  if (a2)
  {
    uint64_t v4 = result;
    v5 = (void *)[a2 entitiesForConfiguration:*(void *)(result + 16)];
    if (v5)
    {
      v6 = v5;
      if ([v5 count] || !objc_msgSend(*(id *)(v4 + 16), "length"))
      {
        uint64_t v100 = v4;
        v93 = a3;
        context = (void *)MEMORY[0x186E3E5D8]();
        uint64_t v7 = [objc_alloc(MEMORY[0x189604010]) initWithArray:v6];
        id v91 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v109 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v108 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v107 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v115 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v95 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v110 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v102 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v104 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v96 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v105 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v101 = objc_alloc_init(MEMORY[0x189603FA8]);
        id v94 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v140 = 0u;
        __int128 v141 = 0u;
        __int128 v142 = 0u;
        __int128 v143 = 0u;
        id obj = (id)v7;
        v13 = (void *)v7;
        id v14 = v11;
        v103 = v10;
        v106 = v11;
        v113 = v12;
        uint64_t v111 = [v13 countByEnumeratingWithState:&v140 objects:buf count:16];
        if (v111)
        {
          uint64_t v97 = *(void *)v141;
          id v98 = v9;
          id v99 = v8;
          do
          {
            uint64_t v15 = 0LL;
            do
            {
              if (*(void *)v141 != v97) {
                objc_enumerationMutation(obj);
              }
              uint64_t v114 = v15;
              v16 = *(void **)(*((void *)&v140 + 1) + 8 * v15);
              id v17 = objc_alloc_init(MEMORY[0x189603FE0]);
              id v18 = objc_alloc_init(MEMORY[0x189603FE0]);
              if (objc_msgSend( (id)objc_msgSend(v16, "userInfo"),  "objectForKey:",  @"NSPersistentCloudKitContainerEncryptedAttributeKey"))
              {
                v19 = (void *)NSString;
                uint64_t v90 = [v16 name];
                v20 = v19;
                id v12 = v113;
                [v96 addObject:objc_msgSend( v20, "stringWithFormat:", @"%@: %@ cannot be applied to an entity type'", v90, @"NSPersistentCloudKitContainerEncryptedAttributeKey", v91, context)];
              }

              v21 = (void *)[v16 attributesByName];
              uint64_t v22 = MEMORY[0x1895F87A8];
              v139[0] = MEMORY[0x1895F87A8];
              v139[1] = 3221225472LL;
              v139[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke;
              v139[3] = &unk_189EA74C8;
              v139[4] = v100;
              v139[5] = v10;
              v139[6] = v16;
              v139[7] = v107;
              v139[8] = v12;
              v139[9] = v110;
              v139[10] = v17;
              v139[11] = v109;
              v139[12] = v105;
              [v21 enumerateKeysAndObjectsUsingBlock:v139];
              v23 = (void *)[v16 relationshipsByName];
              v138[0] = v22;
              v138[1] = 3221225472LL;
              v138[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2;
              v138[3] = &unk_189EA74F0;
              v138[4] = v8;
              v138[5] = v16;
              v138[6] = v9;
              v138[7] = v108;
              v138[8] = obj;
              v138[9] = v14;
              v138[10] = v102;
              v138[11] = v104;
              v138[12] = v101;
              [v23 enumerateKeysAndObjectsUsingBlock:v138];
              objc_opt_self();
              if (qword_18C4AB888 != -1) {
                dispatch_once(&qword_18C4AB888, &__block_literal_global_130);
              }
              if ((_MergedGlobals_61 & 1) == 0 && objc_msgSend((id)objc_msgSend(v16, "uniquenessConstraints"), "count"))
              {
                v24 = (void *)[v16 uniquenessConstraints];
                v137[0] = MEMORY[0x1895F87A8];
                v137[1] = 3221225472LL;
                v137[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3;
                v137[3] = &unk_189EA7540;
                v137[4] = v16;
                v137[5] = v94;
                [v24 enumerateObjectsUsingBlock:v137];
              }

              if (qword_18C4AB878 != -1) {
                dispatch_once(&qword_18C4AB878, &__block_literal_global_0);
              }
              v25 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v16, "userInfo"),  "objectForKey:",  @"NSPersistentHistoryTombstoneAttributes"),  "componentsSeparatedByString:",  @",");
              if (v25)
              {
                v26 = v25;
                if ([v25 count]) {
                  [v17 addObjectsFromArray:v26];
                }
              }

              __int128 v135 = 0u;
              __int128 v136 = 0u;
              __int128 v133 = 0u;
              __int128 v134 = 0u;
              v27 = (void *)qword_18C4AB880;
              uint64_t v28 = [(id)qword_18C4AB880 countByEnumeratingWithState:&v133 objects:v156 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v134;
                do
                {
                  for (uint64_t i = 0LL; i != v29; ++i)
                  {
                    if (*(void *)v134 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v32 = *(void *)(*((void *)&v133 + 1) + 8 * i);
                    if ([v18 containsObject:v32]
                      && ([v17 containsObject:v32] & 1) == 0)
                    {
                      v33 = (void *)[objc_alloc(NSString) initWithFormat:@"%@:%@ - preservesValueInHistoryOnDeletion should be YES", objc_msgSend(v16, "name"), v32];
                      [v115 addObject:v33];
                    }
                  }

                  uint64_t v29 = [v27 countByEnumeratingWithState:&v133 objects:v156 count:16];
                }

                while (v29);
              }

              id v34 = objc_alloc(getCloudKitCKRecordZoneIDClass());
              v35 = (void *)[v34 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName()];
              v36 = +[PFCloudKitSchemaGenerator newRepresentativeRecordForStaticFieldsInEntity:inZoneWithID:]( (uint64_t)&OBJC_CLASS___PFCloudKitSchemaGenerator,  v16,  (uint64_t)v35);
              if ((unint64_t)[v36 size] > 0xAAE60)
              {
                v37 = (void *)[objc_alloc(NSString) initWithFormat:@"%@: Estimated size %lu bytes", objc_msgSend(v16, "name"), objc_msgSend(v36, "size")];
                [v95 addObject:v37];
              }

              id v12 = v113;
              uint64_t v15 = v114 + 1;
              id v9 = v98;
              id v8 = v99;
              id v10 = v103;
              id v14 = v106;
            }

            while (v114 + 1 != v111);
            uint64_t v111 = [obj countByEnumeratingWithState:&v140 objects:buf count:16];
          }

          while (v111);
        }

        id v38 = objc_alloc_init(MEMORY[0x189603FA8]);
        if ([v9 count])
        {
          [v9 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v39 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithString:",  @"CloudKit integration requires that all relationships have an inverse, the following do not:");
          v132[0] = MEMORY[0x1895F87A8];
          v132[1] = 3221225472LL;
          v132[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_76;
          v132[3] = &unk_189EA7588;
          v132[4] = v39;
          [v9 enumerateObjectsUsingBlock:v132];
          [v38 addObject:v39];
        }

        if ([v108 count])
        {
          [v108 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v40 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CloudKit integration does not support ordered relationships. The following relationships are marked ordered:"];
          v131[0] = MEMORY[0x1895F87A8];
          v131[1] = 3221225472LL;
          v131[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_82;
          v131[3] = &unk_189EA7588;
          v131[4] = v40;
          [v108 enumerateObjectsUsingBlock:v131];
          [v38 addObject:v40];
        }

        if ([v109 count])
        {
          [v109 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v41 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithString:",  @"CloudKit integration requires that all attributes be optional, or have a default value set. The following attributes are marked non-optional but do not have a default value:");
          v130[0] = MEMORY[0x1895F87A8];
          v130[1] = 3221225472LL;
          v130[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_85;
          v130[3] = &unk_189EA7588;
          v130[4] = v41;
          [v109 enumerateObjectsUsingBlock:v130];
          [v38 addObject:v41];
        }

        if ([v8 count])
        {
          [v8 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v42 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithString:",  @"CloudKit integration requires that all relationships be optional, the following are not:");
          v129[0] = MEMORY[0x1895F87A8];
          v129[1] = 3221225472LL;
          v129[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5;
          v129[3] = &unk_189EA7588;
          v129[4] = v42;
          [v8 enumerateObjectsUsingBlock:v129];
          [v38 addObject:v42];
        }

        if ([v107 count])
        {
          [v107 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v43 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CloudKit integration does not support all attribute types. The following entities have attributes of an unsupported type:"];
          v128[0] = MEMORY[0x1895F87A8];
          v128[1] = 3221225472LL;
          v128[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6;
          v128[3] = &unk_189EA7588;
          v128[4] = v43;
          [v107 enumerateObjectsUsingBlock:v128];
          [v38 addObject:v43];
        }

        if ([v10 count])
        {
          [v10 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          id v44 = objc_alloc(MEMORY[0x189607940]);
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = (void *)[v44 initWithFormat:@"CloudKit integration requires that the value transformers for transformable attributes are available via +[%@ %@] and allow reverse transformation:", v46, NSStringFromSelector(sel_valueTransformerForName_)];
          v127[0] = MEMORY[0x1895F87A8];
          v127[1] = 3221225472LL;
          v127[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7;
          v127[3] = &unk_189EA7588;
          v127[4] = v47;
          [v103 enumerateObjectsUsingBlock:v127];
          [v38 addObject:v47];
        }

        if ([v106 count])
        {
          [v106 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v48 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"CloudKit integration does not allow relationships to objects that aren't sync'd. The following relationships have destination entities that not in the specified configuration."];
          v126[0] = MEMORY[0x1895F87A8];
          v126[1] = 3221225472LL;
          v126[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8;
          v126[3] = &unk_189EA7588;
          v126[4] = v48;
          [v106 enumerateObjectsUsingBlock:v126];
          [v38 addObject:v48];
        }

        if ([v115 count])
        {
          [v115 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v49 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"CloudKit integration requires that all entities tombstone %@ and %@ on delete if configured. The following entities are not properly configured:", @"ckRecordID", @"ckRecordSystemFields"];
          v125[0] = MEMORY[0x1895F87A8];
          v125[1] = 3221225472LL;
          v125[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9;
          v125[3] = &unk_189EA7588;
          v125[4] = v49;
          [v115 enumerateObjectsUsingBlock:v125];
          [v38 addObject:v49];
        }

        if ([v95 count])
        {
          [v95 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v50 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @"CloudKit integration requires that all entities can be materialized in a CKRecord of less than %lu bytes. The following entities cannot:",  700000);
          v124[0] = MEMORY[0x1895F87A8];
          v124[1] = 3221225472LL;
          v124[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10;
          v124[3] = &unk_189EA7588;
          v124[4] = v50;
          [v95 enumerateObjectsUsingBlock:v124];
          [v38 addObject:v50];
        }

        if ([v113 count])
        {
          [v113 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v51 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following attributes have invalid values for '%@':", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"];
          v123[0] = MEMORY[0x1895F87A8];
          v123[1] = 3221225472LL;
          v123[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11;
          v123[3] = &unk_189EA7588;
          v123[4] = v51;
          [v113 enumerateObjectsUsingBlock:v123];
          [v38 addObject:v51];
        }

        if ([v102 count])
        {
          [v102 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v52 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"CloudKit integration does not support ignored relationships. The following entities and relationships are marked ignored using '%@':", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"];
          v122[0] = MEMORY[0x1895F87A8];
          v122[1] = 3221225472LL;
          v122[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12;
          v122[3] = &unk_189EA7588;
          v122[4] = v52;
          [v102 enumerateObjectsUsingBlock:v122];
          [v38 addObject:v52];
        }

        if ([v96 count])
        {
          [v96 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v53 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following entities have invalid values:"];
          v121[0] = MEMORY[0x1895F87A8];
          v121[1] = 3221225472LL;
          v121[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13;
          v121[3] = &unk_189EA7588;
          v121[4] = v53;
          [v96 enumerateObjectsUsingBlock:v121];
          [v38 addObject:v53];
        }

        v54 = v110;
        if ([v110 count])
        {
          [v110 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v55 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following attributes have invalid values:"];
          v120[0] = MEMORY[0x1895F87A8];
          v120[1] = 3221225472LL;
          v120[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14;
          v120[3] = &unk_189EA7588;
          v120[4] = v55;
          [v110 enumerateObjectsUsingBlock:v120];
          [v38 addObject:v55];

          v54 = v110;
        }

        if ([v104 count])
        {
          [v104 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v56 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"CloudKit integration does not support encrypted relationships. The following entities and relationships are marked with '%@':", @"NSPersistentCloudKitContainerEncryptedAttributeKey"];
          v119[0] = MEMORY[0x1895F87A8];
          v119[1] = 3221225472LL;
          v119[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15;
          v119[3] = &unk_189EA7588;
          v119[4] = v56;
          [v104 enumerateObjectsUsingBlock:v119];
          [v38 addObject:v56];

          v54 = v110;
        }

        if ([v105 count])
        {
          [v105 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v57 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following attributes use mergeable storage with CloudKit which is unsupported:"];
          v118[0] = MEMORY[0x1895F87A8];
          v118[1] = 3221225472LL;
          v118[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16;
          v118[3] = &unk_189EA7588;
          v118[4] = v57;
          [v105 enumerateObjectsUsingBlock:v118];
          [v38 addObject:v57];

          v54 = v110;
        }

        if ([v101 count])
        {
          [v101 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v58 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"The following relationships are configured with unsupported delete rules:"];
          v117[0] = MEMORY[0x1895F87A8];
          v117[1] = 3221225472LL;
          v117[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17;
          v117[3] = &unk_189EA7588;
          v117[4] = v58;
          [v101 enumerateObjectsUsingBlock:v117];
          [v38 addObject:v58];

          v54 = v110;
        }

        if ([v94 count])
        {
          [v94 sortUsingSelector:sel_localizedCaseInsensitiveCompare_];
          v59 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"CloudKit integration does not support unique constraints. The following entities are constrained:"];
          v116[0] = MEMORY[0x1895F87A8];
          v116[1] = 3221225472LL;
          v116[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18;
          v116[3] = &unk_189EA7588;
          v116[4] = v59;
          [v94 enumerateObjectsUsingBlock:v116];
          [v38 addObject:v59];

          v54 = v110;
        }

        uint64_t v60 = [v38 count];
        if (v60)
        {
          else {
            uint64_t v61 = [v38 componentsJoinedByString:@"\n"];
          }
          uint64_t v71 = *MEMORY[0x189607460];
          uint64_t v154 = *MEMORY[0x1896075F0];
          uint64_t v155 = v61;
          v70 = (void *)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  v71,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));

          if (!v70)
          {
            uint64_t v72 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog( 17LL,  v72,  v73,  v74,  v75,  v76,  v77,  v78,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
            v79 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v150 = 136315394;
              v151 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
              __int16 v152 = 1024;
              int v153 = 563;
              _os_log_fault_impl( &dword_186681000,  v79,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  v150,  0x12u);
            }

            v70 = 0LL;
          }
        }

        else
        {

          v70 = 0LL;
        }

        id v80 = v70;

        objc_autoreleasePoolPop(context);
        id v81 = v70;
        a3 = v93;
        if (!v60) {
          return 1LL;
        }
        goto LABEL_85;
      }

      v65 = (void *)MEMORY[0x189607870];
      uint64_t v66 = *MEMORY[0x189607460];
      uint64_t v146 = *MEMORY[0x1896075F0];
      uint64_t v147 = [NSString stringWithFormat:@"The configuration named '%@' does not contain any entities.", *(void *)(v4 + 16)];
      v67 = (void *)MEMORY[0x189603F68];
      v68 = &v147;
      v69 = &v146;
    }

    else
    {
      v65 = (void *)MEMORY[0x189607870];
      uint64_t v66 = *MEMORY[0x189607460];
      uint64_t v148 = *MEMORY[0x1896075F0];
      uint64_t v149 = [NSString stringWithFormat:@"Unable to find a configuration named '%@' in the specified managed object model.", *(void *)(v4 + 16)];
      v67 = (void *)MEMORY[0x189603F68];
      v68 = &v149;
      v69 = &v148;
    }
  }

  else
  {
    v62 = (void *)NSString;
    v63 = (objc_class *)objc_opt_class();
    uint64_t v64 = [v62 stringWithFormat:@"Cannot be used without an instance of %@.", NSStringFromClass(v63)];
    v65 = (void *)MEMORY[0x189607870];
    uint64_t v66 = *MEMORY[0x189607460];
    uint64_t v144 = *MEMORY[0x1896075F0];
    uint64_t v145 = v64;
    v67 = (void *)MEMORY[0x189603F68];
    v68 = &v145;
    v69 = &v144;
  }

  v70 = (void *)objc_msgSend( v65,  "errorWithDomain:code:userInfo:",  v66,  134060,  objc_msgSend(v67, "dictionaryWithObjects:forKeys:count:", v68, v69, 1));
LABEL_85:
  if (v70)
  {
    if (a3)
    {
      result = 0LL;
      *a3 = v70;
      return result;
    }
  }

  else
  {
    uint64_t v82 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m");
    v89 = (os_log_s *)__pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    v158 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitModelValidator.m";
    __int16 v159 = 1024;
    int v160 = 108;
    _os_log_fault_impl( &dword_186681000,  v89,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
  }

  return 0LL;
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 25LL))
  {
    uint64_t result = +[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)&OBJC_CLASS___PFCloudKitSerializer, a3);
    if ((result & 1) != 0) {
      return result;
    }
  }

  uint64_t v7 = [a3 attributeType];
  if (v7 > 799)
  {
    if (v7 <= 1099)
    {
      if (v7 != 800 && v7 != 900 && v7 != 1000) {
        goto LABEL_32;
      }
    }

    else if (v7 > 1799)
    {
      if (v7 == 2100) {
        goto LABEL_34;
      }
      if (v7 != 1800) {
        goto LABEL_32;
      }
      if (objc_msgSend((id)objc_msgSend(a3, "valueTransformerName"), "length")
        && !*(_BYTE *)(*(void *)(a1 + 32) + 24LL))
      {
        if (objc_msgSend(MEMORY[0x189607B20], "valueTransformerForName:", objc_msgSend(a3, "valueTransformerName")))
        {
          if ([(id)objc_opt_class() allowsReverseTransformation]) {
            goto LABEL_34;
          }
          id v8 = *(void **)(a1 + 40);
          uint64_t v9 = [NSString stringWithFormat:@"%@: %@ - Doesn't allow reverse transformation", objc_msgSend(*(id *)(a1 + 48), "name"), a2, v34];
        }

        else
        {
          id v8 = *(void **)(a1 + 40);
          uint64_t v9 = [NSString stringWithFormat:@"%@: %@ - Cannot locate value transformer with name '%@'", objc_msgSend(*(id *)(a1 + 48), "name"), a2, objc_msgSend(a3, "valueTransformerName")];
        }

        uint64_t v11 = v9;
        id v12 = v8;
        goto LABEL_33;
      }
    }

    else if (v7 != 1100 && v7 != 1200)
    {
      goto LABEL_32;
    }
  }

  else if (v7 <= 399)
  {
    if (v7 != 100 && v7 != 200 && v7 != 300) {
      goto LABEL_32;
    }
  }

  else if (v7 > 599)
  {
    if (v7 != 600 && v7 != 700) {
      goto LABEL_32;
    }
  }

  else if (v7 != 400 && v7 != 500)
  {
LABEL_32:
    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = [NSString stringWithFormat:@"%@: %@ - Unsupported attribute type (%@)", objc_msgSend(*(id *)(a1 + 48), "name"), a2, +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription, "stringForAttributeType:", v7)];
    id v12 = v10;
LABEL_33:
    [v12 addObject:v11];
  }

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  if (([a3 isOptional] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if (![a3 inverseRelationship]) {
    [*(id *)(a1 + 48) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if ([a3 isOrdered]) {
    [*(id *)(a1 + 56) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2)];
  }
  if ([a3 destinationEntity]
    && (objc_msgSend(*(id *)(a1 + 64), "containsObject:", objc_msgSend(a3, "destinationEntity")) & 1) == 0)
  {
    [*(id *)(a1 + 72) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@: %@ - %@", objc_msgSend(*(id *)(a1 + 40), "name"), a2, objc_msgSend((id)objc_msgSend(a3, "destinationEntity"), "name"))];
  }

  if (objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(a3, "userInfo"),  "objectForKey:",  @"NSCloudKitMirroringDelegateIgnoredPropertyKey"),  "BOOLValue")) {
    [*(id *)(a1 + 80) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@:%@", objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name"))];
  }
  if (objc_msgSend( (id)objc_msgSend(a3, "userInfo"),  "objectForKey:",  @"NSPersistentCloudKitContainerEncryptedAttributeKey"))
  {
    [*(id *)(a1 + 88) addObject:objc_msgSend( NSString, "stringWithFormat:", @"%@:%@", objc_msgSend(*(id *)(a1 + 40), "name"), objc_msgSend(a3, "name"))];
  }

  uint64_t result = [a3 deleteRule];
  if (result == 3)
  {
    uint64_t v7 = *(void **)(a1 + 96);
    id v8 = (void *)NSString;
    uint64_t v9 = [*(id *)(a1 + 40) name];
    uint64_t v10 = [a3 name];
    unint64_t v11 = [a3 deleteRule];
    objc_opt_self();
    if (v11 > 3) {
      id v12 = 0LL;
    }
    else {
      id v12 = off_189EA75C8[v11];
    }
    return [v7 addObject:objc_msgSend(v8, "stringWithFormat:", @"%@:%@ - %@", v9, v10, v12)];
  }

  return result;
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = objc_alloc_init(MEMORY[0x189607940]);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4;
  v5[3] = &unk_189EA7518;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = v4;
  [a2 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@: %@", objc_msgSend(*(id *)(a1 + 32), "name"), v4)];
}

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ([a2 isNSString])
  {
LABEL_4:
    if (v2)
    {
      if ([*(id *)(a1 + 40) length]) {
        objc_msgSend(*(id *)(a1 + 40), "appendString:", @", ");
      }
      [*(id *)(a1 + 40) appendString:v2];
    }

    return;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)[v2 name];
    goto LABEL_4;
  }

  uint64_t v4 = [NSString stringWithUTF8String:"PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@"];
  uint64_t v5 = [*(id *)(a1 + 32) name];
  [*(id *)(a1 + 32) uniquenessConstraints];
  _NSCoreDataLog(17LL, v4, v6, v7, v8, v9, v10, v11, v5);
  id v12 = (os_log_s *)__pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 32) name];
    uint64_t v14 = [*(id *)(a1 + 32) uniquenessConstraints];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_fault_impl( &dword_186681000,  v12,  OS_LOG_TYPE_FAULT,  "CoreData: PFCloudKitModelValidator was handed an entity with unique constraints that aren't attributes or strings: %@ - %@",  buf,  0x16u);
  }

void __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_60()
{
  v1[2] = *MEMORY[0x1895F89C0];
  v0 = (void *)MEMORY[0x186E3E5D8]();
  v1[0] = @"ckRecordID";
  v1[1] = @"ckRecordSystemFields";
  qword_18C4AB880 = (uint64_t)(id)[MEMORY[0x189603F18] arrayWithObjects:v1 count:2];
  objc_autoreleasePoolPop(v0);
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_2_76(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_3_82(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_4_85(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_17(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

uint64_t __51__PFCloudKitModelValidator_validateEntities_error___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void __57__PFCloudKitModelValidator_enforceUniqueConstraintChecks__block_invoke()
{
  if (!(_BYTE)dword_18C4ABDC0 || (v0 = getprogname()) != 0LL && !strncmp("routined", v0, 8uLL)) {
    _MergedGlobals_61 = 1;
  }
}

@end