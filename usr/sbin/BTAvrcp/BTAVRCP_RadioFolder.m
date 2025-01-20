@interface BTAVRCP_RadioFolder
- (BTAVRCP_RadioFolder)initWithName:(id)a3 uid:(unint64_t)a4;
- (NSArray)recentStations;
- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4;
- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4;
- (id)stationWithUid:(unint64_t)a3;
- (unint64_t)childrenCount;
- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4;
- (unsigned)playItemWithUid:(unint64_t)a3;
- (void)fetchRecentStations:(id)a3;
- (void)refreshRecentStations;
- (void)setRecentStations:(id)a3;
@end

@implementation BTAVRCP_RadioFolder

- (BTAVRCP_RadioFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___BTAVRCP_RadioFolder;
  v4 = -[BTAVRCP_VFSFolder initWithName:uid:](&v16, "initWithName:uid:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v4 selector:"refreshRecentStations" name:MPRadioLibraryStationsDidChangeNotification object:0];

    v6 = objc_alloc_init(&OBJC_CLASS___BTAVRCP_Syncifier);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_10000C354;
    v13 = &unk_100018B08;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[BTAVRCP_Syncifier createSwitcher](v6, "createSwitcher"));
    id v15 = v7;
    v14 = v4;
    -[BTAVRCP_RadioFolder fetchRecentStations:](v14, "fetchRecentStations:", &v10);
    if (!-[BTAVRCP_Syncifier wait:](v6, "wait:", 3.0, v10, v11, v12, v13))
    {
      v8 = (os_log_s *)qword_10001F1C0;
      if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
        sub_100010074(v8);
      }
    }
  }

  return v4;
}

- (void)refreshRecentStations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000C49C;
  v2[3] = &unk_100018B30;
  v2[4] = self;
  -[BTAVRCP_RadioFolder fetchRecentStations:](self, "fetchRecentStations:", v2);
}

- (void)fetchRecentStations:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPRadioLibrary defaultRadioLibrary](&OBJC_CLASS___MPRadioLibrary, "defaultRadioLibrary"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C5B4;
  v6[3] = &unk_100018B58;
  id v7 = v3;
  id v5 = v3;
  [v4 getRecentStationGroupsWithCompletionHandler:v6];
}

- (id)stationWithUid:(unint64_t)a3
{
  if (a3
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations")),
        id v6 = [v5 count],
        v5,
        (unint64_t)v6 >= a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:a3 - 1]);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (unint64_t)childrenCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3, a4));

  if (v4) {
    return 8;
  }
  else {
    return 9;
  }
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a3)
  {
    v13 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder recentStations](self, "recentStations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a3]);

    if ([v6 containsObject:&off_100019B50])
    {
      v17 = @"kTitle";
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedName]);
      v18 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    }

    else
    {
      v12 = 0LL;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3 + 1));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedName]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[BTAVRCP_VFSFolder replyItemWithUid:name:attributes:]( self,  "replyItemWithUid:name:attributes:",  v14,  v15,  v12));
  }

  return v13;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    if ([v6 containsObject:&off_100019B50])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedName]);
      [v8 setValue:v9 forKey:@"kTitle"];
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_RadioFolder stationWithUid:](self, "stationWithUid:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[MPMusicPlayerController systemMusicPlayer]( &OBJC_CLASS___MPMusicPlayerController,  "systemMusicPlayer"));
    [v4 setQueueWithRadioStation:v3];
    [v4 play];

    unsigned __int8 v5 = 4;
  }

  else
  {
    unsigned __int8 v5 = 9;
  }

  return v5;
}

- (NSArray)recentStations
{
  return self->_recentStations;
}

- (void)setRecentStations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end