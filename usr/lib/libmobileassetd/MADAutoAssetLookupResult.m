@interface MADAutoAssetLookupResult
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSelector)assetSelector;
- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forAssetSelector:(id)a4 forAssetAudience:(id)a5;
- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forAssetSelector:(id)a4 forSetConfiguration:(id)a5 forAssetAudience:(id)a6;
- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forSetConfiguration:(id)a4 forAssetAudience:(id)a5;
- (MADAutoAssetLookupResult)initWithCoder:(id)a3;
- (MADAutoSetConfiguration)setConfiguration;
- (NSDate)recordedTimestamp;
- (NSDictionary)autoAssetCatalog;
- (NSString)assetAudience;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADAutoAssetLookupResult

- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forAssetSelector:(id)a4 forAssetAudience:(id)a5
{
  return -[MADAutoAssetLookupResult initWithAssetCatalog:forAssetSelector:forSetConfiguration:forAssetAudience:]( self,  "initWithAssetCatalog:forAssetSelector:forSetConfiguration:forAssetAudience:",  a3,  a4,  0LL,  a5);
}

- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forSetConfiguration:(id)a4 forAssetAudience:(id)a5
{
  return -[MADAutoAssetLookupResult initWithAssetCatalog:forAssetSelector:forSetConfiguration:forAssetAudience:]( self,  "initWithAssetCatalog:forAssetSelector:forSetConfiguration:forAssetAudience:",  a3,  0LL,  a4,  a5);
}

- (MADAutoAssetLookupResult)initWithAssetCatalog:(id)a3 forAssetSelector:(id)a4 forSetConfiguration:(id)a5 forAssetAudience:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADAutoAssetLookupResult;
  v15 = -[MADAutoAssetLookupResult init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetSelector, a4);
    objc_storeStrong((id *)&v16->_setConfiguration, a5);
    objc_storeStrong((id *)&v16->_assetAudience, a6);
    objc_storeStrong((id *)&v16->_autoAssetCatalog, a3);
    v17 = objc_alloc_init(&OBJC_CLASS___NSDate);
    recordedTimestamp = v16->_recordedTimestamp;
    v16->_recordedTimestamp = v17;
  }

  return v16;
}

- (MADAutoAssetLookupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MADAutoAssetLookupResult;
  v5 = -[MADAutoAssetLookupResult init](&v23, "init");
  if (v5)
  {
    v24[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v24[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v24[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v24[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v24[4] = objc_opt_class(&OBJC_CLASS___NSURL);
    v24[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v24[6] = objc_opt_class(&OBJC_CLASS___NSData);
    v24[7] = objc_opt_class(&OBJC_CLASS___NSNull);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 8LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(MAAutoAssetSelector) forKey:@"assetSelector"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(MADAutoSetConfiguration) forKey:@"setConfiguration"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    setConfiguration = v5->_setConfiguration;
    v5->_setConfiguration = (MADAutoSetConfiguration *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetAudience"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    assetAudience = v5->_assetAudience;
    v5->_assetAudience = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"autoAssetCatalog"]);
    autoAssetCatalog = v5->_autoAssetCatalog;
    v5->_autoAssetCatalog = (NSDictionary *)v17;

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"recordedTimestamp"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    recordedTimestamp = v5->_recordedTimestamp;
    v5->_recordedTimestamp = (NSDate *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult assetSelector](self, "assetSelector"));
  [v4 encodeObject:v5 forKey:@"assetSelector"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult setConfiguration](self, "setConfiguration"));
  [v4 encodeObject:v6 forKey:@"setConfiguration"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult assetAudience](self, "assetAudience"));
  [v4 encodeObject:v7 forKey:@"assetAudience"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult autoAssetCatalog](self, "autoAssetCatalog"));
  [v4 encodeObject:v8 forKey:@"autoAssetCatalog"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult recordedTimestamp](self, "recordedTimestamp"));
  [v4 encodeObject:v9 forKey:@"recordedTimestamp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult setConfiguration](self, "setConfiguration"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult recordedTimestamp](self, "recordedTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler stringFromDate:](&OBJC_CLASS___MADAutoAssetScheduler, "stringFromDate:", v4));
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult setConfiguration](self, "setConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult assetAudience](self, "assetAudience"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult autoAssetCatalog](self, "autoAssetCatalog"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 safeSummary]);
    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[recorded:%@|setConfig:%@|audience:%@|catalog:%@]",  v5,  v7,  v8,  v10);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult assetSelector](self, "assetSelector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult assetAudience](self, "assetAudience"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLookupResult autoAssetCatalog](self, "autoAssetCatalog"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 safeSummary]);
    id v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[recorded:%@|selector:%@|audience:%@|catalog:%@]",  v5,  v7,  v8,  v10);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (MADAutoSetConfiguration)setConfiguration
{
  return self->_setConfiguration;
}

- (NSString)assetAudience
{
  return self->_assetAudience;
}

- (NSDictionary)autoAssetCatalog
{
  return self->_autoAssetCatalog;
}

- (NSDate)recordedTimestamp
{
  return self->_recordedTimestamp;
}

- (void).cxx_destruct
{
}

@end