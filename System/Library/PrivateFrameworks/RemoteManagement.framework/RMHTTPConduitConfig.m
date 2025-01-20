@interface RMHTTPConduitConfig
- (id)reportDetails;
@end

@implementation RMHTTPConduitConfig

- (id)reportDetails
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RMHTTPConduitConfig;
  id v2 = -[RMConduitConfig reportDetails](&v6, "reportDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 mutableCopy];

  return v4;
}

@end