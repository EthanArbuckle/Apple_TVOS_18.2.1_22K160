@interface TVSettingsAmbientPhotoSourceMenuItem
- (BOOL)isMusicAlbumsOption;
- (BOOL)isMyPhotosOption;
- (BOOL)isNavigating;
- (BOOL)isSlideshowOption;
- (TVSettingsAmbientPhotoSourceMenuItem)initWithPhotoSourceModel:(id)a3;
- (int64_t)photosSetupOptions;
@end

@implementation TVSettingsAmbientPhotoSourceMenuItem

- (TVSettingsAmbientPhotoSourceMenuItem)initWithPhotoSourceModel:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVSettingsAmbientPhotoSourceMenuItem;
  v5 = -[TVSettingsAmbientItem initWithModel:](&v34, "initWithModel:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 source]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %@", v7, v8));
    identifier = v5->super.super._identifier;
    v5->super.super._identifier = (NSString *)v9;

    v5->super._selected = [v4 isSelected];
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 selectedValue]);
    selectedValue = v5->super._selectedValue;
    v5->super._selectedValue = (NSString *)v11;

    v5->_isMyPhotosOption = [v4 isMyPhotosCategory];
    v5->_isSlideshowOption = [v4 isSlideshowCategory];
    v5->_isMusicAlbumsOption = [v4 isMusicAlbums];
    unint64_t v13 = (unint64_t)[v4 traits];
    BOOL v14 = (TVISPhotoSourceOptionTraitICloudPhotos & v13) != 0;
    unint64_t v15 = (unint64_t)[v4 traits];
    uint64_t v16 = (TVISPhotoSourceOptionTraitSharedAlbums & v15) != 0 ? v14 | 2 : v14;
    v5->_photosSetupOptions = v16;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___TVISPhotoSourceCollectionType);
    if ((objc_opt_isKindOfClass(v4, v17) & 1) != 0)
    {
      v5->_isNavigating = 1;
      id v18 = v4;
      v19 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      v29 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 collections]);
      id v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          v24 = 0LL;
          do
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = -[TVSettingsAmbientPhotoSourceMenuItem initWithPhotoSourceModel:]( objc_alloc(&OBJC_CLASS___TVSettingsAmbientPhotoSourceMenuItem),  "initWithPhotoSourceModel:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)v24));
            objc_storeWeak((id *)&v25->super._parentMenuItem, v5);
            -[NSMutableArray addObject:](v19, "addObject:", v25);

            v24 = (char *)v24 + 1;
          }

          while (v22 != v24);
          id v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }

        while (v22);
      }

      v26 = (NSArray *)-[NSMutableArray copy](v19, "copy");
      childItems = v5->super._childItems;
      v5->super._childItems = v26;
    }
  }

  return v5;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)isMyPhotosOption
{
  return self->_isMyPhotosOption;
}

- (BOOL)isMusicAlbumsOption
{
  return self->_isMusicAlbumsOption;
}

- (BOOL)isSlideshowOption
{
  return self->_isSlideshowOption;
}

- (int64_t)photosSetupOptions
{
  return self->_photosSetupOptions;
}

@end