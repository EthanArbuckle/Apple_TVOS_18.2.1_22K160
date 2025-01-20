@interface ParentalControls
+ (id)objectForKey:(id)a3;
+ (id)standardControls;
- (BOOL)active;
- (BOOL)disableAV;
- (BOOL)disableAccount:(id)a3;
- (BOOL)disableService:(id)a3;
- (BOOL)disableServiceSession:(id)a3;
- (BOOL)forceAllowlistForServiceSession:(id)a3;
- (BOOL)forceChatLogging;
- (BOOL)shouldPostNotifications;
- (ParentalControls)init;
- (id)_serviceWithName:(id)a3;
- (id)allowlistForServiceSession:(id)a3;
- (void)_managedPrefsNotification:(id)a3;
- (void)_updateParentalSettings;
- (void)setShouldPostNotifications:(BOOL)a3;
- (void)updateAccountActivation;
@end

@implementation ParentalControls

+ (id)standardControls
{
  id result = (id)qword_100071040;
  if (!qword_100071040)
  {
    qword_100071040 = objc_alloc_init(&OBJC_CLASS___ParentalControls);
    [(id)qword_100071040 setShouldPostNotifications:0];
    [(id)qword_100071040 _updateParentalSettings];
    [(id)qword_100071040 setShouldPostNotifications:1];
    return (id)qword_100071040;
  }

  return result;
}

- (ParentalControls)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ParentalControls;
  v2 = -[ParentalControls init](&v8, "init");
  if (v2)
  {
    v2->_parentalControls = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v2,  "_managedPrefsNotification:",  kCFManagedPreferencesMCXNotificationName,  kCFManagedPreferencesMCXObjectName);
    v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v4,  "addObserver:selector:name:object:",  v2,  "_managedPrefsNotification:",  FaceTimeDeviceRegistrationCapabilityChangedNotification,  0LL);
    v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  v2,  "_managedPrefsNotification:",  FaceTimeDeviceCapabilityChangedNotification,  0LL);
    v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  v2,  "_managedPrefsNotification:",  FaceTimeDeviceRestictionsChangedNotification,  0LL);
  }

  return v2;
}

- (id)_serviceWithName:(id)a3
{
  id result = -[NSMutableDictionary objectForKey:](self->_parentalControls, "objectForKey:");
  if (!result)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___ParentalControlsService);
    -[ParentalControlsService setName:](v6, "setName:", a3);
    -[NSMutableDictionary setObject:forKey:](self->_parentalControls, "setObject:forKey:", v6, a3);
    return v6;
  }

  return result;
}

- (void)_updateParentalSettings
{
  BOOL active = self->_active;
  if (self->_active) {
    self->_BOOL active = 0;
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v2 = -[NSMutableDictionary allValues](self->_parentalControls, "allValues");
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (_IMWillLog(@"ParentalControls"))
        {
          id v8 = [v7 name];
          else {
            v9 = @"NO";
          }
          id v13 = v8;
          v14 = v9;
          _IMAlwaysLog(0LL, @"ParentalControls", @"%@ Disabled: %@");
        }

        if (_IMWillLog(@"ParentalControls"))
        {
          id v10 = [v7 name];
          else {
            v11 = @"NO";
          }
          id v13 = v10;
          v14 = v11;
          _IMAlwaysLog(0LL, @"ParentalControls", @"%@ Force Allowlist: %@");
        }

        if (_IMWillLog(@"ParentalControls"))
        {
          id v13 = [v7 name];
          v14 = (const __CFString *)[v7 allowlist];
          _IMAlwaysLog(0LL, @"ParentalControls", @"%@ Allowlist: %@");
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v4);
  }

  if (active && self->_shouldPostNotifications)
  {
    v12 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter __mainThreadPostNotificationName:object:]( v12,  "__mainThreadPostNotificationName:object:",  IMDManagedPreferencesChangedNotification,  self);
  }

  -[ParentalControls updateAccountActivation](self, "updateAccountActivation", v13, v14);
}

+ (id)objectForKey:(id)a3
{
  id result = [a3 length];
  if (result) {
    return +[NSUserDefaults _IMAgentObjectForKey:]( NSUserDefaults,  "_IMAgentObjectForKey:",  [@"Setting." stringByAppendingString:a3]);
  }
  return result;
}

- (void)updateAccountActivation
{
  id v3 = +[IMDAccountController sharedAccountController](&OBJC_CLASS___IMDAccountController, "sharedAccountController");
  unsigned int v4 = [v3 isLoading];
  uint64_t v5 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Waiting on account activate, the account controller isn't ready yet",  buf,  2u);
    }
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " Updating account activation if needed",  buf,  2u);
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v7 = [v3 accounts];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v17;
      *(void *)&__int128 v9 = 138412290LL;
      __int128 v15 = v9;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if (objc_msgSend(v13, "isActive", v15)
            && -[ParentalControls disableAccount:](self, "disableAccount:", v13))
          {
            objc_msgSend(v3, "deactivateAccount:", objc_msgSend(v13, "accountID"));
            [v13 setWasDisabledAutomatically:1];
          }

          else if (([v13 isActive] & 1) == 0 {
                 && !-[ParentalControls disableAccount:](self, "disableAccount:", v13)
          }
                 && [v13 wasDisabledAutomatically])
          {
            v14 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Re-activating a disabled account: %@",  buf,  0xCu);
            }

            objc_msgSend(v3, "activateAccount:", objc_msgSend(v13, "accountID"));
            objc_msgSend(objc_msgSend(v13, "session"), "login");
          }
        }

        id v10 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }

      while (v10);
    }
  }

- (BOOL)disableAV
{
  BOOL v3 = -[ParentalControls active](self, "active");
  if (v3) {
    LOBYTE(v3) = self->_disableAV;
  }
  return v3;
}

- (BOOL)forceChatLogging
{
  BOOL v3 = -[ParentalControls active](self, "active");
  if (v3) {
    LOBYTE(v3) = self->_forceChatLogging;
  }
  return v3;
}

- (BOOL)disableService:(id)a3
{
  if (a3)
  {
    unsigned int v5 = -[ParentalControls active](self, "active");
    if (v5) {
      LOBYTE(v5) = objc_msgSend( -[ParentalControls _serviceWithName:]( self,  "_serviceWithName:",  objc_msgSend(a3, "internalName")),  "disableService");
    }
  }

  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)disableAccount:(id)a3
{
  return -[ParentalControls disableService:](self, "disableService:", [a3 service]);
}

- (BOOL)disableServiceSession:(id)a3
{
  return -[ParentalControls disableService:](self, "disableService:", [a3 service]);
}

- (id)allowlistForServiceSession:(id)a3
{
  id result = [a3 service];
  if (result)
  {
    id v5 = result;
    if (-[ParentalControls active](self, "active"))
    {
      id v6 = objc_msgSend( -[ParentalControls _serviceWithName:](self, "_serviceWithName:", objc_msgSend(v5, "internalName")),  "allowlist");
      if ([v6 count]) {
        return v6;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)forceAllowlistForServiceSession:(id)a3
{
  id v4 = [a3 service];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = -[ParentalControls active](self, "active");
    if (v6) {
      LOBYTE(v6) = objc_msgSend( -[ParentalControls _serviceWithName:]( self,  "_serviceWithName:",  objc_msgSend(v5, "internalName")),  "forceAllowlist");
    }
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)_managedPrefsNotification:(id)a3
{
}

- (BOOL)shouldPostNotifications
{
  return self->_shouldPostNotifications;
}

- (void)setShouldPostNotifications:(BOOL)a3
{
  self->_shouldPostNotifications = a3;
}

- (BOOL)active
{
  return self->_active;
}

@end