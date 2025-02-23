@interface IDSDependencyProvider
+ (id)messageDeliveryFactory;
@end

@implementation IDSDependencyProvider

+ (id)messageDeliveryFactory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 registeredObjectForProtocol:&OBJC_PROTOCOL___IDSMessageDeliveryFactory]);
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[IDSMessageDeliveryFactory sharedFactory](&OBJC_CLASS___IDSMessageDeliveryFactory, "sharedFactory"));
  }
  v5 = v4;

  return v5;
}

@end