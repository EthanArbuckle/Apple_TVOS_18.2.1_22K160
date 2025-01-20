@interface MPAudioPlaylist
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)audioPlaylist;
- (MPAudioPlaylist)init;
- (double)duckInDuration;
- (double)duckLevel;
- (double)duckOutDuration;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (id)audioPlaylist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)montage;
- (id)objectInSongsAtIndex:(int64_t)a3;
- (id)parentDocument;
- (id)parentObject;
- (id)songs;
- (int64_t)countOfSongs;
- (void)addSong:(id)a3;
- (void)addSongs:(id)a3;
- (void)copySongs:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)insertObject:(id)a3 inSongsAtIndex:(int64_t)a4;
- (void)insertSongs:(id)a3 atIndex:(int64_t)a4;
- (void)moveSongsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllSongs;
- (void)removeObjectFromSongsAtIndex:(int64_t)a3;
- (void)removeSongsAtIndices:(id)a3;
- (void)replaceObjectInSongsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(double)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setMontage:(id)a3;
- (void)setParentObject:(id)a3;
- (void)setPlug:(id)a3;
@end

@implementation MPAudioPlaylist

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"songs"] ^ 1;
}

+ (id)audioPlaylist
{
  return objc_alloc_init((Class)a1);
}

- (MPAudioPlaylist)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MPAudioPlaylist;
  v2 = -[MPAudioPlaylist init](&v4, "init");
  if (v2)
  {
    v2->_internal = objc_alloc_init(&OBJC_CLASS___MPPlaylistInternal);
    v2->_songs = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v2->_attributes = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    *(_OWORD *)&v2->_audioPlaylist = 0u;
    *(_OWORD *)&v2->_parentObject = 0u;
    -[MPPlaylistInternal setDuration:](v2->_internal, "setDuration:", 0.0);
    -[MPPlaylistInternal setFadeInDuration:](v2->_internal, "setFadeInDuration:", 0.0);
    -[MPPlaylistInternal setFadeOutDuration:](v2->_internal, "setFadeOutDuration:", 0.0);
    -[MPPlaylistInternal setDuckInDuration:](v2->_internal, "setDuckInDuration:", 0.0);
    -[MPPlaylistInternal setDuckOutDuration:](v2->_internal, "setDuckOutDuration:", 0.0);
    -[MPPlaylistInternal setDuckLevel:](v2->_internal, "setDuckLevel:", 1.0);
  }

  return v2;
}

- (void)dealloc
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0LL;
  }

  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {

    self->_audioPlaylist = 0LL;
  }

  self->_internal = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPAudioPlaylist;
  -[MPAudioPlaylist dealloc](&v5, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  [v4 copySongs:self->_songs];
  [v4 copyStruct:self->_internal];
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"================================ Audio Playlist ================================\n");
  -[MPAudioPlaylist duration](self, "duration");
  objc_super v5 = -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                   Duration: %f\n",  v4),  "stringByAppendingFormat:",  @"\t             Count of Songs: %d\n",  -[NSMutableArray count](self->_songs, "count"));
  if (self->_audioPlaylist) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t               Has Playlist: %@\n",  v6);
}

- (id)songs
{
  return self->_songs;
}

- (void)addSong:(id)a3
{
}

- (void)addSongs:(id)a3
{
}

- (void)insertSongs:(id)a3 atIndex:(int64_t)a4
{
  v7 = +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [a3 count]);
  -[MPAudioPlaylist willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"songs");
  -[NSMutableArray insertObjects:atIndexes:](self->_songs, "insertObjects:atIndexes:", a3, v7);
  -[MPAudioPlaylist duration](self, "duration");
  double v9 = v8;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(a3);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        [v14 setParentPlaylist:self];
        [v14 duration];
        double v9 = v9 + v15;
      }

      id v11 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v11);
  }

  -[MPAudioPlaylist setDuration:](self, "setDuration:", v9);
  if (self->_audioPlaylist)
  {
    id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v17 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend( v16,  "addObject:",  -[MCMontage audioAssetForFileAtPath:]( self->_montage,  "audioAssetForFileAtPath:",  objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)j), "path")));
        }

        id v18 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }

      while (v18);
    }

    id v21 = objc_msgSend( -[MCAudioPlaylist insertSongsForAssets:atIndex:]( self->_audioPlaylist,  "insertSongsForAssets:atIndex:",  v16,  a4),  "objectEnumerator");
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (k = 0LL; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)k), "setSong:", objc_msgSend(v21, "nextObject"));
        }

        id v23 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }

      while (v23);
    }
  }

  -[MPAudioPlaylist didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  2LL,  v7,  @"songs");
}

- (void)removeSongsAtIndices:(id)a3
{
  if (-[NSMutableArray count](self->_songs, "count"))
  {
    -[MPAudioPlaylist willChange:valuesAtIndexes:forKey:]( self,  "willChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"songs");
    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist) {
      -[MCAudioPlaylist removeSongsAtIndices:](audioPlaylist, "removeSongsAtIndices:", a3);
    }
    id v6 = objc_msgSend(-[MPAudioPlaylist parentDocument](self, "parentDocument"), "undoManager");
    -[MPAudioPlaylist duration](self, "duration");
    double v8 = v7;
    id v9 = [a3 lastIndex];
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v11 = -[NSMutableArray objectAtIndex:](self->_songs, "objectAtIndex:", i);
        [v11 duration];
        double v13 = v12;
        [v11 setParentPlaylist:0];
        [v11 setSong:0];
        if (v6) {
          objc_msgSend( objc_msgSend(v6, "prepareWithInvocationTarget:", self),  "insertSongs:atIndex:",  +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11),  i);
        }
        double v8 = v8 - v13;
      }
    }

    double v14 = 0.0;
    if (v8 >= 0.0) {
      double v14 = v8;
    }
    -[MPAudioPlaylist setDuration:](self, "setDuration:", v14);
    -[NSMutableArray removeObjectsAtIndexes:](self->_songs, "removeObjectsAtIndexes:", a3);
    -[MPAudioPlaylist didChange:valuesAtIndexes:forKey:]( self,  "didChange:valuesAtIndexes:forKey:",  3LL,  a3,  @"songs");
  }

- (void)removeAllSongs
{
}

- (void)moveSongsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    -[MCAudioPlaylist moveSongsAtIndices:toIndex:](audioPlaylist, "moveSongsAtIndices:toIndex:", a3, a4);
  }
  id v8 = -[NSMutableArray objectsAtIndexes:](self->_songs, "objectsAtIndexes:", a3);
  -[NSMutableArray removeObjectsAtIndexes:](self->_songs, "removeObjectsAtIndexes:", a3);
  -[NSMutableArray insertObjects:atIndexes:]( self->_songs,  "insertObjects:atIndexes:",  v8,  +[NSIndexSet indexSetWithIndexesInRange:]( NSIndexSet,  "indexSetWithIndexesInRange:",  a4,  [v8 count]));
  -[MPAudioPlaylist didChangeValueForKey:](self, "didChangeValueForKey:", @"songs");
}

- (id)parentObject
{
  return self->_parentObject;
}

- (double)duration
{
  return result;
}

- (double)fadeInDuration
{
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    -[MCAudioPlaylist setFadeInDuration:](audioPlaylist, "setFadeInDuration:", a3);
  }
}

- (double)fadeOutDuration
{
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  plug = self->_plug;
  if (plug
    && objc_msgSend(-[MCPlug idInSupercontainer](plug, "idInSupercontainer"), "hasPrefix:", @"ba"))
  {
    objc_msgSend(-[MPAudioPlaylist parentDocument](self, "parentDocument"), "setAudioFadeOutDuration:", a3);
  }

  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    -[MCAudioPlaylist setFadeOutDuration:](audioPlaylist, "setFadeOutDuration:", a3);
  }
}

- (double)duckInDuration
{
  return result;
}

- (void)setDuckInDuration:(double)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    -[MCAudioPlaylist setDuckInDuration:](audioPlaylist, "setDuckInDuration:", a3);
  }
}

- (double)duckOutDuration
{
  return result;
}

- (void)setDuckOutDuration:(double)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    -[MCAudioPlaylist setDuckOutDuration:](audioPlaylist, "setDuckOutDuration:", a3);
  }
}

- (double)duckLevel
{
  return result;
}

- (void)setDuckLevel:(double)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    *(float *)&double v5 = a3;
    -[MCAudioPlaylist setDuckLevel:](audioPlaylist, "setDuckLevel:", v5);
  }

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)copyStruct:(id)a3
{
}

- (void)copySongs:(id)a3
{
  id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }

  -[MPAudioPlaylist addSongs:](self, "addSongs:", v5);
}

- (id)montage
{
  return self->_montage;
}

- (void)setMontage:(id)a3
{
  self->_montage = (MCMontage *)a3;
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {

    self->_audioPlaylist = 0LL;
  }

  id v6 = (MCAudioPlaylist *)a3;
  self->_audioPlaylist = v6;
  if (v6 && self->_montage)
  {
    if (-[MCAudioPlaylist countOfSongs](v6, "countOfSongs")) {
      -[MCAudioPlaylist removeAllSongs](self->_audioPlaylist, "removeAllSongs");
    }
    id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    songs = self->_songs;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( songs,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (id i = 0LL; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(songs);
          }
          objc_msgSend( v7,  "addObject:",  -[MCMontage audioAssetForFileAtPath:]( self->_montage,  "audioAssetForFileAtPath:",  objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)i), "path")));
        }

        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( songs,  "countByEnumeratingWithState:objects:count:",  &v33,  v39,  16LL);
      }

      while (v10);
    }

    id v13 = objc_msgSend( -[MCAudioPlaylist addSongsForAssets:](self->_audioPlaylist, "addSongsForAssets:", v7),  "objectEnumerator");
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v14 = self->_songs;
    id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (j = 0LL; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "setSong:", objc_msgSend(v13, "nextObject"));
        }

        id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
      }

      while (v16);
    }

    -[MPAudioPlaylist fadeInDuration](self, "fadeInDuration");
    -[MCAudioPlaylist setFadeInDuration:](self->_audioPlaylist, "setFadeInDuration:");
    -[MPAudioPlaylist fadeOutDuration](self, "fadeOutDuration");
    -[MCAudioPlaylist setFadeOutDuration:](self->_audioPlaylist, "setFadeOutDuration:");
    -[MPAudioPlaylist duckInDuration](self, "duckInDuration");
    -[MCAudioPlaylist setDuckInDuration:](self->_audioPlaylist, "setDuckInDuration:");
    -[MPAudioPlaylist duckOutDuration](self, "duckOutDuration");
    -[MCAudioPlaylist setDuckOutDuration:](self->_audioPlaylist, "setDuckOutDuration:");
    -[MPAudioPlaylist duckLevel](self, "duckLevel");
    *(float *)&double v19 = v19;
    -[MCAudioPlaylist setDuckLevel:](self->_audioPlaylist, "setDuckLevel:", v19);
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v20 = self->_songs;
    id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (k = 0LL; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)k) setSong:0];
        }

        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v20,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
      }

      while (v22);
    }
  }

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0LL;
  }

  id v6 = (MCPlug *)a3;
  self->_plug = v6;
  if (v6)
  {
    if (self->_montage)
    {
      uint64_t v8 = v6;
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCPlugParallel, v7);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        if (objc_msgSend( -[MCPlug idInSupercontainer](self->_plug, "idInSupercontainer"),  "hasPrefix:",  @"ba"))
        {
          -[MPAudioPlaylist fadeOutDuration](self, "fadeOutDuration");
          -[MCMontage setAudioFadeOutDuration:](self->_montage, "setAudioFadeOutDuration:");
        }
      }
    }

    if ((objc_opt_respondsToSelector(self->_parentObject, "autoAdjustDuration") & 1) == 0
      || -[MPAudioSupport autoAdjustDuration](self->_parentObject, "autoAdjustDuration"))
    {
      -[MPPlaylistInternal duration](self->_internal, "duration");
      -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:");
    }

    parentObject = self->_parentObject;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v10);
    if ((objc_opt_isKindOfClass(parentObject, v12) & 1) != 0) {
      -[MPAudioSupport resetDuration](self->_parentObject, "resetDuration");
    }
  }

- (void)setParentObject:(id)a3
{
  if (a3 && self->_parentObject)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A playlist may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPAudioPlaylist setDuration:](v3, v4, v5);
  }

  else
  {
    self->_parentObject = (MPAudioSupport *)a3;
  }

- (void)setDuration:(double)a3
{
  parentObject = self->_parentObject;
  if (!parentObject) {
    goto LABEL_8;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, a2);
  if ((objc_opt_isKindOfClass(parentObject, v6) & 1) == 0)
  {
    parentObject = 0LL;
    goto LABEL_8;
  }

  parentObject = self->_parentObject;
  if (!parentObject)
  {
LABEL_8:
    unsigned __int8 v7 = 0;
    char v8 = 1;
    goto LABEL_9;
  }

  if (self->_plug && -[MPAudioSupport loopingMode](self->_parentObject, "loopingMode") == &dword_4)
  {
    unsigned __int8 v7 = objc_msgSend( -[MCPlug idInSupercontainer](self->_plug, "idInSupercontainer"),  "hasPrefix:",  @"ba");
    char v8 = 0;
  }

  else
  {
    char v8 = 0;
    unsigned __int8 v7 = 0;
  }

- (id)parentDocument
{
  parentObject = self->_parentObject;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MPDocument, a2);
  char isKindOfClass = objc_opt_isKindOfClass(parentObject, v4);
  unsigned __int8 v7 = self->_parentObject;
  if ((isKindOfClass & 1) != 0) {
    return v7;
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPNavigator, v6);
  char v10 = objc_opt_isKindOfClass(v7, v9);
  uint64_t v12 = self->_parentObject;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MPLayerGroup, v11);
    char v14 = objc_opt_isKindOfClass(v12, v13);
    uint64_t v12 = self->_parentObject;
    if ((v14 & 1) == 0)
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___MPLayer, v15);
      char v17 = objc_opt_isKindOfClass(v12, v16);
      uint64_t v12 = self->_parentObject;
      if ((v17 & 1) == 0)
      {
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPEffect, v18);
        if ((objc_opt_isKindOfClass(v12, v19) & 1) == 0) {
          return 0LL;
        }
        uint64_t v12 = (MPAudioSupport *)objc_msgSend( -[MPAudioSupport parentContainer](self->_parentObject, "parentContainer"),  "parentLayer");
      }
    }
  }

  return -[MPAudioSupport parentDocument](v12, "parentDocument");
}

- (int64_t)countOfSongs
{
  return (int64_t)-[NSMutableArray count](self->_songs, "count");
}

- (id)objectInSongsAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_songs, "objectAtIndex:", a3);
}

- (void)insertObject:(id)a3 inSongsAtIndex:(int64_t)a4
{
}

- (void)removeObjectFromSongsAtIndex:(int64_t)a3
{
}

- (void)replaceObjectInSongsAtIndex:(int64_t)a3 withObject:(id)a4
{
}

@end