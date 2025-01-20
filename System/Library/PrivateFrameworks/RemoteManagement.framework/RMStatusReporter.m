@interface RMStatusReporter
+ (id)newStatusReporterWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4;
- (BOOL)onlyIfNeeded;
- (RMStatusEngine)statusEngine;
- (RMStatusReporter)initWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4;
- (RMStatusSubscriptionQueryResult)statusQueryResult;
- (id)statusReportReturningError:(id *)a3;
- (void)acknowledgeStatusSent;
- (void)setOnlyIfNeeded:(BOOL)a3;
- (void)setStatusEngine:(id)a3;
- (void)setStatusQueryResult:(id)a3;
@end

@implementation RMStatusReporter

+ (id)newStatusReporterWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = -[RMStatusReporter initWithStatusEngine:onlyIfNeeded:]( objc_alloc(&OBJC_CLASS___RMStatusReporter),  "initWithStatusEngine:onlyIfNeeded:",  v5,  v4);

  return v6;
}

- (RMStatusReporter)initWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RMStatusReporter;
  v8 = -[RMStatusReporter init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_statusEngine, a3);
    v9->_onlyIfNeeded = a4;
    statusQueryResult = v9->_statusQueryResult;
    v9->_statusQueryResult = 0LL;
  }

  return v9;
}

- (id)statusReportReturningError:(id *)a3
{
  unsigned __int8 v5 = -[RMStatusReporter onlyIfNeeded](self, "onlyIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusEngine](self, "statusEngine"));
  id v7 = v6;
  if ((v5 & 1) != 0) {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 queryForUnacknowledgedStatusSubscriptions]);
  }
  else {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 queryForStatusSubscriptions]);
  }
  v9 = (void *)v8;
  -[RMStatusReporter setStatusQueryResult:](self, "setStatusQueryResult:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusQueryResult](self, "statusQueryResult"));
  LOBYTE(v9) = [v10 hasStatusToReport];

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusQueryResult](self, "statusQueryResult"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "protocolStatusReportWithFullReport:",  -[RMStatusReporter onlyIfNeeded](self, "onlyIfNeeded") ^ 1));

    id v18 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 serializeAsDataWithType:1 error:&v18]);
    id v14 = v18;
    if (v13)
    {
      id v15 = v13;
    }

    else
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusReporter](&OBJC_CLASS___RMLog, "statusReporter"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10005EE00((uint64_t)v14, v16);
      }

      if (a3 && v14) {
        *a3 = v14;
      }
    }
  }

  else
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[RMLog statusReporter](&OBJC_CLASS___RMLog, "statusReporter"));
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG)) {
      sub_10005EE74((os_log_t)v14);
    }
    v13 = 0LL;
  }

  return v13;
}

- (void)acknowledgeStatusSent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusQueryResult](self, "statusQueryResult"));
  unsigned int v4 = [v3 hasStatusToReport];

  if (v4)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusEngine](self, "statusEngine"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusReporter statusQueryResult](self, "statusQueryResult"));
    [v6 acknowledgeStatusSubscriptions:v5];
  }

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (BOOL)onlyIfNeeded
{
  return self->_onlyIfNeeded;
}

- (void)setOnlyIfNeeded:(BOOL)a3
{
  self->_onlyIfNeeded = a3;
}

- (RMStatusSubscriptionQueryResult)statusQueryResult
{
  return self->_statusQueryResult;
}

- (void)setStatusQueryResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end