@interface MTAddPodcastCellAccessoryView
- (BOOL)isAdded;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAddPodcastCellAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAdded:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MTAddPodcastCellAccessoryView

- (MTAddPodcastCellAccessoryView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTAddPodcastCellAccessoryView;
  v3 = -[MTAddPodcastCellAccessoryView initWithFrame:]( &v10,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 0LL));
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setAdjustsImageWhenDisabled:](v3->_button, "setAdjustsImageWhenDisabled:", 1LL);
    -[UIButton setAdjustsImageWhenHighlighted:](v3->_button, "setAdjustsImageWhenHighlighted:", 0LL);
    -[UIButton setShowsTouchWhenHighlighted:](v3->_button, "setShowsTouchWhenHighlighted:", 0LL);
    -[UIButton setUserInteractionEnabled:](v3->_button, "setUserInteractionEnabled:", 0LL);
    v6 = v3->_button;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage multiUncheckIcon](&OBJC_CLASS___UIImage, "multiUncheckIcon"));
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0LL);

    -[MTAddPodcastCellAccessoryView addSubview:](v3, "addSubview:", v3->_button);
    v8 = v3;
  }

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTAddPodcastCellAccessoryView;
  -[MTAddPodcastCellAccessoryView layoutSubviews](&v4, "layoutSubviews");
  button = self->_button;
  -[MTAddPodcastCellAccessoryView bounds](self, "bounds");
  -[UIButton setFrame:](button, "setFrame:");
}

- (void)setAdded:(BOOL)a3
{
  if (self->_added != a3)
  {
    self->_added = a3;
    button = self->_button;
    if (a3) {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIImage multiCheckIcon](&OBJC_CLASS___UIImage, "multiCheckIcon"));
    }
    else {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[UIImage multiUncheckIcon](&OBJC_CLASS___UIImage, "multiUncheckIcon"));
    }
    id v5 = (id)v4;
    -[UIButton setImage:forState:](button, "setImage:forState:", v4, 0LL);
  }

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UIButton setEnabled:](self->_button, "setEnabled:");
}

- (BOOL)isAdded
{
  return self->_added;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end