@interface DPDBackgroundTaskManager
+ (id)sharedInstance;
- (DPDBackgroundTaskManager)init;
@end

@implementation DPDBackgroundTaskManager

+ (id)sharedInstance
{
  if (qword_10000CA20 != -1) {
    swift_once(&qword_10000CA20, sub_100004744);
  }
  return (id)qword_10000CD80;
}

- (DPDBackgroundTaskManager)init
{
  return (DPDBackgroundTaskManager *)sub_1000047B0();
}

- (void).cxx_destruct
{
}

@end