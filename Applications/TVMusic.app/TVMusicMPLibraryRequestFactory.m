@interface TVMusicMPLibraryRequestFactory
+ (id)TVEpisodeLibraryRequestWithAdamID:(int64_t)a3;
+ (id)TVEpisodesLibraryRequestForShow:(id)a3 season:(id)a4;
+ (id)TVSeasonsLibraryRequestForShow:(id)a3;
+ (id)TVShowsAndMoviesLibraryRequest;
+ (id)TVShowsLibraryRequest;
+ (id)_albumsLibraryRequestWithVariants:(unint64_t)a3;
+ (id)_playlistsLibraryRequestWithParentPlaylistFolder:(id)a3 variants:(unint64_t)a4 options:(unint64_t)a5;
+ (id)albumsLibraryRequest;
+ (id)albumsLibraryRequestForArtist:(id)a3;
+ (id)artistsLibraryRequest;
+ (id)compilationsLibraryRequest;
+ (id)composersLibraryRequest;
+ (id)genresLibraryRequest;
+ (id)moviesLibraryRequest;
+ (id)musicVideosLibraryRequest;
+ (id)personalizedMixPlaylists;
+ (id)playlistsLibraryRequestWithParentPlaylistFolder:(id)a3;
+ (id)playlistsLibraryRequestWithParentPlaylistFolder:(id)a3 userEditableOnly:(BOOL)a4 allowEmptyPlaylists:(BOOL)a5;
+ (id)propertySetForAlbumDetails;
+ (id)propertySetForMovie;
+ (id)propertySetForSongsInContextMenu;
+ (id)propertySetForSongsWithDetails:(BOOL)a3;
+ (id)propertySetForTVEpisode;
+ (id)recentlyAddedlibraryRequest;
+ (id)songsAndMusicVideosLibraryRequestForContextMenu;
+ (id)songsLibraryRequest;
+ (id)songsLibraryRequestForAlbum:(id)a3;
+ (id)songsLibraryRequestForAlbumDetails;
+ (id)songsLibraryRequestForArtist:(id)a3;
+ (id)songsLibraryRequestForContextMenu;
+ (id)songsLibraryRequestForContextMenuWithPlaylist:(id)a3;
+ (id)songsLibraryRequestForPlaylist:(id)a3;
+ (id)songsLibraryRequestWithPlaylist:(id)a3 songProperties:(id)a4;
@end

@implementation TVMusicMPLibraryRequestFactory

+ (id)recentlyAddedlibraryRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v3 = [v2 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed];

  v4 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  -[MPModelLibraryRequest setMediaLibrary:](v4, "setMediaLibrary:", v5);

  unsigned int v64 = v3;
  v67 = v4;
  if (v3 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
    v93 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v93, 1LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v7));

    uint64_t v9 = MPModelRelationshipGenericAlbum;
    v91[0] = MPModelRelationshipGenericAlbum;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v10));
    v92[0] = v11;
    uint64_t v12 = MPModelRelationshipGenericPlaylist;
    v91[1] = MPModelRelationshipGenericPlaylist;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:]( &OBJC_CLASS___MPModelPlaylist,  "kindWithVariants:playlistEntryKind:options:",  87LL,  v8,  4LL));
    v92[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  2LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject kindWithRelationshipKinds:]( &OBJC_CLASS___MPModelGenericObject,  "kindWithRelationshipKinds:",  v14));
    -[MPModelLibraryRequest setItemKind:](v4, "setItemKind:", v15);

    uint64_t v65 = MPModelRelationshipGenericTVSeason;
    uint64_t v66 = MPModelRelationshipGenericMovie;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    v90[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
    v90[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
    v90[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 3LL));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v19));

    uint64_t v9 = MPModelRelationshipGenericAlbum;
    v88[0] = MPModelRelationshipGenericAlbum;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v20));
    v89[0] = v21;
    uint64_t v22 = MPModelRelationshipGenericPlaylist;
    v88[1] = MPModelRelationshipGenericPlaylist;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:]( &OBJC_CLASS___MPModelPlaylist,  "kindWithVariants:playlistEntryKind:options:",  87LL,  v62,  4LL));
    v89[1] = v23;
    uint64_t v65 = MPModelRelationshipGenericTVSeason;
    v88[2] = MPModelRelationshipGenericTVSeason;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v24));
    v89[2] = v25;
    uint64_t v66 = MPModelRelationshipGenericMovie;
    v88[3] = MPModelRelationshipGenericMovie;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
    v89[3] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  4LL));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject kindWithRelationshipKinds:]( &OBJC_CLASS___MPModelGenericObject,  "kindWithRelationshipKinds:",  v27));
    -[MPModelLibraryRequest setItemKind:](v67, "setItemKind:", v28);

    uint64_t v12 = v22;
    v4 = v67;
  }

  v86[0] = v9;
  v86[1] = v12;
  v87[0] = MPModelPropertyAlbumLibraryAddedDate;
  v87[1] = MPModelPropertyPlaylistLibraryAddedDate;
  v86[2] = v65;
  v86[3] = v66;
  v87[2] = MPModelPropertyTVSeasonLibraryAddedDate;
  v87[3] = MPModelPropertyMovieLibraryAddedDate;
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  4LL));
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[MPMultiSortDescriptor sortDescriptorWithRelatedProperties:ascending:]( &OBJC_CLASS___MPMultiSortDescriptor,  "sortDescriptorWithRelatedProperties:ascending:"));
  v85 = v29;
  uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v85, 1LL));

  v61 = (void *)v30;
  -[MPModelLibraryRequest setItemSortDescriptors:](v4, "setItemSortDescriptors:", v30);
  v83[0] = v9;
  id v31 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v82[0] = MPModelPropertyAlbumArtwork;
  v82[1] = MPModelPropertyAlbumIsCompilation;
  v82[2] = MPModelPropertyAlbumIsFavorite;
  v82[3] = MPModelPropertyAlbumReleaseDateComponents;
  v82[4] = MPModelPropertyAlbumSongPopularity;
  v82[5] = MPModelPropertyAlbumTitle;
  v82[6] = MPModelPropertyAlbumTrackCount;
  v82[7] = MPModelPropertyAlbumTraits;
  v82[8] = MPModelPropertyAlbumYear;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 9LL));
  v80[0] = MPModelRelationshipAlbumArtist;
  v79[0] = MPModelPropertyArtistIsFavorite;
  v79[1] = MPModelPropertyArtistName;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 2LL));
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v60));
  v81[0] = v59;
  v80[1] = MPModelRelationshipAlbumGenre;
  uint64_t v78 = MPModelPropertyGenreName;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v78, 1LL));
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v58));
  v81[1] = v57;
  v80[2] = MPModelRelationshipAlbumRepresentativeSong;
  v77[0] = MPModelPropertySongIsDisliked;
  v77[1] = MPModelPropertySongIsFavorite;
  v77[2] = MPModelPropertySongHasVideo;
  v77[3] = MPModelPropertySongTitle;
  v77[4] = MPModelPropertySongArtwork;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 5LL));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v55));
  v81[2] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  3LL));
  id v34 = [v31 initWithProperties:v56 relationships:v33];
  v84[0] = v34;
  v83[1] = v12;
  id v35 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v76[0] = MPModelPropertyPlaylistArtwork;
  v76[1] = MPModelPropertyPlaylistCloudVersionHash;
  v76[2] = MPModelPropertyPlaylistDescriptionText;
  v76[3] = MPModelPropertyPlaylistIsFavorite;
  v76[4] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v76[5] = MPModelPropertyPlaylistLibraryAdded;
  v76[6] = MPModelPropertyPlaylistName;
  v76[7] = MPModelPropertyPlaylistSubscribed;
  v76[8] = MPModelPropertyPlaylistTracksTiledArtwork;
  v76[9] = MPModelPropertyPlaylistTraits;
  v76[10] = MPModelPropertyPlaylistType;
  v76[11] = MPModelPropertyPlaylistUserEditableComponents;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 12LL));
  uint64_t v74 = MPModelRelationshipPlaylistCurator;
  uint64_t v73 = MPModelPropertyCuratorName;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v73, 1LL));
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v37));
  v75 = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v75,  &v74,  1LL));
  id v40 = [v35 initWithProperties:v36 relationships:v39];
  v84[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  2LL));
  id v42 = [v41 mutableCopy];

  if (v64 != 2)
  {
    id v43 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v72[0] = MPModelPropertyTVSeasonArtwork;
    v72[1] = MPModelPropertyTVSeasonNumber;
    v72[2] = MPModelPropertyTVSeasonSortType;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 3LL));
    v70[0] = MPModelRelationshipTVSeasonShow;
    uint64_t v69 = MPModelPropertyTVShowTitle;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v45));
    v71[0] = v46;
    v70[1] = MPModelRelationshipTVSeasonRepresentativeEpisode;
    v68[0] = MPModelPropertyTVEpisodeExplicitRating;
    v68[1] = MPModelPropertyTVEpisodeNumber;
    v68[2] = MPModelPropertyTVEpisodeTitle;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 3LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v47));
    v71[1] = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  2LL));
    id v50 = [v43 initWithProperties:v44 relationships:v49];
    [v42 setObject:v50 forKeyedSubscript:v65];

    v51 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForMovie]);
    [v42 setObject:v51 forKeyedSubscript:v66];
  }

  id v52 = [[MPPropertySet alloc] initWithProperties:&__NSArray0__struct relationships:v42];
  -[MPModelLibraryRequest setItemProperties:](v67, "setItemProperties:", v52);

  return v67;
}

+ (id)TVShowsLibraryRequest
{
  v2 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  -[MPModelLibraryRequest setMediaLibrary:](v2, "setMediaLibrary:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVShow kindWithSeasonKind:](&OBJC_CLASS___MPModelTVShow, "kindWithSeasonKind:", v5));
  -[MPModelLibraryRequest setItemKind:](v2, "setItemKind:", v6);
  v16[0] = MPModelPropertyTVShowTitle;
  v16[1] = MPModelPropertyTVShowArtwork;
  v16[2] = MPModelPropertyTVShowEpisodeCount;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  uint64_t v14 = MPModelRelationshipTVShowCreator;
  uint64_t v13 = MPModelPropertyTVShowCreatorName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  id v11 = [[MPPropertySet alloc] initWithProperties:v7 relationships:v10];
  -[MPModelLibraryRequest setItemProperties:](v2, "setItemProperties:", v11);

  return v2;
}

+ (id)TVShowsAndMoviesLibraryRequest
{
  unsigned int v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v4 = MPModelRelationshipGenericTVSeason;
  v20[0] = MPModelRelationshipGenericTVSeason;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:", v5));
  v21[0] = v6;
  uint64_t v7 = MPModelRelationshipGenericMovie;
  v20[1] = MPModelRelationshipGenericMovie;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
  v21[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject kindWithRelationshipKinds:]( &OBJC_CLASS___MPModelGenericObject,  "kindWithRelationshipKinds:",  v9));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v10);

  v18[0] = v4;
  v17[0] = MPModelPropertyTVSeasonArtwork;
  v17[1] = MPModelPropertyTVSeasonNumber;
  v17[2] = MPModelPropertyTVSeasonSortType;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v11));
  v18[1] = v7;
  v19[0] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForMovie]);
  v19[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

  id v15 = [[MPPropertySet alloc] initWithProperties:&__NSArray0__struct relationships:v14];
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v15);

  return v3;
}

+ (id)TVSeasonsLibraryRequestForShow:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  -[MPModelLibraryRequest setMediaLibrary:](v4, "setMediaLibrary:", v5);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVSeason kindWithEpisodeKind:](&OBJC_CLASS___MPModelTVSeason, "kindWithEpisodeKind:"));
  -[MPModelLibraryRequest setItemKind:](v4, "setItemKind:");
  if (v3)
  {
    id v28 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    -[MPModelLibraryRequest setScopedContainers:](v4, "setScopedContainers:", v6);
  }

  v19 = v3;
  id v7 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v8 = MPModelPropertyTVSeasonNumber;
  v27[0] = MPModelPropertyTVSeasonArtwork;
  v27[1] = MPModelPropertyTVSeasonNumber;
  v27[2] = MPModelPropertyTVSeasonSortType;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 3LL));
  v25[0] = MPModelRelationshipTVSeasonShow;
  uint64_t v24 = MPModelPropertyTVShowTitle;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
  v26[0] = v11;
  v25[1] = MPModelRelationshipTVSeasonRepresentativeEpisode;
  v23[0] = MPModelPropertyTVEpisodeExplicitRating;
  v23[1] = MPModelPropertyTVEpisodeNumber;
  v23[2] = MPModelPropertyTVEpisodeTitle;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v12));
  v26[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
  id v15 = [v7 initWithProperties:v9 relationships:v14];
  -[MPModelLibraryRequest setItemProperties:](v4, "setItemProperties:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v8,  1LL));
  uint64_t v22 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  -[MPModelLibraryRequest setItemSortDescriptors:](v4, "setItemSortDescriptors:", v17);

  return v4;
}

+ (id)TVEpisodesLibraryRequestForShow:(id)a3 season:(id)a4
{
  uint64_t v6 = (uint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  -[MPModelLibraryRequest setMediaLibrary:](v8, "setMediaLibrary:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  -[MPModelLibraryRequest setItemKind:](v8, "setItemKind:", v10);
  if (v6 | v7)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    if (v6 || (uint64_t v6 = objc_claimAutoreleasedReturnValue([(id)v7 show])) != 0)
    {
      [v11 addObject:v6];
    }

    if (v7)
    {
      [v11 addObject:v7];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelTVSeason kindWithEpisodeKind:]( &OBJC_CLASS___MPModelTVSeason,  "kindWithEpisodeKind:",  v10));
      -[MPModelLibraryRequest setSectionKind:](v8, "setSectionKind:", v12);
    }

    -[MPModelLibraryRequest setScopedContainers:](v8, "setScopedContainers:", v11);
  }

  v22[0] = MPModelPropertyTVSeasonArtwork;
  v22[1] = MPModelPropertyTVSeasonNumber;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v13));
  -[MPModelLibraryRequest setSectionProperties:](v8, "setSectionProperties:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForTVEpisode]);
  -[MPModelLibraryRequest setItemProperties:](v8, "setItemProperties:", v15);

  if (v7)
  {
    if (![(id)v7 sortType])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeNumber,  1LL));
      v21 = v16;
      v17 = &v21;
      goto LABEL_13;
    }

    if ([(id)v7 sortType] == (id)1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertyTVEpisodeReleaseDate,  0LL));
      v20 = v16;
      v17 = &v20;
LABEL_13:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 1LL));
      -[MPModelLibraryRequest setItemSortDescriptors:](v8, "setItemSortDescriptors:", v18);
    }
  }

  return v8;
}

+ (id)moviesLibraryRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  -[MPModelLibraryRequest setMediaLibrary:](v3, "setMediaLibrary:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForMovie]);
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v6);

  return v3;
}

+ (id)songsLibraryRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsWithDetails:0]);
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v5);

  return v3;
}

+ (id)songsLibraryRequestForAlbumDetails
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 songsLibraryRequestForAlbum:0]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v4));
  [v3 setSectionKind:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForAlbumDetails]);
  [v3 setSectionProperties:v6];

  return v3;
}

+ (id)songsLibraryRequestForAlbum:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v5, "setItemKind:", v6);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsWithDetails:1]);
  -[MPModelLibraryRequest setItemProperties:](v5, "setItemProperties:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongDiscNumber,  1LL));
  v16[0] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongTrackNumber,  1LL));
  v16[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongTitle,  1LL));
  v16[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 3LL));
  -[MPModelLibraryRequest setItemSortDescriptors:](v5, "setItemSortDescriptors:", v11);

  if (v4)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v6));
    -[MPModelLibraryRequest setSectionKind:](v5, "setSectionKind:", v12);

    id v15 = v4;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[MPModelLibraryRequest setScopedContainers:](v5, "setScopedContainers:", v13);
  }

  return v5;
}

+ (id)songsLibraryRequestForArtist:(id)a3
{
  id v20 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v4, "setItemKind:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsWithDetails:1]);
  -[MPModelLibraryRequest setItemProperties:](v4, "setItemProperties:", v5);

  uint64_t v6 = MPModelRelationshipSongAlbum;
  v23[0] = MPModelRelationshipSongAlbum;
  v23[1] = MPModelRelationshipAlbumArtist;
  v23[2] = MPModelPropertyArtistName;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:]( &OBJC_CLASS___MPModelSortDescriptor,  "sortDescriptorWithKeyPath:ascending:",  v7,  1LL));
  v24[0] = v8;
  v22[0] = v6;
  v22[1] = MPModelPropertyAlbumTitle;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelSortDescriptor sortDescriptorWithKeyPath:ascending:]( &OBJC_CLASS___MPModelSortDescriptor,  "sortDescriptorWithKeyPath:ascending:",  v9,  1LL));
  v24[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongDiscNumber,  1LL));
  v24[2] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongTrackNumber,  1LL));
  v24[3] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  MPModelPropertySongTitle,  1LL));
  v24[4] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 5LL));
  -[MPModelLibraryRequest setItemSortDescriptors:](v4, "setItemSortDescriptors:", v14);

  if (v20)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelAlbum kindWithSongKind:](&OBJC_CLASS___MPModelAlbum, "kindWithSongKind:", v19));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtist kindWithAlbumKind:](&OBJC_CLASS___MPModelArtist, "kindWithAlbumKind:", v15));
    -[MPModelLibraryRequest setSectionKind:](v4, "setSectionKind:", v16);

    id v21 = v20;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    -[MPModelLibraryRequest setScopedContainers:](v4, "setScopedContainers:", v17);
  }

  return v4;
}

+ (id)songsLibraryRequestForContextMenu
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsInContextMenu]);
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v5);

  return v3;
}

+ (id)songsAndMusicVideosLibraryRequestForContextMenu
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsInContextMenu]);
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v5);

  return v3;
}

+ (id)songsLibraryRequestForPlaylist:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsWithDetails:1]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 songsLibraryRequestWithPlaylist:v4 songProperties:v5]);

  return v6;
}

+ (id)songsLibraryRequestForContextMenuWithPlaylist:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsInContextMenu]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 songsLibraryRequestWithPlaylist:v4 songProperties:v5]);

  return v6;
}

+ (id)songsLibraryRequestWithPlaylist:(id)a3 songProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  uint64_t v22 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v9));

  -[MPModelLibraryRequest setItemKind:](v7, "setItemKind:", v10);
  id v21 = v6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  -[MPModelLibraryRequest setScopedContainers:](v7, "setScopedContainers:", v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:]( &OBJC_CLASS___MPModelPlaylist,  "kindWithVariants:playlistEntryKind:options:",  87LL,  v10,  0LL));
  -[MPModelLibraryRequest setSectionKind:](v7, "setSectionKind:", v12);

  id v13 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v20 = MPModelPropertyPlaylistEntryPosition;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  uint64_t v18 = MPModelRelationshipPlaylistEntrySong;
  id v19 = v5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  id v16 = [v13 initWithProperties:v14 relationships:v15];
  -[MPModelLibraryRequest setItemProperties:](v7, "setItemProperties:", v16);

  return v7;
}

+ (id)TVEpisodeLibraryRequestWithAdamID:(int64_t)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  -[MPModelLibraryRequest setItemKind:](v5, "setItemKind:", v6);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withStoreID:subscriptionID:",  v6,  0LL,  a3));
  id v11 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  -[MPModelLibraryRequest setAllowedItemIdentifiers:](v5, "setAllowedItemIdentifiers:", v8);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForTVEpisode]);
  -[MPModelLibraryRequest setItemProperties:](v5, "setItemProperties:", v9);

  return v5;
}

+ (id)playlistsLibraryRequestWithParentPlaylistFolder:(id)a3
{
  return [a1 playlistsLibraryRequestWithParentPlaylistFolder:a3 userEditableOnly:0 allowEmptyPlaylists:0];
}

+ (id)playlistsLibraryRequestWithParentPlaylistFolder:(id)a3 userEditableOnly:(BOOL)a4 allowEmptyPlaylists:(BOOL)a5
{
  uint64_t v5 = 4LL;
  if (a5) {
    uint64_t v5 = 0LL;
  }
  BOOL v6 = !a4;
  if (a4) {
    uint64_t v7 = 89LL;
  }
  else {
    uint64_t v7 = 95LL;
  }
  if (v6) {
    return _[a1 _playlistsLibraryRequestWithParentPlaylistFolder:a3 variants:v7 options:v5];
  }
  else {
    return _[a1 _playlistsLibraryRequestWithParentPlaylistFolder:a3 variants:v7 options:v5 | 2];
  }
}

+ (id)personalizedMixPlaylists
{
  return _[a1 _playlistsLibraryRequestWithParentPlaylistFolder:0 variants:64 options:0];
}

+ (id)_playlistsLibraryRequestWithParentPlaylistFolder:(id)a3 variants:(unint64_t)a4 options:(unint64_t)a5
{
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  v28[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](&OBJC_CLASS___MPModelTVEpisode, "kindWithVariants:", 2LL));
  v28[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMovie kindWithVariants:](&OBJC_CLASS___MPModelMovie, "kindWithVariants:", 2LL));
  v28[2] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 3LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](&OBJC_CLASS___MPModelPlaylistEntry, "kindWithKinds:", v12));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelPlaylist kindWithVariants:playlistEntryKind:options:]( &OBJC_CLASS___MPModelPlaylist,  "kindWithVariants:playlistEntryKind:options:",  a4,  v13,  a5));
  -[MPModelLibraryRequest setItemKind:](v8, "setItemKind:", v14);

  if (v7 && [v7 type] == (id)3)
  {
    id v27 = v7;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    -[MPModelLibraryRequest setScopedContainers:](v8, "setScopedContainers:", v15);
  }

  id v16 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v26[0] = MPModelPropertyPlaylistArtwork;
  v26[1] = MPModelPropertyPlaylistCloudVersionHash;
  void v26[2] = MPModelPropertyPlaylistDescriptionText;
  v26[3] = MPModelPropertyPlaylistHasExplicitContent;
  v26[4] = MPModelPropertyPlaylistIsDisliked;
  v26[5] = MPModelPropertyPlaylistIsFavorite;
  v26[6] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v26[7] = MPModelPropertyPlaylistLibraryAdded;
  v26[8] = MPModelPropertyPlaylistName;
  v26[9] = MPModelPropertyPlaylistSubscribed;
  v26[10] = MPModelPropertyPlaylistTracksTiledArtwork;
  v26[11] = MPModelPropertyPlaylistTraits;
  v26[12] = MPModelPropertyPlaylistType;
  v26[13] = MPModelPropertyPlaylistUserEditableComponents;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 14LL));
  uint64_t v24 = MPModelRelationshipPlaylistCurator;
  uint64_t v23 = MPModelPropertyCuratorName;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v18));
  v25 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  id v21 = [v16 initWithProperties:v17 relationships:v20];
  -[MPModelLibraryRequest setItemProperties:](v8, "setItemProperties:", v21);

  return v8;
}

+ (id)_albumsLibraryRequestWithVariants:(unint64_t)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  a3,  v6));
  -[MPModelLibraryRequest setItemKind:](v5, "setItemKind:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForAlbumDetails]);
  -[MPModelLibraryRequest setItemProperties:](v5, "setItemProperties:", v8);

  return v5;
}

+ (id)albumsLibraryRequest
{
  return _[a1 _albumsLibraryRequestWithVariants:3];
}

+ (id)albumsLibraryRequestForArtist:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 albumsLibraryRequest]);
  id v8 = v4;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  [v5 setScopedContainers:v6];
  return v5;
}

+ (id)compilationsLibraryRequest
{
  return _[a1 _albumsLibraryRequestWithVariants:2];
}

+ (id)artistsLibraryRequest
{
  v2 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelArtist kindWithAlbumKind:](&OBJC_CLASS___MPModelArtist, "kindWithAlbumKind:", v4));
  -[MPModelLibraryRequest setItemKind:](v2, "setItemKind:", v5);

  v9[0] = MPModelPropertyArtistArtwork;
  v9[1] = MPModelPropertyArtistIsDisliked;
  v9[2] = MPModelPropertyArtistIsFavorite;
  v9[3] = MPModelPropertyArtistName;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 4LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  -[MPModelLibraryRequest setItemProperties:](v2, "setItemProperties:", v7);

  return v2;
}

+ (id)musicVideosLibraryRequest
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 2LL));
  -[MPModelLibraryRequest setItemKind:](v3, "setItemKind:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 propertySetForSongsWithDetails:0]);
  -[MPModelLibraryRequest setItemProperties:](v3, "setItemProperties:", v5);

  return v3;
}

+ (id)genresLibraryRequest
{
  v2 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelGenre kindWithAlbumKind:](&OBJC_CLASS___MPModelGenre, "kindWithAlbumKind:", v4));
  -[MPModelLibraryRequest setItemKind:](v2, "setItemKind:", v5);

  uint64_t v9 = MPModelPropertyGenreName;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  -[MPModelLibraryRequest setItemProperties:](v2, "setItemProperties:", v7);

  return v2;
}

+ (id)composersLibraryRequest
{
  v2 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelAlbum kindWithVariants:songKind:]( &OBJC_CLASS___MPModelAlbum,  "kindWithVariants:songKind:",  3LL,  v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelComposer kindWithAlbumKind:](&OBJC_CLASS___MPModelComposer, "kindWithAlbumKind:", v4));
  -[MPModelLibraryRequest setItemKind:](v2, "setItemKind:", v5);

  uint64_t v9 = MPModelPropertyComposerName;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  -[MPModelLibraryRequest setItemProperties:](v2, "setItemProperties:", v7);

  return v2;
}

+ (id)propertySetForAlbumDetails
{
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v18[0] = MPModelPropertyAlbumArtwork;
  v18[1] = MPModelPropertyAlbumDateFavorited;
  void v18[2] = MPModelPropertyAlbumHasExplicitContent;
  v18[3] = MPModelPropertyAlbumIsCompilation;
  v18[4] = MPModelPropertyAlbumIsClassical;
  v18[5] = MPModelPropertyAlbumIsDisliked;
  v18[6] = MPModelPropertyAlbumIsFavorite;
  v18[7] = MPModelPropertyAlbumLibraryAdded;
  v18[8] = MPModelPropertyAlbumLibraryAddedDate;
  v18[9] = MPModelPropertyAlbumReleaseDateComponents;
  v18[10] = MPModelPropertyAlbumSongPopularity;
  v18[11] = MPModelPropertyAlbumTitle;
  v18[12] = MPModelPropertyAlbumTrackCount;
  v18[13] = MPModelPropertyAlbumTraits;
  v18[14] = MPModelPropertyAlbumYear;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 15LL));
  v16[0] = MPModelRelationshipAlbumArtist;
  v15[0] = MPModelPropertyArtistIsFavorite;
  v15[1] = MPModelPropertyArtistName;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v4));
  v17[0] = v5;
  v16[1] = MPModelRelationshipAlbumGenre;
  uint64_t v14 = MPModelPropertyGenreName;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  v17[1] = v7;
  v16[2] = MPModelRelationshipAlbumRepresentativeSong;
  v13[0] = MPModelPropertySongIsDisliked;
  v13[1] = MPModelPropertySongIsFavorite;
  v13[2] = MPModelPropertySongHasVideo;
  v13[3] = MPModelPropertySongTitle;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));
  v17[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  id v11 = [v2 initWithProperties:v3 relationships:v10];

  return v11;
}

+ (id)propertySetForSongsWithDetails:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  if (v3)
  {
    v54[0] = MPModelPropertySongArtwork;
    v54[1] = MPModelPropertySongClassicalMovement;
    v54[2] = MPModelPropertySongClassicalMovementCount;
    v54[3] = MPModelPropertySongClassicalMovementNumber;
    v54[4] = MPModelPropertySongClassicalWork;
    v54[5] = MPModelPropertySongDuration;
    v54[6] = MPModelPropertySongExplicit;
    v54[7] = MPModelPropertySongGrouping;
    v54[8] = MPModelPropertySongHasVideo;
    v54[9] = MPModelPropertySongIsDisliked;
    v54[10] = MPModelPropertySongIsFavorite;
    v54[11] = MPModelPropertySongLibraryAdded;
    v54[12] = MPModelPropertySongLibraryAddEligible;
    v54[13] = MPModelPropertySongShouldShowComposer;
    v54[14] = MPModelPropertySongTitle;
    v54[15] = MPModelPropertySongTrackNumber;
    v54[16] = MPModelPropertySongTraits;
    v54[17] = MPModelPropertySongUserRating;
    v54[18] = MPModelPropertySongYear;
    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 19LL));
    v52[0] = MPModelRelationshipSongAlbum;
    id v5 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v51[0] = MPModelPropertyAlbumIsCompilation;
    v51[1] = MPModelPropertyAlbumIsDisliked;
    v51[2] = MPModelPropertyAlbumIsFavorite;
    v51[3] = MPModelPropertyAlbumLibraryAdded;
    v51[4] = MPModelPropertyAlbumLibraryAddedDate;
    v51[5] = MPModelPropertyAlbumTitle;
    v51[6] = MPModelPropertyAlbumTrackCount;
    v51[7] = MPModelPropertyAlbumTraits;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 8LL));
    uint64_t v49 = MPModelRelationshipAlbumArtist;
    uint64_t v7 = MPModelPropertyArtistIsFavorite;
    uint64_t v8 = MPModelPropertyArtistName;
    v48[0] = MPModelPropertyArtistIsFavorite;
    v48[1] = MPModelPropertyArtistName;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
    id v28 = v4;
    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:"));
    uint64_t v50 = v29;
    id v34 = (void *)v6;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    id v31 = objc_msgSend(v5, "initWithProperties:relationships:", v6);
    v53[0] = v31;
    v52[1] = MPModelRelationshipSongArtist;
    v47[0] = v7;
    v47[1] = v8;
    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v27));
    v53[1] = v9;
    v52[2] = MPModelRelationshipSongComposer;
    uint64_t v46 = MPModelPropertyComposerName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
    v53[2] = v11;
    v52[3] = MPModelRelationshipSongLyrics;
    uint64_t v45 = MPModelPropertyLyricsHasStoreLyrics;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v12));
    v53[3] = v13;
    v52[4] = MPModelRelationshipSongStoreAsset;
    v44[0] = MPModelPropertyStoreAssetEndpointType;
    v44[1] = MPModelPropertyStoreAssetRedownloadable;
    v44[2] = MPModelPropertyStoreAssetRedownloadParameters;
    v44[3] = MPModelPropertyStoreAssetShouldReportPlayEvents;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 4LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v14));
    v53[4] = v15;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  5LL));
    v17 = (void *)v30;
    id v18 = [v28 initWithProperties:v30 relationships:v16];

    id v19 = (void *)v29;
    uint64_t v20 = (void *)v27;
  }

  else
  {
    v43[0] = MPModelPropertySongArtwork;
    v43[1] = MPModelPropertySongDuration;
    v43[2] = MPModelPropertySongExplicit;
    v43[3] = MPModelPropertySongHasVideo;
    v43[4] = MPModelPropertySongIsDisliked;
    v43[5] = MPModelPropertySongIsFavorite;
    v43[6] = MPModelPropertySongLibraryAdded;
    v43[7] = MPModelPropertySongLibraryAddEligible;
    v43[8] = MPModelPropertySongTitle;
    v43[9] = MPModelPropertySongYear;
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 10LL));
    v41[0] = MPModelRelationshipSongArtist;
    uint64_t v22 = MPModelPropertyArtistIsFavorite;
    uint64_t v23 = MPModelPropertyArtistName;
    v40[0] = MPModelPropertyArtistIsFavorite;
    v40[1] = MPModelPropertyArtistName;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:"));
    v42[0] = v33;
    v41[1] = MPModelRelationshipSongAlbum;
    id v24 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v39[0] = MPModelPropertyAlbumIsCompilation;
    v39[1] = MPModelPropertyAlbumIsDisliked;
    v39[2] = MPModelPropertyAlbumIsFavorite;
    v39[3] = MPModelPropertyAlbumLibraryAdded;
    v39[4] = MPModelPropertyAlbumLibraryAddedDate;
    v39[5] = MPModelPropertyAlbumTitle;
    v39[6] = MPModelPropertyAlbumTrackCount;
    v39[7] = MPModelPropertyAlbumTraits;
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 8LL));
    v36[1] = v23;
    uint64_t v37 = MPModelRelationshipAlbumArtist;
    v36[0] = v22;
    v17 = (void *)v21;
    id v19 = (void *)v25;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:"));
    id v38 = v31;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v9 = [v24 initWithProperties:v19 relationships:v20];
    v42[1] = v9;
    v41[2] = MPModelRelationshipSongStoreAsset;
    v35[0] = MPModelPropertyStoreAssetEndpointType;
    v35[1] = MPModelPropertyStoreAssetRedownloadable;
    v35[2] = MPModelPropertyStoreAssetRedownloadParameters;
    v35[3] = MPModelPropertyStoreAssetShouldReportPlayEvents;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 4LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
    v42[2] = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  3LL));
    id v18 = [v4 initWithProperties:v17 relationships:v12];
  }

  return v18;
}

+ (id)propertySetForTVEpisode
{
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v15[0] = MPModelPropertyTVEpisodeArtwork;
  v15[1] = MPModelPropertyTVEpisodeDescriptionText;
  void v15[2] = MPModelPropertyTVEpisodeDuration;
  v15[3] = MPModelPropertyTVEpisodeExplicitRating;
  v15[4] = MPModelPropertyTVEpisodeLibraryAdded;
  v15[5] = MPModelPropertyTVEpisodeLibraryAddedDate;
  v15[6] = MPModelPropertyTVEpisodeNumber;
  v15[7] = MPModelPropertyTVEpisodeReleaseDate;
  v15[8] = MPModelPropertyTVEpisodeTitle;
  v15[9] = MPModelPropertyTVEpisodeType;
  v15[10] = MPModelPropertyTVEpisodeTypeDisplayName;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 11LL));
  v13[0] = MPModelRelationshipTVEpisodeShow;
  uint64_t v12 = MPModelPropertyTVShowTitle;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v4));
  v14[0] = v5;
  v13[1] = MPModelRelationshipTVEpisodePlaybackPosition;
  v11[0] = MPModelPropertyPlaybackPositionBookmarkTime;
  v11[1] = MPModelPropertyPlaybackPositionHasBeenPlayed;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  v14[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v9 = [v2 initWithProperties:v3 relationships:v8];

  return v9;
}

+ (id)propertySetForMovie
{
  v5[0] = MPModelPropertyMovieArtwork;
  v5[1] = MPModelPropertyMovieDuration;
  v5[2] = MPModelPropertyMovieExplicitRating;
  v5[3] = MPModelPropertyMovieLibraryAdded;
  v5[4] = MPModelPropertyMovieTitle;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 5LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v2));

  return v3;
}

+ (id)propertySetForSongsInContextMenu
{
  id v22 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v33[0] = MPModelPropertySongArtistUploadedContent;
  v33[1] = MPModelPropertySongArtwork;
  v33[2] = MPModelPropertySongClassicalMovement;
  v33[3] = MPModelPropertySongClassicalMovementCount;
  v33[4] = MPModelPropertySongClassicalMovementNumber;
  v33[5] = MPModelPropertySongClassicalWork;
  v33[6] = MPModelPropertySongDuration;
  v33[7] = MPModelPropertySongExplicit;
  v33[8] = MPModelPropertySongGrouping;
  v33[9] = MPModelPropertySongHasVideo;
  v33[10] = MPModelPropertySongIsDisliked;
  v33[11] = MPModelPropertySongIsFavorite;
  v33[12] = MPModelPropertySongLibraryAdded;
  v33[13] = MPModelPropertySongLibraryAddEligible;
  v33[14] = MPModelPropertySongShouldShowComposer;
  v33[15] = MPModelPropertySongTitle;
  v33[16] = MPModelPropertySongTrackNumber;
  v33[17] = MPModelPropertySongUserRating;
  v33[18] = MPModelPropertySongYear;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 19LL));
  v31[0] = MPModelRelationshipSongAlbum;
  id v2 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v30[0] = MPModelPropertyAlbumIsCompilation;
  v30[1] = MPModelPropertyAlbumIsDisliked;
  v30[2] = MPModelPropertyAlbumIsFavorite;
  v30[3] = MPModelPropertyAlbumTitle;
  v30[4] = MPModelPropertyAlbumTrackCount;
  v30[5] = MPModelPropertyAlbumTraits;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 6LL));
  uint64_t v28 = MPModelRelationshipAlbumArtist;
  uint64_t v3 = MPModelPropertyArtistIsFavorite;
  uint64_t v4 = MPModelPropertyArtistName;
  v27[0] = MPModelPropertyArtistIsFavorite;
  v27[1] = MPModelPropertyArtistName;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v20));
  uint64_t v29 = v19;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
  id v16 = [v2 initWithProperties:v18 relationships:v17];
  v32[0] = v16;
  v31[1] = MPModelRelationshipSongArtist;
  v26[0] = MPModelPropertyArtistIsDisliked;
  v26[1] = v3;
  void v26[2] = v4;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v15));
  v32[1] = v5;
  v31[2] = MPModelRelationshipSongComposer;
  uint64_t v25 = MPModelPropertyComposerName;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v6));
  v32[2] = v7;
  v31[3] = MPModelRelationshipSongStoreAsset;
  v24[0] = MPModelPropertyStoreAssetEndpointType;
  v24[1] = MPModelPropertyStoreAssetRedownloadable;
  v24[2] = MPModelPropertyStoreAssetRedownloadParameters;
  v24[3] = MPModelPropertyStoreAssetShouldReportPlayEvents;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v8));
  v32[3] = v9;
  v31[4] = MPModelRelationshipSongLyrics;
  v23[0] = MPModelPropertyLyricsHasLibraryLyrics;
  v23[1] = MPModelPropertyLyricsHasStoreLyrics;
  v23[2] = MPModelPropertyLyricsHasTimeSyncedLyrics;
  void v23[3] = MPModelPropertyLyricsText;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 4LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v10));
  v32[4] = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  5LL));
  id v13 = [v22 initWithProperties:v21 relationships:v12];

  return v13;
}

@end