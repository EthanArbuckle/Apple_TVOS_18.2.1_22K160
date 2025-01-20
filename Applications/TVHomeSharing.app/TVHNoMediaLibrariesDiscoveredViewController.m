@interface TVHNoMediaLibrariesDiscoveredViewController
+ (id)init;
- (TVHNoMediaLibrariesDiscoveredView)noMediaLibrariesDiscoveredView;
- (TVHNoMediaLibrariesDiscoveredViewController)init;
- (TVHNoMediaLibrariesDiscoveredViewController)initWithAccountName:(id)a3;
- (TVHNoMediaLibrariesDiscoveredViewController)initWithCoder:(id)a3;
- (TVHNoMediaLibrariesDiscoveredViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHNoMediaLibrariesDiscoveredViewControllerDelegate)delegate;
- (void)loadView;
- (void)noMediaLibrariesFoundViewDidSelectRetry:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNoMediaLibrariesDiscoveredView:(id)a3;
@end

@implementation TVHNoMediaLibrariesDiscoveredViewController

+ (id)init
{
  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHNoMediaLibrariesDiscoveredViewController)initWithAccountName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHNoMediaLibrariesDiscoveredViewController;
  v5 = -[TVHNoMediaLibrariesDiscoveredViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0LL, 0LL);
  if (v5)
  {
    v6 = -[TVHNoMediaLibrariesDiscoveredView initWithAccountName:]( objc_alloc(&OBJC_CLASS___TVHNoMediaLibrariesDiscoveredView),  "initWithAccountName:",  v4);
    noMediaLibrariesDiscoveredView = v5->_noMediaLibrariesDiscoveredView;
    v5->_noMediaLibrariesDiscoveredView = v6;

    -[TVHNoMediaLibrariesDiscoveredView setDelegate:](v5->_noMediaLibrariesDiscoveredView, "setDelegate:", v5);
  }

  return v5;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[TVHNoMediaLibrariesDiscoveredViewController noMediaLibrariesDiscoveredView]( self,  "noMediaLibrariesDiscoveredView"));
  -[TVHNoMediaLibrariesDiscoveredViewController setView:](self, "setView:", v3);
}

- (void)noMediaLibrariesFoundViewDidSelectRetry:(id)a3
{
  id v4 = sub_10007A1C8();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "User has selected to restart media library discovery",  v7,  2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHNoMediaLibrariesDiscoveredViewController delegate](self, "delegate"));
  [v6 restartMediaLibraryDiscoveryForNoMediaLibrariesDiscoveredViewController:self];
}

- (TVHNoMediaLibrariesDiscoveredViewControllerDelegate)delegate
{
  return (TVHNoMediaLibrariesDiscoveredViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHNoMediaLibrariesDiscoveredView)noMediaLibrariesDiscoveredView
{
  return self->_noMediaLibrariesDiscoveredView;
}

- (void)setNoMediaLibrariesDiscoveredView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end