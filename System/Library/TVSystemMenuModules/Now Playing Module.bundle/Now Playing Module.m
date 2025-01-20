void sub_313C(id a1)
{
  os_log_t v1;
  void *v2;
  +[MPArtworkCatalog setCacheLimit:forCacheIdentifier:cacheReference:]( &OBJC_CLASS___MPArtworkCatalog,  "setCacheLimit:forCacheIdentifier:cacheReference:",  1LL,  off_11040,  0LL,  a1,  a1);
  v1 = os_log_create("com.apple.TVNowPlayingService.TVNPEndpointRouteConnection", "");
  v2 = (void *)qword_11110;
  qword_11110 = (uint64_t)v1;
}

  ;
}

void sub_3B88(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v11 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_11110;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v5 = type;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MRMediaRemoteCopyCommandDescription(*(unsigned int *)(a1 + 48));
    id v6 = [*(id *)(a1 + 32) route];
    id v8 = v6;
    sub_3CE8((uint64_t)v13, v2, v3, (uint64_t)v8, v11);
    _os_log_impl(&dword_0, log, v5, "(%{public}@) Send %{public}@ to route %@, status: %{public}@", v13, 0x2Au);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)oslog, 0LL);
  if ((*(_BYTE *)(a1 + 52) & 1) == 0) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t sub_3CE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

id sub_3E88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetadata];
}
}

  ;
}

void sub_5F68()
{
}

uint64_t sub_5F78(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_5FC8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_6134;
  v10 = &unk_C340;
  objc_copyWeak(v14, a1 + 6);
  id v11 = a1[4];
  id v12 = location[0];
  id v13 = a1[5];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(v14);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_6134(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14[0])
  {
    id location = (id)qword_11110;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_5F78((uint64_t)v16, *(void *)(a1 + 32), *(void *)(a1 + 40));
      _os_log_debug_impl( &dword_0,  (os_log_t)location,  v12,  "METADATA: (%{public}@) apply update artwork with image: %{public}@",  v16,  0x16u);
    }

    objc_storeStrong(&location, 0LL);
    id v11 = *(id *)(a1 + 40);
    if (!v11)
    {
      id v11 = [v14[0] _preloadArtwork];
    }

    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:");
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:");
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48LL), v11);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56LL), *(id *)(a1 + 48));
    [*(id *)(a1 + 32) didChangeValueForKey:@"artworkImage"];
    [*(id *)(a1 + 32) didChangeValueForKey:@"artworkCatalog"];
    id v10 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"artworkImage",  @"artworkCatalog",  0LL);
    memset(__b, 0, sizeof(__b));
    id obj = [*(id *)(*(void *)(a1 + 32) + 136) allValues];
    id v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0LL;
      id v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(__b[1] + 8 * v3);
        (*(void (**)(void))(v9 + 16))();
        ++v3;
        if (v1 + 1 >= (unint64_t)v4)
        {
          uint64_t v3 = 0LL;
          id v4 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v14, 0LL);
}

uint64_t sub_64B8(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id sub_65D0(uint64_t *a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_11110;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_64B8((uint64_t)v4, a1[4]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Connection did invalidate: %{public}@", v4, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  return [(id)a1[4] _updateState];
}

void sub_6A64()
{
}

uint64_t sub_6A74(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_6AE0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_6BD4;
  int v8 = &unk_C3B8;
  objc_copyWeak(v10, a1 + 4);
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v10);
  objc_storeStrong(location, 0LL);
}

void sub_6BD4(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  v8[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8[0])
  {
    id v7 = (id)qword_11110;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      id v3 = [v8[0] route];
      id v5 = v3;
      sub_5F78((uint64_t)v9, (uint64_t)v5, *(void *)(a1 + 32));
      _os_log_impl( &dword_0,  log,  type,  "connectWithOptions->MPAVRouteConnectionConnectOptionsNone (completion): %{public}@ error: %{public}@",  v9,  0x16u);

      objc_storeStrong(&v5, 0LL);
    }

    objc_storeStrong(&v7, 0LL);
    [v8[0] setAttemptingConnection:0];
    [v8[0] _updateState];
    [v8[0] _updateAutomaticResponseLoading];
  }

  objc_storeStrong(v8, 0LL);
}

void sub_7984(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  os_log_type_t v6 = (dispatch_once_t *)&unk_11120;
  id v5 = 0LL;
  objc_storeStrong(&v5, &stru_C428);
  if (*v6 != -1) {
    dispatch_once(v6, v5);
  }
  objc_storeStrong(&v5, 0LL);
  if ([location[0] intersectsSet:qword_11118])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    [WeakRetained _updateButtonViewController];
  }

  objc_storeStrong(location, 0LL);
}

void sub_7A5C(id a1)
{
  id v4 = a1;
  id v3 = a1;
  uint64_t v1 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"title",  @"album",  @"artist",  @"playbackState",  0LL);
  uint64_t v2 = (void *)qword_11118;
  qword_11118 = (uint64_t)v1;
}

void sub_8170( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 120) = a1;
  *(_DWORD *)(v13 - 124) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 72));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 120));
}

void sub_819C(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  queue = &_dispatch_main_q;
  os_log_type_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_82D8;
  id v10 = &unk_C4B8;
  id v11 = v14;
  objc_copyWeak(v13, a1 + 4);
  id v12 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0LL);
  objc_destroyWeak(v13);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_82D8(uint64_t a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  if (*(void *)(a1 + 32))
  {
    oslog[0] = (os_log_t)sub_8420();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      sub_64B8((uint64_t)v5, *(void *)(a1 + 32));
      _os_log_error_impl(&dword_0, oslog[0], type, "Error fetching NowPlaying information: %{public}@", v5, 0xCu);
    }

    objc_storeStrong((id *)oslog, 0LL);
  }

  else
  {
    id location = objc_loadWeakRetained((id *)(a1 + 48));
    if (location) {
      [location _handleMediaRemoteNowPlayingPlayerResponse:*(void *)(a1 + 40)];
    }
    objc_storeStrong(&location, 0LL);
  }

id sub_8420()
{
  predicate = (dispatch_once_t *)&unk_11130;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_C500);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_11128;
}

void sub_8B54(id a1)
{
  os_log_t v1 = os_log_create("TVNowPlayingService", "NowPlayingModuleLog");
  uint64_t v2 = (void *)qword_11128;
  qword_11128 = (uint64_t)v1;
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}