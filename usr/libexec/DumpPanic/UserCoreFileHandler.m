@interface UserCoreFileHandler
- (UserCoreFileHandler)initWithCoreFilePath:(const char *)a3 :(const char *)a4;
- (id)saveUserSpaceCoreToDisk:(double)a3;
- (void)dealloc;
@end

@implementation UserCoreFileHandler

- (UserCoreFileHandler)initWithCoreFilePath:(const char *)a3 :(const char *)a4
{
  self->_input_core = 0LL;
  char v35 = 0;
  int value = 0;
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4));
  input_corefile_path = self->_input_corefile_path;
  self->_input_corefile_path = v7;

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  input_corefile_name = self->_input_corefile_name;
  self->_input_corefile_name = v9;

  input_core = fopen(a4, "r");
  self->_input_core = input_core;
  if (input_core) {
    goto LABEL_2;
  }
  if (*__error() == 2)
  {
    v17 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      v27 = 0LL;
      goto LABEL_22;
    }

    v18 = self->_input_corefile_name;
    v19 = v17;
    *(_DWORD *)buf = 136315394;
    v37 = -[NSString UTF8String](v18, "UTF8String");
    __int16 v38 = 2080;
    v39 = a4;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No %s core found at %s", buf, 0x16u);
LABEL_8:

    goto LABEL_17;
  }

  input_core = self->_input_core;
  if (!input_core)
  {
    v26 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v19 = v26;
    v30 = __error();
    v31 = strerror(*v30);
    *(_DWORD *)buf = 136315394;
    v37 = a4;
    __int16 v38 = 2080;
    v39 = v31;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "open %s failed with error: %s", buf, 0x16u);
    goto LABEL_8;
  }

- (void)dealloc
{
  input_core = self->_input_core;
  if (input_core)
  {
    fclose(input_core);
    self->_input_core = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UserCoreFileHandler;
  -[UserCoreFileHandler dealloc](&v4, "dealloc");
}

- (id)saveUserSpaceCoreToDisk:(double)a3
{
  if (!self->_input_core)
  {
    uint64_t v78 = _os_assert_log(0LL, a2);
    v10 = (NSString *)_os_crash(v78);
    __break(1u);
    goto LABEL_57;
  }

  objc_super v4 = self;
  v10 = self->_input_corefile_name;
  if (!v10)
  {
LABEL_57:
    uint64_t v79 = _os_assert_log(v10, v11);
    int v12 = (NSString *)_os_crash(v79);
    __break(1u);
    goto LABEL_58;
  }

  int v12 = v4->_input_corefile_path;
  if (!v12)
  {
LABEL_58:
    uint64_t v80 = _os_assert_log(v12, v13);
    int v70 = _os_crash(v80);
    __break(1u);
    goto LABEL_59;
  }

  id v97 = 0LL;
  char v14 = sub_100012470(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", &v97, 493);
  id v15 = v97;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    v37 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      __int16 v38 = 0LL;
      v5 = 0LL;
      v39 = 0LL;
      id v3 = v16;
      goto LABEL_37;
    }

    id v3 = v16;
    v41 = v37;
    v49 = (const char *)[v3 UTF8String];
    *(_DWORD *)buf = 136315138;
    v99 = v49;
    v43 = "failed to setup corefile output directory with error: %s";
LABEL_34:
    _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

    goto LABEL_35;
  }

  id v96 = v15;
  char v17 = sub_100012470(@"/private/var/mobile/Library/Logs/CrashReporter/Panics/staged", &v96, 493);
  id v3 = v96;

  if ((v17 & 1) == 0)
  {
    v40 = (void *)qword_100036568;
    if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    id v3 = v3;
    v41 = v40;
    v42 = (const char *)[v3 UTF8String];
    *(_DWORD *)buf = 136315138;
    v99 = v42;
    v43 = "failed to setup corefile stage directory with error: %s";
    goto LABEL_34;
  }

  id v18 = sub_1000144E0(@"/private/var/mobile/Library/Logs/CrashReporter/Panics", v4->_input_corefile_name);
  v19 = (char *)malloc(0x20000uLL);
  v7 = &unk_100036000;
  v20 = (void *)qword_100036568;
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      input_corefile_name = v4->_input_corefile_name;
      v45 = v20;
      v46 = -[NSString UTF8String](input_corefile_name, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v99 = v46;
      _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Failed to allocate compression buffer for %s core",  buf,  0xCu);
    }

    goto LABEL_35;
  }

  v21 = v19;
  if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v99 = "/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "gzopen %s", buf, 0xCu);
  }

  gzFile v22 = gzopen("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX", "w");
  if (!v22)
  {
    v48 = (void *)qword_100036568;
    if (os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR))
    {
      v55 = v4->_input_corefile_name;
      v56 = v48;
      v57 = -[NSString UTF8String](v55, "UTF8String");
      v58 = __error();
      v59 = strerror(*v58);
      *(_DWORD *)buf = 136315394;
      v99 = v57;
      __int16 v100 = 2080;
      v101 = v59;
      _os_log_error_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_ERROR,  "Failed to open %s core compressed output file with error %s",  buf,  0x16u);
    }

    fclose(v4->_input_core);
    v4->_input_core = 0LL;
    free(v21);
LABEL_35:
    __int16 v38 = 0LL;
    v5 = 0LL;
    goto LABEL_36;
  }

  v23 = v22;
  do
  {
    size_t v24 = fread(v21, 1uLL, 0x20000uLL, v4->_input_core);
    if (v24)
    {
      unint64_t v25 = v24;
      uint64_t v26 = 0LL;
      int v27 = 0;
      while (1)
      {
        int v28 = gzwrite(v23, &v21[v26], v25 - v27);
        if (!v28) {
          break;
        }
        v27 += v28;
        uint64_t v26 = v27;
        if (v25 <= v27) {
          goto LABEL_17;
        }
      }

      v47 = (void *)qword_100036568;
      if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v51 = v4->_input_corefile_name;
      v52 = v47;
      v53 = -[NSString UTF8String](v51, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v99 = v53;
      v54 = "gzwrite failed to write %s core";
      goto LABEL_39;
    }

    if (!feof(v4->_input_core))
    {
      v60 = (void *)qword_100036568;
      if (!os_log_type_enabled((os_log_t)qword_100036568, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v61 = v4->_input_corefile_name;
      v52 = v60;
      v62 = -[NSString UTF8String](v61, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v99 = v62;
      v54 = "Failed to read content from %s core";
LABEL_39:
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);

LABEL_29:
      fclose(v4->_input_core);
      free(v21);
      gzclose(v23);
      remove("/private/var/mobile/Library/Logs/CrashReporter/Panics/staged/tempUserSpaceCore.XXX");
      fclose(v4->_input_core);
      goto LABEL_35;
    }

- (void).cxx_destruct
{
}

@end