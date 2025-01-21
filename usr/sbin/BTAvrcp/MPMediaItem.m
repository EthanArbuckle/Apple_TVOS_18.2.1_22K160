@interface MPMediaItem
+ (id)propertiesForUid;
- (id)replyAttributesForIDs:(id)a3;
- (id)replyItemWithAttributeIDs:(id)a3;
- (id)uid;
- (void)setReplyAttributeForID:(unint64_t)a3 inReplyAttributes:(id)a4;
@end

@implementation MPMediaItem

+ (id)propertiesForUid
{
  v3[0] = MPMediaItemPropertyPersistentID;
  v3[1] = MPMediaItemPropertyStoreID;
  v3[2] = MPMediaItemPropertySubscriptionStoreItemID;
  return [NSArray arrayWithObjects:v3 count:3];
}

- (id)uid
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v3 = [+[MPMediaItem propertiesForUid] autorelease];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = [self valueForProperty:v11];
      if (v8) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:

    v3 = -[self valueForProperty:MPMediaItemPropertyStoreRadioStationID];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v3 hash];
  }

  v9 = (void *)v8;

  return v9;
}

- (id)replyItemWithAttributeIDs:(id)a3
{
  id v4 = a3;
  v14[0] = &__kCFBooleanFalse;
  v13[0] = @"kIsFolder";
  v13[1] = @"kUid";
  id v5 = [self uid];
  v14[1] = v5;
  v13[2] = @"kName";
  uint64_t v6 = [self valueForProperty:MPMediaItemPropertyTitle];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = &stru_1000195C0;
  if (v6) {
    uint64_t v8 = (const __CFString *)v6;
  }
  v14[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));

  if (v4)
  {
    id v10 = [v9 mutableCopy];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem replyAttributesForIDs:](self, "replyAttributesForIDs:", v4));
    [v10 setValue:v11 forKey:@"kAttributes"];

    v9 = v10;
  }

  return v9;
}

- (id)replyAttributesForIDs:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000D1CC;
  v9[3] = &unk_100018A78;
  v9[4] = self;
  id v5 = [NSMutableDictionary dictionary];
  id v10 = v5;
  [v4 enumerateAttributeIDs:v9];

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)setReplyAttributeForID:(unint64_t)a3 inReplyAttributes:(id)a4
{
  id v15 = a4;
  switch(a3)
  {
    case 1uLL:
      uint64_t v6 = (void *)[self valueForProperty:MPMediaItemPropertyTitle];
      if (!v6) {
        goto LABEL_23;
      }
      id v7 = @"kTitle";
      goto LABEL_16;
    case 2uLL:
      uint64_t v6 = (void *)[self valueForProperty:MPMediaItemPropertyArtist];
      if (!v6) {
        goto LABEL_23;
      }
      id v7 = @"kArtist";
      goto LABEL_16;
    case 3uLL:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAlbumTitle));
      if (!v6) {
        goto LABEL_23;
      }
      id v7 = @"kAlbum";
      goto LABEL_16;
    case 4uLL:
      uint64_t v8 = (void *)[self valueForProperty:MPMediaItemPropertyAlbumTrackNumber];
      uint64_t v6 = v8;
      if (!v8 || ![v8 unsignedIntegerValue]) {
        goto LABEL_23;
      }
      v9 = [v6 stringValue];
      id v10 = @"kTrackNumber";
      goto LABEL_19;
    case 5uLL:
      __int128 v11 = (void *)[self valueForProperty:MPMediaItemPropertyAlbumTrackCount];
      uint64_t v6 = v11;
      if (!v11 || ![v11 unsignedIntegerValue]) {
        goto LABEL_23;
      }
      v9 = [v6 stringValue];
      id v10 = @"kTrackCount";
      goto LABEL_19;
    case 6uLL:
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyGenre));
      if (!v6) {
        goto LABEL_23;
      }
      id v7 = @"kGenre";
LABEL_16:
      [v15 setValue:v6 forKey:v7];
      goto LABEL_23;
    case 7uLL:
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
      uint64_t v6 = v12;
      if (!v12) {
        goto LABEL_23;
      }
      [v12 doubleValue];
      v9 = [NSString stringWithFormat:@"%lu" v13 * 1000.0];
      id v10 = @"kPlayingTime";
LABEL_19:
      [v15 setValue:v9 forKey:v10];
      goto LABEL_22;
    case 8uLL:
      uint64_t v6 = (void *)[self uid];
      if (![v6 unsignedIntegerValue]) {
        goto LABEL_23;
      }
      v9 = [NSNumber numberWithUnsignedInteger:((unint64_t)[v6 unsignedIntegerValue] % 0x989680)];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%tu",  [v9 unsignedIntegerValue]));
      [v15 setValue:v14 forKey:@"kImageHandle"];

LABEL_22:
LABEL_23:

LABEL_24:
      return;
    default:
      goto LABEL_24;
  }

@end