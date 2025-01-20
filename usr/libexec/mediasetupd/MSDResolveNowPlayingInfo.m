@interface MSDResolveNowPlayingInfo
- (MSDResolveNowPlayingInfo)initWithMediaRouteID:(id)a3;
- (NSString)mediaRouteID;
- (id)description;
- (void)performNowPlayingInfoResolution:(id)a3;
@end

@implementation MSDResolveNowPlayingInfo

- (MSDResolveNowPlayingInfo)initWithMediaRouteID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSDResolveNowPlayingInfo;
  v6 = -[MSDResolveNowPlayingInfo init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaRouteID, a3);
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<MSDResolveNowPlayingInfo: Identifier: %@>",  self->_mediaRouteID);
}

- (void)performNowPlayingInfoResolution:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[CMSNowPlayingAttributes alloc] initWithMediaRouteIdentifier:self->_mediaRouteID];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10001CFC8;
    v9[3] = &unk_100061960;
    id v10 = v4;
    [v5 fetchNowPlayingInfo:v9];
  }

  else
  {
    id v6 = sub_10003E9DC();
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10001D3AC((os_log_s *)v5, v7, v8);
    }
  }
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (void).cxx_destruct
{
}

@end