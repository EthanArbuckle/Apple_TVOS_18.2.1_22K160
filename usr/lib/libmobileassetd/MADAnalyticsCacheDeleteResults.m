@interface MADAnalyticsCacheDeleteResults
+ (id)copyWith:(id)a3;
- (MADAnalyticsCacheDeleteResults)init;
- (MADAnalyticsCacheDeleteResults)initWithReclaimV2AssetSpace:(int64_t)a3 reclaimV2AssetCount:(int64_t)a4 reclaimUnlockedUnreferencedAutoAssetSpace:(int64_t)a5 reclaimUnlockedUnreferencedAutoAssetCount:(int64_t)a6 reclaimUnlockedReferencedAutoAssetSpace:(int64_t)a7 reclaimUnlockedReferencedAutoAssetCount:(int64_t)a8 reclaimLockedOverridableAutoAssetSpace:(int64_t)a9 reclaimLockedOverridableAutoAssetCount:(int64_t)a10 reclaimLockedNeverRemoveAutoAssetSpace:(int64_t)a11 reclaimLockedNeverRemoveAutoAssetCount:(int64_t)a12 reclaimStagedAutoAssetSpace:(int64_t)a13 reclaimStagedAutoAssetCount:(int64_t)a14 reclaimMetadataBlockedSpace:(int64_t)a15 reclaimMetadataBlockedCount:(int64_t)a16;
- (id)copy;
- (id)description;
- (id)summary;
- (int64_t)reclaimLockedNeverRemoveAutoAssetCount;
- (int64_t)reclaimLockedNeverRemoveAutoAssetSpace;
- (int64_t)reclaimLockedOverridableAutoAssetCount;
- (int64_t)reclaimLockedOverridableAutoAssetSpace;
- (int64_t)reclaimMetadataBlockedCount;
- (int64_t)reclaimMetadataBlockedSpace;
- (int64_t)reclaimStagedAutoAssetCount;
- (int64_t)reclaimStagedAutoAssetSpace;
- (int64_t)reclaimUnlockedReferencedAutoAssetCount;
- (int64_t)reclaimUnlockedReferencedAutoAssetSpace;
- (int64_t)reclaimUnlockedUnreferencedAutoAssetCount;
- (int64_t)reclaimUnlockedUnreferencedAutoAssetSpace;
- (int64_t)reclaimV2AssetCount;
- (int64_t)reclaimV2AssetSpace;
- (void)setReclaimLockedNeverRemoveAutoAssetCount:(int64_t)a3;
- (void)setReclaimLockedNeverRemoveAutoAssetSpace:(int64_t)a3;
- (void)setReclaimLockedOverridableAutoAssetCount:(int64_t)a3;
- (void)setReclaimLockedOverridableAutoAssetSpace:(int64_t)a3;
- (void)setReclaimMetadataBlockedCount:(int64_t)a3;
- (void)setReclaimMetadataBlockedSpace:(int64_t)a3;
- (void)setReclaimStagedAutoAssetCount:(int64_t)a3;
- (void)setReclaimStagedAutoAssetSpace:(int64_t)a3;
- (void)setReclaimUnlockedReferencedAutoAssetCount:(int64_t)a3;
- (void)setReclaimUnlockedReferencedAutoAssetSpace:(int64_t)a3;
- (void)setReclaimUnlockedUnreferencedAutoAssetCount:(int64_t)a3;
- (void)setReclaimUnlockedUnreferencedAutoAssetSpace:(int64_t)a3;
- (void)setReclaimV2AssetCount:(int64_t)a3;
- (void)setReclaimV2AssetSpace:(int64_t)a3;
@end

@implementation MADAnalyticsCacheDeleteResults

- (MADAnalyticsCacheDeleteResults)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MADAnalyticsCacheDeleteResults;
  result = -[MADAnalyticsCacheDeleteResults init](&v3, "init");
  if (result)
  {
    *(_OWORD *)&result->_reclaimMetadataBlockedSpace = 0u;
    *(_OWORD *)&result->_reclaimStagedAutoAssetSpace = 0u;
    *(_OWORD *)&result->_reclaimLockedNeverRemoveAutoAssetSpace = 0u;
    *(_OWORD *)&result->_reclaimLockedOverridableAutoAssetSpace = 0u;
    *(_OWORD *)&result->_reclaimUnlockedReferencedAutoAssetSpace = 0u;
    *(_OWORD *)&result->_reclaimUnlockedUnreferencedAutoAssetSpace = 0u;
    *(_OWORD *)&result->_reclaimV2AssetSpace = 0u;
  }

  return result;
}

- (MADAnalyticsCacheDeleteResults)initWithReclaimV2AssetSpace:(int64_t)a3 reclaimV2AssetCount:(int64_t)a4 reclaimUnlockedUnreferencedAutoAssetSpace:(int64_t)a5 reclaimUnlockedUnreferencedAutoAssetCount:(int64_t)a6 reclaimUnlockedReferencedAutoAssetSpace:(int64_t)a7 reclaimUnlockedReferencedAutoAssetCount:(int64_t)a8 reclaimLockedOverridableAutoAssetSpace:(int64_t)a9 reclaimLockedOverridableAutoAssetCount:(int64_t)a10 reclaimLockedNeverRemoveAutoAssetSpace:(int64_t)a11 reclaimLockedNeverRemoveAutoAssetCount:(int64_t)a12 reclaimStagedAutoAssetSpace:(int64_t)a13 reclaimStagedAutoAssetCount:(int64_t)a14 reclaimMetadataBlockedSpace:(int64_t)a15 reclaimMetadataBlockedCount:(int64_t)a16
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MADAnalyticsCacheDeleteResults;
  v22 = -[MADAnalyticsCacheDeleteResults init](&v25, "init");
  v23 = v22;
  if (v22)
  {
    -[MADAnalyticsCacheDeleteResults setReclaimV2AssetSpace:](v22, "setReclaimV2AssetSpace:", a3);
    -[MADAnalyticsCacheDeleteResults setReclaimV2AssetCount:](v23, "setReclaimV2AssetCount:", a4);
    -[MADAnalyticsCacheDeleteResults setReclaimUnlockedUnreferencedAutoAssetSpace:]( v23,  "setReclaimUnlockedUnreferencedAutoAssetSpace:",  a5);
    -[MADAnalyticsCacheDeleteResults setReclaimUnlockedUnreferencedAutoAssetCount:]( v23,  "setReclaimUnlockedUnreferencedAutoAssetCount:",  a6);
    -[MADAnalyticsCacheDeleteResults setReclaimUnlockedReferencedAutoAssetSpace:]( v23,  "setReclaimUnlockedReferencedAutoAssetSpace:",  a7);
    -[MADAnalyticsCacheDeleteResults setReclaimUnlockedReferencedAutoAssetCount:]( v23,  "setReclaimUnlockedReferencedAutoAssetCount:",  a8);
    -[MADAnalyticsCacheDeleteResults setReclaimLockedOverridableAutoAssetSpace:]( v23,  "setReclaimLockedOverridableAutoAssetSpace:",  a9);
    -[MADAnalyticsCacheDeleteResults setReclaimLockedOverridableAutoAssetCount:]( v23,  "setReclaimLockedOverridableAutoAssetCount:",  a10);
    -[MADAnalyticsCacheDeleteResults setReclaimLockedNeverRemoveAutoAssetSpace:]( v23,  "setReclaimLockedNeverRemoveAutoAssetSpace:",  a11);
    -[MADAnalyticsCacheDeleteResults setReclaimLockedNeverRemoveAutoAssetCount:]( v23,  "setReclaimLockedNeverRemoveAutoAssetCount:",  a12);
    -[MADAnalyticsCacheDeleteResults setReclaimStagedAutoAssetSpace:](v23, "setReclaimStagedAutoAssetSpace:", a13);
    -[MADAnalyticsCacheDeleteResults setReclaimStagedAutoAssetCount:](v23, "setReclaimStagedAutoAssetCount:", a14);
    -[MADAnalyticsCacheDeleteResults setReclaimMetadataBlockedSpace:](v23, "setReclaimMetadataBlockedSpace:", a15);
    -[MADAnalyticsCacheDeleteResults setReclaimMetadataBlockedCount:](v23, "setReclaimMetadataBlockedCount:", a16);
  }

  return v23;
}

+ (id)copyWith:(id)a3
{
  id v3 = a3;
  v19 = objc_alloc(&OBJC_CLASS___MADAnalyticsCacheDeleteResults);
  id v18 = [v3 reclaimV2AssetSpace];
  id v17 = [v3 reclaimV2AssetCount];
  id v16 = [v3 reclaimUnlockedUnreferencedAutoAssetSpace];
  id v15 = [v3 reclaimUnlockedUnreferencedAutoAssetCount];
  id v14 = [v3 reclaimUnlockedReferencedAutoAssetSpace];
  id v4 = [v3 reclaimUnlockedReferencedAutoAssetCount];
  id v5 = [v3 reclaimLockedOverridableAutoAssetSpace];
  id v6 = [v3 reclaimLockedOverridableAutoAssetCount];
  id v7 = [v3 reclaimLockedNeverRemoveAutoAssetSpace];
  id v8 = [v3 reclaimLockedNeverRemoveAutoAssetCount];
  id v9 = [v3 reclaimStagedAutoAssetSpace];
  id v10 = [v3 reclaimStagedAutoAssetCount];
  id v11 = [v3 reclaimMetadataBlockedSpace];
  id v12 = [v3 reclaimMetadataBlockedCount];

  return -[MADAnalyticsCacheDeleteResults initWithReclaimV2AssetSpace:reclaimV2AssetCount:reclaimUnlockedUnreferencedAutoAssetSpace:reclaimUnlockedUnreferencedAutoAssetCount:reclaimUnlockedReferencedAutoAssetSpace:reclaimUnlockedReferencedAutoAssetCount:reclaimLockedOverridableAutoAssetSpace:reclaimLockedOverridableAutoAssetCount:reclaimLockedNeverRemoveAutoAssetSpace:reclaimLockedNeverRemoveAutoAssetCount:reclaimStagedAutoAssetSpace:reclaimStagedAutoAssetCount:reclaimMetadataBlockedSpace:reclaimMetadataBlockedCount:]( v19,  "initWithReclaimV2AssetSpace:reclaimV2AssetCount:reclaimUnlockedUnreferencedAutoAssetSpace:reclaimUnlockedUnre ferencedAutoAssetCount:reclaimUnlockedReferencedAutoAssetSpace:reclaimUnlockedReferencedAutoAssetCount:reclai mLockedOverridableAutoAssetSpace:reclaimLockedOverridableAutoAssetCount:reclaimLockedNeverRemoveAutoAssetSpac e:reclaimLockedNeverRemoveAutoAssetCount:reclaimStagedAutoAssetSpace:reclaimStagedAutoAssetCount:reclaimMetad ataBlockedSpace:reclaimMetadataBlockedCount:",  v18,  v17,  v16,  v15,  v14,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
}

- (id)copy
{
  return -[MADAnalyticsCacheDeleteResults initWithReclaimV2AssetSpace:reclaimV2AssetCount:reclaimUnlockedUnreferencedAutoAssetSpace:reclaimUnlockedUnreferencedAutoAssetCount:reclaimUnlockedReferencedAutoAssetSpace:reclaimUnlockedReferencedAutoAssetCount:reclaimLockedOverridableAutoAssetSpace:reclaimLockedOverridableAutoAssetCount:reclaimLockedNeverRemoveAutoAssetSpace:reclaimLockedNeverRemoveAutoAssetCount:reclaimStagedAutoAssetSpace:reclaimStagedAutoAssetCount:reclaimMetadataBlockedSpace:reclaimMetadataBlockedCount:]( objc_alloc(&OBJC_CLASS___MADAnalyticsCacheDeleteResults),  "initWithReclaimV2AssetSpace:reclaimV2AssetCount:reclaimUnlockedUnreferencedAutoAssetSpace:reclaimUnlockedUnre ferencedAutoAssetCount:reclaimUnlockedReferencedAutoAssetSpace:reclaimUnlockedReferencedAutoAssetCount:reclai mLockedOverridableAutoAssetSpace:reclaimLockedOverridableAutoAssetCount:reclaimLockedNeverRemoveAutoAssetSpac e:reclaimLockedNeverRemoveAutoAssetCount:reclaimStagedAutoAssetSpace:reclaimStagedAutoAssetCount:reclaimMetad ataBlockedSpace:reclaimMetadataBlockedCount:",  -[MADAnalyticsCacheDeleteResults reclaimV2AssetSpace](self, "reclaimV2AssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimV2AssetCount](self, "reclaimV2AssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetSpace]( self,  "reclaimUnlockedUnreferencedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetCount]( self,  "reclaimUnlockedUnreferencedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetSpace]( self,  "reclaimUnlockedReferencedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetCount]( self,  "reclaimUnlockedReferencedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetSpace]( self,  "reclaimLockedOverridableAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetCount]( self,  "reclaimLockedOverridableAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetSpace]( self,  "reclaimLockedNeverRemoveAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetCount]( self,  "reclaimLockedNeverRemoveAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetSpace](self, "reclaimStagedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetCount](self, "reclaimStagedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedSpace](self, "reclaimMetadataBlockedSpace"),  -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedCount](self, "reclaimMetadataBlockedCount"));
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                      reclaimV2AssetSpace: %lld\n                      reclaimV2AssetCount: %ld\nreclaimUnlockedUnreferencedAutoAssetSpace: %lld\nreclaimUnlockedUnreferencedAutoAssetCount: %ld\n  reclaimUnlockedReferencedAutoAssetSpace: %lld\n  reclaimUnlockedReferencedAutoAssetCount: %ld\n   reclaimLockedOverridableAutoAssetSpace: %lld\n   reclaimLockedOverridableAutoAssetCount: %ld\n   reclaimLockedNeverRemoveAutoAssetSpace: %lld\n   reclaimLockedNeverRemoveAutoAssetCount: %ld\n              reclaimStagedAutoAssetSpace: %lld\n              reclaimStagedAutoAssetCount: %ld\n              reclaimMetadataBlockedSpace: %lld\n              reclaimMetadataBlockedCount: %ld\n<<<]",  -[MADAnalyticsCacheDeleteResults reclaimV2AssetSpace](self, "reclaimV2AssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimV2AssetCount](self, "reclaimV2AssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetSpace]( self,  "reclaimUnlockedUnreferencedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetCount]( self,  "reclaimUnlockedUnreferencedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetSpace]( self,  "reclaimUnlockedReferencedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetCount]( self,  "reclaimUnlockedReferencedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetSpace]( self,  "reclaimLockedOverridableAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetCount]( self,  "reclaimLockedOverridableAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetSpace]( self,  "reclaimLockedNeverRemoveAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetCount]( self,  "reclaimLockedNeverRemoveAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetSpace](self, "reclaimStagedAutoAssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetCount](self, "reclaimStagedAutoAssetCount"),  -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedSpace](self, "reclaimMetadataBlockedSpace"),  -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedCount](self, "reclaimMetadataBlockedCount"));
}

- (id)summary
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"reclaimV2AssetSpace:%lld | reclaimV2AssetCount:%ld | reclaimAutoAssetSpace:%lld | reclaimAutoAssetCount:%ld | reclaimMetadataBlockedSpace:%lld | reclaimMetadataBlockedCount:%ld",  -[MADAnalyticsCacheDeleteResults reclaimV2AssetSpace](self, "reclaimV2AssetSpace"),  -[MADAnalyticsCacheDeleteResults reclaimV2AssetCount](self, "reclaimV2AssetCount"),  (char *)-[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetSpace]( self,  "reclaimUnlockedUnreferencedAutoAssetSpace")
         + -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetSpace]( self,  "reclaimUnlockedReferencedAutoAssetSpace")
         + -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetSpace]( self,  "reclaimLockedNeverRemoveAutoAssetSpace")
         + -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetSpace]( self,  "reclaimLockedOverridableAutoAssetSpace")
         + -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetSpace](self, "reclaimStagedAutoAssetSpace"),
           (char *)-[MADAnalyticsCacheDeleteResults reclaimUnlockedUnreferencedAutoAssetCount]( self,  "reclaimUnlockedUnreferencedAutoAssetCount")
         + -[MADAnalyticsCacheDeleteResults reclaimUnlockedReferencedAutoAssetCount]( self,  "reclaimUnlockedReferencedAutoAssetCount")
         + -[MADAnalyticsCacheDeleteResults reclaimLockedNeverRemoveAutoAssetCount]( self,  "reclaimLockedNeverRemoveAutoAssetCount")
         + -[MADAnalyticsCacheDeleteResults reclaimLockedOverridableAutoAssetCount]( self,  "reclaimLockedOverridableAutoAssetCount")
         + -[MADAnalyticsCacheDeleteResults reclaimStagedAutoAssetCount](self, "reclaimStagedAutoAssetCount"),
           -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedSpace](self, "reclaimMetadataBlockedSpace"),
           -[MADAnalyticsCacheDeleteResults reclaimMetadataBlockedCount](self, "reclaimMetadataBlockedCount"));
}

- (int64_t)reclaimV2AssetSpace
{
  return self->_reclaimV2AssetSpace;
}

- (void)setReclaimV2AssetSpace:(int64_t)a3
{
  self->_reclaimV2AssetSpace = a3;
}

- (int64_t)reclaimV2AssetCount
{
  return self->_reclaimV2AssetCount;
}

- (void)setReclaimV2AssetCount:(int64_t)a3
{
  self->_reclaimV2AssetCount = a3;
}

- (int64_t)reclaimUnlockedUnreferencedAutoAssetSpace
{
  return self->_reclaimUnlockedUnreferencedAutoAssetSpace;
}

- (void)setReclaimUnlockedUnreferencedAutoAssetSpace:(int64_t)a3
{
  self->_reclaimUnlockedUnreferencedAutoAssetSpace = a3;
}

- (int64_t)reclaimUnlockedUnreferencedAutoAssetCount
{
  return self->_reclaimUnlockedUnreferencedAutoAssetCount;
}

- (void)setReclaimUnlockedUnreferencedAutoAssetCount:(int64_t)a3
{
  self->_reclaimUnlockedUnreferencedAutoAssetCount = a3;
}

- (int64_t)reclaimUnlockedReferencedAutoAssetSpace
{
  return self->_reclaimUnlockedReferencedAutoAssetSpace;
}

- (void)setReclaimUnlockedReferencedAutoAssetSpace:(int64_t)a3
{
  self->_reclaimUnlockedReferencedAutoAssetSpace = a3;
}

- (int64_t)reclaimUnlockedReferencedAutoAssetCount
{
  return self->_reclaimUnlockedReferencedAutoAssetCount;
}

- (void)setReclaimUnlockedReferencedAutoAssetCount:(int64_t)a3
{
  self->_reclaimUnlockedReferencedAutoAssetCount = a3;
}

- (int64_t)reclaimLockedOverridableAutoAssetSpace
{
  return self->_reclaimLockedOverridableAutoAssetSpace;
}

- (void)setReclaimLockedOverridableAutoAssetSpace:(int64_t)a3
{
  self->_reclaimLockedOverridableAutoAssetSpace = a3;
}

- (int64_t)reclaimLockedOverridableAutoAssetCount
{
  return self->_reclaimLockedOverridableAutoAssetCount;
}

- (void)setReclaimLockedOverridableAutoAssetCount:(int64_t)a3
{
  self->_reclaimLockedOverridableAutoAssetCount = a3;
}

- (int64_t)reclaimLockedNeverRemoveAutoAssetSpace
{
  return self->_reclaimLockedNeverRemoveAutoAssetSpace;
}

- (void)setReclaimLockedNeverRemoveAutoAssetSpace:(int64_t)a3
{
  self->_reclaimLockedNeverRemoveAutoAssetSpace = a3;
}

- (int64_t)reclaimLockedNeverRemoveAutoAssetCount
{
  return self->_reclaimLockedNeverRemoveAutoAssetCount;
}

- (void)setReclaimLockedNeverRemoveAutoAssetCount:(int64_t)a3
{
  self->_reclaimLockedNeverRemoveAutoAssetCount = a3;
}

- (int64_t)reclaimStagedAutoAssetSpace
{
  return self->_reclaimStagedAutoAssetSpace;
}

- (void)setReclaimStagedAutoAssetSpace:(int64_t)a3
{
  self->_reclaimStagedAutoAssetSpace = a3;
}

- (int64_t)reclaimStagedAutoAssetCount
{
  return self->_reclaimStagedAutoAssetCount;
}

- (void)setReclaimStagedAutoAssetCount:(int64_t)a3
{
  self->_reclaimStagedAutoAssetCount = a3;
}

- (int64_t)reclaimMetadataBlockedSpace
{
  return self->_reclaimMetadataBlockedSpace;
}

- (void)setReclaimMetadataBlockedSpace:(int64_t)a3
{
  self->_reclaimMetadataBlockedSpace = a3;
}

- (int64_t)reclaimMetadataBlockedCount
{
  return self->_reclaimMetadataBlockedCount;
}

- (void)setReclaimMetadataBlockedCount:(int64_t)a3
{
  self->_reclaimMetadataBlockedCount = a3;
}

@end