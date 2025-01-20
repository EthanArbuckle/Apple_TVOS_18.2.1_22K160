@interface PBMediaRemoteServicePresentationInfo
- (PBDialogContext)dialogContext;
- (UIViewController)viewController;
- (void)setDialogContext:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation PBMediaRemoteServicePresentationInfo

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (PBDialogContext)dialogContext
{
  return self->_dialogContext;
}

- (void)setDialogContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end