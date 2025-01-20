@interface SCATControllableDevicesMenuItem
- (AXSSInterDeviceSearchResult)searchResult;
- (SCATControllableDevicesMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 searchResult:(id)a5;
- (id)_imageNameForDeviceType:(id)a3;
- (void)setSearchResult:(id)a3;
@end

@implementation SCATControllableDevicesMenuItem

- (SCATControllableDevicesMenuItem)initWithIdentifier:(id)a3 delegate:(id)a4 searchResult:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceType]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATControllableDevicesMenuItem _imageNameForDeviceType:](self, "_imageNameForDeviceType:", v12));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SCATControllableDevicesMenuItem;
  char v16 = 1;
  v14 = -[SCATModernMenuItem initWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAccess:activateHandler:updateHandler:]( &v17,  "initWithIdentifier:delegate:title:imageName:activateBehavior:allowedWithGuidedAccess:allowedWithAssistiveAcces s:activateHandler:updateHandler:",  v10,  v9,  v11,  v13,  2LL,  1LL,  v16,  0LL,  0LL);

  if (v14) {
    -[SCATControllableDevicesMenuItem setSearchResult:](v14, "setSearchResult:", v8);
  }

  return v14;
}

- (id)_imageNameForDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AXSSDeviceTypeMac])
  {
    v4 = @"SCATIcon_interdevice_mac";
  }

  else if ([v3 isEqualToString:AXSSDeviceTypePhone])
  {
    v4 = @"SCATIcon_interdevice_iphone";
  }

  else if ([v3 isEqualToString:AXSSDeviceTypePad])
  {
    v4 = @"SCATIcon_interdevice_ipad";
  }

  else if ([v3 isEqualToString:AXSSDeviceTypeAppleTV])
  {
    v4 = @"SCATIcon_interdevice_appletv";
  }

  else
  {
    v4 = @"SCATIcon_gestures_favorites";
  }

  return (id)v4;
}

- (AXSSInterDeviceSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end