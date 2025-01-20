@interface MANAutoAssetSetStatus
+ (BOOL)supportsSecureCoding;
+ (id)_shortTermLockFilenameNormalizedComponent:(id)a3;
+ (id)newCurrentLockUsageDetailed:(id)a3;
+ (id)newCurrentLockUsageSummary:(id)a3;
+ (id)newSelectorsForStagingSummary:(id)a3;
+ (id)shortTermLockDirectory:(id)a3 forAssetSetIdentifier:(id)a4;
+ (id)shortTermLockFilename:(id)a3 forAssetSetIdentifier:(id)a4 forSetAtomicInstance:(id)a5;
- (BOOL)downloadUserInitiated;
- (BOOL)haveReceivedLookupResponse;
- (BOOL)vendingAtomicInstanceForConfiguredEntries;
- (MANAutoAssetSetNotifications)currentNotifications;
- (MANAutoAssetSetPolicy)currentNeedPolicy;
- (MANAutoAssetSetPolicy)schedulerPolicy;
- (MANAutoAssetSetPolicy)stagerPolicy;
- (MANAutoAssetSetProgress)downloadProgress;
- (MANAutoAssetSetStatus)initWithCoder:(id)a3;
- (NSArray)atomicInstancesDownloaded;
- (NSArray)configuredAssetEntries;
- (NSArray)latestDowloadedAtomicInstanceEntries;
- (NSArray)newerDiscoveredAtomicEntries;
- (NSDate)catalogLastTimeChecked;
- (NSDate)catalogPostedDate;
- (NSDate)downloadedCatalogLastTimeChecked;
- (NSDate)downloadedCatalogPostedDate;
- (NSDictionary)allDownloadedAtomicInstanceEntries;
- (NSDictionary)currentLockUsage;
- (NSDictionary)selectorsForStaging;
- (NSError)availableForUseError;
- (NSError)newerVersionError;
- (NSString)assetSetIdentifier;
- (NSString)catalogCachedAssetSetID;
- (NSString)clientDomainName;
- (NSString)downloadedCatalogCachedAssetSetID;
- (NSString)latestDownloadedAtomicInstance;
- (NSString)newerAtomicInstanceDiscovered;
- (NSURL)catalogDownloadedFromLive;
- (NSURL)downloadedCatalogDownloadedFromLive;
- (id)copy;
- (id)description;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withCurrentNotifications:(id)a15 withCurrentNeedPolicy:(id)a16 withSchedulerPolicy:(id)a17 withStagerPolicy:(id)a18 withDownloadUserInitiated:(BOOL)a19 withDownloadProgress:(id)a20 withDownloadedNetworkBytes:(int64_t)a21 withDownloadedFilesystemBytes:(int64_t)a22 withCurrentLockUsage:(id)a23 withSelectorsForStaging:(id)a24 withAvailableForUseError:(id)a25 withNewerVersionError:(id)a26;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 vendingAtomicInstanceForConfiguredEntries:(BOOL)a24 withDownloadUserInitiated:(BOOL)a25 withDownloadProgress:(id)a26 withDownloadedNetworkBytes:(int64_t)a27 withDownloadedFilesystemBytes:(int64_t)a28 withCurrentLockUsage:(id)a29 withSelectorsForStaging:(id)a30 withAvailableForUseError:(id)a31 withNewerVersionError:(id)a32;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 withDownloadUserInitiated:(BOOL)a24 withDownloadProgress:(id)a25 withDownloadedNetworkBytes:(int64_t)a26 withDownloadedFilesystemBytes:(int64_t)a27 withCurrentLockUsage:(id)a28 withSelectorsForStaging:(id)a29 withAvailableForUseError:(id)a30 withNewerVersionError:(id)a31;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 withDownloadUserInitiated:(BOOL)a23 withDownloadProgress:(id)a24 withDownloadedNetworkBytes:(int64_t)a25 withDownloadedFilesystemBytes:(int64_t)a26 withCurrentLockUsage:(id)a27 withSelectorsForStaging:(id)a28 withAvailableForUseError:(id)a29 withNewerVersionError:(id)a30;
- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withNewerAtomicInstanceDiscovered:(id)a7 withNewerDiscoveredAtomicEntries:(id)a8 withLatestDownloadedAtomicInstance:(id)a9 withLatestDowloadedAtomicInstanceEntries:(id)a10 withAllDownloadedAtomicInstanceEntries:(id)a11 withCurrentNotifications:(id)a12 withCurrentNeedPolicy:(id)a13 withSchedulerPolicy:(id)a14 withStagerPolicy:(id)a15 withDownloadUserInitiated:(BOOL)a16 withDownloadProgress:(id)a17 withDownloadedNetworkBytes:(int64_t)a18 withDownloadedFilesystemBytes:(int64_t)a19 withCurrentLockUsage:(id)a20 withSelectorsForStaging:(id)a21 withAvailableForUseError:(id)a22 withNewerVersionError:(id)a23;
- (id)summary;
- (int64_t)downloadedFilesystemBytes;
- (int64_t)downloadedNetworkBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setAllDownloadedAtomicInstanceEntries:(id)a3;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAtomicInstancesDownloaded:(id)a3;
- (void)setAvailableForUseError:(id)a3;
- (void)setCatalogCachedAssetSetID:(id)a3;
- (void)setCatalogDownloadedFromLive:(id)a3;
- (void)setCatalogLastTimeChecked:(id)a3;
- (void)setCatalogPostedDate:(id)a3;
- (void)setConfiguredAssetEntries:(id)a3;
- (void)setCurrentLockUsage:(id)a3;
- (void)setCurrentNeedPolicy:(id)a3;
- (void)setCurrentNotifications:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setDownloadUserInitiated:(BOOL)a3;
- (void)setDownloadedCatalogCachedAssetSetID:(id)a3;
- (void)setDownloadedCatalogDownloadedFromLive:(id)a3;
- (void)setDownloadedCatalogLastTimeChecked:(id)a3;
- (void)setDownloadedCatalogPostedDate:(id)a3;
- (void)setDownloadedFilesystemBytes:(int64_t)a3;
- (void)setDownloadedNetworkBytes:(int64_t)a3;
- (void)setHaveReceivedLookupResponse:(BOOL)a3;
- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3;
- (void)setLatestDownloadedAtomicInstance:(id)a3;
- (void)setNewerAtomicInstanceDiscovered:(id)a3;
- (void)setNewerDiscoveredAtomicEntries:(id)a3;
- (void)setNewerVersionError:(id)a3;
- (void)setSchedulerPolicy:(id)a3;
- (void)setSelectorsForStaging:(id)a3;
- (void)setStagerPolicy:(id)a3;
- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3;
@end

@implementation MANAutoAssetSetStatus

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

- (NSArray)latestDowloadedAtomicInstanceEntries
{
  return self->_latestDowloadedAtomicInstanceEntries;
}

- (MANAutoAssetSetNotifications)currentNotifications
{
  return self->_currentNotifications;
}

- (NSArray)atomicInstancesDownloaded
{
  return self->_atomicInstancesDownloaded;
}

- (void)setLatestDownloadedAtomicInstance:(id)a3
{
}

- (void)setLatestDowloadedAtomicInstanceEntries:(id)a3
{
}

- (void)setAvailableForUseError:(id)a3
{
}

- (void)setNewerVersionError:(id)a3
{
}

- (NSString)catalogCachedAssetSetID
{
  return self->_catalogCachedAssetSetID;
}

- (NSString)downloadedCatalogCachedAssetSetID
{
  return self->_downloadedCatalogCachedAssetSetID;
}

- (NSString)newerAtomicInstanceDiscovered
{
  return self->_newerAtomicInstanceDiscovered;
}

- (id)summary
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus clientDomainName](self, "clientDomainName"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries"));
  id v28 = [v32 count];
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded"));
  id v27 = [v31 count];
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered"));
  v34 = (void *)v3;
  if (v5) {
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus newerAtomicInstanceDiscovered]( self,  "newerAtomicInstanceDiscovered"));
  }
  else {
    v6 = @"N";
  }
  v26 = (void *)v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries"));
  id v25 = [v29 count];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  v33 = (void *)v4;
  v30 = v6;
  if (v7) {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  }
  else {
    v8 = @"N";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v10 = [v9 count];
  v11 = @"Y";
  if (-[MANAutoAssetSetStatus haveReceivedLookupResponse](self, "haveReceivedLookupResponse")) {
    v12 = @"Y";
  }
  else {
    v12 = @"N";
  }
  if (-[MANAutoAssetSetStatus vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"))
  {
    v13 = @"Y";
  }

  else
  {
    v13 = @"N";
  }

  if (!-[MANAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated")) {
    v11 = @"N";
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentLockUsage](self, "currentLockUsage"));
  if (v14)
  {
    id v15 = +[MANAutoAssetSetStatus newCurrentLockUsageSummary:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "newCurrentLockUsageSummary:",  self);
    v23 = v11;
    v21 = v13;
    v16 = (__CFString *)v30;
    v17 = v33;
    v18 = v34;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|lookupRsp:%@(forConfig:%@)|user:%@|locks:%@]",  v34,  v33,  v28,  v27,  v30,  v25,  v8,  v10,  v12,  v21,  v23,  v15));
  }

  else
  {
    v24 = v11;
    v22 = v13;
    v16 = (__CFString *)v30;
    v17 = v33;
    v18 = v34;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[domain:%@|setID:%@|config:%ld|AIs:%ld(newer:%@[%ld])(latest:%@[%ld])|lookupRsp:%@(forConfig:%@)|user:%@|locks:%@]",  v34,  v33,  v28,  v27,  v30,  v25,  v8,  v10,  v12,  v22,  v24,  @"N"));
  }

  if (v7) {
  if (v26)
  }

  return v19;
}

- (NSArray)configuredAssetEntries
{
  return self->_configuredAssetEntries;
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

- (NSArray)newerDiscoveredAtomicEntries
{
  return self->_newerDiscoveredAtomicEntries;
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

- (MANAutoAssetSetPolicy)currentNeedPolicy
{
  return self->_currentNeedPolicy;
}

- (MANAutoAssetSetPolicy)schedulerPolicy
{
  return self->_schedulerPolicy;
}

- (MANAutoAssetSetPolicy)stagerPolicy
{
  return self->_stagerPolicy;
}

- (BOOL)downloadUserInitiated
{
  return self->_downloadUserInitiated;
}

- (MANAutoAssetSetProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (int64_t)downloadedNetworkBytes
{
  return self->_downloadedNetworkBytes;
}

- (int64_t)downloadedFilesystemBytes
{
  return self->_downloadedFilesystemBytes;
}

- (NSDictionary)currentLockUsage
{
  return self->_currentLockUsage;
}

+ (id)newCurrentLockUsageSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);

  if (v4)
  {
    uint64_t v4 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{");
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
    id v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v21 = *(void *)v30;
      id v22 = v3;
      char v5 = 1;
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = v6;
          uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
          id v9 = [v8 safeObjectForKey:v7 ofClass:objc_opt_class(NSDictionary)];
          id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          id v11 = v10;
          id v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v26;
            char v15 = v5;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v26 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
                id v18 = [v11 safeIntegerForKey:v17];
                if ((v15 & 1) == 0) {
                  -[NSMutableString appendString:](v4, "appendString:", @",");
                }
                -[NSMutableString appendFormat:]( v4,  "appendFormat:",  @"[lockReason:%@ atomicInstance:%@ lockCount:%ld]",  v7,  v17,  v18);
                char v15 = 0;
              }

              id v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
              char v15 = 0;
              char v5 = 0;
            }

            while (v13);
          }

          uint64_t v6 = v24 + 1;
          id v3 = v22;
        }

        while ((id)(v24 + 1) != v23);
        id v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v23);
    }

    -[NSMutableString appendString:](v4, "appendString:", @"}");
  }

  return v4;
}

- (NSDictionary)selectorsForStaging
{
  return self->_selectorsForStaging;
}

- (NSError)availableForUseError
{
  return self->_availableForUseError;
}

- (NSError)newerVersionError
{
  return self->_newerVersionError;
}

- (void).cxx_destruct
{
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withNewerAtomicInstanceDiscovered:(id)a7 withNewerDiscoveredAtomicEntries:(id)a8 withLatestDownloadedAtomicInstance:(id)a9 withLatestDowloadedAtomicInstanceEntries:(id)a10 withAllDownloadedAtomicInstanceEntries:(id)a11 withCurrentNotifications:(id)a12 withCurrentNeedPolicy:(id)a13 withSchedulerPolicy:(id)a14 withStagerPolicy:(id)a15 withDownloadUserInitiated:(BOOL)a16 withDownloadProgress:(id)a17 withDownloadedNetworkBytes:(int64_t)a18 withDownloadedFilesystemBytes:(int64_t)a19 withCurrentLockUsage:(id)a20 withSelectorsForStaging:(id)a21 withAvailableForUseError:(id)a22 withNewerVersionError:(id)a23
{
  BYTE2(v24) = a16;
  LOWORD(v24) = 0;
  return -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( self,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntri es:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:wi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL,  0LL,  a7,  a8,  a9,  a10,  0LL,  0LL,  0LL,  0LL,  a12,  a13,  a14,  a15,  v24,  a17,  a18,  a19,  a20,  a21,  a22,  a23);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withCurrentNotifications:(id)a15 withCurrentNeedPolicy:(id)a16 withSchedulerPolicy:(id)a17 withStagerPolicy:(id)a18 withDownloadUserInitiated:(BOOL)a19 withDownloadProgress:(id)a20 withDownloadedNetworkBytes:(int64_t)a21 withDownloadedFilesystemBytes:(int64_t)a22 withCurrentLockUsage:(id)a23 withSelectorsForStaging:(id)a24 withAvailableForUseError:(id)a25 withNewerVersionError:(id)a26
{
  id v59 = a3;
  id v41 = a4;
  id v58 = a4;
  id v42 = a5;
  id v57 = a5;
  id v43 = a6;
  id v56 = a6;
  id v55 = a7;
  id v54 = a8;
  id v53 = a9;
  id v52 = a10;
  id v51 = a11;
  id v50 = a12;
  id v49 = a13;
  id v48 = a14;
  id v47 = a15;
  id v31 = a16;
  id v32 = a17;
  id v33 = a18;
  id v34 = a20;
  id v35 = a23;
  id v36 = a24;
  id v46 = a25;
  id v45 = a26;
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetStatus;
  v37 = -[MANAutoAssetSetStatus init](&v60, "init");
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_clientDomainName, a3);
    objc_storeStrong((id *)&v38->_assetSetIdentifier, v41);
    objc_storeStrong((id *)&v38->_configuredAssetEntries, v42);
    objc_storeStrong((id *)&v38->_atomicInstancesDownloaded, v43);
    objc_storeStrong((id *)&v38->_catalogCachedAssetSetID, a7);
    objc_storeStrong((id *)&v38->_catalogDownloadedFromLive, a8);
    objc_storeStrong((id *)&v38->_catalogLastTimeChecked, a9);
    objc_storeStrong((id *)&v38->_catalogPostedDate, a10);
    objc_storeStrong((id *)&v38->_newerAtomicInstanceDiscovered, a11);
    objc_storeStrong((id *)&v38->_newerDiscoveredAtomicEntries, a12);
    objc_storeStrong((id *)&v38->_latestDownloadedAtomicInstance, a13);
    objc_storeStrong((id *)&v38->_latestDowloadedAtomicInstanceEntries, a14);
    objc_storeStrong((id *)&v38->_currentNotifications, a15);
    objc_storeStrong((id *)&v38->_currentNeedPolicy, a16);
    objc_storeStrong((id *)&v38->_schedulerPolicy, a17);
    objc_storeStrong((id *)&v38->_stagerPolicy, a18);
    v38->_downloadUserInitiated = a19;
    objc_storeStrong((id *)&v38->_downloadProgress, a20);
    v38->_downloadedNetworkBytes = a21;
    v38->_downloadedFilesystemBytes = a22;
    objc_storeStrong((id *)&v38->_currentLockUsage, a23);
    objc_storeStrong((id *)&v38->_selectorsForStaging, a24);
    objc_storeStrong((id *)&v38->_availableForUseError, a25);
    objc_storeStrong((id *)&v38->_newerVersionError, a26);
  }

  return v38;
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 withDownloadUserInitiated:(BOOL)a23 withDownloadProgress:(id)a24 withDownloadedNetworkBytes:(int64_t)a25 withDownloadedFilesystemBytes:(int64_t)a26 withCurrentLockUsage:(id)a27 withSelectorsForStaging:(id)a28 withAvailableForUseError:(id)a29 withNewerVersionError:(id)a30
{
  return -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( self,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntri es:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:wi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  a3,  a4,  a5,  a6,  a7,  a8);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 withDownloadUserInitiated:(BOOL)a24 withDownloadProgress:(id)a25 withDownloadedNetworkBytes:(int64_t)a26 withDownloadedFilesystemBytes:(int64_t)a27 withCurrentLockUsage:(id)a28 withSelectorsForStaging:(id)a29 withAvailableForUseError:(id)a30 withNewerVersionError:(id)a31
{
  return -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( self,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:with CatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNe werAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDow loadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:wit hDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPol icy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntri es:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:wi thCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  a3,  a4,  a5,  a6,  a7,  a8);
}

- (id)initStatusForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 withConfiguredAssetEntries:(id)a5 withAtomicInstancesDownloaded:(id)a6 withCatalogCachedAssetSetID:(id)a7 withCatalogDownloadedFromLive:(id)a8 withCatalogLastTimeChecked:(id)a9 withCatalogPostedDate:(id)a10 withNewerAtomicInstanceDiscovered:(id)a11 withNewerDiscoveredAtomicEntries:(id)a12 withLatestDownloadedAtomicInstance:(id)a13 withLatestDowloadedAtomicInstanceEntries:(id)a14 withDownloadedCatalogCachedAssetSetID:(id)a15 withDownloadedCatalogDownloadedFromLive:(id)a16 withDownloadedCatalogLastTimeChecked:(id)a17 withDownloadedCatalogPostedDate:(id)a18 withCurrentNotifications:(id)a19 withCurrentNeedPolicy:(id)a20 withSchedulerPolicy:(id)a21 withStagerPolicy:(id)a22 havingReceivedLookupResponse:(BOOL)a23 vendingAtomicInstanceForConfiguredEntries:(BOOL)a24 withDownloadUserInitiated:(BOOL)a25 withDownloadProgress:(id)a26 withDownloadedNetworkBytes:(int64_t)a27 withDownloadedFilesystemBytes:(int64_t)a28 withCurrentLockUsage:(id)a29 withSelectorsForStaging:(id)a30 withAvailableForUseError:(id)a31 withNewerVersionError:(id)a32
{
  id v69 = a3;
  id v48 = a4;
  id v68 = a4;
  id v49 = a5;
  id v67 = a5;
  id v66 = a6;
  id v65 = a7;
  id v50 = a8;
  id v64 = a8;
  id v63 = a9;
  id v62 = a10;
  id v61 = a11;
  id v60 = a12;
  id v59 = a13;
  id v58 = a14;
  id v57 = a15;
  id v56 = a16;
  id v55 = a17;
  id v37 = a18;
  id v38 = a19;
  id v39 = a20;
  id v40 = a21;
  id v41 = a22;
  id v42 = a26;
  id v43 = a29;
  id v54 = a30;
  id v53 = a31;
  id v52 = a32;
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetStatus;
  v44 = -[MANAutoAssetSetStatus init](&v70, "init");
  id v45 = v44;
  if (v44)
  {
    objc_storeStrong((id *)&v44->_clientDomainName, a3);
    objc_storeStrong((id *)&v45->_assetSetIdentifier, v48);
    objc_storeStrong((id *)&v45->_configuredAssetEntries, v49);
    objc_storeStrong((id *)&v45->_atomicInstancesDownloaded, a6);
    objc_storeStrong((id *)&v45->_catalogCachedAssetSetID, a7);
    objc_storeStrong((id *)&v45->_catalogDownloadedFromLive, v50);
    objc_storeStrong((id *)&v45->_catalogLastTimeChecked, a9);
    objc_storeStrong((id *)&v45->_catalogPostedDate, a10);
    objc_storeStrong((id *)&v45->_newerAtomicInstanceDiscovered, a11);
    objc_storeStrong((id *)&v45->_newerDiscoveredAtomicEntries, a12);
    objc_storeStrong((id *)&v45->_latestDownloadedAtomicInstance, a13);
    objc_storeStrong((id *)&v45->_latestDowloadedAtomicInstanceEntries, a14);
    objc_storeStrong((id *)&v45->_downloadedCatalogCachedAssetSetID, a15);
    objc_storeStrong((id *)&v45->_downloadedCatalogDownloadedFromLive, a16);
    objc_storeStrong((id *)&v45->_downloadedCatalogLastTimeChecked, a17);
    objc_storeStrong((id *)&v45->_downloadedCatalogPostedDate, a18);
    objc_storeStrong((id *)&v45->_currentNotifications, a19);
    objc_storeStrong((id *)&v45->_currentNeedPolicy, a20);
    objc_storeStrong((id *)&v45->_schedulerPolicy, a21);
    objc_storeStrong((id *)&v45->_stagerPolicy, a22);
    v45->_haveReceivedLookupResponse = a23;
    v45->_vendingAtomicInstanceForConfiguredEntries = a24;
    v45->_downloadUserInitiated = a25;
    objc_storeStrong((id *)&v45->_downloadProgress, a26);
    v45->_downloadedNetworkBytes = a27;
    v45->_downloadedFilesystemBytes = a28;
    objc_storeStrong((id *)&v45->_currentLockUsage, a29);
    objc_storeStrong((id *)&v45->_selectorsForStaging, a30);
    objc_storeStrong((id *)&v45->_availableForUseError, a31);
    objc_storeStrong((id *)&v45->_newerVersionError, a32);
  }

  return v45;
}

- (MANAutoAssetSetStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetStatus;
  char v5 = -[MANAutoAssetSetStatus init](&v87, "init");
  if (v5)
  {
    v92[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v92[1] = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v92, 2LL));
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    v91[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v91[1] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
    v91[2] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v91[3] = objc_opt_class(&OBJC_CLASS___NSString);
    v91[4] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v91, 5LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

    v90[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v90[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v90[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 3LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));

    v89[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v89[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v89[2] = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    v89[3] = objc_opt_class(&OBJC_CLASS___NSString);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v89, 4LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientDomainName"];
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"assetSetIdentifier"];
    uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v17;

    v19 = objc_alloc(&OBJC_CLASS___NSSet);
    v88[0] = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetEntry);
    v88[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v88[2] = objc_opt_class(&OBJC_CLASS___NSArray);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 3LL));
    uint64_t v21 = -[NSSet initWithArray:](v19, "initWithArray:", v20);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v21 forKey:@"configuredAssetEntries"]);
    configuredAssetEntries = v5->_configuredAssetEntries;
    v5->_configuredAssetEntries = (NSArray *)v22;

    uint64_t v24 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v86 forKey:@"atomicInstancesDownloaded"]);
    atomicInstancesDownloaded = v5->_atomicInstancesDownloaded;
    v5->_atomicInstancesDownloaded = (NSArray *)v24;

    id v26 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"catalogCachedAssetSetID"];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
    catalogCachedAssetSetID = v5->_catalogCachedAssetSetID;
    v5->_catalogCachedAssetSetID = (NSString *)v27;

    id v29 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"catalogDownloadedFromLive"];
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
    catalogDownloadedFromLive = v5->_catalogDownloadedFromLive;
    v5->_catalogDownloadedFromLive = (NSURL *)v30;

    id v32 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogLastTimeChecked"];
    uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
    catalogLastTimeChecked = v5->_catalogLastTimeChecked;
    v5->_catalogLastTimeChecked = (NSDate *)v33;

    id v35 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"catalogPostedDate"];
    uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
    catalogPostedDate = v5->_catalogPostedDate;
    v5->_catalogPostedDate = (NSDate *)v36;

    id v38 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"newerAtomicInstanceDiscovered"];
    uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
    newerAtomicInstanceDiscovered = v5->_newerAtomicInstanceDiscovered;
    v5->_newerAtomicInstanceDiscovered = (NSString *)v39;

    uint64_t v41 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"newerDiscoveredAtomicEntries"]);
    newerDiscoveredAtomicEntries = v5->_newerDiscoveredAtomicEntries;
    v5->_newerDiscoveredAtomicEntries = (NSArray *)v41;

    id v43 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"latestDownloadedAtomicInstance"];
    uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
    latestDownloadedAtomicInstance = v5->_latestDownloadedAtomicInstance;
    v5->_latestDownloadedAtomicInstance = (NSString *)v44;

    uint64_t v46 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"latestDowloadedAtomicInstanceEntries"]);
    latestDowloadedAtomicInstanceEntries = v5->_latestDowloadedAtomicInstanceEntries;
    v5->_latestDowloadedAtomicInstanceEntries = (NSArray *)v46;

    id v48 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"downloadedCatalogCachedAssetSetID"];
    uint64_t v49 = objc_claimAutoreleasedReturnValue(v48);
    downloadedCatalogCachedAssetSetID = v5->_downloadedCatalogCachedAssetSetID;
    v5->_downloadedCatalogCachedAssetSetID = (NSString *)v49;

    id v51 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"downloadedCatalogDownloadedFromLive"];
    uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
    downloadedCatalogDownloadedFromLive = v5->_downloadedCatalogDownloadedFromLive;
    v5->_downloadedCatalogDownloadedFromLive = (NSURL *)v52;

    id v54 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"downloadedCatalogLastTimeChecked"];
    uint64_t v55 = objc_claimAutoreleasedReturnValue(v54);
    downloadedCatalogLastTimeChecked = v5->_downloadedCatalogLastTimeChecked;
    v5->_downloadedCatalogLastTimeChecked = (NSDate *)v55;

    id v57 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"downloadedCatalogPostedDate"];
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);
    downloadedCatalogPostedDate = v5->_downloadedCatalogPostedDate;
    v5->_downloadedCatalogPostedDate = (NSDate *)v58;

    id v60 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetNotifications) forKey:@"currentNotifications"];
    uint64_t v61 = objc_claimAutoreleasedReturnValue(v60);
    currentNotifications = v5->_currentNotifications;
    v5->_currentNotifications = (MANAutoAssetSetNotifications *)v61;

    id v63 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"currentNeedPolicy"];
    uint64_t v64 = objc_claimAutoreleasedReturnValue(v63);
    currentNeedPolicy = v5->_currentNeedPolicy;
    v5->_currentNeedPolicy = (MANAutoAssetSetPolicy *)v64;

    id v66 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"schedulerPolicy"];
    uint64_t v67 = objc_claimAutoreleasedReturnValue(v66);
    schedulerPolicy = v5->_schedulerPolicy;
    v5->_schedulerPolicy = (MANAutoAssetSetPolicy *)v67;

    id v69 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetPolicy) forKey:@"stagerPolicy"];
    uint64_t v70 = objc_claimAutoreleasedReturnValue(v69);
    stagerPolicy = v5->_stagerPolicy;
    v5->_stagerPolicy = (MANAutoAssetSetPolicy *)v70;

    v5->_haveReceivedLookupResponse = [v4 decodeBoolForKey:@"haveReceivedLookupResponse"];
    v5->_vendingAtomicInstanceForConfiguredEntries = [v4 decodeBoolForKey:@"vendingAtomicInstanceForConfiguredEntries"];
    v5->_downloadUserInitiated = [v4 decodeBoolForKey:@"downloadUserInitiated"];
    id v72 = [v4 decodeObjectOfClass:objc_opt_class(MANAutoAssetSetProgress) forKey:@"downloadProgress"];
    uint64_t v73 = objc_claimAutoreleasedReturnValue(v72);
    downloadProgress = v5->_downloadProgress;
    v5->_downloadProgress = (MANAutoAssetSetProgress *)v73;

    v5->_downloadedNetworkBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedNetworkBytes"];
    v5->_downloadedFilesystemBytes = (int64_t)[v4 decodeIntegerForKey:@"downloadedFilesystemBytes"];
    uint64_t v75 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"currentLockUsage"]);
    currentLockUsage = v5->_currentLockUsage;
    v5->_currentLockUsage = (NSDictionary *)v75;

    uint64_t v77 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"selectorsForStaging"]);
    selectorsForStaging = v5->_selectorsForStaging;
    v5->_selectorsForStaging = (NSDictionary *)v77;

    id v79 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"availableForUseError"];
    uint64_t v80 = objc_claimAutoreleasedReturnValue(v79);
    availableForUseError = v5->_availableForUseError;
    v5->_availableForUseError = (NSError *)v80;

    id v82 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"newerVersionError"];
    uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);
    newerVersionError = v5->_newerVersionError;
    v5->_newerVersionError = (NSError *)v83;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus clientDomainName](self, "clientDomainName"));
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier"));
  [v4 encodeObject:v6 forKey:@"assetSetIdentifier"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries"));
  [v4 encodeObject:v7 forKey:@"configuredAssetEntries"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded"));
  [v4 encodeObject:v8 forKey:@"atomicInstancesDownloaded"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  [v4 encodeObject:v9 forKey:@"catalogCachedAssetSetID"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  [v4 encodeObject:v10 forKey:@"catalogDownloadedFromLive"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  [v4 encodeObject:v11 forKey:@"catalogLastTimeChecked"];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate"));
  [v4 encodeObject:v12 forKey:@"catalogPostedDate"];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered"));
  [v4 encodeObject:v13 forKey:@"newerAtomicInstanceDiscovered"];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries"));
  [v4 encodeObject:v14 forKey:@"newerDiscoveredAtomicEntries"];

  char v15 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  [v4 encodeObject:v15 forKey:@"latestDownloadedAtomicInstance"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  [v4 encodeObject:v16 forKey:@"latestDowloadedAtomicInstanceEntries"];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
  [v4 encodeObject:v17 forKey:@"downloadedCatalogCachedAssetSetID"];

  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  [v4 encodeObject:v18 forKey:@"downloadedCatalogDownloadedFromLive"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
  [v4 encodeObject:v19 forKey:@"downloadedCatalogLastTimeChecked"];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
  [v4 encodeObject:v20 forKey:@"downloadedCatalogPostedDate"];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNotifications](self, "currentNotifications"));
  [v4 encodeObject:v21 forKey:@"currentNotifications"];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy"));
  [v4 encodeObject:v22 forKey:@"currentNeedPolicy"];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy"));
  [v4 encodeObject:v23 forKey:@"schedulerPolicy"];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus stagerPolicy](self, "stagerPolicy"));
  [v4 encodeObject:v24 forKey:@"stagerPolicy"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetStatus haveReceivedLookupResponse](self, "haveReceivedLookupResponse"),  @"haveReceivedLookupResponse");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetStatus vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"),  @"vendingAtomicInstanceForConfiguredEntries");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated"),  @"downloadUserInitiated");
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadProgress](self, "downloadProgress"));
  [v4 encodeObject:v25 forKey:@"downloadProgress"];

  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes"),  @"downloadedNetworkBytes");
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[MANAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes"),  @"downloadedFilesystemBytes");
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentLockUsage](self, "currentLockUsage"));
  [v4 encodeObject:v26 forKey:@"currentLockUsage"];

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging"));
  [v4 encodeObject:v27 forKey:@"selectorsForStaging"];

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus availableForUseError](self, "availableForUseError"));
  [v4 encodeObject:v28 forKey:@"availableForUseError"];

  id v29 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerVersionError](self, "newerVersionError"));
  [v4 encodeObject:v29 forKey:@"newerVersionError"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  id v26 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus clientDomainName](self, "clientDomainName"));
  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries"));
  id v44 = [v32 copy];
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded"));
  id v43 = [v31 copy];
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries"));
  id v37 = [v30 copy];
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  id v36 = [v29 copy];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  id v35 = [v28 copy];
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNotifications](self, "currentNotifications"));
  id v16 = [v25 copy];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy"));
  id v18 = [v24 copy];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy"));
  id v17 = [v23 copy];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus stagerPolicy](self, "stagerPolicy"));
  id v15 = [v22 copy];
  unsigned __int8 v14 = -[MANAutoAssetSetStatus haveReceivedLookupResponse](self, "haveReceivedLookupResponse");
  unsigned __int8 v3 = -[MANAutoAssetSetStatus vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries");
  unsigned __int8 v4 = -[MANAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadProgress](self, "downloadProgress"));
  id v5 = [v19 copy];
  int64_t v6 = -[MANAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v7 = -[MANAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentLockUsage](self, "currentLockUsage"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus availableForUseError](self, "availableForUseError"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerVersionError](self, "newerVersionError"));
  BYTE2(v13) = v4;
  BYTE1(v13) = v3;
  LOBYTE(v13) = v14;
  id v27 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v26,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withC atalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewe rAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloa dedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDow nloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:w ithSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:wit hDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurre ntLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v46,  v45,  v44,  v43,  v42,  v39,  v41,  v40,  v38,  v37,  v36,  v35,  v34,  v33,  v21,  v20,  v16,  v18,  v17,  v15,  v13,  v5,  v6,  v7,  v8,  v9,  v10,  v11);

  return v27;
}

- (id)description
{
  unsigned __int8 v3 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v3, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus clientDomainName](self, "clientDomainName"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus assetSetIdentifier](self, "assetSetIdentifier"));
  id v57 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries"));
  if (v57)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSString);
    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus configuredAssetEntries](self, "configuredAssetEntries"));
    v78 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%ld", [v44 count]);
  }

  else
  {
    v78 = @"N";
  }

  id v56 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded"));
  if (v56)
  {
    int64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus atomicInstancesDownloaded](self, "atomicInstancesDownloaded"));
    uint64_t v77 = -[NSString initWithFormat:](v6, "initWithFormat:", @"%ld", [v43 count]);
  }

  else
  {
    uint64_t v77 = @"N";
  }

  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  if (v55) {
    v76 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogCachedAssetSetID](self, "catalogCachedAssetSetID"));
  }
  else {
    v76 = @"N";
  }
  id v54 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
  if (v54)
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogDownloadedFromLive](self, "catalogDownloadedFromLive"));
    uint64_t v75 = (__CFString *)objc_claimAutoreleasedReturnValue([v42 path]);
  }

  else
  {
    uint64_t v75 = @"N";
  }

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked"));
  if (v7)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogLastTimeChecked](self, "catalogLastTimeChecked"));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    v74 = @"N";
  }

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate"));
  if (v8)
  {
    id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus catalogPostedDate](self, "catalogPostedDate"));
    uint64_t v73 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    uint64_t v73 = @"N";
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered"));
  if (v9) {
    id v72 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerAtomicInstanceDiscovered](self, "newerAtomicInstanceDiscovered"));
  }
  else {
    id v72 = @"N";
  }
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries"));
  if (v88)
  {
    id v10 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerDiscoveredAtomicEntries](self, "newerDiscoveredAtomicEntries"));
    v71 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%ld", [v39 count]);
  }

  else
  {
    v71 = @"N";
  }

  objc_super v87 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus latestDownloadedAtomicInstance](self, "latestDownloadedAtomicInstance"));
  if (v87) {
    uint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDownloadedAtomicInstance]( self,  "latestDownloadedAtomicInstance"));
  }
  else {
    uint64_t v70 = @"N";
  }
  v86 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
  if (v86)
  {
    id v11 = objc_alloc(&OBJC_CLASS___NSString);
    id v38 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus latestDowloadedAtomicInstanceEntries]( self,  "latestDowloadedAtomicInstanceEntries"));
    id v69 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%ld", [v38 count]);
  }

  else
  {
    id v69 = @"N";
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self, "downloadedCatalogCachedAssetSetID"));
  if (v85) {
    id v68 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus downloadedCatalogCachedAssetSetID]( self,  "downloadedCatalogCachedAssetSetID"));
  }
  else {
    id v68 = @"N";
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  if (v84) {
    uint64_t v67 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MANAutoAssetSetStatus downloadedCatalogDownloadedFromLive]( self,  "downloadedCatalogDownloadedFromLive"));
  }
  else {
    uint64_t v67 = @"N";
  }
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
  if (v83)
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogLastTimeChecked](self, "downloadedCatalogLastTimeChecked"));
    id v66 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    id v66 = @"N";
  }

  id v82 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
  if (v82)
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadedCatalogPostedDate](self, "downloadedCatalogPostedDate"));
    id v65 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v3, "stringFromDate:"));
  }

  else
  {
    id v65 = @"N";
  }

  id v50 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNotifications](self, "currentNotifications"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v50 summary]);
  uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy"));
  if (v80)
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentNeedPolicy](self, "currentNeedPolicy"));
    uint64_t v64 = (__CFString *)objc_claimAutoreleasedReturnValue([v35 summary]);
  }

  else
  {
    uint64_t v64 = @"N";
  }

  id v79 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy"));
  id v53 = (void *)v7;
  if (v79)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus schedulerPolicy](self, "schedulerPolicy"));
    id v63 = (__CFString *)objc_claimAutoreleasedReturnValue([v34 summary]);
  }

  else
  {
    id v63 = @"N";
  }

  id v12 = @"N";
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus stagerPolicy](self, "stagerPolicy"));
  if (v49)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus stagerPolicy](self, "stagerPolicy"));
    id v62 = (__CFString *)objc_claimAutoreleasedReturnValue([v33 summary]);
  }

  else
  {
    id v62 = @"N";
  }

  if (-[MANAutoAssetSetStatus haveReceivedLookupResponse](self, "haveReceivedLookupResponse")) {
    uint64_t v13 = @"Y";
  }
  else {
    uint64_t v13 = @"N";
  }
  id v47 = v13;
  if (-[MANAutoAssetSetStatus vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries"))
  {
    unsigned __int8 v14 = @"Y";
  }

  else
  {
    unsigned __int8 v14 = @"N";
  }

  uint64_t v46 = v14;
  if (-[MANAutoAssetSetStatus downloadUserInitiated](self, "downloadUserInitiated")) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  id v45 = v15;
  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadProgress](self, "downloadProgress"));
  uint64_t v58 = (void *)v4;
  id v59 = v3;
  if (v48)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus downloadProgress](self, "downloadProgress"));
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v32 description]);
  }

  int64_t v16 = -[MANAutoAssetSetStatus downloadedNetworkBytes](self, "downloadedNetworkBytes");
  int64_t v17 = -[MANAutoAssetSetStatus downloadedFilesystemBytes](self, "downloadedFilesystemBytes");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus currentLockUsage](self, "currentLockUsage"));
  if (v18) {
    uint64_t v61 = +[MANAutoAssetSetStatus newCurrentLockUsageSummary:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "newCurrentLockUsageSummary:",  self);
  }
  else {
    uint64_t v61 = @"N";
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus selectorsForStaging](self, "selectorsForStaging"));
  if (v19) {
    id v60 = +[MANAutoAssetSetStatus newSelectorsForStagingSummary:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "newSelectorsForStagingSummary:",  self);
  }
  else {
    id v60 = @"N";
  }
  id v51 = (void *)v9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus availableForUseError](self, "availableForUseError"));
  uint64_t v52 = (void *)v8;
  if (v20)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus availableForUseError](self, "availableForUseError"));
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v31 checkedSummary]);
  }

  else
  {
    uint64_t v21 = @"N";
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerVersionError](self, "newerVersionError"));
  if (v22)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetStatus newerVersionError](self, "newerVersionError"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 checkedSummary]);
    int64_t v29 = v16;
    __int128 v25 = v58;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                currentSchedulerPolicy: %@\n                   currentStagerPolicy: %@\n            haveReceivedLookupResponse: %@\n vendingAtomicInstanceForConfigEntries: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage:\n%@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n",  v58,  v89,  v78,  v77,  v76,  v75,  v74,  v73,  v72,  v71,  v70,  v69,  v68,  v67,  v66,  v65,  v81,  v64,  v63,  v62,  v47,  v46,  v45,  v12,  v29,  v17,  v61,  v60,  v21,  v24));
  }

  else
  {
    int64_t v30 = v16;
    __int128 v25 = v58;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"                      clientDomainName: %@\n                    assetSetIdentifier: %@\n                configuredAssetEntries: %@\n             atomicInstancesDownloaded: %@\n               catalogCachedAssetSetID: %@\n             catalogDownloadedFromLive: %@\n                catalogLastTimeChecked: %@\n                     catalogPostedDate: %@\n         newerAtomicInstanceDiscovered: %@\n          newerDiscoveredAtomicEntries: %@\n              latestDownloadedInstance: %@\n        latestDowloadedInstanceEntries: %@\n     downloadedCatalogCachedAssetSetID: %@\n   downloadedCatalogDownloadedFromLive: %@\n      downloadedCatalogLastTimeChecked: %@\n           downloadedCatalogPostedDate: %@\n                  currentNotifications: %@\n                     currentNeedPolicy: %@\n                currentSchedulerPolicy: %@\n                   currentStagerPolicy: %@\n            haveReceivedLookupResponse: %@\n vendingAtomicInstanceForConfigEntries: %@\n                 downloadUserInitiated: %@\n                      downloadProgress:\n%@\n                downloadedNetworkBytes: %ld\n             downloadedFilesystemBytes: %ld\n                      currentLockUsage:\n%@\n                   selectorsForStaging: %@\n                  availableForUseError: %@\n                     newerVersionError: %@\n",  v58,  v89,  v78,  v77,  v76,  v75,  v74,  v73,  v72,  v71,  v70,  v69,  v68,  v67,  v66,  v65,  v81,  v64,  v63,  v62,  v47,  v46,  v45,  v12,  v30,  v17,  v61,  v60,  v21,  @"N"));
  }

  if (v20)
  {
  }

  if (v19) {
  if (v18)
  }

  if (v48)
  {
  }

  if (v49)
  {
  }

  if (v79)
  {
  }

  if (v80)
  {
  }

  if (v82)
  {
  }

  if (v83)
  {
  }

  if (v84) {
  if (v85)
  }

  if (v86)
  {
  }

  if (v87) {
  if (v88)
  }
  {
  }

  if (v51) {
  if (v52)
  }
  {
  }

  if (v53)
  {
  }

  if (v54)
  {
  }

  if (v55) {
  if (v56)
  }
  {
  }

  if (v57)
  {
  }

  id v27 = v26;
  return v27;
}

+ (id)newCurrentLockUsageDetailed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSString);
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLockUsage]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    uint64_t v4 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@", v7);
  }

  return v4;
}

+ (id)newSelectorsForStagingSummary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);

  if (v4)
  {
    uint64_t v4 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      char v8 = 1;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v9);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 selectorsForStaging]);
          id v12 = [v11 safeObjectForKey:v10 ofClass:objc_opt_class(NSArray)];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

          id v14 = [v13 count];
          if ((v8 & 1) == 0) {
            -[NSMutableString appendString:](v4, "appendString:", @",");
          }
          -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@:%ld", v10, v14);

          char v8 = 0;
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v6 != v9);
        id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        char v8 = 0;
      }

      while (v6);
    }

    -[NSMutableString appendString:](v4, "appendString:", @"}");
  }

  return v4;
}

+ (id)shortTermLockDirectory:(id)a3 forAssetSetIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "_shortTermLockFilenameNormalizedComponent:",  a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "_shortTermLockFilenameNormalizedComponent:",  v5));

  char v8 = objc_alloc(&OBJC_CLASS___NSString);
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/locks");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id v11 = -[NSString initWithFormat:](v8, "initWithFormat:", @"%@/%@/%@/%@", v10, v6, v7, @"shared_locks");

  return v11;
}

+ (id)shortTermLockFilename:(id)a3 forAssetSetIdentifier:(id)a4 forSetAtomicInstance:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "_shortTermLockFilenameNormalizedComponent:",  a3));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetSetStatus _shortTermLockFilenameNormalizedComponent:]( &OBJC_CLASS___MANAutoAssetSetStatus,  "_shortTermLockFilenameNormalizedComponent:",  v8));

  if (v7)
  {
    id v11 = @"specific";
  }

  else
  {
    id v11 = @"latest";
  }

  id v12 = objc_alloc(&OBJC_CLASS___NSString);
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/locks");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id v15 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"%@/%@/%@/%@/%@_%@.%@",  v14,  v9,  v10,  @"shared_locks",  @"atomic_instance",  v11,  @"locker");

  return v15;
}

+ (id)_shortTermLockFilenameNormalizedComponent:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @":;,/\\?~%*|<>[](){}"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByCharactersInSet:v4]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@"_"]);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (void)setConfiguredAssetEntries:(id)a3
{
}

- (void)setAtomicInstancesDownloaded:(id)a3
{
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

- (void)setNewerAtomicInstanceDiscovered:(id)a3
{
}

- (void)setNewerDiscoveredAtomicEntries:(id)a3
{
}

- (NSDictionary)allDownloadedAtomicInstanceEntries
{
  return self->_allDownloadedAtomicInstanceEntries;
}

- (void)setAllDownloadedAtomicInstanceEntries:(id)a3
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

- (void)setCurrentNotifications:(id)a3
{
}

- (void)setCurrentNeedPolicy:(id)a3
{
}

- (void)setSchedulerPolicy:(id)a3
{
}

- (void)setStagerPolicy:(id)a3
{
}

- (BOOL)haveReceivedLookupResponse
{
  return self->_haveReceivedLookupResponse;
}

- (void)setHaveReceivedLookupResponse:(BOOL)a3
{
  self->_haveReceivedLookupResponse = a3;
}

- (BOOL)vendingAtomicInstanceForConfiguredEntries
{
  return self->_vendingAtomicInstanceForConfiguredEntries;
}

- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3
{
  self->_vendingAtomicInstanceForConfiguredEntries = a3;
}

- (void)setDownloadUserInitiated:(BOOL)a3
{
  self->_downloadUserInitiated = a3;
}

- (void)setDownloadProgress:(id)a3
{
}

- (void)setDownloadedNetworkBytes:(int64_t)a3
{
  self->_downloadedNetworkBytes = a3;
}

- (void)setDownloadedFilesystemBytes:(int64_t)a3
{
  self->_downloadedFilesystemBytes = a3;
}

- (void)setCurrentLockUsage:(id)a3
{
}

- (void)setSelectorsForStaging:(id)a3
{
}

@end