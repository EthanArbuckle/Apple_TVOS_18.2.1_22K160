@interface SUCorePolicyUpdateBrain
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)compatibilityVersion;
- (SUCorePolicyUpdateBrain)initWithCoder:(id)a3;
- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5;
- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6;
- (id)constructSoftwareUpdateMAAssetQuery;
- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5;
- (void)setCompatibilityVersion:(id)a3;
@end

@implementation SUCorePolicyUpdateBrain

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  v6 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( &v10,  sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingPolicies_usingExtensions_,  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    compatibilityVersion = v6->_compatibilityVersion;
    v6->_compatibilityVersion = 0LL;
  }

  return v7;
}

- (SUCorePolicyUpdateBrain)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  v5 = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:]( &v9,  sel_initWithSoftwareUpdateAssetType_documentationAssetType_usingExtensions_,  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = 0LL;
  }

  return v6;
}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicyUpdateBrain constructSoftwareUpdateMAAssetQueryWithPurpose:]( self,  "constructSoftwareUpdateMAAssetQueryWithPurpose:",  0LL);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v4 = (void *)MEMORY[0x1896127A0];
  id v5 = a3;
  [v4 sharedLogger];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] constructSoftwareUpdateMAAssetQuery for policy: %@",  buf,  0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  v8 = -[SUCorePolicy constructSoftwareUpdateMAAssetQueryWithPurpose:]( &v16,  sel_constructSoftwareUpdateMAAssetQueryWithPurpose_,  v5);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 stringValue];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addKeyValuePair:@"_CompatibilityVersion" with:v11];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    v14 = (SUCorePolicyUpdateBrain *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] querying SU metadata: compatibilityVersion=%{public}@",  buf,  0xCu);
  }

  return v8;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v7 = a5;
  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = self;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@",  buf,  0xCu);
  }

  if (a3)
  {
    objc_msgSend(v7, "SUCoreBorder_results");
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 count];
    [MEMORY[0x1896127A0] sharedLogger];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        uint64_t v15 = [v10 count];
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v15;
        _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] %lu SU query results (before filtering)",  buf,  0xCu);
      }

      v45 = a3;
      id v46 = v7;

      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      -[SUCorePolicy policyExtensions](self, "policyExtensions");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v48;
        while (2)
        {
          uint64_t v19 = 0LL;
          v20 = v10;
          do
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v13);
            }
            v21 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
            [v21 filterSoftwareUpdateAssetArray:v20];
            objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x1896127A0] sharedLogger];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 oslog];
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v10 count];
              [v21 extensionName];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v52 = (SUCorePolicyUpdateBrain *)v24;
              __int16 v53 = 2114;
              v54 = v25;
              _os_log_impl( &dword_187A54000,  v23,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] %lu assets left after filtering from SUCorePolicyExtension %{public}@",  buf,  0x16u);
            }

            if (![v10 count])
            {
              [MEMORY[0x1896127A0] sharedLogger];
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              [v43 oslog];
              v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( &dword_187A54000,  v44,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] 0 assets found, stopping filtering early",  buf,  2u);
              }

              id v7 = v46;
              goto LABEL_39;
            }

            ++v19;
            v20 = v10;
          }

          while (v17 != v19);
          uint64_t v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v47,  v55,  16LL);
          if (v17) {
            continue;
          }
          break;
        }
      }

      [MEMORY[0x1896127A0] sharedLogger];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 oslog];
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [v10 count];
        *(_DWORD *)buf = 134217984;
        v52 = (SUCorePolicyUpdateBrain *)v28;
        _os_log_impl( &dword_187A54000,  v27,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] %lu SU query results (before sorting on mastered version)",  buf,  0xCu);
      }

      [v10 sortedArrayUsingComparator:&__block_literal_global_1];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v29 = -[os_log_s lastObject](v13, "lastObject");
      [v29 attributes];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 safeStringForKey:@"_MasteredVersion"];
      v31 = (SUCorePolicyUpdateBrain *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 oslog];
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v31;
        _os_log_impl( &dword_187A54000,  v33,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] found highestMasteredVersion = %{public}@",  buf,  0xCu);
      }

      uint64_t v34 = -[os_log_s count](v13, "count");
      [MEMORY[0x1896127A0] sharedLogger];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 oslog];
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        id v7 = v46;
        if (v37)
        {
          uint64_t v38 = -[os_log_s count](v13, "count");
          *(_DWORD *)buf = 134217984;
          v52 = (SUCorePolicyUpdateBrain *)v38;
          _os_log_impl(&dword_187A54000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] %ld assets found", buf, 0xCu);
        }

        if ((unint64_t)-[os_log_s count](v13, "count") >= 2)
        {
          [MEMORY[0x189612778] sharedDiag];
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"selectSoftwareUpdatePrimaryAsset found %lu assets when 1 was expected",  -[os_log_s count](v13, "count"));
          [v39 trackAnomaly:@"[POLICY_UPDATE_BRAIN] SELECT_UPDATE_ASSET" forReason:v40 withResult:8409 withError:0];

          [MEMORY[0x1896127A0] sharedLogger];
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          [v41 oslog];
          v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v52 = v31;
            _os_log_impl( &dword_187A54000,  v42,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] taking the last asset in the asset array, which is the highest mastered version (%{public}@)",  buf,  0xCu);
          }
        }

        -[os_log_s lastObject](v13, "lastObject");
        id *v45 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v7 = v46;
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_187A54000, v36, OS_LOG_TYPE_DEFAULT, "[POLICY_UPDATE_BRAIN] 0 assets found", buf, 2u);
        }
      }
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[POLICY_UPDATE_BRAIN] 0 SU query results (before filtering)",  buf,  2u);
    }

uint64_t __90__SUCorePolicyUpdateBrain_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a3;
  [a2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeStringForKey:@"_MasteredVersion"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 attributes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 safeStringForKey:@"_MasteredVersion"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v6 compare:v8 options:64];

  return v9;
}

- (SUCorePolicyUpdateBrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  id v5 = -[SUCorePolicy initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_CompatibilityVersion"];
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  id v4 = a3;
  -[SUCorePolicy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion", v6.receiver, v6.super_class);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"_CompatibilityVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUCorePolicyUpdateBrain *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
      if (-[SUCorePolicy isEqual:](&v11, sel_isEqual_, v5))
      {
        objc_super v6 = (void *)MEMORY[0x189612760];
        -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[SUCorePolicyUpdateBrain compatibilityVersion](v5, "compatibilityVersion");
        char v9 = [v6 numberIsEqual:v7 to:v8];
      }

      else
      {
        char v9 = 0;
      }
    }

    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  id v5 = -[SUCorePolicy copyWithZone:](&v9, sel_copyWithZone_);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setCompatibilityVersion:v7];

  return v5;
}

- (id)description
{
  v3 = (void *)NSString;
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  -[SUCorePolicy description](&v8, sel_description);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCorePolicyUpdateBrain(compatibilityVersion:%@|super:%@)", v4, v5];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCorePolicyUpdateBrain;
  v3 = -[SUCorePolicy summary](&v9, sel_summary);
  -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCorePolicyUpdateBrain compatibilityVersion](self, "compatibilityVersion");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v3 stringByAppendingFormat:@"|compatibilityVersion=%@", v5];

    v3 = (void *)v6;
  }

  if (([v3 isEqualToString:&stru_18A0F22B0] & 1) == 0)
  {
    uint64_t v7 = [v3 stringByAppendingString:@"|"];

    v3 = (void *)v7;
  }

  return v3;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end