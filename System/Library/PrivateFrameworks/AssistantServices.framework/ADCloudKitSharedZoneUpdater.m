@interface ADCloudKitSharedZoneUpdater
- (ADCloudKitRecordZoneInfo)sharedZone;
- (ADCloudKitSharedZoneUpdater)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5 zoneOwner:(BOOL)a6 delegate:(id)a7;
- (void)_notifyFailure:(id)a3;
- (void)_retryRecordSave;
- (void)_startRetryTimer;
- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4;
- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4;
- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5;
- (void)clearUnsavedRecords;
- (void)dealloc;
- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4;
- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5;
- (void)setSharedZone:(id)a3;
@end

@implementation ADCloudKitSharedZoneUpdater

- (ADCloudKitSharedZoneUpdater)initWithQueue:(id)a3 container:(id)a4 sharedZone:(id)a5 zoneOwner:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADCloudKitSharedZoneUpdater;
  v17 = -[ADCloudKitSharedZoneUpdater init](&v22, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_queue, a3);
    v18->_isOwner = a6;
    objc_storeStrong((id *)&v18->_container, a4);
    objc_storeStrong((id *)&v18->_sharedZone, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unsavedRecords = v18->_unsavedRecords;
    v18->_unsavedRecords = v19;
  }

  return v18;
}

- (void)dealloc
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v4 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[ADCloudKitSharedZoneUpdater dealloc]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Cancelling timer", buf, 0xCu);
      retryTimer = self->_retryTimer;
    }

    dispatch_source_cancel((dispatch_source_t)retryTimer);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADCloudKitSharedZoneUpdater;
  -[ADCloudKitSharedZoneUpdater dealloc](&v5, "dealloc");
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4
{
}

- (void)addKeyToSharedStore:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10020B5E4;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)addDictionaryToSharedStore:(id)a3 completion:(id)a4
{
}

- (void)addDictionaryToSharedStore:(id)a3 recordKeysForDeletion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10020B070;
  v15[3] = &unk_1004FDA30;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValueForKeyFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10020ABC4;
    v12[3] = &unk_1004FBA38;
    v12[4] = self;
    id v14 = v9;
    id v13 = v8;
    int64_t v15 = a4;
    dispatch_async(queue, v12);
  }
}

- (void)clearUnsavedRecords
{
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 completion:(id)a4
{
}

- (void)fetchValuesForKeysFromSharedStore:(id)a3 withQOS:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10020A5E4;
    v11[3] = &unk_1004FBA38;
    id v12 = v8;
    id v13 = self;
    id v14 = v9;
    int64_t v15 = a4;
    dispatch_async(queue, v11);
  }
}

- (void)_startRetryTimer
{
  if (!self->_retryTimer)
  {
    v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    dispatch_time_t v4 = dispatch_time(0LL, 240000000000LL);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10020A5B4;
    handler[3] = &unk_1004FD940;
    handler[4] = self;
    dispatch_source_set_event_handler(v3, handler);
    retryTimer = self->_retryTimer;
    self->_retryTimer = (OS_dispatch_source *)v3;
    v6 = v3;

    dispatch_resume((dispatch_object_t)self->_retryTimer);
  }

- (void)_retryRecordSave
{
  if (-[NSMutableDictionary count](self->_unsavedRecords, "count"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_unsavedRecords, "allValues"));
    container = self->_container;
    BOOL isOwner = self->_isOwner;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10020A2D4;
    v6[3] = &unk_1004F68F0;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    sub_100103390(v3, 0LL, 17LL, container, isOwner, 0LL, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)_notifyFailure:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 adCloudKitSharedZoneUpdater:self didEncounterError:v6];
  }
}

- (ADCloudKitRecordZoneInfo)sharedZone
{
  return self->_sharedZone;
}

- (void)setSharedZone:(id)a3
{
}

- (void).cxx_destruct
{
}

@end