@interface TVMusicAlerts
+ (BOOL)showMessageWithTitle:(id)a3 message:(id)a4;
+ (id)alertControllerWithStoreDialogResponse:(id)a3 actionBlock:(id)a4;
+ (id)alertForLibraryDeleteConfirmationWithItemName:(id)a3 completion:(id)a4;
+ (void)_showAlertForStoreDialogDictionary:(id)a3 completion:(id)a4;
+ (void)presentAgeVerificationDialogWithCompletion:(id)a3;
+ (void)showAlertController:(id)a3;
+ (void)showAlertForLibraryDeleteConfirmationWithItemName:(id)a3 completion:(id)a4;
+ (void)showAlertForStoreDialogDictionary:(id)a3 hideNowPlaying:(BOOL)a4 completion:(id)a5;
@end

@implementation TVMusicAlerts

+ (id)alertControllerWithStoreDialogResponse:(id)a3 actionBlock:(id)a4
{
  id v5 = a3;
  id v31 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 explanation]);
  if (![v6 length] && !objc_msgSend(v7, "length"))
  {
    id v26 = sub_100030D3C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Missing title and body text in store dialog response: %@",  buf,  0xCu);
    }

    v10 = 0LL;
    goto LABEL_16;
  }

  id v8 = sub_100030D3C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v42 = v6;
    __int16 v43 = 2112;
    v44 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Showing store dialog alert with title = \"%@\", message = \"%@\"",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v7,  1LL));
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 buttons]);
  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  v13 = &off_1001E7000;
  if (!v12)
  {

LABEL_15:
    v32[0] = _NSConcreteStackBlock;
    v32[1] = *((void *)v13 + 409);
    v32[2] = sub_100030E50;
    v32[3] = &unk_100269708;
    v33 = (os_log_s *)v31;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v32));
    [v10 addAction:v23];

    v24 = v33;
LABEL_16:

    goto LABEL_17;
  }

  id v14 = v12;
  id v29 = v5;
  id obj = v11;
  v27 = v7;
  v28 = v6;
  char v15 = 0;
  uint64_t v16 = *(void *)v37;
  do
  {
    for (i = 0LL; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
      BOOL v19 = objc_msgSend(v18, "type", v27, v28, v29) == (id)2;
      v15 |= v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 title]);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_100030D7C;
      v34[3] = &unk_10026A060;
      id v21 = v31;
      v34[4] = v18;
      id v35 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  v19,  v34));
      [v10 addAction:v22];
    }

    id v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }

  while (v14);

  v6 = v28;
  id v5 = v29;
  v7 = v27;
  v13 = &off_1001E7000;
  if ((v15 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_17:

  return v10;
}

+ (BOOL)showMessageWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] || objc_msgSend(v6, "length"))
  {
    id v8 = sub_100030D3C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Showing dialog alert with title = \"%@\", message = \"%@\"",  buf,  0x16u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    uint64_t v16 = sub_100031110;
    v17 = &unk_100269EF8;
    v18 = (os_log_s *)v6;
    id v19 = v7;
    id v20 = a1;
    v10 = v15;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v16((uint64_t)v10);
    }

    else
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_100031D50;
      v22 = &unk_100268D60;
      v23 = v10;
      dispatch_async(&_dispatch_main_q, buf);
    }

    BOOL v11 = 1;
    id v12 = v18;
  }

  else
  {
    id v14 = sub_100030D3C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Missing title and body text in dialog request",  buf,  2u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (void)showAlertForStoreDialogDictionary:(id)a3 hideNowPlaying:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6
    && (v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicNowPlayingManager sharedInstance]( TVMusicNowPlayingManager,  "sharedInstance")),  unsigned int v11 = [v10 isNowPlayingVisible],  v10,  v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicNowPlayingManager sharedInstance](&OBJC_CLASS___TVMusicNowPlayingManager, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10003143C;
    v13[3] = &unk_10026A0C8;
    id v16 = a1;
    id v14 = v8;
    id v15 = v9;
    [v12 hideCurrentPlaybackControllerWithCompletion:v13];
  }

  else
  {
    [a1 _showAlertForStoreDialogDictionary:v8 completion:v9];
  }
}

+ (void)_showAlertForStoreDialogDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100031568;
  id v14 = &unk_10026A0C8;
  id v8 = v6;
  id v15 = v8;
  id v17 = a1;
  id v9 = v7;
  id v16 = v9;
  v10 = &v11;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v11, v12))
  {
    v13((uint64_t)v10);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100031D50;
    block[3] = &unk_100268D60;
    id v19 = v10;
    dispatch_async(&_dispatch_main_q, block);
  }
}

+ (void)showAlertController:(id)a3
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  id v7 = sub_100031738;
  id v8 = &unk_100268CF0;
  id v3 = a3;
  id v9 = v3;
  v4 = &v5;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v5, v6))
  {
    v7((uint64_t)v4);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100031D50;
    block[3] = &unk_100268D60;
    unsigned int v11 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

+ (void)presentAgeVerificationDialogWithCompletion:(id)a3
{
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472LL;
  id v7 = sub_100031904;
  id v8 = &unk_100268D60;
  id v3 = a3;
  id v9 = v3;
  v4 = &v5;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread", v5, v6))
  {
    v7((uint64_t)v4);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100031D50;
    block[3] = &unk_100268D60;
    unsigned int v11 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

+ (id)alertForLibraryDeleteConfirmationWithItemName:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"ContextMenuConfirmDelete" value:&stru_100279068 table:0]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v9,  0LL,  1LL));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"ContextMenuConfirmOK" value:&stru_100279068 table:0]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100031C64;
  v22[3] = &unk_100269708;
  id v13 = v5;
  id v23 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  2LL,  v22));
  [v10 addAction:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"ContextMenuConfirmCancel" value:&stru_100279068 table:0]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100031C74;
  v20[3] = &unk_100269708;
  id v21 = v13;
  id v17 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  1LL,  v20));
  [v10 addAction:v18];

  return v10;
}

+ (void)showAlertForLibraryDeleteConfirmationWithItemName:(id)a3 completion:(id)a4
{
  if (a3) {
    id v6 = (const __CFString *)a3;
  }
  else {
    id v6 = &stru_100279068;
  }
  id v8 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 alertForLibraryDeleteConfirmationWithItemName:v6 completion:a4]);
  [a1 showAlertController:v7];
}

@end