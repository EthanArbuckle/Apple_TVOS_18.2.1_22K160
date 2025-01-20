@interface MTPodcastManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTPodcastManifest)initWithInitialEpisodeUuid:(id)a3 sectionType:(unint64_t)a4;
- (NSString)podcastUuid;
- (id)activity;
- (unint64_t)sectionType;
- (void)_propertyDidChange;
- (void)setPodcastUuid:(id)a3;
- (void)setSectionType:(unint64_t)a3;
@end

@implementation MTPodcastManifest

- (MTPodcastManifest)initWithInitialEpisodeUuid:(id)a3 sectionType:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v45 = 0LL;
    v46 = &v45;
    uint64_t v47 = 0x3032000000LL;
    v48 = sub_1000E9058;
    v49 = sub_1000E9068;
    id v50 = 0LL;
    uint64_t v39 = 0LL;
    v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    v42 = sub_1000E9058;
    v43 = sub_1000E9068;
    id v44 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    v36 = sub_1000E9058;
    v37 = sub_1000E9068;
    id v38 = 0LL;
    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_1000E9058;
    v31 = sub_1000E9068;
    id v32 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000E9070;
    v19[3] = &unk_1002446C8;
    id v9 = v8;
    id v20 = v9;
    id v10 = v6;
    id v21 = v10;
    v22 = &v45;
    v23 = &v39;
    v24 = &v33;
    v25 = &v27;
    unint64_t v26 = a4;
    [v9 performBlockAndWait:v19];
    if ([(id)v46[5] length])
    {
      v11 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
      v12 = -[NSFetchRequest initWithEntityName:](v11, "initWithEntityName:", kMTEpisodeEntityName);
      -[NSFetchRequest setPredicate:](v12, "setPredicate:", v28[5]);
      -[NSFetchRequest setSortDescriptors:](v12, "setSortDescriptors:", v34[5]);
      v18.receiver = self;
      v18.super_class = (Class)&OBJC_CLASS___MTPodcastManifest;
      v13 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]( &v18,  "initWithInitialEpisodeUuid:fetchRequest:",  v10,  v12);
      v14 = v13;
      if (v13)
      {
        -[MTPodcastManifest setPodcastUuid:](v13, "setPodcastUuid:", v46[5]);
        -[MTPodcastManifest setSectionType:](v14, "setSectionType:", a4);
        -[MTPodcastManifest setTitle:](v14, "setTitle:", v40[5]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForPodcastUUID:]( &OBJC_CLASS___MTPodcast,  "predicateForPodcastUUID:",  v46[5]));
        -[MTPredicateManifest _observeAllPropertyChangesForEntityName:predicate:]( v14,  "_observeAllPropertyChangesForEntityName:predicate:",  kMTPodcastEntityName,  v15);
      }

      self = v14;

      v16 = self;
    }

    else
    {
      v16 = 0LL;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (id)activity
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTPodcastManifest;
  id v3 = -[MTPlayerManifest activity](&v7, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[MTPodcastManifest sectionType](self, "sectionType")));
  [v4 setValue:v5 forKey:@"MTPodcastManifestActivitySectionType"];

  return v4;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"MTPodcastManifestActivitySectionType"]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E92AC;
  v12[3] = &unk_1002446A0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v9;
  id v11 = v6;
  [a1 episodeUuidForActivity:v7 completion:v12];
}

+ (id)activityTypeSuffix
{
  return @"podcast";
}

- (void)_propertyDidChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainOrPrivateContext]);

  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_1000E9058;
  v16 = sub_1000E9068;
  id v17 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000E9488;
  v8[3] = &unk_100240558;
  id v5 = v4;
  id v9 = v5;
  id v10 = self;
  id v11 = &v12;
  [v5 performBlockAndWait:v8];
  id v6 = (void *)v13[5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest sortDescriptors](self, "sortDescriptors"));
  LOBYTE(v6) = [v6 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    -[MTPredicateManifest setSortDescriptors:](self, "setSortDescriptors:", v13[5]);
    -[MTPredicateManifest _refetch:](self, "_refetch:", 0LL);
  }

  _Block_object_dispose(&v12, 8);
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (void).cxx_destruct
{
}

@end