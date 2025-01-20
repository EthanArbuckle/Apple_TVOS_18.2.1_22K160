@interface DADeviceIdentifierView
- (DADeviceIdentifierView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)identifierLabelHeightConstraint;
- (NSLayoutConstraint)serialNumberLabelHeightConstraint;
- (NSString)deviceIdentifier;
- (UILabel)identifierLabel;
- (UILabel)serialNumberLabel;
- (void)setDeviceIdentifier:(id)a3;
- (void)setHeight;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifierLabel:(id)a3;
- (void)setIdentifierLabelHeightConstraint:(id)a3;
- (void)setSerialNumberLabel:(id)a3;
- (void)setSerialNumberLabelHeightConstraint:(id)a3;
- (void)updateConstraints;
- (void)updateWithDeviceState:(id)a3;
@end

@implementation DADeviceIdentifierView

- (DADeviceIdentifierView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DADeviceIdentifierView;
  v3 = -[DADeviceIdentifierView initWithFrame:]( &v16,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    v5 = objc_alloc(&OBJC_CLASS___UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = -[UILabel initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    identifierLabel = v3->_identifierLabel;
    v3->_identifierLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  50.0,  UIFontWeightBold));
    -[UILabel setFont:](v3->_identifierLabel, "setFont:", v11);

    -[UILabel setTextAlignment:](v3->_identifierLabel, "setTextAlignment:", 1LL);
    -[UILabel setNumberOfLines:](v3->_identifierLabel, "setNumberOfLines:", 1LL);
    -[UILabel setLineBreakMode:](v3->_identifierLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_identifierLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setTextColor:](v3->_identifierLabel, "setTextColor:", v4);
    -[DADeviceIdentifierView addSubview:](v3, "addSubview:", v3->_identifierLabel);
    v12 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    serialNumberLabel = v3->_serialNumberLabel;
    v3->_serialNumberLabel = v12;

    -[UILabel setTextAlignment:](v3->_serialNumberLabel, "setTextAlignment:", 0LL);
    -[UILabel setNumberOfLines:](v3->_serialNumberLabel, "setNumberOfLines:", 1LL);
    -[UILabel setLineBreakMode:](v3->_serialNumberLabel, "setLineBreakMode:", 2LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v3->_serialNumberLabel, "setFont:", v14);

    -[UILabel setTextColor:](v3->_serialNumberLabel, "setTextColor:", v4);
    -[UILabel setText:](v3->_serialNumberLabel, "setText:", &stru_10002D180);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_serialNumberLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[DADeviceIdentifierView addSubview:](v3, "addSubview:", v3->_serialNumberLabel);
  }

  return v3;
}

- (void)updateWithDeviceState:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 serialNumber]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  [v4 setText:v5];
}

- (void)updateConstraints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v3,  5LL,  0LL,  self,  5LL,  1.0,  0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  6LL,  0LL,  self,  6LL,  1.0,  0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  3LL,  0LL,  self,  3LL,  1.0,  0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabelHeightConstraint](self, "identifierLabelHeightConstraint"));
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v10,  8LL,  0LL,  0LL,  0LL,  1.0,  54.0));
    -[DADeviceIdentifierView setIdentifierLabelHeightConstraint:](self, "setIdentifierLabelHeightConstraint:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabelHeightConstraint](self, "identifierLabelHeightConstraint"));
    LODWORD(v13) = 1144750080;
    [v12 setPriority:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabelHeightConstraint](self, "identifierLabelHeightConstraint"));
    [v14 addConstraint:v15];
  }

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v16,  5LL,  1LL,  self,  5LL,  1.0,  0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v18,  6LL,  -1LL,  self,  6LL,  1.0,  -0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabel](self, "identifierLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v20,  3LL,  0LL,  v21,  4LL,  1.0,  2.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v23,  9LL,  0LL,  self,  9LL,  1.0,  0.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v26,  7LL,  1LL,  0LL,  0LL,  1.0,  10.0));
  [v25 addConstraint:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabelHeightConstraint](self, "serialNumberLabelHeightConstraint"));
  if (!v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v29,  8LL,  0LL,  0LL,  0LL,  1.0,  20.0));
    -[DADeviceIdentifierView setSerialNumberLabelHeightConstraint:](self, "setSerialNumberLabelHeightConstraint:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue( -[DADeviceIdentifierView serialNumberLabelHeightConstraint]( self,  "serialNumberLabelHeightConstraint"));
    LODWORD(v32) = 1144750080;
    [v31 setPriority:v32];

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue( -[DADeviceIdentifierView serialNumberLabelHeightConstraint]( self,  "serialNumberLabelHeightConstraint"));
    [v33 addConstraint:v34];
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabel](self, "serialNumberLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v35,  4LL,  0LL,  self,  4LL,  1.0,  2.0));
  -[DADeviceIdentifierView addConstraint:](self, "addConstraint:", v36);

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___DADeviceIdentifierView;
  -[DADeviceIdentifierView updateConstraints](&v37, "updateConstraints");
}

- (void)setDeviceIdentifier:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000E3B8;
  v5[3] = &unk_10002CB70;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DADeviceIdentifierView;
  -[DADeviceIdentifierView setHidden:](&v4, "setHidden:", a3);
  -[DADeviceIdentifierView setHeight](self, "setHeight");
}

- (void)setHeight
{
  double v3 = 0.0;
  double v4 = 0.0;
  if ((-[DADeviceIdentifierView isHidden](self, "isHidden") & 1) == 0)
  {
    NSUInteger v5 = -[NSString length](self->_deviceIdentifier, "length");
    if (v5) {
      double v4 = 54.0;
    }
    else {
      double v4 = 0.0;
    }
    if (v5) {
      double v3 = 20.0;
    }
    else {
      double v3 = 0.0;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView identifierLabelHeightConstraint](self, "identifierLabelHeightConstraint"));
  [v6 setConstant:v4];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceIdentifierView serialNumberLabelHeightConstraint](self, "serialNumberLabelHeightConstraint"));
  [v7 setConstant:v3];
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (UILabel)identifierLabel
{
  return self->_identifierLabel;
}

- (void)setIdentifierLabel:(id)a3
{
}

- (NSLayoutConstraint)identifierLabelHeightConstraint
{
  return self->_identifierLabelHeightConstraint;
}

- (void)setIdentifierLabelHeightConstraint:(id)a3
{
}

- (UILabel)serialNumberLabel
{
  return self->_serialNumberLabel;
}

- (void)setSerialNumberLabel:(id)a3
{
}

- (NSLayoutConstraint)serialNumberLabelHeightConstraint
{
  return self->_serialNumberLabelHeightConstraint;
}

- (void)setSerialNumberLabelHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end