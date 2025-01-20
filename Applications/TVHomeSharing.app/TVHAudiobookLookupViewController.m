@interface TVHAudiobookLookupViewController
- (TVHAudiobookLookupViewController)initWithAudiobookIdentifier:(id)a3 mediaLibrary:(id)a4;
- (TVHAudiobookLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7;
- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6;
@end

@implementation TVHAudiobookLookupViewController

- (TVHAudiobookLookupViewController)initWithMediaLibrary:(id)a3 fetchRequests:(id)a4 mode:(unint64_t)a5 sourceMediaEntity:(id)a6 sourceMediaEntitiesFetchContext:(id)a7
{
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v9);

  return 0LL;
}

- (TVHAudiobookLookupViewController)initWithAudiobookIdentifier:(id)a3 mediaLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  8LL));
  uint64_t v9 = TVHKCommonMediaEntityCollectionProperties([v8 setIdentifier:@"AudiobookFetchRequestIdentifier"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setProperties:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_identifierPredicateWithIdentifier:]( &OBJC_CLASS___NSPredicate,  "tvhk_identifierPredicateWithIdentifier:",  v6));
  [v8 setPredicate:v11];

  v18 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHAudiobookLookupViewController;
  v13 = -[TVHMediaEntitiesFetchViewController initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:]( &v17,  "initWithMediaLibrary:fetchRequests:mode:sourceMediaEntity:sourceMediaEntitiesFetchContext:",  v7,  v12,  0LL,  0LL,  0LL);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"NO_AUDIOBOOK_FOUND_ERROR_MESSAGE" value:0 table:0]);

    -[TVHMediaEntitiesFetchViewController setNoContentErrorMessage:](v13, "setNoContentErrorMessage:", v15);
    -[TVHMediaEntitiesFetchViewController setDelegate:](v13, "setDelegate:", v13);
    -[TVHMediaEntitiesFetchViewController setEnableFetchingWhenViewFirstAppears:]( v13,  "setEnableFetchingWhenViewFirstAppears:",  1LL);
  }

  return v13;
}

- (id)mediaEntitiesFetchViewController:(id)a3 contentViewControllerWithFetchControllerResultSet:(id)a4 sourceMediaEntity:(id)a5 sourceMediaEntityBackgroundImageInfo:(id)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "tvh_firstMediaEntity", a3));
  v8 = objc_alloc(&OBJC_CLASS___TVHKMediaEntitiesFetchContext);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController fetchControllerIdentifier](self, "fetchControllerIdentifier"));
  v10 = -[TVHKMediaEntitiesFetchContext initWithFetchControllerIdentifier:fetchRequestIdentifier:]( v8,  "initWithFetchControllerIdentifier:fetchRequestIdentifier:",  v9,  @"AudiobookFetchRequestIdentifier");

  v11 = objc_alloc(&OBJC_CLASS___TVHAudiobookViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesFetchViewController mediaLibrary](self, "mediaLibrary"));
  v13 = -[TVHAudiobookViewController initWithAudiobook:mediaLibrary:audiobooksFetchContext:]( v11,  "initWithAudiobook:mediaLibrary:audiobooksFetchContext:",  v7,  v12,  v10);

  return v13;
}

@end