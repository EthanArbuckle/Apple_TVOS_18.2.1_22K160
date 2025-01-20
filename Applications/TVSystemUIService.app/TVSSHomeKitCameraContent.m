@interface TVSSHomeKitCameraContent
- (HFCameraItem)cameraItem;
- (NSString)contentTitle;
- (TVSSHomeKitCameraContent)initWithCameraItem:(id)a3;
@end

@implementation TVSSHomeKitCameraContent

- (TVSSHomeKitCameraContent)initWithCameraItem:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHomeKitCameraContent;
  v8 = -[TVSSHomeKitCameraContent init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_cameraItem, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (NSString)contentTitle
{
  v5 = -[TVSSHomeKitCameraContent cameraItem](self, "cameraItem");
  id v4 = -[HFCameraItem profile](v5, "profile");
  id v3 = [v4 accessory];
  id v6 = [v3 name];

  return (NSString *)v6;
}

- (HFCameraItem)cameraItem
{
  return self->_cameraItem;
}

- (void).cxx_destruct
{
}

@end