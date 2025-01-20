@interface IXSAppUninstaller
+ (id)sharedUninstaller;
- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4;
- (void)_displayAuthenticationErrorForApp:(id)a3;
- (void)_finalDeletionPromptWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)_performUninstallOfAppWithIdentity:(id)a3 clientName:(id)a4 withFlags:(unint64_t)a5 record:(id)a6 completion:(id)a7;
- (void)_postUninstallAlertsWithIdentity:(id)a3 flags:(unint64_t)a4 record:(id)a5;
- (void)_promptForDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptForGatingDefaultAppDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)_promptForMoveOrDeleteAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptForRelatedDataAndUninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7;
- (void)_promptForUnlockOfAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8;
- (void)_promptViewHealthKitDataWithIdentity:(id)a3 record:(id)a4;
- (void)_uninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8;
- (void)uninstallAppWithIdentity:(id)a3 clientName:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)uninstallParallelPlaceholderForIdentity:(id)a3 reason:(id)a4;
@end

@implementation IXSAppUninstaller

+ (id)sharedUninstaller
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015538;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E90 != -1) {
    dispatch_once(&qword_1000E8E90, block);
  }
  return (id)qword_1000E8E88;
}

- (void)uninstallParallelPlaceholderForIdentity:(id)a3 reason:(id)a4
{
  id v5 = a3;
  uint64_t v19 = kMIUninstallParallelPlaceholderKey;
  v20 = &__kCFBooleanTrue;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  id v12 = 0LL;
  char v8 = sub_100011D44(v5, v7, v6, (uint64_t)&v12);

  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[IXSAppUninstaller uninstallParallelPlaceholderForIdentity:reason:]";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to uninstall parallel placeholder %@: %@",  buf,  0x20u);
    }
  }
}

- (void)_promptViewHealthKitDataWithIdentity:(id)a3 record:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc(&OBJC_CLASS___IXSHealthKitDataUninstallAlert);
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  id v9 = -[IXSHealthKitDataUninstallAlert initWithAppRecord:bundleIdentifier:]( v7,  "initWithAppRecord:bundleIdentifier:",  v6,  v8);

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100015844;
    v12[3] = &unk_1000CD178;
    v13 = v9;
    id v14 = v5;
    -[IXSUninstallAlert displayAlertWithCompletion:](v13, "displayAlertWithCompletion:", v12);

    v10 = (os_log_s *)v13;
  }

  else
  {
    v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[IXSAppUninstaller _promptViewHealthKitDataWithIdentity:record:]";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create HealthKit data uninstall alert for app with identity %@",  buf,  0x16u);
    }
  }
}

- (void)_postUninstallAlertsWithIdentity:(id)a3 flags:(unint64_t)a4 record:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((v6 & 8) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100015ADC;
    v11[3] = &unk_1000CD1A0;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    +[IXSHealthKitDataUninstallAlert healthKitDataPresentForAppWithBundleID:completion:]( &OBJC_CLASS___IXSHealthKitDataUninstallAlert,  "healthKitDataPresentForAppWithBundleID:completion:",  v10,  v11);
  }
}

- (id)_acquireTerminationAssertionForIdentity:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 miAppIdentity]);
  id v27 = 0LL;
  uint64_t v9 = MobileInstallationLinkedBundleIDsForIdentity(v8, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v27;

  if (!v10)
  {
    id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10007AE54((uint64_t)v5, (uint64_t)v11, v19);
    }

    id v21 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _acquireTerminationAssertionForIdentity:withError:]",  294LL,  @"IXErrorDomain",  1uLL,  v11,  0LL,  @"Failed to query linked children for app with identity: %@",  v20,  (uint64_t)v5);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v21);
    id v12 = 0LL;
    id v14 = 0LL;
LABEL_14:

    id v11 = v15;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  [v7 unionSet:v10];
  id v12 = [v7 copy];
  if (v12)
  {
    v24 = a4;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IX terminating bundleIDs for uninstallation: %@",  v7));
    id v26 = v11;
    id v14 = -[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]( objc_alloc(&OBJC_CLASS___IXSTerminationAssertion),  "initForBundleIDs:description:terminationResistance:error:",  v12,  v13,  50LL,  &v26);
    id v15 = v26;

    if (v14)
    {
      id v25 = v15;
      unsigned __int8 v16 = [v14 acquireAssertion:&v25];
      id v17 = v25;

      if ((v16 & 1) == 0)
      {
        [v14 invalidate];

        id v14 = 0LL;
      }

      id v11 = (id)v13;
      id v15 = v17;
    }

    else
    {
      id v11 = (id)v13;
    }

    a4 = v24;
    goto LABEL_14;
  }

  id v14 = 0LL;
  if (!a4) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v14) {
    *a4 = v11;
  }
LABEL_17:
  id v22 = v14;

  return v22;
}

- (void)_performUninstallOfAppWithIdentity:(id)a3 clientName:(id)a4 withFlags:(unint64_t)a5 record:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100015E90;
  v22[3] = &unk_1000CD1F0;
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
  id v24 = v12;
  id v25 = v13;
  id v26 = (id)objc_claimAutoreleasedReturnValue([v12 bundleID]);
  id v29 = v15;
  unint64_t v30 = a5;
  id v27 = self;
  id v28 = v14;
  id v16 = v14;
  id v17 = v15;
  id v18 = v26;
  id v19 = v13;
  id v20 = v12;
  id v21 = v23;
  [v21 performCreationBlockingOperation:v22];
}

- (void)_promptForRelatedDataAndUninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7
{
}

- (void)_promptForMoveOrDeleteAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = objc_alloc(&OBJC_CLASS___IXSMoveOrDeleteAlert);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
  id v20 = -[IXSMoveOrDeleteAlert initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:]( v18,  "initWithAppRecord:bundleIdentifier:removability:deletionIsRestricted:",  v14,  v19,  a8,  (a6 >> 10) & 1);

  if (v20)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10001652C;
    v26[3] = &unk_1000CD218;
    id v32 = v17;
    id v27 = v20;
    id v28 = v15;
    id v29 = self;
    id v30 = v14;
    id v31 = v16;
    unint64_t v33 = a6;
    unint64_t v34 = a8;
    -[IXSUninstallAlert displayAlertWithCompletion:](v27, "displayAlertWithCompletion:", v26);

    id v21 = v32;
  }

  else
  {
    id v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10007AF68();
    }

    id v25 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:]",  411LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to create move or delete alert for app with identity %@",  v24,  (uint64_t)v15);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (v17) {
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v21);
    }
  }
}

- (void)_promptForUnlockOfAppRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
  id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10007AFD4(v9);
  }
}

- (void)_finalDeletionPromptWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  unint64_t v18 = (a6 >> 7) & 1;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
  id v20 = -[IXSAppUninstallAlert initWithAppRecord:bundleIdentifier:removability:isManagedByManagedSettings:deletionIsRestricted:]( objc_alloc(&OBJC_CLASS___IXSAppUninstallAlert),  "initWithAppRecord:bundleIdentifier:removability:isManagedByManagedSettings:deletionIsRestricted:",  v14,  v19,  a7,  v18,  (a6 >> 10) & 1);
  id v21 = v20;
  if (v20)
  {
    if ((a6 & 0x100) != 0) {
      -[IXSUninstallAlert setNeedsDemoteOptionButton:](v20, "setNeedsDemoteOptionButton:", 1LL);
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000168DC;
    v27[3] = &unk_1000CD240;
    char v34 = v18;
    v27[4] = self;
    id v28 = v14;
    id v29 = v15;
    id v30 = v16;
    unint64_t v33 = a6;
    id v32 = v17;
    id v31 = v21;
    -[IXSUninstallAlert displayAlertWithCompletion:](v31, "displayAlertWithCompletion:", v27);
  }

  else
  {
    id v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10007B054();
    }

    id v25 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _finalDeletionPromptWithRecord:identity:clientName:flags:removability:completion:]",  587LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to create app uninstall alert for app with bundle ID %@",  v24,  (uint64_t)v19);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (v17) {
      (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v26);
    }
  }
}

- (void)_promptForGatingDefaultAppDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
}

- (void)_promptForDeletionWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 completion:(id)a7 removability:(unint64_t)a8
{
}

- (void)_displayAuthenticationErrorForApp:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016AD4;
  v5[3] = &unk_1000CCCB8;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  sub_10005A8F0(&_dispatch_main_q, v5);
}

- (void)_uninstallAppWithRecord:(id)a3 identity:(id)a4 clientName:(id)a5 flags:(unint64_t)a6 removability:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (void (**)(id, void, void *))a8;
  if ((a6 & 4) != 0)
  {
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleID]);
    id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]";
      __int16 v45 = 2112;
      v46 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s: Posting IXAppMayUninstallNotificationName for %@",  buf,  0x16u);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    CFStringRef v41 = kCFBundleIdentifierKey;
    v42 = v18;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    if (([v15 isPersonalPersonaPlaceholder] & 1) == 0)
    {
      v40 = v17;
      unint64_t v23 = a7;
      id v24 = [v22 mutableCopy];
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v15 personaUniqueString]);
      id v39 = v15;
      id v26 = self;
      id v27 = v16;
      id v28 = v14;
      id v29 = (void *)v25;
      [v24 setValue:v25 forKey:@"PersonaUniqueString"];

      id v30 = [v24 copy];
      a7 = v23;
      id v22 = v30;
      id v14 = v28;
      id v16 = v27;
      self = v26;
      id v15 = v39;
      id v17 = v40;
    }

    [v21 postNotificationName:@"com.apple.installcoordination.AppMayUninstall" object:0 userInfo:v22 deliverImmediately:1];
  }

  if ((a6 & 3) == 2)
  {
    -[IXSAppUninstaller _promptForRelatedDataAndUninstallAppWithRecord:identity:clientName:flags:completion:]( self,  "_promptForRelatedDataAndUninstallAppWithRecord:identity:clientName:flags:completion:",  v14,  v15,  v16,  a6,  v17);
LABEL_27:
    v38 = 0LL;
    goto LABEL_28;
  }

  if ((a6 & 3) != 0)
  {
    if ((a6 & 0x20) != 0)
    {
      if ((a6 & 0x200) == 0)
      {
        -[IXSAppUninstaller _promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:]( self,  "_promptForMoveOrDeleteAppRecord:identity:clientName:flags:completion:removability:",  v14,  v15,  v16,  a6,  v17,  a7);
        goto LABEL_27;
      }
    }

    else if ((a6 & 0x200) == 0)
    {
      -[IXSAppUninstaller _promptForDeletionWithRecord:identity:clientName:flags:completion:removability:]( self,  "_promptForDeletionWithRecord:identity:clientName:flags:completion:removability:",  v14,  v15,  v16,  a6,  v17,  a7);
      goto LABEL_27;
    }

    -[IXSAppUninstaller _promptForUnlockOfAppRecord:identity:clientName:flags:completion:removability:]( self,  "_promptForUnlockOfAppRecord:identity:clientName:flags:completion:removability:",  v14,  v15,  v16,  a6,  v17,  a7);
    goto LABEL_27;
  }

  if ((a6 & 0x200) != 0)
  {
    v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_10007B12C();
    }

    id v34 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]",  851LL,  @"IXErrorDomain",  0x16uLL,  0LL,  0LL,  @"App with identity %@ needs to be unlocked before it can be uninstalled",  v37,  (uint64_t)v15);
    goto LABEL_21;
  }

  if ((a6 & 4) != 0)
  {
    -[IXSAppUninstaller _performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:]( self,  "_performUninstallOfAppWithIdentity:clientName:withFlags:record:completion:",  v15,  v16,  a6,  v14,  v17);
    goto LABEL_27;
  }

  id v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_10007B0C0();
  }

  id v34 = sub_10003556C( (uint64_t)"-[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]",  858LL,  @"IXErrorDomain",  0x16uLL,  0LL,  0LL,  @"App with identity %@ cannot be uninstalled",  v33,  (uint64_t)v15);
LABEL_21:
  v38 = (void *)objc_claimAutoreleasedReturnValue(v34);
  if (v17) {
    v17[2](v17, 0LL, v38);
  }
LABEL_28:
}

- (void)uninstallAppWithIdentity:(id)a3 clientName:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v47 = a6;
  id v45 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  unint64_t v12 = a5 & 3 | (16 * ((a5 >> 2) & 7)) & 0xFFFFFFFFFFFFFEFFLL | (((a5 >> 5) & 1) << 8);
  v46 = self;
  if (sub_100031BB0(v11, 19LL))
  {
    if ((a5 & 0x80) == 0) {
      v12 |= 0x400uLL;
    }
    goto LABEL_9;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v14 = [v13 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed];

  unint64_t v15 = v12 | 0x400;
  if ((a5 & 0x80) != 0) {
    unint64_t v15 = a5 & 3 | (16 * ((a5 >> 2) & 7)) & 0xFFFFFFFFFFFFFEFFLL | (((a5 >> 5) & 1) << 8);
  }
  if (v14 == 2)
  {
    unint64_t v12 = v15;
LABEL_9:
    int v16 = 1;
    goto LABEL_11;
  }

  int v16 = 0;
LABEL_11:
  id v52 = 0LL;
  id v17 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initForInstallMachineryWithBundleIdentifier:error:",  v11,  &v52);
  id v18 = v52;
  if (!v17)
  {
    id v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
      __int16 v55 = 2112;
      id v56 = v11;
      __int16 v57 = 2112;
      *(void *)v58 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create LSApplicationRecord for bundle ID %@: %@",  buf,  0x20u);
    }

    id v18 = 0LL;
    unint64_t v12 = v12 & 0x7F8 | 4;
    uint64_t v29 = 1LL;
    goto LABEL_38;
  }

  unsigned int v19 = [v17 isDeletable];
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleContainerURL]);

  BOOL v22 = (a5 & 0x80) == 0 || v20 == 0LL;
  if ((v16 | v19 ^ 1) == 1 && v22)
  {
    unint64_t v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v54 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
      __int16 v55 = 2112;
      if (v19) {
        int v25 = 89;
      }
      else {
        int v25 = 78;
      }
      *(_DWORD *)buf = 136316418;
      id v56 = v10;
      if (v16) {
        int v26 = 89;
      }
      else {
        int v26 = 78;
      }
      *(_DWORD *)v58 = v25;
      if ((a5 & 0x80) != 0) {
        int v27 = 89;
      }
      else {
        int v27 = 78;
      }
      __int16 v57 = 1024;
      if (v20) {
        int v28 = 89;
      }
      else {
        int v28 = 78;
      }
      *(_WORD *)&v58[4] = 1024;
      *(_DWORD *)&v58[6] = v26;
      __int16 v59 = 1024;
      int v60 = v27;
      __int16 v61 = 1024;
      int v62 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: %@ cannot be uninstalled: deletableAccordingToLS:%c deletionIsRestricted:%c ignoreRestrictions:%c hasBundleContainer:%c",  buf,  0x2Eu);
    }

    uint64_t v29 = 0LL;
LABEL_38:
    uint64_t v33 = v45;
    id v32 = v46;
    goto LABEL_52;
  }

  id v34 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppRemovabilityManager sharedInstance](&OBJC_CLASS___IXSAppRemovabilityManager, "sharedInstance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 removabilityMetadataForAppWithIdentity:v10]);

  uint64_t v29 = (uint64_t)[v35 removability];
  if ([v35 removability] == (id)1)
  {
    v12 |= 4uLL;
    uint64_t v33 = v45;
    id v32 = v46;
  }

  else if ((a5 & 0x40) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    id v51 = v18;
    unsigned __int8 v39 = [v38 clearRemovabilityStateForIdentity:v10 error:&v51];
    id v44 = v51;

    if ((v39 & 1) != 0)
    {
      uint64_t v33 = v45;
      id v32 = v46;
      id v18 = v44;
    }

    else
    {
      v40 = sub_1000047B4((uint64_t)off_1000E8CA0);
      CFStringRef v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      id v32 = v46;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
        __int16 v55 = 2112;
        id v56 = v10;
        __int16 v57 = 2112;
        *(void *)v58 = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to clear removability state for %@ : %@",  buf,  0x20u);
      }

      id v18 = 0LL;
      uint64_t v33 = v45;
    }

    v12 |= 4uLL;
  }

  else
  {
    v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    uint64_t v33 = v45;
    id v32 = v46;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v54 = "-[IXSAppUninstaller uninstallAppWithIdentity:clientName:options:completion:]";
      __int16 v55 = 2112;
      id v56 = v10;
      __int16 v57 = 2112;
      *(void *)v58 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s: %@ cannot be uninstalled because removability does not allow it: %@",  buf,  0x20u);
    }
  }

LABEL_52:
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100017610;
  v48[3] = &unk_1000CD268;
  id v49 = v10;
  id v50 = v47;
  id v42 = v47;
  id v43 = v10;
  -[IXSAppUninstaller _uninstallAppWithRecord:identity:clientName:flags:removability:completion:]( v32,  "_uninstallAppWithRecord:identity:clientName:flags:removability:completion:",  v17,  v43,  v33,  v12,  v29,  v48);
}

@end