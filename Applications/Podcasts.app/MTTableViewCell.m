@interface MTTableViewCell
+ (double)rowHeight;
+ (id)defaultCellBackgroundColor;
+ (id)detailFont;
+ (id)detailTextColor;
+ (id)textColor;
+ (id)titleFont;
- (BOOL)isEnabled;
- (BOOL)showsSeparator;
- (MTTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)swipeToDeleteButtonColor;
- (UIView)leftAccessoryView;
- (UIView)leftEditingAccessoryView;
- (UIView)separator;
- (id)deleteButtonBlock;
- (void)createSeparator;
- (void)didTransitionToState:(unint64_t)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDeleteButtonBlock:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeftAccessoryView:(id)a3;
- (void)setLeftEditingAccessoryView:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSeparator:(id)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setSwipeToDeleteButtonColor:(id)a3;
- (void)setupCell;
- (void)updateCellShadows:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MTTableViewCell

+ (double)rowHeight
{
  return 60.0;
}

+ (id)titleFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 17.0);
}

+ (id)detailFont
{
  return +[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 12.0);
}

+ (id)textColor
{
  return +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
}

+ (id)detailTextColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
}

+ (id)defaultCellBackgroundColor
{
  return +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
}

- (MTTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    if ((isTV() & 1) != 0) {
      char v5 = 1;
    }
    else {
      char v5 = isMac();
    }
    v4->_showsSeparator = v5;
    -[MTTableViewCell setupCell](v4, "setupCell");
    v6 = v4;
  }

  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  -[MTTableViewCell prepareForReuse](&v5, "prepareForReuse");
  -[MTTableViewCell setDeleteButtonBlock:](self, "setDeleteButtonBlock:", 0LL);
  -[MTTableViewCell setSwipeToDeleteButtonColor:](self, "setSwipeToDeleteButtonColor:", 0LL);
  -[MTTableViewCell _clearCellEmphasis](self, "_clearCellEmphasis");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](self, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  [v3 setBackgroundColor:v4];
}

- (void)setupCell
{
  v3 = objc_alloc(&OBJC_CLASS___UIView);
  -[MTTableViewCell bounds](self, "bounds");
  objc_super v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSelectedBackgroundColor](&OBJC_CLASS___UIColor, "cellSelectedBackgroundColor"));
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v4);

  -[MTTableViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v5);
  if (self->_showsSeparator) {
    -[MTTableViewCell createSeparator](self, "createSeparator");
  }
}

- (void)createSeparator
{
  if (!self->_separator)
  {
    v4 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](&OBJC_CLASS___UIColor, "cellSeparatorColor"));
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v3);

    -[MTTableViewCell setSeparator:](self, "setSeparator:", v4);
    -[MTTableViewCell addSubview:](self, "addSubview:", v4);
  }

- (void)setLeftAccessoryView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](leftAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftAccessoryView, a3);
    -[MTTableViewCell setNeedsLayout](self, "setNeedsLayout");
    objc_super v5 = v7;
  }
}

- (void)setLeftEditingAccessoryView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  leftEditingAccessoryView = self->_leftEditingAccessoryView;
  if (leftEditingAccessoryView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](leftEditingAccessoryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftEditingAccessoryView, a3);
    -[MTTableViewCell setNeedsLayout](self, "setNeedsLayout");
    objc_super v5 = v7;
  }
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    if (a3)
    {
      -[MTTableViewCell createSeparator](self, "createSeparator");
    }

    else
    {
      -[UIView removeFromSuperview](self->_separator, "removeFromSuperview");
      -[MTTableViewCell setSeparator:](self, "setSeparator:", 0LL);
    }
  }

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  -[MTTableViewCell layoutSubviews](&v53, "layoutSubviews");
  if (self->_separator)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    [v3 frame];
    CGFloat v5 = v4;

    -[MTTableViewCell bounds](self, "bounds");
    double Width = CGRectGetWidth(v54);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v7 scale];
    double v9 = v8;

    CGFloat v10 = 1.0 / v9;
    -[MTTableViewCell bounds](self, "bounds");
    double Height = CGRectGetHeight(v55);
    v56.origin.double x = 0.0;
    v56.origin.double y = v5;
    v56.size.width = Width;
    v56.size.height = v10;
    double v12 = Height - CGRectGetHeight(v56);
    -[MTTableViewCell separatorInset](self, "separatorInset");
    double x = v13 + 0.0;
    double y = v12 + v15;
    double v18 = Width - (v13 + v17);
    double v20 = v10 - (v15 + v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    objc_msgSend(v21, "setFrame:", x, y, v18, v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell separator](self, "separator"));
    -[MTTableViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v22);
  }

  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double v18 = CGRectZero.size.width;
    double v20 = CGRectZero.size.height;
  }

  BOOL v23 = +[UIView areAnimationsEnabled](&OBJC_CLASS___UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](&OBJC_CLASS___UIView, "setAnimationsEnabled:", 0LL);
  if (-[MTTableViewCell isEditing](self, "isEditing")
    && !-[MTTableViewCell editingStyle](self, "editingStyle"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
      v30 = (MTTableViewCell *)objc_claimAutoreleasedReturnValue([v29 superview]);

      if (v30 != self)
      {
        uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
        goto LABEL_12;
      }

- (void)updateCellShadows:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100017B3C;
    v4[3] = &unk_100240350;
    v4[4] = self;
    BOOL v5 = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v4,  0LL,  0.25,  0.0);
  }

  else
  {
    -[MTTableViewCell updateCellShadows:](self, "updateCellShadows:", a3);
  }

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  -[MTTableViewCell setHighlighted:animated:](&v7, "setHighlighted:animated:", v5, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  -[MTTableViewCell updateCellShadows:animated:](self, "updateCellShadows:animated:");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  -[MTTableViewCell setSelected:animated:](&v7, "setSelected:animated:", v5, v4);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[MTTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell textLabel](self, "textLabel"));
  [v4 setEnabled:self->_enabled];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell detailTextLabel](self, "detailTextLabel"));
  [v5 setEnabled:self->_enabled];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell imageView](self, "imageView"));
  id v8 = v6;
  double v7 = 0.400000006;
  if (self->_enabled) {
    double v7 = 1.0;
  }
  [v6 setAlpha:v7];
}

- (void)didTransitionToState:(unint64_t)a3
{
  if ((a3 & 1) != 0 && !-[MTTableViewCell editingStyle](self, "editingStyle")) {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftAccessoryView](self, "leftAccessoryView"));
  }
  else {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTableViewCell leftEditingAccessoryView](self, "leftEditingAccessoryView"));
  }
  v6 = v5;
  [v5 removeFromSuperview];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTableViewCell;
  -[MTTableViewCell didTransitionToState:](&v7, "didTransitionToState:", a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIView)leftAccessoryView
{
  return self->_leftAccessoryView;
}

- (UIView)leftEditingAccessoryView
{
  return self->_leftEditingAccessoryView;
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)deleteButtonBlock
{
  return self->_deleteButtonBlock;
}

- (void)setDeleteButtonBlock:(id)a3
{
}

- (UIColor)swipeToDeleteButtonColor
{
  return self->_swipeToDeleteButtonColor;
}

- (void)setSwipeToDeleteButtonColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end