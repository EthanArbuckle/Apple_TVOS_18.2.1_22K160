@interface AKAnalyticsReporterRTC
+ (id)rtcAnalyticsReporter;
@end

@implementation AKAnalyticsReporterRTC

+ (id)rtcAnalyticsReporter
{
  if (qword_10020F378 != -1) {
    dispatch_once(&qword_10020F378, &stru_1001C79E0);
  }
  return (id)qword_10020F370;
}

@end