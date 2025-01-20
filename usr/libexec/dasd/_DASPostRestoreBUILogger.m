@interface _DASPostRestoreBUILogger
+ (id)sharedInstance;
- (OS_os_log)log;
- (_DASPostRestoreBUILogger)init;
- (_DASRuntimeLimiter)runtimeLimiter;
- (void)reportState:(unint64_t)a3 forActivity:(id)a4;
- (void)reportState:(unint64_t)a3 forTaskName:(id)a4 featureCode:(id)a5 involvedProcesses:(id)a6;
- (void)setLog:(id)a3;
- (void)setRuntimeLimiter:(id)a3;
@end

@implementation _DASPostRestoreBUILogger

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100065AA8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157BB0 != -1) {
    dispatch_once(&qword_100157BB0, block);
  }
  return (id)qword_100157BA8;
}

- (_DASPostRestoreBUILogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASPostRestoreBUILogger;
  v2 = -[_DASPostRestoreBUILogger init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"postRestoreBUILogger"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](&OBJC_CLASS____DASRuntimeLimiter, "sharedLimiter"));
    runtimeLimiter = v2->_runtimeLimiter;
    v2->_runtimeLimiter = (_DASRuntimeLimiter *)v5;
  }

  return v2;
}

- (void)reportState:(unint64_t)a3 forActivity:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fastPass]);

  if (v7
    && (a3 != 10
     || !-[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:]( self->_runtimeLimiter,  "featureHasNoRemainingRuntimeForActivity:",  v6)))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 featureCodes]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
      v14 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      -[_DASPostRestoreBUILogger reportState:forTaskName:featureCode:involvedProcesses:]( self,  "reportState:forTaskName:featureCode:involvedProcesses:",  a3,  v9,  v10,  v12);
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1000B5E7C(log, v6);
      }
    }
  }
}

- (void)reportState:(unint64_t)a3 forTaskName:(id)a4 featureCode:(id)a5 involvedProcesses:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((uint64_t)a3 > 29)
  {
    if (a3 != 30 && a3 != 50) {
      goto LABEL_15;
    }
    unint64_t v13 = 30LL;
  }

  else
  {
    unint64_t v13 = a3;
    if (a3 != 10)
    {
      if (a3 != 20) {
        goto LABEL_15;
      }
      unint64_t v13 = 20LL;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v14 setObject:v10 forKeyedSubscript:@"fastPassName"];
  [v14 setObject:v11 forKeyedSubscript:@"featureCodes"];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13));
  [v14 setObject:v15 forKeyedSubscript:@"state"];

  [v14 setObject:v12 forKeyedSubscript:@"processName"];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Reporting %@ for BUI via PPS",  (uint8_t *)&v20,  0xCu);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v17 sendDataToPPS:v14 subsystem:@"XPCMetrics" category:@"OngoingRestore"];

  if (a3 == 30)
  {
    [v14 setObject:&off_100121F48 forKeyedSubscript:@"state"];
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Reporting %@ for BUI via PPS",  (uint8_t *)&v20,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
    [v19 sendDataToPPS:v14 subsystem:@"XPCMetrics" category:@"OngoingRestore"];
  }

LABEL_15:
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end