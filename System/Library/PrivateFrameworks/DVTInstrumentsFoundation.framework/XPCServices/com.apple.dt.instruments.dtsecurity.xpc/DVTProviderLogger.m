@interface DVTProviderLogger
- (DVTProviderLogger)initWithProviderName:(id)a3;
- (NSArray)errors;
- (NSArray)warnings;
- (void)failWithReason:(id)a3;
- (void)warnWithMessage:(id)a3;
@end

@implementation DVTProviderLogger

- (DVTProviderLogger)initWithProviderName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DVTProviderLogger;
  v6 = -[DVTProviderLogger init](&v12, "init");
  if (v6)
  {
    if (qword_100019638 != -1) {
      dispatch_once(&qword_100019638, &stru_100014B48);
    }
    objc_storeStrong((id *)&v6->_log, (id)qword_100019630);
    objc_storeStrong((id *)&v6->_providerName, a3);
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    errors = v6->_errors;
    v6->_errors = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    warnings = v6->_warnings;
    v6->_warnings = v9;
  }

  return v6;
}

- (NSArray)errors
{
  return (NSArray *)-[NSMutableArray copy](self->_errors, "copy");
}

- (NSArray)warnings
{
  return (NSArray *)-[NSMutableArray copy](self->_warnings, "copy");
}

- (void)failWithReason:(id)a3
{
  id v4 = a3;
  v15[0] = NSLocalizedDescriptionKey;
  v15[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v16[0] = v4;
  v16[1] = providerName;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ktrace_recording.provider",  1LL,  v6));

  -[NSMutableArray addObject:](self->_errors, "addObject:", v7);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_10000E3A4((uint64_t)v4, log, v9, v10, v11, v12, v13, v14);
  }
}

- (void)warnWithMessage:(id)a3
{
  id v4 = a3;
  v11[0] = NSLocalizedDescriptionKey;
  v11[1] = @"DVTKtraceSessionProviderName";
  providerName = self->_providerName;
  v12[0] = v4;
  v12[1] = providerName;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.dt.ktrace_recording.provider",  1LL,  v6));

  -[NSMutableArray addObject:](self->_warnings, "addObject:", v7);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Provider warning: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end