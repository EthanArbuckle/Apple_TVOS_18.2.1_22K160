@interface MRDNowPlayingServerResult
- (BOOL)isActivity;
- (BOOL)isLocalOrigin;
- (MRDMediaRemoteClient)xpcClient;
- (MRDNowPlayingClient)nowPlayingClient;
- (MRDNowPlayingOriginClient)originClient;
- (MRDNowPlayingPlayerClient)playerClient;
- (MRDNowPlayingServerResult)initWithUnresolvedPlayerPath:(id)a3;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)unresolvedPlayerPath;
- (id)description;
- (unsigned)error;
- (void)setError:(unsigned int)a3;
- (void)setNowPlayingClient:(id)a3;
- (void)setOriginClient:(id)a3;
- (void)setPlayerClient:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setXpcClient:(id)a3;
@end

@implementation MRDNowPlayingServerResult

- (MRDNowPlayingServerResult)initWithUnresolvedPlayerPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDNowPlayingServerResult;
  v5 = -[MRDNowPlayingServerResult init](&v9, "init");
  if (v5)
  {
    v6 = (MRPlayerPath *)[v4 copy];
    unresolvedPlayerPath = v5->_unresolvedPlayerPath;
    v5->_unresolvedPlayerPath = v6;
  }

  return v5;
}

- (BOOL)isLocalOrigin
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult playerPath](self, "playerPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 origin]);
  unsigned __int8 v4 = [v3 isLocal];

  return v4;
}

- (BOOL)isActivity
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult originClient](self, "originClient"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activity]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult originClient](self, "originClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activity]);
    unsigned int v7 = [v6 creatorProcessID];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult nowPlayingClient](self, "nowPlayingClient"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
    BOOL v10 = v7 == [v9 processIdentifier];
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRDNowPlayingServerResult;
  id v3 = -[MRDNowPlayingServerResult description](&v7, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" %@", self->_playerPath]);

  return v5;
}

- (MRDMediaRemoteClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
}

- (MRDNowPlayingPlayerClient)playerClient
{
  return self->_playerClient;
}

- (void)setPlayerClient:(id)a3
{
}

- (MRDNowPlayingClient)nowPlayingClient
{
  return self->_nowPlayingClient;
}

- (void)setNowPlayingClient:(id)a3
{
}

- (MRDNowPlayingOriginClient)originClient
{
  return self->_originClient;
}

- (void)setOriginClient:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MRPlayerPath)unresolvedPlayerPath
{
  return self->_unresolvedPlayerPath;
}

- (unsigned)error
{
  return self->_error;
}

- (void)setError:(unsigned int)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
}

@end