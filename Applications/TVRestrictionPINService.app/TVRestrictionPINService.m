void sub_100001254( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;
  *(void *)(v10 - 48) = a1;
  *(_DWORD *)(v10 - 52) = a2;
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 48));
}

void sub_100001294(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  v8[1] = a1;
  v8[0] = objc_loadWeakRetained(a1 + 4);
  if (v8[0])
  {
    id v3 = [v8[0] dismissResult];
    if (v3) {
      v2 = (_UNKNOWN **)v3;
    }
    else {
      v2 = &off_100004820;
    }
    id v6 = v2;

    objc_storeStrong((id *)v8[0] + 1, 0LL);
    id v5 = [v8[0] _remoteViewControllerProxy];
    [v5 dismissWithResult:v6];
    objc_storeStrong(&v5, 0LL);
    objc_storeStrong(&v6, 0LL);
    int v7 = 0;
  }

  else
  {
    int v7 = 1;
  }

  objc_storeStrong(v8, 0LL);
  if (!v7) {
    int v7 = 0;
  }
  objc_storeStrong(location, 0LL);
}

void sub_100001574( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object, char a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
}

void sub_1000015C0(id *a1, void *a2, uint64_t a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v8 = a3;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  if (v7[0])
  {
    if (v8 == 1)
    {
      [location[0] shake];
    }

    else
    {
      id v3 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v8);
      v4 = (void *)*((void *)v7[0] + 1);
      *((void *)v7[0] + 1) = v3;

      [v7[0] dismissViewControllerAnimated:1 completion:0];
    }
  }

  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t start(int a1, char **a2)
{
  context = objc_autoreleasePoolPush();
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVRestrictionPINServiceAppDelegate);
  v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}