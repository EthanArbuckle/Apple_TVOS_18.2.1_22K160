@interface VCPMADTaskScheduler
+ (id)qosArray;
+ (id)sharedInstance;
- (BOOL)validateTask:(id)a3;
- (VCPMADTaskScheduler)init;
- (unint64_t)addBackgroundTask:(id)a3 withQoS:(unsigned int)a4;
- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4;
- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4 completionHandler:(id)a5;
- (unint64_t)currentOutstandingTasks;
- (unsigned)validateQoS:(unsigned int)a3;
- (void)_checkBackgroundTasksForTask:(id)a3;
- (void)_runTask:(id)a3;
- (void)_schedule;
- (void)_tryFreeingResourcesForQOS:(id)a3 resourceRequirement:(float)a4;
- (void)cancelAllTasks;
- (void)cancelBackgroundTasks;
- (void)cancelTaskWithID:(unint64_t)a3;
- (void)dealloc;
@end

@implementation VCPMADTaskScheduler

+ (id)qosArray
{
  return &off_1001C8FB8;
}

- (VCPMADTaskScheduler)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___VCPMADTaskScheduler;
  v2 = -[VCPMADTaskScheduler init](&v25, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.VCPMADTaskScheduler.management", v4);
    managementQueue = v2->_managementQueue;
    v2->_managementQueue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    runningGroup = v2->_runningGroup;
    v2->_runningGroup = (OS_dispatch_group *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    runningTasks = v2->_runningTasks;
    v2->_runningTasks = (NSMutableArray *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingTasks = v2->_pendingTasks;
    v2->_pendingTasks = (NSMutableDictionary *)v11;

    v2->_nextTaskID = 1LL;
    v2->_resourceBudget = 1.0;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v13 = objc_msgSend((id)objc_opt_class(v2), "qosArray", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v22;
      do
      {
        v17 = 0LL;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_pendingTasks,  "setObject:forKeyedSubscript:",  v19,  v18);

          v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }

      while (v15);
    }
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VCPMADTaskScheduler;
  -[VCPMADTaskScheduler dealloc](&v3, "dealloc");
}

+ (id)sharedInstance
{
  if (qword_1001E63C0 != -1) {
    dispatch_once(&qword_1001E63C0, &stru_1001B9F68);
  }
  return (id)qword_1001E63B8;
}

- (void)_tryFreeingResourcesForQOS:(id)a3 resourceRequirement:(float)a4
{
  id v101 = a3;
  uint64_t v6 = MediaAnalysisLogLevel(v101, v5);
  if ((int)v6 >= 7)
  {
    uint64_t v8 = VCPLogInstance(v6, v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    os_log_type_t v10 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v9, v10))
    {
      unsigned int v11 = [v101 intValue];
      double resourceBudget = self->_resourceBudget;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v112 = v11;
      *(_WORD *)&v112[4] = 2048;
      *(double *)&v112[6] = a4;
      *(_WORD *)&v112[14] = 2048;
      *(double *)&v112[16] = resourceBudget;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "[Scheduler] Attempting to terminate low-priority tasks to unblock high-priority request [QoS: %d Cost: %0.3f][Budget: %0.3f]",  buf,  0x1Cu);
    }
  }

  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  obj = self->_runningTasks;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v106,  v115,  16LL);
  id v15 = v13;
  if (!v13)
  {
    float v18 = 0.0;
    goto LABEL_22;
  }

  uint64_t v16 = *(void *)v107;
  uint64_t v17 = VCPLogToOSLogType[7];
  float v18 = 0.0;
  do
  {
    v19 = 0LL;
    do
    {
      if (*(void *)v107 != v16) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v106 + 1) + 8LL * (void)v19);
      uint64_t v21 = MediaAnalysisLogLevel(v13, v14);
      if ((int)v21 >= 7)
      {
        uint64_t v23 = VCPLogInstance(v21, v22);
        __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, (os_log_type_t)v17))
        {
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v20 task]);
          v26 = (objc_class *)objc_opt_class(v25);
          v27 = NSStringFromClass(v26);
          v98 = (void *)v25;
          uint64_t v28 = v16;
          uint64_t v29 = v17;
          id v30 = (id)objc_claimAutoreleasedReturnValue(v27);
          id v31 = [v20 taskID];
          LODWORD(v25) = [v20 qos];
          v32 = (void *)objc_claimAutoreleasedReturnValue([v20 task]);
          [v32 resourceRequirement];
          *(_DWORD *)buf = 138413058;
          *(void *)v112 = v30;
          *(_WORD *)&v112[8] = 2048;
          *(void *)&v112[10] = v31;
          *(_WORD *)&v112[18] = 1024;
          *(_DWORD *)&v112[20] = v25;
          __int16 v113 = 2048;
          double v114 = v33;
          uint64_t v17 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  (os_log_type_t)v29,  "[Scheduler] Evaluating candidate %@ (%lu) [QoS: %d Cost: %0.3f]",  buf,  0x26u);

          uint64_t v16 = v28;
        }
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue([v20 task]);
      if ([v34 autoCancellable])
      {
        unsigned int v35 = [v20 qos];
        BOOL v36 = v35 < [v101 intValue];

        if (!v36) {
          goto LABEL_18;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue([v20 task]);
        [v34 resourceRequirement];
        float v18 = v18 + v37;
      }

LABEL_18:
      v19 = (char *)v19 + 1;
    }

    while (v15 != v19);
    id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v106,  v115,  16LL);
    id v15 = v13;
  }

  while (v13);
LABEL_22:

  if ((float)(v18 + self->_resourceBudget) >= a4)
  {
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    v38 = self->_runningTasks;
    id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v102,  v110,  16LL);
    if (!v39) {
      goto LABEL_48;
    }
    uint64_t v41 = *(void *)v103;
    os_log_type_t obja = VCPLogToOSLogType[7];
    *(void *)&__int128 v40 = 138413058LL;
    __int128 v95 = v40;
    v97 = v38;
    while (1)
    {
      for (i = 0LL; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v103 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v102 + 1) + 8LL * (void)i);
        v44 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "task", v95));
        if (-[dispatch_group_s autoCancellable](v44, "autoCancellable"))
        {
          unsigned int v45 = [v43 qos];
          BOOL v46 = v45 < [v101 intValue];

          if (!v46) {
            continue;
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
          char v48 = objc_opt_respondsToSelector(v47, "interrupt");

          if ((v48 & 1) != 0)
          {
            uint64_t v51 = MediaAnalysisLogLevel(v49, v50);
            if ((int)v51 >= 7)
            {
              uint64_t v53 = VCPLogInstance(v51, v52);
              v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, obja))
              {
                v55 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                v56 = (objc_class *)objc_opt_class(v55);
                v57 = NSStringFromClass(v56);
                id v58 = (id)objc_claimAutoreleasedReturnValue(v57);
                id v59 = [v43 taskID];
                unsigned int v60 = [v43 qos];
                v61 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                [v61 resourceRequirement];
                *(_DWORD *)buf = v95;
                *(void *)v112 = v58;
                *(_WORD *)&v112[8] = 2048;
                *(void *)&v112[10] = v59;
                *(_WORD *)&v112[18] = 1024;
                *(_DWORD *)&v112[20] = v60;
                __int16 v113 = 2048;
                double v114 = v62;
                _os_log_impl( (void *)&_mh_execute_header,  v54,  obja,  "[Scheduler] Interrupting %@ (%lu) [QoS: %d Cost: %0.3f]",  buf,  0x26u);

                v38 = v97;
              }
            }

            v63 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
            [v63 interrupt];

            v64 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v43 taskGroup]);
            dispatch_group_wait(v64, 0xFFFFFFFFFFFFFFFFLL);

            uint64_t v67 = MediaAnalysisLogLevel(v65, v66);
            if ((int)v67 >= 7)
            {
              uint64_t v69 = VCPLogInstance(v67, v68);
              v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(v70, obja))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                v72 = (objc_class *)objc_opt_class(v71);
                v73 = NSStringFromClass(v72);
                id v74 = (id)objc_claimAutoreleasedReturnValue(v73);
                id v75 = [v43 taskID];
                unsigned int v76 = [v43 qos];
                v77 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                [v77 resourceRequirement];
                *(_DWORD *)buf = v95;
                *(void *)v112 = v74;
                *(_WORD *)&v112[8] = 2048;
                *(void *)&v112[10] = v75;
                *(_WORD *)&v112[18] = 1024;
                *(_DWORD *)&v112[20] = v76;
                __int16 v113 = 2048;
                double v114 = v78;
                _os_log_impl( (void *)&_mh_execute_header,  v70,  obja,  "[Scheduler] Reschedule interrupted task %@ (%lu) [QoS: %d Cost: %0.3f]",  buf,  0x26u);

                v38 = v97;
              }
            }

            pendingTasks = self->_pendingTasks;
            v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v43 qos]));
            v81 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( pendingTasks,  "objectForKeyedSubscript:",  v80));
            [v81 addObject:v43];

            v44 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v43 task]);
            -[dispatch_group_s resetInterruption](v44, "resetInterruption");
          }

          else
          {
            uint64_t v82 = MediaAnalysisLogLevel(v49, v50);
            if ((int)v82 >= 7)
            {
              uint64_t v84 = VCPLogInstance(v82, v83);
              v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
              if (os_log_type_enabled(v85, obja))
              {
                v86 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                v87 = (objc_class *)objc_opt_class(v86);
                v88 = NSStringFromClass(v87);
                id v89 = (id)objc_claimAutoreleasedReturnValue(v88);
                id v90 = [v43 taskID];
                unsigned int v91 = [v43 qos];
                v92 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
                [v92 resourceRequirement];
                *(_DWORD *)buf = v95;
                *(void *)v112 = v89;
                *(_WORD *)&v112[8] = 2048;
                *(void *)&v112[10] = v90;
                *(_WORD *)&v112[18] = 1024;
                *(_DWORD *)&v112[20] = v91;
                __int16 v113 = 2048;
                double v114 = v93;
                _os_log_impl( (void *)&_mh_execute_header,  v85,  obja,  "[Scheduler] Cancelling %@ (%lu) [QoS: %d Cost: %0.3f]",  buf,  0x26u);

                v38 = v97;
              }
            }

            v94 = (void *)objc_claimAutoreleasedReturnValue([v43 task]);
            [v94 cancel];

            v44 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v43 taskGroup]);
            dispatch_group_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
          }
        }
      }

      id v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v102,  v110,  16LL);
      if (!v39)
      {
LABEL_48:

        break;
      }
    }
  }
}

- (void)_schedule
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 7)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Scheduler] Evaluating scheduling", buf, 2u);
    }
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v8 = objc_msgSend((id)objc_opt_class(self), "qosArray", 0);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0LL;
      while (2)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        while (1)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingTasks,  "objectForKeyedSubscript:",  v13));
          BOOL v15 = [v14 count] == 0;

          if (v15) {
            break;
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingTasks,  "objectForKeyedSubscript:",  v13));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndexedSubscript:0]);
          float v18 = (void *)objc_claimAutoreleasedReturnValue([v17 task]);
          [v18 resourceRequirement];
          BOOL v20 = v19 > self->_resourceBudget;

          if (v20)
          {
            if ([v13 intValue] >= 0x19)
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingTasks,  "objectForKeyedSubscript:",  v13));
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 task]);
              [v25 resourceRequirement];
              -[VCPMADTaskScheduler _tryFreeingResourcesForQOS:resourceRequirement:]( self,  "_tryFreeingResourcesForQOS:resourceRequirement:",  v13);
            }

            goto LABEL_19;
          }

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_pendingTasks,  "objectForKeyedSubscript:",  v13));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);
          -[VCPMADTaskScheduler _runTask:](self, "_runTask:", v22);
        }

        if ((id)++v12 != v10) {
          continue;
        }
        break;
      }

      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v10);
  }

- (void)_runTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VCPWatchdog sharedWatchdog](&OBJC_CLASS___VCPWatchdog, "sharedWatchdog"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
  os_log_type_t v7 = (objc_class *)objc_opt_class(v6);
  id v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Task: %@", v9));
  [v5 petWithMessage:v10];

  uint64_t v13 = MediaAnalysisLogLevel(v11, v12);
  if ((int)v13 >= 5)
  {
    uint64_t v15 = VCPLogInstance(v13, v14);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      float v18 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
      *(_DWORD *)buf = 138412290;
      id v73 = (id)objc_opt_class(v18);
      id v19 = v73;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Running task %@", buf, 0xCu);
    }
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[MADStateHandler sharedStateHandler](&OBJC_CLASS___MADStateHandler, "sharedStateHandler"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
  [v20 addBreadcrumb:@"Running task %@ with qos %u", objc_opt_class(v21), objc_msgSend(v4, "qos")];

  if (!-[NSMutableArray count](self->_runningTasks, "count"))
  {
    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___MADScopedWatchdog);
    scopedWatchdog = self->_scopedWatchdog;
    self->_scopedWatchdog = v22;

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[VCPCPUMonitor sharedCPUMonitor](&OBJC_CLASS___VCPCPUMonitor, "sharedCPUMonitor"));
    self->_cpuMonitorID = [v24 disableWithTimeoutSeconds:86400];
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
  if ((objc_opt_respondsToSelector(v25, "cachesResources") & 1) != 0)
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
    unsigned __int8 v27 = [v26 cachesResources];

    if ((v27 & 1) != 0) {
      goto LABEL_16;
    }
  }

  else
  {
  }

  uint64_t v30 = MediaAnalysisLogLevel(v28, v29);
  if ((int)v30 >= 7)
  {
    uint64_t v32 = VCPLogInstance(v30, v31);
    float v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    os_log_type_t v34 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v33, v34))
    {
      unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
      BOOL v36 = (objc_class *)objc_opt_class(v35);
      float v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      id v39 = [v4 taskID];
      *(_DWORD *)buf = 138412546;
      id v73 = v38;
      __int16 v74 = 2048;
      id v75 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "[Scheduler] %@ (%lu) does not use resource cache; purging if necessary",
        buf,
        0x16u);
    }
  }

  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMADResourceManager sharedManager](&OBJC_CLASS___VCPMADResourceManager, "sharedManager"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
  [v41 resourceRequirement];
  [v40 reserveBudgetNormalized:v42];

LABEL_16:
  pendingTasks = self->_pendingTasks;
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 qos]));
  unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pendingTasks, "objectForKeyedSubscript:", v44));
  [v45 removeObject:v4];

  -[NSMutableArray addObject:](self->_runningTasks, "addObject:", v4);
  id v46 = [v4 background];
  if ((v46 & 1) == 0)
  {
    char v48 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
    [v48 resourceRequirement];
    self->_double resourceBudget = self->_resourceBudget - v49;
  }

  uint64_t v50 = MediaAnalysisLogLevel(v46, v47);
  if ((int)v50 >= 5)
  {
    uint64_t v52 = VCPLogInstance(v50, v51);
    uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    os_log_type_t v54 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
      v56 = (objc_class *)objc_opt_class(v55);
      v57 = NSStringFromClass(v56);
      id v58 = (id)objc_claimAutoreleasedReturnValue(v57);
      id v59 = [v4 taskID];
      unsigned int v60 = [v4 qos];
      v61 = (void *)objc_claimAutoreleasedReturnValue([v4 task]);
      [v61 resourceRequirement];
      double resourceBudget = self->_resourceBudget;
      *(_DWORD *)buf = 138413314;
      id v73 = v58;
      __int16 v74 = 2048;
      id v75 = v59;
      __int16 v76 = 1024;
      unsigned int v77 = v60;
      __int16 v78 = 2048;
      double v79 = v63;
      __int16 v80 = 2048;
      double v81 = resourceBudget;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  v54,  "[Scheduler] Running %@ (%lu) [QoS: %d Cost: %0.3f]; remaining resource: %.2f",
        buf,
        0x30u);
    }
  }

  v64 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v4 taskGroup]);
  dispatch_group_enter(v64);

  runningGroup = self->_runningGroup;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue([v4 qos], 0);
  uint64_t v67 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014004;
  block[3] = &unk_1001B9E70;
  id v70 = v4;
  v71 = self;
  id v68 = v4;
  dispatch_group_async((dispatch_group_t)runningGroup, v67, block);
}

- (void)cancelBackgroundTasks
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = self->_runningTasks;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (objc_msgSend(v6, "background", (void)v9))
        {
          os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 task]);
          [v7 cancel];

          id v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v6 taskGroup]);
          dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
        }
      }

      id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v3);
  }
}

- (void)_checkBackgroundTasksForTask:(id)a3
{
  id v4 = a3;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  obj = self->_runningTasks;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
  if (v5)
  {
    uint64_t v7 = *(void *)v34;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v31 = v6;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        __int128 v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "background", v31))
        {
          uint64_t v10 = objc_opt_respondsToSelector(v4, "interruptBackgroundTasks");
          if ((v10 & 1) != 0 && (uint64_t v10 = (uint64_t)[v4 interruptBackgroundTasks], !(_DWORD)v10))
          {
            uint64_t v16 = VCPLogInstance(v10, v11);
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              __int128 v24 = (objc_class *)objc_opt_class(v4);
              uint64_t v25 = NSStringFromClass(v24);
              id v26 = (id)objc_claimAutoreleasedReturnValue(v25);
              unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v9 task]);
              uint64_t v28 = (objc_class *)objc_opt_class(v27);
              uint64_t v29 = NSStringFromClass(v28);
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              *(_DWORD *)buf = v31;
              id v38 = v26;
              __int16 v39 = 2112;
              __int128 v40 = v30;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "[Scheduler] Foreground task (%@) running concurrently with DAS activity (%@)",  buf,  0x16u);
            }
          }

          else
          {
            uint64_t v12 = VCPLogInstance(v10, v11);
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              os_log_type_t v17 = (objc_class *)objc_opt_class(v4);
              float v18 = NSStringFromClass(v17);
              id v19 = (id)objc_claimAutoreleasedReturnValue(v18);
              BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v9 task]);
              uint64_t v21 = (objc_class *)objc_opt_class(v20);
              uint64_t v22 = NSStringFromClass(v21);
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              *(_DWORD *)buf = v31;
              id v38 = v19;
              __int16 v39 = 2112;
              __int128 v40 = v23;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "[Scheduler] Foreground task (%@) interrupting DAS activity (%@)",  buf,  0x16u);
            }

            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 task]);
            [v14 cancel];

            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 taskGroup]);
            dispatch_group_wait((dispatch_group_t)v15, 0xFFFFFFFFFFFFFFFFLL);
          }
        }
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
    }

    while (v5);
  }
}

- (BOOL)validateTask:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  if (v3)
  {
    id v6 = [v3 resourceRequirement];
    if (v8 >= 0.0)
    {
      id v6 = [v5 resourceRequirement];
      if (v9 <= 1.0)
      {
        BOOL v24 = 1;
        goto LABEL_13;
      }
    }

    uint64_t v10 = MediaAnalysisLogLevel(v6, v7);
    if ((int)v10 >= 4)
    {
      uint64_t v12 = VCPLogInstance(v10, v11);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        [v5 resourceRequirement];
        int v26 = 134217984;
        double v27 = v15;
        uint64_t v16 = "[Scheduler] Invalid resource requirement (%0.1f); dropping task request";
        os_log_type_t v17 = v13;
        os_log_type_t v18 = v14;
        uint32_t v19 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v26, v19);
        goto LABEL_11;
      }

      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v20 = MediaAnalysisLogLevel(0LL, v4);
    if ((int)v20 >= 4)
    {
      uint64_t v22 = VCPLogInstance(v20, v21);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      os_log_type_t v23 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v23))
      {
        LOWORD(v26) = 0;
        uint64_t v16 = "[Scheduler] Invalid task (nil); dropping task request";
        os_log_type_t v17 = v13;
        os_log_type_t v18 = v23;
        uint32_t v19 = 2;
        goto LABEL_10;
      }

- (unsigned)validateQoS:(unsigned int)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(self), "qosArray", 0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) unsignedIntValue];
        unsigned int v11 = v9;
        if (v9 <= a3)
        {
          if (v9 < a3)
          {
            uint64_t v15 = VCPLogInstance(v9, v10);
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              sub_100016448();
            }
          }

          goto LABEL_16;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = VCPLogInstance(v12, v13);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
    sub_1000163D8();
  }
  unsigned int v11 = 9;
LABEL_16:

  return v11;
}

- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4
{
  return -[VCPMADTaskScheduler addForegroundTask:withQoS:completionHandler:]( self,  "addForegroundTask:withQoS:completionHandler:",  a3,  *(void *)&a4,  0LL);
}

- (unint64_t)addForegroundTask:(id)a3 withQoS:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (-[VCPMADTaskScheduler validateTask:](self, "validateTask:", v8))
  {
    unsigned int v10 = -[VCPMADTaskScheduler validateQoS:](self, "validateQoS:", v6);
    uint64_t v19 = 0LL;
    __int128 v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v22 = 0LL;
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014C30;
    block[3] = &unk_1001B9F90;
    os_log_type_t v17 = &v19;
    void block[4] = self;
    id v15 = v8;
    unsigned int v18 = v10;
    id v16 = v9;
    dispatch_sync(managementQueue, block);
    unint64_t v12 = v20[3];

    _Block_object_dispose(&v19, 8);
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  return v12;
}

- (unint64_t)addBackgroundTask:(id)a3 withQoS:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (-[VCPMADTaskScheduler validateTask:](self, "validateTask:", v6))
  {
    unsigned int v7 = -[VCPMADTaskScheduler validateQoS:](self, "validateQoS:", v4);
    uint64_t v15 = 0LL;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0LL;
    managementQueue = (dispatch_queue_s *)self->_managementQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100014F38;
    v11[3] = &unk_1001B9FB8;
    v11[4] = self;
    id v12 = v6;
    uint64_t v13 = &v15;
    unsigned int v14 = v7;
    dispatch_sync(managementQueue, v11);
    unint64_t v9 = v16[3];

    _Block_object_dispose(&v15, 8);
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (void)cancelTaskWithID:(unint64_t)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 6)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[Scheduler] Cancelling task %lu", (uint8_t *)&buf, 0xCu);
    }
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100015730;
  int v26 = sub_100015740;
  id v27 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  __int128 v20 = sub_100015730;
  uint64_t v21 = sub_100015740;
  id v22 = 0LL;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100015748;
  v16[3] = &unk_1001B9FE0;
  v16[4] = self;
  v16[5] = &buf;
  v16[6] = &v17;
  v16[7] = a3;
  dispatch_sync(managementQueue, v16);
  unsigned int v11 = *(void **)(*((void *)&buf + 1) + 40LL);
  if (v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 taskGroup]);
    dispatch_group_wait((dispatch_group_t)v12, 0xFFFFFFFFFFFFFFFFLL);
LABEL_7:

    goto LABEL_8;
  }

  uint64_t v13 = (void *)v18[5];
  if (v13)
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 completionHandler]);
    BOOL v15 = v14 == 0LL;

    if (!v15)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([(id)v18[5] completionHandler]);
      (*(void (**)(uint64_t, id, uint64_t))(v12 + 16))(v12, [(id)v18[5] taskID], 4294967168);
      goto LABEL_7;
    }
  }

- (void)cancelAllTasks
{
  uint64_t v3 = MediaAnalysisLogLevel(self, a2);
  if ((int)v3 >= 6)
  {
    uint64_t v5 = VCPLogInstance(v3, v4);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[Scheduler] Cancelling all tasks", buf, 2u);
    }
  }

  *(void *)__int128 buf = 0LL;
  uint64_t v24 = buf;
  uint64_t v25 = 0x3032000000LL;
  int v26 = sub_100015730;
  id v27 = sub_100015740;
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015E70;
  block[3] = &unk_1001BA008;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(managementQueue, block);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = *((id *)v24 + 5);
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned int v14 = objc_autoreleasePoolPush();
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completionHandler", (void)v18));
        BOOL v16 = v15 == 0LL;

        if (!v16)
        {
          uint64_t v17 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v13 completionHandler]);
          ((void (**)(void, id, uint64_t))v17)[2](v17, [v13 taskID], 4294967168);
        }

        objc_autoreleasePoolPop(v14);
      }

      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }

    while (v10);
  }

  dispatch_group_wait((dispatch_group_t)self->_runningGroup, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(buf, 8);
}

- (unint64_t)currentOutstandingTasks
{
  uint64_t v6 = 0LL;
  os_log_type_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  managementQueue = (dispatch_queue_s *)self->_managementQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000161F0;
  v5[3] = &unk_1001BA030;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(managementQueue, v5);
  unint64_t v3 = *((int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
}

@end