@interface VCPMADPhotosFetchProcessingTask
- (BOOL)run:(id *)a3;
- (VCPMADPhotosFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
@end

@implementation VCPMADPhotosFetchProcessingTask

- (VCPMADPhotosFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100078A7C;
  v25[3] = &unk_1001B9800;
  id v16 = a7;
  id v26 = v16;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___VCPMADPhotosFetchProcessingTask;
  v17 = -[VCPMADPhotosProcessingTask initWithCompletionHandler:](&v24, "initWithCompletionHandler:", v25);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 28), a4);
    id v19 = objc_retainBlock(v12);
    v20 = *(void **)(v18 + 36);
    *(void *)(v18 + 36) = v19;

    id v21 = objc_retainBlock(v15);
    v22 = *(void **)(v18 + 44);
    *(void *)(v18 + 44) = v21;

    [v18 setCancelBlock:v14];
  }

  return (VCPMADPhotosFetchProcessingTask *)v18;
}

- (BOOL)run:(id *)a3
{
  uint64_t v5 = VCPSignPostLog(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v9 = VCPSignPostLog(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "VCPProcessPhotoAssets",  (const char *)&unk_100199097,  buf,  2u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VCPPhotoLibraryManager sharedManager](&OBJC_CLASS___VCPPhotoLibraryManager, "sharedManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibraryWithURL:*(void *)(&self->super._publishError + 1)]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:]( &OBJC_CLASS___VCPDatabaseManager,  "sharedDatabaseForPhotoLibrary:",  v13));
    if (v14)
    {
      id v15 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:]( PHAsset,  "vcp_fetchOptionsForLibrary:forTaskID:",  v13,  [(id)objc_opt_class(self) taskID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = ((uint64_t (*)(void))(*(NSURL **)((char *)&self->_photoLibraryURL + 4))->_baseURL)();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if ([v18 count])
      {
        LODWORD(v20) = -[VCPMADPhotosProcessingTask processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:]( self,  "processAssetsInFetchResult:withAnalysisDatabase:allowDownload:progress:",  v18,  v14,  0LL,  0LL);
        if ((_DWORD)v20
          || (uint64_t v20 = -[VCPMADPhotosProcessingTask waitForPublishing](self, "waitForPublishing"), (_DWORD)v20))
        {
          if ((_DWORD)v20 == -128)
          {
            if (a3)
            {
              NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
              id v35 = [(id)objc_opt_class(self) name];
              v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(v35);
              id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Asset processing cancelled",  v22));
              v53 = v26;
              v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
              v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v36));
              id v38 = *a3;
              *a3 = v37;

LABEL_21:
              goto LABEL_28;
            }
          }

          else if (a3)
          {
            uint64_t v41 = (int)v20;
            NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
            id v42 = [(id)objc_opt_class(self) name];
            v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] Asset processing failed",  v22));
            v51 = v43;
            v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
            v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v41,  v44));
            id v46 = *a3;
            *a3 = v45;

            goto LABEL_28;
          }

- (void).cxx_destruct
{
}

@end