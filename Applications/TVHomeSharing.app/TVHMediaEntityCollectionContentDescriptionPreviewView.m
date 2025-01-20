@interface TVHMediaEntityCollectionContentDescriptionPreviewView
- (CGSize)preferredImageSize;
- (NSArray)imageViewSizeConstraints;
- (NSAttributedString)contentDescription;
- (NSCopying)mediaEntityIdentifier;
- (NSString)mediaEntityTitle;
- (TVFocusableTextView)contentDescriptionTextView;
- (TVHMediaEntityCollectionContentDescriptionPreviewView)initWithFrame:(CGRect)a3;
- (TVHMediaEntityCollectionContentDescriptionPreviewViewDelegate)delegate;
- (TVHMediaImageView)imageView;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (unint64_t)imageShape;
- (void)_didSelectContentDescriptionText;
- (void)setContentDescription:(id)a3;
- (void)setContentDescriptionTextView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageShape:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewSizeConstraints:(id)a3;
- (void)setMediaEntityIdentifier:(id)a3;
- (void)setMediaEntityTitle:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)updateConstraints;
@end

@implementation TVHMediaEntityCollectionContentDescriptionPreviewView

- (TVHMediaEntityCollectionContentDescriptionPreviewView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionContentDescriptionPreviewView;
  v3 = -[TVHMediaEntityCollectionContentDescriptionPreviewView initWithFrame:]( &v36,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageShape = 0LL;
    v5 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    -[TVHMediaImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVHMediaImageView setContentMode:](v4->_imageView, "setContentMode:", 2LL);
    -[TVHMediaImageView tvh_setDebugLayoutColorType:](v4->_imageView, "tvh_setDebugLayoutColorType:", 6LL);
    -[TVHMediaEntityCollectionContentDescriptionPreviewView addSubview:](v4, "addSubview:", v4->_imageView);
    v7 = objc_alloc_init(&OBJC_CLASS___TVFocusableTextView);
    contentDescriptionTextView = v4->_contentDescriptionTextView;
    v4->_contentDescriptionTextView = v7;

    -[TVFocusableTextView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_contentDescriptionTextView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVFocusableTextView setMaximumNumberOfLines:](v4->_contentDescriptionTextView, "setMaximumNumberOfLines:", 7LL);
    -[TVFocusableTextView tvh_setDebugLayoutColorType:]( v4->_contentDescriptionTextView,  "tvh_setDebugLayoutColorType:",  1LL);
    -[TVHMediaEntityCollectionContentDescriptionPreviewView addSubview:]( v4,  "addSubview:",  v4->_contentDescriptionTextView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));

    -[TVFocusableTextView setDescriptionTextColor:](v4->_contentDescriptionTextView, "setDescriptionTextColor:", v32);
    objc_initWeak(&location, v4);
    v11 = v4->_contentDescriptionTextView;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100075E80;
    v33[3] = &unk_1000FD8E8;
    objc_copyWeak(&v34, &location);
    -[TVFocusableTextView setSelectionHandler:](v11, "setSelectionHandler:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView centerXAnchor](v4->_imageView, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView centerXAnchor](v4, "centerXAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v30]);
    v37[0] = v29;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView topAnchor](v4->_imageView, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView topAnchor](v4, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v27 constant:100.0]);
    v37[1] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVFocusableTextView leadingAnchor](v4->_contentDescriptionTextView, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView leadingAnchor](v4, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v24 constant:50.0]);
    v37[2] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVFocusableTextView trailingAnchor](v4->_contentDescriptionTextView, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView trailingAnchor](v4, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v12 constant:-50.0]);
    v37[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVFocusableTextView topAnchor](v4->_contentDescriptionTextView, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView bottomAnchor](v4->_imageView, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v15 constant:30.0]);
    v37[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVFocusableTextView bottomAnchor](v4->_contentDescriptionTextView, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView bottomAnchor](v4, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18 constant:-50.0]);
    v37[5] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 6LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v20);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)setContentDescription:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionContentDescriptionPreviewView contentDescriptionTextView]( self,  "contentDescriptionTextView"));
  [v5 setDescriptionText:v4];
}

- (NSAttributedString)contentDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionContentDescriptionPreviewView contentDescriptionTextView]( self,  "contentDescriptionTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 descriptionText]);

  return (NSAttributedString *)v3;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView imageView](self, "imageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView imageView](self, "imageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
}

- (CGSize)preferredImageSize
{
  BOOL v2 = (id)-[TVHMediaEntityCollectionContentDescriptionPreviewView imageShape](self, "imageShape") == (id)2;
  double v3 = dbl_1000C3620[v2];
  double v4 = dbl_1000C3630[v2];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImageShape:(unint64_t)a3
{
  if (self->_imageShape != a3)
  {
    self->_imageShape = a3;
    -[TVHMediaEntityCollectionContentDescriptionPreviewView setNeedsUpdateConstraints]( self,  "setNeedsUpdateConstraints");
  }

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMediaEntityCollectionContentDescriptionPreviewView;
  -[TVHMediaEntityCollectionContentDescriptionPreviewView updateConstraints](&v13, "updateConstraints");
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntityCollectionContentDescriptionPreviewView imageViewSizeConstraints]( self,  "imageViewSizeConstraints"));
  if (v3) {
    +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:", v3);
  }
  -[TVHMediaEntityCollectionContentDescriptionPreviewView preferredImageSize](self, "preferredImageSize");
  double v5 = v4;
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView heightAnchor](self->_imageView, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToConstant:v7]);
  v14[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView widthAnchor](self->_imageView, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToConstant:v5]);
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  -[TVHMediaEntityCollectionContentDescriptionPreviewView setImageViewSizeConstraints:]( self,  "setImageViewSizeConstraints:",  v12);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v12);
}

- (void)_didSelectContentDescriptionText
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntityCollectionContentDescriptionPreviewView delegate](self, "delegate"));
  [v3 mediaEntityCollectionContentDescriptionPreviewViewDidSelectContentDescription:self];
}

- (unint64_t)imageShape
{
  return self->_imageShape;
}

- (NSCopying)mediaEntityIdentifier
{
  return self->_mediaEntityIdentifier;
}

- (void)setMediaEntityIdentifier:(id)a3
{
}

- (NSString)mediaEntityTitle
{
  return self->_mediaEntityTitle;
}

- (void)setMediaEntityTitle:(id)a3
{
}

- (TVHMediaEntityCollectionContentDescriptionPreviewViewDelegate)delegate
{
  return (TVHMediaEntityCollectionContentDescriptionPreviewViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (TVFocusableTextView)contentDescriptionTextView
{
  return self->_contentDescriptionTextView;
}

- (void)setContentDescriptionTextView:(id)a3
{
}

- (NSArray)imageViewSizeConstraints
{
  return self->_imageViewSizeConstraints;
}

- (void)setImageViewSizeConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end