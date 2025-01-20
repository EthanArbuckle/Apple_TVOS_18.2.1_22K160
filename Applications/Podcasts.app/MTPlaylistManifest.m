@interface MTPlaylistManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (BOOL)_updatePlaylistEpisodes;
- (MTPlaylistManifest)initWithPlaylistUuid:(id)a3 initialEpisodeUuid:(id)a4;
- (NSString)playlistUuid;
- (id)activitySpotlightIdentifier;
- (void)_load:(id)a3;
- (void)_propertyDidChange;
- (void)setPlaylistUuid:(id)a3;
@end

@implementation MTPlaylistManifest

- (MTPlaylistManifest)initWithPlaylistUuid:(id)a3 initialEpisodeUuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MTPlaylistManifest;
  v9 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( &v20,  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  v7,  v8,  0LL);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  kPlaylistUuid,  v6));
    -[MTPredicateManifest _observeAllPropertyChangesForEntityName:predicate:]( v9,  "_observeAllPropertyChangesForEntityName:predicate:",  kMTPlaylistEntityName,  v10);
    -[MTPlaylistManifest setPlaylistUuid:](v9, "setPlaylistUuid:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayerManifest activity](v9, "activity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistManifest playlistUuid](v9, "playlistUuid"));
    [v11 setValue:v12 forKey:@"MTPlaylistManifestPlaylistUuid"];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainOrPrivateContext]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100103004;
    v17[3] = &unk_100240240;
    id v18 = v14;
    v19 = v9;
    id v15 = v14;
    [v15 performBlockAndWait:v17];
  }

  return v9;
}

- (id)activitySpotlightIdentifier
{
  return 0LL;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"MTPlaylistManifestPlaylistUuid"]);

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100103174;
    v10[3] = &unk_1002446A0;
    id v12 = v7;
    id v11 = v9;
    [a1 episodeUuidForActivity:v6 completion:v10];
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

+ (id)activityTypeSuffix
{
  return @"playlist";
}

- (void)_load:(id)a3
{
  id v4 = a3;
  -[MTPlaylistManifest _updatePlaylistEpisodes](self, "_updatePlaylistEpisodes");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPlaylistManifest;
  -[MTPredicateManifest _load:](&v5, "_load:", v4);
}

- (BOOL)_updatePlaylistEpisodes
{
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_100103418;
  objc_super v20 = sub_100103428;
  id v21 = &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100103430;
  v12[3] = &unk_100240558;
  id v5 = v4;
  id v13 = v5;
  v14 = self;
  id v15 = &v16;
  [v5 performBlockAndWait:v12];
  if (!v17[5]) {
    goto LABEL_5;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));
  unsigned __int8 v7 = [v6 isEqualToArray:v17[5]];

  uint64_t v8 = v17[5];
  if ((v7 & 1) == 0)
  {
    -[MTPredicateManifest setExplicitSortOrder:](self, "setExplicitSortOrder:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  kEpisodeUuid,  v17[5]));
    -[MTPredicateManifest setPredicate:](self, "setPredicate:", v10);
    goto LABEL_7;
  }

  if (!v8)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
    -[MTPredicateManifest setPredicate:](self, "setPredicate:", v10);
LABEL_7:

    BOOL v9 = 1;
    goto LABEL_8;
  }

  BOOL v9 = 0;
LABEL_8:

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_propertyDidChange
{
  if (-[MTPlaylistManifest _updatePlaylistEpisodes](self, "_updatePlaylistEpisodes")) {
    -[MTPredicateManifest _refetch:](self, "_refetch:", 0LL);
  }
}

- (NSString)playlistUuid
{
  return self->_playlistUuid;
}

- (void)setPlaylistUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end