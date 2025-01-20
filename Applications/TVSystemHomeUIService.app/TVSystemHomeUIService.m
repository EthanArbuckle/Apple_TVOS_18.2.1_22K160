uint64_t sub_100004C08(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id location[2];
  char v8;
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    v8 = objc_msgSend(location[0], "hf_shouldBeOnForContextType:", 0) & 1;
  }

  else
  {
    v3 = *(void **)(a1 + 32);
    v5 = [location[0] uniqueIdentifier];
    v4 = [v5 UUIDString];
    v8 = (objc_msgSend(v3, "containsObject:") & 1) == 0;
  }

  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

void sub_1000056B8()
{
}

uint64_t sub_1000056C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
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

void sub_100005770(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = [v4[0] cameraViewControllerManager];
  [v3 startPictureInPictureFromFullscreen];

  objc_storeStrong(v4, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100005BD8(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _itemManagerDidCompleteInitialLoad];

  objc_storeStrong(location, 0LL);
}

void sub_100005C40(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _notifyDelegateRequestDismissal];

  objc_storeStrong(location, 0LL);
}

id sub_100006EB8(void *a1, uint64_t a2)
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

void sub_1000076E0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v10[1] = a1;
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = sub_1000077EC;
  v8 = &unk_100014580;
  v10[0] = a1[5];
  id v9 = a1[4];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(v10, 0LL);
  objc_storeStrong(location, 0LL);
}

id sub_1000077EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000081D0(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  [WeakRetained _updateVisibilityState];

  objc_storeStrong(location, 0LL);
}

id sub_100008238(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained _stateDump];

  return v3;
}
}

id sub_1000088A8(void *a1, void *a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v17 = 0LL;
  objc_storeStrong(&v17, a2);
  id v16 = 0LL;
  if (v17)
  {
    id v8 = location;
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_10000C8FC;
    v14 = &unk_100014798;
    id v15 = v17;
    id v2 = objc_msgSend(v8, "bs_firstObjectPassingTest:", &v10);
    id v3 = v16;
    id v16 = v2;

    objc_storeStrong(&v15, 0LL);
  }

  if (!v16)
  {
    id v4 = [location firstObject];
    id v5 = v16;
    id v16 = v4;
  }

  id v7 = v16;
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&location, 0LL);
  return v7;
}

void sub_100008D0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained startPictureInPictureUsingViewControllerCoolport:*(void *)(a1 + 32)];
}

id sub_1000092FC(void *a1, uint64_t a2)
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

void sub_100009CE0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

id sub_100009D30(id *a1)
{
  id v2 = [a1[5] view];
  [v2 removeFromSuperview];

  [a1[6] invalidate];
  return [a1[4] _dismissIfNecessary];
}

void sub_100009DC4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

id sub_100009E14(id *a1)
{
  id v2 = [a1[5] view];
  [v2 removeFromSuperview];

  [a1[6] invalidate];
  return [a1[4] _dismissIfNecessary];
}

void sub_10000AB64()
{
}

void sub_10000AB74(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = objc_loadWeakRetained((id *)(a1 + 48));
  [v2[0] startPictureInPictureUsingViewControllerCoolport:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) invalidate];
  objc_storeStrong(v2, 0LL);
}

  ;
}

  ;
}

id sub_10000B4BC(id *a1)
{
  id v15 = a1;
  v14 = a1;
  [a1[4] didEnterPictureInPicture];
  memset(__b, 0, sizeof(__b));
  id obj = a1[5];
  id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v6);
      id v11 = [v13 cameraContentView];
      [v13 setDismissalDelegate:a1[6]];
      [v11 setFullScreenContainer:v13];
      id v2 = v11;
      id v3 =  +[TVHMCameraContentViewStyle pictureInPictureStyle]( &OBJC_CLASS___TVHMCameraContentViewStyle,  "pictureInPictureStyle");
      objc_msgSend(v2, "applyStyle:");

      objc_storeStrong(&v11, 0LL);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  [a1[7] invalidate];
  [a1[8] requestFocusUpdateToEnvironment:a1[8]];
  return [a1[6] _didUpdatePictureInPictureState];
}

id sub_10000BC18(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t sub_10000C8FC(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v4 = (void *)a1[4];
  id v6 = [location[0] homeKitObject];
  id v5 = [v6 uniqueIdentifier];
  unsigned __int8 v7 = objc_msgSend(v4, "isEqual:");

  objc_storeStrong(location, 0LL);
  return v7 & 1;
}

uint64_t start(int a1, char **a2)
{
  unsigned int v14 = 0;
  int v13 = a1;
  int v12 = a2;
  id v11 = 0LL;
  id v10 = 0LL;
  context = objc_autoreleasePoolPush();
  id v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSystemHomeUIServiceApplication);
  id v3 = NSStringFromClass(v2);
  uint64_t v4 = v11;
  id v11 = v3;

  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVSystemHomeUIServiceAppDelegate);
  id v6 = NSStringFromClass(v5);
  id v7 = v10;
  id v10 = v6;

  objc_autoreleasePoolPop(context);
  unsigned int v14 = UIApplicationMain(v13, v12, v11, (NSString *)v10);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v14;
}

id objc_msgSend__startPictureinPictureUsingFullScreenViewControllersCoolport_page_source_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startPictureinPictureUsingFullScreenViewControllersCoolport:page:source:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}