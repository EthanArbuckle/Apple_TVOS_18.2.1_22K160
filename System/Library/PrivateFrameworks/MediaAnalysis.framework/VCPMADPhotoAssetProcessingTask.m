@interface VCPMADPhotoAssetProcessingTask
- (BOOL)run:(id *)a3;
- (VCPMADPhotoAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
@end

@implementation VCPMADPhotoAssetProcessingTask

- (VCPMADPhotoAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000D3430;
  v24[3] = &unk_1001B9800;
  id v17 = a7;
  id v25 = v17;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___VCPMADPhotoAssetProcessingTask;
  v18 = -[VCPMADPhotosProcessingTask initWithCompletionHandler:](&v23, "initWithCompletionHandler:", v24);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 28), a3);
    objc_storeStrong((id *)(v19 + 36), a4);
    id v20 = objc_retainBlock(v16);
    v21 = *(void **)(v19 + 44);
    *(void *)(v19 + 44) = v20;

    [v19 setCancelBlock:v15];
  }

  return (VCPMADPhotoAssetProcessingTask *)v19;
}

- (BOOL)run:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( NSProgress,  "progressWithTotalUnitCount:",  [*(id *)(&self->super._publishError + 1) count]));
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_1000D3C30;
  v75[3] = &unk_1001B9E00;
  v75[4] = self;
  id v6 = v5;
  id v76 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[VCPTimer timerWithIntervalSeconds:isOneShot:andBlock:]( &OBJC_CLASS___VCPTimer,  "timerWithIntervalSeconds:isOneShot:andBlock:",  10LL,  0LL,  v75));
  uint64_t v8 = *(uint64_t *)((char *)&self->_photoLibraryURL + 4);
  if (v8) {
    uint64_t v8 = (*(uint64_t (**)(double))(v8 + 16))(0.0);
  }
  id v74 = v6;
  uint64_t v9 = VCPSignPostLog(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v13 = VCPSignPostLog(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "VCPProcessPhotoAssets",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 photoLibraryWithURL:*(NSArray **)((char *)&self->_localIdentifiers + 4)]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v17));
    if (v18)
    {
      v70 = a3;
      v73 = v7;
      id v19 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v17,  [(id)objc_opt_class(self) taskID]);
      uint64_t v72 = objc_claimAutoreleasedReturnValue(v19);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[PHAsset fetchAssetsWithLocalIdentifiers:options:]( &OBJC_CLASS___PHAsset,  "fetchAssetsWithLocalIdentifiers:options:",  *(void *)(&self->super._publishError + 1)));
      if ([v20 count])
      {
        id v22 = [v20 count];
        id v23 = [*(id *)(&self->super._publishError + 1) count];
        if (v22 != v23)
        {
          uint64_t v25 = MediaAnalysisLogLevel(v23, v24);
          if ((int)v25 >= 4)
          {
            uint64_t v27 = VCPLogInstance(v25, v26);
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            os_log_type_t type = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v28, type))
            {
              id v29 = [(id)objc_opt_class(self) name];
              v68 = (void *)objc_claimAutoreleasedReturnValue(v29);
              id v67 = [v20 count];
              id v30 = [*(id *)(&self->super._publishError + 1) count];
              *(_DWORD *)buf = 138412802;
              v82 = v68;
              __int16 v83 = 2048;
              id v84 = v67;
              __int16 v85 = 2048;
              id v86 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  type,  "[%@] Fetched asset count (%ld) does not match requested (%ld)",  buf,  0x20u);
            }
          }
        }

        LODWORD(v31) = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v20,  v18,  0LL,  v6);
        v7 = v73;
        if ((_DWORD)v31
          || (uint64_t v31 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing"), (_DWORD)v31))
        {
          v34 = (void *)v72;
          if ((_DWORD)v31 == -128)
          {
            BOOL v45 = (char)v70;
            if (v70)
            {
              NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
              id v51 = [(id)objc_opt_class(self) name];
              v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Asset processing cancelled",  v35));
              v80 = v52;
              v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
              uint64_t v54 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v53));
              id v55 = *v70;
              id *v70 = (id)v54;

              v7 = v73;
LABEL_39:
              BOOL v45 = 0;
              goto LABEL_40;
            }
          }

          else
          {
            BOOL v45 = (char)v70;
            if (v70)
            {
              uint64_t v60 = (int)v31;
              NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
              id v61 = [(id)objc_opt_class(self) name];
              v35 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Asset processing failed",  v35));
              v78 = v62;
              v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v78,  &v77,  1LL));
              uint64_t v64 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v60,  v63));
              id v65 = *v70;
              id *v70 = (id)v64;

              v7 = v73;
              goto LABEL_39;
            }
          }

- (void).cxx_destruct
{
}

@end