@interface TVSSWaveformContentView
- (CGSize)intrinsicContentSize;
- (TVSSVisualContent)content;
- (TVSSWaveformContentView)initWithFrame:(CGRect)a3;
- (TVSSWaveformSettings)waveformSettings;
- (TVSSWaveformView)waveformView;
- (UIImageView)imageView;
- (UIView)backgroundColorView;
- (id)_waveformContent;
- (unint64_t)visualizedControlState;
- (void)_updateAppearance;
- (void)_updateContent;
- (void)didMoveToWindow;
- (void)setBackgroundColorView:(id)a3;
- (void)setContent:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVisualizedControlState:(unint64_t)a3;
- (void)setWaveformSettings:(id)a3;
- (void)setWaveformView:(id)a3;
- (void)waveformController:(id)a3 remoteRouteSymbolNameDidChange:(id)a4;
- (void)waveformController:(id)a3 waveformDidChange:(id)a4;
- (void)waveformControllerTrackDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVSSWaveformContentView

- (TVSSWaveformContentView)initWithFrame:(CGRect)a3
{
  CGRect v68 = a3;
  SEL v66 = a2;
  v67 = 0LL;
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___TVSSWaveformContentView;
  v67 = -[TVSSWaveformContentView initWithFrame:]( &v65,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v67, v67);
  if (v67)
  {
    v67->_visualizedControlState = 0LL;
    id v18 = -[TVSSWaveformContentView layer](v67, "layer");
    [v18 setAllowsGroupBlending:0];

    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    backgroundColorView = v67->_backgroundColorView;
    v67->_backgroundColorView = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v67->_backgroundColorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSWaveformContentView addSubview:](v67, "addSubview:", v67->_backgroundColorView);
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    imageView = v67->_imageView;
    v67->_imageView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v67->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v67->_imageView, "setContentMode:", 4LL);
    v19 = v67->_imageView;
    v21 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    v20 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    -[UIImageView setPreferredSymbolConfiguration:](v19, "setPreferredSymbolConfiguration:");

    v22 = v67->_imageView;
    id v23 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"waveform");
    -[UIImageView setImage:](v22, "setImage:");

    -[TVSSWaveformContentView addSubview:](v67, "addSubview:", v67->_imageView);
    v64 = +[TVSSWaveformSettings currentSettings](&OBJC_CLASS___TVSSWaveformSettings, "currentSettings");
    objc_storeStrong((id *)&v67->_waveformSettings, v64);
    sub_1000B3B34();
    double v62 = v7;
    double v63 = v8;
    v24 = objc_alloc(&OBJC_CLASS___TVSSWaveformView);
    sub_1000B3B60();
    v13 = -[TVSSWaveformView initWithFrame:settings:](v24, "initWithFrame:settings:", v64, v9, v10, v11, v12);
    waveformView = v67->_waveformView;
    v67->_waveformView = v13;

    -[TVSSWaveformView setTranslatesAutoresizingMaskIntoConstraints:]( v67->_waveformView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSSWaveformView setAlpha:](v67->_waveformView, "setAlpha:", 0.0);
    -[TVSSWaveformContentView addSubview:](v67, "addSubview:", v67->_waveformView);
    id v59 = -[TVSSWaveformContentView leadingAnchor](v67, "leadingAnchor");
    v58 = -[UIView leadingAnchor](v67->_backgroundColorView, "leadingAnchor");
    id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
    v70[0] = v57;
    id v56 = -[TVSSWaveformContentView trailingAnchor](v67, "trailingAnchor");
    v55 = -[UIView trailingAnchor](v67->_backgroundColorView, "trailingAnchor");
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
    v70[1] = v54;
    id v53 = -[TVSSWaveformContentView topAnchor](v67, "topAnchor");
    v52 = -[UIView topAnchor](v67->_backgroundColorView, "topAnchor");
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    v70[2] = v51;
    id v50 = -[TVSSWaveformContentView bottomAnchor](v67, "bottomAnchor");
    v49 = -[UIView bottomAnchor](v67->_backgroundColorView, "bottomAnchor");
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    v70[3] = v48;
    id v47 = -[TVSSWaveformContentView leadingAnchor](v67, "leadingAnchor");
    id v46 = -[UIImageView leadingAnchor](v67->_imageView, "leadingAnchor");
    id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
    v70[4] = v45;
    id v44 = -[TVSSWaveformContentView trailingAnchor](v67, "trailingAnchor");
    id v43 = -[UIImageView trailingAnchor](v67->_imageView, "trailingAnchor");
    id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
    v70[5] = v42;
    id v41 = -[TVSSWaveformContentView topAnchor](v67, "topAnchor");
    id v40 = -[UIImageView topAnchor](v67->_imageView, "topAnchor");
    id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
    v70[6] = v39;
    id v38 = -[TVSSWaveformContentView bottomAnchor](v67, "bottomAnchor");
    id v37 = -[UIImageView bottomAnchor](v67->_imageView, "bottomAnchor");
    id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
    v70[7] = v36;
    id v35 = -[TVSSWaveformContentView centerXAnchor](v67, "centerXAnchor");
    id v34 = -[TVSSWaveformView centerXAnchor](v67->_waveformView, "centerXAnchor");
    id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
    v70[8] = v33;
    id v32 = -[TVSSWaveformContentView centerYAnchor](v67, "centerYAnchor");
    id v31 = -[TVSSWaveformView centerYAnchor](v67->_waveformView, "centerYAnchor");
    id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
    v70[9] = v30;
    id v29 = -[TVSSWaveformView widthAnchor](v67->_waveformView, "widthAnchor");
    id v28 = [v29 constraintEqualToConstant:v62];
    v70[10] = v28;
    id v27 = -[TVSSWaveformView heightAnchor](v67->_waveformView, "heightAnchor");
    id v26 = [v27 constraintEqualToConstant:v63];
    v70[11] = v26;
    v25 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 12LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSWaveformContentView _updateAppearance](v67, "_updateAppearance");
    v60 = v67;
    uint64_t v69 = objc_opt_class(&OBJC_CLASS___TVSSMenuBarActiveItemIdentifierTrait);
    v61 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL);
    id v15 = -[TVSSWaveformContentView registerForTraitChanges:withAction:](v60, "registerForTraitChanges:withAction:");

    objc_storeStrong((id *)&v64, 0LL);
  }

  v17 = v67;
  objc_storeStrong((id *)&v67, 0LL);
  return v17;
}

  ;
}

  ;
}

- (CGSize)intrinsicContentSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setVisualizedControlState:(unint64_t)a3
{
  if (self->_visualizedControlState != a3)
  {
    self->_visualizedControlState = a3;
    -[TVSSWaveformContentView _updateAppearance](self, "_updateAppearance");
  }

- (void)didMoveToWindow
{
  double v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSWaveformContentView;
  -[TVSSWaveformContentView didMoveToWindow](&v6, "didMoveToWindow");
  id v2 = -[TVSSWaveformContentView window](v8, "window");
  BOOL v5 = v2 == 0LL;

  if (!v5)
  {
    id v4 = -[TVSSWaveformContentView _waveformContent](v8, "_waveformContent");
    id v3 = [v4 waveformController];
    [v3 addVisibleObserver:v8];
  }

- (void)willMoveToWindow:(id)a3
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)&OBJC_CLASS___TVSSWaveformContentView;
  -[TVSSWaveformContentView willMoveToWindow:](&v5, "willMoveToWindow:", location[0]);
  if (!location[0])
  {
    id v4 = -[TVSSWaveformContentView _waveformContent](v7, "_waveformContent");
    id v3 = [v4 waveformController];
    [v3 removeVisibleObserver:v7];
  }

  objc_storeStrong(location, 0LL);
}

- (void)setContent:(id)a3
{
  double v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v12->_content != location[0])
  {
    content = v12->_content;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSWaveformVisualContent);
    id v9 = sub_1000B3F84(content, v3);
    id v10 = v9;
    id v5 = [v9 waveformController];
    [v5 removeVisibleObserver:v12];

    objc_storeStrong((id *)&v12->_content, location[0]);
    id v6 = -[TVSSWaveformContentView _waveformContent](v12, "_waveformContent");
    id v8 = [v6 waveformController];

    id v7 = -[TVSSWaveformContentView window](v12, "window");
    if (v7) {
      [v8 addVisibleObserver:v12];
    }
    -[TVSSWaveformContentView _updateContent](v12, "_updateContent");
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)waveformControllerTrackDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSWaveformContentView _updateContent](v4, "_updateContent");
  objc_storeStrong(location, 0LL);
}

- (void)waveformController:(id)a3 waveformDidChange:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSSWaveformContentView _updateContent](v7, "_updateContent");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)waveformController:(id)a3 remoteRouteSymbolNameDidChange:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_waveformContent
{
  content = self->_content;
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSWaveformVisualContent);
  return sub_1000B3F84(content, v2);
}

- (void)_updateContent
{
  id v37 = self;
  SEL v36 = a2;
  id v8 = -[TVSSWaveformContentView _waveformContent](self, "_waveformContent");
  unsigned __int8 v9 = [v8 isStaticWaveform];

  char v35 = v9 & 1;
  -[UIImageView alpha](v37->_imageView, "alpha");
  BOOL v34 = v2 > 0.0;
  if (v2 <= 0.0 || (v35 & 1) != 0)
  {
    if (!v34 && (v35 & 1) != 0)
    {
      v22 = _NSConcreteStackBlock;
      int v23 = -1073741824;
      int v24 = 0;
      v25 = sub_1000B4658;
      id v26 = &unk_1001B5A60;
      id v27 = v37;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v22, 0.3);
      objc_storeStrong((id *)&v27, 0LL);
    }
  }

  else
  {
    id v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    id v31 = sub_1000B45D4;
    id v32 = &unk_1001B5A60;
    id v33 = v37;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v28, 0.3);
    objc_storeStrong((id *)&v33, 0LL);
  }

  id v7 = -[TVSSWaveformContentView _waveformContent](v37, "_waveformContent");
  id v21 = [v7 waveformController];

  id v20 = [v21 waveform];
  char v19 = [v21 isPlaying] & 1;
  if (v19) {
    -[TVSSWaveformSettings animationDuration](v37->_waveformSettings, "animationDuration");
  }
  else {
    -[TVSSWaveformSettings pausedAnimationDuration](v37->_waveformSettings, "pausedAnimationDuration");
  }
  float v18 = v3;
  if ((v19 & 1) != 0) {
    -[TVSSWaveformSettings springDamping](v37->_waveformSettings, "springDamping");
  }
  else {
    -[TVSSWaveformSettings pausedSpringDamping](v37->_waveformSettings, "pausedSpringDamping");
  }
  float v6 = v4;
  float v17 = v4;
  double v5 = v18;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1000B46DC;
  v14 = &unk_1001B61C0;
  id v15 = v37;
  id v16 = v20;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:",  0LL,  &v10,  v5,  0.0,  v6);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
}

- (void)_updateAppearance
{
  v22 = self;
  SEL v21 = a2;
  id v13 = -[TVSSWaveformContentView traitCollection](self, "traitCollection");
  BOOL v14 = [v13 userInterfaceStyle] == (id)2;

  BOOL v20 = v14;
  id v19 = 0LL;
  float v18 = 0LL;
  id location = 0LL;
  id v16 = 0LL;
  unint64_t visualizedControlState = v22->_visualizedControlState;
  if (visualizedControlState <= 8) {
    __asm { BR              X8 }
  }

  if (v20) {
    uint64_t v12 = kCAFilterPlusL;
  }
  else {
    uint64_t v12 = kCAFilterPlusD;
  }
  double v2 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v12);
  id v3 = v19;
  id v19 = v2;

  float v4 = +[TVSSConstants normalMenuItemTextColor](&OBJC_CLASS___TVSSConstants, "normalMenuItemTextColor");
  double v5 = v18;
  float v18 = v4;

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v16, 0LL);
  -[UIImageView setTintColor:](v22->_imageView, "setTintColor:", v18);
  id v7 = -[TVSSWaveformContentView imageView](v22, "imageView");
  id v6 = -[UIImageView layer](v7, "layer");
  [v6 setCompositingFilter:v19];

  -[TVSSWaveformView setTintColor:](v22->_waveformView, "setTintColor:", v18);
  unsigned __int8 v9 = -[TVSSWaveformContentView waveformView](v22, "waveformView");
  id v8 = -[TVSSWaveformView layer](v9, "layer");
  [v8 setCompositingFilter:v19];

  -[UIView setBackgroundColor:](v22->_backgroundColorView, "setBackgroundColor:", v16);
  int v11 = -[TVSSWaveformContentView backgroundColorView](v22, "backgroundColorView");
  id v10 = -[UIView layer](v11, "layer");
  -[CALayer setCompositingFilter:](v10, "setCompositingFilter:", location);

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
}

- (TVSSVisualContent)content
{
  return self->_content;
}

- (unint64_t)visualizedControlState
{
  return self->_visualizedControlState;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TVSSWaveformView)waveformView
{
  return self->_waveformView;
}

- (void)setWaveformView:(id)a3
{
}

- (TVSSWaveformSettings)waveformSettings
{
  return self->_waveformSettings;
}

- (void)setWaveformSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end