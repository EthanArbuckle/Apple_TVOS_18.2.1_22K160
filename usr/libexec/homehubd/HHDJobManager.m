@interface HHDJobManager
- (BOOL)_startBubbleJob:(id)a3 error:(id *)a4;
- (BOOL)activateBubble:(id)a3 error:(id *)a4;
- (HHDJobManager)initWithQueue:(id)a3;
- (HHDJobManager)initWithQueue:(id)a3 jobLauncher:(id)a4 serviceLoader:(id)a5;
- (id)_loadJobs:(id)a3;
- (id)resumeBubbles:(id)a3;
- (void)_handleDeactivationCompleteForBubble:(id)a3 successfulShutdowns:(unint64_t)a4 error:(id)a5 callback:(id)a6;
- (void)_shutdownBubbleJob:(id)a3 callback:(id)a4;
- (void)_shutdownOrphanedInstanceServices:(id)a3 services:(id)a4;
- (void)deactivateBubble:(id)a3 callback:(id)a4;
@end

@implementation HHDJobManager

- (HHDJobManager)initWithQueue:(id)a3
{
  return -[HHDJobManager initWithQueue:jobLauncher:serviceLoader:]( self,  "initWithQueue:jobLauncher:serviceLoader:",  a3,  0LL,  0LL);
}

- (HHDJobManager)initWithQueue:(id)a3 jobLauncher:(id)a4 serviceLoader:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___HHDJobManager;
  v12 = -[HHDJobManager init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    p_jobLauncher = (void **)&v13->_jobLauncher;
    objc_storeStrong((id *)&v13->_jobLauncher, a4);
    p_serviceLoader = (void **)&v13->_serviceLoader;
    objc_storeStrong((id *)&v13->_serviceLoader, a5);
    if (!v13->_jobLauncher)
    {
      v16 = -[_HHDJobLauncher initWithQueue:](objc_alloc(&OBJC_CLASS____HHDJobLauncher), "initWithQueue:", v9);
      v17 = *p_jobLauncher;
      *p_jobLauncher = v16;
    }

    if (!*p_serviceLoader)
    {
      v18 = objc_alloc_init(&OBJC_CLASS____HHDServiceListLoader);
      v19 = *p_serviceLoader;
      *p_serviceLoader = v18;
    }
  }

  return v13;
}

- (id)_loadJobs:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceListLoader loadServices](self->_serviceLoader, "loadServices"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[HHDBubbleJob initWithBubbleId:jobName:jobDataRetriever:]( objc_alloc(&OBJC_CLASS___HHDBubbleJob),  "initWithBubbleId:jobName:jobDataRetriever:",  v4,  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  0LL);
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (BOOL)_startBubbleJob:(id)a3 error:(id *)a4
{
  id v6 = a3;
  jobLauncher = self->_jobLauncher;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 launchdJobName]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bubbleId]);
  id v10 = -[HHDJobLauncher createServiceInstanceWithName:instanceId:]( jobLauncher,  "createServiceInstanceWithName:instanceId:",  v8,  v9);

  if ((_DWORD)v10)
  {
    uint64_t v11 = xpc_strerror(v10);
    if (a4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 launchdJobName]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to start job %@ with error %s",  v12,  v11));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:underlyingError:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:underlyingError:description:",  4LL,  0LL,  v13));
    }

    id v14 = sub_1000153D4();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 launchdJobName]);
      *(_DWORD *)buf = 138412802;
      objc_super v21 = &stru_100024E50;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2080;
      uint64_t v25 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@Failed to start job %{public}@ with error %s",  buf,  0x20u);
    }
  }

  else
  {
    id v17 = sub_1000153D4();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 launchdJobName]);
      *(_DWORD *)buf = 138412546;
      objc_super v21 = &stru_100024E50;
      __int16 v22 = 2114;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@Launched job %{public}@.", buf, 0x16u);
    }
  }

  return (_DWORD)v10 == 0;
}

- (void)_shutdownBubbleJob:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  jobLauncher = self->_jobLauncher;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 launchdJobName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bubbleId]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100015D8C;
  v13[3] = &unk_100024D68;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[HHDJobLauncher removeServiceInstanceWithName:instanceId:callback:]( jobLauncher,  "removeServiceInstanceWithName:instanceId:callback:",  v9,  v10,  v13);
}

- (BOOL)activateBubble:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[HHDJobManager _loadJobs:](self, "_loadJobs:", v7));
  [v6 setJobs:v8];

  id v9 = sub_1000153D4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v6 state];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 jobs]);
    id v14 = [v13 count];
    *(_DWORD *)buf = 138413058;
    v38 = &stru_100024E50;
    __int16 v39 = 2048;
    id v40 = v11;
    __int16 v41 = 2114;
    id v42 = v12;
    __int16 v43 = 2048;
    id v44 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@Activating bubble (state=%lu, id=%{public}@) Job count: %lu",  buf,  0x2Au);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 jobs]);
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v16)
  {

    id v18 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
LABEL_13:
    *a4 = v18;
    goto LABEL_14;
  }

  id v17 = v16;
  id v30 = v6;
  id v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = *(void *)v33;
  do
  {
    objc_super v21 = 0LL;
    __int16 v22 = v18;
    do
    {
      if (*(void *)v33 != v20) {
        objc_enumerationMutation(v15);
      }
      uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v21);
      id v31 = v22;
      unsigned int v24 = -[HHDJobManager _startBubbleJob:error:](self, "_startBubbleJob:error:", v23, &v31, v30);
      id v18 = v31;

      v19 += v24;
      objc_super v21 = (char *)v21 + 1;
      __int16 v22 = v18;
    }

    while (v17 != v21);
    id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }

  while (v17);

  if (v19)
  {
    BOOL v25 = 1;
    id v6 = v30;
    goto LABEL_17;
  }

  id v6 = v30;
  if (a4) {
    goto LABEL_13;
  }
LABEL_14:
  id v26 = sub_1000153D4();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    *(_DWORD *)buf = 138412802;
    v38 = &stru_100024E50;
    __int16 v39 = 2114;
    id v40 = v28;
    __int16 v41 = 2112;
    id v42 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%@Failed to activate all jobs for bubble with id %{public}@: %@",  buf,  0x20u);
  }

  BOOL v25 = 0;
LABEL_17:

  return v25;
}

- (void)deactivateBubble:(id)a3 callback:(id)a4
{
  id v23 = a3;
  __int16 v22 = (void (**)(id, void))a4;
  id v6 = sub_1000153D4();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v23 state];
    id v9 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v23 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v23 jobs]);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = &stru_100024E50;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    v38 = v9;
    LOWORD(v39) = 2048;
    *(void *)((char *)&v39 + 2) = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@Deactivating bubble (state=%lu, id=%{public}@) Job count: %lu",  buf,  0x2Au);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v23 jobs]);
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    v22[2](v22, 0LL);
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v38 = sub_100016608;
    *(void *)&__int128 v39 = sub_100016618;
    *((void *)&v39 + 1) = 0LL;
    v35[0] = 0LL;
    v35[1] = v35;
    v35[2] = 0x2020000000LL;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v23 jobs]);
    id v14 = [v13 count];

    v35[3] = v14;
    v34[0] = 0LL;
    v34[1] = v34;
    v34[2] = 0x2020000000LL;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v23 jobs]);
    id v16 = [v15 count];

    v34[3] = v16;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v23 jobs]);
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v31;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v20);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472LL;
          v24[2] = sub_100016620;
          v24[3] = &unk_100024D90;
          v28 = v34;
          v29 = buf;
          v27 = v35;
          v24[4] = self;
          id v25 = v23;
          id v26 = v22;
          -[HHDJobManager _shutdownBubbleJob:callback:](self, "_shutdownBubbleJob:callback:", v21, v24);

          uint64_t v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v18 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v18);
    }

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)_handleDeactivationCompleteForBubble:(id)a3 successfulShutdowns:(unint64_t)a4 error:(id)a5 callback:(id)a6
{
  id v9 = a3;
  id v10 = (os_log_s *)a5;
  id v11 = (void (**)(id, id))a6;
  id v12 = sub_1000153D4();
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (a4)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      int v17 = 138412546;
      id v18 = &stru_100024E50;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%@Deactivation for bubble %{public}@ succeeded (at least one job shutdown)",  (uint8_t *)&v17,  0x16u);
    }

    id v14 = v10;
    id v10 = 0LL;
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    int v17 = 138412802;
    id v18 = &stru_100024E50;
    __int16 v19 = 2114;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@Deactivation for bubble %{public}@ failed for all jobs! Error: %@",  (uint8_t *)&v17,  0x20u);
  }

  v11[2](v11, v10);
}

- (void)_shutdownOrphanedInstanceServices:(id)a3 services:(id)a4
{
  id v18 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v17 = *(void *)v24;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v8);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            id v14 = 0LL;
            do
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = -[HHDBubbleJob initWithBubbleId:jobName:jobDataRetriever:]( objc_alloc(&OBJC_CLASS___HHDBubbleJob),  "initWithBubbleId:jobName:jobDataRetriever:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v14),  v9,  0LL);
              -[HHDJobManager _shutdownBubbleJob:callback:](self, "_shutdownBubbleJob:callback:", v15, 0LL);

              id v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v12);
        }

        id v8 = (char *)v8 + 1;
      }

      while (v8 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v7);
  }
}

- (id)resumeBubbles:(id)a3
{
  id v4 = a3;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v45 = self;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[HHDServiceListLoader loadServices](self->_serviceLoader, "loadServices"));
  v46 = (void *)objc_claimAutoreleasedReturnValue( -[HHDJobLauncher serviceToActiveInstancesForServices:]( self->_jobLauncher,  "serviceToActiveInstancesForServices:"));
  id v5 = sub_1000153D4();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v57 = &stru_100024E50;
    __int16 v58 = 2048;
    id v59 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@Scanning %lu instance ids to see if service instances need reactivation.",  buf,  0x16u);
  }

  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = v4;
  id v42 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v53 != v41) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[HHDJobManager _loadJobs:](v45, "_loadJobs:", v9));
        [v8 setJobs:v10];

        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 jobs]);
        id v12 = [v11 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (!v12)
        {

LABEL_34:
          -[NSMutableArray addObject:](v40, "addObject:", v8);
          continue;
        }

        id v13 = v12;
        __int16 v43 = v8;
        id v44 = i;
        uint64_t v14 = 0LL;
        uint64_t v15 = *(void *)v49;
        do
        {
          for (j = 0LL; j != v13; j = (char *)j + 1)
          {
            if (*(void *)v49 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 launchdJobName]);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:v18]);

            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 bubbleId]);
            id v21 = [v19 indexOfObject:v20];

            if (v19) {
              BOOL v22 = v21 == (id)0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              BOOL v22 = 1;
            }
            if (v22)
            {
              id v47 = 0LL;
              unsigned int v23 = -[HHDJobManager _startBubbleJob:error:](v45, "_startBubbleJob:error:", v17, &v47);
              id v24 = v47;
              id v25 = sub_1000153D4();
              __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              v27 = v26;
              if (v23)
              {
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue([v17 launchdJobName]);
                  v29 = (void *)objc_claimAutoreleasedReturnValue([v17 bubbleId]);
                  *(_DWORD *)buf = 138412802;
                  v57 = &stru_100024E50;
                  __int16 v58 = 2114;
                  id v59 = v28;
                  __int16 v60 = 2114;
                  v61 = v29;
                  _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%@Job %{public}@ for instance %{public}@ successfully started.",  buf,  0x20u);
                }

                ++v14;
              }

              else
              {
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v17 launchdJobName]);
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v17 bubbleId]);
                  *(_DWORD *)buf = 138412802;
                  v57 = &stru_100024E50;
                  __int16 v58 = 2114;
                  id v59 = v35;
                  __int16 v60 = 2114;
                  v61 = v36;
                  _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%@Failed to resume job %{public}@ for instance %{public}@",  buf,  0x20u);
                }
              }
            }

            else
            {
              id v30 = sub_1000153D4();
              __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v17 launchdJobName]);
                __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v17 bubbleId]);
                *(_DWORD *)buf = 138412802;
                v57 = &stru_100024E50;
                __int16 v58 = 2114;
                id v59 = v33;
                __int16 v60 = 2114;
                v61 = v34;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%@Job %{public}@ for instance %{public}@ is already running.",  buf,  0x20u);
              }

              [v19 removeObjectAtIndex:v21];
              ++v14;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v48 objects:v62 count:16];
        }

        while (v13);

        id v8 = v43;
        i = v44;
        if (!v14) {
          goto LABEL_34;
        }
      }

      id v42 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }

    while (v42);
  }

  -[HHDJobManager _shutdownOrphanedInstanceServices:services:]( v45,  "_shutdownOrphanedInstanceServices:services:",  v46,  v38);
  return v40;
}

- (void).cxx_destruct
{
}

@end