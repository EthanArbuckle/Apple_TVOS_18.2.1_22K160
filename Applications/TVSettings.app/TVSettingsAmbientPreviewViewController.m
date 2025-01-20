@interface TVSettingsAmbientPreviewViewController
- (BOOL)shouldShowSpinner;
- (NSString)spinnerText;
- (TVSettingsAmbientPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIActivityIndicatorView)spinner;
- (UILabel)spinnerLabel;
- (UIView)spinnerContainer;
- (void)setShouldShowSpinner:(BOOL)a3;
- (void)setSpinnerText:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsAmbientPreviewViewController

- (TVSettingsAmbientPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPreviewViewController;
  v4 = -[TVSettingsAmbientPreviewViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIView);
    spinnerContainer = v4->_spinnerContainer;
    v4->_spinnerContainer = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_spinnerContainer,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    spinnerLabel = v4->_spinnerLabel;
    v4->_spinnerLabel = v7;

    v9 = v4->_spinnerLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v11 = v4->_spinnerLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setNumberOfLines:](v4->_spinnerLabel, "setNumberOfLines:", 5LL);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_spinnerLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setLineBreakMode:](v4->_spinnerLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v4->_spinnerLabel, "setTextAlignment:", 1LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_spinnerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v4->_spinnerLabel, "font"));
    [v13 pointSize];
    double v15 = v14;

    -[UILabel setMinimumScaleFactor:](v4->_spinnerLabel, "setMinimumScaleFactor:", 12.0 / v15);
    v16 = objc_alloc_init(&OBJC_CLASS___UIActivityIndicatorView);
    spinner = v4->_spinner;
    v4->_spinner = v16;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_spinner,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIActivityIndicatorView startAnimating](v4->_spinner, "startAnimating");
  }

  return v4;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPreviewViewController;
  -[TVSettingsAmbientPreviewViewController viewDidLoad](&v36, "viewDidLoad");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPreviewViewController view](self, "view"));
  [v35 addSubview:self->_spinnerContainer];
  -[UIView addSubview:](self->_spinnerContainer, "addSubview:", self->_spinner);
  -[UIView addSubview:](self->_spinnerContainer, "addSubview:", self->_spinnerLabel);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_spinnerContainer, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPreviewViewController metadataContainer](self, "metadataContainer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 bottomAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v32 constant:20.0]);
  v37[0] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_spinnerContainer, "centerXAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPreviewViewController contentContainer](self, "contentContainer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v30 centerXAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v28]);
  v37[1] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_spinnerContainer, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAmbientPreviewViewController contentContainer](self, "contentContainer"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v26 widthAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintLessThanOrEqualToAnchor:v24]);
  v37[2] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_spinnerLabel, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
  v37[3] = v20;
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](self->_spinner, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_spinnerContainer, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v18]);
  v37[4] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView widthAnchor](self->_spinner, "widthAnchor"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToConstant:50.0]);
  v37[5] = v15;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView heightAnchor](self->_spinner, "heightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToConstant:50.0]);
  v37[6] = v12;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_spinnerLabel, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_spinnerContainer, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 constraintEqualToAnchor:v4]);
  v37[7] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_spinnerLabel, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_spinnerContainer, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v7]);
  v37[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_spinnerLabel, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](self->_spinner, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v10 constant:10.0]);
  v37[9] = v11;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 10LL));

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
  -[TVSettingsAmbientPreviewViewController setShouldShowSpinner:](self, "setShouldShowSpinner:", 0LL);
}

- (void)setSpinnerText:(id)a3
{
}

- (void)setShouldShowSpinner:(BOOL)a3
{
  BOOL v5 = !a3;
  -[UILabel setHidden:](self->_spinnerLabel, "setHidden:", v5);
  -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", v5);
  self->_shouldShowSpinner = a3;
}

- (NSString)spinnerText
{
  return self->_spinnerText;
}

- (BOOL)shouldShowSpinner
{
  return self->_shouldShowSpinner;
}

- (UIView)spinnerContainer
{
  return self->_spinnerContainer;
}

- (UILabel)spinnerLabel
{
  return self->_spinnerLabel;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void).cxx_destruct
{
}

@end