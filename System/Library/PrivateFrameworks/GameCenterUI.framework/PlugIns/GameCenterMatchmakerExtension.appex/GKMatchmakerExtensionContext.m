@interface GKMatchmakerExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKMatchmakerExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface matchmakerServiceViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "matchmakerServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface matchmakerHostViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "matchmakerHostViewControllerInterface");
}

@end