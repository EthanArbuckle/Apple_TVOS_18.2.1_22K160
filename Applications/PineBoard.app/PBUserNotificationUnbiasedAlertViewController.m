@interface PBUserNotificationUnbiasedAlertViewController
- (PBCFUserNotification)notification;
- (PBUserNotificationViewControllerDelegate)delegate;
- (id)preferredFocusEnvironments;
- (id)selectButton;
- (void)_didSelectButtonAtIndex:(unint64_t)a3;
- (void)_handleMenuButton;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNotification:(id)a3;
@end

@implementation PBUserNotificationUnbiasedAlertViewController

- (void)setNotification:(id)a3
{
  v5 = (PBCFUserNotification *)a3;
  if (self->_notification != v5)
  {
    objc_storeStrong((id *)&self->_notification, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertHeader](v5, "alertHeader"));
    -[PBUserNotificationUnbiasedAlertViewController setTitle:](self, "setTitle:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alertMessage](v5, "alertMessage"));
    -[PBUserNotificationUnbiasedAlertViewController setMessage:](self, "setMessage:", v7);

    objc_initWeak(&location, self);
    -[PBUserNotificationUnbiasedAlertViewController _setActions:](self, "_setActions:", &__NSArray0__struct);
    v8 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](v5, "defaultButtonTitle"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification defaultButtonTitle](v5, "defaultButtonTitle"));
      id v11 = -[PBCFUserNotification defaultButtonStyle](v5, "defaultButtonStyle");
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10003CD98;
      v45[3] = &unk_1003D1A08;
      objc_copyWeak(&v47, &location);
      v12 = v5;
      v46 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  v11,  v45));

      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification defaultButtonIndex](v12, "defaultButtonIndex")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v14);

      objc_destroyWeak(&v47);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](v5, "alternateButtonTitle"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification alternateButtonTitle](v5, "alternateButtonTitle"));
      id v17 = -[PBCFUserNotification alternateButtonStyle](v5, "alternateButtonStyle");
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10003CDDC;
      v42[3] = &unk_1003D1A08;
      objc_copyWeak(&v44, &location);
      v18 = v5;
      v43 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v16,  v17,  v42));

      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification alternateButtonIndex](v18, "alternateButtonIndex")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, v20);

      objc_destroyWeak(&v44);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](v5, "otherButtonTitle"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBCFUserNotification otherButtonTitle](v5, "otherButtonTitle"));
      id v23 = -[PBCFUserNotification otherButtonStyle](v5, "otherButtonStyle");
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10003CE20;
      v39[3] = &unk_1003D1A08;
      objc_copyWeak(&v41, &location);
      v24 = v5;
      v40 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v22,  v23,  v39));

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[PBCFUserNotification otherButtonIndex](v24, "otherButtonIndex")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v25, v26);

      objc_destroyWeak(&v41);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sortedArrayUsingSelector:"compare:"]);

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v8,  "objectForKey:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)i),  (void)v35));
          -[PBUserNotificationUnbiasedAlertViewController addAction:](self, "addAction:", v33);
        }

        id v30 = [v29 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }

      while (v30);
    }

    -[PBUserNotificationUnbiasedAlertViewController _setWantsUnclippedContentViewControllerContainer:]( self,  "_setWantsUnclippedContentViewControllerContainer:",  1LL);
    v34 = objc_alloc_init(&OBJC_CLASS___PBUnbiasedAlertSelectButtonController);
    -[PBUserNotificationUnbiasedAlertViewController setContentViewController:](self, "setContentViewController:", v34);

    objc_destroyWeak(&location);
  }
}

- (id)selectButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController contentViewController](self, "contentViewController"));
  if (v2
    && (uint64_t v3 = objc_opt_class(&OBJC_CLASS___PBUnbiasedAlertSelectButtonController),
        (objc_opt_isKindOfClass(v2, v3) & 1) != 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 selectButton]);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController selectButton](self, "selectButton"));
  if ([v3 isEnabled])
  {
    v9 = v3;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBUserNotificationUnbiasedAlertViewController;
    id v5 = -[PBUserNotificationUnbiasedAlertViewController preferredFocusEnvironments](&v8, "preferredFocusEnvironments");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v5);
  }

  v6 = (void *)v4;

  return v6;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBUserNotificationUnbiasedAlertViewController;
  id v6 = a3;
  -[PBUserNotificationUnbiasedAlertViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem", v10.receiver, v10.super_class));

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController selectButton](self, "selectButton"));
  if (v7 == v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController selectButton](self, "selectButton"));
    [v9 setEnabled:0];
  }
}

- (void)_handleMenuButton
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController delegate](self, "delegate"));
  [v3 didCancelUserNotificationViewController:self];
}

- (void)_didSelectButtonAtIndex:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertViewController delegate](self, "delegate"));
  [v5 userNotificationViewController:self didSelectButtonIndex:a3];
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