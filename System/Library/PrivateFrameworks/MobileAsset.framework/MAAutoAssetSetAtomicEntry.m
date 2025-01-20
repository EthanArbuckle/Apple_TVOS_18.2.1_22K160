@interface MAAutoAssetSetAtomicEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)inhibitedFromEmergencyRemoval;
- (MAAutoAssetSelector)fullAssetSelector;
- (MAAutoAssetSetAtomicEntry)initWithCoder:(id)a3;
- (MAAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7;
- (NSDictionary)assetAttributes;
- (NSString)assetID;
- (NSURL)localContentURL;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3;
@end

@implementation MAAutoAssetSetAtomicEntry

- (MAAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetAtomicEntry;
  v17 = -[MAAutoAssetSetAtomicEntry init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v18->_assetID, a4);
    objc_storeStrong((id *)&v18->_localContentURL, a5);
    objc_storeStrong((id *)&v18->_assetAttributes, a6);
    v18->_inhibitedFromEmergencyRemoval = a7;
  }

  return v18;
}

- (MAAutoAssetSetAtomicEntry)initWithCoder:(id)a3
{
  v19[8] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetAtomicEntry;
  v5 = -[MAAutoAssetSetAtomicEntry init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v19 count:8];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAssetSelector"];
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"assetAttributes"];
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v15;

    v5->_inhibitedFromEmergencyRemoval = [v4 decodeBoolForKey:@"inhibitedFromEmergencyRemoval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 encodeObject:v4 forKey:@"fullAssetSelector"];
  v5 = -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  [v8 encodeObject:v5 forKey:@"assetID"];
  v6 = -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  [v8 encodeObject:v6 forKey:@"localContentURL"];
  v7 = -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  [v8 encodeObject:v7 forKey:@"assetAttributes"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"),  @"inhibitedFromEmergencyRemoval");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetAtomicEntry);
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  v6 = -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  v7 = -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  id v8 = -[MAAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v3,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v4,  v5,  v6,  v7,  -[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"));

  return v8;
}

- (id)summary
{
  id v14 = (void *)NSString;
  -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[MAAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 summary];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = @"N";
  }

  -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MAAutoAssetSetAtomicEntry assetID](self, "assetID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5 = @"N";
  }
  v6 = -[MAAutoAssetSetAtomicEntry localContentURL](self, "localContentURL");
  if (v6) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  -[MAAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  if (-[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  [v14 stringWithFormat:@"fullAssetSelector:%@|assetID:%@|localContentURL:%@|assetAttributes:%@|inhibitedFromEmergencyRemoval:%@", v3, v5, v7, v9, v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4) {
  if (v15)
  }
  {
  }

  return v11;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (BOOL)inhibitedFromEmergencyRemoval
{
  return self->_inhibitedFromEmergencyRemoval;
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

- (void).cxx_destruct
{
}

@end