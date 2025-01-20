@interface MAAutoAssetInfoStaged
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoStaged)initWithByGroupTotalStagedBytes:(id)a3 withByGroupAssetsSuccessfullyStaged:(id)a4;
- (MAAutoAssetInfoStaged)initWithCoder:(id)a3;
- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4;
- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4 withByGroupTotalStagedBytes:(id)a5 withByGroupAssetsSuccessfullyStaged:(id)a6;
- (NSDictionary)byGroupAssetsSuccessfullyStaged;
- (NSDictionary)byGroupTotalStagedBytes;
- (id)summary;
- (int64_t)totalStagedBytes;
- (unint64_t)assetsSuccessfullyStaged;
- (void)encodeWithCoder:(id)a3;
- (void)fullDescription:(id)a3 usingLogger:(id)a4;
@end

@implementation MAAutoAssetInfoStaged

- (MAAutoAssetInfoStaged)initWithByGroupTotalStagedBytes:(id)a3 withByGroupAssetsSuccessfullyStaged:(id)a4
{
  return -[MAAutoAssetInfoStaged initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:]( self,  "initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:",  0LL,  0LL,  a3,  a4);
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4
{
  return -[MAAutoAssetInfoStaged initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:]( self,  "initWithTotalStagedBytes:withAssetsSuccessfullyStaged:withByGroupTotalStagedBytes:withByGroupAssetsSuccessfullyStaged:",  a3,  a4,  0LL,  0LL);
}

- (MAAutoAssetInfoStaged)initWithTotalStagedBytes:(int64_t)a3 withAssetsSuccessfullyStaged:(unint64_t)a4 withByGroupTotalStagedBytes:(id)a5 withByGroupAssetsSuccessfullyStaged:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoStaged;
  v13 = -[MAAutoAssetInfoStaged init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_totalStagedBytes = a3;
    v13->_assetsSuccessfullyStaged = a4;
    objc_storeStrong((id *)&v13->_byGroupTotalStagedBytes, a5);
    objc_storeStrong((id *)&v14->_byGroupAssetsSuccessfullyStaged, a6);
  }

  return v14;
}

- (MAAutoAssetInfoStaged)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoStaged;
  v5 = -[MAAutoAssetInfoStaged init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v15 count:5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_totalStagedBytes = [v4 decodeIntegerForKey:@"totalStagedBytes"];
    v5->_assetsSuccessfullyStaged = [v4 decodeIntegerForKey:@"assetsSuccessfullyStaged"];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"byGroupTotalStagedBytes"];
    byGroupTotalStagedBytes = v5->_byGroupTotalStagedBytes;
    v5->_byGroupTotalStagedBytes = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"byGroupAssetsSuccessfullyStaged"];
    byGroupAssetsSuccessfullyStaged = v5->_byGroupAssetsSuccessfullyStaged;
    v5->_byGroupAssetsSuccessfullyStaged = (NSDictionary *)v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"),  @"totalStagedBytes");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"),  @"assetsSuccessfullyStaged");
  v5 = -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  [v4 encodeObject:v5 forKey:@"byGroupTotalStagedBytes"];

  -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"byGroupAssetsSuccessfullyStaged"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v3 = -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189607940]);
    id v5 = objc_alloc_init(MEMORY[0x189607940]);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v19)
    {
      char v6 = 1;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 safeObjectForKey:v8 ofClass:objc_opt_class()];
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 safeObjectForKey:v8 ofClass:objc_opt_class()];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v8;
          objc_super v14 = @"REQUIRED";
          if (([MEMORY[0x189612760] stringIsEqual:v13 to:@"STAGE_GROUP_REQUIRED"] & 1) != 0
            || (objc_super v14 = @"OPTIONAL",
                [MEMORY[0x189612760] stringIsEqual:v13 to:@"STAGE_GROUP_OPTIONAL"]))
          {

            v13 = (__CFString *)v14;
          }

          if ((v6 & 1) == 0)
          {
            [v4 appendString:@","];
            [v5 appendString:@","];
          }

          [v4 appendFormat:@"%@:%llu", v13, objc_msgSend(v10, "unsignedLongLongValue")];
          [v5 appendFormat:@"%@:%llu", v13, objc_msgSend(v12, "unsignedLongLongValue")];

          char v6 = 0;
        }

        char v6 = 0;
        uint64_t v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v19);
    }

    [NSString stringWithFormat:@"staged[BY-GROUP]|byGroupAttributes:%@|byGroupExpectedBytes:%@", v4, v5];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"staged|totalStagedBytes:%ld|assetsSuccessfullyStaged:%lu",  -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes"),  -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged"));
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (void)fullDescription:(id)a3 usingLogger:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS"])
  {
    v8 = @"DOWNLOAD-GROUPS-REPLY";
  }

  else if ([MEMORY[0x189612760] stringIsEqual:v6 to:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL"])
  {
    v8 = @"DOWNLOAD-ALL-REPLY";
  }

  else
  {
    v8 = @"STAGED";
  }

  [v7 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543874;
    v24 = v8;
    __int16 v25 = 2048;
    int64_t v26 = -[MAAutoAssetInfoStaged totalStagedBytes](self, "totalStagedBytes");
    __int16 v27 = 2048;
    unint64_t v28 = -[MAAutoAssetInfoStaged assetsSuccessfullyStaged](self, "assetsSuccessfullyStaged");
    _os_log_impl( &dword_18718F000,  v9,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> totalStagedBytes:%llu | assetsSuccessfullyStaged:%llu",  (uint8_t *)&v23,  0x20u);
  }

  uint64_t v10 = -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 count];

    if (v13)
    {
      [v7 oslog];
      objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[MAAutoAssetInfoStaged byGroupTotalStagedBytes](self, "byGroupTotalStagedBytes");
        int v23 = 138543618;
        v24 = v8;
        __int16 v25 = 2114;
        int64_t v26 = (int64_t)v15;
        _os_log_impl( &dword_18718F000,  v14,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupTotalStagedBytes:\n%{public}@",  (uint8_t *)&v23,  0x16u);
      }
    }
  }

  uint64_t v16 = -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
  if (v16)
  {
    v17 = (void *)v16;
    -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 count];

    if (v19)
    {
      [v7 oslog];
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[MAAutoAssetInfoStaged byGroupAssetsSuccessfullyStaged](self, "byGroupAssetsSuccessfullyStaged");
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 safeSummary];
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = 138543618;
        v24 = v8;
        __int16 v25 = 2114;
        int64_t v26 = (int64_t)v22;
        _os_log_impl( &dword_18718F000,  v20,  OS_LOG_TYPE_DEFAULT,  "\n>%{public}@> byGroupAssetsSuccessfullyStaged:\n%{public}@",  (uint8_t *)&v23,  0x16u);
      }
    }
  }
}

- (int64_t)totalStagedBytes
{
  return self->_totalStagedBytes;
}

- (unint64_t)assetsSuccessfullyStaged
{
  return self->_assetsSuccessfullyStaged;
}

- (NSDictionary)byGroupTotalStagedBytes
{
  return self->_byGroupTotalStagedBytes;
}

- (NSDictionary)byGroupAssetsSuccessfullyStaged
{
  return self->_byGroupAssetsSuccessfullyStaged;
}

- (void).cxx_destruct
{
}

@end