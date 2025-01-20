@interface MCPasscodeAnalytics
+ (void)sendPasscodeChangedEventWithChangeType:(int64_t)a3 oldPasscodeExists:(BOOL)a4 isClearingPasscode:(BOOL)a5 newPasscodeUnlockScreenType:(int)a6 newPasscodeSimpleType:(int)a7 passcodeRecoverySupported:(BOOL)a8 passcodeRecoveryRestricted:(BOOL)a9 recoverySkipped:(BOOL)a10 senderBundleID:(id)a11;
+ (void)sendRecoveryPasscodeClearedEventWithReason:(int64_t)a3;
@end

@implementation MCPasscodeAnalytics

+ (void)sendPasscodeChangedEventWithChangeType:(int64_t)a3 oldPasscodeExists:(BOOL)a4 isClearingPasscode:(BOOL)a5 newPasscodeUnlockScreenType:(int)a6 newPasscodeSimpleType:(int)a7 passcodeRecoverySupported:(BOOL)a8 passcodeRecoveryRestricted:(BOOL)a9 recoverySkipped:(BOOL)a10 senderBundleID:(id)a11
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000796D0;
  v13[3] = &unk_1000C4038;
  BOOL v18 = a5;
  int v16 = a6;
  int v17 = a7;
  BOOL v19 = a4;
  BOOL v20 = a9;
  BOOL v21 = a8;
  BOOL v22 = a10;
  id v14 = a11;
  int64_t v15 = a3;
  id v12 = v14;
  AnalyticsSendEventLazy(@"com.apple.managedconfiguration.passcode.changed", v13);
}

+ (void)sendRecoveryPasscodeClearedEventWithReason:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100079910;
  v3[3] = &unk_1000C4058;
  v3[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.managedconfiguration.passcode.recoveryPasscodeCleared", v3);
}

@end