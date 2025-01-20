@interface TVTableViewCell
- (BOOL)allowsFocus;
- (BOOL)canBecomeFocused;
- (BOOL)rendersImageAsTemplates;
- (TVImageProxy)imageProxy;
- (TVTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)_imageTintColor;
- (UIColor)selectedBackgroundColor;
- (UIImage)placeholderImage;
- (double)_imageViewWidth;
- (double)_textLabelWidthWithXPosition:(double)a3 currentWidth:(double)a4;
- (id)labelForMarquee;
- (void)_setImageTintColor:(id)a3;
- (void)_setImageViewWidth:(double)a3;
- (void)_updateImage;
- (void)addSubview:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageProxy:(id)a3 completion:(id)a4;
- (void)setPlaceholderImage:(id)a3;
- (void)setRendersImageAsTemplates:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedBackgroundColor:(id)a3;
@end

@implementation TVTableViewCell

- (TVTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  v4 = -[TVTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", 3LL, a4);
  v5 = v4;
  if (v4)
  {
    v4->_allowsFocus = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](v4, "imageView"));
    [v6 setClipsToBounds:1];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](v5, "imageView"));
    [v7 setContentMode:1];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](v5, "contentView"));
    [v8 _setContinuousCornerRadius:12.0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutEmphasizedFont](&OBJC_CLASS___TVThemeManager, "calloutEmphasizedFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell textLabel](v5, "textLabel"));
    [v10 setFont:v9];
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  -[TVTableViewCell dealloc](&v3, "dealloc");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  -[TVTableViewCell prepareForReuse](&v6, "prepareForReuse");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell labelForMarquee](self, "labelForMarquee"));
  [v3 setMarqueeEnabled:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell labelForMarquee](self, "labelForMarquee"));
  [v4 setMarqueeRunning:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell labelForMarquee](self, "labelForMarquee"));
  [v5 setLineBreakMode:4];
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  -[TVTableViewCell addSubview:](&v9, "addSubview:", v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS____UIFloatingContentView, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v8 = v4;
    [v8 setContinuousCornerEnabled:1];
    [v8 setCornerRadius:12.0];
  }
}

- (BOOL)canBecomeFocused
{
  if ((-[TVTableViewCell isHidden](self, "isHidden") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
    BOOL v3 = -[TVTableViewCell canBecomeFocused](&v5, "canBecomeFocused");
    if (v3) {
      LOBYTE(v3) = self->_allowsFocus;
    }
  }

  return v3;
}

- (id)labelForMarquee
{
  return 0LL;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[TVTableViewCell _updateImage](self, "_updateImage");
    objc_super v5 = v6;
  }
}

- (void)setImageProxy:(id)a3
{
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
  v7 = (TVImageProxy *)a3;
  id v8 = a4;
  p_imageProxy = &self->_imageProxy;
  imageProxy = self->_imageProxy;
  if (imageProxy != v7)
  {
    if (imageProxy)
    {
      -[TVImageProxy cancel](imageProxy, "cancel");
      backingImage = self->_backingImage;
      if (backingImage)
      {
        self->_backingImage = 0LL;

        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
        [v12 setImage:0];

        -[TVTableViewCell _updateImage](self, "_updateImage");
      }
    }

    objc_storeStrong((id *)&self->_imageProxy, a3);
    if (*p_imageProxy)
    {
      -[TVImageProxy setCacheOnLoad:](*p_imageProxy, "setCacheOnLoad:", 1LL);
      objc_initWeak(&location, *p_imageProxy);
      objc_initWeak(&from, self);
      v13 = *p_imageProxy;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_1000804C4;
      v16[3] = &unk_10026BDD8;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      id v17 = v8;
      -[TVImageProxy setCompletionHandler:](v13, "setCompletionHandler:", v16);
      -[TVImageProxy load](*p_imageProxy, "load");

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }

    else if (v8)
    {
      if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
      {
        (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
      }

      else
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100080718;
        v14[3] = &unk_100268D60;
        id v15 = v8;
        dispatch_async(&_dispatch_main_q, v14);
      }
    }
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  -[TVTableViewCell setSelected:animated:](&v9, "setSelected:animated:", a3, a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell selectedBackgroundColor](self, "selectedBackgroundColor"));

  if (v6)
  {
    if (v4 && (-[TVTableViewCell isFocused](self, "isFocused") & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell selectedBackgroundColor](self, "selectedBackgroundColor"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](self, "contentView"));
      [v8 setBackgroundColor:v7];
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](self, "contentView"));
      [v7 setBackgroundColor:0];
    }
  }

- (void)layoutSubviews
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 image]);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
  uint64_t v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](self, "contentView"));
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) != 0) {
      goto LABEL_6;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
    [v6 addSubview:v10];
  }

  else
  {
    [v5 removeFromSuperview];
  }

LABEL_6:
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___TVTableViewCell;
  -[TVTableViewCell layoutSubviews](&v50, "layoutSubviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 image]);
  if (!v12)
  {
LABEL_10:

    return;
  }

  v13 = (void *)v12;
  -[TVTableViewCell _imageViewWidth](self, "_imageViewWidth");
  double v15 = v14;

  if (v15 > 0.0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    -[TVTableViewCell _imageViewWidth](self, "_imageViewWidth");
    double v26 = v25 - v22;
    if (v25 - v22 != 0.0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
      objc_msgSend(v27, "setFrame:", v18, v20, v22 + v26, v24);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell textLabel](self, "textLabel"));
      [v28 frame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      double v37 = v26 + v30;
      -[TVTableViewCell _textLabelWidthWithXPosition:currentWidth:]( self,  "_textLabelWidthWithXPosition:currentWidth:",  v37,  v34);
      double v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell textLabel](self, "textLabel"));
      objc_msgSend(v40, "setFrame:", v37, v32, v39, v36);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell detailTextLabel](self, "detailTextLabel"));
      [v41 frame];
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;

      -[TVTableViewCell _textLabelWidthWithXPosition:currentWidth:]( self,  "_textLabelWidthWithXPosition:currentWidth:",  v37,  v45);
      double v49 = v48;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell detailTextLabel](self, "detailTextLabel"));
      objc_msgSend(v11, "setFrame:", v37, v43, v49, v47);
      goto LABEL_10;
    }
  }

- (void)_setImageTintColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
  [v5 setTintColor:v4];

  self->_rendersImageAsTemplates = v4 != 0LL;
  -[TVTableViewCell _updateImage](self, "_updateImage");
}

- (void)_updateImage
{
  if (self->_backingImage)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
    id v4 = v3;
    if (self->_rendersImageAsTemplates)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithRenderingMode:](self->_backingImage, "imageWithRenderingMode:", 2LL));
      [v4 setImage:v5];
    }

    else
    {
      [v3 setImage:self->_backingImage];
    }

    -[TVTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

  else if (self->_placeholderImage)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVTableViewCell imageView](self, "imageView"));
    [v6 setImage:self->_placeholderImage];
  }

- (double)_textLabelWidthWithXPosition:(double)a3 currentWidth:(double)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell accessoryView](self, "accessoryView"));
  [v7 frame];
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  if (CGRectIsEmpty(v22))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVTableViewCell contentView](self, "contentView"));
    [v16 frame];
    double v18 = v17;
    double v20 = v19;

    double v9 = v18 + v20;
  }

  if (a3 + a4 <= v9) {
    return a4;
  }
  else {
    return v9 - a3;
  }
}

- (BOOL)rendersImageAsTemplates
{
  return self->_rendersImageAsTemplates;
}

- (void)setRendersImageAsTemplates:(BOOL)a3
{
  self->_rendersImageAsTemplates = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (UIColor)_imageTintColor
{
  return self->__imageTintColor;
}

- (double)_imageViewWidth
{
  return self->__imageViewWidth;
}

- (void)_setImageViewWidth:(double)a3
{
  self->__imageViewWidth = a3;
}

- (void).cxx_destruct
{
}

@end