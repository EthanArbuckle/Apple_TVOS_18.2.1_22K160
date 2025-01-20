@interface PBHintManager
+ (id)sharedInstance;
- (BSSettings)hintStatus;
- (PBHintManager)init;
- (void)noteHintShown:(unint64_t)a3;
- (void)registerHintRecorder:(id)a3 forHint:(unint64_t)a4;
@end

@implementation PBHintManager

+ (id)sharedInstance
{
  if (qword_100470230 != -1) {
    dispatch_once(&qword_100470230, &stru_1003D27C0);
  }
  return (id)qword_100470228;
}

- (PBHintManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBHintManager;
  v2 = -[PBHintManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    hintRecorders = v2->_hintRecorders;
    v2->_hintRecorders = v3;

    v5 = (BSSettings *)objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
    hintStatus = v2->_hintStatus;
    v2->_hintStatus = v5;

    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBHintManager");
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)Serial;
  }

  return v2;
}

- (void)noteHintShown:(unint64_t)a3
{
  id v5 = sub_100082FC4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100275970(a3, v6);
  }

  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000668B4;
  block[3] = &unk_1003D27E8;
  block[5] = &v12;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v13 + 24))
  {
    id v8 = sub_100082FC4();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100275930(v9);
    }

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v10 postNotificationName:PBSHintStatusDidChangeNotification object:0];
  }

  _Block_object_dispose(&v12, 8);
}

- (BSSettings)hintStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100066A40;
  objc_super v10 = sub_100066A50;
  id v11 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100066A68;
  v5[3] = &unk_1003D0210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BSSettings *)v3;
}

- (void)registerHintRecorder:(id)a3 forHint:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_accessQueue);
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066B24;
  block[3] = &unk_1003D1718;
  id v10 = v6;
  id v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_sync(accessQueue, block);
}

- (void).cxx_destruct
{
}

@end