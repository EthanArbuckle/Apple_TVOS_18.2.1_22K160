@interface MCNewPasswordPolicyPayloadHandler
- (BOOL)isInstalled;
@end

@implementation MCNewPasswordPolicyPayloadHandler

- (BOOL)isInstalled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  BOOL v3 = +[MCRestrictionManagerWriter restrictionsAlreadyInstalledFromPayload:]( &OBJC_CLASS___MCRestrictionManagerWriter,  "restrictionsAlreadyInstalledFromPayload:",  v2);

  return v3;
}

@end