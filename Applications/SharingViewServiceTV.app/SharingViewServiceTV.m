void sub_100001D34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001D5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100001EA0;
  v12[3] = &unk_100004198;
  v12[4] = *(void *)(a1 + 32);
  [WeakRetained dismissViewControllerAnimated:1 completion:v12];

  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }

    while (v5);
  }
}

void sub_100001EA0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _remoteViewControllerProxy]);
  [v1 dismissWithResult:&off_100004248];
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___AppDelegate);
  uint64_t v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = UIApplicationMain(a1, a2, 0LL, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}