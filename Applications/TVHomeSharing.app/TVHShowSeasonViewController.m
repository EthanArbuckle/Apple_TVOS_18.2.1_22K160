@interface TVHShowSeasonViewController
- (NSArray)seasons;
- (TVHKMediaEntitiesFetchContext)seasonsFetchContext;
- (TVHKMediaEntityCollection)selectedSeason;
- (TVHKMediaEntityCollection)show;
- (TVHKMediaEntityIdentifier)initialSeasonIdentifier;
- (TVHSeasonDetailsContainerViewController)seasonDetailsContainerViewController;
- (TVHShowSeasonPickerViewController)seasonPickerViewController;
- (TVHShowSeasonViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHShowSeasonViewController)initWithShow:(id)a3 showsFetchContext:(id)a4 showsInfoCenter:(id)a5 seasonIdentifier:(id)a6;
- (TVHShowsInfoCenter)showsInfoCenter;
- (id)_newSeasonDetailsViewController;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_dismissSeasonPicker;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)seasonDetailsViewController:(id)a3 didOverrideUserInterfaceStyle:(int64_t)a4;
- (void)seasonDetailsViewControllerDidSelectSeasonPicker:(id)a3;
- (void)setInitialSeasonIdentifier:(id)a3;
- (void)setSeasonDetailsContainerViewController:(id)a3;
- (void)setSeasonPickerViewController:(id)a3;
- (void)setSeasons:(id)a3;
- (void)setSelectedSeason:(id)a3;
- (void)setShow:(id)a3;
- (void)showSeasonPickerViewController:(id)a3 didSelectSeason:(id)a4;
@end

@implementation TVHShowSeasonViewController

- (TVHShowSeasonViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHShowSeasonViewController)initWithShow:(id)a3 showsFetchContext:(id)a4 showsInfoCenter:(id)a5 seasonIdentifier:(id)a6
{
  id v11 = a3;
  id obj = a5;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  4LL));
  [v16 setIdentifier:@"__ShowSeasonsFetchRequestIdentifier"];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_mediaEntityAlbumIdentifierPredicateWithIdentifier:",  v15));
  uint64_t v18 = TVHKCommonMediaEntityCollectionProperties([v16 setPredicate:v17]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v16 setProperties:v19];

  v20 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaLibrary]);
  v35 = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___TVHShowSeasonViewController;
  v23 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v34,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v21,  v22,  0LL,  v11,  v14);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_show, a3);
    objc_storeStrong((id *)&v23->_showsInfoCenter, obj);
    v24 = (TVHKMediaEntityIdentifier *)[v13 copy];
    initialSeasonIdentifier = v23->_initialSeasonIdentifier;
    v23->_initialSeasonIdentifier = v24;

    v26 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](v23, "fetchControllerIdentifier"));
    v28 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v26,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v27,  @"__ShowSeasonsFetchRequestIdentifier");
    seasonsFetchContext = v23->_seasonsFetchContext;
    v23->_seasonsFetchContext = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedStringForKey:@"NO_MOVIE_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v23, "setNoContentErrorMessage:", v31);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v23, "setDelegate:", v23);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v23,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v23;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  -[TVHShowSeasonViewController setShow:](self, "setShow:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 response]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaEntitiesResult]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaEntities]);

  -[TVHShowSeasonViewController setSeasons:](self, "setSeasons:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController initialSeasonIdentifier](self, "initialSeasonIdentifier"));
  if (!v15
    || (v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaEntityCollectionForIdentifier:fromMediaEntityCollections:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaEntityCollectionForIdentifier:fromMediaEntityCollections:",  v15,  v14)),  -[TVHShowSeasonViewController setInitialSeasonIdentifier:](self, "setInitialSeasonIdentifier:", 0LL),  !v16))
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v8 selectedSeasonIdentifier]);

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities bestMatchingMediaEntityCollectionForIdentifier:fromMediaEntityCollections:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "bestMatchingMediaEntityCollectionForIdentifier:fromMediaEntityCollections:",  v17,  v14));
    v15 = (void *)v17;
  }

  -[TVHShowSeasonViewController setSelectedSeason:](self, "setSelectedSeason:", v16);
  uint64_t v18 = objc_alloc_init(&OBJC_CLASS___TVHSeasonDetailsContainerViewController);
  -[TVHShowSeasonViewController setSeasonDetailsContainerViewController:]( self,  "setSeasonDetailsContainerViewController:",  v18);
  id v19 = -[TVHShowSeasonViewController _newSeasonDetailsViewController](self, "_newSeasonDetailsViewController");
  -[TVHSeasonDetailsContainerViewController setDetailsViewController:](v18, "setDetailsViewController:", v19);

  return v18;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "results", a3, a4));
  id v20 = (id)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v20 response]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesResult]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaEntities]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v20 changeSet]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntitiesChangeSet]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController selectedSeason](self, "selectedSeason"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[TVHMediaEntityUtilities mediaEntityCollectionForIdentifier:fromMediaEntityCollections:]( &OBJC_CLASS___TVHMediaEntityUtilities,  "mediaEntityCollectionForIdentifier:fromMediaEntityCollections:",  v13,  v9));
  if (v14)
  {
    v15 = (void *)v14;
    BOOL v16 = 0;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    BOOL v16 = v15 != 0LL;
  }

  -[TVHShowSeasonViewController setSelectedSeason:](self, "setSelectedSeason:", v15);
  -[TVHShowSeasonViewController setSeasons:](self, "setSeasons:", v9);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController seasonPickerViewController](self, "seasonPickerViewController"));
  [v17 updateSeasons:v9 changeSet:v11];

  if (v16)
  {
    id v18 = -[TVHShowSeasonViewController _newSeasonDetailsViewController](self, "_newSeasonDetailsViewController");
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVHShowSeasonViewController seasonDetailsContainerViewController]( self,  "seasonDetailsContainerViewController"));
    [v19 setDetailsViewController:v18];
  }
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withSourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
}

- (void)seasonDetailsViewController:(id)a3 didOverrideUserInterfaceStyle:(int64_t)a4
{
}

- (void)seasonDetailsViewControllerDidSelectSeasonPicker:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController seasons](self, "seasons", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController selectedSeason](self, "selectedSeason"));
  id v5 = [v10 indexOfObjectIdenticalTo:v4];

  v6 = objc_alloc(&OBJC_CLASS___TVHShowSeasonPickerViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController show](self, "show"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  id v9 = -[TVHShowSeasonPickerViewController initWithShow:seasons:mediaLibrary:]( v6,  "initWithShow:seasons:mediaLibrary:",  v7,  v10,  v8);

  -[TVHShowSeasonPickerViewController setIndexForPreferredFocusedSeason:](v9, "setIndexForPreferredFocusedSeason:", v5);
  -[TVHShowSeasonPickerViewController setOverrideUserInterfaceStyle:]( v9,  "setOverrideUserInterfaceStyle:",  -[TVHShowSeasonViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  -[TVHShowSeasonPickerViewController setDelegate:](v9, "setDelegate:", self);
  -[TVHShowSeasonViewController setSeasonPickerViewController:](self, "setSeasonPickerViewController:", v9);
  -[TVHShowSeasonViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v9,  1LL,  0LL);
}

- (void)showSeasonPickerViewController:(id)a3 didSelectSeason:(id)a4
{
  id v14 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController selectedSeason](self, "selectedSeason"));
  unsigned __int8 v6 = [v14 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc(&OBJC_CLASS___TVHShowSeasonViewController);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController show](self, "show"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController _showsFetchContext](self, "_showsFetchContext"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController showsInfoCenter](self, "showsInfoCenter"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);
    id v12 = -[TVHShowSeasonViewController initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:]( v7,  "initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:",  v8,  v9,  v10,  v11);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController navigationController](self, "navigationController"));
    [v13 pushViewController:v12 animated:1];
  }

  -[TVHShowSeasonViewController _dismissSeasonPicker](self, "_dismissSeasonPicker");
}

- (void)_dismissSeasonPicker
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController seasonPickerViewController](self, "seasonPickerViewController"));
  [v3 dismissViewControllerAnimated:1 completion:0];

  -[TVHShowSeasonViewController setSeasonPickerViewController:](self, "setSeasonPickerViewController:", 0LL);
}

- (id)_newSeasonDetailsViewController
{
  v3 = objc_alloc(&OBJC_CLASS___TVHSeasonDetailsViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController selectedSeason](self, "selectedSeason"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController seasonsFetchContext](self, "seasonsFetchContext"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController show](self, "show"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController _showsFetchContext](self, "_showsFetchContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonViewController showsInfoCenter](self, "showsInfoCenter"));
  id v9 = -[TVHSeasonDetailsViewController initWithSeason:seasonsFetchContext:show:showsFetchContext:showsInfoCenter:]( v3,  "initWithSeason:seasonsFetchContext:show:showsFetchContext:showsInfoCenter:",  v4,  v5,  v6,  v7,  v8);

  -[TVHSeasonDetailsViewController setSeasonDetailsDelegate:](v9, "setSeasonDetailsDelegate:", self);
  return v9;
}

- (TVHShowsInfoCenter)showsInfoCenter
{
  return self->_showsInfoCenter;
}

- (TVHKMediaEntitiesFetchContext)seasonsFetchContext
{
  return self->_seasonsFetchContext;
}

- (TVHKMediaEntityCollection)show
{
  return self->_show;
}

- (void)setShow:(id)a3
{
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void)setSeasons:(id)a3
{
}

- (TVHKMediaEntityCollection)selectedSeason
{
  return self->_selectedSeason;
}

- (void)setSelectedSeason:(id)a3
{
}

- (TVHKMediaEntityIdentifier)initialSeasonIdentifier
{
  return self->_initialSeasonIdentifier;
}

- (void)setInitialSeasonIdentifier:(id)a3
{
}

- (TVHSeasonDetailsContainerViewController)seasonDetailsContainerViewController
{
  return self->_seasonDetailsContainerViewController;
}

- (void)setSeasonDetailsContainerViewController:(id)a3
{
}

- (TVHShowSeasonPickerViewController)seasonPickerViewController
{
  return self->_seasonPickerViewController;
}

- (void)setSeasonPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end