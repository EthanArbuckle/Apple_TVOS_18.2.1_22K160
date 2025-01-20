@interface VCPBackgroundProcessingMetrics
+ (id)sharedMetricsWithPhotoLibrary:(id)a3;
- (VCPBackgroundProcessingMetrics)initWithPhotoLibrary:(id)a3;
- (int)loadMetrics;
- (int)persist;
- (int)reportAnalyzedAsset:(id)a3 withAnalysis:(id)a4 andProcessingTime:(double)a5;
@end

@implementation VCPBackgroundProcessingMetrics

- (VCPBackgroundProcessingMetrics)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VCPBackgroundProcessingMetrics;
  v6 = -[VCPBackgroundProcessingMetrics init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photolibrary, a3);
  }

  return v7;
}

+ (id)sharedMetricsWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class(a1);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 photoLibraryURL]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 absoluteString]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VCPSharedInstanceManager sharedManager](&OBJC_CLASS___VCPSharedInstanceManager, "sharedManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100095508;
  v15[3] = &unk_1001BC520;
  id v12 = v4;
  id v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedInstanceWithIdentifier:v10 andCreationBlock:v15]);

  return v13;
}

- (int)loadMetrics
{
  if (self->_isMetricsLoaded) {
    return 0;
  }
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 5)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "[VCPBackgroundProcessingMetrics] Loading background processing metrics from database",  buf,  2u);
    }
  }

  objc_super v9 = (VCPDatabaseWriter *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self->_photolibrary));
  database = self->_database;
  self->_database = v9;

  if (self->_database)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v14 = -[VCPDatabaseWriter loadAllKeyValuePairs:](self->_database, "loadAllKeyValuePairs:", v13);
    int v2 = v14;
    if ((_DWORD)v14)
    {
      uint64_t v16 = MediaAnalysisLogLevel(v14, v15);
      if ((int)v16 >= 3)
      {
        uint64_t v18 = VCPLogInstance(v16, v17);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        os_log_type_t v20 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v19, v20))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[VCPBackgroundProcessingMetrics] Failed to load background processing metrics",  v60,  2u);
        }
      }
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfTimesScheduledDatabaseCreation"]);
      self->_numOfTimesScheduledDatabaseCreation = (int64_t)[v25 longLongValue];

      v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"TotalAnalyzingTimeDatabaseCreation"]);
      self->_analyzingTimeDatabaseCreation = (int64_t)[v26 longLongValue];

      v27 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedToday"]);
      self->_numImageFullyAnalyzedToday = (int64_t)[v27 longLongValue];

      v28 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedToday"]);
      self->_numLivePhotoFullyAnalyzedToday = (int64_t)[v28 longLongValue];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedToday"]);
      self->_numMovieFullyAnalyzedToday = (int64_t)[v29 longLongValue];

      v30 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedToday"]);
      self->_movieDurationFullyAnalyzedToday = (int64_t)[v30 longLongValue];

      v31 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedInLatestVersion"]);
      self->_numImageFullyAnalyzedLatestVersion = (int64_t)[v31 longLongValue];

      v32 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"]);
      self->_numLivePhotoFullyAnalyzedLatestVersion = (int64_t)[v32 longLongValue];

      v33 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedInLatestVersion"]);
      self->_numMovieFullyAnalyzedLatestVersion = (int64_t)[v33 longLongValue];

      v34 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedInLatestVersion"]);
      self->_movieDurationFullyAnalyzedLatestVersion = (int64_t)[v34 longLongValue];

      v35 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"]);
      self->_timeFullyAnalyzingImageLatestVersion = (int64_t)[v35 longLongValue];

      v36 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"]);
      self->_timeFullyAnalyzingLivePhotoLatestVersion = (int64_t)[v36 longLongValue];

      v37 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingMovieInLatestVersion"]);
      self->_timeFullyAnalyzingMovieLatestVersion = (int64_t)[v37 longLongValue];

      v38 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedToday"]);
      self->_numImagePartiallyAnalyzedToday = (int64_t)[v38 longLongValue];

      v39 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedToday"]);
      self->_numLivePhotoPartiallyAnalyzedToday = (int64_t)[v39 longLongValue];

      v40 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedToday"]);
      self->_numMoviePartiallyAnalyzedToday = (int64_t)[v40 longLongValue];

      v41 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedToday"]);
      self->_movieDurationPartiallyAnalyzedToday = (int64_t)[v41 longLongValue];

      v42 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"]);
      self->_numImagePartiallyAnalyzedLatestVersion = (int64_t)[v42 longLongValue];

      v43 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"]);
      self->_numLivePhotoPartiallyAnalyzedLatestVersion = (int64_t)[v43 longLongValue];

      v44 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"]);
      self->_numMoviePartiallyAnalyzedLatestVersion = (int64_t)[v44 longLongValue];

      v45 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedInLatestVersion"]);
      self->_movieDurationPartiallyAnalyzedLatestVersion = (int64_t)[v45 longLongValue];

      v46 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"]);
      self->_timePartiallyAnalyzingImageLatestVersion = (int64_t)[v46 longLongValue];

      v47 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"]);
      self->_timePartiallyAnalyzingLivePhotoLatestVersion = (int64_t)[v47 longLongValue];

      v48 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"]);
      self->_timePartiallyAnalyzingMovieLatestVersion = (int64_t)[v48 longLongValue];

      v49 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisToday"]);
      self->_timeRunningWithPendingToday = (int64_t)[v49 longLongValue];

      v50 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"]);
      self->_numOfTimesScheduledWithPendingToday = (int64_t)[v50 longLongValue];

      v51 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"]);
      self->_timeRunningWithPendingLatestVersion = (int64_t)[v51 longLongValue];

      v52 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"]);
      self->_numOfTimesScheduledWithPendingLatestVersion = (int64_t)[v52 longLongValue];

      v53 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisToday"]);
      self->_timeRunningWithoutPendingToday = (int64_t)[v53 longLongValue];

      v54 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"]);
      self->_numOfTimesScheduledWithoutPendingToday = (int64_t)[v54 longLongValue];

      v55 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"]);
      self->_timeRunningWithoutPendingLatestVersion = (int64_t)[v55 longLongValue];

      v56 = (void *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"]);
      self->_numOfTimesScheduledWithoutPendingLatestVersion = (int64_t)[v56 longLongValue];

      v57 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      start = self->_start;
      self->_start = v57;

      int v2 = 0;
      *(_DWORD *)&self->_hasFullyAnalyzedMovie = 0;
      *(_DWORD *)&self->_hasPendingAnalysis = 0;
      self->_isMetricsLoaded = 1;
    }
  }

  else
  {
    uint64_t v21 = MediaAnalysisLogLevel(v11, v12);
    uint64_t v23 = VCPLogInstance(v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v23);
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled((os_log_t)v13, v24))
    {
      *(_WORD *)v61 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v24,  "[VCPBackgroundProcessingMetrics] Failed to open database for background processing metrics",  v61,  2u);
    }

    int v2 = -18;
  }

  return v2;
}

- (int)reportAnalyzedAsset:(id)a3 withAnalysis:(id)a4 andProcessingTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = v9;
  if (self->_isMetricsLoaded)
  {
    if (v8)
    {
      self->_hasPendingAnalysis = 1;
      if ((objc_msgSend(v9, "vcp_degraded") & 1) != 0
        || (uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetResource vcp_allAcceptableResourcesForAsset:]( PHAssetResource,  "vcp_allAcceptableResourcesForAsset:",  v8)),  v13 = objc_msgSend(v8, "vcp_fullAnalysisTypesForResources:", v12),  v14 = objc_msgSend(v8, "vcp_fullAnalysisTypes"),  v12,  v14 != v13))
      {
        if ([v8 isVideo])
        {
          self->_hasPartiallyAnalyzedMovie = 1;
          [v8 duration];
          self->_movieDurationPartiallyAnalyzedToday += vcvtpd_s64_f64(v25);
          [v8 duration];
          int v16 = 0;
          int64_t numMoviePartiallyAnalyzedLatestVersion = self->_numMoviePartiallyAnalyzedLatestVersion;
          int64_t v28 = self->_movieDurationPartiallyAnalyzedLatestVersion + vcvtpd_s64_f64(v26);
          self->_timePartiallyAnalyzingMovieLatestVersion += vcvtpd_s64_f64(a5);
          ++self->_numMoviePartiallyAnalyzedToday;
          self->_int64_t numMoviePartiallyAnalyzedLatestVersion = numMoviePartiallyAnalyzedLatestVersion + 1;
          self->_movieDurationPartiallyAnalyzedLatestVersion = v28;
        }

        else
        {
          unsigned int v29 = objc_msgSend(v8, "vcp_isLivePhoto");
          unint64_t v30 = vcvtpd_s64_f64(a5);
          int v16 = 0;
          if (v29)
          {
            self->_hasPartiallyAnalyzedLivePhoto = 1;
            self->_timePartiallyAnalyzingLivePhotoLatestVersion += v30;
            ++self->_numLivePhotoPartiallyAnalyzedToday;
            ++self->_numLivePhotoPartiallyAnalyzedLatestVersion;
          }

          else
          {
            self->_hasPartiallyAnalyzedImage = 1;
            self->_timePartiallyAnalyzingImageLatestVersion += v30;
            ++self->_numImagePartiallyAnalyzedToday;
            ++self->_numImagePartiallyAnalyzedLatestVersion;
          }
        }
      }

      else if ([v8 isVideo])
      {
        self->_hasFullyAnalyzedMovie = 1;
        [v8 duration];
        self->_movieDurationFullyAnalyzedToday += vcvtpd_s64_f64(v15);
        [v8 duration];
        int v16 = 0;
        int64_t numMovieFullyAnalyzedLatestVersion = self->_numMovieFullyAnalyzedLatestVersion;
        int64_t v19 = self->_movieDurationFullyAnalyzedLatestVersion + vcvtpd_s64_f64(v17);
        self->_timeFullyAnalyzingMovieLatestVersion += vcvtpd_s64_f64(a5);
        ++self->_numMovieFullyAnalyzedToday;
        self->_int64_t numMovieFullyAnalyzedLatestVersion = numMovieFullyAnalyzedLatestVersion + 1;
        self->_movieDurationFullyAnalyzedLatestVersion = v19;
      }

      else
      {
        unsigned int v31 = objc_msgSend(v8, "vcp_isLivePhoto");
        unint64_t v32 = vcvtpd_s64_f64(a5);
        int v16 = 0;
        if (v31)
        {
          self->_hasFullyAnalyzedLivePhoto = 1;
          self->_timeFullyAnalyzingLivePhotoLatestVersion += v32;
          ++self->_numLivePhotoFullyAnalyzedToday;
          ++self->_numLivePhotoFullyAnalyzedLatestVersion;
        }

        else
        {
          self->_hasFullyAnalyzedImage = 1;
          self->_timeFullyAnalyzingImageLatestVersion += v32;
          ++self->_numImageFullyAnalyzedToday;
          ++self->_numImageFullyAnalyzedLatestVersion;
        }
      }
    }

    else
    {
      int v16 = -50;
    }
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v20 >= 3)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[VCPBackgroundProcessingMetrics] No existing metrics from database, skip reporting",  v34,  2u);
      }
    }

    int v16 = -18;
  }

  return v16;
}

- (int)persist
{
  BOOL isMetricsLoaded = self->_isMetricsLoaded;
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if (isMetricsLoaded)
  {
    if ((int)v4 >= 5)
    {
      uint64_t v6 = VCPLogInstance(v4, v5);
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      os_log_type_t v8 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v7, v8))
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "VCPBackgroundProcessingMetrics persisting results ...",  (uint8_t *)v26,  2u);
      }
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v9 timeIntervalSinceDate:self->_start];
    double v11 = v10;

    id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numOfTimesScheduledDatabaseCreation + 1,  @"NumberOfTimesScheduledDatabaseCreation");
    int v14 = (int)v12;
    if ((_DWORD)v12) {
      goto LABEL_8;
    }
    unint64_t v15 = vcvtpd_s64_f64(v11);
    id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_analyzingTimeDatabaseCreation + v15,  @"TotalAnalyzingTimeDatabaseCreation");
    int v14 = (int)v12;
    if ((_DWORD)v12) {
      goto LABEL_8;
    }
    database = self->_database;
    if (self->_hasPendingAnalysis)
    {
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( database,  "setValue:forKey:",  self->_timeRunningWithPendingToday + v15,  @"TotalTimeRunningWithPendingAnalysisToday");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numOfTimesScheduledWithPendingToday + 1,  @"NumberOfTimesScheduledWithPendingAnalysisToday");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timeRunningWithPendingLatestVersion + v15,  @"TotalTimeRunningWithPendingAnalysisInLatestVersion");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numOfTimesScheduledWithPendingLatestVersion + 1,  @"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      if (self->_hasFullyAnalyzedImage || self->_hasFullyAnalyzedLivePhoto || self->_hasFullyAnalyzedMovie)
      {
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoFullyAnalyzedToday + self->_numImageFullyAnalyzedToday + self->_numMovieFullyAnalyzedToday,  @"NumberOfAssetsFullyAnalyzedToday");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
        if (self->_hasFullyAnalyzedImage)
        {
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numImageFullyAnalyzedToday,  @"NumberOfImagesFullyAnalyzedToday");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numImageFullyAnalyzedLatestVersion,  @"NumberOfImagesFullyAnalyzedInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timeFullyAnalyzingImageLatestVersion,  @"TotalTimeSpentFullyAnalyzingImageInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
        }

        if (self->_hasFullyAnalyzedLivePhoto)
        {
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoFullyAnalyzedToday,  @"NumberOfLivePhotosFullyAnalyzedToday");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoFullyAnalyzedLatestVersion,  @"NumberOfLivePhotosFullyAnalyzedInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timeFullyAnalyzingLivePhotoLatestVersion,  @"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
        }

        if (self->_hasFullyAnalyzedMovie)
        {
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numMovieFullyAnalyzedToday,  @"NumberOfMoviesFullyAnalyzedToday");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numMovieFullyAnalyzedLatestVersion,  @"NumberOfMoviesFullyAnalyzedInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_movieDurationFullyAnalyzedToday,  @"MovieDurationFullyAnalyzedToday");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timeFullyAnalyzingMovieLatestVersion,  @"TotalTimeSpentFullyAnalyzingMovieInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
          id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_movieDurationFullyAnalyzedLatestVersion,  @"MovieDurationFullyAnalyzedInLatestVersion");
          int v14 = (int)v12;
          if ((_DWORD)v12) {
            goto LABEL_8;
          }
        }
      }

      if (!self->_hasPartiallyAnalyzedImage
        && !self->_hasPartiallyAnalyzedLivePhoto
        && !self->_hasPartiallyAnalyzedMovie)
      {
        return -[VCPDatabaseWriter commit](self->_database, "commit");
      }

      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoPartiallyAnalyzedToday + self->_numImagePartiallyAnalyzedToday + self->_numMoviePartiallyAnalyzedToday,  @"NumberOfAssetsPartiallyAnalyzedToday");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      if (self->_hasPartiallyAnalyzedImage)
      {
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numImagePartiallyAnalyzedToday,  @"NumberOfImagesPartiallyAnalyzedToday");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numImagePartiallyAnalyzedLatestVersion,  @"NumberOfImagesPartiallyAnalyzedInLatestVersion");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timePartiallyAnalyzingImageLatestVersion,  @"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
      }

      if (self->_hasPartiallyAnalyzedLivePhoto)
      {
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoPartiallyAnalyzedToday,  @"NumberOfLivePhotosPartiallyAnalyzedToday");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numLivePhotoPartiallyAnalyzedLatestVersion,  @"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
        id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timePartiallyAnalyzingLivePhotoLatestVersion,  @"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion");
        int v14 = (int)v12;
        if ((_DWORD)v12) {
          goto LABEL_8;
        }
      }

      if (!self->_hasPartiallyAnalyzedMovie) {
        return -[VCPDatabaseWriter commit](self->_database, "commit");
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numMoviePartiallyAnalyzedToday,  @"NumberOfMoviesPartiallyAnalyzedToday");
      int v14 = (int)v12;
      if ((_DWORD)v12
        || (id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numMoviePartiallyAnalyzedLatestVersion,  @"NumberOfMoviesPartiallyAnalyzedInLatestVersion"),  (v14 = (int)v12) != 0)
        || (id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_movieDurationPartiallyAnalyzedToday,  @"MovieDurationPartiallyAnalyzedToday"),  (v14 = (int)v12) != 0)
        || (id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timePartiallyAnalyzingMovieLatestVersion,  @"TotalTimeSpentPartiallyAnalyzingMovieInLatestVersion"),  (v14 = (int)v12) != 0))
      {
LABEL_8:
        uint64_t v16 = MediaAnalysisLogLevel(v12, v13);
        if ((int)v16 >= 4)
        {
          uint64_t v18 = VCPLogInstance(v16, v17);
          int64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          os_log_type_t v20 = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v19, v20))
          {
            v26[0] = 67109120;
            v26[1] = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Failed to persist VCPBackgroundProcessingMetrics - %d",  (uint8_t *)v26,  8u);
          }
        }

        return -[VCPDatabaseWriter commit](self->_database, "commit");
      }

      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_movieDurationPartiallyAnalyzedLatestVersion,  @"MovieDurationPartiallyAnalyzedInLatestVersion");
    }

    else
    {
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( database,  "setValue:forKey:",  self->_timeRunningWithoutPendingToday + v15,  @"TotalTimeRunningWithoutPendingAnalysisToday");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numOfTimesScheduledWithoutPendingToday + 1,  @"NumberOfTimesScheduledWithoutPendingAnalysisToday");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_timeRunningWithoutPendingLatestVersion + v15,  @"TotalTimeRunningWithoutPendingAnalysisInLatestVersion");
      int v14 = (int)v12;
      if ((_DWORD)v12) {
        goto LABEL_8;
      }
      id v12 = (id)-[VCPDatabaseWriter setValue:forKey:]( self->_database,  "setValue:forKey:",  self->_numOfTimesScheduledWithoutPendingLatestVersion + 1,  @"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion");
    }

    int v14 = (int)v12;
    if (!(_DWORD)v12) {
      return -[VCPDatabaseWriter commit](self->_database, "commit");
    }
    goto LABEL_8;
  }

  if ((int)v4 >= 3)
  {
    uint64_t v22 = VCPLogInstance(v4, v5);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    os_log_type_t v24 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v23, v24))
    {
      LOWORD(v26[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "[VCPBackgroundProcessingMetrics] No existing metrics from database, skip persisting",  (uint8_t *)v26,  2u);
    }
  }

  return -18;
}

- (void).cxx_destruct
{
}

@end