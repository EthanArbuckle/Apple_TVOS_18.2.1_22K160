@interface PBNowPlayingSystemOverlayUIProvider
- (NSString)preferredBundleIdentifier;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)setPreferredBundleIdentifier:(id)a3;
@end

@implementation PBNowPlayingSystemOverlayUIProvider

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBNowPlayingSystemOverlayUIProvider preferredBundleIdentifier](self, "preferredBundleIdentifier"));
  if (!v5
    || ((v6 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary")),
         v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedApplicationWithBundleIdentifier:v5]),
         v6,
         ![v7 supportsActiveRouteNowPlaying])
      ? (v8 = 0LL)
      : (v8 = v7),
        id v9 = v8,
        v7,
        !v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
    id v11 = [v10 nowPlayingProcessPID];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 processForPID:v11]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 applicationInfo]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleIdentifier]);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v16 installedApplicationWithBundleIdentifier:v15]);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingViewControllerClassName]);

  if (v17)
  {
    id v18 = v7;
    if (v18)
    {
LABEL_9:
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 nowPlayingViewControllerClassName]);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100171EF8;
      v26[3] = &unk_1003DA040;
      id v27 = v4;
      id v21 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  v20,  v19,  v26);

      goto LABEL_15;
    }
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationLibrary](&OBJC_CLASS___PineBoard, "sharedApplicationLibrary"));
    id v18 = (id)objc_claimAutoreleasedReturnValue([v22 installedApplicationWithBundleIdentifier:@"com.apple.TVNowPlayingService"]);

    if (v18) {
      goto LABEL_9;
    }
  }

  if (v4)
  {
    id v23 = sub_1000F721C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Could not load now playing UI, no eligible now playing view service",  v25,  2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }

- (NSString)preferredBundleIdentifier
{
  return self->_preferredBundleIdentifier;
}

- (void)setPreferredBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end