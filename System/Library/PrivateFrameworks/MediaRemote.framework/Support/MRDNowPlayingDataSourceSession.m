@interface MRDNowPlayingDataSourceSession
- (BOOL)isPlaying;
- (MRDNowPlayingDataSourceSession)initWithBundleID:(id)a3 audioSessionID:(id)a4 isPlaying:(BOOL)a5;
- (NSNumber)audioSessionID;
- (NSString)bundleID;
- (id)description;
- (id)dictionaryRepresentation;
@end

@implementation MRDNowPlayingDataSourceSession

- (MRDNowPlayingDataSourceSession)initWithBundleID:(id)a3 audioSessionID:(id)a4 isPlaying:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDNowPlayingDataSourceSession;
  v11 = -[MRDNowPlayingDataSourceSession init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleID, a3);
    objc_storeStrong((id *)&v12->_audioSessionID, a4);
    v12->_playing = a5;
  }

  return v12;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceSession dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceSession bundleID](self, "bundleID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"bundleID");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceSession audioSessionID](self, "audioSessionID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"audioSessionID");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MRDNowPlayingDataSourceSession isPlaying](self, "isPlaying")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"isPlaying");

  return v3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
}

@end