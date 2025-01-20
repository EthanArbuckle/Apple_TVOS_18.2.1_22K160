@interface MTVisitedEpisodeManager
- (BOOL)hasEndedVisitingEpisode:(id)a3;
- (MTVisitedEpisodeManager)init;
- (NSMutableSet)endedEpisodeUuids;
- (NSMutableSet)startedEpisodeUuids;
- (unint64_t)countOfEndedEpisodes;
- (unint64_t)countOfStartedEpisodes;
- (void)endVisitingEpisode:(id)a3;
- (void)flushVisitedEpisodes;
- (void)setEndedEpisodeUuids:(id)a3;
- (void)setStartedEpisodeUuids:(id)a3;
- (void)startVisitingEpisode:(id)a3;
@end

@implementation MTVisitedEpisodeManager

- (MTVisitedEpisodeManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTVisitedEpisodeManager;
  v2 = -[MTVisitedEpisodeManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[MTVisitedEpisodeManager setStartedEpisodeUuids:](v2, "setStartedEpisodeUuids:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    -[MTVisitedEpisodeManager setEndedEpisodeUuids:](v2, "setEndedEpisodeUuids:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"flushVisitedEpisodes" name:MTApplicationWillResignActiveNotification object:0];
  }

  return v2;
}

- (void)endVisitingEpisode:(id)a3
{
  id v6 = a3;
  if ([v6 isNew])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    [v4 addObject:v5];
  }
}

- (void)startVisitingEpisode:(id)a3
{
  id v7 = a3;
  if ([v7 isNew])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    [v4 addObject:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](&OBJC_CLASS___MTApplication, "appController"));
    [v6 updateUnplayedBadgeCount];
  }
}

- (BOOL)hasEndedVisitingEpisode:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (unint64_t)countOfStartedEpisodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)countOfEndedEpisodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)flushVisitedEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
  id v4 = [v3 count];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
    id v6 = [v5 copy];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 privateQueueContext]);

    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    v15 = sub_100125B0C;
    v16 = &unk_100240240;
    id v17 = v6;
    id v18 = v8;
    id v9 = v8;
    id v10 = v6;
    [v9 performBlock:&v13];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids", v13, v14, v15, v16));
    [v11 removeAllObjects];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
    [v12 removeAllObjects];
  }

- (NSMutableSet)startedEpisodeUuids
{
  return self->_startedEpisodeUuids;
}

- (void)setStartedEpisodeUuids:(id)a3
{
}

- (NSMutableSet)endedEpisodeUuids
{
  return self->_endedEpisodeUuids;
}

- (void)setEndedEpisodeUuids:(id)a3
{
}

- (void).cxx_destruct
{
}

@end