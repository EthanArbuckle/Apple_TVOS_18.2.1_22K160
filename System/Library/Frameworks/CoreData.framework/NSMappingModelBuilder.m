@interface NSMappingModelBuilder
@end

@implementation NSMappingModelBuilder

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  if (a3) {
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(a2, "renamingIdentifier")];
  }
  else {
    uint64_t v5 = [a2 renamingIdentifier];
  }
  [*(id *)(a1 + 32) setObject:a2 forKey:v5];
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "name"));
}

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v20;
    v8 = &off_189EA5000;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(a2);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = *(void *)(a1 + 32);
LABEL_8:
          (*(void (**)(void, void *, uint64_t))(*(void *)(*(void *)(v11 + 8) + 40LL) + 16LL))( *(void *)(*(void *)(v11 + 8) + 40LL),  v10,  a3);
          goto LABEL_11;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v8;
          uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
          uint64_t v14 = [v10 elements];
          uint64_t v15 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v10, "name")];
          v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
          uint64_t v17 = v13;
          v8 = v12;
          v16(v17, v14, v15);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v11 = *(void *)(a1 + 40);
            goto LABEL_8;
          }
        }

void __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  v144[1] = *MEMORY[0x1895F89C0];
  if ([a2 isTransient]) {
    return;
  }
  if (a3) {
    uint64_t v6 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(a2, "renamingIdentifier")];
  }
  else {
    uint64_t v6 = [a2 renamingIdentifier];
  }
  uint64_t v7 = v6;
  v8 = (void *)[*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v9 = [a2 _propertyType];
  uint64_t v10 = [v8 _propertyType];
  uint64_t v142 = v9;
  if (v8 && v10 != v9)
  {
    if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
    {
      [v8 name];
      _NSCoreDataLog( 2LL,  (uint64_t)@"(migration) destination model property (renaming identifier '%@') matches the renaming identifier for a different type of property (%@) in the source model. Properties cannot be mapped to other property types.\n",  v11,  v12,  v13,  v14,  v15,  v16,  v7);
    }

    v8 = 0LL;
  }

  uint64_t v17 = 56LL;
  if (!v8) {
    uint64_t v17 = 48LL;
  }
  objc_msgSend(*(id *)(a1 + v17), "addObject:", objc_msgSend(a2, "_qualifiedName"));
  if (![a2 _isAttribute])
  {
    if (![a2 _isRelationship] || (uint64_t v139 = *(void *)(a1 + 40)) == 0)
    {
LABEL_152:
      if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
      {
        [v8 name];
        _NSCoreDataLog( 1LL,  (uint64_t)@"(migration) uninferrable, non-transient property type '%u' for destination model property (renaming identifier '%@'), source model property (renaming identifier '%@').",  v125,  v126,  v127,  v128,  v129,  v130,  v142);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 24LL) = 1;
      return;
    }

    uint64_t v136 = [a2 name];
    if (v8)
    {
      uint64_t v22 = [v8 name];
      if (([v8 isOptional] & 1) == 0
        && (![v8 isToMany] || objc_msgSend(v8, "minCount"))
        || ([a2 isOptional] & 1) != 0
        || [a2 isToMany] && !objc_msgSend(a2, "minCount"))
      {
        int v30 = 0;
      }

      else
      {
        if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
        {
          uint64_t v23 = [*(id *)(v139 + 24) sourceEntityName];
          [*(id *)(v139 + 24) destinationEntityName];
          _NSCoreDataLog( 2LL,  (uint64_t)@"(migration) relationship mapping for (%@->%@ to %@->%@) requires data validation during store migration, mapping a previously optional relationship to a mandatory relationship.\n",  v24,  v25,  v26,  v27,  v28,  v29,  v23);
        }

        int v30 = 1;
      }

      if ([v8 isToMany] && !objc_msgSend(a2, "isToMany"))
      {
        id v82 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v81 = objc_msgSend( v82,  "initWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134190,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v136,  @"property",  objc_msgSend(*(id *)(v139 + 24), "destinationEntityName"),  @"entity",  @"Can not map from a to-many to a to-one relationship",  @"reason",  0));
        goto LABEL_83;
      }

      v53 = (void *)MEMORY[0x189607878];
      uint64_t v54 = [MEMORY[0x189607878] expressionForVariable:@"source"];
      uint64_t v55 = objc_msgSend( v53,  "expressionForFunction:selectorName:arguments:",  v54,  @"valueForKey:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", v22)));
      v56 = (void *)MEMORY[0x189607878];
      uint64_t v57 = [MEMORY[0x189607878] expressionForVariable:@"manager"];
      uint64_t v58 = objc_msgSend( v56,  "expressionForFunction:selectorName:arguments:",  v57,  @"destinationInstancesForSourceRelationshipNamed:sourceInstances:",  objc_msgSend( MEMORY[0x189603F18],  "arrayWithObjects:",  objc_msgSend(MEMORY[0x189607878], "expressionForConstantValue:", v22),  v55,  0));
      v59 = objc_alloc(&OBJC_CLASS___NSPropertyTransform);
      v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:]( v59,  "initWithPropertyName:valueExpression:",  v136,  [MEMORY[0x189607878] expressionForKeyPath:v22]);
      v60 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:&v143 count:1];

      if (v60)
      {
LABEL_70:
        v40 = objc_alloc_init(&OBJC_CLASS___NSPropertyMapping);
        -[NSPropertyMapping setName:](v40, "setName:", v136);
        -[NSPropertyMapping setValueExpression:](v40, "setValueExpression:", v58);
        -[NSPropertyMapping _setPropertyTransforms:](v40, v60);

        if (v30)
        {
          id v61 = objc_alloc(MEMORY[0x189603F68]);
          uint64_t v62 = [MEMORY[0x189607968] numberWithBool:1];
          v63 = (void *)objc_msgSend(v61, "initWithObjectsAndKeys:", v62, _NSInferredMappingCouldFailValidation, 0);
          -[NSPropertyMapping setUserInfo:](v40, "setUserInfo:", v63);
          v144[0] = NSPropertyTransformMandatoryPropertyValidation;
          -[NSPropertyMapping _setTransformValidations:]( v40,  (void *)[MEMORY[0x189603F18] arrayWithObjects:v144 count:1]);
          v64 = (void *)[*(id *)(v139 + 24) userInfo];
          if (v64)
          {
            v65 = v64;
            if ((objc_msgSend( (id)objc_msgSend(v64, "objectForKey:", _NSInferredMappingCouldFailValidation),  "BOOLValue") & 1) == 0)
            {
              v66 = (void *)[v65 mutableCopy];
              uint64_t v67 = [MEMORY[0x189607968] numberWithBool:1];
              [v66 setObject:v67 forKey:_NSInferredMappingCouldFailValidation];
              [*(id *)(v139 + 24) setUserInfo:v66];
            }
          }

          else
          {
            [*(id *)(v139 + 24) setUserInfo:v63];
          }
        }

        if (!v40) {
          goto LABEL_152;
        }
        v90 = (id *)(a1 + 80);
        goto LABEL_96;
      }
    }

    else
    {
      if (([a2 isOptional] & 1) != 0
        || [a2 isToMany] && !objc_msgSend(a2, "minCount"))
      {
        int v30 = 0;
      }

      else
      {
        if ((int)[(id)objc_opt_class() migrationDebugLevel] >= 2)
        {
          uint64_t v71 = [*(id *)(v139 + 24) destinationEntityName];
          _NSCoreDataLog( 2LL,  (uint64_t)@"(migration) relationship mapping for (%@->%@) requires data validation during store migration, mapping a new, mandatory relationship.\n",  v72,  v73,  v74,  v75,  v76,  v77,  v71);
        }

        int v30 = 1;
      }

      v78 = objc_alloc(&OBJC_CLASS___NSPropertyTransform);
      uint64_t v79 = [a2 name];
      v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:]( v78,  "initWithPropertyName:valueExpression:",  v79,  [MEMORY[0x189607878] expressionForConstantValue:0]);
      v60 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:&v143 count:1];

      uint64_t v58 = 0LL;
      if (v60) {
        goto LABEL_70;
      }
    }

    id v80 = objc_alloc(MEMORY[0x189607870]);
    uint64_t v81 = objc_msgSend( v80,  "initWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134190,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v136,  @"property",  objc_msgSend(*(id *)(v139 + 24), "destinationEntityName"),  @"entity",  @"Unable to infer mapping for relationship",  @"reason",  0));
LABEL_83:
    *(void *)(v139 + 32) = v81;
    goto LABEL_152;
  }

  uint64_t v18 = [*(id *)(a1 + 64) objectForKey:a3];
  if (v18) {
    uint64_t v18 = [*(id *)(a1 + 64) objectForKey:a3];
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = a3;
  }
  if (!v19) {
    goto LABEL_152;
  }
  if (v20) {
    uint64_t v21 = [NSString stringWithFormat:@"%@.%@", v20, objc_msgSend(a2, "name")];
  }
  else {
    uint64_t v21 = [a2 name];
  }
  uint64_t v31 = v21;
  if (v8)
  {
    uint64_t v140 = v21;
    if (!objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSMigrationAllowTypeTransformation")
      || (uint64_t v32 = [v8 attributeType], v32 == objc_msgSend(a2, "attributeType"))
      && ([a2 attributeType] == 1000 || objc_msgSend(a2, "attributeType") == 1800))
    {
      uint64_t v33 = [v8 attributeType];
      uint64_t v34 = [a2 attributeType];
      uint64_t v31 = v140;
      if (!v33 || !v34)
      {
LABEL_148:
        id v68 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v69 = *MEMORY[0x189607460];
        v122 = (void *)MEMORY[0x189603F68];
        uint64_t v123 = [*(id *)(v19 + 24) destinationEntityName];
        v133 = @"reason";
        uint64_t v134 = 0LL;
        v124 = @"Source and destination attribute types are incompatible";
LABEL_149:
        uint64_t v70 = objc_msgSend( v122,  "dictionaryWithObjectsAndKeys:",  v31,  @"property",  v123,  @"entity",  v124,  v133,  v134);
        goto LABEL_150;
      }

      if (v33 != v34)
      {
        char v35 = 1;
        if (v33 > 399)
        {
          if (v33 != 400 && v33 != 500 && v33 != 600) {
            goto LABEL_101;
          }
        }

        else if (v33 != 100 && v33 != 200 && v33 != 300)
        {
LABEL_101:
          char v35 = 0;
        }

        if (v34 > 399)
        {
          if (v34 != 400 && v34 != 600 && v34 != 500)
          {
LABEL_145:
            if (v34 != 800) {
              char v35 = 0;
            }
            if ((v35 & 1) == 0) {
              goto LABEL_148;
            }
            goto LABEL_113;
          }
        }

        else if (v34 != 100 && v34 != 200 && v34 != 300)
        {
          goto LABEL_145;
        }

        if (v33 == 800) {
          char v35 = 1;
        }
        if ((v35 & 1) == 0) {
          goto LABEL_148;
        }
      }
    }

    else
    {
      if (([v8 attributeType] != 1800 || objc_msgSend(a2, "attributeType") != 1000)
        && ([v8 attributeType] != 1000 || objc_msgSend(a2, "attributeType") != 1800))
      {
        id v68 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v69 = *MEMORY[0x189607460];
        uint64_t v70 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v140,  @"property",  objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"),  @"entity",  @"Type Transformation expects NSTransformableAttributeType or NSBinaryDataAttributeType",  @"reason",  0);
LABEL_150:
        uint64_t v50 = v70;
        v51 = v68;
        uint64_t v52 = v69;
        goto LABEL_151;
      }

      if ([v8 attributeType] == 1000 && (objc_msgSend(v8, "storesBinaryDataExternally") & 1) != 0
        || [a2 attributeType] == 1000 && objc_msgSend(a2, "storesBinaryDataExternally"))
      {
        id v48 = objc_alloc(MEMORY[0x189607870]);
        uint64_t v49 = *MEMORY[0x189607460];
        uint64_t v50 = objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v140,  @"property",  objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"),  @"entity",  @"Type Transformation expects NSBinaryDataAttributeType NOT to be stored externally",  @"reason",  0);
        v51 = v48;
        uint64_t v52 = v49;
LABEL_151:
        *(void *)(v19 + 32) = [v51 initWithDomain:v52 code:134190 userInfo:v50];
        goto LABEL_152;
      }

      uint64_t v137 = [v8 name];
      +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription,  "stringForAttributeType:",  [v8 attributeType]);
      [a2 name];
      +[NSAttributeDescription stringForAttributeType:]( NSAttributeDescription,  "stringForAttributeType:",  [a2 attributeType]);
      _NSCoreDataLog(2LL, (uint64_t)@"Transforming %@ (%@) to %@ (%@), was %@", v91, v92, v93, v94, v95, v96, v137);
      uint64_t v31 = v140;
    }

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4( void *a1,  void *a2,  uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v22;
    uint64_t v20 = a1;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if ([v10 isNSArray])
        {
          uint64_t v11 = a1[5];
LABEL_8:
          (*(void (**)(void, void *, uint64_t))(*(void *)(*(void *)(v11 + 8) + 40LL) + 16LL))( *(void *)(*(void *)(v11 + 8) + 40LL),  v10,  a3);
          goto LABEL_17;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ([v10 renamingIdentifier]
            && (objc_msgSend((id)objc_msgSend(v10, "renamingIdentifier"), "isEqualToString:", objc_msgSend(v10, "name")) & 1) == 0)
          {
            uint64_t v19 = (void *)a1[4];
            uint64_t v16 = [NSString stringWithFormat:@"%@.%@", a3, objc_msgSend(v10, "name")];
            [v19 setObject:v16, objc_msgSend( NSString, "stringWithFormat:", @"%@.%@", a3, objc_msgSend(v10, "renamingIdentifier")) forKey];
            uint64_t v12 = *(void *)(*(void *)(v20[5] + 8LL) + 40LL);
            uint64_t v13 = [v10 elements];
            uint64_t v14 = (void *)NSString;
            uint64_t v15 = [v10 renamingIdentifier];
          }

          else
          {
            uint64_t v12 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
            uint64_t v13 = [v10 elements];
            uint64_t v14 = (void *)NSString;
            uint64_t v15 = [v10 name];
          }

          uint64_t v17 = [v14 stringWithFormat:@"%@.%@", a3, v15];
          uint64_t v18 = v13;
          a1 = v20;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v18, v17);
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v11 = a1[6];
            goto LABEL_8;
          }
        }

@end