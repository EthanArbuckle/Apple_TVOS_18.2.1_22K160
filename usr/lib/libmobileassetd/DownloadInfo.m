@interface DownloadInfo
- (BOOL)addNewRateDataPoint:(double)a3;
- (BOOL)changingConfig;
- (BOOL)isAutoDownload;
- (BOOL)isDiscretionary;
- (BOOL)isPallas;
- (BOOL)isStalled;
- (BOOL)shouldRetry;
- (DownloadInfo)initWithUrl:(id)a3 clientName:(id)a4 options:(id)a5;
- (DownloadInfo)initWithUrl:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 clientName:(id)a6 options:(id)a7;
- (MADownloadOptions)options;
- (NSDate)date;
- (NSDate)downloadFinishTime;
- (NSDate)downloadStartTime;
- (NSDate)nonDiscretionaryUpgradeTime;
- (NSDictionary)analyticsData;
- (NSMutableArray)callbacks;
- (NSMutableArray)rateHistory;
- (NSString)assetAudience;
- (NSString)assetType;
- (NSString)baseUrlNoACS;
- (NSString)firstClientName;
- (NSString)lengthOfRange;
- (NSString)pallasUrl;
- (NSString)purpose;
- (NSString)relativePath;
- (NSString)spaceCheckedUUID;
- (NSString)startingAt;
- (NSString)taskDescriptor;
- (NSURL)cacheServerUrl;
- (NSURL)originalUrl;
- (NSURLSessionDownloadTask)task;
- (STExtractor)extractor;
- (double)currentEstimate;
- (id)_taskState;
- (id)description;
- (id)initForAssetType:(id)a3 withPurpose:(id)a4 clientName:(id)a5 options:(id)a6;
- (int64_t)currentTotalWritten;
- (int64_t)downloadSize;
- (int64_t)previousTotalDownloaded;
- (int64_t)totalBytesThisSlice;
- (int64_t)totalExpectedBytes;
- (int64_t)transferredBytesEst;
- (unint64_t)backtracks;
- (unint64_t)numNoLongerStalled;
- (unint64_t)numStalled;
- (void)addNewDownloadInfo:(id)a3;
- (void)clearCacheServerUrl;
- (void)determineDownloadUrl:(id)a3 callback:(id)a4;
- (void)setAnalyticsData:(id)a3;
- (void)setAssetAudience:(id)a3;
- (void)setBaseUrlNoACS:(id)a3;
- (void)setCurrentTotalWritten:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setDownloadFinishTime:(id)a3;
- (void)setDownloadSize:(int64_t)a3;
- (void)setDownloadStartTime:(id)a3;
- (void)setExtractor:(id)a3;
- (void)setFirstClientName:(id)a3;
- (void)setIsAutoDownload:(BOOL)a3;
- (void)setIsDiscretionary:(BOOL)a3;
- (void)setIsPallas:(BOOL)a3;
- (void)setLengthOfRange:(id)a3;
- (void)setNonDiscretionaryUpgradeTime:(id)a3;
- (void)setPallasUrl:(id)a3;
- (void)setPreviousTotalDownloaded:(int64_t)a3;
- (void)setRelativePath:(id)a3;
- (void)setShouldRetry:(BOOL)a3;
- (void)setSpaceCheckedUUID:(id)a3;
- (void)setStartingAt:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskDescriptor:(id)a3;
- (void)setTotalBytesThisSlice:(int64_t)a3;
- (void)setTotalExpectedBytes:(int64_t)a3;
- (void)setTransferredBytesEst:(int64_t)a3;
- (void)updateDownloadData:(int64_t)a3;
@end

@implementation DownloadInfo

- (int64_t)totalBytesThisSlice
{
  return self->_totalBytesThisSlice;
}

- (BOOL)addNewRateDataPoint:(double)a3
{
  BOOL isStalled = self->_isStalled;
  rateHistory = self->_rateHistory;
  if (a3 <= 0.0 || !isStalled)
  {
    int64_t previousTotalDownloaded = self->_previousTotalDownloaded;
    int64_t totalExpectedBytes = self->_totalExpectedBytes;
    v10 = self->_rateHistory;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    self->_BOOL isStalled = 0;
    v12 = (char *)-[NSMutableArray count](self->_rateHistory, "count");
    if ((unint64_t)v12 >= 0x1E)
    {
      v13 = v12;
      v14 = 0LL;
      int v15 = 0;
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rateHistory, "objectAtIndex:", v14));
        [v16 doubleValue];
        double v18 = v17;

        if (v18 == 0.0) {
          ++v15;
        }
        else {
          int v15 = 0;
        }
        ++v14;
      }

      while (v13 != v14);
      if (v15 > 29)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[DownloadInfo description](self, "description"));
        v24 = (void *)v19;
        if (previousTotalDownloaded >= totalExpectedBytes)
        {
          _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadInfo addNewRateDataPoint:]",  @"%@\n[DOWNLOAD_INFO] {addNewRateDataPoint} Download has not progressed since last update, however, download appears to be complete. Previous Total Downloaded: %lld, Total Expected: %lld",  v20,  v21,  v22,  v23,  v19);
        }

        else
        {
          _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadInfo addNewRateDataPoint:]",  @"%@\n[DOWNLOAD_INFO] {addNewRateDataPoint} Download has not progressed since last update, likely stalled.",  v20,  v21,  v22,  v23,  v19);

          self->_BOOL isStalled = 1;
          ++self->_numStalled;
        }
      }
    }
  }

  else
  {
    -[NSMutableArray removeAllObjects](rateHistory, "removeAllObjects");
    v25 = self->_rateHistory;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    -[NSMutableArray addObject:](v25, "addObject:", v26);

    self->_BOOL isStalled = 0;
    ++self->_numNoLongerStalled;
  }

  self->_totalBytesThisSlice = 0LL;
  return self->_isStalled;
}

- (NSString)taskDescriptor
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (int64_t)currentTotalWritten
{
  return self->_currentTotalWritten;
}

- (int64_t)totalExpectedBytes
{
  return self->_totalExpectedBytes;
}

- (double)currentEstimate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo taskDescriptor](self, "taskDescriptor"));
  id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);

  else {
    uint64_t v6 = 1LL;
  }
  id v7 = -[NSMutableArray count](self->_rateHistory, "count");
  if ((uint64_t)v7 >= v6 && !self->_isStalled)
  {
    uint64_t v10 = (uint64_t)v7;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    v11 = self->_rateHistory;
    id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      double v15 = 0.0;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)i), "doubleValue", (void)v18);
          double v15 = v15 + v17;
        }

        id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v13);

      if (v15 != 0.0)
      {
        double v8 = (double)(self->_totalExpectedBytes - self->_previousTotalDownloaded) / (v15 / (double)v10);
        goto LABEL_7;
      }
    }

    else
    {
    }
  }

  double v8 = NAN;
LABEL_7:

  return v8;
}

- (void)setTotalExpectedBytes:(int64_t)a3
{
  self->_int64_t totalExpectedBytes = a3;
}

- (void)updateDownloadData:(int64_t)a3
{
  self->_currentTotalWritten = a3;
  int64_t previousTotalDownloaded = self->_previousTotalDownloaded;
  uint64_t v6 = previousTotalDownloaded - a3;
  if (previousTotalDownloaded <= a3)
  {
    *(int64x2_t *)&self->_transferredBytesEst = vaddq_s64( *(int64x2_t *)&self->_transferredBytesEst,  vdupq_n_s64(a3 - previousTotalDownloaded));
    self->_int64_t previousTotalDownloaded = a3;
    self->_changingConfig = 0;
  }

  else
  {
    ++self->_backtracks;
    if (!self->_changingConfig && v6 > 0x10000)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo description](self, "description"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo taskDescriptor](self, "taskDescriptor"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo task](self, "task"));
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloadInfo updateDownloadData:]",  @"%@\n[DOWNLOAD_INFO] {updateDownloadData} In progress and totalWritten is less than previous total (%lld < %lld), nsurl is backtracking significantly for %@. task %@",  v8,  v9,  v10,  v11,  (uint64_t)v7);
    }

    if (self->_totalExpectedBytes / 5 <= a3)
    {
      int64_t v12 = 0LL;
    }

    else
    {
      int64_t v12 = 0LL;
      if (self->_previousTotalDownloaded > self->_totalExpectedBytes / 4 && v6 > 0x10000)
      {
        self->_transferredBytesEst += a3;
        int64_t v12 = a3;
      }
    }

    self->_totalBytesThisSlice = v12;
    self->_int64_t previousTotalDownloaded = a3;
  }

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (DownloadInfo)initWithUrl:(id)a3 clientName:(id)a4 options:(id)a5
{
  return -[DownloadInfo initWithUrl:forAssetType:withPurpose:clientName:options:]( self,  "initWithUrl:forAssetType:withPurpose:clientName:options:",  a3,  0LL,  0LL,  a4,  a5);
}

- (id)initForAssetType:(id)a3 withPurpose:(id)a4 clientName:(id)a5 options:(id)a6
{
  return -[DownloadInfo initWithUrl:forAssetType:withPurpose:clientName:options:]( self,  "initWithUrl:forAssetType:withPurpose:clientName:options:",  0LL,  a3,  a4,  a5,  a6);
}

- (DownloadInfo)initWithUrl:(id)a3 forAssetType:(id)a4 withPurpose:(id)a5 clientName:(id)a6 options:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v43 = a5;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___DownloadInfo;
  double v17 = -[DownloadInfo init](&v44, "init");
  __int128 v18 = v17;
  if (v17)
  {
    v17->_BOOL isStalled = 0;
    __int128 v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    rateHistory = v18->_rateHistory;
    v18->_rateHistory = v19;

    taskDescriptor = v18->_taskDescriptor;
    v18->_taskDescriptor = 0LL;

    task = v18->_task;
    v18->_task = 0LL;

    startingAt = v18->_startingAt;
    v18->_startingAt = 0LL;

    lengthOfRange = v18->_lengthOfRange;
    v18->_lengthOfRange = 0LL;

    extractor = v18->_extractor;
    v18->_extractor = 0LL;

    date = v18->_date;
    v18->_date = 0LL;

    objc_storeStrong((id *)&v18->_options, a7);
    objc_storeStrong((id *)&v18->_originalUrl, a3);
    v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    callbacks = v18->_callbacks;
    v18->_callbacks = v27;

    cacheServerUrl = v18->_cacheServerUrl;
    v18->_cacheServerUrl = 0LL;

    objc_storeStrong((id *)&v18->_assetType, a4);
    objc_storeStrong((id *)&v18->_purpose, a5);
    objc_storeStrong((id *)&v18->_firstClientName, a6);
    v18->_transferredBytesEst = 0LL;
    *(_OWORD *)&v18->_totalBytesThisSlice = 0u;
    *(_WORD *)&v18->_shouldRetry = 1;
    *(_OWORD *)&v18->_downloadSize = 0u;
    v18->_isAutoDownload = 0;
    *(_OWORD *)&v18->_numNoLongerStalled = 0u;
    v18->_numStalled = 0LL;
    baseUrlNoACS = v18->_baseUrlNoACS;
    v18->_baseUrlNoACS = 0LL;

    relativePath = v18->_relativePath;
    v18->_relativePath = 0LL;

    if (v13)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v13 host]);
      v33 = (NSString *)[v32 copy];
      v34 = v18->_baseUrlNoACS;
      v18->_baseUrlNoACS = v33;

      v35 = (void *)objc_claimAutoreleasedReturnValue([v13 path]);
      v36 = (NSString *)[v35 copy];
      v37 = v18->_relativePath;
      v18->_relativePath = v36;
    }

    v18->_isPallas = 0;
    if (v16)
    {
      v18->_isDiscretionary = 1;
    }

    else
    {
      v18->_isDiscretionary = 1;
    }

    analyticsData = v18->_analyticsData;
    v18->_analyticsData = 0LL;

    downloadStartTime = v18->_downloadStartTime;
    v18->_downloadStartTime = 0LL;

    downloadFinishTime = v18->_downloadFinishTime;
    v18->_downloadFinishTime = 0LL;

    nonDiscretionaryUpgradeTime = v18->_nonDiscretionaryUpgradeTime;
    v18->_nonDiscretionaryUpgradeTime = 0LL;
  }

  return v18;
}

- (void)determineDownloadUrl:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSURL *, void))a4;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 0;
  if (!&_ACSLocateCachingServer)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo description](self, "description"));
    p_originalUrl = &self->_originalUrl;
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadInfo determineDownloadUrl:callback:]",  @"%@\n[DOWNLOAD_INFO] {determineDownloadUrl} AssetCacheServices not present in this OS, download from: %@",  v10,  v11,  v12,  v13,  (uint64_t)v8);
LABEL_7:

    v7[2](v7, *p_originalUrl, *((unsigned __int8 *)v29 + 24));
    goto LABEL_8;
  }

  options = self->_options;
  if (!options || !-[MADownloadOptions canUseLocalCacheServer](options, "canUseLocalCacheServer"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo description](self, "description"));
    p_originalUrl = &self->_originalUrl;
    _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadInfo determineDownloadUrl:callback:]",  @"%@\n[DOWNLOAD_INFO] {determineDownloadUrl} not allowed to use caching server, download from: %@",  v21,  v22,  v23,  v24,  (uint64_t)v8);
    goto LABEL_7;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DownloadInfo description](self, "description"));
  _MobileAssetLog( 0LL,  5,  (uint64_t)"-[DownloadInfo determineDownloadUrl:callback:]",  @"%@\n[DOWNLOAD_INFO] {determineDownloadUrl} Attempting to get cache server url",  v16,  v17,  v18,  v19,  (uint64_t)v15);

  originalUrl = self->_originalUrl;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __46__DownloadInfo_determineDownloadUrl_callback___block_invoke;
  v25[3] = &unk_34EBF0;
  v25[4] = self;
  v27 = &v28;
  v26 = v7;
  ACSLocateCachingServer(originalUrl, 0LL, v6, v25, 10.0);

LABEL_8:
  _Block_object_dispose(&v28, 8);
}

uint64_t __46__DownloadInfo_determineDownloadUrl_callback___block_invoke(void *a1, void *a2)
{
  if (a2) {
    objc_storeStrong((id *)(a1[4] + 176LL), a2);
  }
  uint64_t v3 = a1[4];
  if (*(void *)(v3 + 176))
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void *)(a1[4] + 176LL);
  }

  else
  {
    uint64_t v5 = *(void *)(v3 + 168);
    uint64_t v4 = a1[5];
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v4 + 16))( v4,  v5,  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL));
}

- (void)addNewDownloadInfo:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_callbacks, "addObject:");
  }
}

- (void)clearCacheServerUrl
{
  cacheServerUrl = self->_cacheServerUrl;
  self->_cacheServerUrl = 0LL;
}

- (id)_taskState
{
  task = self->_task;
  if (task)
  {
    id v4 = -[NSURLSessionDownloadTask state](task, "state");
    if ((unint64_t)v4 >= 4) {
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  -[NSURLSessionDownloadTask state](self->_task, "state")));
    }
    else {
      uint64_t v5 = *(&off_34EC10 + (void)v4);
    }
  }

  else
  {
    uint64_t v5 = @"nil";
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDownloadTask response](self->_task, "response"));
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
    uint64_t v5 = (uint64_t)[v3 statusCode];
  }
  else {
    uint64_t v5 = -1LL;
  }
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDownloadTask error](self->_task, "error"));
  taskDescriptor = self->_taskDescriptor;
  task = self->_task;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[DownloadInfo _taskState](self, "_taskState"));
  uint64_t v28 = v3;
  v27 = taskDescriptor;
  v26 = task;
  BOOL v25 = *(_OWORD *)&self->_startingAt != 0LL;
  uint64_t v23 = (void *)v9;
  int64_t downloadSize = self->_downloadSize;
  if (*(_OWORD *)&self->_startingAt == 0LL) {
    uint64_t v10 = &stru_355768;
  }
  else {
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (start %@ length %@)",  self->_startingAt,  self->_lengthOfRange));
  }
  int64_t currentTotalWritten = self->_currentTotalWritten;
  int64_t totalExpectedBytes = self->_totalExpectedBytes;
  if (self->_isStalled) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  __int128 v22 = *(_OWORD *)&self->_numStalled;
  unint64_t backtracks = self->_backtracks;
  id v15 = -[NSMutableArray count](self->_callbacks, "count");
  if (self->_extractor) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if (self->_shouldRetry) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  uint64_t v18 = @" error: ";
  if (v6)
  {
    uint64_t v19 = v6;
  }

  else
  {
    uint64_t v18 = &stru_355768;
    uint64_t v19 = &stru_355768;
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DownloadInfo taskDescriptor: %@ . task: %@ taskState: %@ statusCode: %lld downloadSize: %lld%@ progress: %lld / %lld isStalled: %@ numStalls: %lld numNoLongerStalls: %lld backtracks: %lld callbackCount: %lld hasExtractor: %@ originalUrl: %@ cacheServerUrl: %@ assetType: %@ purpose: %@ shouldRetry: %@ ifModifiedDate: %@ options: %@%@%@",  v27,  v26,  v23,  v5,  downloadSize,  v10,  currentTotalWritten,  totalExpectedBytes,  v13,  v22,  backtracks,  v15,  v16,  *(_OWORD *)&self->_originalUrl,  self->_assetType,  self->_purpose,  v17,  self->_date,  self->_options,  v18,  v19));
  if (v25) {

  }
  return v20;
}

- (NSURLSessionDownloadTask)task
{
  return (NSURLSessionDownloadTask *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTask:(id)a3
{
}

- (NSString)startingAt
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setStartingAt:(id)a3
{
}

- (NSString)lengthOfRange
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLengthOfRange:(id)a3
{
}

- (STExtractor)extractor
{
  return (STExtractor *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setExtractor:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDate:(id)a3
{
}

- (int64_t)transferredBytesEst
{
  return self->_transferredBytesEst;
}

- (void)setTransferredBytesEst:(int64_t)a3
{
  self->_transferredBytesEst = a3;
}

- (void)setTotalBytesThisSlice:(int64_t)a3
{
  self->_totalBytesThisSlice = a3;
}

- (int64_t)previousTotalDownloaded
{
  return self->_previousTotalDownloaded;
}

- (void)setPreviousTotalDownloaded:(int64_t)a3
{
  self->_int64_t previousTotalDownloaded = a3;
}

- (unint64_t)numStalled
{
  return self->_numStalled;
}

- (unint64_t)numNoLongerStalled
{
  return self->_numNoLongerStalled;
}

- (void)setCurrentTotalWritten:(int64_t)a3
{
  self->_int64_t currentTotalWritten = a3;
}

- (void)setTaskDescriptor:(id)a3
{
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setDownloadSize:(int64_t)a3
{
  self->_int64_t downloadSize = a3;
}

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

- (void)setShouldRetry:(BOOL)a3
{
  self->_shouldRetry = a3;
}

- (BOOL)changingConfig
{
  return self->_changingConfig;
}

- (unint64_t)backtracks
{
  return self->_backtracks;
}

- (NSString)firstClientName
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setFirstClientName:(id)a3
{
}

- (NSString)baseUrlNoACS
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setBaseUrlNoACS:(id)a3
{
}

- (NSString)relativePath
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setRelativePath:(id)a3
{
}

- (BOOL)isAutoDownload
{
  return self->_isAutoDownload;
}

- (void)setIsAutoDownload:(BOOL)a3
{
  self->_isAutoDownload = a3;
}

- (BOOL)isDiscretionary
{
  return self->_isDiscretionary;
}

- (void)setIsDiscretionary:(BOOL)a3
{
  self->_isDiscretionary = a3;
}

- (BOOL)isPallas
{
  return self->_isPallas;
}

- (void)setIsPallas:(BOOL)a3
{
  self->_isPallas = a3;
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (NSURL)originalUrl
{
  return self->_originalUrl;
}

- (NSURL)cacheServerUrl
{
  return self->_cacheServerUrl;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (MADownloadOptions)options
{
  return self->_options;
}

- (NSString)spaceCheckedUUID
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setSpaceCheckedUUID:(id)a3
{
}

- (NSMutableArray)rateHistory
{
  return self->_rateHistory;
}

- (NSString)pallasUrl
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setPallasUrl:(id)a3
{
}

- (NSString)assetAudience
{
  return (NSString *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setAssetAudience:(id)a3
{
}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (void)setAnalyticsData:(id)a3
{
}

- (NSDate)downloadStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setDownloadStartTime:(id)a3
{
}

- (NSDate)downloadFinishTime
{
  return (NSDate *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setDownloadFinishTime:(id)a3
{
}

- (NSDate)nonDiscretionaryUpgradeTime
{
  return (NSDate *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setNonDiscretionaryUpgradeTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end