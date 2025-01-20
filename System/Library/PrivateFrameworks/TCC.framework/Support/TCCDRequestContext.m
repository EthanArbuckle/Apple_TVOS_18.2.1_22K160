@interface TCCDRequestContext
- (BOOL)accessSetPrompt;
- (BOOL)initialPrompt;
- (BOOL)isPreflight;
- (BOOL)reminderPrompt;
- (BOOL)watchInitiatedPrompt;
- (NSDictionary)clientDict;
- (NSDictionary)daemonDict;
- (NSString)functionName;
- (NSString)identityDescription;
- (NSString)messageIdentifier;
- (OS_dispatch_semaphore)promptingSemaphore;
- (TCCDAccessIdentity)subjectIdentity;
- (TCCDAttributionChain)attributionChain;
- (TCCDRequestContext)init;
- (TCCDRequestContext)initWithRequestMessage:(id)a3 forServer:(id)a4 error:(id *)a5;
- (TCCDServer)server;
- (TCCDService)service;
- (id)initForSyncRequestForSubjectBundleIdentifier:(id)a3 service:(id)a4;
- (int)promptingSemaphoreHeld;
- (int)userTccdUnavailable;
- (unint64_t)desiredAuth;
- (unint64_t)promptRightsMask;
- (unint64_t)promptingPolicy;
- (unint64_t)queryCount;
- (unint64_t)recordUpgradePolicy;
- (unint64_t)spiVersion;
- (unint64_t)usageStringPolicy;
- (void)dealloc;
- (void)presentAsynchronousDenialNotificationForService:(id)a3;
- (void)presentAsynchronousDenialNotificationWithMessage:(id)a3 buttonTitle:(id)a4;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 updatingResult:(id)a12;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 withTimeoutInSeconds:(unsigned int)a12 updatingResult:(id)a13;
- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 currentAuth:(unint64_t)a9 updatingResult:(id)a10;
- (void)setAccessSetPrompt:(BOOL)a3;
- (void)setAttributionChain:(id)a3;
- (void)setClientDict:(id)a3;
- (void)setDesiredAuth:(unint64_t)a3;
- (void)setFunctionName:(id)a3;
- (void)setInitialPrompt:(BOOL)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setPromptRightsMask:(unint64_t)a3;
- (void)setPromptingPolicy:(unint64_t)a3;
- (void)setPromptingSemaphore:(id)a3;
- (void)setPromptingSemaphoreHeld:(int)a3;
- (void)setQueryCount:(unint64_t)a3;
- (void)setRecordUpgradePolicy:(unint64_t)a3;
- (void)setReminderPrompt:(BOOL)a3;
- (void)setServer:(id)a3;
- (void)setService:(id)a3;
- (void)setSpiVersion:(unint64_t)a3;
- (void)setSubjectIdentity:(id)a3;
- (void)setUsageStringPolicy:(unint64_t)a3;
- (void)setUserTccdUnavailable:(int)a3;
- (void)setWatchInitiatedPrompt:(BOOL)a3;
@end

@implementation TCCDRequestContext

- (void)presentAsynchronousDenialNotificationWithMessage:(id)a3 buttonTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = tcc_access_log();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](self, "subjectIdentity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TCCDRequestContext(AsynchronousNotification) presentAsynchronousDenialNotificationWithMessage:buttonTitle:]";
    __int16 v65 = 2112;
    v66 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: called for %@", buf, 0x16u);
  }

  if (qword_100078320 != -1) {
    dispatch_once(&qword_100078320, &stru_100065828);
  }
  if (qword_100078310)
  {
    v12 = objc_opt_new(&OBJC_CLASS___UNMutableNotificationContent);
    if (v12)
    {
      v13 = v12;
      id v61 = v6;
      -[UNMutableNotificationContent setBody:](v12, "setBody:", v6);
      v14 = (void *)qword_100078310;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](self, "service"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
      id v17 = v14;
      id v18 = v16;
      id v60 = v7;
      id v19 = v7;
      if (!qword_100078340)
      {
        v20 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v21 = (void *)qword_100078340;
        qword_100078340 = (uint64_t)v20;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.tcc.notification",  v18));
      v23 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078340 objectForKeyedSubscript:v22]);
      if (!v23)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationAction actionWithIdentifier:title:options:]( &OBJC_CLASS___UNNotificationAction,  "actionWithIdentifier:title:options:",  @"BUTTON_ACTION_ID",  v19,  0LL));
        *(void *)buf = v59;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 1LL));
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:]( &OBJC_CLASS___UNNotificationCategory,  "categoryWithIdentifier:actions:intentIdentifiers:options:",  v22,  v24,  &__NSArray0__struct,  0LL));

        [(id)qword_100078340 setObject:v23 forKeyedSubscript:v22];
        v25 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100078340 allValues]);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v25));
        [v17 setNotificationCategories:v26];
      }

      -[UNMutableNotificationContent setCategoryIdentifier:](v13, "setCategoryIdentifier:", v22);
      -[UNMutableNotificationContent setInterruptionLevel:](v13, "setInterruptionLevel:", 1LL);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
      -[UNMutableNotificationContent setSound:](v13, "setSound:", v27);

      -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v13, "setShouldIgnoreDoNotDisturb:", 1LL);
      -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v13, "setShouldBackgroundDefaultAction:", 1LL);
      v62 = @"TCCServiceName";
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](self, "service"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
      v63 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
      -[UNMutableNotificationContent setUserInfo:](v13, "setUserInfo:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 UUIDString]);
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:",  v32,  v13,  0LL));

      if (v33)
      {
        [(id)qword_100078310 addNotificationRequest:v33 withCompletionHandler:&stru_100065868];

        id v7 = v60;
        id v6 = v61;
      }

      else
      {
        id v50 = tcc_access_log();
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        id v7 = v60;
        id v6 = v61;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_100025D64(v51, v52, v53, v54, v55, v56, v57, v58);
        }
      }
    }

    else
    {
      id v42 = tcc_access_log();
      v13 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        sub_100025CF4((os_log_s *)v13, v43, v44, v45, v46, v47, v48, v49);
      }
    }
  }

  else
  {
    id v34 = tcc_access_log();
    v13 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_100025C84((os_log_s *)v13, v35, v36, v37, v38, v39, v40, v41);
    }
  }
}

- (void)presentAsynchronousDenialNotificationForService:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationTitleTextLocalizationKey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedTextWithKey:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](self, "subjectIdentity"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationButtonTitleLocalizationKey]);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 localizedTextWithKey:v10]);

    if (v11) {
      -[TCCDRequestContext presentAsynchronousDenialNotificationWithMessage:buttonTitle:]( self,  "presentAsynchronousDenialNotificationWithMessage:buttonTitle:",  v9,  v11);
    }
  }

  else
  {
    id v12 = tcc_access_log();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100025E50(v4, self, v11);
    }
  }
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 withTimeoutInSeconds:(unsigned int)a12 updatingResult:(id)a13
{
  id v19 = a3;
  id v20 = a4;
  id v160 = a5;
  id v21 = a7;
  id v22 = a9;
  id v161 = a13;
  if (qword_100078338 != -1) {
    dispatch_once(&qword_100078338, &stru_100065888);
  }
  -[TCCDRequestContext setPromptingSemaphore:](self, "setPromptingSemaphore:", qword_100078328);
  v159 = v21;
  if (!-[TCCDRequestContext promptingSemaphoreHeld](self, "promptingSemaphoreHeld"))
  {
    -[TCCDRequestContext setPromptingSemaphoreHeld:](self, "setPromptingSemaphoreHeld:", 1LL);
    v78 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext promptingSemaphore](self, "promptingSemaphore"));
    uint64_t v79 = dispatch_semaphore_wait(v78, 0LL);

    id v21 = v159;
    if (v79)
    {
      id v80 = tcc_access_log();
      v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext identityDescription](self, "identityDescription"));
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v82;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Delaying prompt for %{public}@", buf, 0xCu);
      }

      v83 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext promptingSemaphore](self, "promptingSemaphore"));
      dispatch_semaphore_wait(v83, 0xFFFFFFFFFFFFFFFFLL);

      [v161 setDatabaseAction:2];
      goto LABEL_111;
    }
  }

  v23 = self;
  id v24 = v19;
  id v157 = v20;
  id v25 = v160;
  id v165 = v21;
  id v164 = v22;
  id v156 = v161;
  v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v158 = v24;
  if (!v24) {
    sub_100025F08();
  }
  v163 = v25;
  if (!v25) {
    sub_100025F30();
  }
  if (!v165) {
    sub_100025F58();
  }
  v27 = v26;
  v162 = v23;
  id v154 = v22;
  id v28 = tcc_access_log();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v155 = v20;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](v23, "subjectIdentity"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v23, "service"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 name]);
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "display_prompt";
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2112;
    v176 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s: failed to add user notification: %{public}@",  buf,  0x20u);
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 localizedResourcesBundle]);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 bundleURL]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v36,  kCFUserNotificationLocalizationURLKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v158,  kCFUserNotificationAlertHeaderKey);
  if (v157) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v157,  kCFUserNotificationAlertMessageKey);
  }
  __int128 v182 = xmmword_100046EF0;
  __int128 v183 = unk_100046F00;
  unint64_t v37 = a8;
  id v38 = v25;
  if (v164)
  {
    *(void *)&__int128 v182 = a8;
    unint64_t v37 = a10;
  }

  *((void *)&v182 + 1) = v37;
  *(void *)&__int128 v183 = a6;
  v181[0] = (id)kCFUserNotificationDefaultButtonTitleKey;
  v181[1] = (id)kCFUserNotificationAlternateButtonTitleKey;
  uint64_t v39 = 0LL;
  v181[2] = (id)kCFUserNotificationOtherButtonTitleKey;
  v181[3] = 0LL;
  do
  {
    id v40 = (id)v181[v39];
    if (!v40) {
      goto LABEL_23;
    }
    uint64_t v41 = *(void *)((char *)&v182 + v39 * 8);
    if (v41 == a6)
    {
      id v42 = v27;
      id v43 = v38;
LABEL_22:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v43, v40);
      goto LABEL_23;
    }

    if (v41 == a8)
    {
      id v42 = v27;
      id v43 = v165;
      goto LABEL_22;
    }

    if (v41 == a10)
    {
      if (!v164) {
        goto LABEL_23;
      }
      id v42 = v27;
      id v43 = v164;
      goto LABEL_22;
    }

    id v44 = tcc_access_log();
    uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v41;
      _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to construct localized notification string for service %{public}@ and subject %{public}@",  buf,  0xCu);
    }

    id v38 = v163;
LABEL_23:

    ++v39;
  }

  while (v39 != 4);
  char v46 = _os_feature_enabled_impl("Contacts", "LimitedAccess");
  id v20 = v155;
  if ((v46 & 1) != 0)
  {
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    uint64_t v49 = objc_claimAutoreleasedReturnValue([v48 firstStagePromptHeaderAssetCatalogPath]);
    if (!v49) {
      goto LABEL_33;
    }
    id v50 = (void *)v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v51 firstStagePromptHeaderAssetName]);

    if (v52)
    {
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 firstStagePromptHeaderAssetCatalogPath]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v54,  SBUserNotificationHeaderImageAssetCatalogPathKey);

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstStagePromptHeaderAssetName]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v48,  SBUserNotificationHeaderImageAssetCatalogImageKey);
LABEL_33:

LABEL_34:
    }
  }

  uint64_t v55 = v162;
  if (_os_feature_enabled_impl("Contacts", "LimitedAccess"))
  {
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    unsigned int v57 = [v56 usesTwoStagePrompting];

    if (v57) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  &off_10006C830,  SBUserNotificationButtonLayoutDirectionKey);
    }
  }

  uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v58 name]);
  unsigned int v60 = [v59 isEqualToString:@"kTCCServiceFocusStatus"];

  if (v60) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  @"com.apple.FocusSettingsUI.UserNotificationExtension",  SBUserNotificationExtensionIdentifierKey);
  }
  id v61 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v61 name]);
  unsigned int v63 = [v62 isEqualToString:@"kTCCServicePhotos"];

  if (v63) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  @"com.apple.mobileslideshow.PhotosTCCNotificationExtension",  SBUserNotificationExtensionIdentifierKey);
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  __int16 v65 = (void *)objc_claimAutoreleasedReturnValue([v64 name]);
  if (([v65 isEqualToString:@"kTCCServiceCalendar"] & 1) == 0)
  {

    goto LABEL_47;
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  unsigned int v67 = [v66 supportsStagedPrompting];

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v68 authSpecificNotificationExtensionBundleIdentifier]);
    v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TCCDRequestContext desiredAuth](v162, "desiredAuth")));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKeyedSubscript:v70]);

    if (v64) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v64,  SBUserNotificationExtensionIdentifierKey);
    }
LABEL_47:
  }

  if (_os_feature_enabled_impl("Contacts", "LimitedAccess")
    && _os_feature_enabled_impl("Contacts", "FullAccessSettingsPrompt"))
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v71 name]);
    if ([v72 isEqualToString:@"kTCCServiceAddressBook"])
    {
      id v73 = -[TCCDRequestContext desiredAuth](v162, "desiredAuth");

      if (v73 == (id)2)
      {
        id v74 = tcc_access_log();
        v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](v162, "subjectIdentity"));
          v77 = (void *)objc_claimAutoreleasedReturnValue([v76 identifier]);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "display_prompt";
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v77;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_INFO,  "%s: Contacts full access prompt called for %@",  buf,  0x16u);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  @"com.apple.ContactsUI.FullAccessSettingsPromptExtension",  SBUserNotificationExtensionIdentifierKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  0LL,  SBUserNotificationHeaderImageAssetCatalogPathKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  0LL,  SBUserNotificationHeaderImageAssetCatalogImageKey);
      }
    }

    else
    {
    }
  }

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
  if ([v84 supportsStagedPrompting])
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    v86 = (void *)objc_claimAutoreleasedReturnValue([v85 name]);
    if ([v86 isEqualToString:@"kTCCServiceCalendar"])
    {

      uint64_t v55 = v162;
      goto LABEL_64;
    }

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v162, "service"));
    v88 = (void *)objc_claimAutoreleasedReturnValue([v87 name]);
    unsigned int v89 = [v88 isEqualToString:@"kTCCServicePhotos"];

    uint64_t v55 = v162;
    if (v89)
    {
LABEL_64:
      v179[0] = kTCCNotificationExtensionClientDataKey;
      uint64_t v90 = objc_claimAutoreleasedReturnValue(-[TCCDRequestContext clientDict](v55, "clientDict"));
      v91 = (void *)v90;
      if (v90) {
        v92 = (void *)v90;
      }
      else {
        v92 = &__NSDictionary0__struct;
      }
      v180[0] = v92;
      v179[1] = kTCCNotificationExtensionDaemonDataKey;
      uint64_t v93 = objc_claimAutoreleasedReturnValue(-[TCCDRequestContext daemonDict](v55, "daemonDict"));
      v94 = (void *)v93;
      if (v93) {
        v95 = (void *)v93;
      }
      else {
        v95 = &__NSDictionary0__struct;
      }
      v180[1] = v95;
      v179[2] = @"ClientBundleIdentifier";
      v96 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](v55, "subjectIdentity"));
      v97 = (void *)objc_claimAutoreleasedReturnValue([v96 identifier]);
      v180[2] = v97;
      v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v180,  v179,  3LL));

      v98 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
      -[NSExtensionItem setUserInfo:](v98, "setUserInfo:", v84);
      id v99 = tcc_access_log();
      v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v84;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "extensionItem.userInfo: %@", buf, 0xCu);
      }

      v178 = v98;
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v178, 1LL));
      id v168 = 0LL;
      v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v101,  1LL,  &v168));
      id v103 = v168;

      if (v103)
      {
        id v104 = tcc_access_log();
        v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
          sub_100026030((uint64_t)v103, v105, v106, v107, v108, v109, v110, v111);
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  v102,  SBUserNotificationExtensionItemsKey);
      }

      uint64_t v55 = v162;
      goto LABEL_78;
    }
  }

  else
  {
LABEL_78:
  }

  if (&PBSUnbiasedAlertUserNotificationTemplateType) {
    BOOL v112 = &PBSCFUserNotificationTemplateTypeKey == 0LL;
  }
  else {
    BOOL v112 = 1;
  }
  if (!v112) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v27,  "setObject:forKeyedSubscript:",  PBSUnbiasedAlertUserNotificationTemplateType,  PBSCFUserNotificationTemplateTypeKey);
  }
  id v113 = tcc_access_log();
  v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
  id v22 = v154;
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
    sub_100025FC0((uint64_t)v27, v114);
  }

  CFUserNotificationRef v115 = CFUserNotificationCreate(0LL, 0.0, 0x20uLL, &error, (CFDictionaryRef)v27);
  unint64_t v116 = error;
  if (!v115 || error)
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v55, "service"));
    v128 = (void *)objc_claimAutoreleasedReturnValue([v127 name]);
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext identityDescription](v55, "identityDescription"));
    v152 = v128;
    unint64_t v153 = (unint64_t)v129;
    v151 = (void *)v116;
    v130 = @"Failed CFUserNotificationCreate(): status %d; service %{public}@ and subject %{public}@";
LABEL_98:
    v137 = v156;
    objc_msgSend(v156, "denyAuthorizationWithErrorCode:format:", 2, v130, v151, v152, v153);

    goto LABEL_108;
  }

  v117 = v115;
  if (-[TCCDRequestContext reminderPrompt](v55, "reminderPrompt"))
  {
    id v118 = tcc_access_log();
    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG)) {
      sub_100025F80(v119);
    }

    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", v117));
    *(void *)buf = v156;
    *(void *)&buf[8] = v55;
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 2LL));
    id v122 = sub_1000256F8();
    v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
    [v123 setObject:v121 forKeyedSubscript:v120];

    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource( kCFAllocatorDefault,  v117,  (CFUserNotificationCallBack)sub_100025738,  0LL);
    if (RunLoopSource)
    {
      v125 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v125, kCFRunLoopCommonModes);
      v117 = v125;
    }

    else
    {
      id v138 = sub_1000256F8();
      v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
      [v139 removeObjectForKey:v120];
    }

    CFRelease(v117);

    uint64_t v55 = v162;
    v137 = v156;
    goto LABEL_108;
  }

  v131 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v132 = (void *)objc_claimAutoreleasedReturnValue([v131 server]);
  unsigned int v133 = [v132 generateBacktraceOnPrompt];

  if (v133)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v135 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100025BD0;
    v176 = &unk_100064D50;
    v177 = v55;
    dispatch_async(v135, buf);
  }

  unsigned int v136 = a12;
  SInt32 error = CFUserNotificationReceiveResponse(v117, (double)a12, &responseFlags);
  CFRelease(v117);
  if (error)
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v55, "service"));
    v128 = (void *)objc_claimAutoreleasedReturnValue([v127 name]);
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext identityDescription](v55, "identityDescription"));
    v152 = v129;
    unint64_t v153 = error;
    v151 = v128;
    v130 = @"Failed CFUserNotificationReceiveResponse(): service %{public}@, subject %{public}@, status: %d";
    goto LABEL_98;
  }

  id v140 = tcc_access_log();
  v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);
  if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
  {
    CFOptionFlags v142 = responseFlags;
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](v55, "service"));
    v144 = (void *)objc_claimAutoreleasedReturnValue([v143 name]);
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](v55, "subjectIdentity"));
    v146 = (void *)objc_claimAutoreleasedReturnValue([v145 identifier]);
    *(_DWORD *)v169 = 134218498;
    CFOptionFlags v170 = v142;
    __int16 v171 = 2114;
    v172 = v144;
    __int16 v173 = 2114;
    v174 = v146;
    _os_log_impl( (void *)&_mh_execute_header,  v141,  OS_LOG_TYPE_INFO,  "CFUserNotification response: 0x%lx; service %{public}@ and subject %{public}@",
      v169,
      0x20u);

    uint64_t v55 = v162;
    unsigned int v136 = a12;
  }

  CFOptionFlags v147 = responseFlags & 3;
  v137 = v156;
  [v156 setAuthorizationValue:*((void *)&v182 + v147)];
  [v156 setDatabaseAction:1];
  v148 = v156;
  if (v147 != 3)
  {
    uint64_t v149 = 2LL;
    goto LABEL_107;
  }

  if (v136)
  {
    objc_msgSend(v156, "setDatabaseFlags:", objc_msgSend(v156, "databaseFlags") | 1);
    v148 = v156;
    uint64_t v149 = 9LL;
LABEL_107:
    [v148 setAuthorizationReason:v149];
    goto LABEL_108;
  }

  [v156 setAuthorizationReason:13];
  if ([v156 promptType] == (id)2) {
    [v156 setAuthorizationValue:a11];
  }
LABEL_108:
  for (uint64_t i = 3LL; i != -1; --i)

LABEL_111:
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 cButtonTitle:(id)a9 cButtonAuth:(unint64_t)a10 currentAuth:(unint64_t)a11 updatingResult:(id)a12
{
  LODWORD(v12) = 0;
  -[TCCDRequestContext presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAuth:currentAuth:withTimeoutInSeconds:updatingResult:]( self,  "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAut h:currentAuth:withTimeoutInSeconds:updatingResult:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  v12,  a12);
}

- (void)presentSynchronousPromptWithHeader:(id)a3 message:(id)a4 aButtonTitle:(id)a5 aButtonAuth:(unint64_t)a6 bButtonTitle:(id)a7 bButtonAuth:(unint64_t)a8 currentAuth:(unint64_t)a9 updatingResult:(id)a10
{
}

- (TCCDRequestContext)initWithRequestMessage:(id)a3 forServer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___TCCDRequestContext;
  v10 = -[TCCDRequestContext init](&v55, "init");
  v11 = v10;
  if (!v10
    || (-[TCCDRequestContext setPromptingPolicy:](v10, "setPromptingPolicy:", 0LL),
        -[TCCDRequestContext setUsageStringPolicy:](v11, "setUsageStringPolicy:", 0LL),
        -[TCCDRequestContext setRecordUpgradePolicy:](v11, "setRecordUpgradePolicy:", 0LL),
        -[TCCDRequestContext setUserTccdUnavailable:](v11, "setUserTccdUnavailable:", 0LL),
        -[TCCDRequestContext setServer:](v11, "setServer:", v9),
        !v8)
    || !v9)
  {
LABEL_51:
    uint64_t v41 = v11;
    goto LABEL_52;
  }

  v11->_unint64_t spiVersion = 1LL;
  xpc_object_t value = xpc_dictionary_get_value(v8, "TCCD_MSG_REQUEST_TYPE_KEY");
  uint64_t v13 = objc_claimAutoreleasedReturnValue(value);
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY");

    if (!uint64)
    {
      functionName = v11->_functionName;
      v11->_functionName = (NSString *)@"TCCAccessRequest";

      v11->_unint64_t spiVersion = xpc_dictionary_get_uint64(v8, "TCCD_MSG_SPI_VERSION");
      goto LABEL_11;
    }
  }

  string = xpc_dictionary_get_string(v8, "function");
  if (string)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    id v18 = v11->_functionName;
    v11->_functionName = (NSString *)v17;

LABEL_11:
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v9 serviceFromMessage:v8 error:a5]);
    service = v11->_service;
    v11->_service = (TCCDService *)v22;

    if (v11->_service)
    {
      id v24 = xpc_dictionary_get_string(v8, "TCCD_MSG_ID");
      if (v24)
      {
        id v25 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v24);
        messageIdentifier = v11->_messageIdentifier;
        v11->_messageIdentifier = v25;
      }

      else
      {
        messageIdentifier = v11->_messageIdentifier;
        v11->_messageIdentifier = (NSString *)@"?";
      }

      v27 = -[TCCDAttributionChain initWithMessage:]( objc_alloc(&OBJC_CLASS___TCCDAttributionChain),  "initWithMessage:",  v8);
      p_attributionChain = (id *)&v11->_attributionChain;
      attributionChain = v11->_attributionChain;
      v11->_attributionChain = v27;

      if (v11->_attributionChain)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAttributionChain requestingProcess](v11->_attributionChain, "requestingProcess"));

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([*p_attributionChain accessingProcess]);

          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([*p_attributionChain responsibleProcess]);

            if (v32)
            {
              v11->_userTccdUnavailable = xpc_dictionary_get_BOOL(v8, "user_tccd_unavailable");
              unint64_t spiVersion = v11->_spiVersion;
              if (spiVersion == 2)
              {
                v11->_promptingPolicy = xpc_dictionary_get_uint64( v8,  "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_POLICY_KEY");
                v11->_usageStringPolicy = xpc_dictionary_get_uint64( v8,  "TCCD_MSG_MESSAGE_OPTION_REQUEST_USAGE_STRING_POLICY_KEY");
                v11->_recordUpgradePolicy = xpc_dictionary_get_uint64( v8,  "TCCD_MSG_MESSAGE_OPTION_REQUEST_RECORD_UPGRADE_POLICY_POLICY_KEY");
                v11->_promptRightsMask = xpc_dictionary_get_uint64( v8,  "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_RIGHTS_MASK_KEY");
                v11->_desiredAuth = xpc_dictionary_get_uint64(v8, "desired_auth_value");
                if (!-[TCCDAttributionChain accessingProcessSpecified]( v11->_attributionChain,  "accessingProcessSpecified")
                  || (id v42 = (void *)objc_claimAutoreleasedReturnValue( -[TCCDAttributionChain requestingProcess]( v11->_attributionChain,  "requestingProcess")),  v43 = [v42 hasEntitlement:@"com.apple.private.tcc.set_client_data" containsServiceAllOrService:v11->_service options:0],  v42,  v43))
                {
                  size_t length = 0LL;
                  data = (const UInt8 *)xpc_dictionary_get_data( v8,  "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_CLIENT_DICT_KEY",  &length);
                  if (data)
                  {
                    if (length)
                    {
                      uint64_t v45 = CFDataCreate(0LL, data, length);
                      if (v45)
                      {
                        char v46 = v45;
                        uint64_t v47 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v45, 0LL, 0LL, 0LL);
                        if (v47)
                        {
                          uint64_t v48 = v47;
                          CFTypeID v49 = CFGetTypeID(v47);
                          if (v49 == CFDictionaryGetTypeID())
                          {
                            CFDictionaryRef Copy = CFDictionaryCreateCopy(0LL, v48);
                            clientDict = v11->_clientDict;
                            v11->_clientDict = (NSDictionary *)Copy;
                          }

                          CFRelease(v48);
                        }

                        CFRelease(v46);
                      }
                    }
                  }

                  uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logHandle]);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
                    sub_100033B18((uint64_t *)&v11->_attributionChain, v52);
                  }
                }

                v11->_initialPrompt = 1;
              }

              else if (spiVersion == 1)
              {
                xpc_object_t v34 = xpc_dictionary_get_value(v8, "require_purpose");
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
                uint64_t v36 = v35;
                if (v35 && xpc_get_type(v35) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  BOOL v37 = xpc_BOOL_get_value(v36);
                  uint64_t v38 = 1LL;
                  if (!v37) {
                    uint64_t v38 = 2LL;
                  }
                  v11->_usageStringPolicy = v38;
                }

                BOOL v39 = xpc_dictionary_get_BOOL(v8, "preflight");
                uint64_t v40 = 2LL;
                if (!v39) {
                  uint64_t v40 = 0LL;
                }
                v11->_promptingPolicy = v40;
                v11->_recordUpgradePolicy = 1LL;
              }

              goto LABEL_51;
            }

            id v19 = @"Failed to create Responsible Process from message.";
          }

          else
          {
            id v19 = @"Failed to create Accessing Process from message.";
          }
        }

        else
        {
          id v19 = @"Failed to create Requesting Process from message.";
        }
      }

      else
      {
        id v19 = @"Failed to create Attribution Chain from message.";
      }

      if (a5)
      {
        uint64_t v20 = 5LL;
        goto LABEL_35;
      }
    }

- (void)dealloc
{
  if (self->_promptingSemaphoreHeld)
  {
    id v3 = tcc_access_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      messageIdentifier = self->_messageIdentifier;
      *(_DWORD *)buf = 138543362;
      id v8 = messageIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "signaling prompting semaphore for msgID=%{public}@",  buf,  0xCu);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_promptingSemaphore);
    self->_promptingSemaphoreHeld = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TCCDRequestContext;
  -[TCCDRequestContext dealloc](&v6, "dealloc");
}

- (TCCDRequestContext)init
{
  return -[TCCDRequestContext initWithRequestMessage:forServer:error:]( self,  "initWithRequestMessage:forServer:error:",  0LL,  0LL,  0LL);
}

- (id)initForSyncRequestForSubjectBundleIdentifier:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[TCCDRequestContext initWithRequestMessage:forServer:error:]( self,  "initWithRequestMessage:forServer:error:",  0LL,  0LL,  0LL);
  id v9 = v8;
  if (v8)
  {
    functionName = v8->_functionName;
    v8->_unint64_t spiVersion = 2LL;
    v8->_functionName = (NSString *)@"TCCAccessRequest";

    objc_storeStrong((id *)&v9->_service, a4);
    v11 = -[TCCDAccessIdentity initWithBundleIdentifier:isWK2Proxy:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "initWithBundleIdentifier:isWK2Proxy:",  v6,  1LL);
    subjectIdentity = v9->_subjectIdentity;
    v9->_subjectIdentity = v11;

    v9->_watchInitiatedPrompt = 1;
  }

  return v9;
}

- (NSString)identityDescription
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](self, "subjectIdentity"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext subjectIdentity](self, "subjectIdentity"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Sub:{%@}", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](self, "attributionChain"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 responsibleProcess]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext attributionChain](self, "attributionChain"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 responsibleProcess]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"Resp:{%@}", v11);
  }

  id v12 = -[NSMutableString copy](v3, "copy");

  return (NSString *)v12;
}

- (BOOL)isPreflight
{
  return (id)-[TCCDRequestContext promptingPolicy](self, "promptingPolicy") == (id)2
      || (id)-[TCCDRequestContext promptingPolicy](self, "promptingPolicy") == (id)1;
}

- (NSDictionary)daemonDict
{
  v12[0] = kTCCNotificationExtensionDaemonDataInitialPromptKey;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDRequestContext initialPrompt](self, "initialPrompt")));
  v13[0] = v3;
  v12[1] = kTCCNotificationExtensionDaemonDataDesiredAuthKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[TCCDRequestContext desiredAuth](self, "desiredAuth")));
  v13[1] = v4;
  v12[2] = kTCCNotificationExtensionDaemonDataSetPromptKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[TCCDRequestContext accessSetPrompt](self, "accessSetPrompt")));
  v13[2] = v5;
  v12[3] = kTCCNotificationExtensionDaemonDataInfoString;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](self, "service"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestContext service](self, "service"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestNotificationExtensionTextLocalizationKey]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedTextWithKey:v8]);
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  4LL));

  return (NSDictionary *)v10;
}

- (unint64_t)spiVersion
{
  return self->_spiVersion;
}

- (void)setSpiVersion:(unint64_t)a3
{
  self->_unint64_t spiVersion = a3;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (TCCDService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (unint64_t)desiredAuth
{
  return self->_desiredAuth;
}

- (void)setDesiredAuth:(unint64_t)a3
{
  self->_desiredAuth = a3;
}

- (TCCDAttributionChain)attributionChain
{
  return self->_attributionChain;
}

- (void)setAttributionChain:(id)a3
{
}

- (TCCDAccessIdentity)subjectIdentity
{
  return self->_subjectIdentity;
}

- (void)setSubjectIdentity:(id)a3
{
}

- (BOOL)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(BOOL)a3
{
  self->_initialPrompt = a3;
}

- (BOOL)reminderPrompt
{
  return self->_reminderPrompt;
}

- (void)setReminderPrompt:(BOOL)a3
{
  self->_reminderPrompt = a3;
}

- (TCCDServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (BOOL)accessSetPrompt
{
  return self->_accessSetPrompt;
}

- (void)setAccessSetPrompt:(BOOL)a3
{
  self->_accessSetPrompt = a3;
}

- (BOOL)watchInitiatedPrompt
{
  return self->_watchInitiatedPrompt;
}

- (void)setWatchInitiatedPrompt:(BOOL)a3
{
  self->_watchInitiatedPrompt = a3;
}

- (NSDictionary)clientDict
{
  return self->_clientDict;
}

- (void)setClientDict:(id)a3
{
}

- (unint64_t)promptingPolicy
{
  return self->_promptingPolicy;
}

- (void)setPromptingPolicy:(unint64_t)a3
{
  self->_promptingPolicy = a3;
}

- (unint64_t)usageStringPolicy
{
  return self->_usageStringPolicy;
}

- (void)setUsageStringPolicy:(unint64_t)a3
{
  self->_usageStringPolicy = a3;
}

- (unint64_t)recordUpgradePolicy
{
  return self->_recordUpgradePolicy;
}

- (void)setRecordUpgradePolicy:(unint64_t)a3
{
  self->_recordUpgradePolicy = a3;
}

- (unint64_t)promptRightsMask
{
  return self->_promptRightsMask;
}

- (void)setPromptRightsMask:(unint64_t)a3
{
  self->_promptRightsMask = a3;
}

- (int)userTccdUnavailable
{
  return self->_userTccdUnavailable;
}

- (void)setUserTccdUnavailable:(int)a3
{
  self->_userTccdUnavailable = a3;
}

- (int)promptingSemaphoreHeld
{
  return self->_promptingSemaphoreHeld;
}

- (void)setPromptingSemaphoreHeld:(int)a3
{
  self->_promptingSemaphoreHeld = a3;
}

- (OS_dispatch_semaphore)promptingSemaphore
{
  return self->_promptingSemaphore;
}

- (void)setPromptingSemaphore:(id)a3
{
}

- (unint64_t)queryCount
{
  return self->_queryCount;
}

- (void)setQueryCount:(unint64_t)a3
{
  self->_queryCount = a3;
}

- (void).cxx_destruct
{
}

@end