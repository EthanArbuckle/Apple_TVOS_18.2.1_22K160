@interface _GEOExperimentServiceRequester
+ (id)sharedInstance;
- (void)cancelRequest:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5;
@end

@implementation _GEOExperimentServiceRequester

+ (id)sharedInstance
{
  if (qword_10006AF30 != -1) {
    dispatch_once(&qword_10006AF30, &stru_1000592E0);
  }
  return (id)qword_10006AF38;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t Log = GEOGreenTeaGetLog();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[GEOApplicationAuditToken currentProcessAuditToken]( &OBJC_CLASS___GEOApplicationAuditToken,  "currentProcessAuditToken"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_GEOExperimentServiceRequestConfig standardConfig]( &OBJC_CLASS____GEOExperimentServiceRequestConfig,  "standardConfig"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000A3CC;
  v16[3] = &unk_100059308;
  id v17 = v9;
  id v15 = v9;
  -[_GEOExperimentServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:]( self,  "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:",  v8,  v10,  v13,  v14,  0LL,  0LL,  v16);
}

- (void)cancelRequest:(id)a3
{
}

@end