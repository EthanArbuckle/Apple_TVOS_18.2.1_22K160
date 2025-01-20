@interface VCPPhotosCaptureProcessingTask
+ (BOOL)_allowProcessingCapturedFace;
+ (BOOL)_cameraFaceOnly;
+ (BOOL)_concurrentFaceProcessing;
+ (id)taskWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4;
- (BOOL)autoCancellable;
- (BOOL)isAssetEligible:(id)a3;
- (BOOL)run:(id *)a3;
- (VCPPhotosCaptureProcessingTask)init;
- (VCPPhotosCaptureProcessingTask)initWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4;
- (float)resourceRequirement;
- (int)faceProcessingForAssets:(id)a3 withManager:(id)a4 onDemandDetection:(BOOL)a5;
- (int)run;
- (void)_persistClassifiedFaces:(id)a3 withDetectedPersons:(id)a4;
- (void)_reportEventPostCapturesProcessing;
- (void)_resetFieldsPostCapturesProcessing;
- (void)cancel;
- (void)dealloc;
- (void)interrupt;
- (void)ocrProcessingForAssets:(id)a3;
- (void)resetInterruption;
@end

@implementation VCPPhotosCaptureProcessingTask

- (VCPPhotosCaptureProcessingTask)init
{
  return 0LL;
}

- (VCPPhotosCaptureProcessingTask)initWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___VCPPhotosCaptureProcessingTask;
  v9 = -[VCPPhotosCaptureProcessingTask init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibraries, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    dispatch_group_t v13 = dispatch_group_create();
    persistGroup = v10->_persistGroup;
    v10->_persistGroup = (OS_dispatch_group *)v13;

    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaanalysisd.VCPPhotosCaptureProcessingTask.persist", v16);
    persistQueue = v10->_persistQueue;
    v10->_persistQueue = (OS_dispatch_queue *)v17;
  }

  return v10;
}

+ (id)taskWithPhotoLibraries:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithPhotoLibraries:v6 andCompletionHandler:v7];

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VNSession globalSession](&OBJC_CLASS___VNSession, "globalSession"));
  [v3 releaseCachedResources];

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v4 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Photos capture processing task cancelled"));
    id v11 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v7));
    completionHandler[2](completionHandler, v8);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VCPPhotosCaptureProcessingTask;
  -[VCPPhotosCaptureProcessingTask dealloc](&v9, "dealloc");
}

- (float)resourceRequirement
{
  return 0.4;
}

- (BOOL)autoCancellable
{
  return 1;
}

- (void)cancel
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 6)
  {
    uint64_t v3 = VCPLogInstance();
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[PhotosCapture] Cancelling processing", v6, 2u);
    }
  }

  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

- (void)interrupt
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 6)
  {
    uint64_t v3 = VCPLogInstance();
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[PhotosCapture] Interrupting processing", v6, 2u);
    }
  }

  atomic_store(1u, (unsigned __int8 *)&self->_interrupt);
}

- (void)resetInterruption
{
  if ((int)MediaAnalysisLogLevel(self, a2) >= 5)
  {
    uint64_t v3 = VCPLogInstance();
    unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    os_log_type_t v5 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v4, v5))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "[PhotosCapture] Resetting interrupt", v6, 2u);
    }
  }

  atomic_store(0, (unsigned __int8 *)&self->_interrupt);
}

+ (BOOL)_allowProcessingCapturedFace
{
  return 1;
}

+ (BOOL)_concurrentFaceProcessing
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_1001E6518);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_1001E6518))
  {
    byte_1001E6510 = DeviceHasANE();
    __cxa_guard_release(&qword_1001E6518);
  }

  return byte_1001E6510;
}

+ (BOOL)_cameraFaceOnly
{
  return 0;
}

- (BOOL)isAssetEligible:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 deferredProcessingNeeded]
    || [v3 deferredProcessingNeeded] == 4
    || [v3 deferredProcessingNeeded] == 8
    || [v3 deferredProcessingNeeded] == 1;

  return v4;
}

- (void)_persistClassifiedFaces:(id)a3 withDetectedPersons:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 photoLibrary]);

    NSErrorUserInfoKey v10 = (void *)objc_claimAutoreleasedReturnValue([v9 librarySpecificFetchOptions]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100079908;
    v23[3] = &unk_1001BBE70;
    id v24 = v5;
    id v25 = v6;
    id v11 = v10;
    id v26 = v11;
    v12 = objc_retainBlock(v23);
    id v22 = 0LL;
    unsigned __int8 v13 = [v9 performChangesAndWait:v12 error:&v22];
    id v14 = v22;
    v16 = v14;
    if ((v13 & 1) == 0)
    {
      uint64_t v17 = MediaAnalysisLogLevel(v14, v15);
      if ((int)v17 >= 3)
      {
        uint64_t v19 = VCPLogInstance(v17, v18);
        objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "[PhotosCapture] Failed to persist person identification results - %@",  buf,  0xCu);
        }
      }
    }
  }
}

- (int)faceProcessingForAssets:(id)a3 withManager:(id)a4 onDemandDetection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    int v12 = 0;
    goto LABEL_37;
  }

  id v10 = [v9 loadPersonsModelAndInitializeFaceAnalyzerWrapper];
  int v12 = (int)v10;
  if (!(_DWORD)v10)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10007A674;
    v69[3] = &unk_1001BC088;
    id v70 = v9;
    v71 = self;
    id v59 = v53;
    id v72 = v59;
    id v19 = v18;
    id v73 = v19;
    v60 = objc_retainBlock(v69);
    uint64_t v58 = mach_absolute_time();
    uint64_t v20 = VCPSignPostLog(v58);
    os_log_type_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    uint64_t v24 = VCPSignPostLog(v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    id v26 = v25;
    unint64_t v56 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  v22,  "VCPJIT_Face_DetectAndIdentifyBatch",  (const char *)&unk_100199097,  buf,  2u);
    }

    os_signpost_id_t v57 = v22;

    if ([(id)objc_opt_class(self) _concurrentFaceProcessing])
    {
      id v54 = v19;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      id v27 = [v8 count];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10007A7E8;
      block[3] = &unk_1001BC0B0;
      block[4] = self;
      BOOL v68 = v5;
      id v55 = v8;
      id v65 = v55;
      id v28 = v52;
      id v66 = v28;
      v29 = v60;
      id v67 = v29;
      dispatch_apply((size_t)v27, 0LL, block);
      unsigned __int8 v30 = atomic_load((unsigned __int8 *)&self->_interrupt);
      if ((v30 & 1) != 0 || (unsigned __int8 v31 = atomic_load((unsigned __int8 *)&self->_cancel), (v31 & 1) != 0) && v5)
      {
        int v32 = 6;
      }

      else
      {
        for (unint64_t i = 0; i < (unint64_t)[v28 count]; ++i)
        {
          v48 = objc_autoreleasePoolPush();
          unsigned __int8 v49 = atomic_load((unsigned __int8 *)&self->_interrupt);
          if ((v49 & 1) != 0 || (unsigned __int8 v50 = atomic_load((unsigned __int8 *)&self->_cancel), (v50 & 1) != 0) && v5)
          {
            int v32 = 6;
          }

          else
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue([v55 objectAtIndexedSubscript:i]);
            if (-[VCPPhotosCaptureProcessingTask isAssetEligible:](self, "isAssetEligible:", v51))
            {
              ((void (*)(void *, void *, BOOL))v29[2])(v29, v51, v5);
              int v32 = 0;
            }

            else
            {
              int v32 = 9;
            }
          }

          objc_autoreleasePoolPop(v48);
          if (v32 != 9 && v32) {
            goto LABEL_15;
          }
        }

        int v32 = 0;
      }

- (void)ocrProcessingForAssets:(id)a3
{
  id v4 = a3;
  uint64_t v53 = mach_absolute_time();
  uint64_t v5 = VCPSignPostLog(v53);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v9 = VCPSignPostLog(v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  os_signpost_id_t spid = v7;
  unint64_t v52 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "VCPJIT_OCR_Batch",  (const char *)&unk_100199097,  buf,  2u);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibrary]);
  id v54 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v13));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10007AFCC;
  v56[3] = &unk_1001B9E98;
  v56[4] = self;
  id v55 = objc_retainBlock(v56);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADOCRAssetBatch batchWithAnalysisDatabase:allowDownload:cancelBlock:]( &OBJC_CLASS___VCPMADOCRAssetBatch,  "batchWithAnalysisDatabase:allowDownload:cancelBlock:",  v54,  0LL,  v55));
  unint64_t v15 = 0LL;
  os_log_type_t v16 = VCPLogToOSLogType[7];
  os_log_type_t type = VCPLogToOSLogType[6];
  while (v15 < (unint64_t)[v4 count])
  {
    os_log_type_t v17 = objc_autoreleasePoolPush();
    unsigned __int8 v18 = atomic_load((unsigned __int8 *)&self->_interrupt);
    if ((v18 & 1) == 0)
    {
      unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_cancel);
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v15]);
        BOOL v21 = -[VCPPhotosCaptureProcessingTask isAssetEligible:](self, "isAssetEligible:", v20);
        if (v21)
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "vcp_passedOCRGating"));
          id v24 = [v23 BOOLValue];
          if ((_DWORD)v24)
          {
            id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            [v14 addPhotosAsset:v20 withPreviousStatus:0 attempts:0 andAttemptDate:v26];
            goto LABEL_11;
          }

          if (v23)
          {
            uint64_t v32 = MediaAnalysisLogLevel(v24, v25);
            if ((int)v32 >= 7)
            {
              uint64_t v34 = VCPLogInstance(v32, v33);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v26, v16))
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue([v20 localIdentifier]);
                *(_DWORD *)buf = 138412290;
                uint64_t v58 = v35;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  v16,  "[PhotosCapture][%@] OCR gating did not pass; skipping",
                  buf,
                  0xCu);
              }

              goto LABEL_11;
            }
          }

          else
          {
            uint64_t v36 = MediaAnalysisLogLevel(v24, v25);
            if ((int)v36 >= 6)
            {
              uint64_t v38 = VCPLogInstance(v36, v37);
              id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v26, type))
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue([v20 localIdentifier]);
                *(_DWORD *)buf = 138412290;
                uint64_t v58 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  type,  "[PhotosCapture][%@] OCR gating not available; skipping",
                  buf,
                  0xCu);
              }

- (BOOL)run:(id *)a3
{
  v130 = objc_autoreleasePoolPush();
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  __int128 v152 = 0u;
  __int128 v153 = 0u;
  __int128 v150 = 0u;
  __int128 v151 = 0u;
  obj = self->_photoLibraries;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v150,  v176,  16LL);
  v149 = self;
  if (v4)
  {
    uint64_t v140 = *(void *)v151;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v141 = VCPLogToOSLogType[6];
    do
    {
      id v139 = v4;
      for (unint64_t i = 0LL; i != v139; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v151 != v140) {
          objc_enumerationMutation(obj);
        }
        v142 = *(void **)(*((void *)&v150 + 1) + 8LL * (void)i);
        context = objc_autoreleasePoolPush();
        unsigned __int8 v5 = atomic_load((unsigned __int8 *)&v149->_interrupt);
        if ((v5 & 1) != 0 || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v149->_cancel), (v6 & 1) != 0))
        {
          if (!a3)
          {
            char v145 = 0;
            int v52 = 1;
            goto LABEL_45;
          }

          NSErrorUserInfoKey v174 = NSLocalizedDescriptionKey;
          unsigned __int8 v48 = atomic_load((unsigned __int8 *)&v149->_interrupt);
          BOOL v49 = (v48 & 1) == 0;
          unsigned __int8 v50 = @"Interrupted";
          if (v49) {
            unsigned __int8 v50 = @"Canceled";
          }
          v147 = (VCPPhotosQuickFaceIdentificationManager *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[PhotosCapture] %@ at task start",  v50));
          v175 = v147;
          v144 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v175,  &v174,  1LL));
          v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL));
          char v145 = 0;
          id v11 = *a3;
          *a3 = v51;
LABEL_41:
          int v52 = 1;
LABEL_42:

          goto LABEL_43;
        }

        v147 = -[VCPPhotosQuickFaceIdentificationManager initWithPhotoLibrary:]( objc_alloc(&OBJC_CLASS___VCPPhotosQuickFaceIdentificationManager),  "initWithPhotoLibrary:",  v142);
        v144 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( &OBJC_CLASS___PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v142,  8LL));
        os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"faceAdjustmentVersion = nil"));
        [v144 setInternalPredicate:v7];

        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"creationDate",  0LL));
        v173 = v8;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v173, 1LL));
        [v144 setSortDescriptors:v9];

        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsFromCameraSinceDate:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsFromCameraSinceDate:options:",  0LL,  v144));
        id v11 = (id)objc_claimAutoreleasedReturnValue([v10 fetchedObjects]);

        int v12 = v11;
        uint64_t v15 = MediaAnalysisLogLevel(v13, v14);
        if ((int)v15 >= 7)
        {
          uint64_t v17 = VCPLogInstance(v15, v16);
          unsigned __int8 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, type))
          {
            id v19 = [v11 count];
            *(_DWORD *)buf = 134217984;
            unint64_t v170 = (unint64_t)v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  type,  "[PhotosCapture] Quick Face ID: %lu captured assets; start fast track process",
              buf,
              0xCu);
          }

          int v12 = v11;
        }

        v149->_numberOfNewCaptures = (unint64_t)[v12 count];
        uint64_t v134 = mach_absolute_time();
        uint64_t v20 = VCPSignPostLog(v134);
        BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        os_signpost_id_t spid = os_signpost_id_generate(v21);

        uint64_t v23 = VCPSignPostLog(v22);
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = v24;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v25,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "VCPJIT_CameraFace_EndToEnd",  (const char *)&unk_100199097,  buf,  2u);
        }

        BOOL v27 = 0;
        uint64_t v28 = 0LL;
        unint64_t v29 = 0LL;
        while (!v27)
        {
          uint64_t v30 = objc_autoreleasePoolPush();
          unsigned __int8 v31 = v11;
          uint64_t v32 = (char *)[v11 count];
          else {
            uint64_t v34 = (uint64_t)&v32[-v29];
          }
          uint64_t v35 = MediaAnalysisLogLevel(v32, v33);
          if ((int)v35 >= 6)
          {
            uint64_t v37 = VCPLogInstance(v35, v36);
            uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, v141))
            {
              ++v28;
              *(_DWORD *)buf = 134218240;
              unint64_t v170 = (unint64_t)v28;
              __int16 v171 = 2048;
              uint64_t v172 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  v141,  "[PhotosCapture] Quick Face ID fast track batch %lu, jobs: %lu",  buf,  0x16u);
            }

            unsigned __int8 v31 = v11;
          }

          v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndexesInRange:",  v29,  v34));
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v31 objectsAtIndexes:v39]);
          signed int v41 = -[VCPPhotosCaptureProcessingTask faceProcessingForAssets:withManager:onDemandDetection:]( v149,  "faceProcessingForAssets:withManager:onDemandDetection:",  v40,  v147,  0LL);
          if (v41)
          {
            if (a3)
            {
              NSErrorUserInfoKey v167 = NSLocalizedDescriptionKey;
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[PhotosCapture] Error during fast track face processing"));
              v168 = v42;
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v168,  &v167,  1LL));
              v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v41,  v43));
              BOOL v27 = 0;
              goto LABEL_33;
            }

            BOOL v27 = 0;
            goto LABEL_34;
          }

          v29 += v34;
          BOOL v27 = v29 >= (unint64_t)[v11 count];
          unsigned __int8 v45 = atomic_load((unsigned __int8 *)&v149->_interrupt);
          if ((v45 & 1) != 0)
          {
            if (a3)
            {
              NSErrorUserInfoKey v165 = NSLocalizedDescriptionKey;
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[PhotosCapture] Interrupted with %lu fast track face job done",  v29));
              v166 = v42;
              uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v166,  &v165,  1LL));
              v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v43));
LABEL_33:
              id v47 = *a3;
              *a3 = v44;
            }

- (void)_resetFieldsPostCapturesProcessing
{
  *(_OWORD *)&self->_numberOfCapturesHaveFaces = 0u;
  *(_OWORD *)&self->_numberOfPositiveFaces = 0u;
  *(_OWORD *)&self->_numberOfNewCaptures = 0u;
}

- (void)_reportEventPostCapturesProcessing
{
  unsigned __int8 v2 = self;
  objc_sync_enter(v2);
  unint64_t numberOfNewCaptures = v2->_numberOfNewCaptures;
  if (numberOfNewCaptures)
  {
    unint64_t numberOfFaces = v2->_numberOfFaces;
    if (numberOfFaces) {
      float v5 = (float)v2->_numberOfPositiveFaces / (float)numberOfFaces;
    }
    else {
      float v5 = 0.0;
    }
    unint64_t numberOfNewCapturesProcessed = v2->_numberOfNewCapturesProcessed;
    unint64_t numberOfCapturesHaveFaces = v2->_numberOfCapturesHaveFaces;
    unint64_t numberOfNewCapturesWithFaceHaveFaceprintFromCamera = v2->_numberOfNewCapturesWithFaceHaveFaceprintFromCamera;
    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[VCPMADCoreAnalyticsManager sharedManager]( &OBJC_CLASS___VCPMADCoreAnalyticsManager,  "sharedManager"));
    v25[0] = @"NumberOfNewCaptures";
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v2->_numberOfNewCaptures));
    v26[0] = v23;
    v25[1] = @"NumberOfNewCapturesProcessed";
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v2->_numberOfNewCapturesProcessed));
    float v10 = (float)numberOfNewCaptures;
    *(float *)&double v11 = (float)numberOfNewCapturesProcessed / (float)numberOfNewCaptures;
    v26[1] = v9;
    v25[2] = @"PercentageOfNewCapturesProcessed";
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
    v26[2] = v12;
    v25[3] = @"NumberOfCapturesHaveFace";
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v2->_numberOfCapturesHaveFaces));
    *(float *)&double v14 = (float)numberOfCapturesHaveFaces / v10;
    v26[3] = v13;
    v25[4] = @"PercentageOfCapturesHaveFace";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14));
    v26[4] = v15;
    v25[5] = @"NumberOfNewCapturesWithFaceFullFromCamera";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v2->_numberOfNewCapturesWithFaceHaveFaceprintFromCamera));
    *(float *)&double v17 = (float)numberOfNewCapturesWithFaceHaveFaceprintFromCamera / v10;
    v26[5] = v16;
    v25[6] = @"PercentageOfNewCapturesWithFaceFullFromCamera";
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v17));
    v26[6] = v18;
    v25[7] = @"NumberOfPositiveFace";
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v2->_numberOfPositiveFaces));
    v26[7] = v19;
    v25[8] = @"PercentageOfPositiveFaces";
    *(float *)&double v20 = v5;
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v20));
    v26[8] = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  9LL));
    [v24 sendEvent:@"com.apple.mediaanalysisd.photos.postcapturefaceprocessing" withAnalytics:v22];

    -[VCPPhotosCaptureProcessingTask _resetFieldsPostCapturesProcessing](v2, "_resetFieldsPostCapturesProcessing");
  }

  else
  {
    -[VCPPhotosCaptureProcessingTask _resetFieldsPostCapturesProcessing](v2, "_resetFieldsPostCapturesProcessing");
  }

  objc_sync_exit(v2);
}

- (int)run
{
  uint64_t v23 = 0LL;
  if (-[VCPPhotosCaptureProcessingTask run:](self, "run:", &v23)) {
    goto LABEL_16;
  }
  id v3 = -[__CFString code](v23, "code");
  if (v3 == (id)-128LL)
  {
    uint64_t v5 = MediaAnalysisLogLevel(-128LL, v4);
    uint64_t v7 = VCPLogInstance(v5, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_interrupt);
    if ((v10 & 1) != 0) {
      double v11 = @"interrupted";
    }
    else {
      double v11 = @"canceled";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    BOOL v27 = v23;
    int v12 = "[PhotosCapture] Task %@ (%@)";
    uint64_t v13 = v8;
    os_log_type_t v14 = v9;
    uint32_t v15 = 22;
    goto LABEL_12;
  }

  uint64_t v16 = MediaAnalysisLogLevel(v3, v4);
  uint64_t v18 = VCPLogInstance(v16, v17);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  os_log_type_t v19 = VCPLogToOSLogType[3];
  if (os_log_type_enabled(v8, v19))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v23;
    int v12 = "[PhotosCapture] Task failed (%@)";
    uint64_t v13 = v8;
    os_log_type_t v14 = v19;
    uint32_t v15 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
  }

- (void).cxx_destruct
{
}

@end