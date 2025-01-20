@interface SCATPromptView
- (NSString)prompt;
- (void)_updatePromptBackdropViewMask;
- (void)layoutSubviews;
- (void)setPrompt:(id)a3;
@end

@implementation SCATPromptView

- (void)setPrompt:(id)a3
{
  id v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATPromptView prompt](self, "prompt"));
  unsigned __int8 v5 = [v4 isEqualToString:v16];

  v6 = v16;
  if ((v5 & 1) == 0)
  {
    if ([v16 length])
    {
      v7 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue( +[SCATStyleProvider sharedStyleProvider]( &OBJC_CLASS___SCATStyleProvider,  "sharedStyleProvider"));
      if (!self->_backdropView)
      {
        v8 = -[_UIBackdropView initWithFrame:privateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithFrame:privateStyle:",  -[_UIBackdropView pointPickerPromptBackdropStyle](v7, "pointPickerPromptBackdropStyle"),  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
        backdropView = self->_backdropView;
        self->_backdropView = v8;

        -[SCATPromptView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0LL);
      }

      promptLabel = self->_promptLabel;
      if (!promptLabel)
      {
        v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
        v12 = self->_promptLabel;
        self->_promptLabel = v11;

        -[UILabel setTextAlignment:](self->_promptLabel, "setTextAlignment:", 1LL);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView pointPickerPromptTextColor](v7, "pointPickerPromptTextColor"));
        -[UILabel setTextColor:](self->_promptLabel, "setTextColor:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView pointPickerPromptFont](v7, "pointPickerPromptFont"));
        -[UILabel setFont:](self->_promptLabel, "setFont:", v14);

        -[UILabel setNumberOfLines:](self->_promptLabel, "setNumberOfLines:", 0LL);
        -[SCATPromptView addSubview:](self, "addSubview:", self->_promptLabel);
        promptLabel = self->_promptLabel;
      }

      -[UILabel setText:](promptLabel, "setText:", v16);
      -[SCATPromptView setNeedsLayout](self, "setNeedsLayout");
    }

    else
    {
      -[UILabel removeFromSuperview](self->_promptLabel, "removeFromSuperview");
      v15 = self->_promptLabel;
      self->_promptLabel = 0LL;

      -[_UIBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
      v7 = self->_backdropView;
      self->_backdropView = 0LL;
    }

    v6 = v16;
  }
}

- (NSString)prompt
{
  return -[UILabel text](self->_promptLabel, "text");
}

- (void)_updatePromptBackdropViewMask
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 scale];
  CGFloat v9 = v8;
  v26.width = v4;
  v26.height = v6;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v9);

  -[_UIBackdropView bounds](self->_backdropView, "bounds");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  [v18 pointPickerPromptCornerRadius];
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v11,  v13,  v15,  v17,  v19));
  [v20 fill];

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  id v25 = (id)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](self->_backdropView, "inputSettings"));
  [v22 setGrayscaleTintMaskImage:v25];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](self->_backdropView, "inputSettings"));
  [v23 setColorTintMaskImage:v25];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView inputSettings](self->_backdropView, "inputSettings"));
  [v24 setFilterMaskImage:v25];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SCATPromptView;
  -[SCATPromptView layoutSubviews](&v20, "layoutSubviews");
  if (self->_promptLabel)
  {
    -[SCATPromptView bounds](self, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    [v11 pointPickerPromptPadding];
    double v13 = v12;

    -[UILabel sizeThatFits:](self->_promptLabel, "sizeThatFits:", v8 + v13 * -2.0, v10 + v13 * -2.0);
    double v15 = v14;
    double v17 = v16;
    CGFloat v18 = v4 + (v8 - v14) * 0.5;
    CGFloat v19 = v6 + v10 * 0.5 + (v10 * 0.5 - v16) * 0.5;
    v21.origin.x = v18;
    v21.origin.y = v19;
    v21.size.width = v15;
    v21.size.height = v17;
    CGRect v22 = CGRectIntegral(v21);
    -[UILabel setFrame:](self->_promptLabel, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    v23.size.width = v15 + v13 * 2.0;
    v23.size.height = v17 + v13 * 2.0;
    v23.origin.x = v18 - v13;
    v23.origin.y = v19 - v13;
    CGRect v24 = CGRectIntegral(v23);
    -[_UIBackdropView setFrame:]( self->_backdropView,  "setFrame:",  v24.origin.x,  v24.origin.y,  v24.size.width,  v24.size.height);
    -[SCATPromptView _updatePromptBackdropViewMask](self, "_updatePromptBackdropViewMask");
  }

- (void).cxx_destruct
{
}

@end