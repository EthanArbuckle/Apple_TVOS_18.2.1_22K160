@interface DTODeviceInfoProvider
- (BOOL)hasBeenUnlockedSinceBoot;
- (BOOL)hasBiometricEnrollmentsForCurrentUser;
- (BOOL)hasBiometricEnrollmentsForUser:(unsigned int)a3;
- (BOOL)hasCompletedSetup;
- (BOOL)hasPasscodeSetForCurrentUser;
- (BOOL)hasPasscodeSetForUser:(unsigned int)a3;
- (BOOL)isPhone;
- (id)serialNumber;
@end

@implementation DTODeviceInfoProvider

- (BOOL)hasBiometricEnrollmentsForCurrentUser
{
  uint64_t v3 = geteuid();
  return -[DTODeviceInfoProvider hasBiometricEnrollmentsForUser:](self, "hasBiometricEnrollmentsForUser:", v3);
}

- (BOOL)hasBiometricEnrollmentsForUser:(unsigned int)a3
{
  return 0;
}

- (id)serialNumber
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[LACMobileGestalt serialNumber](&OBJC_CLASS___LACMobileGestalt, "serialNumber"));
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &stru_100031490;
  }
  v4 = v2;

  return v4;
}

- (BOOL)hasPasscodeSetForCurrentUser
{
  uint64_t v3 = geteuid();
  return -[DTODeviceInfoProvider hasPasscodeSetForUser:](self, "hasPasscodeSetForUser:", v3);
}

- (BOOL)hasPasscodeSetForUser:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](&OBJC_CLASS___LAPasscodeHelper, "sharedInstance"));
  LOBYTE(v3) = [v4 isPasscodeSetForUser:v3 error:0];

  return v3;
}

- (BOOL)isPhone
{
  return +[LACMobileGestalt isIdiomPhone](&OBJC_CLASS___LACMobileGestalt, "isIdiomPhone");
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  return 0;
}

- (BOOL)hasCompletedSetup
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LACSetUpStateProvider sharedInstance](&OBJC_CLASS___LACSetUpStateProvider, "sharedInstance"));
  unsigned __int8 v3 = [v2 hasCompletedSetup];

  return v3;
}

@end