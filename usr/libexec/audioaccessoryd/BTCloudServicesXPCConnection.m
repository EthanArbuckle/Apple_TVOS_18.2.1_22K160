@interface BTCloudServicesXPCConnection
- (AACloudServicesClient)client;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)direct;
- (BOOL)entitled;
- (BTUserCloudServicesDaemon)daemon;
- (NSString)signingIdentity;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)clientReportHMDeviceCloudRecordInfosUpdated:(id)a3;
- (void)cloudServicesClientActivate:(id)a3 completion:(id)a4;
- (void)createDeviceRecord:(id)a3 completion:(id)a4;
- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceRecord:(id)a3 completion:(id)a4;
- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)deleteSoundProfileRecordWithCompletion:(id)a3;
- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)fetchAllBTCloudDeviceSupportInformationWithCompletion:(id)a3;
- (void)fetchAllMagicSettingsRecordsWithCompletion:(id)a3;
- (void)fetchBTCloudDeviceSupportInformation:(id)a3 completion:(id)a4;
- (void)fetchCloudAccountInfoUpdatedWithCompletion:(id)a3;
- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4;
- (void)fetchDeviceRecord:(id)a3 completion:(id)a4;
- (void)fetchDeviceRecordsWithCompletion:(id)a3;
- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4;
- (void)fetchMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)fetchSoundProfileRecordWithCompletion:(id)a3;
- (void)finishSoundProfileRecordSessionHandle:(id)a3 completion:(id)a4;
- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4;
- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4;
- (void)modifyDeviceRecord:(id)a3 completion:(id)a4;
- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4;
- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4;
- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4;
- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)setClient:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setSigningIdentity:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)startSoundProfileRecordFileHandleSessionWithCompletion:(id)a3;
@end

@implementation BTCloudServicesXPCConnection

- (void)cloudServicesClientActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10006DD20;
  v23 = sub_10006DD30;
  id v24 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006DD38;
  v16[3] = &unk_100208858;
  v18 = &v19;
  v16[4] = v10;
  id v11 = v8;
  id v17 = v11;
  v12 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection cloudServicesClientActivate:completion:]",  30LL,  "DeviceManager: %@",  v10);
  }
  v13 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v13, obj);
  if ((v14 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_client, a3);
    if (v11) {
      (*((void (**)(id, uint64_t))v11 + 2))(v11, v20[5]);
    }
  }

  ((void (*)(void *))v12[2])(v12);

  _Block_object_dispose(&v19, 8);
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.BluetoothServices"));
  unsigned int v8 = [v7 isEqual:&__kCFBooleanTrue];
  if (v8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.BluetoothServices.cloud"));
    if ([v3 isEqual:&__kCFBooleanTrue])
    {

LABEL_12:
      BOOL result = 1;
      self->_entitled = 1;
      return result;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.bluetooth.internal"));
  unsigned int v10 = [v9 isEqual:&__kCFBooleanTrue];

  if (v8)
  {

    if ((v10 & 1) != 0) {
      goto LABEL_12;
    }
  }

  else
  {

    if (v10) {
      goto LABEL_12;
    }
  }

  if (dword_1002345E8 <= 90 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 90LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@' and '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.BluetoothServices",  @"com.apple.BluetoothServices.cloud");
  }
  if (!a3) {
    return 0;
  }
  uint64_t v11 = BTErrorF( 4294896128LL,  "Missing entitlement '%@' and/or '%@",  @"com.apple.BluetoothServices",  @"com.apple.BluetoothServices.cloud");
  id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  BOOL result = 0;
  *a3 = v12;
  return result;
}

- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10006DD20;
  v26 = sub_10006DD30;
  id v27 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006E1F8;
  v19[3] = &unk_100208858;
  uint64_t v21 = &v22;
  v19[4] = v9;
  id v10 = v7;
  id v20 = v10;
  uint64_t v11 = objc_retainBlock(v19);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchAAProxCardsInfoForDeviceWithAddress:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  id v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10006E2BC;
    v16[3] = &unk_100208880;
    id v17 = v10;
    [v15 fetchAAProxCardsInfoWithAddress:v6 completion:v16];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v22, 8);
}

- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10006DD20;
  uint64_t v24 = sub_10006DD30;
  id v25 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006E56C;
  v17[3] = &unk_100208858;
  uint64_t v19 = &v20;
  v17[4] = v9;
  id v10 = v7;
  id v18 = v10;
  uint64_t v11 = objc_retainBlock(v17);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyAAProxCardsInfo:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  id v12 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    [v15 updateAAProxCardsInfoWithProxCardsInfo:v6 completion:v10];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_10006DD20;
  uint64_t v24 = sub_10006DD30;
  id v25 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10006E83C;
  v17[3] = &unk_100208858;
  uint64_t v19 = &v20;
  v17[4] = v9;
  id v10 = v7;
  id v18 = v10;
  uint64_t v11 = objc_retainBlock(v17);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection removeAAProxCardsInfoForDeviceWithAddress:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  id v12 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    [v15 removeAAProxCardsInfoWithBluetoothAddress:v6 completion:v10];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)createDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createDeviceRecord:completion:]",  30LL,  "CreateDeviceRecord: %@",  v6);
  }
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  uint64_t v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006EB44;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createDeviceRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 addDeviceWithRecord:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)modifyDeviceRecord:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyDeviceRecord:completion:]",  30LL,  "ModifyDeviceRecord: %@",  v7);
  }
  -[BTCloudServicesXPCConnection createDeviceRecord:completion:](self, "createDeviceRecord:completion:", v7, v6);
}

- (void)deleteDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteDeviceRecord:completion:]",  30LL,  "DeleteDeviceRecord: %@",  v6);
  }
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  uint64_t v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006EED0;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteDeviceRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 removeDeviceWithBluetoothAddress:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchDeviceRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchDeviceRecord:completion:]",  30LL,  "Fetch DeviceRecord: %@",  v6);
  }
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10006DD20;
  v23 = sub_10006DD30;
  id v24 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10006F1F4;
  v18[3] = &unk_100206B38;
  v18[4] = v9;
  v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchDeviceRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006F290;
    v15[3] = &unk_1002088A8;
    id v16 = v7;
    [v14 fetchDeviceWithAddress:v6 completion:v15];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchDeviceRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchDeviceRecordsWithCompletion:]",  30LL,  "Fetch DeviceRecords");
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10006DD20;
  uint64_t v20 = sub_10006DD30;
  id v21 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManager]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006F598;
  v15[3] = &unk_100206B38;
  void v15[4] = v6;
  v15[5] = &v16;
  id v7 = objc_retainBlock(v15);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchDeviceRecordsWithCompletion:]",  30LL,  "DeviceManager: %@",  v6);
  }
  unsigned int v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceManager]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10006F634;
    v12[3] = &unk_1002088D0;
    id v13 = v4;
    [v11 fetchDeviceRecordsWithCompletion:v12];
  }

  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)createDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createDeviceSupportInformationRecord:completion:]",  30LL,  "Create Support Info");
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006F938;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createDeviceSupportInformationRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 addDeviceSupportInformationWithRecord:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)deleteDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteDeviceSupportInformationRecord:completion:]",  30LL,  "Delete Support Info: %@",  v6);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006FC1C;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteDeviceSupportInformationRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 removeDeviceSupportInformationWithBluetoothAddress:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchBTCloudDeviceSupportInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchBTCloudDeviceSupportInformation:completion:]",  30LL,  "Fetch Support Info: %@",  v6);
  }
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10006DD20;
  v23 = sub_10006DD30;
  id v24 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10006FF40;
  v18[3] = &unk_100206B38;
  v18[4] = v9;
  v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchBTCloudDeviceSupportInformation:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006FFDC;
    v15[3] = &unk_1002088F8;
    id v16 = v7;
    [v14 fetchDeviceSupportInformationRecordWithAddress:v6 completion:v15];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchAllBTCloudDeviceSupportInformationWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchAllBTCloudDeviceSupportInformationWithCompletion:]",  30LL,  "Fetch All Support Info");
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10006DD20;
  uint64_t v20 = sub_10006DD30;
  id v21 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManager]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000702E4;
  v15[3] = &unk_100206B38;
  void v15[4] = v6;
  v15[5] = &v16;
  id v7 = objc_retainBlock(v15);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchAllBTCloudDeviceSupportInformationWithCompletion:]",  30LL,  "DeviceManager: %@",  v6);
  }
  unsigned int v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceManager]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100070380;
    v12[3] = &unk_1002088D0;
    id v13 = v4;
    [v11 fetchDeviceSupportInformationRecordsWithCompletion:v12];
  }

  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)modifyDeviceSupportInformationRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyDeviceSupportInformationRecord:completion:]",  30LL,  "Modify Support Info: %@",  v6);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100070668;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyDeviceSupportInformationRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 updateDeviceSupportInformationWithDevice:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)createMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createMagicSettingsRecord:completion:]",  30LL,  "Create Magic Settings: %@",  v6);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007094C;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection createMagicSettingsRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 addDeviceMagicSettingsWithRecord:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)deleteMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteMagicSettingsRecord:completion:]",  30LL,  "Delete Magic Settings: %@",  v6);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100070C30;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteMagicSettingsRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 removeDeviceMagicSettingsWithBluetoothAddress:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchMagicSettingsRecord:completion:]",  30LL,  "Fetch Magic Settings: %@",  v6);
  }
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_10006DD20;
  v23 = sub_10006DD30;
  id v24 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100070F54;
  v18[3] = &unk_100206B38;
  v18[4] = v9;
  v18[5] = &v19;
  id v10 = objc_retainBlock(v18);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchMagicSettingsRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100070FF0;
    v15[3] = &unk_100208920;
    id v16 = v7;
    [v14 fetchMagicSettingsRecordWithAddress:v6 completion:v15];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v19, 8);
}

- (void)fetchAllMagicSettingsRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchAllMagicSettingsRecordsWithCompletion:]",  30LL,  "Fetch All MP Records");
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_10006DD20;
  uint64_t v20 = sub_10006DD30;
  id v21 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManager]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000712F8;
  v15[3] = &unk_100206B38;
  void v15[4] = v6;
  v15[5] = &v16;
  id v7 = objc_retainBlock(v15);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchAllMagicSettingsRecordsWithCompletion:]",  30LL,  "DeviceManager: %@",  v6);
  }
  unsigned int v8 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceManager]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100071394;
    v12[3] = &unk_1002088D0;
    id v13 = v4;
    [v11 fetchMagicPairingSettingsRecordsWithCompletion:v12];
  }

  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v16, 8);
}

- (void)modifyMagicSettingsRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyMagicSettingsRecord:completion:]",  30LL,  "Modify MP record: %@",  v6);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_10006DD20;
  id v21 = sub_10006DD30;
  id v22 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007167C;
  v16[3] = &unk_100206B38;
  void v16[4] = v9;
  void v16[5] = &v17;
  id v10 = objc_retainBlock(v16);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyMagicSettingsRecord:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  uint64_t v11 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);
    [v14 updateDeviceMagicSettingsWithMagicPairingSettings:v6 completion:v7];
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v17, 8);
}

- (void)fetchCloudAccountInfoUpdatedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]",  30LL,  "Fetch Account Info");
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10006DD20;
  uint64_t v19 = sub_10006DD30;
  id v20 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceManager]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000719B8;
  v14[3] = &unk_100206B38;
  v14[4] = v6;
  v14[5] = &v15;
  id v7 = objc_retainBlock(v14);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]",  30LL,  "DeviceManager: %@",  v6);
  }
  unsigned int v8 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  unsigned __int8 v9 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceManager]);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudAccountInfo]);

    if (dword_1002345E8 <= 30
      && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL)))
    {
      LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchCloudAccountInfoUpdatedWithCompletion:]",  30LL,  "Fetched Account Info: %@",  v12);
    }

    v4[2](v4, v12, 0LL);
  }

  ((void (*)(void *))v7[2])(v7);

  _Block_object_dispose(&v15, 8);
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchCloudPairingIdentifierForPeripheral:completion:]",  30LL,  "Fetch Cloud Identifer for peripheral: %@",  v6);
  }
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_10006DD20;
  v29 = sub_10006DD30;
  id v30 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100071D30;
  v22[3] = &unk_100208858;
  id v24 = &v25;
  v22[4] = v8;
  id v9 = v7;
  id v23 = v9;
  id v10 = objc_retainBlock(v22);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchCloudPairingIdentifierForPeripheral:completion:]",  30LL,  "CloudPairingManager: %@",  v8);
  }
  uint64_t v11 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  unsigned __int8 v12 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (v8)
    {
      if ([v8 isReady])
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100071DF4;
        v17[3] = &unk_100208970;
        v17[4] = self;
        id v19 = v9;
        id v18 = v6;
        id v20 = &v25;
        [v8 fetchCloudPairingIdentifierForPeripheral:v18 withCompletion:v17];

        goto LABEL_13;
      }

      uint64_t v15 = BTErrorF(4294960551LL, "Cloud Pairing is not ready to find cloud identifier for peripheral '%@'", v6);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v15);
    }

    else
    {
      uint64_t v13 = BTErrorF(4294960551LL, "Cloud Pairing is not initialized to find cloud identifier for peripheral '%@'", v6);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    }

    uint64_t v16 = (void *)v26[5];
    v26[5] = v14;
  }

- (void)forceCloudPairingForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTCloudServicesXPCConnection signingIdentity](self, "signingIdentity"));
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL)))
  {
    if (v8) {
      id v9 = (const char *)[v8 UTF8String];
    }
    else {
      id v9 = "Unknown";
    }
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection forceCloudPairingForIdentifiers:completion:]",  30LL,  "BundleID: %s forcing Cloud Pairing for Identifers: %@",  v9,  v6);
  }

  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_10006DD20;
  v28 = sub_10006DD30;
  id v29 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBIDSManager sharedInstance](&OBJC_CLASS___CBIDSManager, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000722D4;
  v21[3] = &unk_100206810;
  id v23 = &v24;
  id v11 = v7;
  id v22 = v11;
  unsigned __int8 v12 = objc_retainBlock(v21);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection forceCloudPairingForIdentifiers:completion:]",  30LL,  "CloudPairingManager: %@",  v10);
  }
  uint64_t v13 = (id *)(v25 + 5);
  id obj = (id)v25[5];
  unsigned __int8 v14 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v13, obj);
  if ((v14 & 1) != 0)
  {
    if (v10)
    {
      if ([v10 isReady])
      {
        if ([v6 count])
        {
          [v10 sendRePairRequest:v6 forBundleID:v8];
          (*((void (**)(id, void))v11 + 2))(v11, 0LL);
          goto LABEL_18;
        }

        uint64_t v18 = BTErrorF(4294960591LL, "No cloud identifiers specified '%@'", v6);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v18);
      }

      else
      {
        uint64_t v17 = BTErrorF(4294960551LL, "Cloud Pairing is not ready to force cloud pairing for '%@'", v6);
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v17);
      }
    }

    else
    {
      uint64_t v15 = BTErrorF(4294960551LL, "Cloud Pairing is not initialized to force cloud pairing for '%@'", v6);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    }

    id v19 = (void *)v25[5];
    v25[5] = v16;
  }

- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10006DD20;
  uint64_t v26 = sub_10006DD30;
  id v27 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000725E4;
  v19[3] = &unk_100208858;
  id v21 = &v22;
  v19[4] = v9;
  id v10 = v7;
  id v20 = v10;
  id v11 = objc_retainBlock(v19);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchHMDeviceCloudRecordInfoWithAddress:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  unsigned __int8 v12 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000726A8;
    v16[3] = &unk_100208998;
    void v16[4] = self;
    id v17 = v10;
    [v15 fetchHMDeviceCloudRecordWithAddress:v6 completion:v16];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v22, 8);
}

- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10006DD20;
  uint64_t v24 = sub_10006DD30;
  id v25 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000729D4;
  v17[3] = &unk_100208858;
  id v19 = &v20;
  v17[4] = v9;
  id v10 = v7;
  id v18 = v10;
  id v11 = objc_retainBlock(v17);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection modifyHMDeviceCloudRecordInfo:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  unsigned __int8 v12 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    [v15 updateHMDeviceCloudRecordInfoWithRecordInfo:v6 completion:v10];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_10006DD20;
  uint64_t v24 = sub_10006DD30;
  id v25 = 0LL;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceManager]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100072CA4;
  v17[3] = &unk_100208858;
  id v19 = &v20;
  v17[4] = v9;
  id v10 = v7;
  id v18 = v10;
  id v11 = objc_retainBlock(v17);
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection removeHMDeviceCloudRecordInfoForDeviceWithAddress:completion:]",  30LL,  "DeviceManager: %@",  v9);
  }
  unsigned __int8 v12 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  unsigned __int8 v13 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v12, obj);
  if ((v13 & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceManager]);
    [v15 removeHMDeviceCloudRecordWithBluetoothAddress:v6 completion:v10];
  }

  ((void (*)(void *))v11[2])(v11);

  _Block_object_dispose(&v20, 8);
}

- (void)clientReportHMDeviceCloudRecordInfosUpdated:(id)a3
{
  id v5 = a3;
  if ((-[AACloudServicesClient internalFlags](self->_client, "internalFlags") & 1) != 0)
  {
    if (dword_1002345E8 <= 30
      && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL)))
    {
      LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection clientReportHMDeviceCloudRecordInfosUpdated:]",  30LL,  "Sending hmDeviceCloudRecordInfosUpdated...");
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    [v4 hmDeviceCloudRecordInfosUpdated:v5];
  }
}

- (void)startSoundProfileRecordFileHandleSessionWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection startSoundProfileRecordFileHandleSessionWithCompletion:]",  30LL,  "Creating sound profile write session");
  }
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_10006DD20;
  id v27 = sub_10006DD30;
  id v28 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000730F0;
  v20[3] = &unk_100206810;
  uint64_t v22 = &v23;
  id v5 = v4;
  id v21 = v5;
  id v6 = objc_retainBlock(v20);
  id v7 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  unsigned __int8 v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceManager]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 createSoundProfileRecordStagingURL]);
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      [v12 createFileAtPath:v13 contents:0 attributes:0];

      unsigned __int8 v14 = (id *)(v24 + 5);
      id v18 = (id)v24[5];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForWritingToURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForWritingToURL:error:",  v11,  &v18));
      objc_storeStrong(v14, v18);
      if (v15)
      {
        if (dword_1002345E8 <= 30
          && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL)))
        {
          LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection startSoundProfileRecordFileHandleSessionWithCompletion:]",  30LL,  "Created sound profile write-only file handle: %@",  v11);
        }

        (*((void (**)(id, void *, void))v5 + 2))(v5, v15, 0LL);
      }
    }

    else
    {
      uint64_t v16 = BTErrorF(4294960551LL, "Device manager not available");
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);
      id v11 = (void *)v24[5];
      v24[5] = v17;
    }
  }

  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v23, 8);
}

- (void)finishSoundProfileRecordSessionHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v32 = 0LL;
  v33 = (id *)&v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_10006DD20;
  v36 = sub_10006DD30;
  id v37 = 0LL;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10007353C;
  v29[3] = &unk_100206810;
  v31 = &v32;
  id v7 = a4;
  id v30 = v7;
  unsigned __int8 v8 = objc_retainBlock(v29);
  id v9 = v33;
  id obj = v33[5];
  unsigned __int8 v10 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9 + 5, obj);
  if ((v10 & 1) != 0)
  {
    if (fcntl((int)[v6 fileDescriptor], 50, v38) == -1)
    {
      uint64_t v18 = BTErrorF(4294960591LL, "File handle is not valid");
      uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
      id v11 = v33[5];
      v33[5] = (id)v19;
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v38));
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v11));
      if ([v11 length])
      {
        if (dword_1002345E8 <= 30
          && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL)))
        {
          LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection finishSoundProfileRecordSessionHandle:completion:]",  30LL,  "Creating sound profile record");
        }

        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceManager]);

        if (v14)
        {
          uint64_t v15 = self->_dispatchQueue;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
          [v16 beginTransaction:@"createSoundProfileRecordURL"];

          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_1000735F8;
          v26[3] = &unk_100205FE0;
          v26[4] = v15;
          id v27 = v7;
          [v14 addSoundProfileRecordWithURL:v12 completion:v26];
          uint64_t v17 = v33;
          id v25 = 0LL;
          [v6 closeAndReturnError:&v25];
          objc_storeStrong(v17 + 5, v25);
        }

        else
        {
          uint64_t v23 = BTErrorF(4294960551LL, "Device manager not available");
          uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
          uint64_t v15 = (OS_dispatch_queue *)v33[5];
          v33[5] = (id)v24;
        }
      }

      else
      {
        uint64_t v20 = BTErrorF(4294960591LL, "File path is not valid");
        uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
        id v22 = v33[5];
        v33[5] = (id)v21;
      }
    }
  }

  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v32, 8);
}

- (void)fetchSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection fetchSoundProfileRecordWithCompletion:]",  30LL,  "Fetching sound profile");
  }
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_10006DD20;
  id v27 = sub_10006DD30;
  id v28 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100073960;
  v20[3] = &unk_100206810;
  id v22 = &v23;
  id v5 = v4;
  id v21 = v5;
  id v6 = objc_retainBlock(v20);
  id v7 = (id *)(v24 + 5);
  id obj = (id)v24[5];
  unsigned __int8 v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    if (v5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceManager]);

      if (v10)
      {
        id v11 = self->_dispatchQueue;
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
        [v12 beginTransaction:@"fetchSoundProfileRecord"];

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100073A20;
        v17[3] = &unk_1002089E8;
        v17[4] = v11;
        id v18 = v5;
        [v10 fetchSoundProfileRecordWithCompletion:v17];
      }

      else
      {
        uint64_t v15 = BTErrorF(4294960551LL, "Device manager not available");
        uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
        id v11 = (OS_dispatch_queue *)v24[5];
        v24[5] = v16;
      }
    }

    else
    {
      uint64_t v13 = BTErrorF(4294960591LL, "No completion provided");
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      unsigned __int8 v10 = (void *)v24[5];
      v24[5] = v14;
    }
  }

  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v23, 8);
}

- (void)deleteSoundProfileRecordWithCompletion:(id)a3
{
  id v4 = a3;
  if (dword_1002345E8 <= 30 && (dword_1002345E8 != -1 || _LogCategory_Initialize(&dword_1002345E8, 30LL))) {
    LogPrintF( &dword_1002345E8,  "-[BTCloudServicesXPCConnection deleteSoundProfileRecordWithCompletion:]",  30LL,  "Deleting sound profile");
  }
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_10006DD20;
  uint64_t v26 = sub_10006DD30;
  id v27 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100073DE0;
  v19[3] = &unk_100206810;
  id v21 = &v22;
  id v5 = v4;
  id v20 = v5;
  id v6 = objc_retainBlock(v19);
  id v7 = (id *)(v23 + 5);
  id obj = (id)v23[5];
  unsigned __int8 v8 = -[BTCloudServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v7, obj);
  if ((v8 & 1) != 0)
  {
    if (v5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](&OBJC_CLASS___CloudXPCService, "sharedInstance"));
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceManager]);

      if (v10)
      {
        id v11 = self->_dispatchQueue;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100073E9C;
        v16[3] = &unk_100205FE0;
        void v16[4] = v11;
        id v17 = v5;
        [v10 removeSoundProfileRecordWithCompletion:v16];
      }

      else
      {
        uint64_t v14 = BTErrorF(4294960551LL, "Device manager not available");
        uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
        id v11 = (OS_dispatch_queue *)v23[5];
        v23[5] = v15;
      }
    }

    else
    {
      uint64_t v12 = BTErrorF(4294960591LL, "No completion provided");
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      unsigned __int8 v10 = (void *)v23[5];
      v23[5] = v13;
    }
  }

  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v22, 8);
}

- (BTUserCloudServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (AACloudServicesClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (void)setSigningIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end