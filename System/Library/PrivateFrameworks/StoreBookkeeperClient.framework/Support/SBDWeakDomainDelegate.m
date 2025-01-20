@interface SBDWeakDomainDelegate
- (SBDPushNotificationControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SBDWeakDomainDelegate

- (SBDPushNotificationControllerDelegate)delegate
{
  return (SBDPushNotificationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end