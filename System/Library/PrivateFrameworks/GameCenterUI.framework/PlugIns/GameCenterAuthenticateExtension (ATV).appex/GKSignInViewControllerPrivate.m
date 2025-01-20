@interface GKSignInViewControllerPrivate
- (GKAuthenticateExtensionViewController)authExtensionViewController;
- (void)cancelSignIn;
- (void)setAuthExtensionViewController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKSignInViewControllerPrivate

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKSignInViewControllerPrivate;
  -[GKSignInViewControllerPrivate viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[GKSignInViewControllerPrivate _setViewHostsLayoutEngine:](self, "_setViewHostsLayoutEngine:", 1LL);
}

- (GKAuthenticateExtensionViewController)authExtensionViewController
{
  authExtensionViewController = self->_authExtensionViewController;
  if (authExtensionViewController)
  {
    v3 = authExtensionViewController;
  }

  else
  {
    v3 = (GKAuthenticateExtensionViewController *)objc_claimAutoreleasedReturnValue( -[GKSignInViewControllerPrivate parentViewController]( self,  "parentViewController"));
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___GKAuthenticateExtensionViewController);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKSignInViewControllerPrivate navigationController](self, "navigationController"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 navigationController]);

      v3 = (GKAuthenticateExtensionViewController *)v7;
    }
  }

  return v3;
}

- (void)cancelSignIn
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers(self, a2);
  }
  objc_super v4 = (os_log_s *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "GKAuthenticateExtensionViewController: cancelSignIn",  v6,  2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKSignInViewControllerPrivate authExtensionViewController](self, "authExtensionViewController"));
  [v5 extensionIsCanceling];
}

- (void)setAuthExtensionViewController:(id)a3
{
  self->_authExtensionViewController = (GKAuthenticateExtensionViewController *)a3;
}

@end