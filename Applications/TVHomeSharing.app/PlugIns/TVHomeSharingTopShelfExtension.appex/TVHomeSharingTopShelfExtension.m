id sub_100002BAC()
{
  if (qword_1000155C0 != -1) {
    dispatch_once(&qword_1000155C0, &stru_100010388);
  }
  return (id)qword_1000155B8;
}

void sub_100002BEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ApplicationDelegate");
  v2 = (void *)qword_1000155B8;
  qword_1000155B8 = (uint64_t)v1;
}

id sub_100002C1C()
{
  if (qword_1000155D0 != -1) {
    dispatch_once(&qword_1000155D0, &stru_1000103A8);
  }
  return (id)qword_1000155C8;
}

void sub_100002C5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ChangeSetDataSource");
  v2 = (void *)qword_1000155C8;
  qword_1000155C8 = (uint64_t)v1;
}

id sub_100002C8C()
{
  if (qword_1000155E0 != -1) {
    dispatch_once(&qword_1000155E0, &stru_1000103C8);
  }
  return (id)qword_1000155D8;
}

void sub_100002CCC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "DiffableDataSource");
  v2 = (void *)qword_1000155D8;
  qword_1000155D8 = (uint64_t)v1;
}

id sub_100002CFC()
{
  if (qword_1000155F0 != -1) {
    dispatch_once(&qword_1000155F0, &stru_1000103E8);
  }
  return (id)qword_1000155E8;
}

void sub_100002D3C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ImageProxyQueueLoader");
  v2 = (void *)qword_1000155E8;
  qword_1000155E8 = (uint64_t)v1;
}

id sub_100002D6C()
{
  if (qword_100015600 != -1) {
    dispatch_once(&qword_100015600, &stru_100010408);
  }
  return (id)qword_1000155F8;
}

void sub_100002DAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MainSceneDelegate");
  v2 = (void *)qword_1000155F8;
  qword_1000155F8 = (uint64_t)v1;
}

id sub_100002DDC()
{
  if (qword_100015610 != -1) {
    dispatch_once(&qword_100015610, &stru_100010428);
  }
  return (id)qword_100015608;
}

void sub_100002E1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MediaEntityFetching");
  v2 = (void *)qword_100015608;
  qword_100015608 = (uint64_t)v1;
}

id sub_100002E4C()
{
  if (qword_100015620 != -1) {
    dispatch_once(&qword_100015620, &stru_100010448);
  }
  return (id)qword_100015618;
}

void sub_100002E8C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playback");
  v2 = (void *)qword_100015618;
  qword_100015618 = (uint64_t)v1;
}

id sub_100002EBC()
{
  if (qword_100015630 != -1) {
    dispatch_once(&qword_100015630, &stru_100010468);
  }
  return (id)qword_100015628;
}

void sub_100002EFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playlist");
  v2 = (void *)qword_100015628;
  qword_100015628 = (uint64_t)v1;
}

id sub_100002F2C()
{
  if (qword_100015640 != -1) {
    dispatch_once(&qword_100015640, &stru_100010488);
  }
  return (id)qword_100015638;
}

void sub_100002F6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "PPT");
  v2 = (void *)qword_100015638;
  qword_100015638 = (uint64_t)v1;
}

id sub_100002F9C()
{
  if (qword_100015650 != -1) {
    dispatch_once(&qword_100015650, &stru_1000104A8);
  }
  return (id)qword_100015648;
}

void sub_100002FDC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "RootViewController");
  v2 = (void *)qword_100015648;
  qword_100015648 = (uint64_t)v1;
}

id sub_10000300C()
{
  if (qword_100015660 != -1) {
    dispatch_once(&qword_100015660, &stru_1000104C8);
  }
  return (id)qword_100015658;
}

void sub_10000304C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ScreenSaver");
  v2 = (void *)qword_100015658;
  qword_100015658 = (uint64_t)v1;
}

id sub_10000307C()
{
  if (qword_100015670 != -1) {
    dispatch_once(&qword_100015670, &stru_1000104E8);
  }
  return (id)qword_100015668;
}

void sub_1000030BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Search");
  v2 = (void *)qword_100015668;
  qword_100015668 = (uint64_t)v1;
}

id sub_1000030EC()
{
  if (qword_100015680 != -1) {
    dispatch_once(&qword_100015680, &stru_100010508);
  }
  return (id)qword_100015678;
}

void sub_10000312C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Settings");
  v2 = (void *)qword_100015678;
  qword_100015678 = (uint64_t)v1;
}

id sub_10000315C()
{
  if (qword_100015690 != -1) {
    dispatch_once(&qword_100015690, &stru_100010528);
  }
  return (id)qword_100015688;
}

void sub_10000319C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "URLHandler");
  v2 = (void *)qword_100015688;
  qword_100015688 = (uint64_t)v1;
}

id sub_1000031CC()
{
  if (qword_1000156A0 != -1) {
    dispatch_once(&qword_1000156A0, &stru_100010548);
  }
  return (id)qword_100015698;
}

void sub_10000320C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "UserInterface");
  v2 = (void *)qword_100015698;
  qword_100015698 = (uint64_t)v1;
}

uint64_t sub_10000323C(unint64_t a1)
{
  if (a1 > 2) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_100010568 + a1);
  }
}

id sub_10000325C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://%@",  @"com.apple.TVHomeSharing",  @"selectScreenSaver"));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v0));

  return v1;
}
}

LABEL_20:
  return v14;
}

id sub_100004464()
{
  if (qword_1000156B0 != -1) {
    dispatch_once(&qword_1000156B0, &stru_100010580);
  }
  return (id)qword_1000156A8;
}

void sub_1000044A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharingTopShelfExtension", "ContentProvider");
  v2 = (void *)qword_1000156A8;
  qword_1000156A8 = (uint64_t)v1;
}

id sub_1000044D4()
{
  if (qword_1000156C0 != -1) {
    dispatch_once(&qword_1000156C0, &stru_1000105A0);
  }
  return (id)qword_1000156B8;
}

void sub_100004514(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharingTopShelfExtension", "ContentOperation");
  v2 = (void *)qword_1000156B8;
  qword_1000156B8 = (uint64_t)v1;
}

void sub_100004838(_Unwind_Exception *a1)
{
}

void sub_10000484C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _loadTopShelfContentWithCompletionHandler:*(void *)(a1 + 32)];
}

void sub_1000049C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000049D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMediaLibrariesDidChange];
}

void sub_100004AFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100004B10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMediaLibrary:0];
  [WeakRetained _notfyTopShelfContentDidChange];
}

void sub_100004C10(_Unwind_Exception *a1)
{
}

void sub_100004C24(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  v2 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:TVHKMediaLibraryContentsDidChangeUserInfoKeyContentsChange]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 changedDMAPServerProtocols]);
  if ([v3 containsObject:&off_100011630])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _notfyTopShelfContentDidChange];
  }
}

void sub_100004E48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_100004E78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = v3;
  if (WeakRetained && v3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 topShelfContent]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaLibrary]);
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingDispatchQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100004FF4;
    v14[3] = &unk_100010640;
    v14[4] = WeakRetained;
    id v8 = v6;
    id v15 = v8;
    dispatch_sync(v7, v14);

    if (*(void *)(a1 + 32))
    {
      id v9 = sub_100004464();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Returning top shelf content: %@",  buf,  0xCu);
      }

      (*(void (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  v5,  v11,  v12,  v13);
    }
  }
}

id sub_100004FF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMediaLibrary:*(void *)(a1 + 40)];
}

LABEL_22:
      return v3;
    }

    if (a3 == 4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
      id v8 = [v5 showCoverArtShape];
      id v9 = v8 == (id)2;
      if (v9) {
        id v3 = 0LL;
      }
      else {
        id v3 = 2LL;
      }
      goto LABEL_22;
    }

    return 2LL;
  }

  return 0LL;
}

void sub_100005948(_Unwind_Exception *a1)
{
}

void sub_10000595C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v1 postEvent:@"Start"];
}

void sub_100005A64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100005A78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v1 postEvent:@"Cancel"];
}

void sub_100005BE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100005BF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMediaLibrariesDidChange];
}

void sub_100005CEC(_Unwind_Exception *a1)
{
}

void sub_100005D00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) userInfo]);
  [v2 postEvent:@"Media Entity Server Connection Did Change" withContext:0 userInfo:v3];
}

void sub_100005E24(_Unwind_Exception *a1)
{
}

void sub_100005E38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v1 postEvent:@"Media Libraries Did Change"];
}

void sub_1000062D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location)
{
}

__CFString *sub_10000637C(uint64_t a1, void *a2)
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([a2 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained mediaLibrary]);
    v7 = v6;
    if (v6)
    {
      if ([v6 connectionState] == (id)2)
      {
        [v5 _fetchMediaItems];
        id v8 = @"Fetching Media Entities";
      }

      else
      {
        [v7 connectWithCompletionHandler:0];
        id v8 = @"Connecting Media Entity Server";
      }

      id v3 = (__CFString *)v8;
    }
  }

  return v3;
}

__CFString *sub_100006420(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mostRecentlyUsedMediaServer]);

    if (v6)
    {
      if (([WeakRetained _updateFromMediaServerSettings:v6] & 1) == 0)
      {
        v7 = @"WaitingForMostRecentlyUsedMediaLibrary";
LABEL_9:
        [WeakRetained _startMediaLibrariesWaitTimer];
        goto LABEL_10;
      }
    }

    else if (([WeakRetained _updateFromFirstConnectableMediaLibrary] & 1) == 0)
    {
      v7 = @"WaitingForMediaLibraries";
      goto LABEL_9;
    }

    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
LABEL_10:

    goto LABEL_11;
  }

  v7 = 0LL;
LABEL_11:

  return v7;
}

__CFString *sub_1000064F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue([a2 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvhk_numberForKey:", TVHKMediaLibraryConnectionStateUserInfoKeyToState));
    id v11 = [v10 unsignedIntegerValue];

    if (!v11)
    {
      [WeakRetained _completeOperation];
      uint64_t v12 = @"Done";
      goto LABEL_6;
    }

    if (v11 == (id)2)
    {
      [WeakRetained _fetchMediaItems];
      uint64_t v12 = @"Fetching Media Entities";
LABEL_6:

      uint64_t v8 = (__CFString *)v12;
    }
  }

  return v8;
}

id sub_1000065B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && [WeakRetained _updateFromFirstConnectableMediaLibrary])
  {
    [v6 _stopMediaLibrariesWaitTimer];
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    v4 = (void *)v8;
  }

  return v4;
}

__CFString *sub_100006640(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAppSettings sharedInstance](&OBJC_CLASS___TVHAppSettings, "sharedInstance"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mostRecentlyUsedMediaServer]);

    if (v7)
    {
    }

    else if (([WeakRetained _updateFromFirstConnectableMediaLibrary] & 1) == 0)
    {
      id v9 = @"WaitingForMediaLibraries";
      goto LABEL_8;
    }

    [WeakRetained _stopMediaLibrariesWaitTimer];
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id v9 = (const __CFString *)objc_claimAutoreleasedReturnValue(v8);
LABEL_8:

    v4 = (__CFString *)v9;
LABEL_9:
  }

  return v4;
}

__CFString *sub_100006718(uint64_t a1, void *a2)
{
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([a2 currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _completeOperation];

    id v3 = @"Done";
  }

  return v3;
}

__CFString *sub_100006770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentState]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (v6 && WeakRetained)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvhk_arrayForKey:", @"MediaEntityFetchResponses"));
    if ([v10 count] == (id)2)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaEntitiesResult]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaEntities]);

      [v9 setMediaItemsSortedByAddedDate:v13];
      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:1]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaEntitiesResult]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mediaEntities]);

      [v9 setMediaItemsSortedByPlayedDate:v16];
      [v9 _coalesceMediaItems];
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaItems]);
    id v18 = [v17 count];

    if (v18)
    {
      [v9 _fetchImageURLs];
      v19 = @"Fetching Image URLs";
    }

    else
    {
      [v9 _completeOperation];
      v19 = @"Done";
    }

    uint64_t v7 = (__CFString *)v19;
  }

  return v7;
}

CFStringRef sub_1000068DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ImageURLs"]);
      [WeakRetained setImageURLByMediaEntityIdentifier:v8];

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ImageURLHTTPHeaders"]);
      [WeakRetained setImageURLHTTPHeaders:v9];
    }

    [WeakRetained _completeOperation];
  }

  return @"Done";
}

CFStringRef sub_100006984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _stopMediaLibrariesWaitTimer];
    [v2 _cancelFetches];
    [v2 _completeOperation];
  }

  return @"Cancelled";
}

void sub_100006CBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100006CF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006DE8;
    block[3] = &unk_1000107E8;
    id v12 = v5;
    id v13 = v6;
    objc_copyWeak(&v14, v7);
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }
}

void sub_100006DE8(uint64_t a1)
{
  id v2 = sub_1000044D4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Media items fetch completed", v10, 2u);
  }

  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"MediaEntityFetchResponses");
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"Error");
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v9 postEvent:@"Fetch Media Items Did Complete" withContext:0 userInfo:v5];
}

NSDate *__cdecl sub_100007338(id a1, id a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 addedDate]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 lastPlayedDate]);

  if (v3 && v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 laterDate:v4]);
  }

  else if (v3)
  {
    id v5 = v3;
  }

  else
  {
    id v5 = v4;
  }

  uint64_t v6 = v5;

  return (NSDate *)v6;
}

void sub_100007868( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000078A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v13 = v12;
    if (v7) {
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v7, @"ImageURLs");
    }
    if (v8) {
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v8, @"ImageURLHTTPHeaders");
    }
    if (v9) {
      -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v9, @"Error");
    }
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained processingQueue]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000079FC;
    v16[3] = &unk_100010720;
    objc_copyWeak(&v18, v10);
    v17 = v13;
    id v15 = v13;
    dispatch_async(v14, v16);

    objc_destroyWeak(&v18);
  }
}

void sub_1000079FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v2 postEvent:@"Fetch Image URLs Did Complete" withContext:0 userInfo:*(void *)(a1 + 32)];
}

void sub_100007EDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___TVTopShelfSectionedItem);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringRepresentation]);
  id v7 = [v4 initWithIdentifier:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _topShelfTitleForMediaItem:v3]);
  [v7 setTitle:v8];

  [v7 setImageShape:*(void *)(a1 + 56)];
  [v7 _setImageScaleMode:2];
  objc_msgSend(v7, "_setMediaType:", objc_msgSend(*(id *)(a1 + 32), "_topShelfMediaType"));
  id v9 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) playURLForMediaItem:v3]);
  id v11 = [v9 initWithURL:v10];

  [v7 setPlayAction:v11];
  id v12 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) displayURLForMediaItem:v3]);
  id v14 = [v12 initWithURL:v13];

  [v7 setDisplayAction:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _imageRequestForMediaItem:v3]);
  id v16 = sub_1000044D4();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
      int v21 = 138412546;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "!#! Adding image request [%@] for %@",  (uint8_t *)&v21,  0x16u);
    }

    [v7 _setImageRequest:v15 forTraits:1];
  }

  else
  {
    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
      int v21 = 138412290;
      v22 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "!#! No image request available (URL) for %@",  (uint8_t *)&v21,  0xCu);
    }
  }

  [*(id *)(a1 + 48) addObject:v7];
}

void sub_100008640(uint64_t a1)
{
  id v2 = sub_1000044D4();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Media libraries wait timer expired.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
  [v5 postEvent:@"Media Libraries Wait Timer Did Fire"];
}

CFStringRef sub_100008C18(uint64_t a1)
{
  else {
    return *(&off_100010958 + a1 - 1);
  }
}

void sub_100008CB4(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) _init];
  id v2 = (void *)qword_1000156C8;
  qword_1000156C8 = (uint64_t)v1;
}

void sub_1000092C0(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  id v2 = *(void **)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaServerIdentifier]);
  [v4 setObject:v2 forKey:v3];
}

void sub_1000093F0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  [v1 removeAllObjects];
}

uint64_t sub_100009A04(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t sub_100009A1C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A30(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A44(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A58(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A6C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A80(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009A94(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009AA8(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009ABC(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_100009AD0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88LL) = *(void *)(result + 40);
  return result;
}

id sub_100009AE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMediaServerByIdentifier:*(void *)(a1 + 40)];
}

void sub_10000A170(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No media server identifier representation found in dictionary: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000A1E4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to convert media server identifier representation into object",  v1,  2u);
}

void sub_10000A224(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Calling +topShelfContentDidChange", v1, 2u);
}

void sub_10000A264(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = TVHKMediaCategoryTypeLogString();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected media category type when getting item image shape! mediaCategoryType=%@",  (uint8_t *)&v5,  0xCu);
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}