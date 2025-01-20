@interface AKDevice
- (BOOL)isBuddyFinished;
@end

@implementation AKDevice

- (BOOL)isBuddyFinished
{
  if ((byte_10020F320 & 1) == 0) {
    byte_10020F320 = 1;
  }
  return 1;
}

@end