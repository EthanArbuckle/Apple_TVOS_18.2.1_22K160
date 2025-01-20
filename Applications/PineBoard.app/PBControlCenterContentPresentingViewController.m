@interface PBControlCenterContentPresentingViewController
- (PBControlCenterContentPresentingViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewService:(id)a3 handleDismissWithResult:(id)a4 completion:(id)a5;
@end

@implementation PBControlCenterContentPresentingViewController

- (void)viewService:(id)a3 handleDismissWithResult:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"result != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100280894(a2);
    }
LABEL_12:
    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FD7DCLL);
  }

  v12 = (void (**)(void, void))v11;
  if (!v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100280950(a2);
    }
    goto LABEL_12;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained controlCenterContentPresentingViewController:self handleDismissWithResult:v10 completion:v12];
  }
  else {
    v12[2](v12, 1LL);
  }
}

- (PBControlCenterContentPresentingViewControllerDelegate)delegate
{
  return (PBControlCenterContentPresentingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end