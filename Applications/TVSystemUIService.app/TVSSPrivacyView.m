@interface TVSSPrivacyView
- (TVSSLocationIndicatorView)locationIndicatorView;
- (TVSSPrivacyView)initWithFrame:(CGRect)a3;
- (TVSSRecordingIndicatorView)recordingIndicatorView;
- (UIStackView)stackView;
- (int64_t)axis;
- (void)_updateStackViewLayout;
- (void)setAxis:(int64_t)a3;
@end

@implementation TVSSPrivacyView

- (TVSSPrivacyView)initWithFrame:(CGRect)a3
{
  CGRect v29 = a3;
  SEL v27 = a2;
  v28 = 0LL;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVSSPrivacyView;
  v28 = -[TVSSPrivacyView initWithFrame:]( &v26,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v28, v28);
  if (v28)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSSRecordingIndicatorView);
    recordingIndicatorView = v28->_recordingIndicatorView;
    v28->_recordingIndicatorView = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___TVSSLocationIndicatorView);
    locationIndicatorView = v28->_locationIndicatorView;
    v28->_locationIndicatorView = v5;

    v11 = objc_alloc(&OBJC_CLASS___UIStackView);
    v31[0] = v28->_locationIndicatorView;
    v31[1] = v28->_recordingIndicatorView;
    v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL);
    v7 = -[UIStackView initWithArrangedSubviews:](v11, "initWithArrangedSubviews:");
    stackView = v28->_stackView;
    v28->_stackView = v7;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v28->_stackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setSpacing:](v28->_stackView, "setSpacing:", 4.0);
    -[TVSSPrivacyView addSubview:](v28, "addSubview:", v28->_stackView);
    id v25 = -[UIStackView leadingAnchor](v28->_stackView, "leadingAnchor");
    id v24 = -[TVSSPrivacyView leadingAnchor](v28, "leadingAnchor");
    id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
    v30[0] = v23;
    id v22 = -[UIStackView trailingAnchor](v28->_stackView, "trailingAnchor");
    id v21 = -[TVSSPrivacyView trailingAnchor](v28, "trailingAnchor");
    id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
    v30[1] = v20;
    id v19 = -[UIStackView topAnchor](v28->_stackView, "topAnchor");
    id v18 = -[TVSSPrivacyView topAnchor](v28, "topAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v30[2] = v17;
    id v16 = -[UIStackView bottomAnchor](v28->_stackView, "bottomAnchor");
    id v15 = -[TVSSPrivacyView bottomAnchor](v28, "bottomAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v30[3] = v14;
    v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

    -[TVSSPrivacyView _updateStackViewLayout](v28, "_updateStackViewLayout");
  }

  v10 = v28;
  objc_storeStrong((id *)&v28, 0LL);
  return v10;
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[TVSSPrivacyView _updateStackViewLayout](self, "_updateStackViewLayout");
  }

- (void)_updateStackViewLayout
{
  int64_t v4 = -[TVSSPrivacyView axis](self, "axis");
  v5 = -[TVSSPrivacyView stackView](self, "stackView");
  -[UIStackView setAxis:](v5, "setAxis:", v4);

  if (-[TVSSPrivacyView axis](self, "axis"))
  {
    v2 = -[TVSSPrivacyView stackView](self, "stackView");
    -[UIStackView insertArrangedSubview:atIndex:]( v2,  "insertArrangedSubview:atIndex:",  self->_recordingIndicatorView,  0LL);
  }

  else
  {
    v3 = -[TVSSPrivacyView stackView](self, "stackView");
    -[UIStackView insertArrangedSubview:atIndex:]( v3,  "insertArrangedSubview:atIndex:",  self->_locationIndicatorView,  0LL);
  }

- (int64_t)axis
{
  return self->_axis;
}

- (TVSSRecordingIndicatorView)recordingIndicatorView
{
  return self->_recordingIndicatorView;
}

- (TVSSLocationIndicatorView)locationIndicatorView
{
  return self->_locationIndicatorView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
}

@end