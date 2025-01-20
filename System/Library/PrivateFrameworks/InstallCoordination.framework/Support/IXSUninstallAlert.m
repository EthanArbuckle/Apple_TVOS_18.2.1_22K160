@interface IXSUninstallAlert
+ (id)stringForCFOptionFlag:(unint64_t)a3;
- (BOOL)_onMainQueue_deleteButtonActionWithDisposition:(unint64_t *)a3 error:(id *)a4;
- (BOOL)appHasiCloudDataOrDocuments;
- (BOOL)appIsRemovable;
- (BOOL)defaultButtonAppearsDestructive;
- (BOOL)deletionIsRestricted;
- (BOOL)isMDMRestrictedWithOrganizationName:(id *)a3;
- (BOOL)needsArchiveOptionButton;
- (BOOL)needsDemoteOptionButton;
- (IXSUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6;
- (LSApplicationRecord)appRecord;
- (NSString)bundleIdentifier;
- (NSString)cancelButtonLabel;
- (NSString)defaultButtonLabel;
- (NSString)defaultStringsTableName;
- (NSString)message;
- (NSString)optionalButtonForNotRemovableAppActionURL;
- (NSString)optionalButtonForNotRemovableAppLabel;
- (NSString)otherButtonLabel;
- (NSString)title;
- (NSString)typeDescription;
- (__CFBundle)defaultStringsBundle;
- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4;
- (unint64_t)appRemovability;
- (unint64_t)notificationFlags;
- (void)_configureOptionalButtonForConfiguration:(id)a3;
- (void)_onMainQueue_displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4;
- (void)_processUserNotification:(__CFUserNotification *)a3 withConfiguration:(id)a4 response:(unint64_t)a5 completion:(id)a6;
- (void)dealloc;
- (void)displayAlertWithCompletion:(id)a3;
- (void)displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4;
- (void)otherButtonActionWithCompletion:(id)a3;
- (void)setDefaultButtonAppearsDestructive:(BOOL)a3;
- (void)setNeedsArchiveOptionButton:(BOOL)a3;
- (void)setNeedsDemoteOptionButton:(BOOL)a3;
- (void)setTypeDescription:(id)a3;
@end

@implementation IXSUninstallAlert

- (IXSUninstallAlert)initWithAppRecord:(id)a3 bundleIdentifier:(id)a4 removability:(unint64_t)a5 deletionIsRestricted:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IXSUninstallAlert;
  v13 = -[IXSUninstallAlert init](&v24, "init");
  v14 = v13;
  if (v13)
  {
    BOOL v15 = !a6;
    if (a5 != 1) {
      BOOL v15 = 0;
    }
    v13->_appIsRemovable = v15;
    v13->_appRemovability = a5;
    v13->_deletionIsRestricted = a6;
    objc_storeStrong((id *)&v13->_appRecord, a3);
    objc_storeStrong((id *)&v14->_bundleIdentifier, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 frameworkURL]);

    v14->_defaultStringsBundle = (__CFBundle *)_CFBundleCreateUnique(kCFAllocatorDefault, v17);
    if (!-[IXSUninstallAlert defaultStringsBundle](v14, "defaultStringsBundle"))
    {
      v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
        *(_DWORD *)buf = 136315394;
        v26 = "-[IXSUninstallAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]";
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create default strings bundle from path %@",  buf,  0x16u);
      }
    }

    defaultStringsTableName = v14->_defaultStringsTableName;
    v14->_defaultStringsTableName = (NSString *)@"IXUninstallAlert";

    typeDescription = v14->_typeDescription;
    v14->_typeDescription = (NSString *)@"Generic";

    *(_WORD *)&v14->_needsArchiveOptionButton = 0;
    v14->_defaultButtonAppearsDestructive = 1;
  }

  return v14;
}

- (NSString)title
{
}

- (NSString)message
{
}

- (NSString)defaultButtonLabel
{
}

- (NSString)cancelButtonLabel
{
}

- (NSString)optionalButtonForNotRemovableAppLabel
{
  return 0LL;
}

- (NSString)optionalButtonForNotRemovableAppActionURL
{
  return 0LL;
}

- (NSString)otherButtonLabel
{
  return 0LL;
}

- (unint64_t)notificationFlags
{
  return 3LL;
}

- (BOOL)appHasiCloudDataOrDocuments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entitlements]);
  id v5 = [v4 objectForKey:@"com.apple.developer.icloud-services" ofClass:objc_opt_class(NSArray)];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
          id v14 = v12;
          if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
            id v15 = v14;
          }
          else {
            id v15 = 0LL;
          }

          if (v15 && !objc_msgSend(v14, "caseInsensitiveCompare:", @"cloudkit", (void)v22))
          {
            BOOL v20 = 1;
            goto LABEL_20;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }

  if (qword_1000E8F60 != -1) {
    dispatch_once(&qword_1000E8F60, &stru_1000CDF98);
  }
  v16 = (uint64_t (*)(void))off_1000E8F58;
  if (off_1000E8F58)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 entitlements]);
    uint64_t v18 = v16();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = [v19 count] != 0;

LABEL_20:
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_onMainQueue_deleteButtonActionWithDisposition:(unint64_t *)a3 error:(id *)a4
{
  if (-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable"))
  {
    id v7 = 0LL;
    BOOL v8 = 1;
    unint64_t v9 = 3LL;
  }

  else if (-[IXSUninstallAlert needsArchiveOptionButton](self, "needsArchiveOptionButton"))
  {
    id v7 = 0LL;
    BOOL v8 = 1;
    unint64_t v9 = 2LL;
  }

  else
  {
    uint64_t v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10007F1C0(self, v11);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
    id v14 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _onMainQueue_deleteButtonActionWithDisposition:error:]",  358LL,  @"IXErrorDomain",  0x16uLL,  0LL,  0LL,  @"App with bundle ID %@ cannot be uninstalled",  v13,  (uint64_t)v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v14);

    if (a4)
    {
      id v7 = v7;
      unint64_t v9 = 0LL;
      BOOL v8 = 0;
      *a4 = v7;
    }

    else
    {
      unint64_t v9 = 0LL;
      BOOL v8 = 0;
    }
  }

  *a3 = v9;

  return v8;
}

- (void)_processUserNotification:(__CFUserNotification *)a3 withConfiguration:(id)a4 response:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, void *))a6;
  id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IXSUninstallAlert stringForCFOptionFlag:]( &OBJC_CLASS___IXSUninstallAlert,  "stringForCFOptionFlag:",  a5));
    *(_DWORD *)buf = 136315650;
    v53 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
    __int16 v54 = 2048;
    unint64_t v55 = a5;
    __int16 v56 = 2112;
    v57 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: User selected response: %lx - %@",  buf,  0x20u);
  }

  if ((a5 & 3) >= 2)
  {
    if ((a5 & 3) == 3)
    {
      id v20 = 0LL;
      id v21 = 0LL;
      v19 = 0LL;
      uint64_t v22 = 4LL;
      goto LABEL_11;
    }

    CFDictionaryRef ResponseDictionary = CFUserNotificationGetResponseDictionary(a3);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(ResponseDictionary);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v20 = v24;
    if ((objc_opt_isKindOfClass(v20, v25) & 1) != 0) {
      id v26 = v20;
    }
    else {
      id v26 = 0LL;
    }

    if (v26)
    {
      uint64_t v27 = SBSUserNotificationButtonDefinitionResponseIndexKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:SBSUserNotificationButtonDefinitionResponseIndexKey]);
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v21 = v28;
      if ((objc_opt_isKindOfClass(v21, v29) & 1) != 0) {
        id v30 = v21;
      }
      else {
        id v30 = 0LL;
      }

      if (v30)
      {
        id v35 = [v21 unsignedIntegerValue];
        if (v35 < [v10 numButtons])
        {
          v36 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 actionForButtonAtIndex:v35]);
          ((void (**)(void, void (**)(id, uint64_t, void *)))v36)[2](v36, v11);

          v19 = 0LL;
          goto LABEL_12;
        }

        v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert typeDescription](self, "typeDescription"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
          id v49 = [v10 numButtons];
          *(_DWORD *)buf = 136316418;
          v53 = "-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]";
          __int16 v54 = 2112;
          unint64_t v55 = (unint64_t)v47;
          __int16 v56 = 2112;
          v57 = v48;
          __int16 v58 = 2048;
          id v59 = v35;
          __int16 v60 = 2048;
          id v61 = v49;
          __int16 v62 = 2112;
          uint64_t v63 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%s: Received an invalid response (kCFUserNotificationOtherResponse) from the %@ uninstall alert for app with bundleID %@, Index: %lu, numButtons: %lu : %@",  buf,  0x3Eu);
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert typeDescription](self, "typeDescription"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
        [v10 numButtons];
        id v46 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]",  411LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Received an invalid response (kCFUserNotificationOtherResponse) from the %@ uninstall alert for app with bundleID %@, Index: %lu, numButtons: %lu",  v45,  (uint64_t)v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v46);
      }

      else
      {
        v37 = sub_1000047B4((uint64_t)off_1000E8CA0);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10007F2C8();
        }

        id v40 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]",  402LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Invalid response received for %@ key: %@",  v39,  v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v40);
      }

      goto LABEL_8;
    }

    v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10007F254();
    }

    id v34 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]",  396LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Invalid response received from CFUserNotification: %@",  v33,  (uint64_t)v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v34);
  }

  else
  {
    id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10007F350(self, a5, v16);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert typeDescription](self, "typeDescription"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
    id v18 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]",  417LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Received unknown response %lx from the %@ uninstall alert for app with bundleID %@",  v17,  a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    id v20 = 0LL;
  }

  id v21 = 0LL;
LABEL_8:
  uint64_t v22 = 0LL;
LABEL_11:
  v11[2](v11, v22, v19);
LABEL_12:
}

- (void)_onMainQueue_displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4
{
  v6 = (void (**)(id, void, void *))a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  SInt32 error = 0;
  CFOptionFlags responseFlags = 0LL;
  CFOptionFlags v8 = -[IXSUninstallAlert notificationFlags](self, "notificationFlags");
  unint64_t v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v7 alertParameters]);
  id v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, v8, &error, v9);

  id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (objc_class *)objc_opt_class(self);
      id v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 136315394;
      v31 = "-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]";
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Showing user alert of type:%@",  buf,  0x16u);
    }

    if (CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags))
    {
      uint64_t v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10007F4FC(self);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert typeDescription](self, "typeDescription"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
      id v21 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]",  489LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to recieve notification response for %@ uninstall alert for app with bundle ID %@, Response: %d",  v20,  (uint64_t)v19);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      v6[2](v6, 0LL, v22);
    }

    else
    {
      -[IXSUninstallAlert _processUserNotification:withConfiguration:response:completion:]( self,  "_processUserNotification:withConfiguration:response:completion:",  v10,  v7,  responseFlags,  v6);
      uint64_t v22 = 0LL;
    }

    CFRelease(v10);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10007F42C(self);
    }

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert typeDescription](self, "typeDescription"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert bundleIdentifier](self, "bundleIdentifier"));
    id v25 = sub_10003556C( (uint64_t)"-[IXSUninstallAlert _onMainQueue_displayAlertWithCompletion:uninstallAlertConfiguration:]",  479LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to create %@ uninstall alert for app with bundle ID %@, error code %d",  v24,  (uint64_t)v23);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v6[2](v6, 0LL, v22);
  }
}

- (void)displayAlertWithCompletion:(id)a3 uninstallAlertConfiguration:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003A218;
  v9[3] = &unk_1000CDFC0;
  id v10 = a4;
  id v11 = v6;
  v9[4] = self;
  id v7 = v10;
  id v8 = v6;
  sub_10005A8F0(&_dispatch_main_q, v9);
}

- (void)_configureOptionalButtonForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert optionalButtonForNotRemovableAppLabel](self, "optionalButtonForNotRemovableAppLabel"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[IXSUninstallAlert optionalButtonForNotRemovableAppActionURL]( self,  "optionalButtonForNotRemovableAppActionURL"));
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    id v8 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:]( objc_alloc(&OBJC_CLASS___IXSUninstallButtonConfiguration),  "initWithTitle:buttonType:",  v5,  2LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10003A3E0;
    v12[3] = &unk_1000CDFE8;
    id v13 = v7;
    [v4 addButtonDefinition:v8 forAction:v12];

LABEL_7:
    goto LABEL_8;
  }

  if (v5 | v6)
  {
    unint64_t v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (IXSUninstallButtonConfiguration *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
      *(_DWORD *)buf = 136315906;
      id v15 = "-[IXSUninstallAlert _configureOptionalButtonForConfiguration:]";
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      v19 = v7;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_FAULT,  "%s: Required app label (%@) and action URL (%@) both to be non-nil for %@, but one was nil",  buf,  0x2Au);
    }

    goto LABEL_7;
  }

- (void)displayAlertWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___IXSUninstallAlertConfiguration);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert title](self, "title"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert message](self, "message"));
  id v8 = -[IXSUninstallAlertConfiguration initWithTitle:message:](v5, "initWithTitle:message:", v6, v7);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  LODWORD(v7) = [v9 isDeletable];

  id v10 = objc_alloc(&OBJC_CLASS___IXSUninstallButtonConfiguration);
  if ((_DWORD)v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert defaultButtonLabel](self, "defaultButtonLabel"));
    id v12 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:](v10, "initWithTitle:buttonType:", v11, 0LL);

    id v13 = (IXSUninstallButtonConfiguration *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert otherButtonLabel](self, "otherButtonLabel"));
    if (v13)
    {
      id v14 = objc_alloc(&OBJC_CLASS___IXSUninstallButtonConfiguration);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert otherButtonLabel](self, "otherButtonLabel"));
      id v13 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:](v14, "initWithTitle:buttonType:", v15, 1LL);
    }

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert cancelButtonLabel](self, "cancelButtonLabel"));
    if (v16)
    {
      uint64_t v17 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:]( objc_alloc(&OBJC_CLASS___IXSUninstallButtonConfiguration),  "initWithTitle:buttonType:",  v16,  2LL);
      __int16 v18 = v17;
      if (v13 && v17)
      {
        if ((!-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton")
           || !-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable"))
          && -[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
        {
          if (!-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable")
            && -[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
          {
            -[IXSUninstallAlert _configureOptionalButtonForConfiguration:]( self,  "_configureOptionalButtonForConfiguration:",  v8);
          }

          goto LABEL_32;
        }

        if (-[IXSUninstallAlert needsDemoteOptionButton](self, "needsDemoteOptionButton"))
        {
          if ((id)-[IXSUninstallAlert appRemovability](self, "appRemovability") != (id)3
            && !-[IXSUninstallAlert deletionIsRestricted](self, "deletionIsRestricted"))
          {
            -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v12,  &stru_1000CE028);
          }

          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_10003A8D0;
          v30[3] = &unk_1000CDFE8;
          v30[4] = self;
          id v26 = (Block_layout *)v30;
          uint64_t v27 = v8;
          v28 = v13;
        }

        else
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472LL;
          v29[2] = sub_10003A8DC;
          v29[3] = &unk_1000CDFE8;
          v29[4] = self;
          -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v13,  v29);
          if ((id)-[IXSUninstallAlert appRemovability](self, "appRemovability") == (id)3
            || -[IXSUninstallAlert deletionIsRestricted](self, "deletionIsRestricted"))
          {
            goto LABEL_32;
          }

          id v26 = &stru_1000CE048;
          uint64_t v27 = v8;
          v28 = v12;
        }

        -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v27,  "addButtonDefinition:forAction:",  v28,  v26);
LABEL_32:
        __int128 v23 = &stru_1000CE068;
        uint64_t v24 = v8;
        id v25 = v18;
        goto LABEL_33;
      }

      if (v17)
      {
        -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v17,  &stru_1000CE088);
        if (!-[IXSUninstallAlert appIsRemovable](self, "appIsRemovable"))
        {
          -[IXSUninstallAlert _configureOptionalButtonForConfiguration:]( self,  "_configureOptionalButtonForConfiguration:",  v8);
LABEL_34:

          goto LABEL_35;
        }

        __int128 v23 = &stru_1000CE0A8;
        uint64_t v24 = v8;
        id v25 = v12;
LABEL_33:
        -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v24,  "addButtonDefinition:forAction:",  v25,  v23);
        goto LABEL_34;
      }
    }

    -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v12,  &stru_1000CE0C8);
LABEL_35:

    goto LABEL_36;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert cancelButtonLabel](self, "cancelButtonLabel"));
  id v12 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:](v10, "initWithTitle:buttonType:", v19, 0LL);

  if (-[IXSUninstallAlert needsArchiveOptionButton](self, "needsArchiveOptionButton"))
  {
    __int16 v20 = objc_alloc(&OBJC_CLASS___IXSUninstallButtonConfiguration);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert otherButtonLabel](self, "otherButtonLabel"));
    uint64_t v22 = -[IXSUninstallButtonConfiguration initWithTitle:buttonType:](v20, "initWithTitle:buttonType:", v21, 1LL);

    -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v22,  &stru_1000CE0E8);
  }

  -[IXSUninstallAlertConfiguration addButtonDefinition:forAction:]( v8,  "addButtonDefinition:forAction:",  v12,  &stru_1000CE108);
LABEL_36:

  -[IXSUninstallAlert displayAlertWithCompletion:uninstallAlertConfiguration:]( self,  "displayAlertWithCompletion:uninstallAlertConfiguration:",  v4,  v8);
}

- (void)otherButtonActionWithCompletion:(id)a3
{
  id v3 = a3;
  abort();
}

- (id)localizedStringForKey:(id)a3 withFormatHint:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  id v8 = v7;
  if (-[IXSUninstallAlert defaultStringsBundle](self, "defaultStringsBundle"))
  {
    unint64_t v9 = -[IXSUninstallAlert defaultStringsBundle](self, "defaultStringsBundle");
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert defaultStringsTableName](self, "defaultStringsTableName"));
    id v8 = (__CFString *)CFBundleCopyLocalizedString(v9, v6, 0LL, v10);
  }

  if (v8 == v6)
  {
    id v8 = v7;
  }

  return v8;
}

- (BOOL)isMDMRestrictedWithOrganizationName:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSUninstallAlert appRecord](self, "appRecord"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned int v8 = [v5 isRemovalRestrictedByPolicyForApp:v7];

  if (v8)
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 managingOrganizationInformation]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCCCOrganizationNameKey]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    id v12 = v10;
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }

    if (a3 && v13) {
      *a3 = v13;
    }
  }

  return v8;
}

- (void)dealloc
{
  defaultStringsBundle = self->_defaultStringsBundle;
  if (defaultStringsBundle) {
    CFRelease(defaultStringsBundle);
  }
  self->_defaultStringsBundle = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXSUninstallAlert;
  -[IXSUninstallAlert dealloc](&v4, "dealloc");
}

+ (id)stringForCFOptionFlag:(unint64_t)a3
{
  return off_1000CE128[a3 & 3];
}

- (LSApplicationRecord)appRecord
{
  return self->_appRecord;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)appIsRemovable
{
  return self->_appIsRemovable;
}

- (unint64_t)appRemovability
{
  return self->_appRemovability;
}

- (BOOL)deletionIsRestricted
{
  return self->_deletionIsRestricted;
}

- (BOOL)needsArchiveOptionButton
{
  return self->_needsArchiveOptionButton;
}

- (void)setNeedsArchiveOptionButton:(BOOL)a3
{
  self->_needsArchiveOptionButton = a3;
}

- (BOOL)needsDemoteOptionButton
{
  return self->_needsDemoteOptionButton;
}

- (void)setNeedsDemoteOptionButton:(BOOL)a3
{
  self->_needsDemoteOptionButton = a3;
}

- (__CFBundle)defaultStringsBundle
{
  return self->_defaultStringsBundle;
}

- (NSString)defaultStringsTableName
{
  return self->_defaultStringsTableName;
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
}

- (BOOL)defaultButtonAppearsDestructive
{
  return self->_defaultButtonAppearsDestructive;
}

- (void)setDefaultButtonAppearsDestructive:(BOOL)a3
{
  self->_defaultButtonAppearsDestructive = a3;
}

- (void).cxx_destruct
{
}

@end