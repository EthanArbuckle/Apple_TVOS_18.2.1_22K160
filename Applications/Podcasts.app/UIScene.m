@interface UIScene
+ (id)isMainWindowSceneSessionKey;
@end

@implementation UIScene

+ (id)isMainWindowSceneSessionKey
{
  return String._bridgeToObjectiveC()();
}

@end