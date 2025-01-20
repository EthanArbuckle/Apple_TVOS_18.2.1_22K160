@interface MRAudioPlayer
- (AVPlayer)avPlayer;
- (BOOL)isMuted;
- (BOOL)shouldBePlaying;
- (MRAudioPlayer)initWithAudioItems:(id)a3 andAudioPlaylist:(id)a4;
- (double)currentDuckLevel;
- (double)currentVolume;
- (double)duckInDuration;
- (double)duckLevel;
- (double)duckOutDuration;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)localTime;
- (double)parentDuration;
- (double)volume;
- (int64_t)priority;
- (void)dealloc;
- (void)processWithDuckLevel:(double)a3;
- (void)resyncAudioItem;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(double)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setLocalTime:(double)a3;
- (void)setParentDuration:(double)a3;
- (void)setPriority:(int64_t)a3;
- (void)setShouldBePlaying:(BOOL)a3;
- (void)setVolume:(double)a3;
- (void)syncVolumeToAudioPlaylist:(id)a3;
@end

@implementation MRAudioPlayer

- (MRAudioPlayer)initWithAudioItems:(id)a3 andAudioPlaylist:(id)a4
{
  v6 = -[MRAudioPlayer init](self, "init");
  if (v6)
  {
    v6->_avPlayer = objc_alloc_init(&OBJC_CLASS___AVPlayer);
    v7 = (NSArray *)a3;
    v6->_audioItems = v7;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) duration];
          v6->_duration = v12 + v6->_duration;
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v9);
    }

    -[MRAudioPlayer syncVolumeToAudioPlaylist:](v6, "syncVolumeToAudioPlaylist:", a4);
  }

  return v6;
}

- (void)dealloc
{
  self->_avPlayer = 0LL;
  self->_audioItems = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAudioPlayer;
  -[MRAudioPlayer dealloc](&v3, "dealloc");
}

- (void)syncVolumeToAudioPlaylist:(id)a3
{
  self->_volume = v5;
  [a3 fadeInDuration];
  self->_fadeInDuration = v6;
  [a3 fadeOutDuration];
  self->_fadeOutDuration = v7;
  [a3 duckLevel];
  self->_duckLevel = v8;
  [a3 duckInDuration];
  self->_duckInDuration = v9;
  [a3 duckOutDuration];
  self->_duckOutDuration = v10;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v11 = objc_msgSend(a3, "songs", 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend( -[NSArray objectAtIndex:]( self->_audioItems,  "objectAtIndex:",  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "index")),  "syncVolumeToSong:",  *(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (double)currentDuckLevel
{
  double parentDuration = self->_parentDuration;
  double localTime = self->_localTime;
  if (localTime < 0.0) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  double duckInDuration = self->_duckInDuration;
  if (duckInDuration > 0.0) {
    double v4 = (duckInDuration + localTime) / duckInDuration;
  }
  double duckOutDuration = self->_duckOutDuration;
  BOOL v7 = localTime < parentDuration;
  double v8 = duckOutDuration + parentDuration - localTime;
  if (v7) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = v8 / duckOutDuration;
  if (duckOutDuration <= 0.0) {
    double v10 = v9;
  }
  double v11 = fmin(v4, 1.0);
  if (v10 >= v11) {
    double v10 = v11;
  }
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  return 1.0 - (1.0 - self->_duckLevel) * v10;
}

- (void)setShouldBePlaying:(BOOL)a3
{
  self->_shouldBePlaying = a3;
  if (!a3)
  {
    -[AVPlayer rate](self->_avPlayer, "rate");
    if (v4 > 0.0) {
      -[AVPlayer pause](self->_avPlayer, "pause");
    }
  }

- (void)processWithDuckLevel:(double)a3
{
  double fadeInDuration = self->_fadeInDuration;
  double v6 = 1.0;
  double v7 = 1.0;
  if (fadeInDuration > 0.0) {
    double v7 = fmod(self->_localTime, self->_duration) / fadeInDuration;
  }
  double fadeOutDuration = self->_fadeOutDuration;
  if (fadeOutDuration > 0.0)
  {
    double localTime = self->_localTime;
    double v10 = fmin((self->_duration - fmod(localTime, self->_duration)) / fadeOutDuration, 1.0);
    if (v10 >= (self->_parentDuration - localTime) / fadeOutDuration) {
      double v6 = (self->_parentDuration - localTime) / fadeOutDuration;
    }
    else {
      double v6 = v10;
    }
  }

  double v11 = fmin(v7, 1.0);
  if (v6 >= v11) {
    double v6 = v11;
  }
  double volume = self->_volume;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  audioItems = self->_audioItems;
  id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( audioItems,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v31;
    double v17 = 0.0;
LABEL_11:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(audioItems);
      }
      __int128 v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
      double v20 = self->_localTime;
      [v19 duration];
      if (v20 < v17 + v21) {
        break;
      }
      [v19 duration];
      double v17 = v17 + v22;
      if (v15 == (id)++v18)
      {
        id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( audioItems,  "countByEnumeratingWithState:objects:count:",  &v30,  v34,  16LL);
        if (v15) {
          goto LABEL_11;
        }
        __int128 v19 = 0LL;
        break;
      }
    }
  }

  else
  {
    __int128 v19 = 0LL;
    double v17 = 0.0;
  }

  double v23 = volume * a3;
  v24 = (AVPlayerItem *)[v19 avPlayerItem];
  if (v24 != -[AVPlayer currentItem](self->_avPlayer, "currentItem"))
  {
    double v25 = self->_localTime - v17;
    [v19 startTime];
    [v19 gotoTime:v25 + v26];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1B2874;
    v29[3] = &unk_24D9B8;
    v29[4] = v24;
    v29[5] = self;
    dispatch_async(&_dispatch_main_q, v29);
  }

  double v27 = v6 * v23;
  if (v19)
  {
    [v19 volumeAtTime:self->_localTime - v17];
    double v27 = v27 * v28;
  }

  self->_currentVolume = v27;
}

- (void)resyncAudioItem
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  audioItems = self->_audioItems;
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( audioItems,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(audioItems);
      }
      double v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      double localTime = self->_localTime;
      [v9 duration];
      if (localTime < v7 + v11) {
        break;
      }
      [v9 duration];
      double v7 = v7 + v12;
      if (v5 == (id)++v8)
      {
        id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( audioItems,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        if (v5) {
          goto LABEL_3;
        }
        double v9 = 0LL;
        break;
      }
    }
  }

  else
  {
    double v9 = 0LL;
    double v7 = 0.0;
  }

  double v13 = self->_localTime - v7;
  [v9 startTime];
  [v9 gotoTime:v13 + v14];
  id v15 = (AVPlayerItem *)[v9 avPlayerItem];
  if (v15 != -[AVPlayer currentItem](self->_avPlayer, "currentItem"))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1B2A58;
    v16[3] = &unk_24D9B8;
    v16[4] = v15;
    v16[5] = self;
    dispatch_async(&_dispatch_main_q, v16);
  }

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (double)duration
{
  return self->_duration;
}

- (double)parentDuration
{
  return self->_parentDuration;
}

- (void)setParentDuration:(double)a3
{
  self->_double parentDuration = a3;
}

- (double)localTime
{
  return self->_localTime;
}

- (void)setLocalTime:(double)a3
{
  self->_double localTime = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_double volume = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_double fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_double fadeOutDuration = a3;
}

- (double)duckLevel
{
  return self->_duckLevel;
}

- (void)setDuckLevel:(double)a3
{
  self->_duckLevel = a3;
}

- (double)duckInDuration
{
  return self->_duckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->_double duckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->_duckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->_double duckOutDuration = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (double)currentVolume
{
  return self->_currentVolume;
}

- (BOOL)shouldBePlaying
{
  return self->_shouldBePlaying;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

@end