@interface VCPPausedAnalysis
+ (id)filepathForPhotoLibrary:(id)a3;
+ (id)pausedAnalysis:(id)a3 forAsset:(id)a4;
+ (id)persistedPausedAnalysisFromPhotoLibrary:(id)a3;
- (NSDictionary)analysis;
- (PHAsset)asset;
- (VCPPausedAnalysis)initWithAnalysis:(id)a3 forAsset:(id)a4;
- (VCPPausedAnalysis)initWithFileFromPhotoLibrary:(id)a3;
- (int)persist;
@end

@implementation VCPPausedAnalysis

+ (id)filepathForPhotoLibrary:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "vcp_mediaAnalysisDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"paused.plist"]);

  return v4;
}

- (VCPPausedAnalysis)initWithFileFromPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) filepathForPhotoLibrary:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v7 fileExistsAtPath:v6])
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___VCPPausedAnalysis;
    self = -[VCPPausedAnalysis init](&v20, "init");
    if (self)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v6));
      [v7 removeItemAtPath:v6 error:0];
      if (v8
        && (v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"pausedAnalysis"]),
            analysis = self->_analysis,
            self->_analysis = v9,
            analysis,
            self->_analysis)
        && (v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"localIdentifier"])) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v4,  1LL));
        v21 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  v13,  v12));

        if ([v14 count] == (id)1)
        {
          v15 = (PHAsset *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
          asset = self->_asset;
          self->_asset = v15;

          v17 = self;
        }

        else
        {
          v17 = 0LL;
        }
      }

      else
      {
        v17 = 0LL;
      }
    }

    else
    {
      v17 = 0LL;
    }

    v18 = v17;
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

+ (id)persistedPausedAnalysisFromPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithFileFromPhotoLibrary:v4];

  return v5;
}

- (VCPPausedAnalysis)initWithAnalysis:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___VCPPausedAnalysis;
  v9 = -[VCPPausedAnalysis init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a4);
    objc_storeStrong((id *)&v10->_analysis, a3);
  }

  return v10;
}

+ (id)pausedAnalysis:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithAnalysis:v6 forAsset:v7];

  return v8;
}

- (int)persist
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 5)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
      *(_DWORD *)buf = 138412290;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "  [%@] Persisting paused analysis", buf, 0xCu);
    }
  }

  v9 = (void *)objc_opt_class(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset photoLibrary](self->_asset, "photoLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filepathForPhotoLibrary:v10]);

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = [v12 fileExistsAtPath:v11];
  if ((_DWORD)v13)
  {
    uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v15 >= 4)
    {
      uint64_t v17 = VCPLogInstance(v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      os_log_type_t v19 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v18, v19))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "  Overwriting existing paused analysis", buf, 2u);
      }
    }
  }

  NSFileAttributeKey v36 = NSFileProtectionKey;
  NSFileProtectionType v37 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  objc_super v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier", @"localIdentifier"));
  v34[1] = @"pausedAnalysis";
  v35[0] = v21;
  v35[1] = self->_analysis;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));

  uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v22,  200LL,  0LL,  0LL));
  v25 = (void *)v23;
  if (v23)
  {
    uint64_t v23 = (uint64_t)[v12 createFileAtPath:v11 contents:v23 attributes:v20];
    if ((v23 & 1) != 0)
    {
      int v26 = 0;
      goto LABEL_19;
    }

    int v26 = -20;
  }

  else
  {
    int v26 = -18;
  }

  uint64_t v27 = MediaAnalysisLogLevel(v23, v24);
  if ((int)v27 >= 4)
  {
    uint64_t v29 = VCPLogInstance(v27, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    os_log_type_t v31 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHAsset localIdentifier](self->_asset, "localIdentifier"));
      *(_DWORD *)buf = 138412290;
      v39 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "  [%@] Failed to persist paused analysis", buf, 0xCu);
    }
  }

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
}

@end