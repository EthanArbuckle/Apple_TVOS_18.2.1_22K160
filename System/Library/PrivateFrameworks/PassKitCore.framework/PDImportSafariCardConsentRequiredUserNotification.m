@interface PDImportSafariCardConsentRequiredUserNotification
- (PDImportSafariCardConsentRequiredUserNotification)init;
- (unint64_t)notificationType;
@end

@implementation PDImportSafariCardConsentRequiredUserNotification

- (PDImportSafariCardConsentRequiredUserNotification)init
{
  uint64_t v3 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_BANNER_BODY");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PDImportSafariCardConsentRequiredUserNotification;
  v5 = -[PDGenericUserNotification initWithMessage:](&v7, "initWithMessage:", v4);

  if (v5) {
    -[PDUserNotification setCustomActionRoute:]( v5,  "setCustomActionRoute:",  PKUserNotificationActionRouteImportSafariCardConsent);
  }
  return v5;
}

- (unint64_t)notificationType
{
  return 58LL;
}

@end