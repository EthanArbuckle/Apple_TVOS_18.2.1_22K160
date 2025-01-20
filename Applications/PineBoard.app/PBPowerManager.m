@interface PBPowerManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (PBPowerManager)init;
- (id)_locked_extractObserverList;
- (id)_stringFromReason:(unint64_t)a3;
- (id)_stringFromSleepReason:(int64_t)a3;
- (id)_stringFromWakeReason:(int64_t)a3;
- (int64_t)powerState;
- (void)__dumpObservers;
- (void)_automaticSleepDevice:(id)a3;
- (void)_locked_changeStateWithReason:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4;
- (void)finishInitialization;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4;
- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)sleepSystemWithReason:(int64_t)a3;
- (void)sleepSystemWithReason:(int64_t)a3 completion:(id)a4;
- (void)wakeSystemWithReason:(int64_t)a3;
- (void)wakeSystemWithReason:(int64_t)a3 completion:(id)a4;
@end

@implementation PBPowerManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000070EC;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (id)sharedInstance
{
  if (qword_10046FED8 != -1) {
    dispatch_once(&qword_10046FED8, &stru_1003CFFB8);
  }
  return (id)qword_10046FED0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if (NSClassFromString(@"PBPowerManager") == a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PBPowerManager;
    return objc_msgSendSuper2(&v7, "allocWithZone:", a3);
  }

  else
  {
    [a1 doesNotRecognizeSelector:a2];
    return 0LL;
  }

- (PBPowerManager)init
{
  return 0LL;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000838E8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class(v4);
    int v15 = 136315394;
    v16 = "-[PBPowerManager addObserver:]";
    __int16 v17 = 2082;
    Name = class_getName(v7);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %{public}s", (uint8_t *)&v15, 0x16u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v9 = (char *)-[NSMutableArray count](self->_observerWrappers, "count");
  if (v9)
  {
    v10 = v9 - 1;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_observerWrappers, "objectAtIndex:", v10));
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 observer]);
      if ((id)v12 == v4) {
        break;
      }
      v13 = (void *)v12;
      if (!v12) {
        -[NSMutableArray removeObjectAtIndex:](self->_observerWrappers, "removeObjectAtIndex:", v10);
      }
    }
  }

  else
  {
LABEL_9:
    observerWrappers = self->_observerWrappers;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[__PBPowerManagerObserverWrapper wrapperWithObserver:]( &OBJC_CLASS_____PBPowerManagerObserverWrapper,  "wrapperWithObserver:",  v4));
    -[NSMutableArray addObject:](observerWrappers, "addObject:", v11);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000838E8();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class(v4);
    int v14 = 136315394;
    int v15 = "-[PBPowerManager removeObserver:]";
    __int16 v16 = 2082;
    Name = class_getName(v7);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %{public}s", (uint8_t *)&v14, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v8 = (char *)-[NSMutableArray count](self->_observerWrappers, "count");
  if (v8)
  {
    v9 = v8 - 1;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_observerWrappers, "objectAtIndex:", v9));
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 observer]);
      uint64_t v12 = (void *)v11;
      if ((id)v11 == v4 || v11 == 0) {
        -[NSMutableArray removeObjectAtIndex:](self->_observerWrappers, "removeObjectAtIndex:", v9);
      }

      --v9;
    }

    while (v9 != (char *)-1LL);
  }

  -[NSMutableArray removeObjectIdenticalTo:](self->_liveObservers, "removeObjectIdenticalTo:", v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)__dumpObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = sub_1000838E8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (char *)-[NSMutableArray count](self->_observerWrappers, "count");
    id v7 = -[NSMutableArray count](self->_liveObservers, "count");
    *(_DWORD *)buf = 136315394;
    v21 = "-[PBPowerManager __dumpObservers]";
    __int16 v22 = 2048;
    v23 = &v6[(void)v7];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%ld)", buf, 0x16u);
  }

  v8 = (char *)-[NSMutableArray count](self->_observerWrappers, "count");
  if (v8)
  {
    v10 = v8 - 1;
    *(void *)&__int128 v9 = 134217984LL;
    __int128 v18 = v9;
    do
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_observerWrappers, "objectAtIndex:", v10, v18));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (const char *)v11[1];
        *(_DWORD *)buf = v18;
        v21 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    wrapped observer: %p",  buf,  0xCu);
      }

      --v10;
    }

    while (v10 != (char *)-1LL);
  }

  v13 = (char *)-[NSMutableArray count](self->_liveObservers, "count");
  if (v13)
  {
    int v15 = v13 - 1;
    *(void *)&__int128 v14 = 134217984LL;
    __int128 v19 = v14;
    do
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_liveObservers, "objectAtIndex:", v15, v19));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = (const char *)v16[1];
        *(_DWORD *)buf = v19;
        v21 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    live observer: %p",  buf,  0xCu);
      }

      --v15;
    }

    while (v15 != (char *)-1LL);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)sleepSystemWithReason:(int64_t)a3
{
}

- (void)sleepSystemWithReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000838E8();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
    *(_DWORD *)buf = 136315650;
    v31 = "-[PBPowerManager sleepSystemWithReason:completion:]";
    __int16 v32 = 2114;
    v33 = v9;
    __int16 v34 = 2048;
    int64_t v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: '%{public}@' (%ld)", buf, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100007C0C;
  v28[3] = &unk_1003D0048;
  id v11 = v6;
  id v29 = v11;
  uint64_t v12 = objc_retainBlock(v28);
  v13 = (void (**)(void, void, void))v12;
  switch(self->_powerState)
  {
    case 1LL:
      sleepCompletionBlocks = self->_sleepCompletionBlocks;
      int v15 = objc_retainBlock(v12);
      -[NSMutableArray addObject:](sleepCompletionBlocks, "addObject:", v15);

      -[PBPowerManager _locked_changeStateWithReason:](self, "_locked_changeStateWithReason:", a3);
      break;
    case 2LL:
      id v16 = sub_1000838E8();
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v18 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Skipping sleep request for '%{public}@' because system is already going down to sleep.",  buf,  0xCu);
      }

      __int128 v19 = self->_sleepCompletionBlocks;
      id v20 = objc_retainBlock(v13);
      -[NSMutableArray addObject:](v19, "addObject:", v20);

      break;
    case 3LL:
      id v21 = sub_1000838E8();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skipping sleep request for '%{public}@' because system is already asleep.",  buf,  0xCu);
      }

      v13[2](v13, 1LL, 0LL);
      break;
    case 4LL:
      id v24 = sub_1000838E8();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Skipping sleep request for '%{public}@' because system is waking and ignoring inputs.",  buf,  0xCu);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.pineboard.powermanager.errors",  9001LL,  0LL));
      ((void (**)(void, void, void *))v13)[2](v13, 0LL, v27);

      break;
    default:
      break;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)wakeSystemWithReason:(int64_t)a3
{
}

- (void)wakeSystemWithReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000838E8();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
    *(_DWORD *)buf = 136315650;
    v31 = "-[PBPowerManager wakeSystemWithReason:completion:]";
    __int16 v32 = 2114;
    v33 = v9;
    __int16 v34 = 2048;
    int64_t v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: '%{public}@' (%ld)", buf, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100008064;
  v28[3] = &unk_1003D0048;
  id v11 = v6;
  id v29 = v11;
  uint64_t v12 = objc_retainBlock(v28);
  v13 = (void (**)(void, void, void))v12;
  switch(self->_powerState)
  {
    case 1LL:
      id v14 = sub_1000838E8();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Skipping wake request for '%{public}@' because system is already awake.",  buf,  0xCu);
      }

      v13[2](v13, 1LL, 0LL);
      break;
    case 2LL:
      id v17 = sub_1000838E8();
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v19 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Skipping wake request for '%{public}@' because system is going down to sleep and ignoring inputs.",  buf,  0xCu);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.pineboard.powermanager.errors",  8001LL,  0LL));
      ((void (**)(void, void, void *))v13)[2](v13, 0LL, v20);

      break;
    case 3LL:
      wakeCompletionBlocks = self->_wakeCompletionBlocks;
      __int16 v22 = objc_retainBlock(v12);
      -[NSMutableArray addObject:](wakeCompletionBlocks, "addObject:", v22);

      -[PBPowerManager _locked_changeStateWithReason:](self, "_locked_changeStateWithReason:", a3);
      break;
    case 4LL:
      id v23 = sub_1000838E8();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a3));
        *(_DWORD *)buf = 138543362;
        v31 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Skipping wake request for '%{public}@' because system is already waking.",  buf,  0xCu);
      }

      v26 = self->_wakeCompletionBlocks;
      id v27 = objc_retainBlock(v13);
      -[NSMutableArray addObject:](v26, "addObject:", v27);

      break;
    default:
      break;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000838E8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[PBPowerManager appTransitioner:willBeginAppTransition:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  int64_t powerState = self->_powerState;
  if ((powerState & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
    unsigned int v10 = [v9 isForeground];

    if (v10)
    {
      if (powerState == 3) {
        id v11 = @"System is asleep - foreground app launch forbidden";
      }
      else {
        id v11 = @"System is asleeping - foreground app launch forbidden";
      }
      [v5 failWithReason:v11];
    }
  }
}

- (id)_locked_extractObserverList
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (char *)-[NSMutableArray count](self->_observerWrappers, "count");
  if (v4)
  {
    id v5 = v4 - 1;
    do
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_observerWrappers, "objectAtIndex:", v5));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 observer]);
      if (v7) {
        -[NSMutableArray addObject:](v3, "addObject:", v7);
      }
      else {
        -[NSMutableArray removeObjectAtIndex:](self->_observerWrappers, "removeObjectAtIndex:", v5);
      }

      --v5;
    }

    while (v5 != (char *)-1LL);
  }

  return v3;
}

- (id)_stringFromSleepReason:(int64_t)a3
{
  else {
    return off_1003D0130[a3 - 1];
  }
}

- (id)_stringFromWakeReason:(int64_t)a3
{
  else {
    return off_1003D0170[a3 - 129];
  }
}

- (id)_stringFromReason:(unint64_t)a3
{
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromWakeReason:](self, "_stringFromWakeReason:"));
  }
  return v3;
}

- (void)_automaticSleepDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000838E8();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[PBPowerManager _automaticSleepDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  switch(self->_powerState)
  {
    case 1LL:
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100008548;
      v33[3] = &unk_1003D0070;
      v33[4] = self;
      id v34 = v4;
      dispatch_async(&_dispatch_main_q, v33);

      break;
    case 2LL:
      id v8 = sub_1000838E8();
      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10026EAF8(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      goto LABEL_11;
    case 3LL:
      id v17 = sub_1000838E8();
      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10026EB58(v9, v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_11;
    case 4LL:
      id v25 = sub_1000838E8();
      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10026EB28(v9, v26, v27, v28, v29, v30, v31, v32);
      }
LABEL_11:

      (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0LL, 1LL);
      break;
    default:
      break;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_locked_changeStateWithReason:(unint64_t)a3
{
  int64_t powerState = self->_powerState;
  int64_t v5 = 4LL;
  if (powerState == 1) {
    int64_t v5 = 2LL;
  }
  self->_int64_t powerState = v5;
  if (powerState == 1) {
    id v6 = &selRef_powerManager_willSleepSystemWithReason_completion_;
  }
  else {
    id v6 = &selRef_powerManager_willWakeSystemWithReason_completion_;
  }
  id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[PBPowerManager _locked_extractObserverList]( self,  "_locked_extractObserverList",  powerState));
  liveObservers = self->_liveObservers;
  self->_liveObservers = v7;

  unint64_t v9 = a3;
  self->_reason = a3;
  uint64_t v10 = dispatch_group_create();
  uint64_t v11 = *v6;
  if ((objc_opt_respondsToSelector(self->_implementor, *v6) & 1) != 0)
  {
    dispatch_group_enter(v10);
    implementor = self->_implementor;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100008B00;
    v33[3] = &unk_1003CFF08;
    id v34 = v10;
    objc_msgSend(implementor, v11, self, a3, v33);
  }

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v13 = self;
  uint64_t v14 = self->_liveObservers;
  id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v19, v11) & 1) != 0)
        {
          dispatch_group_enter(v10);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100008B18;
          block[3] = &unk_1003D00C0;
          block[4] = v19;
          block[5] = v13;
          uint64_t v27 = v11;
          unint64_t v28 = v9;
          uint64_t v26 = v10;
          dispatch_async(&_dispatch_main_q, block);
        }
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v35,  16LL);
    }

    while (v16);
  }

  uint64_t v20 = dispatch_queue_create("com.apple.PineBoard.PBPowerManager.stateChangeCompletion", 0LL);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100008D28;
  v23[3] = &unk_1003D00E8;
  v23[4] = v13;
  v23[5] = v11;
  v23[6] = v9;
  BOOL v24 = v22 == 1;
  dispatch_group_notify(v10, v20, v23);
}

- (void)finishInitialization
{
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = sub_100083960();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a4));
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Device Sleeping",  "Start sleeping with reason: %@",  buf,  0xCu);
  }

  id v11 = sub_1000838E8();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setSystemSleepStarting", buf, 2u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBHIDInterface sharedInstance](&OBJC_CLASS___PBHIDInterface, "sharedInstance"));
  [v13 setMode:0];

  BKSDisplayServicesSetScreenBlanked(1LL, v14);
  id v15 = sub_1000838E8();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Clearing boot count prior to sleep.", buf, 2u);
  }

  sub_1001C9628();
  +[PBDataReportingService reportNow](&OBJC_CLASS___PBDataReportingService, "reportNow");
  unint64_t reason = self->_reason;
  uint64_t v18 = 5LL;
  if (reason == 5) {
    uint64_t v18 = 6LL;
  }
  if (reason == 1) {
    uint64_t v19 = 4LL;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100009608;
  v22[3] = &unk_1003D0048;
  id v23 = v7;
  id v21 = v7;
  [v20 sendAction:v19 withCompletion:v22];
}

- (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4
{
  id v6 = sub_1000838E8();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setSystemSleepActive", (uint8_t *)&v18, 2u);
  }

  id v8 = sub_100083960();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a4));
    int v18 = 138412290;
    uint64_t v19 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Device Sleeping",  "Finish sleeping with reason: %@",  (uint8_t *)&v18,  0xCu);
  }

  notify_post("com.apple.TVSPowerManager.deviceWillChangeSleepStateNotification");
  unint64_t v11 = self->_reason & 0xFFFFFFFFFFFFFFFBLL;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v13 = (CFNotificationName *)&PBSPowerManagerDeviceWillSleepIdleDistributedNotification;
  if (v11 != 1) {
    uint64_t v13 = (CFNotificationName *)&PBSPowerManagerDeviceWillSleepManualDistributedNotification;
  }
  CFNotificationCenterPostNotification(DarwinNotifyCenter, *v13, 0LL, 0LL, 1u);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[ATVHIDSystemClient sharedInstance](&OBJC_CLASS___ATVHIDSystemClient, "sharedInstance"));
  objc_msgSend(v14, "setSILState_Off");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBHIDInterface sharedInstance](&OBJC_CLASS___PBHIDInterface, "sharedInstance"));
  [v15 setMode:2];

  sub_100009E00();
  if (dword_10046FEE0)
  {
    if (IOPMAssertionRelease(dword_10046FEE0))
    {
      id v16 = sub_1000838E8();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10026EC48();
      }
    }

    dword_10046FEE0 = 0;
  }

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = sub_100083960();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a4));
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Device Waking",  "Start waking with reason: %@",  buf,  0xCu);
  }

  id v11 = sub_1000838E8();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setSystemSleepStopping", buf, 2u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBHIDInterface sharedInstance](&OBJC_CLASS___PBHIDInterface, "sharedInstance"));
  [v13 setMode:0];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[ATVHIDSystemClient sharedInstance](&OBJC_CLASS___ATVHIDSystemClient, "sharedInstance"));
  objc_msgSend(v14, "setSILState_On");

  BKSDisplayServicesSetScreenBlanked(0LL, v15);
  sub_100009200();
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  [v16 wakeDisplayWithReply:0];

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100009B38;
  v19[3] = &unk_1003D0048;
  id v20 = v7;
  id v18 = v7;
  [v17 sendAction:7 withCompletion:v19];
}

- (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
  id v6 = sub_100083960();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPowerManager _stringFromReason:](self, "_stringFromReason:", a4));
    int v12 = 138412290;
    uint64_t v13 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Device Waking",  "Finish waking with reason: %@",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = sub_1000838E8();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setSystemSleepDone", (uint8_t *)&v12, 2u);
  }

  notify_post("com.apple.TVSPowerManager.deviceWillChangeSleepStateNotification");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBHIDInterface sharedInstance](&OBJC_CLASS___PBHIDInterface, "sharedInstance"));
  [v11 setMode:1];
}

- (void).cxx_destruct
{
}

@end