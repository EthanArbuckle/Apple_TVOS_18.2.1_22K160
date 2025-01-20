@interface TVSSHomeKitCameraMosaicContent
- (NSArray)cameraItems;
- (NSString)contentTitle;
- (TVSSHomeKitCameraMosaicContent)initWithCameraItems:(id)a3;
@end

@implementation TVSSHomeKitCameraMosaicContent

- (TVSSHomeKitCameraMosaicContent)initWithCameraItems:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHomeKitCameraMosaicContent;
  v8 = -[TVSSHomeKitCameraMosaicContent init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_cameraItems, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (NSString)contentTitle
{
  return (NSString *)TVSSLocString(@"TVSSHomeKitAllCamerasTitle");
}

- (NSArray)cameraItems
{
  return self->_cameraItems;
}

- (void).cxx_destruct
{
}

@end