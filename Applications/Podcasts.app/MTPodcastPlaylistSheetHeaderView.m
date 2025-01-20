@interface MTPodcastPlaylistSheetHeaderView
- (BOOL)on;
- (MTPodcastPlaylistSheetHeaderView)initWithFrame:(CGRect)a3;
- (id)action;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation MTPodcastPlaylistSheetHeaderView

- (MTPodcastPlaylistSheetHeaderView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTPodcastPlaylistSheetHeaderView;
  v3 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___UISwitch);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = -[UISwitch initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    v9 = v3->_switch;
    v3->_switch = v8;

    -[UISwitch addTarget:action:forControlEvents:]( v3->_switch,  "addTarget:action:forControlEvents:",  v3,  "buttonTapped:",  4096LL);
    -[MTPodcastPlaylistSheetHeaderView addSubview:](v3, "addSubview:", v3->_switch);
    v10 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    title = v3->_title;
    v3->_title = v10;

    v12 = v3->_title;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"All Podcasts Button" value:&stru_100248948 table:0]);
    -[UILabel setText:](v12, "setText:", v14);

    v15 = v3->_title;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont headerTitleFont](&OBJC_CLASS___UIFont, "headerTitleFont"));
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = v3->_title;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

    v19 = v3->_title;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[MTPodcastPlaylistSheetHeaderView addSubview:](v3, "addSubview:", v3->_title);
    v21 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MTPodcastPlaylistSheetHeaderView;
  -[MTPodcastPlaylistSheetHeaderView layoutSubviews](&v27, "layoutSubviews");
  UIUserInterfaceLayoutDirection v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[MTPodcastPlaylistSheetHeaderView semanticContentAttribute](self, "semanticContentAttribute"));
  title = self->_title;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont headerTitleFont](&OBJC_CLASS___UIFont, "headerTitleFont"));
  -[UILabel setFont:](title, "setFont:", v5);

  -[MTPodcastPlaylistSheetHeaderView bounds](self, "bounds");
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  separator = self->_separator;
  double MaxY = CGRectGetMaxY(v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v12 scale];
  double v14 = v13;

  double v15 = MaxY - 1.0 / v14;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v17 scale];
  double v19 = v18;

  -[UIView setFrame:](separator, "setFrame:", 0.0, v15, v16, 1.0 / v19);
  -[UISwitch sizeToFit](self->_switch, "sizeToFit");
  -[UILabel sizeToFit](self->_title, "sizeToFit");
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v30);
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    -[UILabel bounds](self->_title, "bounds");
    double v21 = MaxX - CGRectGetWidth(v31) + -20.0;
    double v22 = 20.0;
  }

  else
  {
    -[UISwitch bounds](self->_switch, "bounds");
    double v22 = MaxX - CGRectGetWidth(v32) + -20.0;
    double v21 = 20.0;
  }

  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v23 = CGRectGetHeight(v33);
  -[UISwitch bounds](self->_switch, "bounds");
  double v24 = ceil((v23 - CGRectGetHeight(v34)) * 0.5);
  -[UISwitch frame](self->_switch, "frame");
  -[UISwitch setFrame:](self->_switch, "setFrame:", v22, v24);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v25 = CGRectGetHeight(v35);
  -[UILabel bounds](self->_title, "bounds");
  double v26 = ceil((v25 - CGRectGetHeight(v36)) * 0.5);
  -[UILabel frame](self->_title, "frame");
  -[UILabel setFrame:](self->_title, "setFrame:", v21, v26);
}

- (void)buttonTapped:(id)a3
{
  id v4 = [a3 isOn];
  self->_on = (char)v4;
  action = (void (**)(id, MTPodcastPlaylistSheetHeaderView *, id))self->_action;
  if (action) {
    action[2](action, self, v4);
  }
}

- (void)setOn:(BOOL)a3
{
  BOOL v3 = a3;
  self->_on = a3;
  -[UISwitch setOn:](self->_switch, "setOn:");
  action = (void (**)(id, MTPodcastPlaylistSheetHeaderView *, BOOL))self->_action;
  if (action) {
    action[2](action, self, v3);
  }
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)on
{
  return self->_on;
}

- (void).cxx_destruct
{
}

@end