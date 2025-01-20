@interface TVPAsset
- (BOOL)isEqual:(id)a3;
- (MSAsset)asset;
- (NSDate)dateContentCreated;
- (NSString)assetID;
- (TVPAsset)initWithCoder:(id)a3;
- (int)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setDateContentCreated:(id)a3;
- (void)setState:(int)a3;
@end

@implementation TVPAsset

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset assetID](self, "assetID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 assetID]);
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset assetID](self, "assetID"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)encodeWithCoder:(id)a3
{
  asset = self->_asset;
  id v6 = a3;
  [v6 encodeObject:asset forKey:@"asset"];
  [v6 encodeObject:self->_assetID forKey:@"assetID"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_state));
  [v6 encodeObject:v5 forKey:@"state"];

  [v6 encodeObject:self->_dateContentCreated forKey:@"dateContentCreated"];
}

- (TVPAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVPAsset;
  uint64_t v5 = -[TVPAsset init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"asset"]);
    asset = v5->_asset;
    v5->_asset = (MSAsset *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"assetID"]);
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"state"]);
    v5->_state = [v10 intValue];

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"dateContentCreated"]);
    dateContentCreated = v5->_dateContentCreated;
    v5->_dateContentCreated = (NSDate *)v11;

    v13 = v5;
  }

  return v5;
}

- (MSAsset)asset
{
  return (MSAsset *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAsset:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSDate)dateContentCreated
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDateContentCreated:(id)a3
{
}

- (void).cxx_destruct
{
}

@end