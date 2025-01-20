@interface SWCAnalyticsLogger
+ (id)sharedLogger;
- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4;
@end

@implementation SWCAnalyticsLogger

+ (id)sharedLogger
{
  if (qword_10002E848 != -1) {
    dispatch_once(&qword_10002E848, &stru_100028AA8);
  }
  return (id)qword_10002E850;
}

- (void)logAASAFileDownloadEventWithDomain:(id)a3 route:(unsigned __int8)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000C858;
  v4[3] = &unk_100028AC8;
  unsigned __int8 v5 = a4;
  AnalyticsSendEventLazy(@"com.apple.SharedWebCredentials.StartAASAFileDownload", v4, a3);
}

@end