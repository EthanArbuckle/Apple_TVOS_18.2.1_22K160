@interface SceneDelegate
- (BOOL)_isWindowSceneExternalDisplay:(id)a3;
- (NSString)sceneClientIdentifier;
- (UIWindow)window;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setSceneClientIdentifier:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userActivities]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 anyObject]);

  v13 = (NSString *)objc_claimAutoreleasedReturnValue([v12 activityType]);
  sceneClientIdentifier = self->_sceneClientIdentifier;
  self->_sceneClientIdentifier = v13;

  buf[0] = 0;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___AppDelegate);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 delegate]);
  uint64_t v18 = __UIAccessibilityCastAsClass(v15, v17, 1LL, buf);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  if (buf[0]) {
    abort();
  }
  if (self->_sceneClientIdentifier) {
    [v19 setPreferredSceneAttemptCount:0];
  }
  else {
    [v19 setDefaultSceneAttemptCount:0];
  }
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___UIWindowScene);
  if ((objc_opt_isKindOfClass(v8, v20) & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 screen]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 displayIdentity]);
    id v23 = [v22 type];

    if (v23 == (id)8)
    {
      uint64_t v24 = AXLogUI();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Skipping UIWindowScene because it belongs to Oneness.app",  buf,  2u);
      }

      goto LABEL_27;
    }

    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AXUIServiceManager sharedServiceManager]( &OBJC_CLASS___AXUIServiceManager,  "sharedServiceManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v8 screen]);
    unsigned int v34 = [v33 _isEmbeddedScreen];

    if (v34)
    {
      uint64_t v35 = AXLogUI();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_sceneClientIdentifier;
        *(_DWORD *)buf = 134218242;
        id v50 = v8;
        __int16 v51 = 2112;
        v52 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "willConnect scene: %p sceneClientIdentifier: %@",  buf,  0x16u);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s displayManager](v25, "displayManager"));
      [v38 _windowSceneConnected:v8 forSceneClientIdentifier:self->_sceneClientIdentifier];
    }

    else
    {
      if (!-[SceneDelegate _isWindowSceneExternalDisplay:](self, "_isWindowSceneExternalDisplay:", v8))
      {
LABEL_20:
        v42 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);

        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
          v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"AXUIServerPreferredLevelKey"]);

          if (v44)
          {
            [v44 floatValue];
            double v46 = v45;
          }

          else
          {
            double v46 = 10000002.0;
          }
        }

        else
        {
          double v46 = 10000002.0;
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue([v8 _FBSScene]);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_1000044BC;
        v48[3] = &unk_100008350;
        *(double *)&v48[4] = v46;
        [v47 updateClientSettingsWithBlock:v48];

        goto LABEL_27;
      }

      uint64_t v39 = AXLogUI();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_sceneClientIdentifier;
        *(_DWORD *)buf = 134218242;
        id v50 = v8;
        __int16 v51 = 2112;
        v52 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "willConnect external scene: %p sceneClientIdentifier: %@",  buf,  0x16u);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s displayManager](v25, "displayManager"));
      [v38 _externalDisplaySceneConnected:v8 forSceneClientIdentifier:self->_sceneClientIdentifier];
    }

    goto LABEL_20;
  }

  uint64_t v26 = AXLogUI();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100004BD4((uint64_t)v8, v25, v27, v28, v29, v30, v31, v32);
  }
LABEL_27:
}

- (BOOL)_isWindowSceneExternalDisplay:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 session]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 role]);
  if ([v5 isEqualToString:UIWindowSceneSessionRoleApplication])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 _FBSScene]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 displayIdentity]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v17 rootIdentity]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 displayIdentity]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 rootIdentity]);
    if ([v8 isEqual:v11])
    {
      LOBYTE(v12) = 0;
    }

    else
    {
      v16 = v7;
      v13 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 screen]);
      unsigned int v12 = [v14 _isEmbeddedScreen] ^ 1;

      v6 = v13;
      v7 = v16;
    }
  }

  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIWindowScene);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIServiceManager sharedServiceManager](&OBJC_CLASS___AXUIServiceManager, "sharedServiceManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 screen]);
    unsigned int v8 = [v7 _isEmbeddedScreen];

    if (v8)
    {
      uint64_t v9 = AXLogUI();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        sceneClientIdentifier = self->_sceneClientIdentifier;
        int v23 = 134218242;
        id v24 = v4;
        __int16 v25 = 2112;
        uint64_t v26 = sceneClientIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "didDisconnect scene: %p sceneClientIdentifier: %@",  (uint8_t *)&v23,  0x16u);
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 displayManager]);
      [v12 _windowSceneDisconnected:v4 forSceneClientIdentifier:self->_sceneClientIdentifier];
LABEL_12:

      goto LABEL_13;
    }

    if (-[SceneDelegate _isWindowSceneExternalDisplay:](self, "_isWindowSceneExternalDisplay:", v4))
    {
      uint64_t v20 = AXLogUI();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_sceneClientIdentifier;
        int v23 = 134218242;
        id v24 = v4;
        __int16 v25 = 2112;
        uint64_t v26 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "didDisconnect external scene: %p sceneClientIdentifier: %@",  (uint8_t *)&v23,  0x16u);
      }

      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 displayManager]);
      [v12 _externalDisplaySceneDisconnected:v4 forSceneClientIdentifier:self->_sceneClientIdentifier];
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v13 = AXLogUI();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_100004BD4((uint64_t)v4, (os_log_s *)v6, v14, v15, v16, v17, v18, v19);
    }
  }

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (NSString)sceneClientIdentifier
{
  return self->_sceneClientIdentifier;
}

- (void)setSceneClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end