@interface MADAutoAssetLookupGrant
+ (BOOL)supportsSecureCoding;
- (MADAutoAssetLookupGrant)initWithCoder:(id)a3;
- (NSMutableArray)awaitingExclusiveGrant;
- (NSString)assetType;
- (NSString)holderJobUUID;
- (id)description;
- (id)initForAssetType:(id)a3;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAwaitingExclusiveGrant:(id)a3;
- (void)setHolderJobUUID:(id)a3;
@end

@implementation MADAutoAssetLookupGrant

- (id)initForAssetType:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MADAutoAssetLookupGrant;
  v6 = -[MADAutoAssetLookupGrant init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetType, a3);
    holderJobUUID = v7->_holderJobUUID;
    v7->_holderJobUUID = 0LL;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    awaitingExclusiveGrant = v7->_awaitingExclusiveGrant;
    v7->_awaitingExclusiveGrant = v9;
  }

  return v7;
}

- (MADAutoAssetLookupGrant)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MADAutoAssetLookupGrant;
  id v5 = -[MADAutoAssetLookupGrant init](&v17, "init");
  if (v5)
  {
    v18[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v18[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetType"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"holderJobUUID"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    holderJobUUID = v5->_holderJobUUID;
    v5->_holderJobUUID = (NSString *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"awaitingExclusiveGrant"]);
    awaitingExclusiveGrant = v5->_awaitingExclusiveGrant;
    v5->_awaitingExclusiveGrant = (NSMutableArray *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant assetType](self, "assetType"));
  [v4 encodeObject:v5 forKey:@"assetType"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant holderJobUUID](self, "holderJobUUID"));
  [v4 encodeObject:v6 forKey:@"holderJobUUID"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant awaitingExclusiveGrant](self, "awaitingExclusiveGrant"));
  [v4 encodeObject:v7 forKey:@"awaitingExclusiveGrant"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant awaitingExclusiveGrant](self, "awaitingExclusiveGrant"));
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = &stru_355768;
    uint64_t v6 = *(void *)v16;
    id v7 = &stru_355768;
    do
    {
      id v8 = 0LL;
      uint64_t v9 = (__CFString *)v7;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@%@%@",  v9,  v5,  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8));

        id v8 = (char *)v8 + 1;
        id v5 = @"|";
        uint64_t v9 = (__CFString *)v7;
      }

      while (v4 != v8);
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v5 = @"|";
      v10 = (__CFString *)v7;
    }

    while (v4);
  }

  else
  {
    v10 = &stru_355768;
    id v7 = @"NONE";
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant summary](self, "summary"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@|awaiting:[%@]",  v11,  v7));

  return v12;
}

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant assetType](self, "assetType"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant holderJobUUID](self, "holderJobUUID"));
  if (v4) {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant holderJobUUID](self, "holderJobUUID"));
  }
  else {
    id v5 = @"N";
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupGrant awaitingExclusiveGrant](self, "awaitingExclusiveGrant"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"[assetType:%@|holderJobUUID:%@|awaitingGrant:%ld]",  v3,  v5,  [v6 count]));

  if (v4) {
  return v7;
  }
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)holderJobUUID
{
  return self->_holderJobUUID;
}

- (void)setHolderJobUUID:(id)a3
{
}

- (NSMutableArray)awaitingExclusiveGrant
{
  return self->_awaitingExclusiveGrant;
}

- (void)setAwaitingExclusiveGrant:(id)a3
{
}

- (void).cxx_destruct
{
}

@end