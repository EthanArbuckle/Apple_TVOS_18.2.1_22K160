@interface MANAutoAssetSetAtomicEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)inhibitedFromEmergencyRemoval;
- (MAAutoAssetSelector)fullAssetSelector;
- (MANAutoAssetSetAtomicEntry)initWithCoder:(id)a3;
- (MANAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7;
- (NSDictionary)assetAttributes;
- (NSString)assetID;
- (NSURL)localContentURL;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetAttributes:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setFullAssetSelector:(id)a3;
- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3;
- (void)setLocalContentURL:(id)a3;
@end

@implementation MANAutoAssetSetAtomicEntry

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

- (MANAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetAtomicEntry;
  v17 = -[MANAutoAssetSetAtomicEntry init](&v20, "init");
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

- (void).cxx_destruct
{
}

- (MANAutoAssetSetAtomicEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetAtomicEntry;
  v5 = -[MANAutoAssetSetAtomicEntry init](&v20, "init");
  if (v5)
  {
    v21[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v21[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v21[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v21[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v21[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v21[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v21[6] = objc_opt_class(&OBJC_CLASS___NSData);
    v21[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 8LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"fullAssetSelector"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetID"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"localContentURL"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"assetAttributes"]);
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v17;

    v5->_inhibitedFromEmergencyRemoval = [v4 decodeBoolForKey:@"inhibitedFromEmergencyRemoval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector"));
  [v8 encodeObject:v4 forKey:@"fullAssetSelector"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetID](self, "assetID"));
  [v8 encodeObject:v5 forKey:@"assetID"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry localContentURL](self, "localContentURL"));
  [v8 encodeObject:v6 forKey:@"localContentURL"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes"));
  [v8 encodeObject:v7 forKey:@"assetAttributes"];

  objc_msgSend( v8,  "encodeBool:forKey:",  -[MANAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"),  @"inhibitedFromEmergencyRemoval");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetID](self, "assetID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry localContentURL](self, "localContentURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes"));
  id v8 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v3,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v4,  v5,  v6,  v7,  -[MANAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"));

  return v8;
}

- (id)summary
{
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector"));
  if (v14)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry fullAssetSelector](self, "fullAssetSelector"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 summary]);
  }

  else
  {
    v3 = @"N";
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetID](self, "assetID"));
  if (v4) {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetID](self, "assetID"));
  }
  else {
    v5 = @"N";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry localContentURL](self, "localContentURL"));
  if (v6) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry assetAttributes](self, "assetAttributes"));
  if (v8) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  if (-[MANAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval")) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fullAssetSelector:%@|assetID:%@|localContentURL:%@|assetAttributes:%@|inhibitedFromEmergencyRemoval:%@",  v3,  v5,  v7,  v9,  v10));

  if (v4) {
  if (v14)
  }
  {
  }

  return v11;
}

- (void)setFullAssetSelector:(id)a3
{
}

- (void)setAssetID:(id)a3
{
}

- (void)setLocalContentURL:(id)a3
{
}

- (void)setAssetAttributes:(id)a3
{
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

@end