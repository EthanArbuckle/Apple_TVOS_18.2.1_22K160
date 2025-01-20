@interface IDSAppleIDNotificationCenter
+ (IDSAppleIDNotificationCenter)sharedInstance;
- (CUTDeferredTaskQueue)processAvailableNotificationsTask;
- (CUTDeferredTaskQueue)processUsageNotificationsTask;
- (IDSAppleIDNotificationCenter)init;
- (id)_localizedServicesAccessStringForDevice:(id)a3 serviceMessage:(id)a4;
- (id)_localizedServicesUsageStringForDevice:(id)a3 useSingular:(BOOL)a4;
- (void)_noteNewAvailableNotification:(id)a3;
- (void)_noteNewUsageNotification:(id)a3;
- (void)_postAvailableNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 serviceTypes:(id)a7 blockMap:(id)a8;
- (void)_postUsageNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 deviceModel:(id)a7 deviceCapabilities:(id)a8 serviceTypes:(id)a9;
- (void)_processAvailableNotifications;
- (void)_processUsageNotifications;
- (void)addAvailableNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 serviceType:(id)a7 completionBlock:(id)a8;
- (void)addUsageNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 hardwareVersion:(id)a7 deviceCapabilities:(id)a8 serviceType:(id)a9;
- (void)reportDailyNotificationMetrics;
@end

@implementation IDSAppleIDNotificationCenter

+ (IDSAppleIDNotificationCenter)sharedInstance
{
  if (qword_1009BED48 != -1) {
    dispatch_once(&qword_1009BED48, &stru_1008FC8B8);
  }
  return (IDSAppleIDNotificationCenter *)(id)qword_1009BED50;
}

- (IDSAppleIDNotificationCenter)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___IDSAppleIDNotificationCenter;
  v2 = -[IDSAppleIDNotificationCenter init](&v27, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    availableNotifications = v2->_availableNotifications;
    v2->_availableNotifications = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    usageNotifications = v2->_usageNotifications;
    v2->_usageNotifications = v5;

    v7 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v9 = im_primary_queue(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v7,  "initWithCapacity:queue:block:",  1LL,  v10,  &stru_1008FC8F8);
    processAvailableNotificationsTask = v2->_processAvailableNotificationsTask;
    v2->_processAvailableNotificationsTask = v11;

    v13 = objc_alloc(&OBJC_CLASS___CUTDeferredTaskQueue);
    uint64_t v15 = im_primary_queue(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[CUTDeferredTaskQueue initWithCapacity:queue:block:]( v13,  "initWithCapacity:queue:block:",  1LL,  v16,  &stru_1008FC918);
    processUsageNotificationsTask = v2->_processUsageNotificationsTask;
    v2->_processUsageNotificationsTask = v17;

    v19 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
    v28[0] = objc_opt_class(&OBJC_CLASS___NSString, v20);
    v28[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v22));
    v24 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( v19,  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  @"com.apple.identityservices.dailyDeviceAddedNotificationData",  0LL,  v23,  0LL);
    dailyMetricsData = v2->_dailyMetricsData;
    v2->_dailyMetricsData = v24;
  }

  return v2;
}

- (void)_postAvailableNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 serviceTypes:(id)a7 blockMap:(id)a8
{
  id v60 = a3;
  id v62 = a4;
  id v14 = a5;
  id v15 = a6;
  id v64 = a7;
  id v59 = a8;
  v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  v19 = v15;
  id obj = v14;
  id v65 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v84;
    uint64_t v58 = kFZAppBundleIdentifier;
    v66 = v15;
    do
    {
      for (i = 0LL; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v84 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)i);
        int IsEmail = IMStringIsEmail();
        uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        v22 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        id v23 = v64;
        id v24 = [v23 countByEnumeratingWithState:&v79 objects:v87 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v80;
          do
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v80 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = _UIStringForIDSRegistrationServiceType(*(void *)(*((void *)&v79 + 1) + 8LL * (void)j));
              v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              if ([v29 length])
              {
                -[NSMutableSet addObject:](v21, "addObject:", v29);
                id v30 = sub_10019FEBC(v29, v18);
                v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
                -[NSMutableSet addObject:](v22, "addObject:", v31);
              }
            }

            id v25 = [v23 countByEnumeratingWithState:&v79 objects:v87 count:16];
          }

          while (v25);
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v22, "allObjects"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v21, "allObjects"));
        v33 = @"%@";
        if ((unint64_t)[v70 count] >= 2)
        {
          uint64_t v34 = IMLocalizedStringFromTableInBundle( @"%@ and %@",  @"IDSLocalizable",  v18,  @"Multiple service format");
          v33 = (const __CFString *)objc_claimAutoreleasedReturnValue(v34);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "__imFirstObject"));
        v68 = v32;
        v36 = (void *)objc_claimAutoreleasedReturnValue([v32 lastObject]);
        v69 = (__CFString *)v33;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v35, v36));

        uint64_t v38 = IMLocalizedStringFromTableInBundle(@"Yes", @"IDSLocalizable", v18, @"Yes Button Title");
        v73 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v39 = IMLocalizedStringFromTableInBundle(@"No", @"IDSLocalizable", v18, @"No Button Title");
        v72 = (void *)objc_claimAutoreleasedReturnValue(v39);
        uint64_t v40 = IMFormattedDisplayStringForID(v74, 0LL);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v41 stringWithLTREmbedding]);

        if (IsEmail)
        {
          uint64_t v42 = IMLocalizedStringFromTableInBundle( @"Add “%@” for %@",  @"IDSLocalizable",  v18,  @"Apple Account alert title: Email Detected, arg1: phone number, arg2: service type");
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v19 = v66;
          if ([v66 length])
          {
            uint64_t v44 = IMLocalizedStringFromTableInBundle( @"This email address was recently added to your Apple Account “%@” on “%@”.",  @"IDSLocalizable",  v18,  @"Apple Account alert body: Email link message, arg1: apple account  arg2: device associated on");
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            v57 = v66;
          }

          else
          {
            uint64_t v50 = IMLocalizedStringFromTableInBundle( @"This email address was recently added to your Apple Account “%@”.",  @"IDSLocalizable",  v18,  @"Apple Account alert body: Email link message, arg1: apple account");
            v45 = (void *)objc_claimAutoreleasedReturnValue(v50);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v45, v62, v57));
        }

        else
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationController registeredPhoneNumbers]( &OBJC_CLASS___IDSRegistrationController,  "registeredPhoneNumbers"));
          v19 = v66;
          if ([v45 count] && objc_msgSend(v45, "containsObject:", v74))
          {
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "** This is for my phone, ignoring",  buf,  2u);
            }

            v43 = 0LL;
            v47 = 0LL;
          }

          else
          {
            uint64_t v48 = IMLocalizedStringFromTableInBundle( @"Add %@ for %@?",  @"IDSLocalizable",  v18,  @"Apple Account alert title: Phone Number Detected, arg1: phone number, arg2: service type");
            v43 = (void *)objc_claimAutoreleasedReturnValue(v48);
            if ([v66 length])
            {
              uint64_t v49 = IMLocalizedStringFromTableInBundle( @"This phone number was associated with the Apple Account “%@” on “%@”.",  @"IDSLocalizable",  v18,  @"Apple Account alert body: Phone number link message, arg1: apple account, arg2: device name added from");
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
              v57 = v66;
            }

            else
            {
              uint64_t v51 = IMLocalizedStringFromTableInBundle( @"This phone number was associated with the Apple Account “%@”.",  @"IDSLocalizable",  v18,  @"Apple Account alert body: Phone number link message, arg1: apple account");
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            }

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v46, v62, v57));
          }
        }

        v52 = 0LL;
        if (v43 && v47)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v43, v71, v37));
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"ServerAlerts",  v53,  v47,  v73,  0LL,  v72));

          if (v52)
          {
            if (!IMGetCachedDomainBoolForKey( @"com.apple.conference",  @"hideUsageNotifications")
              || (v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance")),
                  unsigned __int8 v55 = [v54 isInternalInstall],
                  v54,
                  (v55 & 1) == 0))
            {
              [v52 setRepresentedApplicationBundle:v58];
              v56 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotificationCenter sharedInstance]( &OBJC_CLASS___IMUserNotificationCenter,  "sharedInstance"));
              v75[0] = _NSConcreteStackBlock;
              v75[1] = 3221225472LL;
              v75[2] = sub_10019FF64;
              v75[3] = &unk_1008FC940;
              v75[4] = v74;
              id v76 = v60;
              id v77 = v59;
              [v56 addUserNotification:v52 listener:0 completionHandler:v75];
            }
          }

          v19 = v66;
        }
      }

      id v65 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
    }

    while (v65);
  }
}

- (void)_postUsageNotificationForSessions:(id)a3 appleID:(id)a4 aliases:(id)a5 deviceName:(id)a6 deviceModel:(id)a7 deviceCapabilities:(id)a8 serviceTypes:(id)a9
{
  id v93 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a9;
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v95 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v90 = self;
  v19 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v18));
  v96 = (void *)objc_claimAutoreleasedReturnValue(v19);
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  id v20 = v12;
  id v21 = [v20 countByEnumeratingWithState:&v102 objects:v109 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v103;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v103 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)i);
        else {
          uint64_t v26 = v16;
        }
        -[NSMutableArray addObject:](v26, "addObject:", v25);
      }

      id v22 = [v20 countByEnumeratingWithState:&v102 objects:v109 count:16];
    }

    while (v22);
  }

  v94 = (__CFString *)objc_claimAutoreleasedReturnValue( +[IMDeviceSupport marketingNameForModel:]( &OBJC_CLASS___IMDeviceSupport,  "marketingNameForModel:",  v13));
  v91 = v13;
  id v92 = v20;
  if (-[__CFString isEqualToString:](v94, "isEqualToString:", @"Mac")
    && [v13 rangeOfString:@"Mac"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v27 = [v13 rangeOfString:@"Browser"];

    uint64_t v28 = @"browser";
    if (v27 == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v28 = @"device";
    }
    v94 = (__CFString *)v28;
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  id v29 = v14;
  id v30 = [v29 countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v99;
    do
    {
      for (j = 0LL; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v99 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = _UIStringForIDSRegistrationServiceType(*(void *)(*((void *)&v98 + 1) + 8LL * (void)j));
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        if ([v35 length]
          && (-[NSMutableArray containsObject:](v17, "containsObject:", v35) & 1) == 0
          && (([v35 isEqualToIgnoringCase:@"iMessage"] & 1) != 0
           || [v35 isEqualToIgnoringCase:@"FaceTime"]))
        {
          -[NSMutableArray addObject:](v17, "addObject:", v35);
          id v36 = sub_10019FEBC(v35, v96);
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          -[NSMutableArray addObject:](v95, "addObject:", v37);
        }
      }

      id v31 = [v29 countByEnumeratingWithState:&v98 objects:v108 count:16];
    }

    while (v31);
  }

  uint64_t v38 = v92;
  if ((-[NSMutableArray count](v15, "count") || -[NSMutableArray count](v16, "count"))
    && -[NSMutableArray count](v17, "count"))
  {
    id v39 = -[NSMutableArray count](v15, "count");
    id v40 = -[NSMutableArray count](v16, "count");
    if (v39)
    {
      if (v40) {
        v41 = @"Apple Account and phone number";
      }
      else {
        v41 = @"Apple Account";
      }
    }

    else
    {
      if (!v40) {
        goto LABEL_38;
      }
      v41 = @"phone number";
    }

    uint64_t v42 = IMLocalizedStringFromTableInBundle(v41, @"IDSLocalizable", v96, v41);

LABEL_38:
    id v43 = -[NSMutableArray count](v17, "count");
    if (v43 == (id)3)
    {
      v46 = @"iCloud, iMessage, and FaceTime";
      goto LABEL_51;
    }

    if (v43 == (id)2)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v17, "objectAtIndex:", 0LL));
      unsigned int v48 = [v47 isEqualToString:@"iCloud"];

      if (v48)
      {
        uint64_t v49 = v17;
        uint64_t v50 = 1LL;
      }

      else
      {
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v17, "objectAtIndex:", 1LL));
        unsigned int v52 = [v51 isEqualToString:@"iCloud"];

        if (!v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v17, "objectAtIndex:", 0LL));
          unsigned int v54 = [v53 isEqualToString:@"iMessage"];

          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v17, "objectAtIndex:", v54 != 0));
          v45 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iMessage and %@",  v44);
          goto LABEL_50;
        }

        uint64_t v49 = v17;
        uint64_t v50 = 0LL;
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v49, "objectAtIndex:", v50));
      v45 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"iCloud and %@", v44);
    }

    else
    {
      if (v43 != (id)1)
      {
        v46 = 0LL;
        goto LABEL_51;
      }

      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v17, "objectAtIndex:", 0LL));
      v45 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v44);
    }

- (id)_localizedServicesAccessStringForDevice:(id)a3 serviceMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (([v6 isEqualToString:@"Mac"] & 1) != 0
    || ([v6 isEqualToString:@"browser"] & 1) != 0)
  {
    v11 = @"A %@ now has access to %@. %%@";
  }

  else
  {
    v11 = @"A %@ now has access to %@. %%@";
    if (([v6 isEqualToString:@"device"] & 1) == 0
      && ![v6 isEqualToString:@"HomePod"])
    {
      v11 = @"An %@ now has access to %@. %%@";
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v11, v6, v7));
  uint64_t v13 = IMLocalizedStringFromTableInBundle( v12,  @"IDSLocalizable",  v10,  @"A(n) DeviceType now has access to service(s). arg1: service name (iCloud, iMessage, Facetime, (any combination)) arg2: User action string ");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (id)_localizedServicesUsageStringForDevice:(id)a3 useSingular:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = @"are";
  if (v4) {
    v10 = @"is";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Your %%@ %@ now being used for %%@ on a new %@.",  v10,  v6));

  uint64_t v12 = IMLocalizedStringFromTableInBundle( v11,  @"IDSLocalizable",  v9,  @"Your accountType(s) are now being used for services(s) on a new DeviceType., arg1: Account Type (Apple Account, phone number, Combination)  arg2: service  name (iCloud, iMessage, Facetime, (any combination)) ");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (void)_processAvailableNotifications
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = self->_availableNotifications;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v16)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sessions]);
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 appleID]);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 aliases]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceTypes]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 sessionToBlockMap]);
        -[IDSAppleIDNotificationCenter _postAvailableNotificationForSessions:appleID:aliases:deviceName:serviceTypes:blockMap:]( self,  "_postAvailableNotificationForSessions:appleID:aliases:deviceName:serviceTypes:blockMap:",  v5,  v6,  v8,  v9,  v11,  v12);
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v16);
  }

  -[NSMutableArray removeAllObjects](self->_availableNotifications, "removeAllObjects");
}

- (void)_processUsageNotifications
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = self->_usageNotifications;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v16)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v3 sessions]);
        BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v17 allObjects]);
        v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appleID]);
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 aliases]);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceName]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceModel]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceCapabilities]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceTypes]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
        -[IDSAppleIDNotificationCenter _postUsageNotificationForSessions:appleID:aliases:deviceName:deviceModel:deviceCapabilities:serviceTypes:]( self,  "_postUsageNotificationForSessions:appleID:aliases:deviceName:deviceModel:deviceCapabilities:serviceTypes:",  v4,  v5,  v7,  v8,  v9,  v10,  v12);
      }

      id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v16);
  }

  -[NSMutableArray removeAllObjects](self->_usageNotifications, "removeAllObjects");
}

- (void)_noteNewAvailableNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[CUTDeferredTaskQueue cancelPendingExecutions](self->_processAvailableNotificationsTask, "cancelPendingExecutions");
    -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_processAvailableNotificationsTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  5.0);
    if ((-[NSMutableArray containsObjectIdenticalTo:]( self->_availableNotifications,  "containsObjectIdenticalTo:",  v4) & 1) == 0) {
      -[NSMutableArray addObject:](self->_availableNotifications, "addObject:", v4);
    }
  }
}

- (void)_noteNewUsageNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[CUTDeferredTaskQueue cancelPendingExecutions](self->_processUsageNotificationsTask, "cancelPendingExecutions");
    -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:]( self->_processUsageNotificationsTask,  "enqueueExecutionWithTarget:afterDelay:",  self,  5.0);
    if ((-[NSMutableArray containsObjectIdenticalTo:]( self->_usageNotifications,  "containsObjectIdenticalTo:",  v4) & 1) == 0) {
      -[NSMutableArray addObject:](self->_usageNotifications, "addObject:", v4);
    }
  }
}

- (void)addAvailableNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 serviceType:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned int v21 = [v20 isCurrentDeviceTinkerConfiguredWatch];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v23 = [v22 deviceType];

  if (v23 != (id)6 || v21 != 0)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v26 = [v25 isInternalInstall];

    if (v26 && IMGetDomainBoolForKey(@"com.apple.ids", @"DisableAliasAvailablePopups"))
    {
      _IMWarn(@"**** Suppressing popup for available alias %@");
      goto LABEL_23;
    }

    if (!v16) {
      goto LABEL_23;
    }
    id v40 = v17;
    id v41 = v15;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v39 = self;
    id v27 = self->_availableNotifications;
    id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
    if (v28)
    {
      id v29 = v28;
      id v37 = v18;
      id v38 = v14;
      id v30 = 0LL;
      uint64_t v31 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 aliases]);
          unsigned int v35 = [v34 containsObject:v16];

          if (v35)
          {
            id v36 = v33;

            id v30 = v36;
          }
        }

        id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
      }

      while (v29);

      id v18 = v37;
      id v14 = v38;
      id v17 = v40;
      id v15 = v41;
      if (v30) {
        goto LABEL_22;
      }
    }

    else
    {
    }

    id v30 = objc_alloc_init(&OBJC_CLASS___IDSAppleIDNotification);
    -[IDSAppleIDNotification setAppleID:](v30, "setAppleID:", v15);
    -[IDSAppleIDNotification setDeviceName:](v30, "setDeviceName:", v17);
    -[IDSAppleIDNotification addAlias:](v30, "addAlias:", v16);
LABEL_22:
    -[IDSAppleIDNotification addServiceType:](v30, "addServiceType:", v18);
    -[IDSAppleIDNotification addSession:](v30, "addSession:", v14);
    -[IDSAppleIDNotification addCompletionBlock:forSession:](v30, "addCompletionBlock:forSession:", v19, v14);
    -[IDSAppleIDNotificationCenter _noteNewAvailableNotification:](v39, "_noteNewAvailableNotification:", v30);
  }

- (void)addUsageNotificationForSession:(id)a3 appleID:(id)a4 alias:(id)a5 deviceName:(id)a6 hardwareVersion:(id)a7 deviceCapabilities:(id)a8 serviceType:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v40 = a7;
  id v41 = a8;
  id v19 = a9;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  unsigned int v21 = [v20 isCurrentDeviceTinkerConfiguredWatch];

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
  id v23 = [v22 deviceType];

  if (v23 != (id)6 || v21)
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
    unsigned int v25 = [v24 isInternalInstall];

    if (v25 && IMGetDomainBoolForKey(@"com.apple.ids", @"DisableUsedElsewherePopups"))
    {
      _IMWarn(@"**** Suppressing popup for alias %@  is in use on device %@");
      goto LABEL_20;
    }

    id v38 = self;
    id v39 = v16;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    unsigned int v26 = self->_usageNotifications;
    id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
    if (v27)
    {
      id v28 = v27;
      id v36 = v17;
      id v37 = v15;
      id v29 = 0LL;
      uint64_t v30 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 deviceName]);
          unsigned int v34 = [v33 isEqualToString:v18];

          if (v34)
          {
            unsigned int v35 = v32;

            id v29 = v35;
          }
        }

        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
      }

      while (v28);

      id v17 = v36;
      id v15 = v37;
      id v16 = v39;
      if (v29) {
        goto LABEL_19;
      }
    }

    else
    {
    }

    id v29 = objc_alloc_init(&OBJC_CLASS___IDSAppleIDNotification);
    -[IDSAppleIDNotification setAppleID:](v29, "setAppleID:", v16);
    -[IDSAppleIDNotification setDeviceName:](v29, "setDeviceName:", v18);
    -[IDSAppleIDNotification setDeviceModel:](v29, "setDeviceModel:", v40);
LABEL_19:
    -[IDSAppleIDNotification addAlias:](v29, "addAlias:", v17);
    -[IDSAppleIDNotification addServiceType:](v29, "addServiceType:", v19);
    -[IDSAppleIDNotification addSession:](v29, "addSession:", v15);
    -[IDSAppleIDNotification setDeviceCapabilities:](v29, "setDeviceCapabilities:", v41);
    -[IDSAppleIDNotificationCenter _noteNewUsageNotification:](v38, "_noteNewUsageNotification:", v29);
  }

- (void)reportDailyNotificationMetrics
{
  id v9 = -[IDSPersistentMap copyDictionaryRepresentation](self->_dailyMetricsData, "copyDictionaryRepresentation");
  uint64_t v3 = IDSDailyAccountAddedNotificationMetricTotalKey;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSDailyAccountAddedNotificationMetricTotalKey]);
  uint64_t v5 = IDSDailyAccountAddedNotificationMetricDuplicateKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:IDSDailyAccountAddedNotificationMetricDuplicateKey]);
  id v7 = [[IDSDailyAccountAddedNotificationsMetric alloc] initWithNotificationsPostedToday:v4 duplicateNotificationPostedToday:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSCoreAnalyticsLogger defaultLogger](&OBJC_CLASS___IDSCoreAnalyticsLogger, "defaultLogger"));
  [v8 logMetric:v7];

  -[IDSPersistentMap setObject:forKey:](self->_dailyMetricsData, "setObject:forKey:", &off_1009473F8, v3);
  -[IDSPersistentMap setObject:forKey:](self->_dailyMetricsData, "setObject:forKey:", &off_1009473F8, v5);
}

- (CUTDeferredTaskQueue)processAvailableNotificationsTask
{
  return self->_processAvailableNotificationsTask;
}

- (CUTDeferredTaskQueue)processUsageNotificationsTask
{
  return self->_processUsageNotificationsTask;
}

- (void).cxx_destruct
{
}

@end