@interface GCTVSettingsPreviewViewController
+ (id)controllerTypeToBaseImageLookup;
- (GCTVSettingsPreviewViewController)initWithControllerType:(int64_t)a3;
- (GCTVSettingsPreviewViewController)initWithControllerType:(int64_t)a3 buttonNamed:(id)a4;
- (NSString)buttonName;
- (id)_baseFolderForControllerType:(int64_t)a3;
- (id)_baseImageNameForControllerType:(int64_t)a3 buttonName:(id)a4;
- (void)_updatePreviewImage;
- (void)setButtonName:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCTVSettingsPreviewViewController

+ (id)controllerTypeToBaseImageLookup
{
  if (qword_568D0 != -1) {
    dispatch_once(&qword_568D0, &stru_4CE20);
  }
  return (id)qword_568D8;
}

- (GCTVSettingsPreviewViewController)initWithControllerType:(int64_t)a3
{
  return -[GCTVSettingsPreviewViewController initWithControllerType:buttonNamed:]( self,  "initWithControllerType:buttonNamed:",  a3,  0LL);
}

- (GCTVSettingsPreviewViewController)initWithControllerType:(int64_t)a3 buttonNamed:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = &OBJC_CLASS___GCTVSettingsPreviewViewController;
  v8 = -[GCTVSettingsPreviewViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_controllerType = a3;
    objc_storeStrong((id *)&v8->_buttonName, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = &OBJC_CLASS___GCTVSettingsPreviewViewController;
  -[GCTVSettingsPreviewViewController viewDidLoad](&v3, "viewDidLoad");
  -[GCTVSettingsPreviewViewController _updatePreviewImage](self, "_updatePreviewImage");
}

- (void)setButtonName:(id)a3
{
  v5 = (NSString *)a3;
  buttonName = self->_buttonName;
  if (buttonName != v5)
  {
    v8 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](buttonName, "isEqualToString:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_buttonName, a3);
      -[GCTVSettingsPreviewViewController _updatePreviewImage](self, "_updatePreviewImage");
      v5 = v8;
    }
  }
}

- (id)_baseFolderForControllerType:(int64_t)a3
{
  else {
    return *(&off_4CE68 + a3 - 1);
  }
}

- (id)_baseImageNameForControllerType:(int64_t)a3 buttonName:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[GCTVSettingsPreviewViewController controllerTypeToBaseImageLookup]( &OBJC_CLASS___GCTVSettingsPreviewViewController,  "controllerTypeToBaseImageLookup"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v5]);
      v10 = v9;
      if (v9) {
        objc_super v11 = v9;
      }
      else {
        objc_super v11 = @"Base";
      }
    }

    else
    {
      objc_super v11 = @"Base";
    }
  }

  else
  {
    objc_super v11 = @"Base";
  }

  return v11;
}

- (void)_updatePreviewImage
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsPreviewViewController _baseFolderForControllerType:]( self,  "_baseFolderForControllerType:",  self->_controllerType));
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___GCTVSettingsController_Legacy));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = objc_alloc(&OBJC_CLASS___UIImageConfiguration);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[UITraitCollection traitCollectionWithUserInterfaceIdiom:]( &OBJC_CLASS___UITraitCollection,  "traitCollectionWithUserInterfaceIdiom:",  2LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 configurationWithTraitCollection:v7]);

    buttonName = self->_buttonName;
    if (buttonName)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v3,  buttonName));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:withConfiguration:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:withConfiguration:",  v10,  v5,  v8));

      v12 = self->_buttonName;
    }

    else
    {
      v12 = 0LL;
      objc_super v11 = 0LL;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[GCTVSettingsPreviewViewController _baseImageNameForControllerType:buttonName:]( self,  "_baseImageNameForControllerType:buttonName:",  self->_controllerType,  v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v3, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:withConfiguration:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:withConfiguration:",  v14,  v5,  v8));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsPreviewViewController contentView](self, "contentView"));

    if (v16)
    {
      rootView = self->_rootView;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_DAF0;
      v34[3] = &unk_4CE48;
      v34[4] = self;
      v35 = v15;
      id v36 = v11;
      +[UIView transitionWithView:duration:options:animations:completion:]( &OBJC_CLASS___UIView,  "transitionWithView:duration:options:animations:completion:",  rootView,  5242880LL,  v34,  0LL,  0.15);

      v18 = v35;
    }

    else
    {
      v19 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v15);
      v20 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v11);
      -[UIImageView frame](v19, "frame");
      -[UIImageView setFrame:](v20, "setFrame:");
      v21 = objc_alloc(&OBJC_CLASS___UIView);
      -[UIImageView frame](v19, "frame");
      v22 = -[UIView initWithFrame:](v21, "initWithFrame:");
      v33 = v5;
      v23 = self->_rootView;
      self->_rootView = v22;
      v31 = v22;

      v32 = v15;
      v24 = v14;
      v25 = v11;
      baseImageView = self->_baseImageView;
      self->_baseImageView = v19;
      v30 = v19;

      v27 = v8;
      inputImageView = self->_inputImageView;
      self->_inputImageView = v20;
      v29 = v20;

      v8 = v27;
      id v5 = v33;
      -[UIView addSubview:](self->_rootView, "addSubview:", self->_baseImageView);
      objc_super v11 = v25;
      v14 = v24;
      v15 = v32;
      -[UIView addSubview:](self->_rootView, "addSubview:", self->_inputImageView);
      -[GCTVSettingsPreviewViewController setContentView:](self, "setContentView:", self->_rootView);

      v18 = v31;
    }
  }

  else
  {
    -[GCTVSettingsPreviewViewController setContentView:animated:](self, "setContentView:animated:", 0LL, 0LL);
  }
}

- (NSString)buttonName
{
  return self->_buttonName;
}

- (void).cxx_destruct
{
}

@end