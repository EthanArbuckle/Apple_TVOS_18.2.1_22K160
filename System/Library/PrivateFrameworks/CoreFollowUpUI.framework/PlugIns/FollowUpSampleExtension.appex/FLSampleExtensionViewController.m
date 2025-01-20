@interface FLSampleExtensionViewController
- (void)_appeared;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation FLSampleExtensionViewController

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100002DBC;
  v6[3] = &unk_100004150;
  id v7 = objc_alloc_init(&OBJC_CLASS___FLFollowUpController);
  id v8 = v3;
  id v4 = v3;
  id v5 = v7;
  [v5 pendingFollowUpItemsWithCompletion:v6];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, uint64_t))a5;
  uint64_t v12 = ((uint64_t (*)(void))_FLLogSystem)();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Extension processing item: %@ action: %@",  buf,  0x16u);
  }

  objc_storeStrong((id *)&self->_activeItem, a3);
  objc_storeStrong((id *)&self->_activeAction, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  unsigned int v15 = [v14 isEqualToString:@"com.followup.clear_notification_action"];

  if (v15)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___FLFollowUpController);
    [v16 clearNotificationForItem:v9 error:0];
LABEL_7:
    v11[2](v11, 1LL);

    goto LABEL_15;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  unsigned int v18 = [v17 isEqualToString:@"com.followup.clear_item_action"];

  if (v18)
  {
    id v16 = objc_alloc_init(&OBJC_CLASS___FLFollowUpController);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v9 uniqueIdentifier]);
    v25 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    [v16 clearPendingFollowUpItemsWithUniqueIdentifiers:v20 error:0];

    goto LABEL_7;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v10 label]);
  unsigned int v22 = [v21 isEqualToString:@"ADDED LATER"];

  if (v22)
  {
    [v10 _loadActionURL];
LABEL_14:
    v11[2](v11, 1LL);
    goto LABEL_15;
  }

  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v23 = _FLLogSystem(+[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 1.0));
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Extension processed item %@", buf, 0xCu);
  }

  v11[2](v11, 0LL);
LABEL_15:
}

- (void)_appeared
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpAction label](self->_activeAction, "label"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[FLFollowUpAction eventSource](self->_activeAction, "eventSource")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Dismiss - %@ - %@",  v3,  v4));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003454;
  v11[3] = &unk_100004178;
  v11[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[FLAlertControllerAction actionWithTitle:style:handler:]( &OBJC_CLASS___FLAlertControllerAction,  "actionWithTitle:style:handler:",  v5,  0LL,  v11));
  uint64_t v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v8 = [v7 mutableCopy];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpAction identifier](self->_activeAction, "identifier"));
  LODWORD(v4) = [v9 isEqualToString:@"com.followup.crash"];

  if ((_DWORD)v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[FLAlertControllerAction actionWithTitle:style:handler:]( &OBJC_CLASS___FLAlertControllerAction,  "actionWithTitle:style:handler:",  @"Crash",  2LL,  &stru_1000041B8));
    [v8 addObject:v10];
  }

  +[FLAlertControllerHelper presentAlertWithTitle:message:actions:presentingController:]( &OBJC_CLASS___FLAlertControllerHelper,  "presentAlertWithTitle:message:actions:presentingController:",  @"Extension Alert",  @"We are running in extension process now",  v8,  self);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FLSampleExtensionViewController;
  -[FLSampleExtensionViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[FLSampleExtensionViewController _appeared](self, "_appeared");
}

- (void).cxx_destruct
{
}

@end