@interface TVHMediaEntityCollectionPlaybackControlsPreviewView
- (BOOL)showsMoreButton;
- (CGSize)preferredImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViewConstraints;
- (TVHButtonLockup)moreButtonLockup;
- (TVHButtonLockup)shuffleButtonLockup;
- (TVHMediaEntityCollectionPlaybackControlsPreviewView)initWithFrame:(CGRect)a3;
- (TVHMediaEntityCollectionPlaybackControlsPreviewViewDelegate)delegate;
- (TVHMediaImageView)imageView;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (UILayoutGuide)imageViewLayoutGuide;
- (UIStackView)buttonsStackView;
- (id)contextMenuActionsForContextMenuButtonLockup:(id)a3;
- (id)contextMenuTitleForContextMenuButtonLockup:(id)a3;
- (id)preferredFocusEnvironments;
- (unint64_t)imageShape;
- (void)_moreButtonSelected;
- (void)_shuffleButtonSelected;
- (void)setButtonsStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageShape:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewConstraints:(id)a3;
- (void)setMoreButtonLockup:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setShowsMoreButton:(BOOL)a3;
- (void)setShuffleButtonLockup:(id)a3;
- (void)updateConstraints;
@end

@implementation TVHMediaEntityCollectionPlaybackControlsPreviewView

- (TVHMediaEntityCollectionPlaybackControlsPreviewView)initWithFrame:(CGRect)a3
{
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionPlaybackControlsPreviewView;
  v3 = -[TVHMediaEntityCollectionPlaybackControlsPreviewView initWithFrame:]( &v49,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageShape = 0LL;
    v5 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    -[TVHMediaImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVHMediaImageView setContentMode:](v4->_imageView, "setContentMode:", 2LL);
    -[TVHMediaEntityCollectionPlaybackControlsPreviewView addSubview:](v4, "addSubview:", v4->_imageView);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TVHButtonLockup shuffleButtonLockup](&OBJC_CLASS___TVHButtonLockup, "shuffleButtonLockup"));
    shuffleButtonLockup = v4->_shuffleButtonLockup;
    v4->_shuffleButtonLockup = (TVHButtonLockup *)v7;

    -[TVHButtonLockup setTranslatesAutoresizingMaskIntoConstraints:]( v4->_shuffleButtonLockup,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVHButtonLockup addTarget:action:forControlEvents:]( v4->_shuffleButtonLockup,  "addTarget:action:forControlEvents:",  v4,  "_shuffleButtonSelected",  0x2000LL);
    v4->_showsMoreButton = 1;
    if (sub_100073068())
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[TVHButtonLockup moreContextMenuButtonLockupWithDataSource:]( &OBJC_CLASS___TVHButtonLockup,  "moreContextMenuButtonLockupWithDataSource:",  v4));
      moreButtonLockup = v4->_moreButtonLockup;
      v4->_moreButtonLockup = (TVHButtonLockup *)v9;

      -[TVHButtonLockup setShowsMenuAsPrimaryAction:](v4->_moreButtonLockup, "setShowsMenuAsPrimaryAction:", 1LL);
    }

    else
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[TVHButtonLockup moreButtonLockup](&OBJC_CLASS___TVHButtonLockup, "moreButtonLockup"));
      v12 = v4->_moreButtonLockup;
      v4->_moreButtonLockup = (TVHButtonLockup *)v11;

      -[TVHButtonLockup addTarget:action:forControlEvents:]( v4->_moreButtonLockup,  "addTarget:action:forControlEvents:",  v4,  "_moreButtonSelected",  0x2000LL);
    }

    -[TVHButtonLockup setTranslatesAutoresizingMaskIntoConstraints:]( v4->_moreButtonLockup,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v13 = objc_alloc(&OBJC_CLASS___UIStackView);
    v51[0] = v4->_shuffleButtonLockup;
    v51[1] = v4->_moreButtonLockup;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
    v15 = -[UIStackView initWithArrangedSubviews:](v13, "initWithArrangedSubviews:", v14);
    buttonsStackView = v4->_buttonsStackView;
    v4->_buttonsStackView = v15;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_buttonsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAlignment:](v4->_buttonsStackView, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v4->_buttonsStackView, "setSpacing:", 24.0);
    -[TVHMediaEntityCollectionPlaybackControlsPreviewView addSubview:](v4, "addSubview:", v4->_buttonsStackView);
    v17 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    imageViewLayoutGuide = v4->_imageViewLayoutGuide;
    v4->_imageViewLayoutGuide = v17;

    -[TVHMediaEntityCollectionPlaybackControlsPreviewView addLayoutGuide:]( v4,  "addLayoutGuide:",  v4->_imageViewLayoutGuide);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v4->_imageViewLayoutGuide, "centerXAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView centerXAnchor](v4, "centerXAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v50[0] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4->_imageViewLayoutGuide, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView topAnchor](v4, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v44]);
    v50[1] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v4->_imageViewLayoutGuide, "heightAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToConstant:640.0]);
    v50[2] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView centerXAnchor](v4->_imageView, "centerXAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v4->_imageViewLayoutGuide, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v40 constraintEqualToAnchor:v39]);
    v50[3] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView centerYAnchor](v4->_imageView, "centerYAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v4->_imageViewLayoutGuide, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36]);
    v50[4] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup heightAnchor](v4->_moreButtonLockup, "heightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToConstant:122.0]);
    v50[5] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup widthAnchor](v4->_moreButtonLockup, "widthAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToConstant:142.0]);
    v50[6] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup heightAnchor](v4->_shuffleButtonLockup, "heightAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v30 constraintEqualToConstant:122.0]);
    v50[7] = v29;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHButtonLockup widthAnchor](v4->_shuffleButtonLockup, "widthAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToConstant:142.0]);
    v50[8] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v4->_buttonsStackView, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView centerXAnchor](v4, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22]);
    v50[9] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_buttonsStackView, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView topAnchor](v4, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25 constant:700.0]);
    v50[10] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 11LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v27);
  }

  return v4;
}

- (void)setShowsMoreButton:(BOOL)a3
{
  if (self->_showsMoreButton != a3)
  {
    self->_showsMoreButton = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView moreButtonLockup](self, "moreButtonLockup"));
    [v4 setHidden:!self->_showsMoreButton];
  }

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView buttonsStackView](self, "buttonsStackView"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionPlaybackControlsPreviewView;
  -[TVHMediaEntityCollectionPlaybackControlsPreviewView updateConstraints](&v13, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionPlaybackControlsPreviewView imageViewConstraints]( self,  "imageViewConstraints"));
  if (v3) {
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);
  }
  -[TVHMediaEntityCollectionPlaybackControlsPreviewView preferredImageSize](self, "preferredImageSize");
  double v5 = v4;
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView heightAnchor](self->_imageView, "heightAnchor"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToConstant:v7]);
  v14[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView widthAnchor](self->_imageView, "widthAnchor"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToConstant:v5]);
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  -[TVHMediaEntityCollectionPlaybackControlsPreviewView setImageViewConstraints:](self, "setImageViewConstraints:", v12);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = 822.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView imageView](self, "imageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView imageView](self, "imageView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView imageView](self, "imageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView imageView](self, "imageView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (CGSize)preferredImageSize
{
  unint64_t v2 = -[TVHMediaEntityCollectionPlaybackControlsPreviewView imageShape](self, "imageShape");
  double v3 = 640.0;
  double v4 = 618.0;
  if (v2 == 2) {
    double v3 = 348.0;
  }
  else {
    double v4 = 640.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setImageShape:(unint64_t)a3
{
  if (self->_imageShape != a3)
  {
    self->_imageShape = a3;
    -[TVHMediaEntityCollectionPlaybackControlsPreviewView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (id)contextMenuActionsForContextMenuButtonLockup:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView delegate](self, "delegate", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 moreContextMenuActionsForMediaEntityCollectionPreviewPlaybackControlsView:self]);

  if (v5) {
    double v6 = v5;
  }
  else {
    double v6 = &__NSArray0__struct;
  }
  id v7 = v6;

  return v7;
}

- (id)contextMenuTitleForContextMenuButtonLockup:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "moreContextMenuTitleForMediaEntityCollectionPreviewPlaybackControlsView:") & 1) != 0) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 moreContextMenuTitleForMediaEntityCollectionPreviewPlaybackControlsView:self]);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (void)_shuffleButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView delegate](self, "delegate"));
  [v3 mediaEntityCollectionPreviewPlaybackControlsViewDidSelectShuffleButton:self];
}

- (void)_moreButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionPlaybackControlsPreviewView delegate](self, "delegate"));
  [v3 mediaEntityCollectionPreviewPlaybackControlsViewDidSelectMoreButton:self];
}

- (unint64_t)imageShape
{
  return self->_imageShape;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (TVHMediaEntityCollectionPlaybackControlsPreviewViewDelegate)delegate
{
  return (TVHMediaEntityCollectionPlaybackControlsPreviewViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHMediaImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
}

- (TVHButtonLockup)moreButtonLockup
{
  return self->_moreButtonLockup;
}

- (void)setMoreButtonLockup:(id)a3
{
}

- (TVHButtonLockup)shuffleButtonLockup
{
  return self->_shuffleButtonLockup;
}

- (void)setShuffleButtonLockup:(id)a3
{
}

- (UILayoutGuide)imageViewLayoutGuide
{
  return self->_imageViewLayoutGuide;
}

- (NSArray)imageViewConstraints
{
  return self->_imageViewConstraints;
}

- (void)setImageViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end