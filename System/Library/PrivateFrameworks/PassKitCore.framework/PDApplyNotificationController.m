@interface PDApplyNotificationController
+ (id)_acceptReminderNotificationDate;
+ (id)_expiryReminderNotificationDateFromExpiryDate:(id)a3;
- (PDApplyNotificationController)initWithApplyManager:(id)a3 databaseManager:(id)a4 familyMemberManager:(id)a5 userNotificationManager:(id)a6 paymentWebServiceCoordinator:(id)a7;
- (id)_acceptReminderIdentifierForApplicationIdentifier:(id)a3;
- (id)_approvedIdentifierForApplicationIdentifier:(id)a3;
- (id)_customRouteForInvitationWithIdentifier:(id)a3;
- (id)_customRouteForJointOfferWithAccountIdentifier:(id)a3 invitationIdentifier:(id)a4;
- (id)_customRouteForPassUniqueID:(id)a3;
- (id)_cutomRouteForApplicationIdentifier:(id)a3;
- (id)_cutomRouteForFeatureIdentifier:(unint64_t)a3;
- (id)_expiryReminderIdentifierForApplicationIdentifier:(id)a3;
- (void)_insertOrUpdateFeatureApplicationAcceptedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationApprovedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationBookedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationExpiredNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationNewNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationOpenNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationPendingNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationTerminatedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateFeatureApplicationWithdrawnNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_insertOrUpdateInvitationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationOfferReadyNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdateInvitationReceivedNotificationForOldApplication:(id)a3 newApplication:(id)a4;
- (void)_insertOrUpdatePathToOfferCompletedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3;
- (void)_queue_notificationForNewApplication:(id)a3 oldApplication:(id)a4 preferredLanguage:(id)a5;
- (void)_queue_removeAllNotificationsForApplicationIdentifier:(id)a3;
- (void)_queue_removeNonTerminalNotificationsForApplicationIdentifier:(id)a3;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)notificationForNewApplication:(id)a3 oldApplication:(id)a4;
- (void)postApplyStateRequiresUserInteractionNotificationWithNewApplication:(id)a3 oldApplication:(id)a4;
@end

@implementation PDApplyNotificationController

- (PDApplyNotificationController)initWithApplyManager:(id)a3 databaseManager:(id)a4 familyMemberManager:(id)a5 userNotificationManager:(id)a6 paymentWebServiceCoordinator:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDApplyNotificationController;
  v17 = -[PDApplyNotificationController init](&v25, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userNotificationManager, a6);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.applynotificationcontroller", v20);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v18->_applyManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_familyMemberManager, a5);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a7);
    -[PDApplyManager registerObserver:](v18->_applyManager, "registerObserver:", v18);
    -[PDFamilyCircleManager addObserver:](v18->_familyMemberManager, "addObserver:", v18);
  }

  return v18;
}

- (void)postApplyStateRequiresUserInteractionNotificationWithNewApplication:(id)a3 oldApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002FC558;
    v9[3] = &unk_100655A28;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v9);
  }
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002FC89C;
  v8[3] = &unk_1006392B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (id)_approvedIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-approved", a3);
}

- (id)_acceptReminderIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-acceptReminder", a3);
}

+ (id)_acceptReminderNotificationDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dateByAddingUnit:16 value:1 toDate:v3 options:0]);

  return v4;
}

- (id)_expiryReminderIdentifierForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-expiryReminder", a3);
}

+ (id)_expiryReminderNotificationDateFromExpiryDate:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingUnit:16 value:-5 toDate:v3 options:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 components:28 fromDate:v5]);
  [v6 setHour:arc4random_uniform(1u) + 18];
  [v6 setMinute:arc4random_uniform(0x3Bu)];
  [v6 setSecond:arc4random_uniform(0x3Bu)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](&OBJC_CLASS___NSTimeZone, "localTimeZone"));
  [v6 setTimeZone:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dateFromComponents:v6]);
  return v8;
}

- (void)_queue_removeNonTerminalNotificationsForApplicationIdentifier:(id)a3
{
  userNotificationManager = self->_userNotificationManager;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _approvedIdentifierForApplicationIdentifier:]( self,  "_approvedIdentifierForApplicationIdentifier:",  v5));
  -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( userNotificationManager,  "removeUserNotificationWithIdentifier:",  v6);

  id v7 = self->_userNotificationManager;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _expiryReminderIdentifierForApplicationIdentifier:]( self,  "_expiryReminderIdentifierForApplicationIdentifier:",  v5));
  -[PDUserNotificationManager removeUserNotificationWithIdentifier:](v7, "removeUserNotificationWithIdentifier:", v8);

  id v9 = self->_userNotificationManager;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _acceptReminderIdentifierForApplicationIdentifier:]( self,  "_acceptReminderIdentifierForApplicationIdentifier:",  v5));

  -[PDUserNotificationManager removeUserNotificationWithIdentifier:](v9, "removeUserNotificationWithIdentifier:", v10);
}

- (void)_queue_removeAllNotificationsForApplicationIdentifier:(id)a3
{
  userNotificationManager = self->_userNotificationManager;
  id v5 = a3;
  -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( userNotificationManager,  "removeUserNotificationWithIdentifier:",  v5);
  -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v5);
}

- (void)notificationForNewApplication:(id)a3 oldApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 feature];
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002FCC9C;
    v10[3] = &unk_100655A50;
    id v13 = v8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[PDPaymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:]( paymentWebServiceCoordinator,  "performHandlerOnSharedWebServiceQueue:",  v10);
  }
}

- (void)_queue_notificationForNewApplication:(id)a3 oldApplication:(id)a4 preferredLanguage:(id)a5
{
  id v35 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v35 feature] == (id)3) {
    goto LABEL_33;
  }
  id v10 = [v35 applicationState];
  id v34 = [v8 applicationState];
  id v33 = [v35 applicationStateReason];
  id v32 = [v8 applicationStateReason];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v35 applicationIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v35 invitationDetails]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountUserAltDSID]);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v35 invitationDetails]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 originatorAltDSID]);

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v35 accountIdentifier]);
  v17 = (void *)v16;
  if (v13 && v16)
  {
    uint64_t v18 = PKCurrentUserAltDSID(v16);
    dispatch_queue_attr_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = v15;
    id v21 = v19;
    v22 = v21;
    if (v20 == v21)
    {
      v30 = v15;
    }

    else
    {
      if (!v20 || !v21)
      {

LABEL_16:
        goto LABEL_17;
      }

      v30 = v15;
      unsigned int v23 = [v20 isEqualToString:v21];

      if (!v23)
      {
        id v15 = v30;
LABEL_17:

        goto LABEL_18;
      }
    }

    if ([v35 applicationType] == (id)2)
    {

      id v15 = v30;
    }

    else
    {
      id v24 = [v35 applicationType];

      BOOL v25 = v24 == (id)3;
      id v15 = v30;
      if (!v25) {
        goto LABEL_18;
      }
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[PDAccountPendingFamilyMemberReminderNotification notificationIdentifierForAltDSID:]( &OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification,  "notificationIdentifierForAltDSID:",  v13));
    -[PDUserNotificationManager removeUserNotificationWithIdentifier:]( self->_userNotificationManager,  "removeUserNotificationWithIdentifier:",  v22);
    v31 = v17;
    v26 = v15;
    v27 = v11;
    databaseManager = self->_databaseManager;
    id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v13));
    v29 = databaseManager;
    id v11 = v27;
    id v15 = v26;
    v17 = v31;
    -[PDDatabaseManager deleteAccountPendingFamilyMembersWithAccountIdentifier:altDSIDs:]( v29,  "deleteAccountPendingFamilyMembersWithAccountIdentifier:altDSIDs:",  v31,  v20);
    goto LABEL_16;
  }

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002FD158;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (id)_cutomRouteForFeatureIdentifier:(unint64_t)a3
{
  uint64_t v3 = PKURLActionSetup;
  uint64_t v4 = PKURLActionFeature;
  uint64_t v5 = PKFeatureIdentifierToString(a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v3,  v4,  v6));

  return v7;
}

- (id)_cutomRouteForApplicationIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  PKURLActionApplication,  a3);
}

- (void)_insertOrUpdateFeatureApplicationApprovedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v63 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 applicationType] == (id)1)
  {
    unint64_t v10 = (unint64_t)[v63 applicationState];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
    id v12 = [v8 feature];
    id v13 = 0LL;
    if (v10 > 5)
    {
      id v14 = 0LL;
    }

    else
    {
      id v14 = 0LL;
      if (((1LL << v10) & 0x31) != 0)
      {
        if ([v8 feature] == (id)3 || objc_msgSend(v8, "applicationType") == (id)5)
        {
LABEL_23:

          goto LABEL_24;
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v12));
        v59 = (void *)v15;
        uint64_t v16 = PKLocalizedApplyFeatureString(@"APPLICATION_APPROVED_NOTIFICATION_TITLE", v12, v9);
        v57 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v17 = PKLocalizedApplyFeatureString(@"APPLICATION_APPROVED_NOTIFICATION_MESSAGE", v12, v9);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v18 = -[PDGenericUserNotification initWithTitle:message:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithTitle:message:",  v57,  v54);
        v61 = self;
        dispatch_queue_attr_t v19 = v18;
        if (v10 == 4) {
          uint64_t v20 = 2LL;
        }
        else {
          uint64_t v20 = 1LL;
        }
        -[PDUserNotification setSuppressionBehavior:](v18, "setSuppressionBehavior:", v20);
        -[PDUserNotification setCustomActionRoute:](v19, "setCustomActionRoute:", v15);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _approvedIdentifierForApplicationIdentifier:]( v61,  "_approvedIdentifierForApplicationIdentifier:",  v11));
        -[PDUserNotification setNotificationIdentifier:](v19, "setNotificationIdentifier:", v21);

        -[PDUserNotification setReissueBannerOnUpdate:](v19, "setReissueBannerOnUpdate:", 1LL);
        uint64_t v22 = PKLocalizedApplyFeatureString(@"APPLICATION_MESSAGE_SUMMARY", v12, v9);
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
        uint64_t v24 = PKFeatureIdentifierToString(v12);
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v56 = (void *)v23;
        id v55 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v25,  v23,  v23);

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](v19, "actionURL"));
        id v26 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v53);
        id v27 = v12;
        v28 = v11;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  2LL));
        id v30 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v55,  v26,  v29,  v57,  v54);

        id v11 = v28;
        id v12 = v27;

        -[PDUserNotification setApplicationMessageContent:](v19, "setApplicationMessageContent:", v30);
        -[PDUserNotificationManager insertUserNotification:]( v61->_userNotificationManager,  "insertUserNotification:",  v19);
        v31 = -[PDGenericUserNotification initWithTitle:message:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithTitle:message:",  v57,  v54);
        -[PDUserNotification setSuppressionBehavior:](v31, "setSuppressionBehavior:", 1LL);
        -[PDUserNotification setCustomActionRoute:](v31, "setCustomActionRoute:", v59);
        id v32 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _acceptReminderIdentifierForApplicationIdentifier:]( v61,  "_acceptReminderIdentifierForApplicationIdentifier:",  v11));
        -[PDUserNotification setNotificationIdentifier:](v31, "setNotificationIdentifier:", v32);

        id v14 = v59;
        id v34 = objc_msgSend((id)objc_opt_class(v61, v33), "_acceptReminderNotificationDate");
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v34);
        -[PDUserNotification setDate:](v31, "setDate:", v13);
        -[PDUserNotification setReissueBannerOnUpdate:](v31, "setReissueBannerOnUpdate:", 1LL);
        -[PDUserNotification setApplicationMessageContent:](v31, "setApplicationMessageContent:", v30);
        -[PDUserNotificationManager insertUserNotification:]( v61->_userNotificationManager,  "insertUserNotification:",  v31);

        self = v61;
      }
    }

    id v58 = v12;
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationOfferDetails]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 expiryDate]);

    v37 = (void *)objc_claimAutoreleasedReturnValue([v63 applicationOfferDetails]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 expiryDate]);

    if (v10 != 6 || v36 && ([v36 isEqualToDate:v38] & 1) == 0)
    {
      id v40 = objc_msgSend((id)objc_opt_class(self, v39), "_expiryReminderNotificationDateFromExpiryDate:", v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v40);
      if (!v13)
      {
        id v43 = objc_msgSend((id)objc_opt_class(self, v41), "_acceptReminderNotificationDate");
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v43);
      }

      uint64_t v44 = PKLaterDate(v42, v13);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

      if (v45 == v42)
      {
        v62 = v11;
        if (!v14) {
          id v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v58));
        }
        v60 = v14;
        v46 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
        uint64_t v47 = PKLocalizedApplyFeatureString(@"APPLICATION_APPROVED_EXPIRING_NOTIFICATION_TITLE", v58, v9);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        uint64_t v49 = PKLocalizedApplyFeatureString(@"APPLICATION_APPROVED_EXPIRING_NOTIFICATION_MESSAGE", v58, v9);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = -[PDGenericUserNotification initWithTitle:message:](v46, "initWithTitle:message:", v48, v50);

        -[PDUserNotification setSuppressionBehavior:](v51, "setSuppressionBehavior:", 1LL);
        -[PDUserNotification setCustomActionRoute:](v51, "setCustomActionRoute:", v60);
        id v11 = v62;
        v52 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _expiryReminderIdentifierForApplicationIdentifier:]( self,  "_expiryReminderIdentifierForApplicationIdentifier:",  v62));
        -[PDUserNotification setNotificationIdentifier:](v51, "setNotificationIdentifier:", v52);

        id v14 = v60;
        -[PDUserNotification setDate:](v51, "setDate:", v42);
        -[PDUserNotification setReissueBannerOnUpdate:](v51, "setReissueBannerOnUpdate:", 1LL);
        -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v51);
      }
    }

    goto LABEL_23;
  }

  -[PDApplyNotificationController _insertOrUpdateInvitationOfferReadyNotificationForOldApplication:newApplication:]( self,  "_insertOrUpdateInvitationOfferReadyNotificationForOldApplication:newApplication:",  v63,  v8);
LABEL_24:
}

- (void)_insertOrUpdateFeatureApplicationExpiredNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v20 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
  id v11 = [v9 applicationState];

  id v12 = [v8 feature];
  -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v10);
  if (v11 && v11 != (id)12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
    uint64_t v14 = PKLocalizedApplyFeatureString(@"APPLICATION_EXPIRED_NOTIFICATION_TITLE", v12, v20);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = PKLocalizedApplyFeatureString(@"APPLICATION_EXPIRED_NOTIFICATION_MESSAGE", v12, v20);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = -[PDGenericUserNotification initWithTitle:message:](v13, "initWithTitle:message:", v15, v17);

    -[PDUserNotification setSuppressionBehavior:](v18, "setSuppressionBehavior:", 1LL);
    dispatch_queue_attr_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v12));
    -[PDUserNotification setCustomActionRoute:](v18, "setCustomActionRoute:", v19);

    -[PDUserNotification setNotificationIdentifier:](v18, "setNotificationIdentifier:", v10);
    -[PDUserNotification setReissueBannerOnUpdate:](v18, "setReissueBannerOnUpdate:", 1LL);
    -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v18);
  }
}

- (void)_insertOrUpdateFeatureApplicationBookedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v34 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
  id v11 = [v8 applicationState];
  id v12 = [v8 applicationStateReason];
  id v13 = [v34 applicationState];
  id v14 = [v34 applicationStateReason];
  id v15 = [v8 feature];
  -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v10);
  if (v11 != v13 || v12 != v14)
  {
    if ([v8 applicationType] == (id)1)
    {
      if (v13 == (id)8 || v13 == (id)5 && v15 == (id)5)
      {
        uint64_t v16 = PKLocalizedApplyFeatureString(@"APPLICATION_CARD_READY_NOTIFICATION_TITLE", v15, v9);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v18 = PKLocalizedApplyFeatureString(@"APPLICATION_CARD_READY_NOTIFICATION_MESSAGE", v15, v9);
        dispatch_queue_attr_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        id v20 = -[PDGenericUserNotification initWithTitle:message:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithTitle:message:",  v17,  v19);
        -[PDUserNotification setSuppressionBehavior:](v20, "setSuppressionBehavior:", 1LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v15));
        -[PDUserNotification setCustomActionRoute:](v20, "setCustomActionRoute:", v21);

        -[PDUserNotification setNotificationIdentifier:](v20, "setNotificationIdentifier:", v10);
        -[PDUserNotification setReissueBannerOnUpdate:](v20, "setReissueBannerOnUpdate:", 1LL);
        if (v15 != (id)5)
        {
          uint64_t v22 = PKLocalizedApplyFeatureString(@"APPLICATION_MESSAGE_SUMMARY", v15, v9);
          uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
          uint64_t v24 = PKFeatureIdentifierToString(v15);
          uint64_t v33 = v17;
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          v31 = (void *)v23;
          id v32 = v19;
          id v26 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v25,  v23,  v23);

          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](v20, "actionURL"));
          id v28 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  v15));
          id v30 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v26,  v28,  v29,  v33,  v32);

          -[PDUserNotification setApplicationMessageContent:](v20, "setApplicationMessageContent:", v30);
          uint64_t v17 = v33;

          dispatch_queue_attr_t v19 = v32;
        }

        -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v20);
      }
    }

    else
    {
      -[PDApplyNotificationController _insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:newApplication:]( self,  "_insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:newApplication:",  v34,  v8);
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationPendingNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
    id v11 = [v8 applicationType];
    id v12 = [v24 applicationState];
    id v13 = [v8 applicationStateReason];
    id v14 = [v24 applicationStateReason];
    id v15 = [v8 feature];
    if (v11 == (id)1 && v12 == (id)5 && v13 != v14)
    {
      id v16 = v15;
      uint64_t v17 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
      uint64_t v18 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_TITLE", v16, v9);
      dispatch_queue_attr_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_MESSAGE", v16, v9);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      uint64_t v22 = -[PDGenericUserNotification initWithTitle:message:](v17, "initWithTitle:message:", v19, v21);

      -[PDUserNotification setSuppressionBehavior:](v22, "setSuppressionBehavior:", 1LL);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v16));
      -[PDUserNotification setCustomActionRoute:](v22, "setCustomActionRoute:", v23);

      -[PDUserNotification setNotificationIdentifier:](v22, "setNotificationIdentifier:", v10);
      -[PDUserNotification setReissueBannerOnUpdate:](v22, "setReissueBannerOnUpdate:", 1LL);
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v22);
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationAcceptedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
    id v11 = [v8 applicationState];
    unint64_t v12 = (unint64_t)[v38 applicationState];
    id v13 = [v8 applicationStateReason];
    id v14 = [v38 applicationStateReason];
    id v15 = [v8 feature];
    -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v10);
    if (v11 != (id)v12 || v13 != v14)
    {
      id v16 = [v8 applicationType];
      if (v16 == (id)2)
      {
        if (v11 == (id)7) {
          -[PDApplyNotificationController _insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:newApplication:]( self,  "_insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:newApplication:",  v38,  v8);
        }
        goto LABEL_24;
      }

      if (v16 == (id)3)
      {
LABEL_8:
        if (v12 <= 5 && ((1LL << v12) & 0x31) != 0)
        {
          if (v15 == (id)5)
          {
            uint64_t v17 = PKLocalizedApplyFeatureString(@"ACCOUNT_NOTIFICATION_GENERIC_TITLE", 5LL, v9);
            uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
            uint64_t v19 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_TITLE", 5LL, v9);
            uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
          }

          else
          {
            uint64_t v21 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_TITLE", v15, v9);
            uint64_t v18 = objc_claimAutoreleasedReturnValue(v21);
            uint64_t v20 = 0LL;
          }

          uint64_t v22 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_MESSAGE", v15, v9);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v36 = (void *)v20;
          v37 = (void *)v18;
          id v24 = -[PDGenericUserNotification initWithTitle:subtitle:message:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithTitle:subtitle:message:",  v18,  v20,  v23);
          BOOL v25 = v24;
          if (v12 == 4) {
            uint64_t v26 = 2LL;
          }
          else {
            uint64_t v26 = 1LL;
          }
          -[PDUserNotification setSuppressionBehavior:](v24, "setSuppressionBehavior:", v26);
          id v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v15));
          -[PDUserNotification setCustomActionRoute:](v25, "setCustomActionRoute:", v27);

          -[PDUserNotification setNotificationIdentifier:](v25, "setNotificationIdentifier:", v10);
          -[PDUserNotification setReissueBannerOnUpdate:](v25, "setReissueBannerOnUpdate:", 1LL);
          if (v11 == (id)7 && v12 == 5)
          {
            if (v15 == (id)5)
            {
              id v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForApplicationIdentifier:]( self,  "_cutomRouteForApplicationIdentifier:",  v10));
              -[PDUserNotification setCustomActionRoute:](v25, "setCustomActionRoute:", v28);
            }

            else
            {
              uint64_t v29 = PKLocalizedApplyFeatureString(@"APPLICATION_MESSAGE_SUMMARY", v15, v9);
              id v28 = (void *)objc_claimAutoreleasedReturnValue(v29);
              uint64_t v30 = PKFeatureIdentifierToString(v15);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              id v35 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v31,  v28,  v28);

              id v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](v25, "actionURL"));
              id v33 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v32);
              id v34 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v35,  v33,  0LL,  v37,  v23);

              -[PDUserNotification setApplicationMessageContent:](v25, "setApplicationMessageContent:", v34);
            }
          }

          -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v25,  v35);
        }
      }
    }

- (void)_insertOrUpdateFeatureApplicationWithdrawnNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v25 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
  id v11 = [v8 applicationState];
  id v12 = [v9 applicationState];
  id v13 = [v8 applicationStateReason];
  id v14 = [v9 applicationStateReason];

  id v15 = [v8 feature];
  -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v10);
  BOOL v17 = v11 != v12 || v13 != v14;
  if (v12 == (id)5 && v17)
  {
    uint64_t v18 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
    uint64_t v19 = PKLocalizedApplyFeatureString(@"APPLICATION_WITHDRAWN_NOTIFICATION_TITLE", v15, v25);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = PKLocalizedApplyFeatureString(@"APPLICATION_WITHDRAWN_NOTIFICATION_MESSAGE", v15, v25);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = -[PDGenericUserNotification initWithTitle:message:](v18, "initWithTitle:message:", v20, v22);

    -[PDUserNotification setSuppressionBehavior:](v23, "setSuppressionBehavior:", 1LL);
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v15));
    -[PDUserNotification setCustomActionRoute:](v23, "setCustomActionRoute:", v24);

    -[PDUserNotification setNotificationIdentifier:](v23, "setNotificationIdentifier:", v10);
    -[PDUserNotification setReissueBannerOnUpdate:](v23, "setReissueBannerOnUpdate:", 1LL);
    -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v23);
  }
}

- (void)_insertOrUpdateFeatureApplicationTerminatedNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
  id v12 = [v8 applicationState];
  id v13 = [v10 applicationState];
  id v14 = [v8 applicationStateReason];
  id v15 = [v10 applicationStateReason];

  id v16 = [v8 feature];
  -[PDApplyNotificationController _queue_removeNonTerminalNotificationsForApplicationIdentifier:]( self,  "_queue_removeNonTerminalNotificationsForApplicationIdentifier:",  v11);
  if (v12 == v13 && v14 == v15) {
    goto LABEL_3;
  }
  id v17 = [v8 applicationType];
  if (v17 == (id)3) {
    goto LABEL_7;
  }
  if (v17 != (id)2)
  {
    if (v17 != (id)1) {
      goto LABEL_3;
    }
LABEL_7:
    if (v13 == (id)5)
    {
      uint64_t v18 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
      uint64_t v19 = PKLocalizedApplyFeatureString(@"APPLICATION_TERMINATED_NOTIFICATION_TITLE", v16, v9);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = PKLocalizedApplyFeatureString(@"APPLICATION_TERMINATED_NOTIFICATION_MESSAGE", v16, v9);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v23 = -[PDGenericUserNotification initWithTitle:message:](v18, "initWithTitle:message:", v20, v22);

      -[PDUserNotification setSuppressionBehavior:](v23, "setSuppressionBehavior:", 1LL);
      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v16));
      -[PDUserNotification setCustomActionRoute:](v23, "setCustomActionRoute:", v24);

      -[PDUserNotification setNotificationIdentifier:](v23, "setNotificationIdentifier:", v11);
      -[PDUserNotification setReissueBannerOnUpdate:](v23, "setReissueBannerOnUpdate:", 1LL);
      -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v23);
    }

    goto LABEL_3;
  }

  if (v12 == (id)11)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1002FE458;
    v25[3] = &unk_100655A78;
    id v26 = v8;
    id v27 = self;
    id v28 = v11;
    -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v25);
  }

- (void)_insertOrUpdateFeatureApplicationNewNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationIdentifier]);
  id v11 = [v8 applicationState];
  id v12 = [v15 applicationState];
  id v13 = [v8 applicationStateReason];
  id v14 = [v15 applicationStateReason];
  if (v11 != v12 || v13 != v14)
  {
    -[PDApplyNotificationController _queue_removeAllNotificationsForApplicationIdentifier:]( self,  "_queue_removeAllNotificationsForApplicationIdentifier:",  v10);
    if (v13 == (id)15) {
      -[PDApplyNotificationController _insertOrUpdatePathToOfferCompletedNotificationForOldApplication:newApplication:preferredLanguage:]( self,  "_insertOrUpdatePathToOfferCompletedNotificationForOldApplication:newApplication:preferredLanguage:",  v15,  v8,  v9);
    }
    if ([v8 applicationType] == (id)2) {
      -[PDApplyNotificationController _insertOrUpdateInvitationReceivedNotificationForOldApplication:newApplication:]( self,  "_insertOrUpdateInvitationReceivedNotificationForOldApplication:newApplication:",  v15,  v8);
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationOpenNotificationsForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[PKWalletVisibility isWalletVisible](&OBJC_CLASS___PKWalletVisibility, "isWalletVisible"))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationIdentifier]);
    id v12 = [v9 applicationState];
    id v13 = [v8 applicationState];
    id v14 = [v9 applicationStateReason];
    id v15 = [v8 applicationStateReason];
    id v16 = [v9 feature];
    BOOL v18 = v12 != v13 || v14 != v15;
    if (v13 == (id)5 && v18)
    {
      if (v15 == (id)8)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(13LL);
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v29 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Suppress notification because application went from pending - manual idv review to open",  v29,  2u);
        }
      }

      else
      {
        id v21 = v16;
        uint64_t v22 = objc_alloc(&OBJC_CLASS___PDWalletUserNotification);
        uint64_t v23 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_TITLE", v21, v10);
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        uint64_t v25 = PKLocalizedApplyFeatureString(@"APPLICATION_UPDATED_NOTIFICATION_MESSAGE", v21, v10);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        id v27 = -[PDGenericUserNotification initWithTitle:message:](v22, "initWithTitle:message:", v24, v26);

        -[PDUserNotification setSuppressionBehavior:](v27, "setSuppressionBehavior:", 1LL);
        id v28 = (void *)objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _cutomRouteForFeatureIdentifier:]( self,  "_cutomRouteForFeatureIdentifier:",  v21));
        -[PDUserNotification setCustomActionRoute:](v27, "setCustomActionRoute:", v28);

        -[PDUserNotification setNotificationIdentifier:](v27, "setNotificationIdentifier:", v11);
        -[PDUserNotification setReissueBannerOnUpdate:](v27, "setReissueBannerOnUpdate:", 1LL);
        -[PDUserNotificationManager insertUserNotification:]( self->_userNotificationManager,  "insertUserNotification:",  v27);
      }
    }
  }
}

- (void)_insertOrUpdateFeatureApplicationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 applicationIdentifier]);
  id v9 = [v7 applicationState];
  id v10 = [v13 applicationState];
  id v11 = [v7 applicationStateReason];
  id v12 = [v13 applicationStateReason];
  if (v9 != v10 || v11 != v12)
  {
    -[PDApplyNotificationController _queue_removeAllNotificationsForApplicationIdentifier:]( self,  "_queue_removeAllNotificationsForApplicationIdentifier:",  v8);
    if ([v7 applicationType] == (id)2) {
      -[PDApplyNotificationController _insertOrUpdateInvitationClosedNotificationForOldApplication:newApplication:]( self,  "_insertOrUpdateInvitationClosedNotificationForOldApplication:newApplication:",  v13,  v7);
    }
  }
}

- (void)_insertOrUpdatePathToOfferCompletedNotificationForOldApplication:(id)a3 newApplication:(id)a4 preferredLanguage:(id)a5
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "applicationIdentifier", a3));
  id v6 = -[PDUserNotificationTypePTACCompletedUserNotification initWithApplicationIdentifier:]( objc_alloc(&OBJC_CLASS___PDUserNotificationTypePTACCompletedUserNotification),  "initWithApplicationIdentifier:",  v7);
  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v6);
}

- (void)_insertOrUpdateInvitationReceivedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationDetails]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountUserAltDSID]);
  id v10 = [v7 applicationState];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationIdentifier]);
  if (!v10)
  {
    uint64_t v13 = PKCurrentUserAltDSID(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = v9;
    id v16 = v14;
    if (v15 == v16)
    {
    }

    else
    {
      id v17 = v16;
      if (!v15 || !v16)
      {

        goto LABEL_10;
      }

      unsigned int v18 = [v15 isEqualToString:v16];

      if (!v18) {
        goto LABEL_10;
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1002FEC30;
    v19[3] = &unk_100655A78;
    id v20 = v8;
    id v21 = self;
    id v22 = v11;
    -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v19);
  }

- (void)_insertOrUpdateInvitationOfferReadyNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v28 = a4;
  BOOL v6 = [a3 applicationState] == (id)5;
  id v7 = v28;
  if (v6)
  {
    id v8 = v28;
    uint64_t v9 = PKCurrentUserAltDSID(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ([v8 applicationType] == (id)3)
    {
      databaseManager = self->_databaseManager;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 referenceIdentifier]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager featureApplicationWithIdentifier:]( databaseManager,  "featureApplicationWithIdentifier:",  v12));

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 invitationDetails]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountUserAltDSID]);
      id v16 = v10;
      id v17 = v15;
      if (v16 == v17)
      {
      }

      else
      {
        unsigned int v18 = v17;
        if (!v16 || !v17)
        {
          id v20 = v17;
LABEL_18:

LABEL_19:
          id v7 = v28;
          goto LABEL_20;
        }

        unsigned __int8 v19 = [v16 isEqualToString:v17];

        if ((v19 & 1) == 0) {
          goto LABEL_19;
        }
      }
    }

    else
    {
      uint64_t v13 = v8;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountIdentifier]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 applicationIdentifier]);
    uint64_t v21 = PKLocalizedMadisonString(@"SHARING_INVITATION_OFFER_AVAILABLE_NOTIFICATION_TITLE");
    id v16 = (id)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v22 = PKLocalizedMadisonString(@"SHARING_INVITATION_OFFER_AVAILABLE_NOTIFICATION_MESSAGE");
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (v14)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accountWithIdentifier:](self->_databaseManager, "accountWithIdentifier:", v14));
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 associatedPassUniqueID]);
    }

    else
    {
      id v24 = 0LL;
    }

    uint64_t v25 = -[PDGenericUserNotification initWithTitle:message:forPassUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDWalletUserNotification),  "initWithTitle:message:forPassUniqueIdentifier:",  v16,  v18,  v24);
    -[PDUserNotification setSuppressionBehavior:](v25, "setSuppressionBehavior:", 1LL);
    if (v14) {
      uint64_t v26 = objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _customRouteForJointOfferWithAccountIdentifier:invitationIdentifier:]( self,  "_customRouteForJointOfferWithAccountIdentifier:invitationIdentifier:",  v14,  v20));
    }
    else {
      uint64_t v26 = objc_claimAutoreleasedReturnValue( -[PDApplyNotificationController _customRouteForInvitationWithIdentifier:]( self,  "_customRouteForInvitationWithIdentifier:",  v20));
    }
    id v27 = (void *)v26;
    -[PDUserNotification setCustomActionRoute:](v25, "setCustomActionRoute:", v26);
    -[PDUserNotification setNotificationIdentifier:](v25, "setNotificationIdentifier:", v20);
    -[PDUserNotification setReissueBannerOnUpdate:](v25, "setReissueBannerOnUpdate:", 1LL);
    -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v25);

    goto LABEL_18;
  }

- (void)_insertOrUpdateInvitationOfferAcceptedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = [a3 applicationState];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationDetails]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originatorAltDSID]);
  int v10 = PKAltDSIDIsCurrentUser(v9);
  char v11 = v10;
  if (v7 == (id)5)
  {
    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1002FF464;
      v14[3] = &unk_100655A78;
      uint64_t v12 = &v15;
      id v15 = v6;
      uint64_t v13 = (id *)v16;
      v16[0] = v8;
      v16[1] = self;
      -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v14);
      goto LABEL_7;
    }
  }

  else if (v7 == (id)8 && [v8 accountUserAccessLevel] == (id)1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1002FF2A4;
    v17[3] = &unk_100655AA0;
    uint64_t v12 = &v18;
    id v18 = v8;
    char v22 = v11;
    uint64_t v13 = &v19;
    id v19 = v9;
    id v20 = v6;
    uint64_t v21 = self;
    -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v17);

LABEL_7:
  }
}

- (void)_insertOrUpdateInvitationOfferDeclinedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v6 = a4;
  id v7 = [a3 applicationState];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 invitationDetails]);
  uint64_t v9 = PKCurrentUserAltDSID(v8);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v7 == (id)5)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v8 originatorAltDSID]);
    id v15 = v10;
    uint64_t v13 = v15;
    if (v11 == v15)
    {
    }

    else
    {
      if (!v15 || !v11)
      {
LABEL_13:

        goto LABEL_19;
      }

      unsigned int v16 = [v11 isEqualToString:v15];

      if (!v16) {
        goto LABEL_19;
      }
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002FF9E0;
    v18[3] = &unk_100655A78;
    id v19 = v8;
    id v20 = v6;
    uint64_t v21 = self;
    -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v18);

    id v17 = v19;
    goto LABEL_18;
  }

  if (v7 == (id)8)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v8 accountUserAltDSID]);
    id v12 = v10;
    uint64_t v13 = v12;
    if (v11 == v12)
    {

LABEL_15:
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1002FF854;
      v22[3] = &unk_100655A78;
      id v23 = v8;
      id v24 = v6;
      uint64_t v25 = self;
      -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v22);

      id v17 = v23;
LABEL_18:

      goto LABEL_19;
    }

    if (v12 && v11)
    {
      unsigned int v14 = [v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }

    goto LABEL_13;
  }

- (void)_insertOrUpdateInvitationClosedNotificationForOldApplication:(id)a3 newApplication:(id)a4
{
  id v5 = a4;
  if ([v5 applicationStateReason] == (id)14)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationIdentifier]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002FFCBC;
    v10[3] = &unk_100655AC8;
    id v11 = (id)objc_claimAutoreleasedReturnValue([v5 invitationDetails]);
    id v12 = (id)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
    uint64_t v13 = self;
    id v14 = v6;
    id v7 = v6;
    id v8 = v12;
    id v9 = v11;
    -[PDApplyNotificationController _queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:]( self,  "_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:",  v10);
  }
}

- (id)_customRouteForPassUniqueID:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = -[NSString initWithFormat:](v4, "initWithFormat:", @"%@/%@", PKUserNotificationActionRouteViewPass, v3);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_customRouteForInvitationWithIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
    id v5 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@/%@",  PKUserNotificationActionRouteInvitationInbox,  v3);
  }

  else
  {
    id v5 = (NSString *)PKUserNotificationActionRouteInvitationInbox;
  }

  return v5;
}

- (id)_customRouteForJointOfferWithAccountIdentifier:(id)a3 invitationIdentifier:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = objc_alloc(&OBJC_CLASS___NSString);
    id v8 = -[NSString initWithFormat:]( v7,  "initWithFormat:",  @"%@/%@/%@",  PKUserNotificationActionRouteJointOffer,  v6,  v5);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_queue_loadFamilyMemberCollectionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_familyMemberCollection)
  {
    if (v4) {
      v4[2](v4);
    }
  }

  else
  {
    familyMemberManager = self->_familyMemberManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1003001E8;
    v7[3] = &unk_10063F520;
    v7[4] = self;
    id v8 = v4;
    -[PDFamilyCircleManager familyMembersWithCachePolicy:completion:]( familyMemberManager,  "familyMembersWithCachePolicy:completion:",  0LL,  v7);
  }
}

- (void).cxx_destruct
{
}

@end