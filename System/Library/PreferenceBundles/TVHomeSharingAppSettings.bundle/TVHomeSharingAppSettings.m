id sub_1D5C()
{
  if (qword_CD90 != -1) {
    dispatch_once(&qword_CD90, &stru_8218);
  }
  return (id)qword_CD88;
}

void sub_1D9C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ApplicationDelegate");
  v2 = (void *)qword_CD88;
  qword_CD88 = (uint64_t)v1;
}

id sub_1DCC()
{
  if (qword_CDA0 != -1) {
    dispatch_once(&qword_CDA0, &stru_8238);
  }
  return (id)qword_CD98;
}

void sub_1E0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ChangeSetDataSource");
  v2 = (void *)qword_CD98;
  qword_CD98 = (uint64_t)v1;
}

id sub_1E3C()
{
  if (qword_CDB0 != -1) {
    dispatch_once(&qword_CDB0, &stru_8258);
  }
  return (id)qword_CDA8;
}

void sub_1E7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "DiffableDataSource");
  v2 = (void *)qword_CDA8;
  qword_CDA8 = (uint64_t)v1;
}

id sub_1EAC()
{
  if (qword_CDC0 != -1) {
    dispatch_once(&qword_CDC0, &stru_8278);
  }
  return (id)qword_CDB8;
}

void sub_1EEC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ImageProxyQueueLoader");
  v2 = (void *)qword_CDB8;
  qword_CDB8 = (uint64_t)v1;
}

id sub_1F1C()
{
  if (qword_CDD0 != -1) {
    dispatch_once(&qword_CDD0, &stru_8298);
  }
  return (id)qword_CDC8;
}

void sub_1F5C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MainSceneDelegate");
  v2 = (void *)qword_CDC8;
  qword_CDC8 = (uint64_t)v1;
}

id sub_1F8C()
{
  if (qword_CDE0 != -1) {
    dispatch_once(&qword_CDE0, &stru_82B8);
  }
  return (id)qword_CDD8;
}

void sub_1FCC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "MediaEntityFetching");
  v2 = (void *)qword_CDD8;
  qword_CDD8 = (uint64_t)v1;
}

id sub_1FFC()
{
  if (qword_CDF0 != -1) {
    dispatch_once(&qword_CDF0, &stru_82D8);
  }
  return (id)qword_CDE8;
}

void sub_203C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playback");
  v2 = (void *)qword_CDE8;
  qword_CDE8 = (uint64_t)v1;
}

id sub_206C()
{
  if (qword_CE00 != -1) {
    dispatch_once(&qword_CE00, &stru_82F8);
  }
  return (id)qword_CDF8;
}

void sub_20AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Playlist");
  v2 = (void *)qword_CDF8;
  qword_CDF8 = (uint64_t)v1;
}

id sub_20DC()
{
  if (qword_CE10 != -1) {
    dispatch_once(&qword_CE10, &stru_8318);
  }
  return (id)qword_CE08;
}

void sub_211C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "PPT");
  v2 = (void *)qword_CE08;
  qword_CE08 = (uint64_t)v1;
}

id sub_214C()
{
  if (qword_CE20 != -1) {
    dispatch_once(&qword_CE20, &stru_8338);
  }
  return (id)qword_CE18;
}

void sub_218C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "RootViewController");
  v2 = (void *)qword_CE18;
  qword_CE18 = (uint64_t)v1;
}

id sub_21BC()
{
  if (qword_CE30 != -1) {
    dispatch_once(&qword_CE30, &stru_8358);
  }
  return (id)qword_CE28;
}

void sub_21FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "ScreenSaver");
  v2 = (void *)qword_CE28;
  qword_CE28 = (uint64_t)v1;
}

id sub_222C()
{
  if (qword_CE40 != -1) {
    dispatch_once(&qword_CE40, &stru_8378);
  }
  return (id)qword_CE38;
}

void sub_226C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Search");
  v2 = (void *)qword_CE38;
  qword_CE38 = (uint64_t)v1;
}

id sub_229C()
{
  if (qword_CE50 != -1) {
    dispatch_once(&qword_CE50, &stru_8398);
  }
  return (id)qword_CE48;
}

void sub_22DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "Settings");
  v2 = (void *)qword_CE48;
  qword_CE48 = (uint64_t)v1;
}

id sub_230C()
{
  if (qword_CE60 != -1) {
    dispatch_once(&qword_CE60, &stru_83B8);
  }
  return (id)qword_CE58;
}

void sub_234C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "URLHandler");
  v2 = (void *)qword_CE58;
  qword_CE58 = (uint64_t)v1;
}

id sub_237C()
{
  if (qword_CE70 != -1) {
    dispatch_once(&qword_CE70, &stru_83D8);
  }
  return (id)qword_CE68;
}

void sub_23BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVHomeSharing", "UserInterface");
  v2 = (void *)qword_CE68;
  qword_CE68 = (uint64_t)v1;
}

__CFString *sub_23EC(unint64_t a1)
{
  if (a1 > 2) {
    return 0LL;
  }
  else {
    return off_83F8[a1];
  }
}

void sub_28B4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "allowDAAPServerDiscovery") ^ 1);
}

void sub_2CD8(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___TVHAppSettingsFacade);
  v2 = (void *)qword_CE78;
  qword_CE78 = (uint64_t)v1;
}
}

CFStringRef sub_3448(uint64_t a1)
{
  else {
    return *(&off_8518 + a1 - 1);
  }
}

void sub_34E4(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) _init];
  v2 = (void *)qword_CE88;
  qword_CE88 = (uint64_t)v1;
}

void sub_3AF0(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  v2 = *(void **)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaServerIdentifier]);
  [v4 setObject:v2 forKey:v3];
}

void sub_3C20(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaServerByIdentifier]);
  [v1 removeAllObjects];
}

uint64_t sub_4234(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t sub_424C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_4260(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 24LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_4274(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_4288(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_429C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_42B0(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_42C4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_42D8(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_42EC(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80LL) = *(void *)(result + 40);
  return result;
}

uint64_t sub_4300(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88LL) = *(void *)(result + 40);
  return result;
}

id sub_4314(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMediaServerByIdentifier:*(void *)(a1 + 40)];
}

LABEL_20:
  return v14;
}

void sub_5120(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "No media server identifier representation found in dictionary: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_5194(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "Unable to convert media server identifier representation into object",  v1,  2u);
}

id objc_msgSend_setMediaServerDiscoveryConfigurationWithMode_homeSharingAccountName_homeSharingPassword_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setMediaServerDiscoveryConfigurationWithMode:homeSharingAccountName:homeSharingPassword:completionHandler:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}