@interface CSOpportuneSpeakListenerDeviceManager
+ (id)sharedManager;
- (NSString)deviceId;
- (void)setDeviceId:(id)a3;
@end

@implementation CSOpportuneSpeakListenerDeviceManager

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  if (qword_100280090 != -1) {
    dispatch_once(&qword_100280090, &stru_10022D650);
  }
  return (id)qword_100280088;
}

@end