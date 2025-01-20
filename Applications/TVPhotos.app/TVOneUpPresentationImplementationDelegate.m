@interface TVOneUpPresentationImplementationDelegate
- (BOOL)oneUpPresentation:(id)a3 startWithConfigurationHandler:(id)a4;
- (PXOneUpPresentation)presentation;
- (id)previewViewControllerForOneUpPresentation:(id)a3 allowingActions:(BOOL)a4;
- (id)stateChangeHandler;
- (void)oneUpPresentation:(id)a3 commitPreviewViewController:(id)a4;
- (void)oneUpPresentation:(id)a3 didDismissPreviewViewController:(id)a4 committing:(BOOL)a5;
- (void)oneUpPresentation:(id)a3 registerStateChangeHandler:(id)a4;
- (void)photoLibraryOneUpControllerWillPop:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setStateChangeHandler:(id)a3;
@end

@implementation TVOneUpPresentationImplementationDelegate

- (BOOL)oneUpPresentation:(id)a3 startWithConfigurationHandler:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    -[TVOneUpPresentationImplementationDelegate setPresentation:](self, "setPresentation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataSourceManager]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 initialAssetReference]);
    if (!v7) {
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 dataSourceManager]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataSource]);
    v10 = v9;
    if (v9)
    {
      [v9 indexPathForAssetReference:v7];
    }

    else
    {
      __int128 v46 = 0u;
      __int128 v47 = 0u;
    }

    if ((void)v46 != PXDataSourceIdentifierNull)
    {
      __int128 v44 = v46;
      __int128 v45 = v47;
      v12 = (void *)objc_claimAutoreleasedReturnValue([v43 assetAtItemIndexPath:&v44]);
      __int128 v44 = v46;
      __int128 v45 = v47;
      uint64_t v14 = PXIndexPathFromSimpleIndexPath(&v44);
      v13 = +[UIApplication sharedApplication]( &OBJC_CLASS___UIApplication,  "sharedApplication",  objc_claimAutoreleasedReturnValue(v14));
    }

    else
    {
LABEL_8:
      v12 = 0LL;
      v13 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication", 0LL);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 delegate]);

    uint64_t v18 = objc_opt_class(&OBJC_CLASS___TVPhotosAppDelegate, v17);
    if (v18 && (objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
      id v19 = v16;
    }
    else {
      id v19 = 0LL;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 window]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 rootViewController]);

    uint64_t v23 = objc_opt_class(&OBJC_CLASS___TVPNavigationController, v22);
    if (v23 && (objc_opt_isKindOfClass(v21, v23) & 1) != 0) {
      id v24 = v21;
    }
    else {
      id v24 = 0LL;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 topViewController]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryTabViewController, v26);
    if (v27 && (objc_opt_isKindOfClass(v25, v27) & 1) != 0) {
      id v28 = v25;
    }
    else {
      id v28 = 0LL;
    }

    if ([v19 isPhotoPickerModeEnabled]
      && v28
      && (v29 = (void *)objc_claimAutoreleasedReturnValue([v28 selectedViewController]),
          uint64_t v31 = objc_opt_class(&OBJC_CLASS___TVPPhotosUIViewController, v30),
          char isKindOfClass = objc_opt_isKindOfClass(v29, v31),
          v29,
          (isKindOfClass & 1) != 0))
    {
      v33 = (TVPPhotoLibraryOneUpViewController *)objc_claimAutoreleasedReturnValue([v28 selectedViewController]);
      [v19 photoPickerViewController:v33 selectedPhotoAsset:v12];
      BOOL v11 = 0;
      v34 = v42;
    }

    else
    {
      v35 = objc_alloc(&OBJC_CLASS___TVPPhotoLibraryOneUpViewController);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v12 photoLibrary]);
      v33 = -[TVPPhotoLibraryOneUpViewController initWithPhotoLibrary:](v35, "initWithPhotoLibrary:", v36);

      -[TVPPhotoLibraryOneUpViewController setDelegate:](v33, "setDelegate:", self);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v43 photosDataSource]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 assetCollectionForSection:0]);
      -[TVPPhotoLibraryOneUpViewController setAssetCollection:](v33, "setAssetCollection:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue([v43 photosDataSource]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 assetsInSection:0]);
      -[TVPPhotoLibraryOneUpViewController setAssetsFetchResult:](v33, "setAssetsFetchResult:", v40);

      v34 = v42;
      -[TVPPhotoLibraryOneUpViewController setSelectedAssetIndex:]( v33,  "setSelectedAssetIndex:",  [v42 row]);
      if ([v12 playbackStyle] == (id)4) {
        -[TVPPhotoLibraryOneUpViewController setStartVideoPlaybackOnLoad:](v33, "setStartVideoPlaybackOnLoad:", 1LL);
      }
      BOOL v11 = 1;
      [v24 pushViewController:v33 animated:1];
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)oneUpPresentation:(id)a3 registerStateChangeHandler:(id)a4
{
  id v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E424;
  v8[3] = &unk_1000C9C30;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVOneUpPresentationImplementationDelegate stateChangeHandler](self, "stateChangeHandler"));
  id v10 = v5;
  id v6 = v5;
  id v7 = v9;
  -[TVOneUpPresentationImplementationDelegate setStateChangeHandler:](self, "setStateChangeHandler:", v8);
}

- (void)oneUpPresentation:(id)a3 didDismissPreviewViewController:(id)a4 committing:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v10 handleFailureInMethod:a2 object:self file:@"TVOneUpPresentationImplementationDelegate.m" lineNumber:100 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)oneUpPresentation:(id)a3 commitPreviewViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v9 handleFailureInMethod:a2 object:self file:@"TVOneUpPresentationImplementationDelegate.m" lineNumber:105 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)photoLibraryOneUpControllerWillPop:(id)a3
{
  id v4 = a3;
  presentation = self->_presentation;
  if (presentation)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PXOneUpPresentation delegate](presentation, "delegate"));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PXOneUpPresentation dataSourceManager](self->_presentation, "dataSourceManager"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dataSource]);

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 photosDataSource]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetCollectionForSection:0]);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedAsset]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 indexPathForAsset:v11 inCollection:v10]);

      v13 = (void *)objc_claimAutoreleasedReturnValue([v9 assetReferenceAtIndexPath:v12]);
      [v6 oneUpPresentation:self->_presentation scrollAssetReferenceToVisible:v13];
    }

    else
    {
      uint64_t v14 = PLUIGetLog();
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_presentation;
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Calling the photoLibraryOneUpControllerWillPop: method with no presentation delegate: %@",  (uint8_t *)&v16,  0xCu);
      }
    }
  }
}

- (id)previewViewControllerForOneUpPresentation:(id)a3 allowingActions:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v7 handleFailureInMethod:a2 object:self file:@"TVOneUpPresentationImplementationDelegate.m" lineNumber:127 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (PXOneUpPresentation)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
}

- (id)stateChangeHandler
{
  return self->_stateChangeHandler;
}

- (void)setStateChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end