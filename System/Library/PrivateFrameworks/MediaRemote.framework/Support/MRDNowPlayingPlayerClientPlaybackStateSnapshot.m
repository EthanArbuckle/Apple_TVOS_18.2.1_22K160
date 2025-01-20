@interface MRDNowPlayingPlayerClientPlaybackStateSnapshot
- (MRDNowPlayingPlayerClientPlaybackState)playerPlaybackState;
- (NSDate)date;
- (NSString)playbackStateDescription;
- (id)description;
- (int64_t)compare:(id)a3;
- (unsigned)playbackState;
- (void)setPlayerPlaybackState:(id)a3;
@end

@implementation MRDNowPlayingPlayerClientPlaybackStateSnapshot

- (NSDate)date
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClientPlaybackStateSnapshot playerPlaybackState](self, "playerPlaybackState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 date]);

  return (NSDate *)v3;
}

- (unsigned)playbackState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClientPlaybackStateSnapshot playerPlaybackState](self, "playerPlaybackState"));
  unsigned int v3 = [v2 playbackState];

  return v3;
}

- (NSString)playbackStateDescription
{
  return (NSString *)(id)MRMediaRemoteCopyPlaybackStateDescription( -[MRDNowPlayingPlayerClientPlaybackStateSnapshot playbackState]( self,  "playbackState"));
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  self->_playerPlaybackState);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingPlayerClientPlaybackStateSnapshot date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 date]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (MRDNowPlayingPlayerClientPlaybackState)playerPlaybackState
{
  return self->_playerPlaybackState;
}

- (void)setPlayerPlaybackState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end