@interface MANAutoAssetSetLock
+ (BOOL)supportsSecureCoding;
- (BOOL)inhibitedFromEmergencyRemoval;
- (MAAutoAssetSelector)fullAssetSelector;
- (MANAutoAssetSetLock)initWithCoder:(id)a3;
- (NSDictionary)assetAttributes;
- (NSMutableDictionary)lockReasons;
- (NSURL)localContentURL;
- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3;
- (void)setLockReasons:(id)a3;
@end

@implementation MANAutoAssetSetLock

- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetLock;
  v12 = -[MANAutoAssetSetLock init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v13->_localContentURL, a4);
    objc_storeStrong((id *)&v13->_assetAttributes, a5);
    v13->_inhibitedFromEmergencyRemoval = 0;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lockReasons = v13->_lockReasons;
    v13->_lockReasons = v14;
  }

  return v13;
}

- (MANAutoAssetSetLock)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetLock;
  v5 = -[MANAutoAssetSetLock init](&v17, "init");
  if (v5)
  {
    v18[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v18[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v18[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v18[3] = objc_opt_class(&OBJC_CLASS___NSDate);
    v18[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v18[5] = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
    v18[6] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetLockTracker);
    v18[7] = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 8LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"fullAssetSelector"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"localContentURL"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v12;

    v5->_inhibitedFromEmergencyRemoval = [v4 decodeBoolForKey:@"inhibitedFromEmergencyRemoval"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"lockReasons"]);
    lockReasons = v5->_lockReasons;
    v5->_lockReasons = (NSMutableDictionary *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock fullAssetSelector](self, "fullAssetSelector"));
  [v4 encodeObject:v5 forKey:@"fullAssetSelector"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock localContentURL](self, "localContentURL"));
  [v4 encodeObject:v6 forKey:@"localContentURL"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetLock inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"),  @"inhibitedFromEmergencyRemoval");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock lockReasons](self, "lockReasons"));
  [v4 encodeObject:v7 forKey:@"lockReasons"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock fullAssetSelector](self, "fullAssetSelector"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock localContentURL](self, "localContentURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock assetAttributes](self, "assetAttributes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 safeSummary]);
  if (-[MANAutoAssetSetLock inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval")) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetLock lockReasons](self, "lockReasons"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeSummary]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"selector:%@|localURL:%@|attributes:%@|inhibitedRemoval:%@|reasons:%@",  v4,  v6,  v8,  v9,  v11));

  return v12;
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

- (BOOL)inhibitedFromEmergencyRemoval
{
  return self->_inhibitedFromEmergencyRemoval;
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

- (NSMutableDictionary)lockReasons
{
  return self->_lockReasons;
}

- (void)setLockReasons:(id)a3
{
}

- (void).cxx_destruct
{
}

@end