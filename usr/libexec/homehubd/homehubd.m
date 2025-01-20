}

id sub_100002640()
{
  if (qword_10002E550 != -1) {
    dispatch_once(&qword_10002E550, &stru_1000246F8);
  }
  return (id)qword_10002E548;
}

id sub_1000029CC(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 endpoint]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoryId]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryId]);
  id v6 = [v4 isEqual:v5];

  return v6;
}

LABEL_9:
    goto LABEL_10;
  }

  -[HHDClockApp _player:needsToPlay:](self, "_player:needsToPlay:", v4, 1LL);
LABEL_10:
}

void sub_100003664( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000368C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = sub_100002640();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained endpoint]);
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
      uint64_t v8 = SIBSApplicationForegroundRevocationReasonAsString(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 138412802;
      v11 = &stru_100024E50;
      __int16 v12 = 2114;
      v13 = v7;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@Foreground assertion revoked for endpoint %{public}@: %{public}@",  (uint8_t *)&v10,  0x20u);
    }

    [WeakRetained setForegroundAssertion:0];
  }
}

void sub_1000039EC(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = sub_100002640();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      v11 = &stru_100024E50;
      __int16 v12 = 2112;
      v13 = v2;
      id v6 = "%@Failed to update app state: %@";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = &stru_100024E50;
    id v6 = "%@Successfully updated app state";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void sub_100003C4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100003C68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      [*(id *)(a1 + 40) floatValue];
      int v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100003DB8;
      v12[3] = &unk_1000245F0;
      v13 = (os_log_s *)*(id *)(a1 + 32);
      LODWORD(v8) = v6;
      [v3 setVolume:v7 queue:v12 completion:v8];
      uint32_t v9 = v13;
    }

    else
    {
      id v10 = sub_100002640();
      uint32_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v15 = &stru_100024E50;
        __int16 v16 = 2114;
        uint64_t v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@Failed to get media device endpoint %{public}@",  buf,  0x16u);
      }
    }
  }
}

void sub_100003DB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100002640();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138412802;
      __int16 v14 = &stru_100024E50;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      id v18 = v3;
      double v8 = "%@Unable to set volume for media device endpoint %{public}@: %@";
      uint32_t v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412546;
    __int16 v14 = &stru_100024E50;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    double v8 = "%@Finished setting volume for %{public}@";
    uint32_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

id sub_1000041FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _player:*(void *)(a1 + 40) needsToPlay:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000043E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000440C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v9 = sub_100002640();
    id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138412802;
      __int16 v15 = &stru_100024E50;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  WeakRetained,  OS_LOG_TYPE_ERROR,  "%@Foreground request for endpoint %{public}@ failed: %@",  (uint8_t *)&v14,  0x20u);
    }
  }

  else
  {
    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      [*(id *)(a1 + 40) _handleForegroundForPlayer:WeakRetained assertion:v5];
    }

    else
    {
      id v11 = sub_100002640();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 138412546;
        __int16 v15 = &stru_100024E50;
        __int16 v16 = 2114;
        uint64_t v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Player with endpoint %{public}@ has gone away",  (uint8_t *)&v14,  0x16u);
      }

      [v5 invalidate];
    }
  }
}

id sub_100004630(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) previousReason];
  if (result != *(id *)(a1 + 48))
  {
    id v3 = result;
    objc_msgSend(*(id *)(a1 + 32), "setPreviousReason:");
    id v4 = sub_100002640();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpoint]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 138413058;
      uint64_t v10 = &stru_100024E50;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      id v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@Player %{public}@ reason updated to %ld (previous: %ld)",  (uint8_t *)&v9,  0x2Au);
    }

    return [*(id *)(a1 + 40) _updateStateForPlayer:*(void *)(a1 + 32) reason:*(void *)(a1 + 48)];
  }

  return result;
}

void sub_100004958(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"Audio/Video"] && *(void *)(a1 + 40))
  {
    id v2 = sub_100002640();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) endpoint]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
      int v10 = 138412546;
      __int16 v11 = &stru_100024E50;
      __int16 v12 = 2114;
      __int16 v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@Setting volume for endpoint %{public}@",  (uint8_t *)&v10,  0x16u);
    }

    [*(id *)(a1 + 56) _setVolume:*(void *)(a1 + 40) forPlayer:*(void *)(a1 + 48)];
  }

  else
  {
    id v6 = sub_100002640();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      __int16 v11 = &stru_100024E50;
      __int16 v12 = 2114;
      __int16 v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@Ignoring set volume request for category %{public}@, level %{public}@",  (uint8_t *)&v10,  0x20u);
    }
  }

void sub_100004B48(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "HHDClockApp");
  id v2 = (void *)qword_10002E548;
  qword_10002E548 = (uint64_t)v1;
}

void sub_100004F7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
}

id sub_100004FB8()
{
  if (qword_10002E560 != -1) {
    dispatch_once(&qword_10002E560, &stru_100024780);
  }
  return (id)qword_10002E558;
}

void sub_100004FF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 _handleConnectionInvalidation:WeakRetained];
}

void sub_1000053D4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004FB8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[6];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 blockInvocationDescription]);
    int v9 = 138413058;
    int v10 = &stru_100024E50;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@Sending reply for request %@ (conn=%p): %@",  (uint8_t *)&v9,  0x2Au);
  }

  [v3 setTarget:a1[5]];
  [v3 invoke];
}

void sub_100005B34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "XPCClientManager");
  id v2 = (void *)qword_10002E558;
  qword_10002E558 = (uint64_t)v1;
}

void sub_100005B64(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___HHManagement));
  id v2 = (void *)qword_10002E568;
  qword_10002E568 = v1;
}

void sub_100005B98(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___HHManagementEventListener));
  id v2 = (void *)qword_10002E578;
  qword_10002E578 = v1;
}

id sub_100005EA4()
{
  if (qword_10002E590 != -1) {
    dispatch_once(&qword_10002E590, &stru_1000247E8);
  }
  return (id)qword_10002E588;
}

LABEL_11:
  int v10 = sub_100005EA4();
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = &stru_100024E50;
    __int16 v18 = 1024;
    v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@Daemon needs keep-alive: %{BOOL}d",  buf,  0x12u);
  }

  -[HHDKeepAliveManager _updateKeepAliveState:](self, "_updateKeepAliveState:", v7);
}

  return v6;
}

  return v7;
}

void sub_100006578(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "KeepAliveManager");
  id v2 = (void *)qword_10002E588;
  qword_10002E588 = (uint64_t)v1;
}

CFStringRef sub_1000065A8(unint64_t a1)
{
  if (a1 > 2) {
    return @"???";
  }
  else {
    return off_100024808[a1];
  }
}

void sub_100006790(_Unwind_Exception *a1)
{
}

void sub_100006904(_Unwind_Exception *a1)
{
}

uint64_t sub_10000691C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0LL;
  id v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      sub_100006998((uint64_t **)a1, v4, a2, a2);
      a2 += 2;
      v6 -= 16LL;
    }

    while (v6);
  }

  return a1;
}

void sub_100006980(_Unwind_Exception *a1)
{
}

uint64_t *sub_100006998(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  uint64_t v6 = (void **)sub_100006A1C(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    sub_100006BC4(a1, v11, v8, v7);
  }

  return v7;
}

void *sub_100006A1C(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  id v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v8)
    {
      int v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        int v9 = (void *)v9[1];
      }

      while (v9);
    }

    else
    {
      __int16 v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        __int16 v13 = v10;
      }

      while (v14);
    }

    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    id v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          id v16 = (void *)*v17;
          id v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }

        if (v18 >= v15) {
          break;
        }
        id v5 = v17 + 1;
        id v16 = (void *)v17[1];
      }

      while (v16);
    }

    else
    {
      uint64_t v17 = a1 + 1;
    }

LABEL_29:
    *a3 = v17;
    return v5;
  }

  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }

  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }

    while (v12);
  }

  else
  {
    v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      v19 = a4;
    }

    while (!v14);
  }

  if (a4 != v5 && v6 >= a4[4])
  {
    v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          v20 = (void *)*v21;
          id v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }

        if (v22 >= v6) {
          break;
        }
        id v5 = v21 + 1;
        v20 = (void *)v21[1];
      }

      while (v20);
    }

    else
    {
      v21 = a1 + 1;
    }

LABEL_48:
    *a3 = v21;
    return v5;
  }

  if (v11)
  {
    *a3 = a4;
  }

  else
  {
    *a3 = a2;
    return a2 + 1;
  }

  return a4;
}

uint64_t *sub_100006BC4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  id result = sub_100006C18(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100006C18(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      id v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      id v3 = (uint64_t *)v2[2];
      id v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }

          else
          {
            int v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              id v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            id v3 = v9[2];
            id v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            id v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          id v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        id v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_100006DB0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100006DB0(a1, *a2);
    sub_100006DB0(a1, a2[1]);
    operator delete(a2);
  }

id sub_100006DF0(unint64_t a1, void *a2)
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  unint64_t v18 = sub_100006F24;
  v19 = sub_100006F34;
  id v20 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  uint64_t v10 = sub_100006F3C;
  uint64_t v11 = &unk_100024828;
  id v3 = a2;
  uint64_t v4 = 0LL;
  uint64_t v13 = &v15;
  unint64_t v14 = a1;
  id v12 = v3;
  char v21 = 0;
  char v5 = 1;
  do
  {
    a1 = a1 & 0xFFFFFFFFFFFF0000LL | word_10001B1D8[v4];
    v10(v9, a1, &v21);
    char v6 = v5 & (v21 == 0);
    uint64_t v4 = 1LL;
    char v5 = 0;
  }

  while ((v6 & 1) != 0);
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_100006F0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_100006F24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006F34(uint64_t a1)
{
}

void sub_100006F3C(void *a1, __int16 a2, _BYTE *a3)
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)a1[4], (SEL)a1[6], a2 & 1, a2 & 0x100);
  if (MethodDescription.name)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  MethodDescription.types));
    uint64_t v7 = *(void *)(a1[5] + 8LL);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a3 = 1;
  }

void sub_10000732C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "HHDDoorbellApp");
  id v2 = (void *)qword_10002E5D8;
  qword_10002E5D8 = (uint64_t)v1;
}

id sub_100007568()
{
  if (qword_10002E5F0 != -1) {
    dispatch_once(&qword_10002E5F0, &stru_1000248B8);
  }
  return (id)qword_10002E5E8;
}

void sub_1000075A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000076A0;
  block[3] = &unk_100024870;
  id v16 = v7;
  uint64_t v10 = *(dispatch_queue_s **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v19 = v8;
  id v20 = v11;
  id v18 = v9;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(v10, block);
}

void sub_1000076A0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = sub_100007568();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      id v14 = &stru_100024E50;
      __int16 v15 = 2114;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      uint64_t v6 = "%@Failed to find endpoint with identifier %{public}@: %@";
      id v7 = v3;
      uint32_t v8 = 32;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
    }
  }

  else
  {
    if (*(void *)(a1 + 48) && [*(id *)(a1 + 56) count])
    {
      uint64_t v9 = *(void *)(a1 + 64);
      id v12 = -[HHDMediaEndpoint initWithMRAVEndpoint:targetIdentifier:]( objc_alloc(&OBJC_CLASS___HHDMediaEndpoint),  "initWithMRAVEndpoint:targetIdentifier:",  *(void *)(a1 + 48),  *(void *)(a1 + 40));
      (*(void (**)(uint64_t))(v9 + 16))(v9);

      return;
    }

    id v10 = sub_100007568();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v14 = &stru_100024E50;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      uint64_t v6 = "%@Failed to find endpoint or devices for %{public}@";
      id v7 = v3;
      uint32_t v8 = 22;
      goto LABEL_9;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_1000078C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "HHDMediaEndpointBrowser");
  id v2 = (void *)qword_10002E5E8;
  qword_10002E5E8 = (uint64_t)v1;
}

id sub_100007F64()
{
  if (qword_10002E600 != -1) {
    dispatch_once(&qword_10002E600, &stru_100024928);
  }
  return (id)qword_10002E5F8;
}

void sub_100008BB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100007F64();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    __int16 v15 = &stru_100024E50;
    __int16 v16 = 2114;
    __int16 v17 = v6;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%@Deactivation triggered on deletion for endpoint %{public}@ completed with error %@",  buf,  0x20u);
  }

  id v7 = *(void **)(*(void *)(a1 + 40) + 16LL);
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) launchInstanceId]);
  id v13 = 0LL;
  [v7 deleteBubbleWithIdentifier:v8 error:&v13];
  id v9 = v13;

  if (v9)
  {
    id v10 = sub_100007F64();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) launchInstanceId]);
      *(_DWORD *)buf = 138412802;
      __int16 v15 = &stru_100024E50;
      __int16 v16 = 2114;
      __int16 v17 = v12;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%@Failed to delete instance %{public}@ with error %@",  buf,  0x20u);
    }
  }
}

LABEL_13:
  if (a4 && !v8)
  {
    __int16 v16 = sub_100007F64();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      v25 = 2114;
      v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@Failed to retrieve endpoint with id %{public}@",  buf,  0x16u);
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  5LL,  @"Endpoint id not found."));
  }

  return v8;
}

  if (a4 && !v8)
  {
    __int16 v16 = sub_10000B5F4();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_100024E50;
      v25 = 2114;
      v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@Failed to retrieve bubble with id %{public}@",  buf,  0x16u);
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  5LL,  @"Bubble id not found."));
  }

  return v8;
}

void sub_1000094E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = sub_100007F64();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v12 = &stru_100024E50;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Failed to deactivate endpoint with identifier %{public}@",  buf,  0x16u);
    }
  }

  else if (*(_BYTE *)(a1 + 72))
  {
    [*(id *)(a1 + 40) setState:1];
    uint64_t v9 = *(void *)(a1 + 40);
    uint32_t v8 = *(void **)(a1 + 48);
    id v10 = 0LL;
    [v8 _updateStateForEndpoint:v9 changeType:1 error:&v10];
    id v4 = v10;
  }

  else
  {
    id v4 = 0LL;
  }

  [*(id *)(a1 + 40) setOperationInProgress:0];
  [*(id *)(a1 + 56) endAndSendWithError:v4 eventBuilder:0];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

LABEL_14:
  __int16 v15 = 0;
LABEL_15:

  return v15;
}

void sub_100009C84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "EndpointManager");
  id v2 = (void *)qword_10002E5F8;
  qword_10002E5F8 = (uint64_t)v1;
}

id sub_10000ADFC()
{
  if (qword_10002E610 != -1) {
    dispatch_once(&qword_10002E610, &stru_100024948);
  }
  return (id)qword_10002E608;
}

void sub_10000AF64(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "KeepAliveFileManager");
  id v2 = (void *)qword_10002E608;
  qword_10002E608 = (uint64_t)v1;
}

id sub_10000B220()
{
  if (qword_10002E620 != -1) {
    dispatch_once(&qword_10002E620, &stru_100024968);
  }
  return (id)qword_10002E618;
}

void sub_10000B3C8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "ManagementServer");
  id v2 = (void *)qword_10002E618;
  qword_10002E618 = (uint64_t)v1;
}

id sub_10000B5F4()
{
  if (qword_10002E630 != -1) {
    dispatch_once(&qword_10002E630, &stru_1000249F0);
  }
  return (id)qword_10002E628;
}

void sub_10000BC78(void *a1, void *a2)
{
  if (a2)
  {
    id v4 = a2;
    id v5 = sub_10000B5F4();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[4];
      int v10 = 138412546;
      uint64_t v11 = &stru_100024E50;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Failed to deactivate bubble with identifier %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    uint32_t v8 = (void *)a1[5];
    id v9 = 0LL;
    [v8 setState:1];
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

BOOL sub_10000C0D4(id a1, HHDBubble *a2, NSDictionary *a3)
{
  return (id)-[HHDBubble state](a2, "state", a3) == (id)2;
}

void sub_10000C360(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "BubbleManager");
  id v2 = (void *)qword_10002E628;
  qword_10002E628 = (uint64_t)v1;
}

id sub_10000C52C()
{
  if (qword_10002E640 != -1) {
    dispatch_once(&qword_10002E640, &stru_100024A38);
  }
  return (id)qword_10002E638;
}

void sub_10000C9D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000C9F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSiriVoiceTriggerModelChanged];
}

void sub_10000D0D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "AssetManager");
  id v2 = (void *)qword_10002E638;
  qword_10002E638 = (uint64_t)v1;
}

id sub_10000D39C()
{
  if (qword_10002E650 != -1) {
    dispatch_once(&qword_10002E650, &stru_100024A58);
  }
  return (id)qword_10002E648;
}

void sub_10000D630(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "ServiceRegistry");
  id v2 = (void *)qword_10002E648;
  qword_10002E648 = (uint64_t)v1;
}

id sub_10000D86C()
{
  if (qword_10002E660 != -1) {
    dispatch_once(&qword_10002E660, &stru_100024AA0);
  }
  return (id)qword_10002E658;
}

void sub_10000D8AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000D86C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 138412802;
      __int16 v16 = &stru_100024E50;
      __int16 v17 = 2114;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = v3;
      uint32_t v8 = "%@Failed to set volume for %{public}@: %@";
      id v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v15, v11);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v15 = 138412546;
    __int16 v16 = &stru_100024E50;
    __int16 v17 = 2114;
    uint64_t v18 = v12;
    uint32_t v8 = "%@Successfully set volume for %{public}@";
    id v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v3,  v13,  v14);
}

void sub_10000DA20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "HHDMediaEndpoint");
  id v2 = (void *)qword_10002E658;
  qword_10002E658 = (uint64_t)v1;
}

id sub_10000DC4C()
{
  if (qword_10002E670 != -1) {
    dispatch_once(&qword_10002E670, &stru_100024AE8);
  }
  return (id)qword_10002E668;
}

uint64_t sub_10000E0B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000EDB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "ClientProxy");
  id v2 = (void *)qword_10002E668;
  qword_10002E668 = (uint64_t)v1;
}

id sub_10000F1A4()
{
  if (qword_10002E680 != -1) {
    dispatch_once(&qword_10002E680, &stru_100024B30);
  }
  return (id)qword_10002E678;
}

LABEL_26:
      sqlite3_finalize(v6);
      goto LABEL_27;
    }

    unint64_t v22 = sqlite3_changes(self->_database);
    v23 = sub_10000F1A4();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    v24 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (v22 <= 0)
    {
      if (!v24) {
        goto LABEL_26;
      }
      v25 = (char *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v35 = 138412546;
      v36 = &stru_100024E50;
      v37 = 2114;
      v38 = v25;
      v26 = "%@[Instance Delete] Instance with id '%{public}@' deleted (but no rows modified)";
    }

    else
    {
      if (!v24) {
        goto LABEL_26;
      }
      v25 = (char *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v35 = 138412546;
      v36 = &stru_100024E50;
      v37 = 2114;
      v38 = v25;
      v26 = "%@[Instance Delete] Instance with id '%{public}@' deleted";
    }

    v32 = v28;
    v33 = OS_LOG_TYPE_INFO;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v32, v33, v26, (uint8_t *)&v35, 0x16u);

    goto LABEL_26;
  }

  uint32_t v11 = self->_database;
  uint64_t v12 = sub_10000F1A4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v14)
    {
      int v15 = sqlite3_errmsg(self->_database);
      v35 = 138412546;
      v36 = &stru_100024E50;
      v37 = 2080;
      v38 = v15;
      __int16 v16 = "%@[Instance Delete] Failed to prepare instance-delete statement; %s";
      __int16 v17 = v13;
      uint64_t v18 = 22;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v35, v18);
    }
  }

  else if (v14)
  {
    v35 = 138412290;
    v36 = &stru_100024E50;
    __int16 v16 = "%@[Instance Delete] Failed to prepare instance-delete statement[null database]";
    __int16 v17 = v13;
    uint64_t v18 = 12;
    goto LABEL_18;
  }

  char v21 = 0;
LABEL_27:

  return v21;
}

LABEL_30:
      sqlite3_finalize(v7);
      goto LABEL_31;
    }

    v24 = sqlite3_changes(self->_database);
    v25 = sub_10000F1A4();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    v26 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v24 <= 0)
    {
      if (!v26) {
        goto LABEL_30;
      }
      v27 = (char *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
      v37 = 138412546;
      v38 = &stru_100024E50;
      v39 = 2114;
      v40 = v27;
      v28 = "%@[Endpoint Delete] Endpoint with id '%{public}@' deleted (but no rows modified)";
    }

    else
    {
      if (!v26) {
        goto LABEL_30;
      }
      v27 = (char *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
      v37 = 138412546;
      v38 = &stru_100024E50;
      v39 = 2114;
      v40 = v27;
      v28 = "%@[Endpoint Delete] Endpoint with id '%{public}@' deleted";
    }

    v34 = v30;
    v35 = OS_LOG_TYPE_INFO;
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v34, v35, v28, (uint8_t *)&v37, 0x16u);

    goto LABEL_30;
  }

  __int16 v17 = self->_database;
  uint64_t v18 = sub_10000F1A4();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  __int16 v19 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (!v17)
  {
    if (!v19) {
      goto LABEL_12;
    }
    v37 = 138412290;
    v38 = &stru_100024E50;
    uint64_t v14 = "%@[Endpoint Delete] Failed to prepare endpoint-delete statement[null database]";
    goto LABEL_7;
  }

  if (v19)
  {
    id v20 = sqlite3_errmsg(self->_database);
    v37 = 138412546;
    v38 = &stru_100024E50;
    v39 = 2080;
    v40 = v20;
    uint64_t v14 = "%@[Endpoint Delete] Failed to prepare endpoint-delete statement; %s";
    int v15 = v13;
    __int16 v16 = 22;
    goto LABEL_11;
  }

LABEL_12:
  char v21 = 0;
LABEL_31:

  return v21;
}

void sub_100011314( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100011338(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v4 = sub_10000F1A4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        id v9 = sqlite3_errmsg(*(sqlite3 **)(v7 + 8));
        int v14 = 138412802;
        int v15 = &stru_100024E50;
        __int16 v16 = 1024;
        int v17 = v8;
        __int16 v18 = 2080;
        __int16 v19 = v9;
        os_log_type_t v10 = "%@[Upgrade] Failed during database upgrade (stage=%d); %s";
        uint32_t v11 = v5;
        uint32_t v12 = 28;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, v12);
      }
    }

    else if (v6)
    {
      int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      int v14 = 138412546;
      int v15 = &stru_100024E50;
      __int16 v16 = 1024;
      int v17 = v13;
      os_log_type_t v10 = "%@[Upgrade] Failed during database upgrade (stage=%d)[null database]";
      uint32_t v11 = v5;
      uint32_t v12 = 18;
      goto LABEL_7;
    }
  }

void sub_10001169C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "Persistence");
  id v2 = (void *)qword_10002E678;
  qword_10002E678 = (uint64_t)v1;
}

id sub_100011AE8()
{
  if (qword_10002E690 != -1) {
    dispatch_once(&qword_10002E690, &stru_100024CC8);
  }
  return (id)qword_10002E688;
}

void sub_1000121CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100011AE8();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accessoryId]);
      *(_DWORD *)buf = 138413058;
      id v20 = &stru_100024E50;
      __int16 v21 = 2114;
      unint64_t v22 = v7;
      __int16 v23 = 2114;
      v24 = v8;
      __int16 v25 = 2112;
      id v26 = v3;
      id v9 = "%@Failed to send command %{public}@ to session for endpoint %{public}@, %@";
      os_log_type_t v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) accessoryId]);
    *(_DWORD *)buf = 138412546;
    id v20 = &stru_100024E50;
    __int16 v21 = 2114;
    unint64_t v22 = v8;
    id v9 = "%@Stop command sent to session for endpoint %{public}@";
    os_log_type_t v10 = v6;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100012388;
  v16[3] = &unk_100024B90;
  int v13 = *(dispatch_queue_s **)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v17 = v3;
  id v18 = v14;
  id v15 = v3;
  dispatch_async(v13, v16);
}

uint64_t sub_100012388(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

id sub_100012450(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 endpoint]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoryId]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryId]);
  id v6 = [v4 isEqual:v5];

  return v6;
}

void sub_100012758( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100012780(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = sub_100011AE8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained endpoint]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
      uint64_t v8 = SIBSApplicationForegroundRevocationReasonAsString(a2);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 138412802;
      os_log_type_t v11 = &stru_100024E50;
      __int16 v12 = 2114;
      int v13 = v7;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@Foreground assertion revoked for endpoint %{public}@: %{public}@",  (uint8_t *)&v10,  0x20u);
    }

    [WeakRetained setForegroundAssertion:0];
  }
}

void sub_100012B74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100012BA0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = WeakRetained;
  if (!WeakRetained)
  {
    id v11 = sub_100011AE8();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    unint64_t v22 = &stru_100024E50;
    __int16 v12 = "%@Application was deallocated";
    int v13 = v10;
    uint32_t v14 = 12;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_10;
  }

  if (!v5 || v6)
  {
    id v15 = sub_100011AE8();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412546;
    unint64_t v22 = &stru_100024E50;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v12 = "%@Error when requesting foreground: %@";
    int v13 = v10;
    uint32_t v14 = 22;
    goto LABEL_9;
  }

  id v9 = WeakRetained[2];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100012D6C;
  v16[3] = &unk_1000246B8;
  id v17 = (os_log_s *)a1[4];
  id v18 = v8;
  id v19 = v5;
  id v20 = a1[5];
  dispatch_async(v9, v16);

  int v10 = v17;
LABEL_10:
}

void sub_100012D6C(uint64_t a1)
{
  id v2 = sub_100011AE8();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryId]);
    int v7 = 138412546;
    uint64_t v8 = &stru_100024E50;
    __int16 v9 = 2114;
    int v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@Foreground granted for: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  [*(id *)(a1 + 40) _setApplicationForegroundAssertion:*(void *)(a1 + 48) forEndpoint:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 56) state] == (id)3)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) announcementID]);
    [v5 _playAnnouncementWithID:v6 endpoint:*(void *)(a1 + 32)];
  }

void sub_1000130C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_100011AE8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = &stru_100024E50;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@Failed to send playback command. %@",  buf,  0x16u);
    }
  }

  id v6 = sub_100011AE8();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v17 = &stru_100024E50;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@Playback completed for session: %@",  buf,  0x16u);
  }

  __int16 v9 = *(void **)(a1 + 32);
  int v10 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 16LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100013254;
  v13[3] = &unk_100024C30;
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 40);
  id v14 = v11;
  uint64_t v15 = v12;
  dispatch_async(v10, v13);
}

void sub_100013254(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___SIBSIntercomStateUpdateRequest);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpoint]);
  id v4 = [v2 initWithEndpoint:v3 state:0 announcementID:0];

  [*(id *)(a1 + 40) _updateState:v4];
}

void sub_1000133EC(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___HHDIntercomLocalPlaybackSession, v2);
  char isKindOfClass = objc_opt_isKindOfClass(v1, v3);

  if ((isKindOfClass & 1) == 0 || !v1)
  {
    id v5 = sub_100011AE8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Session interrupted for unknown session",  (uint8_t *)&v7,  0xCu);
    }
  }

void sub_1000135E8(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___HHDIntercomLocalPlaybackSession, v2);
  char isKindOfClass = objc_opt_isKindOfClass(v1, v3);

  if ((isKindOfClass & 1) == 0 || !v1)
  {
    id v5 = sub_100011AE8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Session invalidated for unknown session",  (uint8_t *)&v7,  0xCu);
    }
  }

void sub_1000138CC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HHDIntercomLocalPlaybackSession, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  if (v6)
  {
    if (*(void *)(a1 + 48) >= 3uLL) {
      uint64_t v7 = -1LL;
    }
    else {
      uint64_t v7 = *(void *)(a1 + 48);
    }
    id v8 = objc_alloc(&OBJC_CLASS___SIBSIntercomStateUpdateRequest);
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
    id v10 = [v8 initWithEndpoint:v9 state:v7 announcementID:0];

    [*(id *)(a1 + 40) _updateState:v10];
  }

  else
  {
    id v11 = sub_100011AE8();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@Received State Update callback for unknown session",  (uint8_t *)&v13,  0xCu);
    }
  }
}

void sub_100013B84(id *a1)
{
  id v2 = a1[4];
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___HHDIntercomLocalPlaybackSession, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;

  if (v6)
  {
    if ([v6 playbackState])
    {
      id v7 = sub_100011AE8();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = a1[4];
        int v15 = 138412546;
        __int16 v16 = &stru_100024E50;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@Session %@ already playing. Ignoring.",  (uint8_t *)&v15,  0x16u);
      }
    }

    else
    {
      id v12 = objc_alloc(&OBJC_CLASS___SIBSIntercomStateUpdateRequest);
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([a1[5] announcementID]);
      id v8 = (os_log_s *)[v12 initWithEndpoint:v13 state:3 announcementID:v14];

      [a1[6] _updateState:v8];
    }
  }

  else
  {
    id v10 = sub_100011AE8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      __int16 v16 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@Received Announcement callback for unknown session",  (uint8_t *)&v15,  0xCu);
    }
  }
}

void sub_100013DAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "HHDIntercomApp");
  id v2 = (void *)qword_10002E688;
  qword_10002E688 = (uint64_t)v1;
}

id sub_1000141A4()
{
  if (qword_10002E6A0 != -1) {
    dispatch_once(&qword_10002E6A0, &stru_100024CE8);
  }
  return (id)qword_10002E698;
}

void sub_100014924(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "SideBoardManager");
  id v2 = (void *)qword_10002E698;
  qword_10002E698 = (uint64_t)v1;
}

void start(int a1, uint64_t a2)
{
  if (a1 == 2)
  {
    if (!strcmp(*(const char **)(a2 + 8), "-launchd"))
    {
      uint64_t v3 = HHUDispatchQueueCreateWithQoSFloorAndAutoreleasePool("com.apple.homehubd.main", 21LL);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      id v5 = objc_autoreleasePoolPush();
      sub_100014E9C();
      sub_100014BF8();
      id v6 = -[HHDDaemonServiceRegistry initWithQueue:]( objc_alloc(&OBJC_CLASS___HHDDaemonServiceRegistry),  "initWithQueue:",  v4);
      objc_autoreleasePoolPop(v5);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100014C90;
      v15[3] = &unk_100024C30;
      v15[4] = v6;
      dispatch_queue_t v16 = v4;
      dispatch_async(v16, v15);
      dispatch_main();
    }

    sub_100014BF8();
    id v13 = sub_100014C50();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      exit(64);
    }

    uint64_t v14 = *(void *)(a2 + 8);
    *(_DWORD *)buf = 138412546;
    id v18 = &stru_100024E50;
    __int16 v19 = 2082;
    uint64_t v20 = v14;
    id v10 = "%@invoked with unknown argument: %{public}s";
    id v11 = (os_log_s *)v9;
    uint32_t v12 = 22;
  }

  else
  {
    sub_100014BF8();
    id v8 = sub_100014C50();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412546;
    id v18 = &stru_100024E50;
    __int16 v19 = 1024;
    LODWORD(v20) = a1;
    id v10 = "%@Unexpected argument count, exiting: %d";
    id v11 = (os_log_s *)v9;
    uint32_t v12 = 18;
  }

  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
  goto LABEL_9;
}

uint64_t sub_100014BF8()
{
  uint64_t result = isatty(1);
  if ((_DWORD)result)
  {
    os_log_t v1 = __stdoutp;
    id v2 = getprogname();
    fprintf(v1, "%s cannot be run directly.\n", v2);
    exit(78);
  }

  return result;
}

id sub_100014C50()
{
  if (qword_10002E6B0 != -1) {
    dispatch_once(&qword_10002E6B0, &stru_100024D18);
  }
  return (id)qword_10002E6A8;
}

void sub_100014C90(uint64_t a1)
{
  id v2 = sub_100014C50();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v12) = 138412290;
    *(void *)((char *)&v12 + 4) = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@Posting daemon ready notification",  (uint8_t *)&v12,  0xCu);
  }

  if (notify_post("com.apple.homehubd.ready"))
  {
    id v4 = sub_100014C50();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v12) = 138412290;
      *(void *)((char *)&v12 + 4) = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%@Failed to post daemon ready notification",  (uint8_t *)&v12,  0xCu);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) managementServer]);
  [v6 start];

  id v7 = *(dispatch_queue_s **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v7);
  id v10 = (void *)qword_10002E6B8;
  qword_10002E6B8 = (uint64_t)v9;

  id v11 = (dispatch_source_s *)qword_10002E6B8;
  if (qword_10002E6B8)
  {
    *(void *)&__int128 v12 = _NSConcreteStackBlock;
    *((void *)&v12 + 1) = 3221225472LL;
    id v13 = sub_100014FD0;
    uint64_t v14 = &unk_100024C80;
    id v15 = v8;
    dispatch_source_set_event_handler(v11, &v12);
    dispatch_activate((dispatch_object_t)qword_10002E6B8);
    signal(15, (void (__cdecl *)(int))1);
  }
}

void sub_100014E6C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "default");
  id v2 = (void *)qword_10002E6A8;
  qword_10002E6A8 = (uint64_t)v1;
}

void sub_100014E9C()
{
  id v0 = sub_100014C50();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = &stru_100024E50;
    __int16 v8 = 2080;
    dispatch_source_t v9 = "com.apple.homehubd";
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%@Setting temporary directory suffix to %s",  (uint8_t *)&v6,  0x16u);
  }

  _set_user_dir_suffix("com.apple.homehubd");
  id v2 = NSTemporaryDirectory();
  uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_100014C50();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = &stru_100024E50;
    __int16 v8 = 2112;
    dispatch_source_t v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@Temporary directory set to: %@",  (uint8_t *)&v6,  0x16u);
  }
}

uint64_t sub_100014FD0(uint64_t a1)
{
  id v2 = sub_100014C50();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = &stru_100024E50;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%@SIGTERM received, stopping daemon",  (uint8_t *)&v5,  0xCu);
  }

  return xpc_transaction_exit_clean([*(id *)(a1 + 32) stopAllServices]);
}

void sub_100015138(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS____HHDPlistReader);
  id v2 = (void *)qword_10002E6C0;
  qword_10002E6C0 = (uint64_t)v1;
}

id sub_1000153D4()
{
  if (qword_10002E6D8 != -1) {
    dispatch_once(&qword_10002E6D8, &stru_100024DB0);
  }
  return (id)qword_10002E6D0;
}

void sub_100015D8C(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
  {
    uint64_t v3 = xpc_strerror(a2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) launchdJobName]);
    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to remove job %{public}@ with error %s",  v4,  v3));
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:underlyingError:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:underlyingError:description:",  4LL,  0LL,  v5));

    id v7 = sub_1000153D4();
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) launchdJobName]);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = &stru_100024E50;
      __int16 v15 = 2114;
      dispatch_queue_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@Failed to remove job %{public}@ with error %s",  buf,  0x20u);
    }
  }

  else
  {
    id v10 = sub_1000153D4();
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) launchdJobName]);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = &stru_100024E50;
      __int16 v15 = 2114;
      dispatch_queue_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@Shutdown job %{public}@.", buf, 0x16u);
    }

    int v6 = 0LL;
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v6);
  }
}

void sub_1000165B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_100016608(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100016618(uint64_t a1)
{
}

void sub_100016620(uint64_t a1, void *a2)
{
  id v4 = a2;
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v4) {
    --*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  int v6 = (id *)(v5 + 40);
  if (!v7)
  {
    id v8 = v4;
    objc_storeStrong(v6, a2);
    id v4 = v8;
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    id v9 = v4;
    [*(id *)(a1 + 32) _handleDeactivationCompleteForBubble:*(void *)(a1 + 40) successfulShutdowns:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) error:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) callback:*(void *)(a1 + 48)];
    id v4 = v9;
  }
}

void sub_100016FA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.HomeHub", "JobManager");
  id v2 = (void *)qword_10002E6D0;
  qword_10002E6D0 = (uint64_t)v1;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}