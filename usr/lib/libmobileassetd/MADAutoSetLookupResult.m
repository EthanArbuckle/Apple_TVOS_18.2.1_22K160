@interface MADAutoSetLookupResult
+ (BOOL)supportsSecureCoding;
- (MADAutoSetLookupResult)initWithCoder:(id)a3;
- (NSArray)discoveredAtomicEntries;
- (NSArray)requestedAutoAssetEntries;
- (NSDate)catalogLastTimeChecked;
- (NSDate)catalogPostedDate;
- (NSDictionary)autoAssetSetCatalog;
- (NSString)assetType;
- (NSString)catalogCachedAssetSetID;
- (NSURL)catalogDownloadedFromLive;
- (id)initForAssetType:(id)a3 withCatalogCachedAssetSetID:(id)a4 withCatalogDownloadedFromLive:(id)a5 withCatalogLastTimeChecked:(id)a6 withCatalogPostedDate:(id)a7 withRequestedAutoAssetEntries:(id)a8 withDiscoveredAtomicEntries:(id)a9 withCatalogFromPallasResponse:(id)a10;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAssetSetCatalog:(id)a3;
- (void)setCatalogCachedAssetSetID:(id)a3;
- (void)setCatalogDownloadedFromLive:(id)a3;
- (void)setCatalogLastTimeChecked:(id)a3;
- (void)setCatalogPostedDate:(id)a3;
- (void)setDiscoveredAtomicEntries:(id)a3;
- (void)setRequestedAutoAssetEntries:(id)a3;
@end

@implementation MADAutoSetLookupResult

- (id)initForAssetType:(id)a3 withCatalogCachedAssetSetID:(id)a4 withCatalogDownloadedFromLive:(id)a5 withCatalogLastTimeChecked:(id)a6 withCatalogPostedDate:(id)a7 withRequestedAutoAssetEntries:(id)a8 withDiscoveredAtomicEntries:(id)a9 withCatalogFromPallasResponse:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MADAutoSetLookupResult;
  v18 = -[MADAutoSetLookupResult init](&v28, "init");
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
  }

  return p_isa;
}

- (MADAutoSetLookupResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MADAutoSetLookupResult;
  v5 = -[MADAutoSetLookupResult init](&v34, "init");
  if (v5)
  {
    v37[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v37[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v37[2] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 3LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v36[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v36[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

    v35[0] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v35[1] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v35[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    v35[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v35[4] = objc_opt_class(&OBJC_CLASS___NSString);
    v35[5] = objc_opt_class(&OBJC_CLASS___NSURL);
    v35[6] = objc_opt_class(&OBJC_CLASS___NSDate);
    v35[7] = objc_opt_class(&OBJC_CLASS___NSData);
    v35[8] = objc_opt_class(&OBJC_CLASS___NSNull);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 9LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetType"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"catalogCachedAssetSetID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    catalogCachedAssetSetID = v5->_catalogCachedAssetSetID;
    v5->_catalogCachedAssetSetID = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"catalogDownloadedFromLive"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    catalogDownloadedFromLive = v5->_catalogDownloadedFromLive;
    v5->_catalogDownloadedFromLive = (NSURL *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogLastTimeChecked"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    catalogLastTimeChecked = v5->_catalogLastTimeChecked;
    v5->_catalogLastTimeChecked = (NSDate *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogPostedDate"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    catalogPostedDate = v5->_catalogPostedDate;
    v5->_catalogPostedDate = (NSDate *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"requestedAutoAssetEntries"]);
    requestedAutoAssetEntries = v5->_requestedAutoAssetEntries;
    v5->_requestedAutoAssetEntries = (NSArray *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"discoveredAtomicEntries"]);
    discoveredAtomicEntries = v5->_discoveredAtomicEntries;
    v5->_discoveredAtomicEntries = (NSArray *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"autoAssetSetCatalog"]);
    autoAssetSetCatalog = v5->_autoAssetSetCatalog;
    v5->_autoAssetSetCatalog = (NSDictionary *)v31;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult assetType](self, "assetType"));
  [v4 encodeObject:v5 forKey:@"assetType"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  [v4 encodeObject:v6 forKey:@"catalogCachedAssetSetID"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  [v4 encodeObject:v7 forKey:@"catalogDownloadedFromLive"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  [v4 encodeObject:v8 forKey:@"catalogLastTimeChecked"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogPostedDate](self, "catalogPostedDate"));
  [v4 encodeObject:v9 forKey:@"catalogPostedDate"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
  [v4 encodeObject:v10 forKey:@"requestedAutoAssetEntries"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  [v4 encodeObject:v11 forKey:@"discoveredAtomicEntries"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult autoAssetSetCatalog](self, "autoAssetSetCatalog"));
  [v4 encodeObject:v12 forKey:@"autoAssetSetCatalog"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult assetType](self, "assetType"));
  id v4 = -[MADAutoSetLookupResult newSummaryWithoutEntryID](self, "newSummaryWithoutEntryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[assetType:%@]%@",  v3,  v4));

  return v5;
}

- (id)newSummaryWithoutEntryID
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  id v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v33 + 1) + 8 * (void)i) assetID]);

        if (v10) {
          ++v7;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  id v26 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  if (v11) {
    id v12 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  }
  else {
    id v12 = @"N";
  }
  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  if (v28) {
    uint64_t v13 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  }
  else {
    uint64_t v13 = @"N";
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  if (v14)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogLastTimeChecked](self, "catalogLastTimeChecked"));
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    v32 = @"N";
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogPostedDate](self, "catalogPostedDate"));
  v30 = (void *)v11;
  uint64_t v31 = v3;
  uint64_t v29 = (__CFString *)v12;
  uint64_t v27 = (__CFString *)v13;
  if (v15)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult catalogPostedDate](self, "catalogPostedDate"));
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    uint64_t v16 = @"N";
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
  id v18 = [v17 count];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  id v20 = [v19 count];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLookupResult autoAssetSetCatalog](self, "autoAssetSetCatalog"));
  uint64_t v22 = -[NSString initWithFormat:]( v26,  "initWithFormat:",  @"[cachedAssetSetID:%@|downloadedFromLive:%@|lastTimeChecked:%@|postedDate:%@|atomicEntries(requested:%ld,discovered:%ld)|assetIDs:%ld|setCatalogAssets:%ld]",  v29,  v27,  v32,  v16,  v18,  v20,  v7,  [v21 count]);

  if (v15)
  {
  }

  if (v14)
  {
  }

  if (v28) {
  if (v30)
  }

  return v22;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)catalogCachedAssetSetID
{
  return self->_catalogCachedAssetSetID;
}

- (void)setCatalogCachedAssetSetID:(id)a3
{
}

- (NSURL)catalogDownloadedFromLive
{
  return self->_catalogDownloadedFromLive;
}

- (void)setCatalogDownloadedFromLive:(id)a3
{
}

- (NSDate)catalogLastTimeChecked
{
  return self->_catalogLastTimeChecked;
}

- (void)setCatalogLastTimeChecked:(id)a3
{
}

- (NSDate)catalogPostedDate
{
  return self->_catalogPostedDate;
}

- (void)setCatalogPostedDate:(id)a3
{
}

- (NSArray)requestedAutoAssetEntries
{
  return self->_requestedAutoAssetEntries;
}

- (void)setRequestedAutoAssetEntries:(id)a3
{
}

- (NSArray)discoveredAtomicEntries
{
  return self->_discoveredAtomicEntries;
}

- (void)setDiscoveredAtomicEntries:(id)a3
{
}

- (NSDictionary)autoAssetSetCatalog
{
  return self->_autoAssetSetCatalog;
}

- (void)setAutoAssetSetCatalog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end