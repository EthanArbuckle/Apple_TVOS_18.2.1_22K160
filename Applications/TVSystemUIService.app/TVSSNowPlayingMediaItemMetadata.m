@interface TVSSNowPlayingMediaItemMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isLiveContent;
- (BOOL)isPodcast;
- (NSDate)elapsedTimeDate;
- (NSString)albumTitle;
- (NSString)artistTitle;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)title;
- (TVSSNowPlayingMediaItemMetadata)initWithMetadata:(id)a3;
- (TVSSNowPlayingMediaItemMetadata)initWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4;
- (TVSSNowPlayingMediaItemMetadata)initWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4 elapsedTimeBlock:(id)a5;
- (double)duration;
- (double)elapsedTime;
- (id)artworkCatalog;
- (id)artworkToken;
- (id)changedMetadataKeysAfterUpdatingWithMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSNowPlayingMediaItemMetadata

- (TVSSNowPlayingMediaItemMetadata)initWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v9;
  v9 = 0LL;
  v9 = -[TVSSNowPlayingMediaItemMetadata initWithPlayerResponseItem:isPodcast:elapsedTimeBlock:]( v4,  "initWithPlayerResponseItem:isPodcast:elapsedTimeBlock:",  location[0],  a4,  &stru_1001BAC88);
  v7 = v9;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  return v7;
}

- (TVSSNowPlayingMediaItemMetadata)initWithPlayerResponseItem:(id)a3 isPodcast:(BOOL)a4 elapsedTimeBlock:(id)a5
{
  v74 = self;
  SEL v73 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  BOOL v71 = a4;
  id v70 = 0LL;
  objc_storeStrong(&v70, a5);
  id v69 = location;
  id v68 = 0LL;
  Class v67 = NSClassFromString(@"MPCPlayerResponseItem");
  if (!v69)
  {
    id v66 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v44 = type;
      v46 = NSStringFromSelector(v73);
      v42 = v46;
      v63 = v42;
      v5 = (objc_class *)objc_opt_class(v74);
      v45 = NSStringFromClass(v5);
      v62 = v45;
      sub_10000583C( (uint64_t)v77,  (uint64_t)v42,  (uint64_t)v62,  (uint64_t)v74,  (uint64_t)@"TVSSNowPlayingMediaItemMetadata.m",  35,  (uint64_t)v66);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v44,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v77,  0x3Au);

      objc_storeStrong((id *)&v62, 0LL);
      objc_storeStrong((id *)&v63, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v66 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FF024LL);
  }

  if (((objc_opt_isKindOfClass(v69, v67) ^ 1) & 1) != 0)
  {
    id v61 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:MPCPlayerResponseItemClass]");
    os_log_t v60 = &_os_log_default;
    os_log_type_t v59 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v38 = v60;
      os_log_type_t v39 = v59;
      v41 = NSStringFromSelector(v73);
      v37 = v41;
      v58 = v37;
      v6 = (objc_class *)objc_opt_class(v74);
      v40 = NSStringFromClass(v6);
      v57 = v40;
      sub_10000583C( (uint64_t)v76,  (uint64_t)v37,  (uint64_t)v57,  (uint64_t)v74,  (uint64_t)@"TVSSNowPlayingMediaItemMetadata.m",  35,  (uint64_t)v61);
      _os_log_error_impl( (void *)&_mh_execute_header,  v38,  v39,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v76,  0x3Au);

      objc_storeStrong((id *)&v57, 0LL);
      objc_storeStrong((id *)&v58, 0LL);
    }

    objc_storeStrong((id *)&v60, 0LL);
    _bs_set_crash_log_message([v61 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FF1DCLL);
  }

  objc_storeStrong(&v68, 0LL);
  objc_storeStrong(&v69, 0LL);
  if (!v70)
  {
    id v56 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"elapsedTimeBlock");
    os_log_t v55 = &_os_log_default;
    os_log_type_t v54 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v33 = v55;
      os_log_type_t v34 = v54;
      v36 = NSStringFromSelector(v73);
      v32 = v36;
      v53 = v32;
      v7 = (objc_class *)objc_opt_class(v74);
      v35 = NSStringFromClass(v7);
      v52 = v35;
      sub_10000583C( (uint64_t)v75,  (uint64_t)v32,  (uint64_t)v52,  (uint64_t)v74,  (uint64_t)@"TVSSNowPlayingMediaItemMetadata.m",  36,  (uint64_t)v56);
      _os_log_error_impl( (void *)&_mh_execute_header,  v33,  v34,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v75,  0x3Au);

      objc_storeStrong((id *)&v52, 0LL);
      objc_storeStrong((id *)&v53, 0LL);
    }

    objc_storeStrong((id *)&v55, 0LL);
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FF3B4LL);
  }

  v8 = v74;
  v74 = 0LL;
  v51.receiver = v8;
  v51.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingMediaItemMetadata;
  v74 = -[TVSSNowPlayingMediaItemMetadata init](&v51, "init");
  objc_storeStrong((id *)&v74, v74);
  if (v74)
  {
    id v31 = [location contentItemIdentifier];
    v9 = (NSString *)[v31 copy];
    identifier = v74->_identifier;
    v74->_identifier = v9;

    if (location) {
      [location duration];
    }
    else {
      memset(__b, 0, sizeof(__b));
    }
    *(void *)&v74->_duration = __b[3];
    v74->_liveContent = __b[6] & 1;
    double v11 = (*((double (**)(id, void *))v70 + 2))(v70, __b);
    v74->_elapsedTime = v11;
    v24 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
    v12 = (NSDate *)-[NSDate copy](v24, "copy");
    elapsedTimeDate = v74->_elapsedTimeDate;
    v74->_elapsedTimeDate = v12;

    id v25 = [location metadataObject];
    id v49 = [v25 song];

    id v26 = [v49 title];
    v14 = (NSString *)[v26 copy];
    title = v74->_title;
    v74->_title = v14;

    id v28 = [v49 artist];
    id v27 = [v28 name];
    v16 = (NSString *)[v27 copy];
    artistTitle = v74->_artistTitle;
    v74->_artistTitle = v16;

    id v30 = [v49 album];
    id v29 = [v30 title];
    v18 = (NSString *)[v29 copy];
    albumTitle = v74->_albumTitle;
    v74->_albumTitle = v18;

    v20 = (MPArtworkCatalog *)[v49 artworkCatalog];
    artworkCatalog = v74->_artworkCatalog;
    v74->_artworkCatalog = v20;

    v74->_podcast = v71;
    objc_storeStrong(&v49, 0LL);
  }

  v23 = v74;
  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v74, 0LL);
  return v23;
}

- (TVSSNowPlayingMediaItemMetadata)initWithMetadata:(id)a3
{
  v52 = self;
  SEL v51 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v49 = location;
  id v48 = 0LL;
  Class v47 = NSClassFromString(@"TVSSNowPlayingMediaItemMetadata");
  if (!v49)
  {
    v46 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v45 = &_os_log_default;
    char v44 = 16;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v45;
      os_log_type_t type = v44;
      v35 = NSStringFromSelector(v51);
      id v31 = v35;
      v43 = v31;
      v3 = (objc_class *)objc_opt_class(v52);
      os_log_type_t v34 = NSStringFromClass(v3);
      v42 = v34;
      sub_10000583C( (uint64_t)v54,  (uint64_t)v31,  (uint64_t)v42,  (uint64_t)v52,  (uint64_t)@"TVSSNowPlayingMediaItemMetadata.m",  61,  (uint64_t)v46);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v54,  0x3Au);

      objc_storeStrong((id *)&v42, 0LL);
      objc_storeStrong((id *)&v43, 0LL);
    }

    objc_storeStrong(&v45, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v46, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000FF908LL);
  }

  if (((objc_opt_isKindOfClass(v49, v47) ^ 1) & 1) != 0)
  {
    v41 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSNowPlayingMediaItemMetadataClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v39 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v27 = oslog;
      os_log_type_t v28 = v39;
      id v30 = NSStringFromSelector(v51);
      id v26 = v30;
      v38 = v26;
      v4 = (objc_class *)objc_opt_class(v52);
      id v29 = NSStringFromClass(v4);
      v37 = v29;
      sub_10000583C( (uint64_t)v53,  (uint64_t)v26,  (uint64_t)v37,  (uint64_t)v52,  (uint64_t)@"TVSSNowPlayingMediaItemMetadata.m",  61,  (uint64_t)v41);
      _os_log_error_impl( (void *)&_mh_execute_header,  v27,  v28,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v53,  0x3Au);

      objc_storeStrong((id *)&v37, 0LL);
      objc_storeStrong((id *)&v38, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v41, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000FFAC0LL);
  }

  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  v5 = v52;
  v52 = 0LL;
  v36.receiver = v5;
  v36.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingMediaItemMetadata;
  v52 = -[TVSSNowPlayingMediaItemMetadata init](&v36, "init");
  objc_storeStrong((id *)&v52, v52);
  if (v52)
  {
    id v22 = [location identifier];
    v6 = (NSString *)[v22 copy];
    identifier = v52->_identifier;
    v52->_identifier = v6;

    [location duration];
    v52->_duration = v8;
    [location elapsedTime];
    v52->_elapsedTime = v9;
    unsigned __int8 v10 = [location isLiveContent];
    v52->_liveContent = v10 & 1;
    id v23 = [location title];
    double v11 = (NSString *)[v23 copy];
    title = v52->_title;
    v52->_title = v11;

    id v24 = [location artistTitle];
    v13 = (NSString *)[v24 copy];
    artistTitle = v52->_artistTitle;
    v52->_artistTitle = v13;

    id v25 = [location albumTitle];
    v15 = (NSString *)[v25 copy];
    albumTitle = v52->_albumTitle;
    v52->_albumTitle = v15;

    v17 = (MPArtworkCatalog *)[location artworkCatalog];
    artworkCatalog = v52->_artworkCatalog;
    v52->_artworkCatalog = v17;

    unsigned __int8 v19 = [location isPodcast];
    v52->_podcast = v19 & 1;
  }

  v21 = v52;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v52, 0LL);
  return v21;
}

- (id)artworkToken
{
  return self->_artworkCatalog;
}

- (id)artworkCatalog
{
  return self->_artworkCatalog;
}

- (id)changedMetadataKeysAfterUpdatingWithMetadata:(id)a3
{
  id v49 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  Class v47 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  identifier = v49->_identifier;
  id v45 = [location[0] identifier];
  char v46 = BSEqualObjects(identifier, v45);

  if ((v46 & 1) == 0)
  {
    v3 = (NSString *)[location[0] identifier];
    v4 = v49->_identifier;
    v49->_identifier = v3;

    -[NSMutableSet addObject:](v47, "addObject:", @"identifier");
  }

  title = v49->_title;
  id v42 = [location[0] title];
  char v43 = BSEqualObjects(title, v42);

  if ((v43 & 1) == 0)
  {
    v5 = (NSString *)[location[0] title];
    v6 = v49->_title;
    v49->_title = v5;

    -[NSMutableSet addObject:](v47, "addObject:", @"title");
  }

  albumTitle = v49->_albumTitle;
  id v39 = [location[0] albumTitle];
  char v40 = BSEqualObjects(albumTitle, v39);

  if ((v40 & 1) == 0)
  {
    v7 = (NSString *)[location[0] albumTitle];
    double v8 = v49->_albumTitle;
    v49->_albumTitle = v7;

    -[NSMutableSet addObject:](v47, "addObject:", @"albumTitle");
  }

  artistTitle = v49->_artistTitle;
  id v36 = [location[0] artistTitle];
  char v37 = BSEqualObjects(artistTitle, v36);

  if ((v37 & 1) == 0)
  {
    double v9 = (NSString *)[location[0] artistTitle];
    unsigned __int8 v10 = v49->_artistTitle;
    v49->_artistTitle = v9;

    -[NSMutableSet addObject:](v47, "addObject:", @"artistTitle");
  }

  unint64_t v34 = *(void *)&v49->_duration;
  id v11 = [location[0] duration];
  double v13 = v12;
  v14.n128_u64[0] = v34;
  if ((BSFloatEqualToFloat(v11, v14, v13) & 1) == 0)
  {
    [location[0] duration];
    v49->_duration = v15;
    -[NSMutableSet addObject:](v47, "addObject:", @"duration");
  }

  unint64_t v33 = *(void *)&v49->_elapsedTime;
  id v16 = [location[0] elapsedTime];
  double v18 = v17;
  v19.n128_u64[0] = v33;
  if ((BSFloatEqualToFloat(v16, v19, v18) & 1) == 0)
  {
    [location[0] elapsedTime];
    v49->_elapsedTime = v20;
    -[NSMutableSet addObject:](v47, "addObject:", @"elapsedTime");
  }

  int liveContent = v49->_liveContent;
  if (liveContent != ([location[0] isLiveContent] & 1))
  {
    unsigned __int8 v21 = [location[0] isLiveContent];
    v49->_int liveContent = v21 & 1;
    -[NSMutableSet addObject:](v47, "addObject:", @"liveContent");
  }

  artworkCatalog = v49->_artworkCatalog;
  id v30 = [location[0] artworkCatalog];
  unsigned __int8 v31 = -[MPArtworkCatalog isArtworkVisuallyIdenticalToCatalog:]( artworkCatalog,  "isArtworkVisuallyIdenticalToCatalog:");

  if ((v31 & 1) == 0)
  {
    id v22 = (MPArtworkCatalog *)[location[0] artworkCatalog];
    id v23 = v49->_artworkCatalog;
    v49->_artworkCatalog = v22;

    -[NSMutableSet addObject:](v47, "addObject:", @"artworkToken");
  }

  int podcast = v49->_podcast;
  if (podcast != ([location[0] isPodcast] & 1))
  {
    unsigned __int8 v24 = [location[0] isPodcast];
    v49->_int podcast = v24 & 1;
    -[NSMutableSet addObject:](v47, "addObject:", @"podcast");
  }

  id v27 = -[NSMutableSet copy](v47, "copy", &v47);
  objc_storeStrong(v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v27;
}

- (id)succinctDescription
{
  id v3 = -[TVSSNowPlayingMediaItemMetadata succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v4[0] appendString:v5->_identifier withName:@"identifier"];
  [v4[0] appendString:v5->_title withName:@"title"];
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSNowPlayingMediaItemMetadata descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v13);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v11, "setActiveMultilinePrefix:", location[0]);
  -[BSDescriptionBuilder appendString:withName:](v11, "appendString:withName:", v13->_identifier, @"identifier");
  -[BSDescriptionBuilder appendString:withName:](v11, "appendString:withName:", v13->_title, @"title");
  -[BSDescriptionBuilder appendString:withName:](v11, "appendString:withName:", v13->_artistTitle, @"artistTitle");
  -[BSDescriptionBuilder appendString:withName:](v11, "appendString:withName:", v13->_albumTitle, @"albumTitle");
  id v3 =  -[BSDescriptionBuilder appendObject:withName:]( v11,  "appendObject:withName:",  v13->_artworkCatalog,  @"artworkCatalog");
  id v4 =  -[BSDescriptionBuilder appendFloat:withName:decimalPrecision:]( v11,  "appendFloat:withName:decimalPrecision:",  @"duration",  v13->_duration);
  id v5 =  -[BSDescriptionBuilder appendFloat:withName:decimalPrecision:]( v11,  "appendFloat:withName:decimalPrecision:",  @"elapsedTime",  2LL,  v13->_elapsedTime);
  id v6 =  -[BSDescriptionBuilder appendObject:withName:]( v11,  "appendObject:withName:",  v13->_elapsedTimeDate,  @"elapsedTimeDate");
  id v7 =  -[BSDescriptionBuilder appendBool:withName:]( v11,  "appendBool:withName:",  v13->_liveContent,  @"liveContent");
  id v8 = -[BSDescriptionBuilder appendBool:withName:](v11, "appendBool:withName:", v13->_podcast, @"podcast");
  unsigned __int8 v10 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [objc_alloc((Class)objc_opt_class(self)) initWithMetadata:self];
}

- (BOOL)isEqual:(id)a3
{
  v120 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v120 == location[0])
  {
    char v121 = 1;
    int v118 = 1;
  }

  else
  {
    os_log_type_t v59 = &v117;
    id v117 = location[0];
    double v15 = &OBJC_CLASS___BSEqualsBuilder;
    id v14 = v117;
    v58 = (id *)&v116;
    v116 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v117,  objc_opt_class(&OBJC_CLASS___TVSSNowPlayingMediaItemMetadata));
    double v18 = v116;
    identifier = v120->_identifier;
    double v17 = &v110;
    char v43 = _NSConcreteStackBlock;
    v110 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v111 = -1073741824;
    int v112 = 0;
    v113 = sub_100100C18;
    id v25 = &unk_1001B60F8;
    v114 = &unk_1001B60F8;
    v57 = &v115;
    id v115 = v117;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v18, "appendObject:counterpart:", identifier, &v110);
    unsigned __int8 v21 = v116;
    title = v120->_title;
    double v20 = &v104;
    v104 = _NSConcreteStackBlock;
    int v105 = -1073741824;
    int v106 = 0;
    v107 = sub_100100C48;
    v108 = &unk_1001B60F8;
    id v56 = &v109;
    id v109 = v117;
    id v4 = -[BSEqualsBuilder appendObject:counterpart:](v21, "appendObject:counterpart:", title, &v104);
    unsigned __int8 v24 = v116;
    artistTitle = v120->_artistTitle;
    id v23 = &v98;
    v98 = _NSConcreteStackBlock;
    int v99 = -1073741824;
    int v100 = 0;
    v101 = sub_100100C78;
    v102 = &unk_1001B60F8;
    os_log_t v55 = &v103;
    id v103 = v117;
    id v5 = -[BSEqualsBuilder appendObject:counterpart:](v24, "appendObject:counterpart:", artistTitle, &v98);
    os_log_type_t v28 = v116;
    albumTitle = v120->_albumTitle;
    id v27 = &v92;
    v92 = _NSConcreteStackBlock;
    int v93 = -1073741824;
    int v94 = 0;
    v95 = sub_100100CA8;
    v96 = &unk_1001B60F8;
    os_log_type_t v54 = &v97;
    id v97 = v117;
    id v6 = -[BSEqualsBuilder appendObject:counterpart:](v28, "appendObject:counterpart:", albumTitle, &v92);
    unsigned __int8 v31 = v116;
    double duration = v120->_duration;
    id v30 = &v86;
    v86 = _NSConcreteStackBlock;
    int v87 = -1073741824;
    int v88 = 0;
    v89 = sub_100100CD8;
    v32 = &unk_1001B94E8;
    v90 = &unk_1001B94E8;
    v53 = &v91;
    id v91 = v117;
    id v7 = -[BSEqualsBuilder appendDouble:counterpart:](v31, "appendDouble:counterpart:", &v86, duration);
    v35 = v116;
    double elapsedTime = v120->_elapsedTime;
    unint64_t v34 = &v80;
    v80 = _NSConcreteStackBlock;
    int v81 = -1073741824;
    int v82 = 0;
    v83 = sub_100100D08;
    v84 = &unk_1001B94E8;
    v52 = &v85;
    id v85 = v117;
    id v8 = -[BSEqualsBuilder appendDouble:counterpart:](v35, "appendDouble:counterpart:", &v80, elapsedTime);
    v38 = v116;
    BOOL liveContent = v120->_liveContent;
    char v37 = &v74;
    v74 = _NSConcreteStackBlock;
    int v75 = -1073741824;
    int v76 = 0;
    v77 = sub_100100D38;
    id v39 = &unk_1001B7A30;
    v78 = &unk_1001B7A30;
    SEL v51 = &v79;
    id v79 = v117;
    int v47 = 1;
    id v9 = -[BSEqualsBuilder appendBool:counterpart:](v38, "appendBool:counterpart:", liveContent, &v74);
    id v42 = v116;
    BOOL podcast = v120->_podcast;
    v41 = &v68;
    id v68 = _NSConcreteStackBlock;
    int v69 = -1073741824;
    int v70 = 0;
    BOOL v71 = sub_100100D6C;
    v72 = &unk_1001B7A30;
    v50 = &v73;
    id v73 = v117;
    id v10 = -[BSEqualsBuilder appendBool:counterpart:](v42, "appendBool:counterpart:", podcast, &v68);
    char v46 = v116;
    id v45 = &v61;
    id v61 = _NSConcreteStackBlock;
    int v62 = -1073741824;
    int v63 = 0;
    v64 = sub_100100DA0;
    v65 = &unk_1001BACB0;
    id v49 = (id *)&v66;
    id v66 = v120;
    id v48 = &v67;
    id v67 = v117;
    id obj = 0LL;
    id v11 = -[BSEqualsBuilder appendEqualsBlocks:](v46, "appendEqualsBlocks:", &v61, 0LL);
    unsigned __int8 v12 = -[BSEqualsBuilder isEqual](v116, "isEqual");
    char v121 = v12 & 1 & v47;
    int v118 = v47;
    objc_storeStrong(v48, obj);
    objc_storeStrong(v49, obj);
    objc_storeStrong(v50, obj);
    objc_storeStrong(v51, obj);
    objc_storeStrong(v52, obj);
    objc_storeStrong(v53, obj);
    objc_storeStrong(v54, obj);
    objc_storeStrong(v55, obj);
    objc_storeStrong(v56, obj);
    objc_storeStrong(v57, obj);
    objc_storeStrong(v58, obj);
    objc_storeStrong(v59, obj);
  }

  objc_storeStrong(location, 0LL);
  return v121 & 1;
}

- (unint64_t)hash
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendObject:v6->_identifier];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (NSString)description
{
  return (NSString *)-[TVSSNowPlayingMediaItemMetadata succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSNowPlayingMediaItemMetadata descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artistTitle
{
  return self->_artistTitle;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (double)duration
{
  return self->_duration;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (NSDate)elapsedTimeDate
{
  return self->_elapsedTimeDate;
}

- (BOOL)isLiveContent
{
  return self->_liveContent;
}

- (BOOL)isPodcast
{
  return self->_podcast;
}

- (void).cxx_destruct
{
}

@end