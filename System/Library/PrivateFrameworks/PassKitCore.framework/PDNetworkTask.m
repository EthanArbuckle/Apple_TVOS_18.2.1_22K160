@interface PDNetworkTask
+ (BOOL)supportsSecureCoding;
- (BOOL)backoffComplete;
- (BOOL)canRequestReauthentication;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)isValid;
- (NSDate)creationDate;
- (NSDate)nextStartDate;
- (PDNetworkTask)init;
- (PDNetworkTask)initWithCoder:(id)a3;
- (PDNetworkTaskManagerProtocol)manager;
- (const)backoffLevels;
- (double)nextBackoffInterval;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (unint64_t)numberOfBackoffLevels;
- (void)cancel;
- (void)deliverResult:(id)a3;
- (void)deliverResult:(id)a3 forSubtask:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fail;
- (void)failForAuthentication;
- (void)incrementBackoff;
- (void)performReset;
- (void)reportError:(id)a3;
- (void)reportError:(id)a3 forSubtask:(id)a4;
- (void)reportStateChange;
- (void)reportWarnings:(id)a3;
- (void)reportWarnings:(id)a3 forSubtask:(id)a4;
- (void)resetBackoff;
- (void)setCanRequestReauthentication:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setNextStartDate:(id)a3;
- (void)start:(BOOL)a3;
- (void)succeed;
@end

@implementation PDNetworkTask

- (PDNetworkTask)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDNetworkTask;
  v2 = -[PDNetworkTask init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[PDNetworkTask setCreationDate:](v2, "setCreationDate:", v3);
  }

  return v2;
}

- (void)start:(BOOL)a3
{
  if (self->_started)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      objc_super v5 = "Cannot start a task that is already started. Ignoring.";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (self->_canceled)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(0LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      objc_super v5 = "Cannot start a task that is canceled. Ignoring.";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }

- (void)cancel
{
  if (!self->_canceled)
  {
    self->_canceled = 1;
    -[PDNetworkTask performCancel](self, "performCancel");
  }

- (BOOL)backoffComplete
{
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  return nextBackoffLevel >= -[PDNetworkTask numberOfBackoffLevels](self, "numberOfBackoffLevels");
}

- (double)nextBackoffInterval
{
  v3 = -[PDNetworkTask backoffLevels](self, "backoffLevels");
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  unint64_t v5 = -[PDNetworkTask numberOfBackoffLevels](self, "numberOfBackoffLevels");
  double result = 0.0;
  if (nextBackoffLevel < v5) {
    return v3[self->_nextBackoffLevel].var1;
  }
  return result;
}

- (void)incrementBackoff
{
  v3 = -[PDNetworkTask backoffLevels](self, "backoffLevels");
  unint64_t nextBackoffLevel = self->_nextBackoffLevel;
  if (nextBackoffLevel < -[PDNetworkTask numberOfBackoffLevels](self, "numberOfBackoffLevels"))
  {
    unint64_t v5 = self->_nextBackoffLevel;
    unint64_t v6 = self->_nextBackoffIteration + 1;
    self->_nextBackoffIteration = v6;
    if (v6 >= v3[v5].var0)
    {
      self->_unint64_t nextBackoffLevel = v5 + 1;
      self->_nextBackoffIteration = 0LL;
    }
  }

- (void)resetBackoff
{
  self->_unint64_t nextBackoffLevel = 0LL;
  self->_nextBackoffIteration = 0LL;
}

- (void)deliverResult:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot deliver result. Ignoring.",  v8,  2u);
    }
  }

  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self gotResult:v4];
  }
}

- (void)deliverResult:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot deliver result. Ignoring.",  v10,  2u);
    }

    goto LABEL_6;
  }

  if (self->_started)
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_manager);
    -[os_log_s task:gotResult:](WeakRetained, "task:gotResult:", v7, v6);
LABEL_6:
  }
}

- (void)reportStateChange
{
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot report state change. Ignoring.",  buf,  2u);
    }
  }

  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskChangedState:self];
  }

- (void)reportError:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot report error. Ignoring.",  v8,  2u);
    }
  }

  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self encounteredError:v4];
  }
}

- (void)reportError:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot report error. Ignoring.",  v10,  2u);
    }

    goto LABEL_6;
  }

  if (self->_started)
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_manager);
    -[os_log_s task:encounteredError:](WeakRetained, "task:encounteredError:", v7, v6);
LABEL_6:
  }
}

- (void)reportWarnings:(id)a3
{
  id v4 = a3;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot report warnings. Ignoring.",  v8,  2u);
    }
  }

  else if (self->_started)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained task:self encounteredWarnings:v4];
  }
}

- (void)reportWarnings:(id)a3 forSubtask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot report warnings. Ignoring.",  v10,  2u);
    }

    goto LABEL_6;
  }

  if (self->_started)
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)&self->_manager);
    -[os_log_s task:encounteredWarnings:](WeakRetained, "task:encounteredWarnings:", v7, v6);
LABEL_6:
  }
}

- (void)succeed
{
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot succeed. Ignoring.",  buf,  2u);
    }
  }

  else if (self->_started)
  {
    id v6 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskSucceeded:v6];

    -[PDNetworkTask performReset](v6, "performReset");
    self->_started = 0;
  }

- (void)fail
{
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot fail. Ignoring.",  buf,  2u);
    }
  }

  else if (self->_started)
  {
    id v6 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskFailed:v6];

    -[PDNetworkTask performReset](v6, "performReset");
    self->_started = 0;
  }

- (void)failForAuthentication
{
  if (self->_canceled)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Canceled task cannot fail. Ignoring.",  buf,  2u);
    }
  }

  else if (self->_started)
  {
    id v6 = self;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained taskFailedForAuthentication:v6];

    -[PDNetworkTask performReset](v6, "performReset");
    self->_started = 0;
  }

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return 0;
}

- (int64_t)actionForInactiveTask:(id)a3
{
  return 0LL;
}

- (int64_t)actionForActiveTask:(id)a3
{
  return 0LL;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_NormalBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 10LL;
}

- (void)performReset
{
  self->_canceled = 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDNetworkTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDNetworkTask;
  id v6 = -[PDNetworkTask init](&v13, "init");
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v5),  @"nextStartDate");
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[PDNetworkTask setNextStartDate:](v6, "setNextStartDate:", v8);

    id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v9),  @"creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[PDNetworkTask setCreationDate:](v6, "setCreationDate:", v11);

    v6->_canRequestReauthentication = [v4 decodeBoolForKey:@"canRequestReauthentication"];
    v6->_unint64_t nextBackoffLevel = (unint64_t)[v4 decodeIntegerForKey:@"nextBackoffLevel"];
    v6->_nextBackoffIteration = (unint64_t)[v4 decodeIntegerForKey:@"nextBackoffIteration"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDNetworkTask nextStartDate](self, "nextStartDate"));
  [v6 encodeObject:v4 forKey:@"nextStartDate"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDNetworkTask creationDate](self, "creationDate"));
  [v6 encodeObject:v5 forKey:@"creationDate"];

  [v6 encodeBool:self->_canRequestReauthentication forKey:@"canRequestReauthentication"];
  [v6 encodeInteger:self->_nextBackoffLevel forKey:@"nextBackoffLevel"];
  [v6 encodeInteger:self->_nextBackoffIteration forKey:@"nextBackoffIteration"];
}

- (PDNetworkTaskManagerProtocol)manager
{
  return (PDNetworkTaskManagerProtocol *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
}

- (BOOL)canRequestReauthentication
{
  return self->_canRequestReauthentication;
}

- (void)setCanRequestReauthentication:(BOOL)a3
{
  self->_canRequestReauthentication = a3;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end