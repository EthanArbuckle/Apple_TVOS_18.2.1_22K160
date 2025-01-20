@interface XBApplicationSnapshotManifest
- (id)pb_createSnapshotForSceneSnapshot:(id)a3 withName:(id)a4;
@end

@implementation XBApplicationSnapshotManifest

- (id)pb_createSnapshotForSceneSnapshot:(id)a3 withName:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 context]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneID]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneWithIdentifier:v8]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[XBApplicationSnapshotManifest createSnapshotWithGroupID:](self, "createSnapshotWithGroupID:", v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[XBApplicationSnapshot normalizeSnapshotName:]( &OBJC_CLASS___XBApplicationSnapshot,  "normalizeSnapshotName:",  v6));
    [v11 setName:v12];

    if ([v7 orientation] == (id)1)
    {
      [v11 setInterfaceOrientation:1];
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
      objc_msgSend(v11, "setInterfaceOrientation:", objc_msgSend(v13, "interfaceOrientation"));
    }

    [v7 frame];
    objc_msgSend(v11, "setReferenceSize:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
    [v16 frame];
    double v18 = v17;
    double v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v10 settings]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 displayConfiguration]);
    [v22 bounds];
    BOOL v25 = v20 == v24 && v18 == v23;
    [v11 setFullScreen:v25];

    [v11 setContentType:0];
    v26 = (void *)objc_claimAutoreleasedReturnValue([v7 expirationDate]);
    [v11 setExpirationDate:v26];

    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 clientSettings]);
    if ([v27 isUISubclass])
    {
      id v28 = objc_alloc_init(&OBJC_CLASS___XBMutableStatusBarSettings);
      objc_msgSend(v28, "setHidden:", objc_msgSend(v27, "statusBarHidden"));
      objc_msgSend(v28, "setStyle:", objc_msgSend(v27, "statusBarStyle"));
      [v11 setStatusBarSettings:v28];
      objc_msgSend(v11, "setBackgroundStyle:", objc_msgSend(v27, "backgroundStyle"));
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

@end