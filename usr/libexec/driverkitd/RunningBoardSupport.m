@interface RunningBoardSupport
- (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5;
@end

@implementation RunningBoardSupport

- (id)identityForDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  return +[RBSProcessIdentity identityForDextWithServerName:tagString:containingAppBundleID:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForDextWithServerName:tagString:containingAppBundleID:",  a3,  a4,  a5);
}

@end