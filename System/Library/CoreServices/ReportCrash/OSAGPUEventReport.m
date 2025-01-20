@interface OSAGPUEventReport
- (OSAGPUEventReport)initWithDictionary:(id)a3;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
@end

@implementation OSAGPUEventReport

- (OSAGPUEventReport)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSAGPUEventReport;
  v6 = -[OSAGPUEventReport init](&v9, "init");
  if (v6)
  {
    *(CFAbsoluteTime *)&v6->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time] = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v6->_event, a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      NSUInteger v7 = -[NSDictionary count](v6->_event, "count");
      *(_DWORD *)buf = 134217984;
      NSUInteger v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "GPURestartReport: event with %lu keys",  buf,  0xCu);
    }
  }

  return v6;
}

- (id)problemType
{
  return @"284";
}

- (id)reportNamePrefix
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_event,  "objectForKeyedSubscript:",  @"process_name"));
  v3 = @"unknown";
  if (v2) {
    v3 = v2;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"gpuEvent-%@", v3));

  return v4;
}

- (id)appleCareDetails
{
  return 0LL;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  objc_super v9 = (void (**)(id, void *))a4;
  if (self->_tailspinPath)
  {
    id v5 = (NSDictionary *)-[NSDictionary mutableCopy](self->_event, "mutableCopy");
    -[NSDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  self->_tailspinPath,  @"tailspin_pathname");
    event = self->_event;
    self->_event = v5;
  }

  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue(-[OSAGPUEventReport problemType](self, "problemType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[OSALog commonFieldsForBody:](&OBJC_CLASS___OSALog, "commonFieldsForBody:", v7));
  v9[2](v9, v8);

  v9[2](v9, self->_event);
}

- (void).cxx_destruct
{
}

@end