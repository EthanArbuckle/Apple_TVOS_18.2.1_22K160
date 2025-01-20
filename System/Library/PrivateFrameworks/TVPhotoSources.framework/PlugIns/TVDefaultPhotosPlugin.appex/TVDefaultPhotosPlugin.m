}

void sub_100001D2C(uint64_t a1, void *a2)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionIdentifier]);
      unsigned __int8 v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

      if ((v11 & 1) != 0) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        id v5 = v3;
        goto LABEL_12;
      }
    }

    id v5 = v9;

    if (!v5) {
      goto LABEL_13;
    }
    v12 = *(void **)(a1 + 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteURL]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100001EE4;
    v14[3] = &unk_1000041E8;
    id v16 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 48);
    [v12 _photoAssetsFromRemoteURL:v13 completion:v14];
  }

LABEL_12:
LABEL_13:
}

id sub_100001EE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) _notificationForExtensionRequestWithItems:0];
}

id sub_100002058(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return [*(id *)(a1 + 32) _notificationForExtensionRequestWithItems:0];
}

void sub_100002388( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_1000023A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000023B8(uint64_t a1)
{
}

void sub_1000023C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = v7;
  if (v8)
  {
    id v24 = v4;
    v9 = (os_log_s *)qword_1000082A8;
    if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received assets info for collection from url %{public}@",  buf,  0xCu);
    }

    id v23 = v8;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"imageURLs"]);
    id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v14);
          id v16 = objc_alloc_init(&OBJC_CLASS___TVMutablePhotoAsset);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stringByReplacingOccurrencesOfString:@"Collections.plist" withString:v15]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));
          [v16 setFullResolutionURL:v18];

          __int128 v19 = *(void **)(a1 + 40);
          id v20 = [v16 copy];
          [v19 addObject:v20];

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v12);
    }

    id v8 = v23;
    id v4 = v24;
  }

  uint64_t v21 = *(void *)(a1 + 48);
  if (v21)
  {
    id v22 = [*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v22);
  }
}

void sub_1000028B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000028DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = v7;
  if (v8)
  {
    v9 = (os_log_s *)qword_1000082A8;
    if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received collections info from url %{public}@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Collections"]);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(a1 + 32);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) _photoCollectionFromExternalDict:*(void *)(*((void *)&v20 + 1) + 8 * (void)v15) photoCollectionRemoteURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)]);
          [v16 addObject:v17];

          uint64_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v13);
    }
  }

  uint64_t v18 = *(void *)(a1 + 48);
  if (v18)
  {
    id v19 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v19);
  }
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}