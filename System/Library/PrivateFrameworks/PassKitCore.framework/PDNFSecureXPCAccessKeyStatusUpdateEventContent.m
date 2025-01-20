@interface PDNFSecureXPCAccessKeyStatusUpdateEventContent
- (id)aliro;
@end

@implementation PDNFSecureXPCAccessKeyStatusUpdateEventContent

- (id)aliro
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0) {
    v4 = self;
  }
  else {
    v4 = 0LL;
  }
  return v4;
}

@end