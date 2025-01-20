@interface MTPodcastPlaylistSettings
+ (id)_longStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4;
+ (id)_shortStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4;
+ (id)episodesOptionArray:(BOOL)a3 defaultValue:(int64_t)a4;
+ (id)episodesOptionValues;
+ (id)insertNewSettingsInManagedObjectContext:(id)a3;
+ (id)mediaOptionArray:(BOOL)a3;
+ (id)mediaOptionValues;
+ (id)predicateForPlaylistSettingsUuid:(id)a3;
+ (id)stringForEpisodes:(int64_t)a3 short:(BOOL)a4 defaultValue:(int64_t)a5;
+ (id)stringForMedia:(int)a3 short:(BOOL)a4;
- (BOOL)needsUpdate;
- (BOOL)tracksDefault;
- (double)latestEpisodeDate;
- (double)oldestEpisodeDate;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)metricsKeys;
- (id)predicateForSettings;
- (int64_t)integerForEpisodesToShow;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setTracksDefault:(BOOL)a3;
- (void)takeValuesFromDefaultSettings:(id)a3;
@end

@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
  unsigned int v6 = [v5 needsUpdate];

  unint64_t v7 = (unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v8 = v3 | v6;
    uint64_t v9 = 2LL;
    if (!v3) {
      uint64_t v9 = 0LL;
    }
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v7 & 0xFFFFFFFFFFFFFFFDLL | v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
    [v10 setNeedsUpdate:v8];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    LODWORD(v10) = [v11 needsUpdate];

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    [v12 setNeedsUpdate:v3 | v10];
  }

- (BOOL)needsUpdate
{
  return ((unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags") >> 1) & 1;
}

+ (id)predicateForPlaylistSettingsUuid:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  kPlaylistSettingUuid,  a3);
}

+ (id)_shortStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  switch(a3)
  {
    case 0LL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      unsigned int v6 = @"EPISODE_ALL";
      goto LABEL_5;
    case 1LL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v5 = v4;
      unsigned int v6 = @"MOST_RECENT_SINGULAR";
LABEL_5:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:v6 value:&stru_100248948 table:0]);

      return v8;
    case 2LL:
      unint64_t v7 = &off_100254CB0;
      goto LABEL_10;
    case 3LL:
      unint64_t v7 = &off_100254C98;
      goto LABEL_10;
    case 4LL:
      unint64_t v7 = &off_100254C80;
      goto LABEL_10;
    case 5LL:
      unint64_t v7 = &off_100254C68;
      goto LABEL_10;
    case 6LL:
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:a4 short:1 defaultValue:0]);
      return v8;
    default:
      unint64_t v7 = 0LL;
LABEL_10:
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"Recent %@" value:&stru_100248948 table:0]);

      uint64_t v11 = IMAccessibilityLocalizedNumber(v7);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@",  0LL,  v12));

      return v8;
  }

+ (id)_longStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  int64_t v4 = 10LL;
  switch(a3)
  {
    case 0LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned int v6 = v5;
      unint64_t v7 = @"All Episodes";
      goto LABEL_5;
    case 1LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned int v6 = v5;
      unint64_t v7 = @"Most recent episode";
LABEL_5:
      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100248948 table:0]);
      goto LABEL_8;
    case 2LL:
    case 3LL:
      int64_t v4 = a3;
      goto LABEL_7;
    case 4LL:
      int64_t v4 = 5LL;
      goto LABEL_7;
    case 6LL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"Default (%@)" value:&stru_100248948 table:0]);

      v15 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:a4 short:1 defaultValue:0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v15));

      goto LABEL_9;
    default:
LABEL_7:
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"MOST_RECENT_EPISODES" value:&stru_100248948 table:0]);

      uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "localizedStringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%lu",  0LL,  v4));
LABEL_8:
      v10 = (void *)v8;
LABEL_9:

      return v10;
  }

+ (id)stringForEpisodes:(int64_t)a3 short:(BOOL)a4 defaultValue:(int64_t)a5
{
  if (a4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _shortStringForEpisodes:a3 defaultValue:a5]);
  }
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _longStringForEpisodes:a3 defaultValue:a5]);
  }
  return v5;
}

+ (id)stringForMedia:(int)a3 short:(BOOL)a4
{
  switch(a3)
  {
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", *(void *)&a3, a4));
      unsigned int v6 = v5;
      unint64_t v7 = @"Video";
      goto LABEL_7;
    case 1:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", *(void *)&a3, a4));
      unsigned int v6 = v5;
      unint64_t v7 = @"Audio";
      goto LABEL_7;
    case 0:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle", *(void *)&a3, a4));
      unsigned int v6 = v5;
      unint64_t v7 = @"MEDIA_ALL";
LABEL_7:
      int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100248948 table:0]);

      break;
  }

  return v4;
}

+ (id)episodesOptionArray:(BOOL)a3 defaultValue:(int64_t)a4
{
  BOOL v5 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:6 short:a3 defaultValue:a4]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForEpisodes:short:defaultValue:", 1, v5, a4, v7));
  v16[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:2 short:v5 defaultValue:a4]);
  v16[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:3 short:v5 defaultValue:a4]);
  v16[3] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:4 short:v5 defaultValue:a4]);
  v16[4] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:5 short:v5 defaultValue:a4]);
  v16[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForEpisodes:0 short:v5 defaultValue:a4]);
  v16[6] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 7LL));

  return v14;
}

+ (id)episodesOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", &off_100255278);
}

+ (id)mediaOptionArray:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForMedia:0 short:a3]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForMedia:short:", 1, v3, v5));
  v10[1] = v6;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 stringForMedia:2 short:v3]);
  v10[2] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 3LL));

  return v8;
}

+ (id)mediaOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", &off_100255290);
}

+ (id)insertNewSettingsInManagedObjectContext:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  kMTPodcastPlaylistSettingsEntityName,  a3));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](&OBJC_CLASS___NSString, "UUID"));
  [v3 setUuid:v4];

  [v3 setEpisodesToShow:1];
  [v3 setMediaType:0];
  [v3 setShowPlayedEpisodes:0];
  [v3 setTracksDefault:1];
  [v3 setNeedsUpdate:1];
  [v3 setDownloaded:0];
  return v3;
}

- (void)setTracksDefault:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0) {
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
  }
}

- (BOOL)tracksDefault
{
  return -[MTPodcastPlaylistSettings flags](self, "flags") & 1;
}

- (double)latestEpisodeDate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  unsigned int v4 = [v3 playbackNewestToOldest];

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings episodes](self, "episodes"));
  unsigned int v6 = v5;
  if (v4) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 firstObject]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 lastObject]);
  }
  uint64_t v8 = (void *)v7;

  [v8 firstTimeAvailable];
  double v10 = v9;

  return v10;
}

- (double)oldestEpisodeDate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  unsigned int v4 = [v3 playbackNewestToOldest];

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings episodes](self, "episodes"));
  unsigned int v6 = v5;
  if (v4) {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 lastObject]);
  }
  else {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 firstObject]);
  }
  uint64_t v8 = (void *)v7;

  [v8 firstTimeAvailable];
  double v10 = v9;

  return v10;
}

- (int64_t)integerForEpisodesToShow
{
  int64_t result = (int64_t)-[MTPodcastPlaylistSettings episodesToShow](self, "episodesToShow");
  switch(result)
  {
    case 1LL:
    case 2LL:
    case 3LL:
      return result;
    case 4LL:
      int64_t result = 5LL;
      break;
    case 5LL:
      int64_t result = 10LL;
      break;
    case 6LL:
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 defaultSettings]);
      id v6 = [v5 integerForEpisodesToShow];

      int64_t result = (int64_t)v6;
      break;
    default:
      int64_t result = 0LL;
      break;
  }

  return result;
}

- (id)predicateForSettings
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExternalType:](&OBJC_CLASS___MTEpisode, "predicateForExternalType:", 0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 AND:v6]);

  if ((-[MTPodcastPlaylistSettings showPlayedEpisodes](self, "showPlayedEpisodes") & 1) == 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](&OBJC_CLASS___MTEpisode, "predicateForVisuallyPlayed:", 0LL));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 AND:v8]);

    uint64_t v7 = (void *)v9;
  }

  if ((+[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed") & 1) == 0)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
    unsigned int v11 = [v10 isExplicit];

    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
    }

    else
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExplicit:](&OBJC_CLASS___MTEpisode, "predicateForExplicit:", 0LL));
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 AND:v13]);

      uint64_t v7 = (void *)v13;
    }

    uint64_t v7 = (void *)v12;
  }

  if (-[MTPodcastPlaylistSettings mediaType](self, "mediaType"))
  {
    id v14 = -[MTPodcastPlaylistSettings mediaType](self, "mediaType");
    v15 = (id *)&kEpisodeAudio;
    if (v14 != (id)1) {
      v15 = (id *)&kEpisodeVideo;
    }
    id v16 = *v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = 1",  v16));
    v34[0] = v17;
    v34[1] = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v18));

    uint64_t v7 = (void *)v19;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForStationEligibleEpisodes]( &OBJC_CLASS___MTEpisode,  "predicateForStationEligibleEpisodes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v7 AND:v20]);

  unsigned int v22 = -[MTPodcastPlaylistSettings downloaded](self, "downloaded");
  if (v22 == 1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != nil",  kEpisodeAssetURL,  v21));
    v32[1] = v23;
    v24 = v32;
    goto LABEL_16;
  }

  if (v22 == 2)
  {
    v33[0] = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = nil",  kEpisodeAssetURL));
    v33[1] = v23;
    v24 = v33;
LABEL_16:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v25));

    v21 = (void *)v26;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings podcast](self, "podcast"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 uuid]);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v21 AND:v29]);

  return v30;
}

- (void)takeValuesFromDefaultSettings:(id)a3
{
  id v4 = a3;
  -[MTPodcastPlaylistSettings setMediaType:](self, "setMediaType:", [v4 mediaType]);
  id v5 = [v4 showPlayedEpisodes];

  -[MTPodcastPlaylistSettings setShowPlayedEpisodes:](self, "setShowPlayedEpisodes:", v5);
  -[MTPodcastPlaylistSettings setNeedsUpdate:](self, "setNeedsUpdate:", 1LL);
}

- (id)metricsContentIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 metricsContentIdentifier]);

  return v3;
}

- (id)metricsAdditionalData
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings metricsKeys](self, "metricsKeys"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v3));
  uint64_t v7 = @"settings";
  uint64_t v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return v5;
}

- (id)metricsKeys
{
  v3[0] = kPlaylistSettingEpisodesToShow;
  v3[1] = kPlaylistSettingMediaType;
  v3[2] = kPlaylistSettingShowPlayedEpisodes;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  3LL));
}

@end