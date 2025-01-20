@interface ASVSAccountStoreWrapper
+ (NSString)accountStoreDidChange;
@end

@implementation ASVSAccountStoreWrapper

+ (NSString)accountStoreDidChange
{
  return (NSString *)VSAccountStoreDidChangeNotification;
}

@end