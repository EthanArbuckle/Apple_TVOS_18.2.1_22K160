@interface SDAutoUnlockAuthSession
- (BOOL)aksSuccess;
- (BOOL)inRange;
- (BOOL)isAcceptor;
- (BOOL)isAuthenticatingForSiri;
- (BOOL)rangingDisabled;
- (BOOL)rangingTimedOut;
- (BOOL)shouldUnlock;
- (BOOL)skipMotionCheck;
- (BOOL)useAKSToken;
- (BOOL)useEncryption;
- (BOOL)useRealRangingKey;
- (NSArray)wifiRangingResults;
- (NSData)appIcon;
- (NSData)awdlInfoData;
- (NSData)rangingKey;
- (NSData)sessionRangingKey;
- (NSDate)awdlStart;
- (NSDate)lastLocalUnlockDate;
- (NSDate)rangingStart;
- (NSDictionary)localAWDLInfo;
- (NSDictionary)remoteAWDLInfo;
- (NSError)attemptError;
- (NSError)startAWDLError;
- (NSNumber)distance;
- (NSString)appName;
- (NSString)navBarTitle;
- (NSString)rangingErrorString;
- (NSString)wifiErrorDomain;
- (SDAutoUnlockAuthSession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SDAutoUnlockWiFiRequest)wifiRequest;
- (SFBLEDevice)bleDevice;
- (double)awdlInterval;
- (double)rangingInterval;
- (id)awdlNetwork;
- (id)getAppName;
- (id)peerListFromAWDLInfo:(id)a3;
- (int64_t)attemptType;
- (int64_t)errorType;
- (int64_t)wifiRangingErrorCode;
- (unint64_t)protocol;
- (void)_start;
- (void)invalidate;
- (void)sendAWDLInfo;
- (void)sendAWDLInfo:(BOOL)a3;
- (void)sendData:(id)a3 bleDevice:(id)a4 completionHandler:(id)a5;
- (void)sendData:(id)a3 bleDevice:(id)a4 direct:(BOOL)a5 completionHandler:(id)a6;
- (void)sendData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5;
- (void)sendData:(id)a3 type:(unsigned __int16)a4 errorHandler:(id)a5;
- (void)setAcceptor:(BOOL)a3;
- (void)setAksSuccess:(BOOL)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAttemptError:(id)a3;
- (void)setAttemptType:(int64_t)a3;
- (void)setAwdlInfoData:(id)a3;
- (void)setAwdlInterval:(double)a3;
- (void)setAwdlNetwork:(id)a3;
- (void)setAwdlStart:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setDistance:(id)a3;
- (void)setErrorType:(int64_t)a3;
- (void)setInRange:(BOOL)a3;
- (void)setIsAuthenticatingForSiri:(BOOL)a3;
- (void)setLastLocalUnlockDate:(id)a3;
- (void)setLocalAWDLInfo:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setProtocol:(unint64_t)a3;
- (void)setRangingErrorString:(id)a3;
- (void)setRangingInterval:(double)a3;
- (void)setRangingKey:(id)a3;
- (void)setRangingStart:(id)a3;
- (void)setRangingTimedOut:(BOOL)a3;
- (void)setRemoteAWDLInfo:(id)a3;
- (void)setSessionRangingKey:(id)a3;
- (void)setShouldUnlock:(BOOL)a3;
- (void)setSkipMotionCheck:(BOOL)a3;
- (void)setStartAWDLError:(id)a3;
- (void)setUseAKSToken:(BOOL)a3;
- (void)setUseEncryption:(BOOL)a3;
- (void)setWifiErrorDomain:(id)a3;
- (void)setWifiRangingErrorCode:(int64_t)a3;
- (void)setWifiRangingResults:(id)a3;
- (void)setWifiRequest:(id)a3;
- (void)start;
@end

@implementation SDAutoUnlockAuthSession

- (SDAutoUnlockAuthSession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAuthSession;
  v10 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v13, "initWithDevice:sessionID:", a3, a4);
  v11 = v10;
  if (v10)
  {
    v10->_useAKSToken = 0;
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    v11->_protocol = 1LL;
  }

  return v11;
}

- (void)invalidate
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAuthSession;
  -[SDAutoUnlockPairingSession invalidate](&v9, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v4 = [v3 resetSession];

  uint64_t v6 = auto_unlock_log(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"NO";
    if (v4) {
      v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (id)getAppName
{
  return 0LL;
}

- (void)start
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011AAA4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_start
{
}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 errorHandler:(id)a5
{
  uint64_t v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011AB44;
  v8[3] = &unk_1005CEB98;
  objc_super v9 = self;
  id v10 = a5;
  id v7 = v10;
  -[SDAutoUnlockAuthSession sendData:type:completionHandler:](v9, "sendData:type:completionHandler:", a3, v5, v8);
}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", a3, v5));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:]( self,  "sendData:bleDevice:completionHandler:",  v10,  v9,  v8);
}

- (void)sendAWDLInfo
{
}

- (void)sendAWDLInfo:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlInfoData](self, "awdlInfoData"));
  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
    }

    objc_super v9 = objc_alloc_init(&OBJC_CLASS___SDAutoUnlockAWDLInfo);
    -[SDAutoUnlockAWDLInfo setVersion:](v9, "setVersion:", 3LL);
    -[SDAutoUnlockAWDLInfo setAwdlInfo:](v9, "setAwdlInfo:", v5);
    -[SDAutoUnlockAWDLInfo setUseToken:]( v9,  "setUseToken:",  -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"));
    int64_t v10 = -[SDAutoUnlockAuthSession attemptType](self, "attemptType");
    -[SDAutoUnlockAWDLInfo setAuthPrompt:](v9, "setAuthPrompt:", v10 == 2);
    if (v10 == 2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession getAppName](self, "getAppName"));
      if (v11) {
        -[SDAutoUnlockAWDLInfo setAppName:](v9, "setAppName:", v11);
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo data](v9, "data"));
    if (!a3)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10011AED4;
      v17[3] = &unk_1005CB3E8;
      v17[4] = self;
      -[SDAutoUnlockAuthSession sendAWDLInfoData:type:completionHandler:]( self,  "sendAWDLInfoData:type:completionHandler:",  v12,  301LL,  v17);

      goto LABEL_15;
    }

    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v12, 301LL));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10011B000;
    v16[3] = &unk_1005CB3E8;
    v16[4] = self;
    -[SDAutoUnlockAuthSession sendData:bleDevice:completionHandler:]( self,  "sendData:bleDevice:completionHandler:",  v13,  v14,  v16);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10011BFE0(v8);
    }

    uint64_t v15 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    v20 = @"AWDL info retrieval failed";
    objc_super v9 = (SDAutoUnlockAWDLInfo *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  103LL,  v9));
    -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v13);
  }

LABEL_15:
}

- (NSData)awdlInfoData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 awdlInfo]);

  uint64_t v6 = auto_unlock_log(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using AWDL info %@", (uint8_t *)&v11, 0xCu);
  }

  -[SDAutoUnlockAuthSession setLocalAWDLInfo:](self, "setLocalAWDLInfo:", v4);
  id v8 = sub_100089D90(v4);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSData *)v9;
}

- (void)sendData:(id)a3 bleDevice:(id)a4 completionHandler:(id)a5
{
}

- (void)sendData:(id)a3 bleDevice:(id)a4 direct:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = -[SDAutoUnlockAuthSession useEncryption](self, "useEncryption");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));

    uint64_t v16 = auto_unlock_log(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Encryption start", buf, 2u);
      }

      NSErrorUserInfoKey v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      id v39 = 0LL;
      id v40 = 0LL;
      id v38 = 0LL;
      unsigned int v21 = [v19 encryptMessageData:v10 deviceID:v20 encryptedMessage:&v40 authTag:&v39 nonce:&v38];
      v18 = (os_log_s *)v40;
      id v37 = v39;
      id v22 = v38;

      if (v21 && v18 && v37 && v22)
      {
        v24 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionWrapper);
        -[SDAutoUnlockSessionWrapper setVersion:](v24, "setVersion:", 2LL);
        -[SDAutoUnlockSessionWrapper setEncryptedPayload:](v24, "setEncryptedPayload:", v18);
        -[SDAutoUnlockSessionWrapper setAuthTag:](v24, "setAuthTag:", v37);
        -[SDAutoUnlockSessionWrapper setNonce:](v24, "setNonce:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" with wrapper %@ sessionID: %@",  v24,  v25));

        uint64_t v28 = auto_unlock_log(v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Using encryption%{private}@", buf, 0xCu);
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v24, "data"));
        if (v7) {
          [v30 sendUnlockDataDirect:v31 toBLEDevice:v11 completion:v12];
        }
        else {
          [v30 sendUnlockData:v31 toBLEDevice:v11 completion:v12];
        }
      }

      else
      {
        uint64_t v34 = auto_unlock_log(v23);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v44 = v10;
          __int16 v45 = 2112;
          id v46 = v37;
          __int16 v47 = 2112;
          id v48 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Error encrypting message (data: %@, authTag: %@, nonce: %@)",  buf,  0x20u);
        }

        uint64_t v36 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        v42 = @"Encryption failed";
        v24 = (SDAutoUnlockSessionWrapper *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v36,  189LL,  v24));
        -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v26);
      }
    }

    else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      sub_10011C020(v18);
    }
  }

  else
  {
    uint64_t v32 = auto_unlock_log(v13);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Using BLE encryption", buf, 2u);
    }

    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    -[os_log_s sendUnlockData:toBLEDevice:completion:](v18, "sendUnlockData:toBLEDevice:completion:", v10, v11, v12);
  }
}

- (id)peerListFromAWDLInfo:(id)a3
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"AWDL_IF_MAC_ADDRESS"]);
  if (v4
    && (uint64_t v5 = objc_alloc(&OBJC_CLASS____NIRangingPeer),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession rangingKey](self, "rangingKey")),
        BOOL v7 = -[_NIRangingPeer initWithMacAddressAsData:secureRangingKeyID:]( v5,  "initWithMacAddressAsData:secureRangingKeyID:",  v4,  v6),  v6,  v7))
  {
    id v10 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (NSData)rangingKey
{
  if (-[SDAutoUnlockAuthSession useRealRangingKey](self, "useRealRangingKey"))
  {
    if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") == (id)1
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey")),
          v3,
          v3))
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 rangingKeyForDeviceID:v7]);
    }

    uint64_t v5 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v4);
    uint64_t v8 = auto_unlock_log(v5);
    objc_super v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"YES";
      if (!v5) {
        id v10 = @"NO";
      }
      int v24 = 138412290;
      v25[0] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ranging key exists %@", (uint8_t *)&v24, 0xCu);
    }
  }

  else
  {
    uint64_t v5 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 64LL);
  }

  id v11 = -[NSMutableData length](v5, "length");
  if (v11 <= 0x3F)
  {
    int v12 = (_DWORD)v11 - 64;
    do
    {
      LOBYTE(v24) = 48;
      id v11 = -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v24, 1LL);
    }

    while (!__CFADD__(v12++, 1));
  }

  uint64_t v14 = auto_unlock_log(v11);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = -[NSMutableData length](v5, "length");
    unsigned int v17 = -[SDAutoUnlockAuthSession useRealRangingKey](self, "useRealRangingKey");
    v18 = @"NO";
    if (v17) {
      v18 = @"YES";
    }
    int v24 = 67109378;
    LODWORD(v25[0]) = v16;
    WORD2(v25[0]) = 2112;
    *(void *)((char *)v25 + 6) = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Using ranging key (size: %d, realKey %@)",  (uint8_t *)&v24,  0x12u);
  }

  uint64_t v20 = auto_unlock_log(v19);
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10011C060((uint64_t)v5, v21);
  }

  id v22 = -[NSMutableData copy](v5, "copy");
  return (NSData *)v22;
}

- (BOOL)useRealRangingKey
{
  return sub_10008E24C(@"AUUseRangingKey", 1LL) != 0;
}

- (BOOL)rangingDisabled
{
  return sub_10008E24C(@"DisableRanging", 0LL) != 0;
}

- (BOOL)useAKSToken
{
  return self->_useAKSToken;
}

- (void)setUseAKSToken:(BOOL)a3
{
  self->_useAKSToken = a3;
}

- (BOOL)inRange
{
  return self->_inRange;
}

- (void)setInRange:(BOOL)a3
{
  self->_inRange = a3;
}

- (BOOL)shouldUnlock
{
  return self->_shouldUnlock;
}

- (void)setShouldUnlock:(BOOL)a3
{
  self->_shouldUnlock = a3;
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (void)setAwdlInfoData:(id)a3
{
}

- (BOOL)isAcceptor
{
  return self->_acceptor;
}

- (void)setAcceptor:(BOOL)a3
{
  self->_acceptor = a3;
}

- (NSDate)awdlStart
{
  return self->_awdlStart;
}

- (void)setAwdlStart:(id)a3
{
}

- (double)awdlInterval
{
  return self->_awdlInterval;
}

- (void)setAwdlInterval:(double)a3
{
  self->_awdlInterval = a3;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (void)setRangingKey:(id)a3
{
}

- (BOOL)rangingTimedOut
{
  return self->_rangingTimedOut;
}

- (void)setRangingTimedOut:(BOOL)a3
{
  self->_rangingTimedOut = a3;
}

- (NSString)rangingErrorString
{
  return self->_rangingErrorString;
}

- (void)setRangingErrorString:(id)a3
{
}

- (BOOL)aksSuccess
{
  return self->_aksSuccess;
}

- (void)setAksSuccess:(BOOL)a3
{
  self->_aksSuccess = a3;
}

- (NSDate)rangingStart
{
  return self->_rangingStart;
}

- (void)setRangingStart:(id)a3
{
}

- (double)rangingInterval
{
  return self->_rangingInterval;
}

- (void)setRangingInterval:(double)a3
{
  self->_rangingInterval = a3;
}

- (NSError)attemptError
{
  return self->_attemptError;
}

- (void)setAttemptError:(id)a3
{
}

- (NSDictionary)remoteAWDLInfo
{
  return self->_remoteAWDLInfo;
}

- (void)setRemoteAWDLInfo:(id)a3
{
}

- (NSDictionary)localAWDLInfo
{
  return self->_localAWDLInfo;
}

- (void)setLocalAWDLInfo:(id)a3
{
}

- (NSData)sessionRangingKey
{
  return self->_sessionRangingKey;
}

- (void)setSessionRangingKey:(id)a3
{
}

- (unint64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (NSString)wifiErrorDomain
{
  return self->_wifiErrorDomain;
}

- (void)setWifiErrorDomain:(id)a3
{
}

- (int64_t)wifiRangingErrorCode
{
  return self->_wifiRangingErrorCode;
}

- (void)setWifiRangingErrorCode:(int64_t)a3
{
  self->_wifiRangingErrorCode = a3;
}

- (NSArray)wifiRangingResults
{
  return self->_wifiRangingResults;
}

- (void)setWifiRangingResults:(id)a3
{
}

- (NSError)startAWDLError
{
  return self->_startAWDLError;
}

- (void)setStartAWDLError:(id)a3
{
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(int64_t)a3
{
  self->_errorType = a3;
}

- (SDAutoUnlockWiFiRequest)wifiRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setWifiRequest:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSData)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  self->_skipMotionCheck = a3;
}

- (NSDate)lastLocalUnlockDate
{
  return self->_lastLocalUnlockDate;
}

- (void)setLastLocalUnlockDate:(id)a3
{
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  self->_isAuthenticatingForSiri = a3;
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 288LL, 1);
}

- (void)setAwdlNetwork:(id)a3
{
}

- (void).cxx_destruct
{
}

@end