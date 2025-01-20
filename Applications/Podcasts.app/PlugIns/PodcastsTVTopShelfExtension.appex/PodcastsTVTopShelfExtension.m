void sub_100001E1C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100001E40(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  uint64_t v5 = *(void *)(a1 + 32);
  if (WeakRetained) {
    [WeakRetained _loadRemainingItemsWithNowPlaying:v6 completion:v5];
  }
  else {
    (*(void (**)(void, void))(v5 + 16))(*(void *)(a1 + 32), 0LL);
  }
}

void sub_1000022F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100002308(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002318(uint64_t a1)
{
}

void sub_100002320(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = kMTEpisodeEntityName;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNow](&OBJC_CLASS___MTEpisode, "predicateForListenNow"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](&OBJC_CLASS___MTEpisode, "sortDescriptorsForListenNow"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v2 objectsInEntity:v3 predicate:v4 sortDescriptors:v5 returnsObjectsAsFaults:0 limit:25]);

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_100002478;
  v20 = &unk_100004248;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v21 = v7;
  uint64_t v22 = v8;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_compactMap:", &v17));
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject", v17, v18, v19, v20));
  [v12 playhead];
  double v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  [v15 duration];
  **(_BYTE **)(a1 + 64) = +[MTEpisode isPlayhead:resumableForDuration:]( &OBJC_CLASS___MTEpisode,  "isPlayhead:resumableForDuration:",  v14,  v16);
}

id sub_100002478(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 podcast]);
  if (([v4 hidden] & 1) != 0
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]),
        id v6 = [v5 length],
        v5,
        !v6)
    || (id v7 = *(void **)(a1 + 32),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]),
        LOBYTE(v7) = [v7 containsObject:v8],
        v8,
        (v7 & 1) != 0))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    id v11 = [(id)objc_opt_class(*(void *)(a1 + 40)) contentItemForEpisode:v3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v9;
}

void sub_1000025E4(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v3 = MRNowPlayingClientCreate(0LL, kMTApplicationBundleIdentifier);
    uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
    uint64_t v5 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000026BC;
    v8[3] = &unk_100004298;
    __int128 v7 = *(_OWORD *)(a1 + 40);
    id v6 = (id)v7;
    __int128 v9 = v7;
    MRMediaRemoteGetNowPlayingInfoForClient(v3, LocalOrigin, 0LL, v5, v8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_1000026BC(uint64_t a1, uint64_t a2)
{
  id v3 = [(id)objc_opt_class(*(void *)(a1 + 40)) contentItemForEpisodeMetadata:a2];
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000027C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    unsigned __int8 v4 = 0;
  }

  else
  {
    uint64_t BundleIdentifier = MRNowPlayingClientGetBundleIdentifier(a2);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(BundleIdentifier);
    unsigned __int8 v4 = [kMTApplicationBundleIdentifier isEqualToString:v6];
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002878;
  v8[3] = &unk_1000042E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  unsigned __int8 v10 = v4;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState(v7, v8);
}

uint64_t sub_100002878(uint64_t a1, int a2)
{
  BOOL v3 = a2 == 1 && *(_BYTE *)(a1 + 40) != 0;
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), v3);
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}