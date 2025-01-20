@interface TVSBInformationalBulletinViewController
+ (BOOL)_isVolumeBulletin:(id)a3;
- (TVImageProxy)imageProxy;
- (id)_bulletinImageForItem:(id)a3;
- (id)_informationalBulletinView;
- (id)_volumeBulletinView;
- (id)bulletinViewForBulletin:(id)a3;
- (void)_configureBulletinView:(id)a3 forBulletin:(id)a4;
- (void)_configureVolumeBulletinView:(id)a3 forBulletin:(id)a4;
- (void)didEndAnimatingOutBulletinView:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)updateBulletinView:(id)a3 forBulletin:(id)a4;
@end

@implementation TVSBInformationalBulletinViewController

- (id)bulletinViewForBulletin:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v25);
  if ([v3 _isVolumeBulletin:location[0]])
  {
    v15 = objc_alloc(&OBJC_CLASS___TVSBVolumeBulletinView);
    id v16 = -[TVSBInformationalBulletinViewController view](v25, "view");
    [v16 bounds];
    double v19 = v4;
    double v20 = v5;
    double v21 = v6;
    double v22 = v7;
    v23 = -[TVSBVolumeBulletinView initWithFrame:style:](v15, "initWithFrame:style:", 0LL, v4, v5, v6, v7);

    -[TVSBInformationalBulletinViewController _configureVolumeBulletinView:forBulletin:]( v25,  "_configureVolumeBulletinView:forBulletin:",  v23,  location[0]);
    v26 = v23;
    int v18 = 1;
    objc_storeStrong((id *)&v23, 0LL);
  }

  else
  {
    v13 = objc_alloc(&OBJC_CLASS___TVSBInformationalBulletinView);
    id v14 = -[TVSBInformationalBulletinViewController view](v25, "view");
    [v14 bounds];
    id v17 = -[TVSBInformationalBulletinView initWithFrame:](v13, "initWithFrame:", v8, v9, v10, v11);

    -[TVSBInformationalBulletinViewController _configureBulletinView:forBulletin:]( v25,  "_configureBulletinView:forBulletin:",  v17,  location[0]);
    v26 = (TVSBVolumeBulletinView *)v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v26;
}

- (void)updateBulletinView:(id)a3 forBulletin:(id)a4
{
  double v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = -[TVSBInformationalBulletinViewController _volumeBulletinView](v8, "_volumeBulletinView");

  if (v5) {
    -[TVSBInformationalBulletinViewController _configureVolumeBulletinView:forBulletin:]( v8,  "_configureVolumeBulletinView:forBulletin:",  location[0],  v6);
  }
  else {
    -[TVSBInformationalBulletinViewController _configureBulletinView:forBulletin:]( v8,  "_configureBulletinView:forBulletin:",  location[0],  v6);
  }
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didEndAnimatingOutBulletinView:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVImageProxy cancel](v4->_imageProxy, "cancel");
  objc_storeStrong((id *)&v4->_imageProxy, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (BOOL)_isVolumeBulletin:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] message];
  id v6 = objc_msgSend(v4, "tvs_numberForKey:", PBSSystemBulletinNumValueLevelsKey);

  BOOL v5 = v6 != 0LL;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)_informationalBulletinView
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSBBulletinViewController bulletinView](self, "bulletinView");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSBInformationalBulletinView);
  if ((objc_opt_isKindOfClass(location[0], v2) & 1) != 0) {
    id v3 = location[0];
  }
  else {
    id v3 = 0LL;
  }
  id v5 = v3;
  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)_volumeBulletinView
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = -[TVSBBulletinViewController bulletinView](self, "bulletinView");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSBVolumeBulletinView);
  if ((objc_opt_isKindOfClass(location[0], v2) & 1) != 0) {
    id v3 = location[0];
  }
  else {
    id v3 = 0LL;
  }
  id v5 = v3;
  objc_storeStrong(location, 0LL);
  return v5;
}

- (void)_configureBulletinView:(id)a3 forBulletin:(id)a4
{
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v54 = 0LL;
  objc_storeStrong(&v54, a4);
  id v53 = [v54 message];
  id v52 = -[TVSBInformationalBulletinViewController _bulletinImageForItem:](v56, "_bulletinImageForItem:", v54);
  id v33 = objc_msgSend(v53, "tvs_stringForKey:", PBSSystemBulletinImageURLKey);
  id v51 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:");

  id v50 = objc_msgSend(v53, "tvs_stringForKey:", PBSSystemBulletinTitleKey);
  id v49 = objc_msgSend(v53, "tvs_stringForKey:", PBSSystemBulletinMessageKey);
  id v48 = objc_msgSend(v53, "tvs_stringForKey:", @"PBSSystemBulletinFooterMessageKey");
  char v45 = 0;
  char v43 = 0;
  if ([v48 length])
  {
    v31 = (void *)objc_opt_class(v56);
    v46 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
    char v45 = 1;
    -[UIFont pointSize](v46, "pointSize");
    id v44 = objc_msgSend(v31, "convertTextToAttributedStringIfNeeded:imagePointSize:", v48);
    char v43 = 1;
    id v4 = v44;
  }

  else
  {
    id v4 = 0LL;
  }

  id v47 = v4;
  if ((v43 & 1) != 0) {

  }
  if ((v45 & 1) != 0) {
  char v40 = 0;
  }
  char v38 = 0;
  if ([v49 length])
  {
    v30 = (void *)objc_opt_class(v56);
    v41 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
    char v40 = 1;
    -[UIFont pointSize](v41, "pointSize");
    id v39 = objc_msgSend(v30, "convertTextToAttributedStringIfNeeded:imagePointSize:", v49);
    char v38 = 1;
    id v5 = v39;
  }

  else
  {
    id v5 = 0LL;
  }

  id v42 = v5;
  if ((v38 & 1) != 0) {

  }
  if ((v40 & 1) != 0) {
  if ([v42 length])
  }
  {
    objc_storeStrong(&v49, 0LL);
    objc_storeStrong(&v47, v42);
  }

  v37 = 0LL;
  if (objc_msgSend(v53, "tvs_BOOLForKey:defaultValue:", PBSWelcomeBackBulletinKey, 0))
  {
    id v27 = objc_alloc(&OBJC_CLASS___TVSUIProfilePictureView);
    sub_10001751C();
    v35[1] = v6;
    v35[2] = v7;
    v35[3] = v8;
    v35[4] = v9;
    id v36 = objc_msgSend(v27, "initWithFrame:", *(double *)&v6, *(double *)&v7, *(double *)&v8, *(double *)&v9);
    v35[0] = [v53 objectForKey:PBSWelcomeBackBulletinPersonNameComponentsKey];
    id v28 = (id)objc_opt_self(&OBJC_CLASS___NSPersonNameComponents);
    char isKindOfClass = objc_opt_isKindOfClass(v35[0], v28);

    if ((isKindOfClass & 1) != 0) {
      [v36 setPersonNameComponents:v35[0]];
    }
    id v34 = v52;
    if (!v34 && v51)
    {
      v25 = objc_alloc(&OBJC_CLASS___UIImage);
      id v26 = [v51 path];
      double v10 = -[UIImage initWithContentsOfFile:](v25, "initWithContentsOfFile:");
      id v11 = v52;
      id v52 = v10;
    }

    [v36 setProfilePictureImage:v52];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    if ([v47 length]) {
      v12 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:atrributedFooterText:customView:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:atrributedFooterText:customView:",  v50,  v49,  v47,  v36);
    }
    else {
      v12 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:footerText:customView:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:footerText:customView:",  v50,  v49,  v48,  v36);
    }
    v13 = v37;
    v37 = v12;

    objc_storeStrong(&v34, 0LL);
    objc_storeStrong(v35, 0LL);
    objc_storeStrong(&v36, 0LL);
  }

  else if (v52 && v47)
  {
    id v14 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:atrributedFooterText:image:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:atrributedFooterText:image:",  v50,  v49,  v47,  v52);
    v15 = v37;
    v37 = v14;
  }

  else if (v52)
  {
    id v16 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:footerText:image:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:footerText:image:",  v50,  v49,  v48,  v52);
    id v17 = v37;
    v37 = v16;
  }

  else if (v51 && v47)
  {
    int v18 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:atrributedFooterText:imageURL:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:atrributedFooterText:imageURL:",  v50,  v49,  v47,  v51);
    double v19 = v37;
    v37 = v18;
  }

  else if (v51)
  {
    double v20 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:footerText:imageURL:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:footerText:imageURL:",  v50,  v49,  v48,  v51);
    double v21 = v37;
    v37 = v20;
  }

  else
  {
    if (v47) {
      double v22 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:atrributedFooterText:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:atrributedFooterText:",  v50,  v49,  v47);
    }
    else {
      double v22 =  +[TVSBInformationalBulletinItem itemWithTitleText:subtitleText:footerText:]( &OBJC_CLASS___TVSBInformationalBulletinItem,  "itemWithTitleText:subtitleText:footerText:",  v50,  v49,  v48);
    }
    v23 = v37;
    v37 = v22;
  }

  objc_msgSend(location[0], "setBulletinItem:", v37, &v37);
  objc_storeStrong(v24, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)_configureVolumeBulletinView:(id)a3 forBulletin:(id)a4
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v20 = [v21 message];
  id v19 = objc_msgSend(v20, "tvs_stringForKey:", PBSSystemBulletinTitleKey);
  id v9 = [location[0] titleLabel];
  [v9 setText:v19];

  id v18 = objc_msgSend(v20, "tvs_stringForKey:", PBSSystemBulletinMessageKey);
  id v11 = [location[0] subtitleLabel];
  id v10 = [v11 font];
  [v10 pointSize];
  v12 = v4;

  v17[1] = v12;
  v17[0] =  [(id)objc_opt_class(v23) convertTextToAttributedStringIfNeeded:v18 imagePointSize:*(double *)&v12];
  if (v17[0])
  {
    id v7 = [location[0] subtitleLabel];
    [v7 setAttributedText:v17[0]];
  }

  else
  {
    id v6 = [location[0] subtitleLabel];
    [v6 setText:v18];
  }

  id v16 = -[TVSBInformationalBulletinViewController _bulletinImageForItem:](v23, "_bulletinImageForItem:", v21);
  id v5 = [location[0] imageView];
  [v5 setImage:v16];

  id v15 = objc_msgSend(v20, "tvs_numberForKey:", PBSSystemBulletinNumValueLevelsKey);
  if (v15)
  {
    id v14 = -[TVSBSLevelBarView initWithNumLevels:]( [TVSBSLevelBarView alloc],  "initWithNumLevels:",  [v15 unsignedIntegerValue]);
    id v13 = objc_msgSend(v20, "tvs_numberForKey:", PBSSystemBulletinValueLevelKey);
    -[TVSBSLevelBarView setLevel:](v14, "setLevel:", [v13 unsignedIntegerValue]);
    [location[0] setAccessoryView:v14];
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_bulletinImageForItem:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v45 = (dispatch_once_t *)&unk_100036850;
  id v44 = 0LL;
  objc_storeStrong(&v44, &stru_10002CD98);
  if (*v45 != -1) {
    dispatch_once(v45, v44);
  }
  objc_storeStrong(&v44, 0LL);
  id v42 = [location[0] message];
  id v41 = objc_msgSend(v42, "tvs_dataForKey:", PBSSystemBulletinImageDataKey);
  id v40 = objc_msgSend(v42, "tvs_stringForKey:", PBSSystemBulletinImageIDKey);
  id v39 = objc_msgSend(v42, "tvs_stringForKey:", PBSSystemBulletinSymbolNameKey);
  id v30 = objc_msgSend(v42, "tvs_stringForKey:", PBSSystemBulletinSymbolConfigurationKey);
  if (v30) {
    id v3 = v30;
  }
  else {
    id v3 = PBSSystemBulletinSymbolConfigurationDefault;
  }
  id v38 = v3;

  v37 = 0LL;
  if (v41)
  {
    id v4 = +[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v41);
    id v5 = v37;
    v37 = v4;
  }

  else if (v39)
  {
    id v36 = [(id)qword_100036848 objectForKeyedSubscript:v38];
    id v6 = (UIImage *) +[UIImage _systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:withConfiguration:",  v39,  v36);
    id v7 = v37;
    v37 = v6;

    objc_storeStrong(&v36, 0LL);
  }

  else if (v40)
  {
    id v35 = [(id)qword_100036840 objectForKeyedSubscript:v40];
    id v28 = [v35 imageName];
    char v33 = 0;
    BOOL v29 = 0;
    if (v28)
    {
      id v34 = [v35 configuration];
      char v33 = 1;
      BOOL v29 = v34 != 0LL;
    }

    if ((v33 & 1) != 0) {

    }
    if (v29)
    {
      id v27 = [v35 imageName];
      id v26 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:");
      id v25 = [v35 configuration];
      double v8 = -[UIImage imageWithConfiguration:](v26, "imageWithConfiguration:");
      id v9 = v37;
      v37 = v8;
    }

    else
    {
      id v10 = [v35 imageName];
      BOOL v24 = v10 == 0LL;

      if (v24)
      {
        id v21 = [v35 symbolName];
        char v31 = 0;
        BOOL v22 = 0;
        if (v21)
        {
          id v32 = [v35 configuration];
          char v31 = 1;
          BOOL v22 = v32 != 0LL;
        }

        if ((v31 & 1) != 0) {

        }
        if (v22)
        {
          id v20 = [v35 symbolName];
          id v19 = [v35 configuration];
          id v13 = (UIImage *) +[UIImage _systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "_systemImageNamed:withConfiguration:",  v20);
          id v14 = v37;
          v37 = v13;
        }
      }

      else
      {
        id v23 = [v35 imageName];
        id v11 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:");
        v12 = v37;
        v37 = v11;
      }
    }

    if ([v40 isEqualToString:PBSSystemBulletinImageIDVolume])
    {
      id v15 = -[UIImage imageFlippedForRightToLeftLayoutDirection](v37, "imageFlippedForRightToLeftLayoutDirection");
      id v16 = v37;
      v37 = v15;
    }

    objc_storeStrong(&v35, 0LL);
  }

  id v18 = v37;
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end