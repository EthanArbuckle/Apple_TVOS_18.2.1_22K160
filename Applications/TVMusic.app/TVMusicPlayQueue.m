@interface TVMusicPlayQueue
+ (id)_debugNameForPlayAction:(unint64_t)a3;
+ (id)_stringForMPCPlayerState:(int64_t)a3;
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot;
- (BOOL)_isQueueEndActionAvailable:(int64_t)a3 forTracklist:(id)a4;
- (BOOL)_isUserSubscribed;
- (BOOL)canAddAfterSectionWithPlaybackIntent:(id)a3;
- (BOOL)canAddToEndOfUpNextWithPlaybackIntent:(id)a3;
- (BOOL)canAddToPlayQueueAtEndWithPlaybackIntent:(id)a3;
- (BOOL)canAddToPlayQueueNextWithPlaybackIntent:(id)a3;
- (BOOL)canEnableVocalAttenuation;
- (BOOL)canInsertAfterCurrentPlayingItem:(id)a3;
- (BOOL)canMoveItemAtIndexToPlayNext:(int64_t)a3;
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)deviceSupportsVocalAttenuation;
- (BOOL)externalEndpointsAvailable;
- (BOOL)isAirplayActive;
- (BOOL)isLocalDeviceQueue;
- (BOOL)isMusicAppQueue;
- (BOOL)isPendingElapsedTimeChange;
- (BOOL)isPlayingSpatialAudio;
- (BOOL)isQueueEndActionAvailable:(int64_t)a3;
- (BOOL)isRadioPlayback;
- (BOOL)isRadioStationStreaming;
- (BOOL)isTransitioningPlaylist;
- (BOOL)isUpdating;
- (BOOL)isVideoPictureInPictureDismissing;
- (BOOL)isVideoPictureInPictureRunning;
- (BOOL)isVideoPlayback;
- (BOOL)prepareVocalControlsPending;
- (BOOL)shuffleEnabled;
- (BOOL)supportsRepeat;
- (BOOL)supportsShuffle;
- (BOOL)vocalAttenuationEnablePending;
- (BOOL)vocalAttenuationEnabled;
- (BOOL)vocalAttenuationLevelIsContinuous;
- (BOOL)vocalLevelIsTransitioning;
- (MPAVRoute)audioRoute;
- (MPCPlayerResponse)playerResponse;
- (MPCPlayerResponse)previousPlayerResponse;
- (MPCPlayerResponseItem)currentPlayingItem;
- (MPCPlayerResponseItem)lastPlayingItem;
- (MPCVideoOutput)videoOutput;
- (MPModelGenericObject)currentSectionMetadataObject;
- (MPRequestResponseController)requestResponseController;
- (NSArray)mediaItems;
- (NSString)radioStationName;
- (NSString)tracklistIdentifier;
- (TVMusicPlayQueue)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5;
- (TVMusicPlayQueueDelegate)delegate;
- (double)currentPlayingDuration;
- (double)currentPlayingElapsedTime;
- (double)pendingElapsedTime;
- (double)timeOfVocalLevelChange;
- (double)updateTime;
- (float)vocalAttenuationLevel;
- (float)vocalAttenuationMaxLevel;
- (float)vocalAttenuationMinLevel;
- (id)_createGlobalPlayerPathWithRoute:(id)a3;
- (id)_displaySectionMetadataForItemAtIndexPath:(id)a3 tracklist:(id)a4;
- (id)_mediaItemForMPCPlayerResponseItem:(id)a3 section:(id)a4 atIndexPath:(id)a5 tracklist:(id)a6;
- (id)convertPreviousIndexPathToIndexPathForUpdatedPlaylist:(id)a3;
- (id)currentMediaItem;
- (id)lastSectionName;
- (id)responseTrackList;
- (id)sectionForItemWithIdentifiers:(id)a3;
- (id)vocalsControlCommand;
- (int64_t)_bestStoreIdentifierForIdentifierSet:(id)a3;
- (int64_t)_mpcQueueEndActionFromQueueEndAction:(int64_t)a3;
- (int64_t)_repeatModeFromRepeatType:(int64_t)a3;
- (int64_t)_tracklistRepeatMode;
- (int64_t)playerState;
- (int64_t)queueEndAction;
- (int64_t)repeatMode;
- (unint64_t)activeListIndex;
- (unint64_t)count;
- (void)_activeSystemRouteDidChange:(id)a3;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_libraryWasUpdated:(id)a3;
- (void)_performPlayerCommand:(int64_t)a3 name:(id)a4;
- (void)_performPlayerCommandRequest:(id)a3 name:(id)a4;
- (void)_repeatModeSettingDidChange:(id)a3;
- (void)_setQueueEndAction:(int64_t)a3;
- (void)_setRepeatMode:(int64_t)a3;
- (void)_setRepeatType:(int64_t)a3;
- (void)_setShuffleEnabled:(BOOL)a3;
- (void)_updateMediaItemsWithTrackList:(id)a3;
- (void)_updatePlayQueue;
- (void)_updatePlayerPathWithRoute:(id)a3;
- (void)addToPlayQueueWithPlaybackIntent:(id)a3 playAction:(unint64_t)a4;
- (void)airplayDetectorAirplayEnded:(id)a3;
- (void)airplayDetectorAirplayStarted:(id)a3;
- (void)changeToItemAtIndex:(int64_t)a3;
- (void)changeToNextItem;
- (void)changeToPreviousItem;
- (void)clearPlayQueueWithCompletionHandler:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)fastForward;
- (void)insertAfterCurrentPlayingItem:(id)a3;
- (void)moveItemAtIndexToPlayNext:(int64_t)a3;
- (void)pause;
- (void)play;
- (void)prepareVocalControls;
- (void)replacePlayQueueWithPlaybackIntent:(id)a3 commandIdentifier:(id)a4 completionHandler:(id)a5;
- (void)rewind;
- (void)setCurrentSectionMetadataObject:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceSupportsVocalAttenuation:(BOOL)a3;
- (void)setDurationSnapshot:(id *)a3;
- (void)setElapsedTime:(double)a3;
- (void)setExternalEndpointsAvailable:(BOOL)a3;
- (void)setIsAirplayActive:(BOOL)a3;
- (void)setIsRadioPlayback:(BOOL)a3;
- (void)setIsRadioStationStreaming:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setIsVideoPlayback:(BOOL)a3;
- (void)setLastPlayingItem:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setPendingElapsedTime:(double)a3;
- (void)setPendingElapsedTimeChange:(BOOL)a3;
- (void)setPlayerResponse:(id)a3;
- (void)setPrepareVocalControlsPending:(BOOL)a3;
- (void)setPreviousPlayerResponse:(id)a3;
- (void)setQueueEndAction:(int64_t)a3;
- (void)setRadioStationName:(id)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setRequestResponseController:(id)a3;
- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4;
- (void)setSupportsRepeat:(BOOL)a3;
- (void)setSupportsShuffle:(BOOL)a3;
- (void)setTimeOfVocalLevelChange:(double)a3;
- (void)setTracklistIdentifier:(id)a3;
- (void)setTransitioningPlaylist:(BOOL)a3;
- (void)setUpdateTime:(double)a3;
- (void)setVideoOutput:(id)a3;
- (void)setVocalAttenuationEnablePending:(BOOL)a3;
- (void)setVocalAttenuationEnabled:(BOOL)a3;
- (void)setVocalAttenuationLevel:(float)a3;
- (void)setVocalAttenuationLevelIsContinuous:(BOOL)a3;
- (void)setVocalLevelIsTransitioning:(BOOL)a3;
- (void)startUpdating;
- (void)stop;
- (void)stopUpdating;
- (void)updatePlayerPath;
- (void)videoOutput:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)videoOutputDidStartPictureInPicture:(id)a3;
- (void)videoOutputDidStopPictureInPicture:(id)a3;
- (void)videoOutputWillStartPictureInPicture:(id)a3;
- (void)videoOutputWillStopPictureInPicture:(id)a3;
@end

@implementation TVMusicPlayQueue

- (TVMusicPlayQueue)initWithMediaItems:(id)a3 index:(int64_t)a4 isCollection:(BOOL)a5
{
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___TVMusicPlayQueue;
  v5 = -[TVMusicPlayQueue initWithMediaItems:index:isCollection:]( &v61,  "initWithMediaItems:index:isCollection:",  a3,  a4,  a5);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
    requestResponseController = v5->_requestResponseController;
    v5->_requestResponseController = v6;

    -[MPRequestResponseController setDelegate:](v5->_requestResponseController, "setDelegate:", v5);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.TVMusic.TVMusicPlayQueue.invalidation", 0LL);
    invalidationQueue = v5->_invalidationQueue;
    v5->_invalidationQueue = (OS_dispatch_queue *)v8;

    v10 = -[TVMusicAirplayDetector initWithDelegate:]( objc_alloc(&OBJC_CLASS___TVMusicAirplayDetector),  "initWithDelegate:",  v5);
    airplayDetector = v5->_airplayDetector;
    v5->_airplayDetector = v10;

    v5->_deviceSupportsVocalAttenuation = MSVDeviceSupportsVocalAttenuation();
    id v56 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v82[0] = MPModelPropertySongArtistUploadedContent;
    v82[1] = MPModelPropertySongArtwork;
    v82[2] = MPModelPropertySongDuration;
    v82[3] = MPModelPropertySongExplicit;
    v82[4] = MPModelPropertySongHasVideo;
    v82[5] = MPModelPropertySongIsDisliked;
    v82[6] = MPModelPropertySongIsFavorite;
    v82[7] = MPModelPropertySongLibraryAdded;
    v82[8] = MPModelPropertySongLibraryAddEligible;
    v82[9] = MPModelPropertySongTitle;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82, 10LL));
    v80[0] = MPModelRelationshipSongArtist;
    uint64_t v79 = MPModelPropertyArtistName;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v79, 1LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v49));
    v81[0] = v48;
    v80[1] = MPModelRelationshipSongAlbum;
    uint64_t v52 = MPModelPropertyAlbumTitle;
    uint64_t v54 = MPModelPropertyAlbumTrackCount;
    v78[0] = MPModelPropertyAlbumTitle;
    v78[1] = MPModelPropertyAlbumTrackCount;
    uint64_t v51 = MPModelPropertyAlbumTraits;
    v78[2] = MPModelPropertyAlbumTraits;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v78, 3LL));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v47));
    v81[1] = v13;
    v80[2] = MPModelRelationshipSongLyrics;
    v77[0] = MPModelPropertyLyricsHasLibraryLyrics;
    v77[1] = MPModelPropertyLyricsHasStoreLyrics;
    v77[2] = MPModelPropertyLyricsHasTimeSyncedLyrics;
    v77[3] = MPModelPropertyLyricsText;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v77, 4LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v14));
    v81[2] = v15;
    v80[3] = MPModelRelationshipSongPlaybackPosition;
    uint64_t v76 = MPModelPropertyPlaybackPositionShouldRememberBookmarkTime;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v76, 1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v16));
    v81[3] = v17;
    v80[4] = MPModelRelationshipSongStoreAsset;
    uint64_t v75 = MPModelPropertyStoreAssetEndpointType;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v18));
    v81[4] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  5LL));
    id v57 = [v56 initWithProperties:v12 relationships:v20];

    id v21 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v73[0] = MPModelRelationshipGenericMovie;
    v72[0] = MPModelPropertyMovieArtwork;
    v72[1] = MPModelPropertyMovieDuration;
    v72[2] = MPModelPropertyMovieTitle;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v72, 3LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v22));
    v74[0] = v23;
    v74[1] = v57;
    v73[1] = MPModelRelationshipGenericSong;
    v73[2] = MPModelRelationshipGenericTVEpisode;
    id v24 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v71[0] = MPModelPropertyTVEpisodeArtwork;
    v71[1] = MPModelPropertyTVEpisodeDuration;
    v71[2] = MPModelPropertyTVEpisodeTitle;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 3LL));
    uint64_t v69 = MPModelRelationshipTVEpisodeShow;
    uint64_t v68 = MPModelPropertyTVShowTitle;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v26));
    v70 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
    id v29 = [v24 initWithProperties:v25 relationships:v28];
    v74[2] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  3LL));
    id v31 = [v21 initWithProperties:0 relationships:v30];

    id v50 = v31;
    id v32 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
    [v32 setQueueItemProperties:v50];
    [v32 setPlayingItemProperties:v50];

    objc_msgSend(v32, "setTracklistRange:", 49, 99);
    [v32 setDisablePlaybackStateValidation:1];
    id v33 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v66[0] = MPModelRelationshipGenericAlbum;
    v65[0] = MPModelPropertyAlbumLibraryAdded;
    v65[1] = v52;
    v65[2] = v54;
    v65[3] = v51;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 4LL));
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v55));
    v67[0] = v53;
    v66[1] = MPModelRelationshipGenericTVSeason;
    uint64_t v64 = MPModelPropertyTVSeasonNumber;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v34));
    v67[1] = v35;
    v66[2] = MPModelRelationshipGenericPlaylist;
    v63[0] = MPModelPropertyPlaylistLibraryAdded;
    v63[1] = MPModelPropertyPlaylistName;
    v63[2] = MPModelPropertyPlaylistTraits;
    v63[3] = MPModelPropertyPlaylistType;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 4LL));
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v36));
    v67[2] = v37;
    v66[3] = MPModelRelationshipGenericRadioStation;
    v62[0] = MPModelPropertyRadioStationName;
    v62[1] = MPModelPropertyRadioStationAttributionLabel;
    v62[2] = MPModelPropertyRadioStationSubtype;
    v62[3] = MPModelPropertyRadioStationType;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 4LL));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v38));
    v67[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  4LL));
    id v41 = [v33 initWithProperties:0 relationships:v40];
    [v32 setQueueSectionProperties:v41];

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_100037D78;
    v58[3] = &unk_10026A370;
    v42 = v5;
    v59 = v42;
    id v60 = v32;
    id v43 = v32;
    +[MPAVRoutingController getActiveRouteWithTimeout:completion:]( &OBJC_CLASS___MPAVRoutingController,  "getActiveRouteWithTimeout:completion:",  v58,  3.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v44 addObserver:v42 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:v45];

    [v44 addObserver:v42 selector:"_repeatModeSettingDidChange:" name:MPPlaybackUserDefaultsMusicRepeatTypeDidChangeNotification object:0];
    [v44 addObserver:v42 selector:"_activeSystemRouteDidChange:" name:MPAVRoutingControllerActiveSystemRouteDidChangeNotification object:0];
    [v44 addObserver:v42 selector:"_libraryWasUpdated:" name:@"TVMusicLibraryDidAddItemNotification" object:0];
    [v44 addObserver:v42 selector:"_libraryWasUpdated:" name:@"TVMusicLibraryDidRemoveItemNotification" object:0];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicPlayQueue;
  -[TVMusicPlayQueue dealloc](&v4, "dealloc");
}

- (unint64_t)count
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue mediaItems](self, "mediaItems"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)activeListIndex
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playingItemIndexPath]);
  if (v3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v2 items]);
    id v5 = [v4 globalIndexForIndexPath:v3];
  }

  else
  {
    id v5 = 0LL;
  }

  return (unint64_t)v5;
}

- (id)currentMediaItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);

  if (!v4
    || (unint64_t v5 = -[TVMusicPlayQueue activeListIndex](self, "activeListIndex"), (v5 & 0x8000000000000000LL) != 0)
    || (unint64_t v6 = v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue activeList](self, "activeList")),
        id v8 = [v7 count],
        v7,
        v6 >= (unint64_t)v8))
  {
    v10 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue activeList](self, "activeList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v6]);
  }

  return v10;
}

- (MPAVRoute)audioRoute
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue requestResponseController](self, "requestResponseController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 request]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPath]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 route]);

  return (MPAVRoute *)v5;
}

- (BOOL)canMoveItemAtIndexToPlayNext:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVMusicPlayQueue;
  if (!-[TVMusicPlayQueue canMoveItemAtIndexToPlayNext:](&v22, "canMoveItemAtIndexToPlayNext:")) {
    return 0;
  }
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 reorderCommand]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 indexPathForGlobalIndex:a3]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 itemAtIndexPath:v8]);

  if ([v6 canMoveItem:v10])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 playingItemIndexPath]);
    v13 = (char *)[v11 globalIndexForIndexPath:v12];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 indexPathForGlobalIndex:v13 + 1]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v5 displayIndexPathForStructuredIndexPath:v8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 displayIndexPathForStructuredIndexPath:v15]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 limitedDisplayIndexPathForMovingIndexPath:v16 toProprosedIndexPath:v17]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 structuredIndexPathForDisplayIndexPath:v18]);
    unsigned __int8 v20 = [v19 isEqual:v15];
  }

  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (void)moveItemAtIndexToPlayNext:(int64_t)a3
{
  id v5 = sub_100038614();
  unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[TVMusicPlayQueue moveItemAtIndexToPlayNext:]";
    __int16 v31 = 2080;
    id v32 = "-[TVMusicPlayQueue moveItemAtIndexToPlayNext:]";
    __int16 v33 = 2048;
    int64_t v34 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: index: %ld", buf, 0x20u);
  }

  if (-[TVMusicPlayQueue canMoveItemAtIndexToPlayNext:](self, "canMoveItemAtIndexToPlayNext:", a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 reorderCommand]);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      v10 = (char *)objc_claimAutoreleasedReturnValue([v9 indexPathForGlobalIndex:a3]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 itemAtIndexPath:v10]);

      uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 playingItemIndexPath]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      v27 = (void *)v13;
      v15 = (char *)[v14 globalIndexForIndexPath:v13];

      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 indexPathForGlobalIndex:v15 + 1]);

      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 displayIndexPathForStructuredIndexPath:v10]);
      v26 = (void *)v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v7 displayIndexPathForStructuredIndexPath:v17]);
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 limitedDisplayIndexPathForMovingIndexPath:v18 toProprosedIndexPath:v19]);
      id v21 = (char *)objc_claimAutoreleasedReturnValue([v7 structuredIndexPathForDisplayIndexPath:v20]);
      v28 = (void *)v12;
      if (v12
        && (objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v7 items]),
            v23 = (void *)objc_claimAutoreleasedReturnValue([v22 itemAtIndexPath:v21]),
            v22,
            v23)
        && (id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 moveItem:v28 beforeItem:v23]),
            v23,
            v24))
      {
        -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v24,  @"move item");
      }

      else
      {
        id v25 = sub_100038614();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v10;
          __int16 v31 = 2112;
          id v32 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Unable to move item at indexPath %@ to %@",  buf,  0x16u);
        }
      }
    }
  }

- (int64_t)_bestStoreIdentifierForIdentifierSet:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 universalStore]);
  if ((uint64_t)[v3 subscriptionAdamID] < 1)
  {
    if ((uint64_t)[v3 purchasedAdamID] < 1)
    {
      if ((uint64_t)[v3 adamID] < 1)
      {
        int64_t v5 = 0LL;
        goto LABEL_8;
      }

      id v4 = [v3 adamID];
    }

    else
    {
      id v4 = [v3 purchasedAdamID];
    }
  }

  else
  {
    id v4 = [v3 subscriptionAdamID];
  }

  int64_t v5 = (int64_t)v4;
LABEL_8:

  return v5;
}

- (BOOL)canInsertAfterCurrentPlayingItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicMPSongMediaItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = v4;
  }
  else {
    v7 = 0LL;
  }
  id v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaItemMetadataForProperty:TVPMediaItemMetadataDisplaySection]);
  v10 = (void *)TVPMediaItemMetadataDisplaySectionPreviousItems;

  if (v9 == v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 song]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifiers]);

    if (-[TVMusicPlayQueue _bestStoreIdentifierForIdentifierSet:](self, "_bestStoreIdentifierForIdentifierSet:", v13) <= 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 library]);
      BOOL v11 = (uint64_t)[v14 persistentID] > 0;
    }

    else
    {
      BOOL v11 = 1;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)insertAfterCurrentPlayingItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicMPSongMediaItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    v7 = v4;
  }
  else {
    v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 song]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);

  if (v9)
  {
    uint64_t v10 = -[TVMusicPlayQueue _bestStoreIdentifierForIdentifierSet:](self, "_bestStoreIdentifierForIdentifierSet:", v9);
    if (v10 < 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 library]);
      uint64_t v19 = (uint64_t)[v18 persistentID];

      if (v19 < 1) {
        goto LABEL_11;
      }
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___MPModelLibraryRequest);
      id v25 = v9;
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      -[MPModelLibraryRequest setAllowedItemIdentifiers:](v17, "setAllowedItemIdentifiers:", v20);

      v16 = (TVMusicPlaybackIntent *)objc_claimAutoreleasedReturnValue( +[MPModelSong kindWithVariants:]( &OBJC_CLASS___MPModelSong,  "kindWithVariants:",  3LL));
      -[MPModelLibraryRequest setItemKind:](v17, "setItemKind:", v16);
    }

    else
    {
      uint64_t v11 = v10;
      uint64_t v12 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
      v26 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      v16 = -[TVMusicPlaybackIntent initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:]( v12,  "initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:",  v15,  0LL,  1LL,  0LL);

      uint64_t v17 = (MPModelLibraryRequest *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent request](v16, "request"));
    }

    if (v17)
    {
      id v21 = objc_alloc_init(&OBJC_CLASS___MPCModelPlaybackIntentTracklistToken);
      [v21 setRequest:v17];
      objc_super v22 = objc_alloc_init(&OBJC_CLASS___MPCPlaybackIntent);
      -[MPCPlaybackIntent setTracklistToken:](v22, "setTracklistToken:", v21);
      -[MPCPlaybackIntent setTracklistSource:](v22, "setTracklistSource:", 3LL);
      -[TVMusicPlayQueue addToPlayQueueWithPlaybackIntent:playAction:]( self,  "addToPlayQueueWithPlaybackIntent:playAction:",  v22,  1LL);

LABEL_13:
      goto LABEL_14;
    }

- (void)updatePlayerPath
{
  id v3 = sub_100038614();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[TVMusicPlayQueue updatePlayerPath]";
    __int16 v8 = 2080;
    v9 = "-[TVMusicPlayQueue updatePlayerPath]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100038B60;
  v5[3] = &unk_10026A398;
  v5[4] = self;
  +[MPAVRoutingController getActiveRouteWithTimeout:completion:]( &OBJC_CLASS___MPAVRoutingController,  "getActiveRouteWithTimeout:completion:",  v5,  3.0);
}

- (void)startUpdating
{
  if (!-[TVMusicPlayQueue isUpdating](self, "isUpdating"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue requestResponseController](self, "requestResponseController"));
    [v3 beginAutomaticResponseLoading];

    -[TVMusicPlayQueue setIsUpdating:](self, "setIsUpdating:", 1LL);
    -[TVMusicPlayQueue setUpdateTime:](self, "setUpdateTime:", 0.0);
  }

- (void)stopUpdating
{
  if (-[TVMusicPlayQueue isUpdating](self, "isUpdating"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue requestResponseController](self, "requestResponseController"));
    [v3 endAutomaticResponseLoading];

    -[TVMusicPlayQueue setIsUpdating:](self, "setIsUpdating:", 0LL);
  }

- (MPCPlayerResponseItem)currentPlayingItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItem]);

  return (MPCPlayerResponseItem *)v4;
}

- (int64_t)playerState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playingItemIndexPath]);

  if (!v4) {
    return 1LL;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v6 = [v5 state];

  return (int64_t)v6;
}

- (id)responseTrackList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);

  return v3;
}

- (void)play
{
  if ((id)-[TVMusicPlayQueue playerState](self, "playerState") == (id)5
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem")),
        v3,
        v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v4 seekCommand]);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 endSeek]);
    -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"end seek");
  }

  else
  {
    -[TVMusicPlayQueue _performPlayerCommand:name:](self, "_performPlayerCommand:name:", 1LL, @"play");
  }

- (void)pause
{
}

- (void)stop
{
}

- (void)fastForward
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  if (v3)
  {
    id v6 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 seekCommand]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginSeekWithDirection:1]);
    -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"fast-forward");

    id v3 = v6;
  }
}

- (void)rewind
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  if (v3)
  {
    id v6 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 seekCommand]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginSeekWithDirection:-1]);
    -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"rewind");

    id v3 = v6;
  }
}

- (void)changeToNextItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changeItemCommand]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 nextItem]);

  -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"nextItem");
}

- (void)changeToPreviousItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 changeItemCommand]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 previousItem]);

  -[TVMusicPlayQueue _performPlayerCommandRequest:name:]( self,  "_performPlayerCommandRequest:name:",  v5,  @"previousItem");
}

- (void)changeToItemAtIndex:(int64_t)a3
{
  id v5 = sub_100038614();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[TVMusicPlayQueue changeToItemAtIndex:]";
    __int16 v20 = 2080;
    id v21 = "-[TVMusicPlayQueue changeToItemAtIndex:]";
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: index: %ld", buf, 0x20u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 items]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForGlobalIndex:a3]);
  if (v9)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 itemAtIndexPath:v9]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 changeItemCommand]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 changeToItem:v10]);

    if (v13)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100039214;
      v17[3] = &unk_10026A3B8;
      v17[4] = a3;
      +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v13,  @"Change to item",  v17);
    }

    else
    {
      id v15 = sub_100038614();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = (const char *)a3;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Unable to perform change to item (%ld) command: No command request is available.",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v14 = sub_100038614();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = (const char *)a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to perform change to item (%ld) command: No item is available.",  buf,  0xCu);
    }
  }
}

- (void)setElapsedTime:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 seekCommand]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 changePositionToElapsedInterval:a3]);

  if (v7)
  {
    -[TVMusicPlayQueue setPendingElapsedTimeChange:](self, "setPendingElapsedTimeChange:", 1LL);
    -[TVMusicPlayQueue setPendingElapsedTime:](self, "setPendingElapsedTime:", a3);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000393FC;
    v11[3] = &unk_10026A3E0;
    *(double *)&v11[5] = a3;
    v11[4] = self;
    +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v7,  @"Set elapsed time",  v11);
  }

  else
  {
    id v8 = sub_100038614();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to perform set elapsed time command: No command request is available.",  v10,  2u);
    }
  }
}

- (double)currentPlayingElapsedTime
{
  if (-[TVMusicPlayQueue isPendingElapsedTimeChange](self, "isPendingElapsedTimeChange"))
  {
    -[TVMusicPlayQueue pendingElapsedTime](self, "pendingElapsedTime");
  }

  else
  {
    -[TVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v4 = v8 + (v3 - v6) * v9;
    if (v4 >= v7) {
      double v4 = v7;
    }
    return fmax(v4, 0.0);
  }

  return result;
}

- (double)currentPlayingDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  double v3 = v2;
  if (v2)
  {
    [v2 duration];
    double v4 = v6;
  }

  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (id)vocalsControlCommand
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 vocalsControlCommand]);

  return v4;
}

- (void)prepareVocalControls
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue vocalsControlCommand](self, "vocalsControlCommand"));

  if (v3)
  {
    -[TVMusicPlayQueue setPrepareVocalControlsPending:](self, "setPrepareVocalControlsPending:", 0LL);
  }

  else
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tracklist]);
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 prepareVocalsControlCommand]);

    if (v6)
    {
      -[TVMusicPlayQueue setPrepareVocalControlsPending:](self, "setPrepareVocalControlsPending:", 0LL);
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 prepare]);
      if (v7)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_100039798;
        v13[3] = &unk_10026A408;
        v13[4] = self;
        +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v7,  @"Prepare Vocals",  v13);
      }

      else
      {
        id v10 = sub_100038614();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "VA - prepareVocalsControlCommand prepare command is nil",  v12,  2u);
        }
      }
    }

    else
    {
      id v8 = sub_100038614();
      float v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "VA - prepareVocalsControlCommand is nil",  v12,  2u);
      }

      -[TVMusicPlayQueue setPrepareVocalControlsPending:](self, "setPrepareVocalControlsPending:", 1LL);
    }
  }

- (void)setVocalAttenuationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tracklist]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 vocalsControlCommand]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activateVocalsControl:v3]);

  if (v8)
  {
    -[TVMusicPlayQueue setVocalAttenuationEnablePending:](self, "setVocalAttenuationEnablePending:", 0LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000399C4;
    v11[3] = &unk_10026A430;
    v11[4] = self;
    BOOL v12 = v3;
    +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v8,  @"Enable vocal attenuation",  v11);
  }

  else
  {
    id v9 = sub_100038614();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Vocal attenuation enabled (%{BOOL}d) not available",  buf,  8u);
    }

    if (v3) {
      -[TVMusicPlayQueue setVocalAttenuationEnablePending:](self, "setVocalAttenuationEnablePending:", 1LL);
    }
  }
}

- (float)vocalAttenuationMinLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 vocalsControlCommand]);
  [v4 minLevel];
  float v6 = v5;

  return v6;
}

- (float)vocalAttenuationMaxLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 vocalsControlCommand]);
  [v4 maxLevel];
  float v6 = v5;

  return v6;
}

- (void)setVocalAttenuationLevel:(float)a3
{
  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  float v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tracklist]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 vocalsControlCommand]);
  *(float *)&double v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 setVocalsLevel:v8]);

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100039CFC;
    v13[3] = &unk_10026A408;
    v13[4] = self;
    +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v9,  @"Set vocal attenuation level",  v13);
  }

  else
  {
    id v10 = sub_100038614();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Vocal attenuation level control not available",  v12,  2u);
    }
  }
}

- (void)setShuffleEnabled:(BOOL)a3 preserveCurrentItem:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = sub_100038614();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    BOOL v14 = "-[TVMusicPlayQueue setShuffleEnabled:preserveCurrentItem:]";
    __int16 v15 = 2080;
    v16 = "-[TVMusicPlayQueue setShuffleEnabled:preserveCurrentItem:]";
    __int16 v17 = 2048;
    BOOL v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: shuffle: %ld", (uint8_t *)&v13, 0x20u);
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 shuffleCommand]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 setShuffleType:v4]);
    if (v10)
    {
      +[MPCPlayerChangeRequest performRequest:description:isUserInitiated:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:isUserInitiated:completion:",  v10,  @"Shuffle",  1LL,  0LL);
    }

    else
    {
      id v11 = sub_100038614();
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Shuffle command not available",  (uint8_t *)&v13,  2u);
      }
    }
  }
}

- (void)_setShuffleEnabled:(BOOL)a3
{
  if (self->_shuffleEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_100038614();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL shuffleEnabled = self->_shuffleEnabled;
      v8[0] = 67109376;
      v8[1] = shuffleEnabled;
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "_shuffleEnabled set %d to %d",  (uint8_t *)v8,  0xEu);
    }

    -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"shuffleEnabled");
    self->_BOOL shuffleEnabled = v3;
    -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"shuffleEnabled");
  }

- (BOOL)shuffleEnabled
{
  return self->_shuffleEnabled;
}

- (void)setRepeatMode:(int64_t)a3
{
  id v5 = sub_100038614();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    BOOL v10 = "-[TVMusicPlayQueue setRepeatMode:]";
    __int16 v11 = 2080;
    BOOL v12 = "-[TVMusicPlayQueue setRepeatMode:]";
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %s: repeatMode: %ld (0=None)",  (uint8_t *)&v9,  0x20u);
  }

  if (a3 == 1) {
    uint64_t v7 = 2LL;
  }
  else {
    uint64_t v7 = a3 == 2;
  }
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[MPPlaybackUserDefaults standardUserDefaults]( &OBJC_CLASS___MPPlaybackUserDefaults,  "standardUserDefaults"));
  [v8 setMusicRepeatType:v7];

  -[TVMusicPlayQueue _setRepeatType:](self, "_setRepeatType:", v7);
}

- (void)_setRepeatType:(int64_t)a3
{
  id v5 = sub_100038614();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v15 = 134217984;
    int64_t v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Attempt to set repeat type %li",  (uint8_t *)&v15,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tracklist]);
  id v9 = [v8 repeatType];

  if (v9 != (id)a3)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 repeatCommand]);

    if (v11 && (uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 setRepeatType:a3])) != 0)
    {
      __int16 v13 = (os_log_s *)v12;
      +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v12,  @"Set repeat type",  0LL);
    }

    else
    {
      id v14 = sub_100038614();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Repeat command not available",  (uint8_t *)&v15,  2u);
      }
    }
  }

- (void)_setRepeatMode:(int64_t)a3
{
  if (self->_repeatMode != a3)
  {
    id v5 = sub_100038614();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int64_t repeatMode = self->_repeatMode;
      int v8 = 134218240;
      int64_t v9 = repeatMode;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "_repeatMode set %li to %li",  (uint8_t *)&v8,  0x16u);
    }

    -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"repeatMode");
    self->_int64_t repeatMode = a3;
    -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"repeatMode");
  }

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (int64_t)_mpcQueueEndActionFromQueueEndAction:(int64_t)a3
{
  else {
    return a3;
  }
}

- (BOOL)isQueueEndActionAvailable:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  LOBYTE(a3) = -[TVMusicPlayQueue _isQueueEndActionAvailable:forTracklist:]( self,  "_isQueueEndActionAvailable:forTracklist:",  a3,  v5);

  return a3;
}

- (BOOL)_isQueueEndActionAvailable:(int64_t)a3 forTracklist:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 actionAtQueueEndCommand]);
  int64_t v7 = -[TVMusicPlayQueue _mpcQueueEndActionFromQueueEndAction:](self, "_mpcQueueEndActionFromQueueEndAction:", a3);
  if (v6)
  {
    int64_t v8 = v7;
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedActions]);
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8));
    unsigned __int8 v11 = [v9 containsObject:v10];
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)setQueueEndAction:(int64_t)a3
{
}

- (int64_t)queueEndAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 tracklist]);
  id v4 = [v3 actionAtQueueEnd];

  else {
    return (int64_t)v4;
  }
}

- (void)_setQueueEndAction:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tracklist]);
  id v7 = [v6 actionAtQueueEnd];

  if (v7 != (id)a3)
  {
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 actionAtQueueEndCommand]);

    if (v9)
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedActions]);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      unsigned __int8 v12 = [v10 containsObject:v11];

      if ((v12 & 1) != 0)
      {
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 setQueueEndAction:a3]);
        +[MPCPlayerChangeRequest performRequest:description:isUserInitiated:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:isUserInitiated:completion:",  v13,  @"Set queue end action",  1LL,  0LL);
        if (v13)
        {
LABEL_12:

          return;
        }
      }

      else
      {
        id v14 = sub_100038614();
        int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
          int v19 = 138543362;
          __int16 v20 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Unsupported queue end action: %{public}@",  (uint8_t *)&v19,  0xCu);
        }
      }
    }

    id v17 = sub_100038614();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Action at queue end command not available",  (uint8_t *)&v19,  2u);
    }

    __int16 v13 = 0LL;
    goto LABEL_12;
  }

- (void)replacePlayQueueWithPlaybackIntent:(id)a3 commandIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100038614();
  unsigned __int8 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[TVMusicPlayQueue replacePlayQueueWithPlaybackIntent:commandIdentifier:completionHandler:]";
    __int16 v26 = 2080;
    v27 = "-[TVMusicPlayQueue replacePlayQueueWithPlaybackIntent:commandIdentifier:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  __int16 v13 = (void *)objc_opt_new(&OBJC_CLASS___MPCPlayerRequest);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue audioRoute](self, "audioRoute"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlayerPath systemMusicPathWithRoute:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "systemMusicPathWithRoute:playerID:",  v14,  @"Music"));
  [v13 setPlayerPath:v15];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003A8F8;
  v20[3] = &unk_10026A480;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = [v13 performWithCompletion:v20];
}

- (void)clearPlayQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100038614();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[TVMusicPlayQueue clearPlayQueueWithCompletionHandler:]";
    __int16 v20 = 2080;
    id v21 = "-[TVMusicPlayQueue clearPlayQueueWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resetCommand]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clear]);

  if (v9)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10003AD00;
    v16[3] = &unk_10026A458;
    id v17 = v4;
    +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v9,  @"Clear play queue",  v16);
    id v10 = v17;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));

    id v12 = sub_100038614();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Queue reset command (clear) not available",  buf,  2u);
      }

      uint64_t v15 = 3LL;
    }

    else if (v14)
    {
      *(_WORD *)buf = 0;
      uint64_t v15 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unable to replace queue; tracklist is nil",
        buf,
        2u);
    }

    else
    {
      uint64_t v15 = 2LL;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVMusicPlayQueueErrorDomain",  v15,  0LL));
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v10);
    }
  }
}

- (BOOL)canAddToPlayQueueNextWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[TVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[TVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAfterPlayingItemWithPlaybackIntent:v4]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canAddToPlayQueueAtEndWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[TVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[TVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAtEndOfTracklistWithPlaybackIntent:v4]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canAddToEndOfUpNextWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[TVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[TVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAtEndOfUpNextWithPlaybackIntent:v4]);
    BOOL v8 = v7 != 0LL;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)canAddAfterSectionWithPlaybackIntent:(id)a3
{
  id v4 = a3;
  if (-[TVMusicPlayQueue isLocalDeviceQueue](self, "isLocalDeviceQueue")
    || -[TVMusicPlayQueue _isUserSubscribed](self, "_isUserSubscribed"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 insertCommand]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 insertAfterLastSection]);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 insertWithPlaybackIntent:v4]);
    BOOL v9 = v8 != 0LL;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)lastSectionName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 insertCommand]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 insertAfterLastSection]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 section]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metadataObject]);

  if (v6)
  {
    id v7 = [v6 type];
    if (v7 == (id)4)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playlist]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 name]);
      goto LABEL_7;
    }

    if (v7 == (id)2)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 album]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 title]);
LABEL_7:
      id v10 = (void *)v9;

      goto LABEL_8;
    }
  }

  id v10 = 0LL;
LABEL_8:

  return v10;
}

- (void)addToPlayQueueWithPlaybackIntent:(id)a3 playAction:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100038614();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_msgSend((id)objc_opt_class(self, v9), "_debugNameForPlayAction:", a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 136315650;
    v28 = "-[TVMusicPlayQueue addToPlayQueueWithPlaybackIntent:playAction:]";
    __int16 v29 = 2080;
    v30 = "-[TVMusicPlayQueue addToPlayQueueWithPlaybackIntent:playAction:]";
    __int16 v31 = 2112;
    id v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %s: playAction: %@", buf, 0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 insertCommand]);

  if (v13)
  {
    switch(a4)
    {
      case 1uLL:
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 insertAfterPlayingItemWithPlaybackIntent:v6]);
        uint64_t v15 = @"PlayNext";
        if (v14) {
          goto LABEL_15;
        }
        goto LABEL_19;
      case 2uLL:
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 insertAtEndOfTracklistWithPlaybackIntent:v6]);
        uint64_t v15 = @"PlayLater";
        if (!v14) {
          goto LABEL_19;
        }
        goto LABEL_15;
      case 3uLL:
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 insertAtEndOfUpNextWithPlaybackIntent:v6]);
        uint64_t v15 = @"AddToQueue";
        if (v14) {
          goto LABEL_15;
        }
        goto LABEL_19;
      case 4uLL:
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v13 insertAfterLastSection]);
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 insertWithPlaybackIntent:v6]);

        uint64_t v15 = @"PlayAfter";
        if (!v14) {
          goto LABEL_19;
        }
LABEL_15:
        if ([v6 tracklistSource] != (id)1)
        {
          id v25 = @"TVMusicPlayQueueWillAddToQueueNotificationUserInfoKey";
          __int16 v26 = v15;
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
          id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v21 postNotificationName:@"TVMusicPlayQueueWillAddToQueueNotification" object:self userInfo:v20];
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Add to play queue (%@)",  v15));
        +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v14,  v22,  0LL);

        goto LABEL_22;
      default:
LABEL_19:
        id v24 = sub_100038614();
        BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        *(_WORD *)buf = 0;
        id v19 = "Queue insert command not available";
        break;
    }

    goto LABEL_21;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));

  id v17 = sub_100038614();
  BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v18 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      id v19 = "Queue insert command not found on tracklist!";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
  }

  else if (v18)
  {
    *(_WORD *)buf = 0;
    id v19 = "Unable to insert into queue; tracklist is nil";
    goto LABEL_21;
  }

- (BOOL)isLocalDeviceQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerPath]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 route]);
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 isDeviceRoute];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)isMusicAppQueue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerPath]);
  unsigned __int8 v4 = [v3 isSystemMusicPath];

  return v4;
}

- (id)sectionForItemWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_10003B580;
  __int16 v20 = sub_10003B590;
  id v21 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tracklist]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003B598;
  v12[3] = &unk_10026A4D0;
  id v8 = v7;
  id v13 = v8;
  id v9 = v4;
  id v14 = v9;
  uint64_t v15 = &v16;
  [v8 enumerateSectionsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  invalidationQueue = (dispatch_queue_s *)self->_invalidationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B7D8;
  block[3] = &unk_100268CF0;
  block[4] = self;
  dispatch_async(invalidationQueue, block);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003B878;
  v11[3] = &unk_100269CB0;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(&_dispatch_main_q, v11);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_100038614();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[TVMusicPlayQueue controller:shouldRetryFailedRequestWithError:]";
    __int16 v14 = 2080;
    uint64_t v15 = "-[TVMusicPlayQueue controller:shouldRetryFailedRequestWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  unsigned int v8 = [v5 isInvalidRouteError];
  if (v8)
  {
    invalidationQueue = (dispatch_queue_s *)self->_invalidationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003BAD4;
    block[3] = &unk_100268CF0;
    block[4] = self;
    dispatch_async(invalidationQueue, block);
  }

  return 1;
}

- (void)videoOutputWillStartPictureInPicture:(id)a3
{
  self->_isVideoPictureInPictureRunning = 1;
  self->_isVideoPictureInPictureDismissing = 0;
}

- (void)videoOutputDidStartPictureInPicture:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 postNotificationName:@"TVMusicPlayQueuePictureInPictureDidStartNotification" object:self];
}

- (void)videoOutputWillStopPictureInPicture:(id)a3
{
  self->_isVideoPictureInPictureDismissing = 1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
  [v4 postNotificationName:@"TVMusicPlayQueuePictureInPictureWillStopNotification" object:self];
}

- (void)videoOutputDidStopPictureInPicture:(id)a3
{
  self->_isVideoPictureInPictureDismissing = 0;
  self->_isVideoPictureInPictureRunning = 0;
}

- (void)videoOutput:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  unsigned int v8 = @"TVMusicPlayQueuePictureInPictureWillRestoreCompletionUserInfoKey";
  id v5 = objc_retainBlock(a4);
  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:@"TVMusicPlayQueuePictureInPictureWillRestoreNotification" object:self userInfo:v6];
}

- (void)airplayDetectorAirplayStarted:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TVMusicPlayQueue airplayDetectorAirplayStarted:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicPlayQueue airplayDetectorAirplayStarted:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  unsigned int v8 = sub_10003BF9C;
  id v9 = &unk_100268CF0;
  id v10 = self;
  id v6 = v7;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v8((uint64_t)v6);
  }

  else
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10003FD2C;
    id v12 = &unk_100268D60;
    id v13 = v6;
    dispatch_async(&_dispatch_main_q, buf);
  }
}

- (void)airplayDetectorAirplayEnded:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TVMusicPlayQueue airplayDetectorAirplayEnded:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicPlayQueue airplayDetectorAirplayEnded:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  unsigned int v8 = sub_10003C264;
  id v9 = &unk_100268CF0;
  id v10 = self;
  id v6 = v7;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v8((uint64_t)v6);
  }

  else
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10003FD2C;
    id v12 = &unk_100268D60;
    id v13 = v6;
    dispatch_async(&_dispatch_main_q, buf);
  }
}

- (void)_updatePlayerPathWithRoute:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  id v6 = sub_10003C3E4;
  id v7 = &unk_100268B30;
  unsigned int v8 = self;
  id v3 = a3;
  id v9 = v3;
  id v4 = v5;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v6((uint64_t)v4);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003FD2C;
    block[3] = &unk_100268D60;
    id v11 = v4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (id)_createGlobalPlayerPathWithRoute:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPAVEndpointRoute, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointObject]);
  id v9 = [v8 connectionType];

  if (!v4 || !-[TVMusicPlayQueue isAirplayActive](self, "isAirplayActive") && v9 == (id)6)
  {
    id v10 = 0LL;
LABEL_8:
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MPCPlayerPath systemMusicPathWithRoute:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "systemMusicPathWithRoute:playerID:",  v10,  @"Music"));
    goto LABEL_12;
  }

  if ([v4 isDeviceRoute] && !-[TVMusicPlayQueue isAirplayActive](self, "isAirplayActive"))
  {
    id v10 = v4;
    goto LABEL_8;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MPCPlayerPath pathWithRoute:bundleID:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "pathWithRoute:bundleID:playerID:",  v4,  0LL,  0LL));
LABEL_12:
  id v12 = (void *)v11;
  id v13 = sub_100038614();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543362;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Player path: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  return v12;
}

- (void)_performPlayerCommand:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  unsigned int v8 = v7;
  if (!v7)
  {
    id v10 = sub_100038614();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:

      goto LABEL_16;
    }

    int v14 = 138543618;
    id v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a3;
    id v12 = "Unable to perform command %{public}@ (%ld) because no player response is available.";
    goto LABEL_14;
  }

  switch(a3)
  {
    case 3LL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 stop]);
      break;
    case 2LL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 pause]);
      break;
    case 1LL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 play]);
      break;
    default:
      id v13 = sub_100038614();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      id v12 = "Unsupported command %{public}@ (%ld)";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x16u);
      goto LABEL_15;
  }

  uint64_t v11 = v9;
  if (v9)
  {
    [v9 setLabel:@"com.apple.TVMusic.PlayQueue"];
    -[TVMusicPlayQueue _performPlayerCommandRequest:name:](self, "_performPlayerCommandRequest:name:", v11, v6);
    goto LABEL_15;
  }

- (void)_performPlayerCommandRequest:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100038614();
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Performing player command \"%{public}@\"",  (uint8_t *)&v11,  0xCu);
  }

  if (v5)
  {
    +[MPCPlayerChangeRequest performRequest:description:completion:]( &OBJC_CLASS___MPCPlayerChangeRequest,  "performRequest:description:completion:",  v5,  v6,  0LL);
  }

  else
  {
    id v9 = sub_100038614();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to perform %{public}@ request: No queue command is available.",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (void)_updateMediaItemsWithTrackList:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 items]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 totalItemCount]));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10003C9F8;
  v11[3] = &unk_10026A520;
  id v12 = v5;
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 totalItemCount]));
  int v14 = self;
  id v15 = v4;
  id v16 = v6;
  id v7 = v6;
  id v8 = v4;
  id v9 = v13;
  id v10 = v5;
  objc_msgSend(v10, "tvm_enumerateSectionsUsingBlock:", v11);
  -[TVMusicPlayQueue setMediaItems:](self, "setMediaItems:", v7);
}

- (id)_mediaItemForMPCPlayerResponseItem:(id)a3 section:(id)a4 atIndexPath:(id)a5 tracklist:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
  id v15 = [v14 type];

  if (v15 == (id)9)
  {
    id v19 = objc_alloc(&OBJC_CLASS___TVMusicMPMovieMediaItem);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 movie]);
    id v22 = -[TVMusicMPMovieMediaItem initWithMovie:](v19, "initWithMovie:", v21);
LABEL_9:
    id v24 = (TVMusicMPSongMediaItem *)v22;

    goto LABEL_29;
  }

  if (v15 == (id)6)
  {
    id v23 = objc_alloc(&OBJC_CLASS___TVMusicMPTVEpisodeMediaItem);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 tvEpisode]);
    id v22 = -[TVMusicMPTVEpisodeMediaItem initWithTVEpisode:](v23, "initWithTVEpisode:", v21);
    goto LABEL_9;
  }

  if (v15 == (id)1)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if (-[TVMusicPlayQueue isRadioPlayback](self, "isRadioPlayback")
      && (int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue radioStationName](self, "radioStationName")),
          v17,
          v17))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue radioStationName](self, "radioStationName"));
      [v16 setObject:v18 forKeyedSubscript:TVPMediaItemMetadataRadioStationName];
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 tracklist]);
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 items]);
      uint64_t v33 = (uint64_t)[v32 totalItemCount];

      if (v33 >= 2) {
        [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"TVMusicMediaItemMetadataShouldSkipVideo"];
      }
    }

    int64_t v34 = &MPModelPropertyTVShowEpisodeCount_ptr;
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v10 isAutoPlay]));
    [v16 setObject:v35 forKeyedSubscript:TVPMediaItemMetadataAutoplaying];

    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
    if (!v36) {
      goto LABEL_28;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
    [v16 setObject:v37 forKeyedSubscript:@"TVMusicMediaItemMetadataMPModelContainer"];

    v38 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
    if ([v38 type] == (id)13)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 radioStation]);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 attributionLabel]);

      if (!v41) {
        goto LABEL_20;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v38 radioStation]);
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 attributionLabel]);
      [v16 setObject:v43 forKeyedSubscript:TVPMediaItemMetadataRadioStationAttribution];
    }

LABEL_20:
    v44 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
    id v45 = [v44 type];

    if (v45 == (id)13)
    {
      [v16 setObject:TVPMediaItemMetadataContainerKindRadio forKeyedSubscript:TVPMediaItemMetadataContainerKind];
      v46 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 radioStation]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v47 name]);
      int64_t v34 = &MPModelPropertyTVShowEpisodeCount_ptr;
    }

    else
    {
      int64_t v34 = &MPModelPropertyTVShowEpisodeCount_ptr;
      if (v45 == (id)4)
      {
        [v16 setObject:TVPMediaItemMetadataContainerKindPlaylist forKeyedSubscript:TVPMediaItemMetadataContainerKind];
        v46 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 playlist]);
        uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 name]);
      }

      else
      {
        if (v45 != (id)2)
        {
LABEL_28:
          id v50 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayQueue _displaySectionMetadataForItemAtIndexPath:tracklist:]( self,  "_displaySectionMetadataForItemAtIndexPath:tracklist:",  v12,  v13));
          [v16 setObject:v50 forKeyedSubscript:TVPMediaItemMetadataDisplaySection];

          uint64_t v51 = v34[275];
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
          v53 = (void *)objc_claimAutoreleasedReturnValue([v52 song]);
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 storeAsset]);
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "numberWithInt:", objc_msgSend( v54,  "endpointType") == (id)1));
          [v16 setObject:v55 forKeyedSubscript:@"TVMusicMediaItemMetadataIsPurchased"];

          id v56 = (void *)objc_claimAutoreleasedReturnValue([v10 enqueueingParticipant]);
          [v16 setObject:v56 forKeyedSubscript:@"TVMusicMediaItemMetadataEnqueuingParticipant"];

          id v57 = objc_alloc(&OBJC_CLASS___TVMusicMPSongMediaItem);
          v58 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
          v59 = (void *)objc_claimAutoreleasedReturnValue([v58 song]);
          id v24 = -[TVMusicMPSongMediaItem initWithSong:mediaItemMetadata:]( v57,  "initWithSong:mediaItemMetadata:",  v59,  v16);

          goto LABEL_29;
        }

        [v16 setObject:TVPMediaItemMetadataContainerKindAlbum forKeyedSubscript:TVPMediaItemMetadataContainerKind];
        v46 = (void *)objc_claimAutoreleasedReturnValue([v11 metadataObject]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 album]);
        uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 title]);
      }

      v49 = (void *)v48;
    }

    [v16 setObject:v49 forKeyedSubscript:TVPMediaItemMetadataContainerName];

    goto LABEL_28;
  }

  id v25 = sub_100038614();
  __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
    id v28 = [v27 type];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 metadataObject]);
    int v61 = 134218242;
    id v62 = v28;
    __int16 v63 = 2112;
    uint64_t v64 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Unhandled metadata type (%ld) for object: [%@]",  (uint8_t *)&v61,  0x16u);
  }

  id v24 = 0LL;
LABEL_29:

  return v24;
}

- (id)_displaySectionMetadataForItemAtIndexPath:(id)a3 tracklist:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 displayIndexPathForStructuredIndexPath:a3]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 displayItems]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", objc_msgSend(v6, "section")));

    if (v8 == (void *)MPCPlayerResponseTracklistDisplaySectionPreviousItems)
    {
      id v10 = (id *)&TVPMediaItemMetadataDisplaySectionPreviousItems;
    }

    else if (v8 == (void *)MPCPlayerResponseTracklistDisplaySectionPlayingItem)
    {
      id v10 = (id *)&TVPMediaItemMetadataDisplaySectionPlayingItem;
    }

    else if (v8 == (void *)MPCPlayerResponseTracklistDisplaySectionNextItems)
    {
      id v10 = (id *)&TVPMediaItemMetadataDisplaySectionNextItems;
    }

    else
    {
      if (v8 != (void *)MPCPlayerResponseTracklistDisplaySectionAutoPlayItems)
      {
        id v9 = 0LL;
LABEL_13:

        goto LABEL_14;
      }

      id v10 = (id *)&TVPMediaItemMetadataDisplaySectionAutoPlayItems;
    }

    id v9 = *v10;
    goto LABEL_13;
  }

  id v9 = 0LL;
LABEL_14:

  return v9;
}

- (int64_t)_tracklistRepeatMode
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  id v4 = [v3 repeatType];

  return -[TVMusicPlayQueue _repeatModeFromRepeatType:](self, "_repeatModeFromRepeatType:", v4);
}

- (int64_t)_repeatModeFromRepeatType:(int64_t)a3
{
  if (a3 == 2) {
    return 1LL;
  }
  else {
    return 2LL * (a3 == 1);
  }
}

- (void)_updatePlayQueue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue requestResponseController](self, "requestResponseController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 response]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tracklist]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 playingItemIndexPath]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playingItemIndexPath]);
    id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", objc_msgSend(v8, "section")));

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 metadataObject]);
      uint64_t v6 = [v10 type] == (id)13;
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  -[TVMusicPlayQueue setTransitioningPlaylist:](self, "setTransitioningPlaylist:", 1LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue responseTrackList](self, "responseTrackList"));
  v236 = -[TVMusicPlayQueue playerState](self, "playerState");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  v239 = (void *)objc_claimAutoreleasedReturnValue([v12 contentItemIdentifier]);
  -[TVMusicPlayQueue currentPlayingElapsedTime](self, "currentPlayingElapsedTime");
  double v14 = v13;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  v238 = (void *)objc_claimAutoreleasedReturnValue([v15 videoView]);

  -[TVMusicPlayQueue durationSnapshot](self, "durationSnapshot");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  -[TVMusicPlayQueue setLastPlayingItem:](self, "setLastPlayingItem:", v16);

  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  v235 = (void *)objc_claimAutoreleasedReturnValue([v17 playerPath]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  -[TVMusicPlayQueue setPreviousPlayerResponse:](self, "setPreviousPlayerResponse:", v18);

  v237 = v12;
  v234 = (void *)objc_claimAutoreleasedReturnValue([v12 nowPlayingAudioFormat]);
  -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"lastPlayerResponse");
  -[TVMusicPlayQueue setPlayerResponse:](self, "setPlayerResponse:", v4);
  -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"lastPlayerResponse");
  -[TVMusicPlayQueue setIsRadioPlayback:](self, "setIsRadioPlayback:", v6);
  if ((v6 & 1) != 0)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 metadataObject]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 radioStation]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 name]);
    -[TVMusicPlayQueue setRadioStationName:](self, "setRadioStationName:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 metadataObject]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 radioStation]);
    -[TVMusicPlayQueue setIsRadioStationStreaming:]( self,  "setIsRadioStationStreaming:",  [v23 type] == (id)4);
  }

  else
  {
    -[TVMusicPlayQueue setRadioStationName:](self, "setRadioStationName:", 0LL);
    -[TVMusicPlayQueue setIsRadioStationStreaming:](self, "setIsRadioStationStreaming:", 0LL);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  id v25 = v24;
  if (v24)
  {
    [v24 duration];
  }

  else
  {
    uint64_t v252 = 0LL;
    __int128 v250 = 0u;
    __int128 v251 = 0u;
    __int128 v249 = 0u;
  }

  v247[0] = v249;
  v247[1] = v250;
  v247[2] = v251;
  uint64_t v248 = v252;
  -[TVMusicPlayQueue setDurationSnapshot:](self, "setDurationSnapshot:", v247);

  __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 videoView]);
  -[TVMusicPlayQueue setIsVideoPlayback:](self, "setIsVideoPlayback:", v27 != 0LL);

  v240 = v11;
  if (!-[TVMusicPlayQueue deviceSupportsVocalAttenuation](self, "deviceSupportsVocalAttenuation")) {
    goto LABEL_42;
  }
  if (-[TVMusicPlayQueue prepareVocalControlsPending](self, "prepareVocalControlsPending")
    && (id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 prepareVocalsControlCommand]),
        v28,
        v28))
  {
    id v29 = sub_100038614();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Enabling pending prepareVocalsControlCommand",  buf,  2u);
    }

    -[TVMusicPlayQueue prepareVocalControls](self, "prepareVocalControls");
  }

  else if (-[TVMusicPlayQueue vocalAttenuationEnablePending](self, "vocalAttenuationEnablePending"))
  {
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 activateVocalsControl:1]);

    if (v32)
    {
      id v33 = sub_100038614();
      int64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Enabling pending activateVocalsControl:YES",  buf,  2u);
      }

      -[TVMusicPlayQueue setVocalAttenuationEnabled:](self, "setVocalAttenuationEnabled:", 1LL);
    }
  }

  uint64_t v35 = objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
  if (v35)
  {
    v36 = (void *)v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
    unsigned int v38 = [v37 isActive];
    int vocalAttenuationEnabled = self->_vocalAttenuationEnabled;

    BOOL v40 = vocalAttenuationEnabled == v38;
    id v11 = v240;
    if (!v40)
    {
      -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"vocalAttenuationEnabled");
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
      self->_int vocalAttenuationEnabled = [v41 isActive];

      -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"vocalAttenuationEnabled");
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
  int v43 = v42 != 0LL;
  int canEnableVocalAttenuation = self->_canEnableVocalAttenuation;

  if (canEnableVocalAttenuation != v43)
  {
    -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"canEnableVocalAttenuation");
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
    self->_int canEnableVocalAttenuation = v45 != 0LL;

    -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"canEnableVocalAttenuation");
  }

  uint64_t v46 = objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
  if (v46)
  {
    v47 = (void *)v46;
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
    [v48 level];
    float v50 = v49;
    float vocalAttenuationLevel = self->_vocalAttenuationLevel;

    if (v50 != vocalAttenuationLevel)
    {
      -[TVMusicPlayQueue willChangeValueForKey:](self, "willChangeValueForKey:", @"vocalAttenuationLevel");
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v5 vocalsControlCommand]);
      [v52 level];
      self->_float vocalAttenuationLevel = v53;

      -[TVMusicPlayQueue didChangeValueForKey:](self, "didChangeValueForKey:", @"vocalAttenuationLevel");
    }
  }

  if (!self->_vocalAttenuationEnabled
    || v236 != (void *)2
    || (id)-[TVMusicPlayQueue playerState](self, "playerState") != (id)2)
  {
    if (!-[TVMusicPlayQueue vocalLevelIsTransitioning](self, "vocalLevelIsTransitioning")
      || (id)-[TVMusicPlayQueue playerState](self, "playerState") == (id)2)
    {
      goto LABEL_42;
    }

- (BOOL)isPlayingSpatialAudio
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue currentPlayingItem](self, "currentPlayingItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 nowPlayingAudioFormat]);
  unsigned __int8 v4 = [v3 isSpatialized];

  return v4;
}

- (BOOL)_isUserSubscribed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVMSubscriptionManager sharedInstance](&OBJC_CLASS___TVMSubscriptionManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 hasMusicSubscription];

  return v3;
}

+ (id)_stringForMPCPlayerState:(int64_t)a3
{
  else {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid command: %ld",  a3));
  }
  return v3;
}

+ (id)_debugNameForPlayAction:(unint64_t)a3
{
  if (a3 > 4) {
    return 0LL;
  }
  else {
    return *(&off_10026A598 + a3);
  }
}

- (id)convertPreviousIndexPathToIndexPathForUpdatedPlaylist:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue previousPlayerResponse](self, "previousPlayerResponse"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 tracklist]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue playerResponse](self, "playerResponse"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tracklist]);

  id v9 = 0LL;
  if (v4 && v6 && v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uniqueIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    unsigned int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_22;
    }
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 playingItemIndexPath]);
    if (v13)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 playingItemIndexPath]);
      id v16 = [v14 globalIndexForIndexPath:v15];
    }

    else
    {
      id v16 = 0LL;
    }

    id v17 = [v6 playingItemGlobalIndex];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 playingItemIndexPath]);
    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 playingItemIndexPath]);
      id v21 = [v19 globalIndexForIndexPath:v20];
    }

    else
    {
      id v21 = 0LL;
    }

    id v22 = (char *)[v8 playingItemGlobalIndex];
    id v23 = (char *)[v4 item];
    int64_t v24 = &v21[(void)v17] - &v22[(void)v16];
    unsigned int v25 = -[TVMusicPlayQueue isRadioPlayback](self, "isRadioPlayback");
    int64_t v26 = v21 - (_BYTE *)v16;
    if (!v25) {
      int64_t v26 = v24;
    }
    v27 = &v23[v26];
    if ((uint64_t)&v23[v26] >= 0
      && (id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 items]),
          id v29 = (char *)[v28 totalItemCount],
          v28,
          (uint64_t)v27 < (uint64_t)v29))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 indexPathForGlobalIndex:v27]);

      id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 indexPathForGlobalIndex:v23]);

      if (v33)
      {
        int64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v6 items]);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 itemAtIndexPath:v33]);

        v36 = (void *)objc_claimAutoreleasedReturnValue([v8 items]);
        v37 = (void *)objc_claimAutoreleasedReturnValue([v36 itemAtIndexPath:v31]);

        id v9 = 0LL;
        if (v35)
        {
          if (v37)
          {
            unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue([v37 contentItemIdentifier]);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v35 contentItemIdentifier]);
            unsigned int v41 = [v38 isEqualToString:v39];

            id v9 = 0LL;
            if (v41)
            {
              if (v31) {
                id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v27,  0LL));
              }
            }
          }
        }
      }

      else
      {
        id v9 = 0LL;
      }
    }

    else
    {
LABEL_22:
      id v9 = 0LL;
    }
  }

  return v9;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[TVMusicPlayQueue _applicationDidBecomeActive:]";
    __int16 v8 = 2080;
    id v9 = "-[TVMusicPlayQueue _applicationDidBecomeActive:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v6, 0x16u);
  }

  -[TVMusicPlayQueue updatePlayerPath](self, "updatePlayerPath");
}

- (void)_repeatModeSettingDidChange:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TVMusicPlayQueue _repeatModeSettingDidChange:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMusicPlayQueue _repeatModeSettingDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  __int16 v8 = sub_10003F434;
  id v9 = &unk_100268CF0;
  id v10 = self;
  int v6 = v7;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v8((uint64_t)v6);
  }

  else
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10003FD2C;
    unsigned int v12 = &unk_100268D60;
    double v13 = v6;
    dispatch_async(&_dispatch_main_q, buf);
  }
}

- (void)_activeSystemRouteDidChange:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[TVMusicPlayQueue _activeSystemRouteDidChange:]";
    __int16 v8 = 2080;
    id v9 = "-[TVMusicPlayQueue _activeSystemRouteDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v6, 0x16u);
  }

  -[TVMusicPlayQueue updatePlayerPath](self, "updatePlayerPath");
}

- (void)_libraryWasUpdated:(id)a3
{
  id v4 = sub_100038614();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[TVMusicPlayQueue _libraryWasUpdated:]";
    __int16 v9 = 2080;
    id v10 = "-[TVMusicPlayQueue _libraryWasUpdated:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v7, 0x16u);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayQueue requestResponseController](self, "requestResponseController"));
  [v6 setNeedsReload];
}

- (BOOL)supportsShuffle
{
  return self->_supportsShuffle;
}

- (void)setSupportsShuffle:(BOOL)a3
{
  self->_supportsShuffle = a3;
}

- (BOOL)supportsRepeat
{
  return self->_supportsRepeat;
}

- (void)setSupportsRepeat:(BOOL)a3
{
  self->_supportsRepeat = a3;
}

- (TVMusicPlayQueueDelegate)delegate
{
  return (TVMusicPlayQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MPCPlayerResponseItem)lastPlayingItem
{
  return self->_lastPlayingItem;
}

- (void)setLastPlayingItem:(id)a3
{
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3 = *(_OWORD *)&self[3].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[3].var7;
  *(double *)&retstr->var7 = self[4].var1;
  return self;
}

- (void)setDurationSnapshot:(id *)a3
{
  __int128 v4 = *(_OWORD *)&a3->var2;
  __int128 v3 = *(_OWORD *)&a3->var4;
  __int128 v5 = *(_OWORD *)&a3->var0;
  *(void *)&self->_durationSnapshot.isLiveContent = *(void *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v4;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v3;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v5;
}

- (NSString)radioStationName
{
  return self->_radioStationName;
}

- (void)setRadioStationName:(id)a3
{
}

- (BOOL)isRadioPlayback
{
  return self->_isRadioPlayback;
}

- (void)setIsRadioPlayback:(BOOL)a3
{
  self->_isRadioPlayback = a3;
}

- (BOOL)isRadioStationStreaming
{
  return self->_isRadioStationStreaming;
}

- (void)setIsRadioStationStreaming:(BOOL)a3
{
  self->_isRadioStationStreaming = a3;
}

- (BOOL)isVideoPictureInPictureDismissing
{
  return self->_isVideoPictureInPictureDismissing;
}

- (BOOL)isVideoPictureInPictureRunning
{
  return self->_isVideoPictureInPictureRunning;
}

- (BOOL)isVideoPlayback
{
  return self->_isVideoPlayback;
}

- (void)setIsVideoPlayback:(BOOL)a3
{
  self->_isVideoPlayback = a3;
}

- (BOOL)isAirplayActive
{
  return self->_isAirplayActive;
}

- (void)setIsAirplayActive:(BOOL)a3
{
  self->_isAirplayActive = a3;
}

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (void)setVideoOutput:(id)a3
{
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)externalEndpointsAvailable
{
  return self->_externalEndpointsAvailable;
}

- (void)setExternalEndpointsAvailable:(BOOL)a3
{
  self->_externalEndpointsAvailable = a3;
}

- (BOOL)canEnableVocalAttenuation
{
  return self->_canEnableVocalAttenuation;
}

- (BOOL)vocalAttenuationEnabled
{
  return self->_vocalAttenuationEnabled;
}

- (float)vocalAttenuationLevel
{
  return self->_vocalAttenuationLevel;
}

- (BOOL)vocalAttenuationLevelIsContinuous
{
  return self->_vocalAttenuationLevelIsContinuous;
}

- (void)setVocalAttenuationLevelIsContinuous:(BOOL)a3
{
  self->_vocalAttenuationLevelIsContinuous = a3;
}

- (double)pendingElapsedTime
{
  return self->_pendingElapsedTime;
}

- (void)setPendingElapsedTime:(double)a3
{
  self->_pendingElapsedTime = a3;
}

- (BOOL)isPendingElapsedTimeChange
{
  return self->_pendingElapsedTimeChange;
}

- (void)setPendingElapsedTimeChange:(BOOL)a3
{
  self->_pendingElapsedTimeChange = a3;
}

- (MPRequestResponseController)requestResponseController
{
  return self->_requestResponseController;
}

- (void)setRequestResponseController:(id)a3
{
}

- (MPCPlayerResponse)playerResponse
{
  return self->_playerResponse;
}

- (void)setPlayerResponse:(id)a3
{
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (MPCPlayerResponse)previousPlayerResponse
{
  return self->_previousPlayerResponse;
}

- (void)setPreviousPlayerResponse:(id)a3
{
}

- (BOOL)isTransitioningPlaylist
{
  return self->_transitioningPlaylist;
}

- (void)setTransitioningPlaylist:(BOOL)a3
{
  self->_transitioningPlaylist = a3;
}

- (NSString)tracklistIdentifier
{
  return self->_tracklistIdentifier;
}

- (void)setTracklistIdentifier:(id)a3
{
}

- (MPModelGenericObject)currentSectionMetadataObject
{
  return self->_currentSectionMetadataObject;
}

- (void)setCurrentSectionMetadataObject:(id)a3
{
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (BOOL)deviceSupportsVocalAttenuation
{
  return self->_deviceSupportsVocalAttenuation;
}

- (void)setDeviceSupportsVocalAttenuation:(BOOL)a3
{
  self->_deviceSupportsVocalAttenuation = a3;
}

- (double)timeOfVocalLevelChange
{
  return self->_timeOfVocalLevelChange;
}

- (void)setTimeOfVocalLevelChange:(double)a3
{
  self->_timeOfVocalLevelChange = a3;
}

- (BOOL)vocalLevelIsTransitioning
{
  return self->_vocalLevelIsTransitioning;
}

- (void)setVocalLevelIsTransitioning:(BOOL)a3
{
  self->_vocalLevelIsTransitioning = a3;
}

- (BOOL)vocalAttenuationEnablePending
{
  return self->_vocalAttenuationEnablePending;
}

- (void)setVocalAttenuationEnablePending:(BOOL)a3
{
  self->_vocalAttenuationEnablePending = a3;
}

- (BOOL)prepareVocalControlsPending
{
  return self->_prepareVocalControlsPending;
}

- (void)setPrepareVocalControlsPending:(BOOL)a3
{
  self->_prepareVocalControlsPending = a3;
}

- (void).cxx_destruct
{
}

@end