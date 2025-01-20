@interface TVMusicPlaybackIntent
+ (id)playbackActionStringFromType:(unint64_t)a3;
+ (unint64_t)playbackActionTypeFromString:(id)a3;
- (BOOL)isFirstTrackExplicit;
- (BOOL)isValidPlaybackIntent;
- (MPCPlaybackIntent)mpcPlaybackIntent;
- (MPIdentifierSet)startItemIdentifiers;
- (MPModelRequest)request;
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (TVMusicPlaybackIntent)initWithRequest:(id)a3 shuffle:(BOOL)a4 playbackAction:(unint64_t)a5;
- (TVMusicPlaybackIntent)initWithRequest:(id)a3 shuffle:(BOOL)a4 startItemIdentifiers:(id)a5;
- (TVMusicPlaybackIntent)initWithStoreIDs:(id)a3 shuffle:(BOOL)a4 playbackAction:(unint64_t)a5 startItemIdentifiers:(id)a6;
- (id)description;
- (int64_t)videoContentRating;
- (unint64_t)firstItemType;
- (unint64_t)playbackAction;
- (unint64_t)playbackType;
- (void)setFirstItemType:(unint64_t)a3;
- (void)setFirstTrackExplicit:(BOOL)a3;
- (void)setMpcPlaybackIntent:(id)a3;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setPlaybackAction:(unint64_t)a3;
- (void)setPlaybackType:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setStartItemIdentifiers:(id)a3;
- (void)setVideoContentRating:(int64_t)a3;
@end

@implementation TVMusicPlaybackIntent

- (TVMusicPlaybackIntent)initWithRequest:(id)a3 shuffle:(BOOL)a4 startItemIdentifiers:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackIntent;
  v11 = -[TVMusicPlaybackIntent init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v12->_playbackAction = 0LL;
    v12->_playbackType = 1LL;
    objc_storeStrong((id *)&v12->_startItemIdentifiers, a5);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 playbackIntentWithStartItemIdentifiers:v10]);
    mpcPlaybackIntent = v12->_mpcPlaybackIntent;
    v12->_mpcPlaybackIntent = (MPCPlaybackIntent *)v13;

    -[MPCPlaybackIntent setShuffleMode:](v12->_mpcPlaybackIntent, "setShuffleMode:", v6);
  }

  return v12;
}

- (TVMusicPlaybackIntent)initWithRequest:(id)a3 shuffle:(BOOL)a4 playbackAction:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackIntent;
  id v10 = -[TVMusicPlaybackIntent init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    v11->_playbackAction = a5;
    v11->_playbackType = 1LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 playbackIntentWithStartItemIdentifiers:0]);
    mpcPlaybackIntent = v11->_mpcPlaybackIntent;
    v11->_mpcPlaybackIntent = (MPCPlaybackIntent *)v12;

    -[MPCPlaybackIntent setShuffleMode:](v11->_mpcPlaybackIntent, "setShuffleMode:", v6);
  }

  return v11;
}

- (TVMusicPlaybackIntent)initWithStoreIDs:(id)a3 shuffle:(BOOL)a4 playbackAction:(unint64_t)a5 startItemIdentifiers:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackIntent;
  uint64_t v12 = -[TVMusicPlaybackIntent init](&v19, "init");
  if (v12)
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___MPCModelStorePlaybackItemsRequest);
    [v13 setStoreIDs:v10];
    request = v12->_request;
    v12->_request = (MPModelRequest *)v13;
    id v15 = v13;

    v12->_playbackAction = a5;
    v12->_playbackType = 1LL;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 playbackIntentWithStartItemIdentifiers:v11]);
    mpcPlaybackIntent = v12->_mpcPlaybackIntent;
    v12->_mpcPlaybackIntent = (MPCPlaybackIntent *)v16;

    -[MPCPlaybackIntent setShuffleMode:](v12->_mpcPlaybackIntent, "setShuffleMode:", v8);
  }

  return v12;
}

- (BOOL)isValidPlaybackIntent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  [v5 setPlayActivityFeatureName:v4];
}

- (NSString)playActivityFeatureName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playActivityFeatureName]);

  return (NSString *)v3;
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  [v5 setPlayActivityRecommendationData:v4];
}

- (NSData)playActivityRecommendationData
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playActivityRecommendationData]);

  return (NSData *)v3;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackIntent;
  id v3 = -[TVMusicPlaybackIntent description](&v10, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent mpcPlaybackIntent](self, "mpcPlaybackIntent"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent startItemIdentifiers](self, "startItemIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackIntent playActivityFeatureName](self, "playActivityFeatureName"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: mpcPlaybackIntent: %@, startItemIdentifiers: %@, featureName: %@",  v4,  v5,  v6,  v7));

  return v8;
}

+ (unint64_t)playbackActionTypeFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"playNext"])
    {
      unint64_t v5 = 1LL;
    }

    else if ([v4 isEqualToString:@"addToUpNext"])
    {
      unint64_t v5 = 3LL;
    }

    else
    {
      unint64_t v5 = 0LL;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

+ (id)playbackActionStringFromType:(unint64_t)a3
{
  if (a3 > 3) {
    return &stru_100279068;
  }
  else {
    return *(&off_10026D3A8 + a3);
  }
}

- (unint64_t)playbackType
{
  return self->_playbackType;
}

- (void)setPlaybackType:(unint64_t)a3
{
  self->_playbackType = a3;
}

- (unint64_t)firstItemType
{
  return self->_firstItemType;
}

- (void)setFirstItemType:(unint64_t)a3
{
  self->_firstItemType = a3;
}

- (BOOL)isFirstTrackExplicit
{
  return self->_firstTrackExplicit;
}

- (void)setFirstTrackExplicit:(BOOL)a3
{
  self->_firstTrackExplicit = a3;
}

- (int64_t)videoContentRating
{
  return self->_videoContentRating;
}

- (void)setVideoContentRating:(int64_t)a3
{
  self->_videoContentRating = a3;
}

- (unint64_t)playbackAction
{
  return self->_playbackAction;
}

- (void)setPlaybackAction:(unint64_t)a3
{
  self->_playbackAction = a3;
}

- (MPIdentifierSet)startItemIdentifiers
{
  return self->_startItemIdentifiers;
}

- (void)setStartItemIdentifiers:(id)a3
{
}

- (MPCPlaybackIntent)mpcPlaybackIntent
{
  return self->_mpcPlaybackIntent;
}

- (void)setMpcPlaybackIntent:(id)a3
{
}

- (MPModelRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end