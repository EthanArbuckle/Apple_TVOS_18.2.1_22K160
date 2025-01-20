@interface MAAutoAssetSetInfoFound
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSetInfoFound)initWithCoder:(id)a3;
- (MAAutoAssetSetStatus)currentSetStatus;
- (NSString)assetSetIdentifier;
- (id)description;
- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoFound

- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoFound;
  v9 = -[MAAutoAssetSetInfoFound init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MAAutoAssetSetInfoFound)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetInfoFound;
  v5 = -[MAAutoAssetSetInfoFound init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSetStatus"];
    currentSetStatus = v5->_currentSetStatus;
    v5->_currentSetStatus = (MAAutoAssetSetStatus *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier");
  [v4 encodeObject:v5 forKey:@"assetSetIdentifier"];

  -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"currentSetStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)NSString;
  -[MAAutoAssetSetInfoFound summary](self, "summary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  [v5 description];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n%@", v4, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)summary
{
  v3 = (void *)NSString;
  -[MAAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus");
  [v5 summary];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"assetSetIdentifier:%@|currentSetStatus:%@", v4, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (MAAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (void).cxx_destruct
{
}

@end