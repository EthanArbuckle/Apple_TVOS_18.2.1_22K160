@interface TVMusicMPArtworkCatalogLoader
+ (id)sharedInstance;
- (id)_identifierForMPModelObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)_loadArtworkForMPObject:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5;
@end

@implementation TVMusicMPArtworkCatalogLoader

+ (id)sharedInstance
{
  if (qword_1002BEB58 != -1) {
    dispatch_once(&qword_1002BEB58, &stru_10026D160);
  }
  return (id)qword_1002BEB60;
}

- (id)imageKeyForObject:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tvs_stringByRemovingCharactersInSet:", v9));

    v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MPIdentifier_%@", v10);
  }

  else
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPModelObject, v7);
    if ((objc_opt_isKindOfClass(v4, v12) & 1) == 0)
    {
      v14 = 0LL;
      goto LABEL_7;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPArtworkCatalogLoader _identifierForMPModelObject:]( self,  "_identifierForMPModelObject:",  v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tvs_SHA1String"));

    v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MPObject_%@", v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(v11);

LABEL_7:
  return v14;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  id v14 = a8;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    double width = 600.0;
    double height = 600.0;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13);
  if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
  {
    v65 = self;
    v67 = v14;
    id v12 = v12;
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
    id v18 = [v17 countByEnumeratingWithState:&v89 objects:v103 count:16];
    if (!v18) {
      goto LABEL_51;
    }
    id v19 = v18;
    uint64_t v20 = *(void *)v90;
    uint64_t v63 = MPModelPropertyArtistArtwork;
    uint64_t v62 = MPModelPropertyPlaylistArtwork;
    uint64_t v61 = MPModelPropertyPlaylistTracksTiledArtwork;
    uint64_t v64 = MPModelPropertyAlbumArtwork;
    v21 = &MPModelPropertyTVShowEpisodeCount_ptr;
    uint64_t v66 = MPModelPropertySongArtwork;
    uint64_t v68 = MPModelPropertyTVShowArtwork;
    uint64_t v70 = MPModelPropertyMovieArtwork;
    uint64_t v71 = MPModelPropertyTVEpisodeArtwork;
    v69 = v17;
    id v73 = v12;
    while (1)
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v90 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v23, v61, v62));
        uint64_t v26 = objc_opt_class(v21[285], v25);
        if ((objc_opt_isKindOfClass(v23, v26) & 1) != 0 && (objc_opt_respondsToSelector(v24, "longLongValue") & 1) != 0)
        {
          id v27 = v23;
          id v28 = [v24 longLongValue];
          if (v28)
          {
            id v72 = v28;
            v29 = objc_opt_new(&OBJC_CLASS___MPModelLibraryRequest);
            id v74 = v27;
            if ([v27 isEqualToString:@"tvEpisode"])
            {
              v30 = v17;
              v31 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVEpisode kindWithVariants:]( &OBJC_CLASS___MPModelTVEpisode,  "kindWithVariants:",  2LL));
              uint64_t v102 = v71;
              v32 = &v102;
              goto LABEL_16;
            }

            if ([v27 isEqualToString:@"movie"])
            {
              v30 = v17;
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
              uint64_t v101 = v70;
              v32 = &v101;
              goto LABEL_16;
            }

            if ([v27 isEqualToString:@"tvShow"])
            {
              v35 = v29;
              v37 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVEpisode kindWithVariants:]( &OBJC_CLASS___MPModelTVEpisode,  "kindWithVariants:",  2LL));
              v38 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVSeason kindWithEpisodeKind:]( &OBJC_CLASS___MPModelTVSeason,  "kindWithEpisodeKind:",  v37));
              v31 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVShow kindWithSeasonKind:]( &OBJC_CLASS___MPModelTVShow,  "kindWithSeasonKind:",  v38));

              v30 = v69;
              uint64_t v100 = v68;
              v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v100,  1LL));
              v34 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v33));
              v36 = v35;
              goto LABEL_17;
            }

            if (([v27 isEqualToString:@"song"] & 1) == 0
              && ([v27 isEqualToString:@"musicVideo"] & 1) == 0
              && ![v27 isEqualToString:@"songsAndMusicVideos"])
            {
              if ([v27 isEqualToString:@"album"])
              {
                v30 = v17;
                v42 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
                v31 = (void *)objc_claimAutoreleasedReturnValue([v42 itemKind]);

                uint64_t v98 = v64;
                v32 = &v98;
LABEL_16:
                v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v32,  1LL));
                v34 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v33));
                v35 = v29;
                v36 = v29;
LABEL_17:
                -[MPModelLibraryRequest setItemProperties:](v36, "setItemProperties:", v34);
                goto LABEL_18;
              }

              if ([v27 isEqualToString:@"playlist"])
              {
                if (+[TVMusicLibraryUtilities playlistFolderExistsWithPersistentID:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "playlistFolderExistsWithPersistentID:",  v72))
                {
                  id v43 = sub_100030470(10LL, 1uLL);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
                  if (v44)
                  {
                    v58 = v44;
                    v79[0] = _NSConcreteStackBlock;
                    v79[1] = 3221225472LL;
                    v79[2] = sub_1000A2E40;
                    v79[3] = &unk_100269CD8;
                    id v80 = v44;
                    id v81 = v67;
                    v59 = v79;
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 3221225472LL;
                    block[2] = sub_1000A3770;
                    block[3] = &unk_100268D60;
                    id v94 = v59;
                    v60 = v58;
                    dispatch_async(&_dispatch_main_q, block);

                    v29 = v60;
                    goto LABEL_50;
                  }

                  v31 = 0LL;
                  if (v29)
                  {
LABEL_49:
                    v53 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withPersistentID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withPersistentID:",  v31,  v72));
                    v95 = v53;
                    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v95,  1LL));
                    -[MPModelLibraryRequest setAllowedItemIdentifiers:](v29, "setAllowedItemIdentifiers:", v54);

                    -[MPModelLibraryRequest setItemKind:](v29, "setItemKind:", v31);
                    v75[0] = _NSConcreteStackBlock;
                    v75[1] = 3221225472LL;
                    v75[2] = sub_1000A2EB4;
                    v75[3] = &unk_10026D188;
                    v75[4] = v65;
                    double v77 = width;
                    double v78 = height;
                    id v76 = v67;
                    -[MPModelLibraryRequest performWithResponseHandler:](v29, "performWithResponseHandler:", v75);

                    id v12 = v73;
LABEL_50:

                    goto LABEL_51;
                  }

                  goto LABEL_19;
                }

                v45 = v29;
                v33 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:",  0LL));
                v31 = (void *)objc_claimAutoreleasedReturnValue([v33 itemKind]);
                v97[0] = v62;
                v97[1] = v61;
                v46 = v97;
                uint64_t v47 = 2LL;
              }

              else
              {
                if (![v27 isEqualToString:@"artist"])
                {

                  v31 = 0LL;
                  goto LABEL_19;
                }

                v45 = v29;
                v33 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory artistsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "artistsLibraryRequest"));
                v31 = (void *)objc_claimAutoreleasedReturnValue([v33 itemKind]);
                uint64_t v96 = v63;
                v46 = &v96;
                uint64_t v47 = 1LL;
              }

              v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v46,  v47));
              v48 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v34));
              v35 = v45;
              -[MPModelLibraryRequest setItemProperties:](v45, "setItemProperties:", v48);

              goto LABEL_31;
            }

            uint64_t v39 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"containerID"]);
            if (v39)
            {
              v40 = (void *)v39;
              v41 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"songIndex"]);

              if (v41)
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
                v57 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"containerID"]);
                v82[0] = _NSConcreteStackBlock;
                v82[1] = 3221225472LL;
                v82[2] = sub_1000A2C00;
                v82[3] = &unk_10026D1B0;
                v83 = (MPModelLibraryRequest *)v12;
                v84 = v65;
                double v87 = width;
                double v88 = height;
                v85 = v29;
                id v86 = v67;
                [v56 getResponseForIdentifier:v57 completion:v82];

                v29 = v83;
                v17 = v69;
                goto LABEL_50;
              }
            }

            v31 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
            uint64_t v99 = v66;
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v99,  1LL));
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v33));
            v35 = v29;
            -[MPModelLibraryRequest setItemProperties:](v29, "setItemProperties:", v34);
LABEL_31:
            v30 = v69;
LABEL_18:

            v29 = v35;
            v17 = v30;
            id v27 = v74;
            if (v35) {
              goto LABEL_49;
            }
LABEL_19:

            v21 = &MPModelPropertyTVShowEpisodeCount_ptr;
            id v12 = v73;
          }
        }

        v22 = (char *)v22 + 1;
      }

      while (v19 != v22);
      id v49 = [v17 countByEnumeratingWithState:&v89 objects:v103 count:16];
      id v19 = v49;
      if (!v49)
      {
LABEL_51:

        id v14 = v67;
        goto LABEL_52;
      }
    }
  }

  uint64_t v50 = objc_opt_class(&OBJC_CLASS___MPModelGenericObject, v16);
  if ((objc_opt_isKindOfClass(v12, v50) & 1) != 0)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue([v12 flattenedGenericObject]);
    uint64_t v52 = objc_claimAutoreleasedReturnValue([v51 anyObject]);

    id v12 = (id)v52;
  }

  -[TVMusicMPArtworkCatalogLoader _loadArtworkForMPObject:scaleToSize:completionHandler:]( self,  "_loadArtworkForMPObject:scaleToSize:completionHandler:",  v12,  v14,  width,  height);
LABEL_52:

  return v12;
}

- (void)_loadArtworkForMPObject:(id)a3 scaleToSize:(CGSize)a4 completionHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  if ((objc_opt_respondsToSelector(v8, "artworkCatalog") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog]);
    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }

  if ((objc_opt_respondsToSelector(v8, "anyObject") & 1) == 0
    || (v11 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]),
        v10 = (void *)objc_claimAutoreleasedReturnValue([v11 artworkCatalog]),
        v11,
        !v10))
  {
LABEL_6:
    if ((objc_opt_respondsToSelector(v8, "tracksTiledArtworkCatalogWithRows:columns:") & 1) != 0) {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 tracksTiledArtworkCatalogWithRows:2 columns:2]);
    }
    else {
      v10 = 0LL;
    }
  }

- (id)_identifierForMPModelObject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 library]);
  id v7 = [v6 persistentID];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 library]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 persistentID]));
    [v4 appendFormat:@"|1|%@", v9];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 globalPlaylistID]);
  id v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 globalPlaylistID]);
    [v4 appendFormat:@"|2|%@", v14];
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v16 = [v15 adamID];

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v17 adamID]));
    [v4 appendFormat:@"|3|%@", v18];
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 personalizedStore]);
  id v20 = [v19 cloudID];

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v5 personalizedStore]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v21 cloudID]));
    [v4 appendFormat:@"|4|%@", v22];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 personalizedStore]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 cloudAlbumID]);
  id v25 = [v24 length];

  if (v25)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 personalizedStore]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 cloudAlbumID]);
    [v4 appendFormat:@"|5|%@", v27];
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v29 = [v28 purchasedAdamID];

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v30 purchasedAdamID]));
    [v4 appendFormat:@"|6|%@", v31];
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v33 = [v32 subscriptionAdamID];

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v34 subscriptionAdamID]));
    [v4 appendFormat:@"|7|%@", v35];
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 radio]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 stationHash]);

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v5 radio]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 stationHash]);
    [v4 appendFormat:@"|8|%@", v39];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItemID]);
  id v41 = [v40 length];

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v5 contentItemID]);
    [v4 appendFormat:@"|9|%@", v42];
  }

  id v43 = [v4 copy];

  return v43;
}

@end