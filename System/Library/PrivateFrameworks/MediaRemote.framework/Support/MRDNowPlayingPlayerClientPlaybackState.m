@interface MRDNowPlayingPlayerClientPlaybackState
- (MRDNowPlayingPlayerClientPlaybackState)initWithPlaybackState:(unsigned int)a3 date:(id)a4;
- (NSDate)date;
- (id)description;
- (unsigned)playbackState;
@end

@implementation MRDNowPlayingPlayerClientPlaybackState

- (MRDNowPlayingPlayerClientPlaybackState)initWithPlaybackState:(unsigned int)a3 date:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDNowPlayingPlayerClientPlaybackState;
  v7 = -[MRDNowPlayingPlayerClientPlaybackState init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_playbackState = a3;
    if (v6) {
      v9 = (NSDate *)v6;
    }
    else {
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }
    date = v8->_date;
    v8->_date = v9;
  }

  return v8;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)MRMediaRemoteCopyPlaybackStateDescription(self->_playbackState);
  v5 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@-%@", v4, self->_date);

  return v5;
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end