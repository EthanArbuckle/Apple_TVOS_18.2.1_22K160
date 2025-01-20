@interface TVSettingsHomeSetupController
- (UINavigationController)navigationController;
- (UIViewController)presentingViewController;
- (UIViewController)roomPickerInitialViewController;
- (id)_makeHomePickerViewController;
- (id)_makeRoomPickerViewController;
- (id)_makeRoomPickerViewControllerWithHome:(id)a3;
- (id)completionHandler;
- (void)homePickerViewController:(id)a3 didSelectHome:(id)a4;
- (void)pushRoomPickerFromInitialViewController:(id)a3;
- (void)roomPickerViewControllerDidFinish:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRoomPickerInitialViewController:(id)a3;
- (void)startSetupWithType:(int64_t)a3 presentingViewController:(id)a4;
- (void)wholeHomeAudioSetupViewControllerDidTransitionToConfiguredState:(id)a3;
- (void)wholeHomeAudioSetupViewControllerDidTransitionToUnconfiguredWithLocalAccessoryState:(id)a3;
@end

@implementation TVSettingsHomeSetupController

- (void)startSetupWithType:(int64_t)a3 presentingViewController:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000EB004();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Starting WHA Setup. {presentingViewController=%p}",  (uint8_t *)&v15,  0xCu);
  }

  v9 = -[TVSettingsWholeHomeAudioSetupViewController initWithAdvertisingType:]( objc_alloc(&OBJC_CLASS___TVSettingsWholeHomeAudioSetupViewController),  "initWithAdvertisingType:",  a3);
  -[TVSettingsWholeHomeAudioSetupViewController setDelegate:](v9, "setDelegate:", self);
  if (a3 == 1)
  {
    uint64_t v10 = TSKLocString(@"WHASetupRepairCDPTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TVSettingsWholeHomeAudioSetupViewController setHeadlineText:](v9, "setHeadlineText:", v11);
  }

  v12 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v9);
  navigationController = self->_navigationController;
  self->_navigationController = v12;

  v14 = -[_TSKSplitViewController initWithNavigationController:]( objc_alloc(&OBJC_CLASS____TSKSplitViewController),  "initWithNavigationController:",  self->_navigationController);
  [v6 presentViewController:v14 animated:1 completion:0];
  objc_storeWeak((id *)&self->_presentingViewController, v6);
}

- (void)pushRoomPickerFromInitialViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000EB004();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Pushing room picker. {initialViewController=%p}",  (uint8_t *)&v9,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeSetupController _makeRoomPickerViewController](self, "_makeRoomPickerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationController]);
  [v8 pushViewController:v7 animated:1];

  objc_storeWeak((id *)&self->_roomPickerInitialViewController, v4);
}

- (void)roomPickerViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v6 = objc_loadWeakRetained((id *)&self->_roomPickerInitialViewController);
  id v7 = sub_1000EB004();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218240;
    id v13 = WeakRetained;
    __int16 v14 = 2048;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Room picker did finish. {presentingViewController=%p, initialViewController=%p}",  (uint8_t *)&v12,  0x16u);
  }

  if (WeakRetained)
  {
    [WeakRetained dismissViewControllerAnimated:1 completion:self->_completionHandler];
  }

  else
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 navigationController]);
    id v10 = [v9 popToViewController:v6 animated:1];

    completionHandler = (void (**)(void))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2]();
    }
  }
}

- (void)homePickerViewController:(id)a3 didSelectHome:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeSetupController _makeRoomPickerViewControllerWithHome:]( self,  "_makeRoomPickerViewControllerWithHome:",  a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 navigationController]);

  [v7 pushViewController:v8 animated:1];
}

- (void)wholeHomeAudioSetupViewControllerDidTransitionToConfiguredState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained dismissViewControllerAnimated:1 completion:self->_completionHandler];
}

- (void)wholeHomeAudioSetupViewControllerDidTransitionToUnconfiguredWithLocalAccessoryState:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeSetupController _makeRoomPickerViewController]( self,  "_makeRoomPickerViewController",  a3));
  navigationController = self->_navigationController;
  id v7 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  -[UINavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v6, 1LL);
}

- (id)_makeRoomPickerViewController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localAccessory]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 home]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allOwnedHomes]);
  id v7 = sub_1000EB004();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    id v20 = [v6 count];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Begin make picker view controller. allOwnedHomesCount: %lu",  (uint8_t *)&v19,  0xCu);
  }

  if (v5)
  {
    id v9 = sub_1000EB004();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "The device is already part of a home. Making a room picker for that home.",  (uint8_t *)&v19,  2u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[TVSettingsHomeSetupController _makeRoomPickerViewControllerWithHome:]( self,  "_makeRoomPickerViewControllerWithHome:",  v5));
LABEL_11:
    id v16 = (void *)v11;
    goto LABEL_12;
  }

  id v12 = [v6 count];
  id v13 = sub_1000EB004();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v12 >= 2)
  {
    if (v15)
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found multiple homes. Making a home picker.",  (uint8_t *)&v19,  2u);
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TVSettingsHomeSetupController _makeHomePickerViewController](self, "_makeHomePickerViewController"));
    goto LABEL_11;
  }

  if (v15)
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Making room picker.", (uint8_t *)&v19, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsHomeSetupController _makeRoomPickerViewControllerWithHome:]( self,  "_makeRoomPickerViewControllerWithHome:",  v18));

LABEL_12:
  return v16;
}

- (id)_makeHomePickerViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsWholeHomeAudioHomePickerViewController);
  -[TVSettingsWholeHomeAudioHomePickerViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (id)_makeRoomPickerViewControllerWithHome:(id)a3
{
  id v4 = a3;
  id v5 = -[TVSettingsWholeHomeAudioRoomPickerViewController initWithHome:]( objc_alloc(&OBJC_CLASS___TVSettingsWholeHomeAudioRoomPickerViewController),  "initWithHome:",  v4);

  -[TVSettingsWholeHomeAudioRoomPickerViewController setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)roomPickerInitialViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_roomPickerInitialViewController);
}

- (void)setRoomPickerInitialViewController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end