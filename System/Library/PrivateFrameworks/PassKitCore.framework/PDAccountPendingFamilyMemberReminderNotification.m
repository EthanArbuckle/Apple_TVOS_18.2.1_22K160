@interface PDAccountPendingFamilyMemberReminderNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAltDSID:(id)a3;
- (BOOL)isValid;
- (PDAccountPendingFamilyMemberReminderNotification)initWithCoder:(id)a3;
- (PDAccountPendingFamilyMemberReminderNotification)initWithFamilyMember:(id)a3 accountIdentifier:(id)a4 passUniqueIdentifier:(id)a5;
- (PKFamilyMember)familyMember;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPendingFamilyMemberReminderNotification

+ (id)notificationIdentifierForAltDSID:(id)a3
{
  id v3 = a3;
  v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"accountPendingFamilyMemberReminder-%@",  v3);

  return v4;
}

- (PDAccountPendingFamilyMemberReminderNotification)initWithFamilyMember:(id)a3 accountIdentifier:(id)a4 passUniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v13 = (void *)objc_opt_class(self, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 altDSID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 notificationIdentifierForAltDSID:v14]);

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification;
  v16 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v20,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v15,  v11);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_familyMember, a3);
    -[PDUserNotification setAccountIdentifier:](v16, "setAccountIdentifier:", v10);
    -[PDUserNotification setCustomActionRoute:](v16, "setCustomActionRoute:", PKURLActionRouteCreditAccountAddUser);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dateByAddingTimeInterval:300.0]);
    -[PDUserNotification setDate:](v16, "setDate:", v18);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPendingFamilyMemberReminderNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKFamilyMember, v5),  @"familyMember");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    familyMember = v6->_familyMember;
    v6->_familyMember = (PKFamilyMember *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_familyMember, @"familyMember", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 38LL;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification;
  if (!-[PDUserNotification isValid](&v6, "isValid") || !self->_familyMember) {
    return 0;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDUserNotification accountIdentifier](self, "accountIdentifier"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PDAccountPendingFamilyMemberReminderNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v9, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPendingFamilyMemberReminderNotification _titleString](self, "_titleString"));
  [v5 setSubtitle:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDAccountPendingFamilyMemberReminderNotification _messageString](self, "_messageString"));
  [v5 setBody:v7];

  return v5;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"SHARING_INVITATION_FAMILY_MEMBER_REMINDER_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString(@"SHARING_INVITATION_FAMILY_MEMBER_REMINDER_MESSAGE");
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
}

@end