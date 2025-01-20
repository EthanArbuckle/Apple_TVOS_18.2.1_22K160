@interface MRDExternalDeviceHomeServerRecentlyPlayedEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (MRContentItem)contentItem;
- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)initWithDictionaryRepresentation:(id)a3;
- (MRDeviceInfo)deviceInfo;
- (MRPlayerPath)playerPath;
- (NSArray)currentPlaybackSessionTypes;
- (NSArray)supportedPlaybackSessionTypes;
- (NSDate)date;
- (NSDate)lastNotPlayingDate;
- (NSDate)lastPlayingDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)currentPlaybackSessionIdentifier;
- (id)description;
- (void)setContentItem:(id)a3;
- (void)setCurrentPlaybackSessionIdentifier:(id)a3;
- (void)setCurrentPlaybackSessionTypes:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setLastNotPlayingDate:(id)a3;
- (void)setLastPlayingDate:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setSupportedPlaybackSessionTypes:(id)a3;
@end

@implementation MRDExternalDeviceHomeServerRecentlyPlayedEntry

- (MRDExternalDeviceHomeServerRecentlyPlayedEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceHomeServerRecentlyPlayedEntry;
  v5 = -[MRDExternalDeviceHomeServerRecentlyPlayedEntry init](&v25, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isPlaying"]);
    v5->_isPlaying = [v6 BOOLValue];

    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastPlayingDate"]);
    lastPlayingDate = v5->_lastPlayingDate;
    v5->_lastPlayingDate = (NSDate *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastNotPlayingDate"]);
    lastNotPlayingDate = v5->_lastNotPlayingDate;
    v5->_lastNotPlayingDate = (NSDate *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"currentPlaybackSessionTypes"]);
    currentPlaybackSessionTypes = v5->_currentPlaybackSessionTypes;
    v5->_currentPlaybackSessionTypes = (NSArray *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"supportedPlaybackSessionTypes"]);
    supportedPlaybackSessionTypes = v5->_supportedPlaybackSessionTypes;
    v5->_supportedPlaybackSessionTypes = (NSArray *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"currentPlaybackSessionIdentifier"]);
    currentPlaybackSessionIdentifier = v5->_currentPlaybackSessionIdentifier;
    v5->_currentPlaybackSessionIdentifier = (NSString *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey]);
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRPairedDeviceUserInfoKey]);
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (MRDeviceInfo *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kMRMediaRemoteUpdatedContentItemsUserInfoKey]);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 firstObject]);
    contentItem = v5->_contentItem;
    v5->_contentItem = (MRContentItem *)v22;
  }

  return v5;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  if (self->_isPlaying) {
    id v4 = @"PLAYING";
  }
  else {
    id v4 = @"NOT PLAYING";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceHomeServerRecentlyPlayedEntry date](self, "date"));
  __int128 v11 = *(_OWORD *)&self->_currentPlaybackSessionTypes;
  currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo deviceUID](self->_deviceInfo, "deviceUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo name](self->_deviceInfo, "name"));
  uint64_t v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@-%@-%@-%@-%@-%@(%@)-%@-%@",  v4,  v5,  v11,  currentPlaybackSessionIdentifier,  v7,  v8,  self->_playerPath,  self->_contentItem);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  int isPlaying = self->_isPlaying;
  if (isPlaying != [v6 isPlaying])
  {
    unsigned __int8 v16 = 0;
    goto LABEL_26;
  }

  BOOL v8 = self->_isPlaying;
  if (!self->_isPlaying)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceHomeServerRecentlyPlayedEntry date](self, "date"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 date]);
    if (![v3 isEqualToDate:v4])
    {
      unsigned __int8 v16 = 0;
      goto LABEL_25;
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo deviceUID](self->_deviceInfo, "deviceUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUID]);
  if (![v9 isEqualToString:v11])
  {

    unsigned __int8 v16 = 0;
    if (v8) {
      goto LABEL_26;
    }
LABEL_25:

    goto LABEL_26;
  }

  v28 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo name](self->_deviceInfo, "name"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  if ([v12 isEqualToString:v14])
  {
    v26 = v3;
    unsigned int v15 = -[MRDeviceInfo isAirPlayActive](self->_deviceInfo, "isAirPlayActive");
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    if (v15 == [v27 isAirPlayActive])
    {
      contentItem = self->_contentItem;
      objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItem]);
      if (MRContentItemEqualToItem(contentItem))
      {
        currentPlaybackSessionTypes = self->_currentPlaybackSessionTypes;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v6 currentPlaybackSessionTypes]);
        if (-[NSArray isEqualToArray:](currentPlaybackSessionTypes, "isEqualToArray:"))
        {
          supportedPlaybackSessionTypes = self->_supportedPlaybackSessionTypes;
          v23 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedPlaybackSessionTypes]);
          if (-[NSArray isEqualToArray:](supportedPlaybackSessionTypes, "isEqualToArray:"))
          {
            currentPlaybackSessionIdentifier = self->_currentPlaybackSessionIdentifier;
            v21 = (void *)objc_claimAutoreleasedReturnValue([v6 currentPlaybackSessionIdentifier]);
            unsigned __int8 v16 = -[NSString isEqualToString:](currentPlaybackSessionIdentifier, "isEqualToString:", v21);
          }

          else
          {
            unsigned __int8 v16 = 0;
          }

          v3 = v26;
        }

        else
        {
          unsigned __int8 v16 = 0;
          v3 = v26;
        }
      }

      else
      {
        unsigned __int8 v16 = 0;
        v3 = v26;
      }
    }

    else
    {
      unsigned __int8 v16 = 0;
      v3 = v26;
    }
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  id v4 = v28;
  if (!v8) {
    goto LABEL_25;
  }
LABEL_26:

  return v16;
}

- (void)setContentItem:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MRPlaybackQueueRequest);
  -[MRPlaybackQueueRequest setIncludeMetadata:](v7, "setIncludeMetadata:", 1LL);
  v5 = (MRContentItem *)MRContentItemCreateFromRequest(v4, v7);

  contentItem = self->_contentItem;
  self->_contentItem = v5;
}

- (NSDate)date
{
  uint64_t v2 = 2LL;
  if (!self->_isPlaying) {
    uint64_t v2 = 3LL;
  }
  return (NSDate *)(&self->super.isa)[v2];
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPlaying));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"isPlaying");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastPlayingDate,  @"lastPlayingDate");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastNotPlayingDate,  @"lastNotPlayingDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDeviceInfo deviceUID](self->_deviceInfo, "deviceUID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"deviceUID");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_currentPlaybackSessionTypes,  @"currentPlaybackSessionTypes");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_supportedPlaybackSessionTypes,  @"supportedPlaybackSessionTypes");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_currentPlaybackSessionIdentifier,  @"currentPlaybackSessionIdentifier");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_playerPath,  kMRNowPlayingPlayerPathUserInfoKey);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath description](self->_playerPath, "description"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  @"playerPathDescription");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_deviceInfo,  kMRPairedDeviceUserInfoKey);
  if (self->_contentItem)
  {
    contentItem = self->_contentItem;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &contentItem,  1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  kMRMediaRemoteUpdatedContentItemsUserInfoKey);
  }

  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  0LL,  kMRMediaRemoteUpdatedContentItemsUserInfoKey);
  }

  BOOL v8 = (void *)MRContentItemCopyMinimalReadableDescription(self->_contentItem, 0LL);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v8,  @"contentItemDescription");

  return (NSDictionary *)v3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_int isPlaying = a3;
}

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (void)setLastPlayingDate:(id)a3
{
}

- (NSDate)lastNotPlayingDate
{
  return self->_lastNotPlayingDate;
}

- (void)setLastNotPlayingDate:(id)a3
{
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSArray)currentPlaybackSessionTypes
{
  return self->_currentPlaybackSessionTypes;
}

- (void)setCurrentPlaybackSessionTypes:(id)a3
{
}

- (NSArray)supportedPlaybackSessionTypes
{
  return self->_supportedPlaybackSessionTypes;
}

- (void)setSupportedPlaybackSessionTypes:(id)a3
{
}

- (NSString)currentPlaybackSessionIdentifier
{
  return self->_currentPlaybackSessionIdentifier;
}

- (void)setCurrentPlaybackSessionIdentifier:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MRContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end