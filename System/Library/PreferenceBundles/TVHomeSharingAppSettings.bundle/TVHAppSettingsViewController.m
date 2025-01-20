@interface TVHAppSettingsViewController
+ (id)_movieCoverArtShapeModeFormatter;
+ (id)_showsCoverArtShapeModeFormatter;
- (TSKPreviewViewController)appPreviewViewController;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)setAppPreviewViewController:(id)a3;
@end

@implementation TVHAppSettingsViewController

- (id)loadSettingGroups
{
  v42 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  v4 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[TVHAppSettingsFacade sharedInstance](&OBJC_CLASS___TVHAppSettingsFacade, "sharedInstance"));
  id v6 = [(id)objc_opt_class(self) _movieCoverArtShapeModeFormatter];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"MOVIE_COVER_ART_SHAPE_TITLE" value:0 table:0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"MOVIE_COVER_ART_SHAPE_DESCRIPTION" value:0 table:0]);
  v38 = (void *)v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v9,  v11,  v5,  @"movieCoverArtShape",  0LL,  0LL));

  v41 = v7;
  [v12 setLocalizedValueFormatter:v7];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 inputs]);
  [v12 setAvailableValues:v13];

  v14 = v4;
  [v4 addObject:v12];
  id v15 = [(id)objc_opt_class(self) _showsCoverArtShapeModeFormatter];
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"SHOWS_COVER_ART_SHAPE_TITLE" value:0 table:0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"SHOWS_COVER_ART_SHAPE_DESCRIPTION" value:0 table:0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v18,  v20,  v5,  @"showCoverArtShape",  0LL,  0LL));

  v40 = v16;
  [v21 setLocalizedValueFormatter:v16];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v16 inputs]);
  [v21 setAvailableValues:v22];

  v23 = v14;
  [v14 addObject:v21];
  id v24 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:@"COVER_ART_TITLE" value:0 table:0]);
  id v27 = [v24 initWithTitle:v26];

  v39 = v27;
  [v27 setSettingItems:v14];
  [v42 addObject:v27];
  [v14 removeAllObjects];
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"DISCOVER_DAAP_SERVERS_TITLE" value:0 table:0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedStringForKey:@"YES_TITLE" value:0 table:0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 localizedStringForKey:@"NO_TITLE" value:0 table:0]);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v29,  0LL,  v38,  @"discoveringDAAPServers",  v31,  v33));

  [v23 addObject:v34];
  id v35 = [[TSKSettingGroup alloc] initWithTitle:0];
  [v35 setSettingItems:v23];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_28B4;
  v43[3] = &unk_8418;
  id v44 = v38;
  id v36 = v38;
  [v35 setUpdateBlock:v43];
  [v42 addObject:v35];

  return v42;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_appPreviewViewController)
  {
    uint64_t v5 = (TSKPreviewViewController *)[[TSKAppIconPreviewViewController alloc] initWithApplicationBundleIdentifier:@"com.apple.TVHomeSharing"];
    appPreviewViewController = self->_appPreviewViewController;
    self->_appPreviewViewController = v5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));
  -[TSKPreviewViewController setDescriptionText:](self->_appPreviewViewController, "setDescriptionText:", v7);
  v8 = self->_appPreviewViewController;

  return v8;
}

+ (id)_movieCoverArtShapeModeFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"COVER_ART_SHAPE_AUTO_TITLE" value:0 table:0]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"COVER_ART_SHAPE_WIDE_TITLE" value:0 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"COVER_ART_SHAPE_POSTER_TITLE" value:0 table:0]);

  id v8 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v12[0] = v3;
  v12[1] = v5;
  v12[2] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  id v10 = [v8 initWithInputs:&off_8E20 outputs:v9];

  return v10;
}

+ (id)_showsCoverArtShapeModeFormatter
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"COVER_ART_SHAPE_AUTO_TITLE" value:0 table:0]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"COVER_ART_SHAPE_WIDE_TITLE" value:0 table:0]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.TVHomeSharingAppSettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"COVER_ART_SHAPE_SQUARE_TITLE" value:0 table:0]);

  id v8 = objc_alloc(&OBJC_CLASS___TSKMappingFormatter);
  v12[0] = v3;
  v12[1] = v5;
  v12[2] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  id v10 = [v8 initWithInputs:&off_8E38 outputs:v9];

  return v10;
}

- (TSKPreviewViewController)appPreviewViewController
{
  return self->_appPreviewViewController;
}

- (void)setAppPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end