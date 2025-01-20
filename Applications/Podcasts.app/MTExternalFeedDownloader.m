@interface MTExternalFeedDownloader
- (BOOL)createPrivateTempDirIfNeeded;
- (BOOL)isFileExpired:(id)a3 inDirectory:(id)a4;
- (BOOL)sessionTaskStateReloaded;
- (MTExternalFeedDownloader)initWithDelegate:(id)a3;
- (MTExternalFeedDownloaderDelegate)delegate;
- (OS_dispatch_queue)workQueue;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (id)backgroundSessionConfigurationIdentifier;
- (id)privatePathForDownload;
- (id)temporaryDirectory;
- (void)_enqueueTempFilesDeletion;
- (void)_removeTempFiles;
- (void)configureSession:(id)a3;
- (void)restoreBackgroundDownloadTasksWithCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionTaskStateReloaded:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startDownloadTaskForFeedURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5;
- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4;
- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5;
@end

@implementation MTExternalFeedDownloader

- (MTExternalFeedDownloader)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTExternalFeedDownloader;
  v5 = -[MTExternalFeedDownloader init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = _MTLogCategoryFeedUpdate(v5);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "MTExternalFeedDownloader allocated: %@",  buf,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[FeedManagerLocalConfiguration platformSpecificConfiguration]( &OBJC_CLASS____TtC18PodcastsFoundation29FeedManagerLocalConfiguration,  "platformSpecificConfiguration"));
    -[MTExternalFeedDownloader setConfiguration:](v6, "setConfiguration:", v9);

    if (v4) {
      -[MTExternalFeedDownloader setDelegate:](v6, "setDelegate:", v4);
    }
    -[MTExternalFeedDownloader _enqueueTempFilesDeletion](v6, "_enqueueTempFilesDeletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](v6, "configuration"));
    unsigned int v11 = [v10 workQueueConcurrent];
    v12 = &_dispatch_queue_attr_concurrent;
    if (!v11) {
      v12 = 0LL;
    }
    v13 = v12;

    v14 = (objc_class *)objc_opt_class(v6);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@-worker", v16));
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], v13);

    -[MTExternalFeedDownloader setWorkQueue:](v6, "setWorkQueue:", v18);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTBaseFeedManager, v4);
  uint64_t v7 = objc_opt_class(v5, v6);
  if ((objc_opt_isKindOfClass(obj, v7) & 1) == 0)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS____TtC18PodcastsFoundation14RSSFeedUpdater, v8);
    uint64_t v11 = objc_opt_class(v9, v10);
    objc_opt_isKindOfClass(obj, v11);
  }

  objc_storeWeak((id *)&self->_delegate, obj);
}

- (id)backgroundSessionConfigurationIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
    uint64_t v5 = (objc_class *)objc_opt_class(v4);
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    return v7;
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MTExternalFeedDownloader;
    id v9 = -[MTExternalFeedDownloader backgroundSessionConfigurationIdentifier]( &v10,  "backgroundSessionConfigurationIdentifier");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (void)configureSession:(id)a3
{
  id v4 = a3;
  [v4 setTimeoutIntervalForRequest:60.0];
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  [v5 timeoutIntervalForResource];
  objc_msgSend(v4, "setTimeoutIntervalForResource:");
}

- (void)startDownloadTaskForFeedURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));

  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
    if ([v11 keepsFeedFileInTempDirAfterDownload])
    {
      unsigned __int8 v12 = -[MTExternalFeedDownloader createPrivateTempDirIfNeeded](self, "createPrivateTempDirIfNeeded");

      if ((v12 & 1) == 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader privatePathForDownload](self, "privatePathForDownload"));
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___MTExternalFeedDownloader;
    -[MTExternalFeedDownloader startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:]( &v16,  "startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:",  v8,  v6,  v5,  v14,  0LL);
  }

  else
  {
    uint64_t v13 = _MTLogCategoryFeedUpdate(v10);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 urlRawString]);
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v18 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@ - Could not start download task for external feedUrl - external feed downloader has no delegate.",  buf,  0xCu);
    }
  }

LABEL_10:
}

- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class(self) statusCodeForTask:v6];
  BOOL v10 = v8 == (id)200 || v8 == (id)206;
  if (v7 && v10)
  {
    id v11 = [(id)objc_opt_class(self) originalURLForTask:v6];
    v59 = (void *)objc_claimAutoreleasedReturnValue(v11);
    unsigned int v58 = [v6 useBackgroundFetch];
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
    unsigned int v13 = [v12 keepsFeedFileInTempDirAfterDownload];

    if (v13)
    {
      id v14 = v7;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 globallyUniqueString]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v16,  @"_feed"));

      dispatch_queue_t v18 = NSTemporaryDirectory();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v19));
      id v14 = (id)objc_claimAutoreleasedReturnValue([v20 URLByAppendingPathComponent:v17]);

      uint64_t v22 = _MTLogCategoryFeedUpdate(v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
        *(_DWORD *)buf = 138543618;
        v71 = v24;
        __int16 v72 = 2114;
        v73 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Moving downloaded feed from %{public}@ to %{public}@",  buf,  0x16u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v63 = 0LL;
      unsigned int v27 = [v26 moveItemAtURL:v7 toURL:v14 error:&v63];
      id v28 = v63;

      if (!v27)
      {
        v68[0] = NSLocalizedDescriptionKey;
        v68[1] = NSUnderlyingErrorKey;
        v69[0] = @"Failed to move downloaded file to tmp folder";
        v69[1] = v28;
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  2LL));
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.externalfeeddownloader",  -1LL,  v50));

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
        [v52 didDownloadFeedWithError:v51 data:0 task:v6 requestedUrl:v59 useBackgroundFetch:v58];

LABEL_34:
        goto LABEL_35;
      }

      uint64_t v30 = _MTLogCategoryFeedUpdate(v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v59 absoluteString]);
        *(_DWORD *)buf = 138412290;
        v71 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Downloaded feed: %@", buf, 0xCu);
      }
    }

    id v33 = objc_initWeak(&location, self);
    uint64_t v34 = _MTLogCategoryFeedUpdate(v33);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v59 absoluteString]);
      *(_DWORD *)buf = 138412290;
      v71 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Started processing feed: %@", buf, 0xCu);
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
    id v61 = 0LL;
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v37,  9LL,  &v61));
    v39 = (__CFString *)v61;

    if (v38)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v60 = 0LL;
      unsigned __int8 v41 = [v40 removeItemAtURL:v14 error:&v60];
      id v42 = v60;

      if ((v41 & 1) != 0)
      {
        uint64_t v44 = _MTLogCategoryFeedUpdate(v43);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
          *(_DWORD *)buf = 138412290;
          v71 = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "Temporary feed file has been removed:%@",  buf,  0xCu);
        }

        v47 = 0LL;
      }

      else
      {
        v64[0] = NSLocalizedDescriptionKey;
        v64[1] = NSUnderlyingErrorKey;
        v65[0] = @"Failed to remove temporary feed file";
        v65[1] = v42;
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v65,  v64,  2LL));
        v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.externalfeeddownloader",  -1LL,  v45));
      }

      uint64_t v54 = _MTLogCategoryFeedUpdate(v53);
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue([v59 absoluteString]);
        *(_DWORD *)buf = 138412290;
        v71 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Finished processing feed: %@", buf, 0xCu);
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
      [v57 didDownloadFeedWithError:v47 data:v38 task:v6 requestedUrl:v59 useBackgroundFetch:v58];
    }

    else
    {
      v66[0] = NSLocalizedDescriptionKey;
      v66[1] = NSUnderlyingErrorKey;
      v48 = @"[no error]";
      if (v39) {
        v48 = v39;
      }
      v67[0] = @"Failed to read feed data from file";
      v67[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  2LL));
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.externalfeeddownloader",  -1LL,  v49));

      id v42 = (id)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
      [v42 didDownloadFeedWithError:v47 data:0 task:v6 requestedUrl:v59 useBackgroundFetch:v58];
    }

    objc_destroyWeak(&location);
    goto LABEL_34;
  }

  -[MTExternalFeedDownloader task:didFailWithError:orStatusCode:]( self,  "task:didFailWithError:orStatusCode:",  v6,  0LL,  v8);
LABEL_35:
}

- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(id)objc_opt_class(self) originalURLForTask:v8];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = _MTLogCategoryFeedUpdate(v11);
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    int64_t v45 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "didFailWithError: %@, error: %@, status: %ld",  buf,  0x20u);
  }

  id v14 = [v9 code];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 importContext]);

  if (a5 == 401 || v14 == (id)-1013LL || v14 == (id)-1012LL)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000DF570;
    v39[3] = &unk_100240240;
    id v40 = v16;
    id v41 = v11;
    [v40 performBlock:v39];

    id v18 = v40;
LABEL_14:

    goto LABEL_15;
  }

  if (v9 || a5 >= 1)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 currentRequest]);
    id v18 = (id)objc_claimAutoreleasedReturnValue([v17 URL]);

    if (a5 >= 400)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000DF5E4;
      v35[3] = &unk_100240710;
      id v36 = v16;
      id v37 = v11;
      int64_t v38 = a5;
      [v36 performBlock:v35];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
    unsigned int v24 = +[MTPodcast isRedirectURL:](&OBJC_CLASS___MTPodcast, "isRedirectURL:", v19);

    if (v24)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      int64_t v45 = (int64_t)sub_1000DF6FC;
      v46 = sub_1000DF70C;
      id v47 = 0LL;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000DF714;
      v31[3] = &unk_100240558;
      id v32 = v16;
      id v33 = v11;
      uint64_t v34 = buf;
      [v32 performBlockAndWait:v31];
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](&OBJC_CLASS___MTFeedUpdateManager, "sharedInstance"));
      objc_msgSend( v20,  "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:tryRedirectURL:",  *(void *)(*(void *)&buf[8] + 40),  objc_msgSend(v8, "isInteractive"),  objc_msgSend(v8, "useBackgroundFetch"),  15,  0);

      _Block_object_dispose(buf, 8);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000DF78C;
    v25[3] = &unk_1002443C0;
    id v26 = v16;
    id v27 = v11;
    int64_t v29 = a5;
    id v28 = v9;
    char v30 = v24;
    [v26 performBlock:v25];

    goto LABEL_14;
  }

- (void)restoreBackgroundDownloadTasksWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = -[MTExternalFeedDownloader sessionTaskStateReloaded](v5, "sessionTaskStateReloaded");
  -[MTExternalFeedDownloader setSessionTaskStateReloaded:](v5, "setSessionTaskStateReloaded:", 1LL);
  objc_sync_exit(v5);

  if ((v6 & 1) == 0)
  {
    -[MTExternalFeedDownloader loadSessionsIfNeeded](v5, "loadSessionsIfNeeded");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader sessionForBackgroundDownloads](v5, "sessionForBackgroundDownloads"));

    if (v7)
    {
      id v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
      dispatch_suspend(v8);

      uint64_t v10 = _MTLogCategoryFeedUpdate(v9);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rebuild pending network tasks - SUSPENDING workQueue: %@.",  buf,  0xCu);
      }

      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader sessionForBackgroundDownloads](v5, "sessionForBackgroundDownloads"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000DFAE8;
      v15[3] = &unk_100240D18;
      v15[4] = v5;
      [v13 getAllTasksWithCompletionHandler:v15];
    }
  }

  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
  dispatch_async(v14, v4);
}

- (id)temporaryDirectory
{
  v3 = NSTemporaryDirectory();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  unsigned int v6 = [v5 keepsFeedFileInTempDirAfterDownload];

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"FeedUpdateDownloads"]);

    id v4 = (void *)v7;
  }

  return v4;
}

- (id)privatePathForDownload
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  unsigned int v4 = [v3 keepsFeedFileInTempDirAfterDownload];

  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 globallyUniqueString]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v6,  @"_feed"));

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader temporaryDirectory](self, "temporaryDirectory"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v7]);

    id v11 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( NSString,  "stringWithCString:encoding:",  [v11 fileSystemRepresentation],  4));
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (BOOL)createPrivateTempDirIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader temporaryDirectory](self, "temporaryDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = 0LL;
    unsigned __int8 v5 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:0 attributes:0 error:&v12];
    id v7 = v12;

    if ((v5 & 1) == 0)
    {
      uint64_t v9 = _MTLogCategoryFeedUpdate(v8);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to create feed-update response download directory. Error=%@ ",  buf,  0xCu);
      }
    }
  }

  return v5;
}

- (void)_enqueueTempFilesDeletion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E0080;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B6B50 != -1) {
    dispatch_once(&qword_1002B6B50, block);
  }
}

- (void)_removeTempFiles
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E00FC;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)isFileExpired:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v5]);

  id v22 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 attributesOfItemAtPath:v8 error:&v22]);
  id v10 = v22;

  if (v9)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSFileModificationDate]);
    unsigned int v13 = v12;
    if (v12) {
      id v14 = v12;
    }
    else {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSFileCreationDate]);
    }
    id v17 = v14;
    -[os_log_s timeIntervalSinceReferenceDate](v14, "timeIntervalSinceReferenceDate");
    double v19 = v18;
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    BOOL v16 = v19 + 10800.0 <= v20;
  }

  else
  {
    uint64_t v15 = _MTLogCategoryFeedUpdate(v11);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to obtain attributes for file:%@, error:%@",  buf,  0x16u);
    }

    BOOL v16 = 1;
  }

  return v16;
}

- (MTExternalFeedDownloaderDelegate)delegate
{
  return (MTExternalFeedDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)sessionTaskStateReloaded
{
  return self->_sessionTaskStateReloaded;
}

- (void)setSessionTaskStateReloaded:(BOOL)a3
{
  self->_sessionTaskStateReloaded = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end