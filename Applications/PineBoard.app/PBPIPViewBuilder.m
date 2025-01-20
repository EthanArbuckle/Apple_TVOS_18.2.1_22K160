@interface PBPIPViewBuilder
+ (id)makePipGradientViewWithCornerRadius:(BOOL)a3;
@end

@implementation PBPIPViewBuilder

+ (id)makePipGradientViewWithCornerRadius:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc(&OBJC_CLASS___UIImageView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"pip_module_bottom_gradient"));
  v6 = -[UIImageView initWithImage:](v4, "initWithImage:", v5);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v6, "layer"));
    [v7 setCornerRadius:24.0];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v6, "layer"));
    [v8 setMasksToBounds:1];
  }

  return v6;
}

@end