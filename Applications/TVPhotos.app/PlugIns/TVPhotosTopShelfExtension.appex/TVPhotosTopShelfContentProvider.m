@interface TVPhotosTopShelfContentProvider
- (BOOL)_isAuthenticatedToSharedAlbums;
- (BOOL)_isAuthenticatedToiCPL;
- (NSUserDefaults)tvPhotosUserDefaults;
- (TVPhotosTopShelfContentProvider)init;
- (TVPhotosTopShelfMemoryManager)memoryManager;
- (id)_titleForPrimaryAction;
- (id)_titleForPrimaryActionDetail;
- (id)_urlForPrimaryAction;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7;
- (void)setTvPhotosUserDefaults:(id)a3;
@end

@implementation TVPhotosTopShelfContentProvider

- (TVPhotosTopShelfContentProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfContentProvider;
  v2 = -[TVPhotosTopShelfContentProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVPhotosTopShelfMemoryManager);
    memoryManager = v2->_memoryManager;
    v2->_memoryManager = v3;
  }

  return v2;
}

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if (-[TVPhotosTopShelfContentProvider _isAuthenticatedToiCPL](self, "_isAuthenticatedToiCPL"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfContentProvider tvPhotosUserDefaults](self, "tvPhotosUserDefaults"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"MemoriesContentEnabled"]);

    if (v6 && ([v6 BOOLValue] & 1) == 0)
    {
      v4[2](v4, 0LL);
    }

    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager fetchMemoryItems](self->_memoryManager, "fetchMemoryItems"));
      if ([v7 count])
      {
        id v36 = v6;
        v37 = (void (**)(void, id))v4;
        v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        if ([v7 count])
        {
          unint64_t v9 = 0LL;
          do
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v9, v36));
            id v11 = objc_alloc(&OBJC_CLASS___TVTopShelfCarouselItem);
            v12 = (void *)objc_claimAutoreleasedReturnValue([v10 memoryIdentifier]);
            id v13 = [v11 initWithIdentifier:v12];

            v14 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
            [v13 setTitle:v14];

            v15 = (void *)objc_claimAutoreleasedReturnValue([v10 subtitle]);
            [v13 setContextTitle:v15];

            id v16 = [[TVTopShelfPresentViewServiceAction alloc] initWithViewServiceBundleIdentifier:@"com.apple.TVPhotos" viewControllerClassName:@"TVPhotosTopShelfViewServiceViewController"];
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"PHOTOS_TOP_SHELF_PRIMARY_BUTTON_TEXT" value:&stru_100008398 table:0]);
            [v16 _setTitle:v18];

            [v13 setPlayAction:v16];
            v19 = (void *)objc_claimAutoreleasedReturnValue([v10 keyAssetIdentifier]);
            [v13 _setPhotosAssetIdentifier:v19];

            -[NSMutableArray addObject:](v8, "addObject:", v13);
            ++v9;
          }

          while ((unint64_t)[v7 count] > v9);
        }

        id v20 = objc_alloc(&OBJC_CLASS___TVTopShelfCarouselContent);
        id v21 = [v20 initWithStyle:TVTopShelfCarouselContentStyleActionsPhotos items:v8];
        v4 = (void (**)(id, void))v37;
        v37[2](v37, v21);

        id v6 = v36;
      }

      else
      {
        v4[2](v4, 0LL);
      }
    }

    goto LABEL_15;
  }

  if ((_os_feature_enabled_impl("TVSettings", "iCloudPhotosEducation") & 1) != 0)
  {
    id v22 = objc_alloc(&OBJC_CLASS___TVTopShelfCarouselItem);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);
    id v6 = [v22 initWithIdentifier:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 URLForResource:@"TopShelfPH_Photos_FSFallback" withExtension:@"tiff"]);

    [v6 setImageURL:v26 forTraits:1];
    [v6 setImageURL:v26 forTraits:2];
    id v27 = objc_alloc(&OBJC_CLASS___TVTopShelfCustomAction);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfContentProvider _urlForPrimaryAction](self, "_urlForPrimaryAction"));
    id v29 = [v27 initWithURL:v28];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfContentProvider _titleForPrimaryAction](self, "_titleForPrimaryAction"));
    [v29 _setTitle:v30];

    [v29 _setImageName:0];
    [v6 setPlayAction:v29];
    v31 = (void *)objc_claimAutoreleasedReturnValue( -[TVPhotosTopShelfContentProvider _titleForPrimaryActionDetail]( self,  "_titleForPrimaryActionDetail"));
    [v6 _setTermsAndConditionsText:v31];

    id v32 = objc_alloc(&OBJC_CLASS___TVTopShelfCarouselContent);
    uint64_t v33 = TVTopShelfCarouselContentStyleActionsTeachingMoment;
    id v38 = v6;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    id v35 = [v32 initWithStyle:v33 items:v34];

    ((void (**)(id, id))v4)[2](v4, v35);
LABEL_15:

    goto LABEL_16;
  }

  v4[2](v4, 0LL);
LABEL_16:
}

- (NSUserDefaults)tvPhotosUserDefaults
{
  tvPhotosUserDefaults = self->_tvPhotosUserDefaults;
  if (!tvPhotosUserDefaults)
  {
    v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.TVPhotos");
    v5 = self->_tvPhotosUserDefaults;
    self->_tvPhotosUserDefaults = v4;

    tvPhotosUserDefaults = self->_tvPhotosUserDefaults;
  }

  return tvPhotosUserDefaults;
}

- (BOOL)_isAuthenticatedToiCPL
{
  else {
    return -[TVPhotosTopShelfMemoryManager isCloudPhotoLibraryEnabled]( self->_memoryManager,  "isCloudPhotoLibraryEnabled");
  }
}

- (BOOL)_isAuthenticatedToSharedAlbums
{
  else {
    return -[TVPhotosTopShelfMemoryManager isSharedAlbumsEnabled](self->_memoryManager, "isSharedAlbumsEnabled");
  }
}

- (id)_titleForPrimaryAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager primaryAccountUsername](self->_memoryManager, "primaryAccountUsername"));
  id v3 = [v2 length];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v5 = v4;
  if (v3) {
    id v6 = @"PHOTOS_TOP_SHELF_SETUP_PRIMARY_USER_BUTTON_TEXT";
  }
  else {
    id v6 = @"PHOTOS_TOP_SHELF_SETUP_PRIMARY_NO_USER_BUTTON_TEXT";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100008398 table:0]);

  return v7;
}

- (id)_titleForPrimaryActionDetail
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager primaryAccountUsername](self->_memoryManager, "primaryAccountUsername"));
  id v4 = [v3 length];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"PHOTOS_TOP_SHELF_SETUP_PRIMARY_UESR_DETAIL_TEXT" value:&stru_100008398 table:0]);

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVPhotosTopShelfMemoryManager primaryAccountUsername]( self->_memoryManager,  "primaryAccountUsername"));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "localizedStringWithValidatedFormat:validFormatSpecifiers:error:",  v7,  @"%@",  0LL,  v8));

    id v6 = (void *)v7;
  }

  else
  {
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"PHOTOS_TOP_SHELF_SETUP_PRIMARY_NO_USER_DETAIL_TEXT" value:&stru_100008398 table:0]);
  }

  return v9;
}

- (id)_urlForPrimaryAction
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager primaryAccountUsername](self->_memoryManager, "primaryAccountUsername"));
  if (![v3 length])
  {

    goto LABEL_5;
  }

  unsigned __int8 v4 = -[TVPhotosTopShelfContentProvider _isAuthenticatedToSharedAlbums](self, "_isAuthenticatedToSharedAlbums");

  if ((v4 & 1) != 0)
  {
LABEL_5:
    v5 = @"prefs:root=USERS&primaryUser=true&action=setUpiCloudPhotos";
    return (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  }

  v5 = @"com.apple.TVPhotos://open";
  return (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
}

- (void)performCustomActionWithURL:(id)a3 actionUserInfo:(id)a4 forItemWithIdentifier:(id)a5 itemUserInfo:(id)a6 completionHandler:(id)a7
{
  v8 = (void (**)(id, id))a7;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v13 = 0LL;
  [v10 openSensitiveURL:v9 withOptions:0 error:&v13];

  uint64_t v11 = v13;
  id v12 = objc_alloc_init(&OBJC_CLASS___TVTopShelfActionResult);
  [v12 setSuccess:v11 != 0];
  v8[2](v8, v12);
}

- (TVPhotosTopShelfMemoryManager)memoryManager
{
  return self->_memoryManager;
}

- (void)setTvPhotosUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end