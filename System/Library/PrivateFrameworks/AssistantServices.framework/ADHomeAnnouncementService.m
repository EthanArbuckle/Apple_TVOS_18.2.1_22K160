@interface ADHomeAnnouncementService
+ (id)sharedService;
- (ADHomeAnnouncementService)initWithInstanceContext:(id)a3;
- (BOOL)_shouldStopPlaybackWhenRequestBegins;
- (void)_stopPlayback;
- (void)_stopPlaybackIfNeeded;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)stopPlayback;
@end

@implementation ADHomeAnnouncementService

- (void)stopPlayback
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FB058;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADHomeAnnouncementService)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ADHomeAnnouncementService;
  v5 = -[ADHomeAnnouncementService init](&v23, "init");
  if (v5)
  {
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistant.home-announcement-service", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    if (v4) {
      v10 = (AFInstanceContext *)v4;
    }
    else {
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue( +[AFInstanceContext defaultContext]( &OBJC_CLASS___AFInstanceContext,  "defaultContext"));
    }
    p_instanceContext = (id *)&v5->_instanceContext;
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;

    if (-[AFInstanceContext isEndpoint](v5->_instanceContext, "isEndpoint"))
    {
      id v13 = off_100576520();
      v14 = (void *)objc_claimAutoreleasedReturnValue([*p_instanceContext endpointUUID]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 getNotificationNameForEndpointID:v14]);

      if (v15)
      {
LABEL_7:
        v16 = -[AFNotifyObserver initWithName:options:queue:delegate:]( objc_alloc(&OBJC_CLASS___AFNotifyObserver),  "initWithName:options:queue:delegate:",  v15,  1LL,  v5->_queue,  0LL);
        notifyObserver = v5->_notifyObserver;
        v5->_notifyObserver = v16;

LABEL_11:
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
        [v20 addListener:v5];

        goto LABEL_12;
      }
    }

    else
    {
      id v18 = off_100576528();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (v15) {
        goto LABEL_7;
      }
    }

    v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v22 = *p_instanceContext;
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADHomeAnnouncementService initWithInstanceContext:]";
      __int16 v26 = 2112;
      id v27 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Unable to get the notification name for Announce state. (instanceContext = %@)",  buf,  0x16u);
    }

    goto LABEL_11;
  }

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FAEAC;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopPlaybackIfNeeded
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADHomeAnnouncementService _stopPlaybackIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Checking Announce state...", buf, 0xCu);
  }

  notifyObserver = self->_notifyObserver;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002FADDC;
  v5[3] = &unk_1004FBBD0;
  v5[4] = self;
  -[AFNotifyObserver getStateWithCompletion:](notifyObserver, "getStateWithCompletion:", v5);
}

- (void)_stopPlayback
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADHomeAnnouncementService _stopPlayback]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Asking Announce to stop playing...",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_1002FABFC;
  v14 = sub_1002FAC0C;
  id v15 = 0LL;
  if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
  {
    id v4 = objc_alloc((Class)off_100576530());
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext endpointUUID](self->_instanceContext, "endpointUUID"));
    id v6 = [v4 initWithEndpointIdentifier:v5];
    v7 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v6;
  }

  else
  {
    id v8 = objc_alloc_init((Class)off_100576530());
    v5 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v8;
  }

  v9 = *(void **)(*((void *)&buf + 1) + 40LL);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002FAC60;
  v10[3] = &unk_1004FB590;
  v10[4] = &buf;
  [v9 stopPlayingAnnouncementsWithCompletionHandler:v10];
  _Block_object_dispose(&buf, 8);
}

- (BOOL)_shouldStopPlaybackWhenRequestBegins
{
  id v2 = off_100576538();
  return _[v2 shouldStopPlaybackOnSiriActivation];
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (qword_100578550 != -1) {
    dispatch_once(&qword_100578550, &stru_1004FB568);
  }
  return (id)qword_100578558;
}

@end