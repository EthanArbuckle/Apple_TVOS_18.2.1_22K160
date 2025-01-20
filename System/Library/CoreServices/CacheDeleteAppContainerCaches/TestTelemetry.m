@interface TestTelemetry
+ (id)testTelemetryWithInfo:(id)a3;
- (NSMutableArray)removeFailures;
- (NSMutableArray)terminationFailures;
- (OS_dispatch_queue)q;
- (TestTelemetry)initWithInfo:(id)a3;
- (double)remove_threshold;
- (double)termination_threshold;
- (id)description;
- (unint64_t)deletes;
- (unint64_t)files_deleted;
- (void)addDeletes:(unint64_t)a3;
- (void)addRemoveFailure:(id)a3;
- (void)addTerminationFailure:(id)a3;
- (void)setFiles_deleted:(unint64_t)a3;
- (void)setRemoveFailures:(id)a3;
- (void)setRemove_threshold:(double)a3;
- (void)setTerminationFailures:(id)a3;
- (void)setTermination_threshold:(double)a3;
@end

@implementation TestTelemetry

- (TestTelemetry)initWithInfo:(id)a3
{
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_TEST_PARAMETERS"]);
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_TEST_TERMINATION_THRESHOLD"]);
      uint64_t v9 = evaluateNumberProperty();
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_TEST_REMOVE_THRESHOLD"]);
      uint64_t v12 = evaluateNumberProperty();
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

      if (v10 | v13
        && ([(id)v10 intValue] || objc_msgSend((id)v13, "intValue")))
      {
        v26.receiver = self;
        v26.super_class = (Class)&OBJC_CLASS___TestTelemetry;
        v14 = -[TestTelemetry init](&v26, "init");
        if (v14)
        {
          if (v10)
          {
            [(id)v10 floatValue];
            v14->_termination_threshold = v15;
          }

          if (v13)
          {
            [(id)v13 floatValue];
            v14->_remove_threshold = v16;
          }

          dispatch_queue_t v17 = dispatch_queue_create("TestTelemetry_add_queue", 0LL);
          q = v14->_q;
          v14->_q = (OS_dispatch_queue *)v17;
        }

        uint64_t v19 = CDGetLogHandle("client");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = (const char *)v14;
          __int16 v29 = 2112;
          v30 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "initialized TestTelemetry: %@, info: %@",  buf,  0x16u);
        }

        self = v14;
        v21 = self;
      }

      else
      {
        uint64_t v23 = CDGetLogHandle("client");
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v5;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Invalid test parameters: %@",  buf,  0xCu);
        }

        v21 = 0LL;
      }
    }

    else
    {
      uint64_t v22 = CDGetLogHandle("client");
      uint64_t v10 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[TestTelemetry initWithInfo:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "[%s] no test parameters in info",  buf,  0xCu);
      }

      v21 = 0LL;
    }
  }

  else
  {
    v21 = 0LL;
  }

  return v21;
}

+ (id)testTelemetryWithInfo:(id)a3
{
  id v3 = a3;
  v4 = -[TestTelemetry initWithInfo:](objc_alloc(&OBJC_CLASS___TestTelemetry), "initWithInfo:", v3);

  return v4;
}

- (id)description
{
  uint64_t v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TestTelemetry terminationFailures](self, "terminationFailures"));
  -[TestTelemetry remove_threshold](self, "remove_threshold");
  uint64_t v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TestTelemetry removeFailures](self, "removeFailures"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"termination threshold: %f -- failures: %@, remove threshold: %f -- failures: %@",  v4,  v5,  v7,  v8));

  return v9;
}

- (void)addRemoveFailure:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TestTelemetry removeFailures](self, "removeFailures"));

  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[TestTelemetry setRemoveFailures:](self, "setRemoveFailures:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TestTelemetry removeFailures](self, "removeFailures"));
  [v7 addObject:v4];
}

- (void)addTerminationFailure:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TestTelemetry terminationFailures](self, "terminationFailures"));

  if (!v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[TestTelemetry setTerminationFailures:](self, "setTerminationFailures:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TestTelemetry terminationFailures](self, "terminationFailures"));
  [v7 addObject:v4];
}

- (void)addDeletes:(unint64_t)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TestTelemetry q](self, "q"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __28__TestTelemetry_addDeletes___block_invoke;
  v6[3] = &unk_10000C4C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

id __28__TestTelemetry_addDeletes___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "setFiles_deleted:",  (char *)objc_msgSend(*(id *)(a1 + 32), "files_deleted") + *(void *)(a1 + 40));
}

- (unint64_t)deletes
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[TestTelemetry q](self, "q"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __24__TestTelemetry_deletes__block_invoke;
  v6[3] = &unk_10000C4E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __24__TestTelemetry_deletes__block_invoke(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "files_deleted");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (double)termination_threshold
{
  return self->_termination_threshold;
}

- (void)setTermination_threshold:(double)a3
{
  self->_termination_threshold = a3;
}

- (double)remove_threshold
{
  return self->_remove_threshold;
}

- (void)setRemove_threshold:(double)a3
{
  self->_remove_threshold = a3;
}

- (NSMutableArray)terminationFailures
{
  return self->_terminationFailures;
}

- (void)setTerminationFailures:(id)a3
{
}

- (NSMutableArray)removeFailures
{
  return self->_removeFailures;
}

- (void)setRemoveFailures:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (unint64_t)files_deleted
{
  return self->_files_deleted;
}

- (void)setFiles_deleted:(unint64_t)a3
{
  self->_files_deleted = a3;
}

- (void).cxx_destruct
{
}

@end