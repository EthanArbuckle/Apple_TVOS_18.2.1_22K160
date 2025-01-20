@interface CSAssetControllerFactory
+ (id)defaultController;
@end

@implementation CSAssetControllerFactory

+ (id)defaultController
{
  return +[CSAssetController sharedController](&OBJC_CLASS___CSAssetController, "sharedController");
}

@end