@interface TVHShowSeasonLookupViewController
- (NSString)showTitle;
- (TVHKMediaEntityIdentifier)seasonIdentifier;
- (TVHKMediaEntityIdentifier)showIdentifier;
- (TVHShowSeasonLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (TVHShowSeasonLookupViewController)initWithShowIdentifier:(id)a3 mediaLibrary:(id)a4;
- (TVHShowSeasonLookupViewController)initWithShowTitle:(id)a3 seasonIdentifier:(id)a4 mediaLibrary:(id)a5;
- (TVHShowsDataStore)dataStore;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3;
- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5;
@end

@implementation TVHShowSeasonLookupViewController

- (TVHShowSeasonLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHShowSeasonLookupViewController)initWithShowIdentifier:(id)a3 mediaLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[TVHShowsDataStore initWithMediaLibrary:mode:]( objc_alloc(&OBJC_CLASS___TVHShowsDataStore),  "initWithMediaLibrary:mode:",  v8,  1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore fetchRequests](v9, "fetchRequests"));
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHShowSeasonLookupViewController;
  v11 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v13,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v8,  v10,  0LL,  0LL,  0LL);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_showIdentifier, a3);
    sub_10007F43C((id *)&v11->super.super.super.super.super.isa, v9);
  }

  return v11;
}

- (TVHShowSeasonLookupViewController)initWithShowTitle:(id)a3 seasonIdentifier:(id)a4 mediaLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[TVHShowsDataStore initWithMediaLibrary:mode:]( objc_alloc(&OBJC_CLASS___TVHShowsDataStore),  "initWithMediaLibrary:mode:",  v10,  1LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowsDataStore fetchRequests](v11, "fetchRequests"));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHShowSeasonLookupViewController;
  objc_super v13 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v17,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v10,  v12,  0LL,  0LL,  0LL);

  if (v13)
  {
    v14 = (NSString *)[v8 copy];
    showTitle = v13->_showTitle;
    v13->_showTitle = v14;

    objc_storeStrong((id *)&v13->_seasonIdentifier, a4);
    sub_10007F43C((id *)&v13->super.super.super.super.super.isa, v11);
  }

  return v13;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[TVHShowSeasonLookupViewController _updateDataStoreWithFetchControllerResultSet:]( self,  "_updateDataStoreWithFetchControllerResultSet:",  v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController dataStore](self, "dataStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 showsInfoCenter]);

  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_10007F8B4;
  v37 = sub_10007F8C4;
  id v38 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController showIdentifier](self, "showIdentifier"));
  if (v16)
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue([v15 showByIdentifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController showIdentifier](self, "showIdentifier"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 objectForKey:v18]);
    v20 = (void *)v34[5];
    v34[5] = v19;
  }

  else
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController showTitle](self, "showTitle"));
    if (!v17) {
      goto LABEL_6;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue([v15 showByIdentifier]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allValues]);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10007F8CC;
    v30[3] = &unk_1000FF648;
    id v17 = v17;
    id v31 = v17;
    v32 = &v33;
    [v22 enumerateObjectsUsingBlock:v30];

    v18 = v31;
  }

LABEL_6:
  if (v34[5])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController seasonIdentifier](self, "seasonIdentifier"));
    if (!v23) {
      v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v34[5] selectedSeasonIdentifier]);
    }
    v24 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
    v26 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v24,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v25,  @"ShowsFetchRequestIdentifier");

    v27 = objc_alloc(&OBJC_CLASS___TVHShowSeasonViewController);
    v28 = -[TVHShowSeasonViewController initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:]( v27,  "initWithShow:showsFetchContext:showsInfoCenter:seasonIdentifier:",  v34[5],  v26,  v15,  v23);
  }

  else
  {
    v28 = 0LL;
  }

  _Block_object_dispose(&v33, 8);
  return v28;
}

- (void)mediaEntitiesFetchViewController:(id)a3 updateContentViewController:(id)a4 withFetchControllerResultSet:(id)a5
{
}

- (void)_updateDataStoreWithFetchControllerResultSet:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonLookupViewController dataStore](self, "dataStore"));
  [v5 updateWithMediaEntitiesFetchControllerResultSet:v4];
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (TVHKMediaEntityIdentifier)showIdentifier
{
  return self->_showIdentifier;
}

- (TVHKMediaEntityIdentifier)seasonIdentifier
{
  return self->_seasonIdentifier;
}

- (TVHShowsDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
}

@end