@interface TVMusicAgeGateController
+ (id)customAgeGateControllerWithRatingThreshold:(int64_t)a3 dialogTitle:(id)a4 dialogMessage:(id)a5;
+ (id)standardAgeGateController;
- (TVMusicAgeGateController)initWithAgeGateInfo:(id)a3;
- (TVMusicAgeGateInfo)ageGateInfo;
- (void)_showAgeGateDialogForLibraryItem:(id)a3 showUnconditionally:(BOOL)a4 completion:(id)a5;
- (void)_showAgeGateDialogWithCompletion:(id)a3;
- (void)_updateSavedIdentifiers:(id)a3 withIdentifier:(id)a4;
- (void)setAgeGateInfo:(id)a3;
- (void)showAgeGateDialogForItem:(id)a3 completion:(id)a4;
- (void)showAgeGateDialogIfNeededForLibraryItem:(id)a3 completion:(id)a4;
- (void)showAgeGateDialogIfNeededForRatingLevel:(int64_t)a3 completion:(id)a4;
@end

@implementation TVMusicAgeGateController

+ (id)standardAgeGateController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAgeGateInfo ageGateInfoFromURLBag](&OBJC_CLASS___TVMusicAgeGateInfo, "ageGateInfoFromURLBag"));
  v3 = -[TVMusicAgeGateController initWithAgeGateInfo:]( objc_alloc(&OBJC_CLASS___TVMusicAgeGateController),  "initWithAgeGateInfo:",  v2);

  return v3;
}

+ (id)customAgeGateControllerWithRatingThreshold:(int64_t)a3 dialogTitle:(id)a4 dialogMessage:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = -[TVMusicAgeGateInfo initWithRatingThreshold:dialogTitle:dialogMessage:]( objc_alloc(&OBJC_CLASS___TVMusicAgeGateInfo),  "initWithRatingThreshold:dialogTitle:dialogMessage:",  a3,  v8,  v7);

  v10 = -[TVMusicAgeGateController initWithAgeGateInfo:]( objc_alloc(&OBJC_CLASS___TVMusicAgeGateController),  "initWithAgeGateInfo:",  v9);
  return v10;
}

- (TVMusicAgeGateController)initWithAgeGateInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicAgeGateController;
  v6 = -[TVMusicAgeGateController init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ageGateInfo, a3);
  }

  return v7;
}

- (void)showAgeGateDialogIfNeededForLibraryItem:(id)a3 completion:(id)a4
{
}

- (void)showAgeGateDialogIfNeededForRatingLevel:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
  if ([v7 isAgeGateEnabled])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
    id v9 = [v8 ratingThreshold];

    if ((uint64_t)v9 <= a3)
    {
      v10 = (void *)qword_1002BE940;
      if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
        int v16 = 134218240;
        int64_t v17 = a3;
        __int16 v18 = 2048;
        id v19 = [v12 ratingThreshold];
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Showing age gate warning: rating %ld >= threshold %ld",  (uint8_t *)&v16,  0x16u);
      }

      -[TVMusicAgeGateController _showAgeGateDialogWithCompletion:](self, "_showAgeGateDialogWithCompletion:", v6);
      goto LABEL_10;
    }
  }

  else
  {
  }

  v13 = (void *)qword_1002BE940;
  if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
    int v16 = 134218240;
    int64_t v17 = a3;
    __int16 v18 = 2048;
    id v19 = [v15 ratingThreshold];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Not showing age gate warning because rating %ld is less than threshold %ld",  (uint8_t *)&v16,  0x16u);
  }

  v6[2](v6, 0LL);
LABEL_10:
}

- (void)showAgeGateDialogForItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 type];
  if (v8 == (id)9)
  {
    id v9 = (id *)&OBJC_CLASS___MPModelMovie_ptr;
  }

  else
  {
    if (v8 != (id)6) {
      goto LABEL_7;
    }
    id v9 = (id *)&OBJC_CLASS___MPModelTVEpisode_ptr;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([*v9 kindWithVariants:2]);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10005BF78;
    v14[3] = &unk_10026B4A8;
    v14[4] = self;
    id v15 = v7;
    +[TVMusicLibraryUtilities findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPObjectWithIdentifiers:itemKind:itemProperties:completionHandler:",  v12,  v11,  0LL,  v14);

    goto LABEL_10;
  }

- (void)_showAgeGateDialogWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1002BE940;
  if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Showing age gate warning", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dialogTitle]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dialogMessage]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v7,  v9,  1LL));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ContextMenuConfirmCancel" value:&stru_100279068 table:0]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10005C324;
  v25[3] = &unk_100269708;
  id v13 = v4;
  id v26 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  1LL,  v25));
  [v10 addAction:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  int v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"AgeGateDialogContinue" value:&stru_100279068 table:0]);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  v22 = sub_10005C398;
  v23 = &unk_100269708;
  id v24 = v13;
  id v17 = v13;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  0LL,  &v20));
  objc_msgSend(v10, "addAction:", v18, v20, v21, v22, v23);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  [v19 presentViewController:v10];
}

- (void)_showAgeGateDialogForLibraryItem:(id)a3 showUnconditionally:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)qword_1002BE940;
  if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
    *(_DWORD *)buf = 138412290;
    id v56 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Requesting Age Gate dialog for library item: %@",  buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
  if (![v13 isAgeGateEnabled])
  {

    goto LABEL_10;
  }

  if ([v8 type] == (id)6)
  {

    goto LABEL_8;
  }

  id v14 = [v8 type];

  if (v14 != (id)9)
  {
LABEL_10:
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAgeGateController ageGateInfo](self, "ageGateInfo"));
    unsigned int v20 = [v19 isAgeGateEnabled];

    uint64_t v21 = (void *)qword_1002BE940;
    BOOL v22 = os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        v23 = v21;
        id v24 = [v8 type];
        *(_DWORD *)buf = 134217984;
        id v56 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Not showing Age Gate dialog for library item of type %ld",  buf,  0xCu);
      }
    }

    else if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Not showing Age Gate dialog; age gate is disabled.",
        buf,
        2u);
    }

    goto LABEL_38;
  }

- (void)_updateSavedIdentifiers:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      id v7 = [v5 mutableCopy];
      [v7 addObject:v6];
      id v8 = [v7 copy];

      id v9 = (void *)qword_1002BE940;
      if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = v9;
        *(_DWORD *)buf = 138412546;
        id v16 = v6;
        __int16 v17 = 2048;
        id v18 = [v8 count];
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Adding store ID %@ to library idenfifiers array, count = %ld",  buf,  0x16u);
      }
    }

    else
    {
      v12 = (os_log_s *)qword_1002BE940;
      if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Creating new library idenfifiers array with store ID %@",  buf,  0xCu);
      }

      id v14 = v6;
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v13 setValue:v8 forKey:@"AgeGatePlayedItems"];

    id v5 = v8;
  }

  else
  {
    v11 = (os_log_s *)qword_1002BE940;
    if (os_log_type_enabled((os_log_t)qword_1002BE940, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Can't save nil identifier", buf, 2u);
    }
  }
}

- (TVMusicAgeGateInfo)ageGateInfo
{
  return self->_ageGateInfo;
}

- (void)setAgeGateInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end