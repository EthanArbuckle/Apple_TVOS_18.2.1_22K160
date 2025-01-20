@interface TVSSLocationIndicatorView
- (TVSSLocationIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation TVSSLocationIndicatorView

- (TVSSLocationIndicatorView)initWithFrame:(CGRect)a3
{
  CGRect v32 = a3;
  SEL v30 = a2;
  v31 = 0LL;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVSSLocationIndicatorView;
  v31 = -[TVSSLocationIndicatorView initWithFrame:]( &v29,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    id v9 =  +[UIImageSymbolConfiguration configurationPreferringMulticolor]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMulticolor");
    id v28 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"location.circle.fill");

    v27 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v28);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v27,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSLocationIndicatorView addSubview:](v31, "addSubview:", v27);
    id v26 = -[TVSSLocationIndicatorView widthAnchor](v31, "widthAnchor");
    unsigned __int8 v3 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v4 = 22.0;
    if ((v3 & 1) == 0) {
      double v4 = 18.0;
    }
    id v25 = [v26 constraintEqualToConstant:v4];
    v33[0] = v25;
    id v24 = -[TVSSLocationIndicatorView heightAnchor](v31, "heightAnchor");
    unsigned __int8 v5 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
    double v6 = 22.0;
    if ((v5 & 1) == 0) {
      double v6 = 18.0;
    }
    id v23 = [v24 constraintEqualToConstant:v6];
    v33[1] = v23;
    id v22 = -[UIImageView leadingAnchor](v27, "leadingAnchor");
    id v21 = -[TVSSLocationIndicatorView leadingAnchor](v31, "leadingAnchor");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v33[2] = v20;
    id v19 = -[UIImageView trailingAnchor](v27, "trailingAnchor");
    id v18 = -[TVSSLocationIndicatorView trailingAnchor](v31, "trailingAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v33[3] = v17;
    id v16 = -[UIImageView topAnchor](v27, "topAnchor");
    id v15 = -[TVSSLocationIndicatorView topAnchor](v31, "topAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v33[4] = v14;
    id v13 = -[UIImageView bottomAnchor](v27, "bottomAnchor");
    id v12 = -[TVSSLocationIndicatorView bottomAnchor](v31, "bottomAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v33[5] = v11;
    v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 6LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    objc_storeStrong((id *)&v27, 0LL);
    objc_storeStrong(&v28, 0LL);
  }

  v8 = v31;
  objc_storeStrong((id *)&v31, 0LL);
  return v8;
}

@end