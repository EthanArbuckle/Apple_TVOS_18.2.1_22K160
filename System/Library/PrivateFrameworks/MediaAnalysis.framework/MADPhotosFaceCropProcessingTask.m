@interface MADPhotosFaceCropProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4;
+ (id)taskWithPhotoLibrary:(id)a3 andGallery:(id)a4;
- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4;
- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andGallery:(id)a4;
- (unint64_t)count;
- (void)_processEntries;
- (void)addFaceCrop:(id)a3;
- (void)process;
@end

@implementation MADPhotosFaceCropProcessingTask

- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v7, "mad_useVUGallery");
  if ((_DWORD)v9)
  {
    uint64_t v11 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v11 >= 3)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "[MADPhotosFaceCropProcessingTask] VCPFaceClusterer is disabled",  buf,  2u);
      }
    }

    v16 = 0LL;
  }

  else
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___MADPhotosFaceCropProcessingTask;
    v17 = -[MADProcessingTask init](&v22, "init");
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_photoLibrary, a3);
      objc_storeStrong((id *)&v18->_faceClusterer, a4);
      uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      faceCropEntries = v18->_faceCropEntries;
      v18->_faceCropEntries = (NSMutableArray *)v19;
    }

    self = v18;
    v16 = self;
  }

  return v16;
}

- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andGallery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v7, "mad_useVUGallery");
  if ((v9 & 1) != 0)
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___MADPhotosFaceCropProcessingTask;
    uint64_t v11 = -[MADProcessingTask init](&v22, "init");
    uint64_t v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_photoLibrary, a3);
      objc_storeStrong((id *)&v12->_gallery, a4);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      faceCropEntries = v12->_faceCropEntries;
      v12->_faceCropEntries = (NSMutableArray *)v13;
    }

    self = v12;
    os_log_type_t v15 = self;
  }

  else
  {
    uint64_t v16 = MediaAnalysisLogLevel(v9, v10);
    if ((int)v16 >= 3)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MADPhotosFaceCropProcessingTask] Gallery is not enabled",  buf,  2u);
      }
    }

    os_log_type_t v15 = 0LL;
  }

  return v15;
}

+ (id)taskWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithPhotoLibrary:v7 andFaceClusterer:v6];

  return v8;
}

+ (id)taskWithPhotoLibrary:(id)a3 andGallery:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithPhotoLibrary:v7 andGallery:v6];

  return v8;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_faceCropEntries, "count");
}

- (void)addFaceCrop:(id)a3
{
  id v4 = a3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v23 = self;
  v5 = self->_faceCropEntries;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)i) faceCrop]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localIdentifier]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
          if ((int)v17 >= 4)
          {
            uint64_t v19 = VCPLogInstance(v17, v18);
            os_log_type_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            os_log_type_t v21 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v20, v21))
            {
              objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v4 localIdentifier]);
              *(_DWORD *)buf = 138412290;
              v29 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[FaceCrop][%@] Batch already contains face crop; ignoring",
                buf,
                0xCu);
            }
          }

          goto LABEL_14;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v24,  v30,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  faceCropEntries = v23->_faceCropEntries;
  v5 = -[MADPhotosFaceCropProcessingEntry initWithFaceCrop:]( objc_alloc(&OBJC_CLASS___MADPhotosFaceCropProcessingEntry),  "initWithFaceCrop:",  v4);
  -[NSMutableArray addObject:](faceCropEntries, "addObject:", v5);
LABEL_14:
}

- (void)_processEntries
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      unsigned int v8 = -[NSMutableArray count](self->_faceCropEntries, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[FaceCrop] Processing %d face crops", buf, 8u);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_faceCropEntries, "firstObject"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 faceCrop]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 photoLibrary]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:]( &OBJC_CLASS___VCPPhotosFaceProcessingContext,  "contextWithPhotoLibrary:",  v11));
  v47 = -[VCPFaceCropManager initWithPhotoLibrary:andContext:]( objc_alloc(&OBJC_CLASS___VCPFaceCropManager),  "initWithPhotoLibrary:andContext:",  v11,  v12);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  if (-[NSMutableArray count](self->_faceCropEntries, "count"))
  {
    uint64_t v14 = 0LL;
    os_log_type_t type = VCPLogToOSLogType[3];
    *(void *)&__int128 v13 = 138412546LL;
    __int128 v43 = v13;
    v44 = v12;
    while (1)
    {
      uint64_t v15 = objc_autoreleasePoolPush();
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
      [v16 pet];

      uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        uint64_t v19 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
        int v20 = v19[2]();

        if (v20) {
          break;
        }
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_faceCropEntries,  "objectAtIndexedSubscript:",  v14,  v43));
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 faceCrop]);

      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localIdentifier]);
      if (v25)
      {
        id v48 = 0LL;
        id v49 = 0LL;
        unsigned __int8 v26 = -[VCPFaceCropManager _processDirtyFaceCrop:faceCropFaceLocalIdentifier:error:]( v47,  "_processDirtyFaceCrop:faceCropFaceLocalIdentifier:error:",  v24,  &v49,  &v48);
        id v27 = v49;
        id v28 = v48;
        v30 = v28;
        if ((v26 & 1) == 0)
        {
          uint64_t v31 = MediaAnalysisLogLevel(v28, v29);
          if ((int)v31 >= 3)
          {
            uint64_t v33 = VCPLogInstance(v31, v32);
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, type))
            {
              v35 = v11;
              v36 = (void *)objc_claimAutoreleasedReturnValue([v24 localIdentifier]);
              *(_DWORD *)buf = v43;
              v51 = v36;
              __int16 v52 = 2112;
              v53 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  type,  "[FaceCrop] Failed to process dirty facecrop %@ - %@",  buf,  0x16u);

              uint64_t v11 = v35;
              uint64_t v12 = v44;
            }
          }
        }

        if (v27) {
          [v46 addObject:v27];
        }
      }

      objc_autoreleasePoolPop(v15);
    }

    uint64_t v37 = MediaAnalysisLogLevel(v21, v22);
    if ((int)v37 >= 5)
    {
      uint64_t v39 = VCPLogInstance(v37, v38);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      os_log_type_t v41 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v40, v41))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "[FaceCrop] Processing canceled", buf, 2u);
      }
    }

    objc_autoreleasePoolPop(v15);
  }

- (void)process
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v4 = VCPSignPostLog(-[VCPTimeMeasurement start](v3, "start"));
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v8 = VCPSignPostLog(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "MADPhotosFaceCropProcessingTask_Process",  (const char *)&unk_100199097,  buf,  2u);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[PHFaceCrop fetchFaceCropsNeedingFaceDetectionWithOptions:]( &OBJC_CLASS___PHFaceCrop,  "fetchFaceCropsNeedingFaceDetectionWithOptions:",  v11));

  if ([v12 count])
  {
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = objc_autoreleasePoolPush();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v13]);
      -[MADPhotosFaceCropProcessingTask addFaceCrop:](self, "addFaceCrop:", v15);

      if (-[MADPhotosFaceCropProcessingTask count](self, "count") >= 0x64) {
        -[MADPhotosFaceCropProcessingTask _processEntries](self, "_processEntries");
      }
      objc_autoreleasePoolPop(v14);
      ++v13;
    }

    while (v13 < (unint64_t)[v12 count]);
  }

  id v16 = -[MADPhotosFaceCropProcessingTask count](self, "count");
  if (v16) {
    id v16 = -[MADPhotosFaceCropProcessingTask _processEntries](self, "_processEntries");
  }
  uint64_t v17 = VCPSignPostLog(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = v18;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v6,  "MADPhotosFaceCropProcessingTask_Process",  (const char *)&unk_100199097,  v21,  2u);
  }

  -[VCPTimeMeasurement stop](v3, "stop");
  int v20 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADCoreAnalyticsManager sharedManager](&OBJC_CLASS___VCPMADCoreAnalyticsManager, "sharedManager"));
  -[VCPTimeMeasurement elapsedTimeSeconds](v3, "elapsedTimeSeconds");
  objc_msgSend( v20,  "accumulateDoubleValue:forField:andEvent:",  @"TotalAnalyzingTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void).cxx_destruct
{
}

@end