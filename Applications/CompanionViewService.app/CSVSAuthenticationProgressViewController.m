@interface CSVSAuthenticationProgressViewController
- (CSVSAuthenticationInfo)authenticationInfo;
- (CSVSMicaPlayerView)micaPlayerView;
- (UILabel)captionLabel;
- (id)_baseProgressAnimationName;
- (id)_confirmedProgressAnimationName;
- (id)animatingImageView;
- (id)constructCalloutLabel;
- (id)constructCaptionLabel;
- (int64_t)state;
- (void)configureAwaitingCompanionHierarchy;
- (void)configureConfirmHierarchy;
- (void)configureConfirmedHierarchy;
- (void)configureConfirmingHierarchy;
- (void)configureHierarchy;
- (void)configureQRCodeHierarchy;
- (void)scene:(id)a3 isTransitioningWithPhase:(int64_t)a4 isAppearing:(BOOL)a5;
- (void)setAuthenticationInfo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation CSVSAuthenticationProgressViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationProgressViewController;
  -[CSVSAuthenticationProgressViewController viewDidLoad](&v3, "viewDidLoad");
  -[CSVSAuthenticationProgressViewController configureHierarchy](self, "configureHierarchy");
}

- (void)configureHierarchy
{
  unint64_t v3 = -[CSVSAuthenticationProgressViewController state](self, "state");
  if (v3 > 1)
  {
    switch(v3)
    {
      case 2uLL:
        -[CSVSAuthenticationProgressViewController configureConfirmHierarchy](self, "configureConfirmHierarchy");
        break;
      case 3uLL:
        -[CSVSAuthenticationProgressViewController configureConfirmingHierarchy](self, "configureConfirmingHierarchy");
        break;
      case 4uLL:
        -[CSVSAuthenticationProgressViewController configureConfirmedHierarchy](self, "configureConfirmedHierarchy");
        break;
      case 5uLL:
        -[CSVSAuthenticationProgressViewController configureQRCodeHierarchy](self, "configureQRCodeHierarchy");
        break;
      default:
        return;
    }
  }

  else
  {
    -[CSVSAuthenticationProgressViewController configureAwaitingCompanionHierarchy]( self,  "configureAwaitingCompanionHierarchy");
  }

- (void)configureAwaitingCompanionHierarchy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  v4 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  [v5 addSubview:v4];

  v6 = objc_alloc(&OBJC_CLASS___CSVSMicaPlayerView);
  v7 = sub_1000073B0((unint64_t)[v3 authenticationKind]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CSVSMicaPlayerView initWithPackageName:](v6, "initWithPackageName:", v8);
  micaPlayerView = self->_micaPlayerView;
  self->_micaPlayerView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCalloutLabel](self, "constructCalloutLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"CONTINUE_ON_DEVICE" value:&stru_100024BC0 table:0]);
  [v11 setText:v13];

  v14 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCaptionLabel](self, "constructCaptionLabel"));
  id v15 = v3;
  id v16 = [v15 authType];
  id v17 = [v15 authenticationKind];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accountDescription]);

  v81 = v15;
  switch((unint64_t)v16)
  {
    case 1uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v20 = sub_10000743C(@"CONFIRM_PURCHASE_ON_DEVICE", (unint64_t)v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v21 value:&stru_100024BC0 table:0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v22,  v18));

      goto LABEL_4;
    case 2uLL:
      if (![v18 length]) {
        goto LABEL_9;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = v25;
      v26 = @"CONFIRM_SIGN_IN_ON_DEVICE_WITH_ACCOUNT";
LABEL_8:
      v27 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:v26 value:&stru_100024BC0 table:0]);
      v28 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v27, v18);
      goto LABEL_14;
    case 9uLL:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = v29;
      v30 = @"CONFIRM_SHARE_ON_DEVICE";
      goto LABEL_12;
    case 0xAuLL:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = v29;
      v30 = @"APPROVE_ON_DEVICE";
      goto LABEL_12;
    case 0xBuLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = v25;
      v26 = @"CONFIRM_SIGN_IN_ON_DEVICE_WITH_ACCOUNT_WATCH";
      goto LABEL_8;
    case 0xCuLL:
LABEL_9:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = v29;
      v30 = @"CONFIRM_SIGN_IN_ON_DEVICE";
LABEL_12:
      v23 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedStringForKey:v30 value:&stru_100024BC0 table:0]);
      break;
    case 0xDuLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"LEARN_MORE_ON_DEVICE" value:&stru_100024BC0 table:0]);
      v28 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v27, v46);
LABEL_14:
      v23 = (void *)objc_claimAutoreleasedReturnValue(v28);

      break;
    default:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v24 = sub_10000743C(@"CONFIRM_SYSTEM_AUTH_ON_DEVICE", (unint64_t)v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v21 value:&stru_100024BC0 table:0]);
LABEL_4:

      break;
  }

  -[UILabel setText:](v14, "setText:", v23);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v14;
  v32 = v14;

  v84[0] = self->_micaPlayerView;
  v84[1] = v11;
  v84[2] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 3LL));
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_100011490;
  v82[3] = &unk_100024650;
  v82[4] = self;
  [v33 enumerateObjectsUsingBlock:v82];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v34 leadingAnchor]);
  v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79 constant:30.0]);
  v83[0] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue([v34 trailingAnchor]);
  v74 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v76 constant:-30.0]);
  v83[1] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4, "centerXAnchor"));
  v75 = v34;
  v72 = (void *)objc_claimAutoreleasedReturnValue([v34 centerXAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v72]);
  v83[2] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v4, "centerYAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v34 centerYAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v69]);
  v83[3] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView topAnchor](self->_micaPlayerView, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66]);
  v83[4] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView centerXAnchor](self->_micaPlayerView, "centerXAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v63]);
  v83[5] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue([v11 leadingAnchor]);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v60]);
  v83[6] = v59;
  v55 = (void *)objc_claimAutoreleasedReturnValue([v11 trailingAnchor]);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v54]);
  v83[7] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v11 firstBaselineAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView bottomAnchor](self->_micaPlayerView, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51 constant:50.0]);
  v83[8] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v32, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v48]);
  v83[9] = v47;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v32, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v36]);
  v83[10] = v37;
  v56 = v32;
  v38 = v4;
  v58 = v4;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v32, "firstBaselineAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v11 lastBaselineAnchor]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40 constant:40.0]);
  v83[11] = v41;
  v57 = v11;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v32, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v38, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);
  v83[12] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v83, 13LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v45);
}

- (void)configureConfirmHierarchy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  v4 = objc_alloc(&OBJC_CLASS___CSVSMicaPlayerView);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationProgressViewController _confirmingProgressAnimationName]( self,  "_confirmingProgressAnimationName"));
  v6 = -[CSVSMicaPlayerView initWithPackageName:](v4, "initWithPackageName:", v5);
  micaPlayerView = self->_micaPlayerView;
  self->_micaPlayerView = v6;

  v8 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCalloutLabel](self, "constructCalloutLabel"));
  id v9 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 name]);

  if (v11)
  {
    if ([v9 authType] == (id)9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = v12;
      v14 = @"SHARE_ON_NAMED_DEVICE";
LABEL_12:
      v23 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v14 value:&stru_100024BC0 table:0]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v23,  v11));

LABEL_24:
      goto LABEL_25;
    }

    if ([v9 authenticationKind] == (id)5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = v12;
      v14 = @"APPROVE_ON_NAMED_DEVICE";
      goto LABEL_12;
    }

    if ([v9 authenticationKind] == (id)6)
    {
      id v24 = 0LL;
      goto LABEL_25;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( [v30 localizedStringForKey:@"CONFIRM_ON_NAMED_DEVICE" value:&stru_100024BC0 table:0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v31,  v11));

    if ([v9 authType] == (id)12
      && (v32 = (void *)objc_claimAutoreleasedReturnValue([v9 qrCodeSubtitle]), v32, v32))
    {
      id v33 = sub_100013584(v13, v9);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v33);
    }

    else
    {
      id v22 = v13;
      v13 = v22;
    }

- (void)configureConfirmingHierarchy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  v4 = objc_alloc(&OBJC_CLASS___CSVSMicaPlayerView);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationProgressViewController _confirmingProgressAnimationName]( self,  "_confirmingProgressAnimationName"));
  v6 = -[CSVSMicaPlayerView initWithPackageName:](v4, "initWithPackageName:", v5);
  micaPlayerView = self->_micaPlayerView;
  self->_micaPlayerView = v6;

  v8 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCalloutLabel](self, "constructCalloutLabel"));
  id v9 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 name]);

  if (v11)
  {
    if ([v9 authType] == (id)9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v13 = v12;
      v14 = @"SHARING_ON_NAMED_DEVICE";
LABEL_12:
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:v14 value:&stru_100024BC0 table:0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v24,  v11));

LABEL_22:
      goto LABEL_23;
    }

    id v23 = [v9 authenticationKind];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v13 = v12;
    if (v23 == (id)5)
    {
      v14 = @"APPROVING_ON_NAMED_DEVICE";
      goto LABEL_12;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"CONFIRMING_ON_NAMED_DEVICE" value:&stru_100024BC0 table:0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v31,  v11));

    if ([v9 authType] == (id)12)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v9 qrCodeSubtitle]);

      if (v33)
      {
        id v34 = sub_100013584(v32, v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v13 = v32;
        goto LABEL_22;
      }
    }

    id v22 = v32;
    v13 = v22;
LABEL_21:
    v25 = v22;
    goto LABEL_22;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 device]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 model]);
  int v17 = GestaltProductTypeStringToDeviceClass();
  v18 = @"iPhone";
  if (v17 == 2) {
    v18 = @"iPod touch";
  }
  if (v17 == 3) {
    v18 = @"iPad";
  }
  v19 = v18;

  id v20 = [v9 authenticationKind];
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  if (v20 == (id)5)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"APPROVING_ON",  v19));

    v13 = (void *)objc_claimAutoreleasedReturnValue([v21 uppercaseString]);
    id v22 = (id)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v13 value:&stru_100024BC0 table:0]);
    goto LABEL_21;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  @"CONFIRMING_ON",  v19));

  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 uppercaseString]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v27 value:&stru_100024BC0 table:0]);

  if ([v9 authType] == (id)12
    && (id v29 = (void *)objc_claimAutoreleasedReturnValue([v9 qrCodeSubtitle]), v29, v29))
  {
    id v30 = sub_100013584(v28, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v30);
    id v11 = v28;
  }

  else
  {
    id v11 = v28;
    v25 = v11;
  }

- (void)configureConfirmedHierarchy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 error]);

  v5 = objc_alloc(&OBJC_CLASS___CSVSMicaPlayerView);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationProgressViewController _confirmedProgressAnimationName]( self,  "_confirmedProgressAnimationName"));
  v7 = -[CSVSMicaPlayerView initWithPackageName:](v5, "initWithPackageName:", v6);
  micaPlayerView = self->_micaPlayerView;
  self->_micaPlayerView = v7;

  id v9 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCalloutLabel](self, "constructCalloutLabel"));
  v36 = (void *)v4;
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
    switch((unint64_t)[v10 authenticationKind])
    {
      case 0uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v12 = v11;
        v13 = @"SIGN_IN_NOT_COMPLETED";
        break;
      case 2uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v12 = v11;
        v13 = @"PURCHASE_NOT_COMPLETED";
        break;
      case 4uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v12 = v11;
        v13 = @"SHARE_NOT_COMPLETED";
        break;
      case 5uLL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v12 = v11;
        v13 = @"APPROVAL_NOT_COMPLETED";
        break;
      default:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v12 = v11;
        v13 = @"CONFIRMATION_NOT_COMPLETED";
        break;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v13 value:&stru_100024BC0 table:0]);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:@"DONE" value:&stru_100024BC0 table:0]);
  }

  -[UILabel setText:](v9, "setText:", v14);

  captionLabel = self->_captionLabel;
  self->_captionLabel = v9;
  id v16 = v9;

  v39[0] = self->_micaPlayerView;
  v39[1] = v16;
  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100012718;
  v37[3] = &unk_100024650;
  v37[4] = self;
  [v17 enumerateObjectsUsingBlock:v37];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView centerXAnchor](self->_micaPlayerView, "centerXAnchor"));
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 centerXAnchor]);
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v34]);
  v38[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView topAnchor](self->_micaPlayerView, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v18 topAnchor]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v31 constant:170.0]);
  v38[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v16, "firstBaselineAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView bottomAnchor](self->_micaPlayerView, "bottomAnchor"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v19 constant:50.0]);
  v38[2] = v20;
  id v29 = v16;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v16, "leadingAnchor"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v22 constant:40.0]);
  v38[3] = v23;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v16, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v18 trailingAnchor]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25 constant:-40.0]);
  v38[4] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 5LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v27);
}

- (void)configureQRCodeHierarchy
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  uint64_t v4 = objc_alloc(&OBJC_CLASS___UIImageView);
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 qrCodeImage]);
  v7 = -[UIImageView initWithImage:](v4, "initWithImage:", v6);

  v8 = v7;
  -[UIImageView setContentMode:](v7, "setContentMode:", 1LL);
  id v9 = objc_opt_new(&OBJC_CLASS___UIView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9, "layer"));
  [v10 setCompositingFilter:kCAFilterPlusL];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9, "layer"));
  id v12 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  objc_msgSend(v11, "setBorderColor:", objc_msgSend(v12, "CGColor"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9, "layer"));
  [v13 setBorderWidth:7.0];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v9, "layer"));
  [v14 setCornerRadius:35.0];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCalloutLabel](self, "constructCalloutLabel"));
  v77 = v5;
  int v17 = (void *)objc_claimAutoreleasedReturnValue([v5 qrCodeTitle]);
  [v16 setText:v17];

  v18 = v16;
  LODWORD(v19) = 1148846080;
  [v16 setContentCompressionResistancePriority:1 forAxis:v19];
  id v20 = (UILabel *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController constructCaptionLabel](self, "constructCaptionLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 qrCodeSubtitle]);
  -[UILabel setText:](v20, "setText:", v21);

  LODWORD(v22) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:]( v20,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v22);
  captionLabel = self->_captionLabel;
  self->_captionLabel = v20;
  id v24 = v20;

  v80[0] = v8;
  v80[1] = v9;
  v80[2] = v18;
  v80[3] = v24;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 4LL));
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_100012F4C;
  v78[3] = &unk_100024650;
  v78[4] = self;
  [v26 enumerateObjectsUsingBlock:v78];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController view](self, "view"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v8, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v27 topAnchor]);
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 constraintEqualToAnchor:v75 constant:70.0]);
  v79[0] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v8, "centerXAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v27 centerXAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v72]);
  v79[1] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v8, "widthAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v8, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v69]);
  v79[2] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v9, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v8, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v65 constant:-20.0]);
  v79[3] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v9, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v8, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62 constant:-20.0]);
  v79[4] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v9, "trailingAnchor"));
  v67 = v8;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v8, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58 constant:20.0]);
  v79[5] = v57;
  v60 = v9;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v9, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v8, "bottomAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v55 constant:20.0]);
  v79[6] = v54;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  v28 = v27;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v27 leadingAnchor]);
  v49 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51 constant:10.0]);
  v79[7] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue([v18 trailingAnchor]);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v27 trailingAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue([v47 constraintEqualToAnchor:v46 constant:-10.0]);
  v79[8] = v45;
  v53 = v18;
  v44 = (void *)objc_claimAutoreleasedReturnValue([v18 topAnchor]);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v9, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43 constant:30.0]);
  v79[9] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v25, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v27 leadingAnchor]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v40 constant:50.0]);
  v79[10] = v39;
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v25, "trailingAnchor"));
  v48 = v28;
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 trailingAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v30 constant:-50.0]);
  v79[11] = v31;
  v50 = v25;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v25, "firstBaselineAnchor"));
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v18 lastBaselineAnchor]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v33 constant:40.0]);
  v79[12] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v25, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v28 bottomAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintLessThanOrEqualToAnchor:v36 constant:-51.0]);
  v79[13] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 14LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v38);
}

- (id)constructCalloutLabel
{
  v2 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCallout));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fontDescriptor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fontDescriptorWithSymbolicTraits:2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v5, 0.0));
  -[UILabel setFont:](v2, "setFont:", v6);

  -[UILabel setNumberOfLines:](v2, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 1LL);
  return v2;
}

- (id)constructCaptionLabel
{
  v2 = -[VibrantLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___VibrantLabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
  -[VibrantLabel setFont:](v2, "setFont:", v3);

  -[VibrantLabel setNumberOfLines:](v2, "setNumberOfLines:", 0LL);
  -[VibrantLabel setTextAlignment:](v2, "setTextAlignment:", 1LL);
  -[VibrantLabel setTranslatesAutoresizingMaskIntoConstraints:]( v2,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[VibrantLabel layer](v2, "layer"));
  [v4 setAllowsGroupOpacity:0];
  [v4 setAllowsGroupBlending:0];

  return v2;
}

- (id)animatingImageView
{
  return self->_micaPlayerView;
}

- (id)_baseProgressAnimationName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 device]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v4 appendString:@"device-animation"];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  unsigned __int8 v6 = [v5 hasPrefix:@"iPad"];

  if ((v6 & 1) != 0)
  {
    v7 = @"-pad";
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    unsigned int v9 = [v8 hasPrefix:@"Watch"];

    if (v9) {
      v7 = @"-watch";
    }
    else {
      v7 = @"-phone";
    }
  }

  [v4 appendString:v7];
  if (([v3 flags] & 4) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
    unsigned __int8 v12 = [v11 hasPrefix:@"Watch"];

    if ((v12 & 1) == 0)
    {
      v10 = @"-hb";
      goto LABEL_11;
    }
  }

  else if (([v3 flags] & 8) != 0)
  {
    v10 = @"-island";
LABEL_11:
    [v4 appendString:v10];
  }

  id v13 = [v4 copy];

  return v13;
}

- (id)_confirmedProgressAnimationName
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationProgressViewController authenticationInfo](self, "authenticationInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  v5 = @"error";
  if (!v4) {
    v5 = @"check";
  }
  unsigned __int8 v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationProgressViewController _baseProgressAnimationName]( self,  "_baseProgressAnimationName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v7, v6));

  return v8;
}

- (void)scene:(id)a3 isTransitioningWithPhase:(int64_t)a4 isAppearing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (self->_state == 3)
  {
    id v12 = v8;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self->_micaPlayerView, "layer"));
    v10 = v9;
    double v11 = 0.0;
LABEL_9:
    [v9 setBeginTime:v11];

    id v8 = v12;
    goto LABEL_10;
  }

  if (!a4 && v5)
  {
    id v12 = v8;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self->_micaPlayerView, "layer"));
    v10 = v9;
    double v11 = 1.79769313e308;
    goto LABEL_9;
  }

  if (a4 == 2 && v5)
  {
    id v12 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self->_micaPlayerView, "layer"));
    double v11 = CACurrentMediaTime();
    unsigned int v9 = v10;
    goto LABEL_9;
  }

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CSVSAuthenticationInfo)authenticationInfo
{
  return self->_authenticationInfo;
}

- (void)setAuthenticationInfo:(id)a3
{
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (CSVSMicaPlayerView)micaPlayerView
{
  return self->_micaPlayerView;
}

- (void).cxx_destruct
{
}

@end