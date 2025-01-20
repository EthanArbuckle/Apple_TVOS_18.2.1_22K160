@interface MTLoadingCell
- (UIActivityIndicatorView)activityIndicator;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setupCell;
@end

@implementation MTLoadingCell

- (void)setupCell
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTLoadingCell;
  -[MTTableViewCell setupCell](&v7, "setupCell");
  v3 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
  -[MTLoadingCell setActivityIndicator:](self, "setActivityIndicator:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  [v4 addSubview:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  [v6 startAnimating];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTLoadingCell;
  -[MTTableViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  [v8 frame];
  CGFloat v9 = CGRectGetMidX(v14) - v5 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell contentView](self, "contentView"));
  [v10 frame];
  CGFloat v11 = CGRectGetMidY(v15) - v7 * 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTLoadingCell activityIndicator](self, "activityIndicator"));
  objc_msgSend(v12, "setFrame:", v9, v11, v5, v7);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end