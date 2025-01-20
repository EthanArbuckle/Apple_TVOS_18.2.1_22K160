@interface IDSTemporaryPhoneUserExpirationManager
- (IDSTemporaryPhoneUserExpirationManager)initWithUserStore:(id)a3 delegate:(id)a4;
- (IDSTemporaryPhoneUserExpirationManagerDelegate)delegate;
- (NSMutableDictionary)usersToTimers;
- (os_unfair_lock_s)usersToTimersLock;
- (void)_attemptToKickoffExpirationTimerForUser:(id)a3;
- (void)_cancelExpirationTimerForUser:(id)a3;
- (void)_expireTimer:(id)a3;
- (void)_kickoffExpirationTimerForInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUsersToTimers:(id)a3;
- (void)setUsersToTimersLock:(os_unfair_lock_s)a3;
- (void)userStore:(id)a3 didAddUser:(id)a4;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
- (void)userStore:(id)a3 didUpdateUser:(id)a4;
@end

@implementation IDSTemporaryPhoneUserExpirationManager

- (IDSTemporaryPhoneUserExpirationManager)initWithUserStore:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___IDSTemporaryPhoneUserExpirationManager;
  v8 = -[IDSTemporaryPhoneUserExpirationManager init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    v8->_usersToTimersLock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    usersToTimers = v9->_usersToTimers;
    v9->_usersToTimers = v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    [v6 addActionListener:v9 forRealm:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 usersWithRealm:2]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[IDSTemporaryPhoneUserExpirationManager _attemptToKickoffExpirationTimerForUser:]( v9,  "_attemptToKickoffExpirationTimerForUser:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v16));
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v14);
    }
  }

  return v9;
}

- (void)_attemptToKickoffExpirationTimerForUser:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 realm] == (id)2;
  v5 = v9;
  if (v4)
  {
    id v6 = v9;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);

    if (v7)
    {
      v8 = -[IDSTemporaryPhoneUserExpirationTimerInfo initWithUser:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserExpirationTimerInfo),  "initWithUser:",  v6);
      -[IDSTemporaryPhoneUserExpirationManager _kickoffExpirationTimerForInfo:]( self,  "_kickoffExpirationTimerForInfo:",  v8);
    }

    v5 = v9;
  }
}

- (void)_kickoffExpirationTimerForInfo:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 user]);
    int v27 = 138412546;
    v28 = v6;
    __int16 v29 = 2048;
    id v30 = [v4 expirationPhase];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Setting expiration timer for temporary user %@ with phase %ld",  (uint8_t *)&v27,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 user]);
  os_unfair_lock_lock(&self->_usersToTimersLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);
    [v13 invalidate];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
    [v14 setObject:0 forKeyedSubscript:v15];
  }

  v16 = objc_alloc(&OBJC_CLASS___IMTimer);
  [v4 expirationInterval];
  double v18 = v17;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  uint64_t v21 = im_primary_queue(v19, v20);
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = -[IMTimer initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:]( v16,  "initWithTimeInterval:name:shouldWake:target:selector:userInfo:queue:",  v19,  1LL,  self,  "_expireTimer:",  v4,  v22,  v18);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  [v24 setObject:v23 forKeyedSubscript:v25];

  os_unfair_lock_unlock(&self->_usersToTimersLock);
  [v4 expirationInterval];
  if (v26 <= 0.0) {
    -[IDSTemporaryPhoneUserExpirationManager _expireTimer:](self, "_expireTimer:", v23);
  }
}

- (void)_cancelExpirationTimerForUser:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing expiration timer for temporary user %@",  (uint8_t *)&v12,  0xCu);
  }

  p_usersToTimersLock = &self->_usersToTimersLock;
  os_unfair_lock_lock(&self->_usersToTimersLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  [v9 invalidate];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  [v10 setObject:0 forKeyedSubscript:v11];

  os_unfair_lock_unlock(p_usersToTimersLock);
}

- (void)_expireTimer:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 user]);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    double v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Expiration timer fired for temporary user %@",  (uint8_t *)&v16,  0xCu);
  }

  os_unfair_lock_lock(&self->_usersToTimersLock);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  if (v10)
  {
    [v4 invalidate];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager usersToTimers](self, "usersToTimers"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    [v11 setObject:0 forKeyedSubscript:v12];

    os_unfair_lock_unlock(&self->_usersToTimersLock);
    id v13 = [v5 expirationPhase];
    if (v13 == (id)1)
    {
      uint64_t v15 = (IDSTemporaryPhoneUserExpirationTimerInfo *)objc_claimAutoreleasedReturnValue( -[IDSTemporaryPhoneUserExpirationManager delegate]( self,  "delegate"));
      -[IDSTemporaryPhoneUserExpirationTimerInfo expirationManager:didExpireUser:]( v15,  "expirationManager:didExpireUser:",  self,  v6);
      goto LABEL_9;
    }

    if (!v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSTemporaryPhoneUserExpirationManager delegate](self, "delegate"));
      [v14 expirationManager:self nearingExpirationForUser:v6];

      uint64_t v15 = -[IDSTemporaryPhoneUserExpirationTimerInfo initWithUser:expirationPhase:]( objc_alloc(&OBJC_CLASS___IDSTemporaryPhoneUserExpirationTimerInfo),  "initWithUser:expirationPhase:",  v6,  1LL);
      -[IDSTemporaryPhoneUserExpirationManager _kickoffExpirationTimerForInfo:]( self,  "_kickoffExpirationTimerForInfo:",  v15);
LABEL_9:
    }
  }

  else
  {
    os_unfair_lock_unlock(&self->_usersToTimersLock);
  }
}

- (void)userStore:(id)a3 didAddUser:(id)a4
{
}

- (void)userStore:(id)a3 didUpdateUser:(id)a4
{
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
}

- (IDSTemporaryPhoneUserExpirationManagerDelegate)delegate
{
  return (IDSTemporaryPhoneUserExpirationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)usersToTimersLock
{
  return self->_usersToTimersLock;
}

- (void)setUsersToTimersLock:(os_unfair_lock_s)a3
{
  self->_usersToTimersLock = a3;
}

- (NSMutableDictionary)usersToTimers
{
  return self->_usersToTimers;
}

- (void)setUsersToTimers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end