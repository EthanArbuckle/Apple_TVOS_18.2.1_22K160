@interface MTProcessorManager
- (MTProcessorManager)init;
- (void)_playbackStateChanged:(id)a3;
- (void)_startProcessor:(unint64_t)a3;
- (void)dealloc;
- (void)startAllProcessors;
- (void)startProcessors:(unint64_t)a3;
- (void)startProcessorsForCarPlay;
- (void)startProcessorsForFeedUpdates;
- (void)startProcessorsForPlayback;
@end

@implementation MTProcessorManager

- (MTProcessorManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTProcessorManager;
  v2 = -[MTProcessorManager init](&v10, "init");
  if (v2)
  {
    v11[0] = &off_1002547A0;
    v12[0] = objc_opt_class(&OBJC_CLASS___MTEpisodeDeletionProcessor);
    v11[1] = &off_1002547B8;
    v12[1] = objc_opt_class(&OBJC_CLASS___MTPlaylistIncludeAllProcessor);
    v11[2] = &off_1002547D0;
    v12[2] = objc_opt_class(&OBJC_CLASS___MTPlaylistQueryManager);
    v11[3] = &off_1002547E8;
    v12[3] = objc_opt_class(&OBJC_CLASS___MTUPPSyncProcessor);
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
    v4 = (NSMutableDictionary *)[v3 mutableCopy];
    classMap = v2->_classMap;
    v2->_classMap = v4;

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTSyncController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSMutableDictionary setObject:forKey:](v2->_classMap, "setObject:forKey:", v7, &off_100254800);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"_playbackStateChanged:" name:IMAVPlayerNotification_StateDidChange object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:IMAVPlayerNotification_StateDidChange object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTProcessorManager;
  -[MTProcessorManager dealloc](&v4, "dealloc");
}

- (void)_playbackStateChanged:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  unsigned int v5 = [v4 isPlayingLocally];

  if (v5) {
    -[MTProcessorManager startProcessorsForPlayback](self, "startProcessorsForPlayback");
  }
}

- (void)_startProcessor:(unint64_t)a3
{
  classMap = self->_classMap;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  unsigned int v5 = (objc_class *)-[NSMutableDictionary objectForKeyedSubscript:](classMap, "objectForKeyedSubscript:", v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class sharedInstance](v5, "sharedInstance"));
  id v7 = [v6 isRunning];
  if ((v7 & 1) != 0)
  {
    uint64_t v8 = _MTLogCategoryDefault(v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = NSStringFromClass(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v15 = 138412290;
      v16 = v11;
      v12 = "%@ is already running";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0xCu);
    }
  }

  else
  {
    uint64_t v13 = _MTLogCategoryDefault([v6 start]);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromClass(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v15 = 138412290;
      v16 = v11;
      v12 = "%@ has been started";
      goto LABEL_6;
    }
  }
}

- (void)startProcessors:(unint64_t)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_classMap, "allKeys", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = (unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) unsignedIntegerValue];
        if ((v10 & a3) != 0) {
          -[MTProcessorManager _startProcessor:](self, "_startProcessor:", v10);
        }
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)startAllProcessors
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006368C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B69B0 != -1) {
    dispatch_once(&qword_1002B69B0, block);
  }
}

- (void)startProcessorsForFeedUpdates
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006376C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B69B8 != -1) {
    dispatch_once(&qword_1002B69B8, block);
  }
}

- (void)startProcessorsForPlayback
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006384C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B69C0 != -1) {
    dispatch_once(&qword_1002B69C0, block);
  }
}

- (void)startProcessorsForCarPlay
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006392C;
  block[3] = &unk_10023FF98;
  block[4] = self;
  if (qword_1002B69C8 != -1) {
    dispatch_once(&qword_1002B69C8, block);
  }
}

- (void).cxx_destruct
{
}

@end