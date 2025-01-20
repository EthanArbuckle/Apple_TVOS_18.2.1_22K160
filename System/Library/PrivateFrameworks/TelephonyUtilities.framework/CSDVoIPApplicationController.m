@interface CSDVoIPApplicationController
- (BOOL)shouldAllowIncomingCall:(id)a3;
- (CSDCallStateController)callStateController;
- (CSDVoIPApplicationController)init;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDVoIPApplicationController

- (CSDVoIPApplicationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDVoIPApplicationController;
  return -[CSDVoIPApplicationController init](&v3, "init");
}

- (BOOL)shouldAllowIncomingCall:(id)a3
{
  return 1;
}

- (CSDCallStateController)callStateController
{
  return (CSDCallStateController *)objc_loadWeakRetained((id *)&self->_callStateController);
}

- (void)setCallStateController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end