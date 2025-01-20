@interface SWCAnalyticsLogger
+ (id)sharedLogger;
- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4;
@end

@implementation SWCAnalyticsLogger

+ (id)sharedLogger
{
  if (qword_1000371F8 != -1) {
    dispatch_once(&qword_1000371F8, &stru_100030DA8);
  }
  return (id)qword_100037200;
}

- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000144E8;
  v4[3] = &unk_100030DC8;
  unsigned __int8 v5 = a4;
  AnalyticsSendEventLazy(@"com.apple.SharedWebCredentials.StartAASAFileDownload", v4, a3);
}

@end