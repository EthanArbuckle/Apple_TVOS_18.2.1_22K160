@interface CLWifiAssociatedApCentroidSyncedDataStore
- (BOOL)addPendingRecordChanges:(id)a3 pendingRecordZoneChangeType:(int64_t)a4;
- (BOOL)addPendingRecordDeleteChanges:(id)a3;
- (BOOL)addPendingRecordSaveChanges:(id)a3;
- (BOOL)addRecord:(id)a3;
- (BOOL)areCentroidDbAndMetadataDbValid;
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordByMac:(CLMacAddress)a3;
- (BOOL)deleteRecordByMac:(CLMacAddress)a3 sync:(BOOL)a4;
- (BOOL)deleteRecordByMacString:(id)a3;
- (BOOL)isCentroidDatabaseValid;
- (BOOL)isMetadataDatabaseValid;
- (BOOL)isValid;
- (BOOL)purgeOlderRecords;
- (CKContainer)container;
- (CKSyncEngine)syncEngine;
- (CLWifiAssociatedApCentroidSyncedDataStore)init;
- (basic_string<char,)getBasicInfo;
- (id).cxx_construct;
- (id)fetchRecord:(id)a3;
- (id)getSyncEngineMetadata;
- (id)getUserRecordIDName;
- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4;
- (int)count;
- (vector<CLWifiAssociatedApCentroidDatabaseEntry,)fetchAllEntries;
- (void)createZone:(id)a3;
- (void)dealloc;
- (void)deleteSyncEngineMetadata;
- (void)deleteZone:(id)a3;
- (void)handleAccountChange:(id)a3;
- (void)handleDidFetchChanges:(id)a3;
- (void)handleDidFetchRecordZoneChanges:(id)a3;
- (void)handleDidSendChanges:(id)a3;
- (void)handleFetchedDatabaseChanges:(id)a3;
- (void)handleFetchedRecordDeletion:(id)a3;
- (void)handleFetchedRecordModification:(id)a3;
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
- (void)initCentroidDatabase;
- (void)initCentroidDbAndMetadataDb;
- (void)initMetadataDatabase;
- (void)initializeSyncEngine;
- (void)persistSyncEngineMetadata:(id)a3;
- (void)purgeRecordsWithDistanceLargerThanThreshold:(const CLDaemonLocation *)a3;
- (void)reInitializeDatabasesAndSyncEngineIfNeeded;
- (void)setUserRecordIDName:(id)a3;
- (void)submitMetricsIfPossible:(BOOL)a3;
- (void)syncEngine:(id)a3 handleEvent:(id)a4;
@end

@implementation CLWifiAssociatedApCentroidSyncedDataStore

- (CLWifiAssociatedApCentroidSyncedDataStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWifiAssociatedApCentroidSyncedDataStore;
  v2 = -[CLWifiAssociatedApCentroidSyncedDataStore init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    -[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDbAndMetadataDb](v2, "initCentroidDbAndMetadataDb");
    v3->_container = -[CKContainer initWithContainerID:]( [CKContainer alloc],  "initWithContainerID:",   [[CKContainerID alloc] initWithContainerIdentifier:@"com.apple.locationd.clx" environment:1]);
    -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](v3, "initializeSyncEngine");
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v4 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, init",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, init",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWifiAssociatedApCentroidSyncedDataStore init]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  return v3;
}

- (void)dealloc
{
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

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLWifiAssociatedApCentroidSyncedDataStore;
  -[CLWifiAssociatedApCentroidSyncedDataStore dealloc](&v5, "dealloc");
}

- (void)initCentroidDatabase
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    v3 = (CLWifiAssociatedApCentroidDatabase *)operator new(0x108uLL);
    sub_1010DDBC0(__p, "");
    sub_1009ECA40((uint64_t)v3, __p);
    if (v16 < 0) {
      operator delete(*(void **)__p);
    }
    value = self->_centroidDb.__ptr_.__value_;
    self->_centroidDb.__ptr_.__value_ = v3;
    if (value) {
      (*(void (**)(CLWifiAssociatedApCentroidDatabase *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    objc_super v5 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = sub_100400B64((uint64_t)self->_centroidDb.__ptr_.__value_);
      v7 = "invalid";
      if (v6) {
        v7 = "valid";
      }
      *(_DWORD *)__p = 136446210;
      *(void *)&__p[4] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, initialize centroid database, %{public}s",  __p,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v8 = qword_101934858;
      BOOL v9 = sub_100400B64((uint64_t)self->_centroidDb.__ptr_.__value_);
      v10 = "invalid";
      if (v9) {
        v10 = "valid";
      }
      int v13 = 136446210;
      v14 = v10;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v8,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, initialize centroid database, %{public}s",  &v13,  12);
      v12 = (char *)v11;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDatabase]",  "%s\n",  v11);
      if (v12 != __p) {
        free(v12);
      }
    }
  }

- (void)initMetadataDatabase
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    v3 = operator new(0xD0uLL);
    sub_1010DDBC0(__p, "");
    sub_100B858B4((uint64_t)v3, __p);
    if (v18 < 0) {
      operator delete(*(void **)__p);
    }
    value = self->_metadataDb.__ptr_.__value_;
    p_metadataDb = (uint64_t *)&self->_metadataDb;
    uint64_t v4 = (uint64_t)value;
    uint64_t *p_metadataDb = (uint64_t)v3;
    if (value) {
      sub_1007EA2A4((uint64_t)p_metadataDb, v4);
    }
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v7 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = sub_100031790(*p_metadataDb);
      BOOL v9 = "invalid";
      if (v8) {
        BOOL v9 = "valid";
      }
      *(_DWORD *)__p = 136446210;
      *(void *)&__p[4] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, initialize metadata database, %{public}s",  __p,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v10 = qword_101934858;
      BOOL v11 = sub_100031790(*p_metadataDb);
      v12 = "invalid";
      if (v11) {
        v12 = "valid";
      }
      int v15 = 136446210;
      char v16 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v10,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, initialize metadata database, %{public}s",  &v15,  12);
      v14 = (char *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore initMetadataDatabase]",  "%s\n",  v13);
      if (v14 != __p) {
        free(v14);
      }
    }
  }

- (void)initCentroidDbAndMetadataDb
{
}

- (BOOL)isCentroidDatabaseValid
{
  value = self->_centroidDb.__ptr_.__value_;
  if (value) {
    LOBYTE(value) = sub_100400B64((uint64_t)value);
  }
  return (char)value;
}

- (BOOL)isMetadataDatabaseValid
{
  value = self->_metadataDb.__ptr_.__value_;
  if (value) {
    LOBYTE(value) = sub_100031790((uint64_t)value);
  }
  return (char)value;
}

- (BOOL)areCentroidDbAndMetadataDbValid
{
  unsigned int v3 = -[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid");
  unsigned int v4 = -[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid");
  if (v3 != v4)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    objc_super v5 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240448;
      unsigned int v13 = v3;
      __int16 v14 = 1026;
      unsigned int v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "[CloudKit] WifiAssociatedApCentroidStore, centroid DB and metadata DB are in different states: %{public}d vs %{public}d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      v9[0] = 67240448;
      v9[1] = v3;
      __int16 v10 = 1026;
      unsigned int v11 = v4;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  17LL,  "[CloudKit] WifiAssociatedApCentroidStore, centroid DB and metadata DB are in different states: %{public}d vs %{public}d",  v9,  14);
      BOOL v8 = (uint8_t *)v7;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid]",  "%s\n",  v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

  return v3 & v4;
}

- (BOOL)isValid
{
  BOOL v3 = -[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid]( self,  "areCentroidDbAndMetadataDbValid");
  if (v3) {
    LOBYTE(v3) = self->_syncEngine != 0LL;
  }
  return v3;
}

- (BOOL)addRecord:(id)a3
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    return 0;
  }
  sub_1006078D0((uint64_t)v21, [a3 toNSDictionary]);
  objc_super v5 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
  else {
    __p[0] = v22;
  }
  if ((__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v7 = __p;
  }
  else {
    v7 = (std::stringbuf::string_type *)__p[0].__r_.__value_.__r.__words[0];
  }
  -[NSMutableArray addObject:]( v5,  "addObject:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  if (-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordSaveChanges:]( self,  "addPendingRecordSaveChanges:",  +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5)))
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    BOOL v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      sub_1006083F0((uint64_t)v21, __p);
      BOOL v9 = (__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0
         ? __p
         : (std::stringbuf::string_type *)__p[0].__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, success, entry: %{private}s",  (uint8_t *)&buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v13 = qword_101934858;
      sub_1006083F0((uint64_t)v21, &buf);
      if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_std::stringbuf::string_type buf = &buf;
      }
      else {
        p_std::stringbuf::string_type buf = (std::stringbuf::string_type *)buf.__r_.__value_.__r.__words[0];
      }
      int v24 = 136380675;
      v25 = p_buf;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v13,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, success, entry: %{private}s",  &v24,  12);
      char v16 = v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]",  "%s\n",  (const char *)v16);
      if (v16 != __p) {
        free(v16);
      }
    }

    char v6 = sub_1009ECAC0((uint64_t)self->_centroidDb.__ptr_.__value_, (uint64_t)v21);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    __int16 v10 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      sub_1006083F0((uint64_t)v21, __p);
      unsigned int v11 = (__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0
          ? __p
          : (std::stringbuf::string_type *)__p[0].__r_.__value_.__r.__words[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136380675;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, warning, could not add to sync engine: %{private}s",  (uint8_t *)&buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v17 = qword_101934858;
      sub_1006083F0((uint64_t)v21, &buf);
      if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        char v18 = &buf;
      }
      else {
        char v18 = (std::stringbuf::string_type *)buf.__r_.__value_.__r.__words[0];
      }
      int v24 = 136380675;
      v25 = v18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v17,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordSaveChanges, warning, could not add to sync engine: %{private}s",  &v24,  12);
      v20 = v19;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore addRecord:]",  "%s\n",  (const char *)v20);
      if (v20 != __p) {
        free(v20);
      }
    }

    char v6 = 0;
  }

  sub_100607C80(v21);
  return v6;
}

- (id)fetchRecord:(id)a3
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    return 0LL;
  }
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  __int16 v10 = (void ***)sub_1007EBE44((uint64_t *)__p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  sub_1009EDF94((uint64_t)self->_centroidDb.__ptr_.__value_, &v10, __p);
  if (!v9) {
    return 0LL;
  }
  objc_super v5 = -[CLWifiAssociatedApCentroidDO initWithNSDictionary:]( objc_alloc(&OBJC_CLASS___CLWifiAssociatedApCentroidDO),  "initWithNSDictionary:",  sub_100608174((uint64_t)__p));
  if (v9) {
    sub_100607C80(__p);
  }
  return v5;
}

- (vector<CLWifiAssociatedApCentroidDatabaseEntry,)fetchAllEntries
{
  result = (vector<CLWifiAssociatedApCentroidDatabaseEntry, std::allocator<CLWifiAssociatedApCentroidDatabaseEntry>> *)-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid");
  if ((result & 1) != 0)
  {
    sub_1009EDF08((uint64_t)self->_centroidDb.__ptr_.__value_, (uint64_t *)retstr);
  }

  else
  {
    retstr->var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->var2.var0 = 0LL;
  }

  return result;
}

- (BOOL)deleteAllRecords
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    return 0;
  }
  sub_1009EDF08((uint64_t)self->_centroidDb.__ptr_.__value_, &v12);
  if (sub_1009EEBA4((uint64_t)self->_centroidDb.__ptr_.__value_))
  {
    BOOL v3 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0x6DB6DB6DB6DB6DB7LL * ((v13 - v12) >> 4));
    uint64_t v4 = v12;
    for (uint64_t i = v13; v4 != i; v4 += 112LL)
    {
      if (*(char *)(v4 + 103) < 0)
      {
        sub_1010DD48C(__p, *(void **)(v4 + 80), *(void *)(v4 + 88));
      }

      else
      {
        __int128 v6 = *(_OWORD *)(v4 + 80);
        uint64_t v11 = *(void *)(v4 + 96);
        *(_OWORD *)__p = v6;
      }

      if (v11 >= 0) {
        v7 = __p;
      }
      else {
        v7 = (void **)__p[0];
      }
      -[NSMutableArray addObject:]( v3,  "addObject:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v11));
      if (SHIBYTE(v11) < 0) {
        operator delete(__p[0]);
      }
    }

    BOOL v8 = -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordDeleteChanges:]( self,  "addPendingRecordDeleteChanges:",  +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v3));
  }

  else
  {
    BOOL v8 = 0;
  }

  __p[0] = &v12;
  sub_10068CDBC((void ***)__p);
  return v8;
}

- (BOOL)deleteRecordByMacString:(id)a3
{
  uint64_t v4 = sub_1007EBE44((uint64_t *)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return -[CLWifiAssociatedApCentroidSyncedDataStore deleteRecordByMac:](self, "deleteRecordByMac:", v4);
}

- (BOOL)deleteRecordByMac:(CLMacAddress)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  var0 = (void ***)a3.var0;
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")
    && (sub_1009EDF94((uint64_t)self->_centroidDb.__ptr_.__value_, &var0, v11), v14))
  {
    LODWORD(v6) = sub_1009EE440((uint64_t)self->_centroidDb.__ptr_.__value_, (uint64_t)&var0);
    if ((v6 & v4 & 1) != 0)
    {
      __int128 v6 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
      if (SHIBYTE(v13) < 0)
      {
        sub_1010DD48C(__p, (void *)v12, *((unint64_t *)&v12 + 1));
      }

      else
      {
        *(_OWORD *)__p = v12;
        uint64_t v10 = v13;
      }

      if (v10 >= 0) {
        char v7 = __p;
      }
      else {
        char v7 = (void **)__p[0];
      }
      -[NSMutableArray addObject:]( v6,  "addObject:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7, __p[0], __p[1], v10));
      if (SHIBYTE(v10) < 0) {
        operator delete(__p[0]);
      }
      LOBYTE(v6) = -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordDeleteChanges:]( self,  "addPendingRecordDeleteChanges:",  +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
    }

    if (v14) {
      sub_100607C80(v11);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)deleteRecordByMac:(CLMacAddress)a3
{
  return -[CLWifiAssociatedApCentroidSyncedDataStore deleteRecordByMac:sync:]( self,  "deleteRecordByMac:sync:",  a3.var0,  1LL);
}

- (BOOL)purgeOlderRecords
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    BOOL v3 = (uint64_t *)sub_100F4BF44();
    double v21 = sub_100F4CB14(v3);
    value = self->_centroidDb.__ptr_.__value_;
    *(void *)std::stringbuf::string_type buf = CFAbsoluteTimeGetCurrent();
    sub_1009EF7BC((uint64_t)value, &v21, (double *)buf, (uint64_t *)&v19);
    objc_super v5 = v19;
    __int128 v6 = v20;
    for (int i = 1; v5 != v6; v5 += 14)
    {
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      BOOL v8 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = v21;
        *(void *)std::stringbuf::string_type v22 = CFAbsoluteTimeGetCurrent();
        double v10 = sub_1006083C4((uint64_t)v5, (double *)v22);
        *(_DWORD *)std::stringbuf::string_type buf = 134283777;
        *(double *)&uint8_t buf[4] = v9;
        __int16 v26 = 2049;
        double v27 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, purging local records older than %{private}.1f, age, %{private}.1f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        uint64_t v11 = qword_101934858;
        double v12 = v21;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v13 = sub_1006083C4((uint64_t)v5, &Current);
        *(_DWORD *)std::stringbuf::string_type v22 = 134283777;
        *(double *)&v22[4] = v12;
        __int16 v23 = 2049;
        double v24 = v13;
        LODWORD(v17) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, purging local records older than %{private}.1f, age, %{private}.1f",  v22,  v17);
        unsigned int v15 = (char *)v14;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore purgeOlderRecords]",  "%s\n",  v14);
        if (v15 != buf) {
          free(v15);
        }
      }

      i &= -[CLWifiAssociatedApCentroidSyncedDataStore deleteRecordByMac:sync:]( self,  "deleteRecordByMac:sync:",  *v5,  0LL);
    }

    *(void *)std::stringbuf::string_type buf = &v19;
    sub_10068CDBC((void ***)buf);
  }

  else
  {
    LOBYTE(i) = 0;
  }

  return i;
}

- (void)purgeRecordsWithDistanceLargerThanThreshold:(const CLDaemonLocation *)a3
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    sub_1009EF90C((uint64_t)self->_centroidDb.__ptr_.__value_, (uint64_t)a3);
  }
}

- (int)count
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    return sub_1009EF350((uint64_t)self->_centroidDb.__ptr_.__value_);
  }
  else {
    return -1;
  }
}

- (basic_string<char,)getBasicInfo
{
  v2 = v1;
  sub_1009EFE78(v2[2], (std::stringbuf::string_type *)retstr);
  return result;
}

- (void)submitMetricsIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
    sub_1009EFF04((uint64_t)self->_centroidDb.__ptr_.__value_, v3);
  }
}

- (void)reInitializeDatabasesAndSyncEngineIfNeeded
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  BOOL v3 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, re-initialize databases and sync engine if needed",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, re-initialize databases and sync engine if needed",  v6,  2);
    objc_super v5 = (uint8_t *)v4;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore reInitializeDatabasesAndSyncEngineIfNeeded]",  "%s\n",  v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLWifiAssociatedApCentroidSyncedDataStore initCentroidDbAndMetadataDb](self, "initCentroidDbAndMetadataDb");
  -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](self, "initializeSyncEngine");
}

- (void)initializeSyncEngine
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore areCentroidDbAndMetadataDbValid]( self,  "areCentroidDbAndMetadataDbValid"))
  {
    if (!self->_syncEngine)
    {
      id v3 = -[CLWifiAssociatedApCentroidSyncedDataStore getSyncEngineMetadata](self, "getSyncEngineMetadata");
      BOOL v4 =  -[CKSyncEngineConfiguration initWithDatabase:stateSerialization:delegate:]( objc_alloc(&OBJC_CLASS___CKSyncEngineConfiguration),  "initWithDatabase:stateSerialization:delegate:",  -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase"),  v3,  self);
      -[CKSyncEngineConfiguration setApsMachServiceName:]( v4,  "setApsMachServiceName:",  @"com.apple.aps.locationd");
      -[CKSyncEngineConfiguration setPriority:](v4, "setPriority:", 2LL);
      self->_syncEngine = -[CKSyncEngine initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CKSyncEngine),  "initWithConfiguration:",  v4);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      objc_super v5 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v6 = "yes";
        if (!v3) {
          __int128 v6 = "no";
        }
        *(_DWORD *)std::stringbuf::string_type buf = 136315138;
        double v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, initializeSyncEngine with metadata? %s",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, initializeSyncEngine with metadata? %s",  &v10);
LABEL_22:
        double v9 = (uint8_t *)v7;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine]",  "%s\n",  v7);
        if (v9 != buf) {
          free(v9);
        }
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    BOOL v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, not initializing sync engine due to invalid databases. Most likely device is locked.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, not initializing sync engine due to invalid databases. Most likely device is locked.");
      goto LABEL_22;
    }
  }

- (id)getSyncEngineMetadata
{
  if (!-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    __int128 v10 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, could not get sync engine metadata due to invalid database. Most likel y device is locked.",  buf,  2u);
    }

    if (!sub_1002921D0(115, 0)) {
      return 0LL;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    LOWORD(v13) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, could not get sync engine metadata due to invalid database. Most likely device is locked.",  &v13,  2);
    goto LABEL_22;
  }

  sub_100B85F80((uint64_t)self->_metadataDb.__ptr_.__value_);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v12 = 0LL;
    *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___CKSyncEngineStateSerialization).n128_u64[0];
    id result = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v6,  v4,  &v12,  v5);
    if (!v12) {
      return result;
    }
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    BOOL v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138412290;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, failed to read metadata. Error: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, failed to read metadata. Error: %@",  &v13,  12);
LABEL_22:
      uint64_t v11 = (uint8_t *)v9;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore getSyncEngineMetadata]",  "%s\n",  v9);
      if (v11 != buf) {
        free(v11);
      }
    }
  }

  return 0LL;
}

- (void)persistSyncEngineMetadata:(id)a3
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    uint64_t v11 = 0LL;
    double v5 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v11);
    if (!v11)
    {
      __int128 v10 = v5;
      *(void *)&buf[0] = CFAbsoluteTimeGetCurrent();
      *((void *)&buf[0] + 1) = v10;
      sub_100B85928((uint64_t)self->_metadataDb.__ptr_.__value_, (uint64_t)buf);
      return;
    }

    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, failed to write metadata. Error: %{public}@",  (uint8_t *)buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, failed to write metadata. Error: %{public}@",  &v12,  12);
LABEL_19:
      double v9 = (char *)v7;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore persistSyncEngineMetadata:]",  "%s\n",  v7);
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    BOOL v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, could not persist sync engine metadata due to invalid database. Most l ikely device is locked.",  (uint8_t *)buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      LOWORD(v12) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, could not persist sync engine metadata due to invalid database. Most l ikely device is locked.",  &v12,  2);
      goto LABEL_19;
    }
  }

- (void)deleteSyncEngineMetadata
{
  if (-[CLWifiAssociatedApCentroidSyncedDataStore isMetadataDatabaseValid](self, "isMetadataDatabaseValid"))
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v3 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Deleting sync engine metadata",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Deleting sync engine metadata",  v9,  2);
      uint64_t v6 = (uint8_t *)v5;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]",  "%s\n",  v5);
      if (v6 != buf) {
        free(v6);
      }
    }

    sub_100B86374((uint64_t)self->_metadataDb.__ptr_.__value_);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v4 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, could not delete sync engine metadata due to invalid database. Most li kely device is locked.",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      v9[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, could not delete sync engine metadata due to invalid database. Most li kely device is locked.",  v9,  2);
      BOOL v8 = (uint8_t *)v7;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata]",  "%s\n",  v7);
      if (v8 != buf) {
        free(v8);
      }
    }
  }

- (BOOL)addPendingRecordChanges:(id)a3 pendingRecordZoneChangeType:(int64_t)a4
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  char v7 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::stringbuf::string_type buf = 138412802;
    v29 = @"com.apple.clx.cloudkit.zone";
    __int16 v30 = 2112;
    id v31 = a3;
    __int16 v32 = 2048;
    int64_t v33 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordChanges - zoneName: %@, recordNames: %@, type: %ld",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    int v22 = 138412802;
    __int16 v23 = @"com.apple.clx.cloudkit.zone";
    __int16 v24 = 2112;
    id v25 = a3;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, addPendingRecordChanges - zoneName: %@, recordNames: %@, type: %ld",  &v22,  32);
    uint64_t v14 = (uint8_t *)v13;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]",  "%s\n",  v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  syncEngine = self->_syncEngine;
  if (syncEngine)
  {
    if (!a3) {
      goto LABEL_18;
    }
  }

  else
  {
    -[CLWifiAssociatedApCentroidSyncedDataStore initializeSyncEngine](self, "initializeSyncEngine");
    syncEngine = self->_syncEngine;
    if (!a3)
    {
LABEL_18:
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v12 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::stringbuf::string_type buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, warning, could not add pending changes",  buf,  2u);
      }

      BOOL v11 = sub_1002921D0(115, 2);
      if (v11)
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        LOWORD(v22) = 0;
        LODWORD(v20) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, warning, could not add pending changes",  &v22,  v20);
        uint64_t v16 = (uint8_t *)v15;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]",  "%s\n",  v15);
        if (v16 != buf) {
          free(v16);
        }
        LOBYTE(v11) = 0;
      }

      return v11;
    }
  }

  if (!syncEngine || ![a3 count]) {
    goto LABEL_18;
  }
  double v9 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [a3 count]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1007E389C;
  v21[3] = &unk_101856BA8;
  v21[5] = v9;
  v21[6] = a4;
  v21[4] = @"com.apple.clx.cloudkit.zone";
  [a3 enumerateObjectsUsingBlock:v21];
  -[CKSyncEngineState addPendingRecordZoneChanges:]( -[CKSyncEngine state](self->_syncEngine, "state"),  "addPendingRecordZoneChanges:",  v9);
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  __int128 v10 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, successfully added pending changes",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    LOWORD(v22) = 0;
    LODWORD(v20) = 2;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, successfully added pending changes",  &v22,  v20);
    char v18 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]",  "%s\n",  v17);
    if (v18 != buf) {
      free(v18);
    }
  }

  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)addPendingRecordSaveChanges:(id)a3
{
  return -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]( self,  "addPendingRecordChanges:pendingRecordZoneChangeType:",  a3,  CKSyncEnginePendingRecordZoneChangeTypeSave);
}

- (BOOL)addPendingRecordDeleteChanges:(id)a3
{
  return -[CLWifiAssociatedApCentroidSyncedDataStore addPendingRecordChanges:pendingRecordZoneChangeType:]( self,  "addPendingRecordChanges:pendingRecordZoneChangeType:",  a3,  CKSyncEnginePendingRecordZoneChangeTypeDelete);
}

- (void)createZone:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v5 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138412290;
      id v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Creating new zone with ZoneID: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v12 = 138412290;
      id v13 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Creating new zone with ZoneID: %@",  &v12,  12);
      __int128 v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWifiAssociatedApCentroidSyncedDataStore createZone:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    uint64_t v6 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", a3);
    char v7 = -[CKSyncEnginePendingZoneSave initWithZone:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneSave),  "initWithZone:",  v6);
    BOOL v8 = -[CKSyncEngine state](self->_syncEngine, "state");
    BOOL v11 = v7;
    -[CKSyncEngineState addPendingDatabaseChanges:]( v8,  "addPendingDatabaseChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  }

- (void)deleteZone:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      uint64_t v4 = -[CKSyncEnginePendingZoneDelete initWithZoneID:]( objc_alloc(&OBJC_CLASS___CKSyncEnginePendingZoneDelete),  "initWithZoneID:",  a3);
      double v5 = -[CKSyncEngine state](self->_syncEngine, "state");
      uint64_t v6 = v4;
      -[CKSyncEngineState addPendingDatabaseChanges:]( v5,  "addPendingDatabaseChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    }
  }

- (void)handleZoneDeleted:(id)a3
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  uint64_t v3 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, handleZoneDeleted. Do we need to do anything here?",  buf,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, handleZoneDeleted. Do we need to do anything here?",  v6,  2);
    double v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWifiAssociatedApCentroidSyncedDataStore handleZoneDeleted:]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)handleServerRecordChanged:(id)a3
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  double v5 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, handle ServerRecordChanged",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    LOWORD(v14[0]) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, handle ServerRecordChanged",  v14,  2);
    BOOL v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]",  "%s\n",  v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  if (a3)
  {
    if (self->_syncEngine)
    {
      value = self->_centroidDb.__ptr_.__value_;
      if (value)
      {
        if ((sub_1009EF2B4((uint64_t)value, [a3 recordID], a3) & 1) == 0)
        {
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          char v7 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)std::stringbuf::string_type buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, ServerRecordChanged: Failed to update local system fields",  buf,  2u);
          }

          if (sub_1002921D0(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            LOWORD(v14[0]) = 0;
            LODWORD(v13) = 2;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, ServerRecordChanged: Failed to update local system fields",  v14,  v13,  v14[0]);
LABEL_31:
            int v12 = (uint8_t *)v8;
            sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleServerRecordChanged:]",  "%s\n",  v8);
            if (v12 != buf) {
              free(v12);
            }
          }
        }
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v9 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, could not handle server record change, invalid server record",  buf,  2u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      LOWORD(v14[0]) = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, could not handle server record change, invalid server record",  v14,  v13,  v14[0]);
      goto LABEL_31;
    }
  }

- (void)handleUnknownItem:(id)a3
{
  if (a3 && self->_syncEngine)
  {
    if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")
      && (sub_1009EF2B4((uint64_t)self->_centroidDb.__ptr_.__value_, [a3 recordID], 0) & 1) == 0)
    {
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      double v5 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::stringbuf::string_type buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, UnknownItem: Failed to update local system fields",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        __int16 v12 = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, UnknownItem: Failed to update local system fields",  &v12,  2);
        BOOL v11 = (uint8_t *)v10;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleUnknownItem:]",  "%s\n",  v10);
        if (v11 != buf) {
          free(v11);
        }
      }
    }

    uint64_t v6 = objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange);
    id v7 = [a3 recordID];
    BOOL v8 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( v6,  "initWithRecordID:type:",  v7,  CKSyncEnginePendingRecordZoneChangeTypeSave);
    double v9 = -[CKSyncEngine state](self->_syncEngine, "state");
    uint64_t v13 = v8;
    -[CKSyncEngineState addPendingRecordZoneChanges:]( v9,  "addPendingRecordZoneChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  }

- (void)handleZoneNotFound:(id)a3
{
  if (a3)
  {
    if (self->_syncEngine)
    {
      -[CLWifiAssociatedApCentroidSyncedDataStore createZone:]( self,  "createZone:",  objc_msgSend(objc_msgSend(a3, "recordID"), "zoneID"));
      double v5 = objc_alloc(&OBJC_CLASS___CKSyncEnginePendingRecordZoneChange);
      id v6 = [a3 recordID];
      id v7 = -[CKSyncEnginePendingRecordZoneChange initWithRecordID:type:]( v5,  "initWithRecordID:type:",  v6,  CKSyncEnginePendingRecordZoneChangeTypeSave);
      BOOL v8 = -[CKSyncEngine state](self->_syncEngine, "state");
      double v9 = v7;
      -[CKSyncEngineState addPendingRecordZoneChanges:]( v8,  "addPendingRecordZoneChanges:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    }
  }

- (void)setUserRecordIDName:(id)a3
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  uint64_t v4 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::stringbuf::string_type buf = 138477827;
    id v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, Setting userRecordIDName to %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    int v9 = 138477827;
    id v10 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, Setting userRecordIDName to %{private}@",  &v9,  12);
    BOOL v8 = (uint8_t *)v7;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:]",  "%s\n",  v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  uint64_t v5 = sub_1002F8DDC();
  sub_1002ACAEC(v5, @"kWifiAssociatedApCentroidCloudKitUserID", (char *)[a3 UTF8String]);
  uint64_t v6 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
}

- (id)getUserRecordIDName
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A85D0(v2, (uint64_t)@"kWifiAssociatedApCentroidCloudKitUserID", &__p);
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

  uint64_t v4 = objc_alloc(&OBJC_CLASS___NSString);
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

- (id)syncEngine:(id)a3 nextRecordZoneChangeBatchForContext:(id)a4
{
  if (self->_syncEngine != a3) {
    return 0LL;
  }
  id v6 = objc_msgSend(objc_msgSend(a4, "options"), "zoneIDs");
  id v7 = -[CKSyncEngineState pendingRecordZoneChanges]( -[CKSyncEngine state](self->_syncEngine, "state"),  "pendingRecordZoneChanges");
  if (v6)
  {
    BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v46,  v56,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (int i = 0LL; i != v10; int i = (char *)i + 1)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        }

        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v46,  v56,  16LL);
      }

      while (v10);
    }

    id v7 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8);
  }

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1007E4CA0;
  v45[3] = &unk_10182E828;
  v45[4] = self;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v36 =  -[CKSyncEngineRecordZoneChangeBatch initWithPendingChanges:recordProvider:]( objc_alloc(&OBJC_CLASS___CKSyncEngineRecordZoneChangeBatch),  "initWithPendingChanges:recordProvider:",  v7,  v45);
  uint64_t v14 = -[CKSyncEngineRecordZoneChangeBatch recordsToSave](v36, "recordsToSave");
  id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      char v18 = 0LL;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v18);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        uint64_t v20 = (os_log_s *)qword_101934858;
        if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::stringbuf::string_type buf = 138477827;
          uint64_t v54 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to save: %{private}@",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          int v51 = 138477827;
          uint64_t v52 = v19;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to save: %{private}@",  &v51,  v35);
          int v22 = (uint8_t *)v21;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]",  "%s\n",  v21);
          if (v22 != buf) {
            free(v22);
          }
        }

        char v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
      id v16 = v23;
    }

    while (v23);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v4 = v36;
  __int16 v24 = -[CKSyncEngineRecordZoneChangeBatch recordIDsToDelete](v36, "recordIDsToDelete");
  id v25 = -[NSArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      v28 = 0LL;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)v28);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        __int16 v30 = (os_log_s *)qword_101934858;
        if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::stringbuf::string_type buf = 138477827;
          uint64_t v54 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to delete: %{private}@",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          int v51 = 138477827;
          uint64_t v52 = v29;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, nextRecordZoneChangeBatch, record to delete: %{private}@",  &v51,  v35);
          __int16 v32 = (uint8_t *)v31;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:nextRecordZoneChangeBatchForContext:]",  "%s\n",  v31);
          if (v32 != buf) {
            free(v32);
          }
        }

        v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v33 = -[NSArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v37,  v50,  16LL);
      id v26 = v33;
    }

    while (v33);
    return v36;
  }

  return v4;
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
          -[CLWifiAssociatedApCentroidSyncedDataStore handleStateUpdate:](self, "handleStateUpdate:", a4);
          break;
        case 1uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:](self, "handleAccountChange:", a4);
          break;
        case 2uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]( self,  "handleFetchedDatabaseChanges:",  a4);
          break;
        case 3uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]( self,  "handleFetchedRecordZoneChanges:",  a4);
          break;
        case 4uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleSentDatabaseChanges:]( self,  "handleSentDatabaseChanges:",  a4);
          break;
        case 5uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleSentRecordZoneChanges:]( self,  "handleSentRecordZoneChanges:",  a4);
          break;
        case 6uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchChanges:](self, "handleWillFetchChanges:", a4);
          break;
        case 7uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]( self,  "handleWillFetchRecordZoneChanges:",  a4);
          break;
        case 8uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]( self,  "handleDidFetchRecordZoneChanges:",  a4);
          break;
        case 9uLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchChanges:](self, "handleDidFetchChanges:", a4);
          break;
        case 0xAuLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:](self, "handleWillSendChanges:", a4);
          break;
        case 0xBuLL:
          -[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:](self, "handleDidSendChanges:", a4);
          break;
        default:
          return;
      }
    }

    else
    {
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      id v6 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::stringbuf::string_type buf = 138477827;
        id v13 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ doesn't match internal reference.",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        LODWORD(v11) = 138477827;
        *(void *)((char *)&v11 + 4) = a3;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ doesn't match internal reference.",  &v11,  12,  v11);
LABEL_33:
        id v10 = (uint8_t *)v7;
        sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore syncEngine:handleEvent:]",  "%s\n",  v7);
        if (v10 != buf) {
          free(v10);
        }
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    BOOL v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v13 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ called back for invalid event",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      LODWORD(v11) = 138477827;
      *(void *)((char *)&v11 + 4) = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine %{private}@ called back for invalid event",  &v11,  12,  v11);
      goto LABEL_33;
    }
  }

- (void)handleStateUpdate:(id)a3
{
  id v5 = [a3 stateUpdateEvent];
  if (v5)
  {
    -[CLWifiAssociatedApCentroidSyncedDataStore persistSyncEngineMetadata:]( self,  "persistSyncEngineMetadata:",  [v5 stateSerialization]);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138412290;
      id v12 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineStateUpdateEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v9 = 138412290;
      id v10 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineStateUpdateEvent (%@)",  &v9,  12);
      BOOL v8 = (uint8_t *)v7;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleStateUpdate:]",  "%s\n",  v7);
      if (v8 != buf) {
        free(v8);
      }
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
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v14 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::stringbuf::string_type buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud switched accounts. Deleting all records and sync engine metadata.",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        *(_WORD *)uint64_t v27 = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud switched accounts. Deleting all records and sync engine metadata.",  v27,  2);
        double v21 = (uint8_t *)v20;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]",  "%s\n",  v20);
        if (v21 != buf) {
          free(v21);
        }
      }

      if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid")) {
        sub_1009EEBA4((uint64_t)self->_centroidDb.__ptr_.__value_);
      }
      -[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
    }

    else
    {
      if (v7 != (id)1)
      {
        if (v7) {
          return;
        }
        id v8 = -[CLWifiAssociatedApCentroidSyncedDataStore getUserRecordIDName](self, "getUserRecordIDName");
        if (v8) {
          LOBYTE(v8) = objc_msgSend( v8,  "isEqualToString:",  objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName")) ^ 1;
        }
        -[CLWifiAssociatedApCentroidSyncedDataStore deleteSyncEngineMetadata](self, "deleteSyncEngineMetadata");
        if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
        {
          if ((v8 & 1) != 0)
          {
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            int v9 = (os_log_s *)qword_101934858;
            if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)std::stringbuf::string_type buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User switched account",  buf,  2u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934850 != -1) {
                dispatch_once(&qword_101934850, &stru_101856C28);
              }
              *(_WORD *)uint64_t v27 = 0;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User switched account",  v27,  2);
              id v23 = (uint8_t *)v22;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]",  "%s\n",  v22);
              if (v23 != buf) {
                free(v23);
              }
            }

            sub_1009EEBA4((uint64_t)self->_centroidDb.__ptr_.__value_);
          }

          else
          {
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            char v18 = (os_log_s *)qword_101934858;
            if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)std::stringbuf::string_type buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in with same account",  buf,  2u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_101934850 != -1) {
                dispatch_once(&qword_101934850, &stru_101856C28);
              }
              *(_WORD *)uint64_t v27 = 0;
              _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in with same account",  v27,  2);
              id v25 = (uint8_t *)v24;
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]",  "%s\n",  v24);
              if (v25 != buf) {
                free(v25);
              }
            }
          }
        }

        -[CLWifiAssociatedApCentroidSyncedDataStore setUserRecordIDName:]( self,  "setUserRecordIDName:",  objc_msgSend(objc_msgSend(v6, "currentUser"), "recordName"));
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        uint64_t v19 = (os_log_s *)qword_101934858;
        if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::stringbuf::string_type buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in.",  buf,  2u);
        }

        if (!sub_1002921D0(115, 2)) {
          return;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        *(_WORD *)uint64_t v27 = 0;
        LODWORD(v26) = 2;
        double v17 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed in.",  v27,  v26,  *(void *)v27);
        goto LABEL_57;
      }

      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      id v15 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::stringbuf::string_type buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed out.",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101856C28);
        }
        *(_WORD *)uint64_t v27 = 0;
        double v17 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, iCloud account change. User signed out.",  v27,  2,  *(void *)v27);
LABEL_57:
        id v13 = v16;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]",  "%s\n",  v17);
LABEL_58:
        if (v13 != buf) {
          free(v13);
        }
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v10 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138412290;
      id v29 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineAccountChangeEvent (%@)",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      *(_DWORD *)uint64_t v27 = 138412290;
      *(void *)&v27[4] = a3;
      double v11 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineAccountChangeEvent (%@)",  v27,  12);
      id v13 = v12;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleAccountChange:]",  "%s\n",  v11);
      goto LABEL_58;
    }
  }

- (void)handleFetchedDatabaseChanges:(id)a3
{
  id v4 = [a3 fetchedDatabaseChangesEvent];
  if (v4)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v33 = v4;
    id v5 = [v4 modifications];
    id v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v39;
      do
      {
        int v9 = 0LL;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v9);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          double v11 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::stringbuf::string_type buf = 138477827;
            id v47 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone modification %{private}@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            int v44 = 138477827;
            id v45 = v10;
            LODWORD(v32) = 12;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone modification %{private}@",  &v44,  v32);
            id v13 = (uint8_t *)v12;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]",  "%s\n",  v12);
            if (v13 != buf) {
              free(v13);
            }
          }

          int v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v14 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
        id v7 = v14;
      }

      while (v14);
    }

    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v15 = [v33 deletions];
    id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        uint64_t v19 = 0LL;
        do
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v19);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          double v21 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::stringbuf::string_type buf = 138477827;
            id v47 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone deletion %{private}@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            int v44 = 138477827;
            id v45 = v20;
            LODWORD(v32) = 12;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecordZone deletion %{private}@",  &v44,  v32);
            id v23 = (uint8_t *)v22;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]",  "%s\n",  v22);
            if (v23 != buf) {
              free(v23);
            }
          }

          uint64_t v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v24 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
        id v17 = v24;
      }

      while (v24);
    }

    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v25 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, Fetched database changes event",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      LOWORD(v44) = 0;
      LODWORD(v32) = 2;
      double v26 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, Fetched database changes event",  &v44,  v32);
      v28 = v27;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]",  "%s\n",  v26);
LABEL_53:
      if (v28 != buf) {
        free(v28);
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v29 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v47 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedDatabaseChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v44 = 138477827;
      id v45 = a3;
      double v30 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedDatabaseChangesEvent: %{private}@",  &v44,  12);
      v28 = v31;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedDatabaseChanges:]",  "%s\n",  v30);
      goto LABEL_53;
    }
  }

- (void)handleFetchedRecordZoneChanges:(id)a3
{
  id v5 = [a3 fetchedRecordZoneChangesEvent];
  if (v5)
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v34 = v5;
    id v6 = [v5 modifications];
    id v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v40;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v10);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          id v12 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::stringbuf::string_type buf = 138477827;
            id v48 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecord modification: %{private}@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            int v45 = 138477827;
            id v46 = v11;
            LODWORD(v33) = 12;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecord modification: %{private}@",  &v45,  v33);
            id v14 = (uint8_t *)v13;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]",  "%s\n",  v13);
            if (v14 != buf) {
              free(v14);
            }
          }

          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]( self,  "handleFetchedRecordModification:",  v11);
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v15 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
        id v8 = v15;
      }

      while (v15);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v16 = [v34 deletions];
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v36;
      do
      {
        uint64_t v20 = 0LL;
        do
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v20);
          if (qword_101934850 != -1) {
            dispatch_once(&qword_101934850, &stru_101856C28);
          }
          int v22 = (os_log_s *)qword_101934858;
          if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::stringbuf::string_type buf = 138477827;
            id v48 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecord deletion: %{private}@",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_101934850 != -1) {
              dispatch_once(&qword_101934850, &stru_101856C28);
            }
            int v45 = 138477827;
            id v46 = v21;
            LODWORD(v33) = 12;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, CKRecord deletion: %{private}@",  &v45,  v33);
            id v24 = (uint8_t *)v23;
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]",  "%s\n",  v23);
            if (v24 != buf) {
              free(v24);
            }
          }

          -[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]( self,  "handleFetchedRecordDeletion:",  v21);
          uint64_t v20 = (char *)v20 + 1;
        }

        while (v18 != v20);
        id v25 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
        id v18 = v25;
      }

      while (v25);
    }

    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v26 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, Fetched record zone event",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      LOWORD(v45) = 0;
      LODWORD(v33) = 2;
      double v27 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, Fetched record zone event",  &v45,  v33);
      id v29 = v28;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]",  "%s\n",  v27);
LABEL_53:
      if (v29 != buf) {
        free(v29);
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v30 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v48 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v45 = 138477827;
      id v46 = a3;
      double v31 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineFetchedRecordZoneChangesEvent: %{private}@",  &v45,  12);
      id v29 = v32;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordZoneChanges:]",  "%s\n",  v31);
      goto LABEL_53;
    }
  }

- (void)handleFetchedRecordModification:(id)a3
{
  if (!a3)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v12 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordModification",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordModification",  &v18,  2);
    double v11 = (uint8_t *)v13;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]",  "%s\n",  v13);
    goto LABEL_41;
  }

  id v5 = [a3 recordType];
  if (!v5 || ([v5 isEqualToString:@"WifiAssociatedApCentroid"] & 1) == 0)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v8 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v21 = [a3 recordType];
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v9 = qword_101934858;
    int v18 = 138477827;
    id v19 = [a3 recordType];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@",  &v18,  12);
    double v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]",  "%s\n",  v10);
    if (v11 == buf) {
      return;
    }
LABEL_42:
    free(v11);
    return;
  }

  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v21 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, inserting record %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v18 = 138477827;
      id v19 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, inserting record %{private}@",  &v18,  12);
      id v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    value = self->_centroidDb.__ptr_.__value_;
    sub_1006073A0((uint64_t)buf, a3);
    sub_1009ECAC0((uint64_t)value, (uint64_t)buf);
    sub_100607C80(buf);
    return;
  }

  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  id v14 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordModification",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordModification",  &v18,  2);
    double v11 = (uint8_t *)v17;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordModification:]",  "%s\n",  v17);
LABEL_41:
    if (v11 == buf) {
      return;
    }
    goto LABEL_42;
  }

- (void)handleFetchedRecordDeletion:(id)a3
{
  if (!a3)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v11 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::stringbuf::string_type buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordDeletion",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    *(_WORD *)id v16 = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, warning, nil record in handleFetchedRecordDeletion",  v16,  2,  *(void *)v16);
    goto LABEL_41;
  }

  id v5 = [a3 recordType];
  if (!v5 || ([v5 isEqualToString:@"WifiAssociatedApCentroid"] & 1) == 0)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v7 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v18 = [a3 recordType];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@",  buf,  0xCu);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v8 = qword_101934858;
    *(_DWORD *)id v16 = 138477827;
    *(void *)&v16[4] = [a3 recordType];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, ignoring record type: %{private}@",  v16,  12);
    id v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]",  "%s\n",  v9);
    if (v10 == buf) {
      return;
    }
LABEL_42:
    free(v10);
    return;
  }

  if (-[CLWifiAssociatedApCentroidSyncedDataStore isCentroidDatabaseValid](self, "isCentroidDatabaseValid"))
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v18 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, deleting record %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      *(_DWORD *)id v16 = 138477827;
      *(void *)&v16[4] = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, deleting record %{private}@",  v16,  12);
      id v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    sub_1009EE7D8((uint64_t)self->_centroidDb.__ptr_.__value_, [a3 recordID]);
    return;
  }

  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  id v13 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordDeletion",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    *(_WORD *)id v16 = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "[CloudKit] WifiAssociatedApCentroidStore, warning, invalid database in handleFetchedRecordDeletion",  v16,  2,  *(void *)v16);
LABEL_41:
    id v10 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleFetchedRecordDeletion:]",  "%s\n",  v12);
    if (v10 == buf) {
      return;
    }
    goto LABEL_42;
  }

- (void)handleSentDatabaseChanges:(id)a3
{
  id v5 = [a3 sentDatabaseChangesEvent];
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(objc_msgSend(v5, "savedZones"), "enumerateObjectsUsingBlock:", &stru_101856BC8);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1007E788C;
    v11[3] = &unk_10182E8B8;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedZoneIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1007E7A58;
    v10[3] = &unk_10182E8E0;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedZoneSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedZoneDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_101856BE8);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v7 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentDatabaseChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v12 = 138477827;
      id v13 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentDatabaseChangesEvent: %{private}@",  &v12,  12);
      uint64_t v9 = (uint8_t *)v8;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentDatabaseChanges:]",  "%s\n",  v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

- (void)handleSentRecordZoneChanges:(id)a3
{
  id v5 = [a3 sentRecordZoneChangesEvent];
  if (v5)
  {
    id v6 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1007E810C;
    v12[3] = &unk_10182E850;
    v12[4] = self;
    objc_msgSend(objc_msgSend(v5, "savedRecords"), "enumerateObjectsUsingBlock:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1007E8418;
    v11[3] = &unk_10182E948;
    v11[4] = self;
    objc_msgSend(objc_msgSend(v6, "deletedRecordIDs"), "enumerateObjectsUsingBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1007E8718;
    v10[3] = &unk_10182E970;
    v10[4] = self;
    objc_msgSend(objc_msgSend(v6, "failedRecordSaves"), "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(objc_msgSend(v6, "failedRecordDeletes"), "enumerateKeysAndObjectsUsingBlock:", &stru_101856C08);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v7 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentRecordZoneChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v13 = 138477827;
      id v14 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineSentRecordZoneChangesEvent: %{private}@",  &v13,  12);
      uint64_t v9 = (uint8_t *)v8;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleSentRecordZoneChanges:]",  "%s\n",  v8);
      if (v9 != buf) {
        free(v9);
      }
    }
  }

- (void)handleWillFetchChanges:(id)a3
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  uint64_t v3 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch changes",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch changes",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchChanges:]",  "%s\n",  v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)handleWillFetchRecordZoneChanges:(id)a3
{
  id v4 = [a3 willFetchRecordZoneChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138543362;
      id v17 = [v5 zoneID];
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch zone changes for zoneID %{public}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v7 = qword_101934858;
      int v14 = 138543362;
      id v15 = [v5 zoneID];
      double v8 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine is about to fetch zone changes for zoneID %{public}@",  &v14,  12);
      id v10 = v9;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]",  "%s\n",  v8);
LABEL_19:
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v11 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v17 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v14 = 138477827;
      id v15 = a3;
      double v12 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillFetchRecordZoneChangesEv ent: %{private}@",  &v14,  12);
      id v10 = v13;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillFetchRecordZoneChanges:]",  "%s\n",  v12);
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
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      id v6 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::stringbuf::string_type buf = 138543618;
        id v22 = [v5 zoneID];
        __int16 v23 = 2114;
        id v24 = [v5 error];
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Error fetching record zone changes for %{public}@. Error: %{public}@",  buf,  0x16u);
      }

      if (!sub_1002921D0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v7 = qword_101934858;
      int v17 = 138543618;
      id v18 = [v5 zoneID];
      __int16 v19 = 2114;
      id v20 = [v5 error];
      double v8 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Error fetching record zone changes for %{public}@. Error: %{public}@",  &v17,  22);
      id v10 = v9;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]",  "%s\n",  v8);
    }

    else
    {
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v13 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::stringbuf::string_type buf = 138543362;
        id v22 = [v5 zoneID];
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine successfully fetched zone changes for zoneID %{public}@",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      uint64_t v14 = qword_101934858;
      int v17 = 138543362;
      id v18 = [v5 zoneID];
      double v15 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v14,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine successfully fetched zone changes for zoneID %{public}@",  &v17,  12);
      id v10 = v16;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]",  "%s\n",  v15);
    }

    if (v10 != buf) {
LABEL_30:
    }
      free(v10);
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    double v11 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 138477827;
      id v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent: %{private}@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101856C28);
      }
      int v17 = 138477827;
      id v18 = a3;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidFetchRecordZoneChangesEvent: %{private}@",  &v17,  12);
      id v10 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchRecordZoneChanges:]",  "%s\n",  v12);
      if (v10 != buf) {
        goto LABEL_30;
      }
    }
  }

- (void)handleDidFetchChanges:(id)a3
{
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  uint64_t v3 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)std::stringbuf::string_type buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did fetch changes",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did fetch changes",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidFetchChanges:]",  "%s\n",  v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void)handleWillSendChanges:(id)a3
{
  id v4 = [a3 willSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine will send changes. Reason: %d",  buf,  8u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v7 = qword_101934858;
    int v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine will send changes. Reason: %d",  &v12);
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]",  "%s\n",  v8);
    if (v9 == buf) {
      return;
    }
LABEL_20:
    free(v9);
    return;
  }

  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  id v10 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::stringbuf::string_type buf = 138477827;
    id v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillSendChangesEvent: %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    int v12 = 138477827;
    id v13 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineWillSendChangesEvent: %{private}@",  &v12,  12);
    uint64_t v9 = (uint8_t *)v11;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleWillSendChanges:]",  "%s\n",  v11);
    if (v9 != buf) {
      goto LABEL_20;
    }
  }

- (void)handleDidSendChanges:(id)a3
{
  id v4 = [a3 didSendChangesEvent];
  if (v4)
  {
    id v5 = v4;
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    id v6 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::stringbuf::string_type buf = 67109120;
      LODWORD(v15) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did send changes. Reason: %d",  buf,  8u);
    }

    if (!sub_1002921D0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    uint64_t v7 = qword_101934858;
    int v12 = 67109120;
    LODWORD(v13) = objc_msgSend(objc_msgSend(v5, "context"), "reason");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  2LL,  "[CloudKit] WifiAssociatedApCentroidStore, Sync engine did send changes. Reason: %d",  &v12);
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]",  "%s\n",  v8);
    if (v9 == buf) {
      return;
    }
LABEL_20:
    free(v9);
    return;
  }

  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101856C28);
  }
  id v10 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::stringbuf::string_type buf = 138477827;
    id v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidSendChangesEvent: %{private}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101856C28);
    }
    int v12 = 138477827;
    id v13 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  16LL,  "[CloudKit] WifiAssociatedApCentroidStore, Called back for invalid CKSyncEngineDidSendChangesEvent: %{private}@",  &v12,  12);
    uint64_t v9 = (uint8_t *)v11;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLWifiAssociatedApCentroidSyncedDataStore handleDidSendChanges:]",  "%s\n",  v11);
    if (v9 != buf) {
      goto LABEL_20;
    }
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
  value = self->_centroidDb.__ptr_.__value_;
  self->_centroidDb.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CLWifiAssociatedApCentroidDatabase *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  id v6 = self->_metadataDb.__ptr_.__value_;
  p_metadataDb = &self->_metadataDb;
  uint64_t v4 = (uint64_t)v6;
  p_metadataDb->__ptr_.__value_ = 0LL;
  if (v6) {
    sub_1007EA2A4((uint64_t)p_metadataDb, v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end