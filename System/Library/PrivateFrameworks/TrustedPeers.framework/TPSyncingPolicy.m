@interface TPSyncingPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isInheritedAccount;
- (BOOL)isSyncingEnabledForView:(id)a3;
- (BOOL)syncUserControllableViewsAsBoolean;
- (NSArray)keyViewMapping;
- (NSSet)priorityViews;
- (NSSet)userControllableViews;
- (NSSet)viewList;
- (NSSet)viewsToPiggybackTLKs;
- (NSString)model;
- (TPPolicyVersion)version;
- (TPSyncingPolicy)initWithCoder:(id)a3;
- (TPSyncingPolicy)initWithModel:(id)a3 version:(id)a4 viewList:(id)a5 priorityViews:(id)a6 userControllableViews:(id)a7 syncUserControllableViews:(int)a8 viewsToPiggybackTLKs:(id)a9 keyViewMapping:(id)a10 isInheritedAccount:(BOOL)a11;
- (id)description;
- (id)mapDictionaryToView:(id)a3;
- (int)syncUserControllableViews;
- (void)encodeWithCoder:(id)a3;
- (void)setIsInheritedAccount:(BOOL)a3;
@end

@implementation TPSyncingPolicy

- (TPSyncingPolicy)initWithModel:(id)a3 version:(id)a4 viewList:(id)a5 priorityViews:(id)a6 userControllableViews:(id)a7 syncUserControllableViews:(int)a8 viewsToPiggybackTLKs:(id)a9 keyViewMapping:(id)a10 isInheritedAccount:(BOOL)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a9;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TPSyncingPolicy;
  v19 = -[TPSyncingPolicy init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_model, a3);
    objc_storeStrong((id *)&v20->_version, a4);
    objc_storeStrong((id *)&v20->_viewList, a5);
    objc_storeStrong((id *)&v20->_priorityViews, a6);
    objc_storeStrong((id *)&v20->_userControllableViews, a7);
    v20->_syncUserControllableViews = a8;
    objc_storeStrong((id *)&v20->_viewsToPiggybackTLKs, a9);
    objc_storeStrong((id *)&v20->_keyViewMapping, a10);
    v20->_isInheritedAccount = a11;
  }

  return v20;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[TPSyncingPolicy version](self, "version");
  v5 = -[TPSyncingPolicy model](self, "model");
  uint64_t v6 = -[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews");
  if (v6 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v7 = off_18A22C088[v6];
  }

  [v3 stringWithFormat:@"<TPSyncingPolicy: %@, %@, userViews: %@>", v4, v5, v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mapDictionaryToView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[TPSyncingPolicy keyViewMapping](self, "keyViewMapping");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v20;
    *(void *)&__int128 v7 = 138543618LL;
    __int128 v17 = v7;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        objc_msgSend(v10, "view", v17);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          [v10 matchingRule];
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            [v10 matchingRule];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            id v18 = 0LL;
            char v14 = [v13 matches:v4 error:&v18];
            id v11 = v18;

            if (v11)
            {
              TPClassificationLog();
              v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                id v24 = v10;
                __int16 v25 = 2114;
                id v26 = v11;
                _os_log_impl( &dword_188398000,  v15,  OS_LOG_TYPE_DEFAULT,  "Error matching with rule %{public}@: %{public}@",  buf,  0x16u);
              }
            }

            if ((v14 & 1) != 0)
            {
              [v10 view];
              uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }
          }

          else
          {
            id v11 = 0LL;
          }
        }
      }

      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v6);
  }

- (BOOL)syncUserControllableViewsAsBoolean
{
  return (-[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews") & 0xFFFFFFFE) == 2;
}

- (BOOL)isSyncingEnabledForView:(id)a3
{
  id v4 = a3;
  -[TPSyncingPolicy viewList](self, "viewList");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    if (-[TPSyncingPolicy syncUserControllableViewsAsBoolean](self, "syncUserControllableViewsAsBoolean"))
    {
      LOBYTE(v7) = 1;
    }

    else
    {
      -[TPSyncingPolicy userControllableViews](self, "userControllableViews");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = [v8 containsObject:v4] ^ 1;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  -[TPSyncingPolicy version](self, "version");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v4 forKey:@"version"];

  -[TPSyncingPolicy model](self, "model");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v5 forKey:@"model"];

  -[TPSyncingPolicy keyViewMapping](self, "keyViewMapping");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v6 forKey:@"keyViewMapping"];

  -[TPSyncingPolicy viewList](self, "viewList");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v7 forKey:@"viewList"];

  -[TPSyncingPolicy priorityViews](self, "priorityViews");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 encodeObject:v8 forKey:@"priorityViews"];
  v9 = -[TPSyncingPolicy userControllableViews](self, "userControllableViews");
  [v13 encodeObject:v9 forKey:@"userControllableViews"];

  uint64_t v10 = -[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews");
  if (v10 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = off_18A22C088[v10];
  }

  [v13 encodeObject:v11 forKey:@"ucvShouldSync"];
  v12 = -[TPSyncingPolicy viewsToPiggybackTLKs](self, "viewsToPiggybackTLKs");
  [v13 encodeObject:v12 forKey:@"viewsToPiggybackTLKs"];

  objc_msgSend( v13,  "encodeBool:forKey:",  -[TPSyncingPolicy isInheritedAccount](self, "isInheritedAccount"),  @"isInheritedAccount");
}

- (TPSyncingPolicy)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TPSyncingPolicy;
  id v5 = -[TPSyncingPolicy init](&v29, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x189604010];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v31 count:2];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setWithArray:v11];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"keyViewMapping"];
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v13;

    v15 = (void *)MEMORY[0x189604010];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v30 count:2];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setWithArray:v16];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"viewList"];
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v17 forKey:@"priorityViews"];
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v17 forKey:@"userControllableViews"];
    userControllableViews = v5->_userControllableViews;
    v5->_userControllableViews = (NSSet *)v22;

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ucvShouldSync"];
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if ([v24 isEqualToString:@"UNKNOWN"])
    {
      int v25 = 0;
    }

    else if ([v24 isEqualToString:@"DISABLED"])
    {
      int v25 = 1;
    }

    else if ([v24 isEqualToString:@"ENABLED"])
    {
      int v25 = 2;
    }

    else if ([v24 isEqualToString:@"FOLLOWING"])
    {
      int v25 = 3;
    }

    else
    {
      int v25 = 0;
    }

    v5->_syncUserControllableViews = v25;
    uint64_t v26 = [v4 decodeObjectOfClasses:v17 forKey:@"viewsToPiggybackTLKs"];
    viewsToPiggybackTLKs = v5->_viewsToPiggybackTLKs;
    v5->_viewsToPiggybackTLKs = (NSSet *)v26;

    v5->_isInheritedAccount = [v4 decodeBoolForKey:@"isInheritedAccount"];
  }

  return v5;
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (TPPolicyVersion)version
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSArray)keyViewMapping
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSSet)priorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSSet)viewsToPiggybackTLKs
{
  return (NSSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSSet)userControllableViews
{
  return (NSSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  self->_isInheritedAccount = a3;
}

- (int)syncUserControllableViews
{
  return self->_syncUserControllableViews;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end