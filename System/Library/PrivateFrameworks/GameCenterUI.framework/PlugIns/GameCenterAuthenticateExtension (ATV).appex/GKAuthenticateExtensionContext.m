@interface GKAuthenticateExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation GKAuthenticateExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface signInServiceViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "signInServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface remoteSignInViewControllerInterface]( &OBJC_CLASS___GKViewServiceInterface,  "remoteSignInViewControllerInterface");
}

@end