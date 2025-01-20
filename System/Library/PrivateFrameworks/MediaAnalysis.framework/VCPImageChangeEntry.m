@interface VCPImageChangeEntry
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime;
- ($A71F62C2B947990EEEAFC21D5CFDCAFE)animatedStickerTimeRange;
- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange;
- (BOOL)imageOnly;
- (CGRect)bestPlaybackRect;
- (NSData)computeSyncPayload;
- (NSDictionary)humanActions;
- (NSSet)audioClassifications;
- (NSString)imageCaption;
- (NSString)videoCaption;
- (PHAsset)asset;
- (float)animatedStickerScore;
- (float)audioScore;
- (float)autoplayScore;
- (float)settlingEffectRankingScore;
- (float)settlingEffectScore;
- (int)imageEmbeddingVersion;
- (int)videoEmbeddingVersion;
- (signed)analysisStage;
- (signed)audioClassification;
- (signed)screenTimeDeviceImageSensitivity;
- (unint64_t)faceCount;
- (unint64_t)longExposureSuggestionState;
- (unint64_t)loopSuggestionState;
- (void)publish;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAnimatedStickerScore:(float)a3;
- (void)setAnimatedStickerTimeRange:(id *)a3;
- (void)setAsset:(id)a3;
- (void)setAudioClassification:(signed __int16)a3;
- (void)setAudioClassifications:(id)a3;
- (void)setAudioScore:(float)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setFaceCount:(unint64_t)a3;
- (void)setHumanActions:(id)a3;
- (void)setImageCaption:(id)a3;
- (void)setImageEmbeddingVersion:(int)a3;
- (void)setImageOnly:(BOOL)a3;
- (void)setKeyFrameTime:(id *)a3;
- (void)setLongExposureSuggestionState:(unint64_t)a3;
- (void)setLoopSuggestionState:(unint64_t)a3;
- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3;
- (void)setSettlingEffectRankingScore:(float)a3;
- (void)setSettlingEffectScore:(float)a3;
- (void)setSummaryTimeRange:(id *)a3;
- (void)setVideoCaption:(id)a3;
- (void)setVideoEmbeddingVersion:(int)a3;
@end

@implementation VCPImageChangeEntry

- (void)publish
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
      else {
        v9 = &stru_1001BE5A8;
      }
      unsigned int v10 = -[PHAsset vcp_isLivePhoto](self->_asset, "vcp_isLivePhoto");
      v11 = &stru_1001BE5A8;
      if (v10 && self->_imageOnly) {
        v11 = @"(still image analysis)";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)v103 = v8;
      *(_WORD *)&v103[8] = 2112;
      *(void *)&v103[10] = v9;
      *(_WORD *)&v103[18] = 2112;
      v104 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Publishing %@Photo asset %@", buf, 0x20u);
    }
  }

  v91 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  self->_asset));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
  else {
    v14 = &stru_1001BE5A8;
  }
  unsigned int v15 = -[PHAsset vcp_isLivePhoto](self->_asset, "vcp_isLivePhoto");
  v16 = &stru_1001BE5A8;
  if (v15 && self->_imageOnly) {
    v16 = @"(still image analysis)";
  }
  [v12 addBreadcrumb:@"[%@] Persisting 1 %@Photo asset %@", v13, v14, v16];

  v17 = v91;
  if (self->_imageCaption && +[VCPVideoCaptionAnalyzer mode](&OBJC_CLASS___VCPVideoCaptionAnalyzer, "mode") == (id)1)
  {
    uint64_t v19 = MediaAnalysisLogLevel(1LL, v18);
    if ((int)v19 >= 7)
    {
      uint64_t v21 = VCPLogInstance(v19, v20);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      os_log_type_t v23 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v22, v23))
      {
        imageCaption = self->_imageCaption;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
        *(_DWORD *)buf = 138412546;
        *(void *)v103 = imageCaption;
        *(_WORD *)&v103[8] = 2112;
        *(void *)&v103[10] = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "publish image caption [%@] to photo asset %@", buf, 0x16u);
      }

      v17 = v91;
    }

    [v17 setGeneratedAssetDescription:self->_imageCaption analysisVersion:VCPPhotosCaptionProcessingVersion sourceType:1];
  }

  if (self->_videoCaption && +[VCPVideoCaptionAnalyzer mode](&OBJC_CLASS___VCPVideoCaptionAnalyzer, "mode") == (id)1)
  {
    uint64_t v27 = MediaAnalysisLogLevel(1LL, v26);
    if ((int)v27 >= 7)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v30, v31))
      {
        videoCaption = self->_videoCaption;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
        *(_DWORD *)buf = 138412546;
        *(void *)v103 = videoCaption;
        *(_WORD *)&v103[8] = 2112;
        *(void *)&v103[10] = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "publish video caption [%@] to photo asset %@", buf, 0x16u);
      }

      v17 = v91;
    }

    [v17 setGeneratedAssetDescription:self->_videoCaption analysisVersion:VCPPhotosCaptionProcessingVersion sourceType:2];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self->_asset, "vcp_modificationDate"));
  [v17 setMediaAnalysisTimeStamp:v34];

  uint64_t v35 = MediaAnalysisVersion;
  v36 = v91;
  [v91 setMediaAnalysisImageVersion:MediaAnalysisVersion];
  [v91 setFaceCount:self->_faceCount];
  int imageEmbeddingVersion = self->_imageEmbeddingVersion;
  if (imageEmbeddingVersion) {
    [v91 setImageEmbeddingVersion:(__int16)imageEmbeddingVersion];
  }
  int videoEmbeddingVersion = self->_videoEmbeddingVersion;
  if (videoEmbeddingVersion) {
    [v91 setVideoEmbeddingVersion:(__int16)videoEmbeddingVersion];
  }
  if (-[PHAsset vcp_isLivePhoto](self->_asset, "vcp_isLivePhoto"))
  {
    if (!self->_imageOnly)
    {
      [v91 setMediaAnalysisVersion:v35];
      __int128 v39 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
      v100[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
      v100[1] = v39;
      v100[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
      [v91 setBestVideoTimeRange:v100];
      *(float *)&double v40 = self->_autoplayScore;
      [v91 setAutoplaySuggestionScore:v40];
      __int128 v41 = *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch;
      v99[0] = *(_OWORD *)&self->_animatedStickerTimeRange.start.value;
      v99[1] = v41;
      v99[2] = *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale;
      [v91 setAnimatedStickerTimeRange:v99];
      *(float *)&double v42 = self->_animatedStickerScore;
      [v91 setVideoStickerSuggestionScore:v42];
      [v91 setAudioClassification:self->_audioClassification];
      *(float *)&double v43 = self->_audioScore;
      [v91 setAudioScore:v43];
      *(float *)&double v44 = self->_settlingEffectScore;
      [v91 setSettlingEffectScore:v44];
      *(float *)&double v45 = self->_settlingEffectRankingScore;
      [v91 setActivityScore:v45];
      [v91 setScreenTimeDeviceImageSensitivity:self->_screenTimeDeviceImageSensitivity];
      id v46 = objc_msgSend( v91,  "setBestPlaybackRectWithNormalizedRect:",  self->_bestPlaybackRect.origin.x,  self->_bestPlaybackRect.origin.y,  self->_bestPlaybackRect.size.width,  self->_bestPlaybackRect.size.height);
      if (self->_audioClassifications)
      {
        uint64_t v48 = MediaAnalysisLogLevel(v46, v47);
        if ((int)v48 >= 7)
        {
          uint64_t v50 = VCPLogInstance(v48, v49);
          v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          os_log_type_t v52 = VCPLogToOSLogType[7];
          if (os_log_type_enabled(v51, v52))
          {
            unsigned int v53 = -[NSSet count](self->_audioClassifications, "count");
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v103 = v53;
            *(_WORD *)&v103[4] = 2112;
            *(void *)&v103[6] = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  v52,  "publish %d audio classifications to livephoto %@",  buf,  0x12u);
          }

          v36 = v91;
        }

        audioClassifications = self->_audioClassifications;
        __int16 v56 = VCPPhotosSceneProcessingVersionInternal();
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion"));
        [v36 setSceneClassifications:audioClassifications ofType:3 version:v56 timestamp:v57];
      }
    }
  }

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  obj = self->_humanActions;
  id v58 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v95,  v101,  16LL);
  if (v58)
  {
    uint64_t v59 = *(void *)v96;
    os_log_type_t v92 = VCPLogToOSLogType[7];
    os_log_type_t type = VCPLogToOSLogType[6];
    do
    {
      for (i = 0LL; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v96 != v59) {
          objc_enumerationMutation(obj);
        }
        v61 = *(void **)(*((void *)&v95 + 1) + 8LL * (void)i);
        v62 = (void *)objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest changeRequestForFace:]( &OBJC_CLASS___PHFaceChangeRequest,  "changeRequestForFace:",  v61));
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_humanActions, "objectForKeyedSubscript:", v61));
        BOOL v64 = [v63 count] == 0;

        if (v64)
        {
          uint64_t v74 = MediaAnalysisLogLevel(v65, v66);
          if ((int)v74 >= 7)
          {
            uint64_t v76 = VCPLogInstance(v74, v75);
            v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v77, v92))
            {
              v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
              v79 = (void *)objc_claimAutoreleasedReturnValue([v61 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)v103 = v78;
              *(_WORD *)&v103[8] = 2112;
              *(void *)&v103[10] = v79;
              _os_log_impl( (void *)&_mh_execute_header,  v77,  v92,  "   [%@] reset action traits for PHFace %@",  buf,  0x16u);
            }
          }

          [v62 setDetectionTraits:0];
        }

        else
        {
          uint64_t v67 = MediaAnalysisLogLevel(v65, v66);
          if ((int)v67 >= 6)
          {
            uint64_t v69 = VCPLogInstance(v67, v68);
            v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, type))
            {
              v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
              v72 = (void *)objc_claimAutoreleasedReturnValue([v61 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)v103 = v71;
              *(_WORD *)&v103[8] = 2112;
              *(void *)&v103[10] = v72;
              _os_log_impl( (void *)&_mh_execute_header,  v70,  type,  "   [%@] publish action traits for PHFace %@",  buf,  0x16u);
            }
          }

          v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_humanActions, "objectForKeyedSubscript:", v61));
          [v62 setDetectionTraits:v73];
        }
      }

      id v58 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v95,  v101,  16LL);
    }

    while (v58);
  }

  v80 = v91;
  if (!self->_imageOnly || (-[PHAsset vcp_isLivePhoto](self->_asset, "vcp_isLivePhoto") & 1) == 0)
  {
    if (-[PHAsset mad_isEligibleForComputeSync](self->_asset, "mad_isEligibleForComputeSync"))
    {
      objc_msgSend( v91,  "setLocalAnalysisStage:",  -[PHAsset mad_analysisStageAfterCompletingAnalysis:]( self->_asset,  "mad_analysisStageAfterCompletingAnalysis:",  1));
      id v81 = [v91 setComputeSyncMediaAnalysisPayload:self->_computeSyncPayload];
      uint64_t v83 = MediaAnalysisLogLevel(v81, v82);
      if ((int)v83 >= 7)
      {
        uint64_t v85 = VCPLogInstance(v83, v84);
        v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
        os_log_type_t v87 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v86, v87))
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
          int analysisStage = self->_analysisStage;
          unsigned int v90 = -[NSData length](self->_computeSyncPayload, "length");
          *(_DWORD *)buf = 138412802;
          *(void *)v103 = v88;
          *(_WORD *)&v103[8] = 1024;
          *(_DWORD *)&v103[10] = analysisStage;
          *(_WORD *)&v103[14] = 1024;
          *(_DWORD *)&v103[16] = v90;
          _os_log_impl( (void *)&_mh_execute_header,  v86,  v87,  "[%@] publish analysis stage (%d) and compute sync payload (%d bytes)",  buf,  0x18u);
        }

        v80 = v91;
      }
    }
  }
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_faceCount = a3;
}

- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange
{
  __int128 v3 = *(_OWORD *)&self[4].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var3;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0.var0;
  __int128 v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- ($A71F62C2B947990EEEAFC21D5CFDCAFE)animatedStickerTimeRange
{
  __int128 v3 = *(_OWORD *)&self[5].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[4].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[5].var0.var3;
  return self;
}

- (void)setAnimatedStickerTimeRange:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0.var0;
  __int128 v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_animatedStickerTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_animatedStickerTimeRange.start.value = v3;
}

- (float)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(float)a3
{
  self->_animatedStickerScore = a3;
}

- (unint64_t)loopSuggestionState
{
  return self->_loopSuggestionState;
}

- (void)setLoopSuggestionState:(unint64_t)a3
{
  self->_loopSuggestionState = a3;
}

- (unint64_t)longExposureSuggestionState
{
  return self->_longExposureSuggestionState;
}

- (void)setLongExposureSuggestionState:(unint64_t)a3
{
  self->_longExposureSuggestionState = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setKeyFrameTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_keyFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_keyFrameTime.value = v3;
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_audioClassification = a3;
}

- (NSSet)audioClassifications
{
  return self->_audioClassifications;
}

- (void)setAudioClassifications:(id)a3
{
}

- (float)audioScore
{
  return self->_audioScore;
}

- (void)setAudioScore:(float)a3
{
  self->_audioScore = a3;
}

- (float)settlingEffectScore
{
  return self->_settlingEffectScore;
}

- (void)setSettlingEffectScore:(float)a3
{
  self->_settlingEffectScore = a3;
}

- (float)settlingEffectRankingScore
{
  return self->_settlingEffectRankingScore;
}

- (void)setSettlingEffectRankingScore:(float)a3
{
  self->_settlingEffectRankingScore = a3;
}

- (CGRect)bestPlaybackRect
{
  double x = self->_bestPlaybackRect.origin.x;
  double y = self->_bestPlaybackRect.origin.y;
  double width = self->_bestPlaybackRect.size.width;
  double height = self->_bestPlaybackRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBestPlaybackRect:(CGRect)a3
{
  self->_bestPlaybackRect = a3;
}

- (NSDictionary)humanActions
{
  return self->_humanActions;
}

- (void)setHumanActions:(id)a3
{
}

- (signed)screenTimeDeviceImageSensitivity
{
  return self->_screenTimeDeviceImageSensitivity;
}

- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3
{
  self->_screenTimeDeviceImageSensitivitdouble y = a3;
}

- (NSString)imageCaption
{
  return self->_imageCaption;
}

- (void)setImageCaption:(id)a3
{
}

- (NSString)videoCaption
{
  return self->_videoCaption;
}

- (void)setVideoCaption:(id)a3
{
}

- (int)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(int)a3
{
  self->_int imageEmbeddingVersion = a3;
}

- (int)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setVideoEmbeddingVersion:(int)a3
{
  self->_int videoEmbeddingVersion = a3;
}

- (signed)analysisStage
{
  return self->_analysisStage;
}

- (void)setAnalysisStage:(signed __int16)a3
{
  self->_int analysisStage = a3;
}

- (NSData)computeSyncPayload
{
  return self->_computeSyncPayload;
}

- (void)setComputeSyncPayload:(id)a3
{
}

- (BOOL)imageOnly
{
  return self->_imageOnly;
}

- (void)setImageOnly:(BOOL)a3
{
  self->_imageOnldouble y = a3;
}

- (void).cxx_destruct
{
}

@end