@interface MTFeedUpdateProcessor
- (BOOL)_isLPMEnabled;
- (BOOL)start;
- (double)_feedUpdateInterval;
- (double)updatePredicateDuration;
- (id)entityName;
- (id)predicate;
- (void)_fetchBatchFetchEnabled;
- (void)_lpmDidChange;
- (void)_reCheck;
- (void)checkAutoDownloadsForUuids:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)startIfNeeded;
- (void)stop;
@end

@implementation MTFeedUpdateProcessor

- (void)startIfNeeded
{
  if (!-[MTBaseProcessor isRunning](self, "isRunning")) {
    -[MTFeedUpdateProcessor start](self, "start");
  }
}

- (BOOL)start
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTFeedUpdateProcessor;
  BOOL v3 = -[MTBaseProcessor start](&v7, "start");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:self selector:"_lpmDidChange" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"_fetchBatchFetchEnabled" name:AMSBagChangedNotification object:0];

    self->_isBatchFetchEnabledBagValue = 0;
    -[MTFeedUpdateProcessor _fetchBatchFetchEnabled](self, "_fetchBatchFetchEnabled");
  }

  return v3;
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTFeedUpdateProcessor;
  -[MTBaseProcessor stop](&v4, "stop");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (double)updatePredicateDuration
{
  return result;
}

- (id)predicate
{
  if (os_feature_enabled_batch_feed_fetch(self, a2) && self->_isBatchFetchEnabledBagValue)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](&OBJC_CLASS___MTPodcast, "predicateForNotHiddenPodcasts"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForPeriodicallyUpdatablePodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForPeriodicallyUpdatablePodcasts"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 AND:v4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForAreMediaAPI:](&OBJC_CLASS___MTPodcast, "predicateForAreMediaAPI:", 0LL));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v5 AND:v6]);
  }

  else
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](&OBJC_CLASS___MTPodcast, "predicateForNotHiddenPodcasts"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForPeriodicallyUpdatablePodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForPeriodicallyUpdatablePodcasts"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v3 AND:v4]);
  }

  return v7;
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
}

- (void)checkAutoDownloadsForUuids:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = -[MTFeedUpdateProcessor _isLPMEnabled](self, "_isLPMEnabled");
    if (v5)
    {
      uint64_t v6 = _MTLogCategoryFeedUpdate(v5);
      objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v15 = [v4 count];
        v8 = "Skipping feed update for %lu podcasts because of Low Power Mode";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }

    else
    {
      id v9 = -[MTFeedUpdateProcessor updatePredicateDuration](self, "updatePredicateDuration");
      if (v10 != 0.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000C7C84;
        v12[3] = &unk_10023FF98;
        v13 = (os_log_s *)v4;
        -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
        objc_super v7 = v13;
        goto LABEL_10;
      }

      uint64_t v11 = _MTLogCategoryFeedUpdate(v9);
      objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v15 = [v4 count];
        v8 = "Skipping feed update for %lu podcasts because the feed update interval is 0.";
        goto LABEL_8;
      }
    }

- (double)_feedUpdateInterval
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 syncValueForKey:kBagKeyFeedUpdateProcessorInterval]);
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_isLPMEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)_reCheck
{
  BOOL v3 = -[MTFeedUpdateProcessor _isLPMEnabled](self, "_isLPMEnabled");
  if (v3)
  {
    uint64_t v4 = _MTLogCategoryFeedUpdate(v3);
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Skipping _reCheck because of Low Power Mode",  buf,  2u);
    }
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000C7EA8;
    v6[3] = &unk_10023FF98;
    v6[4] = self;
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v6);
  }

- (void)_lpmDidChange
{
  uint64_t v3 = _MTLogCategoryFeedUpdate(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Low Power Mode did change. Checking for feed updates",  v5,  2u);
  }

  -[MTFeedUpdateProcessor _reCheck](self, "_reCheck");
}

- (void)_fetchBatchFetchEnabled
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](&OBJC_CLASS___IMURLBag, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 batchFeedFetchIsEnabled]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C80B4;
  v6[3] = &unk_100243D90;
  objc_copyWeak(&v7, &location);
  [v4 asyncValueOnQueue:v5 withCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

@end