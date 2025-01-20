@interface ADAVSystemControllerLifecycleManager
+ (id)sharedManager;
- (ADAVSystemControllerLifecycleManager)init;
- (void)_flushPendingCompletions;
- (void)_setAVSystemController:(id)a3;
- (void)addObserver:(id)a3;
- (void)avSystemControllerDied:(id)a3;
- (void)fetchAVSystemControllerInBackground;
- (void)getAVSystemControllerWithTimeout:(double)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation ADAVSystemControllerLifecycleManager

- (ADAVSystemControllerLifecycleManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADAVSystemControllerLifecycleManager;
  v2 = -[ADAVSystemControllerLifecycleManager init](&v20, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.avsystemcontroller.lifecycle-manager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.assistant.avsystemcontroller.access", v12);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingCompletions = v2->_pendingCompletions;
    v2->_pendingCompletions = v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v17;

    -[ADAVSystemControllerLifecycleManager fetchAVSystemControllerInBackground]( v2,  "fetchAVSystemControllerInBackground");
  }

  return v2;
}

- (void)getAVSystemControllerWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___AFOneArgumentSafetyBlock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100141130;
    v14[3] = &unk_1004F2C80;
    id v15 = v6;
    id v8 = [v7 initWithBlock:v14 defaultValue:0];
    queue = (dispatch_queue_s *)self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10014113C;
    v11[3] = &unk_1004FDA80;
    v11[4] = self;
    id v12 = v8;
    double v13 = a3;
    id v10 = v8;
    dispatch_async(queue, v11);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100141124;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100141118;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchAVSystemControllerInBackground
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141060;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)avSystemControllerDied:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_queue_attr_t v9 = "-[ADAVSystemControllerLifecycleManager avSystemControllerDied:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s notification = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100141054;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
  -[ADAVSystemControllerLifecycleManager fetchAVSystemControllerInBackground]( self,  "fetchAVSystemControllerInBackground");
}

- (void)_setAVSystemController:(id)a3
{
  dispatch_queue_attr_t v5 = (AVSystemController *)a3;
  avSystemController = self->_avSystemController;
  if (avSystemController != v5)
  {
    if (avSystemController)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v7 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];
    }

    objc_storeStrong((id *)&self->_avSystemController, a3);
    if (self->_avSystemController)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v8 addObserver:self selector:"avSystemControllerDied:" name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];
    }

    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    dispatch_queue_attr_t v9 = self->_observers;
    id v10 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)i),  "adAVSystemControllerDidChange:",  self,  (void)v14);
        }

        id v11 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v11);
    }
  }
}

- (void)_flushPendingCompletions
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  dispatch_queue_attr_t v3 = self->_pendingCompletions;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(*((void *)&v8 + 1) + 8 * (void)v7),  "invokeWithValue:",  self->_avSystemController,  (void)v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_pendingCompletions, "removeAllObjects");
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_100577F20 != -1) {
    dispatch_once(&qword_100577F20, &stru_1004F2C58);
  }
  return (id)qword_100577F28;
}

@end