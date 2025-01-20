void sub_100001C0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, int a23, int a24, _Unwind_Exception *exception_object, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, id a31)
{
  uint64_t v31;
  objc_destroyWeak(&a31);
  objc_destroyWeak((id *)(v31 - 104));
  _Unwind_Resume(a1);
}

id sub_100001C58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

void sub_100001C8C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained viewServiceUpdatePresentationWithOptions:*(void *)(a1 + 32)];
  }
}

void sub_100001F2C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t sub_100001F7C(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

void sub_1000025F8()
{
}

void sub_100002608(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCRDView];
}

void sub_100002B44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateHUDPostion];
}

void sub_1000030C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained crdSmallView];
  [v1 setAlpha:0.0];
}

void sub_10000311C(uint64_t a1, char a2)
{
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [location[0] crdSmallView];
  [location[0] _HUDFrameForPosition:*(void *)(a1 + 40)];
  v13[1] = v2;
  v13[2] = v3;
  v13[3] = v4;
  v13[4] = v5;
  objc_msgSend(v6, "setFrame:", *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);

  v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_100003278;
  v12 = &unk_100008528;
  objc_copyWeak(v13, (id *)(a1 + 32));
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0x20000LL,  &v8,  0LL,  0.4,  1.0);
  objc_destroyWeak(v13);
  objc_storeStrong(location, 0LL);
}

void sub_100003254( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
}

void sub_100003278(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained crdSmallView];
  [v1 setAlpha:1.0];
}

uint64_t start(int a1, char **a2)
{
  context = objc_autoreleasePoolPush();
  v2 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVCRDServiceAppDelegate);
  v4 = NSStringFromClass(v2);
  unsigned int v8 = UIApplicationMain(a1, a2, 0LL, v4);

  objc_autoreleasePoolPop(context);
  return v8;
}

UIFont *sub_100004330()
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
}

UIFont *sub_100004358()
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

id sub_1000044D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, a1, a1);
}

void sub_100004664(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t sub_1000046B4(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}