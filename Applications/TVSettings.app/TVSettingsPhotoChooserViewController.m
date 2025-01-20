@interface TVSettingsPhotoChooserViewController
- (TVSettingsPhotoChooserFacade)facade;
- (TVSettingsPhotoChooserViewController)init;
- (TVSettingsPhotoChooserViewControllerSelectionDataSource)dataSource;
- (TVSettingsPhotoChooserViewControllerSelectionDelegate)delegate;
- (id)_localizedTitleForPhotoCollectionGroup:(id)a3;
- (id)loadSettingGroups;
- (id)title;
- (void)_didSelectSettingItem:(id)a3;
- (void)_launchAppForSettingItem:(id)a3;
- (void)controller:(id)a3 didSelectAsset:(id)a4 inCollection:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacade:(id)a3;
- (void)updatePhotoCollectionGroups;
@end

@implementation TVSettingsPhotoChooserViewController

- (TVSettingsPhotoChooserViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsPhotoChooserViewController;
  v2 = -[TVSettingsPhotoChooserViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsPhotoChooserFacade);
    facade = v2->_facade;
    v2->_facade = v3;
  }

  return v2;
}

- (void)updatePhotoCollectionGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoChooserViewController dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v3, "photoCollectionGroupsForController:") & 1) != 0) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 photoCollectionGroupsForController:self]);
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = (id)v4;
  -[TVSettingsPhotoChooserFacade setPhotoCollectionGroups:](self->_facade, "setPhotoCollectionGroups:", v4);
}

- (id)title
{
  return (id)TSKLocString(@"ChoosePhotosHeaderTitle");
}

- (id)loadSettingGroups
{
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100014710;
  v10 = &unk_10018ECE0;
  objc_copyWeak(&v11, &location);
  v3 = objc_retainBlock(&v7);
  -[TVSettingsPhotoChooserViewController updatePhotoCollectionGroups]( self,  "updatePhotoCollectionGroups",  v7,  v8,  v9,  v10);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  self->_facade,  @"photoCollectionGroups",  v3));
  [v4 setEnabledInStoreDemoMode:1];
  v13 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

- (void)controller:(id)a3 didSelectAsset:(id)a4 inCollection:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoChooserViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "controller:didSelectAsset:inCollection:collectionGroup:") & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 photoCollectionGroup]);
    [v10 controller:self didSelectAsset:v8 inCollection:v9 collectionGroup:v11];
  }
}

- (id)_localizedTitleForPhotoCollectionGroup:(id)a3
{
  return [a3 photoCollectionGroupName];
}

- (void)_didSelectSettingItem:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsPhotoChooserViewController delegate](self, "delegate"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 representedObject]);

  if ((objc_opt_respondsToSelector(v6, "controller:didSelectCollectionGroup:") & 1) != 0) {
    [v6 controller:self didSelectCollectionGroup:v5];
  }
}

- (void)_launchAppForSettingItem:(id)a3
{
  id v3 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 photoCollections]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 collectionIdentifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://PhotoPicker",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
  [v10 openURL:v9 withCompletionHandler:0];
}

- (TVSettingsPhotoChooserViewControllerSelectionDataSource)dataSource
{
  return (TVSettingsPhotoChooserViewControllerSelectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (TVSettingsPhotoChooserViewControllerSelectionDelegate)delegate
{
  return (TVSettingsPhotoChooserViewControllerSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSettingsPhotoChooserFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (void).cxx_destruct
{
}

@end