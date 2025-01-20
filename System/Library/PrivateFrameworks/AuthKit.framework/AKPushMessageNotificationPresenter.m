@interface AKPushMessageNotificationPresenter
+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7;
+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9;
+ (id)_presenterQueue;
+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7;
+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9;
+ (void)populateNotificationOptionsWithCommonKeys:(id)a3 makeNoise:(BOOL)a4;
- (AKPushMessageNotificationPresenter)initWithMessage:(id)a3;
- (BOOL)_isPasswordPromptNecessaryForCommand:(unint64_t)a3;
- (__CFUserNotification)_loginAlertForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7;
- (id)_loginAlertOptionsForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7;
- (id)_loginNotificationOptionsWithContext:(id)a3 isSilent:(BOOL)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6;
- (unint64_t)_notificationResultFromButtonPressed:(unint64_t)a3;
- (void)_handleResult:(unint64_t)a3 forAccount:(id)a4;
- (void)_locationNameWithLatitude:(id)a3 longitude:(id)a4 completion:(id)a5;
- (void)_promptForAuthenticationPasswordForAccount:(id)a3 completion:(id)a4;
- (void)_promptForChangePasswordForAccount:(id)a3;
- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4;
- (void)_showCode:(id)a3 body:(id)a4 title:(id)a5 footer:(id)a6 completion:(id)a7;
- (void)_startChangePasswordFlowForAccount:(id)a3;
- (void)_waitForNotificationResponse:(__CFUserNotification *)a3 withIdentifier:(id)a4 responseHandler:(id)a5;
- (void)presentLoginNotificationWithCode:(id)a3 piggy:(BOOL)a4 completionHandler:(id)a5;
- (void)presentMessageWithAccount:(id)a3 completionHandler:(id)a4;
- (void)tearDown;
@end

@implementation AKPushMessageNotificationPresenter

- (AKPushMessageNotificationPresenter)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AKPushMessageNotificationPresenter;
  v6 = -[AKPushMessageNotificationPresenter init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

+ (id)_presenterQueue
{
  if (qword_10020F498 != -1) {
    dispatch_once(&qword_10020F498, &stru_1001C9310);
  }
  return (id)qword_10020F490;
}

- (void)presentMessageWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = v7;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_100070E60;
  v60[3] = &unk_1001C9338;
  v60[4] = v8;
  id v10 = v6;
  id v61 = v10;
  id v46 = v9;
  id v62 = v46;
  v11 = objc_retainBlock(v60);
  v12 = v8->_message;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage latitude](v12, "latitude"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage longitude](v12, "longitude"));
  id v15 = -[AKPushMessage command](v12, "command");
  BOOL v19 = v15 != (id)700 && v15 != (id)100 || v13 == 0LL || v14 == 0LL;
  v45 = v15;
  if (v19)
  {
    v42 = v14;
    v43 = v13;
    v44 = v11;
    if (v15 == (id)1600)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage alertTitle](v12, "alertTitle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v10 username]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[AKUsernameFormatter formattedUsernameFromUsername:]( &OBJC_CLASS___AKUsernameFormatter,  "formattedUsernameFromUsername:",  v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v20,  v22));
      -[AKPushMessage setAlertTitle:](v12, "setAlertTitle:", v23);
    }

    v24 = (void *)objc_opt_class(v8, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage alertTitle](v12, "alertTitle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage alertBody](v12, "alertBody"));
    v41 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage lockScreenTitle](v12, "lockScreenTitle"));
    id v28 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage lockScreenBody](v12, "lockScreenBody"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage defaultButtonTitle](v12, "defaultButtonTitle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage alternateButtonTitle](v12, "alternateButtonTitle"));
    LOBYTE(v40) = !-[AKPushMessage isSilent](v12, "isSilent");
    v32 = (__CFUserNotification *)[v24 createUserNotificationWithTitle:v25 body:v26 lockScreenTitle:v27 lockScreenBody:v29 defaultButtonTit le:v30 alternateButtonTitle:v31 makeNoise:v40];

    id v10 = v28;
    v8 = v41;

    v34 = 0LL;
    v13 = v43;
    v11 = v44;
    v14 = v42;
    if (!v32) {
      goto LABEL_20;
    }
LABEL_15:
    objc_initWeak(&location, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage messageId](v12, "messageId"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_100070F10;
    v47[3] = &unk_1001C9388;
    objc_copyWeak(v50, &location);
    v50[1] = v32;
    v50[2] = v45;
    id v48 = v10;
    v49 = v11;
    -[AKPushMessageNotificationPresenter _waitForNotificationResponse:withIdentifier:responseHandler:]( v8,  "_waitForNotificationResponse:withIdentifier:responseHandler:",  v32,  v35,  v47);

    objc_destroyWeak(v50);
    objc_destroyWeak(&location);
    goto LABEL_23;
  }

  id location = 0LL;
  p_id location = &location;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_100070EAC;
  v58 = sub_100070EBC;
  id v59 = 0LL;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100070EC4;
  v51[3] = &unk_1001C9360;
  v53 = &location;
  v36 = dispatch_semaphore_create(0LL);
  v52 = v36;
  -[AKPushMessageNotificationPresenter _locationNameWithLatitude:longitude:completion:]( v8,  "_locationNameWithLatitude:longitude:completion:",  v13,  v14,  v51);
  dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  if (p_location[5])
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage alertBody](v12, "alertBody"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v37 stringByReplacingOccurrencesOfString:@"%loc%" withString:p_location[5]]);
  }

  else
  {
    v34 = 0LL;
  }

  _Block_object_dispose(&location, 8);
  v33 = -[AKPushMessageNotificationPresenter _loginAlertForAccount:latitude:longitude:message:resolvedBody:]( v8,  "_loginAlertForAccount:latitude:longitude:message:resolvedBody:",  v10,  v13,  v14,  v12,  v34);
  v32 = v33;
  if (v33) {
    goto LABEL_15;
  }
LABEL_20:
  uint64_t v38 = _AKLogSystem(v33);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    sub_1001384E0();
  }

  ((void (*)(void *, void))v11[2])(v11, 0LL);
LABEL_23:
}

- (void)_handleResult:(unint64_t)a3 forAccount:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    id v9 = v6;
    if ((id)-[AKPushMessage command](self->_message, "command") == (id)100
      || (v7 = -[AKPushMessage command](self->_message, "command"), id v6 = v9, v7 == 700))
    {
      unint64_t v8 = -[AKPushMessage piggybackingContext](self->_message, "piggybackingContext");
      id v6 = v9;
      if (v8 != 1)
      {
        -[AKPushMessageNotificationPresenter _promptForChangePasswordForAccount:]( self,  "_promptForChangePasswordForAccount:",  v9);
        id v6 = v9;
      }
    }
  }
}

- (void)presentLoginNotificationWithCode:(id)a3 piggy:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage secondaryTitle](self->_message, "secondaryTitle"));
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    v14 = @"LOGIN_CODE_ALERT_TITLE_DEFAULT";
    unsigned __int8 v15 = [@"LOGIN_CODE_ALERT_TITLE_DEFAULT" containsString:@"REBRAND"];
    if ((v15 & 1) != 0)
    {
      int v16 = 0;
    }

    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v34 isAABrandingEnabled])
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"LOGIN_CODE_ALERT_TITLE_DEFAULT" stringByAppendingString:@"_REBRAND"]);
        int v16 = 1;
      }

      else
      {
        int v16 = 0;
      }
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:v14 value:&stru_1001D1450 table:@"Localizable"]);
    if (v16) {

    }
    if ((v15 & 1) == 0) {
  }
    }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage secondaryBody](self->_message, "secondaryBody"));
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v19 = (id)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"LOGIN_CODE_ALERT_IOS_MESSAGE_DEFAULT" value:&stru_1001D1450 table:@"Localizable"]);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage secondaryFooter](self->_message, "secondaryFooter"));
  if (+[AKCDPFactory isEligibleToArmDeviceForPCSAuth]( &OBJC_CLASS___AKCDPFactory,  "isEligibleToArmDeviceForPCSAuth"))
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[AKPushMessage secondaryTitleCDP](self->_message, "secondaryTitleCDP"));
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = v12;
    }
    id v25 = v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[AKPushMessage secondaryBodyCDP](self->_message, "secondaryBodyCDP"));
    v27 = (void *)v26;
    if (v26) {
      id v28 = (void *)v26;
    }
    else {
      id v28 = v19;
    }
    id v29 = v28;

    id v19 = v29;
    id v12 = v25;
  }

  if (v6)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    else {
      id v31 = v12;
    }
    id v32 = v31;
  }

  else
  {
    id v32 = v12;
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100071344;
  v35[3] = &unk_1001C93B0;
  v35[4] = self;
  id v36 = v9;
  id v33 = v9;
  -[AKPushMessageNotificationPresenter _showCode:body:title:footer:completion:]( self,  "_showCode:body:title:footer:completion:",  v8,  v19,  v32,  v21,  v35);
}

- (void)_showCode:(id)a3 body:(id)a4 title:(id)a5 footer:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = +[AKLoginCodeNotificationBuilder buildLoginCodeNotificationWithTitle:body:footer:loginCode:]( &OBJC_CLASS___AKLoginCodeNotificationBuilder,  "buildLoginCodeNotificationWithTitle:body:footer:loginCode:",  a5,  a4,  a6,  a3);
  if (v13)
  {
    id v14 = v13;
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushMessage messageId](self->_message, "messageId"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100071450;
    v18[3] = &unk_1001C93D8;
    id v19 = (os_log_s *)v12;
    id v20 = v14;
    -[AKPushMessageNotificationPresenter _waitForNotificationResponse:withIdentifier:responseHandler:]( self,  "_waitForNotificationResponse:withIdentifier:responseHandler:",  v14,  v15,  v18);

    int v16 = v19;
  }

  else
  {
    uint64_t v17 = _AKLogSystem(0LL);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10013850C();
    }
  }
}

- (void)_waitForNotificationResponse:(__CFUserNotification *)a3 withIdentifier:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _AKLogSystem(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to show notification with identifier: %@",  buf,  0xCu);
  }

  id v13 = objc_msgSend((id)objc_opt_class(self, v12), "_presenterQueue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007166C;
  block[3] = &unk_1001C9400;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(v14, block);

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 postNotificationName:@"AKNotificationNamePresented" object:v8];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100071678;
  v17[3] = &unk_1001C9428;
  v17[4] = self;
  id v18 = v9;
  id v16 = v9;
  -[AKPushMessageNotificationPresenter _receiveResponseFromNotification:handler:]( self,  "_receiveResponseFromNotification:handler:",  a3,  v17);
}

- (id)_loginAlertOptionsForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 username]);

  -[AKAppleIDAuthenticationContext setUsername:](v17, "setUsername:", v18);
  -[AKAppleIDAuthenticationContext setLatitude:](v17, "setLatitude:", v15);

  -[AKAppleIDAuthenticationContext setLongitude:](v17, "setLongitude:", v14);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 alertTitle]);
  if (v19)
  {
    -[AKAppleIDAuthenticationContext _setMessage:](v17, "_setMessage:", v19);
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v21 = @"APPLE_ID_SIGN_IN_HEADER";
    uint64_t v18 = (uint64_t)[@"APPLE_ID_SIGN_IN_HEADER" containsString:@"REBRAND"];
    if ((v18 & 1) != 0)
    {
      uint64_t v22 = self;
      int v23 = 0;
    }

    else
    {
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      uint64_t v22 = self;
      if ([v38 isAABrandingEnabled])
      {
        id v21 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"APPLE_ID_SIGN_IN_HEADER" stringByAppendingString:@"_REBRAND"]);
        int v23 = 1;
      }

      else
      {
        int v23 = 0;
      }
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:v21 value:&stru_1001D1450 table:@"Localizable"]);
    -[AKAppleIDAuthenticationContext _setMessage:](v17, "_setMessage:", v24);

    if (v23) {
    self = v22;
    }
    if ((v18 & 1) == 0) {
  }
    }

  if (v13)
  {
    -[AKAppleIDAuthenticationContext setReason:](v17, "setReason:", v13);
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v26 = @"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON";
    unsigned __int8 v27 = [@"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON" containsString:@"REBRAND"];
    if ((v27 & 1) != 0)
    {
      int v28 = 0;
    }

    else
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([(id)v18 isAABrandingEnabled])
      {
        uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"APPLE_ID_UNABLE_TO_RESOLVE_LOCATION_FOR_REASON" stringByAppendingString:@"_REBRAND"]);
        int v28 = 1;
      }

      else
      {
        int v28 = 0;
      }
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:v26 value:&stru_1001D1450 table:@"Localizable"]);
    -[AKAppleIDAuthenticationContext setReason:](v17, "setReason:", v29);

    if (v28) {
    if ((v27 & 1) == 0)
    }
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceClass]);
  -[AKAppleIDAuthenticationContext setDeviceClass:](v17, "setDeviceClass:", v30);

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceColor]);
  -[AKAppleIDAuthenticationContext setDeviceColor:](v17, "setDeviceColor:", v31);

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceEnclosureColor]);
  -[AKAppleIDAuthenticationContext setDeviceEnclosureColor:](v17, "setDeviceEnclosureColor:", v32);

  id v33 = [v12 isSilent];
  v34 = (void *)objc_claimAutoreleasedReturnValue([v12 defaultButtonTitle]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v12 alternateButtonTitle]);
  id v36 = (void *)objc_claimAutoreleasedReturnValue( -[AKPushMessageNotificationPresenter _loginNotificationOptionsWithContext:isSilent:defaultButtonTitle:alternateButtonTitle:]( self,  "_loginNotificationOptionsWithContext:isSilent:defaultButtonTitle:alternateButtonTitle:",  v17,  v33,  v34,  v35));

  return v36;
}

- (__CFUserNotification)_loginAlertForAccount:(id)a3 latitude:(id)a4 longitude:(id)a5 message:(id)a6 resolvedBody:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[AAFDeviceInfo deviceIsAudioAccessory](&OBJC_CLASS___AAFDeviceInfo, "deviceIsAudioAccessory");
  if ((_DWORD)v17)
  {
    uint64_t v18 = _AKLogSystem(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100138538();
    }

    id v20 = 0LL;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[AKPushMessageNotificationPresenter _loginAlertOptionsForAccount:latitude:longitude:message:resolvedBody:]( self,  "_loginAlertOptionsForAccount:latitude:longitude:message:resolvedBody:",  v12,  v13,  v14,  v15,  v16));
    id v20 = (__CFUserNotification *)AKUserNotificationCreate(kCFAllocatorDefault, 0LL, 0LL, v21, 0.0);
  }

  return v20;
}

- (void)_locationNameWithLatitude:(id)a3 longitude:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (objc_class *)sub_100070570(0LL);
  if (v10) {
    uint64_t v10 = (objc_class *)sub_10007068C();
  }
  id v11 = objc_alloc_init(v10);
  id v12 = (objc_class *)sub_100070570(0LL);
  if (v12) {
    id v12 = (objc_class *)sub_100070794();
  }
  id v13 = objc_alloc(v12);
  [v9 doubleValue];
  double v15 = v14;

  [v8 doubleValue];
  double v17 = v16;

  id v18 = [v13 initWithLatitude:v15 longitude:v17];
  uint64_t v19 = _AKLogSystem(v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100138564();
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100071CF0;
  v22[3] = &unk_1001C9450;
  id v23 = v7;
  id v21 = v7;
  [v11 reverseGeocodeLocation:v18 completionHandler:v22];
}

- (id)_loginNotificationOptionsWithContext:(id)a3 isSilent:(BOOL)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  objc_msgSend((id)objc_opt_class(self, v14), "populateNotificationOptionsWithCommonKeys:makeNoise:", v13, !v8);
  if (v11)
  {
    CFStringRef v15 = kCFUserNotificationDefaultButtonTitleKey;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v11,  kCFUserNotificationDefaultButtonTitleKey);
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"LOGIN_CODE_ALERT_OK_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);
    CFStringRef v15 = kCFUserNotificationDefaultButtonTitleKey;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v17,  kCFUserNotificationDefaultButtonTitleKey);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtensionItem extensionItemWithAppleIDAuthenticationContext:]( &OBJC_CLASS___NSExtensionItem,  "extensionItemWithAppleIDAuthenticationContext:",  v10));
  uint64_t v26 = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v19,  1LL,  0LL));

  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, v15);
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"LOGIN_CODE_ALERT_OK_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v22, v15);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  AKExtensionItemLocationSignInAlertKey,  SBUserNotificationExtensionIdentifierKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v20,  SBUserNotificationExtensionItemsKey);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 _message]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v23,  SBUserNotificationLockScreenAlertHeaderKey);

  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 _interpolatedReason]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v24,  SBUserNotificationLockScreenAlertMessageKey);

  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v12,  kCFUserNotificationAlternateButtonTitleKey);
  }

  return v13;
}

+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return [a1 createUserNotificationOptionsWithTitle:a3 body:a4 lockScreenTitle:0 lockScreenBody:0 defaultButtonTitle:a5 alternateButton Title:a6 makeNoise:v8];
}

+ (id)createUserNotificationOptionsWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  double v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v18 = v17;
  if (v13) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v13,  kCFUserNotificationAlertHeaderKey);
  }
  if (v14) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v14,  kCFUserNotificationAlertMessageKey);
  }
  if (!v15)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"ALERT_DEFAULT_BUTTON" value:&stru_1001D1450 table:@"Localizable"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v21,  kCFUserNotificationDefaultButtonTitleKey);

    if (!v16) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v15,  kCFUserNotificationDefaultButtonTitleKey);
  if (v16) {
LABEL_7:
  }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v18,  "setObject:forKeyedSubscript:",  v16,  kCFUserNotificationAlternateButtonTitleKey);
LABEL_8:
  [a1 populateNotificationOptionsWithCommonKeys:v18 makeNoise:a9];

  return v18;
}

+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 makeNoise:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return (__CFUserNotification *)[a1 createUserNotificationWithTitle:a3 body:a4 lockScreenTitle:0 lockScreenBody:0 defaultButtonTitl e:a5 alternateButtonTitle:a6 makeNoise:v8];
}

+ (__CFUserNotification)createUserNotificationWithTitle:(id)a3 body:(id)a4 lockScreenTitle:(id)a5 lockScreenBody:(id)a6 defaultButtonTitle:(id)a7 alternateButtonTitle:(id)a8 makeNoise:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = +[AAFDeviceInfo deviceIsAudioAccessory](&OBJC_CLASS___AAFDeviceInfo, "deviceIsAudioAccessory");
  int v22 = (int)v21;
  uint64_t v23 = _AKLogSystem(v21);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = v24;
  if (v22)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100138538();
    }
    uint64_t v26 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Will display user notification...", buf, 2u);
    }

    LOBYTE(v30) = a9;
    id v28 = objc_msgSend( (id)objc_opt_class(a1, v27),  "createUserNotificationOptionsWithTitle:body:lockScreenTitle:lockScreenBody:defaultButtonTitle:alternateButto nTitle:makeNoise:",  v15,  v16,  v17,  v18,  v19,  v20,  v30);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v26 = (__CFUserNotification *)AKUserNotificationCreate(kCFAllocatorDefault, 0LL, 0LL, v25, 0.0);
  }

  return v26;
}

- (void)tearDown
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "_presenterQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072554;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_sync(v4, block);
}

+ (void)populateNotificationOptionsWithCommonKeys:(id)a3 makeNoise:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDismissOnLock];
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  if (v4) {
    [v9 setObject:&off_1001D8DD0 forKeyedSubscript:SBUserNotificationSystemSoundIDKey];
  }
  BOOL v6 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___NSBundle, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resourceURL]);
  [v9 setObject:v8 forKeyedSubscript:kCFUserNotificationLocalizationURLKey];
}

- (void)_receiveResponseFromNotification:(__CFUserNotification *)a3 handler:(id)a4
{
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072830;
  block[3] = &unk_1001C9478;
  id v11 = v6;
  id v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (unint64_t)_notificationResultFromButtonPressed:(unint64_t)a3
{
  if (a3) {
    return 2LL * (a3 == 3);
  }
  else {
    return 1LL;
  }
}

- (void)_promptForChangePasswordForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Prompting user if if they want to change their password",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 passwordResetTokenForAccount:v4]);

  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v25 = self;
    if ([@"CHANGE_PASSWORD_ALERT_TITLE" containsString:@"REBRAND"])
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
      if ([v13 isAABrandingEnabled])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue( [@"CHANGE_PASSWORD_ALERT_TITLE" stringByAppendingString:@"_REBRAND"]);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:v14 value:&stru_1001D1450 table:@"Localizable"]);
      }

      else
      {
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_BODY" value:&stru_1001D1450 table:@"Localizable"]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_DEF_BTN" value:&stru_1001D1450 table:@"Localizable"]);

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"CHANGE_PASSWORD_ALERT_ALT_BTN" value:&stru_1001D1450 table:@"Localizable"]);

    id v21 = +[AKPushMessageNotificationPresenter createUserNotificationWithTitle:body:defaultButtonTitle:alternateButtonTitle:makeNoise:]( &OBJC_CLASS___AKPushMessageNotificationPresenter,  "createUserNotificationWithTitle:body:defaultButtonTitle:alternateButtonTitle:makeNoise:",  v11,  v16,  v18,  v20,  0LL);
    if (v21)
    {
      int v22 = v21;
      +[NSXPCConnection beginTransaction](&OBJC_CLASS___NSXPCConnection, "beginTransaction");
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100072CA0;
      v26[3] = &unk_1001C94A0;
      id v28 = v22;
      v26[4] = v25;
      id v27 = v4;
      -[AKPushMessageNotificationPresenter _receiveResponseFromNotification:handler:]( v25,  "_receiveResponseFromNotification:handler:",  v22,  v26);
    }

    else
    {
      uint64_t v23 = _AKLogSystem(0LL);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10013875C();
      }
    }
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100138730();
    }
  }
}

- (void)_startChangePasswordFlowForAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _AKLogSystem(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Will take user to change password flow in Settings...",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSIDForAccount:v3]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAccountForAltDSID:v7]);
  if (v8 && ([v6 isPrimaryiCloudAccount:v8] & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&aaaction=changePassword",  v10));
  }

  else
  {
    uint64_t v9 = @"prefs:root=APPLE_ACCOUNT&aaaction=changePassword";
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
  uint64_t v12 = _AKLogSystem(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Using the following URL for change password redirect: %@",  buf,  0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v14 openSensitiveURL:v11 withOptions:0];
}

- (BOOL)_isPasswordPromptNecessaryForCommand:(unint64_t)a3
{
  if (a3 == 1600)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned int v4 = [v3 isProtectedWithPasscode] ^ 1;
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_promptForAuthenticationPasswordForAccount:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);

  -[AKAppleIDAuthenticationContext setUsername:](v7, "setUsername:", v8);
  -[AKAppleIDAuthenticationContext setShouldPromptForPasswordOnly:](v7, "setShouldPromptForPasswordOnly:", 1LL);
  -[AKAppleIDAuthenticationContext setAuthenticationType:](v7, "setAuthenticationType:", 2LL);
  -[AKAppleIDAuthenticationContext setIsEphemeral:](v7, "setIsEphemeral:", 1LL);
  -[AKAppleIDAuthenticationContext setIsUsernameEditable:](v7, "setIsUsernameEditable:", 0LL);
  -[AKAppleIDAuthenticationContext setShouldSkipSettingsLaunchAlert:](v7, "setShouldSkipSettingsLaunchAlert:", 1LL);
  -[AKAppleIDAuthenticationContext setMaximumLoginAttempts:](v7, "setMaximumLoginAttempts:", 2LL);
  -[AKAppleIDAuthenticationContext set_performUIOutOfProcess:](v7, "set_performUIOutOfProcess:", 1LL);
  -[AKAppleIDAuthenticationContext set_forceEligibleForForegroundAuthentication:]( v7,  "set_forceEligibleForForegroundAuthentication:",  1LL);
  id v9 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100073048;
  v11[3] = &unk_1001C7B60;
  id v12 = v5;
  id v10 = v5;
  [v9 authenticateWithContext:v7 completion:v11];
}

- (void).cxx_destruct
{
}

@end