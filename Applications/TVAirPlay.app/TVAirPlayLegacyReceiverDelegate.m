@interface TVAirPlayLegacyReceiverDelegate
+ (int)_allowInterruption:(id *)a3;
- (NSNumber)audioSessionID;
- (TVAirPlayLegacyReceiverDelegate)init;
- (TVAirPlayLegacyReceiverDelegateEventSink)eventSink;
- (double)lastDuration;
- (double)lastElapsedTime;
- (id)airplayUIGetProperty:(id)a3 qualifier:(id)a4 error:(int *)a5;
- (int)airplayUIHideProgress;
- (int)airplayUIPerform:(id)a3 inputParams:(id)a4 outputParams:(id *)a5;
- (int)airplayUISetProperty:(id)a3 qualifier:(id)a4 value:(id)a5;
- (int)airplayUIShowProgress;
- (int)airplayUIStartAudio:(id)a3 outputParams:(id *)a4;
- (int)airplayUIStartPresentation:(id)a3 outputParams:(id *)a4;
- (int)airplayUIStartVideo:(id)a3 outputParams:(id *)a4;
- (int)airplayUIStopAudio:(id)a3;
- (int)airplayUIStopPresentation:(id)a3;
- (int)airplayUIStopVideo:(id)a3;
- (int)airplayUIUpdateAudioMetaData:(id)a3;
- (int)airplayUIUpdateAudioProgress:(double)a3 duration:(double)a4;
- (void)session:(id)a3 didPerformEvent:(id)a4 withInfo:(id)a5;
- (void)setAudioSessionID:(id)a3;
- (void)setEventSink:(id)a3;
@end

@implementation TVAirPlayLegacyReceiverDelegate

- (TVAirPlayLegacyReceiverDelegate)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVAirPlayLegacyReceiverDelegate;
  v2 = -[TVAirPlayLegacyReceiverDelegate init](&v4, "init");
  if (v2) {
    MRMediaRemoteSetCanBeNowPlayingApplication(1LL);
  }
  return v2;
}

- (id)airplayUIGetProperty:(id)a3 qualifier:(id)a4 error:(int *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_100004090();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "airplayUIGetProperty: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_100013664;
  v28 = sub_100013674;
  id v29 = 0LL;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10001367C;
  v16[3] = &unk_100030FD0;
  id v11 = v7;
  id v17 = v11;
  v19 = &v21;
  p___int128 buf = &buf;
  id v12 = v8;
  id v18 = v12;
  dispatch_sync(&_dispatch_main_q, v16);
  int v13 = *((_DWORD *)v22 + 6);
  if (v13) {
    *a5 = v13;
  }
  id v14 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

- (int)airplayUISetProperty:(id)a3 qualifier:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100004090();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v10));
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "airplayUISetProperty (%{public}@): %{public}@",  buf,  0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  int v26 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100013A00;
  block[3] = &unk_100030FF8;
  id v20 = v8;
  uint64_t v21 = self;
  id v22 = v10;
  id v23 = v9;
  int v24 = buf;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_sync(&_dispatch_main_q, block);
  int v17 = *(_DWORD *)(*(void *)&buf[8] + 24LL);

  _Block_object_dispose(buf, 8);
  return v17;
}

- (int)airplayUIPerform:(id)a3 inputParams:(id)a4 outputParams:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100004090();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v9));
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "airplayUIPerform (%{public}@): %{public}@",  buf,  0x16u);
  }

  dispatch_group_t v13 = dispatch_group_create();
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  int v29 = 0;
  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v31 = sub_100013664;
  v32 = sub_100013674;
  id v33 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100013DC8;
  v19[3] = &unk_100031048;
  id v14 = v8;
  id v20 = v14;
  id v15 = v9;
  id v21 = v15;
  id v22 = self;
  id v16 = v13;
  id v23 = v16;
  int v24 = &v26;
  v25 = buf;
  dispatch_sync(&_dispatch_main_q, v19);
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40LL);
  }
  int v17 = *((_DWORD *)v27 + 6);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (int)airplayUIStartPresentation:(id)a3 outputParams:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100004090();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v6));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "airplayUIStartPresentation: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  dispatch_group_t v10 = dispatch_group_create();
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  int v27 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_100013664;
  v35 = sub_100013674;
  id v36 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000144A8;
  block[3] = &unk_100031098;
  id v22 = &v24;
  p___int128 buf = &buf;
  void block[4] = self;
  id v11 = v10;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  dispatch_sync(&_dispatch_main_q, block);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
  }
  id v13 = sub_100004090();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  *(void *)(*((void *)&buf + 1) + 40LL)));
    int v16 = *((_DWORD *)v25 + 6);
    *(_DWORD *)uint64_t v28 = 138543618;
    int v29 = v15;
    __int16 v30 = 1024;
    int v31 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "airplayUIStartPresentation (complete): %{public}@ err:  %d",  v28,  0x12u);
  }

  int v17 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v24, 8);
  return v17;
}

- (int)airplayUIStopPresentation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004090();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v4));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "airplayUIStopPresentation: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001485C;
  block[3] = &unk_1000310C0;
  id v12 = v4;
  p___int128 buf = &buf;
  SEL v14 = a2;
  id v8 = v4;
  dispatch_sync(&_dispatch_main_q, block);
  int v9 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (int)airplayUIShowProgress
{
  id v2 = sub_100004090();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "airplayUIShowProgress", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  id v8 = buf;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014AE0;
  block[3] = &unk_1000310E8;
  void block[4] = buf;
  dispatch_sync(&_dispatch_main_q, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(buf, 8);
  return v4;
}

- (int)airplayUIHideProgress
{
  id v2 = sub_100004090();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "airplayUIHideProgress", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  id v8 = buf;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014CE4;
  block[3] = &unk_1000310E8;
  void block[4] = buf;
  dispatch_sync(&_dispatch_main_q, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(buf, 8);
  return v4;
}

- (int)airplayUIStartAudio:(id)a3 outputParams:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100004090();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v6));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "airplayUIStartAudio: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  dispatch_group_t v10 = dispatch_group_create();
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100013664;
  int v27 = sub_100013674;
  id v28 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014FF8;
  block[3] = &unk_100031110;
  void block[4] = self;
  id v11 = v10;
  uint64_t v16 = v11;
  id v12 = v6;
  id v17 = v12;
  p___int128 buf = &buf;
  v19 = &v20;
  dispatch_sync(&_dispatch_main_q, block);
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
  }
  int v13 = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (int)airplayUIStopAudio:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004090();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v4));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "airplayUIStopAudio: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015318;
  block[3] = &unk_1000310C0;
  id v12 = v4;
  p___int128 buf = &buf;
  SEL v14 = a2;
  id v8 = v4;
  dispatch_sync(&_dispatch_main_q, block);
  int v9 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (int)airplayUIUpdateAudioMetaData:(id)a3
{
  return 0;
}

- (int)airplayUIUpdateAudioProgress:(double)a3 duration:(double)a4
{
  double v5 = round(a3);
  double v6 = round(a4);
  if (v5 != self->_lastElapsedTime || v6 != self->_lastDuration)
  {
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2020000000LL;
    int v10 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001558C;
    block[3] = &unk_100031138;
    *(double *)&void block[5] = v6;
    *(double *)&block[6] = v5;
    void block[4] = v9;
    dispatch_sync(&_dispatch_main_q, block);
    _Block_object_dispose(v9, 8);
  }

  self->_lastElapsedTime = v5;
  self->_lastDuration = v6;
  return 0;
}

- (int)airplayUIStartVideo:(id)a3 outputParams:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100004090();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v6));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "airplayUIStartVideo: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  dispatch_group_t v10 = dispatch_group_create();
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100013664;
  int v27 = sub_100013674;
  id v28 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015954;
  block[3] = &unk_100031098;
  id v18 = &v20;
  p___int128 buf = &buf;
  void block[4] = self;
  id v11 = v6;
  id v16 = v11;
  id v12 = v10;
  int v17 = v12;
  dispatch_sync(&_dispatch_main_q, block);
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
  }
  int v13 = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

- (int)airplayUIStopVideo:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004090();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  v4));
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "airplayUIStopVideo: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015DD0;
  block[3] = &unk_1000310C0;
  id v12 = v4;
  p___int128 buf = &buf;
  SEL v14 = a2;
  id v8 = v4;
  dispatch_sync(&_dispatch_main_q, block);
  int v9 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (void)session:(id)a3 didPerformEvent:(id)a4 withInfo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = sub_100004090();
  dispatch_group_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PostEvent: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayLegacyReceiverDelegate eventSink](self, "eventSink"));
  [v11 airPlayReceiverDelegate:self postEvent:v7 withInfo:v8];
}

+ (int)_allowInterruption:(id *)a3
{
  return 0;
}

- (TVAirPlayLegacyReceiverDelegateEventSink)eventSink
{
  return (TVAirPlayLegacyReceiverDelegateEventSink *)objc_loadWeakRetained((id *)&self->_eventSink);
}

- (void)setEventSink:(id)a3
{
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(id)a3
{
}

- (double)lastElapsedTime
{
  return self->_lastElapsedTime;
}

- (double)lastDuration
{
  return self->_lastDuration;
}

- (void).cxx_destruct
{
}

@end