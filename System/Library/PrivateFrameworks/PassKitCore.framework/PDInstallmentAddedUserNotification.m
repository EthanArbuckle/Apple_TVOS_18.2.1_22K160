@interface PDInstallmentAddedUserNotification
+ (BOOL)supportsSecureCoding;
- (PDInstallmentAddedUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5;
- (PDInstallmentAddedUserNotification)initWithCoder:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDInstallmentAddedUserNotification

- (PDInstallmentAddedUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-installmentPlanAdded",  v11));

    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___PDInstallmentAddedUserNotification;
    v13 = -[PDUserNotification initWithNotificationIdentifier:forPassUniqueIdentifier:]( &v22,  "initWithNotificationIdentifier:forPassUniqueIdentifier:",  v12,  v10);
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 accountIdentifier]);
      -[PDUserNotification setAccountIdentifier:](v13, "setAccountIdentifier:", v14);
      objc_storeStrong((id *)&v13->_installmentPlan, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 creditDetails]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accountSummary]);
      unsigned __int8 v17 = [v16 requiresDebtCollectionNotices];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = PKInstallmentRoutePass;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PKCreditInstallmentPlan identifier](v13->_installmentPlan, "identifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v18,  v19,  v14));

        -[PDUserNotification setCustomActionRoute:](v13, "setCustomActionRoute:", v20);
      }
    }
  }

  else
  {

    v13 = 0LL;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDInstallmentAddedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PDInstallmentAddedUserNotification;
  v6 = -[PDUserNotification initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(PKCreditInstallmentPlan, v5),  @"installmentPlan");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    installmentPlan = v6->_installmentPlan;
    v6->_installmentPlan = (PKCreditInstallmentPlan *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDInstallmentAddedUserNotification;
  id v4 = a3;
  -[PDUserNotification encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_installmentPlan,  @"installmentPlan",  v5.receiver,  v5.super_class);
}

- (unint64_t)notificationType
{
  return 25LL;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDInstallmentAddedUserNotification;
  id v4 = -[PDUserNotification notificationContentWithDataSource:](&v13, "notificationContentWithDataSource:", a3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKCreditInstallmentPlan product](self->_installmentPlan, "product"));
  uint64_t v7 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 model]);
  uint64_t v10 = PKLocalizedBeekmanString(@"INSTALLMENT_ADDED_MESSAGE", @"%@", v9);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  [v5 setSubtitle:v8];
  [v5 setBody:v11];

  return v5;
}

- (void).cxx_destruct
{
}

@end