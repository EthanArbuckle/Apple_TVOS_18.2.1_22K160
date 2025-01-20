@interface _TVMusicNowPlayingInvalidationContext
- (BOOL)playingItem;
- (BOOL)queue;
- (BOOL)video;
- (id)description;
- (void)setPlayingItem:(BOOL)a3;
- (void)setQueue:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
@end

@implementation _TVMusicNowPlayingInvalidationContext

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVMusicNowPlayingInvalidationContext;
  id v3 = -[_TVMusicNowPlayingInvalidationContext description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVMusicNowPlayingInvalidationContext queue](self, "queue")));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVMusicNowPlayingInvalidationContext playingItem](self, "playingItem")));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVMusicNowPlayingInvalidationContext video](self, "video")));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@, queue: %@, playingItem: %@, video: %@",  v4,  v5,  v6,  v7));

  return v8;
}

- (BOOL)queue
{
  return self->_queue;
}

- (void)setQueue:(BOOL)a3
{
  self->_queue = a3;
}

- (BOOL)playingItem
{
  return self->_playingItem;
}

- (void)setPlayingItem:(BOOL)a3
{
  self->_playingItem = a3;
}

- (BOOL)video
{
  return self->_video;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

@end