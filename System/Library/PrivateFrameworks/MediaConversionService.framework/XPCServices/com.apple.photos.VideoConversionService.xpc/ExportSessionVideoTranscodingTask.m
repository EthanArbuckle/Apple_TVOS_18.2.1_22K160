@interface ExportSessionVideoTranscodingTask
+ (id)videoDateFormatter;
- (AVAssetExportSession)exportSession;
- (BOOL)hasProgress;
- (double)currentFractionCompleted;
- (id)exportPresetName;
- (id)exportSessionCompletionHandler;
- (id)exportSessionForInputAsset:(id)a3 presetName:(id)a4;
- (id)metadataItemsFromOptionsAndInputAsset:(id)a3;
- (id)outputFileTypeForExportSession:(id)a3;
- (void)addOutputMetadataFromOptionsAndInputAsset:(id)a3 toExportSession:(id)a4;
- (void)cancelTranscode;
- (void)configureOutputForExportSession:(id)a3 outputFileType:(id)a4;
- (void)dumpStatistics;
- (void)performExport;
- (void)performMetadataTrackExtractionConversion;
- (void)performPassthroughConversion;
- (void)setExportSession:(id)a3;
- (void)startExportSession:(id)a3;
@end

@implementation ExportSessionVideoTranscodingTask

+ (id)videoDateFormatter
{
  if (qword_100039790 != -1) {
    dispatch_once(&qword_100039790, &stru_100030F98);
  }
  return (id)qword_100039798;
}

- (void)performExport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
  if (!v3)
  {
    -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
    -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
    goto LABEL_32;
  }

  if (!-[VideoConversionTask isMetadataTrackExtractionConversion](self, "isMetadataTrackExtractionConversion"))
  {
    if (-[VideoConversionTask isPassthroughConversion](self, "isPassthroughConversion"))
    {
      -[ExportSessionVideoTranscodingTask performPassthroughConversion](self, "performPassthroughConversion");
      goto LABEL_32;
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportPresetName](self, "exportPresetName"));
    if (!v4)
    {
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      v54 = @"Unable to determine export preset";
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  v13));
      -[VideoConversionTask setError:](self, "setError:", v14);

      -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
      -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
LABEL_31:

      goto LABEL_32;
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities tracksWithMediaType:forAsset:]( &OBJC_CLASS___PFMediaUtilities,  "tracksWithMediaType:forAsset:",  AVMediaTypeVideo,  v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

    if (!v6)
    {
      -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      v52 = @"Unable to get input asset video track";
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  v15));
      -[VideoConversionTask setError:](self, "setError:", v16);

      -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
LABEL_30:

      goto LABEL_31;
    }

    uint64_t v41 = 0LL;
    v42 = &v41;
    uint64_t v43 = 0x3032000000LL;
    v44 = sub_10001267C;
    v45 = sub_10001268C;
    id v7 = v3;
    id v46 = v7;
    uint64_t v35 = 0LL;
    v36 = &v35;
    uint64_t v37 = 0x3032000000LL;
    v38 = sub_10001267C;
    v39 = sub_10001268C;
    id v40 = 0LL;
    if (-[VideoTranscodingTask hasSlowMotionAdjustments](self, "hasSlowMotionAdjustments"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionVideoAdjustmentsPropertyListKey"]);

      id v10 = [[PFVideoAdjustments alloc] initWithPropertyListDictionary:v9];
      if (!v10)
      {
        id v30 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
          *(_DWORD *)buf = 138543618;
          v48 = v32;
          __int16 v49 = 2114;
          v50 = v9;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create adjustments for conversion task %{public}@ from property list %{public}@",  buf,  0x16u);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  6LL,  0LL));
        -[VideoConversionTask setError:](self, "setError:", v31);

        -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
        goto LABEL_28;
      }

      id v11 = objc_alloc(&OBJC_CLASS___PFVideoAVObjectBuilder);
      id v12 = [v11 initWithVideoAsset:v42[5] videoAdjustments:v10];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100014BB0;
      v34[3] = &unk_100030FC0;
      v34[4] = self;
      v34[5] = &v35;
      v34[6] = &v41;
      [v12 requestExportSessionWithExportPreset:v4 resultHandler:v34];
    }

    else
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask exportSessionForInputAsset:presetName:]( self,  "exportSessionForInputAsset:presetName:",  v42[5],  v4));
      v9 = (void *)v36[5];
      v36[5] = v17;
    }

    if (!v36[5])
    {
LABEL_29:
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v41, 8);
      goto LABEL_30;
    }

    v18 = (void *)objc_opt_class(self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
    v20 = (void *)v42[5];
    if (v20) {
      [v20 duration];
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }
    double Seconds = CMTimeGetSeconds(&v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    id v23 = [v18 shouldMaximizeVideoConversionPowerEfficiencyForOptions:v19 inputAssetDuration:v22 taskIdentifier:Seconds];
    [(id)v36[5] setMaximizePowerEfficiency:v23];

    v9 = (void *)objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask outputFileTypeForExportSession:]( self,  "outputFileTypeForExportSession:",  v36[5]));
    if (v9)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
      v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAudioTrackGroupHandlingKey"]);

      if (v25)
      {
        id v26 = [v25 integerValue];
        [(id)v36[5] setAudioTrackGroupHandling:v26];
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options", v33.value, *(void *)&v33.timescale, v33.epoch));
      v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVIncludeMetadataKey"]);
      unsigned int v29 = [v28 BOOLValue];

      if (v29) {
        -[ExportSessionVideoTranscodingTask addOutputMetadataFromOptionsAndInputAsset:toExportSession:]( self,  "addOutputMetadataFromOptionsAndInputAsset:toExportSession:",  v7,  v36[5]);
      }
      [(id)v36[5] setShouldOptimizeForNetworkUse:1];
      [(id)v36[5] setAudioTimePitchAlgorithm:AVAudioTimePitchAlgorithmVarispeed];
      -[ExportSessionVideoTranscodingTask configureOutputForExportSession:outputFileType:]( self,  "configureOutputForExportSession:outputFileType:",  v36[5],  v9);
      -[ExportSessionVideoTranscodingTask startExportSession:](self, "startExportSession:", v36[5]);
    }

- (void)configureOutputForExportSession:(id)a3 outputFileType:(id)a4
{
  id v6 = a3;
  [v6 setOutputFileType:a4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[VideoConversionTask outputMainResourceURL](self, "outputMainResourceURL"));
  [v6 setOutputURL:v7];
}

- (void)startExportSession:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100014B64;
  v4[3] = &unk_100030FE8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[VideoTranscodingTask transitionToRunningStateAndConditionallyRunBlock:]( v5,  "transitionToRunningStateAndConditionallyRunBlock:",  v4);
}

- (id)exportSessionCompletionHandler
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000147A4;
  v3[3] = &unk_100030F78;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (BOOL)hasProgress
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (double)currentFractionCompleted
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));
  [v3 progress];
  double v5 = v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2048;
    id v12 = [v7 status];
    __int16 v13 = 2048;
    double v14 = v5 * 100.0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Export session export status for conversion task %{public}@: %ld, progress %.1f",  (uint8_t *)&v9,  0x20u);
  }

  return v5;
}

- (void)cancelTranscode
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));

  if (!v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:909 description:@"Unexpected missing video export session with job in running state"];
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    int v8 = 138543362;
    int v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancelling export session conversion task %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));
  [v6 cancelExport];
}

- (void)performPassthroughConversion
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask exportSessionForInputAsset:presetName:]( self,  "exportSessionForInputAsset:presetName:",  v3,  AVAssetExportPresetPassthrough));

  float v4 = (void *)v7;
  if (v7)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask outputFileTypeForExportSession:]( self,  "outputFileTypeForExportSession:",  v7));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
      -[ExportSessionVideoTranscodingTask addOutputMetadataFromOptionsAndInputAsset:toExportSession:]( self,  "addOutputMetadataFromOptionsAndInputAsset:toExportSession:",  v6,  v7);

      -[ExportSessionVideoTranscodingTask configureOutputForExportSession:outputFileType:]( self,  "configureOutputForExportSession:outputFileType:",  v7,  v5);
      -[ExportSessionVideoTranscodingTask startExportSession:](self, "startExportSession:", v7);
    }

    float v4 = (void *)v7;
  }
}

- (void)performMetadataTrackExtractionConversion
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities tracksWithMediaType:forAsset:]( &OBJC_CLASS___PFMediaUtilities,  "tracksWithMediaType:forAsset:",  AVMediaTypeMetadata,  v4));

  if ([v5 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 count];
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Metadata track extraction job %{public}@: found %lu input metadata tracks in asset %@",  buf,  0x20u);
    }

    unsigned int v29 = v3;
    id v30 = self;
    int v9 = (void *)objc_opt_new(&OBJC_CLASS___AVMutableComposition, v6);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    v28 = v5;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v9 addMutableTrackWithMediaType:AVMediaTypeMetadata preferredTrackID:0]);
          if (v15)
          {
            [v15 timeRange];
          }

          else
          {
            __int128 v43 = 0u;
            memset(buf, 0, sizeof(buf));
          }

          *(_OWORD *)id v40 = *(_OWORD *)buf;
          *(_OWORD *)&v40[16] = *(_OWORD *)&buf[16];
          __int128 v41 = v43;
          __int128 v31 = *(_OWORD *)buf;
          uint64_t v32 = *(void *)&buf[16];
          id v33 = 0LL;
          unsigned __int8 v17 = [v16 insertTimeRange:v40 ofTrack:v15 atTime:&v31 error:&v33];
          id v18 = v33;
          v19 = v18;
          if ((v17 & 1) == 0)
          {
            -[VideoConversionTask setStatus:](v30, "setStatus:", 2LL);
            v38[0] = NSLocalizedDescriptionKey;
            BOOL v3 = v29;
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to create export session for job %@",  v29));
            v38[1] = NSUnderlyingErrorKey;
            v39[0] = v20;
            v39[1] = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  2LL));
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  8LL,  v21));
            -[VideoConversionTask setError:](v30, "setError:", v22);

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](v30, "asset"));
              *(_DWORD *)id v40 = 138544130;
              *(void *)&v40[4] = v29;
              *(_WORD *)&v40[12] = 2114;
              *(void *)&v40[14] = v15;
              *(_WORD *)&v40[22] = 2112;
              *(void *)&v40[24] = v27;
              LOWORD(v41) = 2114;
              *(void *)((char *)&v41 + 2) = v19;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Metadata track extraction job %{public}@: Unable to insert metadata track %{public}@ of input asset %@: %{public}@",  v40,  0x2Au);
            }

            -[VideoTranscodingTask callCompletionHandler](v30, "callCompletionHandler");

            goto LABEL_22;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v10 = (id)objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask exportSessionForInputAsset:presetName:]( v30,  "exportSessionForInputAsset:presetName:",  v9,  AVAssetExportPresetPassthrough));
    if (v10)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask outputFileTypeForExportSession:]( v30,  "outputFileTypeForExportSession:",  v10));
      if (v16)
      {
        -[ExportSessionVideoTranscodingTask configureOutputForExportSession:outputFileType:]( v30,  "configureOutputForExportSession:outputFileType:",  v10,  v16);
        -[ExportSessionVideoTranscodingTask startExportSession:](v30, "startExportSession:", v10);
      }

      BOOL v3 = v29;
LABEL_22:
      double v5 = v28;
    }

    else
    {
      double v5 = v28;
      BOOL v3 = v29;
    }
  }

  else
  {
    -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Metadata track extraction for job %@ failed because the input video has no metadata tracks",  v3));
    id v46 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  7LL,  v24));
    -[VideoConversionTask setError:](self, "setError:", v25);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Metadata track extraction job %{public}@: input asset has no metadata tracks: %@",  buf,  0x16u);
    }

    -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
  }
}

- (id)exportSessionForInputAsset:(id)a3 presetName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = -[AVAssetExportSession initWithAsset:presetName:]( objc_alloc(&OBJC_CLASS___AVAssetExportSession),  "initWithAsset:presetName:",  v6,  v7);

  if (!v8)
  {
    -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to create export session for job %@",  v9));
    v19 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  v11));
    -[VideoConversionTask setError:](self, "setError:", v12);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543619;
      v15 = v9;
      __int16 v16 = 2113;
      id v17 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to create export session for job %{public}@, asset %{private}@",  buf,  0x16u);
    }

    -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
  }

  return v8;
}

- (void)addOutputMetadataFromOptionsAndInputAsset:(id)a3 toExportSession:(id)a4
{
  id v11 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ExportSessionVideoTranscodingTask metadataItemsFromOptionsAndInputAsset:]( self,  "metadataItemsFromOptionsAndInputAsset:",  a3));
  [v11 setMetadata:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"]);
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AVMetadataItemFilter metadataItemFilterForSharing]( &OBJC_CLASS___AVMetadataItemFilter,  "metadataItemFilterForSharing"));
    [v11 setMetadataItemFilter:v10];
  }
}

- (id)metadataItemsFromOptionsAndInputAsset:(id)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue([a3 metadata]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, v6);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"]);
  unsigned int v9 = [v8 BOOLValue];

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataLocationKey"]);
  id v11 = (void *)v10;
  if (!v9 || v10)
  {
    [v7 addObject:AVMetadataIdentifierQuickTimeMetadataLocationISO6709];
    [v7 addObject:AVMetadataIdentifierQuickTimeUserDataLocationISO6709];
    [v7 addObject:AVMetadataIdentifier3GPUserDataLocation];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeDescriptionKey"]);
  unsigned int v13 = [v12 BOOLValue];

  uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataDescriptionKey"]);
  v15 = (void *)v14;
  if (!v13 || v14)
  {
    [v7 addObject:AVMetadataCommonIdentifierDescription];
    [v7 addObject:AVMetadataIdentifierQuickTimeMetadataDescription];
    [v7 addObject:AVMetadataIdentifierQuickTimeUserDataDescription];
    [v7 addObject:AVMetadataIdentifier3GPUserDataDescription];
  }

  v59 = v15;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeAccessibilityDescriptionKey"]);
  unsigned int v17 = [v16 BOOLValue];

  uint64_t v18 = objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataAccessibilityDescriptionKey"]);
  v19 = (void *)v18;
  if (!v17 || v18) {
    [v7 addObject:AVMetadataCommonKeyAccessibilityDescription];
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataKeywordsKey"]);
  if (v61) {
    [v7 addObject:AVMetadataIdentifierQuickTimeMetadataKeywords];
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateKey"]);
  if (v60)
  {
    [v7 addObject:AVMetadataCommonIdentifierCreationDate];
    [v7 addObject:AVMetadataIdentifierQuickTimeUserDataCreationDate];
    [v7 addObject:AVMetadataIdentifierQuickTimeMetadataCreationDate];
  }

  v56 = v19;
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataTitleKey"]);
  if (v20) {
    [v7 addObject:AVMetadataIdentifierQuickTimeMetadataTitle];
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v62 = (void *)v20;
  v57 = self;
  v58 = v11;
  if ([v4 count])
  {
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    v55 = v4;
    id v22 = v4;
    id v23 = [v22 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v68 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier", v55));
          unsigned __int8 v29 = [v7 containsObject:v28];

          if ((v29 & 1) == 0) {
            [v21 addObject:v27];
          }
        }

        id v24 = [v22 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }

      while (v24);
    }

    float v4 = v55;
    self = v57;
    id v11 = v58;
    uint64_t v20 = (uint64_t)v62;
  }

  if (v11)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 iso6709Notation]);
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v31 setKeySpace:AVMetadataKeySpaceCommon];
    [v31 setKey:AVMetadataCommonKeyLocation];
    [v31 setValue:v30];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    [v31 setLocale:v32];

    [v21 addObject:v31];
    uint64_t v20 = (uint64_t)v62;
  }

  if (objc_msgSend(v61, "count", v55))
  {
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v33 = v61;
    id v34 = [v33 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v64;
LABEL_32:
      uint64_t v37 = 0LL;
      while (1)
      {
        if (*(void *)v64 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8 * v37);
        uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0) {
          break;
        }
        if (v35 == (id)++v37)
        {
          id v35 = [v33 countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (v35) {
            goto LABEL_32;
          }
          goto LABEL_38;
        }
      }
    }

    else
    {
LABEL_38:

      id v33 = (id)objc_claimAutoreleasedReturnValue([v33 componentsJoinedByString:@","]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
      [v40 setIdentifier:AVMetadataIdentifierQuickTimeMetadataKeywords];
      [v40 setValue:v33];
      [v21 addObject:v40];
    }

    self = v57;
    id v11 = v58;
    uint64_t v20 = (uint64_t)v62;
  }

  if (v60)
  {
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v41 setKeySpace:AVMetadataKeySpaceCommon];
    [v41 setKey:AVMetadataCommonKeyCreationDate];
    id v42 = [(id)objc_opt_class(self) videoDateFormatter];
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateTimeZoneOffsetKey"]);
    NSErrorUserInfoKey v45 = v44;
    if (v44)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneForSecondsFromGMT:]( NSTimeZone,  "timeZoneForSecondsFromGMT:",  [v44 integerValue]));
      [v43 setTimeZone:v46];
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v43 stringFromDate:v60]);
    [v41 setValue:v47];
    [v21 addObject:v41];

    uint64_t v20 = (uint64_t)v62;
  }

  if (v20)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v48 setIdentifier:AVMetadataIdentifierQuickTimeMetadataTitle];
    [v48 setValue:v20];
    [v21 addObject:v48];
  }

  if (v59)
  {
    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v49 setKeySpace:AVMetadataKeySpaceCommon];
    [v49 setKey:AVMetadataCommonKeyDescription];
    [v49 setValue:v59];
    [v21 addObject:v49];
  }

  if (v56)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
    [v50 setKeySpace:AVMetadataKeySpaceCommon];
    [v50 setKey:AVMetadataCommonKeyAccessibilityDescription];
    [v50 setValue:v56];
    [v21 addObject:v50];
  }

  NSErrorUserInfoKey v51 = (void *)objc_opt_class(self);
  id v52 = [v21 copy];
  NSErrorUserInfoKey v53 = (void *)objc_claimAutoreleasedReturnValue([v51 metadataItemsByApplyingSignatureMetadataFromOptions:v5 toMetadataItems:v52]);

  return v53;
}

- (id)exportPresetName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"PAMediaConversionServiceOptionExportPresetNameKey"]);

  if (!v3) {
    BOOL v3 = AVAssetExportPreset1280x720;
  }
  return v3;
}

- (id)outputFileTypeForExportSession:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1149, @"Invalid parameter not satisfying: %@", @"exportSession" object file lineNumber description];
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask options](self, "options"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"PAMediaConversionServiceOptionOutputFileTypeKey"]);

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 supportedFileTypes]);
  unsigned int v9 = v8;
  if (!v7 || ([v8 containsObject:v7] & 1) == 0)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 firstObject]);

    id v7 = (void *)v10;
    if (!v10)
    {
      -[VideoConversionTask setStatus:](self, "setStatus:", 2LL);
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      __int16 v16 = @"Unable to determine export output file type";
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PAMediaConversionServiceErrorDomain",  3LL,  v11));
      -[VideoConversionTask setError:](self, "setError:", v12);

      -[VideoTranscodingTask callCompletionHandler](self, "callCompletionHandler");
      id v7 = 0LL;
    }
  }

  return v7;
}

- (void)dumpStatistics
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask conversionEndTime](self, "conversionEndTime"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask conversionStartTime](self, "conversionStartTime"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask asset](self, "asset"));
  int v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[PFMediaUtilities tracksWithMediaType:forAsset:]( &OBJC_CLASS___PFMediaUtilities,  "tracksWithMediaType:forAsset:",  AVMediaTypeVideo,  v8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  [v11 nominalFrameRate];
  float v13 = v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v14 = v13;
    float v15 = Seconds * v14 / v6;
    float v16 = v6 / Seconds;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[VideoConversionTask identifier](self, "identifier"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[ExportSessionVideoTranscodingTask exportSession](self, "exportSession"));
    id v19 = [v18 status];
    *(_DWORD *)buf = 138544898;
    id v22 = v17;
    __int16 v23 = 2048;
    id v24 = v19;
    __int16 v25 = 2048;
    double v26 = v6;
    __int16 v27 = 2048;
    double v28 = Seconds;
    __int16 v29 = 2048;
    double v30 = v14;
    __int16 v31 = 2048;
    double v32 = v16;
    __int16 v33 = 2048;
    double v34 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Export session for conversion task %{public}@ finished, status %ld, conversion duration %.1fs, input asset duratio n %.1fs (%.1ffps), %.1f x realtime (%.1ffps)",  buf,  0x48u);
  }
}

- (AVAssetExportSession)exportSession
{
  return (AVAssetExportSession *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setExportSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end