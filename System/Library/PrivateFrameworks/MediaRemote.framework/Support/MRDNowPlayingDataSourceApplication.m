@interface MRDNowPlayingDataSourceApplication
- (BOOL)isEligible;
- (MRDNowPlayingDataSourceApplication)initWithPID:(int)a3 audioSessionID:(id)a4 mxSessionIDs:(id)a5 isEligible:(BOOL)a6;
- (NSNumber)audioSessionID;
- (NSSet)mxSessionIDs;
- (NSString)nowPlayingApplicationDisplayID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)pid;
@end

@implementation MRDNowPlayingDataSourceApplication

- (MRDNowPlayingDataSourceApplication)initWithPID:(int)a3 audioSessionID:(id)a4 mxSessionIDs:(id)a5 isEligible:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDNowPlayingDataSourceApplication;
  v13 = -[MRDNowPlayingDataSourceApplication init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_pid = a3;
    objc_storeStrong((id *)&v13->_audioSessionID, a4);
    objc_storeStrong((id *)&v14->_mxSessionIDs, a5);
    v14->_isEligible = a6;
  }

  return v14;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceApplication dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingDataSourceApplication nowPlayingApplicationDisplayID]( self,  "nowPlayingApplicationDisplayID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"bundleID");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceApplication audioSessionID](self, "audioSessionID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"audioSessionID");

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[MRDNowPlayingDataSourceApplication pid](self, "pid")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"pid");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingDataSourceApplication mxSessionIDs](self, "mxSessionIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"mxSessionIDs");

  return v3;
}

- (NSString)nowPlayingApplicationDisplayID
{
  v2 = sub_10013D19C(self->_pid);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (int)pid
{
  return self->_pid;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (void).cxx_destruct
{
}

@end