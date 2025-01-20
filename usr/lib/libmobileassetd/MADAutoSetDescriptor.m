@interface MADAutoSetDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)atomicInstanceDownloadedNotified;
- (BOOL)downloadUserInitiated;
- (BOOL)isDiscoveredFullyDownloaded;
- (BOOL)isOnFilesystem;
- (BOOL)neverBeenLocked;
- (BOOL)onFilesystemIncomplete;
- (BOOL)secureOperationEliminating;
- (BOOL)secureOperationInProgress;
- (BOOL)stagedPriorToAvailable;
- (MADAutoSetDescriptor)initWithCoder:(id)a3;
- (NSArray)discoveredAtomicEntries;
- (NSArray)latestDowloadedAtomicInstanceEntries;
- (NSArray)requestedAutoAssetEntries;
- (NSDate)catalogLastTimeChecked;
- (NSDate)catalogPostedDate;
- (NSDate)downloadedCatalogLastTimeChecked;
- (NSDate)downloadedCatalogPostedDate;
- (NSString)assetSetIdentifier;
- (NSString)catalogCachedAssetSetID;
- (NSString)clientDomainName;
- (NSString)discoveredAtomicInstance;
- (NSString)downloadedCatalogCachedAssetSetID;
- (NSString)latestDownloadedAtomicInstance;
- (NSURL)catalogDownloadedFromLive;
- (NSURL)downloadedCatalogDownloadedFromLive;
- (id)copy;
- (id)downloadedEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4;
- (id)firstAssetType;
- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withDiscoveredAtomicInstance:(id)a5 withDiscoveredAtomicEntries:(id)a6;
- (id)newIdentityName;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAtomicInstanceDownloadedNotified:(BOOL)a3;
- (void)setCatalogCachedAssetSetID:(id)a3;
- (void)setCatalogDownloadedFromLive:(id)a3;
- (void)setCatalogLastTimeChecked:(id)a3;
- (void)setCatalogPostedDate:(id)a3;
- (void)setDiscoveredAtomicEntries:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedCatalogCachedAssetSetID:(id)a3;
- (void)setDownloadedCatalogDownloadedFromLive:(id)a3;
- (void)setDownloadedCatalogLastTimeChecked:(id)a3;
- (void)setDownloadedCatalogPostedDate:(id)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setIsDiscoveredFullyDownloaded:(BOOL)a3;
- (void)setIsOnFilesystem:(BOOL)a3;
- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setNeverBeenLocked:(BOOL)a3;
- (void)setOnFilesystemIncomplete:(BOOL)a3;
- (void)setRequestedAutoAssetEntries:(id)a3;
- (void)setSecureOperationEliminating:(BOOL)a3;
- (void)setSecureOperationInProgress:(BOOL)a3;
- (void)setStagedPriorToAvailable:(BOOL)a3;
@end

@implementation MADAutoSetDescriptor

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSString)latestDownloadedAtomicInstance
{
  return self->_latestDownloadedAtomicInstance;
}

- (NSString)catalogCachedAssetSetID
{
  return self->_catalogCachedAssetSetID;
}

- (NSURL)catalogDownloadedFromLive
{
  return self->_catalogDownloadedFromLive;
}

- (NSDate)catalogLastTimeChecked
{
  return self->_catalogLastTimeChecked;
}

- (NSDate)catalogPostedDate
{
  return self->_catalogPostedDate;
}

- (NSString)discoveredAtomicInstance
{
  return self->_discoveredAtomicInstance;
}

- (NSArray)latestDowloadedAtomicInstanceEntries
{
  return self->_latestDowloadedAtomicInstanceEntries;
}

- (NSString)downloadedCatalogCachedAssetSetID
{
  return self->_downloadedCatalogCachedAssetSetID;
}

- (NSURL)downloadedCatalogDownloadedFromLive
{
  return self->_downloadedCatalogDownloadedFromLive;
}

- (NSDate)downloadedCatalogLastTimeChecked
{
  return self->_downloadedCatalogLastTimeChecked;
}

- (NSDate)downloadedCatalogPostedDate
{
  return self->_downloadedCatalogPostedDate;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);

    if (v6)
    {
      v7 = objc_alloc(&OBJC_CLASS___NSString);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fullAssetSelector]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetSpecifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 fullAssetSelector]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
      v36 = -[NSString initWithFormat:](v7, "initWithFormat:", @"{[0]%@:%@}", v9, v11);
    }

    else
    {
      v36 = &stru_355768;
    }
  }

  else
  {
    v36 = &stru_355768;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  id v13 = [v12 count];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:0]);

    if (v15)
    {
      v16 = objc_alloc(&OBJC_CLASS___NSString);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 fullAssetSelector]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSpecifier]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v15 fullAssetSelector]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetVersion]);
      v21 = -[NSString initWithFormat:](v16, "initWithFormat:", @"{[0]%@:%@}", v18, v20);
    }

    else
    {
      v21 = &stru_355768;
    }

    v35 = (__CFString *)v21;
  }

  else
  {
    v35 = &stru_355768;
  }

  id v45 = -[MADAutoSetDescriptor newIdentityName](self, "newIdentityName");
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  if (v47) {
    v22 = @"Y";
  }
  else {
    v22 = @"N";
  }
  v44 = v22;
  v46 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v42 = [v46 count];
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  id v40 = [v43 count];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
  id v39 = [v23 count];
  if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded")) {
    v24 = @"Y";
  }
  else {
    v24 = @"N";
  }
  v38 = v24;
  if (-[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified")) {
    v25 = @"Y";
  }
  else {
    v25 = @"N";
  }
  v37 = v25;
  if (-[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem")) {
    v26 = @"Y";
  }
  else {
    v26 = @"N";
  }
  if (-[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete")) {
    v27 = @"Y";
  }
  else {
    v27 = @"N";
  }
  if (-[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked")) {
    v28 = @"Y";
  }
  else {
    v28 = @"N";
  }
  if (-[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress")) {
    v29 = @"Y";
  }
  else {
    v29 = @"N";
  }
  if (-[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating")) {
    v30 = @"Y";
  }
  else {
    v30 = @"N";
  }
  if (-[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
    v31 = @"Y";
  }
  else {
    v31 = @"N";
  }
  if (-[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
    v32 = @"Y";
  }
  else {
    v32 = @"N";
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@ | instance latestDownloaded:%@(entries:%ld)%@, discovered:%@(entries:%ld)%@, requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@]",  v45,  v44,  v42,  v36,  v41,  v40,  v35,  v39,  v38,  v37,  v26,  v27,  v28,  v29,  v30,  v31,  v32));

  return v33;
}

- (id)newIdentityName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor firstAssetType](self, "firstAssetType"));
  if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded"))
  {
    if (-[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem"))
    {
      unsigned int v4 = -[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete");
      v5 = objc_alloc(&OBJC_CLASS___NSString);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](self, "clientDomainName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
      v9 = (void *)v8;
      if (v4) {
        v10 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"SD_INCOMPLETE[%@](domain:%@|setID:%@|atomic:%@)",  v3,  v6,  v7,  v8);
      }
      else {
        v10 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"SD_DOWNLOADED[%@](domain:%@|setID:%@|atomic:%@)",  v3,  v6,  v7,  v8);
      }
    }

    else
    {
      v14 = objc_alloc(&OBJC_CLASS___NSString);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](self, "clientDomainName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
      v10 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"SD_GONE[%@](domain:%@|setID:%@|atomic:%@)",  v3,  v6,  v7,  v9);
    }

    goto LABEL_10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));

  v12 = objc_alloc(&OBJC_CLASS___NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](self, "clientDomainName"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
  v7 = (void *)v13;
  if (v11)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
    v10 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"SD_DISCOVERED[%@](domain:%@|setID:%@|atomic:%@)",  v3,  v6,  v7,  v9);
LABEL_10:
    v15 = v10;

    goto LABEL_11;
  }

  v15 = -[NSString initWithFormat:](v12, "initWithFormat:", @"SD_LOOKUP[%@](domain:%@|setID:%@)", v3, v6, v13);
LABEL_11:

  return v15;
}

- (BOOL)isDiscoveredFullyDownloaded
{
  return self->_isDiscoveredFullyDownloaded;
}

- (BOOL)isOnFilesystem
{
  return self->_isOnFilesystem;
}

- (BOOL)onFilesystemIncomplete
{
  return self->_onFilesystemIncomplete;
}

- (NSArray)discoveredAtomicEntries
{
  return self->_discoveredAtomicEntries;
}

- (BOOL)neverBeenLocked
{
  return self->_neverBeenLocked;
}

- (BOOL)stagedPriorToAvailable
{
  return self->_stagedPriorToAvailable;
}

- (id)copy
{
  v3 = objc_alloc(&OBJC_CLASS___MADAutoSetDescriptor);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](self, "clientDomainName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  id v8 = -[MADAutoSetDescriptor initForClientDomainName:forAssetSetIdentifier:withDiscoveredAtomicInstance:withDiscoveredAtomicEntries:]( v3,  "initForClientDomainName:forAssetSetIdentifier:withDiscoveredAtomicInstance:withDiscoveredAtomicEntries:",  v4,  v5,  v6,  v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  [v8 setCatalogCachedAssetSetID:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  [v8 setCatalogDownloadedFromLive:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  [v8 setCatalogLastTimeChecked:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
  [v8 setCatalogPostedDate:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
  id v14 = [v13 copy];
  [v8 setRequestedAutoAssetEntries:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  [v8 setLatestDownloadedAtomicInstance:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v17 = [v16 copy];
  [v8 setLatestDowloadedAtomicInstanceEntries:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
  [v8 setDownloadedCatalogCachedAssetSetID:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  [v8 setDownloadedCatalogDownloadedFromLive:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
  [v8 setDownloadedCatalogLastTimeChecked:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
  [v8 setDownloadedCatalogPostedDate:v21];

  objc_msgSend(v8, "setIsOnFilesystem:", -[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem"));
  objc_msgSend( v8,  "setOnFilesystemIncomplete:",  -[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete"));
  objc_msgSend( v8,  "setIsDiscoveredFullyDownloaded:",  -[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded"));
  objc_msgSend( v8,  "setAtomicInstanceDownloadedNotified:",  -[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified"));
  objc_msgSend(v8, "setNeverBeenLocked:", -[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked"));
  objc_msgSend( v8,  "setSecureOperationInProgress:",  -[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress"));
  objc_msgSend( v8,  "setSecureOperationEliminating:",  -[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating"));
  objc_msgSend( v8,  "setDownloadUserInitiated:",  -[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated"));
  objc_msgSend( v8,  "setDownloadedNetworkBytes:",  -[MADAutoSetDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"));
  objc_msgSend( v8,  "setDownloadedFilesystemBytes:",  -[MADAutoSetDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"));
  objc_msgSend( v8,  "setStagedPriorToAvailable:",  -[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"));
  return v8;
}

- (id)initForClientDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withDiscoveredAtomicInstance:(id)a5 withDiscoveredAtomicEntries:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MADAutoSetDescriptor;
  v15 = -[MADAutoSetDescriptor init](&v29, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientDomainName, a3);
    objc_storeStrong((id *)&v16->_assetSetIdentifier, a4);
    catalogCachedAssetSetID = v16->_catalogCachedAssetSetID;
    v16->_catalogCachedAssetSetID = 0LL;

    catalogDownloadedFromLive = v16->_catalogDownloadedFromLive;
    v16->_catalogDownloadedFromLive = 0LL;

    catalogLastTimeChecked = v16->_catalogLastTimeChecked;
    v16->_catalogLastTimeChecked = 0LL;

    catalogPostedDate = v16->_catalogPostedDate;
    v16->_catalogPostedDate = 0LL;

    requestedAutoAssetEntries = v16->_requestedAutoAssetEntries;
    v16->_requestedAutoAssetEntries = 0LL;

    objc_storeStrong((id *)&v16->_discoveredAtomicInstance, a5);
    objc_storeStrong((id *)&v16->_discoveredAtomicEntries, a6);
    latestDownloadedAtomicInstance = v16->_latestDownloadedAtomicInstance;
    v16->_latestDownloadedAtomicInstance = 0LL;

    latestDowloadedAtomicInstanceEntries = v16->_latestDowloadedAtomicInstanceEntries;
    v16->_latestDowloadedAtomicInstanceEntries = 0LL;

    downloadedCatalogCachedAssetSetID = v16->_downloadedCatalogCachedAssetSetID;
    v16->_downloadedCatalogCachedAssetSetID = 0LL;

    downloadedCatalogDownloadedFromLive = v16->_downloadedCatalogDownloadedFromLive;
    v16->_downloadedCatalogDownloadedFromLive = 0LL;

    downloadedCatalogLastTimeChecked = v16->_downloadedCatalogLastTimeChecked;
    v16->_downloadedCatalogLastTimeChecked = 0LL;

    downloadedCatalogPostedDate = v16->_downloadedCatalogPostedDate;
    v16->_downloadedCatalogPostedDate = 0LL;

    *(_DWORD *)&v16->_isOnFilesystem = 0;
    v16->_neverBeenLocked = 1;
    *(_DWORD *)&v16->_secureOperationInProgress = 0;
    v16->_downloadedNetworkBytes = 0LL;
    v16->_downloadedFilesystemBytes = 0LL;
  }

  return v16;
}

- (void)setCatalogCachedAssetSetID:(id)a3
{
}

- (void)setCatalogDownloadedFromLive:(id)a3
{
}

- (void)setCatalogLastTimeChecked:(id)a3
{
}

- (void)setCatalogPostedDate:(id)a3
{
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
}

- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3
{
}

- (void)setDownloadedCatalogCachedAssetSetID:(id)a3
{
}

- (void)setDownloadedCatalogDownloadedFromLive:(id)a3
{
}

- (void)setDownloadedCatalogLastTimeChecked:(id)a3
{
}

- (void)setDownloadedCatalogPostedDate:(id)a3
{
}

- (void)setIsOnFilesystem:(BOOL)a3
{
  self->_isOnFilesystem = a3;
}

- (void)setOnFilesystemIncomplete:(BOOL)a3
{
  self->_onFilesystemIncomplete = a3;
}

- (void)setIsDiscoveredFullyDownloaded:(BOOL)a3
{
  self->_isDiscoveredFullyDownloaded = a3;
}

- (void)setNeverBeenLocked:(BOOL)a3
{
  self->_neverBeenLocked = a3;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (void)setStagedPriorToAvailable:(BOOL)a3
{
  self->_stagedPriorToAvailable = a3;
}

- (void)setDiscoveredAtomicEntries:(id)a3
{
}

- (void).cxx_destruct
{
}

- (MADAutoSetDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___MADAutoSetDescriptor;
  v5 = -[MADAutoSetDescriptor init](&v53, "init");
  if (v5)
  {
    v55[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v55[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v54[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v54[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"asetSetIdentifier"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"catalogCachedAssetSetID"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    catalogCachedAssetSetID = v5->_catalogCachedAssetSetID;
    v5->_catalogCachedAssetSetID = (NSString *)v17;

    id v19 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"catalogDownloadedFromLive"];
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    catalogDownloadedFromLive = v5->_catalogDownloadedFromLive;
    v5->_catalogDownloadedFromLive = (NSURL *)v20;

    id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogLastTimeChecked"];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
    catalogLastTimeChecked = v5->_catalogLastTimeChecked;
    v5->_catalogLastTimeChecked = (NSDate *)v23;

    id v25 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogPostedDate"];
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    catalogPostedDate = v5->_catalogPostedDate;
    v5->_catalogPostedDate = (NSDate *)v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"requestedAutoAssetEntries"]);
    requestedAutoAssetEntries = v5->_requestedAutoAssetEntries;
    v5->_requestedAutoAssetEntries = (NSArray *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"discoveredAtomicInstance"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    discoveredAtomicInstance = v5->_discoveredAtomicInstance;
    v5->_discoveredAtomicInstance = (NSString *)v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"discoveredAtomicEntries"]);
    discoveredAtomicEntries = v5->_discoveredAtomicEntries;
    v5->_discoveredAtomicEntries = (NSArray *)v33;

    id v35 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"latestDownloadedAtomicInstance"];
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v36;

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v9 forKey:@"latestDowloadedAtomicInstanceEntries"]);
    latestDowloadedAtomicInstanceEntries = v5->_latestDowloadedAtomicInstanceEntries;
    v5->_latestDowloadedAtomicInstanceEntries = (NSArray *)v38;

    id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"downloadedCatalogCachedAssetSetID"];
    uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
    downloadedCatalogCachedAssetSetID = v5->_downloadedCatalogCachedAssetSetID;
    v5->_downloadedCatalogCachedAssetSetID = (NSString *)v41;

    id v43 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"downloadedCatalogDownloadedFromLive"];
    uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
    downloadedCatalogDownloadedFromLive = v5->_downloadedCatalogDownloadedFromLive;
    v5->_downloadedCatalogDownloadedFromLive = (NSURL *)v44;

    id v46 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"downloadedCatalogLastTimeChecked"];
    uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
    downloadedCatalogLastTimeChecked = v5->_downloadedCatalogLastTimeChecked;
    v5->_downloadedCatalogLastTimeChecked = (NSDate *)v47;

    id v49 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"downloadedCatalogPostedDate"];
    uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
    downloadedCatalogPostedDate = v5->_downloadedCatalogPostedDate;
    v5->_downloadedCatalogPostedDate = (NSDate *)v50;

    v5->_isOnFilesystem = [v4 decodeBoolForKey:@"isOnFilesystem"];
    v5->_onFilesystemIncomplete = [v4 decodeBoolForKey:@"onFilesystemIncomplete"];
    v5->_isDiscoveredFullyDownloaded = [v4 decodeBoolForKey:@"isDiscoveredFullyDownloaded"];
    v5->_atomicInstanceDownloadedNotified = [v4 decodeBoolForKey:@"atomicInstanceDownloadedNotified"];
    v5->_neverBeenLocked = [v4 decodeBoolForKey:@"neverBeenLocked"];
    v5->_secureOperationInProgress = [v4 decodeBoolForKey:@"secureOperationInProgress"];
    v5->_secureOperationEliminating = [v4 decodeBoolForKey:@"secureOperationEliminating"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    v5->_downloadedNetworkBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    v5->_stagedPriorToAvailable = [v4 decodeBoolForKey:@"stagedPriorToAvailable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](self, "clientDomainName"));
  [v19 encodeObject:v4 forKey:@"clientDomainName"];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](self, "assetSetIdentifier"));
  [v19 encodeObject:v5 forKey:@"asetSetIdentifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  [v19 encodeObject:v6 forKey:@"catalogCachedAssetSetID"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  [v19 encodeObject:v7 forKey:@"catalogDownloadedFromLive"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  [v19 encodeObject:v8 forKey:@"catalogLastTimeChecked"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
  [v19 encodeObject:v9 forKey:@"catalogPostedDate"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
  [v19 encodeObject:v10 forKey:@"requestedAutoAssetEntries"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
  [v19 encodeObject:v11 forKey:@"discoveredAtomicInstance"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
  [v19 encodeObject:v12 forKey:@"discoveredAtomicEntries"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  [v19 encodeObject:v13 forKey:@"latestDownloadedAtomicInstance"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  [v19 encodeObject:v14 forKey:@"latestDowloadedAtomicInstanceEntries"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
  [v19 encodeObject:v15 forKey:@"downloadedCatalogCachedAssetSetID"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  [v19 encodeObject:v16 forKey:@"downloadedCatalogDownloadedFromLive"];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
  [v19 encodeObject:v17 forKey:@"downloadedCatalogLastTimeChecked"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
  [v19 encodeObject:v18 forKey:@"downloadedCatalogPostedDate"];

  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem"),  @"isOnFilesystem");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete"),  @"onFilesystemIncomplete");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded"),  @"isDiscoveredFullyDownloaded");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified"),  @"atomicInstanceDownloadedNotified");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked"),  @"neverBeenLocked");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress"),  @"secureOperationInProgress");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating"),  @"secureOperationEliminating");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  objc_msgSend( v19,  "encodeInteger:forKey:",  -[MADAutoSetDescriptor downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v19,  "encodeInteger:forKey:",  -[MADAutoSetDescriptor downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  objc_msgSend( v19,  "encodeBool:forKey:",  -[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable"),  @"stagedPriorToAvailable");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)downloadedEntryForAssetType:(id)a3 forAssetSpecifier:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries](self, "latestDowloadedAtomicInstanceEntries"));
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      id v10 = 0LL;
      id v22 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v10);
        id v12 = p_ivars[155];
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v12, "stringIsEqual:to:", v14, v6) & 1) != 0)
        {
          v15 = p_ivars[155];
          uint64_t v16 = v8;
          uint64_t v17 = p_ivars;
          id v18 = v6;
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSpecifier]);
          LODWORD(v15) = -[__objc2_ivar_list stringIsEqual:to:](v15, "stringIsEqual:to:", v20, v23);

          id v6 = v18;
          p_ivars = v17;
          uint64_t v8 = v16;
          id v7 = v22;

          if ((_DWORD)v15)
          {
            id v7 = v11;
            goto LABEL_12;
          }
        }

        else
        {
        }

        id v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

- (id)newSummaryWithoutEntryID
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
  if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded"))
  {
    v135 = objc_alloc(&OBJC_CLASS___NSString);
    id v4 = @"N";
    uint64_t v161 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
    if (v161) {
      v5 = @"Y";
    }
    else {
      v5 = @"N";
    }
    v132 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
    id v126 = [v6 count];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
    id v123 = [v8 count];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
    id v117 = [v9 count];
    if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded")) {
      id v10 = @"Y";
    }
    else {
      id v10 = @"N";
    }
    v114 = v10;
    if (-[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified")) {
      uint64_t v11 = @"Y";
    }
    else {
      uint64_t v11 = @"N";
    }
    v111 = v11;
    if (-[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem")) {
      id v12 = @"Y";
    }
    else {
      id v12 = @"N";
    }
    v108 = v12;
    if (-[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete")) {
      id v13 = @"Y";
    }
    else {
      id v13 = @"N";
    }
    v105 = v13;
    if (-[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked")) {
      uint64_t v14 = @"Y";
    }
    else {
      uint64_t v14 = @"N";
    }
    v102 = v14;
    if (-[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress")) {
      v15 = @"Y";
    }
    else {
      v15 = @"N";
    }
    v96 = v15;
    if (-[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating")) {
      uint64_t v16 = @"Y";
    }
    else {
      uint64_t v16 = @"N";
    }
    v93 = v16;
    if (-[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
      uint64_t v17 = @"Y";
    }
    else {
      uint64_t v17 = @"N";
    }
    v90 = v17;
    if (-[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
      id v18 = @"Y";
    }
    else {
      id v18 = @"N";
    }
    v87 = v18;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
    if (v19) {
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
    }
    uint64_t v20 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
    if (v20) {
      v148 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
    }
    else {
      v148 = @"N";
    }
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
    v164 = (void *)v7;
    if (v121)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
      v147 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
    }

    else
    {
      v147 = @"N";
    }

    v129 = (void *)v20;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
    if (v100)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
      v145 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
    }

    else
    {
      v145 = @"N";
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
    v156 = v8;
    if (v51) {
      v142 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
    }
    else {
      v142 = @"N";
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
    v160 = v6;
    v150 = (void *)v19;
    if (v52) {
      v139 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
    }
    else {
      v139 = @"N";
    }
    objc_super v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
    v153 = v9;
    if (v53)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
    }

    else
    {
      v54 = @"N";
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:", v56));
      v58 = -[NSString initWithFormat:]( v135,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v132,  v126,  v164,  v123,  v117,  v114,  v111,  v108,  v105,  v102,  v96,  v93,  v90,  v87,  v4,  v148,  v147,  v145,  v142,  v139,  v54,  v57);
    }

    else
    {
      v58 = -[NSString initWithFormat:]( v135,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v132,  v126,  v7,  v123,  v117,  v114,  v111,  v108,  v105,  v102,  v96,  v93,  v90,  v87,  v4,  v148,  v147,  v145,  v142,  v139,  v54,  @"N");
    }

    v59 = v160;
    if (v53)
    {
    }

    v60 = v153;
    if (v52) {

    }
    v61 = (void *)v161;
    v62 = v150;
    if (v51) {

    }
    v63 = v156;
    if (v100)
    {
    }

    v37 = v129;
    if (v121)
    {
    }

    v64 = v164;
    if (v129)
    {
      v65 = (__CFString *)v148;
LABEL_198:
    }
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));

    v149 = objc_alloc(&OBJC_CLASS___NSString);
    id v4 = @"N";
    uint64_t v162 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
    if (v162) {
      id v22 = @"Y";
    }
    else {
      id v22 = @"N";
    }
    v146 = v22;
    v159 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
    id v144 = [v159 count];
    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicInstance](self, "discoveredAtomicInstance"));
    v163 = (void *)v23;
    if (v21)
    {
      if (v23) {
        v24 = @"Y";
      }
      else {
        v24 = @"N";
      }
      v124 = v24;
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
      id v120 = [v25 count];
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
      id v118 = [v26 count];
      if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded")) {
        __int128 v27 = @"Y";
      }
      else {
        __int128 v27 = @"N";
      }
      v115 = v27;
      if (-[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified")) {
        __int128 v28 = @"Y";
      }
      else {
        __int128 v28 = @"N";
      }
      v112 = v28;
      if (-[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem")) {
        objc_super v29 = @"Y";
      }
      else {
        objc_super v29 = @"N";
      }
      v109 = v29;
      if (-[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete")) {
        id v30 = @"Y";
      }
      else {
        id v30 = @"N";
      }
      v106 = v30;
      if (-[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked")) {
        uint64_t v31 = @"Y";
      }
      else {
        uint64_t v31 = @"N";
      }
      v103 = v31;
      if (-[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress")) {
        v32 = @"Y";
      }
      else {
        v32 = @"N";
      }
      v97 = v32;
      if (-[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating")) {
        uint64_t v33 = @"Y";
      }
      else {
        uint64_t v33 = @"N";
      }
      v94 = v33;
      if (-[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
        v34 = @"Y";
      }
      else {
        v34 = @"N";
      }
      v91 = v34;
      if (-[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
        id v35 = @"Y";
      }
      else {
        id v35 = @"N";
      }
      v88 = v35;
      uint64_t v36 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
      if (v36) {
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
      if (v37) {
        v138 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor catalogDownloadedFromLive]( self,  "catalogDownloadedFromLive"));
      }
      else {
        v138 = @"N";
      }
      v143 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
      if (v143)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
        v136 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v136 = @"N";
      }

      v154 = v26;
      v101 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
      if (v101)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
        v133 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v133 = @"N";
      }

      v66 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
      if (v66) {
        v130 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
      }
      else {
        v130 = @"N";
      }
      v67 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
      v151 = (void *)v36;
      if (v67) {
        v127 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
      }
      else {
        v127 = @"N";
      }
      v157 = v25;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
      v86 = v3;
      if (v68)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogLastTimeChecked]( self,  "downloadedCatalogLastTimeChecked"));
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v69 = @"N";
      }

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
      if (v70)
      {
        v71 = v37;
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v86, "stringFromDate:", v72));
        v58 = -[NSString initWithFormat:]( v149,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v146,  v144,  v124,  v120,  v118,  v115,  v112,  v109,  v106,  v103,  v97,  v94,  v91,  v88,  v4,  v138,  v136,  v133,  v130,  v127,  v69,  v73);

        v37 = v71;
      }

      else
      {
        v58 = -[NSString initWithFormat:]( v149,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v146,  v144,  v124,  v120,  v118,  v115,  v112,  v109,  v106,  v103,  v97,  v94,  v91,  v88,  v4,  v138,  v136,  v133,  v130,  v127,  v69,  @"N");
      }

      v59 = v159;
      if (v68)
      {
      }

      v3 = v86;
      if (v67) {

      }
      v61 = (void *)v162;
      v63 = v157;
      v62 = v151;
      if (v66) {

      }
      v64 = v163;
      if (v101)
      {
      }

      v60 = v154;
      if (v143)
      {
      }

      if (v37)
      {
        v65 = (__CFString *)v138;
        goto LABEL_198;
      }
    }

    else
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
      id v122 = [v38 count];
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
      id v116 = [v39 count];
      if (-[MADAutoSetDescriptor isDiscoveredFullyDownloaded](self, "isDiscoveredFullyDownloaded")) {
        id v40 = @"Y";
      }
      else {
        id v40 = @"N";
      }
      v113 = v40;
      if (-[MADAutoSetDescriptor atomicInstanceDownloadedNotified](self, "atomicInstanceDownloadedNotified")) {
        uint64_t v41 = @"Y";
      }
      else {
        uint64_t v41 = @"N";
      }
      v110 = v41;
      if (-[MADAutoSetDescriptor isOnFilesystem](self, "isOnFilesystem")) {
        id v42 = @"Y";
      }
      else {
        id v42 = @"N";
      }
      v107 = v42;
      if (-[MADAutoSetDescriptor onFilesystemIncomplete](self, "onFilesystemIncomplete")) {
        id v43 = @"Y";
      }
      else {
        id v43 = @"N";
      }
      v104 = v43;
      if (-[MADAutoSetDescriptor neverBeenLocked](self, "neverBeenLocked")) {
        uint64_t v44 = @"Y";
      }
      else {
        uint64_t v44 = @"N";
      }
      v99 = v44;
      if (-[MADAutoSetDescriptor secureOperationInProgress](self, "secureOperationInProgress")) {
        id v45 = @"Y";
      }
      else {
        id v45 = @"N";
      }
      v98 = v45;
      if (-[MADAutoSetDescriptor secureOperationEliminating](self, "secureOperationEliminating")) {
        id v46 = @"Y";
      }
      else {
        id v46 = @"N";
      }
      v95 = v46;
      if (-[MADAutoSetDescriptor downloadUserInitiated](self, "downloadUserInitiated")) {
        uint64_t v47 = @"Y";
      }
      else {
        uint64_t v47 = @"N";
      }
      v92 = v47;
      if (-[MADAutoSetDescriptor stagedPriorToAvailable](self, "stagedPriorToAvailable")) {
        v48 = @"Y";
      }
      else {
        v48 = @"N";
      }
      v89 = v48;
      uint64_t v49 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
      if (v49) {
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
      }
      uint64_t v50 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
      if (v50) {
        v141 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor catalogDownloadedFromLive]( self,  "catalogDownloadedFromLive"));
      }
      else {
        v141 = @"N";
      }
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
      v158 = v38;
      if (v119)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogLastTimeChecked](self, "catalogLastTimeChecked"));
        v140 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v140 = @"N";
      }

      v125 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
      v155 = v39;
      if (v125)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor catalogPostedDate](self, "catalogPostedDate"));
        v137 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v137 = @"N";
      }

      v74 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
      if (v74) {
        v134 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
      }
      else {
        v134 = @"N";
      }
      v75 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
      v152 = (void *)v49;
      if (v75) {
        v131 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
      }
      else {
        v131 = @"N";
      }
      v128 = (void *)v50;
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
      v77 = v3;
      if (v76)
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor downloadedCatalogLastTimeChecked]( self,  "downloadedCatalogLastTimeChecked"));
        v78 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
      }

      else
      {
        v78 = @"N";
      }

      v79 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
      if (v79)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v77, "stringFromDate:", v80));
        v58 = -[NSString initWithFormat:]( v149,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v146,  v144,  v163,  v122,  v116,  v113,  v110,  v107,  v104,  v99,  v98,  v95,  v92,  v89,  v4,  v141,  v140,  v137,  v134,  v131,  v78,  v81);
      }

      else
      {
        v58 = -[NSString initWithFormat:]( v149,  "initWithFormat:",  @"[instance latestDownloaded:%@(entries:%ld), discovered:%@(entries:%ld), requestedEntries:%ld, fullyDownloaded:%@(notified:%@) | onFilesystem:%@(incomplete:%@), neverBeenLocked:%@ | secureOperation(inProgress:%@), (elimintating:%@) | userInitiated:%@, stagedPrior:%@ | catalog(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@) | downloaded(cachedAssetSetID:%@), (downloadedFromLive:%@), (lastTimeChecked:%@), (postedDate:%@)]",  v146,  v144,  v163,  v122,  v116,  v113,  v110,  v107,  v104,  v99,  v98,  v95,  v92,  v89,  v4,  v141,  v140,  v137,  v134,  v131,  v78,  @"N");
      }

      v59 = v159;
      if (v76)
      {
      }

      v3 = v77;
      if (v75) {

      }
      v61 = (void *)v162;
      v62 = v152;
      v37 = v128;
      if (v74) {

      }
      v64 = v163;
      if (v125)
      {
      }

      v60 = v155;
      if (v119)
      {
      }

      v63 = v158;
      if (v128)
      {
        v65 = (__CFString *)v141;
        goto LABEL_198;
      }
    }
  }

  if (v62) {
  return v58;
  }
}

- (id)firstAssetType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoSetDescriptor latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor discoveredAtomicEntries](self, "discoveredAtomicEntries"));
    id v7 = [v6 count];

    if (!v7)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
      id v14 = [v13 count];

      if (!v14)
      {
        id v12 = @"EMPTY";
        return v12;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor requestedAutoAssetEntries](self, "requestedAutoAssetEntries"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSelector]);
        goto LABEL_7;
      }

- (NSArray)requestedAutoAssetEntries
{
  return self->_requestedAutoAssetEntries;
}

- (void)setRequestedAutoAssetEntries:(id)a3
{
}

- (BOOL)atomicInstanceDownloadedNotified
{
  return self->_atomicInstanceDownloadedNotified;
}

- (void)setAtomicInstanceDownloadedNotified:(BOOL)a3
{
  self->_atomicInstanceDownloadedNotified = a3;
}

- (BOOL)secureOperationInProgress
{
  return self->_secureOperationInProgress;
}

- (void)setSecureOperationInProgress:(BOOL)a3
{
  self->_secureOperationInProgress = a3;
}

- (BOOL)secureOperationEliminating
{
  return self->_secureOperationEliminating;
}

- (void)setSecureOperationEliminating:(BOOL)a3
{
  self->_secureOperationEliminating = a3;
}

@end