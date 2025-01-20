@interface TVSettingsAccountsFacadePasswordSetting
+ (id)keyPathsForValuesAffectingAsnFreeSetting;
+ (id)keyPathsForValuesAffectingAsnPaidSetting;
- (ACAccount)account;
- (AMSBag)amsBag;
- (AMSSyncPasswordSettingsTask)syncTask;
- (BOOL)isUpdatingAsnFreeSetting;
- (BOOL)isUpdatingAsnPaidSetting;
- (NSNumber)asnFreeSetting;
- (NSNumber)asnPaidSetting;
- (TVSettingsAccountsFacadePasswordSetting)initWithAccount:(id)a3 amsBag:(id)a4;
- (UIViewController)presentingViewController;
- (unint64_t)asnFreeSettingValue;
- (unint64_t)asnPaidSettingValue;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)_accountStoreDidChange:(id)a3;
- (void)_refreshAccount;
- (void)_setPaidSettingValue:(unint64_t)a3 freeSettingValue:(unint64_t)a4;
- (void)_syncPasswordPaidSetting:(unint64_t)a3 freeSetting:(unint64_t)a4;
- (void)_updatePaidSetting:(unint64_t)a3 freeSetting:(unint64_t)a4;
- (void)dealloc;
- (void)setAmsBag:(id)a3;
- (void)setAsnFreeSetting:(id)a3;
- (void)setAsnFreeSetting:(id)a3 presentingViewController:(id)a4;
- (void)setAsnPaidSetting:(id)a3;
- (void)setAsnPaidSetting:(id)a3 presentingViewController:(id)a4;
- (void)setIsUpdatingAsnFreeSetting:(BOOL)a3;
- (void)setIsUpdatingAsnPaidSetting:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSyncTask:(id)a3;
@end

@implementation TVSettingsAccountsFacadePasswordSetting

- (TVSettingsAccountsFacadePasswordSetting)initWithAccount:(id)a3 amsBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSettingsAccountsFacadePasswordSetting;
  v9 = -[TVSettingsAccountsFacadePasswordSetting init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_amsBag, a4);
    -[TVSettingsAccountsFacadePasswordSetting _setPaidSettingValue:freeSettingValue:]( v10,  "_setPaidSettingValue:freeSettingValue:",  -[ACAccount ams_paidPasswordPromptSetting](v10->_account, "ams_paidPasswordPromptSetting"),  -[ACAccount ams_freePasswordPromptSetting](v10->_account, "ams_freePasswordPromptSetting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v10 selector:"_accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[AMSSyncPasswordSettingsTask cancel](self->_syncTask, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsAccountsFacadePasswordSetting;
  -[TVSettingsAccountsFacadePasswordSetting dealloc](&v4, "dealloc");
}

+ (id)keyPathsForValuesAffectingAsnPaidSetting
{
  v2 = NSStringFromSelector("isUpdatingAsnPaidSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, 0LL));

  return v4;
}

+ (id)keyPathsForValuesAffectingAsnFreeSetting
{
  v2 = NSStringFromSelector("isUpdatingAsnFreeSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v3, 0LL));

  return v4;
}

- (void)setAsnPaidSetting:(id)a3
{
  id v4 = [a3 integerValue];
  unint64_t asnFreeSettingValue = self->_asnFreeSettingValue;
  if (asnFreeSettingValue == 3) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = (uint64_t)v4;
  }
  if (v4 != (id)self->_asnPaidSettingValue || v6 != asnFreeSettingValue) {
    -[TVSettingsAccountsFacadePasswordSetting _updatePaidSetting:freeSetting:]( self,  "_updatePaidSetting:freeSetting:",  v4,  v6);
  }
}

- (void)setAsnFreeSetting:(id)a3
{
  else {
    unint64_t asnPaidSettingValue = 3LL;
  }
  -[TVSettingsAccountsFacadePasswordSetting _updatePaidSetting:freeSetting:]( self,  "_updatePaidSetting:freeSetting:",  self->_asnPaidSettingValue,  asnPaidSettingValue);
}

- (void)setAsnPaidSetting:(id)a3 presentingViewController:(id)a4
{
  p_presentingViewController = &self->_presentingViewController;
  id v7 = a3;
  objc_storeWeak((id *)p_presentingViewController, a4);
  -[TVSettingsAccountsFacadePasswordSetting setAsnPaidSetting:](self, "setAsnPaidSetting:", v7);
}

- (void)setAsnFreeSetting:(id)a3 presentingViewController:(id)a4
{
  p_presentingViewController = &self->_presentingViewController;
  id v7 = a3;
  objc_storeWeak((id *)p_presentingViewController, a4);
  -[TVSettingsAccountsFacadePasswordSetting setAsnFreeSetting:](self, "setAsnFreeSetting:", v7);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v11 = sub_10008960C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "AMS requested authentication dialog. {authenticateRequest=%@, presentingViewController=%@}",  buf,  0x16u);
  }

  id v13 = [[AMSUIAuthenticateTask alloc] initWithRequest:v8 presentingViewController:WeakRetained];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 performAuthentication]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10008964C;
  v16[3] = &unk_100192370;
  id v17 = v9;
  id v15 = v9;
  [v14 addFinishBlock:v16];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v11 = sub_10008960C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "AMS requested alert dialog. {dialogRequest=%@, presentingViewController=%@}",  buf,  0x16u);
  }

  id v13 = [[AMSUIAlertDialogTask alloc] initWithRequest:v8 presentingViewController:WeakRetained];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 present]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000897BC;
  v16[3] = &unk_100192398;
  id v17 = v9;
  id v15 = v9;
  [v14 addFinishBlock:v16];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:ACAccountIdentifierKey]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount identifier](self->_account, "identifier"));
  unsigned int v6 = [v7 isEqualToString:v5];

  if (v6)
  {
    [(id)objc_opt_class(self) cancelPreviousPerformRequestsWithTarget:self selector:"_refreshAccount" object:0];
    -[TVSettingsAccountsFacadePasswordSetting performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_refreshAccount",  0LL,  0.2);
  }
}

- (void)_refreshAccount
{
  id v3 = -[ACAccount ams_paidPasswordPromptSetting](self->_account, "ams_paidPasswordPromptSetting");
  id v4 = -[ACAccount ams_freePasswordPromptSetting](self->_account, "ams_freePasswordPromptSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountStore](self->_account, "accountStore"));
  unsigned int v6 = (ACAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_iTunesAccountForAccount:", self->_account));
  account = self->_account;
  self->_account = v6;

  id v8 = -[ACAccount ams_paidPasswordPromptSetting](self->_account, "ams_paidPasswordPromptSetting");
  id v9 = -[ACAccount ams_freePasswordPromptSetting](self->_account, "ams_freePasswordPromptSetting");
  if (v3 != v8 || v4 != v9)
  {
    id v11 = v9;
    id v12 = sub_10008960C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_account;
      int v15 = 138413314;
      v16 = v14;
      __int16 v17 = 2048;
      id v18 = v3;
      __int16 v19 = 2048;
      id v20 = v4;
      __int16 v21 = 2048;
      id v22 = v8;
      __int16 v23 = 2048;
      id v24 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Password setting account did change. {account=%@, previousPaidSetting=%ld, previousFreeSetting=%ld, newPaidSetti ng=%ld, newFreeSetting=%ld}",  (uint8_t *)&v15,  0x34u);
    }

    -[TVSettingsAccountsFacadePasswordSetting _setPaidSettingValue:freeSettingValue:]( self,  "_setPaidSettingValue:freeSettingValue:",  v8,  v11);
  }

- (void)_updatePaidSetting:(unint64_t)a3 freeSetting:(unint64_t)a4
{
  if (self->_asnPaidSettingValue != a3) {
    -[TVSettingsAccountsFacadePasswordSetting setIsUpdatingAsnPaidSetting:](self, "setIsUpdatingAsnPaidSetting:", 1LL);
  }
  if (self->_asnFreeSettingValue != a4) {
    -[TVSettingsAccountsFacadePasswordSetting setIsUpdatingAsnFreeSetting:](self, "setIsUpdatingAsnFreeSetting:", 1LL);
  }
  -[TVSettingsAccountsFacadePasswordSetting _syncPasswordPaidSetting:freeSetting:]( self,  "_syncPasswordPaidSetting:freeSetting:",  a3,  a4);
}

- (void)_syncPasswordPaidSetting:(unint64_t)a3 freeSetting:(unint64_t)a4
{
  if (-[AMSSyncPasswordSettingsTask isRunning](self->_syncTask, "isRunning"))
  {
    id v7 = sub_10008960C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Password setting server sync in progress, cancelling it.",  buf,  2u);
    }

    -[AMSSyncPasswordSettingsTask cancel](self->_syncTask, "cancel");
  }

  id v9 = sub_10008960C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 138412802;
    id v20 = account;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Iniating password setting server sync. {account=%@, paidSetting=%ld, freeSetting=%ld}",  buf,  0x20u);
  }

  id v12 = -[AMSSyncPasswordSettingsTask initWithAccount:freeSetting:paidSetting:delegate:bag:]( objc_alloc(&OBJC_CLASS___AMSSyncPasswordSettingsTask),  "initWithAccount:freeSetting:paidSetting:delegate:bag:",  self->_account,  a4,  a3,  self,  self->_amsBag);
  syncTask = self->_syncTask;
  self->_syncTask = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSyncPasswordSettingsTask performSync](self->_syncTask, "performSync"));
  objc_initWeak((id *)buf, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100089C9C;
  v17[3] = &unk_1001923E8;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a3;
  v18[2] = (id)a4;
  [v14 addSuccessBlock:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100089E04;
  v15[3] = &unk_100192410;
  objc_copyWeak(v16, (id *)buf);
  v16[1] = (id)a3;
  v16[2] = (id)a4;
  [v14 addErrorBlock:v15];
  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

- (void)_setPaidSettingValue:(unint64_t)a3 freeSettingValue:(unint64_t)a4
{
  if (a3 <= 1) {
    unint64_t v5 = 1LL;
  }
  else {
    unint64_t v5 = a3;
  }
  if (a4 <= 1) {
    unint64_t v6 = 1LL;
  }
  else {
    unint64_t v6 = a4;
  }
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6 != 3));
  if (![obj isEqual:self->_asnPaidSetting]
    || v5 != self->_asnPaidSettingValue
    || ![v7 isEqual:self->_asnFreeSetting]
    || v6 != self->_asnFreeSettingValue)
  {
    -[TVSettingsAccountsFacadePasswordSetting willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"asnPaidSetting");
    -[TVSettingsAccountsFacadePasswordSetting willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"asnPaidSettingValue");
    -[TVSettingsAccountsFacadePasswordSetting willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"asnFreeSetting");
    -[TVSettingsAccountsFacadePasswordSetting willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"asnFreeSettingValue");
    objc_storeStrong((id *)&self->_asnPaidSetting, obj);
    self->_unint64_t asnPaidSettingValue = v5;
    objc_storeStrong((id *)&self->_asnFreeSetting, v7);
    self->_unint64_t asnFreeSettingValue = v6;
    -[TVSettingsAccountsFacadePasswordSetting didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"asnPaidSetting");
    -[TVSettingsAccountsFacadePasswordSetting didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"asnPaidSettingValue");
    -[TVSettingsAccountsFacadePasswordSetting didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"asnFreeSetting");
    -[TVSettingsAccountsFacadePasswordSetting didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"asnFreeSettingValue");
    -[ACAccount ams_setPaidPasswordPromptSetting:]( self->_account,  "ams_setPaidPasswordPromptSetting:",  self->_asnPaidSettingValue);
    -[ACAccount ams_setFreePasswordPromptSetting:]( self->_account,  "ams_setFreePasswordPromptSetting:",  self->_asnFreeSettingValue);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount accountStore](self->_account, "accountStore"));
    [v8 saveAccount:self->_account withCompletionHandler:0];
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (NSNumber)asnPaidSetting
{
  return self->_asnPaidSetting;
}

- (unint64_t)asnPaidSettingValue
{
  return self->_asnPaidSettingValue;
}

- (BOOL)isUpdatingAsnPaidSetting
{
  return self->_isUpdatingAsnPaidSetting;
}

- (void)setIsUpdatingAsnPaidSetting:(BOOL)a3
{
  self->_isUpdatingAsnPaidSetting = a3;
}

- (NSNumber)asnFreeSetting
{
  return self->_asnFreeSetting;
}

- (unint64_t)asnFreeSettingValue
{
  return self->_asnFreeSettingValue;
}

- (BOOL)isUpdatingAsnFreeSetting
{
  return self->_isUpdatingAsnFreeSetting;
}

- (void)setIsUpdatingAsnFreeSetting:(BOOL)a3
{
  self->_isUpdatingAsnFreeSetting = a3;
}

- (AMSBag)amsBag
{
  return self->_amsBag;
}

- (void)setAmsBag:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
}

- (AMSSyncPasswordSettingsTask)syncTask
{
  return self->_syncTask;
}

- (void)setSyncTask:(id)a3
{
}

- (void).cxx_destruct
{
}

@end