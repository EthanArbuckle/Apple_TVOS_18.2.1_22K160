@interface AMSDVerifyDevicePasscodeTask
- (AMSMutablePromise)passcodeStringPromise;
- (id)_passcodeStringPromise;
- (id)verifyPasscode;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPasscodeStringPromise:(id)a3;
@end

@implementation AMSDVerifyDevicePasscodeTask

- (id)verifyPasscode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDVerifyDevicePasscodeTask _passcodeStringPromise](self, "_passcodeStringPromise"));
  -[AMSDVerifyDevicePasscodeTask setPasscodeStringPromise:](self, "setPasscodeStringPromise:", v3);
  objc_initWeak(&location, self);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_100046E14;
  v9 = &unk_1000D7FE0;
  objc_copyWeak(&v10, &location);
  [v3 addFinishBlock:&v6];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "binaryPromiseAdapter", v6, v7, v8, v9));
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDVerifyDevicePasscodeTask passcodeStringPromise](self, "passcodeStringPromise", a3));
  uint64_t v3 = AMSError( 10LL,  @"Remote alert handle was deactivated",  @"The remote alert handle was deactivated before a passcode was retrieved",  0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v5 finishWithResult:0 error:v4];
}

- (id)_passcodeStringPromise
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v4 = [[SBSRemoteAlertDefinition alloc] initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServicePINEntryViewController"];
  id v5 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
  id v6 = objc_alloc_init(&OBJC_CLASS___BSMutableSettings);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100047084;
  v17[3] = &unk_1000D8008;
  uint64_t v7 = v3;
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v17));
  id v9 = [[BSAction alloc] initWithInfo:v6 responder:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
  [v5 setActions:v10];

  id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v4,  v5);
  v12 = v11;
  if (v11)
  {
    [v11 registerObserver:self];
    [v12 activateWithContext:0];
    v13 = v7;
  }

  else
  {
    uint64_t v14 = AMSError( 10LL,  @"Remote alert handle was not created",  @"The remote alert handle failed to be created to prompt for passcode",  0LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v13 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue( +[AMSMutablePromise promiseWithError:]( &OBJC_CLASS___AMSMutablePromise,  "promiseWithError:",  v15));
  }

  return v13;
}

- (AMSMutablePromise)passcodeStringPromise
{
  return self->_passcodeStringPromise;
}

- (void)setPasscodeStringPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end