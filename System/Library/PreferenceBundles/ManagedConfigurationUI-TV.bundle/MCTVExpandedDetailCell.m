@interface MCTVExpandedDetailCell
- (MCTVExpandedDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (NSString)detailText;
- (NSString)titleText;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)setDetailText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
@end

@implementation MCTVExpandedDetailCell

- (MCTVExpandedDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCTVExpandedDetailCell;
  v4 = -[MCTVExpandedDetailCell initWithStyle:reuseIdentifier:](&v17, "initWithStyle:reuseIdentifier:", 1LL, a4);
  v5 = v4;
  if (v4)
  {
    unsigned int v6 = -[MCTVExpandedDetailCell _shouldReverseLayoutDirection](v4, "_shouldReverseLayoutDirection");
    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v9) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:]( v5->_titleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v9);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v5->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell contentView](v5, "contentView"));
    [v10 addSubview:v5->_titleLabel];

    -[MCTVExpandedDetailCell registerTextLabelForAppearanceUpdates:]( v5,  "registerTextLabelForAppearanceUpdates:",  v5->_titleLabel);
    v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = v11;

    -[UILabel setNumberOfLines:](v5->_detailLabel, "setNumberOfLines:", 0LL);
    if (v6) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = 2LL;
    }
    -[UILabel setTextAlignment:](v5->_detailLabel, "setTextAlignment:", v13);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v5->_detailLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v14) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:]( v5->_detailLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v14);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v5->_detailLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell contentView](v5, "contentView"));
    [v15 addSubview:v5->_detailLabel];

    -[MCTVExpandedDetailCell registerDetailLabelForAppearanceUpdates:]( v5,  "registerDetailLabelForAppearanceUpdates:",  v5->_detailLabel);
    -[MCTVExpandedDetailCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
  }

  return v5;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  titleText = self->_titleText;
  self->_titleText = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell titleLabel](self, "titleLabel"));
  [v7 setText:v4];

  -[MCTVExpandedDetailCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  detailText = self->_detailText;
  self->_detailText = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell detailLabel](self, "detailLabel"));
  [v7 setText:v4];

  -[MCTVExpandedDetailCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MCTVExpandedDetailCell;
  -[MCTVExpandedDetailCell updateConstraints](&v30, "updateConstraints");
  if (!self->_constraints)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 heightAnchor]);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintGreaterThanOrEqualToConstant:66.0]);

    LODWORD(v7) = 1148829696;
    [v6 setPriority:v7];
    -[NSMutableArray addObject:](v3, "addObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell titleLabel](self, "titleLabel"));
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstBaselineAnchor]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:44.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 leadingAnchor]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 leadingAnchor]);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13 constant:20.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVExpandedDetailCell detailLabel](self, "detailLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 leadingAnchor]);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17 constant:5.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue([v15 trailingAnchor]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 trailingAnchor]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20 constant:-20.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue([v15 firstBaselineAnchor]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 topAnchor]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v23 constant:44.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue([v15 lastBaselineAnchor]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 bottomAnchor]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26 constant:-18.0]);
    -[NSMutableArray addObject:](v3, "addObject:", v27);

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v3);
    v28 = (NSArray *)-[NSMutableArray copy](v3, "copy");
    constraints = self->_constraints;
    self->_constraints = v28;
  }

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
}

@end