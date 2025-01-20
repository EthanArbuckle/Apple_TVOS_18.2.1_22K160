@interface TVHPlaceholderView
- (TVHPlaceholder)placeholder;
- (UIView)overlayView;
- (id)placeholderImage;
- (void)layoutSubviews;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation TVHPlaceholderView

- (id)placeholderImage
{
  return -[UIImageView image](self->_placeholderImageView, "image");
}

- (void)setPlaceholder:(id)a3
{
  v5 = (TVHPlaceholder *)a3;
  p_placeholder = &self->_placeholder;
  if (self->_placeholder != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_placeholder, a3);
    placeholderImageView = self->_placeholderImageView;
    if (v15)
    {
      if (!placeholderImageView)
      {
        v8 = objc_alloc_init(&OBJC_CLASS___UIImageView);
        v9 = self->_placeholderImageView;
        self->_placeholderImageView = v8;

        v10 = self->_placeholderImageView;
        if (self->_overlayView) {
          -[TVHPlaceholderView insertSubview:below:](self, "insertSubview:below:", v10);
        }
        else {
          -[TVHPlaceholderView addSubview:](self, "addSubview:", v10);
        }
      }

      v12 = self->_placeholderImageView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPlaceholder image](*p_placeholder, "image"));
      -[UIImageView setImage:](v12, "setImage:", v13);

      v14 = self->_placeholderImageView;
      v11 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHPlaceholder tintColor](*p_placeholder, "tintColor"));
      -[UIImageView setTintColor:](v14, "setTintColor:", v11);
    }

    else
    {
      -[UIImageView removeFromSuperview](placeholderImageView, "removeFromSuperview");
      v11 = self->_placeholderImageView;
      self->_placeholderImageView = 0LL;
    }

    -[TVHPlaceholderView setNeedsLayout](self, "setNeedsLayout");
    v5 = v15;
  }
}

- (void)setOverlayView:(id)a3
{
  v5 = (UIView *)a3;
  overlayView = self->_overlayView;
  v7 = v5;
  if (overlayView != v5)
  {
    if (overlayView) {
      -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (v7)
    {
      if (self->_placeholderImageView) {
        -[TVHPlaceholderView insertSubview:above:](self, "insertSubview:above:", v7);
      }
      else {
        -[TVHPlaceholderView addSubview:](self, "addSubview:", v7);
      }
    }

    -[TVHPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHPlaceholderView;
  -[TVHPlaceholderView layoutSubviews](&v14, "layoutSubviews");
  -[TVHPlaceholderView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_overlayView, "setFrame:");
  id v11 = -[UIImageView sizeThatFits:](self->_placeholderImageView, "sizeThatFits:", v8, v10);
  -[UIImageView setFrame:]( self->_placeholderImageView,  "setFrame:",  UIRectCenteredIntegralRectScale(v11, 0.0, 0.0, v12, v13, v4, v6, v8, v10, 0.0));
}

- (TVHPlaceholder)placeholder
{
  return self->_placeholder;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
}

@end