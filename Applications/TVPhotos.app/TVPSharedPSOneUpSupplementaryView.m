@interface TVPSharedPSOneUpSupplementaryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)commentsBadgeResource;
- (TVPSharedPSOneUpSupplementaryView)init;
- (UIImageView)bubbleImageView;
- (UIImageView)swipeUpChevronImageView;
- (UILabel)commentsTextView;
- (UIView)commentsBubbleView;
- (unint64_t)totalComments;
- (void)_addSubviews;
- (void)layoutSubviews;
- (void)setBubbleImageView:(id)a3;
- (void)setCommentsBadgeResource:(id)a3;
- (void)setCommentsBubbleView:(id)a3;
- (void)setCommentsTextView:(id)a3;
- (void)setSwipeUpChevronImageView:(id)a3;
- (void)setTotalComments:(unint64_t)a3;
@end

@implementation TVPSharedPSOneUpSupplementaryView

- (TVPSharedPSOneUpSupplementaryView)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneUpSupplementaryView;
  v2 = -[TVPSharedPSOneUpSupplementaryView init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TVPSharedPSOneUpSupplementaryView _addSubviews](v2, "_addSubviews");
  }
  return v3;
}

- (void)setCommentsBadgeResource:(id)a3
{
  id v12 = a3;
  -[UIView removeFromSuperview](self->_commentsBubbleView, "removeFromSuperview");
  commentsBubbleView = self->_commentsBubbleView;
  self->_commentsBubbleView = 0LL;

  if (v12)
  {
    objc_storeStrong((id *)&self->_commentsBadgeResource, a3);
    v6 = objc_alloc_init(&OBJC_CLASS___UIView);
    v7 = self->_commentsBubbleView;
    self->_commentsBubbleView = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    bubbleImageView = self->_bubbleImageView;
    self->_bubbleImageView = v8;

    v10 = self->_bubbleImageView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v12));
    -[UIImageView setImage:](v10, "setImage:", v11);

    -[UIView addSubview:](self->_commentsBubbleView, "addSubview:", self->_bubbleImageView);
    -[TVPSharedPSOneUpSupplementaryView addSubview:](self, "addSubview:", self->_commentsBubbleView);
  }
}

- (void)setTotalComments:(unint64_t)a3
{
  commentsTextView = self->_commentsTextView;
  self->_commentsTextView = 0LL;

  self->_totalComments = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
  v7 = self->_commentsTextView;
  self->_commentsTextView = v6;

  v8 = self->_commentsTextView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  v10 = self->_commentsTextView;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"%lu",  a3));
  -[UILabel setText:](v10, "setText:", v11);

  id v12 = self->_commentsTextView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[UILabel setTextAlignment:](self->_commentsTextView, "setTextAlignment:", 1LL);
  -[UIView addSubview:](self->_commentsBubbleView, "addSubview:", self->_commentsTextView);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_swipeUpChevronImageView, "image", a3.width, a3.height));
  [v4 size];
  double v6 = v5 + 20.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_bubbleImageView, "image"));
  [v7 size];
  double v9 = v6 + v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_bubbleImageView, "image"));
  [v10 size];
  double v12 = v11 + 2.0;

  double v13 = v9;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVPSharedPSOneUpSupplementaryView;
  -[TVPSharedPSOneUpSupplementaryView layoutSubviews](&v35, "layoutSubviews");
  -[UIImageView setCenter:](self->_swipeUpChevronImageView, "setCenter:", 100.0, 100.0);
  swipeUpChevronImageView = self->_swipeUpChevronImageView;
  CGAffineTransformMakeRotation(&v34, -1.57079633);
  -[UIImageView setTransform:](swipeUpChevronImageView, "setTransform:", &v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_bubbleImageView, "image"));
  [v4 size];
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_swipeUpChevronImageView, "image"));
  [v7 size];
  float v9 = (v6 - v8) * 0.5;
  double v10 = floorf(v9);

  double v11 = self->_swipeUpChevronImageView;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](v11, "image"));
  [v12 size];
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_swipeUpChevronImageView, "image"));
  [v15 size];
  -[UIImageView setFrame:](v11, "setFrame:", 0.0, v10, v14, v16);

  commentsBubbleView = self->_commentsBubbleView;
  -[UIImageView frame](self->_swipeUpChevronImageView, "frame");
  double v19 = v18 + 20.0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_bubbleImageView, "image"));
  [v20 size];
  double v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_bubbleImageView, "image"));
  [v23 size];
  -[UIView setFrame:](commentsBubbleView, "setFrame:", v19, 0.0, v22, v24);

  bubbleImageView = self->_bubbleImageView;
  -[UIView bounds](self->_commentsBubbleView, "bounds");
  -[UIImageView setFrame:](bubbleImageView, "setFrame:");
  commentsTextView = self->_commentsTextView;
  if (self->_totalComments < 0x64)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](commentsTextView, "setFont:", v30);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_commentsTextView, "text"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  }

  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
    -[UILabel setFont:](commentsTextView, "setFont:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_commentsTextView, "text"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
  }

  v31 = (void *)v29;
  -[UIView bounds](self->_commentsBubbleView, "bounds");
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v28,  v31,  v32);

  v33 = self->_commentsTextView;
  -[UIView bounds](self->_commentsBubbleView, "bounds");
  +[TVPPhotoUtilities getFrameForCommentsLabel:textSize:]( &OBJC_CLASS___TVPPhotoUtilities,  "getFrameForCommentsLabel:textSize:");
  -[UILabel setFrame:](v33, "setFrame:");
}

- (void)_addSubviews
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"ChevronArrow"));
  v3 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v5);
  swipeUpChevronImageView = self->_swipeUpChevronImageView;
  self->_swipeUpChevronImageView = v3;

  -[TVPSharedPSOneUpSupplementaryView addSubview:](self, "addSubview:", self->_swipeUpChevronImageView);
}

- (NSString)commentsBadgeResource
{
  return self->_commentsBadgeResource;
}

- (unint64_t)totalComments
{
  return self->_totalComments;
}

- (UIView)commentsBubbleView
{
  return self->_commentsBubbleView;
}

- (void)setCommentsBubbleView:(id)a3
{
}

- (UILabel)commentsTextView
{
  return self->_commentsTextView;
}

- (void)setCommentsTextView:(id)a3
{
}

- (UIImageView)swipeUpChevronImageView
{
  return self->_swipeUpChevronImageView;
}

- (void)setSwipeUpChevronImageView:(id)a3
{
}

- (UIImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end