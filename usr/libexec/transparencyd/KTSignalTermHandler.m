@interface KTSignalTermHandler
+ (BOOL)terminated;
+ (void)reset;
+ (void)setTryExit:(id)a3;
+ (void)setup;
+ (void)signalEventHander;
- (KTSignalTermHandler)initWithSIGTERMNotification:(id)a3;
- (id)complete;
- (void)dealloc;
- (void)setComplete:(id)a3;
- (void)unregister;
@end

@implementation KTSignalTermHandler

+ (void)reset
{
  source = (dispatch_source_s *)(id)qword_1002EEA80;
  v2 = (void *)qword_1002EEA80;
  qword_1002EEA80 = 0LL;

  v3 = (void *)qword_1002EEA88;
  qword_1002EEA88 = (uint64_t)&stru_1002851B0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
  v4 = source;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = source;
  }
}

+ (void)setTryExit:(id)a3
{
  if (a3) {
    v3 = (Block_layout *)objc_retainBlock(a3);
  }
  else {
    v3 = &stru_1002851B0;
  }
  v4 = (void *)qword_1002EEA88;
  qword_1002EEA88 = (uint64_t)v3;
}

+ (void)signalEventHander
{
  id v2 = (id)qword_1002EEA90;
  v3 = (void *)qword_1002EEA90;
  qword_1002EEA90 = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9[2]();

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

+ (BOOL)terminated
{
  BOOL v2 = qword_1002EEA90 == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
  return v2;
}

+ (void)setup
{
  if (!qword_1002EEA80)
  {
    signal(15, (void (__cdecl *)(int))1);
    if (!qword_1002EEA88)
    {
      qword_1002EEA88 = (uint64_t)&stru_1002851B0;
    }

    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    id v4 = (void *)qword_1002EEA90;
    qword_1002EEA90 = v3;

    dispatch_queue_t v5 = dispatch_queue_create("KTSignalTermHandler", 0LL);
    id v6 = (void *)qword_1002EEA98;
    qword_1002EEA98 = (uint64_t)v5;

    dispatch_source_t v7 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)qword_1002EEA98);
    v8 = (void *)qword_1002EEA80;
    qword_1002EEA80 = (uint64_t)v7;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001652D8;
    handler[3] = &unk_1002851D0;
    handler[4] = a1;
    dispatch_source_set_event_handler((dispatch_source_t)qword_1002EEA80, handler);
    dispatch_activate((dispatch_object_t)qword_1002EEA80);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
}

- (KTSignalTermHandler)initWithSIGTERMNotification:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KTSignalTermHandler;
  dispatch_queue_t v5 = -[KTSignalTermHandler init](&v13, "init");
  dispatch_source_t v7 = v5;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(v5, v6), "setup");
    -[KTSignalTermHandler setComplete:](v7, "setComplete:", v4);
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EEA78);
    if (qword_1002EEA90)
    {
      [(id)qword_1002EEA90 addObject:v7];
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEA78);
      v8 = (dispatch_queue_s *)qword_1002EEA98;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100165450;
      block[3] = &unk_10027A7D0;
      id v12 = v4;
      dispatch_async(v8, block);
    }

    v9 = v7;
  }

  return v7;
}

- (void)unregister
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KTSignalTermHandler;
  -[KTSignalTermHandler dealloc](&v3, "dealloc");
}

- (id)complete
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setComplete:(id)a3
{
}

- (void).cxx_destruct
{
}

@end