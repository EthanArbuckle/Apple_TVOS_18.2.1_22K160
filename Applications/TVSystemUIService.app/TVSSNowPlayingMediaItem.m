@interface TVSSNowPlayingMediaItem
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
- (TVSSNowPlayingMediaItemMetadata)metadata;
- (UIImage)platterArtworkImage;
- (double)duration;
- (double)elapsedTime;
- (id)_initWithMetadata:(id)a3 artworkCacheIdentifier:(id)a4 artworkCacheReference:(id)a5;
- (id)artworkToken;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_updateWithMetadata:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestArtworkWithFittingSize:(CGSize)a3 completion:(id)a4;
- (void)setPlatterArtworkImage:(id)a3;
@end

@implementation TVSSNowPlayingMediaItem

- (void)setPlatterArtworkImage:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_setAssociatedObject(v4, &off_100220578, location[0], (void *)1);
  objc_storeStrong(location, 0LL);
}

- (UIImage)platterArtworkImage
{
  return (UIImage *)objc_getAssociatedObject(self, &off_100220578);
}

- (id)_initWithMetadata:(id)a3 artworkCacheIdentifier:(id)a4 artworkCacheReference:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  v5 = v18;
  v18 = 0LL;
  v14.receiver = v5;
  v14.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingMediaItem;
  v18 = -[TVSSNowPlayingMediaItem init](&v14, "init");
  objc_storeStrong((id *)&v18, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v18->_metadata, location[0]);
    v6 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v18->_observers;
    v18->_observers = v6;

    objc_storeStrong((id *)&v18->_artworkCacheReference, v15);
    v8 = (NSString *)[v16 copy];
    artworkCacheIdentifier = v18->_artworkCacheIdentifier;
    v18->_artworkCacheIdentifier = v8;
  }

  v11 = v18;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v11;
}

- (NSString)identifier
{
  return -[TVSSNowPlayingMediaItemMetadata identifier](self->_metadata, "identifier", a2, self);
}

- (NSString)title
{
  return -[TVSSNowPlayingMediaItemMetadata title](self->_metadata, "title", a2, self);
}

- (NSString)albumTitle
{
  return -[TVSSNowPlayingMediaItemMetadata albumTitle](self->_metadata, "albumTitle", a2, self);
}

- (NSString)artistTitle
{
  return -[TVSSNowPlayingMediaItemMetadata artistTitle](self->_metadata, "artistTitle", a2, self);
}

- (id)artworkToken
{
  return -[TVSSNowPlayingMediaItemMetadata artworkToken](self->_metadata, "artworkToken", a2, self);
}

- (double)elapsedTime
{
  return result;
}

- (NSDate)elapsedTimeDate
{
  return -[TVSSNowPlayingMediaItemMetadata elapsedTimeDate](self->_metadata, "elapsedTimeDate", a2, self);
}

- (double)duration
{
  return result;
}

- (BOOL)isLiveContent
{
  return -[TVSSNowPlayingMediaItemMetadata isLiveContent](self->_metadata, "isLiveContent", a2, self);
}

- (BOOL)isPodcast
{
  return -[TVSSNowPlayingMediaItemMetadata isPodcast](self->_metadata, "isPodcast", a2, self);
}

- (void)requestArtworkWithFittingSize:(CGSize)a3 completion:(id)a4
{
  CGSize v27 = a3;
  v26 = self;
  SEL v25 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (!location)
  {
    v23 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion");
    id v22 = &_os_log_default;
    char v21 = 16;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v22;
      os_log_type_t type = v21;
      v10 = NSStringFromSelector(v25);
      v6 = v10;
      v20 = v6;
      v4 = (objc_class *)objc_opt_class(v26);
      v9 = NSStringFromClass(v4);
      v19 = v9;
      sub_10000583C( (uint64_t)v28,  (uint64_t)v6,  (uint64_t)v19,  (uint64_t)v26,  (uint64_t)@"TVSSNowPlayingMediaItem.m",  99,  (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v28,  0x3Au);

      objc_storeStrong((id *)&v19, 0LL);
      objc_storeStrong((id *)&v20, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v23, "UTF8String"));
    __break(0);
    JUMPOUT(0x10011DB34LL);
  }

  id v18 = -[TVSSNowPlayingMediaItemMetadata artworkCatalog](v26->_metadata, "artworkCatalog");
  [v18 setCacheIdentifier:v26->_artworkCacheIdentifier forCacheReference:v26->_artworkCacheReference];
  objc_msgSend(v18, "setFittingSize:", v27.width, v27.height);
  id v5 = v18;
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  objc_super v14 = sub_10011DC98;
  id v15 = &unk_1001BB8B0;
  id v17 = location;
  id v16 = v18;
  [v5 requestImageWithCompletion:&v11];
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)addObserver:(id)a3
{
  id v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    objc_super v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      v9 = NSStringFromSelector(v16);
      id v5 = v9;
      v11 = v5;
      v3 = (objc_class *)objc_opt_class(v17);
      v8 = NSStringFromClass(v3);
      v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSNowPlayingMediaItem.m",  114,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x10011E00CLL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_observers, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  SEL v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      v8 = NSStringFromSelector(v15);
      id v4 = v8;
      v10 = v4;
      v3 = (objc_class *)objc_opt_class(v16);
      v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSNowPlayingMediaItem.m",  121,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x10011E26CLL);
  }

  -[TVSObserverSet removeObserver:](v16->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)_updateWithMetadata:(id)a3
{
  SEL v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v23 =  -[TVSSNowPlayingMediaItemMetadata changedMetadataKeysAfterUpdatingWithMetadata:]( v25->_metadata,  "changedMetadataKeysAfterUpdatingWithMetadata:",  location[0]);
  if ([v23 count])
  {
    objc_storeStrong((id *)&v25->_metadata, location[0]);
    id v22 = NowPlayingMediaItemLog();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v22;
      os_log_type_t type = v21;
      id v9 = -[TVSSNowPlayingMediaItem succinctDescription](v25, "succinctDescription");
      id v20 = v9;
      sub_100025B38( (uint64_t)v27,  (uint64_t)"-[TVSSNowPlayingMediaItem _updateWithMetadata:]",  (uint64_t)v23,  (uint64_t)v20);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "%s: Media item metadata has changed. changedKeys=%{public}@, state=%@",  v27,  0x20u);

      objc_storeStrong(&v20, 0LL);
    }

    objc_storeStrong(&v22, 0LL);
    observers = v25->_observers;
    id v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    SEL v16 = sub_10011E5F8;
    id v17 = &unk_1001BB8D8;
    id v18 = v25;
    id v19 = v23;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v13);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong((id *)&v18, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)NowPlayingMediaItemLog();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      os_log_type_t v4 = v11;
      id v5 = -[TVSSNowPlayingMediaItem succinctDescription](v25, "succinctDescription");
      id v10 = v5;
      sub_100025AE4((uint64_t)v26, (uint64_t)"-[TVSSNowPlayingMediaItem _updateWithMetadata:]", (uint64_t)v10);
      _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "%s: Media item metadata has *not* changed. state=%@",  v26,  0x16u);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSNowPlayingMediaItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v8[0];
  id v4 = -[TVSSNowPlayingMediaItem identifier](v9, "identifier");
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v8[0];
  v6 = -[TVSSNowPlayingMediaItem title](v9, "title");
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSNowPlayingMediaItem descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v8);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v6, "setActiveMultilinePrefix:", location[0]);
  id v3 = -[BSDescriptionBuilder appendObject:withName:](v6, "appendObject:withName:", v8->_metadata, @"metadata");
  id v5 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17 == location[0])
  {
    char v18 = 1;
    int v15 = 1;
  }

  else
  {
    id v14 = location[0];
    id v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSNowPlayingMediaItem));
    v6 = v13;
    metadata = v17->_metadata;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_10011EAF0;
    os_log_type_t v11 = &unk_1001B60F8;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v6, "appendObject:counterpart:", metadata, &v7);
    char v18 = -[BSEqualsBuilder isEqual](v13, "isEqual") & 1;
    int v15 = 1;
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

- (unint64_t)hash
{
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v4 = v7[0];
  id v5 = -[TVSSNowPlayingMediaItem identifier](v8, "identifier");
  id v2 = objc_msgSend(v4, "appendObject:");

  id v6 = [v7[0] hash];
  objc_storeStrong(v7, 0LL);
  return (unint64_t)v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSNowPlayingMediaItem succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSNowPlayingMediaItem descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (TVSSNowPlayingMediaItemMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end