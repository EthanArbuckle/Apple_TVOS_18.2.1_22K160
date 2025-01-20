@interface IDSViewState
- (BOOL)isLoggingEnabled;
- (id)_loggingDefaults;
- (void)setIsLoggingEnabled:(BOOL)a3;
@end

@implementation IDSViewState

- (BOOL)isLoggingEnabled
{
  id v2 = -[IDSViewState _loggingDefaults](self, "_loggingDefaults");
  id v3 = [v2 count];
  if (v3)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v2);
          }
          v8 = *(const __CFString **)(*((void *)&v19 + 1) + 8LL * (void)i);
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          id v9 = objc_msgSend(v2, "objectForKey:", v8, 0);
          id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v16;
LABEL_9:
            uint64_t v13 = 0LL;
            while (1)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              LODWORD(v3) = CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v15 + 1) + 8 * v13), v8, 0LL);
              if (!(_DWORD)v3) {
                return (char)v3;
              }
              if (v11 == (id)++v13)
              {
                id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }
        }

        id v5 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
        LOBYTE(v3) = 1;
        if (v5) {
          continue;
        }
        break;
      }
    }

    else
    {
      LOBYTE(v3) = 1;
    }
  }

  return (char)v3;
}

- (void)setIsLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[IDSViewState isLoggingEnabled](self, "isLoggingEnabled") != a3)
  {
    -[IDSViewState willChangeValueForKey:](self, "willChangeValueForKey:", @"isLoggingEnabled");
    sub_51B4(v3, -[IDSViewState _loggingDefaults](self, "_loggingDefaults"));
    sub_58D4(v3);
    sub_5540(v3 - 1);
    sub_624C(v3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0LL, 0LL, 1u);
    sub_5190();
    -[IDSViewState didChangeValueForKey:](self, "didChangeValueForKey:", @"isLoggingEnabled");
  }

- (id)_loggingDefaults
{
  id v2 = (_UNKNOWN **)qword_C4B8;
  if (!qword_C4B8)
  {
    id v2 = &off_9128;
    qword_C4B8 = (uint64_t)&off_9128;
    BOOL v3 = &off_9128;
  }

  return v2;
}

@end