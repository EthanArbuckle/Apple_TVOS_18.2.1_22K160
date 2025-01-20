@interface PBSceneDeactivationManager
- (BSEventQueue)eventQueue;
- (BSMutableIntegerMap)layoutLevelAssertions;
- (PBSceneDeactivationManager)init;
- (id)acquireQueueLockWithReason:(id)a3;
- (void)_acquireDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)_addAndAcquireDeactivationAssertionsWithReasons:(unint64_t)a3 atLevel:(int64_t)a4;
- (void)_relinquishDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)_removeAndRelinquishDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)acquireDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)addAndAcquireDeactivationAssertionsWithContext:(id)a3;
- (void)addAndAcquireDeactivationAssertionsWithReasons:(unint64_t)a3 atLevel:(int64_t)a4;
- (void)relinquishDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)removeAndRelinquishDeactivationAssertionsAtLevel:(int64_t)a3;
- (void)setLayoutLevelAssertions:(id)a3;
@end

@implementation PBSceneDeactivationManager

- (PBSceneDeactivationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBSceneDeactivationManager;
  v2 = -[PBSceneDeactivationManager init](&v8, "init");
  if (v2)
  {
    v3 = -[BSEventQueue initWithName:onQueue:]( objc_alloc(&OBJC_CLASS___BSEventQueue),  "initWithName:onQueue:",  @"PBSceneDeactivationManagerEventQueue",  &_dispatch_main_q);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    layoutLevelAssertions = v2->_layoutLevelAssertions;
    v2->_layoutLevelAssertions = v5;
  }

  return v2;
}

- (void)acquireDeactivationAssertionsAtLevel:(int64_t)a3
{
  uint64_t v5 = sub_1001A3184(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Acquire-%@", v6));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100103144;
  v9[3] = &unk_1003D1D98;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEventQueueEvent eventWithName:handler:]( &OBJC_CLASS___BSEventQueueEvent,  "eventWithName:handler:",  v7,  v9));
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v8, 1LL);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)relinquishDeactivationAssertionsAtLevel:(int64_t)a3
{
  uint64_t v5 = sub_1001A3184(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Relinquish-%@", v6));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001032B0;
  v9[3] = &unk_1003D1D98;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEventQueueEvent eventWithName:handler:]( &OBJC_CLASS___BSEventQueueEvent,  "eventWithName:handler:",  v7,  v9));
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v8, 1LL);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (void)addAndAcquireDeactivationAssertionsWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneDeactivationReasons];
  id v6 = [v4 layoutLevel];

  -[PBSceneDeactivationManager addAndAcquireDeactivationAssertionsWithReasons:atLevel:]( self,  "addAndAcquireDeactivationAssertionsWithReasons:atLevel:",  v5,  v6);
}

- (void)addAndAcquireDeactivationAssertionsWithReasons:(unint64_t)a3 atLevel:(int64_t)a4
{
  uint64_t v7 = sub_1001A3184(a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"AddAcquire-%@", v8));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100103474;
  v11[3] = &unk_1003D7728;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v12[2] = (id)a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[BSEventQueueEvent eventWithName:handler:]( &OBJC_CLASS___BSEventQueueEvent,  "eventWithName:handler:",  v9,  v11));
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v10, 1LL);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)removeAndRelinquishDeactivationAssertionsAtLevel:(int64_t)a3
{
  uint64_t v5 = sub_1001A3184(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RemoveRelinquish-%@",  v6));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001035E0;
  v9[3] = &unk_1003D1D98;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEventQueueEvent eventWithName:handler:]( &OBJC_CLASS___BSEventQueueEvent,  "eventWithName:handler:",  v7,  v9));
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_eventQueue, "executeOrInsertEvent:atPosition:", v8, 1LL);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

- (id)acquireQueueLockWithReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[BSEventQueue acquireLockForReason:]( self->_eventQueue,  "acquireLockForReason:",  a3));
}

- (void)_acquireDeactivationAssertionsAtLevel:(int64_t)a3
{
  else {
    double v3 = dbl_1002EC700[a3 + 1];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelAssertions, "objectForKey:"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&__int128 v6 = 138543362LL;
    __int128 v15 = v6;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v9);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100103854;
        v16[3] = &unk_1003D7748;
        *(double *)&v16[4] = v3;
        objc_msgSend(v10, "acquireWithPredicate:transitionContext:", v16, 0, v15);
        id v11 = sub_100083C30();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = UIApplicationSceneDeactivationReasonDescription([v10 reason]);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          *(_DWORD *)buf = v15;
          v22 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Acquired scene assertion for reason: %{public}@",  buf,  0xCu);
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v7);
  }
}

- (void)_relinquishDeactivationAssertionsAtLevel:(int64_t)a3
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelAssertions, "objectForKey:", a3));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&__int128 v5 = 138543362LL;
    __int128 v14 = v5;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        objc_msgSend(v9, "relinquish", v14);
        id v10 = sub_100083C30();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = UIApplicationSceneDeactivationReasonDescription([v9 reason]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          *(_DWORD *)buf = v14;
          __int128 v20 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Relinquished scene assertion for reason: %{public}@",  buf,  0xCu);
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v6);
  }
}

- (void)_addAndAcquireDeactivationAssertionsWithReasons:(unint64_t)a3 atLevel:(int64_t)a4
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_100103AFC;
  uint64_t v13 = &unk_1003D7770;
  __int128 v14 = self;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = v7;
  uint64_t v8 = &v10;
  if (a3)
  {
    for (uint64_t i = 0LL; i != 19; ++i)
    {
    }
  }

  -[BSMutableIntegerMap setObject:forKey:](self->_layoutLevelAssertions, "setObject:forKey:", v7, a4, v10, v11);
  -[PBSceneDeactivationManager _acquireDeactivationAssertionsAtLevel:]( self,  "_acquireDeactivationAssertionsAtLevel:",  a4);
}

- (void)_removeAndRelinquishDeactivationAssertionsAtLevel:(int64_t)a3
{
}

- (BSEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (BSMutableIntegerMap)layoutLevelAssertions
{
  return self->_layoutLevelAssertions;
}

- (void)setLayoutLevelAssertions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end