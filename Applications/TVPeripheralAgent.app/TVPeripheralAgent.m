void sub_100005150(id a1)
{
  TVSPreferences *v1;
  void *v2;
  id v3;
  void *v4;
  NSString *v5;
  NSBundle *v6;
  NSString *v7;
  NSBundle *v8;
  v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v5 = -[NSBundle bundleIdentifier](v6, "bundleIdentifier");
  v1 = +[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:");
  v2 = (void *)qword_100040328;
  qword_100040328 = (uint64_t)v1;

  v8 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v7 = -[NSBundle bundleIdentifier](v8, "bundleIdentifier");
  v3 =  +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:");
  v4 = (void *)qword_100040330;
  qword_100040330 = (uint64_t)v3;
}

id sub_1000053D0(unint64_t a1)
{
  if (a1 <= 0x10) {
    __asm { BR              X8 }
  }

  return v2;
}

void sub_100008128(uint64_t a1)
{
  v4 = +[TVPeripheralAgentService sharedInstance](&OBJC_CLASS___TVPeripheralAgentService, "sharedInstance");
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) clientBundleIdentifier];
  -[TVPeripheralAgentService beginSuppressingPeripheralHUDWithOptions:forClientBundleIdentifier:]( v4,  "beginSuppressingPeripheralHUDWithOptions:forClientBundleIdentifier:",  v2);
}

id sub_1000081B4()
{
  predicate = (dispatch_once_t *)&unk_100040348;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1000386E8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100040340;
}

uint64_t sub_10000822C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1000084A4(uint64_t a1)
{
  v4 = +[TVPeripheralAgentService sharedInstance](&OBJC_CLASS___TVPeripheralAgentService, "sharedInstance");
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) clientBundleIdentifier];
  -[TVPeripheralAgentService endSuppressingPeripheralHUDWithOptions:forClientBundleIdentifier:]( v4,  "endSuppressingPeripheralHUDWithOptions:forClientBundleIdentifier:",  v2);
}

void sub_1000086F0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "TVPAAgentConnection");
  uint64_t v2 = (void *)qword_100040340;
  qword_100040340 = (uint64_t)v1;
}

id sub_100008904()
{
  predicate = (dispatch_once_t *)&unk_100040358;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100038708);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100040350;
}

uint64_t sub_10000897C(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t sub_100008C14(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  return result;
}
}

__CFString *sub_1000093A0(uint64_t a1)
{
  uint64_t v6 = a1;
  id location = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (sub_10000977C(v6, 1LL)) {
    [location addObject:@"SupportsTouch"];
  }
  if (sub_10000977C(v6, 2LL)) {
    [location addObject:@"SupportsRotary"];
  }
  if (sub_10000977C(v6, 4LL)) {
    [location addObject:@"SupportsMute"];
  }
  if (sub_10000977C(v6, 8LL)) {
    [location addObject:@"SupportsMic"];
  }
  if (sub_10000977C(v6, 16LL)) {
    [location addObject:@"SupportsPushToTalk"];
  }
  char v3 = 0;
  if ([location count])
  {
    id v4 = [location componentsJoinedByString:@","];
    char v3 = 1;
    os_log_t v1 = (__CFString *)v4;
  }

  else
  {
    os_log_t v1 = @"<None>";
  }

  v7 = v1;
  if ((v3 & 1) != 0) {

  }
  objc_storeStrong(&location, 0LL);
  return v7;
}

uint64_t sub_100009554(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_1000095C0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100009730(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "TVPARemoteFlagsController");
  uint64_t v2 = (void *)qword_100040350;
  qword_100040350 = (uint64_t)v1;
}

BOOL sub_10000977C(uint64_t a1, uint64_t a2)
{
  return sub_1000097B8(a1, a2) == a2;
}

uint64_t sub_1000097B8(uint64_t a1, uint64_t a2)
{
  return a1 & a2;
}

id sub_100009920()
{
  predicate = (dispatch_once_t *)&unk_100040368;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100038728);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100040360;
}

_BYTE *sub_100009998(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

LABEL_14:
  char v3 = v30;
  objc_storeStrong(&v29, 0LL);
  return v3 & 1;
}

uint64_t sub_10000A9CC(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t sub_10000AA38(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_10000AB58(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "RemoteDiscoveryHelper");
  uint64_t v2 = (void *)qword_100040360;
  qword_100040360 = (uint64_t)v1;
}

id sub_10000ABA4()
{
  predicate = (dispatch_once_t *)&unk_100040378;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100038748);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100040370;
}

void sub_10000AC1C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "Metrics");
  uint64_t v2 = (void *)qword_100040370;
  qword_100040370 = (uint64_t)v1;
}

id sub_10000AD60()
{
  predicate = (dispatch_once_t *)&unk_100040398;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100038788);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100040390;
}

LABEL_9:
  return v12 & 1;
}

  return v13 & 1;
}

uint64_t sub_10000C92C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_10000CBB0(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___TVPABluetoothRemotePairingManager);
  uint64_t v2 = (void *)qword_100040380;
  qword_100040380 = (uint64_t)v1;
}

void sub_10000CEC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "PairingAgent");
  uint64_t v2 = (void *)qword_100040390;
  qword_100040390 = (uint64_t)v1;
}

uint64_t sub_10000CF10(int64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = a1 / 5;
  if (!(a1 % 5)) {
    --v2;
  }
  return v2;
}

NSString *sub_10000CFD0(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) <= 0x14) {
    __asm { BR              X8 }
  }

  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%lu)", a1);
}

id sub_10000D768(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batteryLevel", a1, a1);
}

id sub_10000D798(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batteryRange", a1, a1);
}

id sub_10000D7C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timestamp", a1, a1);
}

id sub_10000E67C(void *a1, uint64_t a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  uint64_t v7 = a2;
  if (a2 && (objc_opt_isKindOfClass(location, v7) & 1) != 0) {
    id v2 = location;
  }
  else {
    id v2 = 0LL;
  }
  id v6 = v2;
  id v4 = v2;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

uint64_t sub_10000E9E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id sub_10000F4AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identifier", a1, a1);
}

id sub_10000F4DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteIdentifier", a1, a1);
}

id sub_10000F50C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteSerialNumber", a1, a1);
}

id sub_10000F53C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remoteType", a1, a1);
}

id sub_10000F56C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batterySnapshots", a1, a1);
}

uint64_t sub_10000FCE8(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_1000103B4()
{
  for (unsigned int i = 0; i <= 1; ++i)
  {
    for (unsigned int j = 0; j <= 1; ++j)
    {
      for (unsigned int k = 0; k <= 1; ++k)
      {
        for (unsigned int m = 0; m <= 2; ++m)
        {
          for (unsigned int n = 0; n <= 4; ++n)
          {
            unsigned int v40 = sub_100016B00(i, 0, k, m, n);
            if (v40 <= 7 && (unint64_t)dword_100041340 < 0x3E8)
            {
              int v0 = sub_100011BAC(i, j, k, m, n);
              uint64_t v1 = dword_100041340++;
              dword_1000403A0[v1] = v0;
            }
          }
        }
      }
    }
  }

  char v38 = MGGetBoolAnswer(@"2zyzecwSf2ZYRpB3tuQhOQ") & 1;
  char v39 = v38;
  if (v38) {
    int v2 = 8;
  }
  else {
    int v2 = 4;
  }
  int v37 = v2;
  if (dword_100041340 <= (unint64_t)(1000LL - v2) && (unint64_t)v37 <= 8)
  {
    int v3 = sub_100011BAC(1, 0, 1, 0, 1);
    uint64_t v4 = dword_100041364++;
    dword_100041344[v4] = v3;
    uint64_t v5 = dword_100041340++;
    dword_1000403A0[v5] = v3;
    int v6 = sub_100011BAC(1, 1, 1, 0, 1);
    uint64_t v7 = dword_100041364++;
    dword_100041344[v7] = v6;
    uint64_t v8 = dword_100041340++;
    dword_1000403A0[v8] = v6;
    int v9 = sub_100011BAC(1, 0, 1, 1, 0);
    uint64_t v10 = dword_100041364++;
    dword_100041344[v10] = v9;
    uint64_t v11 = dword_100041340++;
    dword_1000403A0[v11] = v9;
    int v12 = sub_100011BAC(1, 1, 1, 1, 0);
    uint64_t v13 = dword_100041364++;
    dword_100041344[v13] = v12;
    uint64_t v14 = dword_100041340++;
    dword_1000403A0[v14] = v12;
    if ((v39 & 1) != 0)
    {
      int v15 = sub_100011BAC(2, 0, 1, 0, 0);
      uint64_t v16 = dword_100041364++;
      dword_100041344[v16] = v15;
      uint64_t v17 = dword_100041340++;
      dword_1000403A0[v17] = v15;
      int v18 = sub_100011BAC(2, 1, 1, 0, 0);
      uint64_t v19 = dword_100041364++;
      dword_100041344[v19] = v18;
      uint64_t v20 = dword_100041340++;
      dword_1000403A0[v20] = v18;
      int v21 = sub_100011BAC(2, 0, 1, 0, 1);
      uint64_t v22 = dword_100041364++;
      dword_100041344[v22] = v21;
      uint64_t v23 = dword_100041340++;
      dword_1000403A0[v23] = v21;
      int v24 = sub_100011BAC(2, 0, 0, 0, 0);
      uint64_t v25 = dword_100041364++;
      dword_100041344[v25] = v24;
      uint64_t v26 = dword_100041340++;
      dword_1000403A0[v26] = v24;
    }
  }

  if ((unint64_t)dword_100041340 > 0x3E8)
  {
    id location = sub_1000110F8();
    char v35 = 17;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v35;
      sub_100009998(v34);
      _os_log_fault_impl( (void *)&_mh_execute_header,  log,  type,  "*** WARNING: validStates array is not large enough to hold all states",  v34,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

  if ((unint64_t)v37 > 8)
  {
    id v33 = sub_1000110F8();
    char v32 = 17;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_FAULT))
    {
      v27 = (os_log_s *)v33;
      os_log_type_t v28 = v32;
      sub_100009998(v31);
      _os_log_fault_impl( (void *)&_mh_execute_header,  v27,  v28,  "*** WARNING: specialCaseStates array is not large enough to hold all states",  v31,  2u);
    }

    objc_storeStrong(&v33, 0LL);
  }

void sub_1000109DC(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  uint64_t v1 = (int *)location;
  queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  os_log_type_t v28 = sub_100017468;
  v29 = &unk_100038938;
  id v30 = location;
  notify_register_dispatch("com.apple.TVPeripheralAgent.dumpState", v1 + 2, queue, &v25);

  int v3 = (int *)location;
  uint64_t v4 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.showPanels", v3 + 3, v4, &stru_100038978);

  uint64_t v5 = (int *)location;
  int v6 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.dropGameController", v5 + 4, v6, &stru_100038998);

  uint64_t v7 = (int *)location;
  uint64_t v8 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.dropGenericBTLE", v7 + 5, v8, &stru_1000389F8);

  int v9 = (int *)location;
  uint64_t v10 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.dropAppleTVRemote", v9 + 6, v10, &stru_100038A38);

  uint64_t v11 = (int *)location;
  int v12 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.dropKeyboard", v11 + 7, v12, &stru_100038A78);

  uint64_t v13 = (int *)location;
  uint64_t v14 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.dropAudio", v13 + 8, v14, &stru_100038AB8);

  int v15 = (int *)location;
  uint64_t v16 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.addGameController", v15 + 9, v16, &stru_100038AF8);

  uint64_t v17 = (int *)location;
  int v18 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.addGenericBTLE", v17 + 10, v18, &stru_100038B38);

  uint64_t v19 = (int *)location;
  uint64_t v20 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.addAppleTVRemote", v19 + 11, v20, &stru_100038B78);

  int v21 = (int *)location;
  uint64_t v22 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.addKeyboard", v21 + 12, v22, &stru_100038BB8);

  uint64_t v23 = (int *)location;
  int v24 = dispatch_get_global_queue(0LL, 0LL);
  notify_register_dispatch("com.apple.TVPeripheralAgent.addAudio", v23 + 13, v24, &stru_100038BF8);

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100010DE0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = location[0];
  uint64_t v4 = *(void **)(a1[4] + 160LL);
  id v5 = [location[0] addressString];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3);

  objc_storeStrong(location, 0LL);
}

void sub_100010E78(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v3 = *(void **)(a1[4] + 160LL);
  id v4 = [location[0] addressString];
  objc_msgSend(v3, "removeObjectForKey:");

  objc_storeStrong(location, 0LL);
}

id sub_1000110F8()
{
  predicate = (dispatch_once_t *)&unk_100041370;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1000388F0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100041368;
}

uint64_t sub_10001140C(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  for (unint64_t i = 0; i < (unint64_t)[location count]; ++i)
  {
    id v3 = [location objectAtIndexedSubscript:i];
    unsigned int v4 = [v3 intValue];

    unint64_t v5 = v4 - 1;
    if (v5 <= 7) {
      __asm { BR              X8 }
    }
  }

  unsigned int v2 = sub_100011BAC(0, 0, 0, 0, 0);
  objc_storeStrong(&location, 0LL);
  return v2;
}

uint64_t sub_100011594(int a1)
{
  for (int i = 0; i < dword_100041340; ++i)
  {
    if (dword_1000403A0[i] == a1) {
      return i;
    }
  }

  return -1;
}

uint64_t sub_1000118EC(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  int v16 = 0;
  int v15 = 0;
  int v14 = 0;
  int v13 = 0;
  int v12 = 0;
  memset(__b, 0, sizeof(__b));
  id obja = location;
  id v9 = [obja countByEnumeratingWithState:__b objects:v18 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obja);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      unint64_t v3 = sub_10001371C(v11) - 1;
      if (v3 <= 7) {
        __asm { BR              X8 }
      }

      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [obja countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  unsigned int v2 = sub_100011BAC(v16, v15, v14, v13, v12);
  objc_storeStrong(&location, 0LL);
  return v2;
}

uint64_t sub_100011B5C(unsigned int a1, int a2)
{
  return (a1 >> byte_10002D840[4 * a2 + 2]) & ((1 << byte_10002D840[4 * a2 + 3]) - 1);
}

uint64_t sub_100011BAC(int a1, int a2, int a3, int a4, int a5)
{
  return (16 * a4 + a5 + (a3 << 8) + (a2 << 12) + (a1 << 16));
}

uint64_t sub_100011BF4(uint64_t result, int a2, int a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void sub_100011C40(void *a1, int a2, int a3, void *a4, char a5)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  int v32 = a2;
  int v31 = a3;
  id v30 = 0LL;
  objc_storeStrong(&v30, a4);
  char v29 = a5 & 1;
  unsigned int v28 = v32 - v31;
  if (v32 == v31)
  {
    int v27 = 1;
  }

  else
  {
    int v26 = sub_100011B5C(v28, 3);
    int v25 = sub_100011B5C(v28, 2);
    int v24 = sub_100011B5C(v28, 1);
    int v23 = sub_100011B5C(v28, 8);
    int v22 = sub_100011B5C(v28, 4);
    int v12 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
    id v11 = -[TVSBluetoothManager connectedDevices](v12, "connectedDevices");
    id v10 = [v11 allObjects];
    id v21 = [v10 sortedArrayUsingComparator:&stru_100038910];

    memset(__b, 0, sizeof(__b));
    id v13 = v21;
    id v14 = [v13 countByEnumeratingWithState:__b objects:v34 count:16];
    if (v14)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0LL;
      id v9 = v14;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v13);
        }
        id v20 = *(id *)(__b[1] + 8 * v8);
        id v5 = [v20 type];
        if ((unint64_t)v5 <= 4) {
          __asm { BR              X8 }
        }

        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0LL;
          id v9 = [v13 countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v21, 0LL);
    int v27 = 0;
  }

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100012C28(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

LABEL_43:
        ++v13;
        if (v11 + 1 >= (unint64_t)v14)
        {
          id v13 = 0LL;
          id v14 = [v15 countByEnumeratingWithState:v38 objects:v58 count:16];
          if (!v14) {
            goto LABEL_45;
          }
        }
      }

      connectedDevices = v54->_connectedDevices;
      id v10 = [v39 identifier];
      int v37 = -[NSMutableDictionary objectForKeyedSubscript:](connectedDevices, "objectForKeyedSubscript:");

      if (v37
        && ([v37 deviceFlags] & 1) == 0
        && sub_1000138E4((int)[v37 productIdentifier]))
      {
        if (v43 == 2)
        {
          +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
          uint64_t v8 = v5;
          [v52 lastDisconnectTime];
          v36 = v8 - v6 < 5.0;
          [v52 disconnectDevicePhysicalLink];
          if (!v36) {
            -[TVPADeviceEnforcementAgent tellUserUpdateNeededForDisconnectedDevice:]( v54,  "tellUserUpdateNeededForDisconnectedDevice:",  v39);
          }
          v48 = 1;
          goto LABEL_42;
        }

        if (v43 == 3)
        {
          oslog = (os_log_t)sub_1000110F8();
          v34 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v7 = oslog;
            sub_100013988((uint64_t)v57, (uint64_t)v39);
            _os_log_impl( (void *)&_mh_execute_header,  v7,  v34,  "Disconnecting 3rd audio device that doesn't support wireless splitter %@",  v57,  0xCu);
          }

          objc_storeStrong((id *)&oslog, 0LL);
          [v39 disconnectDevicePhysicalLink];
          v48 = 1;
LABEL_42:
          objc_storeStrong(&v37, 0LL);
          if (v48) {
            goto LABEL_46;
          }
          goto LABEL_43;
        }
      }

      v48 = 0;
      goto LABEL_42;
    }

LABEL_45:
    v48 = 0;
LABEL_46:

    if (!v48)
    {
LABEL_47:
      id v33 = sub_100011594(v44);
      if (v33 == -1)
      {
        -[TVPADeviceEnforcementAgent _didCompleteDeviceConnection:currentState:]( v54,  "_didCompleteDeviceConnection:currentState:",  v52,  v44);
        v48 = 0;
      }

      else
      {
        int v32 = (os_log_t)sub_1000110F8();
        int v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          sub_100013988((uint64_t)v56, (uint64_t)v52);
          _os_log_impl((void *)&_mh_execute_header, v32, v31, "**** Told about adding new device: %@", v56, 0xCu);
        }

        objc_storeStrong((id *)&v32, 0LL);
        id v30 = (os_log_t)sub_1000110F8();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          sub_1000139C8((uint64_t)v55, v44);
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "**** Current state %05x is valid, skipping further processing",  v55,  8u);
        }

        objc_storeStrong((id *)&v30, 0LL);
        v48 = 1;
      }
    }

    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v47, 0LL);
    goto LABEL_55;
  }

  v50 = sub_1000110F8();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = v52;
    enforcing = v54->_enforcing;
    int v27 = sub_10001371C(v52) == 9;
    sub_10001383C( (uint64_t)v60,  (uint64_t)v25,  enforcing,  v27,  (uint64_t)v51,  ([v52 isConnected] ^ 1) & 1,  (uint64_t)objc_msgSend(v52, "state"));
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v50,  type,  "**** Told about adding, but ignoring, new device %@ (%d %d %p %d, %ld)",  v60,  0x32u);
  }

  objc_storeStrong(&v50, 0LL);
  v48 = 1;
LABEL_55:
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001371C(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v2 = [location type];
  if ((unint64_t)v2 <= 4) {
    __asm { BR              X8 }
  }

  unsigned int v4 = -1;
  objc_storeStrong(&location, 0LL);
  return v4;
}

uint64_t sub_10001383C(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 24) = 0;
  *(_BYTE *)(result + 25) = 8;
  *(void *)(result + 26) = a5;
  *(_BYTE *)(result + 34) = 0;
  *(_BYTE *)(result + 35) = 4;
  *(_DWORD *)(result + 36) = a6;
  *(_BYTE *)(result + 40) = 0;
  *(_BYTE *)(result + 41) = 8;
  *(void *)(result + 42) = a7;
  return result;
}

BOOL sub_1000138E4(int a1)
{
  return (sub_100016D44(a1) & 1) != 0 || (sub_100016E60(a1) & 1) != 0 || (sub_100016FD4(a1) & 1) != 0;
}

uint64_t sub_100013988(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_1000139C8(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t sub_1000143FC(int a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  int v9 = 1 << byte_10002D840[4 * a2 + 2];
  unsigned int v8 = 0;
  for (int i = 0; i < dword_100041340; ++i)
  {
    int v6 = sub_100011594(dword_1000403A0[i] + v9);
    if (v6 != -1 && sub_10001710C(dword_1000403A0[i], a1) && sub_1000171C8(a1, v6))
    {
      if (v8 < a5)
      {
        if (a3) {
          *(_DWORD *)(a3 + 4LL * v8) = i;
        }
        if (a4) {
          *(_DWORD *)(a4 + 4LL * v8) = v6;
        }
      }

      ++v8;
    }
  }

  return v8;
}

uint64_t sub_100014570(int a1, int a2, int a3)
{
  int v18 = 0;
  unsigned int v17 = dword_1000403A0[a1] - dword_1000403A0[a2];
  if (dword_1000403A0[a1] == dword_1000403A0[a2])
  {
    return 0x80000000;
  }

  else
  {
    unsigned int v6 = sub_100011B5C(dword_1000403A0[a1], 3);
    BOOL v16 = v6 < sub_100011B5C(dword_1000403A0[a3], 3);
    unsigned int v15 = sub_100011B5C(dword_1000403A0[a1], 4);
    int v14 = sub_100011B5C(dword_1000403A0[a1], 8);
    unsigned int v13 = sub_100011B5C(dword_1000403A0[a1], 1);
    unsigned int v12 = sub_100011B5C(dword_1000403A0[a3], 4);
    int v11 = sub_100011B5C(dword_1000403A0[a3], 8);
    unsigned int v10 = sub_100011B5C(dword_1000403A0[a3], 1);
    if (v16 && v15 > 1 && v12 > 1) {
      int v18 = 25 * (v12 - 1);
    }
    if (v16 && v14 && v11) {
      v18 += 25 * v11;
    }
    if (v16 && v13 > 1 && v10 > 1) {
      v18 += 25 * (v10 - 1);
    }
    int v19 = v18 + 7 * sub_100011B5C(v17, 4);
    int v20 = v19 + 5 * sub_100011B5C(v17, 8);
    int v9 = sub_100011B5C(v17, 1);
    if (v9 > 0)
    {
      else {
        int v5 = 1000;
      }
      v20 += v5;
    }

    int v21 = v20 + sub_100011B5C(v17, 2);
    int v22 = v21 + sub_100011B5C(v17, 3);
    int v8 = sub_100017290(a1);
    unsigned int v7 = sub_100017290(a3);
    int v23 = v22 + 10 * abs(v7 - v8);
    if (v7 <= 7) {
      unsigned int v4 = 0;
    }
    else {
      unsigned int v4 = v7 - 7;
    }
    return v23 + v4;
  }

uint64_t sub_100014970(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_1000149C0(uint64_t result, int a2, int a3, int a4, int a5)
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

int64_t sub_10001505C(id a1, TVSBluetoothDevice *a2, TVSBluetoothDevice *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  int v6 = sub_10001371C(location[0]);
  int v5 = sub_10001371C(v7);
  if (v6 == v5)
  {
    int64_t v9 = 0LL;
  }

  else if (v6 == 3LL)
  {
    int64_t v9 = -1LL;
  }

  else if (v5 == 3LL)
  {
    int64_t v9 = 1LL;
  }

  else if (v6 == 2LL)
  {
    int64_t v9 = -1LL;
  }

  else if (v5 == 2LL)
  {
    int64_t v9 = 1LL;
  }

  else if (v6 == 8)
  {
    int64_t v9 = -1LL;
  }

  else if (v5 == 8)
  {
    int64_t v9 = 1LL;
  }

  else if (v6 == 4LL)
  {
    int64_t v9 = -1LL;
  }

  else if (v5 == 4LL)
  {
    int64_t v9 = 1LL;
  }

  else if (v6 == 1LL)
  {
    int64_t v9 = -1LL;
  }

  else
  {
    int64_t v9 = 1LL;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

BOOL sub_1000152E4(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v19 = sub_1000110F8();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v19;
    os_log_type_t type = v18;
    sub_100009998(v17);
    _os_log_impl((void *)&_mh_execute_header, log, type, "tellUserDeviceDoesntRepectDisconnect()", v17, 2u);
  }

  objc_storeStrong(&v19, 0LL);
  id v2 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v16 =  -[NSBundle localizedStringForKey:value:table:]( v2,  "localizedStringForKey:value:table:",  @"BadlyBehavingDeviceCantDisconnectTitle");

  unint64_t v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v15 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"BadlyBehavingDeviceCantDisconnectTitleMessageFormat",  &stru_100039440,  0LL);

  id v14 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v15, location);
  v21[0] = kCFUserNotificationAlertHeaderKey;
  v22[0] = v16;
  v21[1] = kCFUserNotificationAlertMessageKey;
  v22[1] = v14;
  v21[2] = kCFUserNotificationDefaultButtonTitleKey;
  int v5 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  unsigned int v4 =  -[NSBundle localizedStringForKey:value:table:]( v5,  "localizedStringForKey:value:table:",  @"BadlyBehavingDeviceCantDisconnectDefaultButtonTitle",  &stru_100039440,  0LL);
  v22[2] = v4;
  id v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21);

  SInt32 error = 0;
  uint64_t v11 = 0x4082C00000000000LL;
  unsigned int v10 = CFUserNotificationCreate(0LL, 600.0, 1uLL, &error, (CFDictionaryRef)v13);
  CFOptionFlags responseFlags = 3LL;
  CFUserNotificationReceiveResponse(v10, 600.0, &responseFlags);
  CFRelease(v10);
  BOOL v8 = responseFlags == 0;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
  return v8;
}

BOOL sub_1000157D4(uint64_t a1)
{
  BOOL result = a1;
  if ((*(_BYTE *)(a1 + 64) & 1) == 0) {
    return sub_1000152E4(*(id *)(a1 + 32));
  }
  return result;
}

void sub_100015834(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  id location = sub_1000110F8();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_100017408((uint64_t)v10, v9, v8, v7);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v5,  "tellUserDeviceDisconnectedDueToDeviceLimit(%ld, %ld, %ld)",  v10,  0x20u);
  }

  objc_storeStrong(&location, 0LL);
  id v4 = 0LL;
  id v3 = 0LL;
  if (v9 <= 4) {
    __asm { BR              X8 }
  }

  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(&v4, 0LL);
}

BOOL sub_100016358()
{
  id location = sub_1000110F8();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v18;
    sub_100009998(v17);
    _os_log_impl((void *)&_mh_execute_header, log, type, "askUserAboutConnectingAudioDevice()", v17, 2u);
  }

  objc_storeStrong(&location, 0LL);
  uint64_t v1 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v16 =  -[NSBundle localizedStringForKey:value:table:]( v1,  "localizedStringForKey:value:table:",  @"AudioDeviceWillConnectTitle");

  id v2 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v15 =  -[NSBundle localizedStringForKey:value:table:]( v2,  "localizedStringForKey:value:table:",  @"AudioDeviceWillConnectMessage",  &stru_100039440,  0LL);

  v20[0] = kCFUserNotificationAlertHeaderKey;
  v21[0] = v16;
  v20[1] = kCFUserNotificationAlertMessageKey;
  v21[1] = v15;
  v20[2] = kCFUserNotificationDefaultButtonTitleKey;
  int v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  os_log_type_t v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"AudioDeviceWillConnectDefaultButtonTitle",  &stru_100039440,  0LL);
  v21[2] = v5;
  v20[3] = kCFUserNotificationAlternateButtonTitleKey;
  id v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v3 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"AudioDeviceWillConnectAlternateButtonTitle",  &stru_100039440,  0LL);
  void v21[3] = v3;
  id v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL);

  SInt32 error = 0;
  uint64_t v12 = 0x4082C00000000000LL;
  uint64_t v11 = CFUserNotificationCreate(0LL, 600.0, 1uLL, &error, (CFDictionaryRef)v14);
  CFOptionFlags responseFlags = 3LL;
  CFUserNotificationReceiveResponse(v11, 600.0, &responseFlags);
  CFRelease(v11);
  BOOL v9 = responseFlags == 0;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  return v9;
}

BOOL sub_100016714()
{
  id location = sub_1000110F8();
  os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v18;
    sub_100009998(v17);
    _os_log_impl((void *)&_mh_execute_header, log, type, "askUserAboutDisconnectingAudioDevice()", v17, 2u);
  }

  objc_storeStrong(&location, 0LL);
  uint64_t v1 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v16 =  -[NSBundle localizedStringForKey:value:table:]( v1,  "localizedStringForKey:value:table:",  @"AudioDeviceWillDisconnectTitle");

  id v2 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v15 =  -[NSBundle localizedStringForKey:value:table:]( v2,  "localizedStringForKey:value:table:",  @"AudioDeviceWillDisconnectMessage",  &stru_100039440,  0LL);

  v20[0] = kCFUserNotificationAlertHeaderKey;
  v21[0] = v16;
  v20[1] = kCFUserNotificationAlertMessageKey;
  v21[1] = v15;
  v20[2] = kCFUserNotificationDefaultButtonTitleKey;
  int v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  os_log_type_t v5 =  -[NSBundle localizedStringForKey:value:table:]( v6,  "localizedStringForKey:value:table:",  @"AudioDeviceWillDisconnectDefaultButtonTitle",  &stru_100039440,  0LL);
  v21[2] = v5;
  v20[3] = kCFUserNotificationAlternateButtonTitleKey;
  id v4 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v3 =  -[NSBundle localizedStringForKey:value:table:]( v4,  "localizedStringForKey:value:table:",  @"AudioDeviceWillDisconnectAlternateButtonTitle",  &stru_100039440,  0LL);
  void v21[3] = v3;
  id v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL);

  SInt32 error = 0;
  uint64_t v12 = 0x4082C00000000000LL;
  uint64_t v11 = CFUserNotificationCreate(0LL, 600.0, 1uLL, &error, (CFDictionaryRef)v14);
  CFOptionFlags responseFlags = 3LL;
  CFUserNotificationReceiveResponse(v11, 600.0, &responseFlags);
  CFRelease(v11);
  BOOL v9 = responseFlags == 0;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  return v9;
}

uint64_t sub_100016B00(int a1, int a2, int a3, int a4, int a5)
{
  return a5 + a4 + 2 * a3 + a2 + 4 * a1 + (a3 != 0);
}

void sub_100016B84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "DeviceEnforcementAgent");
  id v2 = (void *)qword_100041368;
  qword_100041368 = (uint64_t)v1;
}

int64_t sub_100016BD0(id a1, TVSBluetoothDevice *a2, TVSBluetoothDevice *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  char v9 = [location[0] respectsDisconnectRequests] & 1;
  char v8 = [v10 respectsDisconnectRequests] & 1;
  if ((v9 & 1) != 0 || (v8 & 1) == 0)
  {
    if ((v9 & 1) == 0 || (v8 & 1) != 0)
    {
      id v7 = [location[0] lastActivityTimeStamp];
      id v6 = [v10 lastActivityTimeStamp];
      if (v7 >= v6) {
        uint64_t v4 = v7 > v6;
      }
      else {
        uint64_t v4 = -1LL;
      }
      int64_t v12 = v4;
    }

    else
    {
      int64_t v12 = -1LL;
    }
  }

  else
  {
    int64_t v12 = 1LL;
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

uint64_t sub_100016D44(int a1)
{
  unint64_t v2 = (a1 - 8194);
  if (v2 <= 0xE) {
    __asm { BR              X8 }
  }

  return 0LL;
}

uint64_t sub_100016E60(int a1)
{
  unint64_t v2 = (a1 - 8202);
  if (v2 <= 0x15) {
    __asm { BR              X8 }
  }

  return 0LL;
}

uint64_t sub_100016FD4(int a1)
{
  unint64_t v2 = (a1 - 8212);
  if (v2 <= 0x10) {
    __asm { BR              X8 }
  }

  return 0LL;
}

BOOL sub_10001710C(unsigned int a1, int a2)
{
  unsigned int v6 = dword_1000403A0[a2];
  int v5 = 0;
  for (int i = 0; (unint64_t)i < 0xA; ++i)
  {
    unsigned int v3 = sub_100011B5C(a1, i);
    v5 += sub_100011B5C(v6, i) < v3;
  }

  return v5 == 0;
}

BOOL sub_1000171C8(int a1, int a2)
{
  unsigned int v7 = dword_1000403A0[a1];
  unsigned int v6 = dword_1000403A0[a2];
  int v5 = 0;
  for (int i = 0; (unint64_t)i < 0xA; ++i)
  {
    unsigned int v3 = sub_100011B5C(v7, i);
    v5 += v3 < sub_100011B5C(v6, i);
  }

  return v5 > 0;
}

uint64_t sub_100017290(int a1)
{
  unsigned int v7 = dword_1000403A0[a1];
  if (sub_100017350(v7))
  {
    return 7;
  }

  else
  {
    int v6 = sub_100011B5C(v7, 3);
    int v5 = sub_100011B5C(v7, 2);
    int v4 = sub_100011B5C(v7, 1);
    int v3 = sub_100011B5C(v7, 8);
    int v1 = sub_100011B5C(v7, 4);
    return sub_100016B00(v6, v5, v4, v3, v1);
  }

BOOL sub_100017350(int a1)
{
  return sub_100017380(a1) != -1;
}

uint64_t sub_100017380(int a1)
{
  for (int i = 0; i < dword_100041364; ++i)
  {
    if (dword_100041344[i] == a1) {
      return i;
    }
  }

  return -1;
}

uint64_t sub_100017408(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)BOOL result = 0;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

void sub_100017468(uint64_t a1)
{
}

void sub_10001749C(id obj)
{
  location[0] = 0LL;
  objc_storeStrong(location, obj);
  int v32 = fopen("/tmp/TVPeripheralAgentState.txt", "a");
  double Current = CFAbsoluteTimeGetCurrent();
  time_t v30 = vcvtmd_s64_f64(Current + kCFAbsoluteTimeIntervalSince1970);
  localtime_r(&v30, &v29);
  int v28 = v29.tm_year + 1900;
  int v27 = v29.tm_mon + 1;
  int tm_mday = v29.tm_mday;
  int tm_hour = v29.tm_hour;
  uint64_t v24 = *(void *)&v29.tm_sec;
  unsigned int v22 = vcvtmd_s64_f64(1000.0 * modf(Current, &v23));
  if (v32)
  {
    fprintf(v32, "%04d-%02d-%02d %02d:%02d:%02d.%03d\n", v28, v27, tm_mday, tm_hour, HIDWORD(v24), v24, v22);
    fprintf(v32, "==== Valid States and Frame Counts ====\n");
    for (int i = 0; i < dword_100041340; ++i)
    {
      fprintf(v32, "    %d : ", i);
      sub_10001ABF0(v32, dword_1000403A0[i], 1);
      int v5 = v32;
      int v1 = sub_100017290(i);
      fprintf(v5, " (%u)\n", v1);
    }

    fprintf(v32, "\n\n==== Valid Transitions ====\n");
    for (int j = 0; j < dword_100041340; ++j)
    {
      for (int k = 0; (unint64_t)k < 0xA; ++k)
      {
        unsigned int v15 = sub_1000143FC(j, k, (uint64_t)v35, (uint64_t)v34, 0x80u);
        if (v15 >= 0x80uLL) {
          fprintf(v32, "*** WARNING: more transitions of the next kind than internal limits can handle (%d)\n", v15);
        }
        int v14 = 0x7FFFFFFF;
        for (unsigned int m = 0; m < v15; ++m)
        {
          *((_DWORD *)&location[1] + (int)m) = sub_100014570(j, v35[m], v34[m]);
          else {
            int v4 = v14;
          }
          int v14 = v4;
        }

        for (unsigned int n = 0; n < v15; ++n)
        {
          int v11 = v35[n];
          int v10 = v34[n];
          unsigned int v9 = dword_1000403A0[j] - dword_1000403A0[v11];
          unsigned int v8 = 1 << byte_10002D840[4 * k + 2];
          fprintf(v32, "    %d : ", j);
          sub_10001ABF0(v32, dword_1000403A0[j], 0);
          fprintf(v32, " - ");
          sub_10001ABF0(v32, v9, 0);
          fprintf(v32, " -> %d : ", v11);
          sub_10001ABF0(v32, dword_1000403A0[v11], 0);
          fprintf(v32, " + ");
          sub_10001ABF0(v32, v8, 0);
          fprintf(v32, " -> %d : ", v10);
          sub_10001ABF0(v32, dword_1000403A0[v10], 0);
          if (j == v11)
          {
            int v3 = "*** direct ***";
          }

          else
          {
            unint64_t v2 = "*** min_score ***";
            int v3 = v2;
          }

          fprintf(v32, " (score: %d) %s\n", *((_DWORD *)&location[1] + (int)n), v3);
        }

        fprintf(v32, "\n");
      }

      fprintf(v32, "\n");
    }

    fprintf(v32, "==== Done ====\n\n");
    fclose(v32);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v7 = type;
      sub_100009998(v19);
      _os_log_error_impl((void *)&_mh_execute_header, log, v7, "Error : Unable to open file for writing", v19, 2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

void sub_100017B68(id a1, int a2)
{
  id v16 = a1;
  int v15 = a2;
  id v14 = a1;
  sub_100015834(3uLL, 0LL, 1LL);
  sub_100015834(2uLL, 0LL, 1LL);
  sub_100015834(1uLL, 0LL, 1LL);
  sub_100015834(4uLL, 0LL, 4LL);
  sub_100015834(0LL, 0LL, 2LL);
  sub_100015834(0LL, 1LL, 2LL);
  BOOL v13 = sub_100016358();
  id location = sub_1000110F8();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      unint64_t v2 = "YES";
    }
    else {
      unint64_t v2 = "NO";
    }
    sub_100017EE4((uint64_t)v20, (uint64_t)v2);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v11,  "TEST Asked user about connecting audio answer #1: %s",  v20,  0xCu);
  }

  objc_storeStrong(&location, 0LL);
  BOOL v13 = sub_100016358();
  id v10 = sub_1000110F8();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      int v3 = "YES";
    }
    else {
      int v3 = "NO";
    }
    sub_100017EE4((uint64_t)v19, (uint64_t)v3);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  v9,  "TEST Asked user about connecting audio answer #2: %s",  v19,  0xCu);
  }

  objc_storeStrong(&v10, 0LL);
  BOOL v13 = sub_100016714();
  os_log_t oslog = (os_log_t)sub_1000110F8();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      int v4 = "YES";
    }
    else {
      int v4 = "NO";
    }
    sub_100017EE4((uint64_t)v18, (uint64_t)v4);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  v7,  "TEST Asked user about disconnecting audio answer #1: %s",  v18,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  BOOL v13 = sub_100016714();
  os_log_t v6 = (os_log_t)sub_1000110F8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      int v5 = "YES";
    }
    else {
      int v5 = "NO";
    }
    sub_100017EE4((uint64_t)v17, (uint64_t)v5);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TEST Asked user about disconnecting audio answer #2: %s",  v17,  0xCu);
  }

  objc_storeStrong((id *)&v6, 0LL);
  notify_post("com.apple.TVPeripheralAgent.showPanels.done");
}

uint64_t sub_100017EE4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100017F24(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if ([v16 type] == (id)4) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST disconnecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 disconnectWithCompletion:&stru_1000389D8];
  }

LABEL_11:
}
}
}
}

void sub_1000181F0(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be disconnected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100018384(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_1000183F4(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if (![v16 type] && objc_msgSend(v16, "transportType") == (id)1) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_12;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST disconnecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 disconnectWithCompletion:&stru_100038A18];
  }

LABEL_12:
}
}
}
}
}

void sub_1000186DC(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be disconnected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100018870(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if ([v16 type] == (id)1) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST disconnecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 disconnectWithCompletion:&stru_100038A58];
  }

void sub_100018B3C(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be disconnected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100018CD0(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if ([v16 type] == (id)2) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST disconnecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 disconnectWithCompletion:&stru_100038A98];
  }

void sub_100018F9C(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be disconnected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019130(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager connectedDevices](v9, "connectedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if ([v16 type] == (id)3) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_11;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST disconnecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 disconnectWithCompletion:&stru_100038AD8];
  }

void sub_1000193FC(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be disconnected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019590(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v9, "pairedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_12;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST connecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 connectWithCompletion:&stru_100038B18];
  }

void sub_100019870(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be connected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019A04(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v9, "pairedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      if (([v16 isConnected] & 1) == 0
        && ![v16 type]
        && [v16 transportType] == (id)1)
      {
        break;
      }

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_13;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST connecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 connectWithCompletion:&stru_100038B58];
  }

LABEL_13:
}

void sub_100019D00(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be connected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100019E94(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v9, "pairedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_12;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST connecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 connectWithCompletion:&stru_100038B98];
  }

void sub_10001A174(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be connected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001A308(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v9, "pairedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_12;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST connecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 connectWithCompletion:&stru_100038BD8];
  }

void sub_10001A5E8(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be connected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001A77C(id a1, int a2)
{
  id v19 = a1;
  int v18 = a2;
  id v17 = a1;
  memset(__b, 0, sizeof(__b));
  os_log_type_t v9 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v9, "pairedDevices");

  id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v7);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v8) {
          goto LABEL_12;
        }
      }
    }

    os_log_t oslog = (os_log_t)sub_1000110F8();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v3 = type;
      id v4 = [v16 serialNumber];
      id v12 = v4;
      sub_100013988((uint64_t)v20, (uint64_t)v12);
      _os_log_impl((void *)&_mh_execute_header, log, v3, "TEST connecting device '%@'", v20, 0xCu);

      objc_storeStrong(&v12, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [v16 connectWithCompletion:&stru_100038C18];
  }

void sub_10001AA5C(id a1, TVSBluetoothDevice *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = sub_1000110F8();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v13[0];
    os_log_type_t type = v12;
    id v8 = [location[0] serialNumber];
    id v5 = v8;
    id v11 = v5;
    unsigned __int8 v3 = [location[0] isConnected];
    id v4 = "YES";
    if ((v3 & 1) == 0) {
      id v4 = "NO";
    }
    sub_100018384((uint64_t)v16, (uint64_t)v5, (uint64_t)v4, (int)[location[0] state]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "TEST device '%@' should be connected (isConnected: %s, state: %d)",  v16,  0x1Cu);

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001ABF0(FILE *a1, unsigned int a2, char a3)
{
  char v14 = a3 & 1;
  fprintf(a1, "{");
  int v13 = sub_100011B5C(a2, 3);
  char v12 = 0;
  if ((v14 & 1) != 0 || v13)
  {
    fprintf(a1, "%sAU:%u", "", v13);
    char v12 = 1;
  }

  int v11 = sub_100011B5C(a2, 2);
  if ((v14 & 1) != 0 || v11)
  {
    if ((v12 & 1) != 0) {
      unsigned __int8 v3 = " ";
    }
    else {
      unsigned __int8 v3 = "";
    }
    fprintf(a1, "%sKB:%u", v3, v11);
    char v12 = 1;
  }

  int v10 = sub_100011B5C(a2, 1);
  if ((v14 & 1) != 0 || v10)
  {
    if ((v12 & 1) != 0) {
      id v4 = " ";
    }
    else {
      id v4 = "";
    }
    fprintf(a1, "%sAR:%u", v4, v10);
    char v12 = 1;
  }

  int v9 = sub_100011B5C(a2, 8);
  if ((v14 & 1) != 0 || v9)
  {
    if ((v12 & 1) != 0) {
      id v5 = " ";
    }
    else {
      id v5 = "";
    }
    fprintf(a1, "%sBT:%u", v5, v9);
    char v12 = 1;
  }

  int v8 = sub_100011B5C(a2, 4);
  if ((v14 & 1) != 0 || v8)
  {
    if ((v12 & 1) != 0) {
      uint64_t v6 = " ";
    }
    else {
      uint64_t v6 = "";
    }
    fprintf(a1, "%sGC:%u", v6, v8);
  }

  return fprintf(a1, "}");
}

uint64_t start(int a1, void *a2)
{
  unsigned int v12 = 0;
  int v11 = a1;
  location[1] = a2;
  uint64_t v7 = objc_autoreleasePoolPush();
  location[0] = &_os_log_default;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v9;
    sub_100009998(v8);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Starting Peripheral Manager...", v8, 2u);
  }

  objc_storeStrong(location, 0LL);
  unsigned __int8 v3 = +[TVPeripheralAgentService sharedInstance](&OBJC_CLASS___TVPeripheralAgentService, "sharedInstance");
  -[TVPeripheralAgentService start](v3, "start");

  id v4 = +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop");
  -[NSRunLoop run](v4, "run");

  unsigned int v12 = 0;
  objc_autoreleasePoolPop(v7);
  return v12;
}

id sub_10001B0D8(void *a1, uint64_t a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  uint64_t v7 = a2;
  if (a2 && (objc_opt_isKindOfClass(location, v7) & 1) != 0) {
    id v2 = location;
  }
  else {
    id v2 = 0LL;
  }
  id v6 = v2;
  id v4 = v2;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  return v4;
}

void sub_10001B2A8(id a1)
{
  int v1 = objc_alloc_init(&OBJC_CLASS___TVPeripheralAgentService);
  id v2 = (void *)qword_100041378;
  qword_100041378 = (uint64_t)v1;
}

void sub_10001B2EC(void *a1, io_registry_entry_t a2, int a3, void *a4)
{
  v42 = a1;
  io_registry_entry_t v41 = a2;
  int v40 = a3;
  v39[1] = a4;
  v39[0] = a1;
  if (v39[0])
  {
    uint64_t entryID = 0LL;
    id v33 = 0LL;
    id v32 = 0LL;
    uint64_t v25 = 0LL;
    int v26 = &v25;
    int v27 = 838860800;
    int v28 = 48;
    tm v29 = sub_10001B9E4;
    time_t v30 = sub_10001BA38;
    id v31 = 0LL;
    if (v40 == -536870896)
    {
      id CFProperty = (id)IORegistryEntryCreateCFProperty(v41, @"PrimaryUsagePage", kCFAllocatorDefault, 0);
      id v4 = CFProperty;
      id v5 = v33;
      id v33 = v4;

      id v44 = (id)IORegistryEntryCreateCFProperty(v41, @"PrimaryUsage", kCFAllocatorDefault, 0);
      id v6 = v44;
      id v7 = v32;
      id v32 = v6;

      id v43 = (id)IORegistryEntryCreateCFProperty(v41, @"Transport", kCFAllocatorDefault, 0);
      obint j = v43;
      if ((sub_10001BA64(obj) & 1) != 0)
      {
        IORegistryEntryGetRegistryEntryID(v41, &entryID);
        if ([v33 unsignedIntegerValue] == (id)1 && objc_msgSend(v32, "unsignedIntegerValue") == (id)5)
        {
          [v39[0] _handleGameControllerDisconnectedWithService:v41 registryEntryID:entryID];
        }

        else if ([v33 unsignedIntegerValue] == (id)1 {
               && [v32 unsignedIntegerValue] == (id)6)
        }
        {
          [v39[0] presentPeripheralNotificationWithType:14];
        }

        else
        {
          os_log_t v21 = (os_log_t)sub_10001B96C();
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = [v33 unsignedIntegerValue];
            sub_10001BB74((uint64_t)v46, (uint64_t)v9, (uint64_t)[v32 unsignedIntegerValue]);
            _os_log_impl( (void *)&_mh_execute_header,  v21,  v20,  "Device removed notification: usagePage = 0x%lx and usage = 0x%lx",  v46,  0x16u);
          }

          objc_storeStrong((id *)&v21, 0LL);
        }

        int v8 = (void *)*((void *)v39[0] + 8);
        int v13 = _NSConcreteStackBlock;
        int v14 = -1073741824;
        int v15 = 0;
        id v16 = sub_10001BBC0;
        id v17 = &unk_100038DB0;
        uint64_t v19 = entryID;
        int v18 = &v25;
        [v8 enumerateObjectsUsingBlock:&v13];
        if (v26[5]) {
          [*((id *)v39[0] + 8) removeObject:v26[5]];
        }
        int v35 = 0;
      }

      else
      {
        os_log_t oslog = (os_log_t)sub_10001B96C();
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v33 unsignedIntegerValue];
          sub_10001BB0C((uint64_t)v47, (uint64_t)obj, (uint64_t)v10, (uint64_t)[v32 unsignedIntegerValue]);
          _os_log_impl( (void *)&_mh_execute_header,  oslog,  v22,  "Ignoring removed service with non Bluetooth transport: transport=%{public}@, usagePage=0x%lx, usage=0x%lx",  v47,  0x20u);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        int v35 = 1;
      }

      objc_storeStrong(&obj, 0LL);
    }

    else
    {
      int v35 = 1;
    }

    _Block_object_dispose(&v25, 8);
    objc_storeStrong(&v31, 0LL);
    objc_storeStrong(&v32, 0LL);
    objc_storeStrong(&v33, 0LL);
  }

  else
  {
    id location = sub_10001B96C();
    char v37 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v37;
      sub_100009998(v36);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "No ref context provided in IOKit HID Notification, ignoring device removal HID notification and skipping HUD ale rt processing (non-fatal)",  v36,  2u);
    }

    objc_storeStrong(&location, 0LL);
    int v35 = 1;
  }

  objc_storeStrong(v39, 0LL);
}

void sub_10001B95C()
{
}

id sub_10001B96C()
{
  predicate = (dispatch_once_t *)&unk_100041390;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100039078);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100041388;
}

void sub_10001B9E4(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  unsigned __int8 v3 = (id *)(a1 + 40);
  *unsigned __int8 v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_10001BA38(uint64_t a1)
{
}

uint64_t sub_10001BA64(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  char v2 = 0;
  if (([location isEqualToString:@"Bluetooth"] & 1) != 0
    || ([location isEqualToString:@"BluetoothLowEnergy"] & 1) != 0
    || ([location isEqualToString:@"BT-AACP"] & 1) != 0)
  {
    char v2 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v2 & 1;
}

uint64_t sub_10001BB0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_10001BB74(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10001BBC0(void *a1, void *a2, _BYTE *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v5 = (id)a1[5];
  if (v5 == [location[0] regID])
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), location[0]);
    *a3 = 1;
  }

  objc_storeStrong(location, 0LL);
}

void sub_10001BC60(void *a1, io_iterator_t a2)
{
  kern_return_t v38;
  io_object_t v39;
  int v40;
  uint8_t v41[7];
  char v42;
  id location;
  id v44;
  io_iterator_t v45;
  void *v46;
  id v47;
  id v48;
  id CFProperty;
  uint8_t v50[16];
  uint8_t v51[32];
  uint8_t v52[40];
  v46 = a1;
  v45 = a2;
  id v44 = a1;
  if (v44)
  {
    while (1)
    {
      char v39 = IOIteratorNext(v45);
      if (!v39)
      {
        int v40 = 0;
        goto LABEL_37;
      }

      char v38 = -536870212;
      notificatiounsigned int n = 0;
      uint64_t entryID = 0LL;
      id v35 = 0LL;
      id v34 = 0LL;
      id v33 = 0LL;
      id CFProperty = (id)IORegistryEntryCreateCFProperty(v39, @"PrimaryUsagePage", kCFAllocatorDefault, 0);
      id v2 = CFProperty;
      id v3 = v35;
      id v35 = v2;

      v48 = (id)IORegistryEntryCreateCFProperty(v39, @"PrimaryUsage", kCFAllocatorDefault, 0);
      id v4 = v48;
      id v5 = v34;
      id v34 = v4;

      v47 = (id)IORegistryEntryCreateCFProperty(v39, @"Transport", kCFAllocatorDefault, 0);
      id v32 = v47;
      if ((sub_10001BA64(v32) & 1) == 0)
      {
        os_log_t oslog = (os_log_t)sub_10001B96C();
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = oslog;
          os_log_type_t v20 = v30;
          id v17 = v32;
          id v18 = [v35 unsignedIntegerValue];
          sub_10001BB0C((uint64_t)v52, (uint64_t)v17, (uint64_t)v18, (uint64_t)[v34 unsignedIntegerValue]);
          _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Ignoring connected service with non Bluetooth transport: transport=%{public}@, usagePage=0x%lx, usage=0x%lx",  v52,  0x20u);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        int v40 = 2;
        goto LABEL_35;
      }

      IORegistryEntryGetRegistryEntryID(v39, &entryID);
      if ([v35 unsignedIntegerValue] == (id)1 && objc_msgSend(v34, "unsignedIntegerValue") == (id)5) {
        break;
      }
      if (objc_msgSend(v35, "unsignedIntegerValue", obj) == (id)1 && objc_msgSend(v34, "unsignedIntegerValue") == (id)6)
      {
        [v44 _rememberConnectedDeviceForService:v39 deviceType:2];
        goto LABEL_21;
      }

      os_log_t v29 = (os_log_t)sub_10001B96C();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = v29;
        os_log_type_t v16 = v28;
        id v14 = [v35 unsignedIntegerValue];
        sub_10001BB74((uint64_t)v51, (uint64_t)v14, (uint64_t)[v34 unsignedIntegerValue]);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Device enumeration notification: usagePage = 0x%lx and usage = 0x%lx",  v51,  0x16u);
      }

      objc_storeStrong((id *)&v29, 0LL);
      IOObjectRelease(v39);
      int v40 = 2;
LABEL_35:
      obint j = 0LL;
      objc_storeStrong(&v32, 0LL);
      objc_storeStrong(&v33, 0LL);
      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v35, 0LL);
    }

    [v44 _rememberConnectedDeviceForService:v39 deviceType:4];
    [v44 _handleGameControllerConnectedWithService:v39 registryEntryID:entryID];
LABEL_21:
    char v38 = IOServiceAddInterestNotification( *((IONotificationPortRef *)v44 + 7),  v39,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10001B2EC,  v44,  &notification);
    if (v38)
    {
      os_log_t v27 = (os_log_t)sub_10001B96C();
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unsigned int v12 = v27;
        os_log_type_t v13 = v26;
        sub_1000139C8((uint64_t)v50, v38);
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  v13,  "Failed to add IOService interest notification: 0x%x, disconnect HUD alerts may be non functional",  v50,  8u);
      }

      objc_storeStrong((id *)&v27, 0LL);
      if (notification) {
        IOObjectRelease(notification);
      }
      IOObjectRelease(v39);
      int v40 = 2;
    }

    else
    {
      if (notification)
      {
        id v6 = objc_alloc(&OBJC_CLASS___TVIOServiceNotifier);
        id v7 = -[TVIOServiceNotifier initWithRegID:ioNotification:]( v6,  "initWithRegID:ioNotification:",  entryID,  notification);
        id v8 = v33;
        id v33 = v7;

        if (v33)
        {
          [*((id *)v44 + 8) addObject:v33];
        }

        else
        {
          os_log_t v25 = (os_log_t)sub_10001B96C();
          os_log_type_t v24 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v10 = v25;
            os_log_type_t v11 = v24;
            sub_100009998(v23);
            _os_log_error_impl( (void *)&_mh_execute_header,  v10,  v11,  "Failed to retain IOService interest notification, disconnect HUD alerts may be non functional",  v23,  2u);
          }

          objc_storeStrong((id *)&v25, 0LL);
        }

        IOObjectRelease(notification);
      }

      IOObjectRelease(v39);
      int v40 = 0;
    }

    goto LABEL_35;
  }

  id location = sub_10001B96C();
  v42 = 16;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v42;
    sub_100009998(v41);
    _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "No ref context provided in IOKit HID Notification, ignoring enumeration HID notification and skipping HUD alert pr ocessing (non-fatal)",  v41,  2u);
  }

  objc_storeStrong(&location, 0LL);
  int v40 = 1;
LABEL_37:
  objc_storeStrong(&v44, 0LL);
}

uint64_t sub_10001C328(double a1, double a2)
{
  double v19 = a1;
  double v18 = a2;
  char v17 = 0;
  char v16 = 0;
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v15 = v2;
  if (v2 - v19 < 15.0)
  {
    char v17 = 1;
    id location = sub_10001B96C();
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v13;
      sub_100009998(v12);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "BTRemoteUtils: Remote connected too quickly. This means TVPeripheralAgent may have restarted. No need to show HUD",  v12,  2u);
    }

    objc_storeStrong(&location, 0LL);
  }

  if (v15 - v18 < 15.0)
  {
    char v16 = 1;
    id v11 = sub_10001B96C();
    char v10 = 16;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      id v5 = (os_log_s *)v11;
      os_log_type_t v6 = v10;
      sub_100009998(v9);
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  v6,  "BTRemoteUtils: Remote connected immediately by itself. No need to show HUD",  v9,  2u);
    }

    objc_storeStrong(&v11, 0LL);
  }

  char v4 = 0;
  if ((v16 & 1) == 0) {
    char v4 = v17 ^ 1;
  }
  return v4 & 1;
}

void sub_10001D948(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v12[2] = a1;
  queue = &_dispatch_main_q;
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10001DAAC;
  id v8 = &unk_100038DD8;
  id v9 = a1[4];
  v12[1] = a1[7];
  id v10 = a1[5];
  id v11 = location[0];
  v12[0] = a1[6];
  dispatch_async(queue, &v4);

  objc_storeStrong(v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10001DAAC(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  char v5 = [*(id *)(a1 + 32) _isDeviceConnectedWithRegistryEntryID:*(void *)(a1 + 64)] & 1;
  os_log_t oslog = (os_log_t)sub_10001B96C();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10001DC14((uint64_t)v8, *(void *)(a1 + 40), *(void *)(a1 + 64), v5 & 1);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  type,  "Completed fetch of recent application bundle identifiers for game controller connection. name=%@, registryEntryID= %llu, isGameControllerConnected=%{BOOL}d",  v8,  0x1Cu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  if ((v5 & 1) != 0)
  {
    id v2 =  [*(id *)(a1 + 32) _mostRecentlyPlayedGameFromRecentApplicationBundleIdentifiers:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) presentGameControllerConnectedNotificationWithName:*(void *)(a1 + 40) homeButtonImageID:*(void *)(a1 + 56) mostRecentlyPlayedGame:v2];
    objc_storeStrong(&v2, 0LL);
  }

uint64_t sub_10001DC14(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_10001E08C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28, uint64_t a29)
{
}

void sub_10001E0C4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v47 = a3;
  v46 = a4;
  v45[1] = (id)a1;
  v45[0] = [*(id *)(a1 + 32) objectForKey:location[0]];
  id v44 = sub_10001B96C();
  os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v44;
    os_log_type_t type = v43;
    id v20 = location[0];
    id v23 = [v45[0] localizedName];
    id v42 = v23;
    sub_10001E674((uint64_t)v53, (uint64_t)v20, (uint64_t)v42, (uint64_t)[v45[0] genre]);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Checking if app is a recently played game. bundleIdentifier=%{public}@, appName=%{public}@, appGenre=%ld",  v53,  0x20u);

    objc_storeStrong(&v42, 0LL);
  }

  objc_storeStrong(&v44, 0LL);
  if (v45[0])
  {
    if ([v45[0] genre] == (id)15)
    {
      char v41 = [*(id *)(a1 + 40) containsObject:location[0]] & 1;
      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v16 = oslog;
        os_log_type_t v17 = v39;
        id v19 = [v45[0] localizedName];
        id v15 = v19;
        id v38 = v15;
        id v18 = [v45[0] bundleIdentifier];
        id v37 = v18;
        sub_10001E6DC((uint64_t)v52, (uint64_t)v15, (uint64_t)v37, v41 & 1, *(void *)(a1 + 40));
        _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Found recently played game. name=%{public}@, bundlerIdentifier=%{public}@, isGameActive=%{BOOL}d, activeApplic ationBundleIdentifiers=%{public}@",  v52,  0x26u);

        objc_storeStrong(&v37, 0LL);
        objc_storeStrong(&v38, 0LL);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      if ((v41 & 1) != 0)
      {
        os_log_t v36 = (os_log_t)sub_10001B96C();
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = v36;
          os_log_type_t v13 = v35;
          id v14 = [v45[0] localizedName];
          id v34 = v14;
          sub_10000822C((uint64_t)v51, (uint64_t)v34);
          _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "Recently played game is active so will return nil for the most recently played game. appName=%{public}@",  v51,  0xCu);

          objc_storeStrong(&v34, 0LL);
        }

        objc_storeStrong((id *)&v36, 0LL);
      }

      else
      {
        os_log_t v33 = (os_log_t)sub_10001B96C();
        os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = v33;
          os_log_type_t v10 = v32;
          id v11 = [v45[0] localizedName];
          id v31 = v11;
          sub_10000822C((uint64_t)v50, (uint64_t)v31);
          _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Recently played game is *not* active so will return this app as the most recently played game. appName=%{public}@",  v50,  0xCu);

          objc_storeStrong(&v31, 0LL);
        }

        objc_storeStrong((id *)&v33, 0LL);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v45[0]);
      }

      _BYTE *v46 = 1;
    }

    else
    {
      os_log_t v30 = (os_log_t)sub_10001B96C();
      os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        char v5 = v30;
        os_log_type_t v6 = v29;
        id v8 = [v45[0] localizedName];
        id v4 = v8;
        id v28 = v4;
        id v7 = [v45[0] bundleIdentifier];
        id v27 = v7;
        sub_10001E758((uint64_t)v49, (uint64_t)v4, (uint64_t)v27);
        _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "Ignoring recent app as its not a game. name=%{public}@, bundlerIdentifier=%{public}@",  v49,  0x16u);

        objc_storeStrong(&v27, 0LL);
        objc_storeStrong(&v28, 0LL);
      }

      objc_storeStrong((id *)&v30, 0LL);
    }
  }

  objc_storeStrong(v45, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001E674(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t sub_10001E6DC(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose((const void *)(v29 - 152), 8) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t sub_10001E758(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

unint64_t sub_10001F9F8(id a1, PBSMigrationContext *a2, id *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  char v3 = TVSMigrateConnectedPeripheralsPreferences();
  uint64_t v4 = 3LL;
  if ((v3 & 1) == 0) {
    uint64_t v4 = 2LL;
  }
  unint64_t v6 = v4;
  objc_storeStrong(location, 0LL);
  return v6;
}

unint64_t sub_10001FA7C(id a1, PBSMigrationContext *a2, id *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unsigned __int8 v3 = +[NSUserDefaults tvps_migrate](&OBJC_CLASS___NSUserDefaults, "tvps_migrate");
  uint64_t v4 = 3LL;
  if ((v3 & 1) == 0) {
    uint64_t v4 = 2LL;
  }
  unint64_t v6 = v4;
  objc_storeStrong(location, 0LL);
  return v6;
}

void sub_10001FB0C(os_log_s *a1, os_log_s *a2, os_log_s *a3, os_log_s *a4, os_log_s *a5)
{
  oslog[5] = a1;
  oslog[4] = a2;
  oslog[3] = a3;
  oslog[2] = a4;
  oslog[1] = a5;
  oslog[0] = (os_log_t)sub_10001B96C();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v6 = type;
    sub_100009998(v7);
    _os_log_impl((void *)&_mh_execute_header, log, v6, "Language changed. Restarting Peripheral Agent", v7, 2u);
  }

  objc_storeStrong((id *)oslog, 0LL);
  exit(0);
}

void sub_10001FBAC(uint64_t a1, int a2)
{
  uint64_t v40 = a1;
  int v39 = a2;
  uint64_t v38 = a1;
  char v37 = 0;
  memset(__b, 0, sizeof(__b));
  id v18 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  obint j = -[TVSBluetoothManager pairedDevices](v18, "pairedDevices");

  id v20 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
  if (v20)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0LL;
    id v16 = v20;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(id *)(__b[1] + 8 * v15);
      if ([v36 type] == (id)1) {
        break;
      }
      ++v15;
      if (v13 + 1 >= (unint64_t)v16)
      {
        uint64_t v15 = 0LL;
        id v16 = [obj countByEnumeratingWithState:__b objects:v41 count:16];
        if (!v16) {
          goto LABEL_9;
        }
      }
    }

    char v37 = 1;
    int v34 = 2;
  }

  else
  {
LABEL_9:
    int v34 = 0;
  }

  if ((v37 & 1) != 0)
  {
    os_log_t v23 = (os_log_t)sub_10001B96C();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = v23;
      os_log_type_t v3 = v22;
      sub_100009998(v21);
      _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "Setup has finished and we already have a paired remote so will *NOT* start scanning for factory and preferred remotes",  v21,  2u);
    }

    objc_storeStrong((id *)&v23, 0LL);
  }

  else
  {
    id v11 = [*(id *)(a1 + 32) bluetoothRemotePairingAgent];
    unsigned __int8 v12 = [v11 isPairing];

    if ((v12 & 1) != 0)
    {
      os_log_t v26 = (os_log_t)sub_10001B96C();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = v26;
        os_log_type_t v5 = v25;
        sub_100009998(v24);
        _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "Setup has finished, we have no paired remotes but we are actively pairing. Will *NOT* start scanning for facto ry and preferred remotes",  v24,  2u);
      }

      objc_storeStrong((id *)&v26, 0LL);
    }

    else
    {
      os_log_t oslog = (os_log_t)sub_10001B96C();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v10 = type;
        sub_100009998(v31);
        _os_log_impl( (void *)&_mh_execute_header,  log,  v10,  "Setup has finished, we have no paired remotes and are not actively pairing. Will start scanning for factory an d preferred remotes",  v31,  2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      id location = [*(id *)(a1 + 32) bluetoothRemoteDiscoveryHelper];
      if ([location shouldStart])
      {
        [location start];
      }

      else
      {
        os_log_t v29 = (os_log_t)sub_10001B96C();
        os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = v29;
          os_log_type_t v8 = v28;
          sub_100009998(v27);
          _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "No remote discovery workarounds required for factory & preferred pairing",  v27,  2u);
        }

        objc_storeStrong((id *)&v29, 0LL);
      }

      id v6 = [*(id *)(a1 + 32) bluetoothRemotePairingAgent];
      [v6 startFactoryPairing];

      objc_storeStrong(&location, 0LL);
    }
  }

void sub_100020074(id *a1, int a2)
{
  uint64_t v38 = a1;
  int v37 = a2;
  location[1] = a1;
  location[0] = sub_10001B96C();
  os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v35;
    sub_100009998(v34);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Proximity pairing signal detected", v34, 2u);
  }

  objc_storeStrong(location, 0LL);
  id v33 = [a1[4] bluetoothRemoteDiscoveryHelper];
  if ([v33 shouldStart])
  {
    id v32 = sub_10001B96C();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (os_log_s *)v32;
      os_log_type_t v17 = v31;
      sub_100009998(v30);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Remote discovery workarounds are required for proximity pairing",  v30,  2u);
    }

    objc_storeStrong(&v32, 0LL);
    if ([a1[4] isSuppressingDisconnectHUDDuringProximityPairing])
    {
      id v26 = sub_10001B96C();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (os_log_s *)v26;
        os_log_type_t v8 = v25;
        id v9 = [a1[4] hudSuppressionDataStore];
        id v24 = v9;
        sub_10000822C((uint64_t)v39, (uint64_t)v24);
        _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "Disconnect HUD is already being suppressed while handling proximity pairing. HUDSuppressionDataStore=%{public}@",  v39,  0xCu);

        objc_storeStrong(&v24, 0LL);
      }

      objc_storeStrong(&v26, 0LL);
    }

    else
    {
      id v15 = [a1[4] hudSuppressionDataStore];
      uint64_t v14 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      uint64_t v13 = -[NSBundle bundleIdentifier](v14, "bundleIdentifier");
      objc_msgSend(v15, "beginSuppressingWithOptions:forClientBundleIdentifier:", 2);

      [a1[4] setSuppressingDisconnectHUDDuringProximityPairing:1];
      id v29 = sub_10001B96C();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v10 = (os_log_s *)v29;
        os_log_type_t v11 = v28;
        id v12 = [a1[4] hudSuppressionDataStore];
        id v27 = v12;
        sub_10000822C((uint64_t)v40, (uint64_t)v27);
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Disconnect HUD will be suppressed while handling proximity pairing. HUDSuppressionDataStore=%{public}@",  v40,  0xCu);

        objc_storeStrong(&v27, 0LL);
      }

      objc_storeStrong(&v29, 0LL);
    }

    [v33 start];
  }

  else
  {
    id v23 = sub_10001B96C();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v5 = (os_log_s *)v23;
      os_log_type_t v6 = v22;
      sub_100009998(v21);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "No remote discovery workarounds required for proximity pairing",  v21,  2u);
    }

    objc_storeStrong(&v23, 0LL);
  }

  id v3 = [a1[4] bluetoothRemotePairingAgent];
  BOOL v4 = [v3 pairingMode] == (id)2;

  if (!v4)
  {
    id v2 = [a1[4] bluetoothRemotePairingAgent];
    [v2 startProximityPairing];

    [a1[4] presentPeripheralNotificationWithType:7];
  }

  objc_storeStrong(&v33, 0LL);
}

void sub_100020548(id *a1, int a2)
{
  os_log_type_t v10 = a1;
  int v9 = a2;
  location[1] = a1;
  location[0] = sub_10001B96C();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v7;
    sub_100009998(v6);
    _os_log_impl((void *)&_mh_execute_header, log, type, "MFi Auth failure detected", v6, 2u);
  }

  objc_storeStrong(location, 0LL);
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth.siriremote.action", &stru_100038EC8);
  id v2 = [a1[4] bluetoothRemotePairingAgent];
  [v2 unpairAllRemotes];
}

NSDictionary *__cdecl sub_10002062C(id a1)
{
  return (NSDictionary *)&off_10003B1B0;
}

void sub_10002064C(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  id v3 = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
  if (v3 == (id)1)
  {
    id location =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
    if (location) {
      [*(id *)(a1 + 32) _checkBatteryLevelForRemote:location reason:1];
    }
    objc_storeStrong(&location, 0LL);
  }

void sub_1000206F4(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  id v4 = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
  id v3 = +[PBSSystemStatus systemDisplayState](&OBJC_CLASS___PBSSystemStatus, "systemDisplayState");
  if (v3 == (id)2 && v4 == (id)1)
  {
    id location =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
    if (location) {
      [*(id *)(a1 + 32) _checkBatteryLevelForRemote:location reason:2];
    }
    objc_storeStrong(&location, 0LL);
  }

uint64_t sub_100022200(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 66;
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
  return result;
}

id sub_10002227C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkBatteryLevelForRemote:reason:", *(void *)(a1 + 40), 3, a1, a1);
}

void sub_100022E54( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  *(void *)(v9 - 216) = a1;
  *(_DWORD *)(v9 - 220) = a2;
  _Block_object_dispose((const void *)(v9 - 208), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 216));
}

void sub_100022E8C(uint64_t a1, void *a2, _BYTE *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = [location[0] name];
  id v5 = [*(id *)(a1 + 32) name];
  unsigned __int8 v7 = objc_msgSend(v6, "isEqual:");

  if ((v7 & 1) != 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  objc_storeStrong(location, 0LL);
}

void sub_100022F64(uint64_t a1)
{
  v12[2] = (id)a1;
  v12[1] = (id)a1;
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 32) isConnected] & 1) == 0
    && (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) & 1) != 0)
  {
    v12[0] = sub_10001B96C();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v12[0];
      os_log_type_t type = v11;
      id v5 = [*(id *)(a1 + 32) name];
      id v10 = v5;
      sub_10000822C((uint64_t)v13, (uint64_t)v10);
      _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "BTRemoteUtils: Remote did not reconnect; showing HUD for %{public}@",
        v13,
        0xCu);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong(v12, 0LL);
    [*(id *)(a1 + 40) presentRemoteDisconnectedNotification:*(void *)(a1 + 32)];
  }

  else
  {
    id v9 = sub_10001B96C();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      int v1 = (os_log_s *)v9;
      os_log_type_t v2 = v8;
      sub_100009998(v7);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "BTRemoteUtils: Remote reconnected immediately", v7, 2u);
    }

    objc_storeStrong(&v9, 0LL);
  }

uint64_t sub_100023C18(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 1_Block_object_dispose((const void *)(v29 - 152), 8) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t sub_100023C84( uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 2_Block_object_dispose((const void *)(v29 - 152), 8) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(_BYTE *)(result + 3_Block_object_dispose((const void *)(v29 - 152), 8) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  *(_BYTE *)(result + 4_Block_object_dispose((const void *)(v29 - 152), 8) = 0;
  *(_BYTE *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  *(_BYTE *)(result + 5_Block_object_dispose((const void *)(v29 - 152), 8) = 0;
  *(_BYTE *)(result + 59) = 8;
  *(void *)(result + 60) = a8;
  *(_BYTE *)(result + 6_Block_object_dispose((const void *)(v29 - 152), 8) = 66;
  *(_BYTE *)(result + 69) = 8;
  *(void *)(result + 70) = a9;
  return result;
}

uint64_t sub_100023D54(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_100023DA4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)BOOL result = 2;
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

NSDictionary *__cdecl sub_100023FE0(id a1)
{
  return (NSDictionary *)&off_10003B1D8;
}

void sub_100024684()
{
}

void sub_100024694(id *a1, int a2)
{
  id v10 = a1;
  int v9 = a2;
  location[1] = a1;
  location[0] = sub_10001B96C();
  char v7 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v7;
    sub_100009998(v6);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Game Controller Battery: got kIOPSAccNotifyAttach callback",  v6,  2u);
  }

  objc_storeStrong(location, 0LL);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained refreshGameControllerPowerSources];
}

void sub_100024758(id *a1, int a2)
{
  id v10 = a1;
  int v9 = a2;
  location[1] = a1;
  location[0] = sub_10001B96C();
  char v7 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v7;
    sub_100009998(v6);
    _os_log_debug_impl( (void *)&_mh_execute_header,  log,  type,  "Game Controller Battery: got kIOPSAccNotifyTimeRemaining callback",  v6,  2u);
  }

  objc_storeStrong(location, 0LL);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained updateBatteryState];
}

uint64_t sub_100024AE0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)BOOL result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100025488(id a1, BOOL a2, NSError *a3)
{
  id v7 = a1;
  BOOL v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10001B96C();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100013988((uint64_t)v8, (uint64_t)location);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Presented headphone banner withh error %@",  v8,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_1000256E4(id a1, BOOL a2, NSError *a3)
{
  id v7 = a1;
  BOOL v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10001B96C();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100013988((uint64_t)v8, (uint64_t)location);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Presented headphone banner withh error %@",  v8,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100025F4C(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  objc_storeStrong(&location, 0LL);
}

void sub_100026350()
{
}

void sub_100026360(uint64_t *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10001B96C();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10002647C((uint64_t)v8, a1[4], (uint64_t)v6);
    _os_log_impl( (void *)&_mh_execute_header,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "Launched game with bundle identifier %{public}@. error=%@",  v8,  0x16u);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10002647C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10002692C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVPeripheralAgent", "TVPeripheralAgentService");
  os_log_type_t v2 = (void *)qword_100041388;
  qword_100041388 = (uint64_t)v1;
}

NSDictionary *sub_100026DD8(uint64_t a1)
{
  v6[0] = @"batteryLevel";
  id v5 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) batteryLevel]);
  v7[0] = v5;
  v6[1] = @"remoteType";
  id v3 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) remoteType]);
  v7[1] = v3;
  BOOL v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

uint64_t sub_1000273D8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_10002742C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

NSDictionary *sub_100027480(uint64_t a1)
{
  v6[0] = @"batteryLevel";
  id v5 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 40));
  v7[0] = v5;
  v6[1] = @"remoteType";
  id v3 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) remoteType]);
  v7[1] = v3;
  BOOL v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

NSDictionary *sub_100027D98(uint64_t a1)
{
  v6[0] = @"batteryLevel";
  id v5 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) batteryLevel]);
  v7[0] = v5;
  v6[1] = @"remoteType";
  id v3 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) remoteType]);
  v7[1] = v3;
  BOOL v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

uint64_t sub_100028580(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)BOOL result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

NSDictionary *sub_1000285D0(uint64_t a1)
{
  v6[0] = @"batteryLevel";
  id v5 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 40));
  v7[0] = v5;
  v6[1] = @"remoteType";
  id v3 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) remoteType]);
  v7[1] = v3;
  BOOL v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL);

  return v4;
}

id sub_100028700(id *a1)
{
  v29[2] = a1;
  v29[1] = a1;
  v29[0] = [a1[4] firstObject];
  id v28 = [a1[4] lastObject];
  id v5 = (void *)objc_opt_class(a1[5]);
  id v7 = [v28 timestamp];
  id v6 = [v29[0] timestamp];
  id v8 = objc_msgSend(v5, "_daysSinceFromDate:toDate:", v7);

  v27[1] = v8;
  v27[0] = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [a1[6] identifier];
  objc_msgSend(v27[0], "setObject:forKey:");

  id v10 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a1[6] remoteType]);
  objc_msgSend(v27[0], "setObject:forKey:");

  id v26 = objc_msgSend( (id)objc_opt_class(a1[5]),  "_batteryRangeEventFieldValueForBatteryRange:",  objc_msgSend(v29[0], "batteryRange"));
  os_log_type_t v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v26);
  objc_msgSend(v27[0], "setObject:forKey:");

  id v25 = objc_msgSend( (id)objc_opt_class(a1[5]),  "_batteryRangeEventFieldValueForBatteryRange:",  objc_msgSend(v28, "batteryRange"));
  uint64_t v13 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v25);
  objc_msgSend(v27[0], "setObject:forKey:");

  uint64_t v14 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v8);
  objc_msgSend(v27[0], "setObject:forKey:");

  for (unint64_t i = 1LL; i <= 0x13; ++i)
  {
    os_log_t v1 = (void *)objc_opt_class(a1[5]);
    id location = [v1 _daysSinceBatteryRangeEventFieldNameForBatteryRange:i];
    if (location) {
      [v27[0] setObject:&off_10003B178 forKey:location];
    }
    objc_storeStrong(&location, 0LL);
  }

  id v3 = a1[4];
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_100028B84;
  id v19 = &unk_1000390F0;
  id v20 = a1[5];
  id v21 = v29[0];
  id v22 = v27[0];
  [v3 enumerateObjectsUsingBlock:&v15];
  id v4 = v27[0];
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(v29, 0LL);
  return v4;
}

void sub_100028B84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v17 = a3;
  uint64_t v16 = a4;
  uint64_t v15 = a1;
  if (a3)
  {
    id v14 = [location[0] batteryRange];
    id v13 =  [(id)objc_opt_class(*(void *)(a1 + 32)) _daysSinceBatteryRangeEventFieldNameForBatteryRange:v14];
    if (v13)
    {
      id v4 = (void *)objc_opt_class(*(void *)(a1 + 32));
      id v6 = [location[0] timestamp];
      id v5 = [*(id *)(a1 + 40) timestamp];
      id v7 = objc_msgSend(v4, "_daysSinceFromDate:toDate:", v6);

      id v8 = *(void **)(a1 + 48);
      id v9 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7);
      objc_msgSend(v8, "setObject:forKey:");
    }

    objc_storeStrong(&v13, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

NSDictionary *sub_100028FA0(uint64_t a1)
{
  v7[0] = @"previousRemoteType";
  id v6 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 32) remoteType]);
  v8[0] = v6;
  v7[1] = @"previousBatteryLevel";
  id v5 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 48));
  v8[1] = v5;
  void v7[2] = @"remoteType";
  id v3 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [*(id *)(a1 + 40) remoteType]);
  v8[2] = v3;
  id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  3LL);

  return v4;
}

id objc_msgSend_addPermanentObserverForProperty_notifyInitial_invokeOnMainThread_handler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:");
}

id objc_msgSend_gameControllerConnectedPeripheralUserNotificationWithName_homeButtonImageID_mostRecentlyPlayedGame_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "gameControllerConnectedPeripheralUserNotificationWithName:homeButtonImageID:mostRecentlyPlayedGame:");
}

id objc_msgSend_presentGameControllerConnectedNotificationWithName_homeButtonImageID_mostRecentlyPlayedGame_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "presentGameControllerConnectedNotificationWithName:homeButtonImageID:mostRecentlyPlayedGame:");
}

id objc_msgSend_vendorIdentifierAndProductIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorIdentifierAndProductIdentifier:");
}