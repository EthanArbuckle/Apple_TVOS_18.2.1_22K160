@interface TVSSCriticalInfoRenderer
- (TVSSCriticalInfoRenderer)initWithIdentifier:(id)a3 criticalInfo:(id)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
@end

@implementation TVSSCriticalInfoRenderer

- (TVSSCriticalInfoRenderer)initWithIdentifier:(id)a3 criticalInfo:(id)a4
{
  v49 = self;
  SEL v48 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v46 = 0LL;
  objc_storeStrong(&v46, a4);
  id v45 = v46;
  if (!v45)
  {
    v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSCriticalInfo);
    v31 = NSStringFromClass(v4);
    v44 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was unexpectedly nil. Expected %@.",  @"criticalInfo",  v31);

    id v43 = &_os_log_default;
    char v42 = 16;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v43;
      os_log_type_t type = v42;
      v30 = NSStringFromSelector(v48);
      v26 = v30;
      v41 = v26;
      v5 = (objc_class *)objc_opt_class(v49);
      v29 = NSStringFromClass(v5);
      v40 = v29;
      sub_10000583C( (uint64_t)v53,  (uint64_t)v26,  (uint64_t)v40,  (uint64_t)v49,  (uint64_t)@"TVSSCriticalInfoRenderer.m",  20,  (uint64_t)v44);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v53,  0x3Au);

      objc_storeStrong((id *)&v40, 0LL);
      objc_storeStrong((id *)&v41, 0LL);
    }

    objc_storeStrong(&v43, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v44, "UTF8String"));
    __break(0);
    JUMPOUT(0x1001014B0LL);
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSSCriticalInfo);
  if (((objc_opt_isKindOfClass(v45, v6) ^ 1) & 1) != 0)
  {
    v25 = (objc_class *)[v45 classForCoder];
    if (v25)
    {
      v7 = NSStringFromClass(v25);
    }

    else
    {
      aClass = (objc_class *)objc_opt_class(v45);
      v7 = NSStringFromClass(aClass);
    }

    v23 = v7;
    v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSSCriticalInfo);
    v22 = NSStringFromClass(v8);
    id v39 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Value for '%@' was of unexpected class %@. Expected %@.",  @"criticalInfo",  v23,  v22);

    os_log_t oslog = &_os_log_default;
    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v18 = oslog;
      os_log_type_t v19 = v37;
      v21 = NSStringFromSelector(v48);
      v17 = v21;
      v36 = v17;
      v9 = (objc_class *)objc_opt_class(v49);
      v20 = NSStringFromClass(v9);
      v35 = v20;
      sub_10000583C( (uint64_t)v52,  (uint64_t)v17,  (uint64_t)v35,  (uint64_t)v49,  (uint64_t)@"TVSSCriticalInfoRenderer.m",  20,  (uint64_t)v39);
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  v19,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v52,  0x3Au);

      objc_storeStrong((id *)&v35, 0LL);
      objc_storeStrong((id *)&v36, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x100101714LL);
  }

  objc_storeStrong(&v45, 0LL);
  id v15 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v14 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 5LL);
  id v50 = v14;
  v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50);
  v12 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v15);
  v51 = v12;
  v34 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL);

  v10 = v49;
  v49 = 0LL;
  v33.receiver = v10;
  v33.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoRenderer;
  v49 = -[TVSSCriticalInfoRenderer initWithIdentifier:format:content:overrideStylings:]( &v33,  "initWithIdentifier:format:content:overrideStylings:",  location,  15LL,  v46,  v34);
  v16 = v49;
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v49, 0LL);
  return v16;
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  v40 = self;
  SEL v39 = a2;
  unint64_t v38 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v36 = -[TVSSCriticalInfoRenderer content](v40, "content");
  id v17 = location;
  id v18 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v19 = objc_msgSend(v17, "isEqualToString:");

  char v35 = v19 & 1;
  id v20 = location;
  id v21 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  unsigned __int8 v22 = objc_msgSend(v20, "isEqualToString:");

  char v34 = v22 & 1;
  id v23 = location;
  id v24 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  unsigned __int8 v25 = objc_msgSend(v23, "isEqualToString:");

  char v33 = v25 & 1;
  id v26 = location;
  id v27 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
  unsigned __int8 v28 = objc_msgSend(v26, "isEqualToString:");

  char v32 = v28 & 1;
  id v31 = 0LL;
  if ((v19 & 1) != 0)
  {
    id v4 = [v36 imageTintColor];
    id v5 = v31;
    id v31 = v4;
  }

  else if ((v34 & 1) != 0)
  {
    id v6 = [v36 image1TintColor];
    id v7 = v31;
    id v31 = v6;
  }

  else if ((v33 & 1) != 0)
  {
    id v8 = [v36 image2TintColor];
    id v9 = v31;
    id v31 = v8;
  }

  else if ((v32 & 1) != 0)
  {
    id v10 = [v36 image3TintColor];
    id v11 = v31;
    id v31 = v10;
  }

  if ((v35 & 1) != 0 || (v34 & 1) != 0 || (v33 & 1) != 0 || (v32 & 1) != 0)
  {
    id v13 = location;
    id v16 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:", v31);
    v42[0] = v16;
    id v15 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:", 4LL);
    v42[1] = v15;
    id v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL);
    v41 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v13);

    int v30 = 1;
  }

  else
  {
    v29.receiver = v40;
    v29.super_class = (Class)&OBJC_CLASS___TVSSCriticalInfoRenderer;
    v41 = (TVSPStyling *) -[TVSSCriticalInfoRenderer stylingForState:identifier:]( &v29,  "stylingForState:identifier:",  v38,  location);
    int v30 = 1;
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&location, 0LL);
  return v41;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v8 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v9[0] = v8;
  id v7 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  v9[1] = v7;
  id v6 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  v9[2] = v6;
  id v5 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
  v9[3] = v5;
  id v3 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v9[4] = v3;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 5LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v87 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v85 = 0LL;
  objc_storeStrong(&v85, a4);
  id v84 = [location[0] imageView];
  id v83 = [location[0] imageView1];
  id v82 = [location[0] imageView2];
  id v81 = [location[0] imageView3];
  id v80 = [location[0] titleLabel];
  id v64 = -[TVSSCriticalInfoRenderer content](v87, "content");
  id v4 = [v64 contentImage];
  BOOL v65 = v4 != 0LL;

  BOOL v79 = v65;
  id v66 = -[TVSSCriticalInfoRenderer content](v87, "content");
  id v5 = [v66 contentImage1];
  BOOL v67 = v5 != 0LL;

  BOOL v78 = v67;
  id v68 = -[TVSSCriticalInfoRenderer content](v87, "content");
  id v6 = [v68 contentImage2];
  BOOL v69 = v6 != 0LL;

  BOOL v77 = v69;
  id v70 = -[TVSSCriticalInfoRenderer content](v87, "content");
  id v7 = [v70 contentImage3];
  BOOL v71 = v7 != 0LL;

  BOOL v76 = v71;
  double v8 = 5.0;
  if (v65) {
    double v9 = 5.0;
  }
  else {
    double v9 = 0.0;
  }
  double v75 = v9;
  if (v78) {
    double v10 = 5.0;
  }
  else {
    double v10 = 0.0;
  }
  double v74 = v10;
  if (!v77) {
    double v8 = 0.0;
  }
  double v73 = v8;
  id v72 = 0LL;
  if (v76)
  {
    id v62 = [v80 leadingAnchor];
    id v61 = [v81 trailingAnchor];
    id v11 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", 9.0);
    id v12 = v72;
    id v72 = v11;
  }

  else if (v77)
  {
    id v60 = [v80 leadingAnchor];
    id v59 = [v82 trailingAnchor];
    id v13 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", 9.0);
    id v14 = v72;
    id v72 = v13;
  }

  else if (v78)
  {
    id v58 = [v80 leadingAnchor];
    id v57 = [v83 trailingAnchor];
    id v15 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", 9.0);
    id v16 = v72;
    id v72 = v15;
  }

  else if (v79)
  {
    id v56 = [v80 leadingAnchor];
    id v55 = [v84 trailingAnchor];
    id v17 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 9.0);
    id v18 = v72;
    id v72 = v17;
  }

  else
  {
    id v54 = [v80 leadingAnchor];
    id v53 = [v85 leadingAnchor];
    id v19 = objc_msgSend(v54, "constraintEqualToAnchor:");
    id v20 = v72;
    id v72 = v19;
  }

  id v52 = [v84 leadingAnchor];
  id v51 = [v85 leadingAnchor];
  id v50 = objc_msgSend(v52, "constraintEqualToAnchor:");
  v88[0] = v50;
  id v49 = [v83 leadingAnchor];
  id v48 = [v84 trailingAnchor];
  id v47 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v75);
  v88[1] = v47;
  id v46 = [v82 leadingAnchor];
  id v45 = [v83 trailingAnchor];
  id v44 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", v74);
  v88[2] = v44;
  id v43 = [v81 leadingAnchor];
  id v42 = [v82 trailingAnchor];
  id v41 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v73);
  v88[3] = v41;
  v88[4] = v72;
  id v40 = [v84 centerYAnchor];
  id v39 = [v85 centerYAnchor];
  id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
  v88[5] = v38;
  id v37 = [v83 centerYAnchor];
  id v36 = [v85 centerYAnchor];
  id v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v88[6] = v35;
  id v34 = [v82 centerYAnchor];
  id v33 = [v85 centerYAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v88[7] = v32;
  id v31 = [v81 centerYAnchor];
  id v30 = [v85 centerYAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v88[8] = v29;
  id v28 = [v80 centerYAnchor];
  id v27 = [v85 centerYAnchor];
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v88[9] = v26;
  id v25 = [v80 trailingAnchor];
  id v24 = [v85 trailingAnchor];
  id v22 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v88[10] = v22;
  id v23 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v88, 11LL);

  objc_storeStrong(&v72, 0LL);
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(&v81, 0LL);
  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v83, 0LL);
  objc_storeStrong(&v84, 0LL);
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(location, 0LL);
  return v23;
}

@end