@interface SharedDSPServer
- (SharedDSPServer)init;
- (void)CreateSharedDSPService;
@end

@implementation SharedDSPServer

- (void)CreateSharedDSPService
{
  if (!qword_1000080F8)
  {
    *(_OWORD *)v10 = off_1000040F0;
    *(void *)&v10[16] = 0LL;
    qword_1000080F8 = _sl_dlopen(v10, 0LL);
  }

  if (!qword_1000080F8)
  {
    v9 = sub_100003834();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)v10 = 136315394;
    *(void *)&v10[4] = "main.mm";
    *(_WORD *)&v10[12] = 1024;
    *(_DWORD *)&v10[14] = 24;
    v5 = "%25s:%-5d IsolatedCoreAudioClient is not available";
    goto LABEL_12;
  }

  if (!sub_1000039D8())
  {
    v8 = sub_100003834();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)v10 = 136315394;
    *(void *)&v10[4] = "main.mm";
    *(_WORD *)&v10[12] = 1024;
    *(_DWORD *)&v10[14] = 31;
    v5 = "%25s:%-5d CreateIsolatedAudioSiphonPortal not found in IsolatedCoreAudioClient - a newer version of IsolatedCor"
         "eAudioClient may be needed!";
LABEL_12:
    v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }

  v2 = (void (*)(void))sub_1000039D8();
  if (!v2) {
    sub_100003B74();
  }
  v2();
  v3 = sub_100003834();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 136315394;
    *(void *)&v10[4] = "main.mm";
    *(_WORD *)&v10[12] = 1024;
    *(_DWORD *)&v10[14] = 37;
    v5 = "%25s:%-5d IsolatedCoreAudioClient siphon portal launched";
    v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, v10, 0x12u);
  }

- (SharedDSPServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SharedDSPServer;
  v2 = -[SharedDSPServer init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SharedDSPServer CreateSharedDSPService](v2, "CreateSharedDSPService");
  }
  return v3;
}

@end