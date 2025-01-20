void sub_4254(id a1)
{
  MRAPRecordingEndpoint *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___MRAPRecordingEndpoint);
  v2 = (void *)qword_D298;
  qword_D298 = (uint64_t)v1;
}

uint64_t sub_4404(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_4414(uint64_t a1)
{
}

void sub_441C(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16LL);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8LL * (void)v7)) {
          -[NSMutableArray addObject:](v2, "addObject:", (void)v10);
        }
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v2;
}

id sub_45BC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addPointer:*(void *)(a1 + 40)];
}

void sub_4644(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0LL;
    uint64_t v6 = *(void *)v10;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8LL * (void)i) == *(void *)(a1 + 40)) {
          uint64_t v7 = (uint64_t)i + v5;
        }
      }

      v5 += (uint64_t)v4;
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removePointerAtIndex:", v7, (void)v9);
      [*(id *)(*(void *)(a1 + 32) + 16) compact];
    }
  }

  else
  {
  }
}

void sub_47DC(uint64_t a1)
{
  id v2 = -[NSPointerArray initWithOptions:](objc_alloc(&OBJC_CLASS___NSPointerArray), "initWithOptions:", 5LL);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

id sub_482C(uint64_t a1, void *a2)
{
  return [a2 _inputDeviceConnectedWithDeviceID:a1];
}

id sub_4838(uint64_t a1, void *a2)
{
  return [a2 _inputDeviceDisconnectedWithDeviceID:a1];
}

id sub_4844(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_voiceDataReceivedForDeviceWithID:withBuffer:time:gain:", a1, a2);
}

void sub_4C28( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_529C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_52EC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_552C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_553C(uint64_t a1)
{
}

void sub_5544(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_5644(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0LL;
}

void sub_5914(uint64_t a1, void *a2)
{
  v26 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v4 = -[NSMutableOrderedSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableOrderedSet),  "initWithArray:",  *(void *)(*(void *)(a1 + 32) + 8LL));
  v25 = -[NSMutableOrderedSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableOrderedSet),  "initWithArray:",  *(void *)(*(void *)(a1 + 32) + 8LL));
  id v5 = a2;
  uint64_t v7 = _MRLogForCategory(5LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v38 = [v5 count];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[AudioPlugin] Loaded %lu devices", buf, 0xCu);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_5C10;
        v31[3] = &unk_8340;
        v31[4] = v14;
        id v15 = -[NSMutableOrderedSet indexOfObjectPassingTest:](v4, "indexOfObjectPassingTest:", v31);
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = -[MRAPInputDevice initWithInputDevice:]( objc_alloc(&OBJC_CLASS___MRAPInputDevice),  "initWithInputDevice:",  v14);
          -[NSMutableOrderedSet addObject:](v26, "addObject:", v16);
        }

        else
        {
          -[NSMutableOrderedSet removeObjectAtIndex:](v4, "removeObjectAtIndex:", v15);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v11);
  }

  -[NSMutableOrderedSet minusOrderedSet:](v25, "minusOrderedSet:", v4);
  -[NSMutableOrderedSet unionOrderedSet:](v25, "unionOrderedSet:", v26);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v25, "array"));
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 8);
  *(void *)(v18 + 8) = v17;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  if (WeakRetained)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_5C48;
    block[3] = &unk_8368;
    v23 = v4;
    uint64_t v24 = *(void *)(a1 + 32);
    v28 = v23;
    uint64_t v29 = v24;
    v30 = v26;
    dispatch_async(v22, block);
  }
}

BOOL sub_5C10(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 mediaRemoteDeviceID];
  return v3 == MRVirtualVoiceInputDeviceGetUniqueIdentifier(*(void *)(a1 + 32), v4);
}

void sub_5C48(uint64_t a1)
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v6);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24LL));
        [WeakRetained inputPlugin:*(void *)(a1 + 40) didUnpublishDevice:v7];

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v4);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = *(id *)(a1 + 48);
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v13);
        id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24LL));
        objc_msgSend(v15, "inputPlugin:didPublishDevice:", *(void *)(a1 + 40), v14, (void)v16);

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v11);
  }
}

void sub_5EB8(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8LL);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (objc_msgSend(v7, "mediaRemoteDeviceID", (void)v8) == *(_DWORD *)(a1 + 48))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v7);
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

void sub_6160( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_61C8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6230( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6298( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6300(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( &dword_0,  log,  OS_LOG_TYPE_DEBUG,  "[AudioPluginDevice] Warning: no audio input block set. dropping voice data buffer.",  v1,  2u);
}

void sub_6340(int a1, os_log_s *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "[AudioPlugin] Unknown audio device with ID %{public}d",  (uint8_t *)v2,  8u);
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionOrderedSet:");
}