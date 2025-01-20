void sub_3E78(uint64_t a1)
{
  sub_5F0C(*(unsigned __int8 *)(a1 + 32));
}
}

CFStringRef sub_42C4()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"custom-ids-bag-url", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_4318(void *a1)
{
  if (objc_msgSend(a1, "isEqualToString:", @"Custom", a1))
  {
    uint64_t v2 = IMUserNotificationTitleKey;
    uint64_t v3 = IMUserNotificationMessageKey;
    v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    uint64_t v5 = IMUserNotificationTextFieldValuesKey;
    v6 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_44EC;
    v9[3] = &unk_82D0;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:]( +[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"),  "addUserNotification:listener:completionHandler:",  +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"bagfetchurl",  3LL,  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"Bag fetch URL",  v2,  @"Please type in URL",  v3,  v4,  v5,  v6,  IMUserNotificationTextFieldTitlesKey,  @"OK",  IMUserNotificationDefaultButtonTitleKey,  @"Cancel",  IMUserNotificationAlternateButtonTitleKey,  0LL,  0LL),  0.0),  0LL,  v9);
  }

  else
  {
    CFPreferencesSetAppValue(@"custom-ids-bag-url", 0LL, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }

uint64_t sub_44EC(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t result = objc_opt_isKindOfClass(v5, v6);
    if ((result & 1) != 0)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"custom-ids-bag-url", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }

  return result;
}

CFStringRef sub_4584()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"custom-sps-bag-url", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_45D8(void *a1)
{
  if (objc_msgSend(a1, "isEqualToString:", @"Custom", a1))
  {
    uint64_t v2 = IMUserNotificationTitleKey;
    uint64_t v3 = IMUserNotificationMessageKey;
    id v4 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    uint64_t v5 = IMUserNotificationTextFieldValuesKey;
    uint64_t v6 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_47AC;
    v9[3] = &unk_82D0;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:]( +[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"),  "addUserNotification:listener:completionHandler:",  +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"bagfetchurl",  3LL,  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"Bag fetch URL",  v2,  @"Please type in URL",  v3,  v4,  v5,  v6,  IMUserNotificationTextFieldTitlesKey,  @"OK",  IMUserNotificationDefaultButtonTitleKey,  @"Cancel",  IMUserNotificationAlternateButtonTitleKey,  0LL,  0LL),  0.0),  0LL,  v9);
  }

  else
  {
    CFPreferencesSetAppValue(@"custom-sps-bag-url", 0LL, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }

uint64_t sub_47AC(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t result = objc_opt_isKindOfClass(v5, v6);
    if ((result & 1) != 0)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"custom-sps-bag-url", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }

  return result;
}

CFStringRef sub_4844()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"testOptionsHeader", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_4898(void *a1)
{
  if ([a1 isEqualToString:@"Custom"])
  {
    uint64_t v1 = IMUserNotificationTitleKey;
    uint64_t v2 = IMUserNotificationMessageKey;
    uint64_t v3 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    uint64_t v4 = IMUserNotificationTextFieldValuesKey;
    id v5 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_4A44;
    v7[3] = &unk_82D0;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:]( +[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"),  "addUserNotification:listener:completionHandler:",  +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"testoptionsheader",  3LL,  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"X-Apple-Test-Options:",  v1,  &stru_8670,  v2,  v3,  v4,  v5,  IMUserNotificationTextFieldTitlesKey,  @"OK",  IMUserNotificationDefaultButtonTitleKey,  @"Cancel",  IMUserNotificationAlternateButtonTitleKey,  0LL,  0LL),  0.0),  0LL,  v7);
  }

  else
  {
    CFPreferencesSetAppValue(@"testOptionsHeader", 0LL, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }

uint64_t sub_4A44(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t result = objc_opt_isKindOfClass(v5, v6);
    if ((result & 1) != 0)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"testOptionsHeader", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }

  return result;
}

CFStringRef sub_4ADC()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"x-test-opts", @"com.apple.ids");
  if (!v0) {
    return @"none";
  }
  CFRelease(v0);
  return @"Custom";
}

id sub_4B30(void *a1)
{
  if ([a1 isEqualToString:@"Custom"])
  {
    uint64_t v1 = IMUserNotificationTitleKey;
    uint64_t v2 = IMUserNotificationMessageKey;
    uint64_t v3 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    uint64_t v4 = IMUserNotificationTextFieldValuesKey;
    id v5 = +[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", &stru_8670);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_4CDC;
    v7[3] = &unk_82D0;
    return -[IMUserNotificationCenter addUserNotification:listener:completionHandler:]( +[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"),  "addUserNotification:listener:completionHandler:",  +[IMUserNotification userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:",  @"x-test-opts",  3LL,  0LL,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"x-test-opts:",  v1,  &stru_8670,  v2,  v3,  v4,  v5,  IMUserNotificationTextFieldTitlesKey,  @"OK",  IMUserNotificationDefaultButtonTitleKey,  @"Cancel",  IMUserNotificationAlternateButtonTitleKey,  0LL,  0LL),  0.0),  0LL,  v7);
  }

  else
  {
    CFPreferencesSetAppValue(@"x-test-opts", 0LL, @"com.apple.ids");
    return (id)CFPreferencesAppSynchronize(@"com.apple.ids");
  }

uint64_t sub_4CDC(uint64_t a1, void *a2)
{
  uint64_t result = (uint64_t)[a2 response];
  if (!result)
  {
    id v4 = [*(id *)(a1 + 32) responseInformation];
    id v5 = [v4 objectForKey:IMUserNotificationTextFieldValuesKey];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t result = objc_opt_isKindOfClass(v5, v6);
    if ((result & 1) != 0)
    {
      uint64_t result = (uint64_t)[v5 length];
      if (result)
      {
        CFPreferencesSetAppValue(@"x-test-opts", v5, @"com.apple.ids");
        return CFPreferencesAppSynchronize(@"com.apple.ids");
      }
    }
  }

  return result;
}

CFStringRef sub_4D74()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"env", @"com.apple.ids");
  if (v0) {
    return (const __CFString *)v0;
  }
  else {
    return @"prod";
  }
}

uint64_t sub_4DC4(void *a1)
{
  if (objc_msgSend(a1, "length", a1)) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  CFPreferencesSetAppValue(@"env", v2, @"com.apple.ids");
  return CFPreferencesAppSynchronize(@"com.apple.ids");
}

CFStringRef sub_4E2C()
{
  CFPropertyListRef v0 = (void *)CFPreferencesCopyAppValue(@"sps-env", @"com.apple.ids");
  if (v0) {
    return (const __CFString *)v0;
  }
  else {
    return @"prod";
  }
}

uint64_t sub_4E7C(void *a1)
{
  if (objc_msgSend(a1, "length", a1)) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  CFPreferencesSetAppValue(@"sps-env", v2, @"com.apple.ids");
  return CFPreferencesAppSynchronize(@"com.apple.ids");
}

void sub_4EE4()
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionarySetValue(Mutable, kSecAttrService, @"com.apple.iChat.VeniceRegistrationAgent");
  OSStatus v1 = SecItemDelete(Mutable);
  if (v1) {
    NSLog(@"Unable to remove V0 keychain data: %ld", v1);
  }
  CFDictionarySetValue(Mutable, kSecAttrService, @"com.apple.facetime");
  OSStatus v2 = SecItemDelete(Mutable);
  if (v2) {
    NSLog(@"Unable to remove V1 keychain data: %ld", v2);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_4FE0()
{
  return system((const char *)objc_msgSend( @"killall -9 identityservicesd",  "UTF8String",  @"killall -9 identityservicesd"));
}

uint64_t sub_5028()
{
  return system((const char *)objc_msgSend( @"killall -9 identityservicesd imagent",  "UTF8String",  @"killall -9 identityservicesd imagent"));
}

uint64_t sub_5070()
{
  return system((const char *)objc_msgSend(@"killall -USR2 imagent", "UTF8String", @"killall -USR2 imagent"));
}

uint64_t sub_50B8()
{
  return system((const char *)objc_msgSend( @"killall -USR2 identityservicesd",  "UTF8String",  @"killall -USR2 identityservicesd"));
}

uint64_t sub_5100()
{
  return system((const char *)objc_msgSend( @"killall -USR1 identityservicesd",  "UTF8String",  @"killall -USR1 identityservicesd"));
}

uint64_t sub_5148()
{
  return system((const char *)objc_msgSend( @"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS",  "UTF8String",  @"killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS"));
}

uint64_t sub_5190()
{
  CFPropertyListRef v0 = popen( "/usr/bin/killall -9 identityservicesd sharingd lsuseractivityd callservicesd FaceTime SpringBoard blued BTServe r cloudpaird wirelessproxd",  "r");
  return pclose(v0);
}

id sub_51B4(int a1, void *a2)
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = [a2 allKeys];
  id result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v21;
    if (a1) {
      CFBooleanRef v7 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v7 = 0LL;
    }
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(const __CFString **)(*((void *)&v20 + 1) + 8LL * (void)v8);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v10 = [a2 objectForKey:v9];
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            v14 = 0LL;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v16 + 1) + 8LL * (void)v14), v7, v9);
              v14 = (char *)v14 + 1;
            }

            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v12);
        }

        CFPreferencesAppSynchronize(v9);
        v8 = (char *)v8 + 1;
      }

      while (v8 != v5);
      id result = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      id v5 = result;
    }

    while (result);
  }

  return result;
}

uint64_t sub_535C()
{
  return system((const char *)objc_msgSend( @"rm -rf /var/mobile/Library/Preferences/com.apple.ids.service.com.apple.* /var/mobile/Library/Preferences/com.apple.imservice.*",  "UTF8String",  @"rm -rf /var/mobile/Library/Preferences/com.apple.ids.service.com.apple.* /var/mobile/Library/Preferences/com.apple.imservice.*"));
}

uint64_t sub_53A4()
{
  CFPropertyListRef v0 = (void *)sub_6498();
  if (![v0 count]) {
    return 0xFFFFFFFFLL;
  }
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t result = (uint64_t)[v0 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (result)
  {
    id v2 = (id)result;
    uint64_t v3 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v16 != v3) {
          objc_enumerationMutation(v0);
        }
        id v5 = *(const __CFString **)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v11 = 0u;
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        id v6 = objc_msgSend(v0, "objectForKey:", v5, 0);
        id v7 = [v6 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v12;
LABEL_9:
          uint64_t v10 = 0LL;
          while (1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v11 + 1) + 8 * v10), v5, 0LL)) {
              return 0xFFFFFFFFLL;
            }
            if (v8 == (id)++v10)
            {
              id v8 = [v6 countByEnumeratingWithState:&v11 objects:v19 count:16];
              if (v8) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
      }

      id v2 = [v0 countByEnumeratingWithState:&v15 objects:v20 count:16];
      uint64_t result = 0LL;
      if (v2) {
        continue;
      }
      break;
    }
  }

  return result;
}

void sub_5540(int a1)
{
  id v2 = (void *)sub_6498();
  sub_51B4(a1 >= 0, v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0LL, 0LL, 1u);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v4, @"PCLoggingSettingsDidChangeNotification", 0LL, 0LL, 1u);
}

uint64_t sub_55A4(const __CFString *a1)
{
  if (a1) {
    OSStatus v1 = a1;
  }
  else {
    OSStatus v1 = @"CNFDumpRegistrationLogs";
  }
  return MarcoAction(0LL, v1, 4LL);
}

uint64_t sub_55C0()
{
  uint64_t result = qword_C4C0;
  if (!qword_C4C0)
  {
    id v1 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend( v1,  "setObject:forKey:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  @"Log",  @"PCWriteLogs",  @"APSFullNetworkLogging",  0),  @"com.apple.persistentconnection");
    qword_C4C0 = +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v1);
    id v2 = (id)qword_C4C0;
    return qword_C4C0;
  }

  return result;
}

id sub_5658()
{
  CFPropertyListRef v0 = (void *)sub_55C0();
  id result = [v0 count];
  if (result)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v21 = [v0 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      uint64_t v2 = *(void *)v29;
      uint64_t v19 = *(void *)v29;
      __int128 v20 = v0;
      do
      {
        uint64_t v3 = 0LL;
        do
        {
          if (*(void *)v29 != v2) {
            objc_enumerationMutation(v0);
          }
          uint64_t v22 = v3;
          id v4 = *(const __CFString **)(*((void *)&v28 + 1) + 8 * v3);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          id obj = [v0 objectForKey:v4];
          id v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v5)
          {
            id v6 = v5;
            uint64_t v7 = *(void *)v25;
            while (2)
            {
              for (i = 0LL; i != v6; i = (char *)i + 1)
              {
                if (*(void *)v25 != v7) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v9 = *(const __CFString **)(*((void *)&v24 + 1) + 8LL * (void)i);
                uint64_t v10 = sub_6514();
                __int128 v11 = (const __CFBoolean *)_CFPreferencesCopyValueWithContainer( v9,  v4,  @"mobile",  kCFPreferencesCurrentHost,  v10);
                if (v11)
                {
                  __int128 v12 = v11;
                  CFTypeID v13 = CFGetTypeID(v11);
                  if (v13 == CFBooleanGetTypeID()) {
                    int Value = CFBooleanGetValue(v12);
                  }
                  else {
                    int Value = 0;
                  }
                  CFRelease(v12);
                }

                else
                {
                  int Value = 0;
                }

                __int128 v15 = (const __CFBoolean *)CFPreferencesCopyValue(v9, v4, @"mobile", kCFPreferencesAnyHost);
                if (v15)
                {
                  __int128 v16 = v15;
                  CFTypeID v17 = CFGetTypeID(v15);
                  if (v17 == CFBooleanGetTypeID())
                  {
                    if (Value) {
                      int Value = 1;
                    }
                    else {
                      int Value = CFBooleanGetValue(v16) != 0;
                    }
                  }

                  CFRelease(v16);
                }

                if (!Value) {
                  return 0LL;
                }
              }

              id v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v6) {
                continue;
              }
              break;
            }
          }

          uint64_t v3 = v22 + 1;
          uint64_t v2 = v19;
          CFPropertyListRef v0 = v20;
        }

        while ((id)(v22 + 1) != v21);
        id v18 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
        id result = &dword_0 + 1;
        id v21 = v18;
      }

      while (v18);
    }

    else
    {
      return &dword_0 + 1;
    }
  }

  return result;
}

void sub_58D4(int a1)
{
  id v2 = -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "lastObject");
  uint64_t v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (a1)
  {
    if (-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", @"/usr/sbin/tcpdump"))
    {
      -[NSData writeToFile:options:error:]( +[NSData data](NSData, "data"),  "writeToFile:options:error:",  [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"],  0,  0);
      if (-[FTDeviceSupport supportsCellularData]( +[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"),  "supportsCellularData")) {
        -[NSData writeToFile:options:error:]( +[NSData data](NSData, "data"),  "writeToFile:options:error:",  [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"],  0,  0);
      }
    }
  }

  else
  {
    -[NSFileManager removeItemAtPath:error:]( v3,  "removeItemAtPath:error:",  [v2 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.en0.plist"],  0);
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v2 stringByAppendingPathComponent:@"Preferences/com.apple.aps.tcpdump.pdp_ip0.plist"],  0);
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.en0.plist"],  0);
    -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  [v2 stringByAppendingPathComponent:@"Caches/com.apple.aps.tcpdump.pdp_ip0.plist"],  0);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = [(id)sub_55C0() allKeys];
  id v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v25;
    if (a1) {
      CFBooleanRef v4 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v4 = 0LL;
    }
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v5;
        id v6 = *(const __CFString **)(*((void *)&v24 + 1) + 8 * v5);
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        id v7 = [(id)sub_55C0() objectForKey:v6];
        id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(const __CFString **)(*((void *)&v20 + 1) + 8LL * (void)i);
              CFTypeID v13 = sub_6514();
              _CFPreferencesSetValueWithContainer(v12, v4, v6, @"mobile", kCFPreferencesCurrentHost, v13);
              CFPreferencesSetValue(v12, v4, v6, @"mobile", kCFPreferencesAnyHost);
            }

            id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v9);
        }

        __int128 v14 = sub_6514();
        _CFPreferencesSynchronizeWithContainer(v6, @"mobile", kCFPreferencesCurrentHost, v14);
        CFPreferencesAppSynchronize(v6);
        uint64_t v5 = v19 + 1;
      }

      while ((id)(v19 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v18);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"PCLoggingSettingsDidChangeNotification",  0LL,  0LL,  1u);
}

CFIndex sub_5C68()
{
  CFPropertyListRef v0 = (void *)sub_6590();
  if (![v0 count]) {
    return 0xFFFFFFFFLL;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v1 = [v0 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v17;
    while (2)
    {
      CFBooleanRef v4 = 0LL;
      do
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(v0);
        }
        uint64_t v5 = *(const __CFString **)(*((void *)&v16 + 1) + 8LL * (void)v4);
        __int128 v12 = 0u;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        id v6 = objc_msgSend(v0, "objectForKey:", v5, 0);
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v13;
LABEL_9:
          uint64_t v10 = 0LL;
          while (1)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v12 + 1) + 8 * v10), v5, 0LL)) {
              return 0xFFFFFFFFLL;
            }
            if (v8 == (id)++v10)
            {
              id v8 = [v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
              if (v8) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        CFBooleanRef v4 = (char *)v4 + 1;
      }

      while (v4 != v2);
      id v2 = [v0 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  return CFPreferencesGetAppIntegerValue(@"MadridLoggingLevel", @"com.apple.logging", 0LL);
}

void sub_5E18(unsigned int a1)
{
  id v2 = (void *)sub_6590();
  sub_51B4((a1 & 0x80000000) == 0, v2);
  if ((a1 & 0x80000000) != 0)
  {
    CFPreferencesSetAppValue(@"MadridLoggingLevel", 0LL, @"com.apple.logging");
    CFPreferencesSetAppValue(@"DebugLevel", 0LL, @"com.apple.mmcs");
  }

  else
  {
    uint64_t v3 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", a1);
    CFPreferencesSetAppValue(@"MadridLoggingLevel", v3, @"com.apple.logging");
    CFPreferencesSetAppValue( @"DebugLevel",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 3LL),  @"com.apple.mmcs");
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0LL, 0LL, 1u);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v5, @"PCLoggingSettingsDidChangeNotification", 0LL, 0LL, 1u);
}

void sub_5F0C(int a1)
{
  if (a1)
  {
    sub_6118(&__kCFBooleanTrue, (uint64_t)@"CSILog", (uint64_t)@"enabled");
    sub_6118(@"512", (uint64_t)@"CSILog", (uint64_t)@"history");
    sub_6118(&__kCFBooleanTrue, (uint64_t)@"CSILog", (uint64_t)@"enableGlobalLogging");
    sub_6118(&__kCFBooleanTrue, (uint64_t)@"MobileAnalyzer", (uint64_t)@"enabled");
    sub_6118(@"512", (uint64_t)@"MobileAnalyzer", (uint64_t)@"history");
    sub_6118(&__kCFBooleanTrue, (uint64_t)@"Artemis", (uint64_t)@"enabled");
    sub_6118(@"512", (uint64_t)@"Artemis", (uint64_t)@"history");
    sub_6118(@"1", (uint64_t)@"EURCoreDump", (uint64_t)@"enabled");
    sub_6118(@"2", (uint64_t)@"CoreDump", (uint64_t)@"enabled");
    sub_6118(@"512", (uint64_t)@"DIAG", (uint64_t)@"history");
    sub_6118(@"default", (uint64_t)@"DIAG", (uint64_t)@"file");
    id v1 = &__kCFBooleanTrue;
    id v2 = @"DIAG";
  }

  else
  {
    sub_6118(&__kCFBooleanFalse, (uint64_t)@"CSILog", (uint64_t)@"enabled");
    sub_6118(@"64", (uint64_t)@"CSILog", (uint64_t)@"history");
    sub_6118(&__kCFBooleanFalse, (uint64_t)@"CSILog", (uint64_t)@"enableGlobalLogging");
    sub_6118(&__kCFBooleanFalse, (uint64_t)@"MobileAnalyzer", (uint64_t)@"enabled");
    sub_6118(@"16", (uint64_t)@"MobileAnalyzer", (uint64_t)@"history");
    sub_6118(&__kCFBooleanFalse, (uint64_t)@"Artemis", (uint64_t)@"enabled");
    sub_6118(@"16", (uint64_t)@"Artemis", (uint64_t)@"history");
    id v1 = @"0";
    id v2 = @"CoreDump";
  }

  sub_6118(v1, (uint64_t)v2, (uint64_t)@"enabled");
}

void sub_6118(__CFString *a1, uint64_t a2, uint64_t a3)
{
  if (qword_C4E0 != -1) {
    dispatch_once(&qword_C4E0, &stru_8310);
  }
  if (qword_C4F0 != -1) {
    dispatch_once(&qword_C4F0, &stru_8330);
  }
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  uint64_t v6 = off_C4D8(kCFAllocatorDefault, nullsub_1, v9);
  if (v6)
  {
    id v7 = (const void *)v6;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(a1, v8) & 1) == 0)
    {
      else {
        a1 = @"false";
      }
    }

    off_C4E8(v7, a2, a3, a1);
    CFRelease(v7);
  }

uint64_t sub_6234(uint64_t a1)
{
  return IMSetDomainBoolForKey(@"com.apple.logging", @"PhoneLogging", a1);
}

uint64_t sub_624C(uint64_t a1)
{
  id v2 = -[NSString stringByAppendingPathComponent:]( NSHomeDirectory(),  "stringByAppendingPathComponent:",  @"/Library/Preferences/.GlobalPreferences");
  return IMSetDomainBoolForKey(v2, @"UIStateRestorationDebugLogging", a1);
}

void sub_62B4(int a1)
{
  uint64_t v2 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    if (a1) {
      CFBooleanRef v4 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v4 = kCFBooleanFalse;
    }
    ((void (*)(void))WiFiManagerClientSetProperty)();
    WiFiManagerClientSetProperty(v3, kWiFiLoggingDriverLoggingEnabledKey, v4);
    WiFiManagerClientSetProperty(v3, kWiFiLoggingFileEnabledKey, v4);
    CFRelease(v3);
  }

uint64_t sub_6360(uint64_t a1)
{
  BOOL v2 = (_DWORD)a1 == 0;
  if ((_DWORD)a1) {
    uint64_t v3 = @"Info";
  }
  else {
    uint64_t v3 = @"Error";
  }
  if (v2) {
    CFBooleanRef v4 = @"FALSE";
  }
  else {
    CFBooleanRef v4 = @"TRUE";
  }
  IMSetDomainValueForKey(@"com.apple.MobileBluetooth.debug", @"DefaultLevel", v3);
  uint64_t v8 = @"StackDebugEnabled";
  uint64_t v9 = v4;
  IMSetDomainValueForKey( @"com.apple.MobileBluetooth.debug",  @"HCITraces",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  uint64_t v6 = @"DebugLevel";
  id v7 = v3;
  return IMSetDomainValueForKey( @"com.apple.MobileBluetooth.debug",  @"LE",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
}

uint64_t sub_6498()
{
  uint64_t result = qword_C4C8;
  if (!qword_C4C8)
  {
    id v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v1,  "setObject:forKey:",  +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"RegistrationLogging", 0LL),  @"com.apple.logging");
    qword_C4C8 = (uint64_t)-[NSMutableDictionary copy](v1, "copy");

    return qword_C4C8;
  }

  return result;
}

NSString *sub_6514()
{
  uint64_t v4 = 1LL;
  uint64_t v0 = container_system_group_path_for_identifier( 0,  [@"systemgroup.com.apple.sharedpclogging" UTF8String],  &v4);
  if (!v0) {
    return 0LL;
  }
  id v1 = (void *)v0;
  BOOL v2 = -[NSString initWithCString:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithCString:encoding:", v0, 4LL);
  free(v1);
  return v2;
}

uint64_t sub_6590()
{
  uint64_t result = qword_C4D0;
  if (!qword_C4D0)
  {
    id v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:]( v1,  "setObject:forKey:",  +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"MadridLogging", 0LL),  @"com.apple.logging");
    qword_C4D0 = (uint64_t)-[NSMutableDictionary copy](v1, "copy");

    return qword_C4D0;
  }

  return result;
}

void sub_660C(id a1)
{
  off_C4D8 = (_UNKNOWN *)IMWeakLinkSymbol("_CTServerConnectionCreate", @"CoreTelephony");
}

void sub_6638(id a1)
{
  off_C4E8 = (_UNKNOWN *)IMWeakLinkSymbol("_CTServerConnectionSetTraceProperty", @"CoreTelephony");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}