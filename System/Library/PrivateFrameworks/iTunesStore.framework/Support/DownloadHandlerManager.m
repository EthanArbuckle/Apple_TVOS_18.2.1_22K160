@interface DownloadHandlerManager
+ (id)handlerManager;
- (BOOL)canOpenSessionWithProperties:(id)a3;
- (DownloadHandlerManager)init;
- (id)_clientForProperties:(id)a3;
- (id)_clientForSession:(id)a3;
- (id)_disconnectSessionsForHandlerID:(int64_t)a3;
- (id)_popDownloadSessionForSessionID:(int64_t)a3;
- (id)beginBackgroundTaskForSessionWithID:(int64_t)a3 reason:(unsigned int)a4 expirationBlock:(id)a5;
- (id)openSessionWithProperties:(id)a3;
- (id)sessionForSessionID:(int64_t)a3;
- (int64_t)_globalHandlerIDForClientID:(id)a3;
- (void)_clientDisconnectNotification:(id)a3;
- (void)_endDisconnectedSessionsForClientID:(id)a3;
- (void)_endSessionWithID:(int64_t)a3 state:(int64_t)a4;
- (void)_notifyObserversOfHandlersChange;
- (void)_notifyObserversOfSessionChange:(id)a3;
- (void)_notifyObserversOfSessionChanges:(id)a3;
- (void)_sendMessage:(int64_t)a3 forSessionID:(int64_t)a4 replyBlock:(id)a5;
- (void)addDownloadHandler:(id)a3;
- (void)addHandlerObserver:(id)a3;
- (void)beginSessionWithID:(int64_t)a3;
- (void)cancelAuthenticationSessionWithID:(int64_t)a3;
- (void)cancelSessionWithID:(int64_t)a3;
- (void)closeUnstartedSessionWithID:(int64_t)a3;
- (void)continueAuthenticationSessionWithID:(int64_t)a3;
- (void)dealloc;
- (void)disavowDownloadSessionWithID:(int64_t)a3 error:(id)a4;
- (void)disconnectDownloadSessionWithID:(int64_t)a3;
- (void)endBackgroundTaskForSessionWithID:(int64_t)a3 identifier:(id)a4;
- (void)failDownloadSessionWithID:(int64_t)a3 error:(id)a4;
- (void)finishDownloadSessionWithID:(int64_t)a3;
- (void)modifyDownloadHandlerWithID:(int64_t)a3 usingBlock:(id)a4;
- (void)pauseSessionWithID:(int64_t)a3;
- (void)performDefaultForAuthenticationSessionWithID:(int64_t)a3;
- (void)rejectSpaceForAuthenticationSessionWithID:(int64_t)a3;
- (void)releaseDownloadSessionWithID:(int64_t)a3;
- (void)removeHandlerObserver:(id)a3;
- (void)resetDisavowedSessionsForHandlerWithID:(int64_t)a3;
- (void)retrySessionWithID:(int64_t)a3;
- (void)setGlobalDownloadHandlerID:(int64_t)a3 forClientID:(id)a4;
- (void)setSessionProperties:(id)a3 forSessionWithID:(int64_t)a4;
- (void)useCredential:(id)a3 forAuthenticationSessionWithID:(int64_t)a4;
@end

@implementation DownloadHandlerManager

- (DownloadHandlerManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadHandlerManager;
  v2 = -[DownloadHandlerManager init](&v4, "init");
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunesstored.DownloadHandlerManager",  0LL);
    v2->_observersQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.itunesstored.DownloadHandlerManager.observers",  0LL);
    v2->_clientsByHandlerID = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_disconnectedSessionsByClientID = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_globalHandlersByClientID = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v2->_observers = +[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable");
    v2->_sessionsByID = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v2,  "_clientDisconnectNotification:",  @"XPCClientDisconnectNotification",  0LL);
  }

  return v2;
}

- (void)dealloc
{
  dispatchQueue = (dispatch_object_s *)self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  observersQueue = (dispatch_object_s *)self->_observersQueue;
  if (observersQueue) {
    dispatch_release(observersQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DownloadHandlerManager;
  -[DownloadHandlerManager dealloc](&v5, "dealloc");
}

+ (id)handlerManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100137BB8;
  block[3] = &unk_10034AE98;
  block[4] = a1;
  if (qword_1003A3508 != -1) {
    dispatch_once(&qword_1003A3508, block);
  }
  return (id)qword_1003A3500;
}

- (void)addDownloadHandler:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100137C34;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)addHandlerObserver:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100137EF4;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)beginBackgroundTaskForSessionWithID:(int64_t)a3 reason:(unsigned int)a4 expirationBlock:(id)a5
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  v13 = sub_100137FCC;
  v14 = sub_100137FDC;
  uint64_t v15 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100137FE8;
  block[3] = &unk_10034F790;
  block[6] = &v10;
  block[7] = a3;
  unsigned int v9 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)beginSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001380C8;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)cancelAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013853C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)cancelSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001386FC;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (BOOL)canOpenSessionWithProperties:(id)a3
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100138908;
  block[3] = &unk_10034E790;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)closeUnstartedSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013899C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)continueAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100138A44;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)disavowDownloadSessionWithID:(int64_t)a3 error:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100138C08;
  block[3] = &unk_10034DBE8;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)disconnectDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100138E2C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)endBackgroundTaskForSessionWithID:(int64_t)a3 identifier:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100138FF0;
  block[3] = &unk_10034DBE8;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)failDownloadSessionWithID:(int64_t)a3 error:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013910C;
  block[3] = &unk_10034DBE8;
  void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)finishDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013930C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)modifyDownloadHandlerWithID:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000LL;
  v14 = sub_100137FCC;
  uint64_t v15 = sub_100137FDC;
  uint64_t v16 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100139594;
  block[3] = &unk_10034F808;
  void block[5] = &v11;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v12[5]);
  uint64_t v7 = (void *)v12[5];
  if (v7)
  {
    v8 = (dispatch_queue_s *)self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001395F4;
    v9[3] = &unk_10034AE98;
    v9[4] = self;
    dispatch_sync(v8, v9);
    uint64_t v7 = (void *)v12[5];
  }

  _Block_object_dispose(&v11, 8);
}

- (id)openSessionWithProperties:(id)a3
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  char v10 = sub_100137FCC;
  uint64_t v11 = sub_100137FDC;
  uint64_t v12 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001396C4;
  block[3] = &unk_10034E790;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)pauseSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100139810;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)performDefaultForAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001399D4;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)rejectSpaceForAuthenticationSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100139B94;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)releaseDownloadSessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100139D54;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)removeHandlerObserver:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100139F14;
  v4[3] = &unk_10034AE70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)resetDisavowedSessionsForHandlerWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100139F78;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)retrySessionWithID:(int64_t)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013A19C;
  v4[3] = &unk_10034B300;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (id)sessionForSessionID:(int64_t)a3
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  char v10 = sub_100137FCC;
  uint64_t v11 = sub_100137FDC;
  uint64_t v12 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A3DC;
  block[3] = &unk_10034F808;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setGlobalDownloadHandlerID:(int64_t)a3 forClientID:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A498;
  block[3] = &unk_10034DBE8;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  dispatch_async(dispatchQueue, block);
}

- (void)setSessionProperties:(id)a3 forSessionWithID:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A7E8;
  block[3] = &unk_10034DBE8;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)useCredential:(id)a3 forAuthenticationSessionWithID:(int64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A8B0;
  block[3] = &unk_10034DBE8;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_clientDisconnectNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10013AAB0;
  v4[3] = &unk_10034AE70;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(dispatchQueue, v4);
}

- (id)_clientForProperties:(id)a3
{
  id v5 = [a3 clientIdentifier];
  id v6 = [a3 handlerIdentifier];
  if (v6)
  {
    uint64_t v7 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", v6);
    id v8 = -[NSMutableDictionary objectForKey:](self->_clientsByHandlerID, "objectForKey:", v7);
  }

  else if (v5 {
         && (id v9 = -[NSMutableDictionary objectForKey:](self->_globalHandlersByClientID, "objectForKey:", v5)) != 0LL)
  }
  {
    id v8 = -[NSMutableDictionary objectForKey:](self->_clientsByHandlerID, "objectForKey:", v9);
  }

  else
  {
    id v8 = 0LL;
  }

  id v10 = [a3 downloadPhase];
  return v8;
}

- (id)_clientForSession:(id)a3
{
  id v4 = -[NSNumber initWithLongLong:]( [NSNumber alloc],  "initWithLongLong:",  [a3 activeHandlerIdentifier]);
  id v5 = -[NSMutableDictionary objectForKey:](self->_clientsByHandlerID, "objectForKey:", v4);

  return v5;
}

- (id)_disconnectSessionsForHandlerID:(int64_t)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  sessionsByID = self->_sessionsByID;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10013B0B4;
  v9[3] = &unk_10034F830;
  void v9[5] = v5;
  v9[6] = a3;
  v9[4] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessionsByID, "enumerateKeysAndObjectsUsingBlock:", v9);

  self->_sessionsByID = v6;
  return v5;
}

- (void)_endDisconnectedSessionsForClientID:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->_disconnectedSessionsByClientID, "objectForKey:");
  if (v5)
  {
    id v6 = v5;
    if ([v5 count]) {
      -[DownloadHandlerManager _notifyObserversOfSessionChanges:](self, "_notifyObserversOfSessionChanges:", v6);
    }
    -[NSMutableDictionary removeObjectForKey:](self->_disconnectedSessionsByClientID, "removeObjectForKey:", a3);
  }

- (void)_endSessionWithID:(int64_t)a3 state:(int64_t)a4
{
  id v6 = -[DownloadHandlerManager _popDownloadSessionForSessionID:](self, "_popDownloadSessionForSessionID:", a3);
  if (v6)
  {
    id v7 = v6;
    [v6 setSessionState:a4];
    -[DownloadHandlerManager _notifyObserversOfSessionChange:](self, "_notifyObserversOfSessionChange:", v7);
  }

- (int64_t)_globalHandlerIDForClientID:(id)a3
{
  int64_t result = (int64_t)-[NSMutableDictionary objectForKey:](self->_globalHandlersByClientID, "objectForKey:", a3);
  if (result) {
    return (int64_t)[(id)result longLongValue];
  }
  return result;
}

- (void)_notifyObserversOfHandlersChange
{
  id v3 = -[NSHashTable copy](self->_observers, "copy");
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10013B278;
  v5[3] = &unk_10034AE70;
  v5[4] = v3;
  v5[5] = self;
  dispatch_async(observersQueue, v5);
}

- (void)_notifyObserversOfSessionChange:(id)a3
{
  id v4 = -[NSArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:", a3, 0LL);
  -[DownloadHandlerManager _notifyObserversOfSessionChanges:](self, "_notifyObserversOfSessionChanges:", v4);
}

- (void)_notifyObserversOfSessionChanges:(id)a3
{
  id v5 = -[NSHashTable allObjects](self->_observers, "allObjects");
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013B460;
  block[3] = &unk_10034AF00;
  block[4] = v5;
  void block[5] = self;
  block[6] = a3;
  dispatch_async(observersQueue, block);
}

- (id)_popDownloadSessionForSessionID:(int64_t)a3
{
  id v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  id v5 = -[NSMutableDictionary objectForKey:](self->_sessionsByID, "objectForKey:", v4);
  if (v5) {
    -[NSMutableDictionary removeObjectForKey:](self->_sessionsByID, "removeObjectForKey:", v4);
  }

  return v5;
}

- (void)_sendMessage:(int64_t)a3 forSessionID:(int64_t)a4 replyBlock:(id)a5
{
  id v9 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a4);
  id v10 = -[NSMutableDictionary objectForKey:](self->_sessionsByID, "objectForKey:", v9);
  if (v10 && (v11 = v10, (id v12 = -[DownloadHandlerManager _clientForSession:](self, "_clientForSession:", v10)) != 0LL))
  {
    uint64_t v13 = v12;
    id v14 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)[v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v23 = 138412802;
      uint64_t v24 = objc_opt_class(self);
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2112;
      v28 = v13;
      uint64_t v18 = _os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  1LL,  "%@: Send session message: %lld to client: %@",  &v23,  32);
      if (v18)
      {
        v19 = (void *)v18;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
        free(v19);
        SSFileLog(v14, @"%@");
      }
    }

    xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v20, "0", a3);
    xpc_dictionary_set_int64(v20, "1", a4);
    id v21 = [v11 sessionProperties];
    xpc_dictionary_set_int64(v20, "2", (int64_t)[v21 downloadIdentifier]);
    xpc_dictionary_set_int64(v20, "3", (int64_t)[v21 assetIdentifier]);
    SSXPCDictionarySetCFObject(v20, "4", [v21 downloadPhase]);
    SSXPCDictionarySetCFObject(v20, "5", [v21 duetBudget]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10013B8C8;
    v22[3] = &unk_10034BD88;
    v22[4] = a5;
    objc_msgSend(objc_msgSend(v13, "outputConnection"), "sendMessage:withReply:", v20, v22);
    xpc_release(v20);
  }

  else if (a5)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }
}

@end