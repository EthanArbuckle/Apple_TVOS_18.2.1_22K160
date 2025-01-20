@interface CPLCloudKitMetric
+ (void)initialize;
- (BOOL)submitted;
- (CKContainer)container;
- (CPLCloudKitMetric)initWithName:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (NSString)resultDescription;
- (id)description;
- (id)redactedDescription;
- (int64_t)result;
- (unint64_t)outstandingBeginCount;
- (void)_submitIfNecessary;
- (void)associateWithOperation:(id)a3;
- (void)associatedOperationDidComplete:(id)a3;
- (void)begin;
- (void)drop;
- (void)end;
- (void)setContainer:(id)a3;
- (void)setError:(id)a3;
- (void)setResult:(int64_t)a3;
@end

@implementation CPLCloudKitMetric

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___CPLCloudKitMetric) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    byte_1002965E8 = [v2 BOOLForKey:@"CPLCloudKitLogMetrics"];

    if (byte_1002965E8)
    {
      uint64_t v4 = CPLCopyDefaultSerialQueueAttributes(v3);
      v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.cpl.cloudkit.metrics", v7);
      v6 = (void *)qword_1002965F0;
      qword_1002965F0 = (uint64_t)v5;
    }
  }

- (CPLCloudKitMetric)initWithName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CPLCloudKitMetric;
  dispatch_queue_t v5 = -[CPLCloudKitMetric init](&v17, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;

    v8 = objc_alloc(&OBJC_CLASS___CKEventMetric);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v10 = -[CKEventMetric initWithEventName:atTime:](v8, "initWithEventName:atTime:", v4, v9);
    ckEventMetric = v5->_ckEventMetric;
    v5->_ckEventMetric = v10;

    v12 = byte_1002965E8
        ? -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ #%lu",  v5->_name,  sub_1000AFB28())
        : v5->_name;
    identifier = v5->_identifier;
    v5->_identifier = v12;

    if (byte_1002965E8)
    {
      if (!_CPLSilentLogging)
      {
        id v15 = sub_1000AFBB4();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v5;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: starting", buf, 0xCu);
        }
      }
    }
  }

  return v5;
}

- (void)_submitIfNecessary
{
  if (!self->_outstandingBeginCount && !-[NSMutableSet count](self->_outstandingOperations, "count"))
  {
    self->_submitted = 1;
    if (byte_1002965E8 && !_CPLSilentLogging)
    {
      id v6 = sub_1000AFBB4();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKContainer containerIdentifier](self->_container, "containerIdentifier"));
        int v9 = 138412546;
        v10 = self;
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: submitting to %@",  (uint8_t *)&v9,  0x16u);
      }
    }

    -[CPLCloudKitMetric prepareCKEventMetric:](self, "prepareCKEventMetric:", self->_ckEventMetric);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_result));
    -[CKEventMetric setObject:forKeyedSubscript:]( self->_ckEventMetric,  "setObject:forKeyedSubscript:",  v3,  @"result");

    ckEventMetric = self->_ckEventMetric;
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[CKEventMetric setEndTime:](ckEventMetric, "setEndTime:", v5);

    -[CKContainer submitEventMetric:](self->_container, "submitEventMetric:", self->_ckEventMetric);
  }

- (void)associateWithOperation:(id)a3
{
  id v4 = a3;
  if (!self->_submitted)
  {
    if (byte_1002965E8 && !_CPLSilentLogging)
    {
      id v8 = sub_1000AFBB4();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cplOperationClassDescription]);
        *(_DWORD *)buf = 138412546;
        v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: associating %@", buf, 0x16u);
      }
    }

    outstandingOperations = self->_outstandingOperations;
    if (outstandingOperations)
    {
      -[NSMutableSet addObject:](outstandingOperations, "addObject:", v4);
    }

    else
    {
      id v6 = -[NSMutableSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithObjects:", v4, 0LL);
      v7 = self->_outstandingOperations;
      self->_outstandingOperations = v6;
    }
  }
}

- (void)associatedOperationDidComplete:(id)a3
{
  id v4 = a3;
  if (!self->_submitted)
  {
    if (byte_1002965E8 && !_CPLSilentLogging)
    {
      id v8 = sub_1000AFBB4();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cplOperationClassDescription]);
        int v11 = 138412546;
        v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: finished %@", (uint8_t *)&v11, 0x16u);
      }
    }

    if ((-[CKEventMetric associateWithCompletedOperation:]( self->_ckEventMetric,  "associateWithCompletedOperation:",  v4) & 1) == 0 && !_CPLSilentLogging)
    {
      id v5 = sub_1000AFBB4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cplOperationClassDescription]);
        int v11 = 138412546;
        v12 = self;
        __int16 v13 = 2112;
        v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@: failed to associate with completed %@",  (uint8_t *)&v11,  0x16u);
      }
    }

    -[NSMutableSet removeObject:](self->_outstandingOperations, "removeObject:", v4);
    -[CPLCloudKitMetric _submitIfNecessary](self, "_submitIfNecessary");
  }
}

- (void)begin
{
  if (!self->_submitted)
  {
    ++self->_outstandingBeginCount;
    if (byte_1002965E8)
    {
      if (!_CPLSilentLogging)
      {
        id v2 = sub_1000AFBB4();
        uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t outstandingBeginCount = self->_outstandingBeginCount;
          *(_DWORD *)buf = 138412546;
          v7 = self;
          __int16 v8 = 2048;
          unint64_t v9 = outstandingBeginCount;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: begin (%lu)", buf, 0x16u);
        }
      }
    }
  }

- (void)end
{
  if (!self->_submitted)
  {
    unint64_t outstandingBeginCount = self->_outstandingBeginCount;
    if (!outstandingBeginCount) {
      sub_100198544(a2, (uint64_t)self);
    }
    if (byte_1002965E8 && !_CPLSilentLogging)
    {
      id v4 = sub_1000AFBB4();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = self->_outstandingBeginCount;
        int v7 = 138412546;
        __int16 v8 = self;
        __int16 v9 = 2048;
        unint64_t v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: end (%lu)", (uint8_t *)&v7, 0x16u);
      }

      unint64_t outstandingBeginCount = self->_outstandingBeginCount;
    }

    self->_unint64_t outstandingBeginCount = outstandingBeginCount - 1;
    -[CPLCloudKitMetric _submitIfNecessary](self, "_submitIfNecessary");
  }

- (void)setError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([v4 isCPLOperationCancelledError])
    {
      int64_t v5 = 2LL;
    }

    else if ([v6 isCPLOperationDeferredError])
    {
      int64_t v5 = 3LL;
    }

    else
    {
      int64_t v5 = 1LL;
    }

    self->_result = v5;
    id v4 = v6;
  }

  else
  {
    self->_result = 0LL;
  }
}

- (void)drop
{
  self->_submitted = 1;
  self->_unint64_t outstandingBeginCount = 0LL;
  outstandingOperations = self->_outstandingOperations;
  self->_outstandingOperations = 0LL;
}

- (NSString)resultDescription
{
  unint64_t v2 = self->_result - 1;
  if (v2 > 2) {
    return (NSString *)&stru_1002482B0;
  }
  else {
    return (NSString *)*(&off_1002427D8 + v2);
  }
}

- (id)description
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric resultDescription](self, "resultDescription"));
  id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@%@>", v4, v5);

  return v6;
}

- (id)redactedDescription
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric identifier](self, "identifier"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitMetric resultDescription](self, "resultDescription"));
  id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@%@>", v4, v5);

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (unint64_t)outstandingBeginCount
{
  return self->_outstandingBeginCount;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end