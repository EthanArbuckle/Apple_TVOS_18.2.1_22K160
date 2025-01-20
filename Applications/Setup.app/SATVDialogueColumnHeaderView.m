@interface SATVDialogueColumnHeaderView
+ (id)labelWithFont:(id)a3 andColor:(id)a4;
- (BOOL)isLoading;
- (SATVDialogueColumnHeaderView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)loadingIndicator;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)columnStackView;
- (void)_addLayoutContraintsForSubviews;
- (void)setColumnStackView:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SATVDialogueColumnHeaderView

- (SATVDialogueColumnHeaderView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SATVDialogueColumnHeaderView;
  v3 = -[SATVDialogueColumnHeaderView initWithFrame:]( &v21,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SATVDialogueColumnHeaderView labelWithFont:andColor:]( &OBJC_CLASS___SATVDialogueColumnHeaderView,  "labelWithFont:andColor:",  v6,  v7));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[SATVDialogueColumnHeaderView labelWithFont:andColor:]( &OBJC_CLASS___SATVDialogueColumnHeaderView,  "labelWithFont:andColor:",  v10,  v11));
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v12;

    v14 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  20LL);
    loadingIndicator = v4->_loadingIndicator;
    v4->_loadingIndicator = v14;

    -[UIActivityIndicatorView setActivityIndicatorViewStyle:]( v4->_loadingIndicator,  "setActivityIndicatorViewStyle:",  101LL);
    v16 = objc_alloc(&OBJC_CLASS___UIStackView);
    v22[0] = v4->_titleLabel;
    v22[1] = v4->_subtitleLabel;
    v22[2] = v4->_loadingIndicator;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 3LL));
    v18 = -[UIStackView initWithArrangedSubviews:](v16, "initWithArrangedSubviews:", v17);
    columnStackView = v4->_columnStackView;
    v4->_columnStackView = v18;

    -[SATVDialogueColumnHeaderView addSubview:](v4, "addSubview:", v4->_columnStackView);
    -[SATVDialogueColumnHeaderView _addLayoutContraintsForSubviews](v4, "_addLayoutContraintsForSubviews");
    -[SATVDialogueColumnHeaderView setIsLoading:](v4, "setIsLoading:", 0LL);
  }

  return v4;
}

- (void)setIsLoading:(BOOL)a3
{
  if (a3 + self->_isLoading)
  {
    self->_isLoading = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100020B64;
    v3[3] = &unk_1000C9520;
    v3[4] = self;
    char v4 = 1;
    dispatch_async(&_dispatch_main_q, v3);
  }

- (void)_addLayoutContraintsForSubviews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_columnStackView, "topAnchor"));
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView topAnchor](self, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 constraintEqualToAnchor:v4]);
  [v5 setActive:1];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_columnStackView, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView bottomAnchor](self, "bottomAnchor"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  [v8 setActive:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_columnStackView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView leadingAnchor](self, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10]);
  [v11 setActive:1];

  id v14 = (id)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_columnStackView, "trailingAnchor"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVDialogueColumnHeaderView trailingAnchor](self, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v12]);
  [v13 setActive:1];
}

+ (id)labelWithFont:(id)a3 andColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[TVSKLabel setFont:](v7, "setFont:", v6);

  -[TVSKLabel setTextColor:](v7, "setTextColor:", v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVSKLabel setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[TVSKLabel setTextAlignment:](v7, "setTextAlignment:", 4LL);
  -[TVSKLabel setLineBreakMode:](v7, "setLineBreakMode:", 0LL);
  -[TVSKLabel setNumberOfLines:](v7, "setNumberOfLines:", 0LL);
  return v7;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (UIStackView)columnStackView
{
  return self->_columnStackView;
}

- (void)setColumnStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end