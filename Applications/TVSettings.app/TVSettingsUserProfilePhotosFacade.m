@interface TVSettingsUserProfilePhotosFacade
+ (id)_allSharingFilters;
- (BOOL)isSharedLibraryEnabled;
- (NSArray)sharingFilters;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (TVSPreferences)photosPreferences;
- (TVSettingsUserProfilePhotosFacade)init;
- (TVSettingsUserProfilePhotosSharingFilterItem)selectedSharingFilter;
- (void)_updateSharedLibraryEnabledState;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setSelectedSharingFilter:(id)a3;
- (void)setSelectedSharingFilterWithID:(id)a3;
- (void)setSharedLibraryEnabled:(BOOL)a3;
- (void)setSharingFilters:(id)a3;
@end

@implementation TVSettingsUserProfilePhotosFacade

- (TVSettingsUserProfilePhotosFacade)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosFacade;
  v2 = -[TVSettingsUserProfilePhotosFacade init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:]( &OBJC_CLASS___PXSharedLibraryStatusProvider,  "sharedLibraryStatusProviderWithPhotoLibrary:",  v3));
    sharedLibraryStatusProvider = v2->_sharedLibraryStatusProvider;
    v2->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedPhotosPreferences](&OBJC_CLASS___TVSPreferences, "sharedPhotosPreferences"));
    photosPreferences = v2->_photosPreferences;
    v2->_photosPreferences = (TVSPreferences *)v6;

    -[TVSettingsUserProfilePhotosFacade _updateSharedLibraryEnabledState](v2, "_updateSharedLibraryEnabledState");
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:]( v2->_sharedLibraryStatusProvider,  "registerChangeObserver:context:",  v2,  off_1001E0198);
  }

  return v2;
}

- (void)setSelectedSharingFilterWithID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade sharingFilters](self, "sharingFilters"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000A30C4;
  v13[3] = &unk_100192F68;
  id v12 = v4;
  id v14 = v12;
  id v6 = [v5 indexOfObjectPassingTest:v13];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade sharingFilters](self, "sharingFilters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v6]);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade photosPreferences](self, "photosPreferences"));
    objc_msgSend(v9, "setSelectedSharingFilter:", objc_msgSend(v8, "sharingFilter"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade photosPreferences](self, "photosPreferences"));
    [v10 synchronize];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade selectedSharingFilter](self, "selectedSharingFilter"));
    [v11 setSelected:0];

    [v8 setSelected:1];
    -[TVSettingsUserProfilePhotosFacade setSelectedSharingFilter:](self, "setSelectedSharingFilter:", v8);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 3) != 0)
  {
    v9[3] = v5;
    v9[4] = v6;
    if (off_1001E0198 == a5)
    {
      objc_initWeak(v9, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_1000A31A8;
      v7[3] = &unk_10018E810;
      objc_copyWeak(&v8, v9);
      dispatch_async(&_dispatch_main_q, v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(v9);
    }
  }

- (void)_updateSharedLibraryEnabledState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider"));
  id v4 = [v3 hasSharedLibraryOrPreview];

  if ((_DWORD)v4 != -[TVSettingsUserProfilePhotosFacade isSharedLibraryEnabled](self, "isSharedLibraryEnabled"))
  {
    -[TVSettingsUserProfilePhotosFacade setSharedLibraryEnabled:](self, "setSharedLibraryEnabled:", v4);
    if ((_DWORD)v4)
    {
      id v5 = [(id)objc_opt_class(self) _allSharingFilters];
      id v11 = (id)objc_claimAutoreleasedReturnValue(v5);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade photosPreferences](self, "photosPreferences"));
      id v7 = [v6 selectedSharingFilterWithDefaultValue:3];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000A333C;
      v12[3] = &unk_100192F88;
      v12[4] = v7;
      id v8 = [v11 indexOfObjectPassingTest:v12];
      if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v8]);
        -[TVSettingsUserProfilePhotosFacade setSelectedSharingFilter:](self, "setSelectedSharingFilter:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUserProfilePhotosFacade selectedSharingFilter](self, "selectedSharingFilter"));
        [v10 setSelected:1];
      }

      -[TVSettingsUserProfilePhotosFacade setSharingFilters:](self, "setSharingFilters:", v11);
    }

    else
    {
      -[TVSettingsUserProfilePhotosFacade setSelectedSharingFilter:](self, "setSelectedSharingFilter:", 0LL);
      -[TVSettingsUserProfilePhotosFacade setSharingFilters:](self, "setSharingFilters:", 0LL);
    }
  }

+ (id)_allSharingFilters
{
  v2 = objc_alloc(&OBJC_CLASS___TVSettingsUserProfilePhotosSharingFilterItem);
  uint64_t v3 = TSKLocString(@"PhotosSharingFilterBothTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[TVSettingsUserProfilePhotosSharingFilterItem initWithSharingFilter:localizedName:]( v2,  "initWithSharingFilter:localizedName:",  3LL,  v4);
  id v6 = objc_alloc(&OBJC_CLASS___TVSettingsUserProfilePhotosSharingFilterItem);
  uint64_t v7 = TSKLocString(@"PhotosSharingFilterPrivateTitle");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = -[TVSettingsUserProfilePhotosSharingFilterItem initWithSharingFilter:localizedName:]( v6,  "initWithSharingFilter:localizedName:",  1LL,  v8,  v5);
  v16[1] = v9;
  v10 = objc_alloc(&OBJC_CLASS___TVSettingsUserProfilePhotosSharingFilterItem);
  uint64_t v11 = TSKLocString(@"PhotosSharingFilterSharedTitle");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[TVSettingsUserProfilePhotosSharingFilterItem initWithSharingFilter:localizedName:]( v10,  "initWithSharingFilter:localizedName:",  2LL,  v12);
  v16[2] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));

  return v14;
}

- (NSArray)sharingFilters
{
  return self->_sharingFilters;
}

- (void)setSharingFilters:(id)a3
{
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (TVSPreferences)photosPreferences
{
  return self->_photosPreferences;
}

- (BOOL)isSharedLibraryEnabled
{
  return self->_sharedLibraryEnabled;
}

- (void)setSharedLibraryEnabled:(BOOL)a3
{
  self->_sharedLibraryEnabled = a3;
}

- (TVSettingsUserProfilePhotosSharingFilterItem)selectedSharingFilter
{
  return self->_selectedSharingFilter;
}

- (void)setSelectedSharingFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end