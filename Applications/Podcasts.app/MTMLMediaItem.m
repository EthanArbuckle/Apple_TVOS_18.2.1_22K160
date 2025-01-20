@interface MTMLMediaItem
+ (BOOL)isMediaItemSyncedFromiTunes:(id)a3;
+ (BOOL)isMissingAssetForItem:(id)a3;
+ (BOOL)isMissingFilePathForItem:(id)a3;
+ (id)itemWithMPMediaItem:(id)a3;
+ (id)itemWithMPMediaItem:(id)a3 isRestoreDownloadCandidate:(BOOL)a4;
+ (id)propertiesForMediaItem;
- (BOOL)hasBeenPlayed;
- (BOOL)isExplicit;
- (BOOL)isFromITunesSync;
- (BOOL)isItunesU;
- (BOOL)isMissingAsset;
- (NSDate)lastPlayedDate;
- (NSDate)pubDate;
- (NSNumber)byteSize;
- (NSNumber)downloadIdentifier;
- (NSNumber)duration;
- (NSNumber)persistentId;
- (NSNumber)playCount;
- (NSNumber)playhead;
- (NSNumber)podcastPersistentId;
- (NSNumber)storeCollectionId;
- (NSNumber)storeTrackId;
- (NSString)artist;
- (NSString)assetUrl;
- (NSString)category;
- (NSString)feedUrl;
- (NSString)guid;
- (NSString)podcastTitle;
- (NSString)title;
- (NSString)uti;
- (id)description;
- (void)setArtist:(id)a3;
- (void)setAssetUrl:(id)a3;
- (void)setByteSize:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDownloadIdentifier:(id)a3;
- (void)setDuration:(id)a3;
- (void)setFeedUrl:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsFromITunesSync:(BOOL)a3;
- (void)setIsItunesU:(BOOL)a3;
- (void)setIsMissingAsset:(BOOL)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setPersistentId:(id)a3;
- (void)setPlayCount:(id)a3;
- (void)setPlayhead:(id)a3;
- (void)setPodcastPersistentId:(id)a3;
- (void)setPodcastTitle:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setStoreCollectionId:(id)a3;
- (void)setStoreTrackId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUti:(id)a3;
@end

@implementation MTMLMediaItem

+ (id)itemWithMPMediaItem:(id)a3
{
  return _[a1 itemWithMPMediaItem:a3 isRestoreDownloadCandidate:0];
}

+ (id)itemWithMPMediaItem:(id)a3 isRestoreDownloadCandidate:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new(a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue([a1 propertiesForMediaItem]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100073464;
    v16[3] = &unk_100241268;
    id v10 = v7;
    id v17 = v10;
    [v6 enumerateValuesForProperties:v9 usingBlock:v16];

    objc_msgSend(v10, "setIsFromITunesSync:", objc_msgSend(a1, "isMediaItemSyncedFromiTunes:", v6));
    BOOL v11 = +[MTMLMediaItem isMissingFilePathForItem:](&OBJC_CLASS___MTMLMediaItem, "isMissingFilePathForItem:", v6)
       || +[MTMLMediaItem isMissingAssetForItem:](&OBJC_CLASS___MTMLMediaItem, "isMissingAssetForItem:", v6);
    [v10 setIsMissingAsset:v11];
    if ([v10 isMissingAsset] && !a4)
    {
      [v10 setAssetUrl:0];
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTMediaLibraryTransactionManager sharedInstance]( &OBJC_CLASS___MTMediaLibraryTransactionManager,  "sharedInstance"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100073834;
      v14[3] = &unk_100241650;
      id v15 = v6;
      [v12 requestMediaLibraryWriteTransaction:v14];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (BOOL)isMissingFilePathForItem:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForProperty:MPMediaItemPropertyFilePath]);
  BOOL v4 = [v3 length] == 0;

  return v4;
}

+ (BOOL)isMissingAssetForItem:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForProperty:MPMediaItemPropertyFilePath]);
  if ([v3 length])
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

    char v6 = v5 ^ 1;
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem persistentId](self, "persistentId"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem title](self, "title"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem guid](self, "guid"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] %@ %@",  v3,  v4,  v5));

  return v6;
}

+ (id)propertiesForMediaItem
{
  v3[0] = MPMediaItemPropertyPodcastURL;
  v3[1] = MPMediaItemPropertyPodcastTitle;
  v3[2] = MPMediaItemPropertyIsITunesU;
  v3[3] = MPMediaItemPropertyArtist;
  v3[4] = MPMediaItemPropertyPersistentID;
  v3[5] = MPMediaItemPropertyPodcastPersistentID;
  v3[6] = MPMediaItemPropertyFileSize;
  v3[7] = MPMediaItemPropertyGenre;
  v3[8] = MPMediaItemPropertyPlaybackDuration;
  v3[9] = MPMediaItemPropertyTitle;
  v3[10] = MPMediaItemPropertyMediaType;
  v3[11] = MPMediaItemPropertyReleaseDate;
  v3[12] = MPMediaItemPropertyBookmarkTime;
  v3[13] = MPMediaItemPropertyHasBeenPlayed;
  v3[14] = MPMediaItemPropertyPlayCount;
  v3[15] = MPMediaItemPropertyDownloadIdentifier;
  v3[16] = MPMediaItemPropertyRestricted;
  v3[17] = MPMediaItemPropertyStoreID;
  v3[18] = MPMediaItemPropertyStorePlaylistID;
  v3[19] = MPMediaItemPropertyLastPlayedDate;
  v3[20] = MPMediaItemPropertyPodcastGUID;
  v3[21] = MPMediaItemPropertyFilePath;
  v3[22] = MPMediaItemPropertyAssetURL;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  23LL));
}

+ (BOOL)isMediaItemSyncedFromiTunes:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForProperty:MPMediaItemPropertyFilePath]);
  unsigned __int8 v4 = [v3 containsStringInsensitive:@"/var/mobile/Media/iTunes_Control/"];

  return v4;
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSNumber)persistentId
{
  return self->_persistentId;
}

- (void)setPersistentId:(id)a3
{
}

- (NSNumber)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(id)a3
{
}

- (NSNumber)podcastPersistentId
{
  return self->_podcastPersistentId;
}

- (void)setPodcastPersistentId:(id)a3
{
}

- (NSNumber)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(id)a3
{
}

- (NSNumber)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
}

- (BOOL)isItunesU
{
  return self->_isItunesU;
}

- (void)setIsItunesU:(BOOL)a3
{
  self->_isItunesU = a3;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (NSNumber)playhead
{
  return self->_playhead;
}

- (void)setPlayhead:(id)a3
{
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (void)setPodcastTitle:(id)a3
{
}

- (NSNumber)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isFromITunesSync
{
  return self->_isFromITunesSync;
}

- (void)setIsFromITunesSync:(BOOL)a3
{
  self->_isFromITunesSync = a3;
}

- (BOOL)isMissingAsset
{
  return self->_isMissingAsset;
}

- (void)setIsMissingAsset:(BOOL)a3
{
  self->_isMissingAsset = a3;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end