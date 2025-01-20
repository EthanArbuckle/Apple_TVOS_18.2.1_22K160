@interface TVHSimpleLockupFooterView
+ (TVHSimpleLockupFooterView)new;
+ (void)_updateAppearanceForLockupState:(unint64_t)a3 label:(id)a4;
- (CGSize)intrinsicContentSize;
- (TVHLockupLabel)subtitleLabel;
- (TVHLockupLabel)titleLabel;
- (TVHSimpleLockupFooterView)init;
- (TVHSimpleLockupFooterView)initWithCoder:(id)a3;
- (TVHSimpleLockupFooterView)initWithFrame:(CGRect)a3;
- (TVHSimpleLockupFooterView)initWithLayout:(id)a3;
- (TVHSimpleLockupFooterViewLayout)layout;
- (void)layoutSubviews;
- (void)updateAppearanceForLockupState:(unint64_t)a3;
@end

@implementation TVHSimpleLockupFooterView

+ (TVHSimpleLockupFooterView)new
{
  return 0LL;
}

- (TVHSimpleLockupFooterView)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHSimpleLockupFooterView)initWithFrame:(CGRect)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSimpleLockupFooterView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSimpleLockupFooterView)initWithLayout:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHSimpleLockupFooterView;
  v6 = -[TVHSimpleLockupFooterView initWithFrame:]( &v13,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layout, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___TVHLockupLabel);
    objc_storeStrong((id *)&v7->_titleLabel, v8);
    -[TVHSimpleLockupFooterView addSubview:](v7, "addSubview:", v8);
    if ((id)-[TVHSimpleLockupFooterViewLayout type](v7->_layout, "type") == (id)1)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___TVHLockupLabel);
      subtitleLabel = v7->_subtitleLabel;
      v7->_subtitleLabel = v9;
      v11 = v9;

      -[TVHSimpleLockupFooterView addSubview:](v7, "addSubview:", v11);
    }
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView layout](self, "layout"));
  [v3 footerViewHeight];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView titleLabel](self, "titleLabel"));
  [v6 intrinsicContentSize];
  double v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView subtitleLabel](self, "subtitleLabel"));
  [v9 intrinsicContentSize];
  double v11 = fmax(v8, v10);

  double v12 = v11;
  double v13 = v5;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHSimpleLockupFooterView;
  -[TVHSimpleLockupFooterView layoutSubviews](&v15, "layoutSubviews");
  -[TVHSimpleLockupFooterView bounds](self, "bounds");
  double v4 = v3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView layout](self, "layout"));
  [v5 labelHeight];
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView subtitleLabel](self, "subtitleLabel"));
  if (v9)
  {
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = v4;
    v16.size.height = v7;
    double MaxY = CGRectGetMaxY(v16);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView layout](self, "layout"));
    [v11 labelSpacing];
    double v13 = MaxY + v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v14, "setFrame:", 0.0, v13, v4, v7);
  }
}

- (void)updateAppearanceForLockupState:(unint64_t)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView titleLabel](self, "titleLabel"));
  [(id)objc_opt_class(self) _updateAppearanceForLockupState:a3 label:v6];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockupFooterView subtitleLabel](self, "subtitleLabel"));
  [(id)objc_opt_class(self) _updateAppearanceForLockupState:a3 label:v5];
}

+ (void)_updateAppearanceForLockupState:(unint64_t)a3 label:(id)a4
{
  id v5 = a4;
  if ((objc_opt_respondsToSelector(v5, "updateAppearanceForLockupState:") & 1) != 0) {
    [v5 updateAppearanceForLockupState:a3];
  }
}

- (TVHLockupLabel)titleLabel
{
  return self->_titleLabel;
}

- (TVHLockupLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (TVHSimpleLockupFooterViewLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end