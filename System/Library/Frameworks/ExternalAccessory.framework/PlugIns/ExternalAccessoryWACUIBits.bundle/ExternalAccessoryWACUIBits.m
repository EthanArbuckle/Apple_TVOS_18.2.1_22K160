void sub_30B0(id a1)
{
  EAWiFiUnconfiguredAccessoryBrowserManager *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___EAWiFiUnconfiguredAccessoryBrowserManager);
  v2 = (void *)qword_CF58;
  qword_CF58 = (uint64_t)v1;
}

void sub_318C(id a1)
{
}

void sub_3580(_Unwind_Exception *a1)
{
}

void sub_35EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    NSLog(@"WAC: BrowserManager: Extension completed request, items: %@", a3);
  }
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setRemoteViewController:0];

  id v6 = objc_loadWeakRetained(v4);
  [v6 setCurrentRequestIdentifier:0];
}

void sub_365C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
    NSLog(@"WAC: BrowserManager: Extension cancelled request, error: %@", v4);
  }

  uint64_t v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setRemoteViewController:0];

  id v7 = objc_loadWeakRetained(v5);
  [v7 setCurrentRequestIdentifier:0];
}

void sub_36E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 40)) {
    NSLog(@"WAC: BrowserManager: WACUI Interrupted, attempting setup again.");
  }
  dispatch_async((dispatch_queue_t)workQueue, &stru_82D0);
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setCurrentRequestIdentifier:0];

  id v6 = objc_loadWeakRetained(v4);
  [v6 setExtension:0];

  id v7 = objc_loadWeakRetained(v4);
  [v7 setRemoteViewController:0];

  id v8 = objc_loadWeakRetained(v4);
  [v8 purgeAccessoriesSet];

  id v9 = objc_loadWeakRetained(v4);
  v10 = (char *)[v9 currentBrowserState];

  if (v10 == (_BYTE *)&dword_0 + 3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_389C;
    block[3] = &unk_82F8;
    objc_copyWeak(&v15, v4);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v15);
  }

  id v11 = objc_loadWeakRetained(v4);
  [v11 updateState:1];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_38D4;
  v12[3] = &unk_82F8;
  objc_copyWeak(&v13, v4);
  dispatch_async(&_dispatch_main_q, v12);
  objc_destroyWeak(&v13);
}

void sub_3888(id a1)
{
}

void sub_389C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissWithStatus:2];
}

void sub_38D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setup];
}

uint64_t sub_3900(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setRemoteViewController:v6];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v5);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteViewController]);
  [v11 setParent:v9];

  id v12 = objc_loadWeakRetained(v5);
  [v12 setCurrentRequestIdentifier:v7];

  if (*(_BYTE *)(a1 + 48)) {
    NSLog(@"WAC: BrowserManager: WACUI setup complete");
  }
  return dispatch_semaphore_signal((dispatch_semaphore_t)setupSemaphore);
}

void sub_39C8(id a1)
{
}

void sub_39E4(id a1)
{
}

void sub_3A00(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}
}

void sub_3B00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    NSLog( @"### WAC XPC:%s:%d",  "-[EAWiFiUnconfiguredAccessoryBrowserManager startSearchingForUnconfiguredAccessories]_block_invoke",  292LL);
    uint64_t v1 = *(void *)(a1 + 32);
  }

  id v3 = *(void **)(v1 + 80);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3B9C;
  v5[3] = &unk_83B0;
  v5[4] = v1;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxyWithErrorHandler:v5]);
  [v4 startSearchForAccessoriesNeedingReprovisioning];
}

void sub_3B9C(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}

void sub_3BD0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteViewController]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceViewControllerProxy]);
  [v1 backendStartSearch];
}

void sub_3CAC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteViewController]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceViewControllerProxy]);
  [v1 backendStopSearch];
}

void sub_3D6C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteViewController]);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceViewControllerProxy]);
  [v1 cancelActiveConfiguration];
}

void sub_3FA4(_Unwind_Exception *a1)
{
}

void sub_3FB8(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned __int8 v4 = [WeakRetained isConfiguring];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setIsConfiguring:1];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_loadWeakRetained(v2);
    [v7 setAccessoryBeingConfigured:v6];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setTargetViewController:v8];

    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(void **)(v10 + 80);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_415C;
    v19[3] = &unk_83B0;
    v19[4] = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxyWithErrorHandler:v19]);
    id v13 = *(void **)(*(void *)(a1 + 48) + 88LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) macAddress]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v14]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_4190;
    v16[3] = &unk_8400;
    v16[4] = *(void *)(a1 + 48);
    id v17 = *(id *)(a1 + 32);
    objc_copyWeak(&v18, v2);
    [v12 reconfigureAccessory:v15 withReply:v16];

    objc_destroyWeak(&v18);
  }

void sub_4148(_Unwind_Exception *a1)
{
}

void sub_415C(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(*(void *)(a1 + 32) + 8LL)) {
    NSLog(@"### WAC XPC: Error: %@", a2);
  }
}

void sub_4190(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v14 = v5;
  if ((_DWORD)a2 != 3)
  {
    if ((_DWORD)a2 == 1)
    {
      uint64_t v6 = a1[4];
      if (v6[8])
      {
        NSLog( @"### WAC: %s:%d: Reprovisioning not required for this device",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3",  375LL);
LABEL_14:
        uint64_t v6 = a1[4];
      }
    }

    else
    {
      if (!(_DWORD)a2)
      {
        uint64_t v6 = a1[4];
        if (v6[8])
        {
          NSLog( @"### WAC: %s:%d: Reprovision Success",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3",  354LL);
          uint64_t v6 = a1[4];
        }

        id v7 = (unsigned int *)&kErrorNone;
        goto LABEL_16;
      }

      id v12 = v5;
      uint64_t v6 = a1[4];
      if (v6[8])
      {
        NSLog( @"### WAC: %s:%d: status: %d: error: %@",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3",  381LL,  a2,  v12);
        goto LABEL_14;
      }
    }

    id v7 = (unsigned int *)&kErrorUnexpected;
LABEL_16:
    [v6 dismissWithStatus:*v7];
    goto LABEL_17;
  }

  uint64_t v8 = a1[4];
  if (v8[8])
  {
    NSLog( @"### WAC: %s:%d: Accessory is SecureWAC/HomeKit but not part of user homes",  "-[EAWiFiUnconfiguredAccessoryBrowserManager configureAccessory:withConfigurationUIOnViewController:]_block_invoke_3",  359LL);
    uint64_t v8 = a1[4];
  }

  id v9 = (void *)*((void *)v8 + 11);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] macAddress]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);
  [a1[4] setUnconfiguredDeviceID:v11];

LABEL_17:
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsConfiguring:0];
}

void sub_4308(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  unsigned __int8 v4 = [WeakRetained isConfiguring];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 setIsConfiguring:1];

    dispatch_async((dispatch_queue_t)workQueue, &stru_8448);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_loadWeakRetained(v2);
    [v7 setAccessoryBeingConfigured:v6];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v2);
    [v9 setTargetViewController:v8];

    id v10 = objc_loadWeakRetained(v2);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteViewController]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceViewControllerProxy]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) macAddress]);
    [v12 backendConfigureAirPortAssistantWithTargetMACAddress:v13];

    id v14 = objc_loadWeakRetained(v2);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteViewController]);
    [v15 setModalPresentationStyle:2];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_44B0;
    v16[3] = &unk_8470;
    objc_copyWeak(&v17, v2);
    v16[4] = *(void *)(a1 + 48);
    dispatch_sync(&_dispatch_main_q, v16);
    objc_destroyWeak(&v17);
  }

void sub_449C(id a1)
{
}

void sub_44B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained targetViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) remoteViewController]);
  [v2 presentViewController:v3 animated:1 completion:0];
}

id objc_msgSend_wifiDidShutdown(void *a1, const char *a2, ...)
{
  return [a1 wifiDidShutdown];
}