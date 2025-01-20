@interface PDPassCommutePlanRenewalReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (NSString)title;
- (PDPassCommutePlanRenewalReminderUserNotification)initWithCoder:(id)a3;
- (PDPassCommutePlanRenewalReminderUserNotification)initWithPaymentPass:(id)a3 commutePlan:(id)a4;
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassCommutePlanRenewalReminderUserNotification

- (PDPassCommutePlanRenewalReminderUserNotification)initWithPaymentPass:(id)a3 commutePlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:v9]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@"-CommutePlanRenewal"]);
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PDPassCommutePlanRenewalReminderUserNotification;
  v12 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v29,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v11,  v8);

  if (v12)
  {
    uint64_t v13 = PKPassLocalizedStringWithFormat(@"COMMUTE_PLAN_RENEWAL_REMINDER_NOTIFICATION_TITLE", v6, 0LL);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    title = v12->_title;
    v12->_title = (NSString *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateStyle:](v16, "setDateStyle:", 3LL);
    -[NSDateFormatter setTimeStyle:](v16, "setTimeStyle:", 0LL);
    -[NSDateFormatter setFormattingContext:](v16, "setFormattingContext:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 expiryDate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v16, "stringFromDate:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
    else {
      BOOL v21 = 0;
    }
    if (![v20 length] || v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v19 label]);

      if (![v22 length])
      {
        v23 = @"COMMUTE_PLAN_RENEWAL_REMINDER_NOTIFICATION_MESSAGE_NO_NAMED_PLAN";
        v24 = @"%@";
        goto LABEL_11;
      }
    }

    else
    {
      v22 = v20;
    }

    v23 = @"COMMUTE_PLAN_RENEWAL_REMINDER_NOTIFICATION_MESSAGE";
    v24 = @"%@%@";
LABEL_11:
    uint64_t v25 = PKPassLocalizedStringWithFormat(v23, v6, v24);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
    message = v12->_message;
    v12->_message = (NSString *)v26;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassCommutePlanRenewalReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDPassCommutePlanRenewalReminderUserNotification;
  id v6 = -[PDUserNotification initWithCoder:](&v15, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), @"title");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    title = v6->_title;
    v6->_title = (NSString *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), @"message");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    message = v6->_message;
    v6->_message = (NSString *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDPassCommutePlanRenewalReminderUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_message forKey:@"message"];
}

- (unint64_t)notificationType
{
  return 8LL;
}

- (id)_titleString
{
  return self->_title;
}

- (id)_messageString
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end