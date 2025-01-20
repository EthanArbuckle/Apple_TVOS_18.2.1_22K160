@interface TVMusicBlurDecorator
+ (id)blurDecoratorForDataIsPrivate;
- (TVMusicBlurDecorator)initWithOverlayImage:(id)a3;
- (UIImage)overlayImage;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)decoratorIdentifier;
@end

@implementation TVMusicBlurDecorator

+ (id)blurDecoratorForDataIsPrivate
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"social_hidden"));
  id v4 = [v2 initWithOverlayImage:v3];

  return v4;
}

- (TVMusicBlurDecorator)initWithOverlayImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicBlurDecorator;
  v6 = -[TVMusicBlurDecorator init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_overlayImage, a3);
  }

  return v7;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 scale];
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  -2LL));
  [v11 setBlurRadius:v10 + v10];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uiImage]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 _applyBackdropViewSettings:v11]);
  double y = CGPointZero.y;
  [v12 size];
  double width = v48.width;
  double height = v48.height;
  UIGraphicsBeginImageContext(v48);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v49.origin.CGFloat x = CGPointZero.x;
  v49.origin.double y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  CGRect v50 = CGRectInset(v49, -2.0, -2.0);
  CGFloat x = v50.origin.x;
  CGFloat v19 = v50.origin.y;
  CGFloat v20 = v50.size.width;
  CGFloat v21 = v50.size.height;
  objc_msgSend(v13, "drawInRect:");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.8));
  [v22 setFill];

  v51.origin.CGFloat x = x;
  v51.origin.double y = v19;
  v51.size.double width = v20;
  v51.size.double height = v21;
  CGContextFillRect(CurrentContext, v51);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurDecorator overlayImage](self, "overlayImage"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurDecorator overlayImage](self, "overlayImage"));
    [v24 size];
    double v26 = v25;
    double v28 = v27;

    double v30 = UIRectCenteredIntegralRect(v29, CGPointZero.x, y, v26, v28, CGPointZero.x, y, width, height);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurDecorator overlayImage](self, "overlayImage"));
    objc_msgSend(v37, "drawInRect:", v30, v32, v34, v36);
  }

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v39 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

  UIGraphicsEndImageContext();
  id v40 = objc_alloc(&OBJC_CLASS___TVImage);
  id v41 = v39;
  id v42 = objc_msgSend(v40, "initWithCGImageRef:preserveAlpha:", objc_msgSend(v41, "CGImage"), 1);
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___TVMusicBlurDecorator;
  id v43 = -[TVMusicBlurDecorator decorate:scaledWithSize:croppedToFit:]( &v47,  "decorate:scaledWithSize:croppedToFit:",  v42,  v5,  a4.width,  a4.height);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

  return v44;
}

- (id)decoratorIdentifier
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicBlurDecorator;
  id v3 = -[TVMusicBlurDecorator decoratorIdentifier](&v10, "decoratorIdentifier");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBlurDecorator overlayImage](self, "overlayImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 hash]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-blur-%@", v4, v7));

  return v8;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (void).cxx_destruct
{
}

@end