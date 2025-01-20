@interface TPPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithModelToCategory:(id)a3 categoriesByView:(id)a4 introducersByCategory:(id)a5 keyViewMapping:(id)a6 unknownRedactions:(BOOL)a7 userControllableViewList:(id)a8 piggybackViews:(id)a9 priorityViews:(id)a10 inheritedExcludedViews:(id)a11 version:(id)a12;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolicy:(id)a3;
- (BOOL)peerInCategory:(id)a3 canAccessView:(id)a4;
- (BOOL)trustedPeerInCategory:(id)a3 canIntroduceCategory:(id)a4;
- (BOOL)unknownRedactions;
- (NSArray)keyViewMapping;
- (NSArray)modelToCategory;
- (NSDictionary)categoriesByView;
- (NSDictionary)introducersByCategory;
- (NSSet)inheritedExcludedViews;
- (NSSet)piggybackViews;
- (NSSet)priorityViews;
- (NSSet)userControllableViewList;
- (TPPolicy)initWithCoder:(id)a3;
- (TPPolicyVersion)version;
- (id)categoryForModel:(id)a3;
- (id)description;
- (id)syncingPolicyForModel:(id)a3 syncUserControllableViews:(int)a4 isInheritedAccount:(BOOL)a5 error:(id *)a6;
- (id)viewsForModel:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoriesByView:(id)a3;
- (void)setInheritedExcludedViews:(id)a3;
- (void)setIntroducersByCategory:(id)a3;
- (void)setKeyViewMapping:(id)a3;
- (void)setModelToCategory:(id)a3;
- (void)setPiggybackViews:(id)a3;
- (void)setPriorityViews:(id)a3;
- (void)setUnknownRedactions:(BOOL)a3;
- (void)setUserControllableViewList:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TPPolicy

- (id)description
{
  v2 = (void *)NSString;
  v3 = -[TPPolicy version](self, "version");
  [v2 stringWithFormat:@"<TPPolicy: %@>", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)categoryForModel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (AllowiProdOverrideSet == 1)
  {
    if (!AllowiProdOverrideValue) {
      goto LABEL_7;
    }
  }

  else if (!_os_feature_enabled_impl())
  {
    goto LABEL_7;
  }

  if ([v4 hasPrefix:@"iProd"])
  {
    v5 = @"full";
    goto LABEL_18;
  }

- (BOOL)trustedPeerInCategory:(id)a3 canIntroduceCategory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[TPPolicy introducersByCategory](self, "introducersByCategory");
  [v8 objectForKeyedSubscript:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = [v9 containsObject:v7];
  return (char)v6;
}

- (BOOL)peerInCategory:(id)a3 canAccessView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[TPPolicy categoriesByView](self, "categoriesByView");
  [v8 objectForKeyedSubscript:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = [v9 containsObject:v7];
  return (char)v6;
}

- (id)syncingPolicyForModel:(id)a3 syncUserControllableViews:(int)a4 isInheritedAccount:(BOOL)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  -[TPPolicy viewsForModel:error:](self, "viewsForModel:error:", v10, a6);
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v24 = 0LL;
    goto LABEL_16;
  }
  v12 = -[TPPolicy userControllableViewList](self, "userControllableViewList");
  -[TPPolicy piggybackViews](self, "piggybackViews");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicy version](self, "version");
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v14 versionNumber] <= 7)
  {
    uint64_t v15 = [v12 count];

    if (v15) {
      goto LABEL_6;
    }
    [MEMORY[0x189604010] setWithArray:&unk_18A234560];
    __int128 v14 = v12;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  -[TPPolicy version](self, "version");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v16 versionNumber] <= 7)
  {
    uint64_t v17 = [v13 count];

    if (v17) {
      goto LABEL_10;
    }
    [MEMORY[0x189604010] setWithArray:&unk_18A234578];
    __int128 v16 = v13;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  -[TPPolicy priorityViews](self, "priorityViews");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TPPolicy version](self, "version");
  if ((unint64_t)[v19 versionNumber] > 8)
  {
LABEL_13:

    goto LABEL_14;
  }

  uint64_t v20 = [v18 count];

  if (!v20)
  {
    [MEMORY[0x189604010] setWithArray:&unk_18A234590];
    v19 = v18;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

- (id)viewsForModel:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[TPPolicy categoryForModel:](self, "categoryForModel:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [MEMORY[0x189603FE0] set];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    -[TPPolicy categoriesByView](self, "categoriesByView");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v20 = v6;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          -[TPPolicy categoriesByView](self, "categoriesByView", v20);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:v13];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          int v16 = [v15 containsObject:v7];

          if (v16) {
            [v21 addObject:v13];
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v10);
      id v6 = v20;
    }
  }

  else
  {
    if (!a4)
    {
      id v21 = 0LL;
      goto LABEL_15;
    }

    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = TPErrorDomain;
    v27 = @"model";
    v28[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:v18 code:9 userInfo:v8];
    id v21 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[TPPolicy modelToCategory](self, "modelToCategory");
  [v4 encodeObject:v5 forKey:@"modelToCategory"];

  -[TPPolicy categoriesByView](self, "categoriesByView");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"categoriesByView"];

  -[TPPolicy introducersByCategory](self, "introducersByCategory");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"introducersByCategory"];

  -[TPPolicy keyViewMapping](self, "keyViewMapping");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"keyViewMapping"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[TPPolicy unknownRedactions](self, "unknownRedactions"),  @"unknownRedactions");
  -[TPPolicy userControllableViewList](self, "userControllableViewList");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"ucvList"];

  -[TPPolicy piggybackViews](self, "piggybackViews");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"piggybackingList"];

  -[TPPolicy priorityViews](self, "priorityViews");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"priorityViews"];
  v12 = -[TPPolicy inheritedExcludedViews](self, "inheritedExcludedViews");
  [v4 encodeObject:v12 forKey:@"inheritedExcludedViews"];

  -[TPPolicy version](self, "version");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v13 forKey:@"version"];
}

- (TPPolicy)initWithCoder:(id)a3
{
  v53[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TPPolicy;
  v5 = -[TPPolicy init](&v46, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    uint64_t v8 = (void *)MEMORY[0x189604010];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v53[2] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v53 count:3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWithArray:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = (void *)MEMORY[0x189604010];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v52 count:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setWithArray:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"modelToCategory"];
    modelToCategory = v5->_modelToCategory;
    v5->_modelToCategory = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClasses:v10 forKey:@"categoriesByView"];
    categoriesByView = v5->_categoriesByView;
    v5->_categoriesByView = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v10 forKey:@"introducersByCategory"];
    introducersByCategory = v5->_introducersByCategory;
    v5->_introducersByCategory = (NSDictionary *)v18;

    v5->_unknownRedactions = [v4 decodeBoolForKey:@"unknownRedactions"];
    id v20 = (void *)MEMORY[0x189604010];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v51 count:2];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 setWithArray:v21];
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"ucvList"];
    userControllableViewList = v5->_userControllableViewList;
    v5->_userControllableViewList = (NSSet *)v23;

    __int128 v25 = (void *)MEMORY[0x189604010];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v50 count:2];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setWithArray:v26];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"piggybackingList"];
    piggybackViews = v5->_piggybackViews;
    v5->_piggybackViews = (NSSet *)v28;

    v30 = (void *)MEMORY[0x189604010];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v49 count:2];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 setWithArray:v31];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"priorityViews"];
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v33;

    v35 = (void *)MEMORY[0x189604010];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v48 count:2];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 setWithArray:v36];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"inheritedExcludedViews"];
    inheritedExcludedViews = v5->_inheritedExcludedViews;
    v5->_inheritedExcludedViews = (NSSet *)v38;

    v40 = (void *)MEMORY[0x189604010];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v47 count:2];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 setWithArray:v41];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"keyViewMapping"];
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v43;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TPPolicy *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v6 = -[TPPolicy isEqualToPolicy:](self, "isEqualToPolicy:", v5);
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPolicy:(id)a3
{
  id v4 = a3;
  v5 = -[TPPolicy version](self, "version");
  uint64_t v6 = [v5 versionNumber];
  [v4 version];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == [v7 versionNumber])
  {
    -[TPPolicy modelToCategory](self, "modelToCategory");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 modelToCategory];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v8 isEqual:v9])
    {
      -[TPPolicy categoriesByView](self, "categoriesByView");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 categoriesByView];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 isEqualToDictionary:v11])
      {
        v12 = -[TPPolicy introducersByCategory](self, "introducersByCategory");
        [v4 introducersByCategory];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v12 isEqualToDictionary:v13])
        {
          v27 = v13;
          uint64_t v28 = v12;
          uint64_t v14 = -[TPPolicy keyViewMapping](self, "keyViewMapping");
          [v4 keyViewMapping];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)v14;
          if (+[TPPolicyDocument isEqualKeyViewMapping:other:]( &OBJC_CLASS___TPPolicyDocument,  "isEqualKeyViewMapping:other:",  v14))
          {
            -[TPPolicy userControllableViewList](self, "userControllableViewList");
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v4 userControllableViewList];
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = v15;
            if ([v15 isEqualToSet:v25])
            {
              -[TPPolicy piggybackViews](self, "piggybackViews");
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 piggybackViews];
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "isEqualToSet:"))
              {
                -[TPPolicy priorityViews](self, "priorityViews");
                uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
                [v4 priorityViews];
                id v21 = (void *)objc_claimAutoreleasedReturnValue();
                __int128 v22 = v16;
                id v13 = v27;
                if (objc_msgSend(v16, "isEqualToSet:"))
                {
                  -[TPPolicy inheritedExcludedViews](self, "inheritedExcludedViews");
                  id v20 = (void *)objc_claimAutoreleasedReturnValue();
                  [v4 inheritedExcludedViews];
                  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                  char v18 = [v20 isEqualToSet:v17];
                }

                else
                {
                  char v18 = 0;
                }

                v12 = v28;
              }

              else
              {
                char v18 = 0;
                id v13 = v27;
                v12 = v28;
              }
            }

            else
            {
              char v18 = 0;
              id v13 = v27;
              v12 = v28;
            }
          }

          else
          {
            char v18 = 0;
            id v13 = v27;
          }
        }

        else
        {
          char v18 = 0;
        }
      }

      else
      {
        char v18 = 0;
      }
    }

    else
    {
      char v18 = 0;
    }
  }

  else
  {
    char v18 = 0;
  }

  return v18;
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSArray)modelToCategory
{
  return self->_modelToCategory;
}

- (void)setModelToCategory:(id)a3
{
}

- (NSDictionary)categoriesByView
{
  return self->_categoriesByView;
}

- (void)setCategoriesByView:(id)a3
{
}

- (NSDictionary)introducersByCategory
{
  return self->_introducersByCategory;
}

- (void)setIntroducersByCategory:(id)a3
{
}

- (NSArray)keyViewMapping
{
  return self->_keyViewMapping;
}

- (void)setKeyViewMapping:(id)a3
{
}

- (NSSet)userControllableViewList
{
  return self->_userControllableViewList;
}

- (void)setUserControllableViewList:(id)a3
{
}

- (NSSet)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setPiggybackViews:(id)a3
{
}

- (NSSet)priorityViews
{
  return self->_priorityViews;
}

- (void)setPriorityViews:(id)a3
{
}

- (NSSet)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setInheritedExcludedViews:(id)a3
{
}

- (BOOL)unknownRedactions
{
  return self->_unknownRedactions;
}

- (void)setUnknownRedactions:(BOOL)a3
{
  self->_unknownRedactions = a3;
}

- (void).cxx_destruct
{
}

+ (id)policyWithModelToCategory:(id)a3 categoriesByView:(id)a4 introducersByCategory:(id)a5 keyViewMapping:(id)a6 unknownRedactions:(BOOL)a7 userControllableViewList:(id)a8 piggybackViews:(id)a9 priorityViews:(id)a10 inheritedExcludedViews:(id)a11 version:(id)a12
{
  BOOL v27 = a7;
  id v28 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  __int128 v25 = objc_alloc_init(&OBJC_CLASS___TPPolicy);
  -[TPPolicy setModelToCategory:](v25, "setModelToCategory:", v24);

  -[TPPolicy setCategoriesByView:](v25, "setCategoriesByView:", v23);
  -[TPPolicy setIntroducersByCategory:](v25, "setIntroducersByCategory:", v22);

  -[TPPolicy setKeyViewMapping:](v25, "setKeyViewMapping:", v21);
  -[TPPolicy setUnknownRedactions:](v25, "setUnknownRedactions:", v27);
  -[TPPolicy setUserControllableViewList:](v25, "setUserControllableViewList:", v20);

  -[TPPolicy setPiggybackViews:](v25, "setPiggybackViews:", v19);
  -[TPPolicy setPriorityViews:](v25, "setPriorityViews:", v18);

  -[TPPolicy setInheritedExcludedViews:](v25, "setInheritedExcludedViews:", v17);
  -[TPPolicy setVersion:](v25, "setVersion:", v28);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end