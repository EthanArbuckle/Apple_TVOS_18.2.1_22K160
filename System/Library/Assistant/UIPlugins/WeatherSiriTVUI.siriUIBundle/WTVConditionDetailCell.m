@interface WTVConditionDetailCell
- (NSString)descriptionString;
- (NSString)valueString;
- (UIImage)icon;
- (UIImageView)iconView;
- (UILabel)descriptionLabel;
- (UILabel)valueLabel;
- (WTVConditionDetailCell)initWithFrame:(CGRect)a3;
- (unint64_t)textStyle;
- (void)_updateTextStyles;
- (void)_updateUI;
- (void)prepareForReuse;
- (void)setDescriptionLabel:(id)a3;
- (void)setDescriptionString:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconView:(id)a3;
- (void)setTextStyle:(unint64_t)a3;
- (void)setValueLabel:(id)a3;
- (void)setValueString:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WTVConditionDetailCell

- (WTVConditionDetailCell)initWithFrame:(CGRect)a3
{
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___WTVConditionDetailCell;
  v3 = -[WTVConditionDetailCell initWithFrame:]( &v42,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[WTVConditionDetailCell setIconView:](v4, "setIconView:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](v4, "iconView"));
    -[WTVConditionDetailCell addSubview:](v4, "addSubview:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](v4, "iconView"));
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](v4, "iconView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  3LL,  0LL,  v4,  3LL,  1.0,  0.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](v4, "iconView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v12);

    v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVConditionDetailCell setValueLabel:](v4, "setValueLabel:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_utteranceFont](&OBJC_CLASS___UIFont, "siritvui_utteranceFont"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    [v15 setFont:v14];

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    [v17 setBackgroundColor:v16];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    -[WTVConditionDetailCell addSubview:](v4, "addSubview:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](v4, "iconView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  3LL,  0LL,  v21,  4LL,  1.0,  8.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v24);

    v25 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[WTVConditionDetailCell setDescriptionLabel:](v4, "setDescriptionLabel:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siritvui_bodyFont](&OBJC_CLASS___UIFont, "siritvui_bodyFont"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    [v27 setFont:v26];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    [v29 setBackgroundColor:v28];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    [v30 setTextAlignment:1];

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    [v31 setAdjustsFontSizeToFitWidth:1];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    -[WTVConditionDetailCell addSubview:](v4, "addSubview:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](v4, "valueLabel"));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v34,  3LL,  0LL,  v35,  4LL,  1.0,  8.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v37,  5LL,  0LL,  v4,  5LL,  1.0,  0.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](v4, "descriptionLabel"));
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v39,  6LL,  0LL,  v4,  6LL,  1.0,  0.0));
    -[WTVConditionDetailCell addConstraint:](v4, "addConstraint:", v40);
  }

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WTVConditionDetailCell;
  -[WTVConditionDetailCell prepareForReuse](&v3, "prepareForReuse");
  -[WTVConditionDetailCell setIcon:](self, "setIcon:", 0LL);
  -[WTVConditionDetailCell setValueString:](self, "setValueString:", 0LL);
  -[WTVConditionDetailCell setDescriptionString:](self, "setDescriptionString:", 0LL);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WTVConditionDetailCell;
  -[WTVConditionDetailCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[WTVConditionDetailCell _updateTextStyles](self, "_updateTextStyles");
}

- (void)setIcon:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[WTVConditionDetailCell _updateUI](self, "_updateUI");
    v5 = v6;
  }
}

- (void)setValueString:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_valueString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueString, a3);
    -[WTVConditionDetailCell _updateUI](self, "_updateUI");
  }
}

- (void)setDescriptionString:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_descriptionString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_descriptionString, a3);
    -[WTVConditionDetailCell _updateUI](self, "_updateUI");
  }
}

- (void)setTextStyle:(unint64_t)a3
{
  if (self->_textStyle != a3)
  {
    self->_textStyle = a3;
    -[WTVConditionDetailCell _updateTextStyles](self, "_updateTextStyles");
  }

- (void)_updateUI
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell icon](self, "icon"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](self, "iconView"));
  [v4 setImage:v3];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueString](self, "valueString"));
  if (v5) {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueString](self, "valueString"));
  }
  else {
    v6 = @"--";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](self, "valueLabel"));
  [v7 setText:v6];

  if (v5) {
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionString](self, "descriptionString"));
  }
  if (v8) {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionString](self, "descriptionString"));
  }
  else {
    v9 = &stru_1D1D8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](self, "descriptionLabel"));
  [v10 setText:v9];

  if (v8) {
  -[WTVConditionDetailCell _updateTextStyles](self, "_updateTextStyles");
  }
}

- (void)_updateTextStyles
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell iconView](self, "iconView"));
  +[WTVUtilities configureConditionImageView:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureConditionImageView:forTextStyle:",  v3,  self->_textStyle);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell valueLabel](self, "valueLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v4,  self->_textStyle);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[WTVConditionDetailCell descriptionLabel](self, "descriptionLabel"));
  +[WTVUtilities configureLabel:forTextStyle:]( &OBJC_CLASS___WTVUtilities,  "configureLabel:forTextStyle:",  v5,  self->_textStyle);
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end