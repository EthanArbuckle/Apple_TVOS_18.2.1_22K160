@interface DownloaderSessionDelegate
- (DownloadManager)downloadManager;
- (DownloaderSessionDelegate)initWithDownloadManager:(id)a3;
- (NSString)backgroundSessionID;
- (id)allBackgroundSessionIDs;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)invalidateStaleBackgroundSessionsIfNeeded;
@end

@implementation DownloaderSessionDelegate

- (DownloaderSessionDelegate)initWithDownloadManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DownloaderSessionDelegate;
  result = -[DownloaderSessionDelegate init](&v5, "init");
  if (result) {
    result->_downloadManager = (DownloadManager *)a3;
  }
  return result;
}

- (id)allBackgroundSessionIDs
{
  return &off_38FAC0;
}

- (NSString)backgroundSessionID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DownloaderSessionDelegate allBackgroundSessionIDs](self, "allBackgroundSessionIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastObject]);

  return (NSString *)v3;
}

- (void)invalidateStaleBackgroundSessionsIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DownloaderSessionDelegate backgroundSessionID](self, "backgroundSessionID"));
  id v4 = _MAPreferencesCopyValue(@"LastUsedBackgroundSessionID");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (([v5 isEqual:v3] & 1) == 0)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DownloaderSessionDelegate allBackgroundSessionIDs](self, "allBackgroundSessionIDs"));
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
          if (([v11 isEqual:v3] & 1) == 0)
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloaderSessionDelegate invalidateStaleBackgroundSessionsIfNeeded]",  @"Cancelling stale background session: %@",  v12,  v13,  v14,  v15,  (uint64_t)v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  v11));
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v16));
            [v17 invalidateAndCancel];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v8);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[DownloaderSessionDelegate invalidateStaleBackgroundSessionsIfNeeded]"));
    _MAPreferencesSetStringValue( @"LastUsedBackgroundSessionID",  v3,  v18,  @"cancelled old background sessions");
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v18 = a4;
  v6 = (void (**)(id, void, void *))a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v18 protectionSpace]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authenticationMethod]);

  if ([v8 isEqualToString:NSURLAuthenticationMethodServerTrust]
    && (id v9 = MAInternalServerTrustCredential(v18), (v10 = objc_claimAutoreleasedReturnValue(v9)) != 0))
  {
    v11 = (void *)v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v18 protectionSpace]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 host]);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloaderSessionDelegate URLSession:didReceiveChallenge:completionHandler:]",  @"Using internal server trust for %@",  v14,  v15,  v16,  v17,  (uint64_t)v13);

    v6[2](v6, 0LL, v11);
  }

  else
  {
    v6[2](v6, 1LL, 0LL);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v19 = a3;
  id v11 = a4;
  uint64_t v16 = objc_autoreleasePoolPush();
  if (v11)
  {
    downloadManager = self->_downloadManager;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 taskDescription]);
    -[DownloadManager updateProgressIfRequired:totalWritten:totalExpected:notify:]( downloadManager,  "updateProgressIfRequired:totalWritten:totalExpected:notify:",  v18,  a6,  a7,  0LL);
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloaderSessionDelegate URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:]",  @"Task was updated but was nil, should never happen! Session %@",  v12,  v13,  v14,  v15,  (uint64_t)v19);
  }

  objc_autoreleasePoolPop(v16);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didResumeAtOffset:(int64_t)a5 expectedTotalBytes:(int64_t)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v14 = objc_autoreleasePoolPush();
  if (self->_downloadManager)
  {
    if (v8)
    {
      unsigned int v15 = [v8 _hasSZExtractor];
      char v16 = v15;
      if (v15) {
        unsigned int v17 = [v8 _doesSZExtractorConsumeExtractedData] ^ 1;
      }
      else {
        unsigned int v17 = 1;
      }
      unsigned int v27 = v17;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 originalRequest]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 URL]);

      if (v19 && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSURL), (objc_opt_isKindOfClass(v19, v20) & 1) != 0)) {
        id v21 = v19;
      }
      else {
        id v21 = 0LL;
      }
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 response]);
      downloadManager = self->_downloadManager;
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 taskDescription]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
      LOBYTE(v26) = v16;
      -[DownloadManager assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExists:]( downloadManager,  "assessDownloadCompletion:originalUrl:taskDescription:taskId:error:moveFile:extractorExists:",  v22,  v21,  v24,  v25,  v9,  v27,  v26);
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloaderSessionDelegate URLSession:task:didCompleteWithError:]",  @"Session %@ Task completed but task was nil",  v10,  v11,  v12,  v13,  (uint64_t)v28);
      -[DownloadManager queryNSUrlSessiondAndUpdateState](self->_downloadManager, "queryNSUrlSessiondAndUpdateState");
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[DownloaderSessionDelegate URLSession:task:didCompleteWithError:]",  @"Download manager is nil aborting. Session %@ task %@",  v10,  v11,  v12,  v13,  (uint64_t)v28);
  }

  objc_autoreleasePoolPop(v14);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v28 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_autoreleasePoolPush();
  id v10 = [v7 _hasSZExtractor];
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 taskDescription]);
  if ((_DWORD)v10 && [v7 _doesSZExtractorConsumeExtractedData])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloaderSessionDelegate URLSession:downloadTask:didFinishDownloadingToURL:]",  @"Skipping the move due to extractor consuming bytes. Session %@ task %@",  v11,  v12,  v13,  v14,  (uint64_t)v28);
LABEL_8:
    v25 = 0LL;
    unsigned int v27 = 0LL;
    id v19 = 0LL;
    unsigned int v17 = 0LL;
    goto LABEL_9;
  }

  if (!v15)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloaderSessionDelegate URLSession:downloadTask:didFinishDownloadingToURL:]",  @"Skipping the move as we do not have a task description. Session %@",  v11,  v12,  v13,  v14,  (uint64_t)v28);
    goto LABEL_8;
  }

  id AssetTypeFromTaskDescriptor = getAssetTypeFromTaskDescriptor(v15);
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(AssetTypeFromTaskDescriptor);
  id v18 = repositoryPath(v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[DownloaderSessionDelegate URLSession:downloadTask:didFinishDownloadingToURL:]",  @"Moving file in didFinishDownloadingToURL, extractor: %d. Session %@ task %@ type %@ repository %@",  v20,  v21,  v22,  v23,  (uint64_t)v10);
  id PathToStagedFile = getPathToStagedFile(v17, v15, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue(PathToStagedFile);
  id PathToTempDownloadFile = getPathToTempDownloadFile(v17, v15, 0);
  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(PathToTempDownloadFile);
  moveTargetToDirectory(v8, v25);
  if (v27) {
    removeItem(v27);
  }
LABEL_9:

  objc_autoreleasePoolPop(v9);
}

- (DownloadManager)downloadManager
{
  return self->_downloadManager;
}

@end