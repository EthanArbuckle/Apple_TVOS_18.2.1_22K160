@interface MADPhotosPersonProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6;
+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6;
- (BOOL)_buildAndPromotePersonWithError:(id *)a3 needReclustering:(BOOL *)a4;
- (BOOL)_updateGalleryWithError:(id *)a3;
- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6;
- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6;
- (int)_updateVIPModels;
- (void)process;
- (void)processGallery;
- (void)processLegacy;
@end

@implementation MADPhotosPersonProcessingTask

- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_msgSend(v11, "mad_useVUGallery");
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
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "[MADPhotosPersonProcessingTask] VCPFaceClusterer is disabled",  buf,  2u);
      }
    }

    v21 = 0LL;
  }

  else
  {
    v34.receiver = self;
    v34.super_class = (Class)&OBJC_CLASS___MADPhotosPersonProcessingTask;
    v22 = -[MADProcessingTask init](&v34, "init");
    v23 = v22;
    if (v22)
    {
      p_photoLibrary = (id *)&v22->_photoLibrary;
      objc_storeStrong((id *)&v22->_photoLibrary, a3);
      v23->_requirement = a4;
      objc_storeStrong((id *)&v23->_context, a6);
      objc_storeStrong((id *)&v23->_faceClusterer, a5);
      v25 = -[VCPPersonBuilder initWithPhotoLibrary:andFaceClusterer:andContext:]( objc_alloc(&OBJC_CLASS___VCPPersonBuilder),  "initWithPhotoLibrary:andFaceClusterer:andContext:",  *p_photoLibrary,  v23->_faceClusterer,  v23->_context);
      personBuilder = v23->_personBuilder;
      v23->_personBuilder = v25;

      v27 = -[VCPPhotosPersistenceDelegate initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosPersistenceDelegate),  "initWithPhotoLibrary:",  *p_photoLibrary);
      v28 = -[PNPersonPromoter initWithPhotoLibrary:andDelegate:]( objc_alloc(&OBJC_CLASS___PNPersonPromoter),  "initWithPhotoLibrary:andDelegate:",  *p_photoLibrary,  v27);
      personPromoter = v23->_personPromoter;
      v23->_personPromoter = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_photoLibrary, "vcp_description"));
      uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"[Person][%@]", v30));
      logPrefix = v23->_logPrefix;
      v23->_logPrefix = (NSString *)v31;
    }

    self = v23;
    v21 = self;
  }

  return v21;
}

- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_msgSend(v11, "mad_useVUGallery");
  if ((v14 & 1) != 0)
  {
    v37.receiver = self;
    v37.super_class = (Class)&OBJC_CLASS___MADPhotosPersonProcessingTask;
    uint64_t v16 = -[MADProcessingTask init](&v37, "init");
    uint64_t v17 = v16;
    if (v16)
    {
      p_photoLibrary = (id *)&v16->_photoLibrary;
      objc_storeStrong((id *)&v16->_photoLibrary, a3);
      v17->_requirement = a4;
      objc_storeStrong((id *)&v17->_vuService, a5);
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v11));
      analysisDatabase = v17->_analysisDatabase;
      v17->_analysisDatabase = (VCPDatabaseWriter *)v19;

      objc_storeStrong((id *)&v17->_context, a6);
      v21 = -[VCPPhotosPersistenceDelegate initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosPersistenceDelegate),  "initWithPhotoLibrary:",  *p_photoLibrary);
      persistenceDelegate = v17->_persistenceDelegate;
      v17->_persistenceDelegate = v21;

      v23 = -[PNPersonPromoter initWithPhotoLibrary:andDelegate:]( objc_alloc(&OBJC_CLASS___PNPersonPromoter),  "initWithPhotoLibrary:andDelegate:",  *p_photoLibrary,  v17->_persistenceDelegate);
      personPromoter = v17->_personPromoter;
      v17->_personPromoter = v23;

      v25 = -[PNPetPromoterWrapper initWithLibrary:andDelegate:]( objc_alloc(&OBJC_CLASS___PNPetPromoterWrapper),  "initWithLibrary:andDelegate:",  *p_photoLibrary,  v17->_persistenceDelegate);
      petPromoter = v17->_petPromoter;
      v17->_petPromoter = v25;

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_photoLibrary, "vcp_description"));
      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[GalleryPerson][%@]",  v27));
      logPrefix = v17->_logPrefix;
      v17->_logPrefix = (NSString *)v28;
    }

    self = v17;
    v30 = self;
  }

  else
  {
    uint64_t v31 = MediaAnalysisLogLevel(v14, v15);
    if ((int)v31 >= 3)
    {
      uint64_t v33 = VCPLogInstance(v31, v32);
      objc_super v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      os_log_type_t v35 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v34, v35))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "[MADPhotosPersonProcessingTask] Gallery is not enabled",  buf,  2u);
      }
    }

    v30 = 0LL;
  }

  return v30;
}

+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 requirement:a4 faceClusterer:v11 andContext:v12];

  return v13;
}

+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 requirement:a4 understandingService:v11 andContext:v12];

  return v13;
}

- (int)_updateVIPModels
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%@ Start QuickFaceID model update", buf, 0xCu);
    }
  }

  v9 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  self->_photoLibrary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
  int v11 = -[VCPPhotosQuickFaceIdentificationManager generateVIPModelWithType:ignoreLastGenerationTime:evaluationMode:allowUnverifiedPerson:modelGenerated:extendTimeout:andCancel:]( v9,  "generateVIPModelWithType:ignoreLastGenerationTime:evaluationMode:allowUnverifiedPerson:modelGene rated:extendTimeout:andCancel:",  0LL,  0LL,  0LL,  0LL,  &v29,  &stru_1001BD618,  v10);

  if (!v11)
  {
    if (v29)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v14 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    int v11 = -[VCPPhotosQuickFaceIdentificationManager generateVIPModelWithType:ignoreLastGenerationTime:evaluationMode:allowUnverifiedPerson:modelGenerated:extendTimeout:andCancel:]( v9,  "generateVIPModelWithType:ignoreLastGenerationTime:evaluationMode:allowUnverifiedPerson:modelGe nerated:extendTimeout:andCancel:",  1LL,  0LL,  0LL,  0LL,  &v29,  &stru_1001BD638,  v15);

    if (!v11)
    {
      if (v29)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        [v23 accumulateInt64Value:1 forField:@"PetsVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }

      id v12 = -[PHPhotoLibrary mad_useVUGallery](self->_photoLibrary, "mad_useVUGallery");
      if ((v12 & 1) != 0
        || (id v12 = -[VCPPhotosQuickFaceIdentificationManager classifyVIPPets](v9, "classifyVIPPets"),
            (int v11 = (int)v12) == 0))
      {
        uint64_t v24 = MediaAnalysisLogLevel(v12, v13);
        if ((int)v24 < 6)
        {
          int v11 = 0;
          goto LABEL_13;
        }

        uint64_t v26 = VCPLogInstance(v24, v25);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        os_log_type_t v27 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v19, v27))
        {
          uint64_t v28 = self->_logPrefix;
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v28;
          _os_log_impl((void *)&_mh_execute_header, v19, v27, "%@ Finished QuickFaceID model update", buf, 0xCu);
        }

        int v11 = 0;
        goto LABEL_12;
      }
    }
  }

  uint64_t v16 = MediaAnalysisLogLevel(v12, v13);
  if ((int)v16 >= 3)
  {
    uint64_t v18 = VCPLogInstance(v16, v17);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v19, v20))
    {
      v21 = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v21;
      __int16 v32 = 1024;
      int v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Failed to update QuickFaceID model - %d", buf, 0x12u);
    }

- (void)processLegacy
{
  v259 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v4 = MediaAnalysisLogLevel(v259, v3);
  v272 = self;
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    os_log_type_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%@ Start Legacy Person Processing", buf, 0xCu);
    }
  }

  -[VCPTimeMeasurement start](v259, "start");
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self->_photoLibrary));
  [v10 cacheCurrentFaceProgress];

  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v266 = VCPLogToOSLogType[6];
  os_log_type_t v260 = VCPLogToOSLogType[3];
  int v11 = self;
  do
  {
    id v12 = -[PHPhotoLibrary countOfFaceCropsToBeGenerated](v11->_photoLibrary, "countOfFaceCropsToBeGenerated");
    uint64_t v14 = MediaAnalysisLogLevel(v12, v13);
    if ((int)v14 >= 7)
    {
      uint64_t v16 = VCPLogInstance(v14, v15);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, type))
      {
        uint64_t v18 = v11->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v17, type, "%@ Found %lu face crops to generate", buf, 0x16u);
      }

      int v11 = v272;
    }

    if (v12)
    {
      uint64_t v19 = mach_absolute_time();
      uint64_t v20 = VCPSignPostLog(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      os_signpost_id_t v22 = os_signpost_id_generate(v21);

      uint64_t v24 = VCPSignPostLog(v23);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = v25;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  v22,  "MADPhotosPersonProcessingTaskGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
      }

      os_log_type_t v27 = objc_alloc_init(&OBJC_CLASS___MADPhotosFaceCropGenerationTask);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](v272, "cancelBlock"));
      -[MADProcessingTask setCancelBlock:](v27, "setCancelBlock:", v28);

      id v29 = -[PHPhotoLibrary newFaceCropsToBeGeneratedFetchOptions]( v272->_photoLibrary,  "newFaceCropsToBeGeneratedFetchOptions");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:", v29));
      for (unint64_t i = 0; i < (unint64_t)[v30 count]; ++i)
      {
        __int16 v32 = objc_autoreleasePoolPush();
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:i]);
        -[MADPhotosFaceCropGenerationTask addFace:](v27, "addFace:", v33);

        if (-[MADPhotosFaceCropGenerationTask count](v27, "count") >= 0x64)
        {
          -[MADPhotosFaceCropGenerationTask prepare](v27, "prepare");
          -[MADPhotosFaceCropGenerationTask process](v27, "process");
          -[MADAssetProcessingTask publish](v27, "publish");
          objc_super v34 = objc_alloc_init(&OBJC_CLASS___MADPhotosFaceCropGenerationTask);

          os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](v272, "cancelBlock"));
          -[MADProcessingTask setCancelBlock:](v34, "setCancelBlock:", v35);

          os_log_type_t v27 = v34;
        }

        objc_autoreleasePoolPop(v32);
      }

      id v36 = -[MADPhotosFaceCropGenerationTask count](v27, "count");
      if (v36)
      {
        -[MADPhotosFaceCropGenerationTask prepare](v27, "prepare");
        -[MADPhotosFaceCropGenerationTask process](v27, "process");
        id v36 = -[MADAssetProcessingTask publish](v27, "publish");
      }

      uint64_t v37 = VCPSignPostLog(v36);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      v39 = v38;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v39,  OS_SIGNPOST_INTERVAL_END,  v22,  "MADPhotosPersonProcessingTaskGenerateFaceCrop",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v19)
      {
        uint64_t v40 = mach_absolute_time();
        VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskGenerateFaceCrop", v40 - v19);
      }

      id v41 = -[PHPhotoLibrary countOfFaceCropsToBeGenerated](v272->_photoLibrary, "countOfFaceCropsToBeGenerated");
      uint64_t v43 = MediaAnalysisLogLevel(v41, v42);
      if ((int)v43 >= 7)
      {
        uint64_t v45 = VCPLogInstance(v43, v44);
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, type))
        {
          v47 = v272->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v47;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v41;
          _os_log_impl((void *)&_mh_execute_header, v46, type, "%@ Found %lu face crops yet to generate", buf, 0x16u);
        }
      }

      BOOL v48 = v12 != v41;

      int v11 = v272;
    }

    else
    {
      BOOL v48 = 0;
    }

    id v49 = -[PHPhotoLibrary countOfUnprocessedFaceCrops](v11->_photoLibrary, "countOfUnprocessedFaceCrops");
    uint64_t v51 = MediaAnalysisLogLevel(v49, v50);
    if ((int)v51 >= 7)
    {
      uint64_t v53 = VCPLogInstance(v51, v52);
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, type))
      {
        v55 = v11->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v49;
        _os_log_impl((void *)&_mh_execute_header, v54, type, "%@ Found %lu face crops to process", buf, 0x16u);
      }

      int v11 = v272;
    }

    if (v49)
    {
      uint64_t v56 = mach_absolute_time();
      uint64_t v57 = VCPSignPostLog(v56);
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      os_signpost_id_t v59 = os_signpost_id_generate(v58);

      uint64_t v61 = VCPSignPostLog(v60);
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      v63 = v62;
      if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v63,  OS_SIGNPOST_INTERVAL_BEGIN,  v59,  "MADPhotosPersonProcessingTaskFaceCropProcessing",  (const char *)&unk_100199097,  buf,  2u);
      }

      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:andFaceClusterer:]( &OBJC_CLASS___MADPhotosFaceCropProcessingTask,  "taskWithPhotoLibrary:andFaceClusterer:",  v272->_photoLibrary,  v272->_faceClusterer));
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](v272, "cancelBlock"));
      [v64 setCancelBlock:v65];

      uint64_t v66 = VCPSignPostLog([v64 process]);
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      v68 = v67;
      if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v68,  OS_SIGNPOST_INTERVAL_END,  v59,  "MADPhotosPersonProcessingTaskFaceCropProcessing",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v56)
      {
        uint64_t v69 = mach_absolute_time();
        VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskFaceCropProcessing", v69 - v56);
      }

      id v70 = -[PHPhotoLibrary countOfUnprocessedFaceCrops](v272->_photoLibrary, "countOfUnprocessedFaceCrops");
      uint64_t v72 = MediaAnalysisLogLevel(v70, v71);
      if ((int)v72 >= 7)
      {
        uint64_t v74 = VCPLogInstance(v72, v73);
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, type))
        {
          v76 = v272->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v76;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v70;
          _os_log_impl((void *)&_mh_execute_header, v75, type, "%@ Found %lu face crops yet to process", buf, 0x16u);
        }
      }

      if (v49 != v70) {
        BOOL v48 = 1;
      }

      int v11 = v272;
    }

    id v77 = -[PHPhotoLibrary vcp_isSyndicationLibrary](v11->_photoLibrary, "vcp_isSyndicationLibrary");
    if ((_DWORD)v77)
    {
      uint64_t v79 = MediaAnalysisLogLevel(v77, v78);
      if ((int)v79 >= 7)
      {
        uint64_t v81 = VCPLogInstance(v79, v80);
        v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, type))
        {
          v83 = v11->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v83;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  type,  "%@ Skipping clustering and person processing for syndication library",  buf,  0xCu);
        }

        int v11 = v272;
      }

      continue;
    }

    id v84 = -[PHPhotoLibrary mad_countOfUnclusteredFaces](v11->_photoLibrary, "mad_countOfUnclusteredFaces");
    uint64_t v86 = MediaAnalysisLogLevel(v84, v85);
    if ((int)v86 >= 7)
    {
      uint64_t v88 = VCPLogInstance(v86, v87);
      v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v89, type))
      {
        v90 = v11->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v90;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v84;
        _os_log_impl((void *)&_mh_execute_header, v89, type, "%@ Found %lu faces to cluster", buf, 0x16u);
      }

      int v11 = v272;
    }

    if (v84)
    {
      v91 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      -[VCPTimeMeasurement start](v91, "start");
      uint64_t v92 = mach_absolute_time();
      uint64_t v93 = VCPSignPostLog(v92);
      v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
      os_signpost_id_t v95 = os_signpost_id_generate(v94);

      uint64_t v97 = VCPSignPostLog(v96);
      v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
      v99 = v98;
      if (v95 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v99,  OS_SIGNPOST_INTERVAL_BEGIN,  v95,  "MADPhotosPersonProcessingTaskClusterFace",  (const char *)&unk_100199097,  buf,  2u);
      }

      faceClusterer = v272->_faceClusterer;
      if (v272->_requirement == 20) {
        id v101 = -[VCPFaceClusterer clusterFaces](faceClusterer, "clusterFaces");
      }
      else {
        id v101 = -[VCPFaceClusterer clusterFacesIfNecessary](faceClusterer, "clusterFacesIfNecessary");
      }
      int v102 = (int)v101;
      uint64_t v103 = VCPSignPostLog(v101);
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
      v105 = v104;
      if (v95 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v105,  OS_SIGNPOST_INTERVAL_END,  v95,  "MADPhotosPersonProcessingTaskClusterFace",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v92)
      {
        uint64_t v108 = mach_absolute_time();
        uint64_t v106 = VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskClusterFace", v108 - v92);
      }

      if (v102)
      {
        uint64_t v251 = MediaAnalysisLogLevel(v106, v107);
        if ((int)v251 >= 3)
        {
          uint64_t v253 = VCPLogInstance(v251, v252);
          v254 = (os_log_s *)objc_claimAutoreleasedReturnValue(v253);
          if (os_log_type_enabled(v254, v260))
          {
            v255 = v272->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v255;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v102;
            _os_log_impl((void *)&_mh_execute_header, v254, v260, "%@ Failed to cluster faces - %d", buf, 0x12u);
          }
        }

        -[VCPTimeMeasurement stop](v91, "stop");
        goto LABEL_165;
      }

      uint64_t v109 = MediaAnalysisLogLevel(v106, v107);
      if ((int)v109 >= 6)
      {
        uint64_t v111 = VCPLogInstance(v109, v110);
        v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
        if (os_log_type_enabled(v112, v266))
        {
          v113 = v272->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v113;
          _os_log_impl((void *)&_mh_execute_header, v112, v266, "%@ Finished Face Clustering", buf, 0xCu);
        }
      }

      -[VCPTimeMeasurement stop](v91, "stop");
      v114 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      -[VCPTimeMeasurement elapsedTimeSeconds](v91, "elapsedTimeSeconds");
      objc_msgSend( v114,  "accumulateDoubleValue:forField:andEvent:",  @"FaceClusteringElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v115 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v115 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      id v116 = -[PHPhotoLibrary mad_countOfUnclusteredFaces](v272->_photoLibrary, "mad_countOfUnclusteredFaces");
      uint64_t v118 = MediaAnalysisLogLevel(v116, v117);
      if ((int)v118 >= 7)
      {
        uint64_t v120 = VCPLogInstance(v118, v119);
        v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
        if (os_log_type_enabled(v121, type))
        {
          v122 = v272->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v122;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v116;
          _os_log_impl((void *)&_mh_execute_header, v121, type, "%@ Found %lu faces yet to cluster", buf, 0x16u);
        }
      }

      if (v84 != v116) {
        BOOL v48 = 1;
      }

      int v11 = v272;
    }

    id v123 = -[PHPhotoLibrary countOfDirtyFaceGroups](v11->_photoLibrary, "countOfDirtyFaceGroups");
    uint64_t v125 = MediaAnalysisLogLevel(v123, v124);
    if ((int)v125 >= 7)
    {
      uint64_t v127 = VCPLogInstance(v125, v126);
      v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
      if (os_log_type_enabled(v128, type))
      {
        v129 = v11->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v129;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v123;
        _os_log_impl((void *)&_mh_execute_header, v128, type, "%@ Found %lu face groups to process", buf, 0x16u);
      }

      int v11 = v272;
    }

    if (v123)
    {
      +[PNPersonPromoter setProcessed:forLibrary:]( &OBJC_CLASS___PNPersonPromoter,  "setProcessed:forLibrary:",  0LL,  v11->_photoLibrary);
      v270 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      -[VCPTimeMeasurement start](v270, "start");
      uint64_t v130 = mach_absolute_time();
      uint64_t v131 = VCPSignPostLog(v130);
      v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
      os_signpost_id_t v133 = os_signpost_id_generate(v132);

      uint64_t v135 = VCPSignPostLog(v134);
      v136 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);
      v137 = v136;
      if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v136))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v137,  OS_SIGNPOST_INTERVAL_BEGIN,  v133,  "MADPhotosPersonProcessingTaskBuildPerson",  (const char *)&unk_100199097,  buf,  2u);
      }

      personBuilder = v272->_personBuilder;
      id v278 = 0LL;
      v279[0] = _NSConcreteStackBlock;
      v279[1] = 3221225472LL;
      v279[2] = sub_1000F1A68;
      v279[3] = &unk_1001B9E98;
      v279[4] = v272;
      unsigned __int8 v139 = -[VCPPersonBuilder performPersonBuildingWithCancelOrExtendTimeoutBlock:error:]( personBuilder,  "performPersonBuildingWithCancelOrExtendTimeoutBlock:error:",  v279,  &v278);
      id v268 = v278;
      uint64_t v140 = VCPSignPostLog(v268);
      v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
      v142 = v141;
      if (v133 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v142,  OS_SIGNPOST_INTERVAL_END,  v133,  "MADPhotosPersonProcessingTaskBuildPerson",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v130)
      {
        uint64_t v145 = mach_absolute_time();
        uint64_t v143 = VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskBuildPerson", v145 - v130);
      }

      if ((v139 & 1) == 0)
      {
        uint64_t v231 = MediaAnalysisLogLevel(v143, v144);
        if ((int)v231 >= 3)
        {
          uint64_t v233 = VCPLogInstance(v231, v232);
          v234 = (os_log_s *)objc_claimAutoreleasedReturnValue(v233);
          if (os_log_type_enabled(v234, v260))
          {
            v235 = v272->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v235;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v268;
            _os_log_impl((void *)&_mh_execute_header, v234, v260, "%@ Failed to build persons - %@", buf, 0x16u);
          }
        }

        -[VCPTimeMeasurement stop](v270, "stop");
        int v230 = 1;
LABEL_151:

        int v11 = v272;
        if (v230) {
          goto LABEL_166;
        }
        goto LABEL_152;
      }

      uint64_t v146 = MediaAnalysisLogLevel(v143, v144);
      if ((int)v146 >= 6)
      {
        uint64_t v148 = VCPLogInstance(v146, v147);
        v149 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);
        if (os_log_type_enabled(v149, v266))
        {
          v150 = v272->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v150;
          _os_log_impl((void *)&_mh_execute_header, v149, v266, "%@ Finished Person Building", buf, 0xCu);
        }
      }

      -[VCPTimeMeasurement stop](v270, "stop");
      v151 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      -[VCPTimeMeasurement elapsedTimeSeconds](v270, "elapsedTimeSeconds");
      objc_msgSend( v151,  "accumulateDoubleValue:forField:andEvent:",  @"PersonBuildingElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v152 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v152 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      v153 = v272;
      id v154 = -[PHPhotoLibrary countOfDirtyFaceGroups](v272->_photoLibrary, "countOfDirtyFaceGroups");
      uint64_t v156 = MediaAnalysisLogLevel(v154, v155);
      if ((int)v156 >= 7)
      {
        uint64_t v158 = VCPLogInstance(v156, v157);
        v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);
        if (os_log_type_enabled(v159, type))
        {
          v160 = v272->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v160;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v154;
          _os_log_impl((void *)&_mh_execute_header, v159, type, "%@ Found %lu face groups yet to process", buf, 0x16u);
        }

        v153 = v272;
      }

      if (v123 != v154) {
        BOOL v48 = 1;
      }
      uint64_t v161 = MediaAnalysisLogLevel(v156, v157);
      if ((int)v161 >= 6)
      {
        uint64_t v163 = VCPLogInstance(v161, v162);
        v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);
        if (os_log_type_enabled(v164, v266))
        {
          v165 = v153->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v165;
          _os_log_impl((void *)&_mh_execute_header, v164, v266, "%@ Starting Person Promoting", buf, 0xCu);
        }
      }

      uint64_t v166 = mach_absolute_time();
      uint64_t v167 = VCPSignPostLog(v166);
      v168 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);
      os_signpost_id_t v169 = os_signpost_id_generate(v168);

      uint64_t v171 = VCPSignPostLog(v170);
      v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);
      v173 = v172;
      if (v169 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v172))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v173,  OS_SIGNPOST_INTERVAL_BEGIN,  v169,  "VCPFaceProcessingPromotePersonsCoreAnalyticsCollection",  (const char *)&unk_100199097,  buf,  2u);
      }

      id v174 = -[PHPhotoLibrary vcp_assetCountForTaskID:](v272->_photoLibrary, "vcp_assetCountForTaskID:", 3LL);
      v269 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](v272->_photoLibrary, "librarySpecificFetchOptions"));
      [v269 setIncludeNonvisibleFaces:1];
      [v269 setIncludeTorsoOnlyDetectionData:1];
      [v269 setShouldPrefetchCount:1];
      v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(clusterSequenceNumber > 0)"));
      [v269 setPredicate:v175];

      v176 = (void *)objc_claimAutoreleasedReturnValue(+[PHFace fetchFacesWithOptions:](&OBJC_CLASS___PHFace, "fetchFacesWithOptions:", v269));
      id v264 = [v176 count];

      v177 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](v272->_photoLibrary, "librarySpecificFetchOptions"));
      [v177 setMinimumVerifiedFaceCount:0];
      [v177 setMinimumUnverifiedFaceCount:0];
      [v177 setIncludeTorsoOnlyPerson:1];
      [v177 setShouldPrefetchCount:1];
      v178 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verifiedType = %@",  &off_1001C8090));
      [v177 setPredicate:v178];

      v179 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:", v177));
      id v180 = [v179 count];

      v181 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verifiedType = %@",  &off_1001C80A8));
      [v177 setPredicate:v181];

      v182 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:", v177));
      id v263 = [v182 count];

      v183 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"verifiedType = %@",  &off_1001C80C0));
      [v177 setPredicate:v183];

      v184 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:", v177));
      id v262 = [v184 count];

      uint64_t v186 = VCPSignPostLog(v185);
      v187 = (os_log_s *)objc_claimAutoreleasedReturnValue(v186);
      v188 = v187;
      if (v169 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v188,  OS_SIGNPOST_INTERVAL_END,  v169,  "VCPFaceProcessingPromotePersonsCoreAnalyticsCollection",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v166)
      {
        uint64_t v189 = mach_absolute_time();
        VCPPerformance_LogMeasurement("VCPFaceProcessingPromotePersonsCoreAnalyticsCollection", v189 - v166);
      }

      double Current = CFAbsoluteTimeGetCurrent();
      v267 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
      -[VCPTimeMeasurement start](v267, "start");
      uint64_t v191 = mach_absolute_time();
      uint64_t v192 = VCPSignPostLog(v191);
      v193 = (os_log_s *)objc_claimAutoreleasedReturnValue(v192);
      os_signpost_id_t v194 = os_signpost_id_generate(v193);

      uint64_t v196 = VCPSignPostLog(v195);
      v197 = (os_log_s *)objc_claimAutoreleasedReturnValue(v196);
      v198 = v197;
      if (v194 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v197))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v198,  OS_SIGNPOST_INTERVAL_BEGIN,  v194,  "MADPhotosPersonProcessingTaskPromotePerson",  (const char *)&unk_100199097,  buf,  2u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      v287 = sub_1000F1B14;
      v288 = sub_1000F1B24;
      id v289 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      dispatch_queue_t v199 = dispatch_queue_create("MADPersonPromotingProgress", 0LL);
      personPromoter = v272->_personPromoter;
      v274[0] = _NSConcreteStackBlock;
      v274[1] = 3221225472LL;
      v274[2] = sub_1000F1B2C;
      v274[3] = &unk_1001BD660;
      v201 = v199;
      v276 = v272;
      v277 = buf;
      v265 = v201;
      v275 = v201;
      id v202 = -[PNPersonPromoter promoteUnverifiedPersonsWithUpdateBlock:]( personPromoter,  "promoteUnverifiedPersonsWithUpdateBlock:",  v274);
      char v203 = (char)v202;
      uint64_t v204 = VCPSignPostLog(v202);
      v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
      v206 = v205;
      if (v194 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v205))
      {
        *(_WORD *)v280 = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v206,  OS_SIGNPOST_INTERVAL_END,  v194,  "MADPhotosPersonProcessingTaskPromotePerson",  (const char *)&unk_100199097,  v280,  2u);
      }

      if (v191)
      {
        uint64_t v207 = mach_absolute_time();
        VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskPromotePerson", v207 - v191);
      }

      -[VCPTimeMeasurement stop](v267, "stop");
      v208 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      -[VCPTimeMeasurement elapsedTimeSeconds](v267, "elapsedTimeSeconds");
      objc_msgSend( v208,  "accumulateDoubleValue:forField:andEvent:",  @"PersonPromotingElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v209 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v209 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      v210 = v272;
      double v213 = CFAbsoluteTimeGetCurrent() - Current;
      if (v213 > 5.0)
      {
        v261 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        v284[0] = @"GraphVerifiedPersonCount";
        v258 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v180));
        v285[0] = v258;
        v284[1] = @"ProcessingQoS";
        uint64_t v214 = qos_class_self();
        uint64_t v215 = VCPMAQoSDescription(v214);
        v257 = (void *)objc_claimAutoreleasedReturnValue(v215);
        v285[1] = v257;
        v284[2] = @"PromotingInterval";
        v256 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v213));
        v285[2] = v256;
        v284[3] = @"PromotingSequence";
        v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        v217 = (void *)objc_claimAutoreleasedReturnValue([v216 description]);
        v285[3] = v217;
        v284[4] = @"TotalAssetCount";
        v218 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v174));
        v285[4] = v218;
        v284[5] = @"TotalFaceCount";
        v219 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v264));
        v285[5] = v219;
        v284[6] = @"UnverifiedPersonCount";
        v220 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v263));
        v285[6] = v220;
        v284[7] = @"UserVerifiedPersonCount";
        v221 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v262));
        v285[7] = v221;
        v222 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v285,  v284,  8LL));
        [v261 sendEvent:@"com.apple.mediaanalysisd.photos.personpromoting" withAnalytics:v222];

        v210 = v272;
      }

      if ((v203 & 1) != 0)
      {
        id v223 = +[PNPersonPromoter setProcessed:forLibrary:]( &OBJC_CLASS___PNPersonPromoter,  "setProcessed:forLibrary:",  1LL,  v210->_photoLibrary);
        uint64_t v225 = MediaAnalysisLogLevel(v223, v224);
        if ((int)v225 < 6)
        {
          int v230 = 0;
          goto LABEL_150;
        }

        uint64_t v227 = VCPLogInstance(v225, v226);
        v228 = (os_log_s *)objc_claimAutoreleasedReturnValue(v227);
        if (os_log_type_enabled(v228, v266))
        {
          v229 = v210->_logPrefix;
          *(_DWORD *)v280 = 138412290;
          v281 = v229;
          _os_log_impl((void *)&_mh_execute_header, v228, v266, "%@ Finished Person Promoting", v280, 0xCu);
        }

        int v230 = 0;
      }

      else
      {
        uint64_t v236 = MediaAnalysisLogLevel(v211, v212);
        if ((int)v236 < 3)
        {
          int v230 = 1;
          goto LABEL_150;
        }

        uint64_t v238 = VCPLogInstance(v236, v237);
        v228 = (os_log_s *)objc_claimAutoreleasedReturnValue(v238);
        if (os_log_type_enabled(v228, v260))
        {
          v239 = v210->_logPrefix;
          *(_DWORD *)v280 = 138412546;
          v281 = v239;
          __int16 v282 = 2112;
          id v283 = v268;
          _os_log_impl((void *)&_mh_execute_header, v228, v260, "%@ Failed to promote persons - %@", v280, 0x16u);
        }

        int v230 = 1;
      }

LABEL_150:
      _Block_object_dispose(buf, 8);

      goto LABEL_151;
    }

- (BOOL)_updateGalleryWithError:(id *)a3
{
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000F249C;
  v41[3] = &unk_1001B9E98;
  v41[4] = self;
  uint64_t v5 = objc_retainBlock(v41);
  if (!((unsigned int (*)(void))v5[2])())
  {
    uint64_t v7 = MADPersonProcessingStatusKey;
    if (-[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:", MADPersonProcessingStatusKey)
      || (uint64_t v35 = MADPersonProcessingUpdateAttemptCountKey,
          -[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:")))
    {
      -[VCPDatabaseWriter removeKey:](self->_analysisDatabase, "removeKey:", v7);
      uint64_t v35 = MADPersonProcessingUpdateAttemptCountKey;
      -[VCPDatabaseWriter removeKey:](self->_analysisDatabase, "removeKey:");
      -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
    }

    uint64_t v37 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
    -[VCPTimeMeasurement start](v37, "start");
    uint64_t v8 = mach_absolute_time();
    uint64_t v9 = VCPSignPostLog(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v13 = VCPSignPostLog(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "MADPhotosPersonProcessingTaskClusterFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[GDVUVisualUnderstandingService gallery](self->_vuService, "gallery"));
    id v40 = 0LL;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000F2548;
    v38[3] = &unk_1001BCC30;
    v38[4] = self;
    uint64_t v17 = v5;
    id v39 = v17;
    [v16 updateAndReturnError:&v40 progressHandler:v38];
    id v36 = v40;

    uint64_t v19 = VCPSignPostLog(v18);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v11,  "MADPhotosPersonProcessingTaskClusterFace",  (const char *)&unk_100199097,  buf,  2u);
    }

    if (v8)
    {
      uint64_t v22 = mach_absolute_time();
      VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskClusterFace", v22 - v8);
    }

    if (((unsigned int (*)(id))v5[2])(v17))
    {
      if (a3)
      {
        NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Canceled during Gallery updating",  self->_logPrefix));
        uint64_t v45 = v23;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v24));
      }
    }

    else
    {
      -[VCPTimeMeasurement stop](v37, "stop");
      if (!v36)
      {
        -[VCPDatabaseWriter setValue:forKey:](self->_analysisDatabase, "setValue:forKey:", 1LL, v7);
        -[VCPDatabaseWriter setValue:forKey:](self->_analysisDatabase, "setValue:forKey:", 0LL, v35);
        uint64_t v25 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
        uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
        if ((int)v27 >= 6)
        {
          uint64_t v29 = VCPLogInstance(v27, v28);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          os_log_type_t v31 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v30, v31))
          {
            logPrefix = self->_logPrefix;
            *(_DWORD *)buf = 138412290;
            uint64_t v43 = logPrefix;
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ Successfully updated Gallery", buf, 0xCu);
          }
        }

        int v33 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
        -[VCPTimeMeasurement elapsedTimeSeconds](v37, "elapsedTimeSeconds");
        objc_msgSend( v33,  "accumulateDoubleValue:forField:andEvent:",  @"FaceClusteringElapsedTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
        [v33 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

        BOOL v6 = 1;
        goto LABEL_28;
      }

      if (a3)
      {
        BOOL v6 = 0;
        *a3 = [v36 copy];
LABEL_28:

        goto LABEL_29;
      }
    }

    BOOL v6 = 0;
    goto LABEL_28;
  }

  if (a3)
  {
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    uint64_t v37 = (VCPTimeMeasurement *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Gallery updating cancelled before clustering started",  self->_logPrefix));
    v47 = v37;
    id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    BOOL v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v36));
LABEL_29:

    goto LABEL_30;
  }

  BOOL v6 = 0;
LABEL_30:

  return v6;
}

- (BOOL)_buildAndPromotePersonWithError:(id *)a3 needReclustering:(BOOL *)a4
{
  if (a4)
  {
    v274[0] = _NSConcreteStackBlock;
    v274[1] = 3221225472LL;
    v274[2] = sub_1000F486C;
    v274[3] = &unk_1001B9E98;
    void v274[4] = self;
    uint64_t v5 = objc_retainBlock(v274);
    if (((unsigned int (*)(void))v5[2])())
    {
      if (!a3)
      {
        char v6 = 0;
LABEL_143:

        return v6;
      }

      NSErrorUserInfoKey v301 = NSLocalizedDescriptionKey;
      uint64_t v246 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Person updating cancelled",  self->_logPrefix));
      v302 = v246;
      id v247 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v302,  &v301,  1LL));
      char v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL));
LABEL_142:

      goto LABEL_143;
    }

    analysisDatabase = self->_analysisDatabase;
    id v273 = 0LL;
    unsigned int v11 = -[VCPDatabaseWriter queryChangeToken:forTaskID:andChangeTokenType:]( analysisDatabase,  "queryChangeToken:forTaskID:andChangeTokenType:",  &v273,  3LL,  2LL);
    id v12 = v273;
    uint64_t v246 = v12;
    if (v11)
    {
      id v12 = (id)MediaAnalysisLogLevel(v12, v13);
      if ((int)v12 >= 3)
      {
        uint64_t v14 = VCPLogInstance(v12, v13);
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        os_log_type_t v16 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v15, v16))
        {
          logPrefix = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = logPrefix;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "%@ Failed to query previous MADGDChangeBookmark (code:%d)",  buf,  0x12u);
        }
      }
    }

    if (v246)
    {
      uint64_t v18 = MediaAnalysisLogLevel(v12, v13);
      if ((int)v18 >= 7)
      {
        uint64_t v20 = VCPLogInstance(v18, v19);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_log_type_t v22 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = self->_logPrefix;
          id v24 = (id)objc_claimAutoreleasedReturnValue([v246 base64EncodedStringWithOptions:0]);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v23;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "%@ previousChangeBookmark data %@", buf, 0x16u);
        }
      }

      *(void *)v281 = 0LL;
      *(void *)&v281[8] = v281;
      *(void *)&v281[16] = 0x2050000000LL;
      uint64_t v25 = (void *)qword_1001E6660;
      __int16 v282 = (uint64_t (*)(uint64_t, uint64_t))qword_1001E6660;
      if (!qword_1001E6660)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_1000F80B0;
        v292 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001B9F10;
        v293 = (void (*)(uint64_t))v281;
        sub_1000F80B0((uint64_t)buf);
        uint64_t v25 = *(void **)(*(void *)&v281[8] + 24LL);
      }

      id v26 = v25;
      _Block_object_dispose(v281, 8);
      id v272 = 0LL;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 decodeFromData:v246 error:&v272]);
      id v28 = v272;
      v30 = v28;
      if (!v27)
      {
        uint64_t v31 = MediaAnalysisLogLevel(v28, v29);
        if ((int)v31 >= 3)
        {
          uint64_t v33 = VCPLogInstance(v31, v32);
          objc_super v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          os_log_type_t v35 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v34, v35))
          {
            id v36 = self->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "%@ Failed to retrieve previous MADGDChangeBookmark - %@",  buf,  0x16u);
          }
        }
      }
    }

    else
    {
      uint64_t v27 = 0LL;
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v244 = v37;
    if (!v27)
    {
LABEL_44:
      id v247 = v27;
      if (((unsigned int (*)(void *))v5[2])(v5))
      {
        if (!a3)
        {
          char v6 = 0;
LABEL_141:

          goto LABEL_142;
        }

        NSErrorUserInfoKey v299 = NSLocalizedDescriptionKey;
        v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Person updating cancelled",  self->_logPrefix));
        v300 = v242;
        id v239 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v300,  &v299,  1LL));
        char v6 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v239));
LABEL_140:

        goto LABEL_141;
      }

      uint64_t v240 = mach_absolute_time();
      uint64_t v65 = VCPSignPostLog(v240);
      uint64_t v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      os_signpost_id_t v67 = os_signpost_id_generate(v66);

      uint64_t v69 = VCPSignPostLog(v68);
      id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
      uint64_t v71 = v70;
      if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v71,  OS_SIGNPOST_INTERVAL_BEGIN,  v67,  "GalleryPhotosUpdate_UpdateEndToEnd",  (const char *)&unk_100199097,  buf,  2u);
      }

      v242 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      uint64_t v73 = MediaAnalysisLogLevel(v242, v72);
      if ((int)v73 >= 6)
      {
        uint64_t v75 = VCPLogInstance(v73, v74);
        v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        os_log_type_t v77 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v76, v77))
        {
          uint64_t v78 = self->_logPrefix;
          id v79 = [v244 count];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v79;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  v77,  "%@ Initiate all entities from Gallery to PhotosDB (with %lu changed entities)",  buf,  0x16u);
        }
      }

      v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      if ((-[PHPhotoLibrary vcp_isSyndicationLibrary](self->_photoLibrary, "vcp_isSyndicationLibrary") & 1) == 0)
      {
        uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue( +[MADGDUtilities fetchKeyFaceLocalIdentifiersForPhotoLibrary:]( &OBJC_CLASS___MADGDUtilities,  "fetchKeyFaceLocalIdentifiersForPhotoLibrary:",  self->_photoLibrary));
        if ([v80 count]) {
          [v235 unionSet:v80];
        }
      }

      v267[0] = 0LL;
      v267[1] = v267;
      v267[2] = 0x2020000000LL;
      v267[3] = 0LL;
      uint64_t v227 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:]( self->_photoLibrary,  "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:",  0LL,  0LL));
      [v227 setFetchLimit:1];
      [v227 setShouldPrefetchCount:1];
      v260[0] = _NSConcreteStackBlock;
      v260[1] = 3221225472LL;
      v260[2] = sub_1000F4D2C;
      v260[3] = &unk_1001BD6B0;
      os_log_type_t v266 = v267;
      v260[4] = self;
      id v247 = v27;
      id v261 = v247;
      id v262 = v244;
      id v233 = v227;
      id v263 = v233;
      uint64_t v236 = v5;
      id v265 = v236;
      id v239 = v235;
      id v264 = v239;
      uint64_t v238 = objc_retainBlock(v260);
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
      [v81 flush];

      vuService = self->_vuService;
      id v259 = 0LL;
      uint64_t v237 = (void *)objc_claimAutoreleasedReturnValue( -[GDVUVisualUnderstandingService entitiesFor:error:body:]( vuService,  "entitiesFor:error:body:",  0LL,  &v259,  v238));
      id v83 = v259;
      v234 = v83;
      if (v83)
      {
        uint64_t v85 = MediaAnalysisLogLevel(v83, v84);
        if ((int)v85 >= 3)
        {
          uint64_t v87 = VCPLogInstance(v85, v86);
          uint64_t v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
          os_log_type_t v89 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v88, v89))
          {
            v90 = self->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v90;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v234;
            _os_log_impl( (void *)&_mh_execute_header,  v88,  v89,  "%@ Failed to update entities from Gallery - %@",  buf,  0x16u);
          }
        }
      }

      else
      {
        uint64_t v91 = ((uint64_t (*)(id))v5[2])(v236);
        if ((_DWORD)v91)
        {
          if (!a3)
          {
            char v6 = 0;
LABEL_139:

            _Block_object_dispose(v267, 8);
            goto LABEL_140;
          }

          NSErrorUserInfoKey v297 = NSLocalizedDescriptionKey;
          v241 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Person updating cancelled",  self->_logPrefix));
          v298 = v241;
          int v230 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v298,  &v297,  1LL));
          char v6 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL));

          goto LABEL_138;
        }

        if (v247)
        {
          uint64_t v93 = MediaAnalysisLogLevel(v91, v92);
          if ((int)v93 >= 6)
          {
            uint64_t v95 = VCPLogInstance(v93, v94);
            uint64_t v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
            os_log_type_t v97 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v96, v97))
            {
              v98 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v98;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v237;
              _os_log_impl((void *)&_mh_execute_header, v96, v97, "%@ Update MADGDChangeBookmark %@", buf, 0x16u);
            }
          }

          id v257 = 0LL;
          uint64_t v99 = objc_claimAutoreleasedReturnValue([v237 encodeToDataAndReturnError:&v257]);
          id v100 = v257;
          uint64_t v231 = v100;
          int v102 = (void *)v99;
          if (!v99)
          {
            id v100 = (id)MediaAnalysisLogLevel(v100, v101);
            if ((int)v100 >= 3)
            {
              uint64_t v103 = VCPLogInstance(v100, v101);
              v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
              os_log_type_t v105 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v104, v105))
              {
                uint64_t v106 = self->_logPrefix;
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v106;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v231;
                _os_log_impl( (void *)&_mh_execute_header,  v104,  v105,  "%@ Failed to encode updated MADGDChangeBookmark - %@",  buf,  0x16u);
              }
            }
          }

          uint64_t v107 = MediaAnalysisLogLevel(v100, v101);
          if ((int)v107 >= 7)
          {
            uint64_t v109 = VCPLogInstance(v107, v108);
            uint64_t v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
            os_log_type_t v111 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v110, v111))
            {
              v112 = self->_logPrefix;
              id v113 = (id)objc_claimAutoreleasedReturnValue([v102 base64EncodedStringWithOptions:0]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v112;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v113;
              _os_log_impl((void *)&_mh_execute_header, v110, v111, "%@ Update ChangeBookmark with data %@", buf, 0x16u);
            }
          }

          -[VCPDatabaseWriter updateChangeToken:forTaskID:andChangeTokenType:]( self->_analysisDatabase,  "updateChangeToken:forTaskID:andChangeTokenType:",  v102,  3LL,  2LL);
          v237;

          v114 = self->_analysisDatabase;
          v115 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary currentToken](self->_photoLibrary, "currentToken"));
          -[VCPDatabaseWriter updateChangeToken:forTaskID:andChangeTokenType:]( v114,  "updateChangeToken:forTaskID:andChangeTokenType:",  v115,  3LL,  3LL);
        }

        else
        {
          uint64_t v116 = MediaAnalysisLogLevel(v91, v92);
          if ((int)v116 >= 6)
          {
            uint64_t v118 = VCPLogInstance(v116, v117);
            uint64_t v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
            os_log_type_t v120 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v119, v120))
            {
              v121 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v121;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v237;
              _os_log_impl((void *)&_mh_execute_header, v119, v120, "%@ Initiate MADGDChangeBookmark %@", buf, 0x16u);
            }
          }

          id v258 = 0LL;
          uint64_t v122 = objc_claimAutoreleasedReturnValue([v237 encodeToDataAndReturnError:&v258]);
          id v123 = v258;
          uint64_t v231 = v123;
          int v102 = (void *)v122;
          if (!v122)
          {
            id v123 = (id)MediaAnalysisLogLevel(v123, v124);
            if ((int)v123 >= 3)
            {
              uint64_t v125 = VCPLogInstance(v123, v124);
              uint64_t v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
              os_log_type_t v127 = VCPLogToOSLogType[3];
              if (os_log_type_enabled(v126, v127))
              {
                v128 = self->_logPrefix;
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v128;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v231;
                _os_log_impl( (void *)&_mh_execute_header,  v126,  v127,  "%@ Failed to encode initial MADGDChangeBookmark - %@",  buf,  0x16u);
              }
            }
          }

          uint64_t v129 = MediaAnalysisLogLevel(v123, v124);
          if ((int)v129 >= 7)
          {
            uint64_t v131 = VCPLogInstance(v129, v130);
            v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
            os_log_type_t v133 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v132, v133))
            {
              uint64_t v134 = self->_logPrefix;
              id v135 = (id)objc_claimAutoreleasedReturnValue([v102 base64EncodedStringWithOptions:0]);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v134;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v135;
              _os_log_impl( (void *)&_mh_execute_header,  v132,  v133,  "%@ Setting ChangeBookmark with data %@",  buf,  0x16u);
            }
          }

          -[VCPDatabaseWriter setChangeToken:forTaskID:andChangeTokenType:]( self->_analysisDatabase,  "setChangeToken:forTaskID:andChangeTokenType:",  v102,  3LL,  2LL);
          v237;
          v136 = self->_analysisDatabase;
          v115 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary currentToken](self->_photoLibrary, "currentToken"));
          -[VCPDatabaseWriter setChangeToken:forTaskID:andChangeTokenType:]( v136,  "setChangeToken:forTaskID:andChangeTokenType:",  v115,  3LL,  3LL);
        }

        -[VCPDatabaseWriter removeKey:](self->_analysisDatabase, "removeKey:", MADPersonProcessingStatusKey);
        -[VCPDatabaseWriter removeKey:](self->_analysisDatabase, "removeKey:", MADPersonProcessingUpdateAttemptCountKey);
        id v247 = v237;
        uint64_t v85 = -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
      }

      uint64_t v137 = VCPSignPostLog(v85);
      v138 = (os_log_s *)objc_claimAutoreleasedReturnValue(v137);
      unsigned __int8 v139 = v138;
      if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v138))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v139,  OS_SIGNPOST_INTERVAL_END,  v67,  "GalleryPhotosUpdate_UpdateEndToEnd",  (const char *)&unk_100199097,  buf,  2u);
      }

      if (v240)
      {
        uint64_t v140 = mach_absolute_time();
        VCPPerformance_LogMeasurement("GalleryPhotosUpdate_UpdateEndToEnd", v140 - v240);
      }

      v241 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
      [v242 timeIntervalSinceNow];
      [v241 accumulateDoubleValue:@"PersonBuildingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v141];
      [v241 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      if (((unsigned int (*)(id))v5[2])(v236))
      {
        if (a3)
        {
          NSErrorUserInfoKey v295 = NSLocalizedDescriptionKey;
          uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Person promoting cancelled",  self->_logPrefix));
          v296 = v232;
          v228 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v296,  &v295,  1LL));
          char v6 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL));

LABEL_137:
          goto LABEL_138;
        }

        char v6 = 0;
LABEL_138:

        goto LABEL_139;
      }

      uint64_t v232 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:]( self->_photoLibrary,  "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:",  &off_1001C91E0,  &off_1001C91F8));
      v142 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:"));
      v221 = [v142 count];

      v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      uint64_t v223 = mach_absolute_time();
      uint64_t v143 = VCPSignPostLog(v223);
      uint64_t v144 = (os_log_s *)objc_claimAutoreleasedReturnValue(v143);
      os_signpost_id_t v145 = os_signpost_id_generate(v144);

      uint64_t v147 = VCPSignPostLog(v146);
      uint64_t v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
      v149 = v148;
      if (v145 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v149,  OS_SIGNPOST_INTERVAL_BEGIN,  v145,  "MADPhotosPersonProcessingTaskPromotePerson",  (const char *)&unk_100199097,  buf,  2u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000LL;
      v292 = sub_1000F1B14;
      v293 = sub_1000F1B24;
      id v294 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      dispatch_queue_t v226 = dispatch_queue_create("MADPersonPromotingProgress", 0LL);
      uint64_t v151 = MediaAnalysisLogLevel(v226, v150);
      if ((int)v151 >= 7)
      {
        uint64_t v153 = VCPLogInstance(v151, v152);
        id v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);
        os_log_type_t v155 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v154, v155))
        {
          uint64_t v156 = self->_logPrefix;
          *(_DWORD *)v281 = 138412546;
          *(void *)&v281[4] = v156;
          *(_WORD *)&v281[12] = 2048;
          *(void *)&v281[14] = v221;
          _os_log_impl( (void *)&_mh_execute_header,  v154,  v155,  "%@ Start Person Promoting with %lu graph verified person",  v281,  0x16u);
        }
      }

      +[PNPersonPromoter setProcessed:forLibrary:]( &OBJC_CLASS___PNPersonPromoter,  "setProcessed:forLibrary:",  0LL,  self->_photoLibrary);
      personPromoter = self->_personPromoter;
      v253[0] = _NSConcreteStackBlock;
      v253[1] = 3221225472LL;
      v253[2] = sub_1000F556C;
      v253[3] = &unk_1001BD660;
      uint64_t v158 = v226;
      v255 = self;
      v256 = buf;
      uint64_t v225 = v158;
      v254 = v158;
      unsigned __int8 v159 = -[PNPersonPromoter promoteUnverifiedPersonsWithUpdateBlock:]( personPromoter,  "promoteUnverifiedPersonsWithUpdateBlock:",  v253);
      uint64_t v160 = ((uint64_t (*)(id))v5[2])(v236);
      if ((_DWORD)v160)
      {
        if (a3)
        {
          NSErrorUserInfoKey v289 = NSLocalizedDescriptionKey;
          uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Person promoting cancelled",  self->_logPrefix));
          v290 = v161;
          uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v290,  &v289,  1LL));
          id v163 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v162));
LABEL_132:
          char v6 = 0;
          *a3 = v163;
LABEL_133:

          goto LABEL_135;
        }
      }

      else
      {
        uint64_t v164 = VCPSignPostLog(v160);
        v165 = (os_log_s *)objc_claimAutoreleasedReturnValue(v164);
        uint64_t v166 = v165;
        if (v145 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v165))
        {
          *(_WORD *)v281 = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v166,  OS_SIGNPOST_INTERVAL_END,  v145,  "MADPhotosPersonProcessingTaskPromotePerson",  (const char *)&unk_100199097,  v281,  2u);
        }

        if (v223)
        {
          uint64_t v167 = mach_absolute_time();
          VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskPromotePerson", v167 - v223);
        }

        [v229 timeIntervalSinceNow];
        [v241 accumulateDoubleValue:@"PersonPromotingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v168];
        [v241 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
        os_signpost_id_t v169 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](&OBJC_CLASS___PHPerson, "fetchPersonsWithOptions:", v232));
        uint64_t v170 = [v169 count];

        if ((v159 & 1) != 0)
        {
          id v171 = +[PNPersonPromoter setProcessed:forLibrary:]( &OBJC_CLASS___PNPersonPromoter,  "setProcessed:forLibrary:",  1LL,  self->_photoLibrary);
          uint64_t v173 = MediaAnalysisLogLevel(v171, v172);
          if ((int)v173 >= 6)
          {
            uint64_t v175 = VCPLogInstance(v173, v174);
            v176 = (os_log_s *)objc_claimAutoreleasedReturnValue(v175);
            os_log_type_t v177 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v176, v177))
            {
              v178 = self->_logPrefix;
              *(_DWORD *)v281 = 138412546;
              *(void *)&v281[4] = v178;
              *(_WORD *)&v281[12] = 2048;
              *(void *)&v281[14] = v170 - v221;
              _os_log_impl( (void *)&_mh_execute_header,  v176,  v177,  "%@ Finished Person Promoting with %lu new Graph verified persons",  v281,  0x16u);
            }
          }

          *a4 |= v170 != v221;
          if (!((unsigned int (*)(id))v5[2])(v236))
          {
            uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue( -[PHPhotoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:]( self->_photoLibrary,  "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:",  &off_1001C9210,  &off_1001C9228));
            id v180 = (void *)objc_claimAutoreleasedReturnValue( +[PHPerson fetchPersonsWithOptions:]( &OBJC_CLASS___PHPerson,  "fetchPersonsWithOptions:",  v161));
            uint64_t v224 = [v180 count];

            uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            uint64_t v222 = mach_absolute_time();
            uint64_t v181 = VCPSignPostLog(v222);
            v182 = (os_log_s *)objc_claimAutoreleasedReturnValue(v181);
            os_signpost_id_t v183 = os_signpost_id_generate(v182);

            uint64_t v185 = VCPSignPostLog(v184);
            uint64_t v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);
            v187 = v186;
            if (v183 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
            {
              *(_WORD *)v281 = 0;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v187,  OS_SIGNPOST_INTERVAL_BEGIN,  v183,  "MADPhotosPersonProcessingTaskPromotePet",  (const char *)&unk_100199097,  v281,  2u);
            }

            *(void *)v281 = 0LL;
            *(void *)&v281[8] = v281;
            *(void *)&v281[16] = 0x3032000000LL;
            __int16 v282 = sub_1000F1B14;
            id v283 = sub_1000F1B24;
            id v284 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
            dispatch_queue_t v188 = dispatch_queue_create("MADPetPromotingProgress", 0LL);
            dispatch_queue_t v220 = v188;
            uint64_t v190 = MediaAnalysisLogLevel(v188, v189);
            if ((int)v190 >= 7)
            {
              uint64_t v192 = v162;
              uint64_t v193 = VCPLogInstance(v190, v191);
              os_signpost_id_t v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
              os_log_type_t v195 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v194, v195))
              {
                uint64_t v196 = self->_logPrefix;
                *(_DWORD *)v277 = 138412546;
                id v278 = v196;
                __int16 v279 = 2048;
                v280 = v224;
                _os_log_impl( (void *)&_mh_execute_header,  v194,  v195,  "%@ Start Pet Promoting with %lu graph verified pet",  v277,  0x16u);
              }

              uint64_t v162 = v192;
            }

            petPromoter = self->_petPromoter;
            v249[0] = _NSConcreteStackBlock;
            v249[1] = 3221225472LL;
            v249[2] = sub_1000F5840;
            v249[3] = &unk_1001BD6D8;
            v198 = v188;
            uint64_t v251 = self;
            uint64_t v252 = v281;
            dispatch_queue_t v199 = v198;
            uint64_t v250 = v198;
            -[PNPetPromoterWrapper promoteUnverifiedPetsWithUpdateBlock:]( petPromoter,  "promoteUnverifiedPetsWithUpdateBlock:",  v249);
            uint64_t v200 = ((uint64_t (*)(id))v5[2])(v236);
            char v201 = v200;
            if ((_DWORD)v200)
            {
              if (a3)
              {
                NSErrorUserInfoKey v275 = NSLocalizedDescriptionKey;
                id v202 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Pet promoting cancelled",  self->_logPrefix,  v220));
                v276 = v202;
                char v203 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v276,  &v275,  1LL));
                *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v203));
              }
            }

            else
            {
              uint64_t v204 = VCPSignPostLog(v200);
              v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);
              v206 = v205;
              if (v183 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v205))
              {
                *(_WORD *)v277 = 0;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v206,  OS_SIGNPOST_INTERVAL_END,  v183,  "MADPhotosPersonProcessingTaskPromotePet",  (const char *)&unk_100199097,  v277,  2u);
              }

              if (v222)
              {
                uint64_t v207 = mach_absolute_time();
                VCPPerformance_LogMeasurement("MADPhotosPersonProcessingTaskPromotePet", v207 - v222);
              }

              [v162 timeIntervalSinceNow];
              [v241 accumulateDoubleValue:@"PetPromotingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v208];
              [v241 accumulateInt64Value:1 forField:@"NumberOfPetPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
              v209 = (void *)objc_claimAutoreleasedReturnValue( +[PHPerson fetchPersonsWithOptions:]( &OBJC_CLASS___PHPerson,  "fetchPersonsWithOptions:",  v161));
              v210 = [v209 count];

              uint64_t v213 = MediaAnalysisLogLevel(v211, v212);
              if ((int)v213 >= 6)
              {
                uint64_t v215 = v162;
                uint64_t v216 = VCPLogInstance(v213, v214);
                v217 = (os_log_s *)objc_claimAutoreleasedReturnValue(v216);
                os_log_type_t v218 = VCPLogToOSLogType[6];
                if (os_log_type_enabled(v217, v218))
                {
                  v219 = self->_logPrefix;
                  *(_DWORD *)v277 = 138412546;
                  id v278 = v219;
                  __int16 v279 = 2048;
                  v280 = (_BYTE *)(v210 - v224);
                  _os_log_impl( (void *)&_mh_execute_header,  v217,  v218,  "%@ Finished Pet Promoting with %lu new Graph verified pets",  v277,  0x16u);
                }

                uint64_t v162 = v215;
              }

              *a4 |= v210 != v224;
              -[VCPDatabaseWriter cacheProcessedAssetCountAfterPromoter:]( self->_analysisDatabase,  "cacheProcessedAssetCountAfterPromoter:",  -[VCPDatabaseWriter valueForKey:]( self->_analysisDatabase,  "valueForKey:",  VCPKeyValueNumberOfAssetsAnalyzedForPhotosFaceProcessing));
            }

            _Block_object_dispose(v281, 8);
            char v6 = v201 ^ 1;
            goto LABEL_133;
          }

          if (a3)
          {
            NSErrorUserInfoKey v285 = NSLocalizedDescriptionKey;
            uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Pet promoting cancelled",  self->_logPrefix));
            v286 = v161;
            uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v286,  &v285,  1LL));
            id v163 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v162));
            goto LABEL_132;
          }
        }

        else if (a3)
        {
          NSErrorUserInfoKey v287 = NSLocalizedDescriptionKey;
          uint64_t v161 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Failed during person promoting",  self->_logPrefix));
          v288 = v161;
          uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v288,  &v287,  1LL));
          id v163 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -18LL,  v162));
          goto LABEL_132;
        }
      }

      char v6 = 0;
LABEL_135:

      _Block_object_dispose(buf, 8);
      goto LABEL_137;
    }

    uint64_t v248 = v27;
    v269[0] = _NSConcreteStackBlock;
    v269[1] = 3221225472LL;
    v269[2] = sub_1000F4918;
    v269[3] = &unk_1001BD688;
    id v38 = v37;
    id v270 = v38;
    v271 = self;
    id v39 = objc_retainBlock(v269);
    id v40 = self->_vuService;
    id v268 = 0LL;
    id v41 = (void *)objc_claimAutoreleasedReturnValue( -[GDVUVisualUnderstandingService changesSince:error:body:]( v40,  "changesSince:error:body:",  v27,  &v268,  v39));
    id v42 = v268;
    NSErrorUserInfoKey v44 = v42;
    if (v41)
    {
      uint64_t v45 = MediaAnalysisLogLevel(v42, v43);
      if ((int)v45 < 7)
      {
LABEL_39:
        uint64_t v57 = MediaAnalysisLogLevel(v45, v46);
        if ((int)v57 >= 6)
        {
          uint64_t v59 = VCPLogInstance(v57, v58);
          uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          os_log_type_t v61 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v60, v61))
          {
            v62 = v5;
            v63 = self->_logPrefix;
            id v64 = [v38 count];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v63;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v64;
            _os_log_impl((void *)&_mh_execute_header, v60, v61, "%@ Fetched %lu entities to update", buf, 0x16u);
            uint64_t v5 = v62;
          }
        }

        uint64_t v27 = v248;
        goto LABEL_44;
      }

      uint64_t v47 = VCPLogInstance(v45, v46);
      BOOL v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      os_log_type_t v49 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v41;
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "%@ fresh currentChangeBookmark %@", buf, 0x16u);
      }
    }

    else
    {
      uint64_t v51 = MediaAnalysisLogLevel(v42, v43);
      if ((int)v51 >= 3)
      {
        uint64_t v53 = VCPLogInstance(v51, v52);
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        os_log_type_t v55 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v56;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  v55,  "%@ Failed to fetch Gallery updates; falls to full sync - %@",
            buf,
            0x16u);
        }
      }

      [v38 removeAllObjects];
      BOOL v48 = (os_log_s *)v27;
      uint64_t v248 = 0LL;
    }

    goto LABEL_39;
  }

  if (a3)
  {
    NSErrorUserInfoKey v303 = NSLocalizedDescriptionKey;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"needReclustering is nil"));
    v304 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v304,  &v303,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -50LL,  v9));
  }

  return 0;
}

- (void)processGallery
{
  if (self->_requirement == 10)
  {
    id v3 = -[PHPhotoLibrary mad_countOfUnclusteredFaces](self->_photoLibrary, "mad_countOfUnclusteredFaces");
    uint64_t v5 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v5 >= 7)
    {
      uint64_t v7 = VCPLogInstance(v5, v6);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      os_log_type_t v9 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v8, v9))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v341 = logPrefix;
        __int16 v342 = 2048;
        uint64_t v343 = (uint64_t)v3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "%@ Found %lu faces to add to Gallery for clustering",  buf,  0x16u);
      }
    }

    unint64_t v11 = +[MADGDUtilities clusterFaceCountThreshold](&OBJC_CLASS___MADGDUtilities, "clusterFaceCountThreshold");
    if ((unint64_t)v3 < v11)
    {
      uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
      if ((int)v13 >= 6)
      {
        uint64_t v15 = VCPLogInstance(v13, v14);
        oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        os_log_type_t v16 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(oslog, v16))
        {
          uint64_t v17 = self->_logPrefix;
          *(_DWORD *)buf = 138412290;
          v341 = v17;
          _os_log_impl((void *)&_mh_execute_header, oslog, v16, "%@ Skipping cluster and person building", buf, 0xCu);
        }

        goto LABEL_204;
      }

      return;
    }
  }

  oslog = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  uint64_t v19 = MediaAnalysisLogLevel(oslog, v18);
  if ((int)v19 >= 6)
  {
    uint64_t v21 = VCPLogInstance(v19, v20);
    os_log_type_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    os_log_type_t v23 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v341 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Start Gallery Person Processing", buf, 0xCu);
    }
  }

  -[os_log_s start](oslog, "start");
  v339[0] = _NSConcreteStackBlock;
  v339[1] = 3221225472LL;
  v339[2] = sub_1000F7A60;
  v339[3] = &unk_1001B9E98;
  v339[4] = self;
  v328 = objc_retainBlock(v339);
  uint64_t v25 = ((uint64_t (*)(void))v328[2])();
  if ((_DWORD)v25)
  {
    uint64_t v27 = MediaAnalysisLogLevel(v25, v26);
    if ((int)v27 >= 6)
    {
      uint64_t v29 = VCPLogInstance(v27, v28);
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      os_log_type_t v31 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v341 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "%@ Gallery processing canceled", buf, 0xCu);
      }
    }

    goto LABEL_203;
  }

  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  self->_photoLibrary));
  [v33 cacheCurrentFaceProgress];

  int64_t v34 = -[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:", MADPersonProcessingStatusKey);
  uint64_t v35 = MADPersonProcessingUpdateAttemptCountKey;
  int64_t v36 = -[VCPDatabaseWriter valueForKey:]( self->_analysisDatabase,  "valueForKey:",  MADPersonProcessingUpdateAttemptCountKey);
  int v38 = v36;
  if (v34 == 1 && (int)v36 <= 4)
  {
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[MADGDUtilities sharedInstance](&OBJC_CLASS___MADGDUtilities, "sharedInstance"));
    [v39 flush];

    uint64_t v42 = MediaAnalysisLogLevel(v40, v41);
    if ((int)v42 >= 6)
    {
      uint64_t v44 = VCPLogInstance(v42, v43);
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      os_log_type_t v46 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v341 = v47;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  v46,  "%@ Finishing previous Gallery updates to Photos",  buf,  0xCu);
      }
    }

    -[VCPDatabaseWriter setValue:forKey:](self->_analysisDatabase, "setValue:forKey:", v38 + 1, v35);
    -[VCPDatabaseWriter commit](self->_analysisDatabase, "commit");
    id v337 = 0LL;
    unsigned __int8 v48 = -[MADPhotosPersonProcessingTask _buildAndPromotePersonWithError:needReclustering:]( self,  "_buildAndPromotePersonWithError:needReclustering:",  &v337,  &v338);
    id v49 = v337;
    uint64_t v51 = v49;
    if ((v48 & 1) == 0)
    {
      uint64_t v52 = MediaAnalysisLogLevel(v49, v50);
      if ((int)v52 >= 3)
      {
        uint64_t v54 = VCPLogInstance(v52, v53);
        os_log_type_t v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        os_log_type_t v56 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v55, v56))
        {
          uint64_t v57 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v341 = v57;
          __int16 v342 = 2112;
          uint64_t v343 = (uint64_t)v51;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  v56,  "%@ Failed to finish previous person updates to Photos - %@",  buf,  0x16u);
        }
      }
    }

- (void)process
{
  id v3 = objc_alloc_init(&OBJC_CLASS___VCPTimeMeasurement);
  -[VCPTimeMeasurement start](v3, "start");
  else {
    -[MADPhotosPersonProcessingTask processLegacy](self, "processLegacy");
  }
  int v4 = _os_feature_enabled_impl("Photos", "PersonAutoCounter");
  if ((-[PHPhotoLibrary isSystemPhotoLibrary](self->_photoLibrary, "isSystemPhotoLibrary") & v4) != 1
    || !VCPMAIsAppleInternal())
  {
    goto LABEL_9;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
  if (!v5
    || (uint64_t v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock")),
        char v7 = v6[2](),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    uint64_t v14 = MADFaceLibraryProcessing_AutoCounterOnly;
    uint64_t v15 = &__kCFBooleanTrue;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    photoLibrary = self->_photoLibrary;
    os_log_type_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &photoLibrary,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADProcessingTask cancelBlock](self, "cancelBlock"));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:]( &OBJC_CLASS___VCPFaceLibraryProcessingTask,  "taskWithPhotoLibraries:andOptions:andProgressHandler:andCompletionHandler:andCancelBlock:",  v9,  v8,  0LL,  0LL,  v10));

    [v11 run];
LABEL_9:
    -[VCPTimeMeasurement stop](v3, "stop");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    -[VCPTimeMeasurement elapsedTimeSeconds](v3, "elapsedTimeSeconds");
    objc_msgSend( v12,  "accumulateDoubleValue:forField:andEvent:",  @"TotalPersonProcessingTimeInSeconds",  @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
  }
}

- (void).cxx_destruct
{
}

@end