@interface SDAutoUnlockAKSSession
- (BOOL)confirmSession;
- (BOOL)ltkNeedsFixing;
- (BOOL)originator;
- (BOOL)resetSession;
- (BOOL)sessionIsValid;
- (BOOL)stepSessionWithData:(id)a3 outputData:(id *)a4;
- (BOOL)usingEscrow;
- (NSData)escrowSecret;
- (NSData)externalACMContext;
- (NSData)localLTK;
- (NSData)remoteLTK;
- (NSString)deviceID;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8 usingEscrow:(BOOL)a9 externalACMContext:(id)a10;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 externalACMContext:(id)a8;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 usingEscrow:(BOOL)a8;
- (id)generateACMContextData;
- (id)generateEscrowSecret;
- (id)generateSessionToken;
- (int64_t)aksSessionID;
- (int64_t)finalizeEscrowPairing:(id)a3;
- (int64_t)finalizeRegistration;
- (int64_t)sessionType;
- (void)fixRemoteLTK;
- (void)setAksSessionID:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setEscrowSecret:(id)a3;
- (void)setExternalACMContext:(id)a3;
- (void)setLocalLTK:(id)a3;
- (void)setLtkNeedsFixing:(BOOL)a3;
- (void)setOriginator:(BOOL)a3;
- (void)setRemoteLTK:(id)a3;
- (void)setSessionType:(int64_t)a3;
- (void)setUsingEscrow:(BOOL)a3;
- (void)setupAuthorizationSession;
- (void)setupSession;
@end

@implementation SDAutoUnlockAKSSession

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7
{
  LOBYTE(v8) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:]( self,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:",  a3,  a4,  a5,  a6,  a7,  0LL,  v8,  0LL);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 externalACMContext:(id)a8
{
  LOBYTE(v9) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:]( self,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:",  a3,  a4,  a5,  a6,  a7,  0LL,  v9,  a8);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 usingEscrow:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:]( self,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:",  a3,  a4,  a5,  a6,  a7,  0LL,  v9,  0LL);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8
{
  LOBYTE(v9) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:]( self,  "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:",  a3,  a4,  a5,  a6,  a7,  a8,  v9,  0LL);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8 usingEscrow:(BOOL)a9 externalACMContext:(id)a10
{
  id v28 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SDAutoUnlockAKSSession;
  v20 = -[SDAutoUnlockAKSSession init](&v29, "init");
  if (v20)
  {
    v21 = (NSData *)[v28 copy];
    localLTK = v20->_localLTK;
    v20->_localLTK = v21;

    v23 = (NSData *)[v16 copy];
    remoteLTK = v20->_remoteLTK;
    v20->_remoteLTK = v23;

    v20->_sessionType = a5;
    v20->_originator = a6;
    v25 = (NSData *)[v18 copy];
    escrowSecret = v20->_escrowSecret;
    v20->_escrowSecret = v25;

    v20->_usingEscrow = a9;
    objc_storeStrong((id *)&v20->_deviceID, a7);
    objc_storeStrong((id *)&v20->_externalACMContext, a10);
    v20->_aksSessionID = -1LL;
    v20->_acmContext = 0LL;
    -[SDAutoUnlockAKSSession setupSession](v20, "setupSession");
  }

  return v20;
}

- (void)setupSession
{
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  int v39 = 0;
  switch(-[SDAutoUnlockAKSSession sessionType](self, "sessionType"))
  {
    case 1LL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v5 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100012B64(v3, v4, v5, (_DWORD *)v37 + 6, 1));

      uint64_t v6 = *((int *)v37 + 6);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_1000225E4;
      v35[3] = &unk_1005CB510;
      v35[4] = self;
      v35[5] = &v36;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v6, v35);
      goto LABEL_19;
    case 2LL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v9 = -[SDAutoUnlockAKSSession originator](self, "originator");
      int v10 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100013170(v7, v8, v9, v10, 0, v11, (_DWORD *)v37 + 6));

      uint64_t v12 = *((int *)v37 + 6);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100022708;
      v34[3] = &unk_1005CB510;
      v34[4] = self;
      v34[5] = &v36;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v12, v34);
      goto LABEL_19;
    case 3LL:
      if (!-[SDAutoUnlockAKSSession originator](self, "originator")) {
        goto LABEL_15;
      }
      goto LABEL_16;
    case 4LL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v15 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100012B64(v13, v14, v15, (_DWORD *)v37 + 6, 0));
      goto LABEL_18;
    case 5LL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v16 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100013154(v13, v14, v16, (_DWORD *)v37 + 6));
      goto LABEL_18;
    case 6LL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v17 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100012B64(v13, v14, v17, (_DWORD *)v37 + 6, 1));
      goto LABEL_18;
    case 7LL:
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v20 = -[SDAutoUnlockAKSSession originator](self, "originator");
      int v21 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_10001334C(v18, v19, v20, v21, 0, v22, 0, (_DWORD *)v37 + 6));

      uint64_t v23 = *((int *)v37 + 6);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100022860;
      v33[3] = &unk_1005CB510;
      v33[4] = self;
      v33[5] = &v36;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v23, v33);
      goto LABEL_19;
    case 8LL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      int v24 = -[SDAutoUnlockAKSSession originator](self, "originator");
      int v25 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_1000134D8(v13, v14, v24, v25, 0, v26, 0, (_DWORD *)v37 + 6));
      goto LABEL_17;
    case 9LL:
      if (-[SDAutoUnlockAKSSession originator](self, "originator"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession externalACMContext](self, "externalACMContext"));

        if (v27)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
          int v28 = -[SDAutoUnlockAKSSession originator](self, "originator");
          int v29 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession externalACMContext](self, "externalACMContext"));
          -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_1000131A0(v13, v14, v28, v29, 1, 1, v26, 0, (_DWORD *)v37 + 6));
        }

        else
        {
LABEL_16:
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
          int v31 = -[SDAutoUnlockAKSSession originator](self, "originator");
          int v32 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
          -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100013170(v13, v14, v31, v32, 1, v26, (_DWORD *)v37 + 6));
        }

- (void)setupAuthorizationSession
{
  uint64_t v20 = 0LL;
  externalACMContext = self->_externalACMContext;
  p_acmContext = &self->_acmContext;
  if (externalACMContext)
  {
    sub_1000118E8(externalACMContext, &self->_acmContext);
    if (!*p_acmContext)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      -[SDAutoUnlockAKSSession setAksSessionID:]( self,  "setAksSessionID:",  sub_100013660(v6, v7, self->_externalACMContext, 0LL));
    }
  }

  else
  {
    sub_100011898((uint64_t *)&self->_acmContext);
  }

  if (*p_acmContext)
  {
    uint64_t v8 = self->_externalACMContext;
    uint64_t v9 = auto_unlock_log(v5);
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        uint64_t v12 = self->_externalACMContext;
        *(_DWORD *)buf = 138477827;
        v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AKS session using provided context: %{private}@",  buf,  0xCu);
      }

      v13 = self->_externalACMContext;
    }

    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AKS session creating new context", buf, 2u);
      }

      int v16 = *p_acmContext;
      id v19 = 0LL;
      sub_100011974(v16, &v19, &v20);
      int v17 = (NSData *)v19;
      v13 = v17;
      if (v20)
      {
        uint64_t v18 = auto_unlock_log(v17);
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100023058(&v20, v14);
        }
        goto LABEL_16;
      }
    }

    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_100013660(v14, v15, v13, 0LL));

LABEL_16:
  }

- (void)fixRemoteLTK
{
  uint64_t v3 = auto_unlock_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to fix remote LTK", v10, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession deviceID](self, "deviceID"));
  [v5 resignRemoteLTKForDeviceID:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](&OBJC_CLASS___SDAutoUnlockAKSManager, "sharedManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession deviceID](self, "deviceID"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteLTKForDeviceID:v8]);
  -[SDAutoUnlockAKSSession setRemoteLTK:](self, "setRemoteLTK:", v9);
}

- (BOOL)sessionIsValid
{
  return -[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID") >= 0;
}

- (BOOL)stepSessionWithData:(id)a3 outputData:(id *)a4
{
  id v6 = a3;
  if (!-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid")) {
    goto LABEL_5;
  }
  if (!sub_100013858(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"), v6, a4))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    sub_1000122CC(v8);

LABEL_5:
    BOOL v7 = 0;
    goto LABEL_6;
  }

  BOOL v7 = 1;
LABEL_6:

  return v7;
}

- (id)generateEscrowSecret
{
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    id v3 = sub_1000139BC(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (int64_t)finalizeEscrowPairing:(id)a3
{
  id v4 = a3;
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    int64_t v5 = sub_100013A60(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"), v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    sub_1000122CC(v6);
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (int64_t)finalizeRegistration
{
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid")) {
    return sub_100013BFC(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
  }
  else {
    return 0LL;
  }
}

- (BOOL)confirmSession
{
  BOOL v3 = -[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid");
  if (v3) {
    LOBYTE(v3) = sub_100013C68(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
  }
  return v3;
}

- (BOOL)resetSession
{
  BOOL v3 = -[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid");
  if (v3)
  {
    BOOL v4 = sub_100013D3C(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", -1LL);
    LOBYTE(v3) = v4;
  }

  return v3;
}

- (id)generateSessionToken
{
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    id v3 = sub_100013674(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

- (id)generateACMContextData
{
  uint64_t v7 = 0LL;
  acmContext = self->_acmContext;
  if (acmContext)
  {
    if (!sub_100011C58(acmContext))
    {
LABEL_5:
      acmContext = 0LL;
      return acmContext;
    }

    BOOL v4 = self->_acmContext;
    id v6 = 0LL;
    sub_100011974(v4, &v6, &v7);
    acmContext = (__ACMHandle *)v6;
    if (v7)
    {

      goto LABEL_5;
    }
  }

  return acmContext;
}

- (int64_t)aksSessionID
{
  return self->_aksSessionID;
}

- (void)setAksSessionID:(int64_t)a3
{
  self->_aksSessionID = a3;
}

- (BOOL)ltkNeedsFixing
{
  return self->_ltkNeedsFixing;
}

- (void)setLtkNeedsFixing:(BOOL)a3
{
  self->_ltkNeedsFixing = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
}

- (NSData)remoteLTK
{
  return self->_remoteLTK;
}

- (void)setRemoteLTK:(id)a3
{
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (BOOL)originator
{
  return self->_originator;
}

- (void)setOriginator:(BOOL)a3
{
  self->_originator = a3;
}

- (NSData)escrowSecret
{
  return self->_escrowSecret;
}

- (void)setEscrowSecret:(id)a3
{
}

- (BOOL)usingEscrow
{
  return self->_usingEscrow;
}

- (void)setUsingEscrow:(BOOL)a3
{
  self->_usingEscrow = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end