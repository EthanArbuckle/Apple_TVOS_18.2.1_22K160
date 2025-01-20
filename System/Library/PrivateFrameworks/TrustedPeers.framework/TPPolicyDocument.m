@interface TPPolicyDocument
+ (BOOL)isEqualKeyViewMapping:(id)a3 other:(id)a4;
+ (id)categoriesByViewFromPb:(id)a3;
+ (id)introducersByCategoryFromPb:(id)a3;
+ (id)modelToCategoryFromPb:(id)a3;
+ (id)policyDocWithHash:(id)a3 data:(id)a4;
+ (id)redactionWithEncrypter:(id)a3 redactionName:(id)a4 encryptionKey:(id)a5 modelToCategory:(id)a6 categoriesByView:(id)a7 introducersByCategory:(id)a8 keyViewMapping:(id)a9 error:(id *)a10;
+ (id)redactionsFromPb:(id)a3;
+ (void)addCategoriesByView:(id)a3 toPB:(id)a4;
+ (void)addIntroducersByCategory:(id)a3 toPB:(id)a4;
+ (void)addKeyViewMapping:(id)a3 toPB:(id)a4;
+ (void)addModelToCategory:(id)a3 toPB:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolicyDocument:(id)a3;
- (NSArray)keyViewMapping;
- (NSData)protobuf;
- (TPPolicyDocument)initWithHash:(id)a3 data:(id)a4;
- (TPPolicyDocument)initWithVersion:(unint64_t)a3 modelToCategory:(id)a4 categoriesByView:(id)a5 introducersByCategory:(id)a6 redactions:(id)a7 keyViewMapping:(id)a8 userControllableViewList:(id)a9 piggybackViews:(id)a10 priorityViews:(id)a11 inheritedExcludedViews:(id)a12 hashAlgo:(int64_t)a13;
- (TPPolicyVersion)version;
- (id)cloneWithVersionNumber:(unint64_t)a3;
- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5;
- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5 prependingRedactions:(id)a6;
- (id)description;
- (id)encodeProtobuf;
- (id)policyWithSecrets:(id)a3 decrypter:(id)a4 error:(id *)a5;
- (unint64_t)hash;
@end

@implementation TPPolicyDocument

- (TPPolicyDocument)initWithHash:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0LL;
  if (v6 && v7)
  {
    v10 = +[TPHashBuilder hashWithAlgo:ofData:]( &OBJC_CLASS___TPHashBuilder,  "hashWithAlgo:ofData:",  +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v6),  v7);
    if ([v6 isEqualToString:v10])
    {
      v18.receiver = self;
      v18.super_class = (Class)&OBJC_CLASS___TPPolicyDocument;
      v11 = -[TPPolicyDocument init](&v18, sel_init);
      v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_protobuf, a4);
        v13 = (void *)MEMORY[0x1895C3FC8]();
        v14 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBPolicyDocument), "initWithData:", v8);
        v15 = -[TPPolicyVersion initWithVersion:hash:]( objc_alloc(&OBJC_CLASS___TPPolicyVersion),  "initWithVersion:hash:",  -[TPPBPolicyDocument policyVersion](v14, "policyVersion"),  v10);
        version = v12->_version;
        v12->_version = v15;

        objc_autoreleasePoolPop(v13);
      }

      self = v12;
      v9 = self;
    }

    else
    {
      v9 = 0LL;
    }
  }

  return v9;
}

- (TPPolicyDocument)initWithVersion:(unint64_t)a3 modelToCategory:(id)a4 categoriesByView:(id)a5 introducersByCategory:(id)a6 redactions:(id)a7 keyViewMapping:(id)a8 userControllableViewList:(id)a9 piggybackViews:(id)a10 priorityViews:(id)a11 inheritedExcludedViews:(id)a12 hashAlgo:(int64_t)a13
{
  id v53 = a4;
  id v52 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___TPPolicyDocument;
  v25 = -[TPPolicyDocument init](&v55, sel_init);
  if (v25)
  {
    v26 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyDocument);
    -[TPPBPolicyDocument setPolicyVersion:](v26, "setPolicyVersion:", a3);
    v54 = v25;
    v27 = (void *)[v53 mutableCopy];
    -[TPPBPolicyDocument setModelToCategorys:](v26, "setModelToCategorys:", v27);

    v28 = (void *)[v52 mutableCopy];
    -[TPPBPolicyDocument setCategoriesByViews:](v26, "setCategoriesByViews:", v28);

    v29 = (void *)[v18 mutableCopy];
    -[TPPBPolicyDocument setIntroducersByCategorys:](v26, "setIntroducersByCategorys:", v29);

    v30 = (void *)[v19 mutableCopy];
    -[TPPBPolicyDocument setRedactions:](v26, "setRedactions:", v30);

    v31 = (void *)[v20 mutableCopy];
    -[TPPBPolicyDocument setKeyViewMappings:](v26, "setKeyViewMappings:", v31);

    v32 = (void *)[v21 mutableCopy];
    -[TPPBPolicyDocument setUserControllableViews:](v26, "setUserControllableViews:", v32);

    v33 = (void *)[v22 mutableCopy];
    -[TPPBPolicyDocument setPiggybackViews:](v26, "setPiggybackViews:", v33);

    v34 = (void *)[v23 mutableCopy];
    -[TPPBPolicyDocument setPriorityViews:](v26, "setPriorityViews:", v34);

    v35 = (void *)[v24 mutableCopy];
    -[TPPBPolicyDocument setInheritedExcludedViews:](v26, "setInheritedExcludedViews:", v35);

    uint64_t v36 = -[PBCodable data](v26, "data");
    protobuf = v54->_protobuf;
    v54->_protobuf = (NSData *)v36;

    v38 = objc_alloc(&OBJC_CLASS___TPPolicyVersion);
    +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", a13, v54->_protobuf);
    id v39 = v24;
    id v40 = v23;
    id v41 = v22;
    id v42 = v21;
    id v43 = v20;
    id v44 = v19;
    id v45 = v18;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v38;
    v25 = v54;
    uint64_t v48 = -[TPPolicyVersion initWithVersion:hash:](v47, "initWithVersion:hash:", a3, v46);
    version = v54->_version;
    v54->_version = (TPPolicyVersion *)v48;

    id v18 = v45;
    id v19 = v44;
    id v20 = v43;
    id v21 = v42;
    id v22 = v41;
    id v23 = v40;
    id v24 = v39;
  }

  return v25;
}

- (id)encodeProtobuf
{
  v3 = objc_alloc(&OBJC_CLASS___TPPBPolicyDocument);
  v4 = -[TPPolicyDocument protobuf](self, "protobuf");
  v5 = -[PBCodable initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (id)policyWithSecrets:(id)a3 decrypter:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v55 = a4;
  v9 = objc_alloc(&OBJC_CLASS___TPPBPolicyDocument);
  v49 = self;
  v10 = -[TPPolicyDocument protobuf](self, "protobuf");
  v11 = -[PBCodable initWithData:](v9, "initWithData:", v10);

  v51 = v11;
  v12 = -[TPPBPolicyDocument redactions](v11, "redactions");
  v13 = +[TPPolicyDocument redactionsFromPb:](&OBJC_CLASS___TPPolicyDocument, "redactionsFromPb:", v12);
  v54 = (void *)objc_opt_new();
  v14 = (void *)MEMORY[0x189603FE0];
  [v13 allKeys];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setWithArray:v15];
  id v53 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v8;
  [v8 allKeys];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 sortedArrayUsingSelector:sel_compare_];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        [v56 objectForKeyedSubscript:v22];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v13 objectForKeyedSubscript:v22];
        if (v24)
        {
          v25 = (void *)v24;
          uint64_t v26 = [v55 decryptData:v24 withKey:v23 error:a5];
          if (!v26)
          {
            v37 = 0LL;
            v50 = obj;
            goto LABEL_16;
          }

          v27 = (void *)v26;
          v28 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___TPPBPolicyDocument), "initWithData:", v26);
          if (!v28)
          {
            v37 = 0LL;
            v50 = obj;
            goto LABEL_15;
          }

          v29 = v28;
          [v53 removeObject:v22];
          [v54 mergeFrom:v29];
        }
      }

      uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  [v54 mergeFrom:v51];
  [v54 modelToCategorys];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument modelToCategoryFromPb:](&OBJC_CLASS___TPPolicyDocument, "modelToCategoryFromPb:", v50);
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 categoriesByViews];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = +[TPPolicyDocument categoriesByViewFromPb:](&OBJC_CLASS___TPPolicyDocument, "categoriesByViewFromPb:", v25);
  [v54 introducersByCategorys];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument introducersByCategoryFromPb:](&OBJC_CLASS___TPPolicyDocument, "introducersByCategoryFromPb:", v47);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v54 keyViewMappings];
  id v44 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v43 = [v53 count] != 0;
  v30 = (void *)MEMORY[0x189604010];
  [v54 userControllableViews];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 setWithArray:v46];
  id v41 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x189604010];
  [v54 piggybackViews];
  id v45 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 setWithArray:v45];
  id v40 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x189604010];
  [v54 priorityViews];
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 setWithArray:v42];
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x189604010];
  [v54 inheritedExcludedViews];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 setWithArray:v34];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicyDocument version](v49, "version");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = +[TPPolicy policyWithModelToCategory:categoriesByView:introducersByCategory:keyViewMapping:unknownRedactions:userControllableViewList:piggybackViews:priorityViews:inheritedExcludedViews:version:]( &OBJC_CLASS___TPPolicy,  "policyWithModelToCategory:categoriesByView:introducersByCategory:keyViewMapping:unknownRedactions:userControllableVi ewList:piggybackViews:priorityViews:inheritedExcludedViews:version:",  v23,  v27,  v48,  v44,  v43,  v41,  v40,  v39,  v35,  v36);
LABEL_15:
LABEL_16:

  return v37;
}

- (NSArray)keyViewMapping
{
  v3 = (void *)MEMORY[0x1895C3FC8](self, a2);
  v4 = objc_alloc(&OBJC_CLASS___TPPBPolicyDocument);
  v5 = -[TPPolicyDocument protobuf](self, "protobuf");
  id v6 = -[PBCodable initWithData:](v4, "initWithData:", v5);

  -[TPPBPolicyDocument keyViewMappings](v6, "keyViewMappings");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSArray *)v7;
}

- (id)description
{
  v2 = (void *)NSString;
  v3 = -[TPPolicyDocument version](self, "version");
  [v2 stringWithFormat:@"<TPPolicyDocument: %@>", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToPolicyDocument:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  v5 = -[TPPolicyDocument encodeProtobuf](self, "encodeProtobuf");
  [v4 encodeProtobuf];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)cloneWithVersionNumber:(unint64_t)a3
{
  return -[TPPolicyDocument cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:]( self,  "cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:",  a3,  0LL,  0LL,  0LL);
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5
{
  return -[TPPolicyDocument cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:]( self,  "cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:",  a3,  a4,  a5,  0LL);
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5 prependingRedactions:(id)a6
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc(&OBJC_CLASS___TPPBPolicyDocument);
  v14 = -[TPPolicyDocument protobuf](self, "protobuf");
  v15 = -[PBCodable initWithData:](v13, "initWithData:", v14);

  -[TPPBPolicyDocument setPolicyVersion:](v15, "setPolicyVersion:", a3);
  uint64_t v48 = v10;
  if (v10)
  {
    id v45 = self;
    id v46 = v12;
    id v47 = v11;
    [MEMORY[0x189603FA8] array];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    [v10 allKeys];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v23 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyCategoriesByView);
          -[TPPBPolicyCategoriesByView setView:](v23, "setView:", v22);
          [v48 objectForKeyedSubscript:v22];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 allObjects];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = (void *)[v25 mutableCopy];
          -[TPPBPolicyCategoriesByView setCategories:](v23, "setCategories:", v26);

          [v16 addObject:v23];
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }

      while (v19);
    }
    v27 = -[TPPBPolicyDocument categoriesByViews](v15, "categoriesByViews");
    [v16 arrayByAddingObjectsFromArray:v27];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)[v28 mutableCopy];
    -[TPPBPolicyDocument setCategoriesByViews:](v15, "setCategoriesByViews:", v29);

    id v12 = v46;
    id v11 = v47;
    self = v45;
  }

  if (v11)
  {
    v30 = -[TPPBPolicyDocument keyViewMappings](v15, "keyViewMappings");
    [v11 arrayByAddingObjectsFromArray:v30];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)[v31 mutableCopy];
    -[TPPBPolicyDocument setKeyViewMappings:](v15, "setKeyViewMappings:", v32);
  }

  if (v12)
  {
    v33 = -[TPPBPolicyDocument redactions](v15, "redactions");
    [v12 arrayByAddingObjectsFromArray:v33];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)[v34 mutableCopy];
    -[TPPBPolicyDocument setRedactions:](v15, "setRedactions:", v35);
  }

  -[TPPolicyDocument version](self, "version");
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 policyHash];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v38 = +[TPHashBuilder algoOfHash:](&OBJC_CLASS___TPHashBuilder, "algoOfHash:", v37);
  -[PBCodable data](v15, "data");
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", v38, v39);
  id v40 = (void *)objc_claimAutoreleasedReturnValue();

  id v41 = objc_alloc(&OBJC_CLASS___TPPolicyDocument);
  -[PBCodable data](v15, "data");
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v43 = -[TPPolicyDocument initWithHash:data:](v41, "initWithHash:data:", v40, v42);

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPPolicyDocument *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }

  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPolicyDocument isEqualToPolicyDocument:](self, "isEqualToPolicyDocument:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 policyHash];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = [v3 hash];

  return v4;
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (NSData)protobuf
{
  return self->_protobuf;
}

- (void).cxx_destruct
{
}

+ (id)modelToCategoryFromPb:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "prefix", (void)v15);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 category];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[TPCategoryRule ruleWithPrefix:category:](&OBJC_CLASS___TPCategoryRule, "ruleWithPrefix:category:", v11, v12);
        [v4 addObject:v13];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)categoriesByViewFromPb:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "view", (void)v20);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 objectForKeyedSubscript:v11];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          [v10 categories];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObjectsFromArray:v14];

          __int128 v15 = (void *)[v13 copy];
          [v10 view];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setObject:v15 forKeyedSubscript:v16];
        }

        else
        {
          __int128 v17 = (void *)MEMORY[0x189604010];
          [v10 categories];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 setWithArray:v15];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 view];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setObject:v16 forKeyedSubscript:v18];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)introducersByCategoryFromPb:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "category", (void)v20);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 objectForKeyedSubscript:v11];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          [v10 introducers];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addObjectsFromArray:v14];

          __int128 v15 = (void *)[v13 copy];
          [v10 category];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setObject:v15 forKeyedSubscript:v16];
        }

        else
        {
          __int128 v17 = (void *)MEMORY[0x189604010];
          [v10 introducers];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 setWithArray:v15];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 category];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 setObject:v16 forKeyedSubscript:v18];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)redactionsFromPb:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
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
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "ciphertext", (void)v14);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 name];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 setObject:v11 forKeyedSubscript:v12];
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (void)addModelToCategory:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  objc_msgSend(MEMORY[0x189607A20], "sortDescriptorWithKey:ascending:", @"prefix", 1, 0);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v22 count:1];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 sortedArrayUsingDescriptors:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        __int128 v15 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyModelToCategory);
        [v14 prefix];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPBPolicyModelToCategory setPrefix:](v15, "setPrefix:", v16);

        [v14 category];
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPBPolicyModelToCategory setCategory:](v15, "setCategory:", v17);

        [v6 addModelToCategory:v15];
        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v11);
  }
}

+ (void)addCategoriesByView:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  [v5 allKeys];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 sortedArrayUsingSelector:sel_compare_];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        __int128 v14 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyCategoriesByView);
        -[TPPBPolicyCategoriesByView setView:](v14, "setView:", v13);
        [v5 objectForKeyedSubscript:v13];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 allObjects];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v17 = (void *)[v16 mutableCopy];
        -[TPPBPolicyCategoriesByView setCategories:](v14, "setCategories:", v17);

        [v6 addCategoriesByView:v14];
        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }
}

+ (void)addIntroducersByCategory:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  [v5 allKeys];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 sortedArrayUsingSelector:sel_compare_];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        __int128 v14 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyIntroducersByCategory);
        -[TPPBPolicyIntroducersByCategory setCategory:](v14, "setCategory:", v13);
        [v5 objectForKeyedSubscript:v13];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 allObjects];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v17 = (void *)[v16 mutableCopy];
        -[TPPBPolicyIntroducersByCategory setIntroducers:](v14, "setIntroducers:", v17);

        [v6 addIntroducersByCategory:v14];
        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }
}

+ (void)addKeyViewMapping:(id)a3 toPB:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          [v6 addKeyViewMapping:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }

        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }
  }
}

+ (id)policyDocWithHash:(id)a3 data:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = -[TPPolicyDocument initWithHash:data:](objc_alloc(&OBJC_CLASS___TPPolicyDocument), "initWithHash:data:", v6, v5);

  return v7;
}

+ (id)redactionWithEncrypter:(id)a3 redactionName:(id)a4 encryptionKey:(id)a5 modelToCategory:(id)a6 categoriesByView:(id)a7 introducersByCategory:(id)a8 keyViewMapping:(id)a9 error:(id *)a10
{
  id v27 = a4;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  __int128 v21 = (void *)objc_opt_new();
  +[TPPolicyDocument addModelToCategory:toPB:](&OBJC_CLASS___TPPolicyDocument, "addModelToCategory:toPB:", v18, v21);

  +[TPPolicyDocument addCategoriesByView:toPB:](&OBJC_CLASS___TPPolicyDocument, "addCategoriesByView:toPB:", v17, v21);
  +[TPPolicyDocument addIntroducersByCategory:toPB:]( &OBJC_CLASS___TPPolicyDocument,  "addIntroducersByCategory:toPB:",  v16,  v21);

  +[TPPolicyDocument addKeyViewMapping:toPB:](&OBJC_CLASS___TPPolicyDocument, "addKeyViewMapping:toPB:", v15, v21);
  [v21 data];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 encryptData:v22 withKey:v19 error:a10];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___TPPBPolicyRedaction);
    uint64_t v25 = v27;
    -[TPPBPolicyRedaction setName:](v24, "setName:", v27);
    -[TPPBPolicyRedaction setCiphertext:](v24, "setCiphertext:", v23);
  }

  else
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = v27;
  }

  return v24;
}

+ (BOOL)isEqualKeyViewMapping:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] || objc_msgSend(v6, "count")) {
    char v7 = [v5 isEqual:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

@end