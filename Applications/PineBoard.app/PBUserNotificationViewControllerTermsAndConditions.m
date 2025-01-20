@interface PBUserNotificationViewControllerTermsAndConditions
- (PBCFUserNotification)notification;
- (PBUserNotificationViewControllerDelegate)delegate;
- (PBUserNotificationViewControllerTermsAndConditions)initWithTitle:(id)a3 text:(id)a4;
- (void)_handleHomeButton:(id)a3;
- (void)_handleMenuButton;
- (void)setDelegate:(id)a3;
- (void)setNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBUserNotificationViewControllerTermsAndConditions

- (PBUserNotificationViewControllerTermsAndConditions)initWithTitle:(id)a3 text:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBUserNotificationViewControllerTermsAndConditions;
  v4 = -[PBUserNotificationViewControllerTermsAndConditions initWithTitle:text:](&v7, "initWithTitle:text:", a3, a4);
  v5 = v4;
  if (v4) {
    -[PBUserNotificationViewControllerTermsAndConditions setShouldDismissAutomatically:]( v4,  "setShouldDismissAutomatically:",  0LL);
  }
  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBUserNotificationViewControllerTermsAndConditions;
  -[PBUserNotificationViewControllerTermsAndConditions viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerTermsAndConditions view](self, "view"));
  v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuButton");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_1003FE938);
  [v3 addGestureRecognizer:v4];
  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleHomeButton:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1003FE950);
  [v3 addGestureRecognizer:v5];
}

- (void)setNotification:(id)a3
{
  v27 = (PBCFUserNotification *)a3;
  if (self->_notification != v27)
  {
    objc_storeStrong((id *)&self->_notification, a3);
    -[PBUserNotificationViewControllerTermsAndConditions removeAllButtons](self, "removeAllButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertHeader](v27, "alertHeader"));
    -[PBUserNotificationViewControllerTermsAndConditions setTitle:](self, "setTitle:", v5);

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertMessage](v27, "alertMessage"));
    -[PBUserNotificationViewControllerTermsAndConditions setText:](self, "setText:", v6);

    objc_initWeak(&location, self);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification selectableItemTitles](v27, "selectableItemTitles"));
    BOOL v8 = [v7 count] == 0;

    if (v8)
    {
      v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](v27, "defaultButtonTitle"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](v27, "defaultButtonTitle"));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification defaultButtonIndex](v27, "defaultButtonIndex")));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v11, v12);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](v27, "alternateButtonTitle", v27));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](v27, "alternateButtonTitle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification alternateButtonIndex](v27, "alternateButtonIndex")));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v14, v15);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](v27, "otherButtonTitle"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](v27, "otherButtonTitle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification otherButtonIndex](v27, "otherButtonIndex")));
        -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v17, v18);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v29, "allKeys"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sortedArrayUsingSelector:"compare:"]);

      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      id obj = v20;
      id v21 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", v24));
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472LL;
            v31[2] = sub_1001D33C8;
            v31[3] = &unk_1003D0418;
            objc_copyWeak(&v32, &location);
            v31[4] = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVSUITextAlertButton buttonWithTitle:type:handler:]( &OBJC_CLASS___TVSUITextAlertButton,  "buttonWithTitle:type:handler:",  v25,  0LL,  v31));
            -[PBUserNotificationViewControllerTermsAndConditions addButton:](self, "addButton:", v26);

            objc_destroyWeak(&v32);
          }

          id v21 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
        }

        while (v21);
      }
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification selectableItemTitles](v27, "selectableItemTitles"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001D329C;
      v37[3] = &unk_1003DC048;
      objc_copyWeak(&v38, &location);
      v37[4] = self;
      [v9 enumerateObjectsUsingBlock:v37];

      objc_destroyWeak(&v38);
    }

    objc_destroyWeak(&location);
  }
}

- (void)_handleMenuButton
{
  id v3 = sub_100082C04();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[PBUserNotificationViewControllerTermsAndConditions _handleMenuButton]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerTermsAndConditions delegate](self, "delegate"));
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
    v13 = "-[PBUserNotificationViewControllerTermsAndConditions _handleHomeButton:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentApplicationSceneHandle]);
  unsigned __int8 v9 = [v8 isDefaultKioskAppScene];

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    [v10 handleTVTapEvent:v4];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationViewControllerTermsAndConditions delegate](self, "delegate"));
  [v11 didCancelUserNotificationViewController:self];
}

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBCFUserNotification)notification
{
  return self->_notification;
}

- (void).cxx_destruct
{
}

@end