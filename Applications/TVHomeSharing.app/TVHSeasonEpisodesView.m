@interface TVHSeasonEpisodesView
- (CGSize)sizeThatFits:(CGSize)a3;
- (TVHSeasonEpisodeInfoView)episodeInfoView;
- (TVHSeasonEpisodesView)initWithFrame:(CGRect)a3;
- (UIFocusGuide)infoToShelfInfoFocusGuide;
- (UIFocusGuide)shelfToInfoFocusGuide;
- (UIView)episodesShelfView;
- (id)preferredFocusEnvironments;
- (void)_addFocusGuides;
- (void)_removeFocusGuides;
- (void)layoutSubviews;
- (void)setEpisodesShelfView:(id)a3;
- (void)setInfoToShelfInfoFocusGuide:(id)a3;
- (void)setShelfToInfoFocusGuide:(id)a3;
@end

@implementation TVHSeasonEpisodesView

- (TVHSeasonEpisodesView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHSeasonEpisodesView;
  v3 = -[TVHSeasonEpisodesView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = -[TVHSeasonEpisodeInfoView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHSeasonEpisodeInfoView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    episodeInfoView = v3->_episodeInfoView;
    v3->_episodeInfoView = v4;

    -[TVHSeasonEpisodeInfoView tvh_setDebugLayoutColorType:](v3->_episodeInfoView, "tvh_setDebugLayoutColorType:", 1LL);
    -[TVHSeasonEpisodesView addSubview:](v3, "addSubview:", v3->_episodeInfoView);
  }

  return v3;
}

- (void)setEpisodesShelfView:(id)a3
{
  v5 = (UIView *)a3;
  episodesShelfView = self->_episodesShelfView;
  if (episodesShelfView != v5)
  {
    objc_super v7 = v5;
    -[UIView removeFromSuperview](episodesShelfView, "removeFromSuperview");
    -[TVHSeasonEpisodesView _removeFocusGuides](self, "_removeFocusGuides");
    objc_storeStrong((id *)&self->_episodesShelfView, a3);
    -[UIView tvh_setDebugLayoutColorType:](self->_episodesShelfView, "tvh_setDebugLayoutColorType:", 4LL);
    if (v7)
    {
      -[TVHSeasonEpisodesView addSubview:](self, "addSubview:", v7);
      -[TVHSeasonEpisodesView _addFocusGuides](self, "_addFocusGuides");
    }

    -[TVHSeasonEpisodesView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodesShelfView](self, "episodesShelfView", a3.width, a3.height));
  objc_msgSend(v5, "sizeThatFits:", width, 1.79769313e308);
  double v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodeInfoView](self, "episodeInfoView"));
  objc_msgSend(v8, "sizeThatFits:", width, 1.79769313e308);
  double v10 = v9;

  double v11 = v7 + 0.0 + 101.0 + v10;
  double v12 = width;
  result.height = v11;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHSeasonEpisodesView;
  -[TVHSeasonEpisodesView layoutSubviews](&v14, "layoutSubviews");
  -[TVHSeasonEpisodesView bounds](self, "bounds");
  double v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodesShelfView](self, "episodesShelfView"));
  objc_msgSend(v5, "sizeThatFits:", v4, 1.79769313e308);
  double v7 = v6;
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodeInfoView](self, "episodeInfoView"));
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.double width = v4;
  v15.size.height = v7;
  CGFloat v9 = CGRectGetMaxY(v15) + 101.0;
  objc_msgSend(v8, "sizeThatFits:", v4, 1.79769313e308);
  double v11 = v10;
  objc_msgSend(v8, "setFrame:", 0.0, v9, v4, v10);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView shelfToInfoFocusGuide](self, "shelfToInfoFocusGuide"));
  objc_msgSend(v12, "_setManualLayoutFrame:", 0.0, v7 + 0.0, v4, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView infoToShelfInfoFocusGuide](self, "infoToShelfInfoFocusGuide"));
  objc_msgSend(v13, "_setManualLayoutFrame:", 0.0, v9 - v11, v4, v11);
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodesShelfView](self, "episodesShelfView"));
  double v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodeInfoView](self, "episodeInfoView"));
    v8 = v6;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  return v5;
}

- (void)_removeFocusGuides
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView shelfToInfoFocusGuide](self, "shelfToInfoFocusGuide"));
  if (v4)
  {
    -[TVHSeasonEpisodesView setShelfToInfoFocusGuide:](self, "setShelfToInfoFocusGuide:", 0LL);
    -[TVHSeasonEpisodesView removeLayoutGuide:](self, "removeLayoutGuide:", v4);
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView infoToShelfInfoFocusGuide](self, "infoToShelfInfoFocusGuide"));
  if (v3)
  {
    -[TVHSeasonEpisodesView setInfoToShelfInfoFocusGuide:](self, "setInfoToShelfInfoFocusGuide:", 0LL);
    -[TVHSeasonEpisodesView removeLayoutGuide:](self, "removeLayoutGuide:", v3);
  }
}

- (void)_addFocusGuides
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodeInfoView](self, "episodeInfoView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodesShelfView](self, "episodesShelfView"));
  if (v4 && v3)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    double v10 = v3;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v5, "setPreferredFocusEnvironments:", v6);

    -[TVHSeasonEpisodesView setShelfToInfoFocusGuide:](self, "setShelfToInfoFocusGuide:", v5);
    -[TVHSeasonEpisodesView addLayoutGuide:](self, "addLayoutGuide:", v5);
    double v7 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    uint64_t v9 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v7, "setPreferredFocusEnvironments:", v8);

    -[TVHSeasonEpisodesView setInfoToShelfInfoFocusGuide:](self, "setInfoToShelfInfoFocusGuide:", v7);
    -[TVHSeasonEpisodesView addLayoutGuide:](self, "addLayoutGuide:", v7);
  }
}

- (UIView)episodesShelfView
{
  return self->_episodesShelfView;
}

- (TVHSeasonEpisodeInfoView)episodeInfoView
{
  return self->_episodeInfoView;
}

- (UIFocusGuide)shelfToInfoFocusGuide
{
  return self->_shelfToInfoFocusGuide;
}

- (void)setShelfToInfoFocusGuide:(id)a3
{
}

- (UIFocusGuide)infoToShelfInfoFocusGuide
{
  return self->_infoToShelfInfoFocusGuide;
}

- (void)setInfoToShelfInfoFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end