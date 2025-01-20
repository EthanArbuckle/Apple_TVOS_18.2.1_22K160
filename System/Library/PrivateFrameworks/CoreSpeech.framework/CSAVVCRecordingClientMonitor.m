@interface CSAVVCRecordingClientMonitor
+ (id)sharedInstance;
- (CSAVVCRecordingClientMonitor)init;
- (unint64_t)numOfAVVCRecordingClients;
@end

@implementation CSAVVCRecordingClientMonitor

- (CSAVVCRecordingClientMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAVVCRecordingClientMonitor;

  return 0LL;
}

- (unint64_t)numOfAVVCRecordingClients
{
  return self->_numOfAVVCRecordingClients;
}

+ (id)sharedInstance
{
  return 0LL;
}

@end