@interface TVMusicRadioEpisodeView
+ (id)radioEpisodeWithElement:(id)a3 existingView:(id)a4;
+ (void)registerElements;
- (TVImageProxy)imageProxy;
- (TVMusicRadioEpisodeView)initWithFrame:(CGRect)a3;
- (TVViewElement)element;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (UIImageView)backgroundImageView;
- (UIImageView)imageView;
- (UILabel)calloutLabel;
- (UILabel)captionLabel;
- (UILabel)descriptionLabel;
- (UIView)overlayView;
- (void)_handleFocusDidUpdateNotification:(id)a3;
- (void)didMoveToWindow;
- (void)setBackgroundImageView:(id)a3;
- (void)setCalloutLabel:(id)a3;
- (void)setCaptionLabel:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setElement:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation TVMusicRadioEpisodeView

+ (void)registerElements
{
}

+ (id)radioEpisodeWithElement:(id)a3 existingView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVMusicRadioEpisodeView, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if (v6 && (isKindOfClass & 1) != 0) {
    v10 = (TVMusicRadioEpisodeView *)v6;
  }
  else {
    v10 = -[TVMusicRadioEpisodeView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMusicRadioEpisodeView),  "initWithFrame:",  0.0,  0.0,  560.0,  700.0);
  }
  v11 = v10;
  -[TVMusicRadioEpisodeView setElement:](v10, "setElement:", v5);

  return v11;
}

- (TVMusicRadioEpisodeView)initWithFrame:(CGRect)a3
{
  v115.receiver = self;
  v115.super_class = (Class)&OBJC_CLASS___TVMusicRadioEpisodeView;
  v3 = -[TVMusicRadioEpisodeView initWithFrame:]( &v115,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  0LL));
    -[TVMusicRadioEpisodeView setFocusAnimationConfiguration:](v3, "setFocusAnimationConfiguration:", v4);

    -[TVMusicRadioEpisodeView setContentMotionRotation:translation:]( v3,  "setContentMotionRotation:translation:",  0.036,  0.036,  10.0,  10.0);
    -[TVMusicRadioEpisodeView setContinuousCornerEnabled:](v3, "setContinuousCornerEnabled:", 1LL);
    -[TVMusicRadioEpisodeView setCornerRadius:](v3, "setCornerRadius:", 14.0);
    id v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v5;

    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2LL);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    [v7 addSubview:v3->_imageView];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_imageView, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 topAnchor]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v10]);
    [v11 setActive:1];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v3->_imageView, "leftAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 leftAnchor]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v14]);
    [v15 setActive:1];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v3->_imageView, "rightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 rightAnchor]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v18]);
    [v19 setActive:1];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v3->_imageView, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v3->_imageView, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v21 multiplier:1.77777778]);
    [v22 setActive:1];

    v23 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v23;

    -[UIImageView setClipsToBounds:](v3->_backgroundImageView, "setClipsToBounds:", 1LL);
    -[UIImageView setContentMode:](v3->_backgroundImageView, "setContentMode:", 2LL);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_backgroundImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    [v25 addSubview:v3->_backgroundImageView];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_backgroundImageView, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v3->_imageView, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintEqualToAnchor:v27]);
    [v28 setActive:1];

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v3->_backgroundImageView, "heightAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v3->_imageView, "heightAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30]);
    [v31 setActive:1];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v3->_backgroundImageView, "leftAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 leftAnchor]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v34]);
    [v35 setActive:1];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView rightAnchor](v3->_backgroundImageView, "rightAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 rightAnchor]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v38]);
    [v39 setActive:1];

    v40 = objc_alloc_init(&OBJC_CLASS___UIView);
    overlayView = v3->_overlayView;
    v3->_overlayView = v40;

    -[UIView setInsetsLayoutMarginsFromSafeArea:](v3->_overlayView, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    -[UIView setLayoutMargins:](v3->_overlayView, "setLayoutMargins:", 0.0, 20.0, 0.0, 20.0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_overlayView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    [v42 addSubview:v3->_overlayView];

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_overlayView, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v3->_backgroundImageView, "topAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue([v43 constraintEqualToAnchor:v44]);
    [v45 setActive:1];

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_overlayView, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 bottomAnchor]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v48]);
    [v49 setActive:1];

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v3->_overlayView, "leftAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 leftAnchor]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToAnchor:v52]);
    [v53 setActive:1];

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v3->_overlayView, "rightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView contentView](v3, "contentView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 rightAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v56]);
    [v57 setActive:1];

    v58 = objc_alloc_init(&OBJC_CLASS___UILabel);
    captionLabel = v3->_captionLabel;
    v3->_captionLabel = v58;

    -[UILabel setNumberOfLines:](v3->_captionLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_captionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[UILabel setTextColor:](v3->_captionLabel, "setTextColor:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager caption1EmphasizedFont](&OBJC_CLASS___TVThemeManager, "caption1EmphasizedFont"));
    -[UILabel setFont:](v3->_captionLabel, "setFont:", v61);

    uint64_t v114 = kCAFilterPlusL;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v3->_captionLabel, "layer"));
    [v63 setCompositingFilter:v62];

    -[UIView addSubview:](v3->_overlayView, "addSubview:", v3->_captionLabel);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_captionLabel, "firstBaselineAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 topAnchor]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v66 constant:40.0]);
    [v67 setActive:1];

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_captionLabel, "leadingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v70 = (void *)objc_claimAutoreleasedReturnValue([v69 leadingAnchor]);
    v71 = (void *)objc_claimAutoreleasedReturnValue([v68 constraintEqualToAnchor:v70]);
    [v71 setActive:1];

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_captionLabel, "trailingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 trailingAnchor]);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v74]);
    [v75 setActive:1];

    v76 = objc_alloc_init(&OBJC_CLASS___UILabel);
    calloutLabel = v3->_calloutLabel;
    v3->_calloutLabel = v76;

    -[UILabel setNumberOfLines:](v3->_calloutLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_calloutLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_calloutLabel, "setTextColor:", v78);

    v79 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager calloutEmphasizedFont](&OBJC_CLASS___TVThemeManager, "calloutEmphasizedFont"));
    -[UILabel setFont:](v3->_calloutLabel, "setFont:", v79);

    -[UIView addSubview:](v3->_overlayView, "addSubview:", v3->_calloutLabel);
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_calloutLabel, "firstBaselineAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_captionLabel, "lastBaselineAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v81 constant:44.0]);
    [v82 setActive:1];

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_calloutLabel, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v84 leadingAnchor]);
    v86 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v85]);
    [v86 setActive:1];

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_calloutLabel, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v89 = (void *)objc_claimAutoreleasedReturnValue([v88 trailingAnchor]);
    v90 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintEqualToAnchor:v89]);
    [v90 setActive:1];

    v91 = objc_alloc_init(&OBJC_CLASS___UILabel);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v91;

    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 2LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_descriptionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[UILabel setTextColor:](v3->_descriptionLabel, "setTextColor:", v93);

    v94 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager bodyFont](&OBJC_CLASS___TVThemeManager, "bodyFont"));
    -[UILabel setFont:](v3->_descriptionLabel, "setFont:", v94);

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v114));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v3->_descriptionLabel, "layer"));
    [v96 setCompositingFilter:v95];

    -[UIView addSubview:](v3->_overlayView, "addSubview:", v3->_descriptionLabel);
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_descriptionLabel, "firstBaselineAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_calloutLabel, "lastBaselineAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue([v97 constraintEqualToAnchor:v98 constant:38.0]);
    [v99 setActive:1];

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_descriptionLabel, "leadingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v102 = (void *)objc_claimAutoreleasedReturnValue([v101 leadingAnchor]);
    v103 = (void *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v102]);
    [v103 setActive:1];

    v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_descriptionLabel, "trailingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v106 = (void *)objc_claimAutoreleasedReturnValue([v105 trailingAnchor]);
    v107 = (void *)objc_claimAutoreleasedReturnValue([v104 constraintEqualToAnchor:v106]);
    [v107 setActive:1];

    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_descriptionLabel, "bottomAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layoutMarginsGuide](v3->_overlayView, "layoutMarginsGuide"));
    v110 = (void *)objc_claimAutoreleasedReturnValue([v109 bottomAnchor]);
    v111 = (void *)objc_claimAutoreleasedReturnValue([v108 constraintLessThanOrEqualToAnchor:v110]);
    [v111 setActive:1];

    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v112 addObserver:v3 selector:"_handleFocusDidUpdateNotification:" name:UIFocusDidUpdateNotification object:0];
  }

  return v3;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicRadioEpisodeView;
  -[TVMusicRadioEpisodeView didMoveToWindow](&v6, "didMoveToWindow");
  unsigned int v3 = -[TVMusicRadioEpisodeView tvm_isAncestorFocused](self, "tvm_isAncestorFocused");
  unint64_t v4 = (unint64_t)-[TVMusicRadioEpisodeView controlState](self, "controlState") & 0xFFFFFFFFFFFFFFF7LL;
  uint64_t v5 = 8LL;
  if (!v3) {
    uint64_t v5 = 0LL;
  }
  -[TVMusicRadioEpisodeView setControlState:](self, "setControlState:", v4 | v5);
}

- (void)_handleFocusDidUpdateNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:UIFocusUpdateContextKey]);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:UIFocusUpdateAnimationCoordinatorKey]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v12 nextFocusedView]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v12 nextFocusedView]);
    unsigned int v10 = -[TVMusicRadioEpisodeView isDescendantOfView:](self, "isDescendantOfView:", v9);

    if (v10) {
      uint64_t v11 = 8LL;
    }
    else {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  -[TVMusicRadioEpisodeView setControlState:withAnimationCoordinator:]( self,  "setControlState:withAnimationCoordinator:",  (unint64_t)-[TVMusicRadioEpisodeView controlState](self, "controlState") & 0xFFFFFFFFFFFFFFF7LL | v11,  v7);
}

- (void)setElement:(id)a3
{
  id v55 = a3;
  objc_storeStrong((id *)&self->_element, a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView imageProxy](self, "imageProxy"));
  [v5 cancel];

  -[TVMusicRadioEpisodeView setImageProxy:](self, "setImageProxy:", 0LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView calloutLabel](self, "calloutLabel"));
  [v6 setText:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView captionLabel](self, "captionLabel"));
  [v7 setText:0];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView descriptionLabel](self, "descriptionLabel"));
  [v8 setText:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView imageView](self, "imageView"));
  [v9 setImage:0];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView backgroundImageView](self, "backgroundImageView"));
  [v10 setImage:0];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVViewElement style](self->_element, "style"));
  [v11 width];
  double v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVViewElement style](self->_element, "style"));
  [v14 height];
  -[TVMusicRadioEpisodeView setBounds:](self, "setBounds:", 0.0, 0.0, v13, v15);

  objc_initWeak(&location, self);
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVViewElement childViewElements](self->_element, "childViewElements"));
  id v58 = [obj countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v67 != v57) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___TVImageElement, v16);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "elementName", v55));
          unsigned int v28 = [v27 isEqualToString:@"overlay"];

          if (!v28) {
            continue;
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue([v17 style]);
          [v29 padding];
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          double v37 = v36;
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView overlayView](self, "overlayView"));
          objc_msgSend(v38, "setLayoutMargins:", v31, v33, v35, v37);

          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          id v19 = (id)objc_claimAutoreleasedReturnValue([v17 childViewElements]);
          id v40 = [v19 countByEnumeratingWithState:&v60 objects:v71 count:16];
          if (!v40) {
            goto LABEL_26;
          }
          uint64_t v41 = *(void *)v61;
          while (2)
          {
            uint64_t v42 = 0LL;
LABEL_13:
            if (*(void *)v61 != v41) {
              objc_enumerationMutation(v19);
            }
            v43 = *(void **)(*((void *)&v60 + 1) + 8 * v42);
            uint64_t v44 = objc_opt_class(&OBJC_CLASS___TVTextElement, v39);
            if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0)
            {
              id v45 = v43;
              v46 = (void *)objc_claimAutoreleasedReturnValue([v45 elementName]);
              unsigned int v47 = [v46 isEqualToString:@"caption"];

              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v45 attributedText]);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 string]);
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView captionLabel](self, "captionLabel"));
                [v50 setText:v49];
                goto LABEL_22;
              }

              v51 = (void *)objc_claimAutoreleasedReturnValue([v45 elementName]);
              unsigned int v52 = [v51 isEqualToString:@"callout"];

              if (v52)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v45 attributedText]);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 string]);
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView calloutLabel](self, "calloutLabel"));
                [v50 setText:v49];
                goto LABEL_22;
              }

              v53 = (void *)objc_claimAutoreleasedReturnValue([v45 elementName]);
              unsigned int v54 = [v53 isEqualToString:@"description"];

              if (v54)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue([v45 attributedText]);
                v49 = (void *)objc_claimAutoreleasedReturnValue([v48 string]);
                v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView descriptionLabel](self, "descriptionLabel"));
                [v50 setText:v49];
LABEL_22:
              }
            }

            if (v40 == (id)++v42)
            {
              id v40 = [v19 countByEnumeratingWithState:&v60 objects:v71 count:16];
              if (!v40) {
                goto LABEL_26;
              }
              continue;
            }

            goto LABEL_13;
          }
        }

        id v19 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 URL]);

        if (v20)
        {
          v21 = objc_alloc(&OBJC_CLASS___TVImageProxy);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v19 URL]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
          v24 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v21,  "initWithObject:imageLoader:groupType:",  v22,  v23,  0LL);
          -[TVMusicRadioEpisodeView setImageProxy:](self, "setImageProxy:", v24);

          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_10009A414;
          v64[3] = &unk_10026CB30;
          objc_copyWeak(&v65, &location);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView imageProxy](self, "imageProxy"));
          [v25 setCompletionHandler:v64];

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView imageProxy](self, "imageProxy"));
          [v26 load];

          objc_destroyWeak(&v65);
        }

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  unint64_t v9 = (unint64_t)-[TVMusicRadioEpisodeView controlState](self, "controlState");
  if (v6) {
    unint64_t v10 = ((unint64_t)-[TVMusicRadioEpisodeView controlState](self, "controlState") >> 3) & 1;
  }
  else {
    LODWORD(v10) = 0;
  }
  if (v5)
  {
    if ((_DWORD)v10) {
      double v11 = 0.12;
    }
    else {
      double v11 = 0.25;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10009A840;
    v18[3] = &unk_100268E30;
    v18[4] = self;
    v18[5] = v9 & 0xFFFFFFFFFFFFFFFELL | v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10009A848;
    v16[3] = &unk_100269590;
    id v17 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  4LL,  v18,  v16,  v11,  0.0);
    double v12 = v17;
    goto LABEL_11;
  }

  -[TVMusicRadioEpisodeView setControlState:](self, "setControlState:", v9 & 0xFFFFFFFFFFFFFFFELL | v10);
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10009A85C;
    v14[3] = &unk_100268D60;
    id v15 = v8;
    double v13 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10009AB0C;
    block[3] = &unk_100268D60;
    id v20 = v13;
    dispatch_async(&_dispatch_main_q, block);

    double v12 = v15;
LABEL_11:
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  if (a3.width == 0.0 || (double height = a3.height, a3.height == 0.0))
  {
    -[TVMusicRadioEpisodeView bounds](self, "bounds");
    double width = v6;
    double height = v7;
  }

  else
  {
    double width = a3.width;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicRadioEpisodeView layer](self, "layer"));
  [v8 anchorPoint];
  double v10 = v9;
  double v12 = v11;

  if (width >= height) {
    double v13 = width;
  }
  else {
    double v13 = height;
  }
  -[TVMusicRadioEpisodeView focusedSizeIncrease](self, "focusedSizeIncrease");
  double v15 = (v13 + v14) / v13;
  double v16 = width * v15 - width;
  double v17 = height * v15 - height;
  double v18 = floor(v12 * v17);
  double v19 = floor(v10 * v16);
  double v20 = floor((1.0 - v12) * v17);
  double v21 = floor((1.0 - v10) * v16);
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
}

- (TVViewElement)element
{
  return self->_element;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
}

- (UILabel)calloutLabel
{
  return self->_calloutLabel;
}

- (void)setCalloutLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end