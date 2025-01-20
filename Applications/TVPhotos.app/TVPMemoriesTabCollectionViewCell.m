@interface TVPMemoriesTabCollectionViewCell
- (BOOL)canBecomeFocused;
- (CGRect)normalizedCropRect;
- (NSString)assetLocalId;
- (NSString)memorySubtitle;
- (NSString)memoryTitle;
- (PXImageUIView)imageView;
- (PXStoryTVCellSpec)memorySpec;
- (TVPMemoriesTabCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UILabel)memorySubtitleLabel;
- (UILabel)memoryTitleLabel;
- (UIView)containerView;
- (_UIFloatingContentView)floatingContentView;
- (double)desiredTopOffset;
- (double)verticalContentOffset;
- (void)_updateFloatingContentView;
- (void)configureLabels;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAssetLocalId:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMemorySpec:(id)a3;
- (void)setMemorySubtitle:(id)a3;
- (void)setMemorySubtitleLabel:(id)a3;
- (void)setMemoryTitle:(id)a3;
- (void)setMemoryTitleLabel:(id)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)setVerticalContentOffset:(double)a3;
@end

@implementation TVPMemoriesTabCollectionViewCell

- (TVPMemoriesTabCollectionViewCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  v3 = -[TVPMemoriesTabCollectionViewCell initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
    -[TVPMemoriesTabCollectionViewCell bounds](v3, "bounds");
    v5 = -[_UIFloatingContentView initWithFrame:](v4, "initWithFrame:");
    floatingContentView = v3->_floatingContentView;
    v3->_floatingContentView = v5;

    -[_UIFloatingContentView setContentMotionRotation:translation:]( v3->_floatingContentView,  "setContentMotionRotation:translation:",  0.08,  0.08,  12.0,  12.0);
    -[_UIFloatingContentView setContinuousCornerEnabled:](v3->_floatingContentView, "setContinuousCornerEnabled:", 1LL);
    -[_UIFloatingContentView setFocusedSizeIncrease:](v3->_floatingContentView, "setFocusedSizeIncrease:", 60.0);
    -[_UIFloatingContentView setShadowRadius:](v3->_floatingContentView, "setShadowRadius:", 35.0);
    -[_UIFloatingContentView setShadowVerticalOffset:](v3->_floatingContentView, "setShadowVerticalOffset:", 50.0);
    -[_UIFloatingContentView setShadowOpacity:](v3->_floatingContentView, "setShadowOpacity:", 0.3);
    -[_UIFloatingContentView setUnfocusedShadowRadius:](v3->_floatingContentView, "setUnfocusedShadowRadius:", 12.0);
    -[_UIFloatingContentView setUnfocusedShadowVerticalOffset:]( v3->_floatingContentView,  "setUnfocusedShadowVerticalOffset:",  4.0);
    -[_UIFloatingContentView setUnfocusedShadowOpacity:](v3->_floatingContentView, "setUnfocusedShadowOpacity:", 0.4);
    -[_UIFloatingContentView setHighContrastFocusIndicatorOutset:]( v3->_floatingContentView,  "setHighContrastFocusIndicatorOutset:",  10.0,  10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell contentView](v3, "contentView"));
    [v7 addSubview:v3->_floatingContentView];

    v8 = objc_alloc_init(&OBJC_CLASS___PXFeatureSpec);
    id v9 = objc_alloc_init(&OBJC_CLASS___PXImageViewSpec);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PXFeatureSpec collectionTileImageOverlaySpecs](v8, "collectionTileImageOverlaySpecs"));
    [v9 setOverlaySpecs:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](v3, "floatingContentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentView]);

    v13 = objc_alloc(&OBJC_CLASS___PXImageUIView);
    [v12 bounds];
    v14 = -[PXImageUIView initWithFrame:](v13, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v14;

    -[PXImageUIView setSpec:](v3->_imageView, "setSpec:", v9);
    -[PXImageUIView setContentMode:](v3->_imageView, "setContentMode:", 2LL);
    [v12 addSubview:v3->_imageView];
    v3->_normalizedCropRect.origin.x = 0.0;
    v3->_normalizedCropRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    v3->_normalizedCropRect.size = _Q0;
    -[TVPMemoriesTabCollectionViewCell configureLabels](v3, "configureLabels");
    -[TVPMemoriesTabCollectionViewCell _updateFloatingContentView](v3, "_updateFloatingContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v3 selector:"_updateFloatingContentView" name:kAXSHighContrastFocusIndicatorsEnabledNotification object:0];
  }

  return v3;
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v7 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell image](self, "image"));
  if (v4 == v7)
  {
  }

  else
  {
    unsigned __int8 v5 = [v7 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell imageView](self, "imageView"));
      [v6 setImage:v7];

      -[TVPMemoriesTabCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (NSString)memoryTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setMemoryTitle:(id)a3
{
  v11 = (NSString *)a3;
  id v4 = self->_memoryTitle;
  unsigned __int8 v5 = v11;
  if (v4 == v11) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = -[NSString isEqualToString:](v11, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    id v7 = (NSString *)-[NSString copy](v11, "copy");
    memoryTitle = self->_memoryTitle;
    self->_memoryTitle = v7;

    unsigned __int8 v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySpec](self, "memorySpec"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString attributedStringForTitle:](v5, "attributedStringForTitle:", self->_memoryTitle));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memoryTitleLabel](self, "memoryTitleLabel"));
    [v10 setAttributedText:v9];

LABEL_4:
  }
}

- (NSString)memorySubtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setMemorySubtitle:(id)a3
{
  v11 = (NSString *)a3;
  id v4 = self->_memorySubtitle;
  unsigned __int8 v5 = v11;
  if (v4 == v11) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = -[NSString isEqualToString:](v11, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    id v7 = (NSString *)-[NSString copy](v11, "copy");
    memorySubtitle = self->_memorySubtitle;
    self->_memorySubtitle = v7;

    unsigned __int8 v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySpec](self, "memorySpec"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString attributedStringForSubtitle:](v5, "attributedStringForSubtitle:", self->_memorySubtitle));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell memorySubtitleLabel](self, "memorySubtitleLabel"));
    [v10 setAttributedText:v9];

LABEL_4:
  }
}

- (void)setVerticalContentOffset:(double)a3
{
  if (self->_verticalContentOffset != a3)
  {
    self->_verticalContentOffset = a3;
    -[TVPMemoriesTabCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (double)desiredTopOffset
{
  return 16.0;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell layoutSubviews](&v20, "layoutSubviews");
  -[TVPMemoriesTabCollectionViewCell bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  -[TVPMemoriesTabCollectionViewCell verticalContentOffset](self, "verticalContentOffset");
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  objc_msgSend(v9, "setFrame:", 0.0, v8, v4, v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v4, v6);

  -[TVPMemoriesTabCollectionViewCell normalizedCropRect](self, "normalizedCropRect");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v19, "setContentsRect:", v12, v14, v16, v18);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  id v6 = a4;
  -[TVPMemoriesTabCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  else {
    uint64_t v7 = 0LL;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  [v8 setControlState:v7 withAnimationCoordinator:v6];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell pressesBegan:withEvent:](&v6, "pressesBegan:withEvent:", a3, a4);
  if (-[TVPMemoriesTabCollectionViewCell isFocused](self, "isFocused"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
    [v5 setControlState:9 animated:1];
  }

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell pressesEnded:withEvent:](&v6, "pressesEnded:withEvent:", a3, a4);
  if (-[TVPMemoriesTabCollectionViewCell isFocused](self, "isFocused"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
    [v5 setControlState:8 animated:1];
  }

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell pressesCancelled:withEvent:](&v6, "pressesCancelled:withEvent:", a3, a4);
  if (-[TVPMemoriesTabCollectionViewCell isFocused](self, "isFocused"))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
    [v5 setControlState:8 animated:1];
  }

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPMemoriesTabCollectionViewCell;
  -[TVPMemoriesTabCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  [v3 setControlState:0];

  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell imageView](self, "imageView"));
  [v4 setImage:0];

  -[TVPMemoriesTabCollectionViewCell setAssetLocalId:](self, "setAssetLocalId:", 0LL);
  -[TVPMemoriesTabCollectionViewCell setNormalizedCropRect:](self, "setNormalizedCropRect:", 0.0, 0.0, 1.0, 1.0);
  -[TVPMemoriesTabCollectionViewCell setMemoryTitle:](self, "setMemoryTitle:", 0LL);
  -[TVPMemoriesTabCollectionViewCell setMemorySubtitle:](self, "setMemorySubtitle:", 0LL);
  -[TVPMemoriesTabCollectionViewCell setMemorySpec:](self, "setMemorySpec:", 0LL);
}

- (UIView)containerView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentView]);

  return (UIView *)v3;
}

- (void)configureLabels
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v3 contentView]);

  objc_super v5 = (UILabel *)objc_opt_new(&OBJC_CLASS___UILabel, v4);
  memorySubtitleLabel = self->_memorySubtitleLabel;
  self->_memorySubtitleLabel = v5;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_memorySubtitleLabel, "setTextColor:", v7);

  [v12 addSubview:self->_memorySubtitleLabel];
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_memorySubtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  objc_super v9 = (UILabel *)objc_opt_new(&OBJC_CLASS___UILabel, v8);
  memoryTitleLabel = self->_memoryTitleLabel;
  self->_memoryTitleLabel = v9;

  -[UILabel setNumberOfLines:](self->_memoryTitleLabel, "setNumberOfLines:", 2LL);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_memoryTitleLabel, "setTextColor:", v11);

  [v12 addSubview:self->_memoryTitleLabel];
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_memoryTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
}

- (void)_updateFloatingContentView
{
  BOOL v3 = _AXSHighContrastFocusIndicatorsEnabled(self, a2) != 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVPMemoriesTabCollectionViewCell floatingContentView](self, "floatingContentView"));
  [v4 setShowsHighContrastFocusIndicator:v3];
}

- (NSString)assetLocalId
{
  return self->_assetLocalId;
}

- (void)setAssetLocalId:(id)a3
{
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (PXStoryTVCellSpec)memorySpec
{
  return self->_memorySpec;
}

- (void)setMemorySpec:(id)a3
{
}

- (double)verticalContentOffset
{
  return self->_verticalContentOffset;
}

- (PXImageUIView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)memoryTitleLabel
{
  return self->_memoryTitleLabel;
}

- (void)setMemoryTitleLabel:(id)a3
{
}

- (UILabel)memorySubtitleLabel
{
  return self->_memorySubtitleLabel;
}

- (void)setMemorySubtitleLabel:(id)a3
{
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void).cxx_destruct
{
}

@end