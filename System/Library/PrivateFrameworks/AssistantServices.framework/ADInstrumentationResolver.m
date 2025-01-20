@interface ADInstrumentationResolver
- (ADInstrumentationResolver)init;
- (ADInstrumentationResolver)initWithQueue:(id)a3;
- (id)wallClockTimeForTimestamp:(unint64_t)a3;
- (void)buildDeviceDynamicContextRelativeToTimestamp:(unint64_t)a3 forEndpointUUID:(id)a4 withCompletion:(id)a5;
- (void)logInstrumentationOfType:(id)a3 endpointUUID:(id)a4 machAbsoluteTime:(unint64_t)a5 turnIdentifier:(id)a6;
@end

@implementation ADInstrumentationResolver

- (ADInstrumentationResolver)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"ADInstrumentationResolver.m",  56,  @"%s is marked as NS_UNAVAILABLE. Use 'initWithQueue:' instead.",  "-[ADInstrumentationResolver init]");

  return 0LL;
}

- (ADInstrumentationResolver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADInstrumentationResolver;
  v6 = -[ADInstrumentationResolver init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_externalQueue, a3);
  }

  return v7;
}

- (void)logInstrumentationOfType:(id)a3 endpointUUID:(id)a4 machAbsoluteTime:(unint64_t)a5 turnIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v10)
  {
    v17 = (os_log_s *)AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[ADInstrumentationResolver logInstrumentationOfType:endpointUUID:machAbsoluteTime:turnIdentifier:]";
    v18 = "%s Nil instrumentation class provided";
    v19 = v17;
    uint32_t v20 = 12;
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_7;
  }

  v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___SISchemaDeviceDynamicContext);
  v14 = NSStringFromClass(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = [v10 isEqualToString:v15];

  if (!v16)
  {
    v21 = (os_log_s *)AFSiriLogContextAnalytics;
    if (!os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    v26 = "-[ADInstrumentationResolver logInstrumentationOfType:endpointUUID:machAbsoluteTime:turnIdentifier:]";
    __int16 v27 = 2112;
    id v28 = v10;
    v18 = "%s Unsupported instrumentation class provided %@";
    v19 = v21;
    uint32_t v20 = 22;
    goto LABEL_9;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100203054;
  v22[3] = &unk_1004F6570;
  unint64_t v24 = a5;
  id v23 = v12;
  -[ADInstrumentationResolver buildDeviceDynamicContextRelativeToTimestamp:forEndpointUUID:withCompletion:]( self,  "buildDeviceDynamicContextRelativeToTimestamp:forEndpointUUID:withCompletion:",  a5,  v11,  v22);

LABEL_7:
}

- (void)buildDeviceDynamicContextRelativeToTimestamp:(unint64_t)a3 forEndpointUUID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADInstrumentationResolver wallClockTimeForTimestamp:](self, "wallClockTimeForTimestamp:", a3));
  id v11 = objc_alloc_init(&OBJC_CLASS___SISchemaDeviceDynamicContext);
  [v10 timeIntervalSince1970];
  objc_msgSend(v11, "setTimeIntervalSince1970:");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100202E3C;
  v16[3] = &unk_1004F6598;
  id v17 = v11;
  v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  [v12 fetchLastLocationWithCompletion:v16];
}

- (id)wallClockTimeForTimestamp:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v5 = mach_absolute_time();
  double TimeInterval = AFMachAbsoluteTimeGetTimeInterval(v5);
  v7 = +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  AFMachAbsoluteTimeGetTimeInterval(a3) - TimeInterval);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end