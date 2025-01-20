@interface TRIAssetPatcher
- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7;
- (TRIAssetPatcher)initWithShouldDefer:(id)a3;
@end

@implementation TRIAssetPatcher

- (TRIAssetPatcher)initWithShouldDefer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TRIAssetPatcher;
  v5 = -[TRIAssetPatcher init](&v9, "init");
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id shouldDefer = v5->_shouldDefer;
    v5->_id shouldDefer = v6;
  }

  return v5;
}

- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  notify_post("com.apple.trial.TrialArchivingService.test.beginPatch");
  id v15 = v13;
  id v16 = [v15 fileSystemRepresentation];

  v27[0] = v16;
  id v17 = v12;
  v27[1] = [v17 fileSystemRepresentation];
  id v18 = v14;
  id v19 = [v18 fileSystemRepresentation];

  v27[2] = v19;
  int v28 = 536;
  uint64_t v30 = 0LL;
  uint64_t v29 = 0LL;
  v31 = &_mh_execute_header;
  uint64_t v33 = 0LL;
  uint64_t v32 = 0LL;
  int v34 = 0;
  ParallelCompressionEnterThreadErrorContext();
  int v20 = DirectoryPatch(v27);
  id v26 = 0LL;
  ParallelCompressionLeaveThreadErrorContext(&v26, 0LL, 0LL);
  id v21 = v26;
  if (a7 && v20)
  {
    id v22 = v26;
    unsigned __int8 v23 = 0;
    v24 = (TRIFileSystemCompressor *)*a7;
    *a7 = v22;
LABEL_7:

    goto LABEL_8;
  }

  unsigned __int8 v23 = v20 == 0;
  if (!v20 && a6.var0 == 1)
  {
    notify_post("com.apple.trial.TrialArchivingService.test.beginCompress");
    v24 = objc_opt_new(&OBJC_CLASS___TRIFileSystemCompressor);
    unsigned __int8 v23 = -[TRIFileSystemCompressor inPlaceCompressDirectory:shouldDefer:]( v24,  "inPlaceCompressDirectory:shouldDefer:",  v17,  self->_shouldDefer);
    goto LABEL_7;
  }

- (void).cxx_destruct
{
}

@end