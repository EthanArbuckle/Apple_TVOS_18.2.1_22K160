@interface INUnregistrationRequest
+ (Class)responseClass;
- (id)urlString;
@end

@implementation INUnregistrationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AAResponse, a2);
}

- (id)urlString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AAURLConfiguration urlConfiguration](&OBJC_CLASS___AAURLConfiguration, "urlConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 unregisterDeviceURL]);

  return v3;
}

@end