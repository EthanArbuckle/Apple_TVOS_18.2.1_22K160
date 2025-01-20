@interface IDSOffGridEncryptedMessage
- (int64_t)__im__preferredServiceType;
@end

@implementation IDSOffGridEncryptedMessage

- (int64_t)__im__preferredServiceType
{
  if ((objc_opt_respondsToSelector(self, "preferredServiceType") & 1) != 0) {
    return (int64_t)-[IDSOffGridEncryptedMessage preferredServiceType](self, "preferredServiceType");
  }
  else {
    return -1LL;
  }
}

@end