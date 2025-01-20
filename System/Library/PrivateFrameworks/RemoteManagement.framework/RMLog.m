@interface RMLog
+ (id)httpconduitstate;
+ (id)managementSettings;
+ (id)mdmconduitstate;
+ (id)predicateDescription;
+ (id)storeHelper;
@end

@implementation RMLog

+ (id)httpconduitstate
{
  if (qword_100025390 != -1) {
    dispatch_once(&qword_100025390, &stru_10001C588);
  }
  return (id)qword_100025388;
}

+ (id)managementSettings
{
  if (qword_1000253B0 != -1) {
    dispatch_once(&qword_1000253B0, &stru_10001C6B8);
  }
  return (id)qword_1000253A8;
}

+ (id)mdmconduitstate
{
  if (qword_1000253D0 != -1) {
    dispatch_once(&qword_1000253D0, &stru_10001C6F8);
  }
  return (id)qword_1000253C8;
}

+ (id)predicateDescription
{
  if (qword_1000253E0 != -1) {
    dispatch_once(&qword_1000253E0, &stru_10001C718);
  }
  return (id)qword_1000253D8;
}

+ (id)storeHelper
{
  if (qword_1000253F0 != -1) {
    dispatch_once(&qword_1000253F0, &stru_10001C780);
  }
  return (id)qword_1000253E8;
}

@end