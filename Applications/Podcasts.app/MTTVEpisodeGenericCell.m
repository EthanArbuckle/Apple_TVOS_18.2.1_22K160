@interface MTTVEpisodeGenericCell
+ (double)height;
- (BOOL)isCurrentPlayerItem;
- (MTEpisode)episode;
- (MTTVEpisodeGenericCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTTVEpisodePlayStatusView)playStatusView;
- (unint64_t)explicitTreatment;
- (void)_ensureFocusedFloatingContentView;
- (void)configureSubviews;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setEpisode:(id)a3;
- (void)setExplicitTreatment:(unint64_t)a3;
- (void)setPlayStatusView:(id)a3;
- (void)updatePlayStatusForCurrentPlayerItemDidChange;
@end

@implementation MTTVEpisodeGenericCell

+ (double)height
{
  return 70.0;
}

- (MTTVEpisodeGenericCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeGenericCell;
  v4 = -[MTTVEpisodeGenericCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTTVEpisodeGenericCell configureSubviews](v4, "configureSubviews");
    -[MTTVEpisodeGenericCell setExplicitTreatment:](v5, "setExplicitTreatment:", 0LL);
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeGenericCell;
  -[MTTVEpisodeGenericCell dealloc](&v4, "dealloc");
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    self->_currentPlayerItem = a3;
    -[MTTVEpisodeGenericCell updatePlayStatusForCurrentPlayerItemDidChange]( self,  "updatePlayStatusForCurrentPlayerItemDidChange");
  }

- (void)updatePlayStatusForCurrentPlayerItemDidChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
  objc_msgSend(v3, "setCurrentPlayerItem:", -[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem"));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVEpisodeGenericCell;
  -[MTTVEpisodeGenericCell prepareForReuse](&v3, "prepareForReuse");
  -[MTTVEpisodeGenericCell setEpisode:](self, "setEpisode:", 0LL);
  -[MTTVEpisodeGenericCell setCurrentPlayerItem:](self, "setCurrentPlayerItem:", 0LL);
}

- (void)configureSubviews
{
}

- (MTTVEpisodePlayStatusView)playStatusView
{
  playStatusView = self->_playStatusView;
  if (!playStatusView)
  {
    objc_super v4 = objc_opt_new(&OBJC_CLASS___MTTVEpisodePlayStatusView);
    v5 = self->_playStatusView;
    self->_playStatusView = v4;

    -[MTTVEpisodePlayStatusView sizeToFit](self->_playStatusView, "sizeToFit");
    playStatusView = self->_playStatusView;
  }

  return playStatusView;
}

- (void)_ensureFocusedFloatingContentView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeGenericCell;
  -[MTTVEpisodeGenericCell _ensureFocusedFloatingContentView](&v7, "_ensureFocusedFloatingContentView");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell floatingContentView](self, "floatingContentView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 backgroundColorForState:4]);

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell floatingContentView](self, "floatingContentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell mt_selectedCellColor](self, "mt_selectedCellColor"));
    [v5 setBackgroundColor:v6 forState:4];
  }

- (MTEpisode)episode
{
  return self->_episode;
}

- (void)setEpisode:(id)a3
{
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (unint64_t)explicitTreatment
{
  return self->_explicitTreatment;
}

- (void)setExplicitTreatment:(unint64_t)a3
{
  self->_explicitTreatment = a3;
}

- (void)setPlayStatusView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end