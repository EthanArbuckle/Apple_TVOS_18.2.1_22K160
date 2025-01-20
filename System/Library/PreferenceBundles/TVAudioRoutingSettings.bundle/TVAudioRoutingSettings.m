void sub_37D8(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5[2];
  id location[2];
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  v3 = v5[0];
  v4 = [v5[0] routeConnection];
  objc_msgSend(v3, "_metadataDidChange:forKeys:");

  objc_storeStrong(v5, 0LL);
  objc_storeStrong(location, 0LL);
}
}

id sub_429C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_43B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

void sub_576C( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 48) = a1;
  *(_DWORD *)(v12 - 52) = a2;
  objc_destroyWeak((id *)(v12 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 48));
}

id sub_57AC(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v38 = 0LL;
  objc_storeStrong(&v38, a3);
  v37[1] = a1;
  v37[0] = objc_loadWeakRetained(a1 + 4);
  id v11 = [v37[0] routingController];
  unsigned __int8 v12 = [v11 isLocalRouteAVR];

  char v36 = v12 & 1;
  char v33 = 0;
  char v31 = 0;
  char v29 = 0;
  char v27 = 0;
  if ((v12 & 1) != 0)
  {
    v34 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v37[0]));
    char v33 = 1;
    v32 =  -[NSBundle localizedStringForKey:value:table:]( v34,  "localizedStringForKey:value:table:",  @"DefaultAudioOutputReceiverSpeakersDescription",  0LL,  @"Localizable");
    char v31 = 1;
    v3 = v32;
  }

  else
  {
    v30 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v37[0]));
    char v29 = 1;
    v28 =  -[NSBundle localizedStringForKey:value:table:]( v30,  "localizedStringForKey:value:table:",  @"DefaultAudioOutputTVSpeakersDescription",  0LL,  @"Localizable");
    char v27 = 1;
    v3 = v28;
  }

  id v35 = v3;
  if ((v27 & 1) != 0) {

  }
  if ((v29 & 1) != 0) {
  if ((v31 & 1) != 0)
  }

  if ((v33 & 1) != 0) {
  char v24 = 0;
  }
  char v22 = 0;
  if ([v38 isLocal])
  {
    v4 = (NSString *)v35;
  }

  else
  {
    v25 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v37[0]));
    char v24 = 1;
    v23 =  -[NSBundle localizedStringForKey:value:table:]( v25,  "localizedStringForKey:value:table:",  @"DefaultAudioOutputHomePodDescription",  0LL,  @"Localizable");
    char v22 = 1;
    v4 = v23;
  }

  id v26 = v4;
  if ((v22 & 1) != 0) {

  }
  if ((v24 & 1) != 0) {
  id v7 = [v38 title];
  }
  id v21 =  +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:");

  id v8 = v21;
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_5CF8;
  v18 = &unk_28658;
  id v19 = v37[0];
  id v20 = v38;
  if (IsAppleInternalBuild([v8 setUpdateBlock:&v14]))
  {
    v13 =  +[TSKKonamiCode codeWithSequence:action:]( &OBJC_CLASS___TSKKonamiCode,  "codeWithSequence:action:",  &off_2A6C0,  "activateKonamiCode");
    [v21 setTarget:v37[0]];
    [v21 addKonamiCode:v13];
    objc_storeStrong((id *)&v13, 0LL);
  }

  id v6 = v21;
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

void sub_5CF8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14 = a1;
  id v9 = location[0];
  unsigned __int8 v10 = 1;
  [v9 setEnabled:v10 & 1];
  id v5 = location[0];
  unsigned __int8 v6 = 1;
  [v5 setCanFocus:v6 & 1];
  v13 = (char *)[v15 unsignedIntegerValue];
  if (v13 == (_BYTE *)&dword_0 + 2)
  {
    [location[0] setAccessoryTypes:2];
  }

  else if (v13 == (_BYTE *)&dword_0 + 1)
  {
    [location[0] setAccessoryTypes:4];
  }

  else
  {
    [location[0] setAccessoryTypes:0];
  }

  LOBYTE(v4) = 0;
  char v12 = v4 & 1;
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  id v11 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"RoutingViewControllerSettingUpText",  0LL,  @"Localizable");

  if ((v4 & 1) != 0) {
    [location[0] setLocalizedValue:v11];
  }
  else {
    [location[0] setLocalizedValue:0];
  }
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_63AC( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id *location)
{
  *(void *)(v24 - 72) = a1;
  *(_DWORD *)(v24 - 76) = a2;
  objc_destroyWeak((id *)(v24 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v24 - 72));
}

void sub_6428(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  v14[1] = a1;
  v14[0] = objc_loadWeakRetained(a1 + 4);
  id v7 = [v14[0] routingController];
  id v8 = [v7 homeDestinationController];
  id v9 = [v8 destination];
  unsigned __int8 v10 = 0;
  if (v9) {
    unsigned __int8 v10 = +[TVSDevice supportsARCAndEARC](&OBJC_CLASS___TVSDevice, "supportsARCAndEARC");
  }

  unsigned __int8 v13 = v10 & 1;
  id v12 = 0LL;
  v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v14[0]));
  id v11 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"PlayTelevisionAudioStandardDescription",  0LL,  @"eARC");

  unsigned int v4 = (char *)[v15 integerValue] + 1;
  if ((unint64_t)v4 <= 4) {
    __asm { BR              X8 }
  }

  [location[0] setHidden:(v13 ^ 1) & 1];
  [location[0] setLocalizedValue:v12];
  [location[0] setLocalizedDescription:v11];
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_69E8(id a1, NSDictionary *a2, NSError *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = 0LL;
  objc_storeStrong(&v4, a3);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_6F08( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id *location)
{
  *(void *)(v23 - 120) = a1;
  *(_DWORD *)(v23 - 124) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v23 - 72));
  _Unwind_Resume(*(_Unwind_Exception **)(v23 - 120));
}

void sub_6F74(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v5 = location[0];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v6 = [WeakRetained _temporaryRoutesTitle];
  objc_msgSend(v5, "setLocalizedTitle:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_71F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, int a21, _Unwind_Exception *exception_object)
{
}

id sub_7220(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v17 = 0LL;
  objc_storeStrong(&v17, a3);
  v16[1] = (id)a1;
  v16[0] = [v17 title];
  if ([v17 isLocal])
  {
    id v12 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
    id v11 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"OutputTitleLocal",  @"%@");
    unsigned __int8 v10 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
    id v9 =  -[NSBundle localizedStringForKey:value:table:]( v10,  "localizedStringForKey:value:table:",  @"TVSpeakersTitle",  @"TV Speakers",  @"Localizable");
    v3 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v11, v9);
    id v4 = v16[0];
    v16[0] = v3;
  }

  id v6 = v16[0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v15 =  +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6);

  [v15 setUpdateBlock:&stru_28768];
  id v8 = v15;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

void sub_74A0(id a1, TSKSettingItem *a2, id a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  v9[1] = a1;
  v9[0] = [location[0] representedObject];
  char v8 = [v9[0] canBeGrouped] & 1;
  id v7 = (char *)[v10 unsignedIntegerValue];
  if (v7 == (_BYTE *)&dword_0 + 2 || v7 == (_BYTE *)&dword_0 + 1)
  {
    uint64_t v3 = 2048LL;
    if ((v8 & 1) == 0) {
      uint64_t v3 = 2LL;
    }
  }

  else
  {
    uint64_t v3 = 1024LL;
    if ((v8 & 1) == 0) {
      uint64_t v3 = 0LL;
    }
  }

  [location[0] setAccessoryTypes:v3];
  [location[0] setLocalizedValue:location];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(v4, 0LL);
}

void sub_7FA4(id a1)
{
}

void sub_7FD8(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = @"/AppleInternal/Library/Application Support/TVSettingsMultiChannelAudioTestFiles/dolby-atmos-trailer_leaf_1080.mp4";
  [*(id *)(a1 + 32) presentPlayerWithAssetPath:v2[0] fromViewController:*(void *)(a1 + 40)];
  objc_storeStrong(v2, 0LL);
}

void sub_803C(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = @"/AppleInternal/Library/Application Support/TVSettingsMultiChannelAudioTestFiles/channel_ID_714_speech.ec3";
  [*(id *)(a1 + 32) presentPlayerWithAssetPath:v2[0] fromViewController:*(void *)(a1 + 40)];
  objc_storeStrong(v2, 0LL);
}

void sub_80A0(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = @"/AppleInternal/Library/Application Support/TVSettingsMultiChannelAudioTestFiles/channel_ID_51_speech.wav";
  [*(id *)(a1 + 32) presentPlayerWithAssetPath:v2[0] fromViewController:*(void *)(a1 + 40)];
  objc_storeStrong(v2, 0LL);
}

void sub_8104(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = @"/AppleInternal/Library/Application Support/TVSettingsMultiChannelAudioTestFiles/channel_ID_71_speech.wav";
  [*(id *)(a1 + 32) presentPlayerWithAssetPath:v2[0] fromViewController:*(void *)(a1 + 40)];
  objc_storeStrong(v2, 0LL);
}

void sub_9FA4()
{
}

void sub_9FB4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPGroupableRoutingController", "");
  v2 = (void *)qword_31C20;
  qword_31C20 = (uint64_t)v1;
}

uint64_t sub_A000(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_A040(uint64_t a1, void *a2)
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

uint64_t sub_A464(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_B544(void *a1, void *a2)
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

uint64_t sub_B610(uint64_t result, int a2, int a3, int a4, int a5)
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

uint64_t sub_B680(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_B6D0(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_31C20;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_A000((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Add Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_B7C4(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_31C20;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_A464((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Set Picked Route result: %@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_BC1C(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_31C20;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_A000((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Remove Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_BFD4(uint64_t a1, char a2, id obj)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v10[1] = (id)a1;
  v10[0] = *(id *)(a1 + 32);
  if (location)
  {
    os_log_t oslog = (os_log_t)(id)qword_31C20;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_A464((uint64_t)v14, (uint64_t)location);
      _os_log_error_impl(&dword_0, oslog, OS_LOG_TYPE_ERROR, "Error updating media destination %@", v14, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    id v9 = (id)qword_31C20;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_A464((uint64_t)v15, *(void *)(a1 + 40));
      _os_log_impl(&dword_0, (os_log_t)v9, v8, "Successfully updated media destination to %@", v15, 0xCu);
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

void sub_C704(id *a1)
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

void sub_CA98(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_CAEC(uint64_t a1)
{
}

void sub_CB18(uint64_t a1)
{
  id v16[2] = (id)a1;
  v16[1] = (id)a1;
  id v3 = *(void **)(a1 + 32);
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = sub_CCB4;
  v14 = &unk_28AA0;
  v15[1] = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  v15[0] = *(id *)(a1 + 40);
  [v3 fetchAvailableRoutesWithCompletionHandler:&v10];
  os_log_t v1 = *(void **)(a1 + 48);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_CD54;
  os_log_type_t v8 = &unk_28AC8;
  v9[1] = *(id *)(a1 + 64);
  v9[0] = *(id *)(a1 + 40);
  [v1 fetchAvailableRoutesWithCompletionHandler:&v4];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_destroyWeak(v16);
}

void sub_CC74(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void sub_CCB4(uint64_t a1, void *a2)
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

void sub_CD54(uint64_t a1, void *a2)
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

void sub_CDD4(uint64_t a1)
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

uint64_t sub_10318(uint64_t result, uint64_t a2, uint64_t a3)
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

uint64_t sub_10368(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  id v9[2] = a4;
  v9[1] = a1;
  id v11 = (id)MRAVOutputDeviceCopyUniqueIdentifier(location[0]);
  v9[0] = v11;
  unsigned __int8 v8 = [v9[0] isEqual:a1[4]];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

uint64_t sub_10424(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

void sub_1048C(id *a1, void *a2, void *a3)
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
    id location[3] = &dword_0 + 1;
    id location[2] = v4 - 1;
    location[4] = &dword_0 + 1;
    location[5] = v4 - 1;
    id v5 = objc_msgSend(v9, "subarrayWithRange:", 1, v4 - 1);
    id v6 = v13;
    id v13 = v5;

    [a1[5] setObject:v13 forKey:location[0]];
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

int64_t sub_10604(id a1, TVNPRoute *a2, TVNPRoute *a3)
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

uint64_t sub_10900(uint64_t result, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
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

uint64_t sub_109BC( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
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

uint64_t sub_12184(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_129B8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPEndpointRouteConnection", "");
  id v2 = (void *)qword_31C30;
  qword_31C30 = (uint64_t)v1;
}

  ;
}

void sub_13404(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v11 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_31C30;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v5 = type;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MRMediaRemoteCopyCommandDescription(*(unsigned int *)(a1 + 48));
    id v6 = [*(id *)(a1 + 32) route];
    id v8 = v6;
    sub_13564((uint64_t)v13, v2, v3, (uint64_t)v8, v11);
    _os_log_impl(&dword_0, log, v5, "(%{public}@) Send %{public}@ to route %@, status: %{public}@", v13, 0x2Au);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)oslog, 0LL);
  if ((*(_BYTE *)(a1 + 52) & 1) == 0) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t sub_13564(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

id sub_13704(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetadata];
}

void sub_157E4()
{
}

void sub_157F4(id *a1, void *a2, void *a3)
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
  id v9 = sub_15960;
  id v10 = &unk_28C40;
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

void sub_15960(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14[0])
  {
    id location = (id)qword_31C30;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_B680((uint64_t)v16, *(void *)(a1 + 32), *(void *)(a1 + 40));
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

id sub_15DBC(uint64_t *a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_31C30;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_A000((uint64_t)v4, a1[4]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Connection did invalidate: %{public}@", v4, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  return [(id)a1[4] _updateState];
}

void sub_16250()
{
}

uint64_t sub_16260(uint64_t result, uint64_t a2, uint64_t a3, int a4)
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

void sub_162CC(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_163C0;
  int v8 = &unk_28C90;
  objc_copyWeak(v10, a1 + 4);
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v10);
  objc_storeStrong(location, 0LL);
}

void sub_163C0(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  v8[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8[0])
  {
    id v7 = (id)qword_31C30;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      id v3 = [v8[0] route];
      id v5 = v3;
      sub_B680((uint64_t)v9, (uint64_t)v5, *(void *)(a1 + 32));
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

id sub_17E18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_17F2C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_18044(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

uint64_t sub_1860C(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
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

_BYTE *sub_19974(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id objc_msgSend_updateLocalAccessoryAudioDestination_forceUpdateWithUnavailableDestination_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}