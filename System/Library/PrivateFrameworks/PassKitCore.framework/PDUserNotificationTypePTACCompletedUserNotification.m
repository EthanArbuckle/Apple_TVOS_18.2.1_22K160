@interface PDUserNotificationTypePTACCompletedUserNotification
- (PDUserNotificationTypePTACCompletedUserNotification)initWithApplicationIdentifier:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDUserNotificationTypePTACCompletedUserNotification

- (PDUserNotificationTypePTACCompletedUserNotification)initWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PKLocalizedFeatureString(@"APPLICATION_PATH_TO_OFFER_COMPLETED_TITLE", 2LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = PKLocalizedFeatureString(@"APPLICATION_PATH_TO_OFFER_COMPLETED_MESSAGE", 2LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PDUserNotificationTypePTACCompletedUserNotification;
  v9 = -[PDGenericUserNotification initWithTitle:message:](&v17, "initWithTitle:message:", v6, v8);
  v10 = v9;
  if (v9)
  {
    -[PDUserNotification setSuppressionBehavior:](v9, "setSuppressionBehavior:", 0LL);
    uint64_t v11 = PKURLActionSetup;
    uint64_t v12 = PKURLActionFeature;
    uint64_t v13 = PKFeatureIdentifierToString(2LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@",  v11,  v12,  v14));
    -[PDUserNotification setCustomActionRoute:](v10, "setCustomActionRoute:", v15);

    -[PDUserNotification setNotificationIdentifier:](v10, "setNotificationIdentifier:", v4);
  }

  return v10;
}

- (unint64_t)notificationType
{
  return 45LL;
}

@end