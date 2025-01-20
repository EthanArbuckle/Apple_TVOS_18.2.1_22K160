@interface PBUserNotificationNavigationController
- (PBCFUserNotification)notification;
- (PBUserNotificationNavigationController)initWithUserNotificationViewController:(id)a3;
- (PBUserNotificationViewController)userNotificationViewController;
- (PBUserNotificationViewControllerDelegate)delegate;
- (void)didCancelUserNotificationViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotification:(id)a3;
- (void)setUserNotificationViewController:(id)a3;
- (void)userNotificationViewController:(id)a3 didSelectButtonIndex:(unint64_t)a4;
@end

@implementation PBUserNotificationNavigationController

- (PBUserNotificationNavigationController)initWithUserNotificationViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBUserNotificationNavigationController;
  v6 = -[PBUserNotificationNavigationController initWithRootViewController:](&v10, "initWithRootViewController:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userNotificationViewController, a3);
    -[PBUserNotificationViewController setDelegate:](v7->_userNotificationViewController, "setDelegate:", v7);
    -[PBUserNotificationNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 8LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationNavigationController navigationBar](v7, "navigationBar"));
    [v8 setHidden:1];
  }

  return v7;
}

- (PBCFUserNotification)notification
{
  return (PBCFUserNotification *)(id)objc_claimAutoreleasedReturnValue( -[PBUserNotificationViewController notification]( self->_userNotificationViewController,  "notification"));
}

- (void)setNotification:(id)a3
{
}

- (void)userNotificationViewController:(id)a3 didSelectButtonIndex:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 userNotificationViewController:self didSelectButtonIndex:a4];
  }

- (void)didCancelUserNotificationViewController:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 didCancelUserNotificationViewController:self];
  }

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBUserNotificationViewController)userNotificationViewController
{
  return self->_userNotificationViewController;
}

- (void)setUserNotificationViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end