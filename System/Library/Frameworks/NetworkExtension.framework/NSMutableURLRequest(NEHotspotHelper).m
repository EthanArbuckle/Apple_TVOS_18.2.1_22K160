@interface NSMutableURLRequest(NEHotspotHelper)
- (void)bindToHotspotHelperCommand:()NEHotspotHelper;
@end

@implementation NSMutableURLRequest(NEHotspotHelper)

- (void)bindToHotspotHelperCommand:()NEHotspotHelper
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    [a1 setBoundInterfaceIdentifier:v4];
    v4 = v5;
  }
}

@end