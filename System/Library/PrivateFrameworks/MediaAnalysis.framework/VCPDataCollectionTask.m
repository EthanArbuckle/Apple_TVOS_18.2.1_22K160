@interface VCPDataCollectionTask
+ (id)taskWithPhotoLibrary:(id)a3;
- (BOOL)queryBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double *)a4;
- (VCPDataCollectionTask)initWithPhotoLibrary:(id)a3;
- (int)_collectAndReportProgress;
- (int)mainInternal;
- (int)processAssetBatch:(id)a3 withDatabase:(id)a4 andStatistics:(id)a5 andVersionTime:(int64_t)a6 andCurrentTime:(int64_t)a7;
- (int)resetBackgroundAnalysisMetrics;
- (int)resetDailyBackgroundAnalysisMetrics;
- (int)updateAnalysisProgressMetrics:(id)a3;
- (int)updateLivePhotoEffectsStatistics:(id)a3;
- (int)updateLivePhotoStatistics:(id)a3 withFetchResult:(id)a4 forAnalysisTypes:(id)a5;
- (void)updateAnalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 timeElapsed:(int64_t)a5;
- (void)updateOutdatedProgressStatistics:(id)a3 hasResource:(BOOL)a4;
- (void)updateUnanalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 isNewAsset:(BOOL)a5 timeElapsed:(int64_t)a6;
@end

@implementation VCPDataCollectionTask

- (VCPDataCollectionTask)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VCPDataCollectionTask;
  v5 = -[VCPTask initWithPhotoLibrary:](&v9, "initWithPhotoLibrary:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v4));
    id progressHandler = v5->super._progressHandler;
    v5->super._id progressHandler = (id)v6;
  }

  return v5;
}

+ (id)taskWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibrary:v4];

  return v5;
}

- (int)updateLivePhotoStatistics:(id)a3 withFetchResult:(id)a4 forAnalysisTypes:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  id v30 = a5;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
    uint64_t v11 = VCPMAFullAnalysisTypesImage;
    uint64_t v12 = VCPMAFullAnalysisTypesLivePhoto;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        if (objc_msgSend(v14, "vcp_isLivePhoto"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v15]);
          unint64_t v17 = (unint64_t)[v16 unsignedIntegerValue];

          if ((v11 & ~v17) == 0) {
            objc_msgSend(v32, "setAnalyzedPhotos:", (char *)objc_msgSend(v32, "analyzedPhotos") + 1);
          }
          if ((v12 & ~v17) == 0)
          {
            id progressHandler = self->super._progressHandler;
            id v36 = 0LL;
            id v19 = [progressHandler queryAnalysisResultWithType:24 forAsset:v15 result:&v36];
            id v20 = v36;
            v21 = v20;
            if ((_DWORD)v19 == -108 || (_DWORD)v19 == -36)
            {
              id v22 = v19;
            }

            else
            {
              id v22 = v19;
              if ((_DWORD)v19 != -23) {
                id v22 = v5;
              }
            }

            if ((_DWORD)v19 != -108 && (_DWORD)v19 != -36 && (_DWORD)v19 != -23)
            {
              if ([v20 count])
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);
                v24 = v23;
                if (v23)
                {
                  objc_msgSend(v23, "vcp_timerange");
                }

                else
                {
                  memset(v35, 0, sizeof(v35));
                  __int128 v34 = 0u;
                }

                if ((BYTE12(v34) & 1) != 0
                  && (BYTE4(v35[1]) & 1) != 0
                  && !*((void *)&v35[1] + 1)
                  && (*((void *)&v35[0] + 1) & 0x8000000000000000LL) == 0)
                {
                  CMTime time = *(CMTime *)((char *)v35 + 8);
                  double Seconds = CMTimeGetSeconds(&time);
                  double v26 = Seconds;
                  if (Seconds >= 3.0)
                  {
                    objc_msgSend(v32, "setRecommended3Sec:", (char *)objc_msgSend(v32, "recommended3Sec") + 1);
                  }

                  else if (Seconds >= 2.0)
                  {
                    objc_msgSend(v32, "setRecommended2Sec:", (char *)objc_msgSend(v32, "recommended2Sec") + 1);
                  }

                  else if (Seconds >= 1.0)
                  {
                    objc_msgSend(v32, "setRecommended1Sec:", (char *)objc_msgSend(v32, "recommended1Sec") + 1);
                  }

                  [v32 recommendedSec];
                  [v32 setRecommendedSec:v26 + v27];
                  objc_msgSend(v32, "setRecommended:", (char *)objc_msgSend(v32, "recommended") + 1);
                }
              }

              objc_msgSend(v32, "setAnalyzedMovies:", (char *)objc_msgSend(v32, "analyzedMovies") + 1);
            }

            if ((_DWORD)v19 == -108 || (_DWORD)v19 == -36 || (_DWORD)v19 == -23)
            {

              goto LABEL_43;
            }

            id v5 = v22;
          }
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  LODWORD(v22) = 0;
LABEL_43:

  return (int)v22;
}

- (int)updateLivePhotoEffectsStatistics:(id)a3
{
  id v4 = a3;
  for (uint64_t i = 0LL; i != 32; ++i)
    objc_msgSend( v4,  "addCount:toGatingDecisionCounter:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:", (256 << i) | 2),  i);
  for (uint64_t j = 0LL; j != 12; ++j)
    objc_msgSend( v4,  "addCount:toActivityDecisionCounter:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:", (0x10000000000 << j) | 2),  j);
  for (uint64_t k = 0LL; k != 8; ++k)
    objc_msgSend( v4,  "addCount:toStablizeResultsCounter:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:", (0x10000000000000 << k) | 2),  k);
  objc_msgSend( v4,  "addCount:toFirstFailedSubClassifierCounter:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:", 0x8000000002),  0);
  uint64_t v8 = 0LL;
  uint64_t v9 = 1792LL;
  uint64_t v10 = 1LL;
  uint64_t v11 = 4LL;
  do
  {
    objc_msgSend( v4,  "addCount:toFirstFailedSubClassifierCounter:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:andAnyFlags:", v8 | 2, v9),  v10);
    v8 |= 128LL << v11;
    v9 *= 16LL;
    ++v10;
    v11 += 4LL;
  }

  while (v10 != 8);
  objc_msgSend( v4,  "addLivePhotoEffectsAnalyzedCount:",  objc_msgSend(self->super._progressHandler, "getAssetCountMatchingAllFlags:", 2));

  return 0;
}

- (int)resetDailyBackgroundAnalysisMetrics
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Resetting daily background analysis metrics", v12, 2u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = (uint64_t)v9;

  int result = [self->super._progressHandler setValue:v10 forKey:@"DailyProcessTimeStamp"];
  if (!result)
  {
    int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfAssetsFullyAnalyzedToday"];
    if (!result)
    {
      int result = [self->super._progressHandler setValue:0 forKey:@"TotalTimeRunningWithPendingAnalysisToday"];
      if (!result)
      {
        int result = [self->super._progressHandler setValue:0 forKey:@"TotalTimeRunningWithoutPendingAnalysisToday"];
        if (!result)
        {
          int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfTimesScheduledWithPendingAnalysisToday"];
          if (!result)
          {
            int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"];
            if (!result)
            {
              int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfMoviesFullyAnalyzedToday"];
              if (!result)
              {
                int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfImagesFullyAnalyzedToday"];
                if (!result)
                {
                  int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfLivePhotosFullyAnalyzedToday"];
                  if (!result)
                  {
                    int result = [self->super._progressHandler setValue:0 forKey:@"MovieDurationFullyAnalyzedToday"];
                    if (!result)
                    {
                      int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfMoviesPartiallyAnalyzedToday"];
                      if (!result)
                      {
                        int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfImagesPartiallyAnalyzedToday"];
                        if (!result)
                        {
                          int result = [self->super._progressHandler setValue:0 forKey:@"NumberOfLivePhotosPartiallyAnalyzedToday"];
                          if (!result)
                          {
                            int result = [self->super._progressHandler setValue:0 forKey:@"MovieDurationPartiallyAnalyzedToday"];
                            if (!result) {
                              return [self->super._progressHandler commit];
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

- (int)resetBackgroundAnalysisMetrics
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)double v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing background analysis metrics", v26, 2u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;
  uint64_t v11 = MediaAnalysisVersion;

  id progressHandler = self->super._progressHandler;
  uint64_t v13 = VCPVersionKeyForTask(1LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  int v15 = [progressHandler setValue:v11 forKey:v14];

  if (!v15)
  {
    id v16 = self->super._progressHandler;
    uint64_t v17 = VCPStartTimestampKeyForTask(1LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    int v15 = [v16 setValue:(uint64_t)v10 forKey:v18];

    if (!v15)
    {
      id v19 = self->super._progressHandler;
      uint64_t v20 = VCPCompleteTimestampKeyForTask(1LL, 0LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      int v15 = [v19 removeKey:v21];

      if (!v15)
      {
        id v22 = self->super._progressHandler;
        uint64_t v23 = VCPCompleteTimestampKeyForTask(1LL, 1LL);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        int v15 = [v22 removeKey:v24];

        if (!v15)
        {
          int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"];
          if (!v15)
          {
            int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"];
            if (!v15)
            {
              int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"];
              if (!v15)
              {
                int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"];
                if (!v15)
                {
                  int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfMoviesFullyAnalyzedInLatestVersion"];
                  if (!v15)
                  {
                    int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfImagesFullyAnalyzedInLatestVersion"];
                    if (!v15)
                    {
                      int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"];
                      if (!v15)
                      {
                        int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingMovieInLatestVersion"];
                        if (!v15)
                        {
                          int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"];
                          if (!v15)
                          {
                            int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"];
                            if (!v15)
                            {
                              int v15 = [self->super._progressHandler setValue:0 forKey:@"MovieDurationFullyAnalyzedInLatestVersion"];
                              if (!v15)
                              {
                                int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"];
                                if (!v15)
                                {
                                  int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"];
                                  if (!v15)
                                  {
                                    int v15 = [self->super._progressHandler setValue:0 forKey:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"];
                                    if (!v15)
                                    {
                                      int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"];
                                      if (!v15)
                                      {
                                        int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"];
                                        if (!v15)
                                        {
                                          int v15 = [self->super._progressHandler setValue:0 forKey:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"];
                                          if (!v15)
                                          {
                                            int v15 = [self->super._progressHandler setValue:0 forKey:@"MovieDurationPartiallyAnalyzedInLatestVersion"];
                                            if (!v15)
                                            {
                                              int v15 = [self->super._progressHandler commit];
                                              if (!v15) {
                                                return -[VCPDataCollectionTask resetDailyBackgroundAnalysisMetrics]( self,  "resetDailyBackgroundAnalysisMetrics");
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v15;
}

- (void)updateUnanalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 isNewAsset:(BOOL)a5 timeElapsed:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  id v14 = v9;
  if (v8)
  {
    objc_msgSend( v9,  "setNumAssetsUnanalyzedWithResources:",  (char *)objc_msgSend(v9, "numAssetsUnanalyzedWithResources") + 1);
    if (v7) {
      objc_msgSend( v14,  "setNumNewAssetsUnanalyzedWithResources:",  (char *)objc_msgSend(v14, "numNewAssetsUnanalyzedWithResources") + 1);
    }
    else {
      objc_msgSend( v14,  "setNumExistingAssetsUnanalyzedWithResources:",  (char *)objc_msgSend(v14, "numExistingAssetsUnanalyzedWithResources") + 1);
    }
    uint64_t v10 = 10LL;
    while (v10 != -1)
    {
      int64_t v11 = qword_100197998[v10--];
      if (v11 <= a6)
      {
        [v14 addUnanalyzedWithResourcesCounter:v10 + 1];
        break;
      }
    }
  }

  else
  {
    objc_msgSend( v9,  "setNumAssetsUnanalyzedWithoutResources:",  (char *)objc_msgSend(v9, "numAssetsUnanalyzedWithoutResources") + 1);
    if (v7) {
      objc_msgSend( v14,  "setNumNewAssetsUnanalyzedWithoutResources:",  (char *)objc_msgSend(v14, "numNewAssetsUnanalyzedWithoutResources") + 1);
    }
    else {
      objc_msgSend( v14,  "setNumExistingAssetsUnanalyzedWithoutResources:",  (char *)objc_msgSend(v14, "numExistingAssetsUnanalyzedWithoutResources") + 1);
    }
    uint64_t v12 = 10LL;
    while (v12 != -1)
    {
      int64_t v13 = qword_100197998[v12--];
      if (v13 <= a6)
      {
        [v14 addUnanalyzedWithoutResourcesCounter:v12 + 1];
        break;
      }
    }
  }
}

- (void)updateOutdatedProgressStatistics:(id)a3 hasResource:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4) {
    objc_msgSend( v5,  "setNumExistingAssetsNotUpdatedWithResources:",  (char *)objc_msgSend(v5, "numExistingAssetsNotUpdatedWithResources") + 1);
  }
  else {
    objc_msgSend( v5,  "setNumExistingAssetsNotUpdatedWithoutResources:",  (char *)objc_msgSend(v5, "numExistingAssetsNotUpdatedWithoutResources") + 1);
  }
}

- (void)updateAnalyzedProgressStatistics:(id)a3 hasResource:(BOOL)a4 timeElapsed:(int64_t)a5
{
  id v10 = a3;
  uint64_t v7 = 10LL;
  if (a4)
  {
    while (v7 != -1)
    {
      int64_t v8 = qword_100197998[v7--];
      if (v8 <= a5)
      {
        [v10 addAnalyzedWithResourcesCounter:v7 + 1];
        break;
      }
    }
  }

  else
  {
    while (v7 != -1)
    {
      int64_t v9 = qword_100197998[v7--];
      if (v9 <= a5)
      {
        [v10 addAnalyzedWithoutResourcesCounter:v7 + 1];
        break;
      }
    }
  }
}

- (int)processAssetBatch:(id)a3 withDatabase:(id)a4 andStatistics:(id)a5 andVersionTime:(int64_t)a6 andCurrentTime:(int64_t)a7
{
  id v9 = a3;
  id v40 = a4;
  id v48 = a5;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", v9));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v57;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(obj);
        }
        int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v56 + 1) + 8 * (void)i) localIdentifier]);
        [v51 addObject:v13];
      }

      id v10 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    }

    while (v10);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v14 = objc_msgSend(v40, "queryHeadersForAssets:analyses:", v51);
  if (!v14)
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v43 = obj;
    id v15 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v15)
    {
      uint64_t v45 = *(void *)v53;
      id v41 = (id)MediaAnalysisTypeAllInternal;
      do
      {
        id v16 = 0LL;
        id v49 = v15;
        do
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(v43);
          }
          uint64_t v17 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)v16);
          v18 = objc_autoreleasePoolPush();
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 creationDate]);
          [v19 timeIntervalSinceReferenceDate];
          double v21 = v20;

          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( &OBJC_CLASS___PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v17));
          id v23 = objc_msgSend(v17, "vcp_fullAnalysisTypesForResources:", v22);
          id v24 = objc_msgSend(v17, "vcp_fullAnalysisTypes");
          v25 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
          double v26 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v25]);

          int64_t v27 = (uint64_t)v21;
          if (v26)
          {
            if (MediaAnalysisTypesUpdatedSince(objc_msgSend(v26, "vcp_version"), v17))
            {
              -[VCPDataCollectionTask updateUnanalyzedProgressStatistics:hasResource:isNewAsset:timeElapsed:]( self,  "updateUnanalyzedProgressStatistics:hasResource:isNewAsset:timeElapsed:",  v48,  v24 == v23,  v27 > a6,  a7 - a6);
            }

            else
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "vcp_dateModified"));
              id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "vcp_modificationDate"));
              unsigned __int8 v31 = [v29 isEqualToDate:v30];

              if ((v31 & 1) != 0)
              {
                id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "vcp_dateAnalyzed"));
                [v32 timeIntervalSinceReferenceDate];
                double v34 = v33;

                id v35 = objc_msgSend(v26, "vcp_types");
                int64_t v36 = a6;
                if (v27 > a6) {
                  int64_t v36 = v27;
                }
                BOOL v38 = v35 == v41 || v24 == v23;
                -[VCPDataCollectionTask updateAnalyzedProgressStatistics:hasResource:timeElapsed:]( self,  "updateAnalyzedProgressStatistics:hasResource:timeElapsed:",  v48,  v38,  ((uint64_t)v34 - v36) & ~(((uint64_t)v34 - v36) >> 63));
              }

              else
              {
                -[VCPDataCollectionTask updateOutdatedProgressStatistics:hasResource:]( self,  "updateOutdatedProgressStatistics:hasResource:",  v48,  v24 == v23);
              }
            }
          }

          else
          {
            int64_t v28 = a6;
            if (v27 > a6) {
              int64_t v28 = (uint64_t)v21;
            }
            -[VCPDataCollectionTask updateUnanalyzedProgressStatistics:hasResource:isNewAsset:timeElapsed:]( self,  "updateUnanalyzedProgressStatistics:hasResource:isNewAsset:timeElapsed:",  v48,  v24 == v23,  v27 > a6,  a7 - v28);
          }

          objc_autoreleasePoolPop(v18);
          id v16 = (char *)v16 + 1;
        }

        while (v49 != v16);
        id v15 = [v43 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v15);
    }

    int v14 = 0;
  }

  return v14;
}

- (int)updateAnalysisProgressMetrics:(id)a3
{
  id v26 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  id progressHandler = self->super._progressHandler;
  uint64_t v9 = VCPStartTimestampKeyForTask(1LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v25 = [progressHandler valueForKey:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v12,  1LL));

  id v24 = v13;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  1LL));
  int64_t v27 = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  [v13 setSortDescriptors:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v13));
  unint64_t v17 = 0LL;
  while (v17 < (unint64_t)[v16 count])
  {
    v18 = objc_autoreleasePoolPush();
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:v17]);
    if (-[VCPTask isCancelled](self, "isCancelled"))
    {
      char v20 = 0;
      int v3 = -128;
    }

    else
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v21 pet];

      unsigned int v22 = -[VCPDataCollectionTask processAssetBatch:withDatabase:andStatistics:andVersionTime:andCurrentTime:]( self,  "processAssetBatch:withDatabase:andStatistics:andVersionTime:andCurrentTime:",  v11,  self->super._progressHandler,  v26,  v25,  (uint64_t)v7);
      if (!v22)
      {
        [v11 removeAllObjects];
LABEL_12:
        char v20 = 1;
        goto LABEL_13;
      }

      char v20 = 0;
      int v3 = v22;
    }

- (BOOL)queryBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double *)a4
{
  id v6 = a3;
  *a4 = 0.0;
  if (v6)
  {
    [self->super._progressHandler loadAllKeyValuePairs:v6];
    uint64_t v7 = VCPVersionKeyForTask(1LL);
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = VCPStartTimestampKeyForTask(1LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = [v6 count];
    if (v11)
    {
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);
      if ([v13 longLongValue])
      {
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v10]);
        id v15 = [v14 longLongValue];

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);
          id v17 = [v16 longLongValue];
          id v18 = (id)MediaAnalysisVersion;

          if (v17 != v18)
          {
            uint64_t v35 = MediaAnalysisLogLevel(v19, v20);
            if ((int)v35 >= 7)
            {
              uint64_t v37 = VCPLogInstance(v35, v36);
              BOOL v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              os_log_type_t v39 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v38, v39))
              {
                *(_WORD *)v46 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  v39,  "Report daily background analysis metrics on MediaAnalysisVersion change",  v46,  2u);
              }
            }

            *a4 = 1.0;
            goto LABEL_23;
          }

          double v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DailyProcessTimeStamp"]);
          id v22 = [v21 longLongValue];

          id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v23 timeIntervalSinceReferenceDate];
          double v25 = v24 - (double)(uint64_t)v22;

          if (v25 >= 86400.0)
          {
            *a4 = 86400.0 / v25;
LABEL_23:
            BOOL v28 = 1;
            goto LABEL_16;
          }

          uint64_t v40 = MediaAnalysisLogLevel(v26, v27);
          if ((int)v40 >= 7)
          {
            uint64_t v42 = VCPLogInstance(v40, v41);
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
            os_log_type_t v44 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v43, v44))
            {
              v45[0] = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  v44,  "Not met condition to report daily background analysis metrics",  (uint8_t *)v45,  2u);
            }
          }

- (int)_collectAndReportProgress
{
  uint64_t v2 = MediaAnalysisLogLevel(self, a2);
  if ((int)v2 >= 6)
  {
    uint64_t v4 = VCPLogInstance(v2, v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Performing data collection...", buf, 2u);
    }
  }

  v62 = objc_alloc_init(&OBJC_CLASS___VCPAssetStatistics);
  v61 = objc_alloc_init(&OBJC_CLASS___VCPAssetStatistics);
  v63 = objc_alloc_init(&OBJC_CLASS___VCPLivePhotoStatistics);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[VCPAnalyzedAssets assetsFromPhotoLibrary:]( &OBJC_CLASS___VCPAnalyzedAssets,  "assetsFromPhotoLibrary:",  v7));

  unint64_t v9 = 0LL;
  os_log_type_t type = VCPLogToOSLogType[4];
  do
  {
    if (v9 >= (unint64_t)[v8 count])
    {
      id progressHandler = self->super._progressHandler;
      id v69 = 0LL;
      unsigned int v45 = [progressHandler getBlacklistedAssetsWithCount:MediaAnalysisBlacklistThreshold localIdentifiers:&v69];
      id v46 = v69;
      id v48 = v46;
      if (v45)
      {
        uint64_t v49 = MediaAnalysisLogLevel(v46, v47);
        if ((int)v49 < 4)
        {
LABEL_51:

          int v64 = 0;
          break;
        }

        uint64_t v51 = VCPLogInstance(v49, v50);
        __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, type))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, type, " Data collection failed (non-fatal)", buf, 2u);
        }
      }

      else
      {
        if ([v46 count])
        {
          __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
          __int128 v54 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v53,  1LL));

          __int128 v55 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v48,  v54));
          id v56 = [v55 count];
        }

        else
        {
          id v56 = 0LL;
        }

        __int128 v52 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[VCPDataCollection sharedDataCollection]( &OBJC_CLASS___VCPDataCollection,  "sharedDataCollection"));
        __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        -[os_log_s reportPhotoStatistics:forPhotoLibrary:](v52, "reportPhotoStatistics:forPhotoLibrary:", v62, v57);

        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        -[os_log_s reportMovieStatistics:forPhotoLibrary:](v52, "reportMovieStatistics:forPhotoLibrary:", v61, v58);

        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        -[os_log_s reportLivePhotoStatistics:forPhotoLibrary:]( v52,  "reportLivePhotoStatistics:forPhotoLibrary:",  v63,  v59);

        -[os_log_s reportBlacklistedAssetCount:](v52, "reportBlacklistedAssetCount:", v56);
        -[os_log_s reportDatabaseSizeBytes:]( v52,  "reportDatabaseSizeBytes:",  [self->super._progressHandler sizeBytes]);
      }

      goto LABEL_51;
    }

    if (-[VCPTask isCancelled](self, "isCancelled"))
    {
      int v64 = -128;
      break;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
    [v10 pet];

    context = objc_autoreleasePoolPush();
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unint64_t v13 = v9 + 1000;
    while (1)
    {
      id v14 = [v8 count];
      else {
        unint64_t v15 = (unint64_t)v14;
      }
      if (v9 >= v15)
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
        os_log_type_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v32,  1LL));

        double v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_imagesPredicate:](&OBJC_CLASS___NSPredicate, "vcp_imagesPredicate:", 0LL));
        [v33 setPredicate:v34];

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v31,  v33));
        unsigned int v35 = -[VCPDataCollectionTask updateLivePhotoStatistics:withFetchResult:forAnalysisTypes:]( self,  "updateLivePhotoStatistics:withFetchResult:forAnalysisTypes:",  v63,  v19,  v11);
        if (!v35)
        {
          -[VCPAssetStatistics setAnalyzedDegraded:]( v62,  "setAnalyzedDegraded:",  (char *)[v19 count] + -[VCPAssetStatistics analyzedDegraded](v62, "analyzedDegraded"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v65,  v33));

          unsigned int v35 = -[VCPDataCollectionTask updateLivePhotoStatistics:withFetchResult:forAnalysisTypes:]( self,  "updateLivePhotoStatistics:withFetchResult:forAnalysisTypes:",  v63,  v36,  v12);
          if (!v35)
          {
            -[VCPAssetStatistics setAnalyzedUndegraded:]( v62,  "setAnalyzedUndegraded:",  (char *)[v36 count] + -[VCPAssetStatistics analyzedUndegraded](v62, "analyzedUndegraded"));
            unsigned int v35 = -[VCPDataCollectionTask updateLivePhotoEffectsStatistics:]( self,  "updateLivePhotoEffectsStatistics:",  v63);
            if (!v35)
            {
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate vcp_moviesPredicate:]( &OBJC_CLASS___NSPredicate,  "vcp_moviesPredicate:",  0LL));
              [v33 setPredicate:v41];

              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v31,  v33));
              -[VCPAssetStatistics setAnalyzedDegraded:]( v61,  "setAnalyzedDegraded:",  (char *)[v42 count] + -[VCPAssetStatistics analyzedDegraded](v61, "analyzedDegraded"));

              id v43 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v65,  v33));
              -[VCPAssetStatistics setAnalyzedUndegraded:]( v61,  "setAnalyzedUndegraded:",  (char *)[v43 count] + -[VCPAssetStatistics analyzedUndegraded](v61, "analyzedUndegraded"));

              uint64_t v19 = v36;
              int v37 = 0;
              unsigned int v35 = v64;
              goto LABEL_31;
            }
          }

          uint64_t v19 = v36;
        }

        int v37 = 1;
LABEL_31:

LABEL_36:
        int v64 = v35;
        goto LABEL_38;
      }

      id v70 = 0LL;
      unsigned int v16 = [v8 next:&v70];
      id v17 = v70;
      uint64_t v19 = v17;
      if (v16) {
        break;
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 localIdentifier]);
      BOOL v21 = v20 == 0LL;

      if (v21)
      {
        uint64_t v26 = MediaAnalysisLogLevel(v22, v23);
        uint64_t v28 = VCPLogInstance(v26, v27);
        double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v24, type))
        {
          id v29 = [v8 count];
          *(_DWORD *)buf = 136315650;
          uint64_t v30 = "local identifier";
          if (!v19) {
            uint64_t v30 = "asset";
          }
          v72 = v30;
          __int16 v73 = 2048;
          unint64_t v74 = v9;
          __int16 v75 = 2048;
          id v76 = v29;
          _os_log_impl((void *)&_mh_execute_header, v24, type, "Data collection: nil %s at index %zu/%zu", buf, 0x20u);
        }
      }

      else
      {
        if ([v19 isDegraded])
        {
          double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 types]));
          double v25 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
          [v11 setObject:v24 forKey:v25];
        }

        else
        {
          double v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v19 types]));
          double v25 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
          [v12 setObject:v24 forKey:v25];
        }
      }

LABEL_25:
      ++v9;
    }

    uint64_t v38 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v38 >= 4)
    {
      uint64_t v40 = VCPLogInstance(v38, v39);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled((os_log_t)v31, type))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v31, type, " Data collection failed (non-fatal)", buf, 2u);
      }

      unsigned int v35 = 0;
      int v37 = 1;
      goto LABEL_36;
    }

    int v64 = 0;
    int v37 = 1;
LABEL_38:

    objc_autoreleasePoolPop(context);
    unint64_t v9 = v13;
  }

  while (!v37);

  return v64;
}

- (int)mainInternal
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unint64_t v4 = (unint64_t)objc_msgSend(v3, "vcp_assetCountForTaskID:", 1);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VCPTask photoLibrary](self, "photoLibrary"));
  unsigned int v6 = [v5 isSystemPhotoLibrary];
  if (v4 >> 4 < 0x271) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 0;
  }

  if (v7 == 1) {
    -[VCPDataCollectionTask _collectAndReportProgress](self, "_collectAndReportProgress");
  }
  int64_t v8 = objc_autoreleasePoolPush();
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  double v26 = 0.0;
  if (-[VCPDataCollectionTask queryBackgroundAnalysisMetrics:withNormalizeRatio:]( self,  "queryBackgroundAnalysisMetrics:withNormalizeRatio:",  v9,  &v26))
  {
    if (v7)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VCPDataCollection sharedDataCollection](&OBJC_CLASS___VCPDataCollection, "sharedDataCollection"));
      [v10 reportDailyBackgroundAnalysisMetrics:v9 withNormalizeRatio:v26];
      id v11 = objc_alloc_init(&OBJC_CLASS___VCPProgressStatistics);
      int v12 = -[VCPDataCollectionTask updateAnalysisProgressMetrics:](self, "updateAnalysisProgressMetrics:", v11);
      if (v12)
      {

        goto LABEL_19;
      }

      [v10 reportBackgroundAnalysisProgressMetrics:v11];
    }

    int v12 = -[VCPDataCollectionTask resetDailyBackgroundAnalysisMetrics](self, "resetDailyBackgroundAnalysisMetrics");
    if (v12) {
      goto LABEL_19;
    }
  }

  uint64_t v13 = VCPVersionKeyForTask(1LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
  unsigned int v16 = [v15 intValue];

  int v19 = MediaAnalysisVersion;
  if (v16 == MediaAnalysisVersion) {
    goto LABEL_18;
  }
  uint64_t v20 = MediaAnalysisLogLevel(v17, v18);
  if ((int)v20 >= 5)
  {
    uint64_t v22 = VCPLogInstance(v20, v21);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v28 = v16;
      __int16 v29 = 1024;
      int v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "Re-initializing background analysis metric on MediaAnalysisVersion change (%d -> %d)",  buf,  0xEu);
    }
  }

  int v12 = -[VCPDataCollectionTask resetBackgroundAnalysisMetrics](self, "resetBackgroundAnalysisMetrics");
  if (!v12) {
LABEL_18:
  }
    int v12 = 0;
LABEL_19:

  objc_autoreleasePoolPop(v8);
  return v12;
}

- (void).cxx_destruct
{
}

@end