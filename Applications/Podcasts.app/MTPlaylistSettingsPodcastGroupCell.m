@interface MTPlaylistSettingsPodcastGroupCell
- (MTArtworkView)artworkView;
- (MTPlaylistSettingsPodcastGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
@end

@implementation MTPlaylistSettingsPodcastGroupCell

- (MTPlaylistSettingsPodcastGroupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsPodcastGroupCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___MTArtworkView);
    -[MTPlaylistSettingsPodcastGroupCell setArtworkView:](v4, "setArtworkView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell artworkView](v4, "artworkView"));
    [v6 addSubview:v7];
  }

  return v4;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___MTPlaylistSettingsPodcastGroupCell;
  -[MTTableViewCell layoutSubviews](&v55, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell contentView](self, "contentView"));
  [v3 bounds];
  CGFloat v49 = v5;
  CGFloat v50 = v4;
  CGFloat v48 = v6;
  CGFloat rect = v7;

  id v8 = -[MTPlaylistSettingsPodcastGroupCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  -[MTPlaylistSettingsPodcastGroupCell layoutMargins](self, "layoutMargins");
  double v10 = v9;
  double y = CGRectZero.origin.y;
  +[MTPlaylistSettingsViewController podcastImageSize]( &OBJC_CLASS___MTPlaylistSettingsViewController,  "podcastImageSize");
  double v13 = v12;
  double v15 = v14;
  id v16 = -[MTPlaylistSettingsPodcastGroupCell bounds](self, "bounds");
  double v21 = IMRectCenteredYInRectScale(v16, v10, y, v13, v15, v17, v18, v19, v20, 0.0);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  [v28 frame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v56.origin.x = v21;
  double v53 = v25;
  double v54 = v23;
  v56.origin.double y = v23;
  v56.size.width = v25;
  v56.size.height = v27;
  double v35 = CGRectGetMaxX(v56) + 14.0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  [v36 frame];
  double v38 = v32 - (v35 - v37);

  v57.origin.x = v35;
  v57.origin.double y = v30;
  v57.size.width = v38;
  v57.size.height = v34;
  double MinX = CGRectGetMinX(v57);
  double v40 = MinX;
  if (v8 == (id)1)
  {
    double v47 = MinX;
    v58.origin.x = v50;
    v58.origin.double y = v49;
    v58.size.width = v48;
    v58.size.height = rect;
    CGFloat v52 = v27;
    double MaxX = CGRectGetMaxX(v58);
    v59.origin.x = v21;
    v59.origin.double y = v54;
    v59.size.width = v53;
    v59.size.height = v52;
    double v42 = MaxX - CGRectGetWidth(v59);
    v60.origin.x = v21;
    v60.origin.double y = v54;
    v60.size.width = v53;
    v60.size.height = v52;
    double v21 = v42 - CGRectGetMinX(v60);
    v61.origin.x = v50;
    v61.origin.double y = v49;
    double v40 = v47;
    v61.size.width = v48;
    v61.size.height = rect;
    double v43 = CGRectGetMaxX(v61);
    v62.origin.x = v35;
    v62.origin.double y = v30;
    v62.size.height = v34;
    v62.size.width = v38;
    double v44 = v43 - CGRectGetWidth(v62);
    v63.origin.x = v35;
    v63.origin.double y = v30;
    v63.size.height = v34;
    v63.size.width = v38;
    double v35 = v44 - CGRectGetMinX(v63);
    double v27 = v52;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell textLabel](self, "textLabel"));
  objc_msgSend(v45, "setFrame:", v35, v30, v38, v34);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSettingsPodcastGroupCell artworkView](self, "artworkView"));
  objc_msgSend(v46, "setFrame:", v21, v54, v53, v27);

  -[MTPlaylistSettingsPodcastGroupCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v40, 0.0, 0.0);
}

- (MTArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end