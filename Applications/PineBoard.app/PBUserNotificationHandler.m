@interface PBUserNotificationHandler
- (NSMutableDictionary)dialogContextsByToken;
- (NSMutableDictionary)displayedViewControllers;
- (NSMutableDictionary)displayedWaitViewControllers;
- (PBUserNotificationHandler)init;
- (id)_newViewControllerForNotification:(id)a3;
- (id)_waitViewControllerForSpec:(id)a3;
- (id)notificationFilter;
- (void)_cancelUserNotificationWithToken:(id)a3;
- (void)_dismissUserNotificationWithToken:(id)a3;
- (void)_performActionForAlertController:(id)a3 invokeActionBlock:(id)a4 dismissControllerBlock:(id)a5;
- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5;
- (void)didCancelUserNotificationViewController:(id)a3;
- (void)dismissDialogForViewController:(id)a3;
- (void)setDialogContextsByToken:(id)a3;
- (void)setDisplayedViewControllers:(id)a3;
- (void)setDisplayedWaitViewControllers:(id)a3;
- (void)setNotificationFilter:(id)a3;
- (void)userNotificationCenterDidCancelCFNotification:(id)a3;
- (void)userNotificationCenterDidReceiveCFNotification:(id)a3;
- (void)userNotificationViewController:(id)a3 didSelectButtonIndex:(unint64_t)a4;
@end

@implementation PBUserNotificationHandler

- (PBUserNotificationHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBUserNotificationHandler;
  v2 = -[PBUserNotificationHandler init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v3 addObserver:v2];

    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    displayedViewControllers = v2->_displayedViewControllers;
    v2->_displayedViewControllers = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dialogContextsByToken = v2->_dialogContextsByToken;
    v2->_dialogContextsByToken = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    displayedWaitViewControllers = v2->_displayedWaitViewControllers;
    v2->_displayedWaitViewControllers = (NSMutableDictionary *)v8;
  }

  return v2;
}

- (void)userNotificationCenterDidReceiveCFNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBUserNotificationHandler notificationFilter](self, "notificationFilter"));
  v6 = (void *)v5;
  if (v5 && ((*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v4) & 1) == 0)
  {
    id v14 = sub_100084428();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationSource]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
      *(_DWORD *)buf = 138543618;
      v48 = v16;
      __int16 v49 = 2112;
      v50 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Ignoring notification (forbidden by filter). {source=%{public}@, notification=%@}",  buf,  0x16u);
    }

    [v4 cancel];
  }

  else
  {
    displayedViewControllers = self->_displayedViewControllers;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 token]));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](displayedViewControllers, "objectForKey:", v8));

    if (v9)
    {
      id v10 = sub_100084428();
      objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationSource]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
        *(_DWORD *)buf = 138543618;
        v48 = v12;
        __int16 v49 = 2112;
        v50 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Updating existing view controller for notification. {source=%{public}@, notification=%@}",  buf,  0x16u);
      }

      [v9 setNotification:v4];
    }

    else
    {
      id v18 = -[PBUserNotificationHandler _newViewControllerForNotification:]( self,  "_newViewControllerForNotification:",  v4);
      if (v18)
      {
        v19 = self->_displayedViewControllers;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 token]));
        -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationSource]);
        if (([v4 isAlertTopMost] & 1) != 0
          || ([v21 isEqual:@"itunesstored"] & 1) != 0)
        {
          uint64_t v22 = 1LL;
        }

        else
        {
          uint64_t v22 = (uint64_t)[v21 isEqual:@"akd"];
        }

        if ([v21 isEqual:@"locationd"])
        {
          BOOL v25 = 1LL;
        }

        else if ([v21 isEqual:@"TVSystemUIService"])
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue([v4 waitViewSpec]);
          BOOL v25 = v26 != 0LL;
        }

        else
        {
          BOOL v25 = 0LL;
        }

        v43 = v21;
        v53[0] = @"PBDialogOptionPresentForcedKey";
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
        v54[0] = v27;
        v53[1] = @"PBDialogOptionPresentWhileScreenSaverActiveKey";
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v25));
        v54[1] = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  2LL));

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v18));
        dialogContextsByToken = self->_dialogContextsByToken;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 token]));
        -[NSMutableDictionary setObject:forKey:](dialogContextsByToken, "setObject:forKey:", v30, v32);

        id v33 = sub_100084428();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v4 notificationSource]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
          id v42 = v18;
          v37 = v29;
          v38 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
          *(_DWORD *)buf = 138543874;
          v48 = v35;
          __int16 v49 = 2114;
          v50 = v36;
          __int16 v51 = 2112;
          v52 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Requesting presentation for notification. {source=%{public}@, contextIdentifier=%{public}@, notification=%@}",  buf,  0x20u);

          v29 = v37;
          id v18 = v42;
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
        [v39 presentDialogWithContext:v30 options:v29 completion:0];

        [v4 timeout];
        if (v40 > 0.0)
        {
          dispatch_time_t v41 = dispatch_time(0LL, (uint64_t)(v40 * 1000000000.0));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000279C4;
          block[3] = &unk_1003D09B8;
          block[4] = self;
          id v45 = v4;
          id v46 = v30;
          dispatch_after(v41, &_dispatch_main_q, block);
        }
      }

      else
      {
        id v23 = sub_100084428();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100271CB4(v4, v24);
        }

        [v4 cancel];
      }
    }
  }
}

- (void)userNotificationCenterDidCancelCFNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 token]));
  -[PBUserNotificationHandler _cancelUserNotificationWithToken:](self, "_cancelUserNotificationWithToken:", v4);
}

- (id)_newViewControllerForNotification:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 notificationType];
  if (v5 > 7) {
    v6 = 0LL;
  }
  else {
    v6 = (PBUserNotificationNavigationController *)objc_alloc_init(*off_1003D1140[v5]);
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIAlertController);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    -[PBUserNotificationNavigationController setCoordinatedActionPerformingDelegate:]( v6,  "setCoordinatedActionPerformingDelegate:",  self);
  }
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 waitViewSpec]);

    if (v8)
    {
      if (-[PBUserNotificationNavigationController conformsToProtocol:]( v6,  "conformsToProtocol:",  &OBJC_PROTOCOL___PBUserNotificationWaitingCoordinator))
      {
        v9 = v6;
        v6 = (PBUserNotificationNavigationController *)objc_claimAutoreleasedReturnValue([v4 waitViewSpec]);
        -[PBUserNotificationNavigationController setWaitViewSpec:](v9, "setWaitViewSpec:", v6);
      }

      else
      {
        v9 = -[PBUserNotificationNavigationController initWithUserNotificationViewController:]( objc_alloc(&OBJC_CLASS___PBUserNotificationNavigationController),  "initWithUserNotificationViewController:",  v6);
      }

      v6 = v9;
    }
  }

  -[PBUserNotificationNavigationController setNotification:](v6, "setNotification:", v4);
  -[PBUserNotificationNavigationController setDelegate:](v6, "setDelegate:", self);

  return v6;
}

- (void)userNotificationViewController:(id)a3 didSelectButtonIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v6));
  id v9 = sub_100084428();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v7 notificationSource]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    *(_DWORD *)buf = 134218754;
    unint64_t v28 = a4;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2114;
    v32 = v12;
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "User selected button for notification. {index=%zd, source=%{public}@, contextIdentifier=%{public}@, notification=%@}",  buf,  0x2Au);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 token]));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 waitViewSpec]);
  if (!v15
    || ([v6 conformsToProtocol:&OBJC_PROTOCOL___PBUserNotificationWaitingCoordinator] & 1) != 0)
  {
    goto LABEL_15;
  }

  id v16 = [v15 userNotificationResponse];
  if (v16)
  {
    if (v16 == (id)2)
    {
      unsigned int v17 = [v7 otherButtonIndex];
    }

    else
    {
      if (v16 != (id)1)
      {
LABEL_15:
        [v7 didSelectButtonAtIndex:a4];
        -[PBUserNotificationHandler _dismissUserNotificationWithToken:](self, "_dismissUserNotificationWithToken:", v14);
        goto LABEL_16;
      }

      unsigned int v17 = [v7 alternateButtonIndex];
    }
  }

  else
  {
    unsigned int v17 = [v7 defaultButtonIndex];
  }

  if (v17 != (_DWORD)a4) {
    goto LABEL_15;
  }
  id v22 = v6;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationHandler _waitViewControllerForSpec:](self, "_waitViewControllerForSpec:", v15));
  if (!v18)
  {

    goto LABEL_15;
  }

  [v22 pushViewController:v18 animated:1];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_displayedWaitViewControllers,  "setObject:forKeyedSubscript:",  v18,  v14);
  objc_initWeak((id *)buf, self);
  id v19 = objc_claimAutoreleasedReturnValue([v15 dismissalDarwinNotification]);
  v20 = (const char *)[v19 UTF8String];
  v21 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100027FF0;
  handler[3] = &unk_1003D1100;
  objc_copyWeak(&v25, (id *)buf);
  id v24 = v14;
  notify_register_dispatch(v20, &out_token, &_dispatch_main_q, handler);

  [v7 didSelectButtonAtIndex:a4];
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

LABEL_16:
}

- (void)didCancelUserNotificationViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBDialogContext contextWithViewController:]( &OBJC_CLASS___PBDialogContext,  "contextWithViewController:",  v4));
  id v6 = sub_100084428();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 notificationSource]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
    int v15 = 138543874;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v10;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User cancelled notification. {source=%{public}@, contextIdentifier=%{public}@, notification=%@}",  (uint8_t *)&v15,  0x20u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 token]));
  -[PBUserNotificationHandler _cancelUserNotificationWithToken:](self, "_cancelUserNotificationWithToken:", v14);
}

- (void)dismissDialogForViewController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 notification]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 token]));
  -[PBUserNotificationHandler _dismissUserNotificationWithToken:](self, "_dismissUserNotificationWithToken:", v5);
}

- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5
{
  id v6 = a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_dialogContextsByToken, "allKeys", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v13 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_dialogContextsByToken,  "objectForKeyedSubscript:",  v12));

        if (v13 == v6)
        {
          id v14 = sub_100084428();
          int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_100271D74(v12, v15);
          }

          -[PBUserNotificationHandler _cancelUserNotificationWithToken:](self, "_cancelUserNotificationWithToken:", v12);
          goto LABEL_13;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)_waitViewControllerForSpec:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);
  unsigned int v5 = [v4 isEqualToString:PBSUserNotificationWaitViewTypeSharePlay];

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___PBSharePlayWaitViewController);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 sharePlayDeviceName]);
    id v8 = -[PBSharePlayWaitViewController initWithDeviceName:deviceModel:]( v6,  "initWithDeviceName:deviceModel:",  v7,  [v3 sharePlayDeviceModel]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)_cancelUserNotificationWithToken:(id)a3
{
  displayedViewControllers = self->_displayedViewControllers;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( displayedViewControllers,  "objectForKeyedSubscript:",  v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notification]);
  [v7 cancel];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_displayedWaitViewControllers,  "objectForKeyedSubscript:",  v5));
  [v8 userNotificationWasCancelled];

  -[PBUserNotificationHandler _dismissUserNotificationWithToken:](self, "_dismissUserNotificationWithToken:", v5);
}

- (void)_dismissUserNotificationWithToken:(id)a3
{
  dialogContextsByToken = self->_dialogContextsByToken;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](dialogContextsByToken, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
    [v7 dismissDialogWithContext:v6 options:0 completion:0];
  }

  -[NSMutableDictionary removeObjectForKey:](self->_dialogContextsByToken, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_displayedViewControllers, "removeObjectForKey:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_displayedWaitViewControllers, "removeObjectForKey:", v5);
}

- (void)_performActionForAlertController:(id)a3 invokeActionBlock:(id)a4 dismissControllerBlock:(id)a5
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = (void (**)(id, Block_layout *))a5;
  id v8 = sub_100084428();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100271DE8(v9);
  }

  if (v6) {
    v6[2](v6);
  }
  if (v7) {
    v7[2](v7, &stru_1003D1120);
  }
}

- (id)notificationFilter
{
  return self->_notificationFilter;
}

- (void)setNotificationFilter:(id)a3
{
}

- (NSMutableDictionary)displayedViewControllers
{
  return self->_displayedViewControllers;
}

- (void)setDisplayedViewControllers:(id)a3
{
}

- (NSMutableDictionary)dialogContextsByToken
{
  return self->_dialogContextsByToken;
}

- (void)setDialogContextsByToken:(id)a3
{
}

- (NSMutableDictionary)displayedWaitViewControllers
{
  return self->_displayedWaitViewControllers;
}

- (void)setDisplayedWaitViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end