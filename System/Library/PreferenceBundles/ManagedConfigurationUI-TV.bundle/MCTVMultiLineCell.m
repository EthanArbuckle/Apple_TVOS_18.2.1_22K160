@interface MCTVMultiLineCell
- (MCTVMultiLineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (NSString)subtitle1Text;
- (NSString)subtitle2Text;
- (NSString)titleText;
- (UILabel)subtitle1Label;
- (UILabel)subtitle2Label;
- (UILabel)titleLabel;
- (id)_subtitleFont;
- (void)setSubtitle1Text:(id)a3;
- (void)setSubtitle2Text:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
@end

@implementation MCTVMultiLineCell

- (MCTVMultiLineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MCTVMultiLineCell;
  v4 = -[MCTVMultiLineCell initWithStyle:reuseIdentifier:](&v19, "initWithStyle:reuseIdentifier:", 3LL, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell contentView](v4, "contentView"));
    [v7 addSubview:v4->_titleLabel];

    -[MCTVMultiLineCell registerTextLabelForAppearanceUpdates:]( v4,  "registerTextLabelForAppearanceUpdates:",  v4->_titleLabel);
    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitle1Label = v4->_subtitle1Label;
    v4->_subtitle1Label = v8;

    -[UILabel setNumberOfLines:](v4->_subtitle1Label, "setNumberOfLines:", 0LL);
    v10 = v4->_subtitle1Label;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell _subtitleFont](v4, "_subtitleFont"));
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitle1Label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell contentView](v4, "contentView"));
    [v12 addSubview:v4->_subtitle1Label];

    -[MCTVMultiLineCell registerDetailLabelForAppearanceUpdates:]( v4,  "registerDetailLabelForAppearanceUpdates:",  v4->_subtitle1Label);
    v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitle2Label = v4->_subtitle2Label;
    v4->_subtitle2Label = v13;

    -[UILabel setNumberOfLines:](v4->_subtitle2Label, "setNumberOfLines:", 0LL);
    v15 = v4->_subtitle2Label;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell _subtitleFont](v4, "_subtitleFont"));
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitle2Label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell contentView](v4, "contentView"));
    [v17 addSubview:v4->_subtitle2Label];

    -[MCTVMultiLineCell registerDetailLabelForAppearanceUpdates:]( v4,  "registerDetailLabelForAppearanceUpdates:",  v4->_subtitle2Label);
    -[MCTVMultiLineCell setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
  }

  return v4;
}

- (void)setTitleText:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 length] == 0;
  if (((v4 ^ (-[NSString length](self->_titleText, "length") != 0)) & 1) == 0) {
    -[MCTVMultiLineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  v5 = (NSString *)[v7 copy];
  titleText = self->_titleText;
  self->_titleText = v5;

  -[UILabel setText:](self->_titleLabel, "setText:", v7);
}

- (void)setSubtitle1Text:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 length] == 0;
  if (((v4 ^ (-[NSString length](self->_subtitle1Text, "length") != 0)) & 1) == 0) {
    -[MCTVMultiLineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  v5 = (NSString *)[v7 copy];
  subtitle1Text = self->_subtitle1Text;
  self->_subtitle1Text = v5;

  -[UILabel setText:](self->_subtitle1Label, "setText:", v7);
}

- (void)setSubtitle2Text:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 length] == 0;
  if (((v4 ^ (-[NSString length](self->_subtitle2Text, "length") != 0)) & 1) == 0) {
    -[MCTVMultiLineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
  v5 = (NSString *)[v7 copy];
  subtitle2Text = self->_subtitle2Text;
  self->_subtitle2Text = v5;

  -[UILabel setText:](self->_subtitle2Label, "setText:", v7);
}

- (void)updateConstraints
{
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___MCTVMultiLineCell;
  -[MCTVMultiLineCell updateConstraints](&v52, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVMultiLineCell contentView](self, "contentView"));
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintGreaterThanOrEqualToConstant:100.0]);

  LODWORD(v7) = 1148829696;
  [v6 setPriority:v7];
  -[NSMutableArray addObject:](v4, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9 constant:20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12 constant:-20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintGreaterThanOrEqualToAnchor:v15 constant:5.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintLessThanOrEqualToAnchor:v18 constant:-5.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitle1Label, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21 constant:20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitle1Label, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v24 constant:-20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v25);

  uint64_t v26 = 48LL;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitle2Label, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v28 constant:20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitle2Label, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToAnchor:v31 constant:-20.0]);
  -[NSMutableArray addObject:](v4, "addObject:", v32);

  NSUInteger v33 = -[NSString length](self->_subtitle1Text, "length");
  NSUInteger v34 = -[NSString length](self->_subtitle2Text, "length");
  titleLabel = self->_titleLabel;
  if (v33 | v34)
  {
    v51 = v6;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](titleLabel, "firstBaselineAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37 constant:44.0]);
    -[NSMutableArray addObject:](v4, "addObject:", v38);

    if (v34)
    {
      if (v33)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_subtitle1Label, "topAnchor"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40]);
        -[NSMutableArray addObject:](v4, "addObject:", v41);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_subtitle2Label, "topAnchor"));
        subtitle1Label = self->_subtitle1Label;
LABEL_8:
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](subtitle1Label, "bottomAnchor"));
        v48 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v47]);
        -[NSMutableArray addObject:](v4, "addObject:", v48);

        v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->TSKBaseTableViewCell_opaque[v26] lastBaselineAnchor]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v3 bottomAnchor]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45 constant:-18.0]);
        v6 = v51;
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v26 = 40LL;
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->TSKBaseTableViewCell_opaque[v26] topAnchor]);
    subtitle1Label = self->_titleLabel;
    goto LABEL_8;
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](titleLabel, "centerYAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
  v46 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v45]);
LABEL_9:
  -[NSMutableArray addObject:](v4, "addObject:", v46);

  +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  self->_constraints);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v4);
  v49 = (NSArray *)-[NSMutableArray copy](v4, "copy");
  constraints = self->_constraints;
  self->_constraints = v49;
}

- (id)_subtitleFont
{
  if (qword_311E8 != -1) {
    dispatch_once(&qword_311E8, &stru_289D8);
  }
  return (id)qword_311E0;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitle1Text
{
  return self->_subtitle1Text;
}

- (NSString)subtitle2Text
{
  return self->_subtitle2Text;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitle1Label
{
  return self->_subtitle1Label;
}

- (UILabel)subtitle2Label
{
  return self->_subtitle2Label;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
}

@end