@interface BKFirstBootDetector
+ (id)sharedInstance;
- (BKAlternateSystemAppManager)alternateSystemAppManager;
- (BKFirstBootDetector)initWithSystemAppSentinel:(id)a3 firstBootToken:(id)a4 alternateSystemAppManager:(id)a5;
- (BKSystemShellSentinel)systemAppSentinel;
- (BOOL)isFirstBoot;
- (NSString)description;
- (void)_queue_finishBootingIfNecessaryAndTellObservers:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAlternateSystemAppManager:(id)a3;
- (void)setSystemAppSentinel:(id)a3;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)systemShellWillBootstrap;
@end

@implementation BKFirstBootDetector

- (BKFirstBootDetector)initWithSystemAppSentinel:(id)a3 firstBootToken:(id)a4 alternateSystemAppManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___BKFirstBootDetector;
  v12 = -[BKFirstBootDetector init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v13->_lock_firstBootToken, a4);
    objc_storeStrong((id *)&v13->_alternateSystemAppManager, a5);
    v14 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  517LL,  2LL);
    queue_observers = v13->_queue_observers;
    v13->_queue_observers = v14;

    v17 = (objc_class *)objc_opt_class(v13, v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS(v19, 33LL);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)SerialWithQoS;

    unsigned __int8 v22 = [v10 isTokenSet];
    v13->_lock_isFirstBoot = v22;
    v23 = (dispatch_queue_s *)v13->_queue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10002FC50;
    v25[3] = &unk_1000B7D18;
    unsigned __int8 v27 = v22;
    v26 = v13;
    dispatch_sync(v23, v25);
  }

  return v13;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendBool:self->_lock_isFirstBoot withName:@"isFirstBoot"];
  id v5 = [v3 appendObject:self->_lock_firstBootToken withName:@"firstBootToken"];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v6;
}

- (BOOL)isFirstBoot
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isFirstBoot;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002FC44;
  v7[3] = &unk_1000B8030;
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
  v7[2] = sub_10002FC38;
  v7[3] = &unk_1000B8030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FC2C;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemShellWillBootstrap
{
  id v3 = sub_10003F0B0();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First boot: systemShellWillBootstrap", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[BKFirstBootTokenProviding unsetToken](self->_lock_firstBootToken, "unsetToken");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_queue_finishBootingIfNecessaryAndTellObservers:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssert(self->_queue, a2);
  if (-[BKFirstBootDetector isFirstBoot](self, "isFirstBoot"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel primarySystemShell](self->_systemAppSentinel, "primarySystemShell"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[BKAlternateSystemAppManager alternateSystemAppBundleIdentifier]( self->_alternateSystemAppManager,  "alternateSystemAppBundleIdentifier"));
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
      unsigned __int8 v8 = [v7 isEqualToString:v6];

      if ((v8 & 1) == 0)
      {
        id v9 = sub_10003F0B0();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "First boot is finished", buf, 2u);
        }

        os_unfair_lock_lock(&self->_lock);
        -[BKFirstBootTokenProviding unsetToken](self->_lock_firstBootToken, "unsetToken");
        self->_lock_isFirstBoot = 0;
        os_unfair_lock_unlock(&self->_lock);
        if (v3)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_queue_observers, "allObjects"));
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v17;
            do
            {
              v15 = 0LL;
              do
              {
                if (*(void *)v17 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) firstBootDetectorDidFinishFirstBoot:self];
                v15 = (char *)v15 + 1;
              }

              while (v13 != v15);
              id v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
            }

            while (v13);
          }
        }
      }
    }
  }

- (BKSystemShellSentinel)systemAppSentinel
{
  return self->_systemAppSentinel;
}

- (void)setSystemAppSentinel:(id)a3
{
}

- (BKAlternateSystemAppManager)alternateSystemAppManager
{
  return self->_alternateSystemAppManager;
}

- (void)setAlternateSystemAppManager:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC010 != -1) {
    dispatch_once(&qword_1000DC010, &stru_1000B6580);
  }
  return (id)qword_1000DC008;
}

@end