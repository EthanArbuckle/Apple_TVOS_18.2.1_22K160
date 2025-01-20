@interface TVSSCameraPreviewView
- (TVSSAVCapturePreviewView)avCapturePreviewView;
- (TVSSCameraPreviewView)initWithSession:(id)a3;
- (TVSSSimpleCameraSession)session;
- (UIView)connectingPlaceholderView;
- (void)setAvCapturePreviewView:(id)a3;
- (void)setConnectingPlaceholderView:(id)a3;
- (void)setSession:(id)a3;
- (void)showPreview;
- (void)start;
- (void)stop;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TVSSCameraPreviewView

- (TVSSCameraPreviewView)initWithSession:(id)a3
{
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v47;
  v47 = 0LL;
  v45.receiver = v3;
  v45.super_class = (Class)&OBJC_CLASS___TVSSCameraPreviewView;
  v47 = -[TVSSCameraPreviewView init](&v45, "init");
  objc_storeStrong((id *)&v47, v47);
  if (v47)
  {
    objc_storeStrong((id *)&v47->_session, location[0]);
    id v19 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    v18 =  +[UITraitCollection traitCollectionWithUserInterfaceStyle:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceStyle:");
    id v44 = objc_msgSend(v19, "resolvedColorWithTraitCollection:");

    v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    connectingPlaceholderView = v47->_connectingPlaceholderView;
    v47->_connectingPlaceholderView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v47->_connectingPlaceholderView,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
    -[UIView setAutoresizingMask:](v47->_connectingPlaceholderView, "setAutoresizingMask:");
    -[TVSSCameraPreviewView addSubview:](v47, "addSubview:", v47->_connectingPlaceholderView);
    v20 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    v21 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4006LL);
    v43 = -[UIVisualEffectView initWithEffect:](v20, "initWithEffect:");

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v43,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
    -[UIVisualEffectView setAutoresizingMask:](v43, "setAutoresizingMask:", 18LL);
    -[UIView addSubview:](v47->_connectingPlaceholderView, "addSubview:", v43);
    v42 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    -[UIStackView setAxis:](v42, "setAxis:");
    -[UIStackView setAlignment:](v42, "setAlignment:", 3LL);
    -[UIStackView setSpacing:](v42, "setSpacing:", 8.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v42,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v22 = -[UIStackView layer](v42, "layer");
    [v22 setCompositingFilter:kCAFilterPlusL];

    -[UIView addSubview:](v47->_connectingPlaceholderView, "addSubview:", v42);
    v41 =  +[UIImageSymbolConfiguration configurationWithTextStyle:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:",  UIFontTextStyleExtraLargeTitle);
    id v40 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"video.fill",  v41);
    v6 = objc_alloc(&OBJC_CLASS___UIImageView);
    v39 = -[UIImageView initWithImage:](v6, "initWithImage:", v40);
    -[UIImageView setTintColor:](v39, "setTintColor:", v44);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v39,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentCompressionResistancePriority:forAxis:]( v39,  "setContentCompressionResistancePriority:forAxis:");
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:]( v39,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v7);
    LODWORD(v8) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v39, "setContentHuggingPriority:forAxis:", 0LL, v8);
    LODWORD(v9) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v39, "setContentHuggingPriority:forAxis:", 1LL, v9);
    -[UIStackView addArrangedSubview:](v42, "addArrangedSubview:", v39);
    v38 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v23 = v38;
    id v24 = TVSSLagunaLocalizedString(@"FaceTimeCameraPreviewConnecting");
    -[UILabel setText:](v23, "setText:");

    v25 = v38;
    v26 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
    -[UILabel setFont:](v25, "setFont:");

    -[UILabel setTextColor:](v38, "setTextColor:", v44);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    -[UIStackView addArrangedSubview:](v42, "addArrangedSubview:", v38);
    id v37 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v37 setColor:v44];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIStackView addArrangedSubview:](v42, "addArrangedSubview:", v37);
    [v37 startAnimating];
    id v33 = -[UIStackView centerXAnchor](v42, "centerXAnchor");
    v32 = -[UIView centerXAnchor](v47->_connectingPlaceholderView, "centerXAnchor");
    id v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
    v48[0] = v31;
    id v30 = -[UIStackView centerYAnchor](v42, "centerYAnchor");
    v29 = -[UIView centerYAnchor](v47->_connectingPlaceholderView, "centerYAnchor");
    id v28 = objc_msgSend(v30, "constraintEqualToAnchor:");
    v48[1] = v28;
    v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    v34 = objc_alloc(&OBJC_CLASS___TVSSAVCapturePreviewView);
    -[TVSSCameraPreviewView bounds](v47, "bounds");
    v14 = -[TVSSAVCapturePreviewView initWithFrame:](v34, "initWithFrame:", v10, v11, v12, v13);
    avCapturePreviewView = v47->_avCapturePreviewView;
    v47->_avCapturePreviewView = v14;

    -[TVSSAVCapturePreviewView setTranslatesAutoresizingMaskIntoConstraints:]( v47->_avCapturePreviewView,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
    -[TVSSAVCapturePreviewView setAutoresizingMask:](v47->_avCapturePreviewView, "setAutoresizingMask:", 18LL);
    -[TVSSCameraPreviewView addSubview:](v47, "addSubview:", v47->_avCapturePreviewView);
    v36 = -[TVSSSimpleCameraSession avSession](v47->_session, "avSession");
    id v35 = -[TVSSAVCapturePreviewView videoPreviewLayer](v47->_avCapturePreviewView, "videoPreviewLayer");
    [v35 setSession:v36];

    -[TVSSAVCapturePreviewView setHidden:](v47->_avCapturePreviewView, "setHidden:", 1LL);
    objc_storeStrong(&v37, 0LL);
    objc_storeStrong((id *)&v38, 0LL);
    objc_storeStrong((id *)&v39, 0LL);
    objc_storeStrong(&v40, 0LL);
    objc_storeStrong((id *)&v41, 0LL);
    objc_storeStrong((id *)&v42, 0LL);
    objc_storeStrong((id *)&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
  }

  v17 = v47;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v47, 0LL);
  return v17;
}

- (void)willMoveToWindow:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSCameraPreviewView;
  -[TVSSCameraPreviewView willMoveToWindow:](&v3, "willMoveToWindow:", location[0]);
  if (location[0]) {
    -[TVSSCameraPreviewView start](v5, "start");
  }
  else {
    -[TVSSCameraPreviewView stop](v5, "stop");
  }
  objc_storeStrong(location, 0LL);
}

- (void)start
{
}

- (void)stop
{
}

- (void)showPreview
{
}

- (TVSSAVCapturePreviewView)avCapturePreviewView
{
  return self->_avCapturePreviewView;
}

- (void)setAvCapturePreviewView:(id)a3
{
}

- (UIView)connectingPlaceholderView
{
  return self->_connectingPlaceholderView;
}

- (void)setConnectingPlaceholderView:(id)a3
{
}

- (TVSSSimpleCameraSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end