@interface SplunkSessionDelegate
- (DownloadManager)downloadManager;
- (SplunkSessionDelegate)initWithDownloadManager:(id)a3;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation SplunkSessionDelegate

- (SplunkSessionDelegate)initWithDownloadManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SplunkSessionDelegate;
  v6 = -[SplunkSessionDelegate init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_downloadManager, a3);
  }

  return v7;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  v14 = objc_autoreleasePoolPush();
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescription]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
    v21 = v16;
    if (v16) {
      v22 = (char *)[v16 statusCode];
    }
    else {
      v22 = 0LL;
    }
    BOOL v25 = v22 != stru_B8.segname && v22 != &stru_B8.segname[6];
    if (v9 || v25)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[SplunkSessionDelegate URLSession:task:didCompleteWithError:]",  @"Network error: %ld",  v17,  v18,  v19,  v20,  (uint64_t)v22);
      uint64_t v23 = 0LL;
    }

    else
    {
      uint64_t v23 = 1LL;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SplunkSessionDelegate URLSession:task:didCompleteWithError:]",  @"Task completed but task was nil",  v10,  v11,  v12,  v13,  v26);
    uint64_t v23 = 0LL;
    v15 = 0LL;
    v21 = 0LL;
  }

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[SplunkSessionDelegate URLSession:task:didCompleteWithError:]",  @"Splunk report result for %@: %d, code:%ld error: %@",  v17,  v18,  v19,  v20,  (uint64_t)v15);
  -[DownloadManager handleSplunkReportFinished:result:]( self->_downloadManager,  "handleSplunkReportFinished:result:",  v15,  v23);

  objc_autoreleasePoolPop(v14);
}

- (DownloadManager)downloadManager
{
  return self->_downloadManager;
}

- (void).cxx_destruct
{
}

@end