@interface IMDebugDownloadReportDataProvider
- (IMDebugDownloadReportDataProvider)init;
- (void)createDebugDataWithCompletion:(id)a3;
@end

@implementation IMDebugDownloadReportDataProvider

- (IMDebugDownloadReportDataProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IMDebugDownloadReportDataProvider;
  v2 = -[IMDebugDownloadReportDataProvider init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 privateQueueContext]);

    v5 = objc_alloc(&OBJC_CLASS___PFDownloadsStateReportCollector);
    v13[0] = kEpisodeUuid;
    v13[1] = kEpisodeDownloadBehavior;
    v13[2] = kEpisodeTitle;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 3LL));
    v12[0] = kPodcastUuid;
    v12[1] = kPodcastEpisodeLimit;
    v12[2] = kPodcastTitle;
    v12[3] = kPodcastDownloadedEpisodesCount;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
    v8 = -[PFDownloadsStateReportCollector initWithManagedObjectContext:episodePropertiesToReport:showPropertiesToReport:allEpisodes:]( v5,  "initWithManagedObjectContext:episodePropertiesToReport:showPropertiesToReport:allEpisodes:",  v4,  v6,  v7,  0LL);
    collector = v2->_collector;
    v2->_collector = v8;
  }

  return v2;
}

- (void)createDebugDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  collector = self->_collector;
  if (collector)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke;
    v8[3] = &unk_C590;
    v9 = @"download-state-report.json";
    id v10 = v4;
    -[PFDownloadsStateReportCollector generateReportWithCompletionHandler:]( collector,  "generateReportWithCompletionHandler:",  v8);
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([@"Cannot open database" dataUsingEncoding:4]);
    ((void (**)(void, void *, const __CFString *))v5)[2](v5, v7, @"download-state-report.json");
  }
}

uint64_t __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end