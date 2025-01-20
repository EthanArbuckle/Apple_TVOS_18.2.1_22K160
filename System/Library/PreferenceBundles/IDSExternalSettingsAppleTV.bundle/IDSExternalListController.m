@interface IDSExternalListController
- (id)niceBasicLogging:(id)a3;
- (id)niceBasicLoggingDefaults;
- (id)specifiers;
- (void)dumpLogs:(id)a3;
- (void)setNiceBasicLogging:(id)a3 specifier:(id)a4;
- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation IDSExternalListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id result = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!result)
  {
    id result =  -[IDSExternalListController loadSpecifiersFromPlistName:target:]( self,  "loadSpecifiersFromPlistName:target:",  @"IDSExternalSettings",  self);
    *(void *)&self->PSListController_opaque[v3] = result;
  }

  return result;
}

- (void)dumpLogs:(id)a3
{
}

- (id)niceBasicLoggingDefaults
{
  id result = (id)qword_C4B0;
  if (!qword_C4B0)
  {
    id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend( v3,  "setObject:forKey:",  +[NSArray arrayWithObjects:]( NSArray,  "arrayWithObjects:",  @"IDSLogging",  @"MadridEventLogging",  0),  @"com.apple.logging");
    qword_C4B0 = +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3);
    id v4 = (id)qword_C4B0;
    return (id)qword_C4B0;
  }

  return result;
}

- (id)niceBasicLogging:(id)a3
{
  id v3 = -[IDSExternalListController niceBasicLoggingDefaults](self, "niceBasicLoggingDefaults", a3);
  if (![v3 count]) {
    return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL);
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(const __CFString **)(*((void *)&v20 + 1) + 8LL * (void)i);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v9 = objc_msgSend(v3, "objectForKey:", v8, 0);
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if (!CFPreferencesGetAppBooleanValue(*(CFStringRef *)(*((void *)&v16 + 1) + 8LL * (void)j), v8, 0LL))
              {
                uint64_t v14 = 0LL;
                return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14);
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v5);
  }

  uint64_t v14 = 1LL;
  return +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14);
}

- (void)setNiceBasicLogging:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  sub_51B4((int)v5, -[IDSExternalListController niceBasicLoggingDefaults](self, "niceBasicLoggingDefaults"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kMarcoSyncLoggingPrefs", 0LL, 0LL, 1u);
  int v7 = sub_5C68();
  if (!(_DWORD)v5)
  {
    unsigned int v8 = -1;
    goto LABEL_5;
  }

  if (v7 == -1)
  {
    unsigned int v8 = 0;
LABEL_5:
    sub_5E18(v8);
  }

  sub_58D4((int)v5);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3E78;
  block[3] = &unk_82A8;
  char v11 = (char)v5;
  dispatch_async(global_queue, block);
  sub_5540((_DWORD)v5 - 1);
  sub_6234((uint64_t)v5);
  sub_624C((uint64_t)v5);
  sub_6360((uint64_t)v5);
}

- (void)setRegistrationLoggingEnabled:(id)a3 forSpecifier:(id)a4
{
  int v5 = [a3 BOOLValue];
  sub_5540(v5 - 1);
  sub_58D4(v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"PCLoggingSettingsDidChangeNotification",  0LL,  0LL,  1u);
  -[IDSExternalListController reloadSpecifiers](self, "reloadSpecifiers");
}

@end