@interface SDAutoUnlockRegistrationKeySession
- (BOOL)isLocallyGenerated;
- (NSData)requestData;
- (void)handleStepData:(id)a3;
- (void)onQueue_start;
- (void)sendStepData:(id)a3 type:(unsigned __int16)a4 errorCode:(int64_t)a5;
- (void)setLocallyGenerated:(BOOL)a3;
- (void)setRequestData:(id)a3;
- (void)start;
- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6;
@end

@implementation SDAutoUnlockRegistrationKeySession

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D37D4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onQueue_start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRegistrationKeySession requestData](self, "requestData"));
  v6 = -[SDAutoUnlockDeviceRegistrationRequest initWithData:](v4, "initWithData:", v5);

  if (v6 || (BOOL v7 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    unsigned int v9 = [v8 deviceKeyBagUnlocked];

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 aksRegistrationSessionForDeviceID:v12 originator:1]);
      -[SDAutoUnlockPairingSession setAksSession:](self, "setAksSession:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      LODWORD(v12) = [v14 sessionIsValid];

      if ((_DWORD)v12)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        id v31 = 0LL;
        unsigned int v17 = [v16 stepSessionWithData:0 outputData:&v31];
        v18 = (os_log_s *)v31;

        if (v17)
        {
          unsigned int v20 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated");
          unsigned int v21 = -[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated");
          v22 = (uint64_t *)&unk_1004CA8F8;
          if (!v21) {
            v22 = &qword_1004CA8F0;
          }
          double v23 = *(double *)v22;
          if (v20) {
            uint64_t v24 = 505LL;
          }
          else {
            uint64_t v24 = 502LL;
          }
          -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:]( self,  "sendStepData:type:errorCode:",  v18,  v24,  0LL);
          -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(v23));
          goto LABEL_27;
        }

        uint64_t v29 = auto_unlock_log(v19);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_1000D4104();
        }
      }

      else
      {
        uint64_t v27 = auto_unlock_log(v15);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000D4130();
        }
      }

      uint64_t v26 = 101LL;
    }

    else
    {
      uint64_t v25 = auto_unlock_log(v10);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000D415C();
      }
      uint64_t v26 = 102LL;
    }
  }

  else
  {
    uint64_t v28 = auto_unlock_log(v7);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000D4188();
    }
    uint64_t v26 = 212LL;
  }

  if (!-[SDAutoUnlockRegistrationKeySession isLocallyGenerated](self, "isLocallyGenerated"))
  {
    -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:]( self,  "sendStepData:type:errorCode:",  0LL,  502LL,  v26);
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(20.0));
  }

  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  v26,  0LL));
  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
LABEL_27:
}

- (void)sendStepData:(id)a3 type:(unsigned __int16)a4 errorCode:(int64_t)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  unsigned int v9 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep);
  -[SDAutoUnlockDeviceRegistrationStep setStepData:](v9, "setStepData:", v8);

  -[SDAutoUnlockDeviceRegistrationStep setErrorCode:](v9, "setErrorCode:", a5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D3BF0;
  v14[3] = &unk_1005CB3E8;
  v14[4] = self;
  [v10 sendPayload:v11 toDevice:v12 type:v6 sessionID:v13 timeout:&off_1005F7948 errorHandler:v14];
}

- (void)handleStepData:(id)a3
{
  id v4 = a3;
  v5 = -[SDAutoUnlockDeviceRegistrationStep initWithData:]( objc_alloc(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep),  "initWithData:",  v4);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
  if (!v6)
  {
    uint64_t v22 = auto_unlock_log(v7);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D41B4();
    }
    uint64_t v23 = 211LL;
    goto LABEL_19;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v9 = [v8 deviceKeyBagUnlocked];

  if (!v9)
  {
    uint64_t v24 = auto_unlock_log(v10);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D415C();
    }
    uint64_t v23 = 102LL;
    goto LABEL_19;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockDeviceRegistrationStep stepData](v5, "stepData"));
  id v29 = 0LL;
  unsigned int v13 = [v11 stepSessionWithData:v12 outputData:&v29];
  v14 = (os_log_s *)v29;

  if (!v13)
  {
    uint64_t v25 = auto_unlock_log(v15);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000D4104();
    }
    goto LABEL_18;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v17 = [v16 confirmSession];

  if (!v17)
  {
    uint64_t v27 = auto_unlock_log(v18);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000D41E0();
    }
LABEL_18:

    uint64_t v23 = 101LL;
LABEL_19:

    -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:]( self,  "sendStepData:type:errorCode:",  0LL,  504LL,  v23);
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_100114580(20.0));
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SFAutoUnlockErrorDomain,  v23,  0LL));
    -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v14);
    goto LABEL_20;
  }

  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockDeviceRegistrationStep);
  -[SDAutoUnlockDeviceRegistrationStep setStepData:](v19, "setStepData:", v14);
  -[SDAutoUnlockRegistrationKeySession sendStepData:type:errorCode:]( self,  "sendStepData:type:errorCode:",  v14,  504LL,  0LL);
  uint64_t v20 = auto_unlock_log(-[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer"));
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successfully registered local device", v28, 2u);
  }

  -[SDAutoUnlockRegistrationSession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0LL);
LABEL_20:
}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v8 = a4;
  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D4024;
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

- (BOOL)isLocallyGenerated
{
  return self->_locallyGenerated;
}

- (void)setLocallyGenerated:(BOOL)a3
{
  self->_locallyGenerated = a3;
}

- (void).cxx_destruct
{
}

@end