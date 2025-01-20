@interface PBUserNotificationViewControllerAlert
- (PBCFUserNotification)notification;
- (PBCFUserNotificationWaitViewSpec)waitViewSpec;
- (PBUserNotificationViewControllerDelegate)delegate;
- (unint64_t)waitActionButtonIndex;
- (void)_didSelectButtonAtIndex:(unint64_t)a3;
- (void)_handleHomeButton:(id)a3;
- (void)_handleMenuButton;
- (void)setDelegate:(id)a3;
- (void)setNotification:(id)a3;
- (void)setWaitViewSpec:(id)a3;
- (void)updateWithNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBUserNotificationViewControllerAlert

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBUserNotificationViewControllerAlert;
  -[PBUserNotificationViewControllerAlert viewDidLoad](&v7, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_1003FE998);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert view](self, "view"));
  [v4 addGestureRecognizer:v3];

  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1003FE9B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert view](self, "view"));
  [v6 addGestureRecognizer:v5];
}

- (void)_handleMenuButton
{
  id v3 = sub_100082C04();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[PBUserNotificationViewControllerAlert _handleMenuButton]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert delegate](self, "delegate"));
  [v5 didCancelUserNotificationViewController:self];
}

- (void)_handleHomeButton:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082C04();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[PBUserNotificationViewControllerAlert _handleHomeButton:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
  unsigned __int8 v9 = [v8 isDefaultKioskAppScene];

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v10 handleTVTapEvent:v4];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert delegate](self, "delegate"));
  [v11 didCancelUserNotificationViewController:self];
}

- (void)setNotification:(id)a3
{
  id v5 = (PBCFUserNotification *)a3;
  if (self->_notification != v5) {
    objc_storeStrong((id *)&self->_notification, a3);
  }
  if (qword_100471458 != -1) {
    dispatch_once(&qword_100471458, &stru_1003DC7B8);
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification iconURL](v5, "iconURL"));
  if (v6)
  {
    objc_super v7 = (void *)qword_100471450;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification notificationSource](v5, "notificationSource"));
    LODWORD(v7) = [v7 containsObject:v8];

    if ((_DWORD)v7)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](&OBJC_CLASS___UIImage, "imageWithContentsOfFile:", v9));

      -[PBUserNotificationViewControllerAlert setImage:](self, "setImage:", v10);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertHeader](v5, "alertHeader"));
  -[PBUserNotificationViewControllerAlert setTitle:](self, "setTitle:", v11);

  -[PBUserNotificationViewControllerAlert updateWithNotification:](self, "updateWithNotification:", v5);
}

- (void)updateWithNotification:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 alertMessage]);
  -[PBUserNotificationViewControllerAlert setMessage:](self, "setMessage:", v4);

  objc_initWeak(&location, self);
  -[PBUserNotificationViewControllerAlert _setActions:](self, "_setActions:", &__NSArray0__struct);
  self->_inWaitMode = 0;
  v42 = -[PBUserNotificationViewControllerAlert waitActionButtonIndex](self, "waitActionButtonIndex");
  uint64_t v75 = 0LL;
  v76 = &v75;
  uint64_t v77 = 0x2020000000LL;
  char v78 = 0;
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x2020000000LL;
  uint64_t v74 = 0LL;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_1001F1BD8;
  v68[3] = &unk_1003DC800;
  v70 = &v75;
  id v44 = v3;
  id v69 = v44;
  v41 = objc_retainBlock(v68);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v44 selectableItemTitles]);
  if ([v5 count])
  {
    BOOL v40 = 1;
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v44 customButtonDefinitions]);
    BOOL v40 = [v6 count] == 0;
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v44 selectableItemTitles]);
  BOOL v8 = [v7 count] == 0;

  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v44 customButtonDefinitions]);
    BOOL v18 = [v17 count] == 0;

    if (v18)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v44 defaultButtonTitle]);

      v16 = v44;
      if (!v36) {
        goto LABEL_19;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue([v44 defaultButtonTitle]);
      id v38 = [v44 defaultButtonStyle];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_1001F1EAC;
      v53[3] = &unk_1003D1A08;
      v20 = &v55;
      objc_copyWeak(&v55, &location);
      id v54 = v44;
      else {
        v39 = 0LL;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:]( &OBJC_CLASS___UIAlertAction,  "_actionWithTitle:image:style:handler:shouldDismissHandler:",  v37,  0LL,  v38,  v53,  v39));

      v21 = &v54;
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v44 customButtonDefinitions]);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_1001F1D00;
      v56[3] = &unk_1003DC850;
      v20 = v60;
      objc_copyWeak(v60, &location);
      v60[1] = v42;
      v59 = &v71;
      v57 = &stru_1003DC7D8;
      v58 = v41;
      v56[4] = self;
      [v19 enumerateObjectsUsingBlock:v56];

      v21 = (id *)&v57;
      v22 = v58;
    }

    objc_destroyWeak(v20);
    v16 = v44;
    goto LABEL_19;
  }

  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v44 selectableItemTitles]);
  id v10 = [v9 countByEnumeratingWithState:&v64 objects:v80 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v65;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)i);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_1001F1C70;
        v61[3] = &unk_1003D1A08;
        objc_copyWeak(&v63, &location);
        id v62 = v44;
        else {
          v14 = 0LL;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:]( &OBJC_CLASS___UIAlertAction,  "_actionWithTitle:image:style:handler:shouldDismissHandler:",  v13,  0LL,  0LL,  v61,  v14));
        -[PBUserNotificationViewControllerAlert addAction:](self, "addAction:", v15);
        ++v72[3];

        objc_destroyWeak(&v63);
      }

      id v10 = [v9 countByEnumeratingWithState:&v64 objects:v80 count:16];
    }

    while (v10);
  }

  -[PBUserNotificationViewControllerAlert _addSectionDelimiter](self, "_addSectionDelimiter");
  v16 = v44;
LABEL_19:
  v23 = (void *)objc_claimAutoreleasedReturnValue([v16 alternateButtonTitle]);
  if (v23) {
    BOOL v24 = v40;
  }
  else {
    BOOL v24 = 0;
  }

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v44 alternateButtonTitle]);
    id v26 = [v44 alternateButtonStyle];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1001F1EF0;
    v50[3] = &unk_1003D1A08;
    objc_copyWeak(&v52, &location);
    id v51 = v44;
    else {
      v27 = 0LL;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:]( &OBJC_CLASS___UIAlertAction,  "_actionWithTitle:image:style:handler:shouldDismissHandler:",  v25,  0LL,  v26,  v50,  v27));

    objc_destroyWeak(&v52);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v44 otherButtonTitle]);
  if (v29) {
    BOOL v30 = v40;
  }
  else {
    BOOL v30 = 0;
  }

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v44 otherButtonTitle]);
    id v32 = [v44 otherButtonStyle];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_1001F1F34;
    v47[3] = &unk_1003D1A08;
    objc_copyWeak(&v49, &location);
    id v48 = v44;
    else {
      v33 = 0LL;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction _actionWithTitle:image:style:handler:shouldDismissHandler:]( &OBJC_CLASS___UIAlertAction,  "_actionWithTitle:image:style:handler:shouldDismissHandler:",  v31,  0LL,  v32,  v47,  v33));

    objc_destroyWeak(&v49);
  }

  if (!*((_BYTE *)v76 + 24))
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001F1F78;
    v45[3] = &unk_1003D6658;
    objc_copyWeak(&v46, &location);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  v45));
    -[PBUserNotificationViewControllerAlert addAction:](self, "addAction:", v35);

    objc_destroyWeak(&v46);
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  objc_destroyWeak(&location);
}

- (void)_didSelectButtonAtIndex:(unint64_t)a3
{
  if (self->_inWaitMode) {
    goto LABEL_9;
  }
  unint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert waitViewSpec](self, "waitViewSpec"));

  if (!v5)
  {
LABEL_8:
    if (!self->_inWaitMode)
    {
LABEL_10:
      int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert delegate](self, "delegate"));
      [v6 userNotificationViewController:self didSelectButtonIndex:v4];
      goto LABEL_11;
    }

- (unint64_t)waitActionButtonIndex
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert waitViewSpec](self, "waitViewSpec"));

  if (v3)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert waitViewSpec](self, "waitViewSpec"));
    id v5 = [v4 userNotificationResponse];
    if (v5 == (id)2)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert notification](self, "notification"));
      signed int v7 = [v6 otherButtonIndex];
    }

    else if (v5 == (id)1)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert notification](self, "notification"));
      signed int v7 = [v6 alternateButtonIndex];
    }

    else
    {
      if (v5)
      {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_11;
      }

      int v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerAlert notification](self, "notification"));
      signed int v7 = [v6 defaultButtonIndex];
    }

    unint64_t v8 = v7;

LABEL_11:
    return v8;
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (PBCFUserNotification)notification
{
  return self->_notification;
}

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBCFUserNotificationWaitViewSpec)waitViewSpec
{
  return self->_waitViewSpec;
}

- (void)setWaitViewSpec:(id)a3
{
}

- (void).cxx_destruct
{
}

@end