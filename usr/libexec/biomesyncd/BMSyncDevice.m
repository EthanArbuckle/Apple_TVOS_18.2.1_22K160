@interface BMSyncDevice
+ (id)currentDevice;
- (int64_t)platform;
@end

@implementation BMSyncDevice

+ (id)currentDevice
{
  if (qword_10007C358 != -1) {
    dispatch_once(&qword_10007C358, &stru_100069478);
  }
  return (id)qword_10007C350;
}

- (int64_t)platform
{
  return self->_platform;
}

@end