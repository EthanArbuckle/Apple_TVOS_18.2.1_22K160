@interface SDAutoUnlockPeer
+ (id)stringFromState:(unint64_t)a3;
- (BOOL)canPerformUnlocks;
- (BOOL)isKeyBagLocked;
- (BOOL)shouldRegister;
- (NSString)deviceID;
- (SDAutoUnlockPeer)initWithDeviceID:(id)a3;
- (id)description;
- (unint64_t)state;
- (void)handleBioLockout;
- (void)handleConfirmationFailed;
- (void)handleDeviceUnlocked;
- (void)handlePairedSuccessfully;
- (void)handleRegistrationBegan;
- (void)handleRegistrationCompletedSuccessfully:(BOOL)a3;
- (void)handleRegistrationFailedKeyLocked;
- (void)handleRemoteRegistrationRequested;
- (void)setDeviceID:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation SDAutoUnlockPeer

- (SDAutoUnlockPeer)initWithDeviceID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPeer;
  id v3 = a3;
  v4 = -[SDAutoUnlockPeer init](&v8, "init");
  v5 = (NSString *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  deviceID = v4->_deviceID;
  v4->_deviceID = v5;

  v4->_state = 0LL;
  return v4;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "stringFromState:", -[SDAutoUnlockPeer state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SDAutoUnlockPeer: %p, deviceID = %@, state = %@>",  self,  v3,  v6));

  return v7;
}

- (BOOL)shouldRegister
{
  return !-[SDAutoUnlockPeer state](self, "state") || (id)-[SDAutoUnlockPeer state](self, "state") == (id)4;
}

- (BOOL)canPerformUnlocks
{
  return (id)-[SDAutoUnlockPeer state](self, "state") == (id)3;
}

- (BOOL)isKeyBagLocked
{
  return (id)-[SDAutoUnlockPeer state](self, "state") == (id)4;
}

- (void)handlePairedSuccessfully
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing has armed: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SDAutoUnlockPeer setState:](self, "setState:", 3LL);
}

- (void)handleRegistrationBegan
{
  uint64_t v3 = auto_unlock_log(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Beginning registration for deviceID: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[SDAutoUnlockPeer setState:](self, "setState:", 1LL);
}

- (void)handleRegistrationCompletedSuccessfully:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  -[SDAutoUnlockPeer setState:](self, "setState:", v3);
}

- (void)handleRegistrationFailedKeyLocked
{
}

- (void)handleDeviceUnlocked
{
  if ((id)-[SDAutoUnlockPeer state](self, "state") == (id)2)
  {
    uint64_t v3 = auto_unlock_log(2LL);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
      int v13 = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlock has armed: %@", (uint8_t *)&v13, 0xCu);
    }

    -[SDAutoUnlockPeer setState:](self, "setState:", 3LL);
  }

  else
  {
    unint64_t v6 = -[SDAutoUnlockPeer state](self, "state");
    if (v6 != 3)
    {
      uint64_t v7 = auto_unlock_log(v6);
      objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
        id v11 = objc_msgSend((id)objc_opt_class(self, v10), "stringFromState:", -[SDAutoUnlockPeer state](self, "state"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        int v13 = 138412546;
        v14 = v9;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unlock did not arm %@ current state is %@",  (uint8_t *)&v13,  0x16u);
      }
    }
  }

- (void)handleBioLockout
{
}

- (void)handleRemoteRegistrationRequested
{
}

- (void)handleConfirmationFailed
{
}

+ (id)stringFromState:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1005CCEB0 + a3);
  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end