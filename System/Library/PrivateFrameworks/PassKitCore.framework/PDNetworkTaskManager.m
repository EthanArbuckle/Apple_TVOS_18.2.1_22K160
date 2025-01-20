@interface PDNetworkTaskManager
- (BOOL)containsTaskPassingTest:(id)a3;
- (PDNetworkTaskManager)initWithDelegate:(id)a3 archiveName:(id)a4;
- (void)_activateOrScheduleEligibleTasksWithNetworkConnectivity:(BOOL)a3;
- (void)_activateTask:(id)a3;
- (void)_archiveTasks;
- (void)_createPowerAssertion;
- (void)_enqueueTask:(id)a3;
- (void)_lock_deactivateTask:(id)a3;
- (void)_releasePowerAssertion;
- (void)_tryToDequeueTasks;
- (void)_unarchiveTasks;
- (void)cancelTasksPassingTest:(id)a3;
- (void)dealloc;
- (void)nukeArchive;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)performTask:(id)a3;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)taskFailed:(id)a3;
- (void)taskFailedForAuthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
@end

@implementation PDNetworkTaskManager

- (PDNetworkTaskManager)initWithDelegate:(id)a3 archiveName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___PDNetworkTaskManager;
  v9 = -[PDNetworkTaskManager init](&v32, "init");
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_delegate, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    enqueuedTasks = v10->_enqueuedTasks;
    v10->_enqueuedTasks = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    scheduledTasks = v10->_scheduledTasks;
    v10->_scheduledTasks = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_v%lu",  v8,  6LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathExtension:@"archive"]);

    uint64_t v20 = PKHomeDirectoryPath(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v18]);
    archivePath = v10->_archivePath;
    v10->_archivePath = (NSString *)v22;

    v24 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"PDNetworkTaskManager.%@",  v8);
    scheduledActivityClientIdentifier = v10->_scheduledActivityClientIdentifier;
    v10->_scheduledActivityClientIdentifier = v24;

    v26 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"PDNetworkTaskManager.%@",  v8);
    powerAssertionName = v10->_powerAssertionName;
    v10->_powerAssertionName = v26;

    v28 = v10->_scheduledActivityClientIdentifier;
    id v29 = PDDefaultQueue();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    PDScheduledActivityClientRegister(v28, v10, v30);

    -[PDNetworkTaskManager _unarchiveTasks](v10, "_unarchiveTasks");
    if ((PDScheduledActivityExists( v10->_scheduledActivityClientIdentifier,  @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier") & 1) == 0) {
      -[PDNetworkTaskManager _tryToDequeueTasks](v10, "_tryToDequeueTasks");
    }
  }

  return v10;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0LL;

  -[PDNetworkTaskManager _releasePowerAssertion](self, "_releasePowerAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNetworkTaskManager;
  -[PDNetworkTaskManager dealloc](&v5, "dealloc");
}

- (void)performTask:(id)a3
{
}

- (void)cancelTasksPassingTest:(id)a3
{
  v4 = (uint64_t (**)(id, void))a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray arrayByAddingObjectsFromArray:]( self->_enqueuedTasks,  "arrayByAddingObjectsFromArray:",  self->_scheduledTasks));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        int v12 = v4[2](v4, v11);
        uint64_t Object = PKLogFacilityTypeGetObject(2LL);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v31 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Canceling Task: %@", buf, 0xCu);
          }

          -[NSMutableSet addObject:](v5, "addObject:", v11);
          -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v11);
          -[NSMutableArray removeObject:](self->_enqueuedTasks, "removeObject:", v11);
          -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v11);
        }

        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v31 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Letting Task Continue: %@", buf, 0xCu);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v16 = v5;
  id v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) cancel];
      }

      id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
    }

    while (v18);
  }

  -[PDNetworkTaskManager _tryToDequeueTasks](self, "_tryToDequeueTasks");
}

- (BOOL)containsTaskPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray arrayByAddingObjectsFromArray:]( self->_enqueuedTasks,  "arrayByAddingObjectsFromArray:",  self->_scheduledTasks));
  os_unfair_lock_unlock(p_lock);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001768D8;
  v9[3] = &unk_100647970;
  uint64_t v11 = &v12;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];
  LOBYTE(p_lock) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)p_lock;
}

- (void)nukeArchive
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray arrayByAddingObjectsFromArray:]( self->_enqueuedTasks,  "arrayByAddingObjectsFromArray:",  self->_scheduledTasks));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        -[NSMutableSet addObject:](v3, "addObject:", v9);
        -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v9);
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->_activeTasks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_scheduledTasks, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_enqueuedTasks, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v10 = v3;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)j), "cancel", (void)v16);
      }

      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v24,  16LL);
    }

    while (v12);
  }

  char v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v15 removeItemAtPath:self->_archivePath error:0];

  PDScheduledActivityRemove( self->_scheduledActivityClientIdentifier,  @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier");
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  if (objc_msgSend( a3,  "isEqualToString:",  @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier",  a4)) {
    -[PDNetworkTaskManager _activateOrScheduleEligibleTasksWithNetworkConnectivity:]( self,  "_activateOrScheduleEligibleTasksWithNetworkConnectivity:",  1LL);
  }
}

- (void)_enqueueTask:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (uint64_t)-[NSMutableArray count](self->_enqueuedTasks, "count");
  if (v6 < 1)
  {
LABEL_11:
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "New task [%@] does not interact with any enqueued tasks",  (uint8_t *)&v32,  0xCu);
    }

LABEL_14:
    -[NSMutableArray addObject:](self->_enqueuedTasks, "addObject:", v4);
  }

  else
  {
    unint64_t v7 = v6;
    do
    {
      unint64_t v8 = v7 - 1;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v7 - 1));
      else {
        id v11 = 0LL;
      }

      if (v7 < 2) {
        break;
      }
      --v7;
    }

    while (!v11);
    switch((unint64_t)v11)
    {
      case 1uLL:
        uint64_t v22 = PKLogFacilityTypeGetObject(2LL);
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
          int v32 = 138412546;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "New task [%@] supplants enqueued task [%@]",  (uint8_t *)&v32,  0x16u);
        }

        -[NSMutableArray replaceObjectAtIndex:withObject:]( self->_enqueuedTasks,  "replaceObjectAtIndex:withObject:",  v8,  v4);
        goto LABEL_31;
      case 2uLL:
      case 3uLL:
        uint64_t v12 = PKLogFacilityTypeGetObject(2LL);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
        int v32 = 138412546;
        id v33 = v4;
        __int16 v34 = 2112;
        v35 = v14;
        char v15 = "New task [%@] coalesces with enqueued task [%@]";
        break;
      case 4uLL:
        uint64_t v18 = PKLogFacilityTypeGetObject(2LL);
        __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
          int v32 = 138412546;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "New task [%@] merges with enqueued task [%@]",  (uint8_t *)&v32,  0x16u);
        }

        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
        [v21 mergeWithNewerTask:v4];

        goto LABEL_31;
      case 5uLL:
        uint64_t v25 = PKLogFacilityTypeGetObject(2LL);
        __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
          int v32 = 138412546;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "New task [%@] enqueues behind enqueued task [%@]",  (uint8_t *)&v32,  0x16u);
        }

        goto LABEL_14;
      case 6uLL:
        uint64_t v28 = PKLogFacilityTypeGetObject(2LL);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
          int v32 = 138412546;
          id v33 = v4;
          __int16 v34 = 2112;
          v35 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "New task [%@] is enqueues in font of enqueued task [%@]",  (uint8_t *)&v32,  0x16u);
        }

        -[NSMutableArray insertObject:atIndex:](self->_enqueuedTasks, "insertObject:atIndex:", v4, v8);
        goto LABEL_31;
      case 7uLL:
        uint64_t v31 = PKLogFacilityTypeGetObject(2LL);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_enqueuedTasks, "objectAtIndex:", v8));
        int v32 = 138412546;
        id v33 = v4;
        __int16 v34 = 2112;
        v35 = v14;
        char v15 = "New task [%@] is forced to drop by enqueued task [%@]";
        break;
      default:
        goto LABEL_11;
    }

    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v32, 0x16u);

LABEL_30:
  }

- (void)_tryToDequeueTasks
{
  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v3 = -[NSMutableArray copy](self->_enqueuedTasks, "copy");
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v47 = *(void *)v57;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v56 + 1) + 8LL * (void)v6);
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        unint64_t v8 = self->_scheduledTasks;
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v52,  v65,  16LL,  lock);
        if (v9)
        {
          id v10 = v9;
          id v11 = 0LL;
          uint64_t v12 = *(void *)v53;
          while (2)
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = v11;
            do
            {
              if (*(void *)v53 != v12) {
                objc_enumerationMutation(v8);
              }
              id v11 = *(id *)(*((void *)&v52 + 1) + 8LL * (void)v13);

              if (objc_msgSend(v7, "coalescesWithTaskSubclass:", objc_opt_class(v11, v15)))
              {
                id v16 = -[NSMutableSet containsObject:](self->_activeTasks, "containsObject:", v11)
                    ? [v7 actionForActiveTask:v11]
                    : [v7 actionForInactiveTask:v11];
                id v17 = v16;
                if (v16)
                {

                  switch((unint64_t)v17)
                  {
                    case 1uLL:
                      uint64_t Object = PKLogFacilityTypeGetObject(2LL);
                      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
                      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v62 = v7;
                        __int16 v63 = 2112;
                        id v64 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] supplants scheduled task [%@]",  buf,  0x16u);
                      }

                      -[NSMutableSet addObject:](v45, "addObject:", v11);
                      -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v11);
                      -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v11);
                      goto LABEL_22;
                    case 2uLL:
                      uint64_t v23 = PKLogFacilityTypeGetObject(2LL);
                      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
                      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_38;
                      }
                      *(_DWORD *)buf = 138412546;
                      v62 = v7;
                      __int16 v63 = 2112;
                      id v64 = v11;
                      uint64_t v25 = v24;
                      __int128 v26 = "Enqueued task [%@] coalesces with scheduled task [%@]";
                      goto LABEL_37;
                    case 3uLL:
                      uint64_t v27 = PKLogFacilityTypeGetObject(2LL);
                      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v62 = v7;
                        __int16 v63 = 2112;
                        id v64 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] coalesces with and renews scheduled task [%@]",  buf,  0x16u);
                      }

                      goto LABEL_42;
                    case 4uLL:
                      uint64_t v32 = PKLogFacilityTypeGetObject(2LL);
                      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v62 = v7;
                        __int16 v63 = 2112;
                        id v64 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] merges with scheduled task [%@]",  buf,  0x16u);
                      }

                      [v11 mergeWithNewerTask:v7];
LABEL_42:
                      -[NSMutableArray removeObject:](self->_enqueuedTasks, "removeObject:", v7);
                      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      [v11 setNextStartDate:v34];

                      [v11 resetBackoff];
                      goto LABEL_43;
                    case 6uLL:
                      uint64_t v35 = PKLogFacilityTypeGetObject(2LL);
                      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v62 = v7;
                        __int16 v63 = 2112;
                        id v64 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] should precede scheduled task [%@], dequeueing ASAP",  buf,  0x16u);
                      }

                      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      [v11 setNextStartDate:v37];

                      [v11 resetBackoff];
                      goto LABEL_22;
                    case 7uLL:
                      uint64_t v31 = PKLogFacilityTypeGetObject(2LL);
                      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_38;
                      }
                      *(_DWORD *)buf = 138412546;
                      v62 = v7;
                      __int16 v63 = 2112;
                      id v64 = v11;
                      uint64_t v25 = v24;
                      __int128 v26 = "Enqueued task [%@] is forced to drop by scheduled task [%@]";
LABEL_37:
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
LABEL_38:

                      -[NSMutableArray removeObject:](self->_enqueuedTasks, "removeObject:", v7);
                      break;
                    default:
                      uint64_t v29 = PKLogFacilityTypeGetObject(2LL);
                      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v62 = v7;
                        __int16 v63 = 2112;
                        id v64 = v11;
                        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] remains enqueued behind scheduled task [%@]",  buf,  0x16u);
                      }

                      goto LABEL_43;
                  }

                  goto LABEL_43;
                }
              }

              uint64_t v13 = (char *)v13 + 1;
              uint64_t v14 = v11;
            }

            while (v10 != v13);
            id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v52,  v65,  16LL);
            if (v10) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = PKLogFacilityTypeGetObject(2LL);
        __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Enqueued task [%@] does not interact with any scheduled tasks, dequeueing",  buf,  0xCu);
        }

        id v11 = 0LL;
LABEL_22:
        [v7 setManager:self];
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v7 setNextStartDate:v20];

        [v7 resetBackoff];
        -[NSMutableArray removeObject:](self->_enqueuedTasks, "removeObject:", v7);
        -[NSMutableArray addObject:](self->_scheduledTasks, "addObject:", v7);
LABEL_43:

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v6 != v5);
      id v38 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      id v5 = v38;
    }

    while (v38);
  }

  os_unfair_lock_unlock(lock);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  v39 = v45;
  id v40 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v48,  v60,  16LL);
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(v39);
        }
        objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)i), "cancel", lock);
      }

      id v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v48,  v60,  16LL);
    }

    while (v41);
  }

  -[PDNetworkTaskManager _activateOrScheduleEligibleTasksWithNetworkConnectivity:]( self,  "_activateOrScheduleEligibleTasksWithNetworkConnectivity:",  PKNetworkConnectivityAvailable(-[PDNetworkTaskManager _archiveTasks](self, "_archiveTasks")) != 0);
}

- (void)_activateOrScheduleEligibleTasksWithNetworkConnectivity:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  scheduledTasks = self->_scheduledTasks;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_activeTasks, "allObjects"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray pk_arrayByRemovingObjectsInArray:]( scheduledTasks,  "pk_arrayByRemovingObjectsInArray:",  v7));

  os_unfair_lock_unlock(p_lock);
  PDScheduledActivityRemove( self->_scheduledActivityClientIdentifier,  @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier");
  if ([v8 count])
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v29 = v8;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v31;
      char v14 = 1;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          if (v3
            && (id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v30 + 1)
                                                                                   + 8LL * (void)i), "nextStartDate")),
                [v17 timeIntervalSinceNow],
                double v19 = v18,
                v17,
                v19 < 10.0))
          {
            -[PDNetworkTaskManager _activateTask:](self, "_activateTask:", v16);
            char v14 = 0;
          }

          else
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 nextStartDate]);
            uint64_t v21 = PKEarlierDate(v12, v20);
            uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);

            uint64_t v12 = (void *)v22;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v11);

      unint64_t v8 = v29;
      if ((v14 & 1) == 0) {
        goto LABEL_19;
      }
    }

    else
    {

      uint64_t v12 = 0LL;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v24 = PKLaterDate(v12, v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v25));
    [v26 setRequireNetworkConnectivity:1];
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Scheduling Activate Tasks Activity with a start date of: %@",  buf,  0xCu);
    }

    PDScheduledActivityRegister( self->_scheduledActivityClientIdentifier,  @"PDNetworkTaskManagerActivateEligibleTasksActivityIdentifier",  v26);
LABEL_19:
  }
}

- (void)_activateTask:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_activeTasks, "containsObject:", v4) & 1) != 0)
  {
LABEL_11:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_12;
  }

  if (![v4 isValid])
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100441CBC((uint64_t)v4, v10);
    }

    -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v4);
    -[PDNetworkTaskManager _archiveTasks](self, "_archiveTasks");
    goto LABEL_11;
  }

  if (!-[NSMutableSet count](self->_activeTasks, "count"))
  {
    -[PDNetworkTaskManager _createPowerAssertion](self, "_createPowerAssertion");
    id v5 = (OS_os_transaction *)PDOSTransactionCreate("PDNetworkTaskManager.active_tasks");
    activeTasksTransaction = self->_activeTasksTransaction;
    self->_activeTasksTransaction = v5;
  }

  uint64_t v7 = PKLogFacilityTypeGetObject(2LL);
  unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating task %@", (uint8_t *)&v11, 0xCu);
  }

  -[NSMutableSet addObject:](self->_activeTasks, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  [v4 start:1];
LABEL_12:
}

- (void)_lock_deactivateTask:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_activeTasks, "containsObject:", v4))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    activeTasksTransaction = (OS_os_transaction *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(activeTasksTransaction, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  activeTasksTransaction,  OS_LOG_TYPE_DEFAULT,  "Deactivating task %@",  (uint8_t *)&v17,  0xCu);
    }

    -[NSMutableSet removeObject:](self->_activeTasks, "removeObject:", v4);
    id v7 = -[NSMutableSet count](self->_activeTasks, "count");
    BOOL v8 = os_log_type_enabled(activeTasksTransaction, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        id v10 = (objc_class *)objc_opt_class(self, v9);
        int v11 = NSStringFromClass(v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        activeTasks = self->_activeTasks;
        int v17 = 138543874;
        id v18 = v12;
        __int16 v19 = 2048;
        __int128 v20 = self;
        __int16 v21 = 2112;
        uint64_t v22 = activeTasks;
        _os_log_impl( (void *)&_mh_execute_header,  activeTasksTransaction,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p: remaining active tasks: %@",  (uint8_t *)&v17,  0x20u);
      }
    }

    else
    {
      if (v8)
      {
        char v14 = (objc_class *)objc_opt_class(self, v9);
        uint64_t v15 = NSStringFromClass(v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        int v17 = 138543618;
        id v18 = v16;
        __int16 v19 = 2048;
        __int128 v20 = self;
        _os_log_impl( (void *)&_mh_execute_header,  activeTasksTransaction,  OS_LOG_TYPE_DEFAULT,  "No tasks remain in %{public}@ %p",  (uint8_t *)&v17,  0x16u);
      }

      -[PDNetworkTaskManager _releasePowerAssertion](self, "_releasePowerAssertion");
      activeTasksTransaction = self->_activeTasksTransaction;
      self->_activeTasksTransaction = 0LL;
    }
  }
}

- (void)_createPowerAssertion
{
  IOPMAssertionID AssertionID = 0;
  v22[0] = @"AssertType";
  v22[1] = @"AssertLevel";
  v23[0] = @"NetworkClientActive";
  v23[1] = &off_1006900C8;
  powerAssertionName = self->_powerAssertionName;
  v22[2] = @"AssertName";
  v22[3] = @"TimeoutSeconds";
  v23[2] = powerAssertionName;
  v23[3] = &off_1006900E0;
  id v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
  if (!IOPMAssertionCreateWithProperties(v4, &AssertionID))
  {
    self->_unsigned int powerAssertionIdentifier = AssertionID;
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = (objc_class *)objc_opt_class(self, v7);
      uint64_t v9 = NSStringFromClass(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = self->_powerAssertionName;
      unsigned int powerAssertionIdentifier = self->_powerAssertionIdentifier;
      *(_DWORD *)buf = 138544130;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      int v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = powerAssertionIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p: Created power assertion: %@ (%d)",  buf,  0x26u);
    }
  }
}

- (void)_releasePowerAssertion
{
  if (self->_powerAssertionIdentifier)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(2LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class(self, v5);
      uint64_t v7 = NSStringFromClass(v6);
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      powerAssertionName = self->_powerAssertionName;
      unsigned int powerAssertionIdentifier = self->_powerAssertionIdentifier;
      int v11 = 138544130;
      id v12 = v8;
      __int16 v13 = 2048;
      char v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = powerAssertionName;
      __int16 v17 = 1024;
      unsigned int v18 = powerAssertionIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p: Released power assertion: %@ (%d)",  (uint8_t *)&v11,  0x26u);
    }

    IOPMAssertionRelease(self->_powerAssertionIdentifier);
    self->_unsigned int powerAssertionIdentifier = 0;
  }

- (void)_archiveTasks
{
  if (!self->_archivePending)
  {
    BOOL v3 = (void *)PDOSTransactionCreate("PDNetworkTaskManager");
    dispatch_time_t v4 = dispatch_time(0LL, 5000000000LL);
    id v5 = PDDefaultQueue();
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100178050;
    v8[3] = &unk_1006392B0;
    id v9 = v3;
    id v10 = self;
    id v7 = v3;
    dispatch_after(v4, v6, v8);

    self->_archivePending = 1;
  }

- (void)_unarchiveTasks
{
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  dispatch_time_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unarchiving tasks...", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  self->_archivePath));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    __int128 v52 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v49 = 0u;
    uint64_t v42 = v5;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 PKArrayForKey:@"scheduled"]);
    id v9 = [v8 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    id v11 = v9;
    uint64_t v12 = *(void *)v50;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v10);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___PDNetworkTask, v16);
          id v48 = 0LL;
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v17,  v14,  &v48,  lock));
          __int16 v19 = (os_log_s *)v48;
          if (v18)
          {
            [v18 setManager:self];
            -[NSMutableArray addObject:](self->_scheduledTasks, "addObject:", v18);
            if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 nextStartDate]);
              *(_DWORD *)buf = 138412546;
              __int128 v55 = (os_log_s *)v18;
              __int16 v56 = 2112;
              __int128 v57 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "     --> scheduled task: %@ (%@)",  buf,  0x16u);
            }

            goto LABEL_17;
          }
        }

        else
        {
          __int16 v19 = 0LL;
        }

        uint64_t v21 = PKLogFacilityTypeGetObject(0LL);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v55 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "PDNetworkTaskmanager: error occurred while trying to unarchive scheduled task. The data will be discarded. %@.",  buf,  0xCu);
        }

- (void)task:(id)a3 gotResult:(id)a4
{
}

- (void)taskSucceeded:(id)a3
{
  delegate = self->_delegate;
  id v5 = a3;
  -[PDNetworkTaskDelegate taskSucceeded:](delegate, "taskSucceeded:", v5);
  os_unfair_lock_lock(&self->_lock);
  -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v5);
  -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v5);

  os_unfair_lock_unlock(&self->_lock);
  -[PDNetworkTaskManager _tryToDequeueTasks](self, "_tryToDequeueTasks");
}

- (void)taskFailed:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v4);
  os_unfair_lock_unlock(&self->_lock);
  if ([v4 backoffComplete])
  {
    -[PDNetworkTaskDelegate taskFailed:](self->_delegate, "taskFailed:", v4);
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    [v4 nextBackoffInterval];
    double v6 = v5;
    [v4 incrementBackoff];
    -[PDNetworkTaskDelegate task:willRetryAfterMinimumDelay:]( self->_delegate,  "task:willRetryAfterMinimumDelay:",  v4,  v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:v6]);
    [v4 setNextStartDate:v8];
  }

  id v9 = PDDefaultQueue();
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100178B28;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async(v10, block);
}

- (void)taskFailedForAuthentication:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[PDNetworkTaskManager _lock_deactivateTask:](self, "_lock_deactivateTask:", v4);
  -[NSMutableArray removeObject:](self->_scheduledTasks, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  -[PDNetworkTaskDelegate taskFailed:](self->_delegate, "taskFailed:", v4);
  if ([v4 canRequestReauthentication]
    && (objc_opt_respondsToSelector(self->_delegate, "taskRequestedReauthentication:") & 1) != 0)
  {
    -[PDNetworkTaskDelegate taskRequestedReauthentication:](self->_delegate, "taskRequestedReauthentication:", v4);
  }

  [v4 setCanRequestReauthentication:0];
  id v5 = PDDefaultQueue();
  double v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100178C20;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)task:(id)a3 encounteredError:(id)a4
{
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

- (void).cxx_destruct
{
}

@end