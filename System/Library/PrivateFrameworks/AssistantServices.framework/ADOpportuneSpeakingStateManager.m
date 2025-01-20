@interface ADOpportuneSpeakingStateManager
- (ADOpportuneSpeakingStateManager)initWithQueue:(id)a3;
- (void)_listeningEdgeDetectorIDsChanged;
- (void)beginListeningForEdgeDetectorWithID:(id)a3;
- (void)endListeningForEdgeDetectorWithID:(id)a3;
@end

@implementation ADOpportuneSpeakingStateManager

- (ADOpportuneSpeakingStateManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADOpportuneSpeakingStateManager;
  v6 = -[ADOpportuneSpeakingStateManager init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    listeningEdgeDetectorIDs = v7->_listeningEdgeDetectorIDs;
    v7->_listeningEdgeDetectorIDs = v8;

    v10 = objc_alloc(&OBJC_CLASS___AFNotifyStatePublisher);
    v11 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  "com.apple.siri.opportune-speaking-module-state-changed");
    v12 = -[AFNotifyStatePublisher initWithName:queue:](v10, "initWithName:queue:", v11, v7->_queue);
    statePublisher = v7->_statePublisher;
    v7->_statePublisher = v12;
  }

  return v7;
}

- (void)beginListeningForEdgeDetectorWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[ADOpportuneSpeakingStateManager beginListeningForEdgeDetectorWithID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s edgeDetectorID = %@", buf, 0x16u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FD1BC;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)endListeningForEdgeDetectorWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[ADOpportuneSpeakingStateManager endListeningForEdgeDetectorWithID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s edgeDetectorID = %@", buf, 0x16u);
    }

    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001FD190;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_listeningEdgeDetectorIDsChanged
{
  BOOL v3 = -[NSMutableSet count](self->_listeningEdgeDetectorIDs, "count") != 0LL;
  statePublisher = self->_statePublisher;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001FD0BC;
  v5[3] = &unk_1004F6378;
  BOOL v6 = v3;
  -[AFNotifyStatePublisher publishStateWithBlock:](statePublisher, "publishStateWithBlock:", v5);
}

- (void).cxx_destruct
{
}

@end