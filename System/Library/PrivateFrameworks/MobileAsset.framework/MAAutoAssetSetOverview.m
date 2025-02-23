@interface MAAutoAssetSetOverview
+ (BOOL)supportsSecureCoding;
+ (id)overviewNewMaxColumnStrings;
+ (id)overviewPaddedBanner:(id)a3;
+ (id)overviewPaddedHeader:(id)a3;
+ (id)overviewPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6;
- (MAAutoAssetSetOverview)initWithCoder:(id)a3;
- (MAAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12;
- (NSArray)configuredAssetEntries;
- (NSArray)downloadedAtomicInstances;
- (NSString)assetSetIdentifier;
- (NSString)clientDomainName;
- (NSString)discoveredAtomicInstance;
- (NSString)latestDownloadedAtomicInstance;
- (id)_entry_string_to_use:(int64_t)a3;
- (id)description;
- (id)description:(BOOL)a3;
- (id)overviewPadded:(id)a3;
- (id)summary;
- (int64_t)activeClientCount;
- (int64_t)activeMonitorCount;
- (int64_t)maximumClientCount;
- (int64_t)totalClientCount;
- (void)encodeWithCoder:(id)a3;
- (void)overviewBuildMaxColumnStrings:(id)a3;
- (void)setActiveClientCount:(int64_t)a3;
- (void)setActiveMonitorCount:(int64_t)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setConfiguredAssetEntries:(id)a3;
- (void)setDownloadedAtomicInstances:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setMaximumClientCount:(int64_t)a3;
- (void)setTotalClientCount:(int64_t)a3;
@end

@implementation MAAutoAssetSetOverview

- (MAAutoAssetSetOverview)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withLatestDownloadedAtomicInstance:(id)a6 withDownloadedAtomicInstances:(id)a7 withDiscoveredAtomicInstance:(id)a8 withActiveClientCount:(int64_t)a9 withActiveMonitorCount:(int64_t)a10 withMaximumClientCount:(int64_t)a11 withTotalClientCount:(int64_t)a12
{
  id v19 = a3;
  id v20 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetOverview;
  v22 = -[MAAutoAssetSetOverview init](&v28, sel_init);
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

- (MAAutoAssetSetOverview)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetOverview;
  v5 = -[MAAutoAssetSetOverview init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v27 count:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v11;

    id v13 = objc_alloc(MEMORY[0x189604010]);
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v26[2] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v26 count:3];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)[v13 initWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"configuredAssetEntries"];
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestDownloadedAtomicInstance"];
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v8 forKey:@"downloadedAtomicInstances"];
    downloadedAtomicInstances = v5->_downloadedAtomicInstances;
    v5->_downloadedAtomicInstances = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveredAtomicInstance"];
    discoveredAtomicInstance = v5->_discoveredAtomicInstance;
    v5->_discoveredAtomicInstance = (NSString *)v22;

    v5->_activeClientCount = [v4 decodeIntegerForKey:@"activeClientCount"];
    v5->_activeMonitorCount = [v4 decodeIntegerForKey:@"activeMonitorCount"];
    v5->_maximumClientCount = [v4 decodeIntegerForKey:@"maximumClientCount"];
    v5->_totalClientCount = [v4 decodeIntegerForKey:@"totalClientCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 encodeObject:v4 forKey:@"clientDomainName"];
  v5 = -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  [v10 encodeObject:v5 forKey:@"assetSetIdentifier"];
  v6 = -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  [v10 encodeObject:v6 forKey:@"configuredAssetEntries"];
  v7 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  [v10 encodeObject:v7 forKey:@"latestDownloadedAtomicInstance"];
  v8 = -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  [v10 encodeObject:v8 forKey:@"downloadedAtomicInstances"];

  -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 encodeObject:v9 forKey:@"discoveredAtomicInstance"];

  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"),  @"activeClientCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"),  @"activeMonitorCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"),  @"maximumClientCount");
  objc_msgSend( v10,  "encodeInteger:forKey:",  -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"),  @"totalClientCount");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[MAAutoAssetSetOverview description:](self, "description:", 0LL);
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v6 = v5;
  if (v3)
  {
    [v5 description];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = objc_alloc(NSString);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (void *)[v8 initWithFormat:@"%@", v10];

      goto LABEL_10;
    }

    uint64_t v18 = [v8 initWithFormat:@"%@", @"NONE", v28];
  }

  else
  {
    uint64_t v12 = [v5 count];

    id v13 = objc_alloc(NSString);
    v14 = -[MAAutoAssetSetOverview _entry_string_to_use:](self, "_entry_string_to_use:", (int)v12);
    v7 = (void *)[v13 initWithFormat:@"%d %@", v12, v14];
    v15 = -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    if (v15)
    {
      -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 count];
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    id v19 = objc_alloc(NSString);
    -[MAAutoAssetSetOverview _entry_string_to_use:](self, "_entry_string_to_use:", (int)v17);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v19 initWithFormat:@"%d %@", v17, v9];
  }

  uint64_t v11 = (void *)v18;
LABEL_10:

  uint64_t v20 = (void *)NSString;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  if (v23)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v29 = @"NONE";
  }
  v24 = -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
  if (v24)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    objc_super v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v25 = @"NONE";
  }

  [v20 stringWithFormat:@">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          configuredAssetEntries: %@\n  latestDownloadedAtomicInstance: %@\n        discoveredAtomicInstance: %@\n       downloadedAtomicInstances: %@\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n<<<]", v21, v22, v7, v29, v25, v11, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount")];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24) {

  }
  if (v23) {
  return v26;
  }
}

- (id)_entry_string_to_use:(int64_t)a3
{
  if (a3 >= 2) {
    return @"entries";
  }
  else {
    return @"entry";
  }
}

- (id)summary
{
  v15 = (void *)NSString;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v17 count];
  v5 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  if (v5)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v16 = @"NONE";
  }
  v6 = -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  if (v6)
  {
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 count];
  }

  else
  {
    uint64_t v13 = 0LL;
  }
  v7 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  if (v7)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = @"NONE";
  }

  uint64_t v9 = (void *)v4;
  [v15 stringWithFormat:@"clientDomain:%@|assetIdentifier:%@|numConfiguredEntries:%ld|latestDownloadedEntry:%@|numDownloadedEntries:%ld|discoveredEntry:%@|clients:%lld|monitors:%lld|maxClients:%lld|totalClients:%lld", v3, v4, v14, v16, v13, v8, -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"), -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount")];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {

  }
  if (v6) {
  if (v5)
  }

  return v10;
}

- (void)overviewBuildMaxColumnStrings:(id)a3
{
  id v52 = a3;
  -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  id v5 = objc_alloc(NSString);
  v6 = -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  v50 = (void *)objc_msgSend(v5, "initWithFormat:", @"%lld", objc_msgSend(v6, "count"));
  v7 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  if (v7)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = @"NONE";
  }

  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = objc_alloc(NSString);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = (__CFString *)objc_msgSend(v10, "initWithFormat:", @"%lld", objc_msgSend(v11, "count"));
  }

  else
  {
    uint64_t v12 = @"NONE";
  }

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v14 = @"NONE";
  }

  v15 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  uint64_t v16 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  uint64_t v17 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  uint64_t v18 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  v49 = v4;
  unint64_t v19 = [v4 length];
  [v52 safeStringForKey:@"assetSetIdentifier"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = [v20 length];

  if (v19 > v21) {
    [v52 setSafeObject:v49 forKey:@"assetSetIdentifier"];
  }
  unint64_t v22 = [v51 length];
  [v52 safeStringForKey:@"assetSetIdentifier"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v24 = [v23 length];

  if (v22 > v24) {
    [v52 setSafeObject:v51 forKey:@"assetSetIdentifier"];
  }
  unint64_t v25 = [v50 length];
  [v52 safeStringForKey:@"configuredAssetEntries"];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v27 = [v26 length];

  if (v25 > v27) {
    [v52 setSafeObject:v50 forKey:@"configuredAssetEntries"];
  }
  unint64_t v28 = -[__CFString length](v8, "length");
  [v52 safeStringForKey:@"latestDownloadedAtomicInstance"];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v30 = [v29 length];

  if (v28 > v30) {
    [v52 setSafeObject:v8 forKey:@"latestDownloadedAtomicInstance"];
  }
  unint64_t v31 = -[__CFString length](v12, "length");
  [v52 safeStringForKey:@"downloadedAtomicInstances"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v33 = [v32 length];

  if (v31 > v33) {
    [v52 setSafeObject:v12 forKey:@"downloadedAtomicInstances"];
  }
  unint64_t v34 = -[__CFString length](v14, "length");
  [v52 safeStringForKey:@"discoveredAtomicInstance"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v36 = [v35 length];

  if (v34 > v36) {
    [v52 setSafeObject:v14 forKey:@"discoveredAtomicInstance"];
  }
  unint64_t v37 = [v15 length];
  [v52 safeStringForKey:@"activeClientCount"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v39 = [v38 length];

  if (v37 > v39) {
    [v52 setSafeObject:v15 forKey:@"activeClientCount"];
  }
  unint64_t v40 = [v16 length];
  [v52 safeStringForKey:@"activeMonitorCount"];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v42 = [v41 length];

  if (v40 > v42) {
    [v52 setSafeObject:v16 forKey:@"activeMonitorCount"];
  }
  unint64_t v43 = [v17 length];
  [v52 safeStringForKey:@"maximumClientCount"];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v45 = [v44 length];

  if (v43 > v45) {
    [v52 setSafeObject:v17 forKey:@"maximumClientCount"];
  }
  unint64_t v46 = [v18 length];
  [v52 safeStringForKey:@"totalClientCount"];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v48 = [v47 length];

  if (v46 > v48) {
    [v52 setSafeObject:v18 forKey:@"totalClientCount"];
  }
}

- (id)overviewPadded:(id)a3
{
  id v4 = a3;
  v44 = -[MAAutoAssetSetOverview clientDomainName](self, "clientDomainName");
  -[MAAutoAssetSetOverview assetSetIdentifier](self, "assetSetIdentifier");
  unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = objc_alloc(NSString);
  v6 = -[MAAutoAssetSetOverview configuredAssetEntries](self, "configuredAssetEntries");
  unint64_t v43 = (void *)objc_msgSend(v5, "initWithFormat:", @"%lld", objc_msgSend(v6, "count"));
  v7 = -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  if (v7)
  {
    -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
    unint64_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v39 = @"NONE";
  }

  -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    id v9 = objc_alloc(NSString);
    -[MAAutoAssetSetOverview downloadedAtomicInstances](self, "downloadedAtomicInstances");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v42 = (__CFString *)objc_msgSend(v9, "initWithFormat:", @"%lld", objc_msgSend(v10, "count"));
  }

  else
  {
    unint64_t v42 = @"NONE";
  }

  -[MAAutoAssetSetOverview latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MAAutoAssetSetOverview discoveredAtomicInstance](self, "discoveredAtomicInstance");
    uint64_t v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = @"NONE";
  }

  unint64_t v30 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview activeClientCount](self, "activeClientCount"));
  v41 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview activeMonitorCount](self, "activeMonitorCount"));
  unint64_t v40 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview maximumClientCount](self, "maximumClientCount"));
  v38 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%lld",  -[MAAutoAssetSetOverview totalClientCount](self, "totalClientCount"));
  id v32 = (id)NSString;
  [v4 safeStringForKey:@"clientDomainName"];
  unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v44,  v37,  @" ",  0LL);
  [v4 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v45,  v36,  @" ",  0LL);
  unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"configuredAssetEntries"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v43,  v35,  @" ",  0LL);
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"latestDownloadedAtomicInstance"];
  unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v39,  v31,  @" ",  0LL);
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"downloadedAtomicInstances"];
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v42,  v28,  @" ",  0LL);
  [v4 safeStringForKey:@"discoveredAtomicInstance"];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v34 = (__CFString *)v12;
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v12,  v26,  @" ",  0LL);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeClientCount"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v30,  v24,  @" ",  1LL);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"activeMonitorCount"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v41,  v22,  @" ",  1LL);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"maximumClientCount"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v40,  v15,  @" ",  1LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 safeStringForKey:@"totalClientCount"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  v38,  v17,  @" ",  1LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v29, v27, v21, v25, v23, v20, v13, v14, v16, v18];
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (id)overviewNewMaxColumnStrings
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v2 setSafeObject:@"clientDomainName" forKey:@"clientDomainName"];
  [v2 setSafeObject:@"assetSetIdentifier" forKey:@"assetSetIdentifier"];
  [v2 setSafeObject:@"configuredAssetEntries" forKey:@"configuredAssetEntries"];
  [v2 setSafeObject:@"latestDownloadedAtomicInstance" forKey:@"latestDownloadedAtomicInstance"];
  [v2 setSafeObject:@"downloadedAtomicInstances" forKey:@"downloadedAtomicInstances"];
  [v2 setSafeObject:@"discoveredAtomicInstance" forKey:@"discoveredAtomicInstance"];
  [v2 setSafeObject:@"activeClientCount" forKey:@"activeClientCount"];
  [v2 setSafeObject:@"activeMonitorCount" forKey:@"activeMonitorCount"];
  [v2 setSafeObject:@"maximumClientCount" forKey:@"maximumClientCount"];
  [v2 setSafeObject:@"totalClientCount" forKey:@"totalClientCount"];
  return v2;
}

+ (id)overviewPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  unint64_t v13 = [v12 length];
  uint64_t v14 = v12;
  if (v13 < [v10 length])
  {
    uint64_t v15 = [v10 length];
    uint64_t v16 = v15 - [v12 length];
    [NSString string];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringByPaddingToLength:v16 withString:v11 startingAtIndex:0];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    id v19 = objc_alloc(NSString);
    if (v6) {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v18, v12];
    }
    else {
      uint64_t v20 = [v19 initWithFormat:@"%@%@", v12, v18];
    }
    uint64_t v14 = (void *)v20;
  }

  return v14;
}

+ (id)overviewPaddedHeader:(id)a3
{
  uint64_t v20 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"clientDomainName",  v24,  @" ",  0LL);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetSetIdentifier"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"assetSetIdentifier",  v23,  @" ",  0LL);
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"configuredAssetEntries"];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"configuredAssetEntries",  v22,  @" ",  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"latestDownloadedAtomicInstance"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"latestDownloadedAtomicInstance",  v19,  @" ",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedAtomicInstances"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"downloadedAtomicInstances",  v18,  @" ",  0LL);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"discoveredAtomicInstance"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"discoveredAtomicInstance",  v17,  @" ",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeClientCount"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeClientCount",  v14,  @" ",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeMonitorCount"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"activeMonitorCount",  v12,  @" ",  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumClientCount"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"maximumClientCount",  v6,  @" ",  0LL);
  [v3 safeStringForKey:@"totalClientCount"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  @"totalClientCount",  v8,  @" ",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v25, v16, v15, v13, v11, v4, v5, v7, v9];
  unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)overviewPaddedBanner:(id)a3
{
  unint64_t v21 = (void *)NSString;
  id v3 = a3;
  [v3 safeStringForKey:@"clientDomainName"];
  unint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v25,  @"=",  0LL);
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"assetSetIdentifier"];
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v24,  @"=",  0LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"configuredAssetEntries"];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v23,  @"=",  0LL);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"latestDownloadedAtomicInstance"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v20,  @"=",  0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"downloadedAtomicInstances"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v19,  @"=",  0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"discoveredAtomicInstance"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v17,  @"=",  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeClientCount"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v14,  @"=",  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"activeMonitorCount"];
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v13,  @"=",  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeStringForKey:@"maximumClientCount"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v6,  @"=",  0LL);
  [v3 safeStringForKey:@"totalClientCount"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetOverview overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:]( &OBJC_CLASS___MAAutoAssetSetOverview,  "overviewPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:",  &stru_189FFC530,  v8,  @"=",  0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", v26, v18, v16, v15, v11, v12, v4, v5, v7, v9];
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
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

- (NSArray)downloadedAtomicInstances
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