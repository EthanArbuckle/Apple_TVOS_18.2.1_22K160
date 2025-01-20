@interface MCTargetDeviceResolver
+ (BOOL)isHomePodAvailable;
+ (BOOL)purgatorySupportedForDevice:(unint64_t)a3;
+ (id)_homepodText;
+ (id)stringForWatchAvailability:(unint64_t)a3;
+ (unint64_t)watchAvailability;
+ (void)_showPromptForHomePodAndWatchWithCompletionBlock:(id)a3;
+ (void)_showPromptForHomePodWithCompletionBlock:(id)a3;
+ (void)_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:(id)a3;
+ (void)_showPromptForWatchWithCompletionBlock:(id)a3;
+ (void)showResolutionPromptWithWatchOption:(BOOL)a3 homePodOption:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation MCTargetDeviceResolver

+ (BOOL)purgatorySupportedForDevice:(unint64_t)a3
{
  return a3 == 1 || a3 == 6;
}

+ (unint64_t)watchAvailability
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](&OBJC_CLASS___NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock]( &OBJC_CLASS___NRPairedDeviceRegistry,  "activePairedDeviceSelectorBlock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NRPairedDeviceRegistry pairedDevicesSelectorBlock]( &OBJC_CLASS___NRPairedDeviceRegistry,  "pairedDevicesSelectorBlock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v7]);

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      uint64_t v13 = NRDevicePropertyIsAltAccount;
      while (2)
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v14),  "valueForProperty:",  v13,  (void)v18));
          unsigned __int8 v16 = [v15 BOOLValue];

          if ((v16 & 1) != 0)
          {

            unint64_t v6 = 1LL;
            goto LABEL_15;
          }

          v14 = (char *)v14 + 1;
        }

        while (v11 != v14);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if ([v9 count]) {
      unint64_t v6 = 2LL;
    }
    else {
      unint64_t v6 = 3LL;
    }
LABEL_15:
  }

  return v6;
}

+ (BOOL)isHomePodAvailable
{
  return 0;
}

+ (void)showResolutionPromptWithWatchOption:(BOOL)a3 homePodOption:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = (void (**)(id, id))a5;
  id v9 = [a1 watchAvailability];
  unsigned int v10 = [a1 isHomePodAvailable];
  os_log_t v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MCTargetDeviceResolver stringForWatchAvailability:]( &OBJC_CLASS___MCTargetDeviceResolver,  "stringForWatchAvailability:",  v9));
    v17[0] = 67240962;
    v17[1] = v6;
    __int16 v18 = 2114;
    __int128 v19 = v13;
    __int16 v20 = 1026;
    BOOL v21 = v5;
    __int16 v22 = 1026;
    unsigned int v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "TargetDeviceResolver state: Watch Valid? %{public}d | Watch State? %{public}@ | HomePod Valid? %{public}d | HomePo d Available? %{public}d",  (uint8_t *)v17,  0x1Eu);
  }

  int v14 = v10 & v5;
  v15 = _MCLogObjects[0];
  BOOL v16 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v6 && v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "TargetDeviceResolver displaying prompt for iPhone, Watch, and HomePod",  (uint8_t *)v17,  2u);
    }

    [a1 _showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:v8];
  }

  else if (v14)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "TargetDeviceResolver displaying prompt for iPhone and HomePod",  (uint8_t *)v17,  2u);
    }

    [a1 _showPromptForHomePodWithCompletionBlock:v8];
  }

  else if (v6)
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "TargetDeviceResolver displaying prompt for iPhone and Watch",  (uint8_t *)v17,  2u);
    }

    [a1 _showPromptForWatchWithCompletionBlock:v8];
  }

  else
  {
    if (v16)
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "TargetDeviceResolver skipping prompt because only this device is available",  (uint8_t *)v17,  2u);
    }

    v8[2](v8, +[MCProfile thisDeviceType](&OBJC_CLASS___MCProfile, "thisDeviceType"));
  }
}

+ (void)_showPromptForThisDeviceAndOtherDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
  uint64_t v7 = MCLocalizedString(@"INSTALL_PAIRED_TITLE", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = MCLocalizedString(@"INSTALL_PAIRED_MSG", v9);
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v13 = MCLocalizedString(@"INSTALL_PAIRED_CANCEL", v12);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = MCLocalizedStringByDevice(@"INSTALL_PAIRED_COMPANION");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v18 = MCLocalizedString(@"INSTALL_PAIRED_OTHER", v17);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001B258;
  v22[3] = &unk_1000C34E0;
  id v23 = v4;
  id v24 = a1;
  id v20 = v4;
  BYTE2(v21) = 1;
  LOWORD(v21) = 0;
  objc_msgSend( v5,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldP laceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:",  0,  v8,  v11,  v14,  v16,  v19,  0.0,  0,  v21,  0,  v22);
}

+ (void)_showPromptForHomePodAndWatchWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
  uint64_t v7 = MCLocalizedString(@"INSTALL_PAIRED_TITLE", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = MCLocalizedString(@"INSTALL_PAIRED_MSG", v9);
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v13 = MCLocalizedString(@"INSTALL_PAIRED_CANCEL", v12);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _homepodText]);
  uint64_t v17 = MCLocalizedString(@"INSTALL_PAIRED_COMPANION_WATCH", v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001B43C;
  v21[3] = &unk_1000C3508;
  id v22 = v4;
  id v19 = v4;
  BYTE2(v20) = 1;
  LOWORD(v20) = 0;
  objc_msgSend( v5,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldP laceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:",  0,  v8,  v11,  v14,  v15,  v18,  0.0,  0,  v20,  0,  v21);
}

+ (void)_showPromptForHomePodWithCompletionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
  uint64_t v7 = MCLocalizedString(@"INSTALL_PAIRED_TITLE", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = MCLocalizedString(@"INSTALL_PAIRED_MSG", v9);
  os_log_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v13 = MCLocalizedString(@"INSTALL_PAIRED_CANCEL", v12);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = MCLocalizedStringByDevice(@"INSTALL_PAIRED_COMPANION");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1 _homepodText]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001B5BC;
  v20[3] = &unk_1000C3508;
  id v21 = v4;
  id v18 = v4;
  BYTE2(v19) = 1;
  LOWORD(v19) = 0;
  objc_msgSend( v5,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldP laceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:",  0,  v8,  v11,  v14,  v16,  v17,  0.0,  0,  v19,  0,  v20);
}

+ (void)_showPromptForWatchWithCompletionBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](&OBJC_CLASS___MCUserNotificationManager, "sharedManager"));
  uint64_t v6 = MCLocalizedString(@"INSTALL_PAIRED_TITLE", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v9 = MCLocalizedString(@"INSTALL_PAIRED_MSG", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v12 = MCLocalizedString(@"INSTALL_PAIRED_CANCEL", v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = MCLocalizedStringByDevice(@"INSTALL_PAIRED_COMPANION");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v17 = MCLocalizedString(@"INSTALL_PAIRED_COMPANION_WATCH", v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001B788;
  v21[3] = &unk_1000C3508;
  id v22 = v3;
  id v19 = v3;
  BYTE2(v20) = 1;
  LOWORD(v20) = 0;
  objc_msgSend( v4,  "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldP laceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:",  0,  v7,  v10,  v13,  v15,  v18,  0.0,  0,  v20,  0,  v21);
}

+ (id)_homepodText
{
  return (id)MCLocalizedString(@"INSTALL_PAIRED_COMPANION_HOMEPOD", a2);
}

+ (id)stringForWatchAvailability:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1000C3528[a3];
  }
}

@end