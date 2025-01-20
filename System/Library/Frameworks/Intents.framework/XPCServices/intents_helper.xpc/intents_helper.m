int main(int argc, const char **argv, const char **envp)
{
  char *v3;
  ServiceDelegate *v4;
  void *v5;
  char *v7;
  __int128 v8;
  uint64_t v9;
  setenv("TMPDIR", "/private/var/tmp", 1);
  _set_user_dir_suffix("com.apple.intents.intents-helper");
  v7 = 0LL;
  if (!qword_10000CA30)
  {
    v8 = off_1000082D0;
    v9 = 0LL;
    qword_10000CA30 = _sl_dlopen(&v8, &v7);
    v3 = v7;
    if (qword_10000CA30)
    {
      if (!v7) {
        goto LABEL_4;
      }
    }

    else
    {
      v3 = (char *)abort_report_np("%s", v7);
    }

    free(v3);
  }

LABEL_4:
  v4 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

void sub_100005A30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void *sub_100005CBC(uint64_t a1)
{
  v5 = 0LL;
  if (!qword_10000CA50)
  {
    __int128 v6 = off_1000083B8;
    uint64_t v7 = 0LL;
    qword_10000CA50 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_10000CA50;
    if (qword_10000CA50)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  v2 = (void *)qword_10000CA50;
LABEL_5:
  result = dlsym(v2, "_PSIntentForSelectedSuggestionWithContextExtensionUUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_10000CA48 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id sub_100005DAC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100005DB8(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___LSPlugInKitProxy);
    if ((objc_opt_isKindOfClass(v8, v3) & 1) != 0)
    {
      id v4 = [v8 objectForInfoDictionaryKey:PKSDKInfoKey ofClass:objc_opt_class(NSString) inScope:1];
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      if ([v5 isEqualToString:INIntentsServiceExtensionPointName])
      {
        __int128 v6 = *(void **)(a1 + 32);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 containingBundle]);
        LOBYTE(v6) = [v6 containsObject:v7];
      }
    }
  }
}

NSString *__cdecl sub_100005EA4(id a1, LSBundleProxy *a2, unint64_t a3)
{
  return (NSString *)-[LSBundleProxy bundleIdentifier](a2, "bundleIdentifier", a3);
}

void sub_100005EAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
LABEL_9:
    v7();
    goto LABEL_10;
  }

  if (*(double *)(a1 + 40) <= 0.0 || *(double *)(a1 + 48) <= 0.0)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_9;
  }

  id v8 = v5;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2050000000LL;
  v9 = (void *)qword_10000CA38;
  uint64_t v20 = qword_10000CA38;
  if (!qword_10000CA38)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100006028;
    v16[3] = &unk_100008380;
    v16[4] = &v17;
    sub_100006028((uint64_t)v16);
    v9 = (void *)v18[3];
  }

  id v10 = v9;
  _Block_object_dispose(&v17, 8);
  double v11 = *(double *)(a1 + 40);
  double v12 = *(double *)(a1 + 48);
  id v15 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downscaledPNGImageForImage:size:error:", v8, &v15, v11, v12));
  id v14 = v15;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_10:
}

void sub_100006010( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class sub_100006028(uint64_t a1)
{
  id v5 = 0LL;
  v2 = (const char *)&OBJC_INSTANCE_METHODS_NSObject;
  if (!qword_10000CA40)
  {
    __int128 v6 = off_1000083A0;
    uint64_t v7 = 0LL;
    qword_10000CA40 = _sl_dlopen(&v6, &v5);
    uint64_t v3 = v5;
    if (!qword_10000CA40)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }

    if (v5) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    v2 = "INUIImageSizeProvider";
    Class result = objc_getClass("INUIImageSizeProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    uint64_t v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }

  qword_10000CA38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

id objc_msgSend_storeUserContext_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeUserContext:forBundleIdentifier:");
}