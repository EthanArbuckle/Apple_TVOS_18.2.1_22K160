LABEL_15:
  objc_sync_exit(v8);
  return (char)v10;
}

    if (v3 >= 2)
    {
      v9 = 0LL;
      v10 = 8LL * (v3 - 1);
      do
      {
        v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + 8) = 0LL;
        }

        v9 += 8LL;
      }

      while (v10 != v9);
    }
  }

  return 0LL;
}

void sub_100003318(_Unwind_Exception *a1)
{
}

void sub_100003388(_Unwind_Exception *a1)
{
}

void sub_1000034D4(_Unwind_Exception *a1)
{
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = os_log_create("com.apple.accessoryupdater.uarp", "hidUpdater");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HID UARP updater started", v8, 2u);
  }

  int v4 = AUSandboxPlatformInit(v3, 0LL);
  if (!v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v6 setDelegate:v5];
    [v6 resume];
  }

  return v4;
}

void sub_1000037E0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10002F938;
  qword_10002F938 = (uint64_t)v1;
}

void sub_100003A1C(uint64_t a1)
{
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v44;
    v5 = &CC_SHA256_Final_ptr;
    uint64_t v32 = *(void *)v44;
    do
    {
      v6 = 0LL;
      id v33 = v3;
      do
      {
        if (*(void *)v44 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hardwareID]);
        uint64_t v9 = objc_opt_class(v5[59]);
        char isKindOfClass = objc_opt_isKindOfClass(v8, v9);

        if ((isKindOfClass & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue([v7 hardwareID]);
          v12 = *(void **)(a1 + 40);
          if (!v12
            || (v13 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]),
                unsigned int v14 = [v12 isEqualToString:v13],
                v13,
                v14))
          {
            v35 = v11;
            v36 = v6;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            id v37 = (id)objc_claimAutoreleasedReturnValue([v11 personalities]);
            id v15 = [v37 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v40;
              do
              {
                for (i = 0LL; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v40 != v17) {
                    objc_enumerationMutation(v37);
                  }
                  v19 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                  v20 = *(void **)(a1 + 48);
                  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v19 vendorID]));
                  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v19 productID]));
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v20 matchingDictionaryForVendorID:v21 productID:v22]);

                  io_iterator_t existing = 0;
                  v24 = v23;
                  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v24, &existing))
                  {
                    uint64_t v25 = IOIteratorNext(existing);
                    if ((_DWORD)v25)
                    {
                      uint64_t v26 = v25;
                      do
                      {
                        v27 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) createAndSaveUARPHIDAccessoryFromService:v26 identifier:*(void *)(a1 + 40)]);
                        IOObjectRelease(v26);
                        if (v27)
                        {
                          v28 = objc_alloc(&OBJC_CLASS___UARPAccessoryIDWithLocationID);
                          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 uarpAccessoryID]);
                          v30 = (void *)objc_claimAutoreleasedReturnValue([v27 locationID]);
                          v31 = -[UARPAccessoryIDWithLocationID initWithAccessoryID:locationID:]( v28,  "initWithAccessoryID:locationID:",  v29,  v30);

                          [*(id *)(a1 + 56) addObject:v31];
                        }

                        uint64_t v26 = IOIteratorNext(existing);
                      }

                      while ((_DWORD)v26);
                    }

                    IOObjectRelease(existing);
                  }
                }

                id v16 = [v37 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }

              while (v16);
            }

            uint64_t v4 = v32;
            id v3 = v33;
            v5 = &CC_SHA256_Final_ptr;
            v11 = v35;
            v6 = v36;
          }
        }

        v6 = (char *)v6 + 1;
      }

      while (v6 != v3);
      id v3 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v3);
  }
}

void sub_100003E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100003E7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100003E8C(uint64_t a1)
{
}

void sub_100003E94(uint64_t a1)
{
  id v2 = IORegistryEntryIDMatching(*(void *)(a1 + 56));
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  if ((_DWORD)MatchingService)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) createAndSaveUARPHIDAccessoryFromService:MatchingService identifier:*(void *)(a1 + 40)]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void sub_100003F78(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 80))
  {
    [*(id *)(v5 + 8) stopPacketCapture];
    [*(id *)(*(void *)(a1 + 32) + 8) startPacketCapture:*(void *)(*(void *)(a1 + 32) + 80)];
  }

void sub_10000408C(uint64_t a1)
{
}

void sub_10000436C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessoryID:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unsigned int v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) updateInProgress];
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    v7 = (void *)v6[6];
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      uint64_t v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 uarpAccessoryID]);
      *(_DWORD *)buf = 136315394;
      id v16 = "-[UARPHIDUpdater startUpdateForAccessories:assetID:]_block_invoke";
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s: Update already in progress for %@",  buf,  0x16u);
    }
  }

  else
  {
    v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000044E0;
    v13[3] = &unk_1000285F8;
    v13[4] = v6;
    id v14 = v11;
    [v6 queryPropertiesForUARPHIDAccessory:v12 completionCallback:v13];
  }

void sub_1000044E0(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v6 = a2;
    id v4 = a2;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    objc_msgSend(v3, "_startUpdateForAccessories:assetID:", v5, *(void *)(a1 + 40), v6);
  }

LABEL_9:
  uint64_t v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[UARPHIDUpdater getContainerIDFromCFPrefsForAccessory:]";
    id v16 = 2112;
    __int16 v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s: ContainerID override found for %@: %@",  buf,  0x20u);
  }

  return v9;
}
}

  return v6;
}

LABEL_14:
    v23 = 0;
    goto LABEL_20;
  }

  if (!-[UARPHIDUpdater registerHIDCallbacksForUARPHIDAccessory:]( self,  "registerHIDCallbacksForUARPHIDAccessory:",  v11))
  {
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v38 = 136315394;
      __int128 v39 = "-[UARPHIDUpdater _queryProperties:accessoryID:goldrestoreQuery:]";
      __int128 v40 = 2112;
      __int128 v41 = v11;
      v22 = "%s: Failed to register for HID Callbacks for %@";
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);

  if (!v12)
  {
    v13 = objc_claimAutoreleasedReturnValue([v9 productGroup]);
    if (v13
      && (id v14 = (void *)v13,
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 productNumber]),
          v15,
          v14,
          v15))
    {
      id v16 = objc_alloc(&OBJC_CLASS___UARPAccessory);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 productGroup]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v9 productNumber]);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v20 = -[UARPAccessory initWithProductGroup:productNumber:uuid:]( v16,  "initWithProductGroup:productNumber:uuid:",  v17,  v18,  v19);
      [v11 setUarpAccessory:v20];
    }

    else
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( -[UARPHIDUpdater createUARPAccessoryFromAccessoryID:]( self,  "createUARPAccessoryFromAccessoryID:",  v9));
      [v11 setUarpAccessory:v17];
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v24 setDownloadOnCellularAllowed:0];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v25 setAutoDownloadAllowed:0];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v26 setTransport:1];

    v27 = [v9 capability];
    v28 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v28 setCapability:v27];

    v29 = [v9 suppressAutomaticDynamicAssets];
    v30 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v30 setSuppressAutomaticDynamicAssets:v29];

    v31 = [v9 suppressInfoQueries];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    [v32 setSuppressInfoQueries:v31];

    uarpController = self->_uarpController;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    -[UARPController addAccessory:assetID:](uarpController, "addAccessory:assetID:", v34, 0LL);

    v35 = self->_uarpController;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 uarpAccessory]);
    -[UARPController accessoryReachable:](v35, "accessoryReachable:", v36);
  }

  if (v5) {
    [v11 setGoldrestoreQueryInProgress:1];
  }
  [v11 proceedWithUpdate];
  v23 = 1;
LABEL_20:

  return v23;
}

id sub_100005748(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _queryProperties:*(void *)(a1 + 40) accessoryID:*(void *)(a1 + 48) goldrestoreQuery:*(unsigned __int8 *)(a1 + 64)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100005A4C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getUARPHIDAccessoryForUARPAccessoryID:", v8, (void)v25));
      v10 = *(void **)(a1 + 32);
      if (!v9) {
        break;
      }
      if (([v10 registerHIDCallbacksForUARPHIDAccessory:v9] & 1) == 0)
      {
        v23 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[UARPHIDUpdater applyStagedFirmwareForAccessories:]_block_invoke";
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          v24 = "%s: Failed to register for HID Callbacks for %@";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
        }

        goto LABEL_18;
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);

      if (!v11)
      {
        uint64_t v12 = *(void **)(a1 + 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessoryID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 createUARPAccessoryFromAccessoryID:v13]);
        [v9 setUarpAccessory:v14];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
        [v15 setTransport:1];

        id v16 = [v8 capability];
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
        [v17 setCapability:v16];
      }

      v18 = *(void **)(*(void *)(a1 + 32) + 8LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v18 addAccessory:v19 assetID:0];

      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v2 addObject:v20];

      v21 = *(void **)(*(void *)(a1 + 32) + 8LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v21 accessoryReachable:v22];

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    v23 = (os_log_s *)v10[6];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[UARPHIDUpdater applyStagedFirmwareForAccessories:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      v24 = "%s: Unknown UARPAccessoryID %@";
      goto LABEL_17;
    }

LABEL_18:
    goto LABEL_19;
  }

    goto LABEL_19;
  }

LABEL_12:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) applyStagedFirmwareOnAccessoryList:v2 withUserIntent:1];
LABEL_19:
}

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) rescindStagedFirmwareOnAccessoryList:v2 withUserIntent:1];
LABEL_19:
}

void sub_100005E24(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getUARPHIDAccessoryForUARPAccessoryID:", v8, (void)v25));
      v10 = *(void **)(a1 + 32);
      if (!v9) {
        break;
      }
      if (([v10 registerHIDCallbacksForUARPHIDAccessory:v9] & 1) == 0)
      {
        v23 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[UARPHIDUpdater rescindStagedFirmwareForAccessories:]_block_invoke";
          __int16 v31 = 2112;
          uint64_t v32 = v9;
          v24 = "%s: Failed to register for HID Callbacks for %@";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
        }

        goto LABEL_18;
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);

      if (!v11)
      {
        uint64_t v12 = *(void **)(a1 + 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessoryID]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 createUARPAccessoryFromAccessoryID:v13]);
        [v9 setUarpAccessory:v14];

        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
        [v15 setTransport:1];

        id v16 = [v8 capability];
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
        [v17 setCapability:v16];
      }

      v18 = *(void **)(*(void *)(a1 + 32) + 8LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v18 addAccessory:v19 assetID:0];

      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v2 addObject:v20];

      v21 = *(void **)(*(void *)(a1 + 32) + 8LL);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 uarpAccessory]);
      [v21 accessoryReachable:v22];

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    v23 = (os_log_s *)v10[6];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[UARPHIDUpdater rescindStagedFirmwareForAccessories:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      v24 = "%s: Unknown UARPAccessoryID %@";
      goto LABEL_17;
    }

void sub_100006224(uint64_t a1)
{
  uint64_t v7 = -[UARPHIDAccessory initWithHIDDeviceRef:]( objc_alloc(&OBJC_CLASS___UARPHIDAccessory),  "initWithHIDDeviceRef:",  0LL);
  -[UARPHIDAccessory setOptions:](v7, "setOptions:", *(unsigned int *)(a1 + 64));
  uint64_t v2 = -[UARPAccessory initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]( objc_alloc(&OBJC_CLASS___UARPAccessory),  "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:",  @"TestManufacturer",  @"TestModelName",  @"TestSerialNumber",  @"0.0.0",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  -[UARPHIDAccessory setUarpAccessory:](v7, "setUarpAccessory:", v2);
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v7];
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDAccessory uarpAccessory](v7, "uarpAccessory"));
  [v3 addAccessory:v4 assetID:0];

  id v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDAccessory uarpAccessory](v7, "uarpAccessory"));
  [v5 changeAssetLocation:v6 assetID:*(void *)(a1 + 56)];
}

void sub_1000063D4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 0;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v34;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v32 = v4;
    uint64_t v7 = "-[UARPHIDUpdater unsolicitedDynamicAssetForAccessories:assetTag:]_block_invoke";
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getUARPHIDAccessoryForUARPAccessoryID:", v9, v32, (void)v33));
        v11 = *(void **)(a1 + 32);
        if (!v10)
        {
          __int128 v28 = (os_log_s *)v11[6];
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v32;
          v38 = v7;
          __int16 v39 = 2112;
          __int128 v40 = v9;
          v29 = v28;
          v30 = "%s: Unknown UARPAccessoryID %@, dropping it";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0x16u);
          goto LABEL_16;
        }

        if (([v11 registerHIDCallbacksForUARPHIDAccessory:v10] & 1) == 0)
        {
          __int16 v31 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v32;
          v38 = v7;
          __int16 v39 = 2112;
          __int128 v40 = v10;
          v29 = v31;
          v30 = "%s: Failed to register for HID Callbacks for %@, dropping it";
          goto LABEL_15;
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);

        if (!v12)
        {
          v13 = *(void **)(a1 + 32);
          id v14 = v7;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessoryID]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 createUARPAccessoryFromAccessoryID:v15]);
          [v10 setUarpAccessory:v16];

          uint64_t v7 = v14;
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v17 setDownloadOnCellularAllowed:0];

          v18 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v18 setAutoDownloadAllowed:0];

          v19 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v19 setTransport:1];

          id v20 = [v9 capability];
          v21 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v21 setCapability:v20];
        }

        v22 = *(void **)(*(void *)(a1 + 32) + 8LL);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v22 addAccessory:v23 assetID:0];

        v24 = *(void **)(*(void *)(a1 + 32) + 8LL);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v24 accessoryReachable:v25];

        __int128 v26 = *(void **)(*(void *)(a1 + 32) + 8LL);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v26 triggerUnsolicitedDynamicAsset:v27 assetTag:*(void *)(a1 + 48)];

LABEL_16:
      }

      id v5 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v5);
  }
}

void sub_100006FBC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48LL);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 40);
    __int128 v4 = v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uarpAccessory]);
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Solicit TICS/MTIC (asset download failed) for HID <%@>",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessory]);
  [v6 _solicitDynamicAssetTICSForAccessory:v7];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessory]);
  [v8 _solicitDynamicAssetMTICForAccessory:v9];
}

void sub_1000070C4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

LABEL_8:
}

    uint64_t v6 = 0;
    goto LABEL_9;
  }

  log = self->_log;
  uint64_t v6 = 1;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = 136315394;
    int v10 = "-[UARPHIDUpdater registerHIDCallbacksForUARPHIDAccessory:]";
    v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "%s: accessory=%@ already registered for HID Callbacks",  (uint8_t *)&v9,  0x16u);
  }

void sub_100007250(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

void sub_100007418(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

void sub_10000766C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48LL);
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 40);
    __int128 v4 = v2;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uarpAccessory]);
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Solicit TICS/MTIC (asset not found) for HID <%@>",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessory]);
  [v6 _solicitDynamicAssetTICSForAccessory:v7];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessory]);
  [v8 _solicitDynamicAssetMTICForAccessory:v9];
}

void sub_100007774(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

id sub_100007868(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetAvailablityUpdateForAccessoryID:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
}

void sub_100007B3C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 firmwareStagingComplete:v3 withStatus:*(void *)(a1 + 48)];
}

id sub_100007C34(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firmwareStagingComplete:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) withStatus:*(void *)(a1 + 56)];
}

void sub_100008390(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetSolicitationComplete:v3 withStatus:*(void *)(a1 + 48)];
}

void sub_1000083DC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetSolicitationComplete:v3 assetID:*(void *)(a1 + 48) withStatus:*(void *)(a1 + 56)];
}

id sub_1000084D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetSolicitationComplete:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) withStatus:*(void *)(a1 + 56)];
}

void sub_1000086B4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 accessoryTransportNeeded:v3 isNeeded:*(unsigned __int8 *)(a1 + 48)];
}

id sub_10000878C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessoryTransportNeeded:*(void *)(a1 + 40) isNeeded:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000088B0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 manufacturer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_1000089C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) manufacturer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100008AE8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 modelName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100008BFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) modelName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100008D20(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 firmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100008E34(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) firmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100008F58(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 stagedFirmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_10000906C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) stagedFirmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000917C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 stats:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100009290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) stats:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_1000093B4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 hardwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_1000094C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) hardwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_1000095EC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 serialNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100009700(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) serialNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100009890(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 appleModelNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_1000099A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) appleModelNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100009AC8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 hwFusingType:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100009BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) hwFusingType:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100009D00(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 friendlyName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_100009E14(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessory:*(void *)(a1 + 40) friendlyName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_100009EEC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:manifestPrefix:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100009FD4;
    v6[3] = &unk_100028558;
    v6[4] = v4;
    id v7 = v3;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    dispatch_async(v5, v6);
  }
}

void sub_100009FD4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 manifestPrefix:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A0CC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:boardID:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A1A4;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000A1A4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 boardID:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000A29C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:chipID:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A374;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000A374(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 chipID:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000A46C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:chipRevision:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A544;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000A544(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 chipRevision:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000A63C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:ecid:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A714;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000A714(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 ecid:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000A80C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:securityDomain:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A8E4;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000A8E4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 securityDomain:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000A9DC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:securityMode:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000AAB4;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000AAB4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 securityMode:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000ABAC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:productionMode:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000AC84;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000AC84(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 productionMode:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000AD7C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:manifestPrefix:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000AE54;
    v9[3] = &unk_100028710;
    v9[4] = v4;
    id v6 = v3;
    id v8 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = v6;
    uint64_t v12 = v7;
    id v11 = v8;
    dispatch_async(v5, v9);
  }
}

void sub_10000AE54(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 epoch:*(void *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000AF50(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:enableMixMatch:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000B02C;
    v6[3] = &unk_100028760;
    v6[4] = v4;
    id v7 = v3;
    char v9 = *(_BYTE *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);
  }
}

void sub_10000B02C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 enableMixMatch:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000B12C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:liveNonce:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000B208;
    v6[3] = &unk_100028760;
    v6[4] = v4;
    id v7 = v3;
    char v9 = *(_BYTE *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);
  }
}

void sub_10000B208(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 liveNonce:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000B308(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:prefixNeedsLUN:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000B3E4;
    v6[3] = &unk_100028760;
    v6[4] = v4;
    id v7 = v3;
    char v9 = *(_BYTE *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);
  }
}

void sub_10000B3E4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 prefixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000B4E4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessory:*(void *)(a1 + 40)]);
  id v3 = v2;
  if (v2
    && [v2 goldrestoreQueryInProgress]
    && (objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 120LL),  "queryCompleteForAccessoryID:suffixNeedsLUN:error:") & 1) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(v4 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000B5C0;
    v6[3] = &unk_100028760;
    v6[4] = v4;
    id v7 = v3;
    char v9 = *(_BYTE *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);
  }
}

void sub_10000B5C0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 suffixNeedsLUN:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_10000B710(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 appleModelNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_10000B824(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessoryID:*(void *)(a1 + 40) appleModelNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000B934(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 hwFusingType:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_10000BA48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessoryID:*(void *)(a1 + 40) hwFusingType:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000BB58(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 queryCompleteForAccessoryID:v3 friendlyName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

id sub_10000BC6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryCompleteForAccessoryID:*(void *)(a1 + 40) friendlyName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000BEF8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 firmwareStagingProgress:v3 bytesSent:*(void *)(a1 + 48) bytesTotal:*(void *)(a1 + 56)];
}

id sub_10000C000(uint64_t a1)
{
  return [*(id *)(a1 + 32) _firmwareStagingProgress:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) bytesSent:*(void *)(a1 + 56) bytesTotal:*(void *)(a1 + 64)];
}

void sub_10000C1EC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 assetSolicitationProgress:v3 bytesReceived:*(void *)(a1 + 48) bytesTotal:*(void *)(a1 + 56)];
}

id sub_10000C2F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _assetSolicitationProgress:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) bytesReceived:*(void *)(a1 + 56) bytesTotal:*(void *)(a1 + 64)];
}

void sub_10000C3E4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0LL;
  unsigned __int8 v5 = [v2 sendHIDReportToAccessory:v3 forUARPMessage:v4 error:&v7];
  id v6 = v7;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v5;
}

void sub_10000C56C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 stagedFirmwareApplicationComplete:v3 withStatus:*(void *)(a1 + 48)];
}

id sub_10000C644(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stagedFirmwareApplicationComplete:*(void *)(a1 + 40) withStatus:*(void *)(a1 + 48)];
}

void sub_10000C6FC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v2 stagedFirmwareRescindComplete:v3 withStatus:*(void *)(a1 + 48)];
}

id sub_10000C7D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stagedFirmwareRescindComplete:*(void *)(a1 + 40) withStatus:*(void *)(a1 + 48)];
}

LABEL_19:
      if (v16 == (id)++v18)
      {
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v81,  v96,  16LL);
        if (v16) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  v22 = -[UARPHIDAccessory initWithHIDDeviceRef:]( objc_alloc(&OBJC_CLASS___UARPHIDAccessory),  "initWithHIDDeviceRef:",  v68);
  v23 = CFDictionaryGetValue(properties, @"Transport");
  v62 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[UARPHIDAccessory setTransport:](v22, "setTransport:");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory supportedAccessoriesByTransport:]( &OBJC_CLASS___UARPSupportedAccessory,  "supportedAccessoriesByTransport:",  1LL));
  v67 = [v24 countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v67)
  {
    obja = v22;
    __int128 v25 = 0LL;
    v65 = v12;
    v66 = *(void *)v78;
    v64 = v24;
    while (2)
    {
      for (i = 0LL; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v78 != v66) {
          objc_enumerationMutation(v24);
        }
        __int128 v27 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
        v29 = [v28 isEqualToString:v8];

        if (v29)
        {
          __int128 v43 = v27;

          __int128 v25 = v43;
          goto LABEL_50;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v27 hardwareID]);
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 personalities]);
        __int128 v32 = [v31 countByEnumeratingWithState:&v73 objects:v86 count:16];
        if (v32)
        {
          __int128 v33 = v32;
          v69 = v25;
          __int128 v34 = *(void *)v74;
          while (2)
          {
            for (j = 0LL; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v74 != v34) {
                objc_enumerationMutation(v31);
              }
              __int128 v36 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v36 personalityIdentifier:v37]);

              if ([v38 isEqualToString:v8])
              {
                __int128 v25 = v27;

                v24 = v64;
                uint64_t v12 = v65;
                goto LABEL_37;
              }
            }

            __int128 v33 = [v31 countByEnumeratingWithState:&v73 objects:v86 count:16];
            if (v33) {
              continue;
            }
            break;
          }

          v24 = v64;
          uint64_t v12 = v65;
          __int128 v25 = v69;
        }

LABEL_37:
      }

      v67 = [v24 countByEnumeratingWithState:&v77 objects:v87 count:16];
      if (v67) {
        continue;
      }
      break;
    }

LABEL_50:
    if (v25)
    {
      v22 = obja;
      if ([v25 isMFi])
      {
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v25 hardwareID]);
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v44 vendorID]));
        -[UARPHIDAccessory setVendorID:](obja, "setVendorID:", v45);

        uint64_t v12 = v65;
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( NSNumber,  "numberWithUnsignedShort:",  [v44 productID]));
        -[UARPHIDAccessory setProductID:](obja, "setProductID:", v46);

        v47 = objc_alloc(&OBJC_CLASS___UARPAccessoryID);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v25 productGroup]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v25 productNumber]);
        v50 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]( v47,  "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:",  0LL,  0LL,  0LL,  0LL,  v48,  v49);
        -[UARPHIDAccessory setUarpAccessoryID:](obja, "setUarpAccessoryID:", v50);
      }

      else
      {
        v51 = objc_alloc(&OBJC_CLASS___UARPAccessoryID);
        v52 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
        v53 = -[UARPAccessoryID initWithModelNumber:](v51, "initWithModelNumber:", v52);
        -[UARPHIDAccessory setUarpAccessoryID:](obja, "setUarpAccessoryID:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDAccessory uarpAccessoryID](obja, "uarpAccessoryID"));
        [v54 setSerialNumber:v12];

        -[UARPHIDAccessory setLocationID:](obja, "setLocationID:", v72);
      }

      v55 = [v25 capabilities];
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDAccessory uarpAccessoryID](obja, "uarpAccessoryID"));
      [v56 setCapability:v55];

      v57 = v63->_log;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = v57;
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[UARPHIDAccessory uarpAccessoryID](obja, "uarpAccessoryID"));
        v60 = [v59 capability];
        *(_DWORD *)buf = 136315650;
        v89 = "-[UARPHIDUpdater createAndSaveUARPHIDAccessoryFromService:identifier:]";
        v90 = 2112;
        v91 = v8;
        v92 = 2048;
        v93 = v60;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: identifier=%@ cap=0x%llx", buf, 0x20u);
      }

      -[NSMutableSet addObject:](v63->_uarpHIDAccessories, "addObject:", obja);
      CFRelease(properties);
      __int16 v39 = obja;
    }

    else
    {
      __int16 v39 = 0LL;
      v22 = obja;
    }
  }

  else
  {

    __int128 v25 = 0LL;
    __int16 v39 = 0LL;
  }

LABEL_60:
LABEL_61:

  return v39;
}

void sub_10000D0FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3
    && (uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getUARPHIDAccessoryForUARPAccessoryID:v3]),
        v4,
        v4))
  {
    unsigned __int8 v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 48LL), OS_LOG_TYPE_ERROR)) {
      sub_10001C834();
    }
    unsigned __int8 v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v5();
}

void sub_10000D740( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D758(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 uarpAccessoryID]);
  unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_10000D8B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D8CC(uint64_t a1, void *a2, _BYTE *a3)
{
  id v8 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 uarpAccessory]);
  unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

void sub_10000DAD0(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[UARPHIDUpdater sharedInstance](&OBJC_CLASS___UARPHIDUpdater, "sharedInstance"));
  id v3 = a1;
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 log]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Received hidDeviceDisconnectCallback for accessory: %@",  buf,  0xCu);
  }

  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 uarpHIDQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000FD84;
  v8[3] = &unk_1000285A8;
  id v9 = v2;
  id v10 = v3;
  id v6 = v3;
  id v7 = v2;
  dispatch_async(v5, v8);
}

void sub_10000DC10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UARPHIDUpdater sharedInstance](&OBJC_CLASS___UARPHIDUpdater, "sharedInstance"));
  id v12 = a1;
  v13 = v12;
  if (!v12)
  {
LABEL_13:
    id v16 = 0LL;
    goto LABEL_9;
  }

  if (!a6 || [v12 hidReportSizeInput] + 1 < a7)
  {
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 log]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 67109632;
      int v20 = a5;
      __int16 v21 = 2048;
      uint64_t v22 = a7;
      __int16 v23 = 1024;
      LODWORD(v24) = [v13 hidReportSizeInput];
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "ERROR: Input report (ID: %d) has invalid reportLength: %ld, expecting %u",  (uint8_t *)&v19,  0x18u);
    }

    goto LABEL_13;
  }

  uint64_t v14 = a6 + 1;
  uint64_t v15 = a7 - 1;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v14, a7 - 1));
  if (v16 && [v13 hidReportID] == a5)
  {
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 log]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 67109634;
      int v20 = a5;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Received input report: reportID: %d, length: %ld, report: %@",  (uint8_t *)&v19,  0x1Cu);
    }

    [v11 parseInputReport:v16 forAccessory:v13];
  }

LABEL_13:
  return v11;
}

void sub_10000EE8C(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 120LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uarpAccessoryID]);
  [v1 firmwareStagingComplete:v2 withStatus:3];
}

void sub_10000EF7C(uint64_t a1)
{
  int v15 = 0;
  unsigned __int16 v14 = 0;
  id v2 = *(void **)(a1 + 32);
  if (v2 && *(void *)(a1 + 40))
  {
    objc_msgSend(v2, "getBytes:range:", (char *)&v15 + 2, 0, 2);
    objc_msgSend(*(id *)(a1 + 32), "getBytes:range:", &v15, 2, 2);
    int v3 = (unsigned __int16)v15;
    if (v3 != [*(id *)(a1 + 40) expectedHIDMessageID])
    {
      uint64_t v4 = *(void **)(*(void *)(a1 + 48) + 48LL);
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
      {
        int v5 = (unsigned __int16)v15;
        id v6 = *(void **)(a1 + 40);
        id v7 = v4;
        unsigned int v8 = [v6 expectedHIDMessageID];
        *(_DWORD *)buf = 67109376;
        int v17 = v5;
        __int16 v18 = 1024;
        unsigned int v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Unexpected uarpHIDReportMessageID %u, expected %u",  buf,  0xEu);
      }
    }

    objc_msgSend( *(id *)(a1 + 40),  "setExpectedHIDMessageID:",  (unsigned __int16)((unsigned __int16)objc_msgSend(*(id *)(a1 + 40), "expectedHIDMessageID") + 1));
    objc_msgSend(*(id *)(a1 + 32), "getBytes:range:", &v14, 4, 2);
    unint64_t v9 = v14;
    if ((unint64_t)[*(id *)(a1 + 32) length] <= v9)
    {
      v13 = *(os_log_s **)(*(void *)(a1 + 48) + 48LL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Invalid uarpPayloadLength %u", buf, 8u);
      }
    }

    else
    {
      id v10 = objc_autoreleasePoolPush();
      id v11 = *(void **)(a1 + 48);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 6, v14));
      [v11 processUARPMessage:v12 fromAccessory:*(void *)(a1 + 40)];

      objc_autoreleasePoolPop(v10);
    }
  }

id sub_10000F2FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stopPacketCapture];
}

void sub_10000F3B0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 0;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v34;
    *(void *)&__int128 v4 = 136315394LL;
    __int128 v32 = v4;
    id v7 = "-[UARPHIDUpdater solicitDynamicAssetForAccessories:assetID:]_block_invoke";
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getUARPHIDAccessoryForUARPAccessoryID:", v9, v32, (void)v33));
        id v11 = *(void **)(a1 + 32);
        if (!v10)
        {
          __int128 v28 = (os_log_s *)v11[6];
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v32;
          v38 = v7;
          __int16 v39 = 2112;
          __int128 v40 = v9;
          v29 = v28;
          v30 = "%s: Unknown UARPAccessoryID %@, dropping it";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0x16u);
          goto LABEL_16;
        }

        if (([v11 registerHIDCallbacksForUARPHIDAccessory:v10] & 1) == 0)
        {
          __int16 v31 = *(os_log_s **)(*(void *)(a1 + 32) + 48LL);
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v32;
          v38 = v7;
          __int16 v39 = 2112;
          __int128 v40 = v10;
          v29 = v31;
          v30 = "%s: Failed to register for HID Callbacks for %@, dropping it";
          goto LABEL_15;
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);

        if (!v12)
        {
          v13 = *(void **)(a1 + 32);
          unsigned __int16 v14 = v7;
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessoryID]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 createUARPAccessoryFromAccessoryID:v15]);
          [v10 setUarpAccessory:v16];

          id v7 = v14;
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v17 setDownloadOnCellularAllowed:0];

          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v18 setAutoDownloadAllowed:0];

          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v19 setTransport:1];

          id v20 = [v9 capability];
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
          [v21 setCapability:v20];
        }

        uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 8LL);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v22 addAccessory:v23 assetID:0];

        v24 = *(void **)(*(void *)(a1 + 32) + 8LL);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v24 accessoryReachable:v25];

        __int128 v26 = *(void **)(*(void *)(a1 + 32) + 8LL);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 uarpAccessory]);
        [v26 solicitDynamicAsset:v27 assetID:*(void *)(a1 + 48)];

LABEL_16:
      }

      id v5 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v5);
  }
}

id sub_10000F7C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) startTapToRadar:*(void *)(a1 + 40)];
}

id sub_10000F84C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stopTapToRadar];
}

void sub_10000FA08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10000FA28(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) pendingTatsuRequests]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v2];
}

id sub_10000FB88(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tssResponse:*(void *)(a1 + 40)];
}

id sub_10000FC10(uint64_t a1)
{
  return [*(id *)(a1 + 32) qPostStagingStatusNotificationForAccessory:*(void *)(a1 + 40) status:2];
}

id sub_10000FC9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) qPostStagingStatusNotificationForAccessory:*(void *)(a1 + 40) status:1];
}

id sub_10000FD84(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleHIDDisconnectForAccessory:*(void *)(a1 + 40)];
}

void sub_10000FD90( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000FDBC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1, const char *a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v3 = &_os_log_default;
    id v4 = &_os_log_default;
  }

  if (a2) {
    id v5 = a2;
  }
  else {
    id v5 = "com.apple.MobileAccessoryUpdater";
  }
  id v6 = v3;
  bzero(v10, 0x400uLL);
  id v7 = v6;
  if ((_set_user_dir_suffix(v5) & 1) != 0)
  {
    if (confstr(65537, v10, 0x400uLL))
    {
      uint64_t v8 = 0LL;
      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10001C9E4();
    }
  }

  else if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    sub_10001CA58();
  }

  uint64_t v8 = 1LL;
LABEL_14:

  return v8;
}

void sub_10000FEF4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100010E40(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localURL]);
  uint64_t v3 = *(void *)(a1 + 56);
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v4)
    {
      *(_DWORD *)buf = 136315138;
      __int16 v31 = "-[UARPUpdaterServiceHID assetSolicitationComplete:assetID:withStatus:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Failure", buf, 0xCu);
    }

    id v2 = 0LL;
  }

  else if (v4)
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[UARPUpdaterServiceHID assetSolicitationComplete:assetID:withStatus:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: Success", buf, 0xCu);
  }

  id v5 = *(void **)(*(void *)(a1 + 40) + 32LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) modelNumber]);
  [v5 addSolicitedResponse:v2 modelNumber:v6];

  if ([*(id *)(*(void *)(a1 + 40) + 32) isDynamicAssetSolicitationComplete])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 32) allSolicitedResponses]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 32) solicitedAssetResponseEndpoint]);
    unint64_t v9 = -[UARPStandaloneCommandManagerReply initWithRemoteServiceEndpoint:]( objc_alloc(&OBJC_CLASS___UARPStandaloneCommandManagerReply),  "initWithRemoteServiceEndpoint:",  v8);
    id v10 = v9;
    if (*(_BYTE *)(*(void *)(a1 + 40) + 40LL))
    {
      __int16 v23 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      v24 = v7;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)i) getResponseURLs]);
            [v11 addObjectsFromArray:v17];
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v14);
      }

      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[UARPStandaloneCommandManagerReply remoteObject](v10, "remoteObject"));
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v11));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) modelNumber]);
      [v18 dynamicAssetSolicitationComplete:v19 modelNumber:v20];

      uint64_t v8 = v23;
      id v7 = v24;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UARPStandaloneCommandManagerReply remoteObject](v9, "remoteObject"));
      [v11 dynamicAssetSolicitationComplete:v7];
    }

    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void **)(v21 + 32);
    *(void *)(v21 + 32) = 0LL;
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[UARPUpdaterServiceHID assetSolicitationComplete:assetID:withStatus:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: Still waiting on more responses",  buf,  0xCu);
  }
}

void sub_1000112CC(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 32))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10001CC98(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    id v11 = -[UARPStandaloneCommandManagerReply initWithRemoteServiceEndpoint:]( objc_alloc(&OBJC_CLASS___UARPStandaloneCommandManagerReply),  "initWithRemoteServiceEndpoint:",  a1[6]);
    id v12 = v11;
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPStandaloneCommandManagerReply remoteObject](v11, "remoteObject"));
      [v13 dynamicAssetSolicitationComplete:&__NSArray0__struct modelNumber:a1[5]];
    }

    else
    {
      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v21) {
        sub_10001CC24(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }

  else
  {
    *(_BYTE *)(v2 + 40) = 1;
    id v14 = objc_alloc(&OBJC_CLASS___UARPUpdaterServiceDynamicAssetSolicitationRecord);
    uint64_t v30 = a1[5];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    id v16 = -[UARPUpdaterServiceDynamicAssetSolicitationRecord initWithModelNumbers:endpoint:]( v14,  "initWithModelNumbers:endpoint:",  v15,  a1[6]);
    uint64_t v17 = a1[4];
    __int16 v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = v16;

    uint64_t v19 = a1[7];
    id v20 = (void *)a1[4];
    uint64_t v29 = a1[5];
    id v12 = (UARPStandaloneCommandManagerReply *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL));
    [v20 qProcessStandaloneDynamicAssetSolicitation:v19 modelNumbers:v12 notifyService:a1[6]];
  }
}

void sub_100011560(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10001CD80(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    id v11 = -[UARPStandaloneCommandManagerReply initWithRemoteServiceEndpoint:]( objc_alloc(&OBJC_CLASS___UARPStandaloneCommandManagerReply),  "initWithRemoteServiceEndpoint:",  *(void *)(a1 + 48));
    id v12 = v11;
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[UARPStandaloneCommandManagerReply remoteObject](v11, "remoteObject"));
      [v13 dynamicAssetSolicitationComplete:&__NSArray0__struct];
    }

    else
    {
      BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v17) {
        sub_10001CD0C(v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
  }

  else
  {
    *(_BYTE *)(v2 + 40) = 0;
    id v14 = -[UARPUpdaterServiceDynamicAssetSolicitationRecord initWithModelNumbers:endpoint:]( objc_alloc(&OBJC_CLASS___UARPUpdaterServiceDynamicAssetSolicitationRecord),  "initWithModelNumbers:endpoint:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 32);
    *(void *)(v15 + 32) = v14;

    [*(id *)(a1 + 32) qProcessStandaloneDynamicAssetSolicitation:*(void *)(a1 + 56) modelNumbers:*(void *)(a1 + 40) notifyService:*(void *)(a1 + 48)];
  }

void sub_100011DE0(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___UARPHIDUpdaterPreferences);
  uint64_t v2 = (void *)qword_10002F948;
  qword_10002F948 = (uint64_t)v1;
}

void sub_100012AB4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001CFE8((uint64_t)a2);
  }
}

char *uarpAssetTagMappedAnalytics4cc()
{
  id result = aMtic;
  aMtic[4] = 0;
  return result;
}

uint64_t uarpAssetTagMappedAnalytics()
{
  aMtic[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aMtic);
}

int *uarpAssetTagStructMappedAnalytics()
{
  aMtic[4] = 0;
  id result = &dword_10002F958;
  dword_10002F958 = *(_DWORD *)aMtic;
  return result;
}

__int16 *uarpOuiMappedAnalytics()
{
  id result = &word_10002F95C;
  word_10002F95C = 5408;
  byte_10002F95E = -126;
  return result;
}

uint64_t uarpBuildMappedAnalyticsAsset( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (char *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 11LL;
  }
  uint64_t v12 = (uint64_t)v11;
  aMtic[4] = 0;
  dword_10002F958 = *(_DWORD *)aMtic;
  uint64_t result = UARPSuperBinaryPrepareDynamicAsset(a1, v11, a5, a6, *(int *)aMtic);
  if (!(_DWORD)result)
  {
    if ((_DWORD)a4)
    {
      uint64_t v14 = a4;
      for (uint64_t i = a3 + 20; ; i += 48LL)
      {
        int v16 = *(_DWORD *)(i - 4);
        aMtic[4] = 0;
        dword_10002F958 = *(_DWORD *)aMtic;
        a4 = a4 & 0xFFFFFFFF00000000LL | *(unsigned int *)aMtic;
        uint64_t result = UARPSuperBinaryAddPayload2( a1,  v12,  v16,  a4,  *(void *)(i - 20),  *(void *)(i - 12),  *(const void **)(i + 20),  *(_DWORD *)(i + 12),  0);
        if ((_DWORD)result) {
          break;
        }
        int v17 = uarpNtohl(*(_DWORD *)(i + 8));
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280449, 4u, &v17);
        if ((_DWORD)result) {
          break;
        }
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280448, 5u, (const void *)i);
        if ((_DWORD)result) {
          break;
        }
        if (!--v14) {
          return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
        }
      }
    }

    else
    {
      return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v7 = 0LL;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      unsigned int v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      uint64_t v6 = v7;
      if (*(void *)v7)
      {
        uint64_t result = 0LL;
        *((_DWORD *)v7 + 2) = v5;
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = v6;
        return result;
      }

      UARPLayer2ReturnBuffer(a1, v7);
    }

    return 11LL;
  }

  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      BOOL v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          BOOL v3 = *(void ***)(a2 + 88);
          void *v3 = 0LL;
        }

        UARPLayer2ReturnBuffer(a1, v3);
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = 0LL;
      }
    }
  }

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t v7 = a3;
      if (a3)
      {
        LODWORD(v_Block_object_dispose(va, 8) = a4;
        if (a4)
        {
          uint64_t v9 = *(_DWORD **)(a2 + 88);
          if (v9) {
            goto LABEL_6;
          }
          uint64_t result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              uint64_t v8 = v8;
              unsigned int v10 = v9[4];
              do
              {
                char v11 = *v7++;
                *(_BYTE *)(*(void *)v9 + v10) = v11;
                unsigned int v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  unsigned int v12 = uarpNtohs(*(unsigned __int16 *)(*(void *)v9 + 2LL)) + 6;
                  v9[3] = v12;
                  unsigned int v10 = v9[4];
                }

                else
                {
                  unsigned int v12 = v9[3];
                }

                if (v10 == v12)
                {
                  uint64_t result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if ((_DWORD)result) {
                    return result;
                  }
                  bzero(*(void **)v9, v9[2]);
                  unsigned int v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }

                --v8;
              }

              while (v8);
              return 0LL;
            }

            else
            {
              return 30LL;
            }
          }

          else
          {
            return 27LL;
          }
        }
      }
    }
  }

  return result;
}

char *uarpAssetTagAnalytics4cc()
{
  uint64_t result = aTics;
  aTics[4] = 0;
  return result;
}

uint64_t uarpAssetTagAnalytics()
{
  aTics[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aTics);
}

int *uarpAssetTagStructAnalytics()
{
  aTics[4] = 0;
  uint64_t result = &dword_10002F960;
  dword_10002F960 = *(_DWORD *)aTics;
  return result;
}

__int16 *uarpOuiAnalytics()
{
  uint64_t result = &word_10002F964;
  word_10002F964 = 27480;
  byte_10002F966 = 20;
  return result;
}

uint64_t uarpAnalyticsAssetInitialize(uint64_t a1, uint64_t a2)
{
  __int128 v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 1);
}

uint64_t uarpPlatformAssetProcessingCompleteInternal( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30LL;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0LL;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !(_DWORD)result))
      {
        uint64_t result = 0LL;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0LL;
        }
      }
    }

    else
    {
      return 23LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30LL;
  }
  if (*(_BYTE *)(a3 + 80) == 1) {
    return 16LL;
  }
  if (*(_BYTE *)(a2 + 73) == 1 || !*(_BYTE *)(v3 + 56)) {
    return 31LL;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4LL)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4LL);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!(_DWORD)result) {
    *(_BYTE *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData( uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(_BYTE *)(a2 + 392)) {
    return 29LL;
  }
  uint64_t v7 = a3;
  if ((_DWORD)a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }

  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29LL;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29LL;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  *(_BYTE *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if ((_DWORD)v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != (_DWORD)v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }

    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }

  if (v13 == v14) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384))(a1, a2, a2 + 312);
  }
  else {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0LL;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpNtohl(*v9);
    uint64_t v11 = uarpNtohl(v9[1]);
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }

      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }

    return 0LL;
  }

  return 53LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000LL;
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = sub_10001352C;
      *(void *)(a2 + 384) = sub_100013634;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t sub_10001352C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpNtohl(*v6);
  *(_DWORD *)(a2 + 4) = uarpNtohl(v6[1]);
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = uarpNtohl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 2_Block_object_dispose(va, 8) = uarpNtohl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpNtohl(v6[9]);
  int v7 = uarpNtohl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0LL, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47LL;
  }

  return result;
}

uint64_t sub_100013634(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 68_Block_object_dispose(va, 8) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_1000136FC;
        *(void *)(a2 + 384) = sub_1000137FC;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t sub_1000136FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    int v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uarpNtohl(*v7);
      unsigned int v8 = uarpNtohl(v7[1]);
      if (v8 > *(_DWORD *)(a3 + 24) - 8) {
        break;
      }
      unsigned int v9 = v8;
      unsigned int v10 = v6 - 8;
      unsigned int v6 = v6 - 8 - v8;
      if (v10 >= v8)
      {
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2AssetMetaDataTLV(a1, a2);
        int v7 = (unsigned int *)((char *)v7 + v9 + 8);
        *(_DWORD *)(a3 + 88) += v9;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v11 = 53LL;
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }

  return v11;
}

uint64_t sub_1000137FC(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = sub_1000138D0;
      *(void *)(a2 + 384) = sub_100013950;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }

  return result;
}

uint64_t sub_1000138D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if ((_DWORD)v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t sub_100013950(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpNtohl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpNtohl(a1[6]);
  *(_DWORD *)(a2 + 2_Block_object_dispose(va, 8) = uarpNtohl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(a1[8]);
  int v6 = uarpNtohl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(_BYTE *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 12_Block_object_dispose(va, 8) = v6;
  uint64_t v7 = 48LL;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0LL;
    }
    else {
      return 48LL;
    }
  }

  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44LL;
    }

    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16LL;
      }

      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_100013AE8;
        *(void *)(a2 + 384) = sub_100013BE8;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      return 40LL;
    }
  }

  return result;
}

uint64_t sub_100013AE8(void *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    uint64_t v13 = 0LL;
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }

  else
  {
    uint64_t v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uint64_t v8 = uarpNtohl(*v7);
      uint64_t v9 = uarpNtohl(v7[1]);
      unsigned int v10 = v9;
      unsigned int v11 = v6 - 8;
      unsigned int v6 = v6 - 8 - v9;
      if (v11 >= v9)
      {
        unsigned int v12 = v7 + 2;
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2PayloadMetaDataTLV(a1, a2, v8, v9, v12);
        uint64_t v7 = (_DWORD *)((char *)v12 + v10);
        *(_DWORD *)(a3 + 88) += v10;
        if (v6 > 7) {
          continue;
        }
      }

      goto LABEL_6;
    }

    uint64_t v13 = 53LL;
    UARPLayer2PayloadMetaDataProcessingError((uint64_t)a1, a2);
  }

  return v13;
}

uint64_t sub_100013BE8(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44LL;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43LL;
    }
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 36_Block_object_dispose(va, 8) = v7;
    *(void *)(a2 + 376) = sub_100013DB0;
    *(void *)(a2 + 384) = sub_100013E38;
    if (*(_BYTE *)(a2 + 516) == 1)
    {
      *(_BYTE *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = sub_100013EFC;
    }

    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if ((_DWORD)result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11LL;
      }
    }

    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (!v10)
    {
LABEL_19:
      UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }

    uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
    if (!(_DWORD)result)
    {
      if (*(void *)(a2 + 440)) {
        goto LABEL_19;
      }
      return 11LL;
    }
  }

  return result;
}

uint64_t sub_100013DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0LL;
}

uint64_t sub_100013E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!(_DWORD)v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash( a1,  *(void **)(a3 + 128),  *(unsigned int *)(a3 + 120),  *(void **)(a2 + 528),  *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0LL;
    *(_DWORD *)(a3 + 10_Block_object_dispose(va, 8) = 0;
  }

  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 12_Block_object_dispose(va, 8) = 0LL;
    *(_DWORD *)(a3 + 120) = 0;
  }

  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0LL;
}

uint64_t sub_100013EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(_BYTE *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  uint64_t result = 0LL;
  *(void *)(a3 + 64) = sub_100014430;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16LL;
    }

    else
    {
      uint64_t v7 = 0LL;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_100014060;
        *(void *)(a2 + 384) = j__uarpPlatformAssetPullAllMetaData;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }

      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if ((_DWORD)result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_100014060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11LL;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if ((_DWORD)v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
  }

  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpNtohl(*a2);
  unsigned int v5 = uarpNtohl(a2[1]);
  uint64_t v9 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0LL;
  if (!v6)
  {
    uint64_t v7 = v9;
    *uint64_t v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }

  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1) {
      return 16LL;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 28);
    unsigned int v5 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 312) = v6;
    *(_DWORD *)(a2 + 316) = v5;
    for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
    {
      int v8 = *(_DWORD *)(i + 24);
      if (v8)
      {
        if (v8 != v5 + v6) {
          return 43LL;
        }
        v5 += *(_DWORD *)(i + 28);
        *(_DWORD *)(a2 + 316) = v5;
      }
    }

    *(_DWORD *)(a2 + 680) = v5;
    *(void *)(a2 + 672) = 0LL;
    if (v5)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
      if ((_DWORD)result) {
        return result;
      }
      int v9 = *(_DWORD *)(a2 + 680);
      int v10 = *(_DWORD *)(a2 + 316);
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = *(void *)(a2 + 672);
      *(_DWORD *)(a2 + 336) = v9;
      *(void *)(a2 + 376) = sub_1000142E4;
      *(void *)(a2 + 384) = sub_100014410;
      if (v10) {
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }

    else
    {
      *(void *)(a2 + 32_Block_object_dispose(va, 8) = 0LL;
      *(_DWORD *)(a2 + 336) = 0;
      *(void *)(a2 + 376) = sub_1000142E4;
      *(void *)(a2 + 384) = sub_100014410;
    }

    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000142E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18LL;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10LL;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }

  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18LL;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10LL;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 16_Block_object_dispose(va, 8) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }

        int v19 = 0;
LABEL_17:
        uint64_t result = 0LL;
        v13 += v19;
        *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }

    return 0LL;
  }

uint64_t sub_100014410(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t sub_100014430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer( a1,  *(unsigned __int16 *)(a3 + 45),  *(void *)(a3 + 16),  *(unsigned __int16 *)(a3 + 51),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
  if ((_DWORD)v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2LL, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }

  else
  {
    UARPLayer2HashUpdate( a1,  *(unsigned int *)(a3 + 104),  *(void *)(a3 + 112),  *(void *)(a3 + 32),  *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 8_Block_object_dispose(va, 8) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(_BYTE *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = sub_100013EFC;
  }

  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(void, void *))(a1 + 48);
  if (v4) {
    return v4(*(void *)(a1 + 544), a2);
  }
  uint64_t v6 = uarpZalloc(a3);
  *a2 = v6;
  if (v6) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(void, void *, size_t))(a1 + 48);
  if (v6) {
    return v6(*(void *)(a1 + 544), a3, v5);
  }
  int v8 = uarpZalloc(v5);
  *a3 = v8;
  if (v8) {
    return 0LL;
  }
  else {
    return 11LL;
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(void, void, const void *, uint64_t))(a1 + 80);
  if (!v4) {
    return 14LL;
  }
  if (!*(_WORD *)(a2 + 136)) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3, a4);
  }
  uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
  uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
  return 0LL;
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 152);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 168);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 184);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 200);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[27];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpTagStructPack32(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[64];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(void, unsigned int *, void *))a1[29];
  if (v5) {
    return v5(a1[68], a2, a3);
  }
  uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpTagStructPack32(a2);
      uint64_t v7 = (uint64_t (*)(void, unsigned int *, void *))a1[65];
    }

    return v7(a1[68], a2, a3);
  }

  else
  {
    *a3 = -1LL;
    a3[1] = -1LL;
    return 0LL;
  }

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1LL;
  return 0LL;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }

  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }

  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14LL;
  }
  *(_BYTE *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(void, _DWORD *, _DWORD *))(a1 + 320);
  if (v3) {
    return v3(*(void *)(a1 + 544), a2, a3);
  }
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0LL;
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  int v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14LL;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  int v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1LL;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(void, void, uint64_t, uint64_t, _DWORD *))(a2 + 120);
  if (v11) {
    return (void *)v11(a1[68], *(void *)(a2 + 704), a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!(_DWORD)result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash( a1,  *(void **)(a2 + 560),  *(unsigned int *)(a2 + 568),  *(void **)(a2 + 576),  *(_DWORD *)(a2 + 584));
  if ((_DWORD)result)
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 128);
    if (!v6) {
      return result;
    }
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }

  uint64_t v6 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v6) {
    return v6(*(void *)(a1 + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  uint64_t v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  int v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  int v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  int v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14LL;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
  }

  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
    if (*(_DWORD *)(i + 304) == a3
      && *(void *)(i + 696) == a2
      && uarpAssetTagCompare((unsigned __int8 *)(i + 48), a4))
    {
      break;
    }
  }

  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_BYTE *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 56_Block_object_dispose(va, 8) = 0LL; v4; *(void *)(a1 + 56_Block_object_dispose(va, 8) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0LL;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if ((*(_WORD *)(v7 + 46) & 1) != 0)
          {
            *(void *)(v7 + 696) = 0LL;
            UARPLayer2AssetOrphaned(a1, v7);
          }

          else
          {
            *(_BYTE *)(v7 + 72) = 1;
          }
        }

        if (*(_BYTE *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0LL;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }

      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0LL;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0LL;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(_BYTE *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0LL;
  *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(_BYTE *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0LL;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0LL;
  }

  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0LL;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }

    while (v8);
  }

  *(void *)(a2 + 720) = 0LL;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      int v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          int v12 = (void *)v10[2];
          v10[2] = 0LL;
          UARPLayer2ReturnBuffer(a1, v10);
          int v10 = v12;
        }

        while (v12);
      }

      v9[21] = 0LL;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }

    while (v11);
  }

  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0LL;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }

              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }

              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 56_Block_object_dispose(va, 8) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 4_Block_object_dispose(va, 8) = *a4;
              }

              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0LL;
    *(_DWORD *)(a2 + 8_Block_object_dispose(va, 8) = 0;
  }

  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0LL;
    *(_DWORD *)(a2 + 104) = 0;
  }

  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0LL;
    *(_DWORD *)(a2 + 120) = 0;
  }

  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0LL;
    *(_DWORD *)(a2 + 72) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0LL;
    *(_DWORD *)(a2 + 160) = 0;
  }

  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0LL;
    *(_DWORD *)(a2 + 144) = 0;
  }

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }

    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0LL);
    }
  }

  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }

    while (v2);
  }

  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if ((_DWORD)result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }

  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0LL;
    a3[1] = v7;
    return result;
  }

  return 39LL;
}

uint64_t uarpPlatformQueryAccessoryInfo( void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) <= 1)
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }

          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }

          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }

        return 39LL;
      }

      if (a2 == 8)
      {
        *a5 = 8;
        if (a4 < 8) {
          return 39LL;
        }
        uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
        *a3 = uarpHtonl(*a3);
        a3[1] = uarpHtonl(a3[1]);
      }

      else
      {
        *a5 = 0;
        return 28LL;
      }

      return Error;
  }

uint64_t uarpPlatformResponseAccessoryInfo( uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 13_Block_object_dispose(va, 8) = *(_OWORD *)a6;
      }

      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }

      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        a6[2] = uarpNtohl(a6[2]);
        a6[3] = uarpNtohl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }

      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }

      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t uarpPlatformAssetDataRequest( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17LL;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17LL;
    }
  }

  unsigned int v10 = *(_DWORD *)(v8 + 68);
  else {
    unsigned __int16 v11 = a4;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return UARPLayer2DataTransferResume(a1, a2);
  }
  while (1)
  {
    if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
    {
      uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
      if ((_DWORD)result) {
        break;
      }
    }

    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return UARPLayer2DataTransferResume(a1, a2);
    }
  }

  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(_BYTE *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }

    while (v5);
  }

  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0LL;
  }

  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + _Block_object_dispose(va, 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }

    else
    {
      return 11LL;
    }
  }

  else if (a4 == 3)
  {
    return 0LL;
  }

  else
  {
    return 13LL;
  }

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpTagStructPack32((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  *(_DWORD *)(v6[2] + 6LL) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0LL;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }

  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0LL;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0LL;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 56_Block_object_dispose(va, 8) = result;
    }
  }

  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1LL;
  }
  if ((_DWORD)__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0LL;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1LL;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2LL;
  }
  uint64_t v5 = 0LL;
  unint64_t v6 = 0LL;
  while (uarpAssetTagIsValid((_BYTE *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4LL;
  }

  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }

            if (!--v3) {
              return result;
            }
          }

          *(_BYTE *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(_BYTE *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
        }

        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }

    uint64_t result = 0LL;
    void *v5 = a2;
  }

  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0LL;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!(_DWORD)result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if ((_DWORD)v9)
      {
        uint64_t v10 = 0LL;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8LL;
        }

        while (8 * v9 != v10);
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0LL;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0LL;
  if (!v2)
  {
    else {
      return v4;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59LL;
  }
  if (!v4) {
    return 60LL;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61LL;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + _Block_object_dispose(va, 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return sub_100016604(a1, a2, 1u);
}

uint64_t sub_100016604(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return sub_100016604(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + _Block_object_dispose(va, 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13LL;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11LL;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(_BYTE *)(v14 + _Block_object_dispose(va, 8) = *((_BYTE *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5)
  {
    if (a6) {
      memcpy((void *)(v14 + 11), a5, a6);
    }
  }

  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11LL;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11LL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30LL;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9LL;
  }
  *a3 = uarpNtohs(*a3);
  a3[1] = uarpNtohs(a3[1]);
  unsigned __int16 v9 = uarpNtohs(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9LL;
  }
  uint64_t v4 = 1LL;
  *(_BYTE *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }

      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0LL;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpNtohs(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0LL;
            *(void *)(a2 + 13_Block_object_dispose(va, 8) = 0LL;
            *(void *)(a2 + 162) = 0LL;
            *(void *)(a2 + 154) = 0LL;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }

            if (*(_BYTE *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }

          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
      }

    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpNtohs(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpNtohs(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2LL;
        goto LABEL_184;
      }

      unsigned int v118 = uarpNtohs(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0LL;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      uint64_t v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + _Block_object_dispose(va, 8) = uarpNtohl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }

      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + _Block_object_dispose(va, 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }

      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpNtohs(a3[3]);
      int v26 = uarpNtohl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpNtohl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpNtohs(a3[5]);
      uint64_t v29 = uarpNtohs(a3[6]);
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), &v129);
      unsigned int v30 = uarpNtohl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpNtohs(a3[17]);
      __int128 v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpTagStructPack32(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap((unsigned int *)&v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }

      *(void *)(PreparedAsset + 452) = -1LL;
      *(_DWORD *)(PreparedAsset + 44_Block_object_dispose(va, 8) = uarpNtohs(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 4_Block_object_dispose(va, 8) = v130;
      *(_OWORD *)(PreparedAsset + 52) = v129;
      *(_DWORD *)(PreparedAsset + 6_Block_object_dispose(va, 8) = uarpNtohl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if ((v37 & 1) != 0)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }

      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22LL;
          goto LABEL_184;
        }

        UARPLayer2DynamicAssetOffered(a1, a2);
      }

      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpNtohs(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129) = v39;
      uint64_t v40 = uarpNtohl(*((_DWORD *)a3 + 2));
      int v41 = uarpNtohs(a3[3]);
      __int128 v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      uint64_t v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)&v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + _Block_object_dispose(va, 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons((unsigned __int16)v129);
      __int16 v45 = v129 + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(v129 + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpNtohs(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpNtohs(a3[3]);
      int v50 = uarpNtohl(*(_DWORD *)(a3 + 5));
      int v51 = uarpNtohs(a3[7]);
      size_t v52 = uarpNtohs(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0LL;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpNtohs(a3[3]);
      v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(_BYTE *)(a2 + 56) == 1)
      {
        *(_BYTE *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }

      if ((v54 & 2) == 0 || *(_BYTE *)(a2 + 56))
      {
        uint64_t v4 = 33LL;
        goto LABEL_184;
      }

      *(_BYTE *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpNtohs(a3[3]);
      uint64_t v57 = uarpNtohs(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      v59 = (void *)v58;
      LODWORD(v129) = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + _Block_object_dispose(va, 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)&v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0LL;
            }

            else
            {
              unint64_t v127 = 0LL;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }

              while (v127 < v65);
            }

            v128 = *(_BYTE **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }

      goto LABEL_183;
    case 0xAu:
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11LL;
      v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + _Block_object_dispose(va, 8) = uarpHtons((unsigned __int16)v129);
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpNtohs(a3[3]);
      v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6LL) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!(_DWORD)v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpNtohs(a3[3]);
      if ((v75 & 1) != 0)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }

      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26LL;
          goto LABEL_184;
        }

        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }

      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(_BYTE *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpNtohs(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0LL);
        goto LABEL_183;
      }

      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }

LABEL_149:
      uint64_t v4 = 17LL;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9LL;
        goto LABEL_184;
      }

      v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11LL;
        goto LABEL_184;
      }

      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, &v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }

      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, &v129, 2u, 3328);
      }

      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpNtohs(a3[5]);
      int v82 = *(_DWORD *)(a3 + 3);
      LODWORD(v129) = v82;
      v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)&v129);
      if (v86)
      {
        *(_BYTE *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }

      uint64_t v4 = 3LL;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpNtohs(a3[5]);
      LODWORD(v129) = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)&v129);
      if (v87)
      {
        *(_BYTE *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if ((_DWORD)v4 != 3) {
          goto LABEL_184;
        }
      }

      goto LABEL_183;
    case 0x15u:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpNtohs(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if ((_DWORD)v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpNtohs(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || (_DWORD)v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpNtohs(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + _Block_object_dispose(va, 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if ((_DWORD)v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }

      v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126( *(void *)(a1 + 544),  8LL,  "UARP.LAYER2 <%s> Cannot find downstream endpoint",  "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58LL;
      goto LABEL_184;
    case 0x1Du:
      v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!(_DWORD)v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8LL;
      }

      else
      {
        uarpNtohs(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }

      goto LABEL_184;
  }

  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
  }

  if (uarpNtohs(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }

  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0LL;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + _Block_object_dispose(va, 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = aChdr;
  aChdr[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  aChdr[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aChdr);
}

int *uarpAssetTagStructChdr()
{
  aChdr[4] = 0;
  uint64_t result = &dword_10002F968;
  dword_10002F968 = *(_DWORD *)aChdr;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if ((_DWORD)result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!(_DWORD)result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }

  *a2 = v4;
  a2[1] = v2;
  if ((_DWORD)result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

_BYTE *uarpPayloadTagStructPack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

_BYTE *uarpPayloadTagStructUnpack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructPack32(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2LL;
  }
  if (*a1 < *a2) {
    return 1LL;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2LL;
  }
  if (v2 < v3) {
    return 1LL;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2LL;
  }
  if (v4 < v5) {
    return 1LL;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2LL;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }

  else
  {
    return 3LL;
  }

BOOL uarpAssetTagCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpNtohl(*a1);
  a2[1] = uarpNtohl(a1[1]);
  a2[2] = uarpNtohl(a1[2]);
  uint64_t result = uarpNtohl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return (&off_100028920)[a1];
  }
}

BOOL uarpAssetTagIsValid(_BYTE *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &dword_10002F96C;
  dword_10002F96C = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  else {
    return (&off_100028B18)[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return (&off_100028B48)[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  else {
    return (&off_100028BC0)[(__int16)(a1 - 1)];
  }
}

__int128 *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)xmmword_10002F970, "Upload Complete");
      return xmmword_10002F970;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)xmmword_10002F970, 0x100uLL, "%s (%s)", v1, v2);
      return xmmword_10002F970;
  }

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return (&off_100028C30)[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return (&off_100028BE8)[a1];
  }
}

void *uarpProcessPayloadTLVInternal( void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 == -858619624)
  {
    *(_DWORD *)(a3 + 120) = a5;
    unsigned int v15 = (void **)(a3 + 112);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619625)
  {
    if ((_DWORD)a5 == 2)
    {
      uint64_t v12 = uarpNtohs(*(unsigned __int16 *)a6);
      *(_DWORD *)(a3 + 76) = v12;
      UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
      unsigned int v13 = *(_DWORD *)(a3 + 88);
      if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
      {
        unsigned int v14 = *(_DWORD *)(a3 + 104);
      }

      *(_DWORD *)(a3 + 76) = 0;
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (*(_DWORD *)(a3 + 76))
  {
    int v18 = uarpHtonl(a4);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v18, 4LL);
    int v17 = uarpHtonl(a5);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v17, 4LL);
    uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
  }

  if (a4 > -858619631)
  {
    if (a4 == -858619630)
    {
      if ((_DWORD)a5 == 2)
      {
        uint64_t result = (void *)uarpNtohs(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 56) = (_DWORD)result;
        return result;
      }
    }

    else
    {
      if (a4 != -858619623) {
        return result;
      }
      if ((_DWORD)a5 == 4)
      {
        uint64_t result = (void *)uarpNtohl(*a6);
        *(_DWORD *)(a3 + 12_Block_object_dispose(va, 8) = (_DWORD)result;
        return result;
      }
    }

    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 == -858619641)
  {
    *(_DWORD *)(a3 + 72) = a5;
    unsigned int v16 = (void **)(a3 + 64);
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }

  if (a4 != -858619636) {
    return result;
  }
  if ((_DWORD)a5 != 4) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  uint64_t result = (void *)uarpNtohl(*a6);
  if (!(_DWORD)result) {
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_BYTE *)(a3 + 52) = 1;
  if (!*(void *)(a2 + 656))
  {
    uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
    if (*(void *)(a2 + 656))
    {
      *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
      *(_BYTE *)(a2 + 66_Block_object_dispose(va, 8) = 0;
    }
  }

  return result;
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2LL;
  }
  else {
    return 3LL;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }

  return result;
}

void uarpPrintDataResponseDetails( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    else {
      unsigned int v15 = (&off_100028C30)[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12( v13,  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v15,  v18,  a5,  a6,  a7);
  }

  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    else {
      int v17 = (&off_100028C30)[v16];
    }
    int v19 = uarpStatusCodeToString(a4);
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u",  v17,  v19,  a5,  a6,  a7);
  }

  uint64_t v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    else {
      uint64_t v22 = (&off_100028C30)[v21];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20( *(void *)(a1 + 544),  1LL,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v22,  v25,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    else {
      __int16 v24 = (&off_100028C30)[v23];
    }
    if (*(_BYTE *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo( 1u,  "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u",  v24,  v26,  *(_DWORD *)(a3 + 92),  *(_DWORD *)(a3 + 96));
  }

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0LL;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  uint64_t result = 0LL;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0LL;
    }

    else
    {
      unsigned int v9 = v11;
      uint64_t result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }

  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = sub_1000190B0(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0LL;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }

    while (v16 != v17);
  }

  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0LL;
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 8LL * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8LL;
    }

    while (v21 != v20);
  }

  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = sub_1000190B0(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((_BYTE *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }

    return 0LL;
  }

  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + _Block_object_dispose(va, 8) = 0LL;
      }

      v4 += 8LL;
    }

    while (8LL * (v3 - 1) != v4);
  }

  if (!(_DWORD)v3) {
    return 11LL;
  }
  for (uint64_t i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11LL;
    }
  }

  void *i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0LL;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v4 = a1;
  while (1)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
        if (v6) {
          break;
        }
        if (++v5 == v2) {
          return 0LL;
        }
      }

      if (*(_BYTE *)(v6 + 32) != 1) {
        break;
      }
      ++v5;
      if (*(void *)(v4 + 296)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v5 == v2;
      }
      if (v7) {
        return 0LL;
      }
    }

    if (*(_BYTE *)(v6 + 33) == 1) {
      goto LABEL_21;
    }
    int v8 = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF) {
      break;
    }
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if ((_DWORD)a1) {
      goto LABEL_23;
    }
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    uint64_t v9 = 0LL;
    int v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112)) {
      return v9;
    }
  }

  if (v8 == 3
    && uarpNtohl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }

LABEL_23:
  if (*(_BYTE *)(a2 + 50) == 1) {
    return 0LL;
  }
  unsigned int v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(_BYTE *)(v6 + 30) = v10 + 1;
    *(_BYTE *)(v6 + 32) = 1;
    if (*(_BYTE *)(v6 + 31) == 1) {
      UARPLayer2WatchdogSet(v4, a2);
    }
    *(_WORD *)(*(void *)(v6 + 16) + 4LL) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    uint64_t v9 = UARPLayer2SendMessage( v4,  a2,  *(const void **)v6,  *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v6 + 28));
    UARPLayer2LogPacket(v4, a2);
    if ((_DWORD)v9)
    {
      *(_BYTE *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v6 + 16));
    }
  }

  else
  {
    uint64_t active = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    switch((_DWORD)active)
    {
      case 0xFFFF:
        uint64_t active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        uint64_t active = uarpNtohl(*(_DWORD *)(*(void *)(v6 + 16) + 6LL));
        switch((int)active)
        {
          case 1:
            uint64_t active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            uint64_t active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            uint64_t active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            uint64_t active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            uint64_t active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            uint64_t active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            uint64_t active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            uint64_t active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            uint64_t active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }

        break;
      case 1:
        *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = 0;
        uint64_t active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }

LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0LL;
  }

  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }

    *uint64_t v4 = 0LL;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 2_Block_object_dispose(va, 8) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }

      void *v8 = a3;
    }

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v25 = a4 & 0xFFF8;
    int v11 = a4 & 0xFFF0;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_38;
      }
      int v13 = uarpNtohs(*a3);
      int v14 = uarpNtohs(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11) {
          goto LABEL_38;
        }
        int v19 = *((_DWORD *)a3 + 2);
        int v20 = *(_DWORD *)(*(void *)(v12 + 16) + 6LL);
        goto LABEL_37;
      }

      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[7];
        goto LABEL_26;
      }

      if (v13 == 11 && v14 == 10)
      {
LABEL_63:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0LL;
      }

      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }

      if (v13 == 14 && v14 == 8) {
        goto LABEL_63;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }

      if (v13 == 16 && v14 == 12)
      {
        if (!v25) {
          goto LABEL_38;
        }
LABEL_36:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6LL);
LABEL_37:
        if (v19 == v20) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_38;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
        uint64_t v22 = v9;
LABEL_48:
        if (uarpAssetTagCompare(v22, v21)) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }

      if (v13 == 22 && v14 == 21
        || v13 == 24 && v14 == 23
        || v13 == 26 && v14 == 25
        || v13 == 28 && v14 == 27
        || v13 == 30 && v14 == 29
        || v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
      {
        goto LABEL_63;
      }

LABEL_38:
    }

    if (a4 < 0xEu) {
      goto LABEL_38;
    }
    uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6LL);
    uint64_t v22 = v10;
    goto LABEL_48;
  }

  return 0LL;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0LL;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }

        ++v6;
      }

      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }

    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0LL;
    *(_WORD *)(a2 + 96) = 0;
  }

  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0LL;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0LL;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }

        ++v10;
      }

      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }

    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0LL;
    *(_WORD *)(a2 + 112) = 0;
  }

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(_BYTE *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33LL) != 1)
      {
        break;
      }
    }
  }

  return 1LL;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpNtohs(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6LL));
        }
      }

      ++v5;
    }

    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }

void *sub_1000190B0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0LL;
  }
  for (uint64_t i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0LL;
    }
  }

  void *i = 0LL;
  if (v8[6] < a3)
  {
    UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
    return uarpAllocateTransmitBuffer2(a1, a2, a3);
  }

  return v8;
}

void *uarpZalloc(size_t a1)
{
  return calloc(a1, 1uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if ((_DWORD)src_size != (_DWORD)__n) {
        return 51LL;
      }
      memcpy(__dst, __src, __n);
      return 0LL;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = 1794;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer( (uint8_t *)__dst,  __n,  (const uint8_t *)__src,  src_size,  0LL,  v5) == __n) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = 51LL;
      }
      break;
    default:
      uint64_t result = 50LL;
      break;
  }

  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50LL;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }

  else
  {
    int v4 = dword_10002789C[v3];
    int v5 = 16 * v3 + 32;
  }

  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }

  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if ((_DWORD)result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }

  else if ((_DWORD)result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }

  else if ((_DWORD)result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }

  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)sub_1000193A4(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001D0E8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void *sub_1000193A4(unsigned int a1)
{
  for (uint64_t i = 0LL; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    qword_100030A70[i] = os_log_create("com.apple.uarp.embedded", v3);
  }

  if (a1 <= 8) {
    return (void *)qword_100030A70[a1];
  }
  else {
    return &_os_log_default;
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)sub_1000193A4(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001D158(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)sub_1000193A4(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = byte_10002FE70;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  int v3 = (os_log_s *)sub_1000193A4(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10001D1C8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)sub_1000193A4(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10001D238(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)sub_1000193A4(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = byte_100030470;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }

void uarpPlatformDarwinLogDebug( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)sub_1000193A4(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10001D2A8(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogFault( uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (os_log_s *)sub_1000193A4(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_10001D318(v10);
  }
}

void sub_100019790( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, __int128 *a4, int a5)
{
  uint64_t v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30LL;
  if (a3 >= 2)
  {
    if (v9)
    {
      uarpZero(&v13, 0x2CuLL);
      uint64_t v13 = 0x2C00000002LL;
      __int128 v15 = *a4;
      int v17 = 44;
      int v18 = 40 * a5;
      int v16 = 40 * a5 + 44;
      int v14 = v16;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)&v13, 44LL, 0LL);
      if (!(_DWORD)result)
      {
        if (a5)
        {
          uint64_t v11 = 44LL;
          while (1)
          {
            uarpZero(v12, 0x28uLL);
            v12[0] = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v9, (uint64_t)v12, 40LL, v11);
            if ((_DWORD)result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0LL;
            }
          }
        }

        else
        {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  uint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v18);
  int v12 = result;
  if (v18[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v18[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 44LL, 0LL, &v17);
  if (!(_DWORD)result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (v21 + v20);
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v16, 8LL, v14);
      if (!(_DWORD)result)
      {
        v21 += 8;
        v19 += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v10,  a5,  (unsigned __int16)a4,  (v20 + v21));
        if (!(_DWORD)result)
        {
          v21 += (unsigned __int16)a4;
          v19 += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 44LL, 0LL);
        }
      }
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, __int128 *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  uint64_t v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v16);
  int v12 = result;
  if (v16[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v16[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v16, 44LL, 0LL, &v21);
  if (!(_DWORD)result)
  {
    if (v21 != 44) {
      return 11LL;
    }
    uint64_t v14 = (v17 + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v18, 40LL, v14, &v21);
    if (!(_DWORD)result)
    {
      if (v21 == 40)
      {
        int v19 = uarpTagStructPack32(a4);
        __int128 v20 = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v18, 40LL, v14);
      }

      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30LL;
  }
  int v12 = (void *)v11;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v11, &__dst, 4LL, 0LL, v21);
  int v14 = result;
  if (v21[0] == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || v21[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v21, 44LL, 0LL, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 44) {
    return 11LL;
  }
  uint64_t v16 = (v23 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v12, v24, 40LL, v16, &v27);
  if ((_DWORD)result) {
    return result;
  }
  if (v27 != 40) {
    return 11LL;
  }
  int v17 = v25;
  if (!v25)
  {
    int v17 = v22;
    int v25 = v22;
  }

  uint64_t v18 = (v26 + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v20, 8LL, v18);
  if (!(_DWORD)result)
  {
    v26 += 8;
    v22 += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  v12,  a6,  (unsigned __int16)a5,  (v25 + v26));
    if (!(_DWORD)result)
    {
      v26 += (unsigned __int16)a5;
      v22 += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v24, 40LL, v16);
      if (!(_DWORD)result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v12, (uint64_t)v21, 44LL, 0LL);
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if ((_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39LL;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30LL;
  }
  unsigned int v10 = (void *)v9;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v9, &__dst, 4LL, 0LL, v17);
  int v12 = result;
  if (v17[0] == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || v17[0] != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v17, 44LL, 0LL, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 44) {
    return 11LL;
  }
  uint64_t v14 = (v19 + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, (uint64_t)v10, v20, 40LL, v14, &v23);
  if ((_DWORD)result) {
    return result;
  }
  if (v23 != 40) {
    return 11LL;
  }
  int v15 = v21;
  if (!v21)
  {
    int v15 = v18;
    int v21 = v18;
  }

  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, a4, (unsigned __int16)a5, (v22 + v15));
  if (!(_DWORD)result)
  {
    v22 += a5;
    v18 += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v20, 40LL, v14);
    if (!(_DWORD)result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, v10, (uint64_t)v17, 44LL, 0LL);
    }
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30LL;
  }
  uint64_t v4 = v3;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v3, &__dst, 4LL, 0LL, &v12);
  if ((_DWORD)result) {
    return result;
  }
  if (v12 != 4) {
    return 11LL;
  }
  if (__dst < 2) {
    return 30LL;
  }
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, &v13, 44LL, 0LL, &v16);
  if ((_DWORD)result) {
    return result;
  }
  if (v16 != 44) {
    return 11LL;
  }
  __int128 v6 = v13;
  __int128 v7 = *(_OWORD *)v14;
  *(_OWORD *)(v4 + 2_Block_object_dispose(va, 8) = *(_OWORD *)&v14[12];
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)&v13, &v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)&v13, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, v4, v15, 40LL, v10, &v16);
        if ((_DWORD)result) {
          break;
        }
        if (v16 != 40) {
          return 11LL;
        }
        uarpPayloadHeaderEndianSwap(v15, v15);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)v4, (uint64_t)v15, 40LL, v10);
        if ((_DWORD)result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }

      while (v9);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0LL, a2, __dst, 44LL, 0LL, &v5);
  if (!(_DWORD)result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap(__dst, __dst);
      uint64_t result = 0LL;
      *a3 = __dst[2];
    }

    else
    {
      return 11LL;
    }
  }

  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002LL;
  *(_OWORD *)(a2 + 2_Block_object_dispose(va, 8) = xmmword_1000278B0;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0LL;
  *((void *)a2 + 90) = 0LL;
  *((_OWORD *)a2 + 42) = 0u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData( uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + _Block_object_dispose(va, 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0LL;
}

uint64_t UARPSuperBinaryAddPayload2( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  *unsigned __int16 v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }

  *((_BYTE *)v16 + 14_Block_object_dispose(va, 8) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0LL;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0LL;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData( uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11LL;
  }
  unsigned int v14 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }

    return result;
  }

  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v16 = v18;
  int v17 = (void *)(v18 + 24);
  *(void *)(v18 + _Block_object_dispose(va, 8) = v18 + 24;
  *(_DWORD *)uint64_t v16 = a4;
  *(_DWORD *)(v16 + 4) = a5;
  memcpy(v17, a6, a5);
  uint64_t result = 0LL;
  *(void *)(v16 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 16_Block_object_dispose(va, 8) = v16;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob( uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11LL;
  }
  unsigned int v12 = 1;
  uint64_t result = 11LL;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }

    return result;
  }

  if (*(void *)(v6 + 152)) {
    return 27LL;
  }
  UARPLayer2ReturnBuffer(a1, 0LL);
  *(void *)(v6 + 152) = 0LL;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0LL, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0LL;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  size_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpNtohl(*(_DWORD *)v11);
      uint64_t v13 = uarpNtohl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11LL;
      }
      *size_t v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      size_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    uint64_t result = 0LL;
    *a6 = v8;
    *a4 = v9;
  }

  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, a2, 44LL, 0LL);
  if (!(_DWORD)result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0LL, (void *)a2, (uint64_t)v13, 40LL, v5);
        if ((_DWORD)result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }

    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0LL;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if ((_DWORD)result) {
          return result;
        }
        unsigned __int16 v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if ((_DWORD)result) {
          return result;
        }
        int v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v15,  (unsigned __int16)v16,  v5);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }

      if (!v8) {
        return 0LL;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28LL);
        if (v20)
        {
          unsigned int __dst = 0LL;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if ((_DWORD)result) {
            return result;
          }
          int v21 = __dst;
          unsigned __int16 v27 = (unint64_t *)__dst;
          int v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            int v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }

          uint64_t result = UARPSuperBinaryBuildMetaData( (uint64_t)v21,  (uint64_t)v22,  *(void *)(v19 + 168),  &v27,  *(_DWORD *)(v19 + 28),  &v28);
          if ((_DWORD)result) {
            return result;
          }
          unsigned __int16 v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  (uint64_t)v23,  (unsigned __int16)v24,  v5);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }

        uint64_t v18 = v19 + 176;
        ++v17;
      }

      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(_BYTE *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset( a1,  0LL,  (void *)a2,  *(void *)(v26 + 136),  *(unsigned __int16 *)(v26 + 144),  v5);
            if ((_DWORD)result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }

          uint64_t result = 0LL;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((v8 = *(_DWORD *)(a2 + 28), unsigned int v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0LL;
  }

  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40LL;
  }

  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData( int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40LL;
    goto LABEL_14;
  }

  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }

  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }

  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0LL;
LABEL_14:
  *a6 = v14;
  return result;
}

uint64_t uarpPlatformEndpointInit2( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0LL);
}

uint64_t uarpPlatformEndpointInit( char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30LL;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 6_Block_object_dispose(va, 8) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    __int128 v16 = *a4;
    __int128 v15 = a4[1];
    *((_DWORD *)a1 + _Block_object_dispose(va, 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0LL;
    *((_DWORD *)a1 + 13_Block_object_dispose(va, 8) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        __int128 v7 = *(_OWORD *)a1;
        __int128 v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (__int128 v10 = *a3,
              __int128 v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 4_Block_object_dispose(va, 8) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(_BYTE *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 5_Block_object_dispose(va, 8) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer( a1,  (void *)(a2 + 80),  4 * *(unsigned __int16 *)(a2 + 28)),  !(_DWORD)result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!(_DWORD)result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }

              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!(_DWORD)result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0LL;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }

                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
                if (!(_DWORD)result)
                {
                  uint64_t result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!(_DWORD)result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2) {
                      return 0LL;
                    }
                    uint64_t result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!(_DWORD)result) {
                      return 0LL;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0LL;
        }
        v6 += 8LL;
      }

      while (v7 != v6);
    }

    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0LL;
    *(void *)(a2 + 80) = 0LL;
  }

  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7) {
    return uarpSendInformationRequest(a1, a2, a3);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, _BYTE *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!(_DWORD)ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if ((_DWORD)ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }

            else
            {
              uint64_t ActiveFirmwareVersion = 0LL;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }

            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }

  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0LL, 0, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0LL, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }

    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 56_Block_object_dispose(va, 8) = a3;
    }

    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30LL;
    }
    __int128 v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    __int128 v18 = a5[2];
    __int128 v19 = a5[3];
    __int128 v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 12_Block_object_dispose(va, 8) = v19;
    __int128 v21 = a5[6];
    __int128 v22 = a5[7];
    __int128 v23 = a5[9];
    *(_OWORD *)(a3 + 20_Block_object_dispose(va, 8) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    __int128 v24 = a5[10];
    __int128 v25 = a5[11];
    __int128 v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 28_Block_object_dispose(va, 8) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(_BYTE *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = a7;
      *(_BYTE *)(a3 + 652) = 1;
    }

    else if (!*(void *)(a3 + 640))
    {
      uint64_t v29 = (void *)(a3 + 640);
      *(_BYTE *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if ((_DWORD)result) {
        return result;
      }
      if (!*v29) {
        return 11LL;
      }
    }

    if (a8)
    {
      if (!*(_BYTE *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }

    else
    {
      char v27 = 0;
    }

    *(_BYTE *)(a3 + 66_Block_object_dispose(va, 8) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }

    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0LL;
      }

      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508)) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
          uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3);
          if (!(_DWORD)result) {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }

        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }

    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      __int128 v4 = *(_OWORD *)(a3 + 32);
      __int128 v5 = *(_OWORD *)(a3 + 48);
      __int128 v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 12_Block_object_dispose(va, 8) = v5;
      __int128 v7 = *(_OWORD *)(a3 + 96);
      __int128 v8 = *(_OWORD *)(a3 + 112);
      __int128 v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 20_Block_object_dispose(va, 8) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      __int128 v11 = *(_OWORD *)(a3 + 176);
      __int128 v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 28_Block_object_dispose(va, 8) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30LL;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      __int128 v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      __int128 v9 = a6[2];
      __int128 v10 = a6[3];
      __int128 v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 12_Block_object_dispose(va, 8) = v10;
      __int128 v12 = a6[6];
      __int128 v13 = a6[7];
      __int128 v14 = a6[9];
      *(_OWORD *)(a3 + 20_Block_object_dispose(va, 8) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      __int128 v15 = a6[10];
      __int128 v16 = a6[11];
      __int128 v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 28_Block_object_dispose(va, 8) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!(_DWORD)v6) {
        *(_BYTE *)(a3 + 72) = 1;
      }
    }

    else
    {
      return 30LL;
    }
  }

  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0LL, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }

          return 0LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *a2;
    }
  }

  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44LL;
    }

    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      uint64_t v6 = (_OWORD *)(a2 + 464);
      *(void *)(a2 + 50_Block_object_dispose(va, 8) = 0LL;
      if (*(_BYTE *)(a2 + 460) == 1)
      {
        __int128 v7 = *(__int128 **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            int v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              __int128 v9 = *v7;
              __int128 v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              _OWORD *v6 = v9;
              __int128 v11 = v7[3];
              __int128 v12 = v7[4];
              __int128 v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 52_Block_object_dispose(va, 8) = v12;
              __int128 v14 = v7[7];
              __int128 v15 = v7[8];
              __int128 v16 = v7[9];
              *(void *)(a2 + 624) = *((void *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 60_Block_object_dispose(va, 8) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (uint64_t i = *((void *)v7 + 21); i; uint64_t i = *(void *)(i + 16))
                uarpProcessPayloadTLVInternal( a1,  a2,  a2 + 464,  *(_DWORD *)i,  *(unsigned int *)(i + 4),  *(_DWORD **)(i + 8));
              uint64_t v18 = *((unsigned int *)v7 + 19);
              if ((_DWORD)v18)
              {
                UARPLayer2HashFinal( (uint64_t)a1,  v18,  *((void *)v7 + 10),  *((void *)v7 + 12),  *((unsigned int *)v7 + 26));
              }
            }

            __int128 v7 = (__int128 *)*((void *)v7 + 22);
            if (!v7) {
              return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
            }
          }

          return 54LL;
        }

        else
        {
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }

      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (a1 && a2)
  {
    unsigned int v3 = *(_DWORD *)(a2 + 500);
    if (v3) {
      v3 -= *(_DWORD *)(a2 + 508);
    }
    if (v3 >= *(_DWORD *)(a2 + 648)) {
      unsigned int v3 = *(_DWORD *)(a2 + 648);
    }
    if (v3) {
      return uarpPlatformAssetPayloadPullData(a1, a2);
    }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0LL;
  }

  return v2;
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 460) = 1;
  if (*(_DWORD *)(a2 + 32)) {
    return uarpPlatformAssetPullAllMetaData(a1, a2);
  }
  UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
  return 0LL;
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30LL;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44LL;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43LL;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 16LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 50_Block_object_dispose(va, 8) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a2 + 73) = 1;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30LL;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(_BYTE *)(a2 + 73)) {
    return v2;
  }
  *(_BYTE *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(_BYTE *)(a2 + 392) == 1) {
    return 0LL;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30LL;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, __int128 *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __int128 v3 = *a2;
      __int128 v4 = a2[1];
      *(_OWORD *)(a3 + 2_Block_object_dispose(va, 8) = *(__int128 *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((_BYTE *)a2 + 72) = 1;
      *(_BYTE *)(a3 + 72) = 0;
      *(_BYTE *)(a3 + 73) = *((_BYTE *)a2 + 73);
      *((_BYTE *)a2 + 392) = 0;
      __int128 v6 = *(__int128 *)((char *)a2 + 360);
      __int128 v5 = *(__int128 *)((char *)a2 + 376);
      __int128 v7 = *(__int128 *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 32_Block_object_dispose(va, 8) = *(__int128 *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(__int128 *)((char *)a2 + 312);
      __int128 v8 = *(__int128 *)((char *)a2 + 392);
      __int128 v9 = *(__int128 *)((char *)a2 + 408);
      __int128 v10 = *(__int128 *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 40_Block_object_dispose(va, 8) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      __int128 v11 = a2[29];
      __int128 v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      __int128 v13 = a2[32];
      __int128 v14 = a2[33];
      __int128 v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 52_Block_object_dispose(va, 8) = v14;
      __int128 v16 = a2[36];
      __int128 v17 = a2[37];
      __int128 v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 60_Block_object_dispose(va, 8) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 7_Block_object_dispose(va, 8) = 0LL;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0LL;
      *(_BYTE *)(a3 + 652) = *((_BYTE *)a2 + 652);
      *(_DWORD *)(a3 + 64_Block_object_dispose(va, 8) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(void *)(a3 + 656) = *((void *)a2 + 82);
      *((void *)a2 + 82) = 0LL;
      *(_BYTE *)(a3 + 66_Block_object_dispose(va, 8) = *((_BYTE *)a2 + 668);
      *(_DWORD *)(a3 + 664) = *((_DWORD *)a2 + 166);
      *((_DWORD *)a2 + 166) = 0;
      *(_DWORD *)(a3 + 68_Block_object_dispose(va, 8) = *((_DWORD *)a2 + 172);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(_BYTE *)(a1 + 580)) {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0LL, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30LL;
            }
          }

          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44LL, 0LL, &v7);
          if (!(_DWORD)result)
          {
            uarpSuperBinaryHeaderEndianSwap(__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 6_Block_object_dispose(va, 8) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 44_Block_object_dispose(va, 8) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!(_DWORD)result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset( uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30LL;
  if (a1 && a3 && __dst && (_DWORD)a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if ((_DWORD)result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }

    if ((v15 & 8) == 0) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
    uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7);
    if ((_DWORD)result == 40) {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30LL;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0LL;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0LL;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = 0;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30LL;
  if (a3 && a4)
  {
    __int128 v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(_BYTE *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }

    uint64_t result = 0LL;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 64_Block_object_dispose(va, 8) = a4;
    *(_BYTE *)(a2 + 652) = 1;
  }

  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && (_DWORD)a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a2 + 50) = 0;
    if (!*(_BYTE *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a3) {
    return 30LL;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30LL;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30LL;
    }
  }

  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    __int128 v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5) {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else {
      return 11LL;
    }
  }

  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30LL;
  }
  if (!a2) {
    return 30LL;
  }
  if (!a4) {
    return 30LL;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30LL;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30LL;
    }
  }

  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific( uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30LL;
  }
  unsigned __int16 v6 = *(_WORD *)(a1 + 600);
  while (v6)
  {
    uint64_t v7 = UARPPlatformDownstreamEndpointByID(a1, a2, v6);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 600);
    unsigned __int16 v6 = v8 + 1;
    *(_WORD *)(a1 + 600) = v8 + 1;
    if (v7 && v8) {
      return uarpPlatformDownstreamEndpointAddWithID(a1, a2, a3, v8);
    }
  }

  *(_WORD *)(a1 + 600) = 1;
  return 11LL;
}

uint64_t uarpPlatformDownstreamEndpointAddWithID(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a1) {
    return 30LL;
  }
  uint64_t v8 = uarpPlatformRemoteEndpointAlloc(a1);
  if (!v8) {
    return 11LL;
  }
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 176) = a2;
  *(_WORD *)(v8 + 136) = a4;
  return uarpSendDownstreamEndpointReachable(a1, a2, a4);
}

uint64_t uarpPlatformDownstreamEndpointRemove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v5) {
    return uarpSendDownstreamEndpointUnreachable(a1, a2, *(unsigned __int16 *)(v5 + 136));
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformDownstreamEndpointSendMessage( uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  uint64_t v9 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (v9) {
    return uarpPlatformDownstreamEndpointSendMessageInternal(a1, a2, v9, a4, a5);
  }
  else {
    return 58LL;
  }
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (v4) {
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  }
  else {
    return 11LL;
  }
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(_BYTE *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    __n128 result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    int v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }

  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0LL;
        }
      }

      return *(void *)(v5 + 168);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(_BYTE *)(a2 + 460))
      {
        uint64_t v6 = *(void *)(a2 + 632);
        if (!v6) {
          return 54LL;
        }
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          uint64_t v6 = *(void *)(v6 + 176);
          if (!v6) {
            return 54LL;
          }
        }

        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        int v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        uint64_t v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }

      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        uint64_t v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        uint64_t result = 0LL;
        *(_DWORD *)(a4 + 2_Block_object_dispose(va, 8) = *v8;
        return result;
      }

      return 44LL;
    }

    else
    {
      return 26LL;
    }
  }

  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }

  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformGetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *a2;
    }
  }

  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }

  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30LL;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0LL;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }

  return result;
}

void sub_10001C39C()
{
}

void sub_10001C3FC()
{
}

void sub_10001C45C()
{
}

void sub_10001C4BC()
{
}

void sub_10001C51C()
{
}

void sub_10001C57C()
{
  v3[0] = 136315650;
  sub_10000FDA0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s: Failed to read managedPrefs at %@ error %@",  (uint8_t *)v3,  0x20u);
}

void sub_10001C604( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C674(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 uarpAccessoryID]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 modelNumber]);
  int v9 = 138412546;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  __int128 v12 = v7;
  sub_10000FDBC( (void *)&_mh_execute_header,  v5,  v8,  "AppleModelNumber %@ from accessory does not match expected model number %@",  (uint8_t *)&v9);
}

void sub_10001C738()
{
  v2[0] = 136315394;
  sub_10000FDA0();
  sub_10000FDBC( (void *)&_mh_execute_header,  v0,  v1,  "%s: Error creating IOHIDDeviceRef for accessory %@",  (uint8_t *)v2);
  sub_10000FDB4();
}

void sub_10001C7A8()
{
  v2[0] = 136315650;
  sub_10000FDA0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%s: No ioreg properties for accessory %@ service 0x%x",  (uint8_t *)v2,  0x1Cu);
}

void sub_10001C834()
{
  v2[0] = 136315394;
  sub_10000FDA0();
  sub_10000FDBC((void *)&_mh_execute_header, v0, v1, "%s: Accessory no longer connected %@", (uint8_t *)v2);
  sub_10000FDB4();
}

void sub_10001C8A4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C914()
{
  v2[0] = 136315394;
  sub_10000FDA0();
  sub_10000FDBC((void *)&_mh_execute_header, v0, v1, "%s: accessory=%@ already disconnected", (uint8_t *)v2);
  sub_10000FDB4();
}

void sub_10001C984()
{
}

void sub_10001C9E4()
{
}

void sub_10001CA58()
{
}

void sub_10001CACC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CB3C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CBAC()
{
  v1[0] = 136315394;
  sub_10000FDA0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: AccessoryID %@", (uint8_t *)v1, 0x16u);
  sub_10000FDB4();
}

void sub_10001CC24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CC98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CD0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CD80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CDF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CE68()
{
  v0[0] = 136315394;
  sub_10000FDA0();
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: No accessories found for model numbers: %@",  (uint8_t *)v0,  0x16u);
  sub_10000FDB4();
}

void sub_10001CEE8(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 136315394;
  uint64_t v4 = "-[UARPHIDAccessory waitForInternalQueryToComplete]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Timed out waiting for info query callbacks for accessory %@",  (uint8_t *)&v3,  0x16u);
}

void sub_10001CF74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001CFE8(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[UARPStandaloneCommandManagerReply remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Failed to get remote object: %@",  (uint8_t *)&v1,  0x16u);
  sub_10000FDB4();
}

void sub_10001D074( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D0E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D158( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D1C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D238( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D2A8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D318(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = &unk_100030870;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
  sub_10000FDB4();
}

id objc_msgSend_initWithManufacturer_modelName_serialNumber_firmwareVersion_productGroup_productNumber_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:");
}

id objc_msgSend_xpcConnectionToRequestor(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionToRequestor];
}