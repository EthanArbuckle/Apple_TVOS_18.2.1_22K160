@interface MAAutoAssetInfoFound
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoFound)initWithCoder:(id)a3;
- (MAAutoAssetSelector)fullAssetSelector;
- (MAAutoAssetStatus)currentStatus;
- (NSDictionary)assetAttributes;
- (NSURL)localContentURL;
- (id)description;
- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5 reportingStatus:(id)a6;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoFound

- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5 reportingStatus:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoFound;
  v15 = -[MAAutoAssetInfoFound init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fullAssetSelector, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MAAutoAssetInfoFound)initWithCoder:(id)a3
{
  v19[13] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MAAutoAssetInfoFound;
  v5 = -[MAAutoAssetInfoFound init](&v18, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAssetSelector"];
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v8;

    id v10 = objc_alloc(MEMORY[0x189604010]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    v19[8] = objc_opt_class();
    v19[9] = objc_opt_class();
    v19[10] = objc_opt_class();
    v19[11] = objc_opt_class();
    v19[12] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v19 count:13];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v10 initWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"assetAttributes"];
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStatus"];
    currentStatus = v5->_currentStatus;
    v5->_currentStatus = (MAAutoAssetStatus *)v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetInfoFound fullAssetSelector](self, "fullAssetSelector");
  [v4 encodeObject:v5 forKey:@"fullAssetSelector"];

  -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"localContentURL"];
  v7 = -[MAAutoAssetInfoFound assetAttributes](self, "assetAttributes");
  [v4 encodeObject:v7 forKey:@"assetAttributes"];

  -[MAAutoAssetInfoFound currentStatus](self, "currentStatus");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"currentStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)NSString;
  -[MAAutoAssetInfoFound summary](self, "summary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetInfoFound assetAttributes](self, "assetAttributes");
  [v3 stringWithFormat:@"%@|attribs:\n%@", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = @"(w/attribs)";
  if (!v4) {
    v5 = &stru_189FFC530;
  }
  uint64_t v6 = v5;

  v7 = (void *)NSString;
  -[MAAutoAssetInfoFound fullAssetSelector](self, "fullAssetSelector");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 summary];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v2 = -[MAAutoAssetInfoFound localContentURL](self, "localContentURL");
    [v2 path];
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = @"none";
  }

  -[MAAutoAssetInfoFound currentStatus](self, "currentStatus");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 summary];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"found(%@)|URL:%@|%@%@", v9, v11, v13, v6];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
  }

  return v14;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (MAAutoAssetStatus)currentStatus
{
  return self->_currentStatus;
}

- (void).cxx_destruct
{
}

@end