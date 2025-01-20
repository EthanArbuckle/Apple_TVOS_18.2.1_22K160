@interface CPLExitSharedLibrarySupervisor
+ (id)descriptionForExitState:(int64_t)a3;
- (BOOL)shouldRunForceProcessingStagedScopesTaskNow;
- (BOOL)shouldRunForceProcessingStagedScopesTaskNowMovingToForeground;
- (BOOL)shouldScheduleForceProcessingStagedScopesTask;
- (CPLExitSharedLibrarySupervisor)initWithScopeIdentifier:(id)a3 exitState:(int64_t)a4 supervisorInfo:(id)a5;
- (NSDate)exitStartDate;
- (NSDate)lastForcedExitDate;
- (NSDate)nextForcedExitDate;
- (NSDictionary)supervisorInfo;
- (NSString)scopeIdentifier;
- (NSString)status;
- (int64_t)exitState;
- (void)noteServerHasChanges;
- (void)ping;
- (void)setExitState:(int64_t)a3;
- (void)updateLastForcedExitDate;
@end

@implementation CPLExitSharedLibrarySupervisor

- (CPLExitSharedLibrarySupervisor)initWithScopeIdentifier:(id)a3 exitState:(int64_t)a4 supervisorInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___CPLExitSharedLibrarySupervisor;
  v10 = -[CPLExitSharedLibrarySupervisor init](&v45, "init");
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = v11;

    if (v9)
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"exitStartDate"]);
      if (v13
        && (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        && ([v13 timeIntervalSinceNow], v15 <= 0.0))
      {
        v16 = (NSDate *)v13;
      }

      else
      {
        v16 = 0LL;
      }

      exitStartDate = v10->_exitStartDate;
      v10->_exitStartDate = v16;

      id v18 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"lastForcedExitDate"]);
      if (v18
        && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v18, v19) & 1) != 0)
        && ([v18 timeIntervalSinceNow], v20 <= 0.0))
      {
        v21 = (NSDate *)v18;
      }

      else
      {
        v21 = 0LL;
      }

      lastForcedExitDate = v10->_lastForcedExitDate;
      v10->_lastForcedExitDate = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"nextForcedExitDate"]);
      if (v10->_lastForcedExitDate) {
        double v24 = 86400.0;
      }
      else {
        double v24 = 60.0;
      }
      id v25 = v23;
      if (v25
        && (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v25, v26) & 1) != 0)
        && ([v25 timeIntervalSinceNow], v27 <= v24))
      {
        v28 = (NSDate *)v25;
      }

      else
      {
        v28 = 0LL;
      }

      nextForcedExitDate = v10->_nextForcedExitDate;
      v10->_nextForcedExitDate = v28;
    }

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    supervisorInfo = v10->_supervisorInfo;
    v10->_supervisorInfo = v30;

    v32 = v10->_exitStartDate;
    if (!v32)
    {
      uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v34 = v10->_exitStartDate;
      v10->_exitStartDate = (NSDate *)v33;

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_supervisorInfo,  "setObject:forKeyedSubscript:",  v10->_exitStartDate,  @"exitStartDate");
      v32 = v10->_exitStartDate;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_supervisorInfo,  "setObject:forKeyedSubscript:",  v32,  @"exitStartDate");
    v35 = v10->_lastForcedExitDate;
    if (v35) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_supervisorInfo,  "setObject:forKeyedSubscript:",  v35,  @"lastForcedExitDate");
    }
    if (v10->_nextForcedExitDate) {
      goto LABEL_34;
    }
    v36 = v10->_lastForcedExitDate;
    if (v36)
    {
      v37 = v36;
      double v38 = (double)arc4random_uniform(0x15180u);
      double v39 = 86400.0;
    }

    else
    {
      int64_t exitState = v10->_exitState;
      v37 = v10->_exitStartDate;
      if (exitState == 4)
      {
        double v41 = 10.0;
LABEL_33:
        uint64_t v42 = objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v37, "dateByAddingTimeInterval:", v41));

        v43 = v10->_nextForcedExitDate;
        v10->_nextForcedExitDate = (NSDate *)v42;

LABEL_34:
        v10->_int64_t exitState = a4;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_supervisorInfo,  "setObject:forKeyedSubscript:",  v10->_nextForcedExitDate,  @"nextForcedExitDate");
        goto LABEL_35;
      }

      double v38 = (double)arc4random_uniform(0x3Cu);
      double v39 = 60.0;
    }

    double v41 = v38 + v39;
    goto LABEL_33;
  }

- (void)setExitState:(int64_t)a3
{
  if (self->_exitState == 4 && !self->_lastForcedExitDate)
  {
    nextForcedExitDate = self->_nextForcedExitDate;
    v6 = self->_exitStartDate;
    v7 = nextForcedExitDate;
    id v8 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:", 10.0));
    id v9 = v8;
    if (!v7 || (id v10 = -[NSDate compare:](v8, "compare:", v7), v11 = v7, v10 != (id)1)) {
      v11 = v9;
    }
    v12 = v11;

    id v13 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v12;

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supervisorInfo,  "setObject:forKeyedSubscript:",  self->_nextForcedExitDate,  @"nextForcedExitDate");
  }

  self->_int64_t exitState = a3;
}

- (NSDictionary)supervisorInfo
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_supervisorInfo, "copy");
}

- (BOOL)shouldScheduleForceProcessingStagedScopesTask
{
  int64_t exitState = self->_exitState;
  if (exitState != 4) {
    return 0;
  }
  -[NSDate timeIntervalSinceNow](self->_exitStartDate, "timeIntervalSinceNow");
  return v4 >= -604800.0;
}

- (BOOL)shouldRunForceProcessingStagedScopesTaskNow
{
  BOOL v3 = -[CPLExitSharedLibrarySupervisor shouldScheduleForceProcessingStagedScopesTask]( self,  "shouldScheduleForceProcessingStagedScopesTask");
  if (v3)
  {
    -[NSDate timeIntervalSinceNow](self->_nextForcedExitDate, "timeIntervalSinceNow");
    LOBYTE(v3) = v4 < 10.0;
  }

  return v3;
}

- (BOOL)shouldRunForceProcessingStagedScopesTaskNowMovingToForeground
{
  BOOL v3 = -[CPLExitSharedLibrarySupervisor shouldScheduleForceProcessingStagedScopesTask]( self,  "shouldScheduleForceProcessingStagedScopesTask");
  if (v3)
  {
    lastForcedExitDate = self->_lastForcedExitDate;
    LOBYTE(v3) = !lastForcedExitDate
              || (-[NSDate timeIntervalSinceNow](lastForcedExitDate, "timeIntervalSinceNow"), v5 < -3600.0);
  }

  return v3;
}

- (void)updateLastForcedExitDate
{
  BOOL v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  lastForcedExitDate = self->_lastForcedExitDate;
  self->_lastForcedExitDate = v3;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supervisorInfo,  "setObject:forKeyedSubscript:",  self->_lastForcedExitDate,  @"lastForcedExitDate");
  double v5 = self->_lastForcedExitDate;
  v6 = -[NSDate dateByAddingTimeInterval:]( v5,  "dateByAddingTimeInterval:",  (double)arc4random_uniform(0x15180u) + 86400.0);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(v6);

  nextForcedExitDate = self->_nextForcedExitDate;
  self->_nextForcedExitDate = v7;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supervisorInfo,  "setObject:forKeyedSubscript:",  self->_nextForcedExitDate,  @"nextForcedExitDate");
}

- (void)noteServerHasChanges
{
  lastForcedExitDate = self->_lastForcedExitDate;
  if (lastForcedExitDate)
  {
    nextForcedExitDate = self->_nextForcedExitDate;
    double v5 = lastForcedExitDate;
    v6 = nextForcedExitDate;
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v5, "dateByAddingTimeInterval:", 10.0));
    id v8 = v7;
    if (!v6 || (id v9 = -[NSDate compare:](v7, "compare:", v6), v10 = v6, v9 != (id)1)) {
      id v10 = v8;
    }
    v11 = v10;

    v12 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v11;
  }

  else
  {
    id v13 = self->_exitStartDate;
    uint64_t v14 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", 10.0));

    v12 = self->_nextForcedExitDate;
    self->_nextForcedExitDate = v14;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supervisorInfo,  "setObject:forKeyedSubscript:",  self->_nextForcedExitDate,  @"nextForcedExitDate");
}

- (void)ping
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v4 = self->_nextForcedExitDate;
  double v5 = (NSDate *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:10.0]);
  v6 = v5;
  if (!v4 || (v7 = -[NSDate compare:](v5, "compare:", v4), id v8 = v4, v7 != (id)1)) {
    id v8 = v6;
  }
  id v9 = v8;

  nextForcedExitDate = self->_nextForcedExitDate;
  self->_nextForcedExitDate = v9;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_supervisorInfo,  "setObject:forKeyedSubscript:",  self->_nextForcedExitDate,  @"nextForcedExitDate");
}

+ (id)descriptionForExitState:(int64_t)a3
{
  else {
    return off_10023F308[a3];
  }
}

- (NSString)status
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned int v4 = -[CPLExitSharedLibrarySupervisor shouldScheduleForceProcessingStagedScopesTask]( self,  "shouldScheduleForceProcessingStagedScopesTask");
  double v5 = objc_alloc(&OBJC_CLASS___NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLExitSharedLibrarySupervisor descriptionForExitState:]( &OBJC_CLASS___CPLExitSharedLibrarySupervisor,  "descriptionForExitState:",  self->_exitState));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  self->_exitStartDate,  v3));
  id v8 = (void *)v7;
  if (v4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLDateFormatter stringFromDateAgo:now:]( &OBJC_CLASS___CPLDateFormatter,  "stringFromDateAgo:now:",  self->_nextForcedExitDate,  v3));
    id v10 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@ - start: %@ - next retry: %@", v6, v8, v9);
  }

  else
  {
    id v10 = -[NSString initWithFormat:](v5, "initWithFormat:", @"%@ - start: %@ - no retry", v6, v7);
  }

  return v10;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (int64_t)exitState
{
  return self->_exitState;
}

- (NSDate)exitStartDate
{
  return self->_exitStartDate;
}

- (NSDate)lastForcedExitDate
{
  return self->_lastForcedExitDate;
}

- (NSDate)nextForcedExitDate
{
  return self->_nextForcedExitDate;
}

- (void).cxx_destruct
{
}

@end