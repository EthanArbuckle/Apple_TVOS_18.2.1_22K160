@interface MANAutoAssetSetOverview
+ (BOOL)supportsSecureCoding;
- (MANAutoAssetSetOverview)initWithCoder:(id)a3;
- (MANAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12;
- (NSArray)configuredAssetEntries;
- (NSMutableArray)downloadedAtomicInstances;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (NSString)discoveredAtomicInstance;
- (NSString)latestDownloadedAtomicInstance;
- (id)description;
- (id)summary;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)maximumClientCount;
- (int64_t)totalClientCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setConfiguredAssetEntries:(id)a3;
- (void)setDiscoveredAtomicInstance:(id)a3;
- (void)setDownloadedAtomicInstances:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setTotalClientCount:(int64_t)a3;
@end

@implementation MANAutoAssetSetOverview

- (MANAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12
{
  id v19 = a3;
  id v20 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetOverview;
  v22 = -[MANAutoAssetSetOverview init](&v28, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_clientDomainName, a3);
    objc_storeStrong((id *)&v23->_assetSetIdentifier, a4);
    objc_storeStrong((id *)&v23->_configuredAssetEntries, a5);
    objc_storeStrong((id *)&v23->_latestDownloadedAtomicInstance, a6);
    objc_storeStrong((id *)&v23->_downloadedAtomicInstances, a7);
    objc_storeStrong((id *)&v23->_discoveredAtomicInstance, a8);
    v23->_activeClientCount = a9;
    v23->_activeMonitorCount = a10;
    v23->_maximumClientCount = a11;
    v23->_totalClientCount = a12;
  }

  return v23;
}

- (MANAutoAssetSetOverview)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetOverview;
  v5 = -[MANAutoAssetSetOverview init](&v28, "init");
  if (v5)
  {
    v30[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v30[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v12;

    v14 = objc_alloc(&OBJC_CLASS___NSSet);
    v29[0] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v29[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v29[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 3LL));
    v16 = -[NSSet initWithArray:](v14, "initWithArray:", v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v16 forKey:@"configuredAssetEntries"]);
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v17;

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"latestDownloadedAtomicInstance"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"downloadedAtomicInstances"]);
    downloadedAtomicInstances = v5->_downloadedAtomicInstances;
    v5->_downloadedAtomicInstances = (NSMutableArray *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"discoveredAtomicInstance"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    discoveredAtomicInstance = v5->_discoveredAtomicInstance;
    v5->_discoveredAtomicInstance = (NSString *)v25;

    v5->_activeClientCount = (int64_t)[v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = (int64_t)[v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = (int64_t)[v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = (int64_t)[v4 decodeIntegerForKey:@"totalClientCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview clientDomainName](self, "clientDomainName"));
  [v10 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier"));
  [v10 encodeObject:v5 forKey:@"assetSetIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries"));
  [v10 encodeObject:v6 forKey:@"configuredAssetEntries"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  [v10 encodeObject:v7 forKey:@"latestDownloadedAtomicInstance"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances"));
  [v10 encodeObject:v8 forKey:@"downloadedAtomicInstances"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  [v10 encodeObject:v9 forKey:@"discoveredAtomicInstance"];

  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MANAutoAssetSetOverview activeClientCount](self, "activeClientCount"),  @"activeClientCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MANAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"),  @"activeMonitorCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MANAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"),  @"maximumClientCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MANAutoAssetSetOverview totalClientCount](self, "totalClientCount"),  @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview clientDomainName](self, "clientDomainName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  if (v11) {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetOverview latestDownloadedAtomicInstance]( self,  "latestDownloadedAtomicInstance"));
  }
  else {
    v14 = @"N";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances"));
  if (v6) {
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances"));
  }
  else {
    v13 = @"N";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  if (v7) {
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  }
  else {
    id v8 = @"N";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          configuredAssetEntries: %@\n  latestDownloadedAtomicInstance: %@\n       downloadedAtomicInstances: %@\n        discoveredAtomicInstance: %@\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n<<<]",  v3,  v4,  v5,  v14,  v13,  v8,  -[MANAutoAssetSetOverview activeClientCount](self, "activeClientCount"),  -[MANAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"),  -[MANAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"),  -[MANAutoAssetSetOverview totalClientCount](self, "totalClientCount")));
  if (v7) {

  }
  if (v6) {
  if (v11)
  }

  return v9;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview clientDomainName](self, "clientDomainName"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries"));
  id v14 = [v16 count];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  if (v5) {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetOverview latestDownloadedAtomicInstance]( self,  "latestDownloadedAtomicInstance"));
  }
  else {
    v15 = @"NONE";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances"));
  if (v6)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances"));
    id v13 = [v12 count];
  }

  else
  {
    id v13 = 0LL;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  if (v7) {
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  }
  else {
    id v8 = @"NONE";
  }
  uint64_t v9 = (void *)v4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clientDomain:%@|assetIdentifier:%@|numConfiguredEntries:%ld|latestDownloadedEntry:%@|numDownloadedEntries:%ld|discoveredEntry:%@|clients:%lld|monitors:%lld|maxClients:%lld|totalClients:%lld",  v3,  v4,  v14,  v15,  v13,  v8,  -[MANAutoAssetSetOverview activeClientCount](self, "activeClientCount"),  -[MANAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"),  -[MANAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"),  -[MANAutoAssetSetOverview totalClientCount](self, "totalClientCount")));
  if (v7) {

  }
  if (v6) {
  if (v5)
  }

  return v10;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
}

- (void)setConfiguredAssetEntries:(id)a3
{
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
}

- (NSMutableArray)downloadedAtomicInstances
{
  return self->_downloadedAtomicInstances;
}

- (void)setDownloadedAtomicInstances:(id)a3
{
}

- (NSString)discoveredAtomicInstance
{
  return self->_discoveredAtomicInstance;
}

- (void)setDiscoveredAtomicInstance:(id)a3
{
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (void).cxx_destruct
{
}

@end