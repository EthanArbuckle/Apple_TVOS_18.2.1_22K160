@interface MTGenericSettingsFooterLabelView
+ (double)labelInset;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)topAlignLabel;
- (MTGenericSettingsFooterLabelView)init;
- (UITextView)textView;
- (void)_setupLabel;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setTextView:(id)a3;
- (void)setTopAlignLabel:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTGenericSettingsFooterLabelView

- (MTGenericSettingsFooterLabelView)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTGenericSettingsFooterLabelView;
  v2 = -[MTGenericSettingsFooterLabelView init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[MTGenericSettingsFooterLabelView _setupLabel](v2, "_setupLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[MTGenericSettingsFooterLabelView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](v3, "textView"));
    [v5 setDelegate:v3];
  }

  return v3;
}

+ (double)labelInset
{
  return 12.0;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MTGenericSettingsFooterLabelView;
  -[MTGenericSettingsFooterLabelView layoutSubviews](&v32, "layoutSubviews");
  -[MTGenericSettingsFooterLabelView bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(id)objc_opt_class(self) labelInset];
  CGFloat v12 = v11;
  v33.origin.double x = v4;
  v33.origin.double y = v6;
  v33.size.double width = v8;
  v33.size.double height = v10;
  CGRect v34 = CGRectInset(v33, v12, 0.0);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  objc_msgSend(v17, "setFrame:", x, y, width, height);

  if (-[MTGenericSettingsFooterLabelView topAlignLabel](self, "topAlignLabel"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    [v18 sizeToFit];
  }

  if (-[MTGenericSettingsFooterLabelView effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection") == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    [v19 frame];
    CGFloat v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    -[MTGenericSettingsFooterLabelView bounds](self, "bounds");
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.double x = v21;
    v36.origin.double y = v23;
    v36.size.double width = v25;
    v36.size.double height = v27;
    double v29 = MaxX - CGRectGetWidth(v36);
    v37.origin.double x = v21;
    v37.origin.double y = v23;
    v37.size.double width = v25;
    v37.size.double height = v27;
    double v30 = v29 - CGRectGetMinX(v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
    objc_msgSend(v31, "setFrame:", v30, v23, v25, v27);
  }

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTGenericSettingsFooterLabelView;
  id v4 = a3;
  -[MTGenericSettingsFooterLabelView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTGenericSettingsFooterLabelView traitCollection]( self,  "traitCollection",  v8.receiver,  v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTGenericSettingsFooterLabelView _updateColors](self, "_updateColors");
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 1;
}

- (void)_setupLabel
{
  double v3 = objc_alloc_init(&OBJC_CLASS___UITextView);
  -[MTGenericSettingsFooterLabelView setTextView:](self, "setTextView:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  -[MTGenericSettingsFooterLabelView addSubview:](self, "addSubview:", v4);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  [v5 setTextAlignment:4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  [v6 setEditable:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  [v7 setScrollEnabled:0];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  [v8 setBackgroundColor:v9];
}

- (void)_updateColors
{
  double v3 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributedText]);
  CGFloat v10 = -[NSMutableAttributedString initWithAttributedString:](v3, "initWithAttributedString:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIListContentConfiguration groupedFooterConfiguration]( &OBJC_CLASS___UIListContentConfiguration,  "groupedFooterConfiguration"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 textProperties]);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resolvedColor]);
  -[NSMutableAttributedString addAttribute:value:range:]( v10,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v8,  0LL,  -[NSMutableAttributedString length](v10, "length"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericSettingsFooterLabelView textView](self, "textView"));
  [v9 setAttributedText:v10];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)topAlignLabel
{
  return self->_topAlignLabel;
}

- (void)setTopAlignLabel:(BOOL)a3
{
  self->_topAlignLabel = a3;
}

- (void).cxx_destruct
{
}

@end