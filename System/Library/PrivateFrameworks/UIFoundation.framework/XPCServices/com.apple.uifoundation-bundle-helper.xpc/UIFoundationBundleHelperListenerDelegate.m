@interface UIFoundationBundleHelperListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation UIFoundationBundleHelperListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFoundationBundleHelper XPCInterface](&OBJC_CLASS___UIFoundationBundleHelper, "XPCInterface"));
  [v4 setExportedInterface:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFoundationBundleHelper bundleHelper](&OBJC_CLASS___UIFoundationBundleHelper, "bundleHelper"));
  [v4 setExportedObject:v6];

  [v4 resume];
  return 1;
}

@end