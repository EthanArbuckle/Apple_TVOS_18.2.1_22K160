@interface LACDTONotificationFactory
- (id)_securityDelayEndedNotificationWithIdentifier:(id)a3 body:(id)a4 callbackURL:(id)a5 after:(double)a6 maxAge:(double)a7;
- (id)newSecurityDelayRequiredNotification;
- (id)securityDelayEndedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5;
@end

@implementation LACDTONotificationFactory

- (id)newSecurityDelayRequiredNotification
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACUNMutableNotification);
  -[LACUNMutableNotification setIdentifier:]( v2,  "setIdentifier:",  @"com.apple.coreauthd.notifications.newSecurityDelayRequired");
  -[LACUNMutableNotification setCategoryIdentifier:]( v2,  "setCategoryIdentifier:",  @"com.apple.coreauthd.notifications.category.securityDelay.required");
  -[LACUNMutableNotification setShouldDisplayActionsInline:](v2, "setShouldDisplayActionsInline:", 1LL);
  -[LACUNMutableNotification setTitle:](v2, "setTitle:", @"NEW_SECURITY_DELAY_REQUIRED_TITLE");
  -[LACUNMutableNotification setIsTitleLocalized:](v2, "setIsTitleLocalized:", 0LL);
  -[LACUNMutableNotification setBody:](v2, "setBody:", @"NEW_SECURITY_DELAY_REQUIRED_BODY");
  -[LACUNMutableNotification setIsBodyLocalized:](v2, "setIsBodyLocalized:", 0LL);
  -[LACUNMutableNotification setIsTimeSensitive:](v2, "setIsTimeSensitive:", 1LL);
  -[LACUNMutableNotification setSystemIconName:](v2, "setSystemIconName:", @"lock.fill");
  return v2;
}

- (id)securityDelayEndedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [v8 callbackReason];
  v10 = (void *)v9;
  if (v9) {
    v11 = (const __CFString *)v9;
  }
  else {
    v11 = &stru_18A36E1E8;
  }
  v12 = +[LACLocalization dtoSecurityDelayEndedText:duration:]( &OBJC_CLASS___LACLocalization,  "dtoSecurityDelayEndedText:duration:",  v11,  a5 - a4);
  [v8 identifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 callbackURL];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[LACDTONotificationFactory _securityDelayEndedNotificationWithIdentifier:body:callbackURL:after:maxAge:]( self,  "_securityDelayEndedNotificationWithIdentifier:body:callbackURL:after:maxAge:",  v13,  v12,  v14,  a4,  -1.0);
  return v15;
}

- (id)_securityDelayEndedNotificationWithIdentifier:(id)a3 body:(id)a4 callbackURL:(id)a5 after:(double)a6 maxAge:(double)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(&OBJC_CLASS___LACUNMutableNotification);
  -[LACUNMutableNotification setIdentifier:](v14, "setIdentifier:", v13);

  -[LACUNMutableNotification setCategoryIdentifier:]( v14,  "setCategoryIdentifier:",  @"com.apple.coreauthd.notifications.category.securityDelay.ended");
  -[LACUNMutableNotification setTitle:](v14, "setTitle:", @"SECURITY_DELAY_ENDED");
  -[LACUNMutableNotification setIsTitleLocalized:](v14, "setIsTitleLocalized:", 0LL);
  -[LACUNMutableNotification setBody:](v14, "setBody:", v12);

  -[LACUNMutableNotification setIsBodyLocalized:](v14, "setIsBodyLocalized:", 1LL);
  -[LACUNMutableNotification setDefaultActionURL:](v14, "setDefaultActionURL:", v11);

  -[LACUNMutableNotification setIsTimeSensitive:](v14, "setIsTimeSensitive:", 1LL);
  -[LACUNMutableNotification setSystemIconName:](v14, "setSystemIconName:", @"lock.open.fill");
  -[LACUNMutableNotification setTriggerInterval:](v14, "setTriggerInterval:", a6);
  if (a7 > 0.0 && a7 != -1.0) {
    -[LACUNMutableNotification setWithdrawInterval:](v14, "setWithdrawInterval:", fmax(a7, 60.0));
  }
  return v14;
}

@end