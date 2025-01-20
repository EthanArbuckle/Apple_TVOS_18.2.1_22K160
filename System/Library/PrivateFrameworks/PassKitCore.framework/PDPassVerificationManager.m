@interface PDPassVerificationManager
- (PDPassVerificationManager)initWithDatabaseManager:(id)a3 userNotificationManager:(id)a4 webServiceCoordinator:(id)a5 secureElement:(id)a6;
- (unint64_t)_isVerificationRequiredForPass:(id)a3;
- (void)_checkVerificationStatusForUniqueID:(id)a3;
- (void)_scheduleVerificationCheckForPass:(id)a3 onDate:(id)a4;
- (void)_sendPrecursorActionReminderNotificationForPass:(id)a3 precursorController:(id)a4;
- (void)_sendVerificationReminderNotificationForPass:(id)a3;
- (void)connect;
- (void)passAddedOrUpdated:(id)a3;
- (void)passWillBeRemoved:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
@end

@implementation PDPassVerificationManager

- (PDPassVerificationManager)initWithDatabaseManager:(id)a3 userNotificationManager:(id)a4 webServiceCoordinator:(id)a5 secureElement:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDPassVerificationManager;
  v15 = -[PDPassVerificationManager init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_databaseManager, a3);
    objc_storeStrong((id *)&v16->_userNotificationManager, a4);
    objc_storeStrong((id *)&v16->_webServiceCoordinator, a5);
    objc_storeStrong((id *)&v16->_secureElement, a6);
  }

  return v16;
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    unint64_t v5 = -[PDPassVerificationManager _isVerificationRequiredForPass:](self, "_isVerificationRequiredForPass:", v4);
    if (v5 == 2)
    {
      userNotificationManager = self->_userNotificationManager;
      v7 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueID]);
      -[PDUserNotificationManager removeUserNotificationsForPassUniqueIdentifier:ofType:]( userNotificationManager,  "removeUserNotificationsForPassUniqueIdentifier:ofType:",  v7,  81LL);
    }

    else
    {
      if (PKShortenRemindersEnabled(v5, v11))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  60.0));
        -[PDPassVerificationManager _scheduleVerificationCheckForPass:onDate:]( self,  "_scheduleVerificationCheckForPass:onDate:",  v11,  v8);

        double v9 = 300.0;
      }

      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  3600.0));
        -[PDPassVerificationManager _scheduleVerificationCheckForPass:onDate:]( self,  "_scheduleVerificationCheckForPass:onDate:",  v11,  v10);

        double v9 = 86400.0;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", v9));
      -[PDPassVerificationManager _scheduleVerificationCheckForPass:onDate:]( self,  "_scheduleVerificationCheckForPass:onDate:",  v11,  v7);
    }

    id v4 = v11;
  }
}

- (void)passWillBeRemoved:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueID]);
  v3 = sub_100172228(v5);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  PDScheduledActivityRemove(@"PDPassVerificationManager", v4);
}

- (void)connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100172304;
  block[3] = &unk_100639300;
  block[4] = self;
  if (qword_100707A08 != -1) {
    dispatch_once(&qword_100707A08, block);
  }
}

- (void)_scheduleVerificationCheckForPass:(id)a3 onDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(37LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationName]);
    int v14 = 138412546;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Scheduling verification check for %@ on %@",  (uint8_t *)&v14,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  id v11 = sub_100172228(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:]( &OBJC_CLASS___PDScheduledActivityCriteria,  "maintenanceActivityCriteriaWithStartDate:",  v6));
  PDScheduledActivityRegister(@"PDPassVerificationManager", v12, v13);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(37LL);
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling Scheduled Activity: %@",  (uint8_t *)&v14,  0xCu);
  }

  id v10 = v6;
  id v11 = v10;
  id v12 = (char *)[v10 rangeOfString:@"VerificationCheck."];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 substringFromIndex:&v12[v13]]);

  if (v11)
  {
    -[PDPassVerificationManager _checkVerificationStatusForUniqueID:](self, "_checkVerificationStatusForUniqueID:", v11);
LABEL_6:
  }
}

- (void)_checkVerificationStatusForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(37LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Checking verification status for %@",  (uint8_t *)&v15,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 secureElementPass]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 devicePrimaryPaymentApplication]);
  id v10 = v9;
  if (v9)
  {
    if ([v9 state] == (id)3 || objc_msgSend(v10, "state") == (id)4) {
      -[PDPassVerificationManager _sendVerificationReminderNotificationForPass:]( self,  "_sendVerificationReminderNotificationForPass:",  v8);
    }
  }

  else
  {
    id v11 = objc_alloc(&OBJC_CLASS___PKPrecursorPassUpgradeController);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self->_webServiceCoordinator, "sharedWebService"));
    id v13 = [v11 initWithPass:v8 webService:v12];

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 devicePrimaryPrecursorRequest]);
    if (v14) {
      -[PDPassVerificationManager _sendPrecursorActionReminderNotificationForPass:precursorController:]( self,  "_sendPrecursorActionReminderNotificationForPass:precursorController:",  v8,  v13);
    }
  }
}

- (unint64_t)_isVerificationRequiredForPass:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 devicePrimaryPaymentApplication]);
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = (unint64_t)[v5 state];
    if (v7 < 0x10 && ((0x87FFu >> v7) & 1) != 0)
    {
      unint64_t v8 = qword_1004D6A68[v7];
      goto LABEL_10;
    }

    if ([v6 state] != (id)3 && objc_msgSend(v6, "state") != (id)4) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v8 = 1LL;
    goto LABEL_10;
  }

  id v9 = objc_alloc(&OBJC_CLASS___PKPrecursorPassUpgradeController);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PDPaymentWebServiceCoordinator sharedWebService](self->_webServiceCoordinator, "sharedWebService"));
  id v11 = [v9 initWithPass:v4 webService:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 devicePrimaryPrecursorRequest]);
  if (v12) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v8 = 2LL;
LABEL_10:

  return v8;
}

- (void)_sendVerificationReminderNotificationForPass:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(37LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationName]);
    *(_DWORD *)buf = 138412290;
    int v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Posting verification reminder notification for %@",  buf,  0xCu);
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  uint64_t v9 = PKLocalizedPaymentString(@"NEEDS_VERIFICATION_REMINDER_FORMAT", @"%@", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = objc_alloc(&OBJC_CLASS___PDPassVerificationPromptNotification);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
  id v13 = -[PDPassVerificationPromptNotification initWithTitle:message:forPassUniqueIdentifier:]( v11,  "initWithTitle:message:forPassUniqueIdentifier:",  0LL,  v10,  v12);

  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v13);
}

- (void)_sendPrecursorActionReminderNotificationForPass:(id)a3 precursorController:(id)a4
{
  id v5 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(38LL);
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationName]);
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Posting verification reminder notification for %@",  buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  uint64_t v10 = PKLocalizedPaymentString(@"NEEDS_VERIFICATION_REQUIRED_APPLICATION_MESSAGE_SUMMARY");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
  uint64_t v13 = PKLocalizedPaymentString(@"NEEDS_PRECURSOR_ACTION_REMINDER_FORMAT", @"%@", v12);
  int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  int v15 = -[PDPassVerificationPromptNotification initWithTitle:message:forPassUniqueIdentifier:]( objc_alloc(&OBJC_CLASS___PDPassVerificationPromptNotification),  "initWithTitle:message:forPassUniqueIdentifier:",  v11,  v14,  v9);
  id v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-PrecursorAction",  v9);
  id v17 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  v16,  v11,  v11);
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](v15, "actionURL"));
  id v19 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v18);

  id v20 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v17,  v19,  0LL,  v11,  v14);
  -[PDUserNotification setApplicationMessageContent:](v15, "setApplicationMessageContent:", v20);
  -[PDUserNotificationManager insertUserNotification:](self->_userNotificationManager, "insertUserNotification:", v15);
}

- (void).cxx_destruct
{
}

@end