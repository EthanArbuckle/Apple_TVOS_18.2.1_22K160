@interface SCATModernMenuFooterView
- (SCATModernMenuFooterView)initWithFrame:(CGRect)a3;
- (UIPageControl)moreItemsPageControl;
- (void)setMoreItemsPageControl:(id)a3;
@end

@implementation SCATModernMenuFooterView

- (SCATModernMenuFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___SCATModernMenuFooterView;
  v7 = -[SCATModernMenuFooterView initWithFrame:](&v25, "initWithFrame:");
  if (v7)
  {
    v8 = -[SCATATVMenuPageControl initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATATVMenuPageControl),  "initWithFrame:",  x,  y,  width,  height);
    id v9 = sub_10002B014(@"MORE");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SCATATVMenuPageControl setScatSpeakableDescription:](v8, "setScatSpeakableDescription:", v10);

    -[SCATModernMenuFooterView setMoreItemsPageControl:](v7, "setMoreItemsPageControl:", v8);
    -[SCATModernMenuFooterView addSubview:](v7, "addSubview:", v8);
    -[SCATATVMenuPageControl setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATATVMenuPageControl topAnchor](v8, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuFooterView topAnchor](v7, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v23]);
    v26[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATATVMenuPageControl bottomAnchor](v8, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuFooterView bottomAnchor](v7, "bottomAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v20]);
    v26[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATATVMenuPageControl leadingAnchor](v8, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuFooterView leadingAnchor](v7, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13 constant:10.0]);
    v26[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATATVMenuPageControl trailingAnchor](v8, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuFooterView trailingAnchor](v7, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintEqualToAnchor:v16 constant:-10.0]);
    v26[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 4LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
  }

  return v7;
}

- (UIPageControl)moreItemsPageControl
{
  return self->_moreItemsPageControl;
}

- (void)setMoreItemsPageControl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end