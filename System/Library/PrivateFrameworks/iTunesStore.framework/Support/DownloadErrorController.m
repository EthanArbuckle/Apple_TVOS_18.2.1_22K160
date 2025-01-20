@interface DownloadErrorController
+ (id)sharedErrorController;
- (DownloadErrorController)init;
- (void)_cancelErrorsPassingTest:(id)a3;
- (void)_displayScheduledErrors;
- (void)_networkTypeChangedNotification:(id)a3;
- (void)_scheduleErrorDisplay:(id)a3;
- (void)cancelDialogsWithDownloadIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)showDownloadError:(id)a3;
@end

@implementation DownloadErrorController

- (DownloadErrorController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DownloadErrorController;
  v2 = -[DownloadErrorController init](&v5, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunesstored.DownloadErrorController",  0LL);
    v2->_errors = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_scheduledErrors = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v2,  "_networkTypeChangedNotification:",  ISNetworkTypeChangedNotification,  0LL);
  }

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  ISNetworkTypeChangedNotification,  0LL);
  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  scheduledErrorTimer = self->_scheduledErrorTimer;
  if (scheduledErrorTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledErrorTimer);
    dispatch_release((dispatch_object_t)self->_scheduledErrorTimer);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DownloadErrorController;
  -[DownloadErrorController dealloc](&v5, "dealloc");
}

+ (id)sharedErrorController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DB44C;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3390 != -1) {
    dispatch_once(&qword_1003A3390, block);
  }
  return (id)qword_1003A3388;
}

- (void)cancelDialogsWithDownloadIdentifier:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000DB4C8;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)showDownloadError:(id)a3
{
  id v4 = [a3 copy];
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000DB59C;
  v6[3] = &unk_10034AE70;
  v6[4] = v4;
  v6[5] = self;
  dispatch_async(dispatchQueue, v6);
}

- (void)_networkTypeChangedNotification:(id)a3
{
  if ((uint64_t)-[ISNetworkObserver networkType]( +[ISNetworkObserver sharedInstance](&OBJC_CLASS___ISNetworkObserver, "sharedInstance", a3),  "networkType") >= 1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000DB794;
    block[3] = &unk_10034AE98;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)_cancelErrorsPassingTest:(id)a3
{
  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = (uint64_t)-[NSMutableArray count](self->_errors, "count");
  if (v5 >= 1)
  {
    unint64_t v6 = v5 + 1;
    do
    {
      id v7 = -[NSMutableArray objectAtIndex:](self->_errors, "objectAtIndex:", v6 - 2);
      if ((*((unsigned int (**)(id, id))a3 + 2))(a3, v7))
      {
        id v8 = [v7 _notification];
        if (v8) {
          -[NSMutableArray addObject:](v9, "addObject:", v8);
        }
        -[NSMutableOrderedSet removeObject:](self->_scheduledErrors, "removeObject:", v7);
        -[NSMutableArray removeObjectAtIndex:](self->_errors, "removeObjectAtIndex:", v6 - 2);
      }

      --v6;
    }

    while (v6 > 1);
  }

  objc_msgSend( +[UserNotificationCenter defaultCenter](UserNotificationCenter, "defaultCenter"),  "cancelUserNotifications:",  v9);
}

- (void)_displayScheduledErrors
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  obj = self->_scheduledErrors;
  id v3 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v8 = [v7 copyUserNotification];
        id v9 = +[UserNotificationCenter defaultCenter](&OBJC_CLASS___UserNotificationCenter, "defaultCenter");
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000DBA38;
        v12[3] = &unk_10034E000;
        v12[4] = v7;
        v12[5] = self;
        objc_msgSend(v7, "_setNotification:", objc_msgSend(v9, "showUserNotification:withCompletionBlock:", v8, v12));
      }

      id v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v4);
  }

  if (-[NSMutableOrderedSet count](self->_scheduledErrors, "count")) {
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "releaseKeepAliveAssertion:",  @"com.apple.itunesstored.DownloadErrorController");
  }
  -[NSMutableOrderedSet removeAllObjects](self->_scheduledErrors, "removeAllObjects");
  scheduledErrorTimer = self->_scheduledErrorTimer;
  if (scheduledErrorTimer)
  {
    dispatch_source_cancel((dispatch_source_t)scheduledErrorTimer);
    dispatch_release((dispatch_object_t)self->_scheduledErrorTimer);
    self->_scheduledErrorTimer = 0LL;
  }

- (void)_scheduleErrorDisplay:(id)a3
{
  if (!-[NSMutableOrderedSet count](self->_scheduledErrors, "count")) {
    objc_msgSend( +[Daemon daemon](Daemon, "daemon"),  "takeKeepAliveAssertion:",  @"com.apple.itunesstored.DownloadErrorController");
  }
  -[NSMutableOrderedSet addObject:](self->_scheduledErrors, "addObject:", a3);
  if (!self->_scheduledErrorTimer)
  {
    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
    self->_scheduledErrorTimer = v5;
    dispatch_time_t v6 = dispatch_time(0LL, 2000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0LL, 0LL);
    scheduledErrorTimer = self->_scheduledErrorTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000DBB9C;
    handler[3] = &unk_10034AE98;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)scheduledErrorTimer, handler);
    dispatch_resume((dispatch_object_t)self->_scheduledErrorTimer);
  }

@end