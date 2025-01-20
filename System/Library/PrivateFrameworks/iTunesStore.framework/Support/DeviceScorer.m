@interface DeviceScorer
+ (BOOL)_resultForSamplingSession:(id)a3 isActive:(BOOL *)a4;
+ (BOOL)_shouldEnableDeviceScoring;
+ (BOOL)_shouldEnableDeviceScoringV2;
+ (BOOL)_shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5;
+ (BOOL)deviceScoringSupported;
+ (BOOL)deviceScoringSupportedV2;
+ (double)_randomDouble;
+ (id)_hexEncodingForData:(id)a3;
+ (id)_loadURLBag;
+ (id)_valueForKey:(id)a3;
+ (void)_setValue:(id)a3 forKey:(id)a4;
- (DeviceScorer)initWithServerEndpoint:(int64_t)a3;
- (DeviceScorerContext)context;
- (id)_serverEndpointIdentifierForServerEndpoint:(int64_t)a3;
- (void)deviceScoreWithNonce:(id)a3 completion:(id)a4;
- (void)didConsumeDeviceScore:(BOOL)a3;
@end

@implementation DeviceScorer

- (DeviceScorer)initWithServerEndpoint:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DeviceScorer;
  v4 = -[DeviceScorer init](&v9, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___DeviceScorerContext);
    -[DeviceScorerContext setServerEndpoint:](v5, "setServerEndpoint:", a3);
    context = v4->_context;
    v4->_context = v5;
    v7 = v5;

    -[DeviceScorer _initDeviceScorerWithContext:](v4, "_initDeviceScorerWithContext:", v7);
  }

  return v4;
}

+ (BOOL)deviceScoringSupported
{
  return 0;
}

+ (BOOL)deviceScoringSupportedV2
{
  return 0;
}

- (void)deviceScoreWithNonce:(id)a3 completion:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3, a4));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  int v11 = 138543362;
  id v12 = (id)objc_opt_class(self);
  id v9 = v12;
  v10 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%{public}@: Device scoring not available",  &v11,  12);

  if (v10)
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v5, @"%@");
LABEL_12:
  }
}

- (void)didConsumeDeviceScore:(BOOL)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig", a3));
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if (!(_DWORD)v6) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v8 = v11;
  id v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%{public}@: Device scoring not available",  &v10,  12);

  if (v9)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
LABEL_12:
  }
}

+ (id)_hexEncodingForData:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  unsigned int v5 = (char *)[v3 length];
  id v6 = v3;
  uint64_t v7 = (unsigned __int8 *)[v6 bytes];
  if (v5)
  {
    id v8 = v7;
    do
    {
      unsigned int v9 = *v8++;
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%02x", v9);
      --v5;
    }

    while (v5);
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v4));

  return v10;
}

+ (id)_loadURLBag
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  v4 = -[ISLoadURLBagOperation initWithBagContext:]( objc_alloc(&OBJC_CLASS___ISLoadURLBagOperation),  "initWithBagContext:",  v3);
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  v30 = sub_10002A5D0;
  v31 = &unk_10034AFE0;
  v33 = &v34;
  unsigned int v5 = dispatch_semaphore_create(0LL);
  v32 = v5;
  -[ISLoadURLBagOperation setCompletionBlock:](v4, "setCompletionBlock:", &v28);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v6 addOperation:v4];

  dispatch_time_t v7 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_wait(v5, v7);
  if (!*((_BYTE *)v35 + 24))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v9) = [v8 shouldLog];
    unsigned int v10 = [v8 shouldLogToDisk];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    id v12 = v11;
    if (v10) {
      LODWORD(v9) = v9 | 2;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      v13 = (void *)objc_opt_class(a1);
      int v38 = 138543362;
      v39 = v13;
      id v14 = v13;
      v15 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  16LL,  "%{public}@: Load bag operation failed for timeout",  &v38,  12,  v28,  v29,  v30,  v31);

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }

      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
      free(v15);
      v26 = v12;
      SSFileLog(v8, @"%@");
    }

    goto LABEL_13;
  }

- (id)_serverEndpointIdentifierForServerEndpoint:(int64_t)a3
{
  else {
    return off_10034B940[a3];
  }
}

+ (BOOL)_shouldEnableDeviceScoring
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _loadURLBag]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 valueForKey:@"afds-enabled"]);
  v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldEnableDeviceScoringV2
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _loadURLBag]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"afds-enabled-v2-ramp"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  double v6 = 0.0;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    [v4 doubleValue];
    double v6 = v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"afds-enabled-v2-ramp-duration"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    [v8 doubleValue];
    double v11 = v10;
  }

  else
  {
    double v11 = 1800.0;
  }

  unsigned int v26 = [a1 _shouldSampleWithPercentage:@"FraudScore" sessionDuration:v6 identifier:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    unsigned int v14 = v13;
  }
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v14 & 2;
  }
  if ((_DWORD)v16)
  {
    v17 = (void *)objc_opt_class(a1);
    v25 = v4;
    id v18 = v17;
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26));
    int v27 = 138544130;
    v28 = v17;
    __int16 v29 = 2114;
    v30 = v19;
    __int16 v31 = 2114;
    v32 = v20;
    __int16 v33 = 2114;
    uint64_t v34 = v21;
    v22 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%{public}@: Sampling fraud v2 with percentage: %{public}@, duration: %{public}@, result: %{public}@",  &v27,  42);

    v4 = v25;
    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v22,  4LL));
      free(v22);
      SSFileLog(v12, @"%@");
    }
  }

  else
  {
  }

  return v26;
}

+ (double)_randomDouble
{
  if (qword_1003A3240 != -1) {
    dispatch_once(&qword_1003A3240, &stru_10034B920);
  }
  return drand48();
}

+ (BOOL)_resultForSamplingSession:(id)a3 isActive:(BOOL *)a4
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"date"]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"result"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"duration"]);
  unsigned int v10 = [v9 BOOLValue];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (!v6)
  {
LABEL_4:
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_9;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:(double)v10]);
  if ([v11 compare:v12] != (id)-1)
  {

    goto LABEL_4;
  }

  if (a4) {
    *a4 = 1;
  }

LABEL_9:
  return v8;
}

+ (BOOL)_shouldSampleWithPercentage:(double)a3 sessionDuration:(double)a4 identifier:(id)a5
{
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"SSSampleSession",  a5));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _valueForKey:v8]);
  char v19 = 0;
  unsigned __int8 v10 = [a1 _resultForSamplingSession:v9 isActive:&v19];
  if (v19)
  {
    LOBYTE(v11) = v10;
  }

  else
  {
    [a1 _randomDouble];
    BOOL v13 = v12 >= 0.0;
    if (v12 > 1.0) {
      BOOL v13 = 0;
    }
    uint64_t v11 = v12 <= a3 && v13;
    if (a4 > 0.0)
    {
      v20[0] = @"date";
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v21[0] = v14;
      v20[1] = @"result";
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
      v21[1] = v15;
      v20[2] = @"duration";
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
      v21[2] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));

      [a1 _setValue:v17 forKey:v8];
    }
  }

  return v11;
}

+ (id)_valueForKey:(id)a3
{
  id v3 = (const __CFString *)kSSUserDefaultsIdentifier;
  v4 = (__CFString *)a3;
  CFPreferencesAppSynchronize(v3);
  id v5 = (void *)CFPreferencesCopyAppValue(v4, v3);

  return v5;
}

+ (void)_setValue:(id)a3 forKey:(id)a4
{
  v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v4);
}

- (DeviceScorerContext)context
{
  return (DeviceScorerContext *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end