@interface MTTVMusicMPArtworkCatalogLoader
+ (id)sharedInstance;
- (id)_identifierForMPModelObject:(id)a3;
- (id)_loadArtworkForMPObject:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
@end

@implementation MTTVMusicMPArtworkCatalogLoader

+ (id)sharedInstance
{
  if (qword_1002B6C18 != -1) {
    dispatch_once(&qword_1002B6C18, &stru_1002454E0);
  }
  return (id)qword_1002B6C20;
}

- (id)imageKeyForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_stringByRemovingCharactersInSet:", v7));

    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MPIdentifier_%@", v8);
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MPModelObject);
    if ((objc_opt_isKindOfClass(v4, v10) & 1) == 0)
    {
      v12 = 0LL;
      goto LABEL_7;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicMPArtworkCatalogLoader _identifierForMPModelObject:]( self,  "_identifierForMPModelObject:",  v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_MD5String"));

    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MPObject_%@", v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(v9);

LABEL_7:
  return v12;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a7;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    double width = 600.0;
    double height = 600.0;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
    {
      v20 = 0LL;
LABEL_26:

      goto LABEL_27;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v15]);
    if ((objc_opt_respondsToSelector(v17, "longLongValue") & 1) == 0
      || (id v18 = [v17 longLongValue]) == 0)
    {
      v20 = 0LL;
LABEL_25:

      goto LABEL_26;
    }

    id v19 = v18;
    v20 = (void *)objc_opt_new(&OBJC_CLASS___MPModelLibraryRequest);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100121534;
    v42[3] = &unk_100245500;
    v42[4] = v19;
    v21 = -[MPIdentifierSet initWithBlock:](objc_alloc(&OBJC_CLASS___MPIdentifierSet), "initWithBlock:", v42);
    v48 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL));
    [v20 setAllowedItemIdentifiers:v22];

    if ([v15 isEqualToString:@"tvEpisode"])
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
      [v20 setItemKind:v23];

      uint64_t v47 = MPModelPropertyTVEpisodeArtwork;
      v24 = &v47;
    }

    else if ([v15 isEqualToString:@"movie"])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
      [v20 setItemKind:v28];

      uint64_t v46 = MPModelPropertyMovieArtwork;
      v24 = &v46;
    }

    else if ([v15 isEqualToString:@"tvShow"])
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVSeason kindWithEpisodeKind:]( &OBJC_CLASS___MPModelTVSeason,  "kindWithEpisodeKind:",  v29));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVShow kindWithSeasonKind:](&OBJC_CLASS___MPModelTVShow, "kindWithSeasonKind:", v30));
      [v20 setItemKind:v31];

      uint64_t v45 = MPModelPropertyTVShowArtwork;
      v24 = &v45;
    }

    else
    {
      if (([v15 isEqualToString:@"song"] & 1) == 0
        && ([v15 isEqualToString:@"musicVideo"] & 1) == 0
        && ![v15 isEqualToString:@"songsAndMusicVideos"])
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v33));
        [v20 setItemKind:v36];

        uint64_t v43 = MPModelPropertyAlbumArtwork;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v34));
        [v20 setItemProperties:v37];

LABEL_23:
LABEL_24:
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_100121540;
        v38[3] = &unk_100245528;
        v38[4] = self;
        double v40 = width;
        double v41 = height;
        id v39 = v12;
        [v20 performWithResponseHandler:v38];

        goto LABEL_25;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
      [v20 setItemKind:v32];

      uint64_t v44 = MPModelPropertySongArtwork;
      v24 = &v44;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 1LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v33));
    [v20 setItemProperties:v34];
    goto LABEL_23;
  }

  uint64_t v25 = objc_opt_class(&OBJC_CLASS___MPModelGenericObject);
  if ((objc_opt_isKindOfClass(v11, v25) & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 flattenedGenericObject]);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 anyObject]);

    id v11 = (id)v27;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicMPArtworkCatalogLoader _loadArtworkForMPObject:scaleToSize:completionHandler:]( self,  "_loadArtworkForMPObject:scaleToSize:completionHandler:",  v11,  v12,  width,  height));
LABEL_27:

  return v20;
}

- (id)_loadArtworkForMPObject:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector(v8, "artworkCatalog") & 1) == 0
    || (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog])) == 0)
  {
    if ((objc_opt_respondsToSelector(v8, "tracksTiledArtworkCatalogWithRows:columns:") & 1) != 0) {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 tracksTiledArtworkCatalogWithRows:2 columns:2]);
    }
    else {
      uint64_t v10 = 0LL;
    }
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10012179C;
  v18[3] = &unk_100240580;
  id v11 = v9;
  id v19 = v11;
  id v12 = objc_retainBlock(v18);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPArtworkCatalog);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v14 scale];
    objc_msgSend(v10, "setDestinationScale:");

    if (height > 0.0 && width > 0.0) {
      objc_msgSend(v10, "setFittingSize:", width, height);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001218D4;
    v16[3] = &unk_100240580;
    v17 = v12;
    [v10 requestImageWithCompletionHandler:v16];
  }

  else
  {

    ((void (*)(void *, void))v12[2])(v12, 0LL);
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)_identifierForMPModelObject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);

  if ([v5 deviceLibraryPersistentID])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v5 deviceLibraryPersistentID]));
    [v4 appendFormat:@"|1|%@", v6];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 globalPlaylistID]);
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 globalPlaylistID]);
    [v4 appendFormat:@"|2|%@", v9];
  }

  if ([v5 storeAdamID])
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v5 storeAdamID]));
    [v4 appendFormat:@"|3|%@", v10];
  }

  if ([v5 storeCloudID])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v5 storeCloudID]));
    [v4 appendFormat:@"|4|%@", v11];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 storeCloudAlbumID]);
  id v13 = [v12 length];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 storeCloudAlbumID]);
    [v4 appendFormat:@"|5|%@", v14];
  }

  if ([v5 storePurchasedAdamID])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v5 storePurchasedAdamID]));
    [v4 appendFormat:@"|6|%@", v15];
  }

  if ([v5 storeSubscriptionAdamID])
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v5 storeSubscriptionAdamID]));
    [v4 appendFormat:@"|7|%@", v16];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 radioStationHash]);

  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 radioStationHash]);
    [v4 appendFormat:@"|8|%@", v18];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItemID]);
  id v20 = [v19 length];

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItemID]);
    [v4 appendFormat:@"|9|%@", v21];
  }

  id v22 = [v4 copy];

  return v22;
}

@end