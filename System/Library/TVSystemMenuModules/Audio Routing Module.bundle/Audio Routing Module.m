void sub_515C()
{
  _Unwind_Exception *v0;
  _Unwind_Resume(v0);
}

void sub_516C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPGroupableRoutingController", "");
  v2 = (void *)qword_5EDA0;
  qword_5EDA0 = (uint64_t)v1;
}

uint64_t sub_51B8(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_51F8(uint64_t a1, void *a2)
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

uint64_t sub_561C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}
}

uint64_t sub_66FC(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4 = (void *)a1[4];
  id v6 = [location[0] mediaProfile];
  id v5 = [v6 routeUID];
  unsigned __int8 v7 = objc_msgSend(v4, "containsObject:");

  objc_storeStrong(location, 0LL);
  return v7 & 1;
}

uint64_t sub_67C8(uint64_t result, int a2, int a3, int a4, int a5)
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

uint64_t sub_6838(uint64_t result, uint64_t a2, uint64_t a3)
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

void sub_6888(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5EDA0;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_51B8((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Add Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_697C(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5EDA0;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_561C((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Set Picked Route result: %@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_6DD4(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5EDA0;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_51B8((uint64_t)v5, (uint64_t)location[0]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Remove Picked Route result: %{public}@", v5, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_718C(uint64_t a1, char a2, id obj)
{
  uint64_t v13 = a1;
  char v12 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  v10[1] = (id)a1;
  v10[0] = *(id *)(a1 + 32);
  if (location)
  {
    os_log_t oslog = (os_log_t)(id)qword_5EDA0;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_561C((uint64_t)v14, (uint64_t)location);
      _os_log_error_impl(&dword_0, oslog, OS_LOG_TYPE_ERROR, "Error updating media destination %@", v14, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    id v9 = (id)qword_5EDA0;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      sub_561C((uint64_t)v15, *(void *)(a1 + 40));
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

void sub_78BC(id *a1)
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

void sub_7C50(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_7CA4(uint64_t a1)
{
}

void sub_7CD0(uint64_t a1)
{
  v16[2] = (id)a1;
  v16[1] = (id)a1;
  id v3 = *(void **)(a1 + 32);
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = sub_7E6C;
  v14 = &unk_509B0;
  v15[1] = *(id *)(a1 + 56);
  objc_copyWeak(v16, (id *)(a1 + 72));
  v15[0] = *(id *)(a1 + 40);
  [v3 fetchAvailableRoutesWithCompletionHandler:&v10];
  os_log_t v1 = *(void **)(a1 + 48);
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_7F0C;
  os_log_type_t v8 = &unk_509D8;
  v9[1] = *(id *)(a1 + 64);
  v9[0] = *(id *)(a1 + 40);
  [v1 fetchAvailableRoutesWithCompletionHandler:&v4];
  objc_storeStrong(v9, 0LL);
  objc_storeStrong(v15, 0LL);
  objc_destroyWeak(v16);
}

void sub_7E2C(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void sub_7E6C(uint64_t a1, void *a2)
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

void sub_7F0C(uint64_t a1, void *a2)
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

void sub_7F8C(uint64_t a1)
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

uint64_t sub_B4D0(uint64_t result, uint64_t a2, uint64_t a3)
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

uint64_t sub_B520(void *a1, void *a2, void *a3, void *a4)
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

uint64_t sub_B5DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

void sub_B644(id *a1, void *a2, void *a3)
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

int64_t sub_B7BC(id a1, TVNPRoute *a2, TVNPRoute *a3)
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

uint64_t sub_BAB8(uint64_t result, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
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

uint64_t sub_BB74( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9)
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

uint64_t sub_D33C(uint64_t result, uint64_t a2, uint64_t a3)
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

_BYTE *sub_E03C(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_E058(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0LL;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0LL);
}

void sub_E0AC(uint64_t a1)
{
}

uint64_t sub_E0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_51B8((uint64_t)v10, v8);
    _os_log_impl( &dword_0,  oslog[0],  OS_LOG_TYPE_DEFAULT,  "ROUTING: Fetch Active Endpoint Complete: %{public}@",  v10,  0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  id v2 = [(id)MRAVEndpointGetUniqueIdentifier(v8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_E1EC(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
}

void sub_10048(id *a1)
{
  v38[2] = a1;
  v38[1] = a1;
  v38[0] = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v37 = @"@@PLUS@@";
  id v9 = v38[0];
  id v10 = [a1[4] traitCollection];
  v36 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-up",  v9);

  v35 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v35, "setImage:", v36);
  v34 = @"@@MINUS@@";
  id v11 = v38[0];
  id v12 = [a1[4] traitCollection];
  v33 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-dwn",  v11);

  v32 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v32, "setImage:", v33);
  __int16 v30 = -4;
  v31 = +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", &v30);
  id v14 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  unsigned int v13 = v31;
  NSAttributedStringKey v43 = NSAttachmentAttributeName;
  v44 = v35;
  v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL);
  v29 = -[NSAttributedString initWithString:attributes:](v14, "initWithString:attributes:", v13);

  id v17 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  v16 = v31;
  NSAttributedStringKey v41 = NSAttachmentAttributeName;
  v42 = v32;
  char v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL);
  v28 = -[NSAttributedString initWithString:attributes:](v17, "initWithString:attributes:", v16);

  char v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v27 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"MasterVolumeText",  &stru_51CA0,  0LL);

  id v22 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v21 = v27;
  NSAttributedStringKey v39 = NSBaselineOffsetAttributeName;
  v40 = &off_52D48;
  v23 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL);
  int64_t v26 = -[NSMutableAttributedString initWithString:attributes:](v22, "initWithString:attributes:", v21);

  id v25 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@PLUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v25,  v1,  v29);
  id v2 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  uint64_t v3 = v27;
  v27 = v2;

  id v24 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@MINUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v24,  v4,  v28);
  id v5 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  uint64_t v6 = v27;
  v27 = v5;

  id v7 = -[NSMutableAttributedString copy](v26, "copy");
  uint64_t v8 = (void *)qword_5EDA8;
  qword_5EDA8 = (uint64_t)v7;

  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong((id *)&v35, 0LL);
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(v38, 0LL);
}

void sub_10620(id *a1)
{
  v38[2] = a1;
  v38[1] = a1;
  v38[0] = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v37 = @"@@PLUS@@";
  id v9 = v38[0];
  id v10 = [a1[4] traitCollection];
  v36 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-up",  v9);

  v35 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v35, "setImage:", v36);
  v34 = @"@@MINUS@@";
  id v11 = v38[0];
  id v12 = [a1[4] traitCollection];
  v33 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"nowplaying_volumebtn-dwn",  v11);

  v32 = -[NSTextAttachment initWithData:ofType:]( objc_alloc(&OBJC_CLASS___NSTextAttachment),  "initWithData:ofType:",  0LL);
  -[NSTextAttachment setImage:](v32, "setImage:", v33);
  __int16 v30 = -4;
  v31 = +[NSString stringWithCharacters:length:](&OBJC_CLASS___NSString, "stringWithCharacters:length:", &v30);
  id v14 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  unsigned int v13 = v31;
  NSAttributedStringKey v43 = NSAttachmentAttributeName;
  v44 = v35;
  v15 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL);
  v29 = -[NSAttributedString initWithString:attributes:](v14, "initWithString:attributes:", v13);

  id v17 = objc_alloc(&OBJC_CLASS___NSAttributedString);
  v16 = v31;
  NSAttributedStringKey v41 = NSAttachmentAttributeName;
  v42 = v32;
  char v18 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL);
  v28 = -[NSAttributedString initWithString:attributes:](v17, "initWithString:attributes:", v16);

  char v20 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(a1[4]));
  v27 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"PressAndHoldForVolumeText",  &stru_51CA0,  0LL);

  id v22 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v21 = v27;
  NSAttributedStringKey v39 = NSBaselineOffsetAttributeName;
  v40 = &off_52D48;
  v23 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL);
  int64_t v26 = -[NSMutableAttributedString initWithString:attributes:](v22, "initWithString:attributes:", v21);

  id v25 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@PLUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v25,  v1,  v29);
  id v2 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  uint64_t v3 = v27;
  v27 = v2;

  id v24 = -[NSString rangeOfString:](v27, "rangeOfString:", @"@@MINUS@@");
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v26,  "replaceCharactersInRange:withAttributedString:",  v24,  v4,  v28);
  id v5 = (NSString *)-[NSMutableAttributedString string](v26, "string");
  uint64_t v6 = v27;
  v27 = v5;

  id v7 = -[NSMutableAttributedString copy](v26, "copy");
  uint64_t v8 = (void *)qword_5EDB8;
  qword_5EDB8 = (uint64_t)v7;

  objc_storeStrong((id *)&v26, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong((id *)&v35, 0LL);
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(v38, 0LL);
}

NSCollectionLayoutSection *__cdecl sub_10CB0(id a1, int64_t a2, NSCollectionLayoutEnvironment *a3)
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v19[1] = a1;
  id v10 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:");
  id v9 =  +[NSCollectionLayoutDimension absoluteDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "absoluteDimension:",  200.0);
  v19[0] =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v10);

  char v18 =  +[NSCollectionLayoutItem itemWithLayoutSize:]( &OBJC_CLASS___NSCollectionLayoutItem,  "itemWithLayoutSize:",  v19[0]);
  id v11 = v19[0];
  id v21 = v18;
  id v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL);
  id v17 =  +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:subitems:]( &OBJC_CLASS___NSCollectionLayoutGroup,  "horizontalGroupWithLayoutSize:subitems:",  v11);

  v16 =  +[NSCollectionLayoutSection sectionWithGroup:]( &OBJC_CLASS___NSCollectionLayoutSection,  "sectionWithGroup:",  v17);
  -[NSCollectionLayoutSection setInterGroupSpacing:](v16, "setInterGroupSpacing:", 132.0);
  id v13 = [location[0] container];
  [v13 effectiveContentSize];

  id v14 = v16;
  sub_10F98();
  -[NSCollectionLayoutSection setContentInsets:](v14, "setContentInsets:", v3, v4, v5, v6);
  v15 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

  ;
}

void sub_110F0( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 40) = a1;
  *(_DWORD *)(v11 - 44) = a2;
  objc_destroyWeak((id *)(v11 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 40));
}

id sub_1114C(id *a1, void *a2, id obj)
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0LL;
  objc_storeStrong(location, obj);
  v27[1] = a1;
  id v3 = objc_alloc(&OBJC_CLASS____UICollectionViewListLayoutSectionConfiguration);
  v27[0] = [v3 initWithAppearanceStyle:0 layoutEnvironment:location[0]];
  [v27[0] setEstimatedRowHeight:103.0];
  id v4 = objc_alloc(&OBJC_CLASS____UICollectionViewListLayoutSection);
  id v26 = [v4 initWithConfiguration:v27[0] layoutEnvironment:location[0]];
  id v18 = [location[0] container];
  [v18 effectiveContentSize];
  v25[5] = v5;
  v25[6] = v6;
  double v19 = (*(double *)&v5 - 760.0) / 2.0;

  v25[7] = *(id *)&v19;
  sub_10F98();
  v25[1] = v7;
  v25[2] = v8;
  v25[3] = v9;
  v25[4] = v10;
  objc_msgSend(v26, "setContentInsets:", *(double *)&v7, *(double *)&v8, *(double *)&v9, *(double *)&v10);
  [v26 setInterGroupSpacing:14.0];
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v22 = [WeakRetained routesCollectionViewController];
  id v21 = [v22 currentSnapshot];
  BOOL v24 = (uint64_t)[v21 numberOfSections] <= 1;

  if (!v24)
  {
    v15 =  +[NSCollectionLayoutDimension fractionalWidthDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "fractionalWidthDimension:",  1.0);
    id v14 =  +[NSCollectionLayoutDimension estimatedDimension:]( &OBJC_CLASS___NSCollectionLayoutDimension,  "estimatedDimension:",  60.0);
    id v13 =  +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:]( &OBJC_CLASS___NSCollectionLayoutSize,  "sizeWithWidthDimension:heightDimension:",  v15);
    v25[0] =  +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:elementKind:alignment:]( &OBJC_CLASS___NSCollectionLayoutBoundarySupplementaryItem,  "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:");

    id v16 = v26;
    id v29 = v25[0];
    id v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL);
    objc_msgSend(v16, "setBoundarySupplementaryItems:");

    [v26 setSupplementaryContentInsetsReference:0];
    objc_storeStrong(v25, 0LL);
  }

  id v12 = v26;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

id sub_13114(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_configureAppearanceForControlState:withAnimationCoordinator:",  objc_msgSend(*(id *)(a1 + 32), "_controlStateForCell"),  0);
}

void sub_13A18(id a1)
{
  id v4[2] = a1;
  v4[1] = a1;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVNPBaseRoutingDestinationCollectionViewCell);
  uint64_t v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  v4[0] =  +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:");

  id v2 = v4[0];
  id v3 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL);
  objc_msgSend(v2, "setFocusAnimationConfiguration:");

  [v4[0] setCornerRadius:12.0];
  [v4[0] setContinuousCornerEnabled:1];
  objc_storeStrong(v4, 0LL);
}

void sub_14EBC(id a1)
{
  uint64_t v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  id v2 = (void *)qword_5EDD0;
  qword_5EDD0 = (uint64_t)v1;

  id v3 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  id v4 = (void *)qword_5EDD8;
  qword_5EDD8 = (uint64_t)v3;

  uint64_t v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  double v6 = (void *)qword_5EDE0;
  qword_5EDE0 = (uint64_t)v5;

  id v7 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  uint64_t v8 = (void *)qword_5EDE8;
  qword_5EDE8 = (uint64_t)v7;

  id v9 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  id v10 = (void *)qword_5EDF0;
  qword_5EDF0 = (uint64_t)v9;

  uint64_t v11 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
  id v12 = (void *)qword_5EDF8;
  qword_5EDF8 = (uint64_t)v11;

  id v13 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.05);
  id v14 = (void *)qword_5EE00;
  qword_5EE00 = (uint64_t)v13;

  v15 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
  id v16 = (void *)qword_5EE08;
  qword_5EE08 = (uint64_t)v15;
}

id sub_15084(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 112LL);
  double v3 = 0.3;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  double v4 = 0.5;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    double v4 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:v4];
  double v5 = 0.5;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    double v5 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:v5];
  double v6 = 0.3;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    double v6 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 88) setAlpha:v6];
  double v7 = 0.3;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0) {
    double v7 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 96) setAlpha:v7];
  v15 = *(void **)(*(void *)(a1 + 32) + 112LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    [v15 setTextColor:qword_5EDD0];
  }
  else {
    [v15 setTextColor:qword_5EDD8];
  }
  id v13 = *(void **)(*(void *)(a1 + 32) + 88LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    [v13 setTintColor:qword_5EDD0];
  }
  else {
    [v13 setTintColor:qword_5EDD8];
  }
  id v12 = *(void **)(*(void *)(a1 + 32) + 96LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    [v12 setTintColor:qword_5EDD0];
  }
  else {
    [v12 setTintColor:qword_5EDD8];
  }
  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 120LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    [v11 setTextColor:qword_5EDE0];
  }
  else {
    [v11 setTextColor:qword_5EDE8];
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 136LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    [v10 setTintColor:qword_5EDE0];
  }
  else {
    [v10 setTintColor:qword_5EDE8];
  }
  id v9 = *(void **)(*(void *)(a1 + 32) + 80LL);
  if ((*(_BYTE *)(a1 + 41) & 1) != 0) {
    return objc_msgSend(v9, "setBackgroundColor:", qword_5EE00, qword_5EE00);
  }
  else {
    return objc_msgSend(v9, "setBackgroundColor:", qword_5EE08, qword_5EE08);
  }
}

void sub_15E10( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  *(void *)(v13 - 64) = a1;
  *(_DWORD *)(v13 - 68) = a2;
  objc_destroyWeak((id *)(v13 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 64));
}

id sub_15E6C(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v18 = 0LL;
  objc_storeStrong(&v18, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  v16[1] = a1;
  v16[0] = objc_loadWeakRetained(a1 + 4);
  id v10 = location[0];
  double v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationCollectionViewCell);
  uint64_t v11 = NSStringFromClass(v4);
  id v15 = objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");

  id v12 = [v16[0] destinationsByIdentifier];
  id v14 = [v12 objectForKey:v17];

  [v15 setDestination:v14];
  id v13 = [v18 item];
  if (v13 == [v16[0] initialFocusIndex]
    && ([v16[0] shouldFocusInitialIndex] & 1) != 0)
  {
    [v15 useFocusedAppearance];
  }

  id v6 = v15;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

uint64_t sub_16528(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v4 = [location[0] uniqueIdentifier];
  unsigned __int8 v5 = [v4 isEqual:a1[4]];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

uint64_t sub_165CC(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_16DD0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 layoutIfNeeded];
}

void sub_17484( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, int a48, int a49, uint64_t a50,id location)
{
}

void sub_174E0(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v2 = [location[0] collectionView];
    id v1 = [location[0] _indexPathForCurrentDestination];
    objc_msgSend(v2, "scrollToItemAtIndexPath:atScrollPosition:animated:");
  }

  objc_storeStrong(location, 0LL);
}

LABEL_10:
  return v11 & 1;
}

void sub_1859C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:16 animated:0];
}

void sub_18B84(id *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v2 = [a1[4] viewControllerDelegate];
    [v2 viewControllerDidRequestDismissal:a1[4] cancelled:0];
  }

  else
  {
    queue = &_dispatch_main_q;
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    double v7 = sub_18C94;
    uint64_t v8 = &unk_50B50;
    v9[0] = a1[4];
    dispatch_async(queue, &v4);

    objc_storeStrong(v9, 0LL);
  }

void sub_18C94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewControllerDelegate];
  [v2 viewControllerDidRequestDismissal:*(void *)(a1 + 32) cancelled:0];
}

uint64_t sub_18CF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_18D30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_18D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id *sub_18F34(id *result)
{
  if (result[4] == *((id *)result[5] + 7)) {
    return (id *)[result[5] setVolumeBulletin:0];
  }
  return result;
}

void sub_1AB08()
{
}

  ;
}

  ;
}

void sub_1AB90(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v6 = 0LL;
  objc_storeStrong(&v6, a3);
  v5[1] = a1;
  v5[0] = objc_loadWeakRetained(a1 + 4);
  if (v5[0]) {
    objc_msgSend( v5[0],  "_configureAppearanceForControlState:withAnimationCoordinator:",  objc_msgSend(v5[0], "_controlStateForCell"),  0);
  }
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1B0F0(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_configureAppearanceForControlState:withAnimationCoordinator:",  objc_msgSend(*(id *)(a1 + 32), "_controlStateForCell"),  0);
}

void sub_1D39C(id a1)
{
  id v4[2] = a1;
  v4[1] = a1;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVNPBaseRouteCollectionViewCell);
  id v1 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL);
  v4[0] =  +[_UIFloatingContentView appearanceWhenContainedInInstancesOfClasses:]( &OBJC_CLASS____UIFloatingContentView,  "appearanceWhenContainedInInstancesOfClasses:");

  id v2 = v4[0];
  double v3 =  +[_UIFocusAnimationConfiguration configurationWithStyle:]( &OBJC_CLASS____UIFocusAnimationConfiguration,  "configurationWithStyle:",  2LL);
  objc_msgSend(v2, "setFocusAnimationConfiguration:");

  [v4[0] setCornerRadius:12.0];
  [v4[0] setContinuousCornerEnabled:1];
  objc_storeStrong(v4, 0LL);
}

void sub_1E8A8(id a1)
{
  id v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
  id v2 = (void *)qword_5EE28;
  qword_5EE28 = (uint64_t)v1;

  double v3 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
  id v4 = (void *)qword_5EE30;
  qword_5EE30 = (uint64_t)v3;

  uint64_t v5 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  id v6 = (void *)qword_5EE38;
  qword_5EE38 = (uint64_t)v5;

  double v7 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:");
  uint64_t v8 = (void *)qword_5EE40;
  qword_5EE40 = (uint64_t)v7;

  id v9 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  id v10 = (void *)qword_5EE48;
  qword_5EE48 = (uint64_t)v9;

  uint64_t v11 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
  id v12 = (void *)qword_5EE50;
  qword_5EE50 = (uint64_t)v11;
}

id sub_1EA04(uint64_t a1)
{
  id v26 = *(void **)(*(void *)(a1 + 32) + 144LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v26 setTextColor:qword_5EE28];
  }
  else {
    [v26 setTextColor:qword_5EE30];
  }
  BOOL v24 = *(void **)(*(void *)(a1 + 32) + 152LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v24 setTextColor:qword_5EE38];
  }
  else {
    [v24 setTextColor:qword_5EE40];
  }
  v23 = *(void **)(*(void *)(a1 + 32) + 136LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v23 setTintColor:qword_5EE38];
  }
  else {
    [v23 setTintColor:qword_5EE40];
  }
  id v22 = *(void **)(*(void *)(a1 + 32) + 104LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v22 setTintColor:qword_5EE28];
  }
  else {
    [v22 setTintColor:qword_5EE30];
  }
  id v21 = *(void **)(*(void *)(a1 + 32) + 112LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v21 setTintColor:qword_5EE28];
  }
  else {
    [v21 setTintColor:qword_5EE30];
  }
  char v20 = *(void **)(*(void *)(a1 + 32) + 160LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v20 setTintColor:qword_5EE48];
  }
  else {
    [v20 setTintColor:qword_5EE50];
  }
  double v19 = *(void **)(*(void *)(a1 + 32) + 120LL);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0) {
    [v19 setTintColor:qword_5EE28];
  }
  else {
    [v19 setTintColor:qword_5EE30];
  }
  id v16 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v17 = [*(id *)(a1 + 32) _checkmarkImage:*(_BYTE *)(a1 + 41) & 1];
  objc_msgSend(v16, "setImage:");

  double v1 = 0.3;
  if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
    double v1 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 144) setAlpha:v1];
  id v18 = *(void **)(*(void *)(a1 + 32) + 104LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0 || (*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    [v18 setAlpha:0.0];
  }

  else
  {
    double v2 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v2 = 1.0;
    }
    [v18 setAlpha:v2];
  }

  id v15 = *(void **)(*(void *)(a1 + 32) + 112LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0 || (*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    [v15 setAlpha:0.0];
  }

  else
  {
    double v3 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v3 = 1.0;
    }
    [v15 setAlpha:v3];
  }

  id v14 = *(void **)(*(void *)(a1 + 32) + 160LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v14 setAlpha:0.0];
  }

  else
  {
    double v4 = 0.5;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v4 = 1.0;
    }
    [v14 setAlpha:v4];
  }

  char v13 = 1;
  if ((*(_BYTE *)(a1 + 43) & 1) == 0) {
    char v13 = *(_BYTE *)(a1 + 45);
  }
  double v5 = 0.0;
  if ((v13 & 1) == 0) {
    double v5 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 120) setAlpha:v5];
  double v6 = 1.0;
  if ((*(_BYTE *)(a1 + 43) & 1) == 0) {
    double v6 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 168) setAlpha:v6];
  id v12 = *(void **)(*(void *)(a1 + 32) + 168LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v12 setMaxBarWidth:1.79769313e308];
  }

  else
  {
    sub_1AB64();
    [v12 setMaxBarWidth:v7];
  }

  uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 152LL);
  if ((*(_BYTE *)(a1 + 43) & 1) != 0)
  {
    [v11 setAlpha:0.0];
  }

  else
  {
    double v8 = 0.3;
    if ((*(_BYTE *)(a1 + 42) & 1) == 0) {
      double v8 = 1.0;
    }
    [v11 setAlpha:v8];
  }

  id v10 = *(void **)(*(void *)(a1 + 32) + 80LL);
  if ((*(_BYTE *)(a1 + 46) & 1) != 0) {
    return [v10 setTintColor:qword_5EE28];
  }
  else {
    return [v10 setTintColor:qword_5EE30];
  }
}

LABEL_9:
  v15[0] = -[TVNPRoute destination](v18->_route, "destination");
  id v14 = [v15[0] isCurrentDestination] & 1;
  char v13 = -[TVNPRoute canBeGrouped](v18->_route, "canBeGrouped");
  double v8 = 0;
  if ((v14 & 1) == 0) {
    double v8 = v13;
  }
  id v12 = v8 & 1;
  if ((v8 & 1) != 0) {
    double v7 = v16;
  }
  else {
    double v7 = 0LL;
  }
  id v16 = v7;
  -[TVNPBaseRouteCollectionViewCell setMusicBarState:](v18, "setMusicBarState:", v7);
  uint64_t v11 = 0LL;
  if (v7 == 1 || v16 == 2)
  {
    double v6 = -[TVNPRoute destination](v18->_route, "destination");
    double v5 = -[TVNPRoutingDestination singleLineTitle](v6, "singleLineTitle");
    double v2 = -[NSString copy](v5, "copy");
    double v3 = v11;
    uint64_t v11 = v2;
  }

  -[TVNPRouteCollectionViewCell setNowPlayingInfoText:](v18, "setNowPlayingInfoText:", v11, &v11);
  -[TVNPRouteCollectionViewCell _resolveSubtitleText](v18, "_resolveSubtitleText");
  objc_storeStrong(location, 0LL);
  objc_storeStrong(v15, 0LL);
}

id sub_2275C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_22870(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_22988(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

uint64_t sub_22F50(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7)
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

void sub_252B8(id *a1, void *a2)
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

id sub_25D7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

id sub_25E90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVolume", a1, a1);
}

BOOL sub_274AC(id a1, UIPress *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] type] == &dword_4;
  objc_storeStrong(location, 0LL);
  return v3;
}

void sub_27778(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVNowPlayingService.TVNPEndpointRouteConnection", "");
  double v2 = (void *)qword_5EE68;
  qword_5EE68 = (uint64_t)v1;
}

  ;
}

void sub_281C4(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v11 = a2;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5EE68;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v5 = type;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = MRMediaRemoteCopyCommandDescription(*(unsigned int *)(a1 + 48));
    id v6 = [*(id *)(a1 + 32) route];
    id v8 = v6;
    sub_28324((uint64_t)v13, v2, v3, (uint64_t)v8, v11);
    _os_log_impl(&dword_0, log, v5, "(%{public}@) Send %{public}@ to route %@, status: %{public}@", v13, 0x2Au);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong((id *)oslog, 0LL);
  if ((*(_BYTE *)(a1 + 52) & 1) == 0) {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

uint64_t sub_28324(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

id sub_284C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetadata];
}

void sub_2A5A4()
{
}

void sub_2A5B4(id *a1, void *a2, void *a3)
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
  id v9 = sub_2A720;
  id v10 = &unk_510D0;
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

void sub_2A720(uint64_t a1)
{
  id v14[2] = (id)a1;
  v14[1] = (id)a1;
  v14[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v14[0])
  {
    id location = (id)qword_5EE68;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_6838((uint64_t)v16, *(void *)(a1 + 32), *(void *)(a1 + 40));
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

id sub_2AB7C(uint64_t *a1)
{
  os_log_t oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)(id)qword_5EE68;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_51B8((uint64_t)v4, a1[4]);
    _os_log_impl(&dword_0, oslog[0], OS_LOG_TYPE_DEFAULT, "Connection did invalidate: %{public}@", v4, 0xCu);
  }

  objc_storeStrong((id *)oslog, 0LL);
  return [(id)a1[4] _updateState];
}

void sub_2B010()
{
}

uint64_t sub_2B020(uint64_t result, uint64_t a2, uint64_t a3, int a4)
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

void sub_2B08C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_2B180;
  int v8 = &unk_51120;
  objc_copyWeak(v10, a1 + 4);
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(v10);
  objc_storeStrong(location, 0LL);
}

void sub_2B180(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  v8[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8[0])
  {
    id v7 = (id)qword_5EE68;
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v7;
      os_log_type_t type = v6;
      id v3 = [v8[0] route];
      id v5 = v3;
      sub_6838((uint64_t)v9, (uint64_t)v5, *(void *)(a1 + 32));
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

void sub_2C210( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id *location)
{
  *(void *)(v38 - 104) = a1;
  *(_DWORD *)(v38 - 108) = a2;
  objc_destroyWeak((id *)(v38 - 96));
  _Unwind_Resume(*(_Unwind_Exception **)(v38 - 104));
}

void sub_2C28C(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  id v5 = [v6[0] delegate];
  [v5 viewControllerDidRequestDismissal:v6[0] cancelled:1];

  objc_storeStrong(v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_2C6C8()
{
  qword_5EE70 = (uint64_t)objc_getClass("BTShareAudioViewController");
  off_5EB70 = (uint64_t (*)())sub_2C77C;
  return (id)qword_5EE70;
}

uint64_t sub_2C704()
{
  predicate = (dispatch_once_t *)&unk_5EE78;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_51190);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_5EE80;
}

id sub_2C77C()
{
  return (id)qword_5EE70;
}

void sub_2C788(id a1)
{
  qword_5EE80 = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/BluetoothServicesUI.framework/BluetoothServicesUI",  2);
}

void sub_2F694( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id *a28, uint64_t a29, uint64_t a30, id *location)
{
  *(void *)(v31 - 64) = a1;
  *(_DWORD *)(v31 - 68) = a2;
  objc_destroyWeak((id *)(v31 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v31 - 64));
}

id sub_2F718(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v25 = 0LL;
  objc_storeStrong(&v25, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  v23[1] = a1;
  v23[0] = objc_loadWeakRetained(a1 + 4);
  char v22 = [v24 isEqualToString:@"TVNPShareAudioItemIdentifier"] & 1;
  id v17 = location[0];
  char v19 = 0;
  if (v22)
  {
    id v4 = [location[0] dequeueReusableCellWithReuseIdentifier:@"TVNPShareAudioItemIdentifier" forIndexPath:v25];
  }

  else
  {
    id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVNPRouteCollectionViewCell);
    char v20 = NSStringFromClass(v5);
    char v19 = 1;
    id v4 = [v17 dequeueReusableCellWithReuseIdentifier:v20 forIndexPath:v25];
  }

  id v21 = v4;
  if ((v19 & 1) != 0) {

  }
  if ((v22 & 1) != 0)
  {
    id v13 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v23[0]));
    os_log_type_t v12 =  -[NSBundle localizedStringForKey:value:table:]( v13,  "localizedStringForKey:value:table:",  @"ShareAudioTitle",  &stru_51CA0,  0LL);
    objc_msgSend(v21, "setTitleText:");

    [v21 setAllowsGrouping:0];
    [v21 setShareAudio:1];
    [v21 setDelegate:v23[0]];
  }

  else
  {
    id v9 = [v23[0] routesByUID];
    id v18 = [v9 objectForKey:v24];

    [v21 setRoute:v18];
    [v21 setShareAudio:0];
    id v11 = v21;
    id v10 = v18;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVNPGroupedRoute);
    objc_msgSend(v11, "setGroupLeader:", objc_opt_isKindOfClass(v10, v6) & 1);
    [v21 setDelegate:v23[0]];
    objc_storeStrong(&v18, 0LL);
  }

  id v8 = v21;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

id sub_2FA3C(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v20 = 0LL;
  objc_storeStrong(&v20, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  v18[1] = a1;
  v18[0] = objc_loadWeakRetained(a1 + 4);
  id v17 =  [location[0] dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:v19];
  id v15 = [v18[0] routesDataSource];
  id v14 = [v15 snapshot];
  id v13 = [v14 sectionIdentifiers];
  id v16 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v19, "section"));

  if ([v16 isEqualToString:@"TVNPHeadphonesSectionIdentifier"])
  {
    id v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v18[0]));
    id v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"RoutingHeadphonesSectionTitle",  &stru_51CA0,  0LL);
    objc_msgSend(v17, "setTitle:");
  }

  else if ([v16 isEqualToString:@"TVNPSpeakersSectionIdentifier"])
  {
    id v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v18[0]));
    uint64_t v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"RoutingSpeakersSectionTitle",  &stru_51CA0,  0LL);
    objc_msgSend(v17, "setTitle:");
  }

  id v5 = v17;
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

id sub_30E0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _calculateVisibleVolumeCells];
}

uint64_t sub_3134C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
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

void sub_32848(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 layoutIfNeeded];
}

void sub_330B4(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _pickRoute:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0LL);
}

void sub_36654(_DWORD *a1, void *a2, unint64_t a3, void *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  unint64_t v33 = a3;
  v32[2] = a4;
  v32[1] = a1;
  v32[0] = objc_alloc_init(&OBJC_CLASS___CAKeyframeAnimation);
  [location[0] frame];
  v29[1] = v4;
  v29[2] = v5;
  *(void *)&__int128 v30 = v6;
  *((void *)&v30 + 1) = v7;
  __int128 v31 = v30;
  sub_35CA0();
  id v26 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v8, v9, v10, v11);
  v35[0] = v26;
  sub_35CA0();
  id v25 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v12, v13, v14, v15);
  v35[1] = v25;
  sub_35CA0();
  id v24 = +[NSValue valueWithCGRect:](&OBJC_CLASS___NSValue, "valueWithCGRect:", v16, v17, v18, v19);
  v35[2] = v24;
  v29[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 3LL);

  [v32[0] setKeyPath:@"bounds"];
  [v32[0] setValues:v29[0]];
  [v32[0] setKeyTimes:&off_52F68];
  [v32[0] setDuration:1.0];
  HIDWORD(v20) = HIDWORD(v33);
  *(float *)&double v20 = (float)v33 + 1.0;
  [v32[0] setSpeed:v20];
  LODWORD(v21) = a1[8];
  [v32[0] setRepeatCount:v21];
  id v28 = [location[0] layer];
  [v28 addAnimation:v32[0] forKey:@"BarAnimation"];

  objc_storeStrong(v29, 0LL);
  objc_storeStrong(v32, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_38A50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded", a1, a1);
}

void sub_3948C(id a1)
{
  id v1 = -[UIColor initWithWhite:alpha:](objc_alloc(&OBJC_CLASS___UIColor), "initWithWhite:alpha:", 1.0, 0.3);
  uint64_t v2 = (void *)qword_5EE88;
  qword_5EE88 = (uint64_t)v1;
}

void sub_39564(id a1)
{
  id v1 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a1, a1);
  uint64_t v2 = (void *)qword_5EE98;
  qword_5EE98 = (uint64_t)v1;
}

id objc_msgSend_initWithCollectionViewLayout_routingController_options_initialUIDProvider_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCollectionViewLayout:routingController:options:initialUIDProvider:");
}

id objc_msgSend_updateLocalAccessoryAudioDestination_forceUpdateWithUnavailableDestination_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}