@interface VCPMovieChangeEntry
+ (BOOL)persistFullRangeSignals;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime;
- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange;
- (BOOL)imageOnly;
- (CGImage)keyFrameResource;
- (CGRect)bestPlaybackRect;
- (NSArray)facesToAdd;
- (NSData)computeSyncPayload;
- (NSDictionary)humanActions;
- (NSDictionary)humanActionsForFacesToAdd;
- (NSSet)audioClassifications;
- (NSSet)sceneClassifications;
- (NSString)imageCaption;
- (NSString)videoCaption;
- (PHAsset)asset;
- (float)activityScore;
- (float)autoplayScore;
- (float)videoScore;
- (int)imageEmbeddingVersion;
- (int)videoEmbeddingVersion;
- (signed)analysisStage;
- (signed)audioClassification;
- (signed)screenTimeDeviceImageSensitivity;
- (unint64_t)faceCount;
- (void)dealloc;
- (void)publish;
- (void)setActivityScore:(float)a3;
- (void)setAnalysisStage:(signed __int16)a3;
- (void)setAsset:(id)a3;
- (void)setAudioClassification:(signed __int16)a3;
- (void)setAudioClassifications:(id)a3;
- (void)setAutoplayScore:(float)a3;
- (void)setBestPlaybackRect:(CGRect)a3;
- (void)setComputeSyncPayload:(id)a3;
- (void)setFaceCount:(unint64_t)a3;
- (void)setFacesToAdd:(id)a3;
- (void)setHumanActions:(id)a3;
- (void)setHumanActionsForFacesToAdd:(id)a3;
- (void)setImageCaption:(id)a3;
- (void)setImageEmbeddingVersion:(int)a3;
- (void)setImageOnly:(BOOL)a3;
- (void)setKeyFrameResource:(CGImage *)a3;
- (void)setKeyFrameTime:(id *)a3;
- (void)setSceneClassifications:(id)a3;
- (void)setScreenTimeDeviceImageSensitivity:(signed __int16)a3;
- (void)setSummaryTimeRange:(id *)a3;
- (void)setVideoCaption:(id)a3;
- (void)setVideoEmbeddingVersion:(int)a3;
- (void)setVideoScore:(float)a3;
@end

@implementation VCPMovieChangeEntry

+ (BOOL)persistFullRangeSignals
{
  return 0;
}

- (void)dealloc
{
  keyFrameResource = self->_keyFrameResource;
  if (keyFrameResource) {
    CFRelease(keyFrameResource);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VCPMovieChangeEntry;
  -[VCPMovieChangeEntry dealloc](&v4, "dealloc");
}

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
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
      v9 = (void *)v8;
      if (self->_imageOnly) {
        v10 = @"(thumbnail analysis results)";
      }
      else {
        v10 = &stru_1001BE5A8;
      }
      *(_DWORD *)buf = 138412546;
      *(void *)v150 = v8;
      *(_WORD *)&v150[8] = 2112;
      *(void *)&v150[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Publishing Movie asset %@", buf, 0x16u);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
  v13 = (void *)v12;
  if (self->_imageOnly) {
    v14 = @"(thumbnail analysis results)";
  }
  else {
    v14 = &stru_1001BE5A8;
  }
  [v11 addBreadcrumb:@"[%@] Publishing Movie asset %@", v12, v14];

  BOOL v15 = !self->_imageOnly;
  v128 = (void *)objc_claimAutoreleasedReturnValue( +[PHAssetChangeRequest changeRequestForAsset:]( &OBJC_CLASS___PHAssetChangeRequest,  "changeRequestForAsset:",  self->_asset));
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self->_asset, "vcp_modificationDate"));
    [v128 setMediaAnalysisTimeStamp:v16];

    [v128 setMediaAnalysisImageVersion:MediaAnalysisVersion];
    if (self->_imageCaption && +[VCPVideoCaptionAnalyzer mode](&OBJC_CLASS___VCPVideoCaptionAnalyzer, "mode") == (id)1)
    {
      uint64_t v18 = MediaAnalysisLogLevel(1LL, v17);
      if ((int)v18 >= 7)
      {
        uint64_t v20 = VCPLogInstance(v18, v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_log_type_t v22 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
          imageCaption = self->_imageCaption;
          *(_DWORD *)buf = 138412546;
          *(void *)v150 = v23;
          *(_WORD *)&v150[8] = 2112;
          *(void *)&v150[10] = imageCaption;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@] Publish image caption [%@]", buf, 0x16u);
        }
      }

      [v128 setGeneratedAssetDescription:self->_imageCaption analysisVersion:VCPPhotosCaptionProcessingVersion sourceType:1];
    }

    int imageEmbeddingVersion = self->_imageEmbeddingVersion;
    if (imageEmbeddingVersion) {
      [v128 setImageEmbeddingVersion:(__int16)imageEmbeddingVersion];
    }
    goto LABEL_90;
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
        *(void *)v150 = videoCaption;
        *(_WORD *)&v150[8] = 2112;
        *(void *)&v150[10] = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "publish video caption [%@] to movie %@", buf, 0x16u);
      }
    }

    [v128 setGeneratedAssetDescription:self->_videoCaption analysisVersion:VCPPhotosCaptionProcessingVersion sourceType:2];
  }

  int videoEmbeddingVersion = self->_videoEmbeddingVersion;
  if (videoEmbeddingVersion) {
    [v128 setVideoEmbeddingVersion:(__int16)videoEmbeddingVersion];
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset vcp_modificationDate](self->_asset, "vcp_modificationDate"));
  [v128 setMediaAnalysisTimeStamp:v35];

  LOWORD(v35) = MediaAnalysisVersion;
  [v128 setMediaAnalysisVersion:MediaAnalysisVersion];
  [v128 setMediaAnalysisImageVersion:(__int16)v35];
  __int128 v36 = *(_OWORD *)&self->_summaryTimeRange.start.epoch;
  v148[0] = *(_OWORD *)&self->_summaryTimeRange.start.value;
  v148[1] = v36;
  v148[2] = *(_OWORD *)&self->_summaryTimeRange.duration.timescale;
  [v128 setBestVideoTimeRange:v148];
  *(float *)&double v37 = self->_autoplayScore;
  [v128 setAutoplaySuggestionScore:v37];
  *(float *)&double v38 = self->_videoScore;
  [v128 setVideoScore:v38];
  *(float *)&double v39 = self->_activityScore;
  [v128 setActivityScore:v39];
  [v128 setFaceCount:self->_faceCount];
  [v128 setAudioClassification:self->_audioClassification];
  [v128 setScreenTimeDeviceImageSensitivity:self->_screenTimeDeviceImageSensitivity];
  CMTime time = (CMTime)self->_keyFrameTime;
  if (CMTimeGetSeconds(&time) != 0.0)
  {
    keyFrameResource = self->_keyFrameResource;
    __int128 v145 = *(_OWORD *)&self->_keyFrameTime.value;
    int64_t epoch = self->_keyFrameTime.epoch;
    [v128 setBestKeyFrame:keyFrameResource time:&v145];
  }

  objc_msgSend( v128,  "setBestPlaybackRectWithNormalizedRect:",  self->_bestPlaybackRect.origin.x,  self->_bestPlaybackRect.origin.y,  self->_bestPlaybackRect.size.width,  self->_bestPlaybackRect.size.height);
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  obj = self->_humanActions;
  id v41 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v141,  v153,  16LL);
  if (v41)
  {
    uint64_t v42 = *(void *)v142;
    os_log_type_t v43 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[7];
    do
    {
      for (i = 0LL; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v142 != v42) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v141 + 1) + 8LL * (void)i);
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest changeRequestForFace:]( &OBJC_CLASS___PHFaceChangeRequest,  "changeRequestForFace:",  v45));
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_humanActions, "objectForKeyedSubscript:", v45));
        BOOL v48 = [v47 count] == 0;

        if (v48)
        {
          uint64_t v58 = MediaAnalysisLogLevel(v49, v50);
          if ((int)v58 >= 7)
          {
            uint64_t v60 = VCPLogInstance(v58, v59);
            v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, type))
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
              v63 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)v150 = v62;
              *(_WORD *)&v150[8] = 2112;
              *(void *)&v150[10] = v63;
              _os_log_impl( (void *)&_mh_execute_header,  v61,  type,  "   [%@] reset action traits for PHFace %@",  buf,  0x16u);
            }
          }

          [v46 setDetectionTraits:0];
        }

        else
        {
          uint64_t v51 = MediaAnalysisLogLevel(v49, v50);
          if ((int)v51 >= 6)
          {
            uint64_t v53 = VCPLogInstance(v51, v52);
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, v43))
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
              v56 = (void *)objc_claimAutoreleasedReturnValue([v45 localIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)v150 = v55;
              *(_WORD *)&v150[8] = 2112;
              *(void *)&v150[10] = v56;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  v43,  "   [%@] publish action traits for PHFace %@",  buf,  0x16u);
            }
          }

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_humanActions, "objectForKeyedSubscript:", v45));
          [v46 setDetectionTraits:v57];
        }
      }

      id v41 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v141,  v153,  16LL);
    }

    while (v41);
  }

  sceneClassifications = self->_sceneClassifications;
  if (sceneClassifications)
  {
    __int16 v65 = VCPPhotosSceneProcessingVersionInternal();
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion"));
    [v128 setSceneClassifications:sceneClassifications ofType:2 version:v65 timestamp:v66];
  }

  if (self->_audioClassifications)
  {
    PHAssetMediaSubtype v67 = -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes");
    if ((v67 & 0x20000) == 0)
    {
      uint64_t v69 = MediaAnalysisLogLevel(v67, v68);
      if ((int)v69 >= 7)
      {
        uint64_t v71 = VCPLogInstance(v69, v70);
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
        os_log_type_t v73 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v72, v73))
        {
          unsigned int v74 = -[NSSet count](self->_audioClassifications, "count");
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v150 = v74;
          *(_WORD *)&v150[4] = 2112;
          *(void *)&v150[6] = v75;
          _os_log_impl( (void *)&_mh_execute_header,  v72,  v73,  "publish %d audio classifications to movie %@",  buf,  0x12u);
        }
      }

      audioClassifications = self->_audioClassifications;
      __int16 v77 = VCPPhotosSceneProcessingVersionInternal();
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset adjustmentVersion](self->_asset, "adjustmentVersion"));
      [v128 setSceneClassifications:audioClassifications ofType:3 version:v77 timestamp:v78];
    }
  }

  if (self->_facesToAdd)
  {
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v139 = 0u;
    __int128 v140 = 0u;
    __int128 v137 = 0u;
    __int128 v138 = 0u;
    v131 = self->_facesToAdd;
    id v79 = -[NSArray countByEnumeratingWithState:objects:count:]( v131,  "countByEnumeratingWithState:objects:count:",  &v137,  v152,  16LL);
    if (!v79) {
      goto LABEL_80;
    }
    *(void *)typea = 0LL;
    id obja = *(id *)v138;
    os_log_type_t v129 = VCPLogToOSLogType[3];
    os_log_type_t v130 = VCPLogToOSLogType[7];
    while (1)
    {
      for (j = 0LL; j != v79; j = (char *)j + 1)
      {
        if (*(id *)v138 != obja) {
          objc_enumerationMutation(v131);
        }
        uint64_t v81 = *(void *)(*((void *)&v137 + 1) + 8LL * (void)j);
        v82 = (void *)objc_claimAutoreleasedReturnValue( +[PHFaceChangeRequest creationRequestForFace]( &OBJC_CLASS___PHFaceChangeRequest,  "creationRequestForFace"));
        v84 = (void *)objc_claimAutoreleasedReturnValue([v82 placeholderForCreatedFace]);
        if (!v84)
        {
          uint64_t v106 = MediaAnalysisLogLevel(0LL, v83);
          uint64_t v108 = VCPLogInstance(v106, v107);
          v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
          if (os_log_type_enabled(v99, v129))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v99,  v129,  " VCPMovieChangeEntry failed to create faceChangRequest",  buf,  2u);
          }

          goto LABEL_77;
        }

        [v82 setGroupingIdentifier:kVideoFaceGroupIdentifier];
        [v82 setFaceprint:v81];
        [v82 setDetectionType:1];
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset faceAdjustmentVersion](self->_asset, "faceAdjustmentVersion"));
        [v82 setAdjustmentVersion:v85];

        else {
          uint64_t v86 = 11LL;
        }
        [v82 setFaceAlgorithmVersion:v86];
        [v82 setCenterX:0.5];
        [v82 setCenterY:0.5];
        [v82 setSize:0.5];
        [v82 setStartTime:0.0];
        -[PHAsset duration](self->_asset, "duration");
        objc_msgSend(v82, "setDuration:");
        v87 = (char *)j + *(void *)typea;
        humanActionsForFacesToAdd = self->_humanActionsForFacesToAdd;
        v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (char *)j + *(void *)typea));
        v90 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( humanActionsForFacesToAdd,  "objectForKeyedSubscript:",  v89));
        LOBYTE(humanActionsForFacesToAdd) = v90 == 0LL;

        if ((humanActionsForFacesToAdd & 1) == 0)
        {
          v91 = self->_humanActionsForFacesToAdd;
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v87));
          v93 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", v92));
          [v82 setDetectionTraits:v93];
        }

        id v94 = [v132 addObject:v84];
        uint64_t v96 = MediaAnalysisLogLevel(v94, v95);
        if ((int)v96 >= 7)
        {
          uint64_t v98 = VCPLogInstance(v96, v97);
          v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
          if (os_log_type_enabled(v99, v130))
          {
            v100 = (void *)objc_claimAutoreleasedReturnValue([v84 localIdentifier]);
            v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
            v102 = self->_humanActionsForFacesToAdd;
            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v87));
            v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v102, "objectForKeyedSubscript:", v103));
            unsigned int v105 = [v104 count];
            *(_DWORD *)buf = 138412802;
            *(void *)v150 = v100;
            *(_WORD *)&v150[8] = 2112;
            *(void *)&v150[10] = v101;
            *(_WORD *)&v150[18] = 1024;
            unsigned int v151 = v105;
            _os_log_impl( (void *)&_mh_execute_header,  v99,  v130,  "Created new video PHFace [%@] for asset [%@], with %d traits",  buf,  0x1Cu);
          }

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- ($A71F62C2B947990EEEAFC21D5CFDCAFE)summaryTimeRange
{
  __int128 v3 = *(_OWORD *)&self[4].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var1.var0;
  return self;
}

- (void)setSummaryTimeRange:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0.var0;
  __int128 v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_summaryTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_summaryTimeRange.start.int64_t epoch = v4;
  *(_OWORD *)&self->_summaryTimeRange.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)keyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setKeyFrameTime:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  self->_keyFrameTime.int64_t epoch = a3->var3;
  *(_OWORD *)&self->_keyFrameTime.value = v3;
}

- (float)autoplayScore
{
  return self->_autoplayScore;
}

- (void)setAutoplayScore:(float)a3
{
  self->_autoplayScore = a3;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (void)setVideoScore:(float)a3
{
  self->_videoScore = a3;
}

- (float)activityScore
{
  return self->_activityScore;
}

- (void)setActivityScore:(float)a3
{
  self->_activityScore = a3;
}

- (unint64_t)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(unint64_t)a3
{
  self->_faceCount = a3;
}

- (CGImage)keyFrameResource
{
  return self->_keyFrameResource;
}

- (void)setKeyFrameResource:(CGImage *)a3
{
  self->_keyFrameResource = a3;
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

- (NSArray)facesToAdd
{
  return self->_facesToAdd;
}

- (void)setFacesToAdd:(id)a3
{
}

- (NSDictionary)humanActionsForFacesToAdd
{
  return self->_humanActionsForFacesToAdd;
}

- (void)setHumanActionsForFacesToAdd:(id)a3
{
}

- (signed)audioClassification
{
  return self->_audioClassification;
}

- (void)setAudioClassification:(signed __int16)a3
{
  self->_audioClassification = a3;
}

- (NSDictionary)humanActions
{
  return self->_humanActions;
}

- (void)setHumanActions:(id)a3
{
}

- (NSSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
}

- (NSSet)audioClassifications
{
  return self->_audioClassifications;
}

- (void)setAudioClassifications:(id)a3
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