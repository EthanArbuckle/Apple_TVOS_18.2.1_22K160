@interface PBBulletinInfo
- (BOOL)insertAtFrontOfQueue;
- (BOOL)isMultiCamBulletin;
- (BOOL)isVideoBulletin;
- (NSNumber)requestID;
- (NSString)serviceIdentifier;
- (NSString)viewControllerClassName;
- (PBBulletinContentPresentingViewController)contentPresentingViewController;
- (PBRemoteBulletinViewController)bulletinViewController;
- (double)timeoutInSeconds;
- (id)clientPresentationCompletion;
- (void)setBulletinViewController:(id)a3;
- (void)setClientPresentationCompletion:(id)a3;
- (void)setContentPresentingViewController:(id)a3;
- (void)setInsertAtFrontOfQueue:(BOOL)a3;
- (void)setRequestID:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimeoutInSeconds:(double)a3;
- (void)setViewControllerClassName:(id)a3;
@end

@implementation PBBulletinInfo

- (BOOL)insertAtFrontOfQueue
{
  return self->_insertAtFrontOfQueue;
}

- (void)setInsertAtFrontOfQueue:(BOOL)a3
{
  self->_insertAtFrontOfQueue = a3;
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(double)a3
{
  self->_timeoutInSeconds = a3;
}

- (PBBulletinContentPresentingViewController)contentPresentingViewController
{
  return self->_contentPresentingViewController;
}

- (void)setContentPresentingViewController:(id)a3
{
}

- (PBRemoteBulletinViewController)bulletinViewController
{
  return self->_bulletinViewController;
}

- (void)setBulletinViewController:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSNumber)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (id)clientPresentationCompletion
{
  return self->_clientPresentationCompletion;
}

- (void)setClientPresentationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)isVideoBulletin
{
  return -[NSString isEqual:]( self->_viewControllerClassName,  "isEqual:",  PBSVideoSystemBulletinViewControllerClassName);
}

- (BOOL)isMultiCamBulletin
{
  return -[NSString isEqualToString:]( self->_viewControllerClassName,  "isEqualToString:",  PBSMultiCamSystemBulletinViewControllerClassName);
}

@end