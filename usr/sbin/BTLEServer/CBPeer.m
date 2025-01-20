@interface CBPeer
- (id)msgIdentifier;
@end

@implementation CBPeer

- (id)msgIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeer identifier](self, "identifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);
  CFUUIDRef v4 = CFUUIDCreateFromString(kCFAllocatorDefault, v3);

  return (id)CFAutorelease(v4);
}

@end