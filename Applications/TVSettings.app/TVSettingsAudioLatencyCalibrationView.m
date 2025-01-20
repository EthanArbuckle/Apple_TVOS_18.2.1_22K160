@interface TVSettingsAudioLatencyCalibrationView
- (CALayer)rootLayer;
- (CAStateController)stateController;
- (TVSettingsAudioLatencyCalibrationView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UIButton)actionButton;
- (UILabel)body;
- (UILabel)header;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)basicAnimator;
- (UIViewPropertyAnimator)transformAnimator;
- (id)dismissHandler;
- (unint64_t)currentState;
- (void)_setText:(id)a3 forLabel:(id)a4 withDirectionForward:(BOOL)a5;
- (void)handleActionPress;
- (void)hideActionButton;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setAlphaAnimator:(id)a3;
- (void)setBasicAnimator:(id)a3;
- (void)setBody:(id)a3;
- (void)setCalibrationState:(unint64_t)a3 withInfo:(id)a4;
- (void)setDismissHandler:(id)a3;
- (void)setHeader:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setStateController:(id)a3;
- (void)setTransformAnimator:(id)a3;
- (void)showActionButtonWithTitle:(id)a3;
@end

@implementation TVSettingsAudioLatencyCalibrationView

- (TVSettingsAudioLatencyCalibrationView)initWithFrame:(CGRect)a3
{
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationView;
  v3 = -[TVSettingsAudioLatencyCalibrationView initWithFrame:]( &v70,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v65 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForResource:@"WirelessAudioSync_tvOS" withExtension:@"caar"]);

    id v69 = 0LL;
    v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v65,  1LL,  &v69));
    id v5 = v69;
    id v68 = v5;
    v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v64,  &v68);
    id v63 = v68;

    -[NSKeyedUnarchiver setRequiresSecureCoding:](v6, "setRequiresSecureCoding:", 0LL);
    v71[0] = @"LKEventHandler";
    v72[0] = objc_opt_class(&OBJC_CLASS___NSNull);
    v71[1] = @"LKState";
    v72[1] = objc_opt_class(&OBJC_CLASS___CAState);
    v71[2] = @"LKStateAddAnimation";
    v72[2] = objc_opt_class(&OBJC_CLASS___CAStateAddAnimation);
    v71[3] = @"LKStateAddElement";
    v72[3] = objc_opt_class(&OBJC_CLASS___CAStateAddElement);
    v71[4] = @"LKStateElement";
    v72[4] = objc_opt_class(&OBJC_CLASS___CAStateElement);
    v71[5] = @"LKStateRemoveAnimation";
    v72[5] = objc_opt_class(&OBJC_CLASS___CAStateRemoveAnimation);
    v71[6] = @"LKStateRemoveElement";
    v72[6] = objc_opt_class(&OBJC_CLASS___CAStateRemoveElement);
    v71[7] = @"LKStateSetValue";
    v72[7] = objc_opt_class(&OBJC_CLASS___CAStateSetValue);
    v71[8] = @"LKStateSetProperty";
    v72[8] = objc_opt_class(&OBJC_CLASS___CAStateSetValue);
    v71[9] = @"LKStateTransition";
    v72[9] = objc_opt_class(&OBJC_CLASS___CAStateTransition);
    v71[10] = @"LKStateTransitionElement";
    v72[10] = objc_opt_class(&OBJC_CLASS___CAStateTransitionElement);
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  11LL));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472LL;
    v66[2] = sub_100036DC8;
    v66[3] = &unk_10018FE58;
    v67 = v6;
    v7 = v6;
    [v62 enumerateKeysAndObjectsWithOptions:0 usingBlock:v66];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver decodeObjectForKey:](v7, "decodeObjectForKey:", @"root"));
    -[NSKeyedUnarchiver finishDecoding](v7, "finishDecoding");
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"rootLayer"]);
    rootLayer = v3->_rootLayer;
    v3->_rootLayer = (CALayer *)v9;

    v11 = v3->_rootLayer;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"geometryFlipped"]);
    -[CALayer setGeometryFlipped:](v11, "setGeometryFlipped:", [v12 BOOLValue] ^ 1);

    LODWORD(v13) = 1.0;
    -[CALayer setSpeed:](v3->_rootLayer, "setSpeed:", v13);
    -[CALayer setBeginTime:](v3->_rootLayer, "setBeginTime:", CACurrentMediaTime());
    -[TVSettingsAudioLatencyCalibrationView layoutIfNeeded](v3, "layoutIfNeeded");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationView layer](v3, "layer"));
    [v14 addSublayer:v3->_rootLayer];

    v15 = -[CAStateController initWithLayer:]( objc_alloc(&OBJC_CLASS___CAStateController),  "initWithLayer:",  v3->_rootLayer);
    stateController = v3->_stateController;
    v3->_stateController = v15;

    -[CAStateController setInitialStatesOfLayer:](v3->_stateController, "setInitialStatesOfLayer:", v3->_rootLayer);
    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    header = v3->_header;
    v3->_header = v17;

    v19 = v3->_header;
    uint64_t v20 = TSKLocString(@"AVAudioSyncTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UILabel setText:](v19, "setText:", v21);

    -[UILabel setLineBreakMode:](v3->_header, "setLineBreakMode:", 0LL);
    v22 = v3->_header;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel setNumberOfLines:](v3->_header, "setNumberOfLines:", 1LL);
    -[UILabel setTextAlignment:](v3->_header, "setTextAlignment:", 1LL);
    v24 = v3->_header;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  57.0,  UIFontWeightMedium));
    -[UILabel setFont:](v24, "setFont:", v25);

    -[TVSettingsAudioLatencyCalibrationView addSubview:](v3, "addSubview:", v3->_header);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_header,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_header,  9LL,  0LL,  v3,  9LL,  1.0,  0.0));
    [v26 setActive:1];

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_header,  15LL,  0LL,  v3,  15LL,  1.0,  100.0));
    [v27 setActive:1];

    v28 = objc_alloc_init(&OBJC_CLASS___UILabel);
    body = v3->_body;
    v3->_body = v28;

    v30 = v3->_body;
    uint64_t v31 = TSKLocString(@"WirelessAudioSyncSubTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[UILabel setText:](v30, "setText:", v32);

    -[UILabel setLineBreakMode:](v3->_body, "setLineBreakMode:", 0LL);
    v33 = v3->_body;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v33, "setTextColor:", v34);

    -[UILabel setNumberOfLines:](v3->_body, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v3->_body, "setTextAlignment:", 1LL);
    v35 = v3->_body;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  29.0,  UIFontWeightRegular));
    -[UILabel setFont:](v35, "setFont:", v36);

    -[TVSettingsAudioLatencyCalibrationView addSubview:](v3, "addSubview:", v3->_body);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_body,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_body,  9LL,  0LL,  v3,  9LL,  1.0,  0.0));
    [v37 setActive:1];

    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_body,  7LL,  0LL,  v3,  7LL,  0.5,  0.0));
    [v38 setActive:1];

    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_body,  15LL,  0LL,  v3->_header,  16LL,  1.0,  35.0));
    [v39 setActive:1];

    v40 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
    spinner = v3->_spinner;
    v3->_spinner = v40;

    v42 = v3->_spinner;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UIActivityIndicatorView setColor:](v42, "setColor:", v43);

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_spinner, "setHidesWhenStopped:", 1LL);
    -[TVSettingsAudioLatencyCalibrationView addSubview:](v3, "addSubview:", v3->_spinner);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_spinner,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_spinner,  9LL,  0LL,  v3,  9LL,  1.0,  0.0));
    [v44 setActive:1];

    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3->_spinner,  10LL,  0LL,  v3,  10LL,  1.0,  50.0));
    [v45 setActive:1];

    uint64_t v46 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v46;

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    objc_msgSend(v48, "setBounds:", 0.0, 0.0, 546.0, 68.0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    -[TVSettingsAudioLatencyCalibrationView frame](v3, "frame");
    double v51 = v50 * 0.5;
    -[TVSettingsAudioLatencyCalibrationView frame](v3, "frame");
    objc_msgSend(v49, "setPosition:", v51, v52 + -114.0);

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    [v53 setAllowsEdgeAntialiasing:1];

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    [v54 setAllowsGroupOpacity:1];

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    [v55 setContentsFormat:kCAContentsFormatRGBA8Uint];

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    [v56 setValue:&off_1001AF5F0 forKeyPath:@"transform.scale.xy"];

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    [v57 setCornerRadius:7.0];

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v3->_actionButton, "layer"));
    LODWORD(v59) = 0;
    [v58 setOpacity:v59];

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationView actionButton](v3, "actionButton"));
    -[TVSettingsAudioLatencyCalibrationView addSubview:](v3, "addSubview:", v60);

    -[UIButton addTarget:action:forControlEvents:]( v3->_actionButton,  "addTarget:action:forControlEvents:",  v3,  "handleActionPress",  0x2000LL);
  }

  return v3;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsAudioLatencyCalibrationView;
  -[TVSettingsAudioLatencyCalibrationView layoutSubviews](&v8, "layoutSubviews");
  -[TVSettingsAudioLatencyCalibrationView frame](self, "frame");
  double Width = CGRectGetWidth(v9);
  -[CALayer frame](self->_rootLayer, "frame");
  CGFloat v4 = Width / CGRectGetWidth(v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationView layer](self, "layer"));
  CATransform3DMakeScale(&v7, v4, v4, 1.0);
  [v5 setTransform:&v7];

  -[CALayer frame](self->_rootLayer, "frame");
  CGFloat v6 = v4 * CGRectGetWidth(v11);
  -[CALayer frame](self->_rootLayer, "frame");
  -[TVSettingsAudioLatencyCalibrationView setFrame:]( self,  "setFrame:",  CGPointZero.x,  CGPointZero.y,  v6,  v4 * CGRectGetHeight(v12));
}

- (void)setCalibrationState:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  unint64_t currentState = self->_currentState;
  if (currentState != a3)
  {
    self->_unint64_t currentState = a3;
    id v57 = v6;
    switch(a3)
    {
      case 0uLL:
        header = self->_header;
        uint64_t v9 = TSKLocString(@"AVAudioSyncTitle");
        CGRect v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        -[UILabel setText:](header, "setText:", v10);

        body = self->_body;
        uint64_t v12 = TSKLocString(@"WirelessAudioSyncSubTitle");
        double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        -[UILabel setText:](body, "setText:", v13);
        goto LABEL_5;
      case 1uLL:
        BOOL v14 = currentState < a3;
        uint64_t v15 = TSKLocString(@"WirelessAudioSyncPreparingTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v16,  self->_header,  v14);

        uint64_t v17 = TSKLocString(@"WirelessAudioSyncPreparingBody");
        double v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v13,  self->_body,  v14);
LABEL_5:

        stateController = self->_stateController;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer stateWithName:](self->_rootLayer, "stateWithName:", @"Base"));
        LODWORD(v20) = 1.0;
        -[CAStateController setState:ofLayer:transitionSpeed:]( stateController,  "setState:ofLayer:transitionSpeed:",  v19,  self->_rootLayer,  v20);

        -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
        goto LABEL_7;
      case 2uLL:
        BOOL v21 = currentState < a3;
        uint64_t v22 = TSKLocString(@"WirelessAudioSyncPlayingTone");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v23,  self->_header,  v21);

        uint64_t v24 = TSKLocString(@"WirelessAudioSyncInProgress");
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v25,  self->_body,  v21);

        -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
        v26 = self->_stateController;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer stateWithName:](self->_rootLayer, "stateWithName:", @"syncing_iphone"));
        LODWORD(v28) = 1.0;
        -[CAStateController setState:ofLayer:transitionSpeed:]( v26,  "setState:ofLayer:transitionSpeed:",  v27,  self->_rootLayer,  v28);

LABEL_7:
        -[TVSettingsAudioLatencyCalibrationView hideActionButton](self, "hideActionButton");
        goto LABEL_13;
      case 3uLL:
        BOOL v29 = currentState < a3;
        uint64_t v30 = TSKLocString(@"WirelessAudioSyncCantHearTitle");
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v31,  self->_header,  v29);

        uint64_t v32 = TSKLocString(@"WirelessAudioSyncCantHearSubTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v33,  self->_body,  v29);

        -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
        v34 = self->_stateController;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer stateWithName:](self->_rootLayer, "stateWithName:", @"error_iphone"));
        LODWORD(v36) = 1.0;
        -[CAStateController setState:ofLayer:transitionSpeed:]( v34,  "setState:ofLayer:transitionSpeed:",  v35,  self->_rootLayer,  v36);

        v37 = @"WirelessAudioSyncCantHearCallToAction";
        goto LABEL_11;
      case 4uLL:
        BOOL v38 = currentState < a3;
        uint64_t v39 = TSKLocString(@"WirelessAudioSyncFatalErrorTitle");
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v40,  self->_header,  v38);

        uint64_t v41 = TSKLocString(@"WirelessAudioSyncFatalErrorSubTitle");
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v42,  self->_body,  v38);

        -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
        v43 = self->_stateController;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer stateWithName:](self->_rootLayer, "stateWithName:", @"error_iphone"));
        LODWORD(v45) = 1.0;
        -[CAStateController setState:ofLayer:transitionSpeed:]( v43,  "setState:ofLayer:transitionSpeed:",  v44,  self->_rootLayer,  v45);

        v37 = @"OK";
        goto LABEL_11;
      case 5uLL:
        BOOL v46 = currentState < a3;
        uint64_t v47 = TSKLocString(@"WirelessAudioSyncCompleteTitle");
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v48,  self->_header,  v46);

        uint64_t v49 = TSKLocString(@"WirelessAudioSyncCompleteSubTitle");
        double v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        -[TVSettingsAudioLatencyCalibrationView _setText:forLabel:withDirectionForward:]( self,  "_setText:forLabel:withDirectionForward:",  v50,  self->_body,  v46);

        -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
        double v51 = self->_stateController;
        double v52 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer stateWithName:](self->_rootLayer, "stateWithName:", @"done_iphone"));
        LODWORD(v53) = 1.0;
        -[CAStateController setState:ofLayer:transitionSpeed:]( v51,  "setState:ofLayer:transitionSpeed:",  v52,  self->_rootLayer,  v53);

        v37 = @"WirelessAudioSyncDone";
LABEL_11:
        uint64_t v54 = TSKLocString(v37);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        -[TVSettingsAudioLatencyCalibrationView showActionButtonWithTitle:](self, "showActionButtonWithTitle:", v55);

        goto LABEL_13;
      case 6uLL:
        v56 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationView dismissHandler](self, "dismissHandler"));
        v56[2]();

LABEL_13:
        id v6 = v57;
        break;
      default:
        break;
    }
  }
}

- (void)_setText:(id)a3 forLabel:(id)a4 withDirectionForward:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  double v13 = objc_alloc_init(&OBJC_CLASS___CATransition);
  LODWORD(v9) = *(_DWORD *)"fff?";
  -[CATransition setStartProgress:](v13, "setStartProgress:", v9);
  -[CATransition setRemovedOnCompletion:](v13, "setRemovedOnCompletion:", 1LL);
  -[CATransition setDuration:](v13, "setDuration:", 0.25);
  -[CATransition setType:](v13, "setType:", kCATransitionMoveIn);
  CGRect v10 = &kCATransitionFromRight;
  if (!v5) {
    CGRect v10 = &kCATransitionFromLeft;
  }
  -[CATransition setSubtype:](v13, "setSubtype:", *v10);
  CGRect v11 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
  -[CATransition setTimingFunction:](v13, "setTimingFunction:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  [v12 addAnimation:v13 forKey:0];

  [v7 setText:v8];
}

- (void)showActionButtonWithTitle:(id)a3
{
  id v4 = a3;
  -[UIViewPropertyAnimator stopAnimation:](self->_basicAnimator, "stopAnimation:", 1LL);
  -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", v4, 0LL);
  -[UIButton setNeedsFocusUpdate](self->_actionButton, "setNeedsFocusUpdate");
  BOOL v5 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v6 = -[TVSWirelessAudioSyncTimingCurveProvider initWithTimingCurveProviderType:]( objc_alloc(&OBJC_CLASS___TVSWirelessAudioSyncTimingCurveProvider),  "initWithTimingCurveProviderType:",  0LL);
  id v7 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v5, "initWithDuration:timingParameters:", v6, 1.5);
  transformAnimator = self->_transformAnimator;
  self->_transformAnimator = v7;

  objc_initWeak(&location, self);
  double v9 = self->_transformAnimator;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000376F8;
  v17[3] = &unk_10018E810;
  objc_copyWeak(&v18, &location);
  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v17);
  CGRect v10 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  CGRect v11 = -[TVSWirelessAudioSyncTimingCurveProvider initWithTimingCurveProviderType:]( objc_alloc(&OBJC_CLASS___TVSWirelessAudioSyncTimingCurveProvider),  "initWithTimingCurveProviderType:",  1LL);
  uint64_t v12 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v10,  "initWithDuration:timingParameters:",  v11,  1.0);
  alphaAnimator = self->_alphaAnimator;
  self->_alphaAnimator = v12;

  BOOL v14 = self->_alphaAnimator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100037758;
  v15[3] = &unk_10018E810;
  objc_copyWeak(&v16, &location);
  -[UIViewPropertyAnimator addAnimations:](v14, "addAnimations:", v15);
  -[UIViewPropertyAnimator startAnimation](self->_transformAnimator, "startAnimation");
  -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)hideActionButton
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100037854;
  v5[3] = &unk_10018E440;
  v5[4] = self;
  v3 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue( +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIViewPropertyAnimator,  "runningPropertyAnimatorWithDuration:delay:options:animations:completion:",  0LL,  v5,  0LL,  0.25,  0.0));
  basicAnimator = self->_basicAnimator;
  self->_basicAnimator = v3;
}

- (void)handleActionPress
{
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVSettingsAudioLatencyCalibrationView dismissHandler](self, "dismissHandler"));
  v3[2]();
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (UILabel)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (UILabel)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIViewPropertyAnimator)basicAnimator
{
  return self->_basicAnimator;
}

- (void)setBasicAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)transformAnimator
{
  return self->_transformAnimator;
}

- (void)setTransformAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void)setAlphaAnimator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end