@interface FKASceneDelegate
- (UIWindow)interactiveWindow;
- (UIWindow)nonInteractiveWindow;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation FKASceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIWindowScene);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 delegate]);

    id v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 screen]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 displayIdentity]);
    id v14 = [v13 type];

    if (v14 == (id)8)
    {
      uint64_t v16 = FKALogCommon(v15);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Skipping UIWindowScene because it belongs to Oneness.app",  v34,  2u);
      }
    }

    else
    {
      v19 = (UIWindow *)[[AXUIDaemonWindow alloc] initWithWindowScene:v11];
      v20 = objc_alloc(&OBJC_CLASS___FKARootViewController);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 screen]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 displayConfiguration]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 hardwareIdentifier]);
      v24 = -[FKARootViewController initWithDelegate:displayUUID:](v20, "initWithDelegate:displayUUID:", v10, v23);
      -[UIWindow setRootViewController:](v19, "setRootViewController:", v24);

      -[UIWindow makeKeyAndVisible](v19, "makeKeyAndVisible");
      interactiveWindow = self->_interactiveWindow;
      self->_interactiveWindow = v19;
      v26 = v19;

      v27 = (UIWindow *)[[AXUIDaemonNonInteractiveWindow alloc] initWithWindowScene:v11];
      v28 = objc_alloc(&OBJC_CLASS___FKARootNonInteractiveViewController);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 screen]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 displayConfiguration]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 hardwareIdentifier]);
      v32 = -[FKARootViewController initWithDelegate:displayUUID:](v28, "initWithDelegate:displayUUID:", v10, v31);

      -[UIWindow setRootViewController:](v27, "setRootViewController:", v32);
      -[UIWindow setWindowLevel:](v27, "setWindowLevel:", UIWindowLevelNormal + 1.0);
      -[UIWindow setHidden:](v27, "setHidden:", 0LL);
      nonInteractiveWindow = self->_nonInteractiveWindow;
      self->_nonInteractiveWindow = v27;
    }
  }

  else
  {
    uint64_t v18 = FKALogCommon(isKindOfClass);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000117A8((uint64_t)v6, v10);
    }
  }
}

- (UIWindow)interactiveWindow
{
  return self->_interactiveWindow;
}

- (UIWindow)nonInteractiveWindow
{
  return self->_nonInteractiveWindow;
}

- (void).cxx_destruct
{
}

@end