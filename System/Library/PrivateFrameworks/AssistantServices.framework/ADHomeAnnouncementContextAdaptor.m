@interface ADHomeAnnouncementContextAdaptor
- (ADHomeAnnouncementContextAdaptor)initWithInstanceContext:(id)a3;
- (void)_invalidate;
- (void)_processAndEvaluateSnapshot:(id)a3;
- (void)_setSnapshot:(id)a3;
- (void)getSnapshotWithCompletion:(id)a3;
- (void)homeAnnouncementObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5;
- (void)invalidate;
- (void)registerSnapshotUpdater:(id)a3;
- (void)unregisterSnapshotUpdater;
@end

@implementation ADHomeAnnouncementContextAdaptor

- (ADHomeAnnouncementContextAdaptor)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ADHomeAnnouncementContextAdaptor;
  v5 = -[ADHomeAnnouncementContextAdaptor init](&v21, "init");
  if (v5)
  {
    if (v4) {
      v6 = (AFInstanceContext *)v4;
    }
    else {
      v6 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;

    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v20 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v23 = "-[ADHomeAnnouncementContextAdaptor initWithInstanceContext:]";
      __int16 v24 = 2048;
      v25 = v5;
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }

    v5->_expirationDuration = 60.0;
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistant.home-announcement-adaptor", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v15;

    v17 = -[AFHomeAnnouncementObserver initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___AFHomeAnnouncementObserver),  "initWithInstanceContext:",  v5->_instanceContext);
    observer = v5->_observer;
    v5->_observer = v17;
  }

  return v5;
}

- (void)registerSnapshotUpdater:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_attr_t v11 = "-[ADHomeAnnouncementContextAdaptor registerSnapshotUpdater:]";
    __int16 v12 = 2048;
    dispatch_queue_t v13 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002A3E90;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)unregisterSnapshotUpdater
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[ADHomeAnnouncementContextAdaptor unregisterSnapshotUpdater]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }

  dispatch_group_enter((dispatch_group_t)self->_group);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A3E40;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    group = self->_group;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002A3D44;
    v8[3] = &unk_1004FD990;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify((dispatch_group_t)group, queue, v8);
  }
}

- (void)invalidate
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002A3D3C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)homeAnnouncementObserver:(id)a3 snapshotDidUpdateFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002A3D30;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)_invalidate
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[ADHomeAnnouncementContextAdaptor _invalidate]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)&v7, 0x16u);
  }

  -[AFHomeAnnouncementObserver removeListener:](self->_observer, "removeListener:", self);
  observer = self->_observer;
  self->_observer = 0LL;

  id snapshotUpdater = self->_snapshotUpdater;
  self->_id snapshotUpdater = 0LL;

  snapshot = self->_snapshot;
  self->_snapshot = 0LL;
}

- (void)_processAndEvaluateSnapshot:(id)a3
{
  id v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ADHomeAnnouncementContextAdaptor _processAndEvaluateSnapshot:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v45 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s %p snapshot = %@", buf, 0x20u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPlayedAnnouncement]);
  double expirationDuration = self->_expirationDuration;
  id v8 = v6;
  __int16 v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "ADHomeAnnouncementGetIsValid";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    v45 = *(uint64_t (**)(uint64_t, uint64_t))&expirationDuration;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s announcement = %@, double expirationDuration = %f",  buf,  0x20u);
  }

  if (!v8)
  {
    v19 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "ADHomeAnnouncementGetIsValid";
      v20 = "%s announcement is nil";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }

- (void)_setSnapshot:(id)a3
{
  id v4 = (AFHomeAnnouncementSnapshot *)a3;
  snapshot = self->_snapshot;
  if (snapshot != v4 && (-[AFHomeAnnouncementSnapshot isEqual:](snapshot, "isEqual:", v4) & 1) == 0)
  {
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = self->_snapshot;
      int v11 = 136315906;
      __int16 v12 = "-[ADHomeAnnouncementContextAdaptor _setSnapshot:]";
      __int16 v13 = 2048;
      double v14 = self;
      __int16 v15 = 2112;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %p %@ -> %@", (uint8_t *)&v11, 0x2Au);
    }

    id v8 = (AFHomeAnnouncementSnapshot *)-[AFHomeAnnouncementSnapshot copy](v4, "copy");
    __int16 v9 = self->_snapshot;
    self->_snapshot = v8;

    id snapshotUpdater = (void (**)(id, AFHomeAnnouncementSnapshot *))self->_snapshotUpdater;
    if (snapshotUpdater) {
      snapshotUpdater[2](snapshotUpdater, self->_snapshot);
    }
  }
}

- (void).cxx_destruct
{
}

@end