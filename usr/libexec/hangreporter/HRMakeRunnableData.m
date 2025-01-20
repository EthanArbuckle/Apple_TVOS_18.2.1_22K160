@interface HRMakeRunnableData
- (HRMakeRunnableData)init;
- (NSDictionary)blockingThreadInfo;
- (NSMutableArray)allBlockingThreadsArray;
- (NSNumber)topBlockingPid;
- (int64_t)findBlockingThreadForTailspin:(id)a3 sampleStore:(id)a4 mainThread:(id)a5 hangStartTime:(unint64_t)a6 hangEndTime:(unint64_t)a7 hangDuration:(int)a8;
- (int64_t)findBlockingThreadFromSampleStore:(id)a3 mainThread:(id)a4 hangStartTime:(unint64_t)a5 hangEndTime:(unint64_t)a6;
- (void)setAllBlockingThreadsArray:(id)a3;
- (void)setBlockingThreadInfo:(id)a3;
- (void)setTopBlockingPid:(id)a3;
- (void)storeOtherBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 sortedThreadsMaxCumlativeTime:(id)a6 blockingTimeByThread:(id)a7 tidToPidDict:(id)a8;
- (void)storeTopBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 pidMostBlockingTime:(id)a6 blockedTime:(id)a7 isHangMainThread:(BOOL)a8;
@end

@implementation HRMakeRunnableData

- (HRMakeRunnableData)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HRMakeRunnableData;
  v2 = -[HRMakeRunnableData init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[HRMakeRunnableData setAllBlockingThreadsArray:](v2, "setAllBlockingThreadsArray:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
    -[HRMakeRunnableData setTopBlockingPid:](v2, "setTopBlockingPid:", v4);

    -[HRMakeRunnableData setBlockingThreadInfo:](v2, "setBlockingThreadInfo:", 0LL);
  }

  return v2;
}

- (void)storeTopBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 pidMostBlockingTime:(id)a6 blockedTime:(id)a7 isHangMainThread:(BOOL)a8
{
  BOOL v8 = a8;
  id v21 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%#llx",  [v21 unsignedLongLongValue]));
  [v17 setObject:v18 forKeyedSubscript:@"topBlockingThreadId"];

  [v17 setObject:v14 forKeyedSubscript:@"topBlockingPid"];
  v19 = sub_10000F750(v16, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  [v17 setObject:v20 forKeyedSubscript:@"topBlockingProcess"];
  [v17 setObject:v15 forKeyedSubscript:@"topBlockingTimeMS"];

  [v17 setObject:0 forKeyedSubscript:@"otherBlockingThreads"];
  [v17 setObject:0 forKeyedSubscript:@"nextTopBlockingThreadInfo"];

  if (v8) {
    objc_storeStrong((id *)&self->_topBlockingPid, a6);
  }
  -[NSMutableArray addObject:](self->_allBlockingThreadsArray, "addObject:", v21);
}

- (void)storeOtherBlockingThreadInfoInBlockingThreadInfo:(id)a3 sampleStore:(id)a4 mostBlockingTimeThreadId:(id)a5 sortedThreadsMaxCumlativeTime:(id)a6 blockingTimeByThread:(id)a7 tidToPidDict:(id)a8
{
  id v32 = a3;
  id v38 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v37 = a8;
  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    id v33 = v13;
    id v34 = v16;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        if (([v21 isEqualToNumber:v13] & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v21]);
          double v23 = sub_100002FAC((unint64_t)[v22 cumulativeTime]);

          if (v23 > 50.0)
          {
            v43[0] = @"threadId";
            v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%#llx",  [v21 unsignedLongLongValue]));
            v44[0] = v24;
            v43[1] = @"process";
            id v25 = v15;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v21]);
            v27 = sub_10000F750(v38, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v44[1] = v28;
            v43[2] = @"blockingTimeMS";
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
            v44[2] = v29;
            uint64_t v30 = v19;
            v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  3LL));
            -[NSMutableArray addObject:](v36, "addObject:", v31);

            uint64_t v19 = v30;
            id v15 = v25;
            id v13 = v33;
            id v16 = v34;

            -[NSMutableArray addObject:](self->_allBlockingThreadsArray, "addObject:", v21);
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v18);
  }

  if (-[NSMutableArray count](v36, "count")) {
    [v32 setObject:v36 forKeyedSubscript:@"otherBlockingThreads"];
  }
}

- (int64_t)findBlockingThreadForTailspin:(id)a3 sampleStore:(id)a4 mainThread:(id)a5 hangStartTime:(unint64_t)a6 hangEndTime:(unint64_t)a7 hangDuration:(int)a8
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 threadId];
  id v14 = v12;
  v172 = v11;
  v175 = (void *)objc_claimAutoreleasedReturnValue([v11 tidToPidDict]);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v174 = 0;
  char v16 = 1;
  *(void *)&__int128 v17 = 134218240LL;
  __int128 v166 = v17;
  v168 = v15;
  id v169 = v10;
  id v170 = v13;
  id v178 = v13;
  v167 = v14;
  v176 = v14;
  while (1)
  {
    v177 = v15;
    if ((v16 & 1) == 0) {
      goto LABEL_110;
    }
    if (v174 >= 5)
    {
      id v143 = sub_1000199EC();
      blockingThreadInfo = (NSDictionary *)objc_claimAutoreleasedReturnValue(v143);
      if (os_log_type_enabled((os_log_t)blockingThreadInfo, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v174;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)blockingThreadInfo,  OS_LOG_TYPE_INFO,  "findBlockingThreadForTailspin:  currentNextIterationCount = %d is more than MAX_KTRACE_SESSION_COUNT",  buf,  8u);
      }

      goto LABEL_109;
    }

    blockingThreadInfo = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v19 = v10;
    uint64_t v20 = ktrace_session_create();
    if (!v20)
    {
      id v144 = sub_1000199EC();
      v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v213 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_DEFAULT,  "getMKRunnableDatafromKTraceforThreadId: ktrace_session_create failed",  v213,  2u);
      }

      goto LABEL_80;
    }

    uint64_t v21 = v20;
    id v22 = v19;
    int v23 = ktrace_set_file(v21, [v22 UTF8String]);
    if (v23)
    {
      int v146 = v23;
      id v147 = sub_1000199EC();
      v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v213 = 67109120;
        *(_DWORD *)&v213[4] = v146;
        _os_log_impl( (void *)&_mh_execute_header,  v148,  OS_LOG_TYPE_DEFAULT,  "getMKRunnableDatafromKTraceforThreadId: ktrace_set_file failed with error# = %i",  v213,  8u);
      }

      ktrace_session_destroy(v21);
LABEL_80:

LABEL_94:
      int64_t v157 = 2LL;
      goto LABEL_111;
    }

    ktrace_session_set_event_names_enabled(v21, 0LL);
    ktrace_set_execnames_enabled(v21, 0LL);
    ktrace_set_jetsam_coalitions_enabled(v21, 0LL);
    ktrace_set_thread_groups_enabled(v21, 0LL);
    ktrace_set_vnode_paths_enabled(v21, 0LL);
    ktrace_set_thread_cputime_enabled(v21, 0LL);
    ktrace_set_uuid_map_enabled(v21, 0LL);
    ktrace_set_remotetime_conversion_enabled(v21, 0LL);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1000117F0;
    v209 = &unk_100071418;
    unint64_t v24 = a7;
    *((void *)&v210 + 1) = v178;
    unint64_t v211 = a6;
    unint64_t v212 = a7;
    blockingThreadInfo = blockingThreadInfo;
    *(void *)&__int128 v210 = blockingThreadInfo;
    id v25 = objc_retainBlock(buf);
    int v26 = ktrace_events_single(v21, 621346816LL, v25);
    if (v26)
    {
      int v149 = v26;
      id v150 = sub_1000199EC();
      v151 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_84;
      }
      goto LABEL_85;
    }

    int v27 = ktrace_events_single(v21, 6LL, v25);
    if (v27)
    {
      int v149 = v27;
      id v152 = sub_1000199EC();
      v151 = (os_log_s *)objc_claimAutoreleasedReturnValue(v152);
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
LABEL_84:
        *(_DWORD *)v213 = 67109376;
        *(_DWORD *)&v213[4] = v149;
        *(_WORD *)&v213[8] = 2048;
        *(void *)&v213[10] = v178;
        _os_log_impl( (void *)&_mh_execute_header,  v151,  OS_LOG_TYPE_DEFAULT,  "getMKRunnableDatafromKTraceforThreadId: ktrace_events_single failed with error# = %i for threadId= %llx",  v213,  0x12u);
      }

- (int64_t)findBlockingThreadFromSampleStore:(id)a3 mainThread:(id)a4 hangStartTime:(unint64_t)a5 hangEndTime:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v8 tidToPidDict]);
  id v10 = [v9 threadId];
  id v11 = v9;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 threadStates]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);

  char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 endTimestamp]);
  id v17 = [v16 machAbsTime];

  if ((unint64_t)v17 > a6)
  {
    int64_t v18 = 4LL;
    id v19 = v13;
    uint64_t v20 = v11;
    goto LABEL_34;
  }

  obj = v12;
  uint64_t v45 = v8;
  id v43 = v10;
  id v44 = (void *)objc_claimAutoreleasedReturnValue([v15 endTimestamp]);
  unsigned int v21 = -1;
  id v22 = v10;
  id v41 = v11;
  __int128 v42 = v13;
  id v23 = v11;
  unint64_t v24 = v15;
  id v25 = v13;
  while (1)
  {
    int v26 = (void *)objc_claimAutoreleasedReturnValue([v24 turnstileInfo]);
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v24 waitInfo]);
    v48 = v23;
    if (v26 && [v26 blockingTid])
    {
      id v28 = [v26 blockingTid];
LABEL_12:
      uint64_t v29 = (uint64_t)[v26 blockingPid];
      if (!v27) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }

    if (v27 && [v27 blockingTid])
    {
      id v28 = [v27 blockingTid];
      uint64_t v29 = (uint64_t)[v27 blockingPid];
    }

    else
    {
      if (v26)
      {
        id v28 = 0LL;
      }

      else
      {
        id v28 = 0LL;
      }

      uint64_t v29 = 0xFFFFFFFFLL;
      if (!v27) {
        goto LABEL_18;
      }
    }

- (NSMutableArray)allBlockingThreadsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAllBlockingThreadsArray:(id)a3
{
}

- (NSNumber)topBlockingPid
{
  return (NSNumber *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTopBlockingPid:(id)a3
{
}

- (NSDictionary)blockingThreadInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBlockingThreadInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end