@interface IDSDXPCPairing
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDXPCPairing)initWithQueue:(id)a3 idsDaemon:(id)a4 serviceController:(id)a5 pairingManager:(id)a6 quickSwitchHelper:(id)a7 accountController:(id)a8 utunController:(id)a9 utunDeliveryController:(id)a10;
- (IDSDaemon)idsDaemon;
- (IDSPairingManager)pairingManager;
- (IDSQuickSwitchHelper)quickSwitchHelper;
- (IDSUTunController)utunController;
- (IDSUTunDeliveryController)utunDeliveryController;
- (OS_dispatch_queue)queue;
- (id)_pairedDeviceCBUUIDs;
- (id)_pairingDeviceCBUUIDs;
- (id)_sortedArrayFromCBUUIDSet:(id)a3;
- (void)_addPairedDevice:(id)a3 withInfo:(id)a4 completion:(id)a5;
- (void)_updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5;
- (void)addPairedDevice:(id)a3 completion:(id)a4;
- (void)addPairedDeviceWithInfo:(id)a3 completion:(id)a4;
- (void)connectPairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)deletePairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)disconnectActivePairedDevice:(id)a3;
- (void)dropAllMessagesWithoutAnyAllowedClassifierForDevice:(id)a3 completion:(id)a4;
- (void)forgetDeviceWithID:(id)a3 completion:(id)a4;
- (void)getPairedDevicesWithCompletion:(id)a3;
- (void)getPairingDevicesWithCompletion:(id)a3;
- (void)getPairingRecordsWithCompletion:(id)a3;
- (void)pairedDevicesInfo:(id)a3;
- (void)redeliverMessagesForDevice:(id)a3 completion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setAllowedTrafficClassifiersForDevice:(id)a3 classifiers:(id)a4 completion:(id)a5;
- (void)setIdsDaemon:(id)a3;
- (void)setPairingManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQuickSwitchHelper:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setUtunController:(id)a3;
- (void)setUtunDeliveryController:(id)a3;
- (void)setupCompletedForPairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)stopLocalPairingForDeviceWithID:(id)a3 completion:(id)a4;
- (void)switchActivePairedDeviceWithID:(id)a3 completion:(id)a4;
- (void)unpairDeviceWithID:(id)a3 completion:(id)a4;
- (void)unpairStartForDeviceWithID:(id)a3 completion:(id)a4;
- (void)updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5;
- (void)updatePairedDeviceWithID:(id)a3 supportIPsec:(BOOL)a4 completion:(id)a5;
@end

@implementation IDSDXPCPairing

- (IDSDXPCPairing)initWithQueue:(id)a3 idsDaemon:(id)a4 serviceController:(id)a5 pairingManager:(id)a6 quickSwitchHelper:(id)a7 accountController:(id)a8 utunController:(id)a9 utunDeliveryController:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSDXPCPairing;
  v18 = -[IDSDXPCPairing init](&v28, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_idsDaemon, a4);
    objc_storeStrong((id *)&v19->_serviceController, a5);
    objc_storeStrong((id *)&v19->_pairingManager, a6);
    objc_storeStrong((id *)&v19->_quickSwitchHelper, a7);
    objc_storeStrong((id *)&v19->_accountController, a8);
    objc_storeStrong((id *)&v19->_utunController, a9);
    objc_storeStrong((id *)&v19->_utunDeliveryController, a10);
  }

  return v19;
}

- (void)addPairedDevice:(id)a3 completion:(id)a4
{
}

- (void)addPairedDeviceWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 cbuuid]);
  -[IDSDXPCPairing _addPairedDevice:withInfo:completion:](self, "_addPairedDevice:withInfo:completion:", v8, v7, v6);
}

- (void)updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5
{
}

- (void)connectPairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) connectPairedDevice (cbuuid: %@)",  (uint8_t *)&v11,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunController](self, "utunController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v9 connectPairedDevice:v10];

  v7[2](v7, 0LL);
}

- (void)setupCompletedForPairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) setupCompletedForPairedDevice (cbuuid: %@)",  (uint8_t *)&v10,  0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunDeliveryController](self, "utunDeliveryController"));
  [v9 localSetupCompleted];

  v7[2](v7, 0LL);
}

- (void)getPairingDevicesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairingDevices", (uint8_t *)&v8, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing _pairingDeviceCBUUIDs](self, "_pairingDeviceCBUUIDs"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "(Daemon) getPairingDevices yielded CBUUIDs: %@",  (uint8_t *)&v8,  0xCu);
  }

  v4[2](v4, v6, 0LL);
}

- (void)getPairedDevicesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) getPairedDevices", (uint8_t *)&v8, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing _pairedDeviceCBUUIDs](self, "_pairedDeviceCBUUIDs"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "(Daemon) getPairedDevices yielded CBUUIDs: %@",  (uint8_t *)&v8,  0xCu);
  }

  v4[2](v4, v6, 0LL);
}

- (void)getPairingRecordsWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void *, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 localDeviceRecord]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pairedDeviceRecords]);

  v4[2](v4, v8, v7, 0LL);
}

- (void)pairedDevicesInfo:(id)a3
{
  v4 = (void (**)(id, NSMutableArray *, void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allPairedDevices]);

  id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v12),  "dictionaryRepresentation",  (void)v14));
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  v4[2](v4, v7, 0LL);
}

- (void)updatePairedDeviceWithID:(id)a3 supportIPsec:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (v8)
  {
    id v33 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cbuuidsOfPairedDevices]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    id v25 = v8;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
        unsigned __int8 v20 = [v19 updatePairedDeviceWithCBUUID:v18 supportIPsec:v6];

        if ((v20 & 1) == 0)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"We were unable to update the cache. Possibly because the device doesn't exist. Look at the logs to know for sure. {uuid: %@}",  v18));
          uint64_t v23 = IDSGenericErrorDomain;
          NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
          v31 = v22;
          id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  1LL,  v24));

          goto LABEL_14;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v15) {
        continue;
      }
      break;
    }

    id v21 = 0LL;
LABEL_14:
    id v8 = v25;
  }

  else
  {
    id v21 = 0LL;
  }

  v9[2](v9, v21);
}

- (void)deletePairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) deletePairedDeviceWithID (cbuuid: %@)",  (uint8_t *)&v14,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunController](self, "utunController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v9 deletePairedDevice:v10];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v11 removeLocalPairedDevice:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSUTunDeliveryController sharedInstance](&OBJC_CLASS___IDSUTunDeliveryController, "sharedInstance"));
  [v13 stopIdsNRDeviceBridgeAndPreferenceHandler];

  v7[2](v7, 0LL);
}

- (void)unpairStartForDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) deletePairedDeviceWithID (cbuuid: %@)",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunDeliveryController](self, "utunDeliveryController"));
  [v9 defaultPeerUnpairStart];

  v7[2](v7, 0LL);
}

- (void)stopLocalPairingForDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138477827;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) stopLocalPairingForDeviceWithID {cbuuid: %{private}@}",  (uint8_t *)&v15,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunController](self, "utunController"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v9 obliterateConnectionInfoForCBUUID:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v11 removeLocalPairedDevice:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  LOBYTE(v12) = [v13 isCurrentDevicePairedOrPairing];

  if ((v12 & 1) == 0)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing accountController](self, "accountController"));
    [v14 stopLocalSetup];
  }

  v7[2](v7, 0LL);
}

- (void)unpairDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) unpairDevice (cbuuid: %@)",  (uint8_t *)&v21,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cbuuidsOfPairedDevices]);
  unsigned int v11 = [v10 containsObject:v6];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunController](self, "utunController"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    [v12 obliterateConnectionInfoForCBUUID:v13];

    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    [v14 removeLocalPairedDevice:v15];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing serviceController](self, "serviceController"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allServicesWithAdHocServiceType:2]);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
    [v18 dropQueuedBroadcastsForServices:v17];

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
    [v19 _processMessagesUponUnpairing];

    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSLocalPairingErrorDomain,  8LL,  0LL));
    __int128 v17 = (void *)v20;
  }

  v7[2](v7, v20);
}

- (void)forgetDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) forgetDevice (cbuuid: %@)",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v9 removeLocalPairedDevice:v10];

  v7[2](v7, 0LL);
}

- (void)switchActivePairedDeviceWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) switchActivePairedDevice (cbuuid: %@)",  (uint8_t *)&v11,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing quickSwitchHelper](self, "quickSwitchHelper"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  [v9 initiateQuickSwitchToDeviceWithCBUUID:v10 force:0 completionBlock:v7];
}

- (void)disconnectActivePairedDevice:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(Daemon) switchToNoActivePairedDevice", v12, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunController](self, "utunController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pairedDeviceUUIDString]);
  [v6 obliterateConnectionInfoForCBUUID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  [v9 disconnectActivePairedDevice];

  int v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 broadcasterWithMessageContext:0]);

  [v11 deactivatePairedDevices];
  v4[2](v4, 0LL);
}

- (void)redeliverMessagesForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) redeliverMessagesForDevice (device ID: %@)",  (uint8_t *)&v13,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pairedDeviceUniqueID]);

  if ([v6 isEqualToString:v10])
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
    [v11 launchOnDemandServicesForQueuedBroadcastAttempts];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
    [v12 _processStoredMessagesIncludingClassD:1];
  }

  v7[2](v7, 0LL);
}

- (void)setAllowedTrafficClassifiersForDevice:(id)a3 classifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "(Daemon) setAllowedTrafficClassifiersForDevice (device ID: %@)   (classifiers: %@)",  (uint8_t *)&v13,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunDeliveryController](self, "utunDeliveryController"));
  [v12 setAllowedTrafficClasses:v9];

  v10[2](v10, 0LL);
}

- (void)dropAllMessagesWithoutAnyAllowedClassifierForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)",  buf,  0xCu);
  }

  uint64_t v9 = OSLogHandleForTransportCategory("WatchPairing");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)",  buf,  0xCu);
  }

  uint64_t v12 = os_log_shim_legacy_logging_enabled(v11);
  if ((_DWORD)v12)
  {
    if (_IDSShouldLogTransport(v12))
    {
      id v15 = v6;
      _IDSLogTransport( @"WatchPairing",  @"IDS",  @"(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)");
      if (_IDSShouldLog(0LL, @"WatchPairing"))
      {
        id v15 = v6;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"WatchPairing",  @"(Daemon) dropAllMessagesWithoutAnyAllowedClassifierForDevice (device ID: %@)");
      }
    }
  }

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing utunDeliveryController](self, "utunDeliveryController", v15));
  [v13 defaultPeerDropDisallowedMessages];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing idsDaemon](self, "idsDaemon"));
  [v14 _processDisallowedMessages];

  v7[2](v7, 0LL);
}

- (id)_pairingDeviceCBUUIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cbuuidsOfPairingDevices]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing _sortedArrayFromCBUUIDSet:](self, "_sortedArrayFromCBUUIDSet:", v4));
  return v5;
}

- (id)_pairedDeviceCBUUIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cbuuidsOfPairedDevices]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing _sortedArrayFromCBUUIDSet:](self, "_sortedArrayFromCBUUIDSet:", v4));
  return v5;
}

- (id)_sortedArrayFromCBUUIDSet:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_100903C98]);

  return v4;
}

- (void)_updatePairedDevice:(id)a3 pairingType:(int64_t)a4 completion:(id)a5
{
  uint64_t v11 = (void (**)(id, void))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
  if ([v8 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
    [v9 updateLocalPairedDevice:v8 pairingType:a4];

    if (v11) {
      v11[2](v11, 0LL);
    }
  }

  else
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSLocalPairingErrorDomain,  6LL,  0LL));
    ((void (**)(id, void *))v11)[2](v11, v10);
  }
}

- (void)_addPairedDevice:(id)a3 withInfo:(id)a4 completion:(id)a5
{
  v40 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v8 BTOutOfBandKey]);
  unsigned int v10 = [v8 shouldPairDirectlyOverIPsec];
  if (+[IMUserDefaults isAlwaysPairAsTinker](&OBJC_CLASS___IMUserDefaults, "isAlwaysPairAsTinker")) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = (uint64_t)[v8 pairingType];
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue([v8 bluetoothMACAddress]);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v39,  2LL));
    if (v10) {
      id v14 = @"YES";
    }
    else {
      id v14 = @"NO";
    }
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v38,  2LL));
    *(_DWORD *)buf = 138478851;
    v52 = v40;
    __int16 v53 = 2113;
    id v54 = v13;
    __int16 v55 = 2114;
    v56 = v14;
    __int16 v57 = 2050;
    uint64_t v58 = v11;
    __int16 v59 = 2113;
    v60 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "(Daemon) _addPairedDevice:BTOutOfBandKey:completion: (cbuuid: %{private}@, btOutOfBandKey.hash: %{private}@, shoul dPairDirectlyOverIPsec: %{public}@, pairingType: %{public}ld, bluetoothMACAddress.hash: %{private}@)",  buf,  0x34u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUIDString](v40, "UUIDString"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1003B684C;
  v49[3] = &unk_1008F98D0;
  id v18 = v9;
  id v50 = v18;
  [v17 registerPairedDeviceWithUniqueID:v40 didConnectBlock:v49];

  if ([v16 length])
  {
    if ((v10 & 1) != 0) {
      int v19 = 1;
    }
    else {
      int v19 = IMGetDomainBoolForKeyWithDefaultValue(@"com.apple.ids", @"PairDirectlyOverIPsec", 0LL);
    }
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = @"NO";
      if (v19) {
        id v22 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v52 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "(Daemon) _addPairedDevice: PairDirectlyOverIPsec: %@",  buf,  0xCu);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1003B6858;
    v41[3] = &unk_100903CC0;
    char v48 = v19;
    id v46 = v18;
    v41[4] = self;
    id v23 = v16;
    id v42 = v23;
    id v43 = v39;
    uint64_t v47 = v11;
    id v44 = v38;
    id v24 = v40;
    v45 = (__CFString *)v24;
    id v25 = objc_retainBlock(v41);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing pairingManager](self, "pairingManager"));
    __int128 v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v26 pairedDeviceUUIDString]);

    if (v27 && (-[__CFString isEqualToIgnoringCase:](v27, "isEqualToIgnoringCase:", v23) & 1) != 0)
    {
      uint64_t v28 = OSLogHandleForTransportCategory("WatchPairing");
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v52 = v27;
        __int16 v53 = 2113;
        id v54 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "(Daemon) Told to add a paired device but there is no need to reset communication with the currently active pai red device. {activeCBUUID: %{private}@, cbuuidString: %{private}@}",  buf,  0x16u);
      }

      uint64_t v31 = os_log_shim_legacy_logging_enabled(v30);
      if ((_DWORD)v31)
      {
        if (_IDSShouldLogTransport(v31))
        {
          _IDSLogTransport( @"WatchPairing",  @"IDS",  @"(Daemon) Told to add a paired device but there is no need to reset communication with the currently active paired device. {activeCBUUID: %{private}@, cbuuidString: %{private}@}");
          if (_IDSShouldLog(0LL, @"WatchPairing")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WatchPairing",  @"(Daemon) Told to add a paired device but there is no need to reset communication with the currently active paired device. {activeCBUUID: %{private}@, cbuuidString: %{private}@}");
          }
        }
      }

      if (v25) {
        ((void (*)(void *, void))v25[2])(v25, 0LL);
      }
    }

    else
    {
      uint64_t v32 = OSLogHandleForTransportCategory("WatchPairing");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "(Daemon) Reset communication with currently active paired device before adding a new paired device: %@",  buf,  0xCu);
      }

      uint64_t v35 = os_log_shim_legacy_logging_enabled(v34);
      if ((_DWORD)v35)
      {
        if (_IDSShouldLogTransport(v35))
        {
          v37 = v24;
          _IDSLogTransport( @"WatchPairing",  @"IDS",  @"(Daemon) Reset communication with currently active paired device before adding a new paired device: %@");
          if (_IDSShouldLog(0LL, @"WatchPairing"))
          {
            v37 = v24;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"WatchPairing",  @"(Daemon) Reset communication with currently active paired device before adding a new paired device: %@");
          }
        }
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCPairing quickSwitchHelper](self, "quickSwitchHelper", v37));
      [v36 resetCommunicationStateBeforeQuickSwitchWithCompletionBlock:v25];
    }

    uint64_t v20 = v46;
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSLocalPairingErrorDomain,  6LL,  0LL));
    (*((void (**)(id, void *))v18 + 2))(v18, v20);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSDaemon)idsDaemon
{
  return self->_idsDaemon;
}

- (void)setIdsDaemon:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSQuickSwitchHelper)quickSwitchHelper
{
  return self->_quickSwitchHelper;
}

- (void)setQuickSwitchHelper:(id)a3
{
}

- (IDSPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSUTunController)utunController
{
  return self->_utunController;
}

- (void)setUtunController:(id)a3
{
}

- (IDSUTunDeliveryController)utunDeliveryController
{
  return self->_utunDeliveryController;
}

- (void)setUtunDeliveryController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end