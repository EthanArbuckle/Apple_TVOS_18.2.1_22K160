@interface SALCMShowChannel
- (id)_ad_OTTRequestRepresentation;
@end

@implementation SALCMShowChannel

- (id)_ad_OTTRequestRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SALCMShowChannel channel](self, "channel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ad_OTTModelRepresentation"));

  if (v3) {
    id v4 = [[STShowChannelRequest alloc] _initWithChannel:v3];
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

@end