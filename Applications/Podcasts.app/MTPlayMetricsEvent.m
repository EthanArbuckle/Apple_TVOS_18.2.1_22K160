@interface MTPlayMetricsEvent
+ (id)eventWithAccessLog:(id)a3 dataSource:(id)a4;
- (AVPlayerItemAccessLogEvent)accessLogEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecorded;
- (MTEpisodeMetricDataSource)dataSource;
- (MTPlayMetricsEvent)initWithAccessLogEvent:(id)a3 dataSource:(id)a4;
- (id)_data;
- (id)description;
- (unint64_t)hash;
- (void)record;
- (void)setAccessLogEvent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setRecorded:(BOOL)a3;
@end

@implementation MTPlayMetricsEvent

+ (id)eventWithAccessLog:(id)a3 dataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)objc_opt_class(a1)) initWithAccessLogEvent:v7 dataSource:v6];

  return v8;
}

- (MTPlayMetricsEvent)initWithAccessLogEvent:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTPlayMetricsEvent;
  id v8 = -[MTPlayMetricsEvent init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MTPlayMetricsEvent setAccessLogEvent:](v8, "setAccessLogEvent:", v6);
    -[MTPlayMetricsEvent setDataSource:](v9, "setDataSource:", v7);
  }

  return v9;
}

- (BOOL)isRecorded
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL recorded = v2->_recorded;
  objc_sync_exit(v2);

  return recorded;
}

- (void)record
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](obj, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](obj, "_data"));
  +[IMMetrics recordEvent:dataSource:data:]( &OBJC_CLASS___IMMetrics,  "recordEvent:dataSource:data:",  @"play_stats",  v2,  v3);

  -[MTPlayMetricsEvent setRecorded:](obj, "setRecorded:", 1LL);
  objc_sync_exit(obj);
}

- (id)_data
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playbackStartDate]);
  [v3 timeIntervalSince1970];
  uint64_t v5 = (uint64_t)(v4 * 1000.0);

  v37[0] = @"uri";
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v2 URI]);
  v36 = (void *)v6;
  if (v6) {
    id v7 = (const __CFString *)v6;
  }
  else {
    id v7 = &stru_100248948;
  }
  v38[0] = v7;
  v37[1] = @"server_address";
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v2 serverAddress]);
  v35 = (void *)v8;
  if (v8) {
    v9 = (const __CFString *)v8;
  }
  else {
    v9 = &stru_100248948;
  }
  v38[1] = v9;
  v37[2] = @"number_of_server_address_changes";
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 numberOfServerAddressChanges]));
  v38[2] = v34;
  v37[3] = @"media_requests_wwan";
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 mediaRequestsWWAN]));
  v38[3] = v33;
  v37[4] = @"transfer_duration";
  [v2 transferDuration];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[4] = v32;
  v37[5] = @"number_of_bytes_transferred";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v2 numberOfBytesTransferred]));
  v38[5] = v31;
  v37[6] = @"number_of_media_requests";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 numberOfMediaRequests]));
  v38[6] = v30;
  v37[7] = @"playStartTime";
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v5));
  v38[7] = v29;
  v37[8] = @"playback_session_id";
  v28 = (void *)objc_claimAutoreleasedReturnValue([v2 playbackSessionID]);
  v38[8] = v28;
  v37[9] = @"playStartPosition";
  [v2 playbackStartOffset];
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[9] = v27;
  v37[10] = @"playback_type";
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v2 playbackType]);
  objc_super v11 = (void *)v10;
  if (v10) {
    v12 = (const __CFString *)v10;
  }
  else {
    v12 = &stru_100248948;
  }
  v38[10] = v12;
  v37[11] = @"startup_time";
  [v2 startupTime];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[11] = v26;
  v37[12] = @"playDuration";
  [v2 durationWatched];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[12] = v25;
  v37[13] = @"number_of_dropped_video_frames";
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 numberOfDroppedVideoFrames]));
  v38[13] = v24;
  v37[14] = @"number_of_stalls";
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 numberOfStalls]));
  v38[14] = v23;
  v37[15] = @"segments_downloaded_duration";
  [v2 segmentsDownloadedDuration];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[15] = v22;
  v37[16] = @"download_overdue";
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v2 downloadOverdue]));
  v38[16] = v13;
  v37[17] = @"observed_bitrate_stdev";
  [v2 observedBitrateStandardDeviation];
  [v2 observedBitrateStandardDeviation];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[17] = v14;
  v37[18] = @"observed_bitrate_max";
  [v2 observedMaxBitrate];
  [v2 observedMaxBitrate];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[18] = v15;
  v37[19] = @"observed_bitrate_min";
  [v2 observedMinBitrate];
  [v2 observedMinBitrate];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[19] = v16;
  v37[20] = @"switch_bitrate";
  [v2 switchBitrate];
  [v2 switchBitrate];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[20] = v17;
  v37[21] = @"indicated_bitrate";
  [v2 indicatedBitrate];
  [v2 indicatedBitrate];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[21] = v18;
  v37[22] = @"observed_bitrate";
  [v2 observedBitrate];
  [v2 observedBitrate];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v38[22] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  23LL));

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTPlayMetricsEvent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataSource]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](self, "dataSource"));
    unsigned int v9 = [v7 isEqual:v8];

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 _data]);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](self, "_data"));
      unsigned __int8 v12 = [v10 isEqualToDictionary:v11];
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent dataSource](self, "dataSource"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent _data](self, "_data"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playbackStartDate]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  [v5 playbackStartOffset];
  uint64_t v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlayMetricsEvent accessLogEvent](self, "accessLogEvent"));
  [v8 durationWatched];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ @ %@: from %f for %f seconds",  @"play_stats",  v4,  v7,  v9));

  return v10;
}

- (AVPlayerItemAccessLogEvent)accessLogEvent
{
  return self->_accessLogEvent;
}

- (void)setAccessLogEvent:(id)a3
{
}

- (MTEpisodeMetricDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void)setRecorded:(BOOL)a3
{
  self->_BOOL recorded = a3;
}

- (void).cxx_destruct
{
}

@end