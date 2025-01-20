@interface VCPEffectsAssetProcessingTask
+ (id)taskWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (BOOL)autoCancellable;
- (VCPEffectsAssetProcessingTask)initWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5;
- (float)resourceRequirement;
- (int)main;
- (int)persistResults:(id)a3 forAsset:(id)a4;
- (int)processAsset:(id)a3;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPEffectsAssetProcessingTask

- (VCPEffectsAssetProcessingTask)initWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (Block_layout *)a5;
  if ([v9 count])
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___VCPEffectsAssetProcessingTask;
    v12 = -[VCPEffectsAssetProcessingTask init](&v26, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_assets, a3);
      id v14 = objc_retainBlock(v10);
      id progressHandler = v13->_progressHandler;
      v13->_id progressHandler = v14;

      if (v11) {
        v16 = v11;
      }
      else {
        v16 = &stru_1001BC9A8;
      }
      v17 = objc_retainBlock(v16);
      id completionHandler = v13->_completionHandler;
      v13->_id completionHandler = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v13->_assets, "objectAtIndexedSubscript:", 0LL));
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 photoLibrary]);
      photoLibrary = v13->_photoLibrary;
      v13->_photoLibrary = (PHPhotoLibrary *)v20;

      uint64_t v22 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v13->_photoLibrary));
      database = v13->_database;
      v13->_database = (VCPDatabaseWriter *)v22;
    }

    self = v13;
    v24 = self;
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

+ (id)taskWithAssets:(id)a3 progressHandler:(id)a4 andCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)objc_opt_class(a1)) initWithAssets:v8 progressHandler:v9 andCompletionHandler:v10];

  return v11;
}

- (int)persistResults:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_recipe"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary variationCache](self->_photoLibrary, "variationCache"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_recipe", v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 localIdentifier]);
    [v9 saveAnalysisResult:v10 assetIdentifier:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_gatingDescriptions"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000AB15C;
    v35[3] = &unk_1001BC9D0;
    id v13 = v9;
    id v36 = v13;
    id v14 = v7;
    id v37 = v14;
    [v12 enumerateKeysAndObjectsUsingBlock:v35];

    if (objc_msgSend(v6, "vcp_longExposureSugestionState") == (id)1)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vcp_matchingScenes"));
      v16 = (void *)v15;
      if (v15)
      {
        v40 = @"Matching scenes";
        uint64_t v41 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 localIdentifier]);
        [v13 saveGatingResult:v17 forVariationType:3 assetIdentifier:v18];
      }
    }

    photoLibrary = self->_photoLibrary;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000AB274;
    v32[3] = &unk_1001B9E70;
    id v33 = v14;
    id v34 = v6;
    id v31 = 0LL;
    -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v32, &v31);
    id v20 = v31;
    id v21 = [v13 analysisResultForAssetIdentifier:@"invalid"];
    if (v20)
    {
      id v22 = [v20 code];
      uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
      if ((int)v24 >= 3)
      {
        uint64_t v26 = VCPLogInstance(v24, v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        os_log_type_t v28 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v20 description]);
          *(_DWORD *)buf = 138412290;
          v39 = v29;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to persist effects suggestions (%@)", buf, 0xCu);
        }
      }
    }

    else
    {
      LODWORD(v22) = 0;
    }
  }

  else
  {
    LODWORD(v22) = -18;
  }

  return (int)v22;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  0LL));
    completionHandler[2](completionHandler, 0LL, v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VCPEffectsAssetProcessingTask;
  -[VCPEffectsAssetProcessingTask dealloc](&v6, "dealloc");
}

- (float)resourceRequirement
{
  return 1.0;
}

- (int)processAsset:(id)a3
{
  id v4 = a3;
  database = self->_database;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
  id v26 = 0LL;
  -[VCPDatabaseWriter analysisForAsset:analysis:](database, "analysisForAsset:analysis:", v6, &v26);
  id v7 = v26;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_effectsResult"));
  unsigned int v9 = objc_msgSend(v7, "vcp_version");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions"));
  [v10 setIncludedDetectionTypes:&off_1001C90C0];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesInAsset:options:](&OBJC_CLASS___PHFace, "fetchFacesInAsset:options:", v4, v10));
  if ([v22 count])
  {
    BOOL v11 = 1LL;
  }

  else if (((unint64_t)objc_msgSend(v7, "vcp_types") & 0xC) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vcp_results"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:MediaAnalysisFaceResultsKey]);
    BOOL v11 = v13 != 0LL;
  }

  else
  {
    BOOL v11 = 0LL;
  }

  uint64_t v25 = 0LL;
  id v14 = [[VCPEffectsAnalyzer alloc] initWithFlagHasFaceOrPet:v11];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotosAsset assetWithPHAsset:](&OBJC_CLASS___VCPPhotosAsset, "assetWithPHAsset:", v4));
  id v23 = 0LL;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000AB724;
  v24[3] = &unk_1001B9E98;
  v24[4] = self;
  int v16 = [v14 analyzeAsset:v15 onDemand:1 cancel:v24 statsFlags:&v25 results:&v23];
  id v17 = v23;

  if (!v16)
  {
    id v21 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:MediaAnalysisLivePhotoEffectsResultsKey]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:0]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:MediaAnalysisResultAttributesKey]);
  }

  if (!v16)
  {
LABEL_17:
    else {
      int v16 = -18;
    }
  }

  return v16;
}

- (int)main
{
  if (!-[NSArray count](self->_assets, "count")) {
    return -50;
  }
  if (self->_progressHandler) {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[VCPProgressReporter reporterWithIntervalSeconds:andTotalJobCount:andBlock:]( &OBJC_CLASS___VCPProgressReporter,  "reporterWithIntervalSeconds:andTotalJobCount:andBlock:",  1LL,  -[NSArray count](self->_assets, "count"),  self->_progressHandler));
  }
  else {
    unsigned __int8 v3 = 0LL;
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v5 = self->_assets;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
  if (v6)
  {
    uint64_t v8 = *(void *)v23;
    os_log_type_t v9 = VCPLogToOSLogType[4];
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v21 = v7;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_cancel);
        if ((v12 & 1) != 0)
        {
          int v4 = -128;
          goto LABEL_21;
        }

        uint64_t v13 = -[VCPEffectsAssetProcessingTask processAsset:]( self,  "processAsset:",  *(void *)(*((void *)&v22 + 1) + 8LL * (void)i));
        if ((_DWORD)v13)
        {
          uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
          if ((int)v15 >= 4)
          {
            uint64_t v17 = VCPLogInstance(v15, v16);
            v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, v9))
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue([v11 localIdentifier]);
              *(_DWORD *)buf = v21;
              v27 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  v9,  "[%@] Live Photo Effects processing failed for asset",  buf,  0xCu);
            }
          }
        }

        objc_msgSend(v3, "increaseProcessedJobCountByOne", v21, (void)v22);
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v28,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v4 = 0;
LABEL_21:

  return v4;
}

- (int)run
{
  uint64_t v3 = -[VCPEffectsAssetProcessingTask main](self, "main");
  int v5 = v3;
  if ((_DWORD)v3)
  {
    uint64_t v6 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v6 >= 4)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      os_log_type_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Effects asset processing failed", v15, 2u);
      }
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = @"Effects asset processing failed";
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v5,  v11));
    completionHandler[2](completionHandler, 0LL, v13);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }

  return v5;
}

- (void)cancel
{
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end