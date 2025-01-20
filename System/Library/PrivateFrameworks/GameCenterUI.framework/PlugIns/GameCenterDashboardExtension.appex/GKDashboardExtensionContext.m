@interface GKDashboardExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKDashboardExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface gameCenterServiceViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "gameCenterServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface gameCenterHostViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "gameCenterHostViewControllerInterface");
}

@end