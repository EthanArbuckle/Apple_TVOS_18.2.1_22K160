@interface TVPSharedPSAsset
- (id)description;
@end

@implementation TVPSharedPSAsset

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSharedPSAsset;
  id v2 = -[TVPAsset description](&v6, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([@"SharedPSAsset-" stringByAppendingString:v3]);

  return v4;
}

@end