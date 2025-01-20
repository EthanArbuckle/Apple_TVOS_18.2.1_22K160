@interface GKChallengeIssueExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKChallengeIssueExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface challengeIssueServiceViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "challengeIssueServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface challengeIssueHostViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "challengeIssueHostViewControllerInterface");
}

@end