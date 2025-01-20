@interface KTReportDBMetricsOperation
- (KTOperationDependencies)deps;
- (KTReportDBMetricsOperation)initWithDependencies:(id)a3;
- (void)groupStart;
- (void)logSharedMetrics;
- (void)setDeps:(id)a3;
@end

@implementation KTReportDBMetricsOperation

- (KTReportDBMetricsOperation)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KTReportDBMetricsOperation;
  v6 = -[KTGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._startOperation, a3);
  }

  return v7;
}

- (void)groupStart
{
  if (qword_1002E6500 != -1) {
    dispatch_once(&qword_1002E6500, &stru_10027AAF0);
  }
  v3 = (os_log_s *)qword_1002E6508;
  if (os_log_type_enabled((os_log_t)qword_1002E6508, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: start", buf, 2u);
  }

  -[KTReportDBMetricsOperation logSharedMetrics](self, "logSharedMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataStore]);
  [v5 logMetricsForApplication:kKTApplicationIdentifierIDS error:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataStore]);
  [v7 logMetricsForApplication:kKTApplicationIdentifierIDSFaceTime error:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataStore]);
  [v9 logMetricsForApplication:kKTApplicationIdentifierIDSMultiplex error:0];

  if (qword_1002E6500 != -1) {
    dispatch_once(&qword_1002E6500, &stru_10027AB10);
  }
  v10 = (os_log_s *)qword_1002E6508;
  if (os_log_type_enabled((os_log_t)qword_1002E6508, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: end", v11, 2u);
  }

- (void)logSharedMetrics
{
  id v13 = 0LL;
  int64_t v3 = +[TransparencyFileSupport directorySizeInKB:](&OBJC_CLASS___TransparencyFileSupport, "directorySizeInKB:", &v13);
  id v4 = v13;
  if (v3 < 0)
  {
    if (qword_1002E6500 != -1) {
      dispatch_once(&qword_1002E6500, &stru_10027AB30);
    }
    id v5 = (os_log_s *)qword_1002E6508;
    if (os_log_type_enabled((os_log_t)qword_1002E6508, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "failed to get support directory size: %@",  buf,  0xCu);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logger]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
  [v7 logMetric:v8 withName:@"ktTotalStorageSize"];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataStore]);
  id v12 = v4;
  [v10 logSTHMetricsForApplication:kKTApplicationIdentifierTLT error:&v12];
  id v11 = v12;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end