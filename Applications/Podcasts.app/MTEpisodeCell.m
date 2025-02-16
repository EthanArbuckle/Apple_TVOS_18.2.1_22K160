@interface MTEpisodeCell
+ (CGSize)artworkSizeForStyle:(unint64_t)a3;
+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4;
+ (double)maximumContentWidthForStyle:(unint64_t)a3;
+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isExpanded;
- (BOOL)shouldShowNowPlaying;
- (BOOL)swipeActionsExposed;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTColorTheme)colorTheme;
- (MTEpisode)episode;
- (MTEpisodeActionController)actionController;
- (MTEpisodeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTEpisodeCellDelegate)delegate;
- (MTEpisodeLockup)episodeLockup;
- (unint64_t)explicitTreatment;
- (unint64_t)style;
- (void)dismissActionSheetsAndPopovers;
- (void)fixEmptyTextContainers;
- (void)layoutSubviews;
- (void)lockup:(id)a3 moreButtonTapped:(id)a4;
- (void)lockupDidChangeSize:(id)a3;
- (void)prepareForReuse;
- (void)setColorTheme:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEpisode:(id)a3;
- (void)setEpisodeLockup:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExplicitTreatment:(unint64_t)a3;
- (void)setShouldShowNowPlaying:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setupCell;
- (void)updateActionSheetsAndPopovers;
- (void)updateCurrentRowHeight;
@end

@implementation MTEpisodeCell

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
  return result;
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

- (MTEpisodeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTEpisodeCell;
  double v4 = -[MTEpisodeCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4) {
    -[MTEpisodeCell setupCell](v4, "setupCell");
  }
  return v5;
}

- (void)setupCell
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell contentView](self, "contentView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v4 addSubview:v3];
}

- (MTEpisodeLockup)episodeLockup
{
  episodeLockup = self->_episodeLockup;
  if (!episodeLockup)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTEpisodeLockup);
    v5 = self->_episodeLockup;
    self->_episodeLockup = v4;

    -[MTEpisodeLockup setDelegate:](self->_episodeLockup, "setDelegate:", self);
    episodeLockup = self->_episodeLockup;
  }

  return episodeLockup;
}

- (void)setStyle:(unint64_t)a3
{
  if (-[MTEpisodeCell style](self, "style") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    [v5 setStyle:a3];

    -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }

- (unint64_t)style
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  id v3 = [v2 style];

  return (unint64_t)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (-[MTEpisodeCell isEditing](self, "isEditing") != a3)
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    [v7 setEditing:v5];

    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTEpisodeCell;
    -[MTEpisodeCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
    -[MTEpisodeCell updateOverlayForIsNew](self, "updateOverlayForIsNew");
  }

- (void)updateCurrentRowHeight
{
  double v4 = v3;
  double v6 = v5;
  -[MTEpisodeCell sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
  if (v4 != v8 || v6 != v7)
  {
    double v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell _tableView](self, "_tableView"));
    id v13 = (id)objc_claimAutoreleasedReturnValue([v11 indexPathForCell:self]);

    if (v13)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell _tableView](self, "_tableView"));
      [v12 _setHeight:v13 forRowAtIndexPath:v10];
    }

    -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setEpisode:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v5 setEpisode:v4];

  -[MTEpisodeCell updateOverlayForIsNew](self, "updateOverlayForIsNew");
}

- (MTEpisode)episode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episode]);

  return (MTEpisode *)v3;
}

- (void)setColorTheme:(id)a3
{
  id v11 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell colorTheme](self, "colorTheme"));
  double v5 = v11;
  if (v4 == v11) {
    goto LABEL_4;
  }
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell colorTheme](self, "colorTheme"));
  unsigned __int8 v7 = [v6 isEqual:v11];

  if ((v7 & 1) == 0)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    [v8 setColorTheme:v11];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColorForTheme:](&OBJC_CLASS___UIColor, "backgroundColorForTheme:", v11));
    -[MTEpisodeCell setBackgroundColor:](self, "setBackgroundColor:", v9);

    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor selectedBackgroundColorForTheme:]( &OBJC_CLASS___UIColor,  "selectedBackgroundColorForTheme:",  v11));
    double v10 = objc_opt_new(&OBJC_CLASS___UIView);
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v5);
    -[MTEpisodeCell setMultipleSelectionBackgroundView:](self, "setMultipleSelectionBackgroundView:", v10);
    -[MTEpisodeCell setSelectionTintColor:](self, "setSelectionTintColor:", v5);

LABEL_4:
  }
}

- (MTColorTheme)colorTheme
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 colorTheme]);

  return (MTColorTheme *)v3;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v5 setExpanded:v3];

  -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isExpanded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 isExpanded];

  return v3;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v4 setCurrentPlayerItem:v3];
}

- (BOOL)isCurrentPlayerItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 isCurrentPlayerItem];

  return v3;
}

- (BOOL)shouldShowNowPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  unsigned __int8 v3 = [v2 shouldShowNowPlaying];

  return v3;
}

- (void)setShouldShowNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v4 setShouldShowNowPlaying:v3];
}

- (MTEpisodeActionController)actionController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 actionController]);

  return (MTEpisodeActionController *)v3;
}

- (void)dismissActionSheetsAndPopovers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v2 dismissActionSheetsAndPopovers];
}

- (void)updateActionSheetsAndPopovers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v2 updateActionSheetsAndPopovers];
}

- (void)fixEmptyTextContainers
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v2 fixEmptyTextContainers];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTEpisodeCell;
  -[MTEpisodeCell prepareForReuse](&v5, "prepareForReuse");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v3 prepareForReuse];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  [v4 setDelegate:self];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTEpisodeCell;
  -[MTEpisodeCell layoutSubviews](&v13, "layoutSubviews");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell layoutManager](self, "layoutManager", a3.width, a3.height));
  objc_msgSend( v5,  "contentRectForCell:forState:rowWidth:",  self,  -[MTEpisodeCell currentStateMask](self, "currentStateMask"),  width);
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v8, "sizeThatFits:", v7, 1.79769313e308);
  double v10 = v9;

  double v11 = v10 + kMTCollectionViewInterLineSpacing;
  double v12 = width;
  result.height = v11;
  result.double width = v12;
  return result;
}

- (BOOL)swipeActionsExposed
{
  return ((unint64_t)-[MTEpisodeCell currentStateMask](self, "currentStateMask") >> 1) & 1;
}

- (void)lockup:(id)a3 moreButtonTapped:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell delegate](self, "delegate"));
  [v6 cell:self moreButtonTapped:v5];
}

- (void)lockupDidChangeSize:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell delegate](self, "delegate", a3));
  [v4 cellDidChangeSize:self];
}

- (MTEpisodeCellDelegate)delegate
{
  return (MTEpisodeCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)explicitTreatment
{
  return self->_explicitTreatment;
}

- (void)setExplicitTreatment:(unint64_t)a3
{
  self->_explicitTreatment = a3;
}

- (void)setEpisodeLockup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end