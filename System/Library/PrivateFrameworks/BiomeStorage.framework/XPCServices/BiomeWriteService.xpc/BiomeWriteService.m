int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  os_log_s *v11;
  uint64_t v12;
  uint64_t v13;
  char v14[1024];
  v3 = objc_autoreleasePoolPush();
  bzero(v14, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.BiomeWriteService") & 1) == 0)
  {
    v10 = __biome_log_for_category(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003C84();
    }
LABEL_11:

    exit(1);
  }

  if (!confstr(65537, v14, 0x400uLL))
  {
    v12 = __biome_log_for_category(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003BA4();
    }
    goto LABEL_11;
  }

  v4 = realpath_DARWIN_EXTSN(v14, 0LL);
  if (!v4)
  {
    v13 = __biome_log_for_category(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100003C14();
    }
    goto LABEL_11;
  }

  free(v4);
  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  v5 = objc_opt_new(&OBJC_CLASS___BMWriteServer);
  v6 = (void *)qword_100008028;
  qword_100008028 = v5;

  v7 = objc_claimAutoreleasedReturnValue(+[BMXPCListener serviceListener](&OBJC_CLASS___BMXPCListener, "serviceListener"));
  v8 = (void *)qword_100008020;
  qword_100008020 = v7;

  [(id)qword_100008020 setDelegate:qword_100008028];
  objc_autoreleasePoolPop(v3);
  [(id)qword_100008020 activate];
  return 1;
}

void sub_100003B7C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *sub_100003B9C()
{
  return __error();
}

void sub_100003BA4()
{
}

void sub_100003C14()
{
}

void sub_100003C84()
{
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}