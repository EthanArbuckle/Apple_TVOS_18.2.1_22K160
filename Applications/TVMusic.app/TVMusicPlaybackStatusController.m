@interface TVMusicPlaybackStatusController
- (BOOL)isShuffled;
- (MPModelGenericObject)playingItem;
- (MPModelGenericObject)playingSection;
- (MPRequestResponseController)playerRequestController;
- (TVMusicPlaybackStatusController)init;
- (int64_t)playbackState;
- (int64_t)playbackStateforItemWithIdentifiers:(id)a3;
- (int64_t)playbackStateforItemWithIdentifiers:(id)a3 inContainer:(id)a4;
- (void)_playerPathChanged:(id)a3;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)setPlaybackState:(int64_t)a3;
- (void)setPlayerRequestController:(id)a3;
- (void)setPlayingItem:(id)a3;
- (void)setPlayingSection:(id)a3;
- (void)setShuffled:(BOOL)a3;
@end

@implementation TVMusicPlaybackStatusController

- (TVMusicPlaybackStatusController)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackStatusController;
  v2 = -[TVMusicPlaybackStatusController init](&v29, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___MPRequestResponseController);
    -[TVMusicPlaybackStatusController setPlayerRequestController:](v2, "setPlayerRequestController:", v3);

    v28 = (void *)objc_opt_new(&OBJC_CLASS___MPCPlayerRequest);
    [v28 setLabel:@"TVMusicPlaybackStatusController"];
    id v25 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v34[0] = MPModelRelationshipGenericSong;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v35[0] = v27;
    v34[1] = MPModelRelationshipGenericTVEpisode;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v35[1] = v26;
    v34[2] = MPModelRelationshipGenericMovie;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v35[2] = v4;
    v34[3] = MPModelRelationshipGenericPlaylistEntry;
    id v5 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v32[0] = MPModelRelationshipPlaylistEntrySong;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v33[0] = v6;
    v32[1] = MPModelRelationshipPlaylistEntryTVEpisode;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v33[1] = v7;
    v32[2] = MPModelRelationshipPlaylistEntryMovie;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v33[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));
    id v10 = [v5 initWithProperties:&__NSArray0__struct relationships:v9];
    v35[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));
    id v12 = [v25 initWithProperties:&__NSArray0__struct relationships:v11];
    [v28 setPlayingItemProperties:v12];

    id v13 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v30[0] = MPModelRelationshipGenericAlbum;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v31[0] = v14;
    v30[1] = MPModelRelationshipGenericTVSeason;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v31[1] = v15;
    v30[2] = MPModelRelationshipGenericPlaylist;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v31[2] = v16;
    v30[3] = MPModelRelationshipGenericRadioStation;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
    v31[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  4LL));
    id v19 = [v13 initWithProperties:&__NSArray0__struct relationships:v18];
    [v28 setQueueSectionProperties:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playerRequestController](v2, "playerRequestController"));
    [v20 setDelegate:v2];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playerRequestController](v2, "playerRequestController"));
    [v21 setRequest:v28];

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playerRequestController](v2, "playerRequestController"));
    [v22 beginAutomaticResponseLoading];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v2 selector:"_playerPathChanged:" name:@"TVMusicPlayQueuePlayerPathChangedNotification" object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[MPRequestResponseController setDelegate:](self->_playerRequestController, "setDelegate:", 0LL);
  -[MPRequestResponseController endAutomaticResponseLoading]( self->_playerRequestController,  "endAutomaticResponseLoading");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackStatusController;
  -[TVMusicPlaybackStatusController dealloc](&v4, "dealloc");
}

- (int64_t)playbackStateforItemWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingItem](self, "playingItem"));

  if (!v5) {
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingItem](self, "playingItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  unsigned int v8 = [v4 intersectsSet:v7];

  if (v8)
  {
    if ((id)-[TVMusicPlaybackStatusController playbackState](self, "playbackState") == (id)2) {
      int64_t v9 = 2LL;
    }
    else {
      int64_t v9 = 1LL;
    }
    goto LABEL_14;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingItem](self, "playingItem"));
  id v11 = [v10 type];

  if (v11 != (id)5)
  {
LABEL_11:
    int64_t v9 = 0LL;
    goto LABEL_14;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingItem](self, "playingItem"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 flattenedGenericObject]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 identifiers]);
  LODWORD(v13) = [v4 intersectsSet:v15];

  if ((_DWORD)v13)
  {
    if ((id)-[TVMusicPlaybackStatusController playbackState](self, "playbackState") == (id)2) {
      int64_t v9 = 2LL;
    }
    else {
      int64_t v9 = 1LL;
    }
  }

  else
  {
    int64_t v9 = 0LL;
  }

LABEL_14:
  return v9;
}

- (int64_t)playbackStateforItemWithIdentifiers:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingSection](self, "playingSection"));

  if (!v8)
  {
    if (!v7) {
      goto LABEL_6;
    }
LABEL_9:
    int64_t v15 = 0LL;
    goto LABEL_10;
  }

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingSection](self, "playingSection"));
  id v10 = [v9 type];
  if (v10 != [v7 type])
  {

    goto LABEL_9;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playingSection](self, "playingSection"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifiers]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
  unsigned __int8 v14 = [v12 intersectsSet:v13];

  if ((v14 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  if (v6)
  {
    int64_t v15 = -[TVMusicPlaybackStatusController playbackStateforItemWithIdentifiers:]( self,  "playbackStateforItemWithIdentifiers:",  v6);
  }

  else if ((id)-[TVMusicPlaybackStatusController playbackState](self, "playbackState") == (id)2)
  {
    int64_t v15 = 2LL;
  }

  else
  {
    int64_t v15 = 1LL;
  }

- (void)_playerPathChanged:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v14 object]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicPlayQueue, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v14 object]);
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 audioRoute]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPCPlayerPath systemMusicPathWithRoute:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "systemMusicPathWithRoute:playerID:",  v9,  @"Music"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playerRequestController](self, "playerRequestController"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 request]);
    [v12 setPlayerPath:v10];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackStatusController playerRequestController](self, "playerRequestController"));
    [v13 setNeedsReloadForSignificantRequestChange];
  }
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100081630;
  block[3] = &unk_100269CB0;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  dispatch_async(&_dispatch_main_q, block);
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (MPModelGenericObject)playingSection
{
  return self->_playingSection;
}

- (void)setPlayingSection:(id)a3
{
}

- (MPModelGenericObject)playingItem
{
  return self->_playingItem;
}

- (void)setPlayingItem:(id)a3
{
}

- (BOOL)isShuffled
{
  return self->_shuffled;
}

- (void)setShuffled:(BOOL)a3
{
  self->_shuffled = a3;
}

- (MPRequestResponseController)playerRequestController
{
  return self->_playerRequestController;
}

- (void)setPlayerRequestController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end