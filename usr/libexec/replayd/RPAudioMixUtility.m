@interface RPAudioMixUtility
+ (id)exportPresetForAVAsset:(id)a3;
+ (id)tempFileURL;
+ (id)videoCodecTypeForAVAsset:(id)a3;
+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6;
+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation RPAudioMixUtility

+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001D024;
  v9[3] = &unk_100071460;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[RPAudioMixUtility tempFileURL](&OBJC_CLASS___RPAudioMixUtility, "tempFileURL"));
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]( &OBJC_CLASS___RPAudioMixUtility,  "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:",  v6,  v7,  AVFileTypeMPEG4,  v9);
}

+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    if (dword_100084688 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 33;
        __int16 v42 = 2112;
        id v43 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d movieURL  %@",  buf,  0x1Cu);
      }

      if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        __int16 v40 = 1024;
        int v41 = 34;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d finalMovieURL %@",  buf,  0x1Cu);
      }
    }

    id v29 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](&OBJC_CLASS___AVAsset, "assetWithURL:", v9));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[RPAudioMixUtility exportPresetForAVAsset:]( &OBJC_CLASS___RPAudioMixUtility,  "exportPresetForAVAsset:",  v13));
    v14 = -[AVAssetExportSession initWithAsset:presetName:]( objc_alloc(&OBJC_CLASS___AVAssetExportSession),  "initWithAsset:presetName:",  v13,  v26);
    id v28 = v10;
    -[AVAssetExportSession setOutputURL:](v14, "setOutputURL:", v10);
    id v27 = v11;
    -[AVAssetExportSession setOutputFileType:](v14, "setOutputFileType:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 tracksWithMediaType:AVMediaTypeAudio]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[AVMutableAudioMixInputParameters audioMixInputParameters]( &OBJC_CLASS___AVMutableAudioMixInputParameters,  "audioMixInputParameters"));
          objc_msgSend(v23, "setTrackID:", objc_msgSend(v22, "trackID"));
          [v16 addObject:v23];
        }

        id v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v19);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableAudioMix audioMix](&OBJC_CLASS___AVMutableAudioMix, "audioMix"));
    [v24 setInputParameters:v16];
    -[AVAssetExportSession setAudioMix:](v14, "setAudioMix:", v24);
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
      __int16 v40 = 1024;
      int v41 = 63;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d starting export session",  buf,  0x12u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10001D4D4;
    v30[3] = &unk_100070DC0;
    v31 = v14;
    id v32 = v12;
    v25 = v14;
    -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:]( v25,  "exportAsynchronouslyWithCompletionHandler:",  v30);

    id v10 = v28;
    id v9 = v29;
    id v11 = v27;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError _rpUserErrorForCode:userInfo:]( &OBJC_CLASS___NSError,  "_rpUserErrorForCode:userInfo:",  -5818LL,  0LL));
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
  }
}

+ (id)tempFileURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _srTempPath]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/RPReplay_Final",  v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSince1970];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", (uint64_t)v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@%@",  v4,  v7,  @".mp4"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));

  return v9;
}

+ (id)videoCodecTypeForAVAsset:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 tracksWithMediaType:AVMediaTypeVideo]);
  if ([v3 count] != (id)1)
  {
    id v5 = 0LL;
    v4 = 0LL;
    goto LABEL_14;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 formatDescriptions]);
  if ([v5 count] != (id)1)
  {
LABEL_14:
    id v9 = 0LL;
    goto LABEL_6;
  }

  double v6 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v6);

  id v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100030BDC(MediaSubType));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446722;
    v13 = "+[RPAudioMixUtility videoCodecTypeForAVAsset:]";
    __int16 v14 = 1024;
    int v15 = 111;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d videoCodecType=%@",  (uint8_t *)&v12,  0x1Cu);
  }

+ (id)exportPresetForAVAsset:(id)a3
{
  v4 = AVAssetExportPresetHighestQuality;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RPAudioMixUtility videoCodecTypeForAVAsset:]( &OBJC_CLASS___RPAudioMixUtility,  "videoCodecTypeForAVAsset:",  a3));
  double v6 = v5;
  if (v5)
  {
    if (![v5 isEqualToString:AVVideoCodecTypeHEVC])
    {
      if ([v6 isEqualToString:AVVideoCodecTypeH264])
      {
        int v11 = 136446466;
        int v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v13 = 1024;
        int v14 = 124;
        id v9 = " [INFO] %{public}s:%d AVAssetExportPresetHighestQuality for H264";
        uint32_t v10 = 18;
      }

      else
      {
        int v11 = 136446722;
        int v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        __int16 v13 = 1024;
        int v14 = 127;
        __int16 v15 = 2112;
        __int16 v16 = v6;
        id v9 = " [INFO] %{public}s:%d videoCodecType=%@, use default preset";
        uint32_t v10 = 28;
      }

      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v9,  (uint8_t *)&v11,  v10);
      goto LABEL_7;
    }

    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      int v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
      __int16 v13 = 1024;
      int v14 = 121;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d AVAssetExportPresetHEVCHighestQuality for HEVC",  (uint8_t *)&v11,  0x12u);
    }

    id v7 = AVAssetExportPresetHEVCHighestQuality;

    v4 = v7;
  }

  else if (dword_100084688 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100043E04();
  }

@end