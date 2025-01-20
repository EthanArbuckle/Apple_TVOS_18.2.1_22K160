@interface TVSSAudioRoutingHeaderRenderer
+ (id)rendererWithIdentifier:(id)a3 header:(id)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)overrideStylingForIdentifier:(id)a3;
- (id)subviewIdentifiersWantingAutolayout;
@end

@implementation TVSSAudioRoutingHeaderRenderer

+ (id)rendererWithIdentifier:(id)a3 header:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] format:2 content:v8 overrideStylings:&__NSArray0__struct];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v66 = 0LL;
  objc_storeStrong(&v66, a4);
  v65 = &__NSArray0__struct;
  id v64 = [location[0] titleLabel];
  id v63 = [location[0] label1];
  id v62 = [location[0] imageView];
  objc_msgSend(v64, "setContentHuggingPriority:forAxis:");
  LODWORD(v4) = 1132068864;
  [v64 setContentCompressionResistancePriority:0 forAxis:v4];
  objc_msgSend(v62, "setContentCompressionResistancePriority:forAxis:", 0);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v62, "setContentCompressionResistancePriority:forAxis:", v5);
  LODWORD(v6) = 1148846080;
  [v62 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v62 setContentHuggingPriority:1 forAxis:v7];
  +[TVSPConstants defaultImageTextHorizontalSpacing](&OBJC_CLASS___TVSPConstants, "defaultImageTextHorizontalSpacing");
  double v61 = -v8;
  unsigned __int8 v9 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
  double v10 = 23.0;
  if ((v9 & 1) == 0) {
    double v10 = 20.0;
  }
  double v60 = v10;
  id v18 = objc_msgSend(v64, "trailingAnchor", a4);
  id v17 = [v66 trailingAnchor];
  id v59 = objc_msgSend(v18, "constraintEqualToAnchor:");

  id v20 = [v64 trailingAnchor];
  id v19 = [v62 leadingAnchor];
  id v58 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", v61);

  id v22 = [v64 trailingAnchor];
  id v21 = [v63 leadingAnchor];
  id v57 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v61);

  id v24 = [v63 lastBaselineAnchor];
  id v23 = [v64 lastBaselineAnchor];
  id v56 = objc_msgSend(v24, "constraintEqualToAnchor:");

  id v25 = [v62 widthAnchor];
  id v55 = [v25 constraintEqualToConstant:0.0];

  id v50 = v59;
  id v51 = v58;
  id v52 = v57;
  id v53 = v56;
  v54[0] = v55;
  v54[1] = *(id *)&v60;
  -[TVSSAudioRoutingHeaderRenderer setUpdateAutoLayoutForContentHandler:](v68, "setUpdateAutoLayoutForContentHandler:");
  id v48 = [v64 leadingAnchor];
  id v47 = [v66 leadingAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:");
  v69[0] = v46;
  id v45 = [v64 topAnchor];
  id v44 = [v66 topAnchor];
  id v43 = objc_msgSend(v45, "constraintEqualToAnchor:");
  v69[1] = v43;
  id v42 = [v64 bottomAnchor];
  id v41 = [v66 bottomAnchor];
  id v40 = objc_msgSend(v42, "constraintEqualToAnchor:");
  v69[2] = v40;
  v69[3] = v59;
  v69[4] = v58;
  v69[5] = v57;
  id v39 = [v62 trailingAnchor];
  id v38 = [v66 trailingAnchor];
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v69[6] = v37;
  id v36 = [v62 centerYAnchor];
  id v35 = [v66 centerYAnchor];
  unsigned __int8 v11 = +[TVSPConstants isScaledUI](&OBJC_CLASS___TVSPConstants, "isScaledUI");
  double v12 = 7.0;
  if ((v11 & 1) == 0) {
    double v12 = 6.0;
  }
  id v34 = [v36 constraintEqualToAnchor:v35 constant:v12];
  v69[7] = v34;
  id v33 = [v62 heightAnchor];
  id v32 = [v33 constraintEqualToConstant:v60];
  v69[8] = v32;
  v69[9] = v55;
  id v31 = [v63 trailingAnchor];
  id v30 = [v66 trailingAnchor];
  id v29 = objc_msgSend(v31, "constraintEqualToAnchor:");
  v69[10] = v29;
  v69[11] = v56;
  id v28 = [v63 heightAnchor];
  id v27 = [v66 heightAnchor];
  id v26 = objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:");
  v69[12] = v26;
  v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 13LL);
  v14 = v65;
  v65 = v13;

  v49 = v65;
  objc_storeStrong(v54, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(location, 0LL);
  return v49;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v6 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v7[0] = v6;
  id v5 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v7[1] = v5;
  id v3 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v7[2] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL);

  return v4;
}

- (id)overrideStylingForIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v30 = 0LL;
  id v24 = location[0];
  id v25 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  char v28 = 0;
  unsigned __int8 v26 = 1;
  if ((objc_msgSend(v24, "isEqualToString:") & 1) == 0)
  {
    id v23 = location[0];
    id v29 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    char v28 = 1;
    unsigned __int8 v26 = objc_msgSend(v23, "isEqualToString:");
  }

  if ((v28 & 1) != 0) {

  }
  if ((v26 & 1) != 0)
  {
    id v19 = +[TVSPLabelAttribute marqueeEnabled:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeEnabled:", 1LL);
    v33[0] = v19;
    id v18 = +[TVSPLabelAttribute marqueeRunning:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeRunning:", 1LL);
    v33[1] = v18;
    id v17 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", 1LL);
    v33[2] = v17;
    v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL);
    id v27 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:");

    id v20 = location[0];
    id v21 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    unsigned __int8 v22 = objc_msgSend(v20, "isEqualToString:");

    if ((v22 & 1) != 0)
    {
      id v15 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 6LL);
      -[NSMutableArray addObject:](v27, "addObject:");
    }

    id v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  location[0],  v27);
    double v4 = v30;
    id v30 = v3;

    objc_storeStrong((id *)&v27, 0LL);
  }

  else
  {
    id v12 = location[0];
    id v13 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
    unsigned __int8 v14 = objc_msgSend(v12, "isEqualToString:");

    if ((v14 & 1) != 0)
    {
      id v9 = location[0];
      id v11 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:");
      id v32 = v11;
      double v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL);
      id v5 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v9);
      id v6 = v30;
      id v30 = v5;
    }
  }

  double v8 = v30;
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

@end