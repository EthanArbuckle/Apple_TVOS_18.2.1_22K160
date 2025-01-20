@interface MANAutoAssetSetInfoFound
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetSetInfoFound)initWithCoder:(id)a3;
- (MANAutoAssetSetStatus)currentSetStatus;
- (NSString)assetSetIdentifier;
- (id)description;
- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MANAutoAssetSetInfoFound

- (id)initForAssetSetIdentifier:(id)a3 reportingStatus:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoFound;
  v9 = -[MANAutoAssetSetInfoFound init](&v12, "init");
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetSetIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (MANAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void).cxx_destruct
{
}

- (MANAutoAssetSetInfoFound)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoFound;
  v5 = -[MANAutoAssetSetInfoFound init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetStatus) forKey:@"currentSetStatus"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    currentSetStatus = v5->_currentSetStatus;
    v5->_currentSetStatus = (MANAutoAssetSetStatus *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v5 forKey:@"assetSetIdentifier"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus"));
  [v4 encodeObject:v6 forKey:@"currentSetStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound summary](self, "summary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v3, v5));

  return v6;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound assetSetIdentifier](self, "assetSetIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoFound currentSetStatus](self, "currentSetStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"assetSetIdentifier:%@|currentSetStatus:%@",  v3,  v5));

  return v6;
}

@end