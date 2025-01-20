@interface MZUniversalPlaybackPositionMetadata
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
+ (id)metadataWithValuesFromDataSourceItem:(id)a3;
+ (id)metadataWithValuesItemIdentifier:(id)a3 keyValueStorePayload:(id)a4;
- (BOOL)hasBeenPlayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNew;
- (BOOL)playStateManuallySet;
- (MZUniversalPlaybackPositionMetadata)init;
- (NSString)itemIdentifier;
- (double)bookmarkTime;
- (double)lastDatePlayed;
- (double)lastUserMarkedAsPlayedDate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyValueStorePayload;
- (unint64_t)hash;
- (unint64_t)playCount;
- (void)setBookmarkTime:(double)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLastDatePlayed:(double)a3;
- (void)setLastUserMarkedAsPlayedDate:(double)a3;
- (void)setPlayCount:(unint64_t)a3;
- (void)setPlayStateManuallySet:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MZUniversalPlaybackPositionMetadata

- (MZUniversalPlaybackPositionMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MZUniversalPlaybackPositionMetadata;
  return -[MZUniversalPlaybackPositionMetadata init](&v3, "init");
}

- (id)description
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MZUniversalPlaybackPositionMetadata;
  id v3 = -[MZUniversalPlaybackPositionMetadata description](&v22, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier"));
  -[MZUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02lu:%02lu:%.2f",  (uint64_t)(v6 / 3600.0),  (uint64_t)((v6 - (double)(3600 * (uint64_t)(v6 / 3600.0))) / 60.0),  v6 - (double)(3600 * (uint64_t)(v6 / 3600.0))
                 - (double)(60 * (uint64_t)((v6 - (double)(3600 * (uint64_t)(v6 / 3600.0))) / 60.0))));
  unsigned int v8 = -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed");
  unint64_t v9 = -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount");
  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  id v11 = sub_100031924(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v13 = -[MZUniversalPlaybackPositionMetadata isNew](self, "isNew");
  -[MZUniversalPlaybackPositionMetadata lastUserMarkedAsPlayedDate](self, "lastUserMarkedAsPlayedDate");
  id v15 = sub_100031924(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[MZUniversalPlaybackPositionMetadata lastDatePlayed](self, "lastDatePlayed");
  id v18 = sub_100031924(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: id=%@, bktm=%@, hbpl=%d, plct=%lu, timestamp=%@, isNew=%d, lastUserMarkedAsPlayedDate=%@, lastDatePlayed=%@, playStateManuallySet=%d",  v4,  v5,  v7,  v8,  v9,  v12,  v13,  v16,  v19,  -[MZUniversalPlaybackPositionMetadata playStateManuallySet](self, "playStateManuallySet")));

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___MZUniversalPlaybackPositionMetadata);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionMetadata itemIdentifier](self, "itemIdentifier"));
  -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v4, "setItemIdentifier:", v5);

  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v4, "setTimestamp:");
  -[MZUniversalPlaybackPositionMetadata bookmarkTime](self, "bookmarkTime");
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v4, "setBookmarkTime:");
  -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:]( v4,  "setHasBeenPlayed:",  -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed"));
  -[MZUniversalPlaybackPositionMetadata setPlayCount:]( v4,  "setPlayCount:",  -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = -[NSString hash](self->_itemIdentifier, "hash") ^ self->_hasBeenPlayed ^ self->_playCount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_bookmarkTime));
  unint64_t v5 = v3 ^ (unint64_t)[v4 hash];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timestamp));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MZUniversalPlaybackPositionMetadata);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    double v6 = (double *)v4;
    BOOL v7 = -[NSString isEqual:](self->_itemIdentifier, "isEqual:", *((void *)v6 + 2))
      && self->_timestamp == v6[3]
      && self->_bookmarkTime == v6[4]
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"storeItemAdamID",  @"mediaEntityType",  0LL));
  id v5 = sub_100031E78(v3, v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"mediaEntityType"]);
  id v8 = [v7 integerValue];

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"storeItemAdamID"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"storeItemAdamID"]);
  unsigned int v13 = v12;
  if ((isKindOfClass & 1) != 0) {
    id v14 = [v12 longLongValue];
  }
  else {
    id v14 = [v12 unsignedLongLongValue];
  }
  id v15 = v14;

  if (v15) {
    BOOL v16 = v8 == (id)3;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16 || v8 == (id)4)
  {
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    v32 = sub_100031F50;
    v33 = &unk_100241240;
    id v34 = v3;
    id v18 = objc_retainBlock(&v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"podcastURL",  @"podcastGUID",  0LL));

    uint64_t v20 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    if (v21)
    {
LABEL_13:
      objc_super v22 = (void *)v21;
LABEL_16:

      id v4 = v19;
      goto LABEL_17;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"title",  @"artist",  @"albumTitle",  0LL,  v30,  v31,  v32,  v33));

    uint64_t v24 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v23);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!v25)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"title",  @"albumTitle",  0LL));

      uint64_t v27 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v27);
      if (v21) {
        goto LABEL_13;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"title",  @"artist",  0LL));

      uint64_t v28 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v23);
      uint64_t v25 = objc_claimAutoreleasedReturnValue(v28);
      if (!v25)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"title", 0LL));

        uint64_t v29 = ((uint64_t (*)(void ***, void *))v18[2])(v18, v19);
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v29);
        goto LABEL_13;
      }
    }

    objc_super v22 = (void *)v25;
    v19 = v23;
    goto LABEL_16;
  }

  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v15));
LABEL_17:

  return v22;
}

+ (id)metadataWithValuesFromDataSourceItem:(id)a3
{
  id v30 = a3;
  uint64_t v28 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v29 timeIntervalSinceReferenceDate];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v24 timeIntervalSinceReferenceDate];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  [v5 timeIntervalSinceReferenceDate];
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  id v8 = -[NSMutableDictionary initWithObjectsAndKeys:]( v28,  "initWithObjectsAndKeys:",  v27,  @"bookmarkTime",  v26,  @"bookmarkMetadataTimestamp",  v25,  @"hasBeenPalyed",  v23,  @"playCount",  v3,  @"isNew",  v4,  @"lastUserMarkedAsPlayedDate",  v6,  @"lastDatePlayed",  v7,  @"playStateManuallySet",  0LL);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v8, "allKeys"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000325B0;
  v31[3] = &unk_100241268;
  v32 = v8;
  id v11 = v8;
  [v30 enumerateValuesForProperties:v10 usingBlock:v31];

  v12 = objc_alloc_init(&OBJC_CLASS___MZUniversalPlaybackPositionMetadata);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:]( &OBJC_CLASS___MZUniversalPlaybackPositionMetadata,  "keyValueStoreItemIdentifierForItem:",  v30));

  -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v12, "setItemIdentifier:", v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"bookmarkMetadataTimestamp"));
  [v14 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v12, "setTimestamp:");

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"bookmarkTime"));
  [v15 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v12, "setBookmarkTime:");

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"hasBeenPalyed"));
  -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v12, "setHasBeenPlayed:", [v16 BOOLValue]);

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"playCount"));
  -[MZUniversalPlaybackPositionMetadata setPlayCount:](v12, "setPlayCount:", [v17 integerValue]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"isNew"));
  -[MZUniversalPlaybackPositionMetadata setIsNew:](v12, "setIsNew:", [v18 BOOLValue]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"lastUserMarkedAsPlayedDate"));
  [v19 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setLastUserMarkedAsPlayedDate:](v12, "setLastUserMarkedAsPlayedDate:");

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"lastDatePlayed"));
  [v20 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setLastDatePlayed:](v12, "setLastDatePlayed:");

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v11, "valueForKey:", @"playStateManuallySet"));
  -[MZUniversalPlaybackPositionMetadata setPlayStateManuallySet:]( v12,  "setPlayStateManuallySet:",  [v21 BOOLValue]);

  return v12;
}

+ (id)metadataWithValuesItemIdentifier:(id)a3 keyValueStorePayload:(id)a4
{
  id v6 = a3;
  BOOL v7 = (const __CFData *)a4;
  id v8 = (void *)CFPropertyListCreateWithData(0LL, v7, 0LL, 0LL, 0LL);
  if (!v8)
  {
    v38[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v38[1] = objc_opt_class(&OBJC_CLASS___NSArray);
    v38[2] = objc_opt_class(&OBJC_CLASS___NSString);
    v38[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
    v38[4] = objc_opt_class(&OBJC_CLASS___NSData);
    v38[5] = objc_opt_class(&OBJC_CLASS___NSDate);
    v38[6] = objc_opt_class(&OBJC_CLASS___NSNull);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 7LL));
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

    uint64_t v37 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v7,  &v37));

    if (!v8) {
      goto LABEL_10;
    }
  }

  if ((objc_opt_respondsToSelector(v8, "objectForKey:") & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"pver"]);
  if (!v10
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"pver"]),
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber),
        (objc_opt_isKindOfClass(v4, v11) & 1) != 0))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"pver"]);
    id v13 = [v14 integerValue];

    if (!v10) {
      goto LABEL_9;
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"pver"]);
    id v13 = [v12 integerValue];
  }

LABEL_9:
  if (!v13)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___MZUniversalPlaybackPositionMetadata);
    -[MZUniversalPlaybackPositionMetadata setItemIdentifier:](v15, "setItemIdentifier:", v6);
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"bktm"]);
    if (!v17
      || (id v13 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"bktm"]),
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber),
          (objc_opt_isKindOfClass(v13, v18) & 1) != 0))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"bktm"]);
      [v20 doubleValue];
      -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v15, "setBookmarkTime:");

      if (!v17) {
        goto LABEL_17;
      }
    }

    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"bktm"]);
      [v19 doubleValue];
      -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v15, "setBookmarkTime:");
    }

LABEL_17:
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"hbpl"]);

    uint64_t v22 = v21 == 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"hbpl"]);
    uint64_t v24 = v23;
    if ((v22 & 1) != 0)
    {

      if (!v24)
      {
LABEL_28:
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"plct"]);
        if (!v29
          || (uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"plct"]),
              uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber),
              (objc_opt_isKindOfClass(v22, v30) & 1) != 0))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"plct"]);
          -[MZUniversalPlaybackPositionMetadata setPlayCount:](v15, "setPlayCount:", [v32 integerValue]);

          if (!v29)
          {
LABEL_33:

            v33 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"tstm"]);
            if (!v33
              || (uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"tstm"]),
                  uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber),
                  (objc_opt_isKindOfClass(v22, v34) & 1) != 0))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"tstm"]);
              [v36 doubleValue];
              -[MZUniversalPlaybackPositionMetadata setTimestamp:](v15, "setTimestamp:");

              if (!v33)
              {
LABEL_38:

                goto LABEL_11;
              }
            }

            else
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"tstm"]);
              [v35 doubleValue];
              -[MZUniversalPlaybackPositionMetadata setTimestamp:](v15, "setTimestamp:");
            }

            goto LABEL_38;
          }
        }

        else
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"plct"]);
          -[MZUniversalPlaybackPositionMetadata setPlayCount:](v15, "setPlayCount:", [v31 integerValue]);
        }

        goto LABEL_33;
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"hbpl"]);
      if (!v24
        || (uint64_t v22 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"hbpl"]),
            uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber),
            (objc_opt_isKindOfClass(v22, v26) & 1) != 0))
      {
LABEL_25:
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"hbpl"]);
        -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:]( v15,  "setHasBeenPlayed:",  [v28 BOOLValue]);

        if (!v24)
        {
LABEL_27:

          goto LABEL_28;
        }

- (id)keyValueStorePayload
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MZUniversalPlaybackPositionMetadata hasBeenPlayed](self, "hasBeenPlayed")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MZUniversalPlaybackPositionMetadata playCount](self, "playCount")));
  -[MZUniversalPlaybackPositionMetadata timestamp](self, "timestamp");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v3, v4, v5, v6, 0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"bktm",  @"hbpl",  @"plct",  @"tstm",  0LL));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v7,  v8));

  CFDataRef Data = CFPropertyListCreateData(0LL, v9, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  return Data;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (double)lastUserMarkedAsPlayedDate
{
  return self->_lastUserMarkedAsPlayedDate;
}

- (void)setLastUserMarkedAsPlayedDate:(double)a3
{
  self->_lastUserMarkedAsPlayedDate = a3;
}

- (double)lastDatePlayed
{
  return self->_lastDatePlayed;
}

- (void)setLastDatePlayed:(double)a3
{
  self->_lastDatePlayed = a3;
}

- (BOOL)playStateManuallySet
{
  return self->_playStateManuallySet;
}

- (void)setPlayStateManuallySet:(BOOL)a3
{
  self->_playStateManuallySet = a3;
}

- (void).cxx_destruct
{
}

@end