void sub_2CD4( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;
  *(void *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_2D14(id *a1, char a2, id obj)
{
  v25 = a1;
  char v24 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v22[1] = a1;
  v22[0] = &_os_log_default;
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_31F0((uint64_t)v26, v24 & 1, (uint64_t)location);
    _os_log_impl( &dword_0,  (os_log_t)v22[0],  v21,  "Control center attempted to launch current activity session with result: %{BOOL}d, error: %@",  v26,  0x12u);
  }

  objc_storeStrong(v22, 0LL);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  if (WeakRetained)
  {
    if ((v24 & 1) != 0)
    {
      id v10 = [WeakRetained delegate];
      [v10 moduleDidRequestSystemMenuDismissal:WeakRetained animated:1 result:0];

      int v19 = 1;
    }

    else
    {
      id v9 = [location domain];
      BOOL v8 = 0;
      if ((BSEqualStrings() & 1) != 0) {
        BOOL v8 = [location code] == &stru_3D8.segname[11];
      }

      if (v8)
      {
        id v7 = +[TVCSExpanseContext sharedContext](&OBJC_CLASS___TVCSExpanseContext, "sharedContext");
        id v6 = [location userInfo];
        id v5 = [v6 objectForKeyedSubscript:TVCSActivitySessionKey];
        id v4 = [location userInfo];
        id v3 = [v4 objectForKeyedSubscript:TVCSConversationKey];
        v12 = _NSConcreteStackBlock;
        int v13 = -1073741824;
        int v14 = 0;
        v15 = sub_3244;
        v16 = &unk_40F0;
        objc_copyWeak(&v17, a1 + 4);
        id v18 = [v7 missingAppAlertForActivitySession:v5 inConversation:v3 completion:&v12];

        [*((id *)WeakRetained + 1) presentViewController:v18 animated:1 completion:&stru_4130];
        objc_storeStrong(&v18, 0LL);
        objc_destroyWeak(&v17);
      }

      int v19 = 0;
    }
  }

  else
  {
    int v19 = 1;
  }

  objc_storeStrong(&WeakRetained, 0LL);
  if (!v19) {
    int v19 = 0;
  }
  objc_storeStrong(&location, 0LL);
}

void sub_31E0()
{
}

uint64_t sub_31F0(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 64;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void sub_3244(id *a1, uint64_t a2)
{
  id v5 = a1;
  uint64_t v4 = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0] && v4 == 3)
  {
    id v2 = [location[0] delegate];
    [v2 moduleDidRequestSystemMenuDismissal:location[0] animated:1 result:0];
  }

  objc_storeStrong(location, 0LL);
}

  ;
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}