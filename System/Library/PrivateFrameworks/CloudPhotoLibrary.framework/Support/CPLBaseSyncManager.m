@interface CPLBaseSyncManager
- (BOOL)_shouldShowIndicator;
- (CPLBaseSyncManager)initWithAbstractObject:(id)a3;
- (int64_t)_baseProgressForState:(unint64_t)a3 totalUnits:(int64_t *)a4;
- (void)_actuallyStartShowingIndicatorLocked;
- (void)_actuallyStopShowingIndicatorLocked;
- (void)_emitActivityStateLog;
- (void)_startShowingIndicator:(id)a3;
- (void)_stopShowingIndicator:(id)a3;
- (void)_updateOverridingForeground;
- (void)didFinishSyncSession;
- (void)didMoveToState:(unint64_t)a3;
- (void)didProgress:(float)a3 userInfo:(id)a4 forState:(unint64_t)a5;
- (void)prepareForClose;
- (void)setSyncSessionShouldBeForeground:(BOOL)a3;
- (void)syncSessionDidFailWithError:(id)a3;
- (void)syncSessionDidSucceed;
- (void)willStartSyncSession;
@end

@implementation CPLBaseSyncManager

- (CPLBaseSyncManager)initWithAbstractObject:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CPLBaseSyncManager;
  v3 = -[CPLBaseSyncManager initWithAbstractObject:](&v12, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = CPLCopyDefaultSerialQueueAttributes(v3);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cpl.syncindicator", v6);
    indicatorQueue = v4->_indicatorQueue;
    v4->_indicatorQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    activities = v4->_activities;
    v4->_activities = v9;

    v4->_currentState = 14LL;
  }

  return v4;
}

- (void)_updateOverridingForeground
{
  if (self->_closed || !self->_foreground || self->_currentState - 1 > 0xB)
  {
    if (self->_overridingForeground)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseSyncManager abstractObject](self, "abstractObject"));
      v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineLibrary]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemMonitor]);
      [v5 stopOverridingSystemBudgets:8 reason:2];

      self->_overridingForeground = 0;
    }
  }

  else if (!self->_overridingForeground)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseSyncManager abstractObject](self, "abstractObject"));
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemMonitor]);
    [v8 startOverridingSystemBudgets:8 reason:2];

    self->_overridingForeground = 1;
  }

- (BOOL)_shouldShowIndicator
{
  return 1;
}

- (void)_actuallyStartShowingIndicatorLocked
{
  if (self->_startShowingIndicatorTime == 0.0
    && -[CPLBaseSyncManager _shouldShowIndicator](self, "_shouldShowIndicator"))
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_100151E20();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v5 = 138412290;
        v6 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "%@ start showing sync indicator",  (uint8_t *)&v5,  0xCu);
      }
    }

    +[CPLSyncIndicator showSyncIndicator](&OBJC_CLASS___CPLSyncIndicator, "showSyncIndicator");
    self->_startShowingIndicatorTime = CFAbsoluteTimeGetCurrent();
  }

  ++self->_indicatorAge;
}

- (void)_actuallyStopShowingIndicatorLocked
{
  if (self->_startShowingIndicatorTime != 0.0)
  {
    double v3 = CFAbsoluteTimeGetCurrent() - self->_startShowingIndicatorTime;
    if (v3 >= 1.0)
    {
      self->_startShowingIndicatorTime = 0.0;
      if (!_CPLSilentLogging)
      {
        id v7 = sub_100151E20();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v11 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ stop showing sync indicator", buf, 0xCu);
        }
      }

      +[CPLSyncIndicator hideSyncIndicator](&OBJC_CLASS___CPLSyncIndicator, "hideSyncIndicator");
    }

    else
    {
      unint64_t indicatorAge = self->_indicatorAge;
      dispatch_time_t v5 = dispatch_walltime(0LL, (uint64_t)((1.0 - v3) * 1000000000.0));
      indicatorQueue = self->_indicatorQueue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100151FBC;
      v9[3] = &unk_10023DC98;
      v9[4] = self;
      v9[5] = indicatorAge;
      dispatch_after(v5, (dispatch_queue_t)indicatorQueue, v9);
    }
  }

- (void)_emitActivityStateLog
{
  if (-[NSCountedSet count](self->_activities, "count"))
  {
    if (_CPLSilentLogging) {
      return;
    }
    id v3 = sub_100151E20();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCountedSet allObjects](self->_activities, "allObjects"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", @", "));
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Showing sync indicator for %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  else
  {
    if (_CPLSilentLogging) {
      return;
    }
    id v7 = sub_100151E20();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "No current activity. Not showing sync indicator.",  (uint8_t *)&v8,  2u);
    }
  }
}

- (void)_startShowingIndicator:(id)a3
{
  id v4 = a3;
  indicatorQueue = self->_indicatorQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001522D4;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153514;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = indicatorQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_stopShowingIndicator:(id)a3
{
  id v5 = a3;
  indicatorQueue = self->_indicatorQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100152418;
  v11[3] = &unk_10023EFC8;
  v11[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100153514;
  block[3] = &unk_10023DBC8;
  id v15 = v7;
  id v8 = indicatorQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)setSyncSessionShouldBeForeground:(BOOL)a3
{
  self->_foreground = a3;
  -[_CPLProgress setForeground:](self->_progress, "setForeground:");
  -[CPLBaseSyncManager _updateOverridingForeground](self, "_updateOverridingForeground");
}

- (void)willStartSyncSession
{
  if (!self->_closed && !self->_didStartSyncSession)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10015278C();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        if (self->_foreground) {
          id v5 = " (foreground)";
        }
        else {
          id v5 = "";
        }
        int v18 = 136315138;
        v19 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Sync session is starting%s",  (uint8_t *)&v18,  0xCu);
      }
    }

    -[CPLBaseSyncManager _startShowingIndicator:](self, "_startShowingIndicator:", @"sync session");
    -[CPLBaseSyncManager beginClientWork:](self, "beginClientWork:", @"sync session");
    progress = self->_progress;
    if (progress)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_10015278C();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Previous progress has not been unpublished",  (uint8_t *)&v18,  2u);
        }

        progress = self->_progress;
      }

      -[_CPLProgress unpublish](progress, "unpublish");
      id v9 = self->_progress;
      self->_progress = 0LL;
    }

    dispatch_block_t v10 = objc_alloc(&OBJC_CLASS____CPLProgress);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseSyncManager abstractObject](self, "abstractObject"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 engineLibrary]);
    SEL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 libraryIdentifier]);
    v14 = -[_CPLProgress initWithIdentifier:firstSyncOfMainLibrary:]( v10,  "initWithIdentifier:firstSyncOfMainLibrary:",  v13,  0LL);
    id v15 = self->_progress;
    self->_progress = v14;

    if (qword_1002A3A80 != -1) {
      dispatch_once(&qword_1002A3A80, &stru_100247450);
    }
    -[_CPLProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 1000 * qword_1002A3978);
    if (self->_currentState > 0xD)
    {
      v17 = self->_progress;
      int64_t v16 = 0LL;
    }

    else
    {
      int64_t v16 = -[CPLBaseSyncManager _baseProgressForState:totalUnits:](self, "_baseProgressForState:totalUnits:");
      v17 = self->_progress;
    }

    -[_CPLProgress setCompletedUnitCount:](v17, "setCompletedUnitCount:", v16);
    -[_CPLProgress setForeground:](self->_progress, "setForeground:", self->_foreground);
    -[_CPLProgress publish](self->_progress, "publish");
    -[CPLBaseSyncManager _updateOverridingForeground](self, "_updateOverridingForeground");
    self->_didStartSyncSession = 1;
  }

- (void)didFinishSyncSession
{
  if (self->_didStartSyncSession)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10015278C();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        if (self->_foreground) {
          id v5 = " (foreground)";
        }
        else {
          id v5 = "";
        }
        int v9 = 136315138;
        dispatch_block_t v10 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Sync session did finish%s",  (uint8_t *)&v9,  0xCu);
      }
    }

    -[CPLBaseSyncManager _stopShowingIndicator:](self, "_stopShowingIndicator:", @"sync session");
    -[CPLBaseSyncManager endClientWork:](self, "endClientWork:", @"sync session");
    self->_currentState = 14LL;
    -[_CPLProgress unpublish](self->_progress, "unpublish");
    progress = self->_progress;
    self->_progress = 0LL;

    self->_didStartSyncSession = 0;
  }

  -[CPLBaseSyncManager _updateOverridingForeground](self, "_updateOverridingForeground");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseSyncManager abstractObject](self, "abstractObject"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 engineLibrary]);
  [v8 reportQuarantineCountIfNecessary];
}

- (void)syncSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  if ([v4 isCPLOperationCancelledError])
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10015278C();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sync session has been cancelled and finished",  (uint8_t *)&v17,  2u);
      }

- (void)syncSessionDidSucceed
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10015278C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (self->_foreground) {
        id v5 = " (foreground)";
      }
      else {
        id v5 = "";
      }
      int v6 = 136315138;
      id v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Sync session did succeed%s",  (uint8_t *)&v6,  0xCu);
    }
  }

- (int64_t)_baseProgressForState:(unint64_t)a3 totalUnits:(int64_t *)a4
{
  if (a3 < 0xE)
  {
    if (a3)
    {
      unint64_t v5 = 8 * a3 - 8;
      *a4 = *(void *)((char *)&unk_1002A3980 + v5);
      return *(void *)((char *)&unk_1002A39F0 + v5);
    }

    else
    {
      int64_t result = 0LL;
      *a4 = 0LL;
    }
  }

  else
  {
    *a4 = 0LL;
    return qword_1002A3978;
  }

  return result;
}

- (void)didMoveToState:(unint64_t)a3
{
  self->_currentState = a3;
  if (a3)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10015278C();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = objc_claimAutoreleasedReturnValue( +[CPLEngineSyncManager shortDescriptionForState:]( &OBJC_CLASS___CPLEngineSyncManager,  "shortDescriptionForState:",  a3));
        id v8 = (void *)v7;
        if (self->_foreground) {
          int v9 = " (foreground)";
        }
        else {
          int v9 = "";
        }
        int v11 = 138412546;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        v14 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Sync session moved to %@%s",  (uint8_t *)&v11,  0x16u);
      }
    }

    if (self->_progress)
    {
      int64_t v10 = -[CPLBaseSyncManager _baseProgressForState:totalUnits:]( self,  "_baseProgressForState:totalUnits:",  self->_currentState,  &v11);
      if (a3 <= 0xB && ((0x631u >> (a3 - 1)) & 1) != 0) {
        -[_CPLProgress setUserInfoObject:forKey:]( self->_progress,  "setUserInfoObject:forKey:",  off_100247470[a3 - 1],  CPLSyncProgressStateKey);
      }
      -[_CPLProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v10);
    }
  }

  -[CPLBaseSyncManager _updateOverridingForeground](self, "_updateOverridingForeground");
}

- (void)didProgress:(float)a3 userInfo:(id)a4 forState:(unint64_t)a5
{
  id v8 = a4;
  self->_unint64_t currentState = a5;
  unint64_t currentState = a5;
  if (!_CPLSilentLogging)
  {
    id v10 = sub_10015278C();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLEngineSyncManager shortDescriptionForState:]( &OBJC_CLASS___CPLEngineSyncManager,  "shortDescriptionForState:",  a5));
      BOOL foreground = self->_foreground;
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      if (foreground) {
        v14 = " (foreground)";
      }
      else {
        v14 = "";
      }
      __int16 v22 = 2048;
      unint64_t v23 = (unint64_t)(float)(a3 * 100.0);
      __int16 v24 = 2080;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Sync session progress: %@/%lu%%%s", buf, 0x20u);
    }

    unint64_t currentState = self->_currentState;
  }

  int64_t v15 = -[CPLBaseSyncManager _baseProgressForState:totalUnits:]( self,  "_baseProgressForState:totalUnits:",  currentState,  buf);
  if (a5 - 3 > 0xA) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = qword_100219C28[a5 - 3];
  }
  int64_t v17 = v15 + (uint64_t)(float)((float)*(uint64_t *)buf * a3);
  progress = self->_progress;
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v16));
  -[_CPLProgress setUserInfoObject:forKey:](progress, "setUserInfoObject:forKey:", v19, CPLSyncProgressStateKey);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100153068;
  v20[3] = &unk_1002473F0;
  v20[4] = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v20];
  -[_CPLProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", v17);
}

- (void)prepareForClose
{
  self->_closed = 1;
  progress = self->_progress;
  if (progress)
  {
    -[_CPLProgress unpublish](progress, "unpublish");
    id v4 = self->_progress;
    self->_progress = 0LL;
  }

  -[CPLBaseSyncManager _updateOverridingForeground](self, "_updateOverridingForeground");
}

- (void).cxx_destruct
{
}

@end