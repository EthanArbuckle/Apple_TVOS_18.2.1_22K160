@interface TVSSHomeKitSceneRenderer
+ (id)rendererForScene:(id)a3;
- (TVSSProgressView)progressView;
- (id)_iconTintColorForIconIdentifier:(id)a3;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)overrideStylingForIdentifier:(id)a3;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (void)configureContentView:(id)a3;
- (void)setProgressView:(id)a3;
- (void)showProgressViewWithFuture:(id)a3;
@end

@implementation TVSSHomeKitSceneRenderer

+ (id)rendererForScene:(id)a3
{
  Class v11 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = objc_alloc(v11);
  id v8 = [location[0] actionSetItem];
  id v7 = [v8 homeKitObject];
  id v6 = [v7 uniqueIdentifier];
  id v5 = [v6 UUIDString];
  id v9 = objc_msgSend(v4, "initWithIdentifier:format:content:overrideStylings:");

  objc_storeStrong(location, 0LL);
  return v9;
}

- (void)configureContentView:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)&OBJC_CLASS___TVSSHomeKitSceneRenderer;
  -[TVSSHomeKitSceneRenderer configureContentView:](&v18, "configureContentView:", location[0]);
  v17 = objc_alloc_init(&OBJC_CLASS___TVSSProgressView);
  id v3 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
  -[TVSSProgressView setTintColor:](v17, "setTintColor:");

  -[TVSSProgressView setTranslatesAutoresizingMaskIntoConstraints:]( v17,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSSProgressView setHidden:](v17, "setHidden:", 1LL);
  [location[0] addSubview:v17];
  -[TVSSHomeKitSceneRenderer setProgressView:](v20, "setProgressView:", v17);
  id v4 = -[TVSSHomeKitSceneRenderer subviews](v20, "subviews");
  id v16 = [v4 imageView];

  id v14 = -[TVSSProgressView centerXAnchor](v17, "centerXAnchor");
  id v13 = [v16 centerXAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v21[0] = v12;
  id v11 = -[TVSSProgressView centerYAnchor](v17, "centerYAnchor");
  id v10 = [v16 centerYAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v21[1] = v9;
  id v8 = -[TVSSProgressView widthAnchor](v17, "widthAnchor");
  id v7 = objc_msgSend(v8, "constraintEqualToConstant:");
  v21[2] = v7;
  id v6 = -[TVSSProgressView heightAnchor](v17, "heightAnchor");
  id v5 = [v6 constraintEqualToConstant:58.0];
  v21[3] = v5;
  v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)overrideStylingForIdentifier:(id)a3
{
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v50[8] = 0;
  id v35 = -[TVSSHomeKitSceneRenderer content](v52, "content");
  id v34 = [v35 contentText1];
  BOOL v36 = [v34 length] != 0;

  *(void *)v50 = v36;
  id v37 = location[0];
  id v38 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v39 = objc_msgSend(v37, "isEqualToString:");

  if ((v39 & 1) != 0)
  {
    id v49 = -[TVSSHomeKitSceneRenderer content](v52, "content");
    id v48 = [v49 actionSetItem];
    id v47 = [v48 latestResults];
    id v32 = [v47 objectForKeyedSubscript:HFResultPrimaryStateKey];
    BOOL v33 = [v32 integerValue] == (id)2;

    BOOL v46 = v33;
    id v45 = [v47 objectForKeyedSubscript:HFResultDisplayIconDescriptorKey];
    id v44 = [v45 identifier];
    if (v44) {
      id v3 = v44;
    }
    else {
      id v3 = HFImageIconIdentifierGeneric;
    }
    id v43 = v3;
    id v42 = 0LL;
    if (v46)
    {
      id v30 = [v48 actionSet];
      id v31 = objc_msgSend(v30, "hf_iconTintColor");
      char v40 = 0;
      if (v31)
      {
        objc_storeStrong(&v42, v31);
      }

      else
      {
        id v41 =  -[TVSSHomeKitSceneRenderer _iconTintColorForIconIdentifier:]( v52,  "_iconTintColorForIconIdentifier:",  v43);
        char v40 = 1;
        objc_storeStrong(&v42, v41);
      }

      if ((v40 & 1) != 0) {

      }
      id v27 = location[0];
      id v29 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:", v42);
      id v55 = v29;
      v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL);
      id v4 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v27);
      id v5 = *(void **)&v50[1];
      *(void *)&v50[1] = v4;
    }

    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v47, 0LL);
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong(&v49, 0LL);
  }

  else
  {
    id v24 = location[0];
    id v25 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    unsigned __int8 v26 = objc_msgSend(v24, "isEqualToString:");

    if ((v26 & 1) != 0)
    {
      id v19 = location[0];
      id v23 = +[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor");
      id v22 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
      v54[0] = v22;
      id v21 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", 1LL);
      v54[1] = v21;
      v20 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL);
      id v6 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v19);
      id v7 = *(void **)&v50[1];
      *(void *)&v50[1] = v6;
    }

    else
    {
      id v16 = location[0];
      id v17 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
      unsigned __int8 v18 = objc_msgSend(v16, "isEqualToString:");

      if ((v18 & 1) != 0)
      {
        id v13 = location[0];
        if ((v50[0] & 1) != 0) {
          int v8 = 1;
        }
        else {
          int v8 = 2;
        }
        id v15 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", v8);
        id v53 = v15;
        id v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL);
        id v9 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v13);
        id v10 = *(void **)&v50[1];
        *(void *)&v50[1] = v9;
      }
    }
  }

  id v12 = *(id *)&v50[1];
  objc_storeStrong((id *)&v50[1], 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  id v17 = self;
  SEL v16 = a2;
  unint64_t v15 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v8 = location;
  id v9 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  unsigned __int8 v10 = objc_msgSend(v8, "isEqualToString:");

  if ((v10 & 1) != 0)
  {
    id v5 = v17;
    unint64_t v6 = v15;
    id v7 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
    v13.receiver = v5;
    v13.super_class = (Class)&OBJC_CLASS___TVSSHomeKitSceneRenderer;
    id v18 = -[TVSSHomeKitSceneRenderer stylingForState:identifier:](&v13, "stylingForState:identifier:", v6);
  }

  else
  {
    v11.receiver = v17;
    v11.super_class = (Class)&OBJC_CLASS___TVSSHomeKitSceneRenderer;
    id v18 = -[TVSSHomeKitSceneRenderer stylingForState:identifier:](&v11, "stylingForState:identifier:", v15, location);
  }

  int v12 = 1;
  objc_storeStrong(&location, 0LL);
  return v18;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v73 = 0LL;
  objc_storeStrong(&v73, a4);
  id v72 = [location[0] titleLabel];
  id v71 = [location[0] label1];
  id v70 = [location[0] imageView];
  id v69 = [location[0] verticalTextAlignmentView];
  +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
  double v68 = v4;
  +[TVSPConstants defaultSpacerWidth](&OBJC_CLASS___TVSPConstants, "defaultSpacerWidth");
  double v67 = v5;
  id v13 = [v72 bottomAnchor];
  id v12 = [v71 topAnchor];
  id v66 = objc_msgSend(v13, "constraintEqualToAnchor:");

  id v15 = [v72 bottomAnchor];
  id v14 = [v69 bottomAnchor];
  id v65 = objc_msgSend(v15, "constraintEqualToAnchor:");

  v58 = _NSConcreteStackBlock;
  int v59 = -1073741824;
  int v60 = 0;
  v61 = sub_10013ADD4;
  v62 = &unk_1001BBF50;
  id v63 = v66;
  id v64 = v65;
  -[TVSSHomeKitSceneRenderer setUpdateAutoLayoutForContentHandler:](v75, "setUpdateAutoLayoutForContentHandler:");
  objc_msgSend(v70, "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v6) = 1148846080;
  objc_msgSend(v70, "setContentCompressionResistancePriority:forAxis:", v6);
  LODWORD(v7) = 1148846080;
  [v70 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v70 setContentHuggingPriority:1 forAxis:v8];
  +[TVSPConstants defaultSmediumSymbolReservedSpace](&OBJC_CLASS___TVSPConstants, "defaultSmediumSymbolReservedSpace");
  double v57 = v9;
  id v54 = [v69 leadingAnchor];
  id v53 = [v73 leadingAnchor];
  id v52 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", v57);
  v76[0] = v52;
  id v51 = [v70 centerXAnchor];
  id v50 = [v73 leadingAnchor];
  id v49 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v57 / 2.0);
  v76[1] = v49;
  id v48 = [v70 centerYAnchor];
  id v47 = [v73 centerYAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:");
  v76[2] = v46;
  id v45 = [v70 topAnchor];
  id v44 = [v73 topAnchor];
  id v43 = objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:constant:", v68);
  v76[3] = v43;
  id v42 = [v70 bottomAnchor];
  id v41 = [v73 bottomAnchor];
  id v40 = objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:constant:", -v68);
  v76[4] = v40;
  id v39 = [v69 centerYAnchor];
  id v38 = [v73 centerYAnchor];
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v76[5] = v37;
  id v36 = [v69 trailingAnchor];
  id v35 = [v73 trailingAnchor];
  id v34 = objc_msgSend(v36, "constraintEqualToAnchor:constant:", -v67);
  v76[6] = v34;
  id v33 = [v72 topAnchor];
  id v32 = [v69 topAnchor];
  id v31 = objc_msgSend(v33, "constraintEqualToAnchor:");
  v76[7] = v31;
  id v30 = [v72 leadingAnchor];
  id v29 = [v69 leadingAnchor];
  id v28 = objc_msgSend(v30, "constraintEqualToAnchor:");
  v76[8] = v28;
  id v27 = [v72 trailingAnchor];
  id v26 = [v69 trailingAnchor];
  id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v76[9] = v25;
  v76[10] = v66;
  v76[11] = v65;
  id v24 = [v71 leadingAnchor];
  id v23 = [v69 leadingAnchor];
  id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
  v76[12] = v22;
  id v21 = [v71 trailingAnchor];
  id v20 = [v69 trailingAnchor];
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v76[13] = v19;
  id v18 = [v71 bottomAnchor];
  id v17 = [v69 bottomAnchor];
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v76[14] = v16;
  id v56 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 15LL);

  id v55 = v56;
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v65, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(&v71, 0LL);
  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(location, 0LL);
  return v55;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v7 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v8[0] = v7;
  id v6 = +[TVSPSubviews verticalTextAlignmentViewID](&OBJC_CLASS___TVSPSubviews, "verticalTextAlignmentViewID");
  v8[1] = v6;
  id v5 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v8[2] = v5;
  id v3 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v8[3] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 4LL);

  return v4;
}

- (void)showProgressViewWithFuture:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSHomeKitSceneRenderer progressView](v5, "progressView");
  -[TVSSProgressView startWithFuture:](v3, "startWithFuture:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (id)_iconTintColorForIconIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = sub_10013B104(&stru_1001BBF90);
  id v5 = [v6 objectForKeyedSubscript:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (TVSSProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end