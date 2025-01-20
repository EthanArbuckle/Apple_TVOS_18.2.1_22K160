@interface MTPodcastPlaylistCell
+ (CGSize)artworkSizeForViewWidth:(double)a3;
- (BOOL)isAdded;
- (MTPodcastPlaylistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)countView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdded:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MTPodcastPlaylistCell

- (MTPodcastPlaylistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTPodcastPlaylistCell;
  v4 = -[MTPodcastCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4) {
    -[MTPodcastPlaylistCell setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
  }
  return v5;
}

- (id)countView
{
  return 0LL;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTPodcastPlaylistCell;
  -[MTGenericCell layoutSubviews](&v7, "layoutSubviews");
  if (self->_disabledView)
  {
    -[MTPodcastPlaylistCell bringSubviewToFront:](self, "bringSubviewToFront:");
    disabledView = self->_disabledView;
    -[MTPodcastPlaylistCell bounds](self, "bounds");
    -[UIView setFrame:](disabledView, "setFrame:");
    v4 = self->_disabledView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](&OBJC_CLASS___UIColor, "systemBackgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 colorWithAlphaComponent:0.5]);
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v6);
  }

+ (CGSize)artworkSizeForViewWidth:(double)a3
{
  double v3 = 44.0;
  double v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAdded:(BOOL)a3
{
  self->_added = a3;
  if (a3) {
    uint64_t v3 = 3LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  -[MTPodcastPlaylistCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTPodcastPlaylistCell;
  -[MTGenericCell prepareForReuse](&v3, "prepareForReuse");
  -[MTPodcastPlaylistCell setAdded:](self, "setAdded:", 0LL);
  -[MTPodcastPlaylistCell setEnabled:](self, "setEnabled:", 1LL);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  disabledView = self->_disabledView;
  if (a3)
  {
    if (disabledView)
    {
      -[UIView removeFromSuperview](disabledView, "removeFromSuperview");
      v6 = self->_disabledView;
      self->_disabledView = 0LL;
    }
  }

  else if (!disabledView)
  {
    objc_super v7 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v8 = self->_disabledView;
    self->_disabledView = v7;

    -[MTPodcastPlaylistCell addSubview:](self, "addSubview:", self->_disabledView);
    -[MTPodcastPlaylistCell setNeedsLayout](self, "setNeedsLayout");
  }

  -[MTPodcastPlaylistCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

- (BOOL)isAdded
{
  return self->_added;
}

- (void).cxx_destruct
{
}

@end