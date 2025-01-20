@interface TVPSharedPSActivityImageCell
- (BOOL)isVideo;
- (NSString)assetLocalIdentifier;
- (TVPImageView)bubbleImageView;
- (TVPImageView)videoView;
- (TVPSharedPSActivityImageCell)initWithFrame:(CGRect)a3;
- (UILabel)commentsLabel;
- (unint64_t)totalComments;
- (void)_updatePlaceholderImage;
- (void)layoutSubviews;
- (void)setAssetLocalIdentifier:(id)a3;
- (void)setBubbleImageView:(id)a3;
- (void)setCommentsLabel:(id)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setTotalComments:(unint64_t)a3;
- (void)setTotalComments:(unint64_t)a3 commentBadge:(id)a4;
- (void)setVideoView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVPSharedPSActivityImageCell

- (TVPSharedPSActivityImageCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityImageCell;
  v3 = -[TVPPhotoCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[TVPSharedPSActivityImageCell _updatePlaceholderImage](v3, "_updatePlaceholderImage");
  }
  return v4;
}

- (void)_updatePlaceholderImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityImageCell traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2)
  {
    v5 = &qword_100103370;
    objc_super v6 = (void *)qword_100103370;
    if (!qword_100103370)
    {
      v7 = @"iCloud-Dark";
LABEL_6:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v7));
      v9 = (void *)*v5;
      uint64_t *v5 = v8;

      objc_super v6 = (void *)*v5;
    }
  }

  else
  {
    v5 = &qword_100103368;
    objc_super v6 = (void *)qword_100103368;
    if (!qword_100103368)
    {
      v7 = @"iCloud-Light";
      goto LABEL_6;
    }
  }

  id v10 = v6;
  -[TVPPhotoCell setPlaceholderImage:](self, "setPlaceholderImage:", v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityImageCell traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVPSharedPSActivityImageCell _updatePlaceholderImage](self, "_updatePlaceholderImage");
  }
}

- (void)setTotalComments:(unint64_t)a3 commentBadge:(id)a4
{
  id v21 = a4;
  -[TVPImageView removeFromSuperview](self->_bubbleImageView, "removeFromSuperview");
  bubbleImageView = self->_bubbleImageView;
  self->_bubbleImageView = 0LL;

  self->_totalComments = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___TVPImageView);
  uint64_t v8 = self->_bubbleImageView;
  self->_bubbleImageView = v7;

  if (!qword_100103378)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v21));
    id v10 = (void *)qword_100103378;
    qword_100103378 = v9;
  }

  -[TVPImageView setImage:](self->_bubbleImageView, "setImage:");
  v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  commentsLabel = self->_commentsLabel;
  self->_commentsLabel = v11;

  v13 = self->_commentsLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
  -[UILabel setFont:](v13, "setFont:", v14);

  v15 = self->_commentsLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setTextAlignment:](self->_commentsLabel, "setTextAlignment:", 1LL);
  v17 = self->_commentsLabel;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

  v19 = self->_commentsLabel;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%lu",  self->_totalComments));
  -[UILabel setText:](v19, "setText:", v20);

  -[TVPImageView addSubview:](self->_bubbleImageView, "addSubview:", self->_commentsLabel);
  -[TVPSharedPSActivityImageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIsVideo:(BOOL)a3
{
  videoView = self->_videoView;
  self->_videoView = 0LL;

  self->_isVideo = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___TVPImageView);
  id v7 = self->_videoView;
  self->_videoView = v6;

  if (!qword_100103380)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Video"));
    uint64_t v9 = (void *)qword_100103380;
    qword_100103380 = v8;
  }

  -[TVPImageView setImage:](self->_videoView, "setImage:");
  -[TVPSharedPSActivityImageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityImageCell;
  -[TVPSharedPSActivityImageCell layoutSubviews](&v40, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSActivityImageCell contentView](self, "contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = objc_alloc(&OBJC_CLASS___UIView);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCell imageView](self, "imageView"));
  [v14 bounds];
  v15 = -[UIView initWithFrame:](v13, "initWithFrame:");

  -[UIView addSubview:](v15, "addSubview:", self->_bubbleImageView);
  -[UIView addSubview:](v15, "addSubview:", self->_videoView);
  if (self->_totalComments)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_bubbleImageView, "image"));
    [v16 size];
    double v18 = v9 + -10.0 - v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_bubbleImageView, "image"));
    [v19 size];
    double v21 = v11 + -10.0 - v20;

    bubbleImageView = self->_bubbleImageView;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](bubbleImageView, "image"));
    [v23 size];
    double v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_bubbleImageView, "image"));
    [v26 size];
    -[TVPImageView setFrame:](bubbleImageView, "setFrame:", v18, v21, v25, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_commentsLabel, "text"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
    +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v28,  v29,  v9);

    commentsLabel = self->_commentsLabel;
    -[TVPImageView frame](self->_bubbleImageView, "frame");
    +[TVPPhotoUtilities getFrameForCommentsLabel:textSize:]( &OBJC_CLASS___TVPPhotoUtilities,  "getFrameForCommentsLabel:textSize:");
    -[UILabel setFrame:](commentsLabel, "setFrame:");
  }

  if (self->_isVideo)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoView, "image"));
    [v31 size];
    double v33 = v11 + -10.0 - v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoView, "image"));
    [v34 size];
    double v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPImageView image](self->_videoView, "image"));
    [v37 size];
    double v39 = v38;

    -[TVPImageView setFrame:](self->_videoView, "setFrame:", 10.0, v33, v36, v39);
  }

  -[TVPPhotoCell setOverlay:](self, "setOverlay:", v15);
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (TVPImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
}

- (TVPImageView)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
}

- (UILabel)commentsLabel
{
  return self->_commentsLabel;
}

- (void)setCommentsLabel:(id)a3
{
}

- (unint64_t)totalComments
{
  return self->_totalComments;
}

- (void)setTotalComments:(unint64_t)a3
{
  self->_totalComments = a3;
}

- (void).cxx_destruct
{
}

@end