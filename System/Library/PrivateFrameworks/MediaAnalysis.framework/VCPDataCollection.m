@interface VCPDataCollection
+ (id)sharedDataCollection;
+ (unint64_t)truncate:(unint64_t)a3;
+ (void)reportMetric:(const __CFString *)a3 withValue:(unint64_t)a4;
- (void)reportBackgroundAnalysisProgressMetrics:(id)a3;
- (void)reportBlacklistedAssetCount:(unint64_t)a3;
- (void)reportDailyBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double)a4;
- (void)reportDatabaseCorruption;
- (void)reportDatabaseSizeBytes:(unint64_t)a3;
- (void)reportLivePhotoStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportMovieStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportPhotoStatistics:(id)a3 forPhotoLibrary:(id)a4;
- (void)reportStatistics:(id)a3 forMediaType:(int64_t)a4 forPhotoLibrary:(id)a5;
@end

@implementation VCPDataCollection

+ (id)sharedDataCollection
{
  if (qword_1001E6450 != -1) {
    dispatch_once(&qword_1001E6450, &stru_1001BAEA8);
  }
  return (id)qword_1001E6448;
}

+ (unint64_t)truncate:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 0x64)
  {
    double v4 = floor(log10((double)a3));
    unint64_t v5 = vcvtad_u64_f64(__exp10((double)((int)(v4 + -1.0) & ~((int)(v4 + -1.0) >> 31))));
    return v3 / v5 * v5;
  }

  return v3;
}

+ (void)reportMetric:(const __CFString *)a3 withValue:(unint64_t)a4
{
  unint64_t v6 = +[VCPDataCollection truncate:](&OBJC_CLASS___VCPDataCollection, "truncate:", a4);
  uint64_t v8 = MediaAnalysisLogLevel(v6, v7);
  if ((int)v8 >= 6)
  {
    uint64_t v10 = VCPLogInstance(v8, v9);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      int v13 = 136315650;
      id v14 = -[__CFString UTF8String]( (id) (id) a3, "UTF8String");
      __int16 v15 = 2048;
      unint64_t v16 = v6;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "  %-73s  %zu (Actual: %zu)", (uint8_t *)&v13, 0x20u);
    }
  }

  ADClientSetValueForScalarKey(a3, v6);
}

- (void)reportStatistics:(id)a3 forMediaType:(int64_t)a4 forPhotoLibrary:(id)a5
{
  id v18 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  a5,  1LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithMediaType:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithMediaType:options:",  a4,  v7));
  unint64_t v9 = (unint64_t)[v8 count];

  if (v9)
  {
    BOOL v10 = a4 == 2;
    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAEC8[v10],  v9);
    v11 = (char *)[v18 analyzedDegraded];
    id v12 = [v18 analyzedUndegraded];
    id v13 = [v18 analyzedUndegraded];
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BAED8[v10],  [v18 analyzedDegraded]);
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BAEE8[v10],  [v18 analyzedUndegraded]);
    id v14 = &v11[(void)v12];
    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAEF8[v10],  v14);
    unint64_t v15 = (100LL * (void)v14 + (v9 >> 1)) / v9;
    unint64_t v16 = ((v9 >> 1) + 100LL * (void)v13) / v9;
    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF08[v10],  v15 - v16);
    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF18[v10],  v16);
    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF28[v10],  v15);
    if (v9 >= qword_1001978E0[v10])
    {
      if (v9 >= qword_1001978F0[v10])
      {
        +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF98[v10],  v15 - v16);
        +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAFA8[v10],  v16);
        __int16 v17 = off_1001BAFB8;
      }

      else
      {
        +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF68[v10],  v15 - v16);
        +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF78[v10],  v16);
        __int16 v17 = off_1001BAF88;
      }
    }

    else
    {
      +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF38[v10],  v15 - v16);
      +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  off_1001BAF48[v10],  v16);
      __int16 v17 = off_1001BAF58;
    }

    +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  v17[v10],  v15);
  }
}

- (void)reportPhotoStatistics:(id)a3 forPhotoLibrary:(id)a4
{
}

- (void)reportMovieStatistics:(id)a3 forPhotoLibrary:(id)a4
{
}

- (void)reportLivePhotoStatistics:(id)a3 forPhotoLibrary:(id)a4
{
  id v19 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  a4,  1LL));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate vcp_livePhotosPredicate:](&OBJC_CLASS___NSPredicate, "vcp_livePhotosPredicate:", 0LL));
  [v5 setPredicate:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](&OBJC_CLASS___PHAsset, "fetchAssetsWithOptions:", v5));
  unint64_t v8 = (unint64_t)[v7 count];

  id v9 = [v19 analyzedPhotos];
  id v10 = [v19 analyzedMovies];
  [v19 recommendedSec];
  double v12 = v11;
  id v13 = [v19 recommended];
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotosInLibrary",  v8);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotosAnalyzed",  [v19 analyzedPhotos]);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotosPercentAnalyzed",  (100LL * (void)v9 + (v8 >> 1)) / v8);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesAnalyzed",  [v19 analyzedMovies]);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesPercentAnalyzed",  ((v8 >> 1) + 100LL * (void)v10) / v8);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesRecommended",  [v19 recommended]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthOneSecOrLonger",  [v19 recommended1Sec]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthTwoSecOrLonger",  [v19 recommended2Sec]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesRecommendedLengthThreeSecOrLonger",  [v19 recommended3Sec]);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.livePhotoMoviesAverageRecommendedLength",  vcvtad_u64_f64(v12 / (double)(unint64_t)v13 * 10.0));
  for (uint64_t i = 0LL; i != 32; ++i)
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BAFC8[i],  [v19 gatingDecisionCounter:i]);
  uint64_t v15 = 0LL;
  unint64_t v16 = v19;
  do
  {
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB0C8[v15],  [v16 activityDecisionCounter:v15]);
    ++v15;
    unint64_t v16 = v19;
  }

  while (v15 != 12);
  for (uint64_t j = 0LL; j != 8; ++j)
  {
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB128[j],  [v16 stablizeResultsCounter:j]);
    unint64_t v16 = v19;
  }

  for (uint64_t k = 0LL; k != 8; ++k)
  {
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB168[k],  [v16 firstFailedSubClassifierCounter:k]);
    unint64_t v16 = v19;
  }
}

- (void)reportBlacklistedAssetCount:(unint64_t)a3
{
}

- (void)reportDatabaseSizeBytes:(unint64_t)a3
{
}

- (void)reportDatabaseCorruption
{
}

- (void)reportDailyBackgroundAnalysisMetrics:(id)a3 withNormalizeRatio:(double)a4
{
  id v88 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"]);
  unint64_t v6 = (char *)[v5 longLongValue];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"]);
  unint64_t v8 = &v6[(void)[v7 longLongValue]];

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numberOfTimesBackgroundAnalysisScheduled",  (uint64_t)((double)(uint64_t)v8 * a4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfAssetsFullyAnalyzedToday"]);
  id v10 = [v9 longLongValue];

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"]);
  id v12 = [v11 longLongValue];
  uint64_t v13 = (uint64_t)((double)(uint64_t)v10 * a4);

  double v14 = (double)(uint64_t)v12 * a4;
  uint64_t v15 = (uint64_t)v14;
  else {
    uint64_t v16 = 0LL;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumAssetsAnalyzedToday",  v13);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgNumAssetsAnalyzedToday",  v16);
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfAssetsPartiallyAnalyzedToday"]);
  id v18 = [v17 longLongValue];

  if (v15 >= 1) {
    uint64_t v19 = (uint64_t)((double)(uint64_t)v18 * a4) / v15;
  }
  else {
    uint64_t v19 = 0LL;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumAssetsPartiallyAnalyzedToday");
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgNumAssetsPartiallyAnalyzedToday",  v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisToday"]);
  id v21 = [v20 longLongValue];

  v22 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisToday"]);
  id v23 = [v22 longLongValue];

  double v24 = (double)(uint64_t)v23 * a4;
  else {
    uint64_t v25 = 0LL;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithPendingAnalysisToday");
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithPendingAnalysisToday",  v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisToday"]);
  id v27 = [v26 longLongValue];

  v28 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisToday"]);
  id v29 = [v28 longLongValue];

  double v30 = (double)(uint64_t)v29 * a4;
  else {
    uint64_t v31 = 0LL;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithoutPendingAnalysisToday");
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithoutPendingAnalysisToday",  v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeRunningWithPendingAnalysisInLatestVersion"]);
  uint64_t v33 = (uint64_t)[v32 longLongValue];

  v34 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithPendingAnalysisInLatestVersion"]);
  uint64_t v35 = (uint64_t)[v34 longLongValue];

  if (v35 < 1) {
    uint64_t v36 = 0LL;
  }
  else {
    uint64_t v36 = v33 / v35;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithPendingAnalysisInLatestVersion",  v33);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithPendingAnalysisInLatestVersion",  v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeRunningWithoutPendingAnalysisInLatestVersion"]);
  uint64_t v38 = (uint64_t)[v37 longLongValue];

  v39 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"NumberOfTimesScheduledWithoutPendingAnalysisInLatestVersion"]);
  uint64_t v40 = (uint64_t)[v39 longLongValue];

  if (v40 < 1) {
    uint64_t v41 = 0LL;
  }
  else {
    uint64_t v41 = v38 / v40;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalTimeBackgroundAnalysisRunningWithoutPendingAnalysisInLatestVersion",  v38);
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeBackgroundAnalysisRunningWithoutPendingAnalysisInLatestVersion",  v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedToday"]);
  uint64_t v43 = (uint64_t)((double)(uint64_t)[v42 longLongValue] * a4);

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumMovieAssetsAnalyzedToday",  v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedToday"]);
  uint64_t v45 = (uint64_t)((double)(uint64_t)[v44 longLongValue] * a4);

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumPhotoAssetsAnalyzedToday",  v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedToday"]);
  uint64_t v47 = (uint64_t)((double)(uint64_t)[v46 longLongValue] * a4);

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumLivePhotoAssetsAnalyzedToday",  v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedToday"]);
  uint64_t v49 = (uint64_t)((double)(uint64_t)[v48 longLongValue] * a4);

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalMovieDurationAnalyzedToday",  v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedToday"]);
  id v51 = [v50 longLongValue];

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumMovieAssetsPartiallyAnalyzedToday",  (unint64_t)((double)(uint64_t)v51 * a4));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedToday"]);
  id v53 = [v52 longLongValue];

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumPhotoAssetsPartiallyAnalyzedToday",  (unint64_t)((double)(uint64_t)v53 * a4));
  v54 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedToday"]);
  id v55 = [v54 longLongValue];

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalNumLivePhotoAssetsPartiallyAnalyzedToday",  (unint64_t)((double)(uint64_t)v55 * a4));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedToday"]);
  id v57 = [v56 longLongValue];

  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.totalMovieDurationPartiallyAnalyzedToday",  (unint64_t)((double)(uint64_t)v57 * a4));
  v58 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingImageInLatestVersion"]);
  uint64_t v59 = (uint64_t)[v58 longLongValue];

  v60 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfImagesFullyAnalyzedInLatestVersion"]);
  uint64_t v61 = (uint64_t)[v60 longLongValue];

  if (v61 < 1) {
    uint64_t v62 = 0LL;
  }
  else {
    uint64_t v62 = v59 / v61;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeAnalyzingAPhotoInLatestVersion",  v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeSpentFullyAnalyzingLivePhotoInLatestVersion"]);
  uint64_t v64 = (uint64_t)[v63 longLongValue];

  v65 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfLivePhotosFullyAnalyzedInLatestVersion"]);
  uint64_t v66 = (uint64_t)[v65 longLongValue];

  if (v66 < 1) {
    uint64_t v67 = 0LL;
  }
  else {
    uint64_t v67 = v64 / v66;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeAnalyzingALivePhotoInLatestVersion",  v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"MovieDurationFullyAnalyzedInLatestVersion"]);
  uint64_t v69 = (uint64_t)[v68 longLongValue];

  v70 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfMoviesFullyAnalyzedInLatestVersion"]);
  uint64_t v71 = (uint64_t)[v70 longLongValue];

  if (v71 < 1) {
    uint64_t v72 = 0LL;
  }
  else {
    uint64_t v72 = v69 / v71;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimeAnalyzingAMovieSecondInLatestVersion",  v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingImageInLatestVersion"]);
  uint64_t v74 = (uint64_t)[v73 longLongValue];

  v75 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfImagesPartiallyAnalyzedInLatestVersion"]);
  uint64_t v76 = (uint64_t)[v75 longLongValue];

  if (v76 < 1) {
    uint64_t v77 = 0LL;
  }
  else {
    uint64_t v77 = v74 / v76;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingAPhotoInLatestVersion",  v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"TotalTimeSpentPartiallyAnalyzingLivePhotoInLatestVersion"]);
  uint64_t v79 = (uint64_t)[v78 longLongValue];

  v80 = (void *)objc_claimAutoreleasedReturnValue( [v88 objectForKeyedSubscript:@"NumberOfLivePhotosPartiallyAnalyzedInLatestVersion"]);
  uint64_t v81 = (uint64_t)[v80 longLongValue];

  if (v81 < 1) {
    uint64_t v82 = 0LL;
  }
  else {
    uint64_t v82 = v79 / v81;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingALivePhotoInLatestVersion",  v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"MovieDurationPartiallyAnalyzedInLatestVersion"]);
  uint64_t v84 = (uint64_t)[v83 longLongValue];

  v85 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"NumberOfMoviesPartiallyAnalyzedInLatestVersion"]);
  uint64_t v86 = (uint64_t)[v85 longLongValue];

  if (v86 < 1) {
    uint64_t v87 = 0LL;
  }
  else {
    uint64_t v87 = v84 / v86;
  }
  +[VCPDataCollection reportMetric:withValue:]( &OBJC_CLASS___VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.avgTimePartiallyAnalyzingAMovieSecondInLatestVersion",  v87);
}

- (void)reportBackgroundAnalysisProgressMetrics:(id)a3
{
  id v7 = a3;
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numAssetsUnanalyzedWithResources",  [v7 numAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numAssetsUnanalyzedWithoutResources",  [v7 numAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numNewAssetsUnanalyzedWithResources",  [v7 numNewAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numNewAssetsUnanalyzedWithoutResources",  [v7 numNewAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numExistingAssetsUnanalyzedWithResources",  [v7 numExistingAssetsUnanalyzedWithResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numExistingAssetsUnanalyzedWithoutResources",  [v7 numExistingAssetsUnanalyzedWithoutResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numExistingAssetsNotUpdatedWithResources",  [v7 numExistingAssetsNotUpdatedWithResources]);
  +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  @"com.apple.mediaanalysisd.numExistingAssetsNotUpdatedWithoutResources",  [v7 numExistingAssetsNotUpdatedWithoutResources]);
  for (uint64_t i = 0LL; i != 11; ++i)
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB1A8[i],  [v7 unanalyzedWithResourcesCounter:i]);
  for (uint64_t j = 0LL; j != 11; ++j)
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB200[j],  [v7 unanalyzedWithoutResourcesCounter:j]);
  for (uint64_t k = 0LL; k != 11; ++k)
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB258[k],  [v7 analyzedWithResourcesCounter:k]);
  for (uint64_t m = 0LL; m != 11; ++m)
    +[VCPDataCollection reportMetric:withValue:]( VCPDataCollection,  "reportMetric:withValue:",  off_1001BB2B0[m],  [v7 analyzedWithoutResourcesCounter:m]);
}

@end