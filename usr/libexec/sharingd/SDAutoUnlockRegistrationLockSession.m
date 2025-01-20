@interface SDAutoUnlockRegistrationLockSession
- (NSData)requestData;
- (SDAutoUnlockRegistrationLockSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (int64_t)state;
- (void)handleFinalize:(id)a3;
- (void)handleInitialResponse:(id)a3;
- (void)onQueue_start;
- (void)sendInitialRequest;
- (void)setRequestData:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
@end

@implementation SDAutoUnlockRegistrationLockSession

- (SDAutoUnlockRegistrationLockSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDAutoUnlockRegistrationLockSession;
  result = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v5, "initWithDevice:sessionID:", a3, a4);
  if (result) {
    result->_state = 0LL;
  }
  return result;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100174B40;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onQueue_start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationLockSession requestData](self, "requestData"));
  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationLockSession requestData](self, "requestData"));
    -[SDAutoUnlockRegistrationLockSession handleInitialResponse:](self, "handleInitialResponse:", v5);
  }

  else
  {
    -[SDAutoUnlockRegistrationLockSession sendInitialRequest](self, "sendInitialRequest");
  }

- (void)sendInitialRequest
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationRequest);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationRequest data](v4, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100174CEC;
  v9[3] = &unk_1005CB3E8;
  v9[4] = self;
  [v5 sendPayload:v6 toDevice:v7 type:501 sessionID:v8 timeout:&off_1005F7D68 errorHandler:v9];

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(20.0));
}

- (void)handleInitialResponse:(id)a3
{
  id v4 = a3;
  id v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep),  "initWithData:",  v4);

  if (-[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode"))
  {
    uint64_t v6 = SFAutoUnlockErrorDomain;
    uint64_t v7 = -[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode");
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    v32 = @"Error during registration";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  v7,  v8));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v9);
  }

  else if (-[SDAutoUnlockDeviceRegistrationStep hasStepData](v5, "hasStepData"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 aksRegistrationSessionForDeviceID:v11 originator:0]);
    -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    LODWORD(v11) = [v13 sessionIsValid];

    if ((_DWORD)v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
      id v28 = 0LL;
      unsigned int v16 = [v14 stepSessionWithData:v15 outputData:&v28];
      id v17 = v28;

      if (v16)
      {
        v18 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep);
        -[SDAutoUnlockDeviceRegistrationStep setStepData:](v18, "setStepData:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep data](v18, "data"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_100175160;
        v27[3] = &unk_1005CB3E8;
        v27[4] = self;
        [v19 sendPayload:v20 toDevice:v21 type:503 sessionID:v22 timeout:&off_1005F7D68 errorHandler:v27];

        -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(20.0));
      }

      else
      {
        v18 = (SDAutoUnlockDeviceRegistrationStep *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  101LL,  0LL));
        -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
      }
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  101LL,  0LL));
      -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v26);
    }
  }

  else
  {
    uint64_t v23 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v30 = @"Registration Token missing";
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  211LL,  v24));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v25);
  }
}

- (void)handleFinalize:(id)a3
{
  id v4 = a3;
  id v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep),  "initWithData:",  v4);

  if (!-[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode"))
  {
    BOOL v10 = -[SDAutoUnlockDeviceRegistrationStep hasStepData](v5, "hasStepData");
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
      unsigned int v13 = [v11 stepSessionWithData:v12 outputData:0];

      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        id v16 = [v15 finalizeRegistration];

        if (!v16)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v8 = (void *)objc_claimAutoreleasedReturnValue([v48 remoteLTKForDeviceID:v49]);

          uint64_t v50 = sub_10001204C(v8);
          uint64_t v51 = auto_unlock_log(v50);
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = sub_1000124BC(v50);
            v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
            int v55 = 138412290;
            v56 = v54;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Device has been registered (peer state is %@)",  (uint8_t *)&v55,  0xCu);
          }

          v46 = self;
          v47 = 0LL;
          goto LABEL_17;
        }

        uint64_t v18 = auto_unlock_log(v17);
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1001757A8((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);
        }
      }

      else
      {
        uint64_t v37 = auto_unlock_log(v14);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100175810(v38, v39, v40, v41, v42, v43, v44, v45);
        }
      }

      uint64_t v35 = SFAutoUnlockErrorDomain;
      uint64_t v36 = 101LL;
    }

    else
    {
      uint64_t v26 = auto_unlock_log(v10);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100175844(v27, v28, v29, v30, v31, v32, v33, v34);
      }

      uint64_t v35 = SFAutoUnlockErrorDomain;
      uint64_t v36 = 211LL;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v35,  v36,  0LL));
    v46 = self;
    v47 = v8;
LABEL_17:
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](v46, "notifyDelegateWithError:", v47);
    goto LABEL_18;
  }

  uint64_t v6 = SFAutoUnlockErrorDomain;
  uint64_t v7 = -[SDAutoUnlockDeviceRegistrationStep errorCode](v5, "errorCode");
  NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
  v58 = @"Error during registration";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  v7,  v8));
  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v9);

LABEL_18:
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v8 = a4;
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100175600;
  block[3] = &unk_1005CDCE8;
  unsigned __int16 v13 = a5;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, block);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end