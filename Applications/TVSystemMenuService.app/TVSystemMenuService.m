void sub_100004F48(id a1)
{
  os_log_t v1;
  void *v2;
  +[MPArtworkCatalog setCacheLimit:forCacheIdentifier:cacheReference:]( &OBJC_CLASS___MPArtworkCatalog,  "setCacheLimit:forCacheIdentifier:cacheReference:",  1LL,  off_100055F80,  0LL,  a1,  a1);
  v1 = os_log_create("com.apple.TVNowPlayingService.TVNPEndpointRouteConnection", "");
  v2 = (void *)qword_100056CC8;
  qword_100056CC8 = (uint64_t)v1;
}

  ;
}

void sub_100005994(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v11 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_100056CC8;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v5 = type;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MRMediaRemoteCopyCommandDescription(*(unsigned int *)(a1 + 48));
    id v6 = [*(id *)(a1 + 32) route];
    id v8 = v6;
    sub_100005AF4((uint64_t)v13, v2, v3, (uint64_t)v8, v11);
    _os_log_impl( (void *)&_mh_execute_header,  log,  v5,  "(%{public}@) Send %{public}@ to route %@, status: %{public}@",  v13,  0x2Au);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)oslog, 0LL);
  if ((*(_BYTE *)(a1 + 52) & 1) == 0) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t sub_100005AF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

id sub_100005C94(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetadata];
}
}

void sub_100007D74()
{
}

uint64_t sub_100007D84(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_100007DD4(id *a1, void *a2, void *a3)
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
  v9 = sub_100007F40;
  v10 = &unk_100048E00;
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

void sub_100007F40(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14[0])
  {
    id location = (id)qword_100056CC8;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_100007D84((uint64_t)v16, *(void *)(a1 + 32), *(void *)(a1 + 40));
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v12,  "METADATA: (%{public}@) apply update artwork with image: %{public}@",  v16,  0x16u);
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

uint64_t sub_1000082C4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id sub_1000083DC(uint64_t *a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_100056CC8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000082C4((uint64_t)v4, a1[4]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Connection did invalidate: %{public}@",  v4,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  return [(id)a1[4] _updateState];
}

void sub_100008870()
{
}

uint64_t sub_100008880(uint64_t result, uint64_t a2, uint64_t a3, int a4)
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

void sub_1000088EC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1000089E0;
  int v8 = &unk_100048E78;
  objc_copyWeak(v10, a1 + 4);
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v10);
  objc_storeStrong(location, 0LL);
}

void sub_1000089E0(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  v8[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8[0])
  {
    id v7 = (id)qword_100056CC8;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      id v3 = [v8[0] route];
      id v5 = v3;
      sub_100007D84((uint64_t)v9, (uint64_t)v5, *(void *)(a1 + 32));
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "connectWithOptions->MPAVRouteConnectionConnectOptionsNone (completion): %{public}@ error: %{public}@",  v9,  0x16u);

      objc_storeStrong(&v5, 0LL);
    }

    objc_storeStrong(&v7, 0LL);
    [v8[0] setAttemptingConnection:0];
    [v8[0] _updateState];
    [v8[0] _updateAutomaticResponseLoading];
  }

  objc_storeStrong(v8, 0LL);
}

id sub_10000A9BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_10000AAD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_10000ABE8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

uint64_t sub_10000B1B0(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 34) = 0;
  *(_BYTE *)(result + 35) = 4;
  *(_DWORD *)(result + 36) = a6;
  *(_BYTE *)(result + 40) = 0;
  *(_BYTE *)(result + 41) = 4;
  *(_DWORD *)(result + 42) = a7;
  return result;
}

_BYTE *sub_10000BF94(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_10000D084(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = v5[0];
  id v4 = [v5[0] routeConnection];
  objc_msgSend(v3, "_metadataDidChange:forKeys:");

  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_10000DB48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_10000DC5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

void sub_10000F354()
{
}

void sub_10000F364(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPGroupableRoutingController", "");
  uint64_t v2 = (void *)qword_100056CD8;
  qword_100056CD8 = (uint64_t)v1;
}

void sub_10000F3B0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    v4[0] = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [v4[0] _endpointRoutesWithForcedLocalRoute:location[0]];
    objc_msgSend(v4[0], "_updateWithAvailableEndpoints:outputDevices:", v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_storeStrong(&v3, 0LL);
    objc_storeStrong(v4, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000F7D4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_1000108B4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = (void *)a1[4];
  id v6 = [location[0] mediaProfile];
  id v5 = [v6 routeUID];
  unsigned __int8 v7 = objc_msgSend(v4, "containsObject:");

  objc_storeStrong(location, 0LL);
  return v7 & 1;
}

uint64_t sub_100010980(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

void sub_1000109F0(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_100056CD8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000082C4((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Add Picked Route result: %{public}@",  v5,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100010AE4(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_100056CD8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10000F7D4((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Set Picked Route result: %@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100010F3C(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_100056CD8;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1000082C4((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Remove Picked Route result: %{public}@",  v5,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000112F4(uint64_t a1, char a2, id obj)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v10[1] = (id)a1;
  v10[0] = *(id *)(a1 + 32);
  if (location)
  {
    os_log_t oslog = (os_log_t)(id)qword_100056CD8;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000F7D4((uint64_t)v14, (uint64_t)location);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Error updating media destination %@",  v14,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    id v9 = (id)qword_100056CD8;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000F7D4((uint64_t)v15, *(void *)(a1 + 40));
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  v8,  "Successfully updated media destination to %@",  v15,  0xCu);
    }

    objc_storeStrong(&v9, 0LL);
    id v3 = v10[0];
    id v5 = [v10[0] homeDestinationController];
    id v4 = [v5 availableDestinations];
    objc_msgSend(v3, "_updateWithAvailableMediaDestinations:");
  }

  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100011A24(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0] && (*((_BYTE *)location[0] + 11) & 1) != 0)
  {
    *((_BYTE *)location[0] + 11) = 0;
    [location[0] _updateAvailableRoutes];
  }

  objc_storeStrong(location, 0LL);
}

void sub_100011DB8(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_100011E0C(uint64_t a1)
{
}

void sub_100011E38(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  id v3 = *(void **)(a1 + 32);
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = sub_100011FD4;
  v14 = &unk_1000492B0;
  v15[1] = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  v15[0] = *(id *)(a1 + 40);
  [v3 fetchAvailableRoutesWithCompletionHandler:&v10];
  os_log_t v1 = *(void **)(a1 + 48);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_100012074;
  os_log_type_t v8 = &unk_1000492D8;
  v9[1] = *(id *)(a1 + 64);
  v9[0] = *(id *)(a1 + 40);
  [v1 fetchAvailableRoutesWithCompletionHandler:&v4];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_destroyWeak(v16);
}

void sub_100011F94(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void sub_100011FD4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained _endpointRoutesWithForcedLocalRoute:location[0]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong(location, 0LL);
}

void sub_100012074(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v2 = [location[0] copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong(location, 0LL);
}

void sub_1000120F4(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (location[0])
  {
    [location[0] _updateWithAvailableEndpoints:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) outputDevices:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v2 = [location[0] homeDestinationController];
    id v1 = [v2 availableDestinations];
    objc_msgSend(location[0], "_updateWithAvailableMediaDestinations:");
  }

  objc_storeStrong(location, 0LL);
}

uint64_t sub_100015638(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_100015688(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  id v11 = (id)MRAVOutputDeviceCopyUniqueIdentifier(location[0]);
  v9[0] = v11;
  unsigned __int8 v8 = [v9[0] isEqual:a1[4]];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

uint64_t sub_100015744(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_1000157AC(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v13 = 0LL;
  objc_storeStrong(&v13, a3);
  id v3 = [a1[4] objectForKey:location[0]];
  BOOL v12 = v3 != 0LL;

  if (!v12)
  {
    id v7 = a1[4];
    id v8 = [v13 firstObject];
    objc_msgSend(v7, "setObject:forKey:");

    id v9 = v13;
    id v4 = (char *)[v13 count];
    id location[3] = (id)1;
    id location[2] = v4 - 1;
    location[4] = (id)1;
    location[5] = v4 - 1;
    id v5 = objc_msgSend(v9, "subarrayWithRange:", 1, v4 - 1);
    id v6 = v13;
    id v13 = v5;

    [a1[5] setObject:v13 forKey:location[0]];
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

int64_t sub_100015924(id a1, TVNPRoute *a2, TVNPRoute *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v24 = 0LL;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  v23[0] = 0LL;
  id v22 = 0LL;
  id v17 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v17, v3) & 1) != 0)
  {
    objc_storeStrong(v23, location[0]);
  }

  else
  {
    id v4 = [location[0] leader];
    id v5 = v23[0];
    v23[0] = v4;
  }

  id v14 = v24;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
  if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
  {
    objc_storeStrong(&v22, v24);
  }

  else
  {
    id v7 = [v24 leader];
    id v8 = v22;
    id v22 = v7;
  }

  id v12 = [v23[0] outputDeviceRoute];
  char v20 = 0;
  LOBYTE(v13) = 0;
  if ([v12 isHomePodRoute])
  {
    id v21 = [v22 outputDeviceRoute];
    char v20 = 1;
    unsigned int v13 = [v21 isHomePodRoute] ^ 1;
  }

  if ((v20 & 1) != 0) {

  }
  if ((v13 & 1) != 0)
  {
    int64_t v26 = -1LL;
  }

  else
  {
    id v10 = [v22 outputDeviceRoute];
    char v18 = 0;
    LOBYTE(v11) = 0;
    if ([v10 isHomePodRoute])
    {
      id v19 = [v23[0] outputDeviceRoute];
      char v18 = 1;
      unsigned int v11 = [v19 isHomePodRoute] ^ 1;
    }

    if ((v18 & 1) != 0) {

    }
    int64_t v26 = (v11 & 1) != 0;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v26;
}

uint64_t sub_100015C20(uint64_t result, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 7;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  *(_BYTE *)(result + 26) = 0;
  *(_BYTE *)(result + 27) = 4;
  *(_DWORD *)(result + 28) = a6;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a7;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(void *)(result + 44) = a8;
  return result;
}

uint64_t sub_100015CDC( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 0;
  *(_BYTE *)(result + 49) = 4;
  *(_DWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 54) = 0;
  *(_BYTE *)(result + 55) = 8;
  *(void *)(result + 56) = a8;
  *(_BYTE *)(result + 64) = 66;
  *(_BYTE *)(result + 65) = 8;
  *(void *)(result + 66) = a9;
  return result;
}

uint64_t sub_1000174A4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_1000188BC(uint64_t a1)
{
  uint64_t v8 = a1;
  uint64_t v7 = a1;
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v1 setTransform:__dst];

  id v4 = [*(id *)(a1 + 32) teachableMomentViewController];
  id v3 = [v4 view];
  memcpy(v5, &CGAffineTransformIdentity, sizeof(v5));
  [v3 setTransform:v5];
}

id sub_1000189A4(uint64_t a1, void *a2)
{
  id location[3] = (id)a1;
  id location[2] = a2;
  location[1] = (id)a1;
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
  location[0] = (id)grid_log();
  char v11 = 2;
  uint64_t v6 = (os_log_s *)(id)grid_log();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

  os_signpost_id_t v10 = v7;
  if (v7 && v10 != -1LL && os_signpost_enabled((os_log_t)location[0]))
  {
    log = (os_log_s *)location[0];
    os_signpost_type_t type = v11;
    os_signpost_id_t spid = v10;
    sub_10000BF94(v9);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  type,  spid,  "AnimateGrid",  (const char *)&unk_100046F3F,  v9,  2u);
  }

  objc_storeStrong(location, 0LL);
  return [*(id *)(*(void *)(a1 + 32) + 24) initialAnimationDidFinish];
}

void sub_100018FE8(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v6 = [*(id *)(a1 + 32) view];
  BOOL v7 = [v6 effectiveUserInterfaceLayoutDirection] == (id)1;

  BOOL v12 = v7;
  double v11 = *(double *)&qword_1000562E8 + *(double *)&qword_1000562F0;
  if (v7) {
    double tx = -v11;
  }
  else {
    double tx = v11;
  }
  CGAffineTransformMakeTranslation(&v10, tx, 0.0);
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  memcpy(__dst, &v10, sizeof(__dst));
  [v1 setTransform:__dst];

  id v3 = [*(id *)(a1 + 32) teachableMomentViewController];
  id v2 = [v3 view];
  memcpy(v8, &v10, sizeof(v8));
  [v2 setTransform:v8];
}

uint64_t sub_100019170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000191A8(void *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = +[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence");
  id v2 =  +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  a1[4],  v3[0]);
  [*(id *)(a1[5] + 32) invalidateWithTransitionContext:v2];
  objc_msgSend(*(id *)(a1[5] + 16), "setLayoutElement:");
  objc_storeStrong((id *)(a1[5] + 32LL), 0LL);
  objc_storeStrong((id *)&v2, 0LL);
  objc_storeStrong(v3, 0LL);
}

id sub_1000192A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAnimation];
}

void sub_1000192E8(uint64_t a1)
{
  v20[2] = (id)a1;
  v20[1] = (id)a1;
  v20[0] = [*(id *)(a1 + 32) presentedViewController];
  if ([v20[0] conformsToProtocol:&OBJC_PROTOCOL___TVSMModuleContentViewControllerDismissalDelegate])
  {
    id v4 = v20[0];
    char v3 = *(_BYTE *)(a1 + 56);
    BOOL v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_1000194AC;
    v16 = &unk_1000495A0;
    char v19 = *(_BYTE *)(a1 + 56) & 1;
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [v4 systemMenuDidRequestDismissalAnimated:v3 & 1 withCompletion:&v12];
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    id v2 = v20[0];
    char v1 = *(_BYTE *)(a1 + 56);
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_10001950C;
    CGAffineTransform v10 = &unk_1000495C8;
    id v11 = *(id *)(a1 + 48);
    [v2 dismissViewControllerAnimated:v1 & 1 completion:&v6];
    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v20, 0LL);
}

uint64_t sub_1000194AC(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 48) & 1) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

uint64_t sub_10001950C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

void sub_10001A044(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) teachableMomentViewController];
  id v1 = [v2 view];
  [v1 setAlpha:0.0];
}

id sub_10001A0B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) teachableMomentViewController];
  objc_msgSend(v2, "willMoveToParentViewController:");

  char v3 = *(void **)(a1 + 32);
  id v4 = [v3 teachableMomentViewController];
  objc_msgSend(v3, "removeChildViewController:");

  id v6 = [*(id *)(a1 + 32) teachableMomentViewController];
  id v5 = [v6 view];
  [v5 removeFromSuperview];

  id v7 = [*(id *)(a1 + 32) teachableMomentViewController];
  [v7 didMoveToParentViewController:0];

  [*(id *)(a1 + 32) setTeachableMomentViewController:0];
  return [*(id *)(a1 + 32) setIsDismissingTeachableMoment:0];
}

void sub_10001A5CC(double *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setFrame:", a1[4], a1[5], a1[6], a1[7]);
  objc_storeStrong(location, 0LL);
}

void sub_10001B5E4(id a1)
{
}

id sub_10001B630(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v11 =  +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration]( &OBJC_CLASS___UICollectionViewCompositionalLayoutConfiguration,  "defaultConfiguration");
  [v11 setScrollDirection:0];
  id v2 = objc_alloc(&OBJC_CLASS___TVSMButtonGridCollectionViewLayout);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10001FD9C;
  int v8 = &unk_100049728;
  id v9 = location;
  id v10 = objc_msgSend(v2, "initWithSectionProvider:configuration:");
  id v3 = v10;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&location, 0LL);
  return v3;
}

void sub_10001BD14( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 96) = a1;
  *(_DWORD *)(v12 - 100) = a2;
  objc_destroyWeak((id *)(v12 - 88));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 96));
}

  ;
}

id sub_10001BDBC(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  if (v10[0])
  {
    id v9 = [v10[0] _moduleAtIndexPath:v12];
    [v9 setDelegate:v10[0]];
    id v8 = [location[0] dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v12];
    id v14 = v8;
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

  else
  {
    id v14 = 0LL;
  }

  objc_storeStrong(v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v14;
}

void sub_10001E2DC( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  *(void *)(v68 - 104) = a1;
  *(_DWORD *)(v68 - 108) = a2;
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose((const void *)(v68 - 232), 8);
  _Block_object_dispose((const void *)(v68 - 96), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v68 - 104));
}

void sub_10001E350(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v17 = a3;
  v16[2] = a4;
  v16[1] = (id)a1;
  v16[0] = [location[0] analyticsElementInfo];
  id v15 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v16[0],  a3);
  int v6 = *(void **)(a1 + 32);
  v19[0] = v15;
  v19[1] = *(void *)(a1 + 40);
  id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL);
  objc_msgSend(v6, "setObject:forKey:");

  id v8 = v16[0];
  uint64_t v9 = v17 + 1;
  uint64_t v10 = v17;
  id v12 = [*(id *)(a1 + 48) elementInfo];
  id v11 = [v12 identifier];
  id v14 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v8,  v9,  v10);

  [*(id *)(a1 + 56) addObject:v14];
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(v16, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001E568(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_10001E5BC(uint64_t a1)
{
}

void sub_10001E5E8(uint64_t a1, void *a2, void *a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v53[3] = a3;
  v53[2] = a4;
  v53[1] = (id)a1;
  v53[0] = [location[0] analyticsElementInfo];
  id v52 = [v53[0] displayStyle];
  id v40 = [v53[0] identifier];
  unsigned __int8 v41 = [v40 hasPrefix:TVSMClickReportableUndefinedIdentiferPrefix];

  if ((v41 & 1) != 0)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
    {
      id v4 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL));
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8LL);
      int v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v7 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  *(void *)(a1 + 32),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) + 1LL,  0LL,  0LL);
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8LL);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    }

    v51 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v53[0],  *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL));
    v30 = *(void **)(a1 + 48);
    v57[0] = v51;
    v57[1] = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    v31 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL);
    objc_msgSend(v30, "setObject:forKey:");

    id v32 = v53[0];
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) + 1LL;
    uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
    id v36 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) elementInfo];
    id v35 = [v36 identifier];
    v50 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v32,  v33,  v34);

    [*(id *)(a1 + 40) addObject:v50];
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
    objc_storeStrong((id *)&v50, 0LL);
    objc_storeStrong((id *)&v51, 0LL);
  }

  else if (v52 == (id)3 || v52 == (id)4)
  {
    id v24 = [location[0] analyticsElementInfo];
    id v23 = [v24 identifier];
    id v49 = [v23 stringByAppendingString:@" shelf"];

    v48 =  +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  v49,  TVSMAnalyticsElementTypeShelf,  -1LL);
    v47 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v48,  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL));
    v46 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v53[0]);
    v25 = *(void **)(a1 + 48);
    v56[0] = v46;
    v56[1] = v47;
    int64_t v26 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL);
    objc_msgSend(v25, "setObject:forKey:");

    v45 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v48,  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) + 1LL,  0LL,  0LL);
    id v27 = v53[0];
    id v29 = -[TVSMImpressionAnalytics elementInfo](v45, "elementInfo");
    id v28 = [v29 identifier];
    v44 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v27,  1LL,  0LL);

    [*(id *)(a1 + 40) addObject:v45];
    [*(id *)(a1 + 40) addObject:v44];
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    objc_storeStrong((id *)&v44, 0LL);
    objc_storeStrong((id *)&v45, 0LL);
    objc_storeStrong((id *)&v46, 0LL);
    objc_storeStrong((id *)&v47, 0LL);
    objc_storeStrong((id *)&v48, 0LL);
    objc_storeStrong(&v49, 0LL);
  }

  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL))
    {
      uint64_t v10 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  *(void *)(a1 + 56),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL));
      uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8LL);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      int v13 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  *(void *)(a1 + 56),  *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) + 1LL,  0LL,  0LL);
      uint64_t v14 = *(void *)(*(void *)(a1 + 104) + 8LL);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    }

    v43 =  +[TVSMLocationAnalytics analyticsWithElementInfo:locationPostion:]( &OBJC_CLASS___TVSMLocationAnalytics,  "analyticsWithElementInfo:locationPostion:",  v53[0],  *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL));
    v16 = *(void **)(a1 + 48);
    v55[0] = v43;
    v55[1] = *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL);
    uint64_t v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL);
    objc_msgSend(v16, "setObject:forKey:");

    id v18 = v53[0];
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) + 1LL;
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL);
    id v22 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) elementInfo];
    id v21 = [v22 identifier];
    v42 =  +[TVSMImpressionAnalytics analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:]( &OBJC_CLASS___TVSMImpressionAnalytics,  "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:",  v18,  v19,  v20);

    [*(id *)(a1 + 40) addObject:v42];
    ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL);
    objc_storeStrong((id *)&v42, 0LL);
    objc_storeStrong((id *)&v43, 0LL);
  }

  objc_storeStrong(v53, 0LL);
  objc_storeStrong(location, 0LL);
}

LABEL_5:
    objc_storeStrong(&location, v19[0]);
  }

        int v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    id v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    id v23 = *v22;
    id v24 = (-1LL << v3) - 1;
  }

  else
  {
    id v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    id v24 = *v22;
    id v23 = (-1LL << result) - 1;
  }

  *id v22 = v24 & v23;
  v25 = *(void *)(a2 + 16);
  int64_t v26 = __OFSUB__(v25, 1LL);
  id v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

LABEL_6:
  if (!location) {
    goto LABEL_17;
  }
  memset(__b, 0, sizeof(__b));
  id obj = -[TVSMModuleDataSource availableModules](v20->_buttonDataSource, "availableModules");
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v22,  16LL);
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    uint64_t v10 = v12;
    while (1)
    {
      id v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      v16 = *(id *)(__b[1] + 8 * v9);
      uint64_t v5 = [v16 identifier];
      int v6 = [v5 isEqualToString:location];

      if ((v6 & 1) != 0) {
        break;
      }
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v22,  16LL);
        if (!v10) {
          goto LABEL_15;
        }
      }
    }

    id v3 = objc_alloc(&OBJC_CLASS___TVSMButtonGridLayoutInfo);
    id v4 = [v16 identifier];
    uint64_t v14 = -[TVSMButtonGridLayoutInfo initWithIdentifier:style:]( v3,  "initWithIdentifier:style:",  v4,  [v16 style]);

    id v21 =  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:]( v20->_diffableDataSource,  "indexPathForItemIdentifier:",  v14);
    int v13 = 1;
    objc_storeStrong((id *)&v14, 0LL);
  }

  else
  {
LABEL_15:
    int v13 = 0;
  }

  if (!v13) {
LABEL_17:
  }
    id v21 = 0LL;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(v19, 0LL);
  return v21;
}

void sub_10001F7C0(_BYTE *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [location[0] setHidden:a1[32] & 1];
  objc_storeStrong(location, 0LL);
}

void sub_10001FB7C()
{
}

NSCollectionLayoutSection *sub_10001FD9C(uint64_t a1, uint64_t a2, id obj)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  if (v8)
  {
    uint64_t v10 = sub_10002069C();
  }

  else
  {
    id v5 = [*(id *)(a1 + 32) childModules];
    id v3 = [v5 count];
    uint64_t v10 = (NSCollectionLayoutSection *)sub_10001FE6C((unint64_t)v3, location);
  }

  objc_storeStrong(&location, 0LL);
  return v10;
}

id sub_10001FE6C(unint64_t a1, void *a2)
{
  unint64_t v87 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  sub_100020A28();
  double v83 = v2;
  uint64_t v84 = v3;
  double v85 = v2;
  double v82 = 142.0;
  sub_100020A54();
  *(void *)&__int128 v80 = v4;
  *((void *)&v80 + 1) = v5;
  *(void *)&__int128 v81 = v6;
  *((void *)&v81 + 1) = v7;
  double v79 = 24.0;
  v78 = 0LL;
  v77 = 0LL;
  id v76 = 0LL;
  if (v87 <= 3 || v87 >= 7)
  {
    if (v87)
    {
      v54 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:");
      v53 =  +[NSCollectionLayoutDimension fractionalHeightDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalHeightDimension:",  1.0);
      id v22 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v54);
      id v23 = v78;
      v78 = v22;

      v56 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v85);
      v55 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v82);
      id v24 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v56);
      v25 = v77;
      v77 = v24;

      objc_storeStrong(&v76, 0LL);
      double v75 = v79;
      __int128 v73 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
      __int128 v74 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
      __int128 v71 = v80;
      __int128 v72 = v81;
    }

    else
    {
      v50 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:");
      id v49 =  +[NSCollectionLayoutDimension fractionalHeightDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalHeightDimension:",  1.0);
      int64_t v26 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v50);
      id v27 = v78;
      v78 = v26;

      id v52 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v85);
      v51 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:");
      id v28 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v52);
      id v29 = v77;
      v77 = v28;

      objc_storeStrong(&v76, 0LL);
      double v75 = v79;
      __int128 v73 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
      __int128 v74 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
      sub_100020A54();
      *(void *)&__int128 v64 = v30;
      *((void *)&v64 + 1) = v31;
      *(void *)&__int128 v65 = v32;
      *((void *)&v65 + 1) = v33;
      __int128 v71 = v64;
      __int128 v72 = v65;
    }

    uint64_t v70 = 1LL;
  }

  else
  {
    v58 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v85);
    v57 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v82);
    uint64_t v8 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v58);
    uint64_t v9 = v78;
    v78 = v8;

    v60 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0);
    v59 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  v82);
    uint64_t v10 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v60);
    uint64_t v11 = v77;
    v77 = v10;

    id v12 = +[NSCollectionLayoutSpacing fixedSpacing:](&OBJC_CLASS___NSCollectionLayoutSpacing, "fixedSpacing:", v79);
    id v13 = v76;
    id v76 = v12;

    double v75 = v79;
    sub_100020A54();
    *(void *)&__int128 v68 = v14;
    *((void *)&v68 + 1) = v15;
    *(void *)&__int128 v69 = v16;
    *((void *)&v69 + 1) = v17;
    __int128 v73 = v68;
    __int128 v74 = v69;
    sub_100020A54();
    *(void *)&__int128 v66 = v18;
    *((void *)&v66 + 1) = v19;
    *(void *)&__int128 v67 = v20;
    *((void *)&v67 + 1) = v21;
    __int128 v71 = v66;
    __int128 v72 = v67;
    uint64_t v70 = 0LL;
  }

  id v47 = [location container];
  [v47 contentInsets];
  v63[5] = v34;
  v63[6] = v35;
  v63[7] = v36;
  v63[8] = v37;
  BOOL v48 = *(double *)&v37 <= 0.0;

  if (!v48)
  {
    id v46 = [location container];
    [v46 contentInsets];
    v63[1] = v38;
    v63[2] = v39;
    v63[3] = v40;
    v63[4] = v41;
    *((double *)&v72 + 1) = *((double *)&v72 + 1) - *(double *)&v41;
  }

  v63[0] =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v78);
  v43 = v77;
  id v88 = v63[0];
  v44 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL);
  v62 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v43);

  -[NSCollectionLayoutGroup setInterItemSpacing:](v62, "setInterItemSpacing:", v76);
  -[NSCollectionLayoutGroup setContentInsets:](v62, "setContentInsets:", v73, v74);
  id v61 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v62);
  [v61 setOrthogonalScrollingBehavior:v70];
  [v61 setInterGroupSpacing:v75];
  objc_msgSend(v61, "setContentInsets:", v71, v72);
  id v45 = v61;
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong(v63, 0LL);
  objc_storeStrong(&v76, 0LL);
  objc_storeStrong((id *)&v77, 0LL);
  objc_storeStrong((id *)&v78, 0LL);
  objc_storeStrong(&location, 0LL);
  return v45;
}

NSCollectionLayoutSection *sub_10002069C()
{
  v24[3] = v0;
  v24[4] = v1;
  id v12 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  *(double *)&v0);
  sub_100020A28();
  v24[1] = v2;
  v24[2] = v3;
  uint64_t v11 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  *(double *)&v3);
  v25 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v12);

  v24[0] =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v25);
  uint64_t v14 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0);
  sub_100020A28();
  v22[1] = v4;
  v22[2] = v5;
  id v13 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  *(double *)&v5);
  id v23 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v14);

  uint64_t v15 = v23;
  id v26 = v24[0];
  uint64_t v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL);
  v22[0] =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v15);

  id v17 = v22[0];
  uint64_t v18 =  +[NSCollectionLayoutSpacing fixedSpacing:]( &OBJC_CLASS___NSCollectionLayoutSpacing,  "fixedSpacing:",  *(double *)&qword_1000566D8);
  objc_msgSend(v17, "setInterItemSpacing:");

  uint64_t v21 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v22[0]);
  -[NSCollectionLayoutSection setInterGroupSpacing:](v21, "setInterGroupSpacing:", *(double *)&qword_1000566E0);
  uint64_t v19 = v21;
  sub_100020A54();
  -[NSCollectionLayoutSection setContentInsets:](v19, "setContentInsets:", v6, v7, v8, v9);
  uint64_t v20 = v21;
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong(v22, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  objc_storeStrong(v24, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  return v20;
}

  ;
}

  ;
}

UIColor *__cdecl sub_100021430(id a1, UITraitCollection *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v6 = 0;
  char v4 = 0;
  if ([location[0] userInterfaceStyle] == (id)2)
  {
    double v7 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.22745098,  0.247058824,  0.254901961,  1.0);
    char v6 = 1;
    double v2 = v7;
  }

  else
  {
    uint64_t v5 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.784313725,  0.8,  0.807843137,  1.0);
    char v4 = 1;
    double v2 = v5;
  }

  double v9 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  objc_storeStrong(location, 0LL);
  }
  return v9;
}

id sub_100022138(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  double v2 = +[BSDateFormatterCache sharedInstance](&OBJC_CLASS___BSDateFormatterCache, "sharedInstance");
  id v3 =  -[BSDateFormatterCache formatDateAsDayOfWeekMonthDayStyle:]( v2,  "formatDateAsDayOfWeekMonthDayStyle:",  location);

  objc_storeStrong(&location, 0LL);
  return v3;
}

NSString *sub_1000221BC(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  double v2 =  +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  location,  0LL,  1LL);
  id v3 = -[NSString localizedUppercaseString](v2, "localizedUppercaseString");

  objc_storeStrong(&location, 0LL);
  return v3;
}

uint64_t start(int a1, char **a2)
{
  context = objc_autoreleasePoolPush();
  double v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  char v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

void sub_100025028(id *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  id v3 = [a1[4] _defaultModuleDirectories];
  v6[0] = objc_msgSend(v3, "bs_mapNoNulls:", &stru_1000497A8);

  id v5 = objc_msgSend(v6[0], "bs_flatten");
  id v4 = objc_msgSend(v5, "bs_filter:", &stru_1000497E8);
  id v1 = objc_msgSend(v4, "bs_mapNoNulls:", &stru_100049808);
  double v2 = (void *)qword_100056CE8;
  qword_100056CE8 = (uint64_t)v1;

  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(v6, 0LL);
}

id sub_100025134(id a1, NSURL *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v4 =  -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( v3,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  location[0],  0LL,  1LL);

  objc_storeStrong(location, 0LL);
  return v4;
}

BOOL sub_1000251D0(id a1, NSURL *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [location[0] pathExtension];
  BOOL v4 = [v3 caseInsensitiveCompare:@"bundle"] == 0;

  objc_storeStrong(location, 0LL);
  return v4;
}

id sub_100025264(id a1, NSURL *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  double v2 = objc_alloc(&OBJC_CLASS____TVSMModuleInfo);
  id v4 = -[_TVSMModuleInfo _initWithURL:](v2, "_initWithURL:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_1000254C8(id a1)
{
  v8[2] = a1;
  v8[1] = a1;
  v8[0] = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  char v6 = 0;
  LOBYTE(v4) = 0;
  if ((_BSIsInternalInstall("+[_TVSMModuleInfo _defaultModuleDirectories]_block_invoke") & 1) != 0)
  {
    double v7 = +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults");
    char v6 = 1;
    unsigned int v4 = !-[NSUserDefaults BOOLForKey:](v7, "BOOLForKey:", @"HideInternalModules");
  }

  if ((v6 & 1) != 0) {

  }
  if ((v4 & 1) != 0)
  {
    id v3 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", &off_10004BB28);
    id v1 = objc_msgSend(v8[0], "arrayByAddingObject:");
    id v2 = v8[0];
    v8[0] = v1;
  }

  id v5 = objc_msgSend(v8[0], "bs_map:", &stru_100049888);
  objc_storeStrong((id *)&qword_100056CF8, v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(v8, 0LL);
}

id sub_100025674(id a1, NSString *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = (id)BSSystemRootDirectory();
  v7[0] = v5;
  v7[1] = location[0];
  v7[2] = @"TVSystemMenuModules";
  id v3 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL);
  unsigned int v4 = +[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:");

  objc_storeStrong(location, 0LL);
  return v4;
}

void sub_100025B18(id a1)
{
}

int64_t sub_100025D14(id a1, _TVSMModuleInfo *a2, _TVSMModuleInfo *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  id v5 = (void *)qword_100056D10;
  id v7 = [location[0] infoPlist];
  id v6 = [v7 objectForKey:kCFBundleIdentifierKey];
  id v8 = objc_msgSend(v5, "indexOfObject:");

  double v9 = (void *)qword_100056D10;
  id v11 = [v16 infoPlist];
  id v10 = [v11 objectForKey:kCFBundleIdentifierKey];
  id v12 = objc_msgSend(v9, "indexOfObject:");

  uint64_t v14 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8);
  id v13 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12);
  NSComparisonResult v15 = -[NSNumber compare:](v14, "compare:");

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

NSString *__cdecl sub_100025FA4(id a1, TVSMModule *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = [location[0] identifier];
  objc_storeStrong(location, 0LL);
  return (NSString *)v3;
}

uint64_t sub_1000265A8(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t sub_100026C70(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100027000(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100056D20;
  qword_100056D20 = (uint64_t)v1;
}

void sub_100027980(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  id v3 = (void *)*((void *)a1[4] + 1);
  unsigned int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_100027ABC;
  id v8 = &unk_100049AC0;
  v11[0] = location[0];
  id v9 = a1[4];
  id v10 = a1[5];
  objc_msgSend(v3, "dismissContentAnimated:withCompletion:", 0);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100027ABC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 dismissWithResult:*(void *)(a1 + 40)];
}

void sub_100028030(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v11[1] = (id)a1;
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10002813C;
  id v9 = &unk_100049B10;
  id v10 = *(id *)(a1 + 32);
  v11[0] = location[0];
  objc_msgSend(v4, "presentContentAnimated:options:withCompletion:", 1, v3);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10002813C(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)launch_perf_log();
  char v10 = 2;
  int v6 = (os_log_s *)(id)launch_perf_log();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 32));

  os_signpost_id_t v9 = v7;
  if (v7 && v9 != -1LL && os_signpost_enabled((os_log_t)location[0]))
  {
    log = (os_log_s *)location[0];
    os_signpost_type_t type = v10;
    os_signpost_id_t spid = v9;
    sub_10000BF94(v8);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  log,  type,  spid,  "InitialLaunch",  (const char *)&unk_100046F3F,  v8,  2u);
  }

  objc_storeStrong(location, 0LL);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100028590(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v7[1] = (id)a1;
  unsigned int v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  char v3 = *(_BYTE *)(a1 + 48);
  id v6 = location[0];
  v7[0] = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dismissContentAnimated:withCompletion:", v3 & 1);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(v7, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_1000286CC(void *a1)
{
}

id sub_100028F04()
{
  return +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCaption1,  0LL);
}

UIFont *sub_100028F30()
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2);
}

UIColor *sub_10002938C()
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.882352941,  0.882352941,  0.882352941,  0.75);
}

UIColor *sub_1000293BC()
{
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  0.6);
}

id sub_10002AC10(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.77, 0.77);
  [v2 setTransform:&v4];
  [*(id *)(a1 + 32) setAlpha:0.0];
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

void sub_10002AC94(uint64_t a1)
{
}

id sub_10002ACC8(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  id v2 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  return [v2 setTransform:__dst];
}

void sub_10002AD20(uint64_t a1)
{
}

id sub_10002AD54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1, a1, a1);
}

id sub_10002AD8C(uint64_t a1)
{
  uint64_t v26 = a1;
  uint64_t v25 = a1;
  id v11 = *(void **)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  [v11 frame];
  double v20 = v1;
  double v21 = v2;
  double v22 = v3;
  double v23 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained originatingFrame];
  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  double v19 = v8;
  if (v14) {
    objc_msgSend(v14, "_transformFromRect:toRect:", v20, v21, v22, v23, v16, v17, v18, v19);
  }
  else {
    memset(__b, 0, sizeof(__b));
  }
  [v11 setTransform:__b];

  [*(id *)(a1 + 32) setAlpha:0.0];
  char v10 = *(void **)(a1 + 48);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v10 setTransform:__dst];
  return [*(id *)(a1 + 48) setAlpha:1.0];
}

id sub_10002AEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v6 = a1;
  [*(id *)(a1 + 32) removeFromSuperview];
  double v3 = *(void **)(a1 + 32);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v3 setTransform:__dst];
  return [*(id *)(a1 + 40) completeTransition:1];
}

uint64_t variable initialization expression of TVSMJetAnalyticsReporter.topic()
{
  return 0x745F706D615F7078LL;
}

uint64_t variable initialization expression of TVSMJetAnalyticsReporter.defaultCompoundSeparator()
{
  return 95LL;
}

id TVSMJetAnalyticsReporter.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id TVSMJetAnalyticsReporter.init()()
{
  uint64_t v1 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v47 = *(void *)(v1 - 8);
  uint64_t v48 = v1;
  __chkstk_darwin(v1);
  uint64_t v46 = (uint64_t)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_10002B878(&qword_1000569D0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  uint64_t v45 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for Bag(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  id v13 = (char *)&v40 - v12;
  uint64_t v14 = &v0[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic];
  strcpy(&v0[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic], "xp_amp_tvos_cs");
  v14[15] = -18;
  NSComparisonResult v15 = &v0[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_defaultCompoundSeparator];
  *(void *)NSComparisonResult v15 = 95LL;
  *((void *)v15 + 1) = 0xE100000000000000LL;
  double v16 = v0;
  NSString v17 = String._bridgeToObjectiveC()();
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = [(id)objc_opt_self(AMSBag) bagForProfile:v17 profileVersion:v18];

  id v20 = objc_allocWithZone(&OBJC_CLASS___AMSMetrics);
  id v21 = v19;
  NSString v22 = String._bridgeToObjectiveC()();
  id v23 = [v20 initWithContainerID:v22 bag:v21];

  id v42 = v21;
  v43 = v13;
  Bag.init(from:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v24 = *(void *)v14;
  uint64_t v25 = *((void *)v14 + 1);
  uint64_t v41 = v24;
  uint64_t v26 = type metadata accessor for NoAccountAMSMetricsEventRecorder();
  id v27 = (void *)swift_allocObject(v26, 48LL, 7LL);
  id v28 = v23;
  swift_bridgeObjectRetain(v25);
  NSString v29 = String._bridgeToObjectiveC()();
  Bag.subscript.getter();

  uint64_t v30 = v44;
  Bag.Value.current(or:)(&v50, sub_10002DE88, 0LL, v44);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
  v31(v11, v7);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v30);
  v27[2] = v50;
  v27[3] = v28;
  v27[4] = v41;
  v27[5] = v25;
  *(void *)&v16[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_eventRecorder] = v27;
  uint64_t v32 = (objc_class *)type metadata accessor for TVSMJetAnalyticsReporter(0LL);
  uint64_t v33 = swift_retain(v27);
  uint64_t v34 = v46;
  sub_10002B8F8(v33, 0LL, v46);
  swift_release(v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))( &v16[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline],  v34,  v48);
  type metadata accessor for BasicImpressionsTracker(0LL);
  *(void *)&v16[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_impressionsTracker] = BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(TVSMClickReportableUndefinedIdentiferPrefix);
  uint64_t v37 = v36;

  v31(v43, v7);
  v38 = (uint64_t *)&v16[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor];
  uint64_t *v38 = v35;
  v38[1] = v37;

  v49.receiver = v16;
  v49.super_class = v32;
  return objc_msgSendSuper2(&v49, "init");
}

uint64_t sub_10002B878(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for NoAccountAMSMetricsEventRecorder()
{
  return objc_opt_self(&OBJC_CLASS____TtC19TVSystemMenuServiceP33_CDB8CBC214AF277C62D61B9BB220A25C32NoAccountAMSMetricsEventRecorder);
}

uint64_t sub_10002B8F8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v35 = a2;
  uint64_t v37 = a1;
  uint64_t v38 = a3;
  uint64_t v3 = 0xD000000000000013LL;
  uint64_t v4 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = type metadata accessor for MetricsFieldsAggregator(0LL);
  uint64_t v8 = *(void *)(v36 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v35 - v13;
  MetricsFieldsAggregator.init()(v12);
  id v15 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v16 = String._bridgeToObjectiveC()();
  [v15 doubleForKey:v16];
  double v18 = v17;

  if (v18 <= 0.0) {
    double v18 = 604800.0;
  }
  uint64_t v19 = sub_10002B878(&qword_100056C08);
  uint64_t v20 = swift_allocObject(v19, 40LL, 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_1000440F0;
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 =  [(id)objc_opt_self(AMSMetricsIdentifierKey) keyWithName:v21 crossDeviceSync:0];

  *(void *)(v20 + 32) = v22;
  v40[0] = v20;
  specialized Array._endMutation()();
  uint64_t v23 = v40[0];
  type metadata accessor for Unstable.Accounts(0LL);
  uint64_t v24 = static Unstable.Accounts.shared.getter();
  id v25 = [(id)objc_opt_self(AMSProcessInfo) currentProcess];
  uint64_t v41 = (ValueMetadata *)type metadata accessor for AMSMetricsIdentifierFieldsProvider(0LL);
  id v42 = &protocol witness table for AMSMetricsIdentifierFieldsProvider;
  sub_100030880(v40);
  uint64_t v26 = AMSMetricsIdentifierFieldsProvider.init(accounts:clientInfo:resetInterval:keys:)(v24, v25, v23, v18);
  static MetricsFieldExclusionRequest.amsMetricsID.getter(v26);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v40, v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100030860(v40);
  if (v35)
  {
    id v27 = v35;
    id v28 = [v27 foregroundApp];
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    unint64_t v30 = v29;
  }

  else
  {
    unint64_t v30 = 0x8000000100046400LL;
  }

  uint64_t v41 = &type metadata for MainFieldProvider;
  id v42 = (void *)sub_100030A3C();
  v40[0] = v3;
  v40[1] = v30;
  if (qword_100056D38 != -1) {
    swift_once(&qword_100056D38, sub_10002EAD0);
  }
  uint64_t v31 = sub_100030560(v4, (uint64_t)qword_100056D40);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v40, v31);
  sub_100030860(v40);
  unint64_t v32 = sub_100030A80();
  uint64_t v33 = v36;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v14, v36);
  uint64_t v41 = &type metadata for SimpleMetricsEventLinter;
  id v42 = (void *)sub_100030AC4();
  v39[3] = type metadata accessor for NoAccountAMSMetricsEventRecorder();
  v39[4] = sub_100030B08();
  v39[0] = v37;
  swift_retain();
  MetricsPipeline.init(builderType:aggregator:linter:recorder:)( &type metadata for SimpleFieldBuilder,  v32,  v11,  v40,  v39);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v14, v33);
}

Swift::Void __swiftcall TVSMJetAnalyticsReporter._didUpdateBaseInfo()()
{
  uint64_t v1 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  type metadata accessor for TVSMJetAnalyticsReporter(0LL);
  uint64_t v5 = *(void *)&v0[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_eventRecorder];
  id v6 = [v0 baseInfo];
  sub_10002B8F8(v5, v6, (uint64_t)v4);

  uint64_t v7 = &v0[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline];
  swift_beginAccess(v7, v9, 33LL, 0LL);
  (*(void (**)(char *, _BYTE *, uint64_t))(v2 + 40))(v7, v4, v1);
  swift_endAccess(v9);
}

uint64_t TVSMJetAnalyticsReporter.reportClickEvent(_:locations:)(void *a1, unint64_t a2)
{
  unint64_t v50 = a2;
  uint64_t v4 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  __chkstk_darwin(v4);
  v56 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v54 = *(void *)(v6 - 8);
  uint64_t v55 = v6;
  __chkstk_darwin(v6);
  v53 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MetricsData(0LL);
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  __chkstk_darwin(v8);
  uint64_t v48 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10002B878(&qword_1000569F8);
  uint64_t inited = swift_initStackObject(v10, &v63);
  *(_OWORD *)(inited + 16) = xmmword_100044100;
  *(void *)(inited + 32) = 0x707954746E657665LL;
  *(void *)(inited + 40) = 0xE900000000000065LL;
  *(void *)(inited + 48) = 0x6B63696C63LL;
  *(void *)(inited + 56) = 0xE500000000000000LL;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 1701273968LL;
  *(void *)(inited + 88) = 0xE400000000000000LL;
  id v49 = v2;
  uint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor + 8];
  *(void *)(inited + 96) = *(void *)&v2[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor];
  *(void *)(inited + 104) = v12;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x79546E6F69746361LL;
  *(void *)(inited + 136) = 0xEA00000000006570LL;
  swift_bridgeObjectRetain(v12);
  id v13 = [a1 actionType];
  type metadata accessor for TVSMClickAnalyticsActionType(0LL);
  *(void *)(inited + 144) = v13;
  *(void *)(inited + 168) = v14;
  *(void *)(inited + 176) = 0x6449746567726174LL;
  *(void *)(inited + 184) = 0xE800000000000000LL;
  id v15 = [a1 elementInfo];
  id v16 = [v15 identifier];

  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  *(void *)(inited + 192) = v17;
  *(void *)(inited + 200) = v19;
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 224) = 0x7954746567726174LL;
  *(void *)(inited + 232) = 0xEA00000000006570LL;
  id v20 = [a1 elementInfo];
  id v21 = [v20 targetType];

  type metadata accessor for TVSMAnalyticsElementType(0LL);
  *(void *)(inited + 264) = v22;
  *(void *)(inited + 240) = v21;
  unint64_t v24 = sub_10002C330(inited, v23);
  id v25 = [a1 elementInfo];
  id v26 = [v25 elementState];

  if (v26)
  {
    type metadata accessor for TVSMAnalyticsElementState(0LL);
    uint64_t v62 = v27;
    *(void *)&__int128 v61 = v26;
    sub_100030268(&v61, v60);
    id v28 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
    unint64_t v59 = v24;
    sub_10002F8F0(v60, 0x536C6F72746E6F63LL, 0xEC00000065746174LL, isUniquelyReferenced_nonNull_native);
    unint64_t v24 = v59;

    swift_bridgeObjectRelease(0x8000000000000000LL, v30);
  }

  uint64_t v31 = (char *)v49;
  unint64_t v32 = sub_10002FE98(v50);

  uint64_t v62 = sub_10002B878(&qword_100056A00);
  *(void *)&__int128 v61 = v32;
  sub_100030268(&v61, v60);
  char v33 = swift_isUniquelyReferenced_nonNull_native(v24);
  unint64_t v59 = v24;
  sub_10002F8F0(v60, 0x6E6F697461636F6CLL, 0xE800000000000000LL, v33);
  unint64_t v34 = v59;
  swift_bridgeObjectRelease(0x8000000000000000LL, v35);
  uint64_t v36 = *(void *)&v31[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic];
  uint64_t v37 = *(void *)&v31[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic + 8];
  swift_bridgeObjectRetain(v37);
  uint64_t v38 = v48;
  MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)( v36,  v37,  1LL,  v34,  &_swiftEmptySetSingleton,  &_swiftEmptySetSingleton);
  v39 = &v31[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline];
  swift_beginAccess( &v31[OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline],  &v61,  0LL,  0LL);
  uint64_t v41 = v53;
  uint64_t v40 = v54;
  uint64_t v42 = v55;
  uint64_t v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v54 + 16))(v53, v39, v55);
  uint64_t v44 = v56;
  MetricsFieldsContext.init()(v43);
  uint64_t v45 = MetricsPipeline.process(_:using:)(v38, v44);
  swift_release(v45);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v44, v58);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v38, v52);
}

unint64_t sub_10002C330(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10002B878(&qword_100056BD0);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  uint64_t v7 = v4 + 64;
  uint64_t v8 = a1 + 32;
  swift_retain(v4);
  while (1)
  {
    sub_1000309F0(v8, (uint64_t)&v17);
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    unint64_t result = sub_10002F2BC(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    id v13 = (uint64_t *)(v5[6] + 16 * result);
    *id v13 = v9;
    v13[1] = v10;
    unint64_t result = (unint64_t)sub_100030268(&v19, (_OWORD *)(v5[7] + 32 * result));
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    id v5[2] = v16;
    v8 += 48LL;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002C464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1 + 24))
  {
    sub_100030268((_OWORD *)a1, v14);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10002F8F0(v14, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v8 = *v3;
    *uint64_t v4 = v13;
    swift_bridgeObjectRelease(a3, v9);
    return swift_bridgeObjectRelease(v8, v10);
  }

  else
  {
    sub_1000308BC(a1, &qword_100056B78);
    sub_10002F328(a2, a3, v14);
    swift_bridgeObjectRelease(a3, v12);
    return sub_1000308BC((uint64_t)v14, &qword_100056B78);
  }

uint64_t TVSMJetAnalyticsReporter.reportPageEvent(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v75 = *(void *)(v4 - 8);
  uint64_t v76 = v4;
  __chkstk_darwin(v4);
  __int128 v72 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v70 = *(void *)(v6 - 8);
  uint64_t v71 = v6;
  __chkstk_darwin(v6);
  __int128 v69 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MetricsData(0LL);
  uint64_t v73 = *(void *)(v8 - 8);
  uint64_t v74 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v11 = [a1 pageType];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v14 = v13;

  uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_defaultCompoundSeparator);
  BOOL v15 = *(void **)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_defaultCompoundSeparator + 8);
  uint64_t v77 = v12;
  uint64_t v78 = v14;
  swift_bridgeObjectRetain(v14);
  v17._countAndFlagsBits = v16;
  v17._object = v15;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v14, v18);
  uint64_t v20 = v77;
  uint64_t v19 = v78;
  id v21 = [a1 pageId];
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  unint64_t v24 = v23;

  uint64_t v77 = v20;
  uint64_t v78 = v19;
  swift_bridgeObjectRetain(v19);
  v25._countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(v19, v26);
  swift_bridgeObjectRelease(v24, v27);
  uint64_t v28 = v78;
  unint64_t v29 = (uint64_t *)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor);
  uint64_t v30 = *(void *)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor + 8);
  *unint64_t v29 = v77;
  v29[1] = v28;
  swift_bridgeObjectRelease(v30, v31);
  uint64_t v32 = sub_10002B878(&qword_1000569F8);
  uint64_t inited = swift_initStackObject(v32, &v79);
  *(_OWORD *)(inited + 16) = xmmword_100044100;
  *(void *)(inited + 32) = 0x707954746E657665LL;
  *(void *)(inited + 40) = 0xE900000000000065LL;
  *(void *)(inited + 48) = 1701273968LL;
  *(void *)(inited + 56) = 0xE400000000000000LL;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 1701273968LL;
  *(void *)(inited + 88) = 0xE400000000000000LL;
  uint64_t v34 = v29[1];
  *(void *)(inited + 96) = *v29;
  *(void *)(inited + 104) = v34;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x746E6F4365676170LL;
  *(void *)(inited + 136) = 0xEB00000000747865LL;
  swift_bridgeObjectRetain(v34);
  id v35 = [a1 pageContext];
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
  uint64_t v38 = v37;

  *(void *)(inited + 144) = v36;
  *(void *)(inited + 152) = v38;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 176) = 0x644965676170LL;
  *(void *)(inited + 184) = 0xE600000000000000LL;
  id v39 = [a1 pageId];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  uint64_t v42 = v41;

  *(void *)(inited + 192) = v40;
  *(void *)(inited + 200) = v42;
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 224) = 0x6570795465676170LL;
  *(void *)(inited + 232) = 0xE800000000000000LL;
  id v43 = [a1 pageType];
  uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
  uint64_t v46 = v45;

  *(void *)(inited + 264) = &type metadata for String;
  *(void *)(inited + 240) = v44;
  *(void *)(inited + 248) = v46;
  unint64_t v48 = sub_10002C330(inited, v47);
  uint64_t v50 = *(void *)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic);
  uint64_t v49 = *(void *)(v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic + 8);
  uint64_t v51 = sub_10002B878(&qword_100056A08);
  uint64_t v52 = type metadata accessor for MetricsFieldInclusionRequest(0LL);
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = *(void *)(v53 + 72);
  uint64_t v55 = *(unsigned __int8 *)(v53 + 80);
  uint64_t v56 = (v55 + 32) & ~v55;
  uint64_t v57 = swift_allocObject(v51, v56 + v54, v55 | 7);
  *(_OWORD *)(v57 + 16) = xmmword_100044110;
  uint64_t v58 = v57 + v56;
  uint64_t v59 = swift_bridgeObjectRetain(v49);
  static MetricsFieldInclusionRequest.pageFields.getter(v59);
  v60 = sub_1000302D0(v57);
  swift_setDeallocating(v57);
  swift_arrayDestroy(v58, 1LL, v52);
  swift_deallocClassInstance(v57, 32LL, 7LL);
  MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)( v50,  v49,  1LL,  v48,  v60,  &_swiftEmptySetSingleton);
  uint64_t v61 = v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline;
  swift_beginAccess( v2 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline,  &v77,  0LL,  0LL);
  uint64_t v63 = v69;
  uint64_t v62 = v70;
  uint64_t v64 = v71;
  uint64_t v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v61, v71);
  __int128 v66 = v72;
  MetricsFieldsContext.init()(v65);
  uint64_t v67 = MetricsPipeline.process(_:using:)(v10, v66);
  swift_release(v67);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v66, v76);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v10, v74);
}

Swift::Void __swiftcall TVSMJetAnalyticsReporter.reportImpressionsBegin(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v2 - 8);
  uint64_t v17 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!((unint64_t)a1._rawValue >> 62))
  {
    uint64_t v9 = *(void *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(a1._rawValue);
    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease(a1._rawValue, v10);
    return;
  }

  else {
    unint64_t rawValue = (unint64_t)a1._rawValue & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1._rawValue);
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(rawValue);
  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  if (v9 >= 1)
  {
    uint64_t v11 = 0LL;
    do
    {
      else {
        id v12 = *((id *)a1._rawValue + v11 + 4);
      }
      uint64_t v13 = v12;
      ++v11;
      uint64_t v14 = sub_10002D220(v12, (uint64_t)v8);
      Date.init()(v14);
      BasicImpressionsTracker.elementDidEnterView(_:on:)(v8, v4);

      (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v17);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }

    while (v9 != v11);
    goto LABEL_14;
  }

  __break(1u);
}

Swift::Void __swiftcall TVSMJetAnalyticsReporter.reportImpressionsEnd(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v60 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v59 = type metadata accessor for MetricsData(0LL);
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v57 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v56 = type metadata accessor for ImpressionsTrackerFormat(0LL);
  uint64_t v55 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v54 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for Date(0LL);
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!((unint64_t)a1._rawValue >> 62))
  {
    uint64_t v17 = *(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v14);
    if (v17) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease(a1._rawValue, v18);
LABEL_15:
    uint64_t v28 = v1;
    uint64_t v29 = v55;
    uint64_t v30 = v54;
    uint64_t v31 = v56;
    uint64_t v32 = (*(uint64_t (**)(char *, void, uint64_t))(v55 + 104))( v54,  enum case for ImpressionsTrackerFormat.v4(_:),  v56);
    Date.init()(v32);
    uint64_t v33 = BasicImpressionsTracker.consumeImpressions(in:on:)(v30, v11);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v11, v64);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    uint64_t v34 = sub_10002B878(&qword_1000569F8);
    uint64_t inited = swift_initStackObject(v34, v66);
    *(_OWORD *)(inited + 16) = xmmword_100044120;
    *(void *)(inited + 32) = 0x707954746E657665LL;
    *(void *)(inited + 40) = 0xE900000000000065LL;
    *(void *)(inited + 48) = 0x6973736572706D69LL;
    *(void *)(inited + 56) = 0xEB00000000736E6FLL;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 80) = 1701273968LL;
    *(void *)(inited + 88) = 0xE400000000000000LL;
    uint64_t v36 = *(void *)(v28 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor + 8);
    *(void *)(inited + 96) = *(void *)(v28
                                         + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_currentPageDescriptor);
    *(void *)(inited + 104) = v36;
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 128) = 0x6973736572706D69LL;
    *(void *)(inited + 136) = 0xEB00000000736E6FLL;
    *(void *)(inited + 168) = sub_10002B878(&qword_100056A10);
    *(void *)(inited + 144) = v33;
    swift_bridgeObjectRetain(v36);
    unint64_t v38 = sub_10002C330(inited, v37);
    uint64_t v39 = *(void *)(v28 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic);
    uint64_t v40 = *(void *)(v28 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_topic + 8);
    swift_bridgeObjectRetain(v40);
    uint64_t v41 = v57;
    MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)( v39,  v40,  1LL,  v38,  &_swiftEmptySetSingleton,  &_swiftEmptySetSingleton);
    uint64_t v42 = v28 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline;
    swift_beginAccess( v28 + OBJC_IVAR____TtC19TVSystemMenuService24TVSMJetAnalyticsReporter_metricsPipeline,  v65,  0LL,  0LL);
    uint64_t v43 = v61;
    uint64_t v44 = v60;
    uint64_t v45 = v42;
    uint64_t v46 = v62;
    uint64_t v47 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 16))(v60, v45, v62);
    MetricsFieldsContext.init()(v47);
    uint64_t v48 = MetricsPipeline.process(_:using:)(v41, v6);
    swift_release(v48);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v46);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v59);
    return;
  }

  uint64_t v25 = v1;
  if (v14 < 0) {
    uint64_t v26 = v14;
  }
  else {
    uint64_t v26 = v14 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v14);
  uint64_t v27 = v26;
  uint64_t v1 = v25;
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter(v27);
  if (!v17) {
    goto LABEL_14;
  }
LABEL_3:
  if (v17 >= 1)
  {
    unint64_t rawValue = (id *)a1._rawValue;
    uint64_t v51 = v6;
    uint64_t v52 = v4;
    uint64_t v53 = v3;
    uint64_t v20 = 0LL;
    uint64_t v50 = v1;
    do
    {
      else {
        id v21 = rawValue[v20 + 4];
      }
      uint64_t v22 = v21;
      ++v20;
      uint64_t v23 = sub_10002D220(v21, (uint64_t)v16);
      Date.init()(v23);
      BasicImpressionsTracker.elementDidLeaveView(_:on:)(v16, v11);

      (*(void (**)(char *, uint64_t))(v63 + 8))(v11, v64);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
      unint64_t rawValue = (id *)a1._rawValue;
    }

    while (v17 != v20);
    swift_bridgeObjectRelease(a1._rawValue, v24);
    uint64_t v3 = v53;
    uint64_t v4 = v52;
    uint64_t v6 = v51;
    uint64_t v1 = v50;
    goto LABEL_15;
  }

  __break(1u);
}

uint64_t sub_10002D1B4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = sub_100030978(0LL, &qword_100056BC0, &OBJC_CLASS___TVSMImpressionAnalytics_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  id v9 = a1;
  a4(v8);

  return swift_bridgeObjectRelease(v8, v10);
}

uint64_t sub_10002D220@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = type metadata accessor for ScalarDictionary(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = type metadata accessor for ImpressionMetrics.ID(0LL);
  uint64_t v50 = *(void *)(v51 - 8);
  uint64_t v6 = __chkstk_darwin(v51);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v49 - v9;
  uint64_t v11 = sub_10002B878(&qword_1000569F8);
  uint64_t inited = swift_initStackObject(v11, v57);
  *(_OWORD *)(inited + 16) = xmmword_100044130;
  strcpy((char *)(inited + 32), "impressionType");
  *(_BYTE *)(inited + 47) = -18;
  id v13 = [a1 elementInfo];
  id v14 = [v13 targetType];

  type metadata accessor for TVSMAnalyticsElementType(0LL);
  *(void *)(inited + 48) = v14;
  *(void *)(inited + 72) = v15;
  *(void *)(inited + 80) = 0x6973736572706D69LL;
  *(void *)(inited + 88) = 0xEF7865646E496E6FLL;
  id v16 = [a1 impressionIndex];
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = v16;
  unint64_t v18 = sub_10002C330(inited, v17);
  id v19 = [a1 elementInfo];
  id v20 = [v19 displayStyle];

  unint64_t v21 = 0xE500000000000000LL;
  uint64_t v22 = 0x6C6C616D73LL;
  switch((unint64_t)v20)
  {
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
    case 5uLL:
      unint64_t v21 = 0xE600000000000000LL;
      uint64_t v22 = 0x6D756964656DLL;
      goto LABEL_5;
    case 3uLL:
    case 4uLL:
      uint64_t v22 = 0x656772616CLL;
      goto LABEL_5;
    case 6uLL:
      unint64_t v21 = 0xEA00000000006567LL;
      uint64_t v22 = 0x72614C6172747865LL;
LABEL_5:
      uint64_t v56 = &type metadata for String;
      *(void *)&__int128 v55 = v22;
      *((void *)&v55 + 1) = v21;
      sub_100030268(&v55, v54);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v18);
      unint64_t v53 = v18;
      sub_10002F8F0(v54, 0x5379616C70736964LL, 0xEC000000656C7974LL, isUniquelyReferenced_nonNull_native);
      unint64_t v18 = v53;
      swift_bridgeObjectRelease(0x8000000000000000LL, v24);
      break;
    default:
      break;
  }

  id v25 = [a1 elementInfo];
  id v26 = [v25 elementState];

  if (v26)
  {
    type metadata accessor for TVSMAnalyticsElementState(0LL);
    uint64_t v56 = v27;
    *(void *)&__int128 v55 = v26;
    sub_100030268(&v55, v54);
    id v28 = v26;
    char v29 = swift_isUniquelyReferenced_nonNull_native(v18);
    unint64_t v53 = v18;
    sub_10002F8F0(v54, 0x74536E6F74747562LL, 0xEB00000000657461LL, v29);
    unint64_t v18 = v53;

    swift_bridgeObjectRelease(0x8000000000000000LL, v30);
  }

  id v31 = [a1 parentIdentifier];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
    uint64_t v35 = v34;
  }

  else
  {
    uint64_t v33 = 0LL;
    uint64_t v35 = 0LL;
  }

  id v36 = [a1 elementInfo];
  id v37 = [v36 identifier];

  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
  uint64_t v40 = v39;

  ImpressionMetrics.ID.init(parent:element:index:)(v33, v35, v38, v40, [a1 impressionIndex]);
  uint64_t v41 = v50;
  uint64_t v42 = v51;
  uint64_t v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v50 + 16))(v8, v10, v51);
  ScalarDictionary.init()(v43);
  unint64_t v45 = sub_10002F044((uint64_t)_swiftEmptyArrayStorage, v44);
  unint64_t v47 = sub_10002F044((uint64_t)_swiftEmptyArrayStorage, v46);
  ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)(v8, v18, v5, v45, v47);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v42);
}

id TVSMJetAnalyticsReporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TVSMJetAnalyticsReporter(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t MainFieldProvider.foregroundApp.getter(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t MainFieldProvider.foregroundApp.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(v2[1], a2);
  *objc_super v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MainFieldProvider.foregroundApp.modify())()
{
  return nullsub_1;
}

uint64_t MainFieldProvider.category.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for MetricsFieldsProviderCategory.expensive(_:);
  uint64_t v3 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104LL))(a1, v2, v3);
}

uint64_t MainFieldProvider.addMetricsFields(into:using:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for Device(0LL);
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  __chkstk_darwin(v8);
  uint64_t v63 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_10002B878((uint64_t *)&unk_100056A18);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for Unstable.Accounts(0LL);
  uint64_t v13 = static Unstable.Accounts.shared.getter();
  Unstable.Accounts.activeiTunesAccount.getter();
  swift_release(v13);
  uint64_t v14 = type metadata accessor for Unstable.AccountHandle(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  int v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1LL, v14);
  if (v16 == 1)
  {
    sub_1000308BC((uint64_t)v12, (uint64_t *)&unk_100056A18);
    id v19 = 0LL;
  }

  else
  {
    uint64_t v17 = Unstable.AccountHandle.forReading.getter();
    unint64_t v18 = *(void (**)(char *, uint64_t))(v15 + 8);
    id v19 = (void *)v17;
    v18(v12, v14);
  }

  uint64_t v62 = &type metadata for Bool;
  LOBYTE(v60) = v16 != 1;
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(a1 + 32);
  sub_100030538(a1, v20);
  dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x64656E6769537369LL,  0xEA00000000006E49LL,  v20,  v21);
  if (v4)
  {
  }

  else
  {
    sub_100030860(&v60);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = a3;
    unint64_t v61 = a4;
    uint64_t v22 = *(void *)(a1 + 24);
    uint64_t v23 = *(void *)(a1 + 32);
    sub_100030538(a1, v22);
    swift_bridgeObjectRetain(a4);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x756F726765726F66LL,  0xED0000707041646ELL,  v22,  v23);
    sub_100030860(&v60);
    uint64_t v24 = (void *)objc_opt_self(&OBJC_CLASS___AMSUserAgent);
    id v25 = [(id)objc_opt_self(AMSProcessInfo) currentProcess];
    id v26 = [v24 userAgentForProcessInfo:v25];

    uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    unint64_t v29 = v28;

    uint64_t v62 = &type metadata for String;
    uint64_t v60 = v27;
    unint64_t v61 = v29;
    uint64_t v30 = *(void *)(a1 + 24);
    uint64_t v31 = *(void *)(a1 + 32);
    sub_100030538(a1, v30);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x6E65674172657375LL,  0xE900000000000074LL,  v30,  v31);
    uint64_t v33 = v19;
    uint64_t v34 = sub_100030860(&v60);
    uint64_t v35 = v63;
    static Device.current.getter(v34);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = 0x565420656C707041LL;
    unint64_t v61 = 0xE800000000000000LL;
    uint64_t v36 = *(void *)(a1 + 24);
    uint64_t v37 = *(void *)(a1 + 32);
    sub_100030538(a1, v36);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x6572617764726168LL,  0xEE00796C696D6146LL,  v36,  v37);
    uint64_t v38 = sub_100030860(&v60);
    uint64_t v39 = Device.systemName.getter(v38);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = v39;
    unint64_t v61 = v40;
    uint64_t v41 = *(void *)(a1 + 24);
    uint64_t v42 = *(void *)(a1 + 32);
    sub_100030538(a1, v41);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)(&v60, 29551LL, 0xE200000000000000LL, v41, v42);
    uint64_t v43 = sub_100030860(&v60);
    uint64_t v44 = Device.physicalModel.getter(v43);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = v44;
    unint64_t v61 = v45;
    uint64_t v46 = *(void *)(a1 + 24);
    uint64_t v47 = *(void *)(a1 + 32);
    sub_100030538(a1, v46);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x6572617764726168LL,  0xED00006C65646F4DLL,  v46,  v47);
    uint64_t v48 = sub_100030860(&v60);
    uint64_t v49 = Device.buildVersion.getter(v48);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = v49;
    unint64_t v61 = v50;
    uint64_t v51 = *(void *)(a1 + 24);
    uint64_t v52 = *(void *)(a1 + 32);
    sub_100030538(a1, v51);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x4E646C697542736FLL,  0xED00007265626D75LL,  v51,  v52);
    uint64_t v53 = sub_100030860(&v60);
    uint64_t v54 = Device.osVersion.getter(v53);
    uint64_t v62 = &type metadata for String;
    uint64_t v60 = v54;
    unint64_t v61 = v55;
    uint64_t v56 = *(void *)(a1 + 24);
    uint64_t v57 = *(void *)(a1 + 32);
    sub_100030538(a1, v56);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v60,  0x6F6973726556736FLL,  0xE90000000000006ELL,  v56,  v57);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v35, v59);
  }

  return sub_100030860(&v60);
}

uint64_t sub_10002DD58()
{
  return MetricsFieldsProvider.addTimeSensitiveMetricsFields(into:using:)();
}

uint64_t sub_10002DD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to MetricsFieldsProvider.addExpensiveMetricsFields(into:using:)[1]);
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_10002DDE4;
  return MetricsFieldsProvider.addExpensiveMetricsFields(into:using:)(a1, a2, a3, a4);
}

uint64_t sub_10002DDE4()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002DE2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for MetricsFieldsProviderCategory.expensive(_:);
  uint64_t v3 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104LL))(a1, v2, v3);
}

uint64_t sub_10002DE70(uint64_t a1, uint64_t a2)
{
  return MainFieldProvider.addMetricsFields(into:using:)(a1, a2, *(void *)v2, *(void *)(v2 + 8));
}

void sub_10002DE88(void *a1@<X8>)
{
  *a1 = 10LL;
}

uint64_t type metadata accessor for TVSMJetAnalyticsReporter(uint64_t a1)
{
  uint64_t result = qword_100056DF0;
  if (!qword_100056DF0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TVSMJetAnalyticsReporter);
  }
  return result;
}

void type metadata accessor for TVSMClickAnalyticsActionType(uint64_t a1)
{
}

void type metadata accessor for TVSMAnalyticsElementType(uint64_t a1)
{
}

void sub_10002DEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = LintedMetricsEvent.fields.getter();
  if (!*(void *)(v7 + 16)
    || (uint64_t v8 = sub_10002F2BC( 0x6449746E65696C63LL,  0xE800000000000000LL,  (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98),  (v6 & 1) == 0))
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    swift_bridgeObjectRelease(v7, v6);
    goto LABEL_11;
  }

  sub_10003093C(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v25);
  swift_bridgeObjectRelease(v7, v9);
  if (!*((void *)&v26 + 1))
  {
LABEL_11:
    sub_1000308BC((uint64_t)&v25, &qword_100056B78);
    goto LABEL_12;
  }

  if ((swift_dynamicCast(&v24, &v25, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) != 0)
  {
    uint64_t v10 = *((void *)&v24 + 1);
    __int128 v25 = v24;
    unint64_t v11 = sub_1000308F8();
    uint64_t v12 = StringProtocol.hash.getter(&type metadata for String, v11);
    swift_bridgeObjectRelease(v10, v13);
    uint64_t v14 = *(void *)(v4 + 16);
    if (v14)
    {
      if (v12 != 0x8000000000000000LL || v14 != -1)
      {
        if (v12 % v14) {
          return;
        }
        goto LABEL_12;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    return;
  }

LABEL_12:
  if (a3)
  {
    uint64_t v15 = a3;
  }

  else
  {
    uint64_t v15 = *(void *)(v4 + 40);
    swift_bridgeObjectRetain(v15);
  }

  id v16 = objc_allocWithZone(&OBJC_CLASS___AMSMetricsEvent);
  swift_bridgeObjectRetain(a3);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15, v18);
  id v19 = [v16 initWithTopic:v17];

  [v19 setCheckDiagnosticsAndUsageSetting:1];
  [v19 setAnonymous:1];
  NSString v20 = String._bridgeToObjectiveC()();
  [v19 setDiagnosticsSubmissionBugType:v20];

  uint64_t v21 = LintedMetricsEvent.fields.getter();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21, v23);
  [v19 addPropertiesWithDictionary:isa];

  [*(id *)(v4 + 24) enqueueEvent:v19];
}

uint64_t sub_10002E158()
{
  uint64_t v1 = Promise<A>.init(_:)([*(id *)(v0 + 24) flush]);
  uint64_t v5 = sub_100030978(0LL, &qword_100056B68, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v6 = &protocol witness table for OS_dispatch_queue;
  v4[0] = static OS_dispatch_queue.main.getter();
  Promise.then(perform:orCatchError:on:)(sub_10002E260, 0LL, sub_10002E4B4, 0LL, v4);
  sub_100030860(v4);
  uint64_t v5 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v6 = &protocol witness table for SyncTaskScheduler;
  sub_100030880(v4);
  SyncTaskScheduler.init()();
  uint64_t v2 = Promise.map<A>(on:_:)(v4, sub_10002E6B8, 0LL, &type metadata for Int);
  swift_release(v1);
  sub_100030860(v4);
  return v2;
}

uint64_t sub_10002E260(void **a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *a1;
  if (qword_100056D30 != -1) {
    swift_once(&qword_100056D30, sub_10002E9A8);
  }
  uint64_t v10 = sub_100030560(v5, (uint64_t)qword_100057950);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v10, v5);
  uint64_t v11 = sub_10002B878(&qword_100056B70);
  uint64_t v12 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v13 = swift_allocObject( v11,  ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
        + *(void *)(v12 + 72),
          *(unsigned __int8 *)(v12 + 80) | 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_100044110;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(23LL, 1LL);
  v14._countAndFlagsBits = 0x2064656873756C46LL;
  v14._object = (void *)0xE800000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v14);
  v19[3] = sub_100030978(0LL, &qword_100056B80, &OBJC_CLASS___NSNumber_ptr);
  v19[0] = v9;
  id v15 = v9;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v19);
  sub_1000308BC((uint64_t)v19, &qword_100056B78);
  v16._countAndFlagsBits = 0x7363697274656D20LL;
  v16._object = (void *)0xEF73746E65766520LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v16);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.debug(_:)(v13, v5, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v13, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10002E46C()
{
  if (qword_100056D30 != -1) {
    swift_once(&qword_100056D30, sub_10002E9A8);
  }
  uint64_t v0 = type metadata accessor for OSLogger(0LL);
  return sub_100030560(v0, (uint64_t)qword_100057950);
}

uint64_t sub_10002E4B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100056D30 != -1) {
    swift_once(&qword_100056D30, sub_10002E9A8);
  }
  uint64_t v9 = sub_100030560(v5, (uint64_t)qword_100057950);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_10002B878(&qword_100056B70);
  uint64_t v11 = type metadata accessor for LogMessage(0LL);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
        + *(void *)(*(void *)(v11 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_100044110;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(40LL, 1LL);
  v13._object = (void *)0x8000000100046370LL;
  v13._countAndFlagsBits = 0xD000000000000028LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v13);
  swift_getErrorValue(a1, v22, &v20);
  uint64_t v14 = v20;
  uint64_t v15 = v21;
  v23[3] = v21;
  Swift::String v16 = sub_100030880(v23);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v16, v14, v15);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v23);
  sub_1000308BC((uint64_t)v23, &qword_100056B78);
  v17._countAndFlagsBits = 0LL;
  v17._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.error(_:)(v12, v5, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v12, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_10002E6B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 integerValue];
  *a2 = result;
  return result;
}

uint64_t sub_10002E6F0()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40), v1);
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

void sub_10002E71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10002E740()
{
  return sub_10002E158();
}

uint64_t sub_10002E760(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LintedMetricsEvent(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = swift_bridgeObjectRetain(a1);
  LintedMetricsEvent.init(fields:issues:)(v9, _swiftEmptyArrayStorage);
  sub_10002B878(&qword_100056C18);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  uint64_t v10 = Promise.__allocating_init(value:)(v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v10;
}

uint64_t sub_10002E854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  if (*(void *)(v7 + 16))
  {
    swift_bridgeObjectRetain(a3);
    uint64_t v8 = sub_10002F2BC(a2, a3, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98);
    if ((v9 & 1) != 0)
    {
      sub_10003093C(*(void *)(v7 + 56) + 32 * v8, (uint64_t)&v15);
      swift_bridgeObjectRelease(a3, v10);
      if (*((void *)&v16 + 1))
      {
        sub_1000308BC((uint64_t)&v15, &qword_100056B78);
        unint64_t v11 = sub_100030B6C();
        swift_allocError(&type metadata for SimpleFieldBuilder.DuplicateFieldError, v11, 0LL, 0LL);
        *uint64_t v12 = a2;
        v12[1] = a3;
        uint64_t v13 = swift_bridgeObjectRetain(a3);
        return swift_willThrow(v13);
      }
    }

    else
    {
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      swift_bridgeObjectRelease(a3, v9);
    }
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
  }

  sub_1000308BC((uint64_t)&v15, &qword_100056B78);
  sub_10003093C(a1, (uint64_t)&v15);
  swift_bridgeObjectRetain(a3);
  return sub_10002C464((uint64_t)&v15, a2, a3);
}

uint64_t sub_10002E984@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10002E98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002E854(a1, a2, a3);
}

uint64_t sub_10002E9A0()
{
  return swift_bridgeObjectRetain(*v0);
}

uint64_t sub_10002E9A8()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  sub_1000309B0(v3, qword_100057950);
  sub_100030560(v3, (uint64_t)qword_100057950);
  OSLogger.Subsystem.init(rawValue:)(0xD000000000000012LL, 0x80000001000463A0LL);
  return OSLogger.init(subsystem:category:)(v2, 0LL, 0xE000000000000000LL);
}

uint64_t sub_10002EA60@<X0>(uint64_t a1@<X8>)
{
  if (qword_100056D30 != -1) {
    swift_once(&qword_100056D30, sub_10002E9A8);
  }
  uint64_t v2 = type metadata accessor for OSLogger(0LL);
  uint64_t v3 = sub_100030560(v2, (uint64_t)qword_100057950);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_10002EAD0()
{
  uint64_t v0 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  sub_1000309B0(v0, qword_100056D40);
  sub_100030560(v0, (uint64_t)qword_100056D40);
  return MetricsFieldExclusionRequest.init(rawValue:)(1702060386LL, 0xE400000000000000LL);
}

uint64_t sub_10002EB24(uint64_t a1, uint64_t a2)
{
  return sub_10002EEBC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10002EB3C(uint64_t a1, uint64_t a2)
{
  return sub_10002EEBC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10002EB54(uint64_t a1, uint64_t a2)
{
  return sub_10002EEBC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10002EB64(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5, v7);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_10002EBDC(uint64_t a1, id *a2)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v9);
  uint64_t v5 = v10;
  if (v10)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5, v7);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10002EC5C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3, v5);
  *a1 = v4;
  return result;
}

uint64_t sub_10002ECA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10002ECC8(uint64_t a1)
{
  uint64_t v2 = sub_1000306EC( &qword_100056BA0,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementType,  (uint64_t)&unk_10004449C);
  uint64_t v3 = sub_1000306EC( &qword_100056BA8,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementType,  (uint64_t)&unk_100044444);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10002ED50(uint64_t a1)
{
  uint64_t v2 = sub_1000306EC( &qword_100056BB0,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMClickAnalyticsActionType,  (uint64_t)&unk_10004435C);
  uint64_t v3 = sub_1000306EC( &qword_100056BB8,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMClickAnalyticsActionType,  (uint64_t)&unk_100044304);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10002EDD8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3, v5);
  *a2 = v4;
  return result;
}

uint64_t sub_10002EE1C(uint64_t a1)
{
  uint64_t v2 = sub_1000306EC( &qword_100056B90,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementState,  (uint64_t)&unk_1000445DC);
  uint64_t v3 = sub_1000306EC( &qword_100056B98,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementState,  (uint64_t)&unk_100044584);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10002EEA0(uint64_t a1, uint64_t a2)
{
  return sub_10002EEBC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10002EEBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7, v9);
  return v8;
}

uint64_t sub_10002EEFC(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5, v6);
}

Swift::Int sub_10002EF40(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v9, a1);
  String.hash(into:)(v9, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5, v7);
  return v6;
}

uint64_t sub_10002EFBC(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5, v7);
  swift_bridgeObjectRelease(v9, v11);
  return v10 & 1;
}

unint64_t sub_10002F044(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10002B878(&qword_100056BD0);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  uint64_t v7 = v4 + 64;
  uint64_t v8 = a1 + 32;
  swift_retain(v4);
  while (1)
  {
    sub_1000309F0(v8, (uint64_t)&v17);
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    unint64_t result = sub_10002F2BC(v17, v18, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002F178);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)(v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v13 = v9;
    v13[1] = v10;
    unint64_t result = (unint64_t)sub_100030268(&v19, (_OWORD *)(v5[7] + 32 * result));
    uint64_t v14 = v5[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    id v5[2] = v16;
    v8 += 48LL;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10002F178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    uint64_t v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      unint64_t i = (i + 1) & v13;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        uint64_t v14 = (void *)(v9 + 16 * i);
        uint64_t v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v13; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
          {
            uint64_t v17 = (void *)(v9 + 16 * i);
            uint64_t v18 = v17[1];
            if (*v17 == a1 && v18 == a2) {
              break;
            }
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

uint64_t sub_10002F2BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  Swift::Int v6 = Hasher._finalize()();
  return a3(a1, a2, v6);
}

double sub_10002F328@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_10002F2BC(a1, a2, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8, v10);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v13 = *v4;
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10002FB78();
      uint64_t v13 = v17;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v13 + 48) + 16 * v9 + 8), v12);
    sub_100030268((_OWORD *)(*(void *)(v13 + 56) + 32 * v9), a3);
    sub_10002F71C(v9, v13);
    uint64_t v14 = *v4;
    *uint64_t v4 = v13;
    swift_bridgeObjectRelease(v14, v15);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_10002F420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10002B878(&qword_100056BD0);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      __int128 v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_100030268(v25, v38);
      }

      else
      {
        sub_10003093C((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      uint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      void *v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_100030268(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

unint64_t sub_10002F71C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v11 = *v10;
        uint64_t v12 = v10[1];
        Hasher.init(_seed:)(v28, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v28, v11, v12);
        Swift::Int v13 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease(v12, v14);
        unint64_t v15 = v13 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v15 < v8) {
            goto LABEL_5;
          }
        }

        else if (v15 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v15)
        {
LABEL_11:
          uint64_t v16 = *(void *)(a2 + 48);
          unint64_t v17 = (_OWORD *)(v16 + 16 * v3);
          unint64_t v18 = (_OWORD *)(v16 + 16 * v6);
          if (v3 != v6 || v17 >= v18 + 1) {
            *unint64_t v17 = *v18;
          }
          uint64_t v19 = *(void *)(a2 + 56);
          unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
          int64_t v21 = (_OWORD *)(v19 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
          {
            __int128 v9 = v21[1];
            *unint64_t v20 = *v21;
            v20[1] = v9;
            int64_t v3 = v6;
          }
        }

_OWORD *sub_10002F8F0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10002F2BC(a2, a3, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = (void *)(v18[7] + 32 * v12);
        sub_100030860(v19);
        return sub_100030268(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10002FB78();
      goto LABEL_7;
    }

    sub_10002F420(v15, a4 & 1);
    uint64_t v21 = sub_10002F2BC(a2, a3, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10002FA98);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10002FA30(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_10002FA30(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100030268(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_10002FA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

void *sub_10002FB78()
{
  uint64_t v1 = v0;
  sub_10002B878(&qword_100056BD0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10003093C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_100030268(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002FD5C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002FD78(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_10002FD78(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10002B878(&qword_100056BF8);
    uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    id v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4]) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v15 = sub_10002B878(&qword_100056C00);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }

  swift_release(a4);
  return v11;
}

void *sub_10002FE98(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_23;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v2)
  {
    sub_10002FD5C(0LL, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
      JUMPOUT(0x100030250LL);
    }

    uint64_t v3 = 0LL;
    unint64_t v31 = v1 & 0xC000000000000001LL;
    uint64_t v30 = v1;
    while (v2 != v3)
    {
      if (v31) {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v1);
      }
      else {
        id v4 = *(id *)(v1 + 8 * v3 + 32);
      }
      char v5 = v4;
      uint64_t v6 = sub_10002B878(&qword_1000569F8);
      uint64_t inited = swift_initStackObject(v6, v36);
      *(_OWORD *)(inited + 16) = xmmword_100044120;
      *(void *)(inited + 32) = 25705LL;
      *(void *)(inited + 40) = 0xE200000000000000LL;
      id v8 = [v5 elementInfo];
      id v9 = [v8 identifier];

      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
      uint64_t v12 = v11;

      *(void *)(inited + 48) = v10;
      *(void *)(inited + 56) = v12;
      *(void *)(inited + 72) = &type metadata for String;
      strcpy((char *)(inited + 80), "locationType");
      *(_BYTE *)(inited + 93) = 0;
      *(_WORD *)(inited + 94) = -5120;
      id v13 = [v5 elementInfo];
      id v14 = [v13 targetType];

      type metadata accessor for TVSMAnalyticsElementType(0LL);
      *(void *)(inited + 96) = v14;
      *(void *)(inited + 120) = v15;
      *(void *)(inited + 128) = 0xD000000000000010LL;
      *(void *)(inited + 136) = 0x80000001000463C0LL;
      id v16 = [v5 locationPosition];
      *(void *)(inited + 168) = &type metadata for Int;
      *(void *)(inited + 144) = v16;
      unint64_t v18 = sub_10002C330(inited, v17);
      id v19 = [v5 elementInfo];
      id v20 = [v19 displayStyle];

      unint64_t v21 = 0xE500000000000000LL;
      uint64_t v22 = 0x6C6C616D73LL;
      switch((unint64_t)v20)
      {
        case 1uLL:
          goto LABEL_14;
        case 2uLL:
        case 5uLL:
          unint64_t v21 = 0xE600000000000000LL;
          uint64_t v22 = 0x6D756964656DLL;
          goto LABEL_14;
        case 3uLL:
        case 4uLL:
          uint64_t v22 = 0x656772616CLL;
          goto LABEL_14;
        case 6uLL:
          unint64_t v21 = 0xEA00000000006567LL;
          uint64_t v22 = 0x72614C6172747865LL;
LABEL_14:
          int64_t v35 = &type metadata for String;
          *(void *)&__int128 v34 = v22;
          *((void *)&v34 + 1) = v21;
          sub_100030268(&v34, v33);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v18);
          unint64_t v37 = v18;
          sub_10002F8F0(v33, 0x5379616C70736964LL, 0xEC000000656C7974LL, isUniquelyReferenced_nonNull_native);
          unint64_t v18 = v37;
          swift_bridgeObjectRelease(0x8000000000000000LL, v24);
          break;
        default:
          break;
      }

      if (v32)
      {
        swift_release(_swiftEmptyArrayStorage);

        return _swiftEmptyArrayStorage;
      }

      unint64_t v26 = _swiftEmptyArrayStorage[2];
      unint64_t v25 = _swiftEmptyArrayStorage[3];
      if (v26 >= v25 >> 1) {
        sub_10002FD5C((void *)(v25 > 1), v26 + 1, 1);
      }
      ++v3;
      _swiftEmptyArrayStorage[2] = v26 + 1;
      _swiftEmptyArrayStorage[v26 + 4] = v18;
      uint64_t v1 = v30;
      if (v2 == v3) {
        return _swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_23:
    if (v1 < 0) {
      uint64_t v28 = v1;
    }
    else {
      uint64_t v28 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(v1, v29);
  }

  return _swiftEmptyArrayStorage;
}

_OWORD *sub_100030268(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for TVSMAnalyticsElementState(uint64_t a1)
{
}

void sub_10003028C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

void *sub_1000302D0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MetricsFieldInclusionRequest(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  id v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_10002B878(&qword_100056BE0);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    __int128 v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_1000306EC( &qword_100056BE8,  (uint64_t (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest,  (uint64_t)&protocol conformance descriptor for MetricsFieldInclusionRequest);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_1000306EC( &qword_100056BF0,  (uint64_t (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest,  (uint64_t)&protocol conformance descriptor for MetricsFieldInclusionRequest);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          unint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

uint64_t sub_100030538(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_100030560(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100030578()
{
  return type metadata accessor for TVSMJetAnalyticsReporter(0LL);
}

uint64_t sub_100030580(uint64_t a1)
{
  v4[0] = &unk_1000441C0;
  v4[1] = &unk_1000441C0;
  id v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  void v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for MetricsPipeline(319LL);
  if (v3 <= 0x3F)
  {
    v4[4] = *(void *)(result - 8) + 64LL;
    v4[5] = &unk_1000441C0;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for MainFieldProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for MainFieldProvider(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8), a2);
}

__n128 initializeWithTake for MainFieldProvider(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for MainFieldProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4, a2);
  return a1;
}

ValueMetadata *type metadata accessor for MainFieldProvider()
{
  return &type metadata for MainFieldProvider;
}

uint64_t sub_100030694()
{
  return sub_1000306EC( &qword_100056B18,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMClickAnalyticsActionType,  (uint64_t)&unk_1000442CC);
}

uint64_t sub_1000306C0()
{
  return sub_1000306EC( &qword_100056B20,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMClickAnalyticsActionType,  (uint64_t)&unk_1000442A4);
}

uint64_t sub_1000306EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10003072C()
{
  return sub_1000306EC( &qword_100056B28,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMClickAnalyticsActionType,  (uint64_t)&unk_100044334);
}

uint64_t sub_100030758()
{
  return sub_1000306EC( &qword_100056B30,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementType,  (uint64_t)&unk_10004440C);
}

uint64_t sub_100030784()
{
  return sub_1000306EC( &qword_100056B38,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementType,  (uint64_t)&unk_1000443E4);
}

uint64_t sub_1000307B0()
{
  return sub_1000306EC( &qword_100056B40,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementType,  (uint64_t)&unk_100044474);
}

uint64_t sub_1000307DC()
{
  return sub_1000306EC( &qword_100056B48,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementState,  (uint64_t)&unk_10004454C);
}

uint64_t sub_100030808()
{
  return sub_1000306EC( &qword_100056B50,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementState,  (uint64_t)&unk_100044524);
}

uint64_t sub_100030834()
{
  return sub_1000306EC( &qword_100056B58,  (uint64_t (*)(uint64_t))type metadata accessor for TVSMAnalyticsElementState,  (uint64_t)&unk_1000445B4);
}

uint64_t sub_100030860(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100030880(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_1000308BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002B878(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_1000308F8()
{
  unint64_t result = qword_100056B88;
  if (!qword_100056B88)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100056B88);
  }

  return result;
}

uint64_t sub_10003093C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100030978(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t *sub_1000309B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_1000309F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002B878(&qword_100056BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_100030A3C()
{
  unint64_t result = qword_100056C10;
  if (!qword_100056C10)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for MainFieldProvider,  &type metadata for MainFieldProvider);
    atomic_store(result, (unint64_t *)&qword_100056C10);
  }

  return result;
}

unint64_t sub_100030A80()
{
  unint64_t result = qword_100057780;
  if (!qword_100057780)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000446FC, &type metadata for SimpleFieldBuilder);
    atomic_store(result, (unint64_t *)&qword_100057780);
  }

  return result;
}

unint64_t sub_100030AC4()
{
  unint64_t result = qword_100057788;
  if (!qword_100057788)
  {
    unint64_t result = swift_getWitnessTable("]X", &type metadata for SimpleMetricsEventLinter);
    atomic_store(result, (unint64_t *)&qword_100057788);
  }

  return result;
}

unint64_t sub_100030B08()
{
  unint64_t result = qword_100057790[0];
  if (!qword_100057790[0])
  {
    uint64_t v1 = type metadata accessor for NoAccountAMSMetricsEventRecorder();
    unint64_t result = swift_getWitnessTable(&unk_100044664, v1);
    atomic_store(result, qword_100057790);
  }

  return result;
}

ValueMetadata *type metadata accessor for SimpleMetricsEventLinter()
{
  return &type metadata for SimpleMetricsEventLinter;
}

ValueMetadata *type metadata accessor for SimpleFieldBuilder()
{
  return &type metadata for SimpleFieldBuilder;
}

unint64_t sub_100030B6C()
{
  unint64_t result = qword_1000578A0[0];
  if (!qword_1000578A0[0])
  {
    unint64_t result = swift_getWitnessTable("\rX", &type metadata for SimpleFieldBuilder.DuplicateFieldError);
    atomic_store(result, qword_1000578A0);
  }

  return result;
}

void *_s19TVSystemMenuService17MainFieldProviderVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4, v5);
  return a1;
}

uint64_t _s19TVSystemMenuService17MainFieldProviderVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100030C44(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SimpleFieldBuilder.DuplicateFieldError()
{
  return &type metadata for SimpleFieldBuilder.DuplicateFieldError;
}

void sub_100030C90()
{
}

uint64_t sub_100030CC4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

id sub_100030CD4()
{
  uint64_t v0 = type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  id result = [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
  qword_100057938 = (uint64_t)result;
  return result;
}

uint64_t sub_100030D24(uint64_t a1)
{
  return sub_100030DA0(a1, qword_100057968, 0x6461685365676445LL, 0xEA0000000000776FLL);
}

uint64_t sub_100030D48()
{
  return sub_100030E54(&qword_100057940, (uint64_t)qword_100057968, (uint64_t)sub_100030D24);
}

uint64_t sub_100030D64@<X0>(uint64_t a1@<X8>)
{
  return sub_100030EB0(&qword_100057940, (uint64_t)qword_100057968, (uint64_t)sub_100030D24, a1);
}

uint64_t sub_100030D80(uint64_t a1)
{
  return sub_100030DA0(a1, qword_100057980, 0x6C6C69662E727474LL, 0xE800000000000000LL);
}

uint64_t sub_100030DA0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource(0LL);
  sub_1000309B0(v7, a2);
  sub_100030560(v7, (uint64_t)a2);
  if (qword_100057930 != -1) {
    swift_once(&qword_100057930, sub_100030CD4);
  }
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_100057938);
}

uint64_t sub_100030E38()
{
  return sub_100030E54(&qword_100057948, (uint64_t)qword_100057980, (uint64_t)sub_100030D80);
}

uint64_t sub_100030E54(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v4 = type metadata accessor for ImageResource(0LL);
  return sub_100030560(v4, a2);
}

uint64_t sub_100030E94@<X0>(uint64_t a1@<X8>)
{
  return sub_100030EB0(&qword_100057948, (uint64_t)qword_100057980, (uint64_t)sub_100030D80, a1);
}

uint64_t sub_100030EB0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1LL) {
    swift_once(a1, a3);
  }
  uint64_t v6 = type metadata accessor for ImageResource(0LL);
  uint64_t v7 = sub_100030560(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a4, v7, v6);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC19TVSystemMenuServiceP33_CD5291C12E47B62A259294943592DB4819ResourceBundleClass);
}

id objc_msgSend_TVSMIsExpanseActive(void *a1, const char *a2, ...)
{
  return _[a1 TVSMIsExpanseActive];
}

id objc_msgSend_TVSMShouldShowExpanseModule(void *a1, const char *a2, ...)
{
  return _[a1 TVSMShouldShowExpanseModule];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return _[a1 _appearState];
}

id objc_msgSend__assetHeight(void *a1, const char *a2, ...)
{
  return _[a1 _assetHeight];
}

id objc_msgSend__audioRoutingPreferredIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 _audioRoutingPreferredIndexPath];
}

id objc_msgSend__availableStatusForMediaDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_availableStatusForMediaDestination:");
}

id objc_msgSend__buildAnalyticsForPeopleModules_andButtonModules_withLocations_impressions_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildAnalyticsForPeopleModules:andButtonModules:withLocations:impressions:");
}

id objc_msgSend__configureCell_withModuleAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureCell:withModuleAtIndexPath:");
}

id objc_msgSend__connectPairingIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectPairingIfNeeded:");
}

id objc_msgSend__createRequestController(void *a1, const char *a2, ...)
{
  return _[a1 _createRequestController];
}

id objc_msgSend__cubicTimingFunction(void *a1, const char *a2, ...)
{
  return _[a1 _cubicTimingFunction];
}

id objc_msgSend__cubicTimingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _cubicTimingParameters];
}

id objc_msgSend__currentDeviceRoutingSymbolName(void *a1, const char *a2, ...)
{
  return _[a1 _currentDeviceRoutingSymbolName];
}

id objc_msgSend__defaultModuleDirectories(void *a1, const char *a2, ...)
{
  return _[a1 _defaultModuleDirectories];
}

id objc_msgSend__endpointRoutesWithForcedLocalRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endpointRoutesWithForcedLocalRoute:");
}

id objc_msgSend__imageForAVRoute_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageForAVRoute:destination:");
}

id objc_msgSend__imageForGroupWithMembers_leader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageForGroupWithMembers:leader:");
}

id objc_msgSend__imageForMediaDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageForMediaDestination:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithURL:");
}

id objc_msgSend__locationAnalyticsForModule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationAnalyticsForModule:");
}

id objc_msgSend__metadataDidChange_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metadataDidChange:forKeys:");
}

id objc_msgSend__moduleAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moduleAtIndexPath:");
}

id objc_msgSend__moduleWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moduleWithInfo:");
}

id objc_msgSend__overlayAnimationSettingsForTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_overlayAnimationSettingsForTransition:");
}

id objc_msgSend__placeholderArtwork(void *a1, const char *a2, ...)
{
  return _[a1 _placeholderArtwork];
}

id objc_msgSend__playbackStateForMPCPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackStateForMPCPlaybackState:");
}

id objc_msgSend__postPageAnalyticsEvent(void *a1, const char *a2, ...)
{
  return _[a1 _postPageAnalyticsEvent];
}

id objc_msgSend__preferredFontForTextStyle_variant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:variant:");
}

id objc_msgSend__preloadArtwork(void *a1, const char *a2, ...)
{
  return _[a1 _preloadArtwork];
}

id objc_msgSend__reloadPlayerPathWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadPlayerPathWithRoute:");
}

id objc_msgSend__remoteString(void *a1, const char *a2, ...)
{
  return _[a1 _remoteString];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__setAutomaticResponseLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutomaticResponseLoading:");
}

id objc_msgSend__setClockDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClockDate:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setNeedsDisplayedRoutesUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsDisplayedRoutesUpdate];
}

id objc_msgSend__setWantsPlaybackMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWantsPlaybackMetadata:");
}

id objc_msgSend__setupInterface(void *a1, const char *a2, ...)
{
  return _[a1 _setupInterface];
}

id objc_msgSend__showTeachableMoment(void *a1, const char *a2, ...)
{
  return _[a1 _showTeachableMoment];
}

id objc_msgSend__springTimingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _springTimingParameters];
}

id objc_msgSend__symbolImageForRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolImageForRoute:");
}

id objc_msgSend__symbolImageForRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolImageForRoutes:");
}

id objc_msgSend__symbolNameForRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolNameForRoute:");
}

id objc_msgSend__synchronizedDrawingFence(void *a1, const char *a2, ...)
{
  return _[a1 _synchronizedDrawingFence];
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__teachableMomentAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 _teachableMomentAssetURL];
}

id objc_msgSend__timingFunctionForAnimationInView_withKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timingFunctionForAnimationInView:withKeyPath:");
}

id objc_msgSend__titleForGroupWithMembers_leader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForGroupWithMembers:leader:");
}

id objc_msgSend__transformFromRect_toRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformFromRect:toRect:");
}

id objc_msgSend__tvButtonInjectedStringWithBaseLocalizedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tvButtonInjectedStringWithBaseLocalizedString:");
}

id objc_msgSend__updateAllowsDestinationSelection(void *a1, const char *a2, ...)
{
  return _[a1 _updateAllowsDestinationSelection];
}

id objc_msgSend__updateAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 _updateAutomaticResponseLoading];
}

id objc_msgSend__updateAvailableModules(void *a1, const char *a2, ...)
{
  return _[a1 _updateAvailableModules];
}

id objc_msgSend__updateAvailableRoutes(void *a1, const char *a2, ...)
{
  return _[a1 _updateAvailableRoutes];
}

id objc_msgSend__updateEffect(void *a1, const char *a2, ...)
{
  return _[a1 _updateEffect];
}

id objc_msgSend__updateLayoutElementWithOverlayTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLayoutElementWithOverlayTransition:");
}

id objc_msgSend__updateMetadata(void *a1, const char *a2, ...)
{
  return _[a1 _updateMetadata];
}

id objc_msgSend__updateOverlayLayoutElementWithFrame_andTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOverlayLayoutElementWithFrame:andTransitionContext:");
}

id objc_msgSend__updateOverlayLayoutElementWithViewController_transitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOverlayLayoutElementWithViewController:transitionContext:");
}

id objc_msgSend__updateSnapshotAnalyticsOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSnapshotAnalyticsOnly:");
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _[a1 _updateState];
}

id objc_msgSend__updateVolume(void *a1, const char *a2, ...)
{
  return _[a1 _updateVolume];
}

id objc_msgSend__updateWithAvailableEndpoints_outputDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithAvailableEndpoints:outputDevices:");
}

id objc_msgSend__updateWithAvailableMediaDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithAvailableMediaDestinations:");
}

id objc_msgSend__userInteractionAssetURL(void *a1, const char *a2, ...)
{
  return _[a1 _userInteractionAssetURL];
}

id objc_msgSend_absoluteDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteDimension:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessibilityIdentifierSuffix(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityIdentifierSuffix];
}

id objc_msgSend_accessories(void *a1, const char *a2, ...)
{
  return _[a1 accessories];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return _[a1 accessory];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:queue:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPairedDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPairedDevicesObserver:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return _[a1 album];
}

id objc_msgSend_allModuleInfos(void *a1, const char *a2, ...)
{
  return _[a1 allModuleInfos];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alphaAnimationFactory(void *a1, const char *a2, ...)
{
  return _[a1 alphaAnimationFactory];
}

id objc_msgSend_analyticsActionType(void *a1, const char *a2, ...)
{
  return _[a1 analyticsActionType];
}

id objc_msgSend_analyticsElementInfo(void *a1, const char *a2, ...)
{
  return _[a1 analyticsElementInfo];
}

id objc_msgSend_analyticsWithElementInfo_actionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsWithElementInfo:actionType:");
}

id objc_msgSend_analyticsWithElementInfo_impressionId_impressionIndex_parentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsWithElementInfo:impressionId:impressionIndex:parentIdentifier:");
}

id objc_msgSend_analyticsWithElementInfo_locationPostion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsWithElementInfo:locationPostion:");
}

id objc_msgSend_animateTeachableMomentAction(void *a1, const char *a2, ...)
{
  return _[a1 animateTeachableMomentAction];
}

id objc_msgSend_animationSettingsForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationSettingsForOperation:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendItemsWithIdentifiers_intoSectionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendItemsWithIdentifiers:intoSectionWithIdentifier:");
}

id objc_msgSend_appendSectionsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSectionsWithIdentifiers:");
}

id objc_msgSend_appleHeadsets(void *a1, const char *a2, ...)
{
  return _[a1 appleHeadsets];
}

id objc_msgSend_applySnapshot_animatingDifferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applySnapshot:animatingDifferences:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _[a1 artist];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return _[a1 artworkCatalog];
}

id objc_msgSend_artworkImage(void *a1, const char *a2, ...)
{
  return _[a1 artworkImage];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_audioDestinationController(void *a1, const char *a2, ...)
{
  return _[a1 audioDestinationController];
}

id objc_msgSend_audioDestinationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 audioDestinationIdentifier];
}

id objc_msgSend_audioDestinationName(void *a1, const char *a2, ...)
{
  return _[a1 audioDestinationName];
}

id objc_msgSend_audioDestinationType(void *a1, const char *a2, ...)
{
  return _[a1 audioDestinationType];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_auxiliarySession(void *a1, const char *a2, ...)
{
  return _[a1 auxiliarySession];
}

id objc_msgSend_availableDestinations(void *a1, const char *a2, ...)
{
  return _[a1 availableDestinations];
}

id objc_msgSend_availableModules(void *a1, const char *a2, ...)
{
  return _[a1 availableModules];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevel];
}

id objc_msgSend_beginAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 beginAutomaticResponseLoading];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bs_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_addChildViewController:");
}

id objc_msgSend_bs_addChildViewController_animated_transitionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_addChildViewController:animated:transitionBlock:");
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_filter:");
}

id objc_msgSend_bs_flatten(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_flatten");
}

id objc_msgSend_bs_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_map:");
}

id objc_msgSend_bs_mapNoNulls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_mapNoNulls:");
}

id objc_msgSend_bs_removeChildViewController_animated_transitionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_removeChildViewController:animated:transitionBlock:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_canModifyGroupMembership(void *a1, const char *a2, ...)
{
  return _[a1 canModifyGroupMembership];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_childModules(void *a1, const char *a2, ...)
{
  return _[a1 childModules];
}

id objc_msgSend_clusterComposition(void *a1, const char *a2, ...)
{
  return _[a1 clusterComposition];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_colorWithDynamicProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithDynamicProvider:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransition:");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectAndPair(void *a1, const char *a2, ...)
{
  return _[a1 connectAndPair];
}

id objc_msgSend_connectWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectWithOptions:completion:");
}

id objc_msgSend_connectedBluetoothRemote(void *a1, const char *a2, ...)
{
  return _[a1 connectedBluetoothRemote];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return _[a1 contentInsets];
}

id objc_msgSend_contentItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contentItemIdentifier];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_convertRect_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromCoordinateSpace:");
}

id objc_msgSend_convertRect_toCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toCoordinateSpace:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 coordinateSpace];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_damping(void *a1, const char *a2, ...)
{
  return _[a1 damping];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return _[a1 dateLabel];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultDurationForTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDurationForTransition:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultPIPController(void *a1, const char *a2, ...)
{
  return _[a1 defaultPIPController];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_deregisterMetadataUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterMetadataUpdateHandler:");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _[a1 destination];
}

id objc_msgSend_destinationName(void *a1, const char *a2, ...)
{
  return _[a1 destinationName];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilitySignal];
}

id objc_msgSend_dismissContentAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissContentAnimated:withCompletion:");
}

id objc_msgSend_dismissSystemMenuAnimated_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissSystemMenuAnimated:result:");
}

id objc_msgSend_dismissTeachableMomentIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 dismissTeachableMomentIfNeeded];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissWithResult:");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayStyle(void *a1, const char *a2, ...)
{
  return _[a1 displayStyle];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_donateControlCenterOpenedEvent(void *a1, const char *a2, ...)
{
  return _[a1 donateControlCenterOpenedEvent];
}

id objc_msgSend_dumpViewController(void *a1, const char *a2, ...)
{
  return _[a1 dumpViewController];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_elementInfo(void *a1, const char *a2, ...)
{
  return _[a1 elementInfo];
}

id objc_msgSend_endAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _[a1 endAutomaticResponseLoading];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_endpointRoute(void *a1, const char *a2, ...)
{
  return _[a1 endpointRoute];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_estimatedDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedDimension:");
}

id objc_msgSend_expandedContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 expandedContentViewController];
}

id objc_msgSend_externalDevice(void *a1, const char *a2, ...)
{
  return _[a1 externalDevice];
}

id objc_msgSend_fetchAvailableRoutesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAvailableRoutesWithCompletionHandler:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixedSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixedSpacing:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_foregroundApp(void *a1, const char *a2, ...)
{
  return _[a1 foregroundApp];
}

id objc_msgSend_formatDateAsDayOfWeekMonthDayStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatDateAsDayOfWeekMonthDayStyle:");
}

id objc_msgSend_fractionalHeightDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fractionalHeightDimension:");
}

id objc_msgSend_fractionalWidthDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fractionalWidthDimension:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_gameControllersConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 gameControllersConfiguration];
}

id objc_msgSend_groupUID(void *a1, const char *a2, ...)
{
  return _[a1 groupUID];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasVideo(void *a1, const char *a2, ...)
{
  return _[a1 hasVideo];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hmAccessory(void *a1, const char *a2, ...)
{
  return _[a1 hmAccessory];
}

id objc_msgSend_hmRoom(void *a1, const char *a2, ...)
{
  return _[a1 hmRoom];
}

id objc_msgSend_homeDestinationController(void *a1, const char *a2, ...)
{
  return _[a1 homeDestinationController];
}

id objc_msgSend_homeManager(void *a1, const char *a2, ...)
{
  return _[a1 homeManager];
}

id objc_msgSend_homePodVariant(void *a1, const char *a2, ...)
{
  return _[a1 homePodVariant];
}

id objc_msgSend_horizontalGroupWithLayoutSize_subitems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalGroupWithLayoutSize:subitems:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItemIdentifier:");
}

id objc_msgSend_infoPlist(void *a1, const char *a2, ...)
{
  return _[a1 infoPlist];
}

id objc_msgSend_infoWithForegroundApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoWithForegroundApp:");
}

id objc_msgSend_infoWithIdentifier_targetType_displayStyle_elementState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoWithIdentifier:targetType:displayStyle:elementState:");
}

id objc_msgSend_infoWithPageContext_pageId_pageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoWithPageContext:pageId:pageType:");
}

id objc_msgSend_initForPresenting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForPresenting:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCollectionView_cellProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionView:cellProvider:");
}

id objc_msgSend_initWithContentsOfURL_publishedObjectViewClassMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:publishedObjectViewClassMap:");
}

id objc_msgSend_initWithControlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoint1:controlPoint2:");
}

id objc_msgSend_initWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoints::::");
}

id objc_msgSend_initWithCustomCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomCurve:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDataSource_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:name:");
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:timingParameters:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithEndpointRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpointRoute:");
}

id objc_msgSend_initWithGroupRoute_outputDeviceRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupRoute:outputDeviceRoute:");
}

id objc_msgSend_initWithIdentifier_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleID:context:");
}

id objc_msgSend_initWithIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:style:");
}

id objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMass:stiffness:damping:initialVelocity:");
}

id objc_msgSend_initWithModuleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModuleType:");
}

id objc_msgSend_initWithModuleType_shouldUpdateAvailableModules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModuleType:shouldUpdateAvailableModules:");
}

id objc_msgSend_initWithOutputContextUID_allowsRetargeting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputContextUID:allowsRetargeting:");
}

id objc_msgSend_initWithOutputContextUID_allowsRetargeting_initalFetchCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputContextUID:allowsRetargeting:initalFetchCompletion:");
}

id objc_msgSend_initWithProperties_relationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:relationships:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoute:");
}

id objc_msgSend_initWithSectionProvider_configuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSectionProvider:configuration:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initialAnimationDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 initialAnimationDidFinish];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_invalidateWithTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateWithTransitionContext:");
}

id objc_msgSend_isArtworkVisuallyIdenticalToCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isArtworkVisuallyIdenticalToCatalog:");
}

id objc_msgSend_isAttemptingConnection(void *a1, const char *a2, ...)
{
  return _[a1 isAttemptingConnection];
}

id objc_msgSend_isClusterRoute(void *a1, const char *a2, ...)
{
  return _[a1 isClusterRoute];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isControllable(void *a1, const char *a2, ...)
{
  return _[a1 isControllable];
}

id objc_msgSend_isCurrentDestination(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentDestination];
}

id objc_msgSend_isDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceRoute];
}

id objc_msgSend_isDeviceSpeakerRoute(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceSpeakerRoute];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGroupLeader(void *a1, const char *a2, ...)
{
  return _[a1 isGroupLeader];
}

id objc_msgSend_isHomeModuleAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isHomeModuleAvailable];
}

id objc_msgSend_isHomePodRoute(void *a1, const char *a2, ...)
{
  return _[a1 isHomePodRoute];
}

id objc_msgSend_isHomeTheaterRoute(void *a1, const char *a2, ...)
{
  return _[a1 isHomeTheaterRoute];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 isInvalidated];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _[a1 isLocal];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return _[a1 isPaired];
}

id objc_msgSend_isPicked(void *a1, const char *a2, ...)
{
  return _[a1 isPicked];
}

id objc_msgSend_isPresenting(void *a1, const char *a2, ...)
{
  return _[a1 isPresenting];
}

id objc_msgSend_isProxyGroupPlayer(void *a1, const char *a2, ...)
{
  return _[a1 isProxyGroupPlayer];
}

id objc_msgSend_isRestoringUserInterfaceFromPIP(void *a1, const char *a2, ...)
{
  return _[a1 isRestoringUserInterfaceFromPIP];
}

id objc_msgSend_isSetTopBoxRoute(void *a1, const char *a2, ...)
{
  return _[a1 isSetTopBoxRoute];
}

id objc_msgSend_isSplitterCapable(void *a1, const char *a2, ...)
{
  return _[a1 isSplitterCapable];
}

id objc_msgSend_isTVStickRoute(void *a1, const char *a2, ...)
{
  return _[a1 isTVStickRoute];
}

id objc_msgSend_isVolumeControlAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isVolumeControlAvailable];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAtIndexPath:");
}

id objc_msgSend_itemIdentifierForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifierForIndexPath:");
}

id objc_msgSend_itemWithLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithLayoutSize:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastOperation(void *a1, const char *a2, ...)
{
  return _[a1 lastOperation];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutAttributesForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
}

id objc_msgSend_layoutElement(void *a1, const char *a2, ...)
{
  return _[a1 layoutElement];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leader(void *a1, const char *a2, ...)
{
  return _[a1 leader];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localAccessory(void *a1, const char *a2, ...)
{
  return _[a1 localAccessory];
}

id objc_msgSend_localRouteIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localRouteIdentifier];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 localizedUppercaseString];
}

id objc_msgSend_lockupContainingViewController(void *a1, const char *a2, ...)
{
  return _[a1 lockupContainingViewController];
}

id objc_msgSend_logicalLeaderOutputDevice(void *a1, const char *a2, ...)
{
  return _[a1 logicalLeaderOutputDevice];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainViewController(void *a1, const char *a2, ...)
{
  return _[a1 mainViewController];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyWindow];
}

id objc_msgSend_mapTableWithStrongToStrongObjects(void *a1, const char *a2, ...)
{
  return _[a1 mapTableWithStrongToStrongObjects];
}

id objc_msgSend_mass(void *a1, const char *a2, ...)
{
  return _[a1 mass];
}

id objc_msgSend_mediaProfile(void *a1, const char *a2, ...)
{
  return _[a1 mediaProfile];
}

id objc_msgSend_mediaRemoteServiceProxy(void *a1, const char *a2, ...)
{
  return _[a1 mediaRemoteServiceProxy];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return _[a1 members];
}

id objc_msgSend_metadataObject(void *a1, const char *a2, ...)
{
  return _[a1 metadataObject];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_newControlCenterElementHandle(void *a1, const char *a2, ...)
{
  return _[a1 newControlCenterElementHandle];
}

id objc_msgSend_nextFocusedIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 nextFocusedIndexPath];
}

id objc_msgSend_noiseControlSupported(void *a1, const char *a2, ...)
{
  return _[a1 noiseControlSupported];
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_opaqueSessionID(void *a1, const char *a2, ...)
{
  return _[a1 opaqueSessionID];
}

id objc_msgSend_originatingFrame(void *a1, const char *a2, ...)
{
  return _[a1 originatingFrame];
}

id objc_msgSend_outputDeviceRoute(void *a1, const char *a2, ...)
{
  return _[a1 outputDeviceRoute];
}

id objc_msgSend_overlayContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 overlayContentViewController];
}

id objc_msgSend_overrideTitle(void *a1, const char *a2, ...)
{
  return _[a1 overrideTitle];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevices];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pathWithRoute_bundleID_playerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithRoute:bundleID:playerID:");
}

id objc_msgSend_pbs_buddySelectedHomeTheaterHomePodVariant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_buddySelectedHomeTheaterHomePodVariant");
}

id objc_msgSend_pbs_buddySelectedHomeTheaterSpeakerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_buddySelectedHomeTheaterSpeakerIdentifier");
}

id objc_msgSend_pbs_buddySelectedHomeTheaterSpeakerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_buddySelectedHomeTheaterSpeakerType");
}

id objc_msgSend_pbs_buddySelectedRoomName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pbs_buddySelectedRoomName");
}

id objc_msgSend_pendingPickedRoutes(void *a1, const char *a2, ...)
{
  return _[a1 pendingPickedRoutes];
}

id objc_msgSend_pendingSelectedMediaDestination(void *a1, const char *a2, ...)
{
  return _[a1 pendingSelectedMediaDestination];
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_pickedRoutes(void *a1, const char *a2, ...)
{
  return _[a1 pickedRoutes];
}

id objc_msgSend_playPause(void *a1, const char *a2, ...)
{
  return _[a1 playPause];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _[a1 playbackState];
}

id objc_msgSend_playerPath(void *a1, const char *a2, ...)
{
  return _[a1 playerPath];
}

id objc_msgSend_playingItemIndexPath(void *a1, const char *a2, ...)
{
  return _[a1 playingItemIndexPath];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentContentAnimated_options_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentContentAnimated:options:withCompletion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_prewarmViewController(void *a1, const char *a2, ...)
{
  return _[a1 prewarmViewController];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_propertySetWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithProperties:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_refreshPropertiesWithRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshPropertiesWithRoute:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerMetadataUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerMetadataUpdateHandler:");
}

id objc_msgSend_reloadHomeConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 reloadHomeConfiguration];
}

id objc_msgSend_remoteType(void *a1, const char *a2, ...)
{
  return _[a1 remoteType];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChildViewController:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePairedDevicesObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePairedDevicesObserver:");
}

id objc_msgSend_replaceCharactersInRange_withAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:");
}

id objc_msgSend_reportClickEvent_locations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportClickEvent:locations:");
}

id objc_msgSend_reportImpressionsBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportImpressionsBegin:");
}

id objc_msgSend_reportImpressionsEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportImpressionsEnd:");
}

id objc_msgSend_reportPageEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPageEvent:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_requestImageWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageWithCompletion:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedColorWithTraitCollection:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_room(void *a1, const char *a2, ...)
{
  return _[a1 room];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return _[a1 route];
}

id objc_msgSend_routeConnection(void *a1, const char *a2, ...)
{
  return _[a1 routeConnection];
}

id objc_msgSend_routeName(void *a1, const char *a2, ...)
{
  return _[a1 routeName];
}

id objc_msgSend_routeNames(void *a1, const char *a2, ...)
{
  return _[a1 routeNames];
}

id objc_msgSend_routeSubtype(void *a1, const char *a2, ...)
{
  return _[a1 routeSubtype];
}

id objc_msgSend_routeUID(void *a1, const char *a2, ...)
{
  return _[a1 routeUID];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 sectionIdentifiers];
}

id objc_msgSend_sectionWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWithGroup:");
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return _[a1 securityType];
}

id objc_msgSend_selectRoutes_operation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRoutes:operation:completion:");
}

id objc_msgSend_selectedCellFrame(void *a1, const char *a2, ...)
{
  return _[a1 selectedCellFrame];
}

id objc_msgSend_selectionState(void *a1, const char *a2, ...)
{
  return _[a1 selectionState];
}

id objc_msgSend_sendCommand_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:options:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return _[a1 sessionState];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setActiveRoute_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRoute:completion:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowedPressTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedPressTypes:");
}

id objc_msgSend_setAllowsGroupBlending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupBlending:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setArtworkImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkImage:");
}

id objc_msgSend_setAttemptingConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptingConnection:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailable:");
}

id objc_msgSend_setAvailableModules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableModules:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBaseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseInfo:");
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineRelativeArrangement:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCacheIdentifier_forCacheReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheIdentifier:forCacheReference:");
}

id objc_msgSend_setCacheLimit_forCacheIdentifier_cacheReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheLimit:forCacheIdentifier:cacheReference:");
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:error:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setConnectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionState:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsetAdjustmentBehavior:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationScale:");
}

id objc_msgSend_setDeviceImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceImage:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDiscoveryMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryMode:");
}

id objc_msgSend_setEndpointRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointRoute:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFittingSize:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForegroundApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundApp:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHomeModuleAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeModuleAvailable:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInterGroupSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterGroupSpacing:");
}

id objc_msgSend_setInterItemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterItemSpacing:");
}

id objc_msgSend_setInterfaceRestorer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceRestorer:");
}

id objc_msgSend_setIsCurrentDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCurrentDestination:");
}

id objc_msgSend_setIsDismissingTeachableMoment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDismissingTeachableMoment:");
}

id objc_msgSend_setLayoutElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutElement:");
}

id objc_msgSend_setLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocal:");
}

id objc_msgSend_setLockupContainingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockupContainingViewController:");
}

id objc_msgSend_setLockupView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockupView:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuted:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsReload(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsReload];
}

id objc_msgSend_setNowPlayingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowPlayingBundleIdentifier:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOriginatingFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatingFrame:");
}

id objc_msgSend_setOrthogonalScrollingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrthogonalScrollingBehavior:");
}

id objc_msgSend_setOverrideTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideTitle:");
}

id objc_msgSend_setPendingSelectedMediaDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingSelectedMediaDestination:");
}

id objc_msgSend_setPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackState:");
}

id objc_msgSend_setPlayerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerPath:");
}

id objc_msgSend_setPlayingItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayingItemProperties:");
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFramesPerSecond:");
}

id objc_msgSend_setPresenting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresenting:");
}

id objc_msgSend_setRemembersLastFocusedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemembersLastFocusedIndexPath:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoute:");
}

id objc_msgSend_setRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteUID:");
}

id objc_msgSend_setRoutingContextUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoutingContextUID:");
}

id objc_msgSend_setScrollDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDirection:");
}

id objc_msgSend_setSelectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionState:");
}

id objc_msgSend_setShowTeachableMoment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTeachableMoment:");
}

id objc_msgSend_setSingleLineTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSingleLineTitle:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStartupContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartupContext:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setTargetSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetSessionID:");
}

id objc_msgSend_setTeachableMomentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTeachableMomentViewController:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTracklistRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTracklistRange:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVolume_withNotificationDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolume:withNotificationDelay:");
}

id objc_msgSend_setVolumeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeValue:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_analyticsReporterClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_analyticsReporterClass:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsWithDuration:");
}

id objc_msgSend_settingsWithDuration_timingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsWithDuration:timingFunction:");
}

id objc_msgSend_settingsWithMass_stiffness_damping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsWithMass:stiffness:damping:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPineBoardServicesPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPineBoardServicesPreferences];
}

id objc_msgSend_shouldEnableModuleWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnableModuleWithInfo:");
}

id objc_msgSend_shouldShowAirPodsModule(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowAirPodsModule];
}

id objc_msgSend_shouldShowGameControllerModule(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowGameControllerModule];
}

id objc_msgSend_showTeachableMoment(void *a1, const char *a2, ...)
{
  return _[a1 showTeachableMoment];
}

id objc_msgSend_sizeWithWidthDimension_heightDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithWidthDimension:heightDimension:");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_song(void *a1, const char *a2, ...)
{
  return _[a1 song];
}

id objc_msgSend_sortDescriptorWithKey_ascending_comparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:comparator:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedModuleInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedModuleInfos:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_spatialAudioSupported(void *a1, const char *a2, ...)
{
  return _[a1 spatialAudioSupported];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimationAfterDelay:");
}

id objc_msgSend_startConnectionMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startConnectionMonitoring];
}

id objc_msgSend_startupContext(void *a1, const char *a2, ...)
{
  return _[a1 startupContext];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stiffness(void *a1, const char *a2, ...)
{
  return _[a1 stiffness];
}

id objc_msgSend_stopConnectionMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopConnectionMonitoring];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsGrouping(void *a1, const char *a2, ...)
{
  return _[a1 supportsGrouping];
}

id objc_msgSend_supportsMultipleSelection(void *a1, const char *a2, ...)
{
  return _[a1 supportsMultipleSelection];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemMenuDidRequestDismissalAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemMenuDidRequestDismissalAnimated:withCompletion:");
}

id objc_msgSend_systemMenuManagerRequestedDismissal_animated_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemMenuManagerRequestedDismissal:animated:result:");
}

id objc_msgSend_systemRoute(void *a1, const char *a2, ...)
{
  return _[a1 systemRoute];
}

id objc_msgSend_systemRouteWithContextUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRouteWithContextUID:");
}

id objc_msgSend_teachableMomentViewController(void *a1, const char *a2, ...)
{
  return _[a1 teachableMomentViewController];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _[a1 timeLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_totalAvailableModuleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 totalAvailableModuleIdentifiers];
}

id objc_msgSend_trackCount(void *a1, const char *a2, ...)
{
  return _[a1 trackCount];
}

id objc_msgSend_trackNumber(void *a1, const char *a2, ...)
{
  return _[a1 trackNumber];
}

id objc_msgSend_tracklist(void *a1, const char *a2, ...)
{
  return _[a1 tracklist];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transitionContextWithAnimationSettings_animationFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionContextWithAnimationSettings:animationFence:");
}

id objc_msgSend_transitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionDuration:");
}

id objc_msgSend_tvnp_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvnp_deviceType");
}

id objc_msgSend_tvs_BOOLForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvs_BOOLForKey:defaultValue:");
}

id objc_msgSend_tvs_previousRemoteType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvs_previousRemoteType");
}

id objc_msgSend_tvsm_layoutElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvsm_layoutElement");
}

id objc_msgSend_tvsm_synchronizedDrawingFence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tvsm_synchronizedDrawingFence");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_untransformedPlatterFrameInCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "untransformedPlatterFrameInCoordinateSpace:");
}

id objc_msgSend_updateAvailableModules(void *a1, const char *a2, ...)
{
  return _[a1 updateAvailableModules];
}

id objc_msgSend_updateElement_withTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateElement:withTransitionContext:");
}

id objc_msgSend_updateLocalAccessoryAudioDestination_forceUpdateWithUnavailableDestination_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:");
}

id objc_msgSend_updateWithGroupLeader_members_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithGroupLeader:members:");
}

id objc_msgSend_updateWithMediaDestination_selectionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithMediaDestination:selectionState:");
}

id objc_msgSend_updateWithOutputDevice_selectionState_destination_wantsVolumeUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithOutputDevice:selectionState:destination:wantsVolumeUpdates:");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForKey:");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_volumeControlTargetDeviceType(void *a1, const char *a2, ...)
{
  return _[a1 volumeControlTargetDeviceType];
}

id objc_msgSend_volumeValue(void *a1, const char *a2, ...)
{
  return _[a1 volumeValue];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}