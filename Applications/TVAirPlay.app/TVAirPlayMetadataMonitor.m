@interface TVAirPlayMetadataMonitor
+ (id)keyMap;
+ (void)updateWithElapsedTime:(double)a3 playbackRate:(float)a4;
+ (void)updateWithIsVideo:(BOOL)a3;
+ (void)updateWithParameters:(id)a3;
@end

@implementation TVAirPlayMetadataMonitor

+ (id)keyMap
{
  if (qword_10003F798 != -1) {
    dispatch_once(&qword_10003F798, &stru_100030BE8);
  }
  return (id)qword_10003F790;
}

+ (void)updateWithParameters:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10000A87C;
  v20 = &unk_100030C10;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 keyMap]);
  id v21 = v6;
  v7 = v5;
  v22 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:&v17];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", @"uniqueID", v17, v18, v19, v20));

  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  kMRMediaRemoteMediaTypeMusic,  kMRMediaRemoteNowPlayingInfoMediaType);
  }
  id v9 = sub_100004170();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v7));
    *(_DWORD *)buf = 138543362;
    v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Set New Now Playing Info:\n%{public}@",  buf,  0xCu);
  }

  MRMediaRemoteSetNowPlayingInfoWithMergePolicy(v7, 0LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v7,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoPlaybackRate));
  else {
    uint64_t v13 = 2LL;
  }
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  MRMediaRemoteSetNowPlayingApplicationPlaybackStateForOrigin(LocalOrigin, v13, 0LL, 0LL);
  id v15 = sub_100004170();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v24) = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Set Playback State: %{public}u", buf, 8u);
  }
}

+ (void)updateWithElapsedTime:(double)a3 playbackRate:(float)a4
{
  v9[0] = kMRMediaRemoteNowPlayingInfoElapsedTime;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  v10[0] = v5;
  v9[1] = kMRMediaRemoteNowPlayingInfoPlaybackRate;
  *(float *)&double v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

  MRMediaRemoteSetNowPlayingInfoWithMergePolicy(v8, 0LL);
}

+ (void)updateWithIsVideo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = kMRMediaRemoteNowPlayingInfoMediaType;
  id v4 = (uint64_t *)&kMRMediaRemoteNowPlayingInfoTypeVideo;
  if (!a3) {
    id v4 = (uint64_t *)&kMRMediaRemoteNowPlayingInfoTypeAudio;
  }
  uint64_t v12 = *v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v6 = sub_100004170();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"audio";
    if (v3) {
      v8 = @"video";
    }
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting Now Playing media type: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  MRMediaRemoteSetNowPlayingInfoWithMergePolicy(v5, 0LL);
}

@end