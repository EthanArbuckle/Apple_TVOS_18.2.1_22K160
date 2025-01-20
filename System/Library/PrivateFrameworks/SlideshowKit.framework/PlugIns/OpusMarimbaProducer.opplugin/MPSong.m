@interface MPSong
+ (id)song;
+ (id)songWithPath:(id)a3;
- (MPSong)init;
- (MPSong)initWithPath:(id)a3;
- (NSString)path;
- (NSURL)URL;
- (double)audioVolume;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)maxDuration;
- (double)startTime;
- (double)stopTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)parentDocument;
- (id)parentPlaylist;
- (id)song;
- (int64_t)index;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)setAudioVolume:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setInternalDuration;
- (void)setInternalStartTime;
- (void)setParentPlaylist:(id)a3;
- (void)setPath:(id)a3;
- (void)setSong:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setURL:(id)a3;
@end

@implementation MPSong

+ (id)song
{
  return objc_alloc_init((Class)a1);
}

+ (id)songWithPath:(id)a3
{
  return [objc_alloc((Class)a1) initWithPath:a3];
}

- (MPSong)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPSong;
  v2 = -[MPSong init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MPSongInternal);
    v2->_internal = v3;
    v2->_path = 0LL;
    -[MPSongInternal setDuration:](v3, "setDuration:", -1.0);
    -[MPSongInternal setStartTime:](v2->_internal, "setStartTime:", -1.0);
    -[MPSongInternal setAudioVolume:](v2->_internal, "setAudioVolume:", -1.0);
    -[MPSongInternal setFadeInDuration:](v2->_internal, "setFadeInDuration:", 0.0);
    -[MPSongInternal setFadeOutDuration:](v2->_internal, "setFadeOutDuration:", 0.0);
    -[MPSongInternal setAssetLogging:]( v2->_internal,  "setAssetLogging:",  -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"marimbaAssetLogging"));
  }

  return v2;
}

- (MPSong)initWithPath:(id)a3
{
  v4 = -[MPSong init](self, "init");
  if (v4) {
    v4->_path = (NSString *)a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPath:", -[NSString copy](self->_path, "copy"));
  [v4 copyStruct:self->_internal];
  return v4;
}

- (void)dealloc
{
  path = self->_path;
  if (path) {

  }
  song = self->_song;
  if (song)
  {

    self->_song = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MPSong;
  -[MPSong dealloc](&v5, "dealloc");
}

- (id)description
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"==================================== Song %d ===================================\n",  -[MPSong index](self, "index"));
  -[MPSong duration](self, "duration");
  objc_super v5 = -[NSString stringByAppendingFormat:]( v3,  "stringByAppendingFormat:",  @"\t                   Duration: %f\n",  v4);
  if (self->_song) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return -[NSString stringByAppendingFormat:]( v5,  "stringByAppendingFormat:",  @"\t                   Has Song: %@\n",  v6);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  path = self->_path;
  if (path) {

  }
  self->_path = (NSString *)a3;
  -[MPSongInternal duration](self->_internal, "duration");
  double v6 = -1.0;
  BOOL v8 = v7 == -1.0;
  double v9 = -1.0;
  if (!v8) {
    -[MPSong duration](self, "duration", -1.0);
  }
  -[MPSong setDuration:](self, "setDuration:", v9);
  -[MPSongInternal startTime](self->_internal, "startTime");
  if (v10 != -1.0)
  {
    -[MPSong startTime](self, "startTime");
    double v6 = v11;
  }

  -[MPSong setStartTime:](self, "setStartTime:", v6);
  if (self->_song) {
    -[MCSong setAsset:]( self->_song,  "setAsset:",  objc_msgSend( -[MPAudioPlaylist montage](self->_parentPlaylist, "montage"),  "audioAssetForFileAtPath:",  self->_path));
  }
}

- (NSURL)URL
{
  if (self->_path) {
    return +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:");
  }
  else {
    return 0LL;
  }
}

- (void)setURL:(id)a3
{
}

- (double)startTime
{
  if (result == -1.0)
  {
    id v4 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
    if (v4) {
      objc_msgSend(v4, "startTimeForPath:", -[MPSong path](self, "path"));
    }
    else {
      objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "startTimeForAssetAtPath:",  -[MPSong path](self, "path"));
    }
  }

  return result;
}

- (void)setStartTime:(double)a3
{
  id v5 = -[MPSong parentDocument](self, "parentDocument");
  double v6 = v5;
  double v7 = 0.0;
  if (v5)
  {
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
    {
      objc_msgSend(v6, "durationForPath:", -[MPSong path](self, "path"));
      double v7 = v8;
      if (v8 < a3) {
        a3 = v8;
      }
    }
  }

  -[MPSong duration](self, "duration");
  double v10 = v9;
  -[MPSongInternal setStartTime:](self->_internal, "setStartTime:", a3);
  if (v6
    && objc_msgSend( objc_msgSend(v6, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
  {
    -[MPSongInternal duration](self->_internal, "duration");
    if (v11 == -1.0)
    {
      -[MPSong willChangeValueForKey:](self, "willChangeValueForKey:", @"duration");
      parentPlaylist = self->_parentPlaylist;
      if (parentPlaylist)
      {
        -[MPAudioPlaylist duration](self->_parentPlaylist, "duration");
        double v15 = v14;
        -[MPSong duration](self, "duration");
        -[MPAudioPlaylist setDuration:](parentPlaylist, "setDuration:", v15 + v16 - v10);
      }

      -[MPSong didChangeValueForKey:](self, "didChangeValueForKey:", @"duration");
    }

    else
    {
      -[MPSong duration](self, "duration");
      if (v7 != 0.0 && a3 + v12 > v7) {
        -[MPSong setDuration:](self, "setDuration:", v7 - a3);
      }
    }
  }

  song = self->_song;
  if (a3 == -1.0 || !song)
  {
    if (a3 == -1.0)
    {
      if (song) {
        -[MCSong undefineStartTime](song, "undefineStartTime");
      }
    }
  }

  else
  {
    -[MCSong setStartTime:](song, "setStartTime:", a3);
  }

- (double)duration
{
  if (result == -1.0)
  {
    -[MPSong stopTime](self, "stopTime");
    double v5 = v4;
    -[MPSong startTime](self, "startTime");
    return v5 - v6;
  }

  return result;
}

- (void)setDuration:(double)a3
{
  id v5 = -[MPSong parentDocument](self, "parentDocument");
  if (v5)
  {
    double v6 = v5;
    if (objc_msgSend( objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming[0]),  "BOOLValue"))
    {
      objc_msgSend(v6, "durationForPath:", -[MPSong path](self, "path"));
      double v8 = v7;
      -[MPSong startTime](self, "startTime");
      if (v8 != 0.0 && v9 + a3 > v8)
      {
        -[MPSong startTime](self, "startTime");
        a3 = v8 - v10;
      }
    }
  }

  -[MPSong duration](self, "duration");
  double v12 = v11;
  -[MPSongInternal setDuration:](self->_internal, "setDuration:", a3);
  parentPlaylist = self->_parentPlaylist;
  if (parentPlaylist)
  {
    -[MPAudioPlaylist duration](self->_parentPlaylist, "duration");
    double v15 = v14;
    -[MPSong duration](self, "duration");
    -[MPAudioPlaylist setDuration:](parentPlaylist, "setDuration:", v15 + v16 - v12);
  }

  song = self->_song;
  if (!song || a3 == -1.0)
  {
    if (song)
    {
      if (a3 == -1.0) {
        -[MCSong undefineDuration](song, "undefineDuration");
      }
    }
  }

  else
  {
    -[MCSong setDuration:](song, "setDuration:", a3);
  }

- (double)fadeInDuration
{
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  song = self->_song;
  if (song) {
    -[MCSong setFadeInDuration:](song, "setFadeInDuration:", a3);
  }
}

- (double)fadeOutDuration
{
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  song = self->_song;
  if (song) {
    -[MCSong setFadeOutDuration:](song, "setFadeOutDuration:", a3);
  }
}

- (double)audioVolume
{
  if (v3 == -1.0) {
    return 1.0;
  }
  -[MPSongInternal audioVolume](self->_internal, "audioVolume");
  return result;
}

- (void)setAudioVolume:(double)a3
{
  song = self->_song;
  if (song)
  {
    *(float *)&double v5 = a3;
    -[MCSong setVolume:](song, "setVolume:", v5);
  }

- (int64_t)index
{
  return -[MCSong index](self->_song, "index");
}

- (id)parentPlaylist
{
  return self->_parentPlaylist;
}

- (id)song
{
  return self->_song;
}

- (double)maxDuration
{
  id v3 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
  if (v3) {
    objc_msgSend(v3, "durationForPath:", -[MPSong path](self, "path"));
  }
  else {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "durationForAssetAtPath:",  -[MPSong path](self, "path"));
  }
  return result;
}

- (double)stopTime
{
  id v3 = objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
  if (v3) {
    objc_msgSend(v3, "stopTimeForPath:", -[MPSong path](self, "path"));
  }
  else {
    objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "stopTimeForAssetAtPath:",  -[MPSong path](self, "path"));
  }
  return result;
}

- (id)parentDocument
{
  return objc_msgSend(-[MPSong parentPlaylist](self, "parentPlaylist"), "parentDocument");
}

- (void)copyStruct:(id)a3
{
}

- (void)setSong:(id)a3
{
  song = self->_song;
  if (song)
  {

    self->_song = 0LL;
  }

  double v6 = (MCSong *)a3;
  self->_song = v6;
  if (v6)
  {
    -[MPSongInternal audioVolume](self->_internal, "audioVolume");
    if (v7 != -1.0)
    {
      -[MPSongInternal audioVolume](self->_internal, "audioVolume");
      *(float *)&double v8 = v8;
      -[MCSong setVolume:](self->_song, "setVolume:", v8);
    }

    -[MPSongInternal startTime](self->_internal, "startTime");
    if (v9 != -1.0)
    {
      -[MPSongInternal startTime](self->_internal, "startTime");
      -[MCSong setStartTime:](self->_song, "setStartTime:");
    }

    -[MPSongInternal duration](self->_internal, "duration");
    if (v10 != -1.0)
    {
      -[MPSongInternal duration](self->_internal, "duration");
      -[MCSong setDuration:](self->_song, "setDuration:");
    }

    -[MPSongInternal fadeInDuration](self->_internal, "fadeInDuration");
    -[MCSong setFadeInDuration:](self->_song, "setFadeInDuration:");
    -[MPSongInternal fadeOutDuration](self->_internal, "fadeOutDuration");
    -[MCSong setFadeOutDuration:](self->_song, "setFadeOutDuration:");
  }

- (void)setParentPlaylist:(id)a3
{
  if (a3 && self->_parentPlaylist)
  {
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"ManyToOneException",  @"A song may one have one parent.  Please remove it first.  This is unsupported.",  0LL));
    -[MPSong setInternalDuration](v3, v4);
  }

  else
  {
    self->_parentPlaylist = (MPAudioPlaylist *)a3;
  }

- (void)setInternalDuration
{
}

- (void)setInternalStartTime
{
}

@end