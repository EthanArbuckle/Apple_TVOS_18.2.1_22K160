@interface PDPeerPaymentTransactionReminderUserNotification
+ (id)notificationIdentifierForTransactionServiceIdentifier:(id)a3 reminderPeriod:(unint64_t)a4;
- (PDPeerPaymentTransactionReminderUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 reminderPeriod:(unint64_t)a6;
- (id)_acceptanceReminderApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_acceptanceReminderApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)_titleString;
- (id)applicationMessageContent;
- (unint64_t)notificationType;
- (unint64_t)reminderPeriod;
@end

@implementation PDPeerPaymentTransactionReminderUserNotification

+ (id)notificationIdentifierForTransactionServiceIdentifier:(id)a3 reminderPeriod:(unint64_t)a4
{
  v4 = @"ReminderOneDayBeforeExpiration";
  if (!a4) {
    v4 = @"ReminderOneHourAfter";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a3, v4);
}

- (PDPeerPaymentTransactionReminderUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 reminderPeriod:(unint64_t)a6
{
  id v10 = a3;
  v11 = &OBJC_CLASS___NSString;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 serviceIdentifier]);
  v15 = (void *)v14;
  v16 = @"ReminderOneDayBeforeExpiration";
  if (!a6) {
    v16 = @"ReminderOneHourAfter";
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v14, v16));

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDPeerPaymentTransactionReminderUserNotification;
  v18 = -[PDPeerPaymentTransactionUserNotification initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:notificationIdentifier:]( &v25,  "initWithPaymentTransaction:forPassUniqueIdentifier:familyMember:notificationIdentifier:",  v10,  v13,  v12,  v17);

  if (v18)
  {
    v18->_reminderPeriod = a6;
    id v19 = v10;
    v20 = v19;
    if (a6 == 1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 expirationDate]);
      v22 = v21;
      double v23 = -86400.0;
    }

    else
    {
      if (a6)
      {
LABEL_9:

        -[PDUserNotification setDate:](v18, "setDate:", v11);
        goto LABEL_10;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 transactionDate]);
      v22 = v21;
      double v23 = 3600.0;
    }

    v11 = (objc_class *)objc_claimAutoreleasedReturnValue([v21 dateByAddingTimeInterval:v23]);

    goto LABEL_9;
  }

- (unint64_t)notificationType
{
  return 12LL;
}

- (id)_titleString
{
  unint64_t reminderPeriod = self->_reminderPeriod;
  if (reminderPeriod)
  {
    if (reminderPeriod != 1)
    {
      v5 = 0LL;
      return v5;
    }

    v3 = @"PEER_PAYMENT_TRANSACTION_ONE_DAY_REMINDER_NOTIFICATION_TITLE";
  }

  else
  {
    v3 = @"PEER_PAYMENT_TRANSACTION_ONE_HOUR_REMINDER_NOTIFICATION_TITLE";
  }

  uint64_t v4 = PKLocalizedPeerPaymentString(&v3->isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return v5;
}

- (id)_messageString
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification _formattedCounterpartName](self, "_formattedCounterpartName"));
  uint64_t v4 = (void *)v3;
  unint64_t reminderPeriod = self->_reminderPeriod;
  if (reminderPeriod == 1)
  {
    uint64_t v10 = PKLocalizedPeerPaymentString( @"PEER_PAYMENT_TRANSACTION_ONE_DAY_REMINDER_NOTIFICATION_MESSAGE",  @"%@",  v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  else if (reminderPeriod)
  {
    v11 = 0LL;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionUserNotification paymentTransaction](self, "paymentTransaction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 subtotalCurrencyAmount]);
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v6 currencyAmount]);
    }
    id v12 = v9;

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 minimalFormattedStringValue]);
    uint64_t v14 = PKLocalizedPeerPaymentString( @"PEER_PAYMENT_TRANSACTION_ONE_HOUR_REMINDER_NOTIFICATION_MESSAGE",  @"%@%@",  v4,  v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }

  return v11;
}

- (id)applicationMessageContent
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionReminderUserNotification _titleString](self, "_titleString"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPeerPaymentTransactionReminderUserNotification _messageString](self, "_messageString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentTransactionReminderUserNotification _acceptanceReminderApplicationMessageContentWithTitleText:messageText:]( self,  "_acceptanceReminderApplicationMessageContentWithTitleText:messageText:",  v3,  v4));

  return v5;
}

- (id)_acceptanceReminderApplicationMessageGroupDescriptor
{
  uint64_t v2 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SUMMARY_GROUP");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = +[PKApplicationMessageGroupDescriptor createForIdentifier:withSingularSummary:pluralSummary:]( &OBJC_CLASS___PKApplicationMessageGroupDescriptor,  "createForIdentifier:withSingularSummary:pluralSummary:",  @"PDPeerPaymentTransactionAcceptanceReminderApplicationMessageGroupIdentifier",  v3,  v3);

  return v4;
}

- (id)_acceptanceReminderApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDPeerPaymentTransactionReminderUserNotification _acceptanceReminderApplicationMessageGroupDescriptor]( self,  "_acceptanceReminderApplicationMessageGroupDescriptor"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification actionURL](self, "actionURL"));
  id v10 = +[PKApplicationMessageActionURL createWithURL:]( &OBJC_CLASS___PKApplicationMessageActionURL,  "createWithURL:",  v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PDUserNotification applicationMessageIconForFeature:]( &OBJC_CLASS___PDUserNotification,  "applicationMessageIconForFeature:",  1LL));
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:action:icon:title:body:]( &OBJC_CLASS___PKApplicationMessageContentDefault,  "createWithGroup:action:icon:title:body:",  v8,  v10,  v11,  v7,  v6);

  return v12;
}

- (unint64_t)reminderPeriod
{
  return self->_reminderPeriod;
}

@end