@interface SUCoreDevice(SUCoreDeviceExtended)
- (uint64_t)rootVolumeSealValid;
- (uint64_t)rootVolumeUUID;
- (void)rootVolumeSealValid;
- (void)rootVolumeUUID;
@end

@implementation SUCoreDevice(SUCoreDeviceExtended)

- (uint64_t)rootVolumeUUID
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 oslog];
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeUUID].cold.1(v1, v2, v3, v4, v5, v6, v7, v8);
  }

  return 0LL;
}

- (uint64_t)rootVolumeSealValid
{
  int v29 = 0;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = xmmword_187AF10A0;
  uint64_t v26 = 0LL;
  int v24 = 1;
  if (getattrlist("/", &v25, &v27, 0x24uLL, 0))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    [v0 oslog];
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.5();
    }
LABEL_16:
    uint64_t v21 = 0LL;
    goto LABEL_17;
  }

  if ((BYTE7(v28) & 2) == 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 oslog];
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.1(v1, v3, v4, v5, v6, v7, v8, v9);
    }
    goto LABEL_16;
  }

  if ((BYTE7(v27) & 2) == 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.2(v1, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_16;
  }

  if (fsctl("/", 0x20006832uLL, 0LL, 0))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.4();
    }
    goto LABEL_16;
  }

  int v19 = fsctl("/", 0x80044A58uLL, &v24, 0);
  [MEMORY[0x1896127A0] sharedLogger];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 oslog];
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.3();
    }
    goto LABEL_16;
  }

  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl( &dword_187A54000,  v1,  OS_LOG_TYPE_DEFAULT,  "[SUCoreDevice] RootVolumeSealValid: Root volume is sealed",  v23,  2u);
  }

  uint64_t v21 = 1LL;
LABEL_17:

  return v21;
}

- (void)rootVolumeUUID
{
}

- (void)rootVolumeSealValid
{
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2( &dword_187A54000,  v1,  v2,  "[SUCoreDevice] RootVolumeSealValid: getattrlist failed for the root volume (%d: %s)",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_1();
}

@end