@interface DAPlatform_Embedded
+ (id)sharedInstance;
- (BOOL)didSetProxyServerInformation;
- (BOOL)isCheckerBoardActive;
- (BOOL)isInBoxUpdateModeActive;
- (void)_activateCFUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7;
- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7;
@end

@implementation DAPlatform_Embedded

+ (id)sharedInstance
{
  return 0LL;
}

- (BOOL)isCheckerBoardActive
{
  return 0;
}

- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
}

- (BOOL)didSetProxyServerInformation
{
  return 0;
}

- (BOOL)isInBoxUpdateModeActive
{
  return 0;
}

- (void)_activateCFUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  v12 = (void (**)(void))a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v16,  kCFUserNotificationAlertHeaderKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v15,  kCFUserNotificationAlertMessageKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v13,  kCFUserNotificationDefaultButtonTitleKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v14,  kCFUserNotificationAlternateButtonTitleKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  kCFUserNotificationAlertTopMostKey);
  -[DAPlatform_Embedded _addPlatformCFUserNotificationOptions:](self, "_addPlatformCFUserNotificationOptions:", v17);
  v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0LL, 0LL, (CFDictionaryRef)v17);
  if (v18)
  {
    v19 = v18;
    CFOptionFlags responseFlags = 0LL;
    CFUserNotificationReceiveResponse(v18, 0.0, &responseFlags);
    CFRelease(v19);
    if (v12 && responseFlags == 1) {
      v12[2](v12);
    }
  }

  else
  {
    uint64_t v20 = DiagnosticLogHandleForCategory(5LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000190A8(v21);
    }
  }
}

@end