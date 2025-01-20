@interface CMHealthColdStorageCloudKitManager
- (BOOL)addPendingRecordChanges:(id)a3 forZoneName:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CMHealthColdStorageCloudKitManager)initWithColdStorageManager:(void *)a3;
- (id).cxx_construct;
- (id)getSyncEngineMetadata;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (id)zoneIDForZoneName:(id)a3;
- (void)createZone:(id)a3;
- (void)dealloc;
- (void)deleteSyncEngineMetadata;
- (void)deleteZone:(id)a3;
- (void)handleAccountChange:(id)a3;
- (void)handleDidFetchChanges:(id)a3;
- (void)handleDidFetchRecordZoneChanges:(id)a3;
- (void)handleDidSendChanges:(id)a3;
- (void)handleFetchedDatabaseChanges:(id)a3;
- (void)handleFetchedRecordZoneChanges:(id)a3;
- (void)handleSentDatabaseChanges:(id)a3;
- (void)handleSentRecordZoneChanges:(id)a3;
- (void)handleServerRecordChanged:(id)a3;
- (void)handleStateUpdate:(id)a3;
- (void)handleUnknownItem:(id)a3;
- (void)handleWillFetchChanges:(id)a3;
- (void)handleWillFetchRecordZoneChanges:(id)a3;
- (void)handleWillSendChanges:(id)a3;
- (void)handleZoneDeleted:(id)a3;
- (void)handleZoneNotFound:(id)a3;
- (void)initializeSyncEngine;
- (void)persistSyncEngineMetadata:(id)a3;
- (void)setUserRecordIDName:(id)a3;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
- (void)updateDeviceUnlockedState:(BOOL)a3;
@end

@implementation CMHealthColdStorageCloudKitManager

- (CMHealthColdStorageCloudKitManager)initWithColdStorageManager:(void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CMHealthColdStorageCloudKitManager;
  v4 = -[CMHealthColdStorageCloudKitManager init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    v4->_coldStorageManager = a3;
    unsigned __int8 v10 = 0;
    sub_1002A2EA4(&v10, &v11);
    sub_10005F550((uint64_t)&v5->_metadataDb, &v11);
    v6 = (std::__shared_weak_count *)*((void *)&v11 + 1);
    if (*((void *)&v11 + 1))
    {
      v7 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
      do
        unint64_t v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }

    v5->_deviceUnlocked = 0;
    v5->_zoneIDs = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v5->_container = -[CKContainer initWithContainerID:]( [CKContainer alloc],  "initWithContainerID:",   [[CKContainerID alloc] initWithContainerIdentifier:@"com.apple.coremotion.coldstorage" environment:1]);
  }

  return v5;
}

- (void)dealloc
{
  zoneIDs = self->_zoneIDs;
  if (zoneIDs)
  {

    self->_zoneIDs = 0LL;
  }

  container = self->_container;
  if (container)
  {

    self->_container = 0LL;
  }

  syncEngine = self->_syncEngine;
  if (syncEngine)
  {

    self->_syncEngine = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CMHealthColdStorageCloudKitManager;
  -[CMHealthColdStorageCloudKitManager dealloc](&v6, "dealloc");
}

- (BOOL)addPendingRecordChanges:(id)a3 forZoneName:(id)a4
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  v7 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = a4;
    __int16 v23 = 2112;
    id v24 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[CloudKit] addPendingRecordChanges - zoneName: %@, recordNames: %@",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    int v17 = 138412546;
    id v18 = a4;
    __int16 v19 = 2112;
    id v20 = a3;
    objc_super v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] addPendingRecordChanges - zoneName: %@, recordNames: %@",  &v17,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]",  "%s\n",  v12);
  }

  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    -[CMHealthColdStorageCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
    syncEngine = self->_syncEngine;
  }

  LOBYTE(v9) = 0;
  if (a4)
  {
    if (a3)
    {
      if (syncEngine)
      {
        id v9 = [a3 count];
        if (v9)
        {
          unsigned __int8 v10 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_10029D8A4;
          v16[3] = &unk_10182E800;
          v16[4] = self;
          v16[5] = a4;
          v16[6] = v10;
          [a3 enumerateObjectsUsingBlock:v16];
          -[CKSyncEngineState addPendingRecordZoneChanges:]( -[CKSyncEngine state](self->_syncEngine, "state"),  "addPendingRecordZoneChanges:",  v10);
          if (qword_1019347B0 != -1) {
            dispatch_once(&qword_1019347B0, &stru_10182E9D0);
          }
          __int128 v11 = (os_log_s *)qword_1019347B8;
          if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Added pending changes",  buf,  2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019347B0 != -1) {
              dispatch_once(&qword_1019347B0, &stru_10182E9D0);
            }
            LOWORD(v17) = 0;
            LODWORD(v15) = 2;
            v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] Added pending changes",  &v17,  v15);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager addPendingRecordChanges:forZoneName:]",  "%s\n",  v13);
          }

          LOBYTE(v9) = 1;
        }
      }
    }
  }

  return (char)v9;
}

- (void)updateDeviceUnlockedState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  v5 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[CloudKit] updateDeviceUnlockedState", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v11[0] = 0;
    unint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] updateDeviceUnlockedState",  v11,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]",  "%s\n",  v8);
  }

  if (!self->_syncEngine && !self->_deviceUnlocked && v3)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager)
    {
      if (sub_100BE70A8((uint64_t)coldStorageManager))
      {
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10182E9D0);
        }
        v7 = (os_log_s *)qword_1019347B8;
        if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] Device has been unlocked. Will now initialize the sync engine.",  buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019347B0 != -1) {
            dispatch_once(&qword_1019347B0, &stru_10182E9D0);
          }
          v11[0] = 0;
          LODWORD(v10) = 2;
          id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] Device has been unlocked. Will now initialize the sync engine.",  v11,  v10);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager updateDeviceUnlockedState:]",  "%s\n",  v9);
        }

        -[CMHealthColdStorageCloudKitManager initializeSyncEngine](self, "initializeSyncEngine");
      }
    }
  }

  self->_deviceUnlocked = v3;
}

- (id)zoneIDForZoneName:(id)a3
{
  if (!-[NSMutableDictionary objectForKey:](self->_zoneIDs, "objectForKey:")) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_zoneIDs,  "setObject:forKeyedSubscript:",   -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  a3,  CKCurrentUserDefaultName),  a3);
  }
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_zoneIDs, "objectForKeyedSubscript:", a3);
}

- (void)initializeSyncEngine
{
  id v3 = -[CMHealthColdStorageCloudKitManager getSyncEngineMetadata](self, "getSyncEngineMetadata");
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  v5 =  -[CKSyncEngineConfiguration initWithDatabase:stateSerialization:delegate:]( objc_alloc(&OBJC_CLASS___CKSyncEngineConfiguration),  "initWithDatabase:stateSerialization:delegate:",  -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"),  v3,  self);
  -[CKSyncEngineConfiguration setApsMachServiceName:]( v5,  "setApsMachServiceName:",  @"com.apple.aps.locationd.coldstorage.cloudkit");
  -[CKSyncEngineConfiguration setPriority:](v5, "setPriority:", 2LL);
  -[CKSyncEngineConfiguration setXpcActivityCriteriaOverrides:](v5, "setXpcActivityCriteriaOverrides:", v4);
  self->_syncEngine = -[CKSyncEngine initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CKSyncEngine),  "initWithConfiguration:",  v5);
  xpc_release(v4);
}

- (id)getSyncEngineMetadata
{
  uint64_t v9 = 0LL;
  int64x2_t v10 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  uint64_t v11 = 0LL;
  BOOL v2 = sub_10029DF68(self->_metadataDb.__ptr_, (uint64_t)&v9);
  id result = 0LL;
  if (v2 && v11 != 0)
  {
    uint64_t v8 = 0LL;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKSyncEngineStateSerialization);
    id result = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v5,  v11,  &v8);
    if (v8)
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      objc_super v6 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] CloudKit manager failed to read metadata. Error:%@",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10182E9D0);
        }
        int v12 = 138412290;
        uint64_t v13 = v8;
        v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] CloudKit manager failed to read metadata. Error:%@",  &v12,  12);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageCloudKitManager getSyncEngineMetadata]", "%s\n", v7);
      }

      return 0LL;
    }
  }

  return result;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v9 = 0LL;
  objc_super v6 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v9);
  if (v9)
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] CloudKit manager failed to write metadata. Error:%{public}@",  (uint8_t *)&buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v10 = 138543362;
      uint64_t v11 = v9;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] CloudKit manager failed to write metadata. Error:%{public}@",  &v10,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager persistSyncEngineMetadata:]",  "%s\n",  v8);
    }
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((CFAbsoluteTime *)&buf + 1) = Current;
    CFAbsoluteTime v13 = Current;
    v14 = v6;
    sub_100AC6514(self->_metadataDb.__ptr_, (uint64_t)&buf);
  }

- (void)deleteSyncEngineMetadata
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  id v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Deleting all sync engine metadata",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v5[0] = 0;
    xpc_object_t v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] Deleting all sync engine metadata",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata]", "%s\n", v4);
  }

  sub_100D8BAC8((void *)self->_metadataDb.__ptr_ + 9);
}

- (void)deleteZone:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      xpc_object_t v4 = -[CKSyncEnginePendingZoneDelete initWithZoneID:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneDelete),  "initWithZoneID:",  a3);
      uint64_t v5 = -[CKSyncEngine state](self->_syncEngine, "state");
      objc_super v6 = v4;
      -[CKSyncEngineState addPendingDatabaseChanges:]( v5,  "addPendingDatabaseChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    }
  }

- (void)createZone:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    uint64_t v5 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Creating new zone with ZoneID: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v11 = 138412290;
      id v12 = a3;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] Creating new zone with ZoneID: %@",  &v11,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager createZone:]", "%s\n", v9);
    }

    objc_super v6 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", a3);
    v7 = -[CKSyncEnginePendingZoneSave initWithZone:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneSave),  "initWithZone:",  v6);
    uint64_t v8 = -[CKSyncEngine state](self->_syncEngine, "state");
    int v10 = v7;
    -[CKSyncEngineState addPendingDatabaseChanges:]( v8,  "addPendingDatabaseChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

- (void)handleZoneDeleted:(id)a3
{
  coldStorageManager = self->_coldStorageManager;
  if (coldStorageManager) {
    sub_100BE6EE0((uint64_t)coldStorageManager, [a3 zoneName]);
  }
}

- (void)handleServerRecordChanged:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      coldStorageManager = self->_coldStorageManager;
      if (coldStorageManager)
      {
        if ((sub_100BE6D38( (uint64_t)coldStorageManager,  [a3 recordID],  +[CMHealthColdStorageUtils getSystemFieldsFromCKRecord:]( CMHealthColdStorageUtils,  "getSystemFieldsFromCKRecord:",  a3)) & 1) == 0)
        {
          if (qword_1019347B0 != -1) {
            dispatch_once(&qword_1019347B0, &stru_10182E9D0);
          }
          xpc_object_t v4 = (os_log_s *)qword_1019347B8;
          if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[CloudKit] ServerRecordChanged: Failed to update local system fields",  buf,  2u);
          }

          if (sub_1002921D0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019347B0 != -1) {
              dispatch_once(&qword_1019347B0, &stru_10182E9D0);
            }
            LOWORD(v8[0]) = 0;
            uint64_t v5 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] ServerRecordChanged: Failed to update local system fields",  v8,  2,  v8[0]);
LABEL_22:
            v7 = (uint8_t *)v5;
            sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleServerRecordChanged:]",  "%s\n",  v5);
            if (v7 != buf) {
              free(v7);
            }
          }
        }
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    objc_super v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] Cannot handle server record change, invalid record",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      LOWORD(v8[0]) = 0;
      uint64_t v5 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Cannot handle server record change, invalid record",  v8,  2,  v8[0]);
      goto LABEL_22;
    }
  }

- (void)handleUnknownItem:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    coldStorageManager = self->_coldStorageManager;
    if (coldStorageManager && (sub_100BE6D38((uint64_t)coldStorageManager, [a3 recordID], 0) & 1) == 0)
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      objc_super v6 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] UnknownItem: Failed to update local system fields",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10182E9D0);
        }
        __int16 v12 = 0;
        int v11 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] UnknownItem: Failed to update local system fields",  &v12,  2);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageCloudKitManager handleUnknownItem:]", "%s\n", v11);
      }
    }

    v7 = objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange);
    id v8 = [a3 recordID];
    uint64_t v9 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( v7,  "initWithRecordID:type:",  v8,  CKSyncEnginePendingRecordZoneChangeTypeSave);
    int v10 = -[CKSyncEngine state](self->_syncEngine, "state");
    CFAbsoluteTime v13 = v9;
    -[CKSyncEngineState addPendingRecordZoneChanges:]( v10,  "addPendingRecordZoneChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  }

- (void)handleZoneNotFound:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      -[CMHealthColdStorageCloudKitManager createZone:]( self,  "createZone:",  objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"));
      uint64_t v5 = objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange);
      id v6 = [a3 recordID];
      v7 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( v5,  "initWithRecordID:type:",  v6,  CKSyncEnginePendingRecordZoneChangeTypeSave);
      id v8 = -[CKSyncEngine state](self->_syncEngine, "state");
      uint64_t v9 = v7;
      -[CKSyncEngineState addPendingRecordZoneChanges:]( v8,  "addPendingRecordZoneChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    }
  }

- (void)setUserRecordIDName:(id)a3
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  xpc_object_t v4 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138477827;
    id v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] Setting userRecordIDName to %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    int v8 = 138477827;
    id v9 = a3;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] Setting userRecordIDName to %{private}@",  &v8,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager setUserRecordIDName:]", "%s\n", v7);
  }

  uint64_t v5 = sub_1002F8DDC();
  sub_1002ACAEC(v5, @"kColdStorageCloudKitUserID", (char *)[a3 UTF8String]);
  uint64_t v6 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
}

- (id)getUserRecordIDName
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A85D0(v2, (uint64_t)@"kColdStorageCloudKitUserID", &__p);
  std::string::size_type size = __p.__r_.__value_.__s.__size_;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    uint64_t v6 = 0LL;
    if ((__p.__r_.__value_.__s.__size_ & 0x80) == 0) {
      return v6;
    }
    goto LABEL_8;
  }

  xpc_object_t v4 = objc_alloc(&OBJC_CLASS___NSString);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v6 = -[NSString initWithUTF8String:](v4, "initWithUTF8String:", p_p);
  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_8:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

- (void)syncEngine:(id)a3 handleEvent:(id)a4
{
  if (a4)
  {
    if (self->_syncEngine == a3)
    {
      switch((unint64_t)[a4 type])
      {
        case 0uLL:
          -[CMHealthColdStorageCloudKitManager handleStateUpdate:](self, "handleStateUpdate:", a4);
          break;
        case 1uLL:
          -[CMHealthColdStorageCloudKitManager handleAccountChange:](self, "handleAccountChange:", a4);
          break;
        case 2uLL:
          -[CMHealthColdStorageCloudKitManager handleFetchedDatabaseChanges:](self, "handleFetchedDatabaseChanges:", a4);
          break;
        case 3uLL:
          -[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]( self,  "handleFetchedRecordZoneChanges:",  a4);
          break;
        case 4uLL:
          -[CMHealthColdStorageCloudKitManager handleSentDatabaseChanges:](self, "handleSentDatabaseChanges:", a4);
          break;
        case 5uLL:
          -[CMHealthColdStorageCloudKitManager handleSentRecordZoneChanges:](self, "handleSentRecordZoneChanges:", a4);
          break;
        case 6uLL:
          -[CMHealthColdStorageCloudKitManager handleWillFetchChanges:](self, "handleWillFetchChanges:", a4);
          break;
        case 7uLL:
          -[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]( self,  "handleWillFetchRecordZoneChanges:",  a4);
          break;
        case 8uLL:
          -[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]( self,  "handleDidFetchRecordZoneChanges:",  a4);
          break;
        case 9uLL:
          -[CMHealthColdStorageCloudKitManager handleDidFetchChanges:](self, "handleDidFetchChanges:", a4);
          break;
        case 0xAuLL:
          -[CMHealthColdStorageCloudKitManager handleWillSendChanges:](self, "handleWillSendChanges:", a4);
          break;
        case 0xBuLL:
          -[CMHealthColdStorageCloudKitManager handleDidSendChanges:](self, "handleDidSendChanges:", a4);
          break;
        default:
          return;
      }
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      uint64_t v6 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v13 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] Sync engine (%@) doesn't match internal reference.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10182E9D0);
        }
        LODWORD(v11) = 138412290;
        *(void *)((char *)&v11 + 4) = a3;
        v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Sync engine (%@) doesn't match internal reference.",  &v11,  12,  v11);
LABEL_33:
        int v10 = (uint8_t *)v7;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager syncEngine:handleEvent:]",  "%s\n",  v7);
        if (v10 != buf) {
          free(v10);
        }
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    int v8 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[CloudKit] Sync engine (%@) called back for invalid event",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = a3;
      v7 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Sync engine (%@) called back for invalid event",  &v11,  12,  v11);
      goto LABEL_33;
    }
  }

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  if (self->_syncEngine != a3) {
    return 0LL;
  }
  id v6 = objc_msgSend(objc_msgSend(a4, "options"), "zoneIDs");
  v7 = -[CKSyncEngineState pendingRecordZoneChanges]( -[CKSyncEngine state](self->_syncEngine, "state"),  "pendingRecordZoneChanges");
  if (v6)
  {
    int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        }

        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v10);
    }

    v7 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10029F65C;
  v14[3] = &unk_10182E828;
  v14[4] = self;
  return  -[CKSyncEngineRecordZoneChangeBatch initWithPendingChanges:recordProvider:]( objc_alloc(&OBJC_CLASS___CKSyncEngineRecordZoneChangeBatch),  "initWithPendingChanges:recordProvider:",  v7,  v14);
}

- (void)handleStateUpdate:(id)a3
{
  id v5 = [a3 stateUpdateEvent];
  if (v5)
  {
    -[CMHealthColdStorageCloudKitManager persistSyncEngineMetadata:]( self,  "persistSyncEngineMetadata:",  [v5 stateSerialization]);
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineStateUpdateEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v8 = 138412290;
      id v9 = a3;
      v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineStateUpdateEvent (%@)",  &v8,  12);
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageCloudKitManager handleStateUpdate:]", "%s\n", v7);
    }
  }

- (void)handleAccountChange:(id)a3
{
  id v5 = [a3 accountChangeEvent];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 changeType];
    if (v7 == (id)2)
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      id v14 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] iCloud switched accounts. Deleting all records and sync engine metadata.",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019347B0 != -1) {
          dispatch_once(&qword_1019347B0, &stru_10182E9D0);
        }
        *(_WORD *)id v24 = 0;
        id v20 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] iCloud switched accounts. Deleting all records and sync engine metadata.",  v24,  2);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager handleAccountChange:]", "%s\n", v20);
      }

      coldStorageManager = (CFAbsoluteTime *)self->_coldStorageManager;
      if (coldStorageManager) {
        sub_100BE6E4C(coldStorageManager);
      }
      -[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
    }

    else
    {
      if (v7 != (id)1)
      {
        if (v7) {
          return;
        }
        id v8 = -[CMHealthColdStorageCloudKitManager getUserRecordIDName](self, "getUserRecordIDName");
        if (v8)
        {
          unsigned int v9 = objc_msgSend( v8,  "isEqualToString:",  objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"));
          -[CMHealthColdStorageCloudKitManager deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
          p_coldStorageManager = &self->_coldStorageManager;
          if (self->_coldStorageManager)
          {
            if (!v9)
            {
              if (qword_1019347B0 != -1) {
                dispatch_once(&qword_1019347B0, &stru_10182E9D0);
              }
              id v11 = (os_log_s *)qword_1019347B8;
              if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] iCloud account change. User switched account",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019347B0 != -1) {
                  dispatch_once(&qword_1019347B0, &stru_10182E9D0);
                }
                *(_WORD *)id v24 = 0;
                id v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] iCloud account change. User switched account",  v24,  2);
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager handleAccountChange:]",  "%s\n",  v22);
              }

              sub_100BE6E4C((CFAbsoluteTime *)*p_coldStorageManager);
              goto LABEL_45;
            }

- (void)handleFetchedDatabaseChanges:(id)a3
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  id v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] Fetched database changes event",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v5[0] = 0;
    xpc_object_t v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] Fetched database changes event",  v5,  2);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager handleFetchedDatabaseChanges:]",  "%s\n",  v4);
  }

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5 = [a3 fetchedRecordZoneChangesEvent];
  if (v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002A04D8;
    v9[3] = &unk_10182E850;
    v9[4] = self;
    objc_msgSend(objc_msgSend(v5, "modifications"), "enumerateObjectsUsingBlock:", v9);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] Fetched record zone event",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      LOWORD(v10) = 0;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  0LL,  "[CloudKit] Fetched record zone event",  &v10,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]",  "%s\n");
LABEL_19:
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v8 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v10 = 138412290;
      id v11 = a3;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent (%@)",  &v10,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleFetchedRecordZoneChanges:]",  "%s\n");
      goto LABEL_19;
    }
  }

- (void)handleSentDatabaseChanges:(id)a3
{
  id v5 = [a3 sentDatabaseChangesEvent];
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(objc_msgSend(v5, "savedZones"), "enumerateObjectsUsingBlock:", &stru_10182E890);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002A0938;
    v10[3] = &unk_10182E8B8;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedZoneIDs"), "enumerateObjectsUsingBlock:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002A0B04;
    v9[3] = &unk_10182E8E0;
    v9[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedZoneSaves"), "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(objc_msgSend(v6, "failedZoneDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_10182E920);
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineSentDatabaseChangesEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v11 = 138412290;
      id v12 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineSentDatabaseChangesEvent (%@)",  &v11,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleSentDatabaseChanges:]",  "%s\n",  v8);
    }
  }

- (void)handleSentRecordZoneChanges:(id)a3
{
  id v5 = [a3 sentRecordZoneChangesEvent];
  if (v5)
  {
    id v6 = v5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002A11B8;
    v11[3] = &unk_10182E850;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v5, "savedRecords"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002A14E4;
    v10[3] = &unk_10182E948;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedRecordIDs"), "enumerateObjectsUsingBlock:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1002A17DC;
    v9[3] = &unk_10182E970;
    v9[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedRecordSaves"), "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(objc_msgSend(v6, "failedRecordDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_10182E9B0);
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v7 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineSentRecordZoneChangesEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v12 = 138412290;
      id v13 = a3;
      id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineSentRecordZoneChangesEvent (%@)",  &v12,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleSentRecordZoneChanges:]",  "%s\n",  v8);
    }
  }

- (void)handleWillFetchChanges:(id)a3
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  id v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine is about to fetch changes",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v5[0] = 0;
    xpc_object_t v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] Sync engine is about to fetch changes",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager handleWillFetchChanges:]", "%s\n", v4);
  }

- (void)handleWillFetchRecordZoneChanges:(id)a3
{
  id v4 = [a3 willFetchRecordZoneChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v13 = [v5 zoneID];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine is about to fetch zone changes for zoneID %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      uint64_t v7 = qword_1019347B8;
      int v10 = 138543362;
      id v11 = [v5 zoneID];
      id v8 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] Sync engine is about to fetch zone changes for zoneID %{public}@",  &v10,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]",  "%s\n");
LABEL_19:
      if (v8 != buf) {
        free(v8);
      }
    }
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    unsigned int v9 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v10 = 138412290;
      id v11 = a3;
      id v8 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent (%@)",  &v10,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleWillFetchRecordZoneChanges:]",  "%s\n");
      goto LABEL_19;
    }
  }

- (void)handleDidFetchRecordZoneChanges:(id)a3
{
  id v4 = [a3 didFetchRecordZoneChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if ([v4 error])
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      id v6 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138543618;
        id v17 = [v5 zoneID];
        __int16 v18 = 2114;
        id v19 = [v5 error];
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] Error fetching record zone changes for %{public}@. Error: %{public}@",  buf,  0x16u);
      }

      if (!sub_1002921D0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      uint64_t v7 = qword_1019347B8;
      int v12 = 138543618;
      id v13 = [v5 zoneID];
      __int16 v14 = 2114;
      id v15 = [v5 error];
      id v8 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  16LL,  "[CloudKit] Error fetching record zone changes for %{public}@. Error: %{public}@",  &v12,  22);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]",  "%s\n");
    }

    else
    {
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v10 = (os_log_s *)qword_1019347B8;
      if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v17 = [v5 zoneID];
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine successfully fetched zone changes for zoneID %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      uint64_t v11 = qword_1019347B8;
      int v12 = 138543362;
      id v13 = [v5 zoneID];
      id v8 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  2LL,  "[CloudKit] Sync engine successfully fetched zone changes for zoneID %{public}@",  &v12,  12);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]",  "%s\n");
    }

    if (v8 != buf) {
LABEL_30:
    }
      free(v8);
  }

  else
  {
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    unsigned int v9 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019347B0 != -1) {
        dispatch_once(&qword_1019347B0, &stru_10182E9D0);
      }
      int v12 = 138412290;
      id v13 = a3;
      id v8 = (uint8_t *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent (%@)",  &v12,  12);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CMHealthColdStorageCloudKitManager handleDidFetchRecordZoneChanges:]",  "%s\n",  (const char *)v8);
      if (v8 != buf) {
        goto LABEL_30;
      }
    }
  }

- (void)handleDidFetchChanges:(id)a3
{
  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  id v3 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine did fetch changes",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    v5[0] = 0;
    id v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  2LL,  "[CloudKit] Sync engine did fetch changes",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager handleDidFetchChanges:]", "%s\n", v4);
  }

- (void)handleWillSendChanges:(id)a3
{
  id v4 = [a3 willSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine will send changes. Reason: %d",  buf,  8u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    uint64_t v7 = qword_1019347B8;
    int v10 = 67109120;
    LODWORD(v11) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] Sync engine will send changes. Reason: %d",  &v10);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v8);
LABEL_20:
    free(v8);
    return;
  }

  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  unsigned int v9 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineWillSendChangesEvent (%@)",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    int v10 = 138412290;
    id v11 = a3;
    id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineWillSendChangesEvent (%@)",  &v10,  12);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageCloudKitManager handleWillSendChanges:]", "%s\n", v8);
  }

- (void)handleDidSendChanges:(id)a3
{
  id v4 = [a3 didSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    id v6 = (os_log_s *)qword_1019347B8;
    if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] Sync engine did send changes. Reason: %d",  buf,  8u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    uint64_t v7 = qword_1019347B8;
    int v10 = 67109120;
    LODWORD(v11) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] Sync engine did send changes. Reason: %d",  &v10);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v8);
LABEL_20:
    free(v8);
    return;
  }

  if (qword_1019347B0 != -1) {
    dispatch_once(&qword_1019347B0, &stru_10182E9D0);
  }
  unsigned int v9 = (os_log_s *)qword_1019347B8;
  if (os_log_type_enabled((os_log_t)qword_1019347B8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CloudKit] Called back for invalid CKSyncEngineDidSendChangesEvent (%@)",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347B0 != -1) {
      dispatch_once(&qword_1019347B0, &stru_10182E9D0);
    }
    int v10 = 138412290;
    id v11 = a3;
    id v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347B8,  16LL,  "[CloudKit] Called back for invalid CKSyncEngineDidSendChangesEvent (%@)",  &v10,  12);
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CMHealthColdStorageCloudKitManager handleDidSendChanges:]", "%s\n", v8);
  }

- (CKContainer)container
{
  return self->_container;
}

- (CKSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end