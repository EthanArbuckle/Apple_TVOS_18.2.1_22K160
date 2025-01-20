@interface SatelliteSMSUtilities
+ (BOOL)systemSupportsSatelliteSMS;
+ (OS_os_log)logger;
@end

@implementation SatelliteSMSUtilities

+ (OS_os_log)logger
{
  if (qword_82C0 != -1) {
    dispatch_once(&qword_82C0, &stru_4298);
  }
  return (OS_os_log *)(id)qword_82B8;
}

+ (BOOL)systemSupportsSatelliteSMS
{
  return 0;
}
@end