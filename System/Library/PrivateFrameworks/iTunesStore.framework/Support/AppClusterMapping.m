@interface AppClusterMapping
- (AppClusterMapping)initWithItemID:(id)a3 bundleID:(id)a4 clusterVersionID:(id)a5 dictionary:(id)a6;
- (NSNumber)clusterID;
- (NSNumber)clusterVersionID;
- (NSNumber)foregroundUsageWeight;
- (NSNumber)itemID;
- (NSNumber)launchWeight;
- (NSString)bundleID;
- (id)description;
- (void)_updateWithDictionary:(id)a3;
@end

@implementation AppClusterMapping

- (AppClusterMapping)initWithItemID:(id)a3 bundleID:(id)a4 clusterVersionID:(id)a5 dictionary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___AppClusterMapping;
  v14 = -[AppClusterMapping init](&v22, "init");
  if (v14)
  {
    v15 = (NSString *)[v11 copy];
    bundleID = v14->_bundleID;
    v14->_bundleID = v15;

    v17 = (NSNumber *)[v12 copy];
    clusterVersionID = v14->_clusterVersionID;
    v14->_clusterVersionID = v17;

    v19 = (NSNumber *)[v10 copy];
    itemID = v14->_itemID;
    v14->_itemID = v19;

    -[AppClusterMapping _updateWithDictionary:](v14, "_updateWithDictionary:", v13);
  }

  return v14;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppClusterMapping itemID](self, "itemID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppClusterMapping clusterID](self, "clusterID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppClusterMapping clusterVersionID](self, "clusterVersionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppClusterMapping foregroundUsageWeight](self, "foregroundUsageWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppClusterMapping launchWeight](self, "launchWeight"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ itemID: %@ clusterID: %@  clusterVersion: %@ forgroundUsageWeight: %@ launchWeight: %@ }",  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (void)_updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"clusterId"]);
  clusterID = self->_clusterID;
  self->_clusterID = v5;

  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"usageDurationWeight"]);
  foregroundUsageWeight = self->_foregroundUsageWeight;
  self->_foregroundUsageWeight = v7;

  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"launchCountWeight"]);
  launchWeight = self->_launchWeight;
  self->_launchWeight = v9;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSNumber)clusterID
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSNumber)clusterVersionID
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSNumber)foregroundUsageWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSNumber)launchWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void).cxx_destruct
{
}

@end