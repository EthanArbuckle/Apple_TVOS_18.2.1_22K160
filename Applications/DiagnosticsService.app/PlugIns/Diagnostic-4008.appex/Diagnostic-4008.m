void sub_100003178( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003360(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003370(uint64_t a1)
{
}

void sub_100003378(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100005BA0((uint64_t)v6, v9);
      }

      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]));
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Bluetooth scan completed successfully. Devices: %@",  (uint8_t *)&v14,  0xCu);
      }

      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v12 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = &off_100008548;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000036DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (qword_10000C820)
  {
    [(id)qword_10000C820 setSession:0];
    if (a2 == 1)
    {
      if ((_DWORD)a3)
      {
        uint64_t v18 = DiagnosticLogHandleForCategory(3LL);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100005D5C(a3, v9, v19, v20, v21, v22, v23, v24);
        }
        goto LABEL_12;
      }

      uint64_t v31 = DiagnosticLogHandleForCategory(3LL);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      v28 = v32;
      if (a4)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          v29 = "Successfully detached from BT.";
          v30 = (uint8_t *)&v33;
          goto LABEL_21;
        }

LABEL_22:
        [(id)qword_10000C820 setSession:a1];
        goto LABEL_28;
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100005D30();
      }
LABEL_27:

      goto LABEL_28;
    }

    if (!a2)
    {
      if ((_DWORD)a3)
      {
        uint64_t v8 = DiagnosticLogHandleForCategory(3LL);
        v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100005CCC(a3, v9, v10, v11, v12, v13, v14, v15);
        }
LABEL_12:

LABEL_28:
        v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C820, "statusSema", v33));
        dispatch_semaphore_signal(v17);
        goto LABEL_29;
      }

      uint64_t v26 = DiagnosticLogHandleForCategory(3LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      v28 = v27;
      if (a4)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = 0;
          v29 = "Successfully attached to BT.";
          v30 = (uint8_t *)&v34;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
          goto LABEL_22;
        }

        goto LABEL_22;
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100005CA0();
      }
      goto LABEL_27;
    }

    uint64_t v25 = DiagnosticLogHandleForCategory(3LL);
    v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_100005C40();
    }
  }

  else
  {
    uint64_t v16 = DiagnosticLogHandleForCategory(3LL);
    v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_100005C14();
    }
  }

LABEL_29:
}

void sub_1000038D0(uint64_t a1, int a2)
{
  if (!qword_10000C820)
  {
    uint64_t v4 = DiagnosticLogHandleForCategory(3LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100005C14();
    }
    goto LABEL_12;
  }

  if (a2 == 1)
  {
    uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received discovery status update: BT_DISCOVERY_SCAN_STOPPED.",  v10,  2u);
    }

    [(id)qword_10000C820 setStopped:1];
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_10000C820 statusSema]);
    dispatch_semaphore_signal((dispatch_semaphore_t)v5);
LABEL_12:

    return;
  }

  if (a2)
  {
    uint64_t v8 = DiagnosticLogHandleForCategory(3LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100005DC0();
    }
  }

  else
  {
    uint64_t v2 = DiagnosticLogHandleForCategory(3LL);
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received discovery status update: BT_DISCOVERY_SCAN_STARTED.",  buf,  2u);
    }

    [(id)qword_10000C820 setStarted:1];
  }
}

void sub_100003A3C(uint64_t a1, int a2, uint64_t a3)
{
  if (qword_10000C820)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10000C820 devices]);
    uint64_t v15 = 0LL;
    memset(v18, 0, sizeof(v18));
    if (a2)
    {
      uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005E4C();
      }
    }

    else
    {
      BTDeviceGetAddressString(a3, v18, 256LL);
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
      BTDeviceGetName(a3, v18, 256LL);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
      BTDeviceGetDefaultName(a3, v18, 256LL);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
      BTDeviceGetDeviceType(a3, (char *)&v15 + 4);
      BTDeviceGetDeviceClass(a3, &v15);
      if (v7 && v9 && v10)
      {
        uint64_t v11 = objc_alloc_init(&OBJC_CLASS___OSDBluetoothDevice);
        -[OSDBluetoothDevice setAddress:](v11, "setAddress:", v7);
        -[OSDBluetoothDevice setName:](v11, "setName:", v9);
        -[OSDBluetoothDevice setDefaultName:](v11, "setDefaultName:", v10);
        -[OSDBluetoothDevice setDeviceType:](v11, "setDeviceType:", HIDWORD(v15));
        -[OSDBluetoothDevice setDeviceClass:](v11, "setDeviceClass:", v15);
        [v5 addObject:v11];
        uint64_t v12 = DiagnosticLogHandleForCategory(3LL);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Discovered a BT device: %@", buf, 0xCu);
        }
      }

      else
      {
        uint64_t v14 = DiagnosticLogHandleForCategory(3LL);
        uint64_t v11 = (OSDBluetoothDevice *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
          sub_100005E20();
        }
      }
    }
  }

  else
  {
    uint64_t v8 = DiagnosticLogHandleForCategory(3LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_100005C14();
    }
  }
}

void sub_100003CCC(uint64_t a1, uint64_t a2)
{
  if (qword_10000C820)
  {
    switch((int)a2)
    {
      case 0:
        uint64_t v3 = DiagnosticLogHandleForCategory(3LL);
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Received a BT_LOCAL_DEVICE_POWER_STATE_CHANGED callback: %d",  (uint8_t *)&v23,  8u);
        }

        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([(id)qword_10000C820 statusSema]);
        dispatch_semaphore_signal(v5);
        break;
      case 1:
        uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 1;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_NAME_CHANGED callback: %d";
          goto LABEL_26;
        }

        break;
      case 2:
        uint64_t v9 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 2;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_DISCOVERABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }

        break;
      case 3:
        uint64_t v10 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 3;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_CONNECTABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }

        break;
      case 4:
        uint64_t v11 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 4;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_PAIRING_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }

        break;
      case 5:
        uint64_t v12 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 5;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_CONNECTION_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }

        break;
      case 6:
        uint64_t v13 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 6;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STARTED callback: %d";
          goto LABEL_26;
        }

        break;
      case 7:
        uint64_t v14 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 7;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STOPPED callback: %d";
          goto LABEL_26;
        }

        break;
      case 8:
        uint64_t v22 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 67109120;
          int v24 = 8;
          uint64_t v8 = "Received a BT_LOCAL_DEVICE_ADVERTISING_STATUS_CHANGED callback: %d";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, 8u);
        }

        break;
      default:
        uint64_t v15 = DiagnosticLogHandleForCategory(3LL);
        id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
          sub_100005EAC(a2, (os_log_s *)v5, v16, v17, v18, v19, v20, v21);
        }
        break;
    }
  }

  else
  {
    uint64_t v6 = DiagnosticLogHandleForCategory(3LL);
    id v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_100005C14();
    }
  }
}

void sub_100004190(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = BTLocalDeviceGetModulePower( *(void *)(a1 + 56),  1LL,  *(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      uint64_t v3 = DiagnosticLogHandleForCategory(3LL);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      if (!os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        goto LABEL_17;
      }

      LOWORD(v17) = 0;
      id v5 = "Error while trying to get the BT module power.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v17, 2u);
      goto LABEL_6;
    }

    int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6 != -889275714)
    {
      if (v9)
      {
        uint64_t v13 = @"OFF";
        int v14 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        if (v14 == -1) {
          uint64_t v13 = @"ON";
        }
        int v17 = 138412546;
        uint64_t v18 = v13;
        __int16 v19 = 1024;
        int v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Read BT module power: %@. Powerstate: %x",  (uint8_t *)&v17,  0x12u);
      }

      uint64_t v15 = *(BOOL **)(a1 + 64);
      if (v15)
      {
        *uint64_t v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == -1;
        goto LABEL_17;
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
      uint64_t v16 = DiagnosticLogHandleForCategory(3LL);
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      LOWORD(v17) = 0;
      id v5 = "Callback pointer passed to isEnabled was NULL";
      goto LABEL_5;
    }

    if (v9)
    {
      int v10 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      int v17 = 67109120;
      LODWORD(v1_Block_object_dispose(va, 8) = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Read BT module powerstate: %x. Starting runloop",  (uint8_t *)&v17,  8u);
    }

    uint64_t v11 = (dispatch_semaphore_s *)WeakRetained[12];
    dispatch_time_t v12 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait(v11, v12);
  }

LABEL_17:
}

void sub_100004634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004664(uint64_t a1)
{
  uint64_t result = BTLocalDeviceSetModulePower(*(void *)(a1 + 40), 1LL, -*(char *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_1000049BC(_Unwind_Exception *a1)
{
}

void sub_100004A14(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    id v3 = objc_claimAutoreleasedReturnValue([v2 processName]);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTSessionAttachWithQueue( [v3 UTF8String],  WeakRetained + 2,  WeakRetained,  WeakRetained[1]);
  }
}

void sub_100004AA0(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int Default = BTLocalDeviceGetDefault(*((void *)WeakRetained + 8), WeakRetained + 72);
    id v3 = v5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = Default;
  }
}

void sub_100004AF4(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v4 = BTLocalDeviceAddCallbacks(*((void *)WeakRetained + 9), WeakRetained + 40);
    id v3 = v5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
  }
}

void sub_100004B48(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v4 = BTDiscoveryAgentCreate(*((void *)WeakRetained + 8), WeakRetained + 24);
    id v3 = v5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
  }
}

void sub_100004C30(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained + 10;
    int v6 = WeakRetained;
    if (WeakRetained[10])
    {
      BTDiscoveryAgentDestroy(WeakRetained + 10, WeakRetained);
      uint64_t v2 = v6;
      void *v3 = 0LL;
    }

    uint64_t v4 = v2[9];
    if (v4)
    {
      BTLocalDeviceRemoveCallbacks(v4, v6 + 5);
      uint64_t v2 = v6;
    }

    id v5 = v2 + 8;
    if (v2[8])
    {
      BTSessionDetachWithQueue(v2 + 8);
      uint64_t v2 = v6;
      *id v5 = 0LL;
    }
  }
}

void sub_100004E04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004E1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004E2C(uint64_t a1)
{
}

void sub_100004E34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Bluetooth scan completed successfully. Devices: %@",  buf,  0xCu);
    }

    if (*(void *)(a1 + 32))
    {
      if (![v5 count])
      {
        uint64_t v28 = DiagnosticLogHandleForCategory(3LL);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100005FB8();
        }

        uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8LL);
        uint64_t v18 = *(void **)(v26 + 40);
        v27 = &off_100008590;
        goto LABEL_21;
      }

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v19 = v5;
      id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          int v23 = 0LL;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            int v24 = *(void **)(a1 + 32);
            [v24 addObject:v25];

            int v23 = (char *)v23 + 1;
          }

          while (v21 != v23);
          id v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }

        while (v21);
      }
    }

    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v18 = *(void **)(v26 + 40);
    v27 = &off_100008578;
LABEL_21:
    *(void *)(v26 + 40) = v27;
    goto LABEL_22;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100005FE4((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]));
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
LABEL_22:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005180(uint64_t a1)
{
  char v52 = 0;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2020000000LL;
  int v51 = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  id v47 = 0LL;
  [v2 _setupBluetoothSessionAndDevice:&v47];
  id v3 = v47;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  [*(id *)(a1 + 32) setDevices:v4];

  [*(id *)(a1 + 32) setStarted:0];
  [*(id *)(a1 + 32) setStopped:0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _bluetoothPower:WeakRetained[9] isEnabled:&v52];
    uint64_t v7 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v52) {
        BOOL v9 = @"ON";
      }
      else {
        BOOL v9 = @"OFF";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v54 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Initial Bluetooth power state is %@",  buf,  0xCu);
    }

    uint64_t v10 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Attempting to power on Bluetooth... (if necessary)",  buf,  2u);
    }

    if (([v6 _setBluetoothPower:v6[9] enabled:1 timeout:*(double *)(a1 + 56)] & 1) == 0)
    {
      id v46 = v3;
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  &v46,  @"com.apple.Diagnostics.DABluetooth",  2107LL,  @"Error unable to set the bluetooth power state to ON");
      id v12 = v46;

      id v3 = v12;
    }

    unint64_t v13 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    uint64_t v14 = DiagnosticLogHandleForCategory(3LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to do a Bluetooth scan...",  buf,  2u);
    }

    uint64_t v16 = (dispatch_queue_s *)v6[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005900;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v45, (id *)(a1 + 48));
    block[4] = &v48;
    dispatch_sync(v16, block);
    if (*((_DWORD *)v49 + 6))
    {
      id v43 = v3;
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  &v43,  @"com.apple.Diagnostics.DABluetooth",  2108LL,  @"Error trying to start a Bluetooth scan");
      id v17 = v43;

      id v3 = v17;
    }

    else
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v13);
    }

    uint64_t v18 = DiagnosticLogHandleForCategory(3LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [*(id *)(a1 + 32) started];
      unsigned int v21 = [*(id *)(a1 + 32) stopped];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v54 = v20;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Scan complete. Started: %d Stopped: %d",  buf,  0xEu);
    }

    else {
      unsigned __int8 v22 = 0;
    }
    if ([*(id *)(a1 + 32) started]
      && ([*(id *)(a1 + 32) stopped] & 1) == 0)
    {
      uint64_t v23 = DiagnosticLogHandleForCategory(3LL);
      int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending a stop scan command...", buf, 2u);
      }

      uint64_t v25 = (dispatch_queue_s *)v6[1];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_100005954;
      v41[3] = &unk_100008310;
      objc_copyWeak(&v42, (id *)(a1 + 48));
      dispatch_sync(v25, v41);
      unint64_t v13 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      uint64_t v26 = DiagnosticLogHandleForCategory(3LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v54 = 0x4000000000000000LL;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Adding grace period delay of %.02f sec for stop notification...",  buf,  0xCu);
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v13);
      uint64_t v28 = DiagnosticLogHandleForCategory(3LL);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v30 = [*(id *)(a1 + 32) started];
        unsigned int v31 = [*(id *)(a1 + 32) stopped];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v54 = v30;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Overtime-scan complete. Started: %d Stopped: %d",  buf,  0xEu);
      }

      else {
        unsigned __int8 v22 = 0;
      }
      objc_destroyWeak(&v42);
    }

    if (!v52)
    {
      uint64_t v32 = DiagnosticLogHandleForCategory(3LL);
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Attempting to power off Bluetooth...",  buf,  2u);
      }

      unsigned int v34 = [v6 _setBluetoothPower:v6[9] enabled:0 timeout:(double)v13 - CFAbsoluteTimeGetCurrent()];
    }

    if (([*(id *)(a1 + 32) started] & 1) == 0)
    {
      id v40 = v3;
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  &v40,  @"com.apple.Diagnostics.DABluetooth",  2108LL,  @"Error trying to start a Bluetooth scan");
      id v35 = v40;

      id v3 = v35;
    }

    if (([*(id *)(a1 + 32) stopped] & 1) == 0)
    {
      id v39 = v3;
      +[OSDError setError:withDomain:withCode:format:]( &OBJC_CLASS___OSDError,  "setError:withDomain:withCode:format:",  &v39,  @"com.apple.Diagnostics.DABluetooth",  2109LL,  @"Error trying to stop a Bluetooth scan");
      id v36 = v39;

      id v3 = v36;
    }

    [*(id *)(a1 + 32) _teardownBluetoothSessionAndDevice];
    if ((v22 & 1) == 0) {
      [*(id *)(a1 + 32) setDevices:0];
    }
    uint64_t v37 = *(void *)(a1 + 40);
    v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) devices]);
    (*(void (**)(uint64_t, void *, id))(v37 + 16))(v37, v38, v3);

    [*(id *)(a1 + 32) setDevices:0];
    objc_destroyWeak(&v45);
  }

  _Block_object_dispose(&v48, 8);
}

void sub_100005890( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_100005900(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = BTDiscoveryAgentStartScan( WeakRetained[10],  0LL,  0xFFFFFFFFLL);
    WeakRetained = v3;
  }
}

void sub_100005954(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    BTDiscoveryAgentStopScan(WeakRetained[10]);
    WeakRetained = v2;
  }
}

void sub_100005A68( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005A80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_100005AB8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005AD0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005B38( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005BA0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Bluetooth scan error: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100005C14()
{
}

void sub_100005C40()
{
}

void sub_100005CA0()
{
}

void sub_100005CCC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005D30()
{
}

void sub_100005D5C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005DC0()
{
}

void sub_100005E20()
{
}

void sub_100005E4C()
{
}

void sub_100005EAC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005F10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005F8C()
{
}

void sub_100005FB8()
{
}

void sub_100005FE4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}