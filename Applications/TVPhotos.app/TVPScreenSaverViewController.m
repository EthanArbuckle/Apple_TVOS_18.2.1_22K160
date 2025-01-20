@interface TVPScreenSaverViewController
- (id)preferredFocusEnvironments;
- (void)highlightedAlbumChanged;
- (void)viewDidLoad;
@end

@implementation TVPScreenSaverViewController

- (id)preferredFocusEnvironments
{
  if (self->_pickerView)
  {
    pickerView = self->_pickerView;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &pickerView,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVPScreenSaverViewController;
  -[TVPScreenSaverViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___TVPScreenSaverPickerView);
  pickerView = self->_pickerView;
  self->_pickerView = v3;

  -[TVPScreenSaverPickerView setDelegate:](self->_pickerView, "setDelegate:", self);
  -[TVPScreenSaverPickerView setTranslatesAutoresizingMaskIntoConstraints:]( self->_pickerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
  [v5 addSubview:self->_pickerView];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView rightAnchor](self->_pickerView, "rightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rightAnchor]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 constraintEqualToAnchor:v8]);
  [v9 setActive:1];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView topAnchor](self->_pickerView, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 topAnchor]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12]);
  [v13 setActive:1];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView bottomAnchor](self->_pickerView, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bottomAnchor]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
  [v17 setActive:1];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v18 bounds];
  double v20 = v19 / 3.0;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView widthAnchor](self->_pickerView, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToConstant:v20]);
  [v22 setActive:1];
}

- (void)highlightedAlbumChanged
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverPickerView highlightedAlbum](self->_pickerView, "highlightedAlbum"));
  if (v3)
  {
    previewSlideshow = self->_previewSlideshow;
    v34 = v3;
    if (previewSlideshow)
    {
      -[TVPPhotoCollectionPreviewViewController setPhotoCollection:](previewSlideshow, "setPhotoCollection:", v3);
    }

    else
    {
      v5 = objc_alloc_init(&OBJC_CLASS___TVPPhotoCollectionPreviewViewController);
      v6 = self->_previewSlideshow;
      self->_previewSlideshow = v5;

      -[TVPPhotoCollectionPreviewViewController setPhotoCollection:]( self->_previewSlideshow,  "setPhotoCollection:",  v34);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      [v7 bounds];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;

      -[TVPScreenSaverPickerView frame](self->_pickerView, "frame");
      -[TVPPhotoCollectionPreviewViewController setImageFrame:]( self->_previewSlideshow,  "setImageFrame:",  v9,  v9,  v11 - v14,  v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCollectionPreviewViewController view](self->_previewSlideshow, "view"));
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v15 setContentMode:0];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      [v16 addSubview:v15];

      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 leftAnchor]);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v18 leftAnchor]);
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v19]);
      [v20 setActive:1];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v15 rightAnchor]);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v22 rightAnchor]);
      v24 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);
      [v24 setActive:1];

      v25 = (void *)objc_claimAutoreleasedReturnValue([v15 topAnchor]);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 topAnchor]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v27]);
      [v28 setActive:1];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v15 bottomAnchor]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 bottomAnchor]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v29 constraintEqualToAnchor:v31]);
      [v32 setActive:1];

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPScreenSaverViewController view](self, "view"));
      [v33 sendSubviewToBack:v15];
    }

    v3 = v34;
  }
}

- (void).cxx_destruct
{
}

@end