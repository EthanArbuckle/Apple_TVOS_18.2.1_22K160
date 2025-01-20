@interface MTEpisodeManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4;
- (MTEpisodeManifest)initWithEpisodeUuid:(id)a3;
- (id)activity;
@end

@implementation MTEpisodeManifest

- (MTEpisodeManifest)initWithEpisodeUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
    v6 = -[NSFetchRequest initWithEntityName:](v5, "initWithEntityName:", kMTEpisodeEntityName);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuid:", v4));
    -[NSFetchRequest setPredicate:](v6, "setPredicate:", v7);

    -[NSFetchRequest setSortDescriptors:](v6, "setSortDescriptors:", &__NSArray0__struct);
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___MTEpisodeManifest;
    v8 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]( &v13,  "initWithInitialEpisodeUuid:fetchRequest:",  v4,  v6);
    v9 = v8;
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeManifest activity](v8, "activity"));
      [v10 setValue:v4 forKey:@"MTEpisodeManifestEpisodeUuid"];
    }

    self = v9;

    v11 = self;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

+ (void)episodeUuidForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"MTEpisodeManifestEpisodeUuid"]);

  if ([v9 length]
    && (+[MTEpisode exists:](&OBJC_CLASS___MTEpisode, "exists:", v9) & 1) != 0)
  {
    v7[2](v7, v9);
  }

  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___MTEpisodeManifest;
    objc_msgSendSuper2(&v10, "episodeUuidForActivity:completion:", v6, v7);
  }
}

- (id)activity
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTEpisodeManifest;
  id v2 = -[MTPlayerManifest activity](&v4, "activity");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005A19C;
  v7[3] = &unk_100242150;
  id v8 = a4;
  id v6 = v8;
  [a1 episodeUuidForActivity:a3 completion:v7];
}

+ (id)activityTypeSuffix
{
  return @"episode";
}

@end