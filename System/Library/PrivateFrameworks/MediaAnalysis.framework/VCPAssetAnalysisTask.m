@interface VCPAssetAnalysisTask
+ (id)taskWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5;
- (BOOL)allowStreaming;
- (NSDictionary)analysisResults;
- (PHAsset)asset;
- (VCPAssetAnalysisTask)initWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5;
- (VCPPhotosAssetChangeManager)photosChangeManager;
- (double)cost;
- (int)mainInternal;
- (unint64_t)types;
- (void)_reportCoreAnalyticsWithAsset:(id)a3 analysis:(id)a4 analysisStatus:(int64_t)a5 processingInterval:(double)a6 extendedAnalysisStatus:(id)a7;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setPhotosChangeManager:(id)a3;
@end

@implementation VCPAssetAnalysisTask

- (VCPAssetAnalysisTask)initWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 photoLibrary]);
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___VCPAssetAnalysisTask;
    id v12 = -[VCPTask initWithPhotoLibrary:](&v15, "initWithPhotoLibrary:", v11);

    if (v12)
    {
      *((void *)v12 + 7) = a3;
      objc_storeStrong((id *)v12 + 8, a4);
      objc_storeStrong((id *)v12 + 5, a5);
      *((_BYTE *)v12 + 48) = 0;
    }

    self = (VCPAssetAnalysisTask *)v12;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

+ (id)taskWithAnalysisTypes:(unint64_t)a3 forAsset:(id)a4 withExistingAnalysis:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class(a1)) initWithAnalysisTypes:a3 forAsset:v8 withExistingAnalysis:v9];

  return v10;
}

- (double)cost
{
  if ([*(id *)&self->_allowStreaming isVideo]
    && self->_existingAnalysis != (NSDictionary *)VCPMAFullAnalysisTypesThumbnail)
  {
    [*(id *)&self->_allowStreaming duration];
  }

  else
  {
    double result = 3.0;
  }

  return result;
}

- (void)_reportCoreAnalyticsWithAsset:(id)a3 analysis:(id)a4 analysisStatus:(int64_t)a5 processingInterval:(double)a6 extendedAnalysisStatus:(id)a7
{
  id v40 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unint64_t v14 = (unint64_t)objc_msgSend(v11, "vcp_flags");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a5 == 2));
  [v13 setObject:v15 forKeyedSubscript:@"AnalyzeSuccess"];

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "vcp_typeDescription"));
  [v13 setObject:v16 forKeyedSubscript:@"AssetType"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a6));
  [v13 setObject:v17 forKeyedSubscript:@"TimeAnalyzing"];

  if ((objc_msgSend(v40, "vcp_isLivePhoto") & 1) != 0 || objc_msgSend(v40, "isVideo"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v14 >> 29) & 1));
    [v13 setObject:v18 forKeyedSubscript:@"IsStreamAnalysis"];

    if ([v40 isVideo])
    {
      [v40 duration];
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v13 setObject:v19 forKeyedSubscript:@"LengthOfMovieContentInSeconds"];
    }
  }

  if (v12) {
    v20 = v12;
  }
  else {
    v20 = &stru_1001BE5A8;
  }
  [v13 setObject:v20 forKeyedSubscript:@"AnalysisStatusExtension"];
  unint64_t v21 = (unint64_t)objc_msgSend(v40, "vcp_fullAnalysisTypes");
  unint64_t v22 = v21 & ~(unint64_t)objc_msgSend(v11, "vcp_types") & 0xFFFFFFFFFFEFFFFFLL;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22 == 0));
  [v13 setObject:v23 forKeyedSubscript:@"ResourceCondition"];

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "vcp_dateAnalyzed"));
  [v24 timeIntervalSinceReferenceDate];
  double v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue([v40 creationDate]);
  [v27 timeIntervalSinceReferenceDate];
  double v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue([v40 photoLibrary]);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v30));

  uint64_t v32 = VCPStartTimestampKeyForTask(1LL);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  id v34 = [v31 valueForKey:v33];

  else {
    uint64_t v35 = (uint64_t)v34;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  (unint64_t)(((((uint64_t)v26 - v35) & (unint64_t)~(((uint64_t)v26 - v35) >> 63))
                                      * (unsigned __int128)0x1845C8A0CE512957uLL) >> 64) >> 13));
  [v13 setObject:v36 forKeyedSubscript:@"DaysWaitedBeforeAnalyzed"];

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  [v37 sendEvent:@"com.apple.mediaanalysisd.FullAnalysisPerAssetInfo" withAnalytics:v13];
  if (a5 == 3) {
    [v37 accumulateInt64Value:1 forField:@"NumberOfAssetsIntoBlacklist" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
  }
  if ((v14 & 0x20000000) != 0) {
    [v37 accumulateInt64Value:1 forField:@"NumberOfAssetsSteamed" andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
  }
  if ([v40 isVideo])
  {
    v38 = &VCPAnalyticsFieldNumberOfMoviesAnalyzedPartialResource;
    v39 = &VCPAnalyticsFieldNumberOfMoviesAnalyzedFullResource;
  }

  else if (objc_msgSend(v40, "vcp_isLivePhoto"))
  {
    v38 = &VCPAnalyticsFieldNumberOfLivePhotosAnalyzedPartialResource;
    v39 = &VCPAnalyticsFieldNumberOfLivePhotosAnalyzedFullResource;
  }

  else
  {
    v38 = &VCPAnalyticsFieldNumberOfPhotosAnalyzedPartialResource;
    v39 = &VCPAnalyticsFieldNumberOfPhotosAnalyzedFullResource;
  }

  if (!v22) {
    v38 = v39;
  }
  [v37 accumulateInt64Value:1 forField:*v38 andEvent:@"com.apple.mediaanalysisd.FullAnalysisRunSession"];
}

- (int)mainInternal
{
  v135 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->_allowStreaming localIdentifier]);
  uint64_t v5 = MediaAnalysisLogLevel(v135, v4);
  if ((int)v5 >= 5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_allowStreaming, "vcp_typeDescription"));
      uint64_t v11 = MediaAnalysisTypeShortDescription(self->_existingAnalysis);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412802;
      v141 = v135;
      __int16 v142 = 2112;
      double v143 = *(double *)&v10;
      __int16 v144 = 2112;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "  [%@] Analyzing %@ (%@)", buf, 0x20u);
    }
  }

  v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v13 = [*(id *)&self->_allowStreaming isVideo];
  existingAnalysis = self->_existingAnalysis;
  if (existingAnalysis == (NSDictionary *)VCPMAFullAnalysisTypesThumbnail) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = v13;
  }
  if (v15 == 1)
  {
    id v16 = [[VCPMovieAnalyzer alloc] initWithPHAsset:*(void *)&self->_allowStreaming withExistingAnalysis:self->super._progressHandler forAnalysisTypes:self->_existingAnalysis];
    objc_msgSend(v16, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472LL;
    v139[2] = sub_100093030;
    v139[3] = &unk_1001B9E98;
    v139[4] = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 analyzeAsset:v139 streamed:buf]);
    uint64_t v18 = (uint64_t)[v16 status];
    BOOL v20 = [v16 status] == (id)4 && buf[0] != 0;
    goto LABEL_35;
  }

  if (((unint64_t)existingAnalysis & 0xFFFFFFFFCBFFFFFFLL) == 0)
  {
    id v16 = [self->super._progressHandler mutableCopy];
LABEL_19:
    if ((BYTE3(self->_existingAnalysis) & 0x34) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "vcp_results"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:MediaAnalysisMovieSummaryResultsKey]);

      id v25 = [v24 count];
      if (v25
        && (v27 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]),
            BOOL v28 = ((unint64_t)objc_msgSend(v27, "vcp_flags") & 0x80000) == 0,
            v27,
            !v28))
      {
        id v34 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:*(void *)&self->_allowStreaming withExistingAnalysis:0 forAnalysisTypes:(uint64_t)self->_existingAnalysis & 0x34000000];
        objc_msgSend(v34, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
        v137[0] = _NSConcreteStackBlock;
        v137[1] = 3221225472LL;
        v137[2] = sub_100093110;
        v137[3] = &unk_1001B9E98;
        v137[4] = self;
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 analyzeAsset:v137 withOptions:0]);
        uint64_t v18 = (uint64_t)[v34 status];
        if (v18 == 2)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "vcp_results"));
          objc_msgSend(v16, "vcp_addEntriesFromResults:", v2);

          objc_msgSend(v16, "vcp_addTypes:", (uint64_t)self->_existingAnalysis & 0x34000000);
        }
      }

      else
      {
        uint64_t v29 = MediaAnalysisLogLevel(v25, v26);
        if ((int)v29 >= 5)
        {
          uint64_t v31 = VCPLogInstance(v29, v30);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          os_log_type_t v33 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)buf = 138412290;
            v141 = v135;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "  [%@] Pre-gating for stabilization not passed.",  buf,  0xCu);
          }
        }

        objc_msgSend(v16, "vcp_addTypes:", (uint64_t)self->_existingAnalysis & 0x34000000);
        uint64_t v18 = 2LL;
      }
    }

    else
    {
      uint64_t v18 = 2LL;
    }

    goto LABEL_32;
  }

  id v21 = [[VCPPhotoAnalyzer alloc] initWithPHAsset:*(void *)&self->_allowStreaming withExistingAnalysis:self->super._progressHandler forAnalysisTypes:(unint64_t)self->_existingAnalysis & 0xFFFFFFFFCBFFFFFFLL];
  objc_msgSend(v21, "setAllowStreaming:", -[VCPAssetAnalysisTask allowStreaming](self, "allowStreaming"));
  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472LL;
  v138[2] = sub_1000930A0;
  v138[3] = &unk_1001B9E98;
  v138[4] = self;
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 analyzeAsset:v138 withOptions:0]);
  id v16 = [v22 mutableCopy];

  uint64_t v18 = (uint64_t)[v21 status];
  if (v18 == 2) {
    goto LABEL_19;
  }
LABEL_32:
  if (v16)
  {
    id v16 = v16;
    BOOL v20 = 0;
    v17 = v16;
  }

  else
  {
    BOOL v20 = 0;
    v17 = 0LL;
  }

- (unint64_t)types
{
  return (unint64_t)self->_existingAnalysis;
}

- (PHAsset)asset
{
  return *(PHAsset **)&self->_allowStreaming;
}

- (NSDictionary)analysisResults
{
  return (NSDictionary *)self->_types;
}

- (BOOL)allowStreaming
{
  return (BOOL)self->super._photoLibrary;
}

- (void)setAllowStreaming:(BOOL)a3
{
  LOBYTE(self->super._photoLibrary) = a3;
}

- (VCPPhotosAssetChangeManager)photosChangeManager
{
  return (VCPPhotosAssetChangeManager *)self->_asset;
}

- (void)setPhotosChangeManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end