@interface HHDSqlitePersistence
+ (id)defaultPersistence;
- (BOOL)_openDefaultDatabase;
- (BOOL)removeBubble:(id)a3;
- (BOOL)removeEndpoint:(id)a3;
- (BOOL)saveBubble:(id)a3 error:(id *)a4;
- (BOOL)saveEndpoint:(id)a3 error:(id *)a4;
- (BOOL)updateStateForBubble:(id)a3 state:(unint64_t)a4 error:(id *)a5;
- (BOOL)updateStateForEndpoint:(id)a3 state:(unint64_t)a4 error:(id *)a5;
- (HHDSqlitePersistence)init;
- (id)allBubbles;
- (id)allEndpoints;
- (int)_getDatabaseVersion;
- (sqlite3_stmt)_prepareQuery:(const char *)a3;
- (void)_checkDatabase;
- (void)_upgradeDatabaseFromVersion:(int)a3;
- (void)bootstrapWithServiceRegistry:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation HHDSqlitePersistence

+ (id)defaultPersistence
{
  return objc_alloc_init(&OBJC_CLASS___HHDSqlitePersistence);
}

- (HHDSqlitePersistence)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HHDSqlitePersistence;
  return -[HHDSqlitePersistence init](&v3, "init");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HHDSqlitePersistence;
  -[HHDSqlitePersistence dealloc](&v3, "dealloc");
}

- (void)bootstrapWithServiceRegistry:(id)a3
{
  if (!self->_database) {
    -[HHDSqlitePersistence _openDefaultDatabase](self, "_openDefaultDatabase", a3);
  }
}

- (void)close
{
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0LL;
  }

- (id)allBubbles
{
  objc_super v3 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "SELECT instances.instance_id, state  FROM instances;");
  if (!v3)
  {
    database = self->_database;
    id v17 = sub_10000F1A4();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (database)
    {
      if (v19)
      {
        v20 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 138412546;
        v25 = &stru_100024E50;
        __int16 v26 = 2080;
        id v27 = (id)v20;
        v21 = "%@[All Bubbles] Failed to prepare select statement; %s";
        v22 = v18;
        uint32_t v23 = 22;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
      }
    }

    else if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v25 = &stru_100024E50;
      v21 = "%@[All Bubbles] Failed to prepare select statement[null database]";
      v22 = v18;
      uint32_t v23 = 12;
      goto LABEL_17;
    }

    return (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  while (sqlite3_step(v4) == 100)
  {
    v6 = sqlite3_column_text(v4, 0);
    v7 = objc_alloc(&OBJC_CLASS___NSUUID);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

    v10 = -[HHDBubble initWithIdentifier:state:]( objc_alloc(&OBJC_CLASS___HHDBubble),  "initWithIdentifier:state:",  v9,  sqlite3_column_int64(v4, 1));
    id v11 = sub_10000F1A4();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v25 = &stru_100024E50;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@[All Bubbles] loaded %@", buf, 0x16u);
      }

      [v5 addObject:v10];
    }

    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = &stru_100024E50;
        __int16 v26 = 2114;
        id v27 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@[All Bubbles] skipping row due invalid id(%{public}@)",  buf,  0x16u);
      }
    }
  }

  sqlite3_finalize(v4);
  id v14 = [v5 copy];

  return v14;
}

- (BOOL)removeBubble:(id)a3
{
  id v4 = a3;
  v5 = -[HHDSqlitePersistence _prepareQuery:](self, "_prepareQuery:", "DELETE FROM instances WHERE instance_id=?1");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      id v10 = objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      sqlite3_bind_text( v6,  1,  (const char *)[v10 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v6, 1);
    }

    int v19 = sqlite3_step(v6);
    database = self->_database;
    BOOL v21 = v19 == 101;
    if (v19 != 101)
    {
      id v27 = sub_10000F1A4();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (database)
      {
        if (v29)
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue([v4 identifier]);
          v31 = sqlite3_errmsg(self->_database);
          int v35 = 138412802;
          v36 = &stru_100024E50;
          __int16 v37 = 2114;
          v38 = v30;
          __int16 v39 = 2080;
          v40 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%@[Instance Delete] Bubble with id '%{public}@' failed to delete; %s",
            (uint8_t *)&v35,
            0x20u);
        }

        goto LABEL_26;
      }

      if (v29)
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        int v35 = 138412546;
        v36 = &stru_100024E50;
        __int16 v37 = 2114;
        v38 = v25;
        __int16 v26 = "%@[Instance Delete] Bubble with id '%{public}@' failed to delete[null database]";
        v32 = v28;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        goto LABEL_25;
      }

- (BOOL)saveBubble:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "INSERT INTO instances (instance_id, state) VALUES (?1, ?2);");
  if (v7)
  {
    v8 = v7;
    if (a4) {
      *a4 = 0LL;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v12 = objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      sqlite3_bind_text( v8,  1,  (const char *)[v12 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v8, 1);
    }

    sqlite3_bind_int64(v8, 2, (sqlite3_int64)[v6 state]);
    int v21 = sqlite3_step(v8);
    BOOL v22 = v21 == 101;
    if (v21 == 101)
    {
      id v23 = sub_10000F1A4();
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        int v34 = 138412546;
        int v35 = &stru_100024E50;
        __int16 v36 = 2114;
        __int16 v37 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%@[Instance Insert] Instance with id '%{public}@' added",  (uint8_t *)&v34,  0x16u);
      }
    }

    else
    {
      database = self->_database;
      id v27 = sub_10000F1A4();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (database)
      {
        if (v29)
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue([v6 identifier]);
          v31 = sqlite3_errmsg(self->_database);
          int v34 = 138412802;
          int v35 = &stru_100024E50;
          __int16 v36 = 2114;
          __int16 v37 = v30;
          __int16 v38 = 2080;
          __int16 v39 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%@[Instance Insert] Instance with id '%{public}@' failed to insert; %s",
            (uint8_t *)&v34,
            0x20u);
        }
      }

      else if (v29)
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        int v34 = 138412546;
        int v35 = &stru_100024E50;
        __int16 v36 = 2114;
        __int16 v37 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%@[Instance Insert] Instance with id '%{public}@' failed to insert[null database]",  (uint8_t *)&v34,  0x16u);
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  1LL,  @"Failed to insert instance (maybe a duplicate?)"));
      }
    }

    sqlite3_finalize(v8);
    goto LABEL_29;
  }

  v13 = self->_database;
  id v14 = sub_10000F1A4();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (!v16) {
      goto LABEL_21;
    }
    id v17 = sqlite3_errmsg(self->_database);
    int v34 = 138412546;
    int v35 = &stru_100024E50;
    __int16 v36 = 2080;
    __int16 v37 = v17;
    uint32_t v18 = "%@[Instance Insert] Failed to prepare instance-insert statement; %s";
    int v19 = v15;
    uint32_t v20 = 22;
  }

  else
  {
    if (!v16) {
      goto LABEL_21;
    }
    int v34 = 138412290;
    int v35 = &stru_100024E50;
    uint32_t v18 = "%@[Instance Insert] Failed to prepare instance-insert statement[null database]";
    int v19 = v15;
    uint32_t v20 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, v20);
LABEL_21:

  BOOL v22 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  2LL,  @"Failed to create SQL statement"));
  }
LABEL_29:

  return v22;
}

- (BOOL)updateStateForBubble:(id)a3 state:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "UPDATE instances SET state = ?1 WHERE instance_id = ?2;");
  if (v9)
  {
    id v10 = v9;
    if (a5) {
      *a5 = 0LL;
    }
    sqlite3_bind_int64(v9, 1, a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    if (v11)
    {
      id v12 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      sqlite3_bind_text( v10,  2,  (const char *)[v12 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v10, 2);
    }

    int v21 = sqlite3_step(v10);
    BOOL v22 = v21 == 101;
    if (v21 == 101)
    {
      id v23 = sub_10000F1A4();
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412802;
        int v35 = &stru_100024E50;
        __int16 v36 = 2114;
        __int16 v37 = (const char *)v8;
        __int16 v38 = 2048;
        unint64_t v39 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%@[Instance Update] Instance with id '%{public}@' updated with state %lu",  (uint8_t *)&v34,  0x20u);
      }

      goto LABEL_29;
    }

    database = self->_database;
    id v26 = sub_10000F1A4();
    id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (database)
    {
      if (!v28) {
        goto LABEL_27;
      }
      BOOL v29 = sqlite3_errmsg(self->_database);
      int v34 = 138412802;
      int v35 = &stru_100024E50;
      __int16 v36 = 2114;
      __int16 v37 = (const char *)v8;
      __int16 v38 = 2080;
      unint64_t v39 = (unint64_t)v29;
      v30 = "%@[Instance Update] Instance with id '%{public}@' failed to update; %s";
      v31 = v27;
      uint32_t v32 = 32;
    }

    else
    {
      if (!v28) {
        goto LABEL_27;
      }
      int v34 = 138412546;
      int v35 = &stru_100024E50;
      __int16 v36 = 2114;
      __int16 v37 = (const char *)v8;
      v30 = "%@[Instance Update] Instance with id '%{public}@' failed to update[null database]";
      v31 = v27;
      uint32_t v32 = 22;
    }

    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v34, v32);
LABEL_27:

    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  1LL,  @"Failed to update instance state"));
    }
LABEL_29:
    sqlite3_finalize(v10);
    goto LABEL_30;
  }

  v13 = self->_database;
  id v14 = sub_10000F1A4();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (!v16) {
      goto LABEL_21;
    }
    id v17 = sqlite3_errmsg(self->_database);
    int v34 = 138412546;
    int v35 = &stru_100024E50;
    __int16 v36 = 2080;
    __int16 v37 = v17;
    uint32_t v18 = "%@[Instance Update] Failed to prepare instance-update statement; %s";
    int v19 = v15;
    uint32_t v20 = 22;
  }

  else
  {
    if (!v16) {
      goto LABEL_21;
    }
    int v34 = 138412290;
    int v35 = &stru_100024E50;
    uint32_t v18 = "%@[Instance Update] Failed to prepare instance-update statement[null database]";
    int v19 = v15;
    uint32_t v20 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, v20);
LABEL_21:

  BOOL v22 = 0;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  2LL,  @"Failed to create SQL statement"));
  }
LABEL_30:

  return v22;
}

- (id)allEndpoints
{
  objc_super v3 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "SELECT endpoints.accessory_uuid, media_route_id, instance_id, state  FROM endpoints;");
  if (!v3)
  {
    database = self->_database;
    id v28 = sub_10000F1A4();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (database)
    {
      if (v30)
      {
        v31 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 138412546;
        __int16 v37 = &stru_100024E50;
        __int16 v38 = 2080;
        unint64_t v39 = (void *)v31;
        uint32_t v32 = "%@[All Endpoints] Failed to prepare select statement; %s";
        os_log_type_t v33 = v29;
        uint32_t v34 = 22;
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
      }
    }

    else if (v30)
    {
      *(_DWORD *)buf = 138412290;
      __int16 v37 = &stru_100024E50;
      uint32_t v32 = "%@[All Endpoints] Failed to prepare select statement[null database]";
      os_log_type_t v33 = v29;
      uint32_t v34 = 12;
      goto LABEL_30;
    }

    return (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  id v4 = v3;
  int v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  while (sqlite3_step(v4) == 100)
  {
    v5 = sqlite3_column_text(v4, 0);
    id v6 = sqlite3_column_text(v4, 1);
    v7 = sqlite3_column_text(v4, 2);
    sqlite3_int64 v8 = sqlite3_column_int64(v4, 3);
    if (v5 && v6 && v7)
    {
      sqlite3_int64 v9 = v8;
      id v10 = objc_alloc(&OBJC_CLASS___NSUUID);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
      id v12 = -[NSUUID initWithUUIDString:](v10, "initWithUUIDString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
      id v14 = objc_alloc(&OBJC_CLASS___NSUUID);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
      BOOL v16 = -[NSUUID initWithUUIDString:](v14, "initWithUUIDString:", v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[HHDEndpoint endpointWithAccessoryId:mediaRouteId:bubbleId:state:]( &OBJC_CLASS___HHDEndpoint,  "endpointWithAccessoryId:mediaRouteId:bubbleId:state:",  v12,  v13,  v16,  v9));

      id v18 = sub_10000F1A4();
      int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      uint32_t v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v37 = &stru_100024E50;
          __int16 v38 = 2112;
          unint64_t v39 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@[All Endpoints] loaded %@", buf, 0x16u);
        }

        [v35 addObject:v17];
      }

      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v37 = &stru_100024E50;
          __int16 v38 = 2080;
          unint64_t v39 = (void *)v7;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@[All Endpoints] skipping row due invalid id(%s)",  buf,  0x16u);
        }
      }
    }

    else
    {
      id v21 = sub_10000F1A4();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        BOOL v22 = "<nil>";
        if (v5) {
          id v23 = (const char *)v5;
        }
        else {
          id v23 = "<nil>";
        }
        *(_DWORD *)buf = 138413058;
        __int16 v37 = &stru_100024E50;
        if (v6) {
          BOOL v24 = (const char *)v6;
        }
        else {
          BOOL v24 = "<nil>";
        }
        __int16 v38 = 2080;
        if (v7) {
          BOOL v22 = (const char *)v7;
        }
        unint64_t v39 = (void *)v23;
        __int16 v40 = 2080;
        v41 = v24;
        __int16 v42 = 2080;
        v43 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@[All Endpoints] skipping row due invalid id(accessory uuid=%s, media route=%s, instance=%s)",  buf,  0x2Au);
      }
    }
  }

  sqlite3_finalize(v4);
  id v25 = [v35 copy];

  return v25;
}

- (BOOL)saveEndpoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "INSERT INTO endpoints (accessory_uuid, media_route_id, instance_id, state) VALUES (?1, ?2, ?3, ?4);");
  if (v7)
  {
    sqlite3_int64 v8 = v7;
    if (a4) {
      *a4 = 0LL;
    }
    sqlite3_int64 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
      id v12 = objc_claimAutoreleasedReturnValue([v11 UUIDString]);
      sqlite3_bind_text( v8,  1,  (const char *)[v12 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v8, 1);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaRouteId]);

    if (v21)
    {
      id v22 = objc_claimAutoreleasedReturnValue([v6 mediaRouteId]);
      sqlite3_bind_text( v8,  2,  (const char *)[v22 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v8, 2);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 launchInstanceId]);
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 UUIDString]);

    if (v24)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 launchInstanceId]);
      id v26 = objc_claimAutoreleasedReturnValue([v25 UUIDString]);
      sqlite3_bind_text( v8,  3,  (const char *)[v26 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v8, 3);
    }

    sqlite3_bind_int64(v8, 4, (sqlite3_int64)[v6 state]);
    int v27 = sqlite3_step(v8);
    BOOL v28 = v27 == 101;
    if (v27 == 101)
    {
      id v29 = sub_10000F1A4();
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
        int v40 = 138412546;
        v41 = &stru_100024E50;
        __int16 v42 = 2114;
        v43 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%@[Endpoint Insert] Endpoint with id '%{public}@' added",  (uint8_t *)&v40,  0x16u);
      }
    }

    else
    {
      database = self->_database;
      id v33 = sub_10000F1A4();
      uint32_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      if (database)
      {
        if (v35)
        {
          __int16 v36 = (char *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
          __int16 v37 = sqlite3_errmsg(self->_database);
          int v40 = 138412802;
          v41 = &stru_100024E50;
          __int16 v42 = 2114;
          v43 = v36;
          __int16 v44 = 2080;
          v45 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%@[Endpoint Insert] Endpoint with id '%{public}@' failed to insert; %s",
            (uint8_t *)&v40,
            0x20u);
        }
      }

      else if (v35)
      {
        __int16 v38 = (char *)objc_claimAutoreleasedReturnValue([v6 accessoryId]);
        int v40 = 138412546;
        v41 = &stru_100024E50;
        __int16 v42 = 2114;
        v43 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%@[Endpoint Insert] Endpoint with id '%{public}@' failed to insert[null database]",  (uint8_t *)&v40,  0x16u);
      }

      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  1LL,  @"Failed to insert endpoint (maybe a duplicate?)"));
      }
    }

    sqlite3_finalize(v8);
    goto LABEL_35;
  }

  v13 = self->_database;
  id v14 = sub_10000F1A4();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (!v16) {
      goto LABEL_27;
    }
    id v17 = sqlite3_errmsg(self->_database);
    int v40 = 138412546;
    v41 = &stru_100024E50;
    __int16 v42 = 2080;
    v43 = v17;
    id v18 = "%@[Endpoint Insert] Failed to prepare bubble-insert statement; %s";
    int v19 = v15;
    uint32_t v20 = 22;
  }

  else
  {
    if (!v16) {
      goto LABEL_27;
    }
    int v40 = 138412290;
    v41 = &stru_100024E50;
    id v18 = "%@[Endpoint Insert] Failed to prepare bubble-insert statement[null database]";
    int v19 = v15;
    uint32_t v20 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v40, v20);
LABEL_27:

  BOOL v28 = 0;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  2LL,  @"Failed to create SQL statement"));
  }
LABEL_35:

  return v28;
}

- (BOOL)updateStateForEndpoint:(id)a3 state:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  sqlite3_int64 v9 = -[HHDSqlitePersistence _prepareQuery:]( self,  "_prepareQuery:",  "UPDATE endpoints SET state = ?1 WHERE accessory_uuid = ?2;");
  if (v9)
  {
    id v10 = v9;
    if (a5) {
      *a5 = 0LL;
    }
    sqlite3_bind_int64(v9, 1, a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    if (v11)
    {
      id v12 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
      sqlite3_bind_text( v10,  2,  (const char *)[v12 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v10, 2);
    }

    int v21 = sqlite3_step(v10);
    BOOL v22 = v21 == 101;
    if (v21 == 101)
    {
      id v23 = sub_10000F1A4();
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412802;
        BOOL v35 = &stru_100024E50;
        __int16 v36 = 2114;
        __int16 v37 = (const char *)v8;
        __int16 v38 = 2048;
        unint64_t v39 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%@[Endpoint Update] Endpoint with id '%{public}@' updated with state %lu",  (uint8_t *)&v34,  0x20u);
      }

      goto LABEL_29;
    }

    database = self->_database;
    id v26 = sub_10000F1A4();
    int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (database)
    {
      if (!v28) {
        goto LABEL_27;
      }
      id v29 = sqlite3_errmsg(self->_database);
      int v34 = 138412802;
      BOOL v35 = &stru_100024E50;
      __int16 v36 = 2114;
      __int16 v37 = (const char *)v8;
      __int16 v38 = 2080;
      unint64_t v39 = (unint64_t)v29;
      BOOL v30 = "%@[Endpoint Update] Endpoint with id '%{public}@' failed to update; %s";
      v31 = v27;
      uint32_t v32 = 32;
    }

    else
    {
      if (!v28) {
        goto LABEL_27;
      }
      int v34 = 138412546;
      BOOL v35 = &stru_100024E50;
      __int16 v36 = 2114;
      __int16 v37 = (const char *)v8;
      BOOL v30 = "%@[Endpoint Update] Endpoint with id '%{public}@' failed to update[null database]";
      v31 = v27;
      uint32_t v32 = 22;
    }

    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v34, v32);
LABEL_27:

    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  1LL,  @"Failed to update endpoint state"));
    }
LABEL_29:
    sqlite3_finalize(v10);
    goto LABEL_30;
  }

  v13 = self->_database;
  id v14 = sub_10000F1A4();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (!v16) {
      goto LABEL_21;
    }
    id v17 = sqlite3_errmsg(self->_database);
    int v34 = 138412546;
    BOOL v35 = &stru_100024E50;
    __int16 v36 = 2080;
    __int16 v37 = v17;
    id v18 = "%@[Endpoint Update] Failed to prepare endpoint-update statement; %s";
    int v19 = v15;
    uint32_t v20 = 22;
  }

  else
  {
    if (!v16) {
      goto LABEL_21;
    }
    int v34 = 138412290;
    BOOL v35 = &stru_100024E50;
    id v18 = "%@[Endpoint Update] Failed to prepare endpoint-update statement[null database]";
    int v19 = v15;
    uint32_t v20 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v34, v20);
LABEL_21:

  BOOL v22 = 0;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hhErrorWithCode:description:]( &OBJC_CLASS___NSError,  "hhErrorWithCode:description:",  2LL,  @"Failed to create SQL statement"));
  }
LABEL_30:

  return v22;
}

- (BOOL)removeEndpoint:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);

  if (!v5)
  {
    id v12 = sub_10000F1A4();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v37 = 138412290;
    __int16 v38 = &stru_100024E50;
    id v14 = "%@[Endpoint Delete] Trying to remove endpoint with no id";
LABEL_7:
    v15 = v13;
    uint32_t v16 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v37, v16);
    goto LABEL_12;
  }

  id v6 = -[HHDSqlitePersistence _prepareQuery:](self, "_prepareQuery:", "DELETE FROM endpoints WHERE accessory_uuid=?1");
  if (v6)
  {
    v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
    sqlite3_int64 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
      id v11 = objc_claimAutoreleasedReturnValue([v10 UUIDString]);
      sqlite3_bind_text( v7,  1,  (const char *)[v11 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }

    else
    {
      sqlite3_bind_null(v7, 1);
    }

    int v22 = sqlite3_step(v7);
    database = self->_database;
    BOOL v21 = v22 == 101;
    if (v22 != 101)
    {
      id v29 = sub_10000F1A4();
      BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (database)
      {
        if (v31)
        {
          uint32_t v32 = (char *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
          id v33 = sqlite3_errmsg(self->_database);
          int v37 = 138412802;
          __int16 v38 = &stru_100024E50;
          __int16 v39 = 2114;
          int v40 = v32;
          __int16 v41 = 2080;
          __int16 v42 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%@[Endpoint Delete] Endpoint with id '%{public}@' failed to delete; %s",
            (uint8_t *)&v37,
            0x20u);
        }

        goto LABEL_30;
      }

      if (v31)
      {
        int v27 = (char *)objc_claimAutoreleasedReturnValue([v4 accessoryId]);
        int v37 = 138412546;
        __int16 v38 = &stru_100024E50;
        __int16 v39 = 2114;
        int v40 = v27;
        BOOL v28 = "%@[Endpoint Delete] Endpoint with id '%{public}@' failed to delete[null database]";
        int v34 = v30;
        os_log_type_t v35 = OS_LOG_TYPE_ERROR;
        goto LABEL_29;
      }

- (BOOL)_openDefaultDatabase
{
  if (self->_database) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/private/var/mobile/Library/HomeHub/homehubd.sqlite"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByDeletingLastPathComponent]);
  id v19 = 0LL;
  unsigned int v7 = [v4 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v19];
  id v8 = v19;

  if (v7) {
    BOOL v9 = v8 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v18 = 0LL;
    int v12 = sqlite3_open_v2("/private/var/mobile/Library/HomeHub/homehubd.sqlite", &v18, 6, 0LL);
    BOOL v2 = v12 == 0;
    if (v12)
    {
      int v13 = v12;
      id v14 = sub_10000F1A4();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint32_t v16 = sqlite3_errstr(v13);
        *(_DWORD *)buf = 138412802;
        BOOL v21 = &stru_100024E50;
        __int16 v22 = 1024;
        LODWORD(v23[0]) = v13;
        WORD2(v23[0]) = 2082;
        *(void *)((char *)v23 + 6) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@Failed to open database; err=%d (%{public}s)",
          buf,
          0x1Cu);
      }
    }

    else
    {
      self->_database = v18;
      -[HHDSqlitePersistence _checkDatabase](self, "_checkDatabase");
    }
  }

  else
  {
    id v10 = sub_10000F1A4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v21 = &stru_100024E50;
      __int16 v22 = 2112;
      v23[0] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@Failed to open database: unable to create directory for it (error=%@)",  buf,  0x16u);
    }

    BOOL v2 = 0;
  }

  return v2;
}

- (sqlite3_stmt)_prepareQuery:(const char *)a3
{
  result = self->_database;
  if (result)
  {
    ppStmt = 0LL;
    if (sqlite3_prepare_v2(result, a3, -1, &ppStmt, 0LL)) {
      return 0LL;
    }
    else {
      return ppStmt;
    }
  }

  return result;
}

- (void)_checkDatabase
{
  uint64_t v3 = -[HHDSqlitePersistence _getDatabaseVersion](self, "_getDatabaseVersion");
}

- (void)_upgradeDatabaseFromVersion:(int)a3
{
  if (a3 != 4)
  {
    id v5 = sub_10000F1A4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = &stru_100024E50;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a3;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Upgrading database from version %d to version %d",  buf,  0x18u);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    int v27 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100011338;
    void v23[3] = &unk_100024B10;
    v23[4] = self;
    v23[5] = buf;
    unsigned int v7 = objc_retainBlock(v23);
    id v8 = sub_10000F1A4();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int v24 = 138412290;
      id v25 = &stru_100024E50;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@Purging all data from database", v24, 0xCu);
    }

    uint64_t v10 = _sqlite3_db_truncate(self->_database, 0LL);
    ((void (*)(void *, uint64_t))v7[2])(v7, v10);
    uint64_t v11 = _sqlite3_integrity_check("/private/var/mobile/Library/HomeHub/homehubd.sqlite");
    ((void (*)(void *, uint64_t))v7[2])(v7, v11);
    id v12 = sub_10000F1A4();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int v24 = 138412290;
      id v25 = &stru_100024E50;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@Creating tables", v24, 0xCu);
    }

    uint64_t v14 = sqlite3_exec(self->_database, "PRAGMA journal_mode = 'wal'", 0LL, 0LL, 0LL);
    ((void (*)(void *, uint64_t))v7[2])(v7, v14);
    uint64_t v15 = sqlite3_exec( self->_database,  "CREATE TABLE endpoints( accessory_uuid STRING PRIMARY KEY UNIQUE, media_route_id STRING, instance_id STRIN G, state INTEGER)",  0LL,  0LL,  0LL);
    ((void (*)(void *, uint64_t))v7[2])(v7, v15);
    uint64_t v16 = sqlite3_exec( self->_database,  "CREATE TABLE instances( instance_id STRING PRIMARY KEY UNIQUE, state INTEGER)",  0LL,  0LL,  0LL);
    ((void (*)(void *, uint64_t))v7[2])(v7, v16);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PRAGMA user_version = %d;",
                      4LL));
    database = self->_database;
    id v19 = v17;
    uint64_t v20 = sqlite3_exec(database, (const char *)[v19 UTF8String], 0, 0, 0);
    ((void (*)(void *, uint64_t))v7[2])(v7, v20);
    id v21 = sub_10000F1A4();
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v24 = 138412290;
      id v25 = &stru_100024E50;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%@Database initialization complete.",  v24,  0xCu);
    }

    _Block_object_dispose(buf, 8);
  }

- (int)_getDatabaseVersion
{
  uint64_t v3 = -[HHDSqlitePersistence _prepareQuery:](self, "_prepareQuery:", "PRAGMA user_version;");
  if (v3)
  {
    id v4 = v3;
    if (sqlite3_step(v3) == 100)
    {
      int v5 = sqlite3_column_int(v4, 0);
LABEL_18:
      sqlite3_finalize(v4);
      return v5;
    }

    database = self->_database;
    id v15 = sub_10000F1A4();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (database)
    {
      if (v17)
      {
        id v18 = sqlite3_errmsg(self->_database);
        int v23 = 138412546;
        int v24 = &stru_100024E50;
        __int16 v25 = 2080;
        BOOL v26 = v18;
        id v19 = "%@Failed to retrieve database version query (new database?); %s";
        uint64_t v20 = v16;
        uint32_t v21 = 22;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, v21);
      }
    }

    else if (v17)
    {
      int v23 = 138412290;
      int v24 = &stru_100024E50;
      id v19 = "%@Failed to retrieve database version query (new database?)[null database]";
      uint64_t v20 = v16;
      uint32_t v21 = 12;
      goto LABEL_16;
    }

    int v5 = 0;
    goto LABEL_18;
  }

  id v6 = self->_database;
  id v7 = sub_10000F1A4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v9)
    {
      uint64_t v10 = sqlite3_errmsg(self->_database);
      int v23 = 138412546;
      int v24 = &stru_100024E50;
      __int16 v25 = 2080;
      BOOL v26 = v10;
      uint64_t v11 = "%@ERROR: unable to prepare user_version query; %s";
      id v12 = v8;
      uint32_t v13 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v23, v13);
    }
  }

  else if (v9)
  {
    int v23 = 138412290;
    int v24 = &stru_100024E50;
    uint64_t v11 = "%@ERROR: unable to prepare user_version query[null database]";
    id v12 = v8;
    uint32_t v13 = 12;
    goto LABEL_12;
  }

  return 0;
}

@end