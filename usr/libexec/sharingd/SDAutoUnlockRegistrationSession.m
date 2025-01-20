@interface SDAutoUnlockRegistrationSession
- (id)description;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
@end

@implementation SDAutoUnlockRegistrationSession

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = auto_unlock_log(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Registration session notifying delegate with error: %@",  (uint8_t *)&v10,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  char v8 = objc_opt_respondsToSelector(v7, "session:didCompleteWithError:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    [v9 session:self didCompleteWithError:v4];
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p deviceID=%@ sessionID=%@>",  v5,  self,  v6,  v7));

  return v8;
}

- (void)invalidate
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDAutoUnlockRegistrationSession;
  -[SDAutoUnlockPairingSession invalidate](&v9, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  unsigned int v4 = [v3 resetSession];

  uint64_t v6 = auto_unlock_log(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }

  -[SDAutoUnlockPairingSession setDelegate:](self, "setDelegate:", 0LL);
}

@end