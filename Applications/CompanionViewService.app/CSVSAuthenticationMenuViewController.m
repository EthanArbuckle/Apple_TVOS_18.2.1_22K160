@interface CSVSAuthenticationMenuViewController
- (CSVSAuthenticationInfo)authenticationInfo;
- (CSVSMicaPlayerView)micaPlayerView;
- (NSArray)orderedCustomAuthenticationActions;
- (UIAction)authenticateWithCompanionAction;
- (void)configureHierarchy;
- (void)scene:(id)a3 isTransitioningWithPhase:(int64_t)a4 isAppearing:(BOOL)a5;
- (void)setAuthenticateWithCompanionAction:(id)a3;
- (void)setAuthenticationInfo:(id)a3;
- (void)setOrderedCustomAuthenticationActions:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSVSAuthenticationMenuViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationMenuViewController;
  -[CSVSAuthenticationMenuViewController viewDidLoad](&v3, "viewDidLoad");
  -[CSVSAuthenticationMenuViewController configureHierarchy](self, "configureHierarchy");
}

- (void)configureHierarchy
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController view](self, "view"));
  [v4 addSubview:v3];

  v5 = v3;
  v6 = objc_alloc(&OBJC_CLASS___CSVSMicaPlayerView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController authenticationInfo](self, "authenticationInfo"));
  v8 = sub_1000073B0((unint64_t)[v7 authenticationKind]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[CSVSMicaPlayerView initWithPackageName:](v6, "initWithPackageName:", v9);
  micaPlayerView = self->_micaPlayerView;
  self->_micaPlayerView = v10;

  v12 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
  -[UILabel setFont:](v12, "setFont:", v13);

  -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  -[UILabel setTextColor:](v12, "setTextColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController authenticationInfo](self, "authenticationInfo"));
  id v17 = sub_10000743C(@"NOTIFICATION_SENT", (unint64_t)[v16 authenticationKind]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v18 value:&stru_100024BC0 table:0]);
  v90 = v12;
  -[UILabel setText:](v12, "setText:", v19);

  v104 = self;
  v107 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationMenuViewController orderedCustomAuthenticationActions]( self,  "orderedCustomAuthenticationActions"));
  id v21 = [v20 countByEnumeratingWithState:&v115 objects:v124 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v116;
    do
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v116 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIButton systemButtonWithPrimaryAction:]( &OBJC_CLASS___UIButton,  "systemButtonWithPrimaryAction:",  *(void *)(*((void *)&v115 + 1) + 8LL * (void)i)));
        [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v25 titleLabel]);
        [v27 setFont:v26];

        v28 = (void *)objc_claimAutoreleasedReturnValue([v25 titleLabel]);
        [v28 setEnablesMarqueeWhenAncestorFocused:1];

        -[UIView addSubview:](v5, "addSubview:", v25);
        -[NSMutableArray addObject:](v107, "addObject:", v25);
      }

      id v22 = [v20 countByEnumeratingWithState:&v115 objects:v124 count:16];
    }

    while (v22);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue( -[CSVSAuthenticationMenuViewController authenticateWithCompanionAction]( v104,  "authenticateWithCompanionAction"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIButton systemButtonWithPrimaryAction:]( &OBJC_CLASS___UIButton,  "systemButtonWithPrimaryAction:",  v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v30 titleLabel]);
  [v32 setFont:v31];

  v33 = (void *)objc_claimAutoreleasedReturnValue([v30 titleLabel]);
  [v33 setEnablesMarqueeWhenAncestorFocused:1];

  v123[0] = v104->_micaPlayerView;
  v123[1] = v12;
  v123[2] = v30;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 3LL));
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472LL;
  v113[2] = sub_100006508;
  v113[3] = &unk_100024650;
  v35 = v5;
  v114 = v35;
  [v34 enumerateObjectsUsingBlock:v113];

  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v35, "centerXAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController view](v104, "view"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v100 centerXAnchor]);
  v93 = (void *)objc_claimAutoreleasedReturnValue([v98 constraintEqualToAnchor:v95]);
  v122[0] = v93;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v35, "centerYAnchor"));
  id obja = (id)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController view](v104, "view"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([obja centerYAnchor]);
  v85 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintEqualToAnchor:v86]);
  v122[1] = v85;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v35, "widthAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationMenuViewController view](v104, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue([v84 widthAnchor]);
  v81 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v82]);
  v122[2] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView topAnchor](v104->_micaPlayerView, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v35, "topAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79]);
  v122[3] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView centerXAnchor](v104->_micaPlayerView, "centerXAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v35, "centerXAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v76]);
  v122[4] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue([v30 topAnchor]);
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView bottomAnchor](v104->_micaPlayerView, "bottomAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v105 constant:42.0]);
  v122[5] = v102;
  v73 = (void *)objc_claimAutoreleasedReturnValue([v30 leadingAnchor]);
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v35, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v72]);
  v122[6] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue([v30 trailingAnchor]);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v35, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v69]);
  v122[7] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue([v30 heightAnchor]);
  v66 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToConstant:66.0]);
  v122[8] = v66;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v90, "firstBaselineAnchor"));
  v89 = v30;
  v37 = (void *)objc_claimAutoreleasedReturnValue([v30 bottomAnchor]);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v37 constant:40.0]);
  v122[9] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v90, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v35, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40 constant:25.0]);
  v122[10] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v90, "trailingAnchor"));
  v97 = v35;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v35, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43 constant:-25.0]);
  v122[11] = v44;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 12LL));

  v96 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  v45 = v107;
  id v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v45,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
  if (v99)
  {
    id v46 = 0LL;
    obj = v45;
    uint64_t v94 = *(void *)v110;
    do
    {
      v47 = 0LL;
      v48 = v46;
      do
      {
        if (*(void *)v110 != v94) {
          objc_enumerationMutation(obj);
        }
        v49 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 topAnchor]);
        v108 = v50;
        if (v48)
        {
          v106 = (void *)objc_claimAutoreleasedReturnValue([v48 bottomAnchor]);
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", 14.0));
          v119[0] = v103;
          v51 = (void *)objc_claimAutoreleasedReturnValue([v49 leadingAnchor]);
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v97, "leadingAnchor"));
          v101 = v51;
          v53 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v52]);
          v119[1] = v53;
          v54 = (void *)objc_claimAutoreleasedReturnValue([v49 trailingAnchor]);
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v97, "trailingAnchor"));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v55]);
          v119[2] = v56;
          v57 = v119;
        }

        else
        {
          v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v90, "lastBaselineAnchor"));
          v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", 76.0));
          v120[0] = v103;
          v58 = (void *)objc_claimAutoreleasedReturnValue([v49 leadingAnchor]);
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v97, "leadingAnchor"));
          v101 = v58;
          v53 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v52]);
          v120[1] = v53;
          v54 = (void *)objc_claimAutoreleasedReturnValue([v49 trailingAnchor]);
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v97, "trailingAnchor"));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v55]);
          v120[2] = v56;
          v57 = v120;
        }

        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 3LL));
        -[NSMutableArray addObjectsFromArray:](v96, "addObjectsFromArray:", v59);

        v60 = (void *)objc_claimAutoreleasedReturnValue([v49 heightAnchor]);
        v61 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToConstant:66.0]);
        -[NSMutableArray addObject:](v96, "addObject:", v61);

        id v46 = v49;
        v47 = (char *)v47 + 1;
        v48 = v46;
      }

      while (v99 != v47);
      v45 = obj;
      id v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v109,  v121,  16LL);
    }

    while (v99);

    if (v46)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue([v46 bottomAnchor]);
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v97, "bottomAnchor"));
      v64 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v63]);
      -[NSMutableArray addObject:](v96, "addObject:", v64);

LABEL_23:
      goto LABEL_24;
    }
  }

  else
  {
  }

  if (!-[NSMutableArray count](v45, "count"))
  {
    id v46 = (id)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v90, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v97, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v46 constraintEqualToAnchor:v62]);
    -[NSMutableArray addObject:](v96, "addObject:", v63);
    goto LABEL_23;
  }

- (void)scene:(id)a3 isTransitioningWithPhase:(int64_t)a4 isAppearing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (a4 || !v5)
  {
    if (a4 == 2 && v5)
    {
      dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000661C;
      block[3] = &unk_100024678;
      block[4] = self;
      dispatch_after(v10, &_dispatch_main_q, block);
    }
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSMicaPlayerView layer](self->_micaPlayerView, "layer"));
    [v9 setBeginTime:1.79769313e308];
  }
}

- (UIAction)authenticateWithCompanionAction
{
  return self->_authenticateWithCompanionAction;
}

- (void)setAuthenticateWithCompanionAction:(id)a3
{
}

- (NSArray)orderedCustomAuthenticationActions
{
  return self->_orderedCustomAuthenticationActions;
}

- (void)setOrderedCustomAuthenticationActions:(id)a3
{
}

- (CSVSAuthenticationInfo)authenticationInfo
{
  return self->_authenticationInfo;
}

- (void)setAuthenticationInfo:(id)a3
{
}

- (CSVSMicaPlayerView)micaPlayerView
{
  return self->_micaPlayerView;
}

- (void).cxx_destruct
{
}

@end