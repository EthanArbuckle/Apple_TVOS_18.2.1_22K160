@interface MCAssetAudio
- (BOOL)isInUse;
- (NSSet)songs;
- (void)addSong:(id)a3;
- (void)demolish;
- (void)removeSong:(id)a3;
@end

@implementation MCAssetAudio

- (void)demolish
{
  mSongs = self->mSongs;
  if (mSongs)
  {
    -[NSMutableSet removeAllObjects](mSongs, "removeAllObjects");
  }

  self->mSongs = 0LL;
  objc_sync_exit(self);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCAssetAudio;
  -[MCAsset demolish](&v4, "demolish");
}

- (BOOL)isInUse
{
  return self->mSongs != 0LL;
}

- (NSSet)songs
{
  mSongs = self->mSongs;
  if (mSongs) {
    objc_super v4 = (NSSet *)-[NSMutableSet copy](mSongs, "copy");
  }
  else {
    objc_super v4 = (NSSet *)sEmptySet;
  }
  objc_sync_exit(self);
  return v4;
}

- (void)addSong:(id)a3
{
  mSongs = self->mSongs;
  if (!mSongs)
  {
    mSongs = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    self->mSongs = mSongs;
  }

  -[NSMutableSet addObject:](mSongs, "addObject:", a3);
  objc_sync_exit(self);
}

- (void)removeSong:(id)a3
{
  if (!-[NSMutableSet count](self->mSongs, "count"))
  {

    self->mSongs = 0LL;
  }

  objc_sync_exit(self);
}

@end