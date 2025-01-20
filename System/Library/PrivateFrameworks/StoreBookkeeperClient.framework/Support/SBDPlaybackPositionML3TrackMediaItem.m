@interface SBDPlaybackPositionML3TrackMediaItem
- (ML3Track)track;
- (NSString)description;
- (SBDPlaybackPositionML3TrackMediaItem)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4;
- (int64_t)persistentID;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SBDPlaybackPositionML3TrackMediaItem

- (SBDPlaybackPositionML3TrackMediaItem)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SBDPlaybackPositionML3TrackMediaItem;
  v7 = -[SBDPlaybackPositionML3TrackMediaItem init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_persistentID = a3;
    v9 = -[ML3Track initWithPersistentID:inLibrary:]( objc_alloc(&OBJC_CLASS___ML3Track),  "initWithPersistentID:inLibrary:",  a3,  v6);
    track = v8->_track;
    v8->_track = v9;
  }

  return v8;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = sub_1000094F4();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009758;
  v14[3] = &unk_10001CC90;
  id v15 = v3;
  id v8 = v3;
  -[SBDPlaybackPositionML3TrackMediaItem enumerateValuesForProperties:usingBlock:]( self,  "enumerateValuesForProperties:usingBlock:",  v7,  v14);

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SBDPlaybackPositionML3TrackMediaItem;
  v9 = -[SBDPlaybackPositionML3TrackMediaItem description](&v13, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ properties = %@",  v10,  v8));

  return (NSString *)v11;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  id v8 = sub_1000094F4();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (qword_1000238C8 != -1) {
    dispatch_once(&qword_1000238C8, &stru_10001CE88);
  }
  id v29 = (id)qword_1000238C0;
  if ([v6 count])
  {
    int64_t v10 = (int64_t)[v6 count];
    v11 = calloc(8uLL, v10);
    objc_super v12 = (uint64_t *)calloc(8uLL, v10);
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    int64_t v14 = v10 - 1;
    v27 = v9;
    id v28 = v6;
    v26 = v11;
    if (v10 < 1)
    {
      -[ML3Track getValues:forProperties:count:](self->_track, "getValues:forProperties:count:", v11, v12, v10);
    }

    else
    {
      v25 = self;
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", i, v25, v26));
        v12[i] = (uint64_t)(id)objc_claimAutoreleasedReturnValue([v9 objectForKey:v16]);
      }

      -[ML3Track getValues:forProperties:count:](v25->_track, "getValues:forProperties:count:", v11, v12, v10);
      v17 = (uint64_t *)v11;
      v18 = v12;
      do
      {
        int64_t v19 = v14;
        uint64_t v20 = *v17++;
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[SBKUniversalPlaybackPositionMetadata SBKPropertyValueForML3PropertyValue:ML3Property:]( &OBJC_CLASS___SBKUniversalPlaybackPositionMetadata,  "SBKPropertyValueForML3PropertyValue:ML3Property:",  v20,  *v18));
        uint64_t v22 = *v18++;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:v22]);
        unsigned __int8 v30 = 0;
        v7[2](v7, v23, v21, &v30);
        int v24 = v30;

        if (v24) {
          break;
        }
        int64_t v14 = v19 - 1;
      }

      while (v19);
    }

    free(v26);
    free(v12);

    v9 = v27;
    id v6 = v28;
  }
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (ML3Track)track
{
  return self->_track;
}

- (void).cxx_destruct
{
}

@end