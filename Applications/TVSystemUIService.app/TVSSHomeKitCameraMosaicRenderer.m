@interface TVSSHomeKitCameraMosaicRenderer
+ (id)rendererForCameraItems:(id)a3;
- (CGSize)contentSizeForLayoutEnvironment:(id)a3;
- (TVSSCameraMosaicView)mosaicView;
- (void)configureContentView:(id)a3;
- (void)setMosaicView:(id)a3;
@end

@implementation TVSSHomeKitCameraMosaicRenderer

+ (id)rendererForCameraItems:(id)a3
{
  Class v9 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc(v9);
  v3 = objc_alloc(&OBJC_CLASS___TVSSHomeKitCameraMosaicContent);
  v6 = -[TVSSHomeKitCameraMosaicContent initWithCameraItems:](v3, "initWithCameraItems:", location[0]);
  id v7 = objc_msgSend(v5, "initWithIdentifier:format:content:overrideStylings:", @"CameraMosaic", 1);

  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)configureContentView:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v11.receiver = v13;
  v11.super_class = (Class)&OBJC_CLASS___TVSSHomeKitCameraMosaicRenderer;
  -[TVSSHomeKitCameraMosaicRenderer configureContentView:](&v11, "configureContentView:", location[0]);
  id v10 = -[TVSSHomeKitCameraMosaicRenderer content](v13, "content");
  id v9 = [v10 cameraItems];
  v3 = objc_alloc(&OBJC_CLASS___TVSSCameraMosaicView);
  v8 = -[TVSSCameraMosaicView initWithCameraItems:](v3, "initWithCameraItems:", v9);
  -[TVSSCameraMosaicView setCentered:](v8, "setCentered:", 1LL);
  [location[0] bounds];
  -[TVSSCameraMosaicView setFrame:](v8, "setFrame:", v4, v5, v6, v7);
  -[TVSSHomeKitCameraMosaicRenderer setMosaicView:](v13, "setMosaicView:", v8);
  [location[0] addSubview:v8];
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (CGSize)contentSizeForLayoutEnvironment:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_100138AAC();
  double v8 = v3;
  double v9 = v4;
  objc_storeStrong(location, 0LL);
  double v5 = v8;
  double v6 = v9;
  result.height = v6;
  result.width = v5;
  return result;
}

- (TVSSCameraMosaicView)mosaicView
{
  return self->_mosaicView;
}

- (void)setMosaicView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end