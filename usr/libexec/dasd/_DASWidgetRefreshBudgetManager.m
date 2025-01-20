@interface _DASWidgetRefreshBudgetManager
+ (id)budgetNameFromWidgetBudgetID:(id)a3;
+ (id)sharedInstance;
+ (id)widgetBudgetIDFromBudgetName:(id)a3;
- (BOOL)managesBudgetWithName:(id)a3;
- (NSMutableDictionary)managedBudgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASBudgetModulator)widgetBudgetModulator;
- (_DASDataProtectionStateMonitor)lockStateMonitor;
- (_DASDefaultsBudgetPersistence)defaultsPersistence;
- (_DASWidgetRefreshBudgetManager)init;
- (_DASWidgetRefreshUsageTracker)widgetRefreshUsageTracker;
- (double)balanceForBudgetWithName:(id)a3;
- (double)balanceForWidgetBudgetID:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)locked_instantiateBudgetsInto:(id)a3 withRemovals:(id)a4;
- (id)requiredBudgetsInfo;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)locked_reinstantiateConfiguredBudgets;
- (void)reinstantiateConfiguredBudgets;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)resetBudgets;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setContext:(id)a3;
- (void)setDefaultsPersistence:(id)a3;
- (void)setLockStateMonitor:(id)a3;
- (void)setLog:(id)a3;
- (void)setManagedBudgets:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWidgetBudgetModulator:(id)a3;
- (void)setWidgetRefreshUsageTracker:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASWidgetRefreshBudgetManager

- (_DASWidgetRefreshBudgetManager)init
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudgetManager;
  id v2 = -[_DASWidgetRefreshBudgetManager init](&v39, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "widgetBudgetManager");
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.dasd.widgetBudgetManagement", v8);
    v10 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    v12 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[_DASDefaultsBudgetPersistence persistence](&OBJC_CLASS____DASDefaultsBudgetPersistence, "persistence"));
    v14 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshUsageTracker sharedInstance]( &OBJC_CLASS____DASWidgetRefreshUsageTracker,  "sharedInstance"));
    v16 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v18 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v17;

    uint64_t v19 = *((void *)v2 + 5);
    uint64_t v20 = *((void *)v2 + 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[_DASBudgetModulator modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:]( &OBJC_CLASS____DASBudgetModulator,  "modulatorForBudgetTypes:withBudgets:persistence:withQueue:withStore:",  @"Widgets",  0LL,  v19,  v20,  v21));
    v23 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v22;

    v24 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v2 + 8));
    dispatch_time_t v25 = dispatch_walltime(0LL, 0LL);
    dispatch_source_set_timer(v24, v25, 0x4E94914F0000uLL, 0x8BB2C97000uLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001EB70;
    block[3] = &unk_1001150D0;
    v26 = (id *)v2;
    v38 = v26;
    dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v24, v27);

    dispatch_activate(v24);
    v28 = objc_opt_new(&OBJC_CLASS____DASDataProtectionStateMonitor);
    id v29 = v26[7];
    v26[7] = v28;

    if (([v26[7] unnotifiedIsDataAvailableForClassC] & 1) == 0)
    {
      objc_initWeak(&location, v26);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10001EB78;
      v34[3] = &unk_100115008;
      objc_copyWeak(&v35, &location);
      [v26[7] setChangeHandler:v34];
      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }

    v30 = (dispatch_queue_s *)*((void *)v2 + 8);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10001ED24;
    v32[3] = &unk_1001150D0;
    v33 = v26;
    dispatch_async(v30, v32);
  }

  return (_DASWidgetRefreshBudgetManager *)v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001EDE8;
  block[3] = &unk_100114FE0;
  void block[4] = a1;
  if (qword_1001575B8 != -1) {
    dispatch_once(&qword_1001575B8, block);
  }
  return (id)qword_1001575C0;
}

+ (id)budgetNameFromWidgetBudgetID:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"com.apple.dasd.widget",  a3);
}

+ (id)widgetBudgetIDFromBudgetName:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "substringFromIndex:",  (char *)objc_msgSend(@"com.apple.dasd.widget", "length") + 1));

  return v4;
}

- (BOOL)managesBudgetWithName:(id)a3
{
  return [a3 hasPrefix:@"com.apple.dasd.widget"];
}

- (id)allBudgets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  queue = (dispatch_queue_s *)self->_queue;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10001EF38;
  uint64_t v11 = &unk_100115148;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(queue, &v8);
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)reinstantiateConfiguredBudgets
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F144;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)locked_reinstantiateConfiguredBudgets
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager managedBudgets](self, "managedBudgets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_DASWidgetRefreshBudgetManager locked_instantiateBudgetsInto:withRemovals:]( self,  "locked_instantiateBudgetsInto:withRemovals:",  v3,  v5));

  if ([v4 count] || objc_msgSend(v5, "count")) {
    -[_DASBudgetModulator locked_updateBudgetsToBeModulatedAdditions:removals:]( self->_widgetBudgetModulator,  "locked_updateBudgetsToBeModulatedAdditions:removals:",  v4,  v5);
  }
}

- (id)locked_instantiateBudgetsInto:(id)a3 withRemovals:(id)a4
{
  id v6 = a3;
  id v117 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager widgetRefreshUsageTracker](self, "widgetRefreshUsageTracker"));
  [v7 invalidateComputedBudgetCache];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1EC8(log, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetManager requiredBudgetsInfo](self, "requiredBudgetsInfo"));
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "requiredInfo", buf, 2u);
    v150[0] = _NSConcreteStackBlock;
    v150[1] = 3221225472LL;
    v150[2] = sub_10001FFF4;
    v150[3] = &unk_100115070;
    v150[4] = self;
    [v16 enumerateKeysAndObjectsUsingBlock:v150];
  }

  v124 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
  defaultsPersistence = self->_defaultsPersistence;
  v116 = v16;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[_DASDefaultsBudgetPersistence loadBudgetsWithExpectedNames:]( defaultsPersistence,  "loadBudgetsWithExpectedNames:",  v20));

  uint64_t v22 = self->_log;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v153 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Stored: %@", buf, 0xCu);
  }

  v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v146 = 0u;
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  __int128 v149 = 0u;
  id v24 = v21;
  id v25 = [v24 countByEnumeratingWithState:&v146 objects:v160 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v147;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v147 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v146 + 1) + 8LL * (void)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 name]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v29, v30);
      }

      id v26 = [v24 countByEnumeratingWithState:&v146 objects:v160 count:16];
    }

    while (v26);
  }

  v122 = v23;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v23, "allKeys"));
  context = self->_context;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  kDASWidgetOverrideKeyPath));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v33));

  id v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "override list:", buf, 2u);
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472LL;
    v145[2] = sub_100020060;
    v145[3] = &unk_1001154C0;
    v145[4] = self;
    [v34 enumerateObjectsUsingBlock:v145];
  }

  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v143 = 0u;
  __int128 v144 = 0u;
  id v37 = v34;
  id v38 = [v37 countByEnumeratingWithState:&v141 objects:v159 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v142;
    do
    {
      for (j = 0LL; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v142 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "budgetNameFromWidgetBudgetID:",  *(void *)(*((void *)&v141 + 1) + 8LL * (void)j)));
        -[NSMutableArray addObject:](v36, "addObject:", v42);
      }

      id v39 = [v37 countByEnumeratingWithState:&v141 objects:v159 count:16];
    }

    while (v39);
  }

  v114 = v37;
  v115 = v24;

  v43 = self->_log;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1E98(v43, v44, v45, v46, v47, v48, v49, v50);
  }
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  id obj = v31;
  id v51 = [obj countByEnumeratingWithState:&v137 objects:v158 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v138;
    do
    {
      for (k = 0LL; k != v52; k = (char *)k + 1)
      {
        if (*(void *)v138 != v53) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v137 + 1) + 8LL * (void)k);
        v56 = self->_log;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v55;
          _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        if ((-[NSMutableArray containsObject:](v36, "containsObject:", v55) & 1) == 0
          && ([v124 containsObject:v55] & 1) == 0)
        {
          -[NSMutableDictionary removeObjectForKey:](v122, "removeObjectForKey:", v55);
          v57 = self->_log;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v55;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEBUG,  "Purged inactive widget budget %@ from stored budgets",  buf,  0xCu);
          }
        }
      }

      id v52 = [obj countByEnumeratingWithState:&v137 objects:v158 count:16];
    }

    while (v52);
  }

  v58 = self->_log;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1E68(v58, v59, v60, v61, v62, v63, v64, v65);
  }
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  id v118 = (id)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  id v66 = [v118 countByEnumeratingWithState:&v133 objects:v157 count:16];
  if (v66)
  {
    id v67 = v66;
    uint64_t v68 = *(void *)v134;
    do
    {
      for (m = 0LL; m != v67; m = (char *)m + 1)
      {
        if (*(void *)v134 != v68) {
          objc_enumerationMutation(v118);
        }
        v70 = *(void **)(*((void *)&v133 + 1) + 8LL * (void)m);
        v71 = self->_log;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v153 = v70;
          _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        if ((-[NSMutableArray containsObject:](v36, "containsObject:", v70) & 1) == 0
          && ([v124 containsObject:v70] & 1) == 0)
        {
          uint64_t v72 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v70]);
          v73 = (void *)v72;
          if (v117 && v72) {
            [v117 addObject:v72];
          }
          [v6 removeObjectForKey:v70];
          v74 = self->_log;
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v153 = v70;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEBUG,  "Purged inactive widget budget %@ from managed budgets",  buf,  0xCu);
          }
        }
      }

      id v67 = [v118 countByEnumeratingWithState:&v133 objects:v157 count:16];
    }

    while (v67);
  }

  v123 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v129 = 0u;
  __int128 v130 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  id v119 = (id)objc_claimAutoreleasedReturnValue([v116 allKeys]);
  id v75 = [v119 countByEnumeratingWithState:&v129 objects:v156 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v130;
    do
    {
      for (n = 0LL; n != v76; n = (char *)n + 1)
      {
        if (*(void *)v130 != v77) {
          objc_enumerationMutation(v119);
        }
        v79 = *(void **)(*((void *)&v129 + 1) + 8LL * (void)n);
        v80 = (void *)objc_claimAutoreleasedReturnValue([v116 objectForKeyedSubscript:v79]);
        [v80 doubleValue];
        double v82 = v81;

        v83 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v79]);
        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v79]);
          [v84 capacity];
          if (v85 != v82)
          {
            v86 = self->_log;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              v153 = v84;
              __int16 v154 = 2048;
              double v155 = v82;
              _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_INFO,  "budget %{public}@ updating capacity to %f",  buf,  0x16u);
            }

            [v84 setCapacity:v82];
            [v84 setAllocationType:4];
          }
        }

        else
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v122, "objectForKeyedSubscript:", v79));

          if (v87)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v122, "objectForKeyedSubscript:", v79));
            [v84 capacity];
            if (v88 == v82)
            {
              v96 = self->_log;
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v153 = v84;
                v90 = v96;
                v91 = "Loaded: %{public}@";
                uint32_t v92 = 12;
LABEL_79:
                _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, v91, buf, v92);
              }
            }

            else
            {
              [v84 setCapacity:v82];
              v89 = self->_log;
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v153 = v84;
                __int16 v154 = 2048;
                double v155 = v82;
                v90 = v89;
                v91 = "Updated: %{public}@, Capacity=%f";
                uint32_t v92 = 22;
                goto LABEL_79;
              }
            }

            [v84 setAllocationType:4];
            [v6 setObject:v84 forKeyedSubscript:v79];
            -[NSMutableArray addObject:](v123, "addObject:", v84);
            goto LABEL_81;
          }

          v84 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager widgetBudgetIDFromBudgetName:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "widgetBudgetIDFromBudgetName:",  v79));
          if (!v84)
          {
            v93 = self->_log;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v153 = v79;
              _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "Somehow couldn't find widget for budget: %@",  buf,  0xCu);
            }
          }

          v94 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudget budgetWithName:widgetBudgetID:capacity:balance:allocationType:]( &OBJC_CLASS____DASWidgetRefreshBudget,  "budgetWithName:widgetBudgetID:capacity:balance:allocationType:",  v79,  v84,  4LL,  v82,  0.0));
          [v6 setObject:v94 forKeyedSubscript:v79];
          -[NSMutableArray addObject:](v123, "addObject:", v94);
          v95 = self->_log;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v153 = v94;
            _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_INFO,  "budget %{public}@ init - newly created",  buf,  0xCu);
          }
        }

- (void)resetBudgets
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020108;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (id)requiredBudgetsInfo
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[_DASWidgetRefreshUsageTracker dailyBudgetsForAllWidgets]( self->_widgetRefreshUsageTracker,  "dailyBudgetsForAllWidgets"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "budgetNameFromWidgetBudgetID:",  v10));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v11);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000203CC;
  block[3] = &unk_1001154E8;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)capacityForBudgetWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000204DC;
  block[3] = &unk_1001154E8;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)balanceForWidgetBudgetID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000205EC;
  block[3] = &unk_1001152D8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020714;
  block[3] = &unk_100115510;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002090C;
  block[3] = &unk_100115510;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020B18;
  block[3] = &unk_100115510;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (void)updateBudget:(id)a3
{
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v4 = a3;
  -[_DASWidgetRefreshUsageTracker stopTrackingActivity:](self->_widgetRefreshUsageTracker, "stopTrackingActivity:", v4);
  if (v5 > 0.0)
  {
    double v6 = v5;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = log;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetBudgetID]);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      double v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Attempting to decrement widget refresh budget for  %{public}@ by %lf",  (uint8_t *)&v12,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetBudgetID]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "budgetNameFromWidgetBudgetID:",  v10));
    -[_DASWidgetRefreshBudgetManager decrementBy:forBudgetWithName:](self, "decrementBy:forBudgetWithName:", v11, v6);
  }
}

- (void)reportActivityRunning:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020E44;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSMutableDictionary)managedBudgets
{
  return self->_managedBudgets;
}

- (void)setManagedBudgets:(id)a3
{
}

- (_DASBudgetModulator)widgetBudgetModulator
{
  return self->_widgetBudgetModulator;
}

- (void)setWidgetBudgetModulator:(id)a3
{
}

- (_DASDefaultsBudgetPersistence)defaultsPersistence
{
  return self->_defaultsPersistence;
}

- (void)setDefaultsPersistence:(id)a3
{
}

- (_DASWidgetRefreshUsageTracker)widgetRefreshUsageTracker
{
  return self->_widgetRefreshUsageTracker;
}

- (void)setWidgetRefreshUsageTracker:(id)a3
{
}

- (_DASDataProtectionStateMonitor)lockStateMonitor
{
  return self->_lockStateMonitor;
}

- (void)setLockStateMonitor:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end