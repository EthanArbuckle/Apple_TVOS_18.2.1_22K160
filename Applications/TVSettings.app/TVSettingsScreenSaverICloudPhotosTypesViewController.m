@interface TVSettingsScreenSaverICloudPhotosTypesViewController
- (TSKListSettingGroup)photoCollectionSettingGroup;
- (id)loadSettingGroups;
- (id)title;
- (void)selectedItem:(id)a3;
@end

@implementation TVSettingsScreenSaverICloudPhotosTypesViewController

- (id)title
{
  return (id)TSKLocString(@"SaverStyleMyPhotosPageTitle");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005CA60;
  v9[3] = &unk_100190290;
  objc_copyWeak(&v11, &location);
  id v4 = v3;
  id v10 = v4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  v4,  @"iCloudPhotosAvailablePhotoCollectionGroups",  v9));
  self = (TVSettingsScreenSaverICloudPhotosTypesViewController *)((char *)self + 16);
  v6 = *(void **)self->super.TSKViewController_opaque;
  *(void *)self->super.TSKViewController_opaque = v5;

  uint64_t v13 = *(void *)self->super.TSKViewController_opaque;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)selectedItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 representedObject]);
  if (v4)
  {
    id v18 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsScreenSaverFacade sharedInstance]( &OBJC_CLASS___TVSettingsScreenSaverFacade,  "sharedInstance"));
    if (v18 == (id)qword_1001E22F8)
    {
      if (([v5 primaryUseriCloudPhotoLibraryEnabled] & 1) == 0)
      {
        -[TVSettingsScreenSaverTypesViewController _goToPhotoSettingsIfPossible](self, "_goToPhotoSettingsIfPossible");
        goto LABEL_10;
      }

      uint64_t v10 = TSKLocString(@"iCloudPhotoSyncingAlertTitle");
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = TSKLocString(@"iCloudPhotoSyncingAlertDescription");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v8 = (TVSettingsScreenSaverPhotoCollectionsViewController *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  v13,  1LL));

      uint64_t v14 = TSKLocString(@"iCloudPhotoSyncingAlertButtonTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  0LL));
      -[TVSettingsScreenSaverPhotoCollectionsViewController addAction:](v8, "addAction:", v16);

      -[TVSettingsScreenSaverICloudPhotosTypesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v8,  1LL,  0LL);
      [v5 setIdleScreenSaverType:TVISScreenSaverTypeMemory];
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v18 photoCollections]);
      id v7 = [v6 count];

      if ((unint64_t)v7 < 2)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v18 photoCollections]);
        v8 = (TVSettingsScreenSaverPhotoCollectionsViewController *)objc_claimAutoreleasedReturnValue([v17 firstObject]);

        [v5 setSelectedPhotoCollection:v8];
      }

      else
      {
        v8 = -[TVSettingsScreenSaverPhotoCollectionsViewController initWithPhotoCollectionGroup:]( objc_alloc(&OBJC_CLASS___TVSettingsScreenSaverPhotoCollectionsViewController),  "initWithPhotoCollectionGroup:",  v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsScreenSaverICloudPhotosTypesViewController navigationController]( self,  "navigationController"));
        [v9 pushViewController:v8 animated:1];
      }
    }

LABEL_10:
    id v4 = v18;
  }
}

- (TSKListSettingGroup)photoCollectionSettingGroup
{
  return self->_photoCollectionSettingGroup;
}

- (void).cxx_destruct
{
}

@end