@interface _CPLCloudKitTaskGroupThrottler
- (BOOL)shouldRunOperationsNow:(id)a3 error:(id *)a4;
- (NSDate)throttlingDate;
- (NSString)groupName;
- (_CPLCloudKitTaskGroupThrottler)initWithGroupName:(id)a3 minimumThrottlingInterval:(double)a4;
- (double)minimumThrottlingInterval;
- (id)statusWithNow:(id)a3;
- (void)_adjustThrottlingDateWithNow:(id)a3 andError:(id)a4;
- (void)_incrementThrottledCount;
- (void)operationDidFinishNow:(id)a3 withError:(id)a4;
@end

@implementation _CPLCloudKitTaskGroupThrottler

- (_CPLCloudKitTaskGroupThrottler)initWithGroupName:(id)a3 minimumThrottlingInterval:(double)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____CPLCloudKitTaskGroupThrottler;
  v7 = -[_CPLCloudKitTaskGroupThrottler init](&v19, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    groupName = v7->_groupName;
    v7->_groupName = v8;

    v7->_minimumThrottlingInterval = a4;
    uint64_t v11 = CPLCopyDefaultSerialQueueAttributes(v10);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.cpl.cloudkit.throttling", v12);
    logQueue = v7->_logQueue;
    v7->_logQueue = (OS_dispatch_queue *)v13;

    if (-[NSString hasPrefix:](v7->_groupName, "hasPrefix:", @"Locally Throttled "))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", fmax(v7->_minimumThrottlingInterval, 3600.0)));
      throttlingDate = v7->_throttlingDate;
      v7->_throttlingDate = (NSDate *)v16;

      -[_CPLCloudKitTaskGroupThrottler _adjustThrottlingDateWithNow:andError:]( v7,  "_adjustThrottlingDateWithNow:andError:",  v15,  0LL);
    }
  }

  return v7;
}

- (void)_adjustThrottlingDateWithNow:(id)a3 andError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  throttlingDate = self->_throttlingDate;
  if (!throttlingDate) {
    goto LABEL_14;
  }
  -[NSDate timeIntervalSinceDate:](throttlingDate, "timeIntervalSinceDate:", v6);
  if (v9 <= 0.0)
  {
    uint64_t v11 = 0LL;
    goto LABEL_6;
  }

  double v10 = fmax(self->_minimumThrottlingInterval, 604800.0);
  if (v9 > v10)
  {
    uint64_t v11 = (NSDate *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:v10]);
LABEL_6:
    v12 = self->_throttlingDate;
    self->_throttlingDate = v11;

    throttlingError = self->_throttlingError;
    self->_throttlingError = 0LL;
  }

  if (self->_throttlingDate && !self->_throttlingError)
  {
    if (v7 && ![v7 isCPLErrorWithCode:1004])
    {
      v14 = @"Server is unavailable for %@";
      uint64_t v15 = 1000LL;
    }

    else
    {
      v14 = @"%@ has been throttled";
      uint64_t v15 = 1004LL;
    }

    uint64_t v16 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", v14, self->_groupName);
    v17 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v18 = CPLErrorDomain;
    v22[0] = CPLErrorRetryAfterDateKey;
    v22[1] = NSLocalizedDescriptionKey;
    v23[0] = self->_throttlingDate;
    v23[1] = v16;
    v22[2] = @"CPLThrottling";
    v23[2] = &__kCFBooleanTrue;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
    v20 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v18, v15, v19);
    v21 = self->_throttlingError;
    self->_throttlingError = v20;
  }

- (void)_incrementThrottledCount
{
  logQueue = self->_logQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000439A0;
  block[3] = &unk_10023DC70;
  block[4] = self;
  dispatch_async((dispatch_queue_t)logQueue, block);
}

- (void)operationDidFinishNow:(id)a3 withError:(id)a4
{
  id v34 = a3;
  id v7 = a4;
  if (+[CPLCloudKitErrors isOperationThrottledError:]( &OBJC_CLASS___CPLCloudKitErrors,  "isOperationThrottledError:",  v7))
  {
    -[_CPLCloudKitTaskGroupThrottler _incrementThrottledCount](self, "_incrementThrottledCount");
    throttlingError = self->_throttlingError;
    self->_throttlingError = 0LL;

    double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    double v10 = (NSString *)CPLErrorRetryAfterDateKey;
    uint64_t v11 = (NSDate *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CPLErrorRetryAfterDateKey]);
    throttlingDate = self->_throttlingDate;
    self->_throttlingDate = v11;

    dispatch_queue_t v13 = self->_throttlingDate;
    if (v13)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate);
      uint64_t isKindOfClass = objc_opt_isKindOfClass(v13, v14);
      if ((isKindOfClass & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v16 = __CPLGenericOSLogDomain(isKindOfClass);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = (void *)objc_opt_class(self->_throttlingDate);
            *(_DWORD *)buf = 138412546;
            v36 = v10;
            __int16 v37 = 2112;
            id v38 = v18;
            id v19 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid %@: %@", buf, 0x16u);
          }
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Clou dKit/CPLCloudKitTransportTaskGate.m"));
        [v20 handleFailureInMethod:a2, self, v21, 217, @"Invalid %@: %@", v10, objc_opt_class(self->_throttlingDate) object file lineNumber description];

        goto LABEL_26;
      }
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:CKErrorRetryAfterKey]);

      if (v23)
      {
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
        uint64_t v25 = objc_opt_isKindOfClass(v23, v24);
        if ((v25 & 1) == 0)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v30 = __CPLGenericOSLogDomain(v25);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v36 = CKErrorRetryAfterKey;
              __int16 v37 = 2112;
              id v38 = (id)objc_opt_class(v23);
              id v32 = v38;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid %@: %@", buf, 0x16u);
            }
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Cl oudKit/CPLCloudKitTransportTaskGate.m"));
          [v20 handleFailureInMethod:a2, self, v33, 213, @"Invalid %@: %@", CKErrorRetryAfterKey, objc_opt_class(v23) object file lineNumber description];

LABEL_26:
          abort();
        }

        [v23 doubleValue];
        v26 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
        v27 = self->_throttlingDate;
        self->_throttlingDate = v26;
      }
    }

    if (!self->_throttlingDate)
    {
      v28 = (NSDate *)objc_claimAutoreleasedReturnValue([v34 dateByAddingTimeInterval:3600.0]);
      v29 = self->_throttlingDate;
      self->_throttlingDate = v28;
    }

    -[_CPLCloudKitTaskGroupThrottler _adjustThrottlingDateWithNow:andError:]( self,  "_adjustThrottlingDateWithNow:andError:",  v34,  v7);
  }

  else if (v7)
  {
    if (+[CPLCloudKitErrors isOperationCancelledOrDeferredError:]( &OBJC_CLASS___CPLCloudKitErrors,  "isOperationCancelledOrDeferredError:",  v7))
    {
      ++self->_cancelledCount;
    }

    else
    {
      ++self->_failedCount;
    }
  }
}

- (BOOL)shouldRunOperationsNow:(id)a3 error:(id *)a4
{
  id v7 = a3;
  -[_CPLCloudKitTaskGroupThrottler _adjustThrottlingDateWithNow:andError:]( self,  "_adjustThrottlingDateWithNow:andError:",  v7,  0LL);
  if (self->_throttlingDate && objc_msgSend(v7, "compare:") == (id)-1)
  {
    -[_CPLCloudKitTaskGroupThrottler _incrementThrottledCount](self, "_incrementThrottledCount");
    throttlingError = self->_throttlingError;
    if (!throttlingError) {
      sub_1001913E0((uint64_t)a2, (uint64_t)self);
    }
    BOOL v8 = 0;
    if (a4) {
      *a4 = throttlingError;
    }
  }

  else
  {
    BOOL v8 = 1;
  }

  ++self->_count;

  return v8;
}

- (id)statusWithNow:(id)a3
{
  id v4 = a3;
  -[_CPLCloudKitTaskGroupThrottler _adjustThrottlingDateWithNow:andError:]( self,  "_adjustThrottlingDateWithNow:andError:",  v4,  0LL);
  v5 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@: %lu (failed: %lu"),  self->_groupName,  self->_count,  self->_failedCount;
  id v6 = v5;
  if (self->_cancelledCount) {
    -[NSMutableString appendFormat:](v5, "appendFormat:", @" - cancelled: %lu", self->_cancelledCount);
  }
  throttlingDate = self->_throttlingDate;
  if (throttlingDate)
  {
    -[NSDate timeIntervalSinceDate:](throttlingDate, "timeIntervalSinceDate:", v4);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLDateFormatter stringForTimeInterval:](&OBJC_CLASS___CPLDateFormatter, "stringForTimeInterval:"));
    -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @" - throttled: %lu - throttled for %@"),  self->_throttledCount,  v8);
  }

  else if (self->_throttledCount)
  {
    -[NSMutableString appendFormat:]( v6,  "appendFormat:",  @" - throttled: %lu - not throttled any more"),  self->_throttledCount);
  }

  else
  {
    -[NSMutableString appendString:](v6, "appendString:", @""));
  }

  return v6;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (double)minimumThrottlingInterval
{
  return self->_minimumThrottlingInterval;
}

- (NSDate)throttlingDate
{
  return self->_throttlingDate;
}

- (void).cxx_destruct
{
}

@end