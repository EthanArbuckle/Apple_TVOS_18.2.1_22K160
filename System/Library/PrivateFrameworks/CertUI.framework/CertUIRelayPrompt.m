@interface CertUIRelayPrompt
+ (id)_actualCenter;
- (BOOL)_launchSheetApp;
- (BOOL)allowCertificateTrust;
- (BOOL)isCertificateTrustRestricted;
- (BOOL)showCertificateDetails;
- (BOOL)showContinue;
- (CPDistributedMessagingDelayedReplyContext)replyContext;
- (CertUIRelayPrompt)initWithMessageInfo:(id)a3 localizedOriginatingAppName:(id)a4 replyContext:(id)a5;
- (NSString)localizedOriginatingAppName;
- (id)_copyCancelOnlyUserNotificationInfo;
- (id)_copyUserNotificationInfo;
- (id)_hostname;
- (id)_localizedUntrustedCertAcceptNotAllowedMessage;
- (id)_localizedUntrustedCertAlertMessage;
- (id)_localizedUntrustedCertAlertTitle;
- (id)_replyDictionaryWithCertUIResponse:(int)a3;
- (id)trustDigest;
- (void)_actualMessagingCenter:(id)a3 receivedReply:(id)a4 error:(id)a5 context:(void *)a6;
- (void)_invokeCompletionWithReply:(id)a3;
- (void)_receivedCancelOnlyResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)_receivedResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)_showAlert;
- (void)_showDetails;
- (void)dealloc;
- (void)setLocalizedOriginatingAppName:(id)a3;
- (void)setReplyContext:(id)a3;
- (void)showPromptWithCompletion:(id)a3;
@end

@implementation CertUIRelayPrompt

- (CertUIRelayPrompt)initWithMessageInfo:(id)a3 localizedOriginatingAppName:(id)a4 replyContext:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CertUIRelayPrompt;
  v8 = -[CertUIRelayPrompt init](&v10, "init");
  if (v8)
  {
    v8->_messageInfo = (NSDictionary *)[a3 copy];
    v8->_localizedOriginatingAppName = (NSString *)a4;
    v8->_replyContext = (CPDistributedMessagingDelayedReplyContext *)a5;
  }

  return v8;
}

- (void)dealloc
{
  id completion = self->_completion;
  if (completion) {
    _Block_release(completion);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CertUIRelayPrompt;
  -[CertUIRelayPrompt dealloc](&v4, "dealloc");
}

+ (id)_actualCenter
{
  return +[CPDistributedMessagingCenter centerNamed:]( &OBJC_CLASS___CPDistributedMessagingCenter,  "centerNamed:",  kCertUIMessagingCenterActualName);
}

- (id)_replyDictionaryWithCertUIResponse:(int)a3
{
  v3 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(void *)&a3);
  return +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v3,  kCertUITrustResponseKey);
}

- (void)_invokeCompletionWithReply:(id)a3
{
  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    _Block_release(self->_completion);
    self->_id completion = 0LL;
  }

- (BOOL)_launchSheetApp
{
  int v2 = SBSLaunchApplicationWithIdentifier(@"com.apple.TrustMe", 1LL);
  if (v2)
  {
    v3 = (os_log_s *)_CertUILogObjects[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed launching app %d", (uint8_t *)v5, 8u);
    }
  }

  return v2 == 0;
}

- (void)_actualMessagingCenter:(id)a3 receivedReply:(id)a4 error:(id)a5 context:(void *)a6
{
}

- (void)_showDetails
{
  v3 = (os_log_s *)_CertUILogObjects[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "App not available", v4, 2u);
  }

  -[CertUIRelayPrompt _invokeCompletionWithReply:](self, "_invokeCompletionWithReply:", 0LL);
}

- (void)_receivedResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  if ((a4 & 3) == 2)
  {
    -[CertUIRelayPrompt _showDetails](self, "_showDetails", a3);
  }

  else
  {
    if ((a4 & 3) == 1) {
      uint64_t v4 = 2LL;
    }
    else {
      uint64_t v4 = 0LL;
    }
    -[CertUIRelayPrompt _invokeCompletionWithReply:]( self,  "_invokeCompletionWithReply:",  -[CertUIRelayPrompt _replyDictionaryWithCertUIResponse:](self, "_replyDictionaryWithCertUIResponse:", v4));
  }

- (void)_receivedCancelOnlyResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
}

- (id)_hostname
{
  return -[NSDictionary objectForKey:](self->_messageInfo, "objectForKey:", kCertUITrustHostnameKey);
}

- (id)trustDigest
{
  return -[NSDictionary objectForKey:](self->_messageInfo, "objectForKey:", kCertUITrustDigestKey);
}

- (id)_localizedUntrustedCertAlertTitle
{
  return -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"UNTRUSTED_CERT_TITLE",  &stru_100004388,  0LL);
}

- (id)_localizedUntrustedCertAlertMessage
{
  v3 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"UNTRUSTED_CERT_MESSAGE",  &stru_100004388,  0LL);
  uint64_t v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"UNTRUSTED_CERT_MESSAGE_NO_APP_NAME",  &stru_100004388,  0LL);
  if (v3 && -[CertUIRelayPrompt localizedOriginatingAppName](self, "localizedOriginatingAppName")) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v3,  -[CertUIRelayPrompt _hostname](self, "_hostname"),  -[CertUIRelayPrompt localizedOriginatingAppName](self, "localizedOriginatingAppName"));
  }
  if (!v4) {
    return 0LL;
  }
  v6 = (os_log_s *)_CertUILogObjects[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Untrusted certificate alert is being shown but no localized app name has been retrieved from the audit token.",  buf,  2u);
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v4,  -[CertUIRelayPrompt _hostname](self, "_hostname"),  v7);
}

- (id)_localizedUntrustedCertAcceptNotAllowedMessage
{
  v3 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"UNTRUSTED_CERT_MESSAGE_NO_ACCEPT",  &stru_100004388,  0LL);
  uint64_t v4 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"UNTRUSTED_CERT_MESSAGE_NO_ACCEPT_NO_APP_NAME",  &stru_100004388,  0LL);
  if (v3 && -[CertUIRelayPrompt localizedOriginatingAppName](self, "localizedOriginatingAppName")) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v3,  -[CertUIRelayPrompt _hostname](self, "_hostname"),  -[CertUIRelayPrompt localizedOriginatingAppName](self, "localizedOriginatingAppName"));
  }
  if (!v4) {
    return 0LL;
  }
  v6 = (os_log_s *)_CertUILogObjects[1];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Untrusted certificate alert is being shown but no localized app name has been retrieved from the audit token.",  buf,  2u);
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v4,  -[CertUIRelayPrompt _hostname](self, "_hostname"),  v7);
}

- (BOOL)isCertificateTrustRestricted
{
  id v2 = +[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection");
  return [v2 effectiveBoolValueForSetting:MCFeatureUntrustedTLSPromptAllowed] == 2;
}

- (BOOL)allowCertificateTrust
{
  id v3 = -[NSDictionary objectForKey:](self->_messageInfo, "objectForKey:", kCertUITrustAllowCertificateTrustKey);
  if (-[CertUIRelayPrompt isCertificateTrustRestricted](self, "isCertificateTrustRestricted")) {
    return 0;
  }
  if (v3) {
    return [v3 BOOLValue];
  }
  return 1;
}

- (BOOL)showContinue
{
  unsigned int v3 = -[CertUIRelayPrompt allowCertificateTrust](self, "allowCertificateTrust");
  if (v3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_messageInfo, "objectForKey:", kCertUITrustShowContinueKey);
    if (v4) {
      LOBYTE(v3) = [v4 BOOLValue];
    }
    else {
      LOBYTE(v3) = 1;
    }
  }

  return v3;
}

- (BOOL)showCertificateDetails
{
  return 0;
}

- (id)_copyUserNotificationInfo
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v4 = -[NSMutableDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  SBUserNotificationAllowInSetupKey,  &__kCFBooleanTrue,  SBUserNotificationDismissOnLock,  &__kCFBooleanTrue,  SBUserNotificationDontDismissOnUnlock,  &__kCFBooleanTrue,  SBUserNotificationPendWhileKeyBagLockedKey,  0LL);
  id v5 = -[CertUIRelayPrompt _localizedUntrustedCertAlertTitle](self, "_localizedUntrustedCertAlertTitle");
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, kCFUserNotificationAlertHeaderKey);
  }
  v6 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"CANCEL",  &stru_100004388,  0LL);
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, kCFUserNotificationDefaultButtonTitleKey);
  }
  uint64_t v7 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"CONTINUE",  &stru_100004388,  0LL);
  if (-[CertUIRelayPrompt showContinue](self, "showContinue") && v7) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, kCFUserNotificationAlternateButtonTitleKey);
  }
  v8 = -[NSBundle localizedStringForKey:value:table:]( +[NSBundle bundleWithIdentifier:](&OBJC_CLASS___NSBundle, "bundleWithIdentifier:", @"com.apple.CertUI"),  "localizedStringForKey:value:table:",  @"DETAILS",  &stru_100004388,  0LL);
  if (-[CertUIRelayPrompt showCertificateDetails](self, "showCertificateDetails") && v8) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, kCFUserNotificationOtherButtonTitleKey);
  }
  if (-[CertUIRelayPrompt allowCertificateTrust](self, "allowCertificateTrust")) {
    id v9 = -[CertUIRelayPrompt _localizedUntrustedCertAlertMessage](self, "_localizedUntrustedCertAlertMessage");
  }
  else {
    id v9 = -[CertUIRelayPrompt _localizedUntrustedCertAcceptNotAllowedMessage]( self,  "_localizedUntrustedCertAcceptNotAllowedMessage");
  }
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, kCFUserNotificationAlertMessageKey);
  }
  return v4;
}

- (id)_copyCancelOnlyUserNotificationInfo
{
  unsigned int v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v4 = -[NSMutableDictionary initWithObjectsAndKeys:]( v3,  "initWithObjectsAndKeys:",  SBUserNotificationAllowInSetupKey,  &__kCFBooleanTrue,  SBUserNotificationDismissOnLock,  &__kCFBooleanTrue,  SBUserNotificationDontDismissOnUnlock,  &__kCFBooleanTrue,  SBUserNotificationPendWhileKeyBagLockedKey,  0LL);
  id v5 = -[CertUIRelayPrompt _localizedUntrustedCertAlertTitle](self, "_localizedUntrustedCertAlertTitle");
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, kCFUserNotificationAlertHeaderKey);
  }
  id v6 = -[CertUIRelayPrompt _localizedUntrustedCertAcceptNotAllowedMessage]( self,  "_localizedUntrustedCertAcceptNotAllowedMessage");
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, kCFUserNotificationAlertMessageKey);
  }
  return v4;
}

- (void)_showAlert
{
  if (-[CertUIRelayPrompt isCertificateTrustRestricted](self, "isCertificateTrustRestricted"))
  {
    id v3 = -[CertUIRelayPrompt _copyCancelOnlyUserNotificationInfo](self, "_copyCancelOnlyUserNotificationInfo");
    id v4 = &selRef__receivedCancelOnlyResponseForNotification_responseFlags_;
  }

  else
  {
    id v3 = -[CertUIRelayPrompt _copyUserNotificationInfo](self, "_copyUserNotificationInfo");
    id v4 = &selRef__receivedResponseForNotification_responseFlags_;
  }

  id v5 = v3;
  sub_10000244C((const __CFDictionary *)v3, self, (uint64_t)*v4);
}

- (void)showPromptWithCompletion:(id)a3
{
  self->_id completion = _Block_copy(a3);
  -[CertUIRelayPrompt _showAlert](self, "_showAlert");
}

- (CPDistributedMessagingDelayedReplyContext)replyContext
{
  return self->_replyContext;
}

- (void)setReplyContext:(id)a3
{
}

- (NSString)localizedOriginatingAppName
{
  return self->_localizedOriginatingAppName;
}

- (void)setLocalizedOriginatingAppName:(id)a3
{
}

@end