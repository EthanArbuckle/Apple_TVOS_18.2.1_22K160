@interface VOTLockStateManager
+ (id)sharedInstance;
- (BOOL)isLocked;
- (VOTLockStateManager)init;
- (void)_notifyObserversLockStateDidChange;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation VOTLockStateManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011690;
  block[3] = &unk_100176EE0;
  block[4] = a1;
  if (qword_1001ACC10 != -1) {
    dispatch_once(&qword_1001ACC10, block);
  }
  return (id)qword_1001ACC18;
}

- (VOTLockStateManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VOTLockStateManager;
  v2 = -[VOTLockStateManager init](&v9, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    lockStateObservers = v2->_lockStateObservers;
    v2->_lockStateObservers = (NSHashTable *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lockStateObserversLock = v2->_lockStateObserversLock;
    v2->_lockStateObserversLock = v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100011754,  @"com.apple.mobile.keybagd.lock_status",  0LL,  CFNotificationSuspensionBehaviorDrop);
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VOTLockStateManager;
  -[VOTLockStateManager dealloc](&v4, "dealloc");
}

- (BOOL)isLocked
{
  return MKBGetDeviceLockState(0LL, a2) == 1;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    lockStateObserversLock = self->_lockStateObserversLock;
    id v5 = a3;
    -[NSLock lock](lockStateObserversLock, "lock");
    -[NSHashTable addObject:](self->_lockStateObservers, "addObject:", v5);

    -[NSLock unlock](self->_lockStateObserversLock, "unlock");
  }

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    lockStateObserversLock = self->_lockStateObserversLock;
    id v5 = a3;
    -[NSLock lock](lockStateObserversLock, "lock");
    -[NSHashTable removeObject:](self->_lockStateObservers, "removeObject:", v5);

    -[NSLock unlock](self->_lockStateObserversLock, "unlock");
  }

- (void)_notifyObserversLockStateDidChange
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_lockStateObservers, "allObjects"));
  -[NSLock unlock](self->_lockStateObserversLock, "unlock");
  BOOL v4 = -[VOTLockStateManager isLocked](self, "isLocked");
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "lockStateDidChange:", v4, (void)v10);
        objc_super v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end