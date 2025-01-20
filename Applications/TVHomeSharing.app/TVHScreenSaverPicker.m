@interface TVHScreenSaverPicker
+ (id)_screenSaverStyleForMediaCategoryType:(unint64_t)a3;
- (TVHScreenSaverPickerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setScreenSaverWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollection:(id)a5;
@end

@implementation TVHScreenSaverPicker

- (void)setScreenSaverWithMediaLibrary:(id)a3 mediaCategoryType:(unint64_t)a4 mediaEntityCollection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_displayTitle"));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHMediaCategoryToDisplayNameValueTransformer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v12 transformedValue:v13]);
  }

  v14 = objc_alloc_init(&OBJC_CLASS___TVHScreenSaverDescriptor);
  -[TVHScreenSaverDescriptor setName:](v14, "setName:", v11);
  -[TVHScreenSaverDescriptor setMediaCategoryType:](v14, "setMediaCategoryType:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  -[TVHScreenSaverDescriptor setMediaServerName:](v14, "setMediaServerName:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[TVHScreenSaverDescriptor setMediaServerIdentifier:](v14, "setMediaServerIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  -[TVHScreenSaverDescriptor setMediaEntityCollectionIdentifier:](v14, "setMediaEntityCollectionIdentifier:", v17);

  id v18 = [(id)objc_opt_class(self) _screenSaverStyleForMediaCategoryType:a4];
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_initWeak(&location, self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVScreenSaverProvider sharedInstance](&OBJC_CLASS___TVScreenSaverProvider, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverDescriptor serializedDictionary](v14, "serializedDictionary"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100024130;
  v22[3] = &unk_1000FD870;
  objc_copyWeak(&v23, &location);
  [v20 setScreenSaverWithName:v11 style:v19 extraInfo:v21 showConfirmation:1 completion:v22];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

+ (id)_screenSaverStyleForMediaCategoryType:(unint64_t)a3
{
  if (a3 == 3)
  {
    v4 = (id *)&TVScreenSaverStyleReflections;
LABEL_7:
    id v3 = *v4;
    return v3;
  }

  if (a3 != 9)
  {
    v4 = (id *)&TVScreenSaverStyleCascade;
    goto LABEL_7;
  }

  id v3 = 0LL;
  return v3;
}

- (TVHScreenSaverPickerDelegate)delegate
{
  return (TVHScreenSaverPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end