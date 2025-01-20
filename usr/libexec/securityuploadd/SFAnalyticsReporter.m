@interface SFAnalyticsReporter
- (BOOL)saveReport:(id)a3 fileName:(id)a4;
@end

@implementation SFAnalyticsReporter

- (BOOL)saveReport:(id)a3 fileName:(id)a4
{
  id v5 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000053BC;
  v10[3] = &unk_100018640;
  id v11 = a4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v11;
  char v8 = OSAWriteLogForSubmission(@"226", v7, 0LL, 0LL, v10);

  return v8;
}

@end