@interface _DASActivityDependencyManager
+ (_DASActivityDependencyManager)sharedInstance;
- (BOOL)areDependenciesSatisfiedFor:(id)a3;
- (BOOL)isDependentActivity:(id)a3;
- (BOOL)reportActivity:(id)a3 consumedResults:(id)a4 error:(id *)a5;
- (BOOL)reportActivity:(id)a3 producedResults:(id)a4 error:(id *)a5;
- (BOOL)resetDependenciesForIdentifier:(id)a3 byActivity:(id)a4 error:(id *)a5;
- (BOOL)shouldMonitorDependenciesForActivity:(id)a3;
- (NSMutableDictionary)dependencyGroups;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASActivityDependencyManager)init;
- (id)dastool_queryStatusOfResultIdentifier:(id)a3;
- (id)queue_checkedCompletionDependencyGroupForIdentifier:(id)a3;
- (id)queue_checkedResultDependencyGroupForIdentifier:(id)a3;
- (id)queue_dependencyGroup:(id)a3;
- (id)queue_dependencyGroupCreateIfDoesNotExist:(id)a3;
- (void)addActivityToDependencyGroups:(id)a3;
- (void)beginDependencyMonitoringForActivity:(id)a3;
- (void)dastool_forceResetOfResultIdentifier:(id)a3;
- (void)endDependencyMonitoringForActivity:(id)a3;
- (void)refreshGroupsWithFileProtection:(id)a3;
- (void)removeActivityFromDependencyGroups:(id)a3;
- (void)reportActivityDidFinishRunning:(id)a3;
- (void)resetFastPassDependencies;
- (void)resetFastPassDependenciesForActivity:(id)a3;
- (void)setDependencyGroups:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASActivityDependencyManager

+ (_DASActivityDependencyManager)sharedInstance
{
  if (qword_100157A70 != -1) {
    dispatch_once(&qword_100157A70, &stru_100116140);
  }
  return (_DASActivityDependencyManager *)(id)qword_100157A78;
}

- (_DASActivityDependencyManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASActivityDependencyManager;
  v2 = -[_DASActivityDependencyManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    dependencyGroups = v2->_dependencyGroups;
    v2->_dependencyGroups = (NSMutableDictionary *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.DependencyManager", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.duetactivityscheduler", "DependencyManager");
    log = v2->_log;
    v2->_log = v9;
  }

  return v2;
}

- (void)refreshGroupsWithFileProtection:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000516A0;
  block[3] = &unk_100115148;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)beginDependencyMonitoringForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:]( self,  "shouldMonitorDependenciesForActivity:",  v4);
  log = self->_log;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Beginning dependencies monitoring for %@",  (uint8_t *)&v7,  0xCu);
    }

    -[_DASActivityDependencyManager addActivityToDependencyGroups:](self, "addActivityToDependencyGroups:", v4);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B47AC();
  }
}

- (void)addActivityToDependencyGroups:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051AD4;
  block[3] = &unk_100115148;
  id v8 = v4;
  os_log_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)endDependencyMonitoringForActivity:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = -[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:]( self,  "shouldMonitorDependenciesForActivity:",  v4);
  BOOL v6 = os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v6) {
      sub_1000B480C();
    }
    -[_DASActivityDependencyManager removeActivityFromDependencyGroups:]( self,  "removeActivityFromDependencyGroups:",  v4);
  }

  else if (v6)
  {
    sub_1000B486C();
  }
}

- (void)removeActivityFromDependencyGroups:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100051E58;
  block[3] = &unk_100115148;
  id v8 = v4;
  os_log_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (BOOL)reportActivity:(id)a3 consumedResults:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 1;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_1000523D4;
  v26 = sub_1000523E4;
  id v27 = 0LL;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:consumedResults:error:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: %@ reporting result consumption: %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000523EC;
  block[3] = &unk_100116190;
  id v12 = v9;
  id v17 = v12;
  v20 = &v22;
  id v13 = v8;
  v21 = &v28;
  id v18 = v13;
  v19 = self;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B48CC();
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    if (a5) {
LABEL_7:
    }
      *a5 = (id) v23[5];
  }

- (BOOL)reportActivity:(id)a3 producedResults:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  char v31 = 1;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_1000523D4;
  v26 = sub_1000523E4;
  id v27 = 0LL;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[_DASActivityDependencyManager reportActivity:producedResults:error:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: %@ reporting result production: %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100052AB4;
  block[3] = &unk_100116190;
  id v12 = v9;
  id v17 = v12;
  v20 = &v22;
  id v13 = v8;
  v21 = &v28;
  id v18 = v13;
  v19 = self;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v29 + 24) || v23[5])
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B49CC();
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }

    if (a5) {
LABEL_7:
    }
      *a5 = (id) v23[5];
  }

- (void)reportActivityDidFinishRunning:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityDependencyManager shouldMonitorDependenciesForActivity:]( self,  "shouldMonitorDependenciesForActivity:",  v4))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100052F30;
    v6[3] = &unk_100115148;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(queue, v6);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B4ACC();
  }
}

- (BOOL)areDependenciesSatisfiedFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 dependencies]);
  if (v5
    && (id v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dependencies]),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    if (![v4 dependenciesPreCleared])
    {
      uint64_t v16 = 0LL;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000LL;
      char v19 = 0;
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000532A0;
      block[3] = &unk_1001152D8;
      id v13 = v4;
      char v14 = self;
      v15 = &v16;
      dispatch_sync(queue, block);
      BOOL v9 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
      goto LABEL_9;
    }

    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B4C24();
    }
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B4BB8();
  }

  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)resetDependenciesForIdentifier:(id)a3 byActivity:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "-[_DASActivityDependencyManager resetDependenciesForIdentifier:byActivity:error:]";
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: %@ resetting result production: %@",  buf,  0x20u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000536F0;
  v13[3] = &unk_100115148;
  v13[4] = self;
  id v14 = v7;
  id v11 = v7;
  dispatch_sync(queue, v13);

  return 1;
}

- (BOOL)isDependentActivity:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dependencies]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)resetFastPassDependencies
{
  id v2 = [(id)objc_opt_class(_DASBGSystemTask) allFastPassIdentifiers];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7);
        [(id)objc_opt_class(_DASActivityCompletionDependencyGroup) resetDependenciesContainingSubstring:v8];
        [(id)objc_opt_class(_DASActivityResultDependencyGroup) resetDependenciesContainingSubstring:v8];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (void)resetFastPassDependenciesForActivity:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class(_DASBGSystemTask) allFastPassIdentifiers];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v3 containsString:v10])
        {
          [(id)objc_opt_class(_DASActivityCompletionDependencyGroup) resetDependenciesContainingSubstring:v10];
          [(id)objc_opt_class(_DASActivityResultDependencyGroup) resetDependenciesContainingSubstring:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (id)queue_dependencyGroupCreateIfDoesNotExist:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dependencyGroups = self->_dependencyGroups;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](dependencyGroups, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    else {
      uint64_t v8 = &OBJC_CLASS____DASActivityResultDependencyGroup;
    }
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class groupFromPersistence:](v8, "groupFromPersistence:", v9));

    uint64_t v10 = self->_dependencyGroups;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, v11);
  }

  return v7;
}

- (id)queue_checkedResultDependencyGroupForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dependencyGroups,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityResultDependencyGroup groupFromPersistence:]( &OBJC_CLASS____DASActivityResultDependencyGroup,  "groupFromPersistence:",  v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dependencyGroups, "setObject:forKeyedSubscript:", v5, v4);
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS____DASActivityResultDependencyGroup);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (id)queue_checkedCompletionDependencyGroupForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dependencyGroups,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityCompletionDependencyGroup groupFromPersistence:]( &OBJC_CLASS____DASActivityCompletionDependencyGroup,  "groupFromPersistence:",  v4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dependencyGroups, "setObject:forKeyedSubscript:", v5, v4);
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS____DASActivityCompletionDependencyGroup);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    id v7 = v5;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)shouldMonitorDependenciesForActivity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dependencies]);
  if ([v4 count])
  {
    BOOL v5 = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 producedResultIdentifiers]);
    BOOL v5 = [v6 count] != 0;
  }

  return v5;
}

- (NSMutableDictionary)dependencyGroups
{
  return self->_dependencyGroups;
}

- (void)setDependencyGroups:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)queue_dependencyGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dependencyGroups,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityResultDependencyGroup groupFromDefaultsWithoutCreation:]( &OBJC_CLASS____DASActivityResultDependencyGroup,  "groupFromDefaultsWithoutCreation:",  v4));
    if (!v5) {
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityCompletionDependencyGroup groupFromPersistenceWithoutCreation:]( &OBJC_CLASS____DASActivityCompletionDependencyGroup,  "groupFromPersistenceWithoutCreation:",  v4));
    }
  }

  id v6 = v5;

  return v6;
}

- (void)dastool_forceResetOfResultIdentifier:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v11 = "-[_DASActivityDependencyManager(Dastool) dastool_forceResetOfResultIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: resetting result production/consumption on behalf of dastool: %@",  buf,  0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100053E60;
  v8[3] = &unk_100115148;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

- (id)dastool_queryStatusOfResultIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000523D4;
  uint64_t v16 = sub_1000523E4;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053F68;
  block[3] = &unk_1001152D8;
  void block[4] = self;
  id v10 = v4;
  __int128 v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

@end