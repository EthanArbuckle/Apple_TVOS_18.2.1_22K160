@interface NIServerFindingServicePool
+ (id)sharedInstance;
- (NIServerFindingServicePool)init;
- (id).cxx_construct;
- (id)printableState;
- (id)serviceForToken:(id)a3 createIfNotExists:(BOOL)a4;
- (void)logSessionEvent:(id)a3;
- (void)logSessionSummary:(id)a3;
- (void)setService:(id)a3 forToken:(id)a4;
@end

@implementation NIServerFindingServicePool

- (NIServerFindingServicePool)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NIServerFindingServicePool;
  v2 = -[NIServerFindingServicePool init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    sub_10019D1B8((void *)v2 + 2, 0x32uLL);
    sub_10019D1B8((void *)v2 + 8, 6uLL);
    *((_DWORD *)v2 + 60) = 0;
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
      || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
          unsigned int v6 = [v5 BOOLForKey:@"EnableStateDump"],
          v5,
          v6))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1001BCFA8;
      v8[3] = &unk_1007B1E00;
      v9 = v2;
      os_state_add_handler(&_dispatch_main_q, v8);
    }
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1007F9A18 != -1) {
    dispatch_once(&qword_1007F9A18, &stru_1007B5198);
  }
  return (id)qword_1007F9A10;
}

- (void)setService:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    std::mutex::lock((std::mutex *)((char *)self + 112));
    if (!v6)
    {
      v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#find-ses,FindingServicePool remove service for token: %{public}@",  (uint8_t *)&v13,  0xCu);
      }

      [*((id *)self + 1) removeObjectForKey:v7];
      goto LABEL_13;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) objectForKeyedSubscript:v7]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) objectForKeyedSubscript:v7]);
      unsigned __int8 v10 = [v9 isEqual:v6];

      if ((v10 & 1) != 0)
      {
LABEL_13:
        std::mutex::unlock((std::mutex *)((char *)self + 112));
        goto LABEL_14;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003989B8();
      }
    }

    else
    {
      v12 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-ses,FindingServicePool replace nil service for token: %{public}@. Race condition (OK)",  (uint8_t *)&v13,  0xCu);
      }
    }

    [*((id *)self + 1) setObject:v6 forKey:v7];
    goto LABEL_13;
  }

- (id)serviceForToken:(id)a3 createIfNotExists:(BOOL)a4
{
  id v6 = a3;
  id v7 = (std::mutex *)((char *)self + 112);
  std::mutex::lock((std::mutex *)((char *)self + 112));
  if (a4)
  {
    v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-ses,FindingServicePool provide service for token: %{public}@",  buf,  0xCu);
    }

    v9 = (id *)((char *)self + 8);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) objectForKeyedSubscript:v6]);
    BOOL v11 = v10 == 0LL;

    if (v11)
    {
      uint64_t v12 = *((unsigned int *)self + 60);
      *((_DWORD *)self + 60) = v12 + 1;
      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.nearbyd.finding.service-%d",  v12));
      id v14 = -[NIServerFindingService initWithLabel:]( objc_alloc(&OBJC_CLASS___NIServerFindingService),  "initWithLabel:",  v13);
      [*v9 setObject:v14 forKeyedSubscript:v6];
    }
  }

  else
  {
    v9 = (id *)((char *)self + 8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([*v9 objectForKeyedSubscript:v6]);
  std::mutex::unlock(v7);

  return v15;
}

- (void)logSessionEvent:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_100277C30(v4, (void *)self + 2);
  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (void)logSessionSummary:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_100277C30(v4, (void *)self + 8);
  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (id)printableState
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  std::mutex::lock((std::mutex *)((char *)self + 112));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Active sessions (%d)",  [*((id *)self + 1) count]));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue([*((id *)self + 1) allKeys]);
  id v6 = sub_10027801C(v5, 10, 1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v7);

  std::mutex::unlock((std::mutex *)((char *)self + 112));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingServiceObserverRelay sharedInstance]( &OBJC_CLASS___NIServerFindingServiceObserverRelay,  "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 observerTokens]);

  v37 = v9;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Observers (%d)",  [v9 count]));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  id v11 = sub_10027801C(v9, 10, 1);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v12);

  std::mutex::lock((std::mutex *)((char *)self + 176));
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Session summaries (max %d)",  *((void *)self + 13)));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  uint64_t v14 = *((void *)self + 9);
  if (*((void *)self + 10) != v14)
  {
    unint64_t v15 = *((void *)self + 12);
    unint64_t v16 = *(void *)(v14 + 8 * (v15 / 0xAA)) + 24 * (v15 % 0xAA);
    unint64_t v17 = *(void *)(v14 + 8 * ((*((void *)self + 13) + v15) / 0xAA)) + 24 * ((*((void *)self + 13) + v15) % 0xAA);
    if (v16 != v17)
    {
      char v18 = 0;
      v19 = (void *)(v14 + 8 * (v15 / 0xAA));
      do
      {
        if (*(char *)(v16 + 23) < 0)
        {
          sub_1000063A8(__p, *(void **)v16, *(void *)(v16 + 8));
        }

        else
        {
          __int128 v20 = *(_OWORD *)v16;
          uint64_t v39 = *(void *)(v16 + 16);
          *(_OWORD *)__p = v20;
        }

        v21 = (void *)HIBYTE(v39);
        char v22 = HIBYTE(v39);
        if (v39 < 0) {
          v21 = __p[1];
        }
        if (v21)
        {
          -[NSMutableArray addObject:](v3, "addObject:", @"-----");
          if (v39 >= 0) {
            v23 = __p;
          }
          else {
            v23 = (void **)__p[0];
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", v23));
          -[NSMutableArray addObject:](v3, "addObject:", v24);

          char v18 = 1;
          char v22 = HIBYTE(v39);
        }

        if (v22 < 0) {
          operator delete(__p[0]);
        }
        v16 += 24LL;
        if (v16 - *v19 == 4080)
        {
          unint64_t v25 = v19[1];
          ++v19;
          unint64_t v16 = v25;
        }
      }

      while (v16 != v17);
      if ((v18 & 1) != 0) {
        -[NSMutableArray addObject:](v3, "addObject:", @"-----");
      }
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Session events (max %d)",  *((void *)self + 7)));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  uint64_t v27 = *((void *)self + 3);
  if (*((void *)self + 4) != v27)
  {
    unint64_t v28 = *((void *)self + 6);
    unint64_t v29 = *(void *)(v27 + 8 * (v28 / 0xAA)) + 24 * (v28 % 0xAA);
    unint64_t v30 = *(void *)(v27 + 8 * ((*((void *)self + 7) + v28) / 0xAA)) + 24 * ((*((void *)self + 7) + v28) % 0xAA);
    if (v29 != v30)
    {
      v31 = (void *)(v27 + 8 * (v28 / 0xAA));
      do
      {
        if (*(char *)(v29 + 23) < 0)
        {
          sub_1000063A8(__p, *(void **)v29, *(void *)(v29 + 8));
        }

        else
        {
          __int128 v32 = *(_OWORD *)v29;
          uint64_t v39 = *(void *)(v29 + 16);
          *(_OWORD *)__p = v32;
        }

        if (SHIBYTE(v39) < 0)
        {
          if (!__p[1]) {
            goto LABEL_33;
          }
          v33 = (void **)__p[0];
        }

        else
        {
          if (!HIBYTE(v39)) {
            goto LABEL_34;
          }
          v33 = __p;
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"    %s", v33));
        -[NSMutableArray addObject:](v3, "addObject:", v34);

        if (SHIBYTE(v39) < 0) {
LABEL_33:
        }
          operator delete(__p[0]);
LABEL_34:
        v29 += 24LL;
        if (v29 - *v31 == 4080)
        {
          unint64_t v35 = v31[1];
          ++v31;
          unint64_t v29 = v35;
        }
      }

      while (v29 != v30);
    }
  }

  std::mutex::unlock((std::mutex *)((char *)self + 176));

  return v3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 14) = 850045863LL;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0LL;
  *((void *)self + 22) = 850045863LL;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((void *)self + 29) = 0LL;
  return self;
}

@end