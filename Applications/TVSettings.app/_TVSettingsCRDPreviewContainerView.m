@interface _TVSettingsCRDPreviewContainerView
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation _TVSettingsCRDPreviewContainerView

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVSettingsCRDPreviewContainerView;
  -[_TVSettingsCRDPreviewContainerView layoutSubviews](&v8, "layoutSubviews");
  -[_TVSettingsCRDPreviewContainerView bounds](self, "bounds");
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double MidX = CGRectGetMidX(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  -[UIView setCenter:](self->_contentView, "setCenter:", MidX, CGRectGetMidY(v10));
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_contentView != v5)
  {
    v11 = v5;
    -[UIView removeFromSuperview](v5, "removeFromSuperview");
    if (v11)
    {
      -[_TVSettingsCRDPreviewContainerView bounds](self, "bounds");
      CGFloat x = v12.origin.x;
      CGFloat y = v12.origin.y;
      CGFloat width = v12.size.width;
      CGFloat height = v12.size.height;
      double MidX = CGRectGetMidX(v12);
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      -[UIView setCenter:](v11, "setCenter:", MidX, CGRectGetMidY(v13));
      -[_TVSettingsCRDPreviewContainerView addSubview:](self, "addSubview:", v11);
    }

    objc_storeStrong((id *)&self->_contentView, a3);
    v5 = v11;
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end