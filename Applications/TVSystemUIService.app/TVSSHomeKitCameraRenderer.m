@interface TVSSHomeKitCameraRenderer
+ (id)rendererForCamera:(id)a3;
- (BOOL)shouldStartStreamOnDisplay;
- (CGSize)contentSizeForLayoutEnvironment:(id)a3;
- (TVHMCameraContentView)cameraView;
- (void)_configureCameraViewIfNeeded;
- (void)configureContentView:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setShouldStartStreamOnDisplay:(BOOL)a3;
@end

@implementation TVSSHomeKitCameraRenderer

+ (id)rendererForCamera:(id)a3
{
  Class v12 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc(v12);
  id v9 = [location[0] homeKitObject];
  id v8 = [v9 uniqueIdentifier];
  id v7 = [v8 UUIDString];
  v3 = objc_alloc(&OBJC_CLASS___TVSSHomeKitCameraContent);
  v6 = -[TVSSHomeKitCameraContent initWithCameraItem:](v3, "initWithCameraItem:", location[0]);
  id v10 = objc_msgSend(v5, "initWithIdentifier:format:content:overrideStylings:", v7, 1);

  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)configureContentView:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)&OBJC_CLASS___TVSSHomeKitCameraRenderer;
  -[TVSSHomeKitCameraRenderer configureContentView:](&v18, "configureContentView:", location[0]);
  id v17 = -[TVSSHomeKitCameraRenderer content](v20, "content");
  id v16 = [v17 cameraItem];
  id v15 = [v16 profile];
  id v8 = objc_alloc(&OBJC_CLASS___TVHMCameraContentView);
  [location[0] frame];
  id v14 = -[TVHMCameraContentView initWithFrame:](v8, "initWithFrame:", v3, v4, v5, v6);
  [v14 setCameraProfile:v15];
  id v10 = [v16 homeKitObject];
  id v9 = [v10 uniqueIdentifier];
  objc_msgSend(v14, "setHfIdentifier:");

  -[TVSSHomeKitCameraRenderer setCameraView:](v20, "setCameraView:", v14);
  v11 = -[TVSSHomeKitCameraRenderer cameraView](v20, "cameraView");
  -[TVHMCameraContentView setSize:](v11, "setSize:", 1LL);

  v13 = -[TVSSHomeKitCameraRenderer cameraView](v20, "cameraView");
  id v12 = +[TVHMCameraContentViewStyle previewStyle](&OBJC_CLASS___TVHMCameraContentViewStyle, "previewStyle");
  -[TVHMCameraContentView applyStyle:](v13, "applyStyle:");

  [location[0] addSubview:v14];
  if (-[TVSSHomeKitCameraRenderer shouldStartStreamOnDisplay](v20, "shouldStartStreamOnDisplay"))
  {
    id v7 = -[TVSSHomeKitCameraRenderer cameraView](v20, "cameraView");
    -[TVHMCameraContentView setCentered:](v7, "setCentered:", 1LL);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
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

- (void)_configureCameraViewIfNeeded
{
  id v17 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
  id v16 = -[TVHMCameraContentView superview](v17, "superview");
  id v2 = -[TVSSHomeKitCameraRenderer contentView](self, "contentView");
  BOOL v18 = v16 == v2;

  if (!v18)
  {
    id v7 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    -[TVHMCameraContentView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);

    double v8 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    -[TVHMCameraContentView setSize:](v8, "setSize:", 1LL);

    double v9 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    -[TVHMCameraContentView setCentered:](v9, "setCentered:", 1LL);

    v11 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    id v10 = +[TVHMCameraContentViewStyle previewStyle](&OBJC_CLASS___TVHMCameraContentViewStyle, "previewStyle");
    -[TVHMCameraContentView applyStyle:](v11, "applyStyle:");

    id v13 = -[TVSSHomeKitCameraRenderer contentView](self, "contentView");
    [v13 frame];
    double v19 = v3;
    double v20 = v4;
    double v21 = v5;
    double v22 = v6;
    id v12 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    -[TVHMCameraContentView setFrame:](v12, "setFrame:", v19, v20, v21, v22);

    id v15 = -[TVSSHomeKitCameraRenderer contentView](self, "contentView");
    id v14 = -[TVSSHomeKitCameraRenderer cameraView](self, "cameraView");
    objc_msgSend(v15, "addSubview:");
  }

- (TVHMCameraContentView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
}

- (BOOL)shouldStartStreamOnDisplay
{
  return self->_shouldStartStreamOnDisplay;
}

- (void)setShouldStartStreamOnDisplay:(BOOL)a3
{
  self->_shouldStartStreamOnDisplay = a3;
}

- (void).cxx_destruct
{
}

@end