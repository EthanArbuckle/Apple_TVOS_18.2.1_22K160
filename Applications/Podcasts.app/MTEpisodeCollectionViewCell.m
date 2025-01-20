@interface MTEpisodeCollectionViewCell
+ (CGSize)artworkSizeForStyle:(unint64_t)a3;
+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4;
+ (double)maximumContentWidthForStyle:(unint64_t)a3;
+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isExpanded;
- (BOOL)showsPlayState;
- (BOOL)showsPubDate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTEpisode)episode;
- (MTEpisodeActionController)actionController;
- (MTEpisodeCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTEpisodeLockup)episodeLockup;
- (UIView)lockupContainer;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)style;
- (void)applyLayoutAttributes:(id)a3;
- (void)clearLayer:(id)a3;
- (void)dealloc;
- (void)dismissActionSheetsAndPopovers;
- (void)fixEmptyTextContainers;
- (void)invalidateLayoutMargins;
- (void)invalidateSizeMetrics;
- (void)layoutSubviews;
- (void)lockup:(id)a3 moreButtonTapped:(id)a4;
- (void)lockupDidChangeSize:(id)a3;
- (void)prepareForReuse;
- (void)setColorTheme:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEpisode:(id)a3;
- (void)setEpisodeLockup:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLockupContainer:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsPlayState:(BOOL)a3;
- (void)setShowsPubDate:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setupCell;
- (void)updateActionSheetsAndPopovers;
- (void)updateCurrentRowHeight;
- (void)updateOverlayForSelectedOrIsNew;
@end

@implementation MTEpisodeCollectionViewCell

+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  return +[MTEpisodeLockup styleForWidth:showsArtwork:]( &OBJC_CLASS___MTEpisodeLockup,  "styleForWidth:showsArtwork:",  a4,  a3);
}

+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  return result;
}

+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeCollectionViewCellHeightCache sharedInstance]( &OBJC_CLASS___MTEpisodeCollectionViewCellHeightCache,  "sharedInstance"));
  [v6 cachedHeightForWidth:a4 style:a3];
  double v8 = v7;

  if (v8 == 0.0)
  {
    +[MTEpisodeLockup estimatedHeightForWidth:style:]( &OBJC_CLASS___MTEpisodeLockup,  "estimatedHeightForWidth:style:",  a4,  a3);
    double v8 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisodeCollectionViewCellHeightCache sharedInstance]( &OBJC_CLASS___MTEpisodeCollectionViewCellHeightCache,  "sharedInstance"));
    [v10 addCachedHeight:a4 forWidth:v8 style:a3];
  }

  return v8;
}

+ (CGSize)artworkSizeForStyle:(unint64_t)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3
{
  return result;
}

- (MTEpisodeCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  double v3 = -[MTCollectionViewCell initWithFrame:]( &v6,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  double v4 = v3;
  if (v3) {
    -[MTEpisodeCollectionViewCell setupCell](v3, "setupCell");
  }
  return v4;
}

- (void)setupCell
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  [v3 setAutoresizingMask:16];

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell lockupContainer](self, "lockupContainer"));
  [v4 addSubview:v5];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell lockupContainer](self, "lockupContainer"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v6 addSubview:v7];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](&OBJC_CLASS___UIColor, "backgroundColor"));
  -[MTEpisodeCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v8);

  -[MTEpisodeCollectionViewCell addObserver:forKeyPath:options:context:]( self,  "addObserver:forKeyPath:options:context:",  self,  @"exposedActions",  5LL,  0LL);
  -[MTEpisodeCollectionViewCell addObserver:forKeyPath:options:context:]( self,  "addObserver:forKeyPath:options:context:",  self,  @"userSwiping",  5LL,  0LL);
  -[MTCollectionViewCell setShowsMoreButton:](self, "setShowsMoreButton:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTEpisodeCollectionViewCell dealloc](&v3, "dealloc");
}

- (void)applyLayoutAttributes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTCollectionViewCell applyLayoutAttributes:](&v3, "applyLayoutAttributes:", a3);
}

- (MTEpisodeLockup)episodeLockup
{
  episodeLockup = self->_episodeLockup;
  if (!episodeLockup)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___MTEpisodeLockup);
    v5 = self->_episodeLockup;
    self->_episodeLockup = v4;

    -[MTEpisodeLockup setDelegate:](self->_episodeLockup, "setDelegate:", self);
    -[MTEpisodeLockup setAutoresizingMask:](self->_episodeLockup, "setAutoresizingMask:", 16LL);
    -[MTEpisodeLockup setPreservesSuperviewLayoutMargins:]( self->_episodeLockup,  "setPreservesSuperviewLayoutMargins:",  1LL);
    episodeLockup = self->_episodeLockup;
  }

  return episodeLockup;
}

- (void)setStyle:(unint64_t)a3
{
  if (-[MTEpisodeCollectionViewCell style](self, "style") != a3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    [v5 setStyle:a3];
  }

- (unint64_t)style
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  id v3 = [v2 style];

  return (unint64_t)v3;
}

- (void)setShowsPubDate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v4 setShowsPubDate:v3];
}

- (BOOL)showsPubDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 showsPubDate];

  return v3;
}

- (void)setShowsPlayState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v4 setShowsPlayState:v3];
}

- (BOOL)showsPlayState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 showsPlayState];

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (-[MTCollectionViewCell isEditing](self, "isEditing") != a3)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    [v7 setEditing:v5];

    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
    -[MTCollectionViewCell setEditing:animated:](&v9, "setEditing:animated:", v5, v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10006BA80;
    v8[3] = &unk_10023FF98;
    v8[4] = self;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v8);
    -[MTEpisodeCollectionViewCell updateCurrentRowHeight](self, "updateCurrentRowHeight");
    -[MTEpisodeCollectionViewCell updateOverlayForSelectedOrIsNew](self, "updateOverlayForSelectedOrIsNew");
  }

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTEpisodeCollectionViewCell setHighlighted:](&v4, "setHighlighted:", a3);
  -[MTEpisodeCollectionViewCell updateOverlayForSelectedOrIsNew](self, "updateOverlayForSelectedOrIsNew");
}

- (void)setSelected:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTCollectionViewCell setSelected:](&v6, "setSelected:", a3);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episode](self, "episode"));

  if (v4)
  {
    if (-[MTCollectionViewCell isEditing](self, "isEditing")
      && !-[MTCollectionViewCell exposedActions](self, "exposedActions"))
    {
      -[MTEpisodeCollectionViewCell updateOverlayForSelectedOrIsNew](self, "updateOverlayForSelectedOrIsNew");
    }

    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_10006BB94;
      v5[3] = &unk_10023FF98;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.5);
    }
  }

- (void)updateCurrentRowHeight
{
  double v4 = v3;
  double v6 = v5;
  -[MTEpisodeCollectionViewCell sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
  if (v4 != v8 || v6 != v7) {
    -[MTEpisodeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEpisode:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v5 setEpisode:v4];

  -[MTEpisodeCollectionViewCell updateOverlayForSelectedOrIsNew](self, "updateOverlayForSelectedOrIsNew");
}

- (MTEpisode)episode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episode]);

  return (MTEpisode *)v3;
}

- (void)setColorTheme:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v5 setColorTheme:v4];
}

- (MTColorTheme)colorTheme
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 colorTheme]);

  return (MTColorTheme *)v3;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v5 setExpanded:v3];

  -[MTEpisodeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isExpanded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 isExpanded];

  return v3;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v4 setCurrentPlayerItem:v3];
}

- (BOOL)isCurrentPlayerItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 isCurrentPlayerItem];

  return v3;
}

- (MTEpisodeActionController)actionController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 actionController]);

  return (MTEpisodeActionController *)v3;
}

- (void)dismissActionSheetsAndPopovers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v2 dismissActionSheetsAndPopovers];
}

- (void)updateActionSheetsAndPopovers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v2 updateActionSheetsAndPopovers];
}

- (void)invalidateSizeMetrics
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v2 invalidateSizeMetrics];
}

- (void)invalidateLayoutMargins
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v2 invalidateLayoutMargins];
}

- (void)fixEmptyTextContainers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v2 fixEmptyTextContainers];
}

- (void)prepareForReuse
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v3 prepareForReuse];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v4 setDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  -[MTCollectionViewCell layoutSubviews](&v23, "layoutSubviews");
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell lockupContainer](self, "lockupContainer"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell lockupContainer](self, "lockupContainer"));
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (-[MTEpisodeCollectionViewCell isExpanded](self, "isExpanded", a3.width, a3.height))
  {
    +[MTCollectionViewCell maximumContentWidth](&OBJC_CLASS___MTEpisodeCollectionViewCell, "maximumContentWidth");
    if (width <= v5) {
      double v6 = width;
    }
    else {
      double v6 = v5;
    }
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    objc_msgSend(v7, "sizeThatFits:", v6, 1.79769313e308);
    double v9 = v8;
  }

  else
  {
    objc_msgSend( (id)objc_opt_class(self),  "estimatedHeightForWidth:style:",  -[MTEpisodeCollectionViewCell style](self, "style"),  width);
    double v9 = v10;
  }

  double v11 = width;
  double v12 = v9;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)updateOverlayForSelectedOrIsNew
{
  if (!-[MTCollectionViewCell isEditing](self, "isEditing")
    && ((-[MTEpisodeCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
     || -[MTEpisodeCollectionViewCell isSelected](self, "isSelected")))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v22 layer]);
    [v23 setBorderColor:0];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
    [v25 setBorderWidth:0.0];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 layer]);
    [v27 setCornerRadius:4.0];

    double v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellHighlightedColor](&OBJC_CLASS___UIColor, "cellHighlightedColor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    [v28 setBackgroundColor:v21];

    goto LABEL_10;
  }

  if (!-[MTCollectionViewCell isEditing](self, "isEditing")
    || -[MTCollectionViewCell exposedActions](self, "exposedActions")
    || !-[MTEpisodeCollectionViewCell isSelected](self, "isSelected"))
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layer]);
    [v16 setBorderColor:0];

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 layer]);
    [v18 setBorderWidth:0.0];

    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 layer]);
    [v20 setCornerRadius:0.0];

    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
    [v21 setBackgroundColor:0];
LABEL_10:

    -[MTEpisodeCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", 0LL);
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell layer](self, "layer"));
    v13 = v12;
    double v14 = 0.0;
    goto LABEL_11;
  }

  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v4 setBorderColor:0];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v6 setBorderWidth:0.0];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  [v8 setCornerRadius:0.0];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellHighlightedColor](&OBJC_CLASS___UIColor, "cellHighlightedColor"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));
  [v10 setBackgroundColor:v9];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellHighlightedColor](&OBJC_CLASS___UIColor, "cellHighlightedColor"));
  -[MTEpisodeCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v11);

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell layer](self, "layer"));
  v13 = v12;
  double v14 = 4.0;
LABEL_11:
  [v12 setCornerRadius:v14];

  -[MTEpisodeCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTEpisodeCollectionViewCell;
  id v5 = -[MTCollectionViewCell hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  double v6 = (MTEpisodeCollectionViewCell *)objc_claimAutoreleasedReturnValue(v5);
  double v7 = (MTEpisodeCollectionViewCell *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCollectionViewCell episodeLockup](self, "episodeLockup"));

  if (v6 == v7)
  {
    double v8 = self;

    double v6 = v8;
  }

  return v6;
}

- (void)lockup:(id)a3 moreButtonTapped:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate"));
  [v6 cell:self moreButtonTapped:v5];
}

- (void)lockupDidChangeSize:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTCollectionViewCell delegate](self, "delegate", a3));
  [v4 cellDidChangeSize:self];
}

- (UIView)lockupContainer
{
  lockupContainer = self->_lockupContainer;
  if (!lockupContainer)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UIView);
    id v5 = self->_lockupContainer;
    self->_lockupContainer = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](&OBJC_CLASS___UIColor, "backgroundColor"));
    -[UIView setBackgroundColor:](self->_lockupContainer, "setBackgroundColor:", v6);

    -[UIView setAutoresizingMask:](self->_lockupContainer, "setAutoresizingMask:", 16LL);
    lockupContainer = self->_lockupContainer;
  }

  return lockupContainer;
}

- (void)clearLayer:(id)a3
{
  id v3 = a3;
  [v3 setBackgroundColor:0];
  [v3 setBorderColor:0];
  [v3 setBorderWidth:0.0];
}

- (void)setLockupContainer:(id)a3
{
}

- (void)setEpisodeLockup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end