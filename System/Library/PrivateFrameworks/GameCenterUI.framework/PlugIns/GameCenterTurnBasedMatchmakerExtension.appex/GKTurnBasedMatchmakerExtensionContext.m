@interface GKTurnBasedMatchmakerExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKTurnBasedMatchmakerExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface turnBasedServiceViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "turnBasedServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface turnBasedHostViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "turnBasedHostViewControllerInterface");
}

@end