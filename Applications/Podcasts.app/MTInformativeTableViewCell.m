@interface MTInformativeTableViewCell
- (CGSize)fittingSize;
- (UILabel)messageLabel;
- (void)layoutSubviews;
- (void)setMessageLabel:(id)a3;
- (void)setupCell;
@end

@implementation MTInformativeTableViewCell

- (void)setupCell
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___MTInformativeTableViewCell;
  -[MTTableViewCell setupCell](&v40, "setupCell");
  -[MTInformativeTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0LL);
  v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[MTInformativeTableViewCell setMessageLabel:](self, "setMessageLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v4 setNumberOfLines:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v5 setLineBreakMode:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v6 setTextAlignment:1];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v9 setFont:v8];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSecondaryTextColor](&OBJC_CLASS___UIColor, "cellSecondaryTextColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v11 setTextColor:v10];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v13) = 1144750080;
  [v12 setContentHuggingPriority:1 forAxis:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v15) = 1144750080;
  [v14 setContentCompressionResistancePriority:1 forAxis:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  LODWORD(v17) = 1144750080;
  [v16 setContentCompressionResistancePriority:0 forAxis:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  objc_msgSend(v18, "setLayoutMargins:", 27.0, 27.0, 27.0, 27.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 layoutMarginsGuide]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v21 addSubview:v22];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v39 topAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v20 topAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v38 constraintEqualToAnchor:v37]);
  v41[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v35 trailingAnchor]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v20 trailingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v33]);
  v41[1] = v32;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bottomAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
  v41[2] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 leadingAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v20 leadingAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
  v41[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTInformativeTableViewCell;
  -[MTTableViewCell layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell contentView](self, "contentView"));
  [v3 layoutIfNeeded];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v4 frame];
  double Width = CGRectGetWidth(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTInformativeTableViewCell messageLabel](self, "messageLabel"));
  [v6 setPreferredMaxLayoutWidth:Width];
}

- (CGSize)fittingSize
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end