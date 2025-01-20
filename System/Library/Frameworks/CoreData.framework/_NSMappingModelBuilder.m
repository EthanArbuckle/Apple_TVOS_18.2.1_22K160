@interface _NSMappingModelBuilder
+ (int)migrationDebugLevel;
+ (void)setMigrationDebugLevel:(int)a3;
- (NSEntityMapping)newEntityMappingWithSource:(void *)a1 destination:(void *)a2;
- (NSMappingModel)newInferredMappingModel:(NSMappingModel *)a1;
- (_NSMappingModelBuilder)initWithSourceModel:(id)a3 destinationModel:(id)a4;
- (void)dealloc;
@end

@implementation _NSMappingModelBuilder

+ (int)migrationDebugLevel
{
  return +[NSMappingModel migrationDebugLevel](&OBJC_CLASS___NSMappingModel, "migrationDebugLevel");
}

+ (void)setMigrationDebugLevel:(int)a3
{
}

- (_NSMappingModelBuilder)initWithSourceModel:(id)a3 destinationModel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSMappingModelBuilder;
  v6 = -[_NSMappingModelBuilder init](&v8, sel_init);
  if (v6)
  {
    v6->_sourceModel = (NSManagedObjectModel *)a3;
    v6->_destinationModel = (NSManagedObjectModel *)a4;
  }

  return v6;
}

- (void)dealloc
{
  self->_sourceModel = 0LL;
  self->_destinationModel = 0LL;

  self->_error = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSMappingModelBuilder;
  -[_NSMappingModelBuilder dealloc](&v3, sel_dealloc);
}

- (NSMappingModel)newInferredMappingModel:(NSMappingModel *)a1
{
  v2 = a1;
  uint64_t v156 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    a1->_reserved2 = 0LL;

    v2->_entityMappings = 0LL;
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    v85 = v2;
    reserved = v2->_reserved;
    uint64_t v5 = 0LL;
    uint64_t v6 = [reserved countByEnumeratingWithState:&v99 objects:v150 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v100;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v100 != v7) {
            objc_enumerationMutation(reserved);
          }
          objc_msgSend( v3,  "setObject:forKey:",  *(void *)(*((void *)&v99 + 1) + 8 * i),  objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * i), "renamingIdentifier"));
        }

        v5 += v6;
        uint64_t v6 = [reserved countByEnumeratingWithState:&v99 objects:v150 count:16];
      }

      while (v6);
    }

    if (v5 == [v3 count])
    {
      v9 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:2 * v5];
      obuint64_t j = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2 * v5];
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      reserved1 = v85->_reserved1;
      uint64_t v11 = 0LL;
      uint64_t v12 = [reserved1 countByEnumeratingWithState:&v95 objects:v149 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v96;
        do
        {
          for (uint64_t j = 0LL; j != v12; ++j)
          {
            if (*(void *)v96 != v13) {
              objc_enumerationMutation(reserved1);
            }
            v15 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            uint64_t v16 = [v15 renamingIdentifier];
            v17 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]( (void *)[v3 objectForKey:v16],  v15);
            [obj addObject:v17];
            [v9 addObject:v16];

            objc_msgSend(v3, "removeObjectForKey:", objc_msgSend(v15, "renamingIdentifier"));
          }

          v11 += v12;
          uint64_t v12 = [reserved1 countByEnumeratingWithState:&v95 objects:v149 count:16];
        }

        while (v12);
      }

      if (v11 == [v9 count])
      {

        __int128 v93 = 0u;
        __int128 v94 = 0u;
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        uint64_t v18 = [v3 countByEnumeratingWithState:&v91 objects:v148 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v92;
          do
          {
            for (uint64_t k = 0LL; k != v18; ++k)
            {
              if (*(void *)v92 != v19) {
                objc_enumerationMutation(v3);
              }
              v21 = -[_NSMappingModelBuilder newEntityMappingWithSource:destination:]( (void *)[v3 objectForKey:*(void *)(*((void *)&v91 + 1) + 8 * k)],  0);
              [obj addObject:v21];
            }

            uint64_t v18 = [v3 countByEnumeratingWithState:&v91 objects:v148 count:16];
          }

          while (v18);
        }

        __int128 v89 = 0u;
        __int128 v90 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        uint64_t v76 = [obj countByEnumeratingWithState:&v87 objects:v147 count:16];
        if (v76)
        {
          uint64_t v75 = *(void *)v88;
          uint64_t v72 = *MEMORY[0x189607460];
LABEL_27:
          uint64_t v83 = 0LL;
          while (1)
          {
            if (*(void *)v88 != v75) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v87 + 1) + 8 * v83);
            if ([v22 mappingType] == 4 || objc_msgSend(v22, "mappingType") == 5)
            {
              v23 = (void *)objc_msgSend( (id)objc_msgSend(v85->_reserved, "entitiesByName"),  "objectForKey:",  objc_msgSend(v22, "sourceEntityName"));
              v80 = (void *)objc_msgSend( (id)objc_msgSend(v85->_reserved1, "entitiesByName"),  "objectForKey:",  objc_msgSend(v22, "destinationEntityName"));
              v85->_reserved2 = v22;
              id v82 = objc_alloc_init(MEMORY[0x1896077E8]);
              v24 = (void *)MEMORY[0x189607878];
              uint64_t v25 = [MEMORY[0x189607878] expressionForVariable:@"manager"];
              v26 = (void *)MEMORY[0x189603F18];
              uint64_t v27 = objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", objc_msgSend(v23, "name"));
              uint64_t v28 = objc_msgSend( v24,  "expressionForFunction:selectorName:arguments:",  v25,  @"fetchRequestForSourceEntityNamed:predicateString:",  objc_msgSend( v26,  "arrayWithObjects:",  v27,  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", @"TRUEPREDICATE"),  0));
              objc_msgSend( v22,  "setSourceExpression:",  +[NSFetchRequestExpression expressionForFetch:context:countOnly:]( NSFetchRequestExpression,  "expressionForFetch:context:countOnly:",  v28,  objc_msgSend( MEMORY[0x189607878],  "expressionForFunction:selectorName:arguments:",  objc_msgSend(MEMORY[0x189607878], "expressionForVariable:", @"manager"),  @"sourceContext",  0),  0));
              v29 = (void *)[v23 propertiesByName];
              uint64_t v30 = [v29 count];
              v84 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v30];
              uint64_t v143 = 0LL;
              v144 = &v143;
              uint64_t v145 = 0x2020000000LL;
              uint64_t v146 = 0LL;
              v31 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v30];
              v77 = v22;
              uint64_t v137 = 0LL;
              v138 = &v137;
              uint64_t v139 = 0x3052000000LL;
              v140 = __Block_byref_object_copy__5;
              v141 = __Block_byref_object_dispose__5;
              v136[0] = MEMORY[0x1895F87A8];
              v136[1] = 3221225472LL;
              v136[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke;
              v136[3] = &unk_189EA7998;
              v136[6] = &v143;
              v136[4] = v84;
              v136[5] = v31;
              v142 = v136;
              uint64_t v130 = 0LL;
              v131 = &v130;
              uint64_t v132 = 0x3052000000LL;
              v133 = __Block_byref_object_copy__5;
              v134 = __Block_byref_object_dispose__5;
              v129[0] = MEMORY[0x1895F87A8];
              v129[1] = 3221225472LL;
              v129[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2;
              v129[3] = &unk_189EA79C0;
              v129[4] = &v130;
              v129[5] = &v137;
              v135 = v129;
              __int128 v127 = 0u;
              __int128 v128 = 0u;
              __int128 v125 = 0u;
              __int128 v126 = 0u;
              v32 = (void *)[v29 allValues];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v125 objects:buf count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v126;
                do
                {
                  for (uint64_t m = 0LL; m != v33; ++m)
                  {
                    if (*(void *)v126 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    v36 = *(void **)(*((void *)&v125 + 1) + 8 * m);
                    if (([v36 isTransient] & 1) == 0)
                    {
                      switch([v36 _propertyType])
                      {
                        case 2LL:
                        case 4LL:
                        case 6LL:
                          uint64_t v37 = 0LL;
                          uint64_t v38 = v138[5];
                          goto LABEL_41;
                        case 7LL:
                          uint64_t v38 = v131[5];
                          uint64_t v39 = [v36 elements];
                          uint64_t v37 = [v36 name];
                          v36 = (void *)v39;
LABEL_41:
                          (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v36, v37);
                          break;
                        default:
                          continue;
                      }
                    }
                  }

                  uint64_t v33 = [v32 countByEnumeratingWithState:&v125 objects:buf count:16];
                }

                while (v33);
              }

              uint64_t v40 = v144[3];
              if (v40 == [v84 count])
              {
                v41 = (void *)[v80 propertiesByName];
                uint64_t v42 = [v41 count];
                v79 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v42];
                v78 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v42];
                uint64_t v43 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42];
                v81 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v42];
                id v44 = objc_alloc_init(MEMORY[0x189603FC8]);
                uint64_t v121 = 0LL;
                v122 = &v121;
                uint64_t v123 = 0x2020000000LL;
                char v124 = 0;
                uint64_t v115 = 0LL;
                v116 = &v115;
                uint64_t v117 = 0x3052000000LL;
                v118 = __Block_byref_object_copy__5;
                v119 = __Block_byref_object_dispose__5;
                v114[0] = MEMORY[0x1895F87A8];
                v114[1] = 3221225472LL;
                v114[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3;
                v114[3] = &unk_189EA79E8;
                v114[4] = v84;
                v114[5] = v85;
                v114[6] = v79;
                v114[7] = v78;
                v114[8] = v44;
                v73 = (void *)v43;
                v74 = v31;
                v114[9] = v43;
                v114[10] = v81;
                v114[11] = v31;
                v114[12] = &v121;
                v120 = v114;
                uint64_t v108 = 0LL;
                v109 = &v108;
                uint64_t v110 = 0x3052000000LL;
                v111 = __Block_byref_object_copy__5;
                v112 = __Block_byref_object_dispose__5;
                v107[0] = MEMORY[0x1895F87A8];
                v107[1] = 3221225472LL;
                v107[2] = __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4;
                v107[3] = &unk_189EA7A10;
                v107[4] = v44;
                v107[5] = &v108;
                v107[6] = &v115;
                v113 = v107;
                __int128 v103 = 0u;
                __int128 v104 = 0u;
                __int128 v105 = 0u;
                __int128 v106 = 0u;
                v45 = (void *)[v41 allValues];
                uint64_t v46 = [v45 countByEnumeratingWithState:&v103 objects:v151 count:16];
                if (v46)
                {
                  uint64_t v47 = *(void *)v104;
                  do
                  {
                    for (uint64_t n = 0LL; n != v46; ++n)
                    {
                      if (*(void *)v104 != v47) {
                        objc_enumerationMutation(v45);
                      }
                      v49 = *(void **)(*((void *)&v103 + 1) + 8 * n);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0) {
                        (*(void (**)(uint64_t, uint64_t, uint64_t))(v109[5] + 16))( v109[5],  [v49 elements],  objc_msgSend(v49, "name"));
                      }
                      else {
                        (*(void (**)(void))(v116[5] + 16))();
                      }
                    }

                    uint64_t v46 = [v45 countByEnumeratingWithState:&v103 objects:v151 count:16];
                  }

                  while (v46);
                }

                if (*((_BYTE *)v122 + 24))
                {
                }

                else
                {
                  [v77 setAttributeMappings:v73];
                  [v77 setRelationshipMappings:v81];

                  v52 = (void *)[v77 userInfo];
                  v53 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(v52, "count") + 3);
                  v54 = v53;
                  if (v52) {
                    [v53 addEntriesFromDictionary:v52];
                  }
                  [v54 setObject:v74 forKey:_NSInferredRemovedPropertiesKey];
                  [v54 setObject:v79 forKey:_NSInferredAddedPropertiesKey];
                  [v54 setObject:v78 forKey:_NSInferredMappedPropertiesKey];
                  [v77 setUserInfo:v54];
                }

                [v82 drain];
                BOOL v51 = *((_BYTE *)v122 + 24) == 0;
                _Block_object_dispose(&v108, 8);
                _Block_object_dispose(&v115, 8);
                _Block_object_dispose(&v121, 8);
              }

              else
              {
                id v50 = objc_alloc(MEMORY[0x189607870]);
                v85->_entityMappings = (NSMutableArray *)objc_msgSend( v50,  "initWithDomain:code:userInfo:",  v72,  134190,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObject:forKey:",  @"Each property must have a unique renaming identifier",  @"reason"));

                [v82 drain];
                BOOL v51 = 0;
              }

              _Block_object_dispose(&v130, 8);
              _Block_object_dispose(&v137, 8);
              _Block_object_dispose(&v143, 8);
              if (!v51) {
                break;
              }
            }

            if (++v83 == v76)
            {
              uint64_t v76 = [obj countByEnumeratingWithState:&v87 objects:v147 count:16];
              if (v76) {
                goto LABEL_27;
              }
              goto LABEL_65;
            }
          }

          entityMappings = v85->_entityMappings;
          if (entityMappings)
          {
            if (a2)
            {
              v2 = 0LL;
              *a2 = (uint64_t)entityMappings;
              goto LABEL_78;
            }
          }

          else
          {
            uint64_t v62 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog( 17LL,  v62,  v63,  v64,  v65,  v66,  v67,  v68,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m");
            v69 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v153 = "/Library/Caches/com.apple.xbs/Sources/Persistence/_NSMappingModelBuilder.m";
              __int16 v154 = 1024;
              int v155 = 131;
              _os_log_fault_impl( &dword_186681000,  v69,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
            }
          }

          v2 = 0LL;
        }

        else
        {
LABEL_65:
          v2 = objc_alloc_init(&OBJC_CLASS___NSMappingModel);
          -[NSMappingModel setEntityMappings:](v2, "setEntityMappings:", obj);
        }

- (NSEntityMapping)newEntityMappingWithSource:(void *)a1 destination:(void *)a2
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSEntityMapping);
  if (a1)
  {
    -[NSEntityMapping setSourceEntityName:](v4, "setSourceEntityName:", [a1 name]);
    -[NSEntityMapping setSourceEntityVersionHash:](v4, "setSourceEntityVersionHash:", [a1 versionHash]);
    uint64_t v5 = 0LL;
    if (a2) {
      goto LABEL_3;
    }
LABEL_7:
    id v13 = objc_alloc(NSString);
    v14 = (void *)[v13 initWithFormat:@"%@%@_%@", _NSInferredMappingPrefix, @"Remove", objc_msgSend(a1, "renamingIdentifier")];
    -[NSEntityMapping setName:](v4, "setName:", v14);

    uint64_t v5 = 3LL;
    goto LABEL_11;
  }

  id v11 = objc_alloc(NSString);
  uint64_t v12 = (void *)[v11 initWithFormat:@"%@%@_%@", _NSInferredMappingPrefix, @"Add", objc_msgSend(a2, "renamingIdentifier")];
  -[NSEntityMapping setName:](v4, "setName:", v12);

  uint64_t v5 = 2LL;
  if (!a2) {
    goto LABEL_7;
  }
LABEL_3:
  -[NSEntityMapping setDestinationEntityName:](v4, "setDestinationEntityName:", [a2 name]);
  -[NSEntityMapping setDestinationEntityVersionHash:]( v4,  "setDestinationEntityVersionHash:",  [a2 versionHash]);
  if (a1)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a1, "versionHash"), "isEqual:", objc_msgSend(a2, "versionHash"));
    id v7 = objc_alloc(NSString);
    objc_super v8 = _NSInferredMappingPrefix;
    uint64_t v9 = [a1 renamingIdentifier];
    if (v6)
    {
      v10 = (void *)[v7 initWithFormat:@"%@%@_%@", v8, @"Copy", v9];
      -[NSEntityMapping setName:](v4, "setName:", v10);

      uint64_t v5 = 4LL;
    }

    else
    {
      v15 = (void *)[v7 initWithFormat:@"%@%@_%@", v8, @"Transform", v9];
      -[NSEntityMapping setName:](v4, "setName:", v15);

      uint64_t v5 = 5LL;
      if ([a1 _isSchemaEqual:a2] && v4)
      {
        *(_DWORD *)&v4->_entityMappingFlags |= 2u;
        uint64_t v5 = 5LL;
      }
    }
  }

@end