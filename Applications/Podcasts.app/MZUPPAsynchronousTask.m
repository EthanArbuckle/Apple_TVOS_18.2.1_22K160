@interface MZUPPAsynchronousTask
- (BOOL)reportMetrics;
- (MZUPPAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6 reportMetrics:(BOOL)a7;
- (MZUPPMetrics)metrics;
- (void)beginTaskOperation;
- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4;
- (void)setMetrics:(id)a3;
- (void)setReportMetrics:(BOOL)a3;
@end

@implementation MZUPPAsynchronousTask

- (MZUPPAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6 reportMetrics:(BOOL)a7
{
  BOOL v7 = a7;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MZUPPAsynchronousTask;
  v8 = -[MZAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:]( &v11,  "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:",  a3,  a6,  a4,  a5);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___MZUPPMetrics);
    -[MZUPPAsynchronousTask setMetrics:](v8, "setMetrics:", v9);

    -[MZUPPAsynchronousTask setReportMetrics:](v8, "setReportMetrics:", v7);
  }

  return v8;
}

- (void)beginTaskOperation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MZUPPAsynchronousTask;
  -[MZAsynchronousTask beginTaskOperation](&v6, "beginTaskOperation");
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  [v5 setSyncTaskStartTime:v4];
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MZUPPAsynchronousTask;
  id v7 = a3;
  -[MZAsynchronousTask finishTaskOperationWithResult:error:](&v25, "finishTaskOperationWithResult:error:", v7, v6);
  id v8 = objc_msgSend(v7, "BOOLValue", v25.receiver, v25.super_class);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  [v9 setSuccess:v8];

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
    [v11 setErrorDomain:v10];

    id v12 = [v6 code];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
    [v13 setErrorCode:v12];
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  [v16 setSyncTaskEndTime:v15];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 metricsDictionary]);

  uint64_t v20 = _MTLogCategoryUPPSync(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = -[MZUPPAsynchronousTask reportMetrics](self, "reportMetrics");
    v23 = @"not ";
    if (v22) {
      v23 = &stru_100248948;
    }
    *(_DWORD *)buf = 138412546;
    v27 = v23;
    __int16 v28 = 2112;
    v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will %@report UPP metrics %@", buf, 0x16u);
  }

  if (-[MZUPPAsynchronousTask reportMetrics](self, "reportMetrics"))
  {
    id v24 = objc_alloc_init(&OBJC_CLASS___IMAMSMetricsEvent);
    [v24 setEventType:@"uppsync"];
    objc_msgSend(v24, "im_addPropertiesWithDictionary:", v18);
    +[IMMetrics recordEvent:topic:](&OBJC_CLASS___IMMetrics, "recordEvent:topic:", v24, @"xp_amp_podcasts_log");
  }
}

- (MZUPPMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BOOL)reportMetrics
{
  return self->_reportMetrics;
}

- (void)setReportMetrics:(BOOL)a3
{
  self->_reportMetrics = a3;
}

- (void).cxx_destruct
{
}

@end