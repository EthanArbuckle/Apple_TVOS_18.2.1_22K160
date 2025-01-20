@interface TVSettingsRenameIRDeviceViewController
- (NSUUID)deviceUUID;
- (TVSettingsRemoteConfiguration)configuration;
- (TVSettingsRemotesFacade)remotesFacade;
- (TVSettingsRenameIRDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)completionHandler;
- (void)editingController:(id)a3 didCancelForSettingItem:(id)a4;
- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setRemotesFacade:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsRenameIRDeviceViewController

- (TVSettingsRenameIRDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsRenameIRDeviceViewController;
  v4 = -[TVSettingsRenameIRDeviceViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4) {
    -[TVSettingsRenameIRDeviceViewController setEditingDelegate:](v4, "setEditingDelegate:", v4);
  }
  return v5;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsRenameIRDeviceViewController;
  -[TVSettingsRenameIRDeviceViewController viewDidLoad](&v8, "viewDidLoad");
  uint64_t v3 = TSKLocString(@"RCRenameLearnedRemoteTextFieldTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVSettingsRenameIRDeviceViewController setHeaderText:](self, "setHeaderText:", v4);

  uint64_t v5 = TSKLocString(@"RCRenameLearnedRemoteTextFieldMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[TVSettingsRenameIRDeviceViewController setMessageText:](self, "setMessageText:", v6);

  -[TVSettingsRenameIRDeviceViewController setSecureTextEntry:](self, "setSecureTextEntry:", 0LL);
  -[TVSettingsRenameIRDeviceViewController setCapitalizationType:](self, "setCapitalizationType:", 1LL);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsRemoteConfiguration deviceName](self->_configuration, "deviceName"));
  -[TVSettingsRenameIRDeviceViewController setInitialText:](self, "setInitialText:", v7);
}

- (void)editingController:(id)a3 didProvideValue:(id)a4 forSettingItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
  id v12 = v9;
  v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      v14 = v13;
    }
    else {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = v14;

  if (v15 && [v15 length])
  {
    objc_initWeak(&location, self);
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_10004F34C;
    v23 = &unk_10018E810;
    objc_copyWeak(&v24, &location);
    v16 = objc_retainBlock(&v20);
    p_configuration = (uint64_t *)&self->_configuration;
    configuration = self->_configuration;
    if (configuration)
    {
      -[TVSettingsRemotesFacade setName:forConfiguration:withCompletionHandler:]( self->_remotesFacade,  "setName:forConfiguration:withCompletionHandler:",  v15,  configuration,  v16,  v20,  v21,  v22,  v23);
    }

    else
    {
      p_deviceUUID = (uint64_t *)&self->_deviceUUID;
      if (*p_deviceUUID)
      {
        +[TVSettingsRemotesFacade setName:forDeviceUUID:withCompletionHandler:]( &OBJC_CLASS___TVSettingsRemotesFacade,  "setName:forDeviceUUID:withCompletionHandler:",  v15,  *p_deviceUUID,  v16,  v20,  v21,  v22,  v23);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000F7A38(p_configuration, p_deviceUUID);
        }
        ((void (*)(void ***))v16[2])(v16);
      }
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)editingController:(id)a3 didCancelForSettingItem:(id)a4
{
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVSettingsRenameIRDeviceViewController completionHandler](self, "completionHandler", a3, a4));
  if (v4)
  {
    uint64_t v5 = v4;
    v4[2]();
    v4 = v5;
  }
}

- (TVSettingsRemotesFacade)remotesFacade
{
  return self->_remotesFacade;
}

- (void)setRemotesFacade:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (TVSettingsRemoteConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end