@interface VCPMADProcessingJobManager
+ (id)sharedManager;
- (OS_dispatch_semaphore)inProcessAssetBudget;
- (VCPMADProcessingJobManager)init;
- (id)getJobScheduler;
- (void)registerQueueGroupWithName:(id)a3 andNumberOfQueues:(unint64_t)a4;
- (void)setInProcessAssetBudget:(id)a3;
@end

@implementation VCPMADProcessingJobManager

- (VCPMADProcessingJobManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VCPMADProcessingJobManager;
  v2 = -[VCPMADProcessingJobManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    queueNameToQueueGroup = v2->_queueNameToQueueGroup;
    v2->_queueNameToQueueGroup = (NSMutableDictionary *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(8LL);
    inProcessAssetBudget = v2->_inProcessAssetBudget;
    v2->_inProcessAssetBudget = (OS_dispatch_semaphore *)v5;
  }

  return v2;
}

+ (id)sharedManager
{
  if (qword_1001E6630 != -1) {
    dispatch_once(&qword_1001E6630, &stru_1001BD368);
  }
  return (id)qword_1001E6638;
}

- (void)registerQueueGroupWithName:(id)a3 andNumberOfQueues:(unint64_t)a4
{
  id v6 = a3;
  objc_super v8 = v6;
  if (a4 - 5 > 0xFFFFFFFFFFFFFFFBLL)
  {
    unint64_t v10 = a4;
  }

  else
  {
    if (a4 <= 1) {
      unint64_t v9 = 1LL;
    }
    else {
      unint64_t v9 = a4;
    }
    if (v9 >= 4) {
      unint64_t v10 = 4LL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t v11 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v11 >= 4)
    {
      uint64_t v13 = VCPLogInstance(v11, v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      os_log_type_t v15 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v45 = a4;
        __int16 v46 = 2112;
        unint64_t v47 = (unint64_t)v8;
        __int16 v48 = 2048;
        unint64_t v49 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  v15,  "Invalid number of queues %lu for QueueGroup %@, clipping to %lu",  buf,  0x20u);
      }
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queueNameToQueueGroup,  "objectForKeyedSubscript:",  v8));

  if (!v16)
  {
    v43 = self;
    uint64_t v29 = MediaAnalysisLogLevel(v17, v18);
    if ((int)v29 >= 6)
    {
      uint64_t v31 = VCPLogInstance(v29, v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      os_log_type_t v33 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v45 = (unint64_t)v8;
        __int16 v46 = 2048;
        unint64_t v47 = v10;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Registering QueueGroup %@ with %lu queues", buf, 0x16u);
      }
    }

    v42 = objc_alloc_init(&OBJC_CLASS___QueueGroup);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v35 = 0LL;
    do
    {
      v36 = objc_autoreleasePoolPush();
      id v37 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.mediaanalysis.%@_%lu", v8, v35));
      dispatch_queue_t v38 = dispatch_queue_create((const char *)[v37 UTF8String], 0);
      qos_class_t v39 = qos_class_self();
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(v39, 0LL);
      v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_set_target_queue(v38, v41);

      [v34 addObject:v38];
      objc_autoreleasePoolPop(v36);
      ++v35;
    }

    while (v10 != v35);
    v27 = (os_log_s *)v42;
    -[QueueGroup setQueues:](v42, "setQueues:", v34);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v43->_queueNameToQueueGroup,  "setObject:forKeyedSubscript:",  v42,  v8);

    goto LABEL_25;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_queueNameToQueueGroup,  "objectForKeyedSubscript:",  v8));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 queues]);
  id v21 = [v20 count];

  if ((id)v10 != v21)
  {
    uint64_t v24 = MediaAnalysisLogLevel(v22, v23);
    if ((int)v24 >= 4)
    {
      uint64_t v26 = VCPLogInstance(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412802;
        unint64_t v45 = (unint64_t)v8;
        __int16 v46 = 2048;
        unint64_t v47 = (unint64_t)v21;
        __int16 v48 = 2048;
        unint64_t v49 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  v28,  "QueueGroup %@ has been registered with %lu queues, not allowed to change to %lu queues as requested",  buf,  0x20u);
      }

- (id)getJobScheduler
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000D4308;
  v3[3] = &unk_1001BD390;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (OS_dispatch_semaphore)inProcessAssetBudget
{
  return self->_inProcessAssetBudget;
}

- (void)setInProcessAssetBudget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end