@interface MTUnplayedManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3;
- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3 newestToOldest:(BOOL)a4;
@end

@implementation MTUnplayedManifest

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3
{
  return -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:]( self,  "initWithInitialEpisodeUuid:newestToOldest:",  a3,  1LL);
}

- (MTUnplayedManifest)initWithInitialEpisodeUuid:(id)a3 newestToOldest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesOnUnplayedTab]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesOnUnplayedTab"));
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
    v20[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  0LL));
    v20[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  1LL));
    v20[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v20[3] = v11;
    v12 = v20;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  1LL));
    v19[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  1LL));
    v19[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  0LL));
    v19[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v19[3] = v11;
    v12 = v19;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 4LL));
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTUnplayedManifest;
  v14 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( &v18,  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  v6,  v7,  v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"EPISODE_UNPLAYED_TITLE" value:&stru_100248948 table:0]);
    -[MTUnplayedManifest setTitle:](v14, "setTitle:", v16);
  }

  return v14;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000B1758;
  v7[3] = &unk_100242150;
  id v8 = a4;
  id v6 = v8;
  [a1 episodeUuidForActivity:a3 completion:v7];
}

+ (id)activityTypeSuffix
{
  return @"unplayed";
}

@end