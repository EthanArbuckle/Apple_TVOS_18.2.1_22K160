@interface CLWifiAssociatedApCentroidKVStore
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordsOlderThan:(double)a3;
- (BOOL)isEmpty;
- (BOOL)purgeOlderRecords;
- (CLWifiAssociatedApCentroidKVStoreDictionary)getKVStoreDictionary;
- (NSUbiquitousKeyValueStore)kvStore;
- (basic_string<char,)getBasicInfo;
- (id)fetchRecord:(id)a3;
- (id)getSampleMacs:(int)a3;
- (id)initKVStore;
- (int)count;
- (void)addRecord:(id)a3;
- (void)deleteRecordsByMac:(id)a3;
@end

@implementation CLWifiAssociatedApCentroidKVStore

- (id)initKVStore
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLWifiAssociatedApCentroidKVStore;
  v2 = -[CLWifiAssociatedApCentroidKVStore init](&v9, "init");
  if (v2)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101877158);
    }
    v3 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WifiAssociatedApCentroidStore, init", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101877158);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "WifiAssociatedApCentroidStore, init",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWifiAssociatedApCentroidKVStore initKVStore]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }

    v4 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  @"com.apple.locationd.clx",  2LL);
    v2->_kvStore = v4;
    -[NSUbiquitousKeyValueStore synchronize](v4, "synchronize");
    *(void *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](v2, "getKVStoreDictionary");
    sub_100A18094((id *)buf);
  }

  return v2;
}

- (CLWifiAssociatedApCentroidKVStoreDictionary)getKVStoreDictionary
{
  return v3;
}

- (void)addRecord:(id)a3
{
}

- (BOOL)deleteAllRecords
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  CLWifiAssociatedApCentroidKVStoreDictionary v3 = -[NSDictionary allKeys]( -[NSUbiquitousKeyValueStore dictionaryRepresentation]( -[CLWifiAssociatedApCentroidKVStore kvStore](self, "kvStore"),  "dictionaryRepresentation"),  "allKeys",  0LL);
  id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSUbiquitousKeyValueStore removeObjectForKey:]( self->_kvStore,  "removeObjectForKey:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  return 1;
}

- (void)deleteRecordsByMac:(id)a3
{
  if (-[NSDictionary objectForKey:]( -[NSUbiquitousKeyValueStore dictionaryRepresentation]( -[CLWifiAssociatedApCentroidKVStore kvStore](self, "kvStore"),  "dictionaryRepresentation"),  "objectForKey:",  a3))
  {
    -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvStore, "removeObjectForKey:", a3);
  }

- (BOOL)deleteRecordsOlderThan:(double)a3
{
  double v14 = a3;
  *(void *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  sub_100A17958((id *)buf, &v14, (void **)&v12);
  id v4 = v12;
  id v5 = v13;
  if (v12 != v13)
  {
    do
    {
      uint64_t v6 = *v4;
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101877158);
      }
      v7 = (os_log_s *)qword_101934858;
      if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(void *)&buf[4] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "WifiAssociatedApCentroidStore, deleting %{private}@ from key-value store",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934850 != -1) {
          dispatch_once(&qword_101934850, &stru_101877158);
        }
        int v15 = 138477827;
        uint64_t v16 = v6;
        LODWORD(v11) = 12;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "WifiAssociatedApCentroidStore, deleting %{private}@ from key-value store",  &v15,  v11);
        __int128 v9 = (char *)v8;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiAssociatedApCentroidKVStore deleteRecordsOlderThan:]",  "%s\n",  v8);
        if (v9 != buf) {
          free(v9);
        }
      }

      -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_kvStore, "removeObjectForKey:", v6);
      ++v4;
    }

    while (v4 != v5);
    id v4 = v12;
  }

  if (v4)
  {
    v13 = v4;
    operator delete(v4);
  }

  return 1;
}

- (BOOL)purgeOlderRecords
{
  *(void *)buf = -[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  double v3 = sub_100A17D48((id *)buf);
  id v4 = (uint64_t *)sub_100F4BF44();
  double v5 = sub_100F4CB14(v4);
  if (v3 < v5) {
    return 1;
  }
  double v7 = v5;
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101877158);
  }
  v8 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283777;
    *(double *)&buf[4] = v7;
    __int16 v16 = 2049;
    double v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "WifiAssociatedApCentroidStore, purging records older than %{private}.1f, oldest age, %{private}.1f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101877158);
    }
    int v11 = 134283777;
    double v12 = v7;
    __int16 v13 = 2049;
    double v14 = v3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "WifiAssociatedApCentroidStore, purging records older than %{private}.1f, oldest age, %{private}.1f",  &v11,  22);
    __int128 v10 = (char *)v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWifiAssociatedApCentroidKVStore purgeOlderRecords]", "%s\n", v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  return -[CLWifiAssociatedApCentroidKVStore deleteRecordsOlderThan:](self, "deleteRecordsOlderThan:", v7);
}

- (id)fetchRecord:(id)a3
{
  v7.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  sub_100A17B84(&v7.var0, (uint64_t)a3, (uint64_t)v8);
  if (v9)
  {
    id v4 = objc_alloc(&OBJC_CLASS___CLWifiAssociatedApCentroidDO);
    double v5 = -[CLWifiAssociatedApCentroidDO initWithNSDictionary:](v4, "initWithNSDictionary:", v8[0]);
  }

  else
  {
    double v5 = 0LL;
  }

  sub_100A184F0((uint64_t)v8);
  return v5;
}

- (int)count
{
  v3.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  return sub_100A17940(&v3.var0);
}

- (BOOL)isEmpty
{
  return -[CLWifiAssociatedApCentroidKVStore count](self, "count") == 0;
}

- (id)getSampleMacs:(int)a3
{
  v5.var0 = (id)-[CLWifiAssociatedApCentroidKVStore getKVStoreDictionary](self, "getKVStoreDictionary");
  return (id)sub_100A17D1C(&v5.var0, a3);
}

- (basic_string<char,)getBasicInfo
{
  id v4 = [v1 getKVStoreDictionary];
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100A17E84( &v4,  (std::stringbuf::string_type *)retstr);
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

@end