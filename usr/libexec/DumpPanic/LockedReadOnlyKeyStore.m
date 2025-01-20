@interface LockedReadOnlyKeyStore
- (BOOL)unlock;
@end

@implementation LockedReadOnlyKeyStore

- (BOOL)unlock
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LockedReadOnlyKeyStore;
  return -[ReadOnlyKeyStore unlock](&v3, "unlock");
}

@end