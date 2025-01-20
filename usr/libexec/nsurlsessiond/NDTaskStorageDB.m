@interface NDTaskStorageDB
- (BOOL)_createDBSchemaForPath:(id)a3;
- (BOOL)_onqueue_initDB;
- (BOOL)handleSchemaVersionChange;
- (BOOL)migrateSchemaToLatestVersion:(int64_t)a3;
- (id)_getAllSessionIDsForBundle:(id)a3;
- (id)_getAllTasksFromDBForSession:(id)a3 sessionUUID:(id)a4;
- (id)_initDB:(id)a3;
- (id)_onqueue_convertSqlRowToTaskInfoEntry:(sqlite3_stmt *)a3;
- (id)_sqlBlobHelper:(sqlite3_stmt *)a3 forColumn:(int)a4;
- (void)_beginSqliteTransaction;
- (void)_cleanupDB;
- (void)_commitSqliteTransaction;
- (void)_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4;
- (void)_deleteAllTaskEntriesInDB;
- (void)_deleteTaskEntriesWithIdentifiers:(id)a3 forSession:(id)a4 sessionUUID:(id)a5;
- (void)_onqueue_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_deleteEntryForTask:(unint64_t)a3 forSession:(id)a4 sessionUUID:(id)a5;
- (void)_onqueue_garbageCollect;
- (void)_onqueue_insertOrUpdateAllEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateBytesPerSecondLimitForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateCurrentRequestForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateDownloadFileURLForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateExpectedProgressTargetForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateLoadingPriorityForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateResponseForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateResumableUploadDataForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateSetPriorityEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateShouldCancelOnDisconnectForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateSuspendPathEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateTLSSupportedProtocolVersionForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateTaskDescriptionForTask:(id)a3 sessionUUID:(id)a4;
- (void)_updateDBEntriesForTasksInSession:(id)a3 taskInfos:(id)a4 updates:(id)a5;
- (void)_updateDBEntryForTask:(id)a3 updateType:(unint64_t)a4 sessionUUID:(id)a5;
@end

@implementation NDTaskStorageDB

- (BOOL)migrateSchemaToLatestVersion:(int64_t)a3
{
  errmsg = 0LL;
  dbConnection = self->_dbConnection;
  if (!dbConnection)
  {
    LOBYTE(v6) = 0;
    return v6;
  }

  BOOL v6 = 1;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (sqlite3_exec(dbConnection, "ALTER TABLE session_tasks ADD COLUMN resumable_upload_data blob;", 0LL, 0LL, 0LL))
      {
        v7 = (os_log_s *)qword_100083990;
        if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_WORD *)buf = 0;
        v8 = "Failed to migrate to version 2";
LABEL_25:
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
LABEL_11:
        int v9 = sqlite3_exec(self->_dbConnection, "DROP TABLE IF EXISTS session_tasks", 0LL, 0LL, &errmsg);
        v10 = (os_log_s *)qword_100083990;
        if (v9 && os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to drop table", buf, 2u);
          v10 = (os_log_s *)qword_100083990;
        }

        BOOL v6 = 0;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          int64_t v19 = a3;
          __int16 v20 = 1024;
          int v21 = 2;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Dropped db table session_tasks as migration from version %ld to %d failed",  buf,  0x12u);
          BOOL v6 = 0;
        }
      }
    }

    else if (!a3 {
           && sqlite3_exec( dbConnection,  "ALTER TABLE session_tasks ADD COLUMN av_asset_options_plist blob;",
    }
                0LL,
                0LL,
                0LL))
    {
      v7 = (os_log_s *)qword_100083990;
      if (!os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)buf = 0;
      v8 = "Failed to migrate to version 1";
      goto LABEL_25;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%d",  @"PRAGMA user_version = ",  2LL));
    v12 = self->_dbConnection;
    id v13 = v11;
    if (sqlite3_exec(v12, (const char *)[v13 UTF8String], 0, 0, &errmsg))
    {
      v14 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to set user_version", buf, 2u);
      }

      BOOL v6 = 0;
    }
  }

  v15 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v19 = a3;
    __int16 v20 = 1024;
    int v21 = 2;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Migrated schema version from %ld to %d success = %d",  buf,  0x18u);
  }

  return v6;
}

- (BOOL)handleSchemaVersionChange
{
  ppStmt = 0LL;
  dbConnection = self->_dbConnection;
  if (!dbConnection || sqlite3_prepare_v2(dbConnection, "PRAGMA user_version", -1, &ppStmt, 0LL)) {
    return 1;
  }
  if (sqlite3_step(ppStmt) == 100)
  {
    uint64_t v5 = sqlite3_column_int(ppStmt, 0);
    BOOL v6 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "schema version on disk is %ld", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v5 = -1LL;
  }

  sqlite3_finalize(ppStmt);
  BOOL result = 1;
  if ((v5 & 0x8000000000000000LL) == 0 && v5 != 2) {
    return -[NDTaskStorageDB migrateSchemaToLatestVersion:](self, "migrateSchemaToLatestVersion:", v5);
  }
  return result;
}

- (BOOL)_createDBSchemaForPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];
  BOOL v6 = v5;
  if (v5)
  {
    v7 = dirname_r(v5, (char *)errmsg);
    int v8 = statfs(v7, &v27);
    char f_flags = v27.f_flags;
    unsigned __int8 v10 = [v4 checkResourceIsReachableAndReturnError:0];
    else {
      int v11 = 6;
    }
    p_dbConnection = &self->_dbConnection;
    if (sqlite3_open_v2(v6, &self->_dbConnection, v11, 0LL))
    {
      sqlite3_close(*p_dbConnection);
      BOOL v13 = 0;
      *p_dbConnection = 0LL;
      goto LABEL_27;
    }

    id v15 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@%d", @"PRAGMA user_version = ", 2LL));
    v16 = (const char *)[v15 UTF8String];

    sqlite3_busy_timeout(*p_dbConnection, 1000);
    if ((v10 & 1) != 0)
    {
      if (-[NDTaskStorageDB handleSchemaVersionChange](self, "handleSchemaVersionChange"))
      {
LABEL_12:
        int v17 = 1;
LABEL_24:
        BOOL v23 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v4 absoluteString]);
          v27.f_bsize = 138412290;
          *(void *)&v27.f_iosize = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Opened db at path: %@",  (uint8_t *)&v27,  0xCu);
        }

        BOOL v13 = v17 != 0;
        goto LABEL_27;
      }

      __int16 v20 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        int v21 = "Failed to handle db version change";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 2u);
        goto LABEL_23;
      }

      goto LABEL_23;
    }

    if (sqlite3_exec(*p_dbConnection, "PRAGMA auto_vacuum = 2;", 0LL, 0LL, errmsg))
    {
      v18 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        int64_t v19 = "Failed to set auto_vacuum to incremental";
LABEL_36:
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v27, 2u);
      }
    }

    else
    {
      if (!sqlite3_exec(*p_dbConnection, "PRAGMA journal_mode = WAL", 0LL, 0LL, errmsg))
      {
        char v22 = 0;
        int v17 = 1;
LABEL_21:
        if (sqlite3_exec(*p_dbConnection, v16, 0LL, 0LL, errmsg))
        {
          __int16 v20 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            int v21 = "Failed to set user_version";
            goto LABEL_34;
          }
        }

        else
        {
          if ((v22 & 1) != 0) {
            goto LABEL_24;
          }
          if (!sqlite3_exec( *p_dbConnection,  "CREATE TABLE IF NOT EXISTS session_tasks (\tidentifier int NOT NULL, task_kind int, creation_time real , state int, suspend_count int, task_description text, original_request blob, current_request blob, re sponse blob,\tearliest_begin_date real, responded_to_will_begin_delayed_request_callback int, error bl ob, retry_error blob, file_url text, download_file_url text, bundle_id text, session_id text NOT NULL, \thas_started int, should_cancel_on_disconnect int, base_priority int, base_priority_set_explicitly in t, discretionary int, discretionary_override int, unique_identifier blob NOT NULL,\tstorage_partition_ identifier text, count_of_bytes_client_expects_to_send int, count_of_bytes_client_expects_to_receive i nt, count_of_bytes_received int, count_of_bytes_sent int,\tcount_of_bytes_expected_to_send int, count_ of_bytes_expected_to_receive int, bytes_per_second_limit int, persona_unique_string text, expected_pro gress_target int, may_be_demoted_to_discretionary int,\ttls_minimum_supported_protocol_version int, tl s_maximum_supported_protocol_version int, has_sz_extractor int, does_sz_extractor_consume_extracted_da ta int, updated_streaming_zip_modification_date int,\tstarted_user_initiated int, additional_propertie s blob, path_to_download_task_file text, retry_count int, loading_priority real, qos int, background_t railers blob, task_metrics blob,\tav_url text, av_destination_url text, av_options blob, av_initialize d_with_av_asset int, av_temporary_destination_url text, av_asset_title text, av_asset_artwork_data blo b, av_asset_url text,\tav_asset_download_token int, av_asset_download_child_download_session_identifie r text, av_enable_spi_delegate_callbacks int, av_download_config blob, av_asset_options_plist blob, re sumable_upload_data blob,\tUNIQUE(identifier, session_id));",
                  0LL,
                  0LL,
                  errmsg))
            goto LABEL_12;
          __int16 v20 = (os_log_s *)qword_100083990;
          if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            int v21 = "Failed to create schema";
            goto LABEL_34;
          }
        }

- (void)_onqueue_garbageCollect
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Garbage collection started", buf, 2u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    deleteEntriesStmt = self->_deleteEntriesStmt;
    if (deleteEntriesStmt)
    {
LABEL_6:
      if (sqlite3_step(deleteEntriesStmt) != 101)
      {
        BOOL v6 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v10 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 136315138;
          v14 = (char *)v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to delete expired entries from session_tasks db. Error= %s",  buf,  0xCu);
        }
      }

      sqlite3_reset(self->_deleteEntriesStmt);
      if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0LL, 0LL, &errmsg))
      {
        v7 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v14 = errmsg;
          _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to auto vacuum when garbage collecting: %s",  buf,  0xCu);
        }
      }

      return;
    }

    if (!sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks", -1, &self->_deleteEntriesStmt, 0LL))
    {
      deleteEntriesStmt = self->_deleteEntriesStmt;
      goto LABEL_6;
    }

    uint64_t v9 = (os_log_s *)(id)qword_100083990;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = sqlite3_errmsg(self->_dbConnection);
      *(_DWORD *)buf = 136315138;
      v14 = (char *)v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to init the _deleteEntriesStmt statement for session_tasks. Error = %s",  buf,  0xCu);
    }
  }

  else
  {
    int v8 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }
  }

- (BOOL)_onqueue_initDB
{
  if (self->_dbInitialized)
  {
    LOBYTE(self) = 1;
  }

  else
  {
    v2 = self;
    BOOL dbInitializationStarted = self->_dbInitializationStarted;
    LOBYTE(self) = 1;
    if (!dbInitializationStarted)
    {
      v2->_BOOL dbInitializationStarted = 1;
      path = v2->_path;
      if (!path)
      {
        uint64_t v5 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v2->_dbDir,  "URLByAppendingPathComponent:isDirectory:",  @"tasks.sqlite",  0LL));
        BOOL v6 = v2->_path;
        v2->_path = (NSURL *)v5;

        path = v2->_path;
      }

      if (-[NDTaskStorageDB _createDBSchemaForPath:](v2, "_createDBSchemaForPath:", path))
      {
        LOBYTE(self) = 1;
        v2->_dbInitialized = 1;
      }

      else
      {
        v7 = (os_log_s *)qword_100083990;
        LODWORD(self) = os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR);
        if ((_DWORD)self)
        {
          int v8 = v2->_path;
          int v10 = 138412290;
          int v11 = v8;
          _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unable to create persistent store for background tasks at location %@.",  (uint8_t *)&v10,  0xCu);
          LOBYTE(self) = 0;
        }
      }
    }
  }

  return (char)self;
}

- (id)_sqlBlobHelper:(sqlite3_stmt *)a3 forColumn:(int)a4
{
  int v6 = sqlite3_column_bytes(a3, a4);
  if (v6 < 1) {
    v7 = 0LL;
  }
  else {
    v7 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  sqlite3_column_blob(a3, a4),  v6);
  }
  return v7;
}

- (id)_onqueue_convertSqlRowToTaskInfoEntry:(sqlite3_stmt *)a3
{
  if (!a3)
  {
    uint64_t v5 = 0LL;
LABEL_65:
    uint64_t v5 = v5;
    v77 = v5;
    goto LABEL_69;
  }

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS_____NSCFURLSessionTaskInfo);
  -[__NSCFURLSessionTaskInfo setIdentifier:](v5, "setIdentifier:", sqlite3_column_int(a3, 0));
  -[__NSCFURLSessionTaskInfo setTaskKind:](v5, "setTaskKind:", sqlite3_column_int64(a3, 1));
  -[__NSCFURLSessionTaskInfo setCreationTime:](v5, "setCreationTime:", sqlite3_column_double(a3, 2));
  -[__NSCFURLSessionTaskInfo setState:](v5, "setState:", sqlite3_column_int64(a3, 3));
  -[__NSCFURLSessionTaskInfo setSuspendCount:](v5, "setSuspendCount:", sqlite3_column_int64(a3, 4));
  int v6 = sqlite3_column_text(a3, 5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    -[__NSCFURLSessionTaskInfo setTaskDescription:](v5, "setTaskDescription:", v7);
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 6LL));
  if ((unint64_t)[v92 length] <= 0x20000)
  {
    if (v92)
    {
      id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURLRequest),  v92,  0LL);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[__NSCFURLSessionTaskInfo setOriginalRequest:](v5, "setOriginalRequest:", v9);

      int v10 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo originalRequest](v5, "originalRequest"));
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _allProtocolProperties]);
      unint64_t v12 = estimatedPropertyListSize();

      if (v12 > 0x4000)
      {
        BOOL v13 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Dropping oversized protocol properties on request",  buf,  2u);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo originalRequest](v5, "originalRequest"));
        id v15 = [v14 mutableCopy];

        [v15 _removeAllProtocolProperties];
        -[__NSCFURLSessionTaskInfo setOriginalRequest:](v5, "setOriginalRequest:", v15);
      }
    }

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 7LL));
    if (v91)
    {
      id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURLRequest),  v91,  0LL);
      int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[__NSCFURLSessionTaskInfo setCurrentRequest:](v5, "setCurrentRequest:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo currentRequest](v5, "currentRequest"));
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 _allProtocolProperties]);
      unint64_t v20 = estimatedPropertyListSize();

      if (v20 > 0x4000)
      {
        int v21 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v93 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Dropping oversized protocol properties on request",  v93,  2u);
        }

        char v22 = (void *)objc_claimAutoreleasedReturnValue(-[__NSCFURLSessionTaskInfo currentRequest](v5, "currentRequest"));
        id v23 = [v22 mutableCopy];

        [v23 _removeAllProtocolProperties];
        -[__NSCFURLSessionTaskInfo setCurrentRequest:](v5, "setCurrentRequest:", v23);
      }
    }

    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 8LL));
    uint64_t v80 = v24;
    if (v24)
    {
      id v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURLResponse),  v24,  0LL,  v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      -[__NSCFURLSessionTaskInfo setResponse:](v5, "setResponse:", v26);
    }

    if (sqlite3_column_double(a3, 9) != 0.0)
    {
      statfs v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
      -[__NSCFURLSessionTaskInfo setEarliestBeginDate:](v5, "setEarliestBeginDate:", v27);
    }

    -[__NSCFURLSessionTaskInfo setRespondedToWillBeginDelayedRequestCallback:]( v5,  "setRespondedToWillBeginDelayedRequestCallback:",  sqlite3_column_int(a3, 10) != 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 11LL));
    if (v90)
    {
      id v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError),  v90,  0LL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      -[__NSCFURLSessionTaskInfo setError:](v5, "setError:", v29);
    }

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 12LL, v80));
    if (v89)
    {
      id v30 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSError),  v89,  0LL);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      -[__NSCFURLSessionTaskInfo setRetryError:](v5, "setRetryError:", v31);
    }

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 13LL));
    if (v88)
    {
      id v32 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v88,  0LL);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      -[__NSCFURLSessionTaskInfo setFileURL:](v5, "setFileURL:", v33);
    }

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 14LL));
    if (v87)
    {
      id v34 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v87,  0LL);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[__NSCFURLSessionTaskInfo setDownloadFileURL:](v5, "setDownloadFileURL:", v35);
    }

    v36 = sqlite3_column_text(a3, 15);
    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v36));
      -[__NSCFURLSessionTaskInfo setBundleID:](v5, "setBundleID:", v37);
    }

    v38 = sqlite3_column_text(a3, 16);
    if (v38)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v38));
      -[__NSCFURLSessionTaskInfo setSessionID:](v5, "setSessionID:", v39);
    }

    -[__NSCFURLSessionTaskInfo setHasStarted:](v5, "setHasStarted:", sqlite3_column_int(a3, 17) != 0);
    -[__NSCFURLSessionTaskInfo setShouldCancelOnDisconnect:]( v5,  "setShouldCancelOnDisconnect:",  sqlite3_column_int(a3, 18) != 0);
    -[__NSCFURLSessionTaskInfo setBasePriority:](v5, "setBasePriority:", sqlite3_column_int(a3, 19));
    -[__NSCFURLSessionTaskInfo setBasePrioritySetExplicitly:]( v5,  "setBasePrioritySetExplicitly:",  sqlite3_column_int(a3, 20) != 0);
    -[__NSCFURLSessionTaskInfo setDiscretionary:](v5, "setDiscretionary:", sqlite3_column_int(a3, 21) != 0);
    -[__NSCFURLSessionTaskInfo setDiscretionaryOverride:](v5, "setDiscretionaryOverride:", sqlite3_column_int(a3, 22));
    id v86 = (id)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 23LL));
    if (v86)
    {
      v40 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v86 bytes]);
      -[__NSCFURLSessionTaskInfo setUniqueIdentifier:](v5, "setUniqueIdentifier:", v40);
    }

    v41 = sqlite3_column_text(a3, 24);
    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v41));
      -[__NSCFURLSessionTaskInfo setStoragePartitionIdentifier:](v5, "setStoragePartitionIdentifier:", v42);
    }

    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToSend:]( v5,  "setCountOfBytesClientExpectsToSend:",  sqlite3_column_int64(a3, 25));
    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToReceive:]( v5,  "setCountOfBytesClientExpectsToReceive:",  sqlite3_column_int64(a3, 26));
    -[__NSCFURLSessionTaskInfo setCountOfBytesReceived:](v5, "setCountOfBytesReceived:", sqlite3_column_int64(a3, 27));
    -[__NSCFURLSessionTaskInfo setCountOfBytesSent:](v5, "setCountOfBytesSent:", sqlite3_column_int64(a3, 28));
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToSend:]( v5,  "setCountOfBytesExpectedToSend:",  sqlite3_column_int64(a3, 29));
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToReceive:]( v5,  "setCountOfBytesExpectedToReceive:",  sqlite3_column_int64(a3, 30));
    -[__NSCFURLSessionTaskInfo setBytesPerSecondLimit:](v5, "setBytesPerSecondLimit:", sqlite3_column_int64(a3, 31));
    v43 = sqlite3_column_text(a3, 32);
    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v43));
      -[__NSCFURLSessionTaskInfo setPersonaUniqueString:](v5, "setPersonaUniqueString:", v44);
    }

    -[__NSCFURLSessionTaskInfo setExpectedProgressTarget:]( v5,  "setExpectedProgressTarget:",  sqlite3_column_int64(a3, 33));
    -[__NSCFURLSessionTaskInfo setMayBeDemotedToDiscretionary:]( v5,  "setMayBeDemotedToDiscretionary:",  sqlite3_column_int(a3, 34) != 0);
    -[__NSCFURLSessionTaskInfo set_TLSMinimumSupportedProtocolVersion:]( v5,  "set_TLSMinimumSupportedProtocolVersion:",  (unsigned __int16)sqlite3_column_int(a3, 35));
    -[__NSCFURLSessionTaskInfo set_TLSMaximumSupportedProtocolVersion:]( v5,  "set_TLSMaximumSupportedProtocolVersion:",  (unsigned __int16)sqlite3_column_int(a3, 36));
    -[__NSCFURLSessionTaskInfo set_hasSZExtractor:](v5, "set_hasSZExtractor:", sqlite3_column_int(a3, 37) != 0);
    -[__NSCFURLSessionTaskInfo set_doesSZExtractorConsumeExtractedData:]( v5,  "set_doesSZExtractorConsumeExtractedData:",  sqlite3_column_int(a3, 38) != 0);
    -[__NSCFURLSessionTaskInfo set_updatedStreamingZipModificationDate:]( v5,  "set_updatedStreamingZipModificationDate:",  sqlite3_column_int(a3, 39) != 0);
    -[__NSCFURLSessionTaskInfo setStartedUserInitiated:]( v5,  "setStartedUserInitiated:",  sqlite3_column_int(a3, 40) != 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 41LL));
    if (v85)
    {
      if (qword_100083910 != -1) {
        dispatch_once(&qword_100083910, &stru_100078CD8);
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  qword_100083908,  v85,  0LL));
      -[__NSCFURLSessionTaskInfo setAdditionalProperties:](v5, "setAdditionalProperties:", v45);
    }

    v46 = sqlite3_column_text(a3, 42);
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v46));
      -[__NSCFURLSessionTaskInfo setPathToDownloadTaskFile:](v5, "setPathToDownloadTaskFile:", v47);
    }

    -[__NSCFURLSessionTaskInfo setRetryCount:](v5, "setRetryCount:", sqlite3_column_int(a3, 43));
    -[__NSCFURLSessionTaskInfo setLoadingPriority:](v5, "setLoadingPriority:", sqlite3_column_double(a3, 44));
    -[__NSCFURLSessionTaskInfo setQos:](v5, "setQos:", sqlite3_column_int64(a3, 45));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 46LL));
    if (v84)
    {
      uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSString);
      v49 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:",  v48,  objc_opt_class(&OBJC_CLASS___NSString),  v84,  0LL);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      -[__NSCFURLSessionTaskInfo set_backgroundTrailers:](v5, "set_backgroundTrailers:", v50);
    }

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 47LL));
    if (v83)
    {
      id v51 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS_____CFN_TaskMetrics),  v83,  0LL);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      -[__NSCFURLSessionTaskInfo setTaskMetrics:](v5, "setTaskMetrics:", v52);
    }

    v82 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 48LL));
    if (v82)
    {
      id v53 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v82,  0LL);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      -[__NSCFURLSessionTaskInfo setURL:](v5, "setURL:", v54);
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 49LL));
    if (v55)
    {
      id v56 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v55,  0LL);
      v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      -[__NSCFURLSessionTaskInfo setDestinationURL:](v5, "setDestinationURL:", v57);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 50LL));
    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v58,  0LL,  0LL,  0LL));
      -[__NSCFURLSessionTaskInfo setOptions:](v5, "setOptions:", v59);
    }

    -[__NSCFURLSessionTaskInfo setInitializedWithAVAsset:]( v5,  "setInitializedWithAVAsset:",  sqlite3_column_int(a3, 51) != 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 52LL));
    if (v60)
    {
      id v61 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v60,  0LL);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      -[__NSCFURLSessionTaskInfo setTemporaryDestinationURL:](v5, "setTemporaryDestinationURL:", v62);
    }

    v63 = sqlite3_column_text(a3, 53);
    if (v63)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v63));
      -[__NSCFURLSessionTaskInfo setAssetTitle:](v5, "setAssetTitle:", v64);
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 54LL));
    -[__NSCFURLSessionTaskInfo setAssetArtworkData:](v5, "setAssetArtworkData:", v65);

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 55LL));
    if (v66)
    {
      id v67 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___NSURL),  v66,  0LL);
      v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
      -[__NSCFURLSessionTaskInfo setAVAssetURL:](v5, "setAVAssetURL:", v68);
    }

    -[__NSCFURLSessionTaskInfo setAVAssetDownloadToken:](v5, "setAVAssetDownloadToken:", sqlite3_column_int64(a3, 56));
    v69 = sqlite3_column_text(a3, 57);
    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v69));
      -[__NSCFURLSessionTaskInfo setAvAssetDownloadChildDownloadSessionIdentifier:]( v5,  "setAvAssetDownloadChildDownloadSessionIdentifier:",  v70);
    }

    -[__NSCFURLSessionTaskInfo setEnableSPIDelegateCallbacks:]( v5,  "setEnableSPIDelegateCallbacks:",  sqlite3_column_int(a3, 58) != 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 59LL));
    id v72 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___AVAssetDownloadConfiguration),  v71,  0LL);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    -[__NSCFURLSessionTaskInfo setDownloadConfig:](v5, "setDownloadConfig:", v73);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 60LL));
    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v74,  0LL,  0LL,  0LL));
      -[__NSCFURLSessionTaskInfo setAssetOptionsPlist:](v5, "setAssetOptionsPlist:", v75);
    }

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 61LL));
    -[__NSCFURLSessionTaskInfo setResumableUploadData:](v5, "setResumableUploadData:", v76);

    goto LABEL_65;
  }

  v78 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v95 = 0;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Dropping oversized request", v95, 2u);
  }

  v77 = 0LL;
LABEL_69:

  return v77;
}

- (void)_onqueue_insertOrUpdateAllEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v236 = (const char *)[v6 identifier];
    __int16 v237 = 2112;
    v238 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_insertOrUpdateAllEntriesForTask: %lu for session: %@",  buf,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_insertOrUpdateAllEntriesStmt = &self->_insertOrUpdateAllEntriesStmt;
    insertOrUpdateAllEntriesStmt = self->_insertOrUpdateAllEntriesStmt;
    if (!insertOrUpdateAllEntriesStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "INSERT OR REPLACE INTO session_tasks(\tidentifier, task_kind, creation_time, state, suspend_count, task_des cription, original_request, current_request, response, earliest_begin_date,\tresponded_to_will_begin_delaye d_request_callback, error, retry_error, file_url, download_file_url, bundle_id, session_id, has_started, sh ould_cancel_on_disconnect,\tbase_priority, base_priority_set_explicitly, discretionary, discretionary_overr ide, unique_identifier, storage_partition_identifier, count_of_bytes_client_expects_to_send,\tcount_of_byte s_client_expects_to_receive, count_of_bytes_received, count_of_bytes_sent, count_of_bytes_expected_to_send, count_of_bytes_expected_to_receive,\tbytes_per_second_limit, persona_unique_string, expected_progress_targ et, may_be_demoted_to_discretionary, tls_minimum_supported_protocol_version,\ttls_maximum_supported_protoco l_version, has_sz_extractor, does_sz_extractor_consume_extracted_data, updated_streaming_zip_modification_d ate, started_user_initiated,\tadditional_properties, path_to_download_task_file, retry_count, loading_prior ity, qos, background_trailers, task_metrics,\tav_url, av_destination_url, av_options, av_initialized_with_a v_asset, av_temporary_destination_url, av_asset_title, av_asset_artwork_data, av_asset_url, av_asset_downlo ad_token,\tav_asset_download_child_download_session_identifier, av_enable_spi_delegate_callbacks, av_downlo ad_config, av_asset_options_plist, resumable_upload_data, rowid) \tvalues (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,\t\t\t(SELECT max(rowid) FROM session_tasks)+1)",  -1,  &self->_insertOrUpdateAllEntriesStmt,  0LL))
      {
        unint64_t v12 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v17 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)buf = 136315138;
          v236 = v17;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed init the insert statement for session_tasks db. Error = %s",  buf,  0xCu);
        }

        goto LABEL_36;
      }

      insertOrUpdateAllEntriesStmt = *p_insertOrUpdateAllEntriesStmt;
    }

    if (sqlite3_bind_int(insertOrUpdateAllEntriesStmt, 1, (int)[v6 identifier]))
    {
      unint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v16 = (const char *)[v6 identifier];
        *(_DWORD *)buf = 134217984;
        v236 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  buf,  0xCu);
      }

- (void)_onqueue_updateResponseForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateResponseForTask: %lu for session: %@",  (uint8_t *)&v26,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResponseForTaskStmt = &self->_updateResponseForTaskStmt;
    if (!self->_updateResponseForTaskStmt
      && sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET response = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateResponseForTaskStmt,  0LL))
    {
      int v17 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to init _updateResponseForTaskStmt for session_tasks",  (uint8_t *)&v26,  2u);
      }

      goto LABEL_28;
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 response]);
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  0LL));

    BOOL v13 = *p_updateResponseForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob( v13,  1,  [v14 bytes],  (int)objc_msgSend(v14, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      double v15 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to bind responseData to the select statement",  (uint8_t *)&v26,  2u);
      }
    }

    else
    {
      v18 = *p_updateResponseForTaskStmt;
      id v19 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)[v19 UTF8String], -1, 0) == 0;

      if ((v18 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateResponseForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateResponseForTaskStmt) != 101)
          {
            int v21 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              id v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to update response for task %lu into db. Error= %s",  (uint8_t *)&v26,  0x16u);
            }
          }

          sqlite3_reset(*p_updateResponseForTaskStmt);
          goto LABEL_27;
        }

        id v20 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }

      else
      {
        id v20 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          char v22 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
          int v26 = 138412290;
          id v27 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }
    }

- (void)_onqueue_updateResumableUploadDataForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateResumableUploadDataForTask: %lu for session: %@",  (uint8_t *)&v25,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResumableUploadDataForTaskStmt = &self->_updateResumableUploadDataForTaskStmt;
    if (!self->_updateResumableUploadDataForTaskStmt
      && sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET resumable_upload_data = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateResumableUploadDataForTaskStmt,  0LL))
    {
      id v16 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to init _updateResumableUploadDataForTaskStmt for session_tasks",  (uint8_t *)&v25,  2u);
      }

      goto LABEL_28;
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 resumableUploadData]);
    unint64_t v12 = *p_updateResumableUploadDataForTaskStmt;
    id v13 = v11;
    if (sqlite3_bind_blob( v12,  1,  [v13 bytes],  (int)objc_msgSend(v13, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      id v14 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to bind resumableUploadData to the select statement",  (uint8_t *)&v25,  2u);
      }
    }

    else
    {
      int v17 = *p_updateResumableUploadDataForTaskStmt;
      id v18 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
      LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)[v18 UTF8String], -1, 0) == 0;

      if ((v17 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateResumableUploadDataForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateResumableUploadDataForTaskStmt) != 101)
          {
            id v20 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v23 = [v6 identifier];
              id v24 = sqlite3_errmsg(self->_dbConnection);
              int v25 = 134218242;
              id v26 = v23;
              __int16 v27 = 2080;
              __int16 v28 = v24;
              _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to update resumableUploadData for task %lu into db. Error= %s",  (uint8_t *)&v25,  0x16u);
            }
          }

          sqlite3_reset(*p_updateResumableUploadDataForTaskStmt);
          goto LABEL_27;
        }

        id v19 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v6 identifier];
          int v25 = 134217984;
          id v26 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
        }
      }

      else
      {
        id v19 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
          int v25 = 138412290;
          id v26 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v25,  0xCu);
        }
      }
    }

- (void)_onqueue_updateTaskDescriptionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateTaskDescriptionForTask: %lu for session: %@",  (uint8_t *)&v25,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTaskDescriptionForTaskStmt = &self->_updateTaskDescriptionForTaskStmt;
    updateTaskDescriptionForTaskStmt = self->_updateTaskDescriptionForTaskStmt;
    if (!updateTaskDescriptionForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET task_description = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateTaskDescriptionForTaskStmt,  0LL))
      {
        id v16 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Failed to init _updateTaskDescriptionForTaskStmt for session_tasks",  (uint8_t *)&v25,  2u);
        }

        goto LABEL_29;
      }

      updateTaskDescriptionForTaskStmt = *p_updateTaskDescriptionForTaskStmt;
    }

    id v12 = objc_claimAutoreleasedReturnValue([v6 taskDescription]);
    BOOL v13 = sqlite3_bind_text(updateTaskDescriptionForTaskStmt, 1, (const char *)[v12 UTF8String], -1, 0) == 0;

    if (!v13)
    {
      id v14 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 taskDescription]);
        int v25 = 138412290;
        id v26 = v20;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to bind taskDescription (%@) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

- (void)_onqueue_updateShouldCancelOnDisconnectForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateShouldCancelOnDisconnectForTask: %lu for session: %@",  (uint8_t *)&v23,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateShouldCancelOnDisconnectForTaskStmt = &self->_updateShouldCancelOnDisconnectForTaskStmt;
    updateShouldCancelOnDisconnectForTaskStmt = self->_updateShouldCancelOnDisconnectForTaskStmt;
    if (!updateShouldCancelOnDisconnectForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET should_cancel_on_disconnect = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateShouldCancelOnDisconnectForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateShouldCancelOnDisconnectForTaskStmt for session_tasks",  (uint8_t *)&v23,  2u);
        }

        goto LABEL_29;
      }

      updateShouldCancelOnDisconnectForTaskStmt = *p_updateShouldCancelOnDisconnectForTaskStmt;
    }

    if (sqlite3_bind_int( updateShouldCancelOnDisconnectForTaskStmt,  1,  (int)[v6 shouldCancelOnDisconnect]))
    {
      id v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = [v6 shouldCancelOnDisconnect];
        int v23 = 134217984;
        id v24 = (id)v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

- (void)_onqueue_updateCurrentRequestForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateCurrentRequestForTask: %lu for session: %@",  (uint8_t *)&v26,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateCurrentRequestForTaskStmt = &self->_updateCurrentRequestForTaskStmt;
    if (!self->_updateCurrentRequestForTaskStmt
      && sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET current_request = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateCurrentRequestForTaskStmt,  0LL))
    {
      int v17 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to init _updateCurrentRequestForTaskStmt for session_tasks",  (uint8_t *)&v26,  2u);
      }

      goto LABEL_28;
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRequest]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  0LL));

    BOOL v13 = *p_updateCurrentRequestForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob( v13,  1,  [v14 bytes],  (int)objc_msgSend(v14, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      double v15 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to bind currentRequestData to the select statement",  (uint8_t *)&v26,  2u);
      }
    }

    else
    {
      unsigned int v18 = *p_updateCurrentRequestForTaskStmt;
      id v19 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)[v19 UTF8String], -1, 0) == 0;

      if ((v18 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateCurrentRequestForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateCurrentRequestForTaskStmt) != 101)
          {
            id v21 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              __int16 v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to update currentRequest for task %lu into db. Error= %s",  (uint8_t *)&v26,  0x16u);
            }
          }

          sqlite3_reset(*p_updateCurrentRequestForTaskStmt);
          goto LABEL_27;
        }

        id v20 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }

      else
      {
        id v20 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
          int v26 = 138412290;
          id v27 = v22;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }
    }

- (void)_onqueue_updateTLSSupportedProtocolVersionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateTLSSupportedProtocolVersionForTask: %lu, for session: %@",  (uint8_t *)&v24,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTLSSupportedProtocolVersionForTaskStmt = &self->_updateTLSSupportedProtocolVersionForTaskStmt;
    updateTLSSupportedProtocolVersionForTaskStmt = self->_updateTLSSupportedProtocolVersionForTaskStmt;
    if (!updateTLSSupportedProtocolVersionForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET tls_minimum_supported_protocol_version = ?, tls_maximum_supported_protocol_version = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateTLSSupportedProtocolVersionForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateTLSSupportedProtocolVersionForTaskStmt for session_tasks",  (uint8_t *)&v24,  2u);
        }

        goto LABEL_33;
      }

      updateTLSSupportedProtocolVersionForTaskStmt = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    }

    if (sqlite3_bind_int( updateTLSSupportedProtocolVersionForTaskStmt,  1,  (int)[v6 _TLSMinimumSupportedProtocolVersion]))
    {
      id v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v17 = [v6 _TLSMinimumSupportedProtocolVersion];
        int v24 = 134217984;
        id v25 = (id)v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

- (void)_onqueue_updateBytesPerSecondLimitForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateBytesPerSecondLimitForTask: %lu for session: %@",  (uint8_t *)&v23,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateBytesPerSecondLimitForTaskStmt = &self->_updateBytesPerSecondLimitForTaskStmt;
    updateBytesPerSecondLimitForTaskStmt = self->_updateBytesPerSecondLimitForTaskStmt;
    if (!updateBytesPerSecondLimitForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET bytes_per_second_limit = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateBytesPerSecondLimitForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateBytesPerSecondLimitForTaskStmt for session_tasks",  (uint8_t *)&v23,  2u);
        }

        goto LABEL_29;
      }

      updateBytesPerSecondLimitForTaskStmt = *p_updateBytesPerSecondLimitForTaskStmt;
    }

    if (sqlite3_bind_int64( updateBytesPerSecondLimitForTaskStmt,  1,  (sqlite3_int64)[v6 bytesPerSecondLimit]))
    {
      id v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 bytesPerSecondLimit];
        int v23 = 134217984;
        id v24 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind bytesPerSecondLimit (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

- (void)_onqueue_updateLoadingPriorityForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateLoadingPriorityForTask: %lu for session: %@",  (uint8_t *)&v24,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateLoadingPriorityForTaskStmt = &self->_updateLoadingPriorityForTaskStmt;
    updateLoadingPriorityForTaskStmt = self->_updateLoadingPriorityForTaskStmt;
    if (!updateLoadingPriorityForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET loading_priority = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateLoadingPriorityForTaskStmt,  0LL))
      {
        double v15 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to init _updateLoadingPriorityForTaskStmt for session_tasks",  (uint8_t *)&v24,  2u);
        }

        goto LABEL_29;
      }

      updateLoadingPriorityForTaskStmt = *p_updateLoadingPriorityForTaskStmt;
    }

    [v6 loadingPriority];
    if (sqlite3_bind_double(updateLoadingPriorityForTaskStmt, 1, v12))
    {
      BOOL v13 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v6 loadingPriority];
        int v24 = 134217984;
        id v25 = v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to bind loadingPriority (%f) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

- (void)_onqueue_updateExpectedProgressTargetForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateExpectedProgressTargetForTask: %lu for session: %@",  (uint8_t *)&v23,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateExpectedProgressTargetForTaskStmt = &self->_updateExpectedProgressTargetForTaskStmt;
    updateExpectedProgressTargetForTaskStmt = self->_updateExpectedProgressTargetForTaskStmt;
    if (!updateExpectedProgressTargetForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET expected_progress_target = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateExpectedProgressTargetForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateExpectedProgressTargetForTaskStmt for session_tasks",  (uint8_t *)&v23,  2u);
        }

        goto LABEL_29;
      }

      updateExpectedProgressTargetForTaskStmt = *p_updateExpectedProgressTargetForTaskStmt;
    }

    if (sqlite3_bind_int64(updateExpectedProgressTargetForTaskStmt, 1, (int)[v6 expectedProgressTarget]))
    {
      double v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 expectedProgressTarget];
        int v23 = 134217984;
        id v24 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind expectedProgressTarget (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

- (void)_onqueue_deleteEntryForTask:(unint64_t)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (char *)a5;
  int v10 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    __int16 v26 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "_onqueue_deleteEntryForTaskWithIdentifier: %lu for session: %@",  (uint8_t *)&v23,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    id v17 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v23,  2u);
    }

    goto LABEL_25;
  }

  p_deleteEntryForTaskStmt = &self->_deleteEntryForTaskStmt;
  deleteEntryForTaskStmt = self->_deleteEntryForTaskStmt;
  if (!deleteEntryForTaskStmt)
  {
    if (sqlite3_prepare_v2( dbConnection,  "DELETE FROM session_tasks WHERE session_id = ? AND identifier = ?",  -1,  &self->_deleteEntryForTaskStmt,  0LL))
    {
      uint64_t v18 = qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        double v15 = "Failed to init _deleteEntryForTaskStmt for session_tasks";
        id v16 = (os_log_s *)v18;
        uint32_t v19 = 2;
LABEL_18:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v19);
        goto LABEL_25;
      }

      goto LABEL_25;
    }

    deleteEntryForTaskStmt = *p_deleteEntryForTaskStmt;
  }

  if (sqlite3_bind_text( deleteEntryForTaskStmt, 1, (const char *)[v8 UTF8String], -1, 0))
  {
    uint64_t v14 = qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      unint64_t v24 = (unint64_t)v9;
      double v15 = "Failed to bind sessionID (%@) to the select statement";
      id v16 = (os_log_s *)v14;
LABEL_17:
      uint32_t v19 = 12;
      goto LABEL_18;
    }
  }

  else if (sqlite3_bind_int(*p_deleteEntryForTaskStmt, 2, a3))
  {
    uint64_t v20 = qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      int v23 = 134217984;
      unint64_t v24 = a3;
      double v15 = "Failed to bind identifier (%lu) to the delete statement";
      id v16 = (os_log_s *)v20;
      goto LABEL_17;
    }
  }

  else
  {
    if (sqlite3_step(*p_deleteEntryForTaskStmt) != 101)
    {
      id v21 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        unint64_t v24 = a3;
        __int16 v25 = 2080;
        __int16 v26 = v22;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to delete task with identifier %lu from db. Error= %s",  (uint8_t *)&v23,  0x16u);
      }
    }

    sqlite3_reset(*p_deleteEntryForTaskStmt);
  }

- (void)_onqueue_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_deleteAllTaskEntriesForSession session: %@",  buf,  0xCu);
  }

  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    uint64_t v14 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }

    goto LABEL_23;
  }

  p_deleteEntriesForSessionStmt = &self->_deleteEntriesForSessionStmt;
  deleteEntriesForSessionStmt = self->_deleteEntriesForSessionStmt;
  if (!deleteEntriesForSessionStmt)
  {
    if (sqlite3_prepare_v2( dbConnection,  "DELETE FROM session_tasks WHERE session_id = ?",  -1,  &self->_deleteEntriesForSessionStmt,  0LL))
    {
      uint64_t v15 = qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        BOOL v13 = "Failed to init _deleteEntriesForSessionStmt for session_tasks";
        id v16 = (os_log_s *)v15;
        uint32_t v17 = 2;
LABEL_22:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v13, buf, v17);
        goto LABEL_23;
      }

      goto LABEL_23;
    }

    deleteEntriesForSessionStmt = *p_deleteEntriesForSessionStmt;
  }

  if (sqlite3_bind_text( deleteEntriesForSessionStmt, 1, (const char *)[v6 UTF8String], -1, 0))
  {
    uint64_t v12 = qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      BOOL v13 = "Failed to bind sessionID (%@) to the select statement";
LABEL_21:
      id v16 = (os_log_s *)v12;
      uint32_t v17 = 12;
      goto LABEL_22;
    }
  }

  else
  {
    if (sqlite3_step(*p_deleteEntriesForSessionStmt) != 101)
    {
      uint64_t v18 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint32_t v19 = sqlite3_errmsg(self->_dbConnection);
        *(_DWORD *)buf = 136315138;
        id v22 = (char *)v19;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to delete tasks from db. Error= %s",  buf,  0xCu);
      }
    }

    sqlite3_reset(*p_deleteEntriesForSessionStmt);
    if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0LL, 0LL, &errmsg))
    {
      uint64_t v12 = qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = errmsg;
        BOOL v13 = "Failed to auto vacuum when garbage collecting: %s";
        goto LABEL_21;
      }
    }
  }

- (void)_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask: %lu for session: %@",  (uint8_t *)&v23,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    if (!updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET responded_to_will_begin_delayed_request_callback = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt,  0LL))
      {
        uint64_t v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt for session_tasks",  (uint8_t *)&v23,  2u);
        }

        goto LABEL_29;
      }

      updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    }

    if (sqlite3_bind_int( updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt,  1,  (int)[v6 respondedToWillBeginDelayedRequestCallback]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = [v6 respondedToWillBeginDelayedRequestCallback];
        int v23 = 134217984;
        id v24 = (id)v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v23,  0xCu);
      }

- (void)_onqueue_updateDownloadFileURLForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateDownloadFileURLForTask: %lu for session: %@",  (uint8_t *)&v26,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateDownloadFileURLForTaskStmt = &self->_updateDownloadFileURLForTaskStmt;
    if (!self->_updateDownloadFileURLForTaskStmt
      && sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET download_file_url = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateDownloadFileURLForTaskStmt,  0LL))
    {
      unsigned int v18 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to init _updateDownloadFileURLForTaskStmt for session_tasks",  (uint8_t *)&v26,  2u);
      }

      goto LABEL_22;
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadFileURL]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  0LL));

    BOOL v13 = *p_updateDownloadFileURLForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob( v13,  1,  [v14 bytes],  (int)objc_msgSend(v14, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v15 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadFileURL]);
        int v26 = 138412290;
        id v27 = v16;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to bind downloadFileURL (%@) to the select statement",  (uint8_t *)&v26,  0xCu);
      }
    }

    else
    {
      uint32_t v19 = *p_updateDownloadFileURLForTaskStmt;
      id v20 = objc_claimAutoreleasedReturnValue([v6 sessionID]);
      LOBYTE(v19) = sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, 0) == 0;

      if ((v19 & 1) != 0)
      {
        if (!sqlite3_bind_int(*p_updateDownloadFileURLForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateDownloadFileURLForTaskStmt) != 101)
          {
            id v22 = (os_log_s *)(id)qword_100083990;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              __int16 v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to update downloadFileURL for task %lu into db. Error= %s",  (uint8_t *)&v26,  0x16u);
            }
          }

          sqlite3_reset(*p_updateDownloadFileURLForTaskStmt);
          goto LABEL_21;
        }

        uint64_t v15 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to bind identifier (%lu) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }

      else
      {
        uint64_t v15 = (os_log_s *)(id)qword_100083990;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionID]);
          int v26 = 138412290;
          id v27 = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to bind sessionID (%@) to the select statement",  (uint8_t *)&v26,  0xCu);
        }
      }
    }

LABEL_21:
    goto LABEL_22;
  }

  uint32_t v17 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "sqlite db not initialized",  (uint8_t *)&v26,  2u);
  }

- (void)_onqueue_updateSuspendPathEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateSuspendPathEntriesForTask: %lu for session %@",  (uint8_t *)&v24,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSuspendPathEntriesForTaskStmt = &self->_updateSuspendPathEntriesForTaskStmt;
    updateSuspendPathEntriesForTaskStmt = self->_updateSuspendPathEntriesForTaskStmt;
    if (!updateSuspendPathEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET state = ?, suspend_count = ? WHERE session_id = ? AND identifier = ?",  -1,  &self->_updateSuspendPathEntriesForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateSuspendPathEntriesForTaskStmt for session_tasks",  (uint8_t *)&v24,  2u);
        }

        goto LABEL_33;
      }

      updateSuspendPathEntriesForTaskStmt = *p_updateSuspendPathEntriesForTaskStmt;
    }

    if (sqlite3_bind_int64(updateSuspendPathEntriesForTaskStmt, 1, (sqlite3_int64)[v6 state]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v17 = [v6 state];
        int v24 = 134217984;
        id v25 = v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind state (%lu) to the select statement",  (uint8_t *)&v24,  0xCu);
      }

- (void)_onqueue_updateSetPriorityEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  id v8 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "_onqueue_updateSetPriorityEntriesForTask: %lu for session: %@",  (uint8_t *)&v25,  0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSetPriorityEntriesForTaskStmt = &self->_updateSetPriorityEntriesForTaskStmt;
    updateSetPriorityEntriesForTaskStmt = self->_updateSetPriorityEntriesForTaskStmt;
    if (!updateSetPriorityEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2( dbConnection,  "UPDATE session_tasks SET discretionary = ?, base_priority = ?, base_priority_set_explicitly = ? WHERE sessi on_id = ? AND identifier = ?",  -1,  &self->_updateSetPriorityEntriesForTaskStmt,  0LL))
      {
        id v14 = (os_log_s *)qword_100083990;
        if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to init _updateSetPriorityEntriesForTaskStmt for session_tasks",  (uint8_t *)&v25,  2u);
        }

        goto LABEL_37;
      }

      updateSetPriorityEntriesForTaskStmt = *p_updateSetPriorityEntriesForTaskStmt;
    }

    if (sqlite3_bind_int(updateSetPriorityEntriesForTaskStmt, 1, (int)[v6 isDiscretionary]))
    {
      uint64_t v12 = (os_log_s *)(id)qword_100083990;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v17 = [v6 isDiscretionary];
        int v25 = 134217984;
        id v26 = (id)v17;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to bind discretionary (%lu) to the select statement",  (uint8_t *)&v25,  0xCu);
      }

- (id)_initDB:(id)a3
{
  id v5 = a3;
  id v6 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_initDB at dir: %@", (uint8_t *)&buf, 0xCu);
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NDTaskStorageDB;
  v7 = -[NDTaskStorageDB init](&v23, "init");
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dbDir, a3);
    v8->_dbConnection = 0LL;
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);
    uint64_t v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nsurlsessiond.session-archive-queue", v12);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v13;

    *(_WORD *)&v8->_dbInitialized = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x2020000000LL;
    uint64_t v15 = (dispatch_queue_s *)v8->_workQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000F034;
    v20[3] = &unk_100079608;
    p___int128 buf = &buf;
    id v16 = v8;
    id v21 = v16;
    dispatch_sync(v15, v20);
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      unsigned int v17 = v16;

      _Block_object_dispose(&buf, 8);
      goto LABEL_10;
    }

    _Block_object_dispose(&buf, 8);
  }

  id v18 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "_initDB failed", (uint8_t *)&buf, 2u);
  }

  unsigned int v17 = 0LL;
LABEL_10:

  return v17;
}

- (void)_updateDBEntryForTask:(id)a3 updateType:(unint64_t)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = (os_log_s *)(id)qword_100083990;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218498;
    id v15 = [v8 identifier];
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "_updateDBEntryForTask: %lu type %lu session: %@",  (uint8_t *)&v14,  0x20u);
  }

  switch(a4)
  {
    case 0uLL:
      -[NDTaskStorageDB _onqueue_updateTaskDescriptionForTask:sessionUUID:]( self,  "_onqueue_updateTaskDescriptionForTask:sessionUUID:",  v8,  v9);
      break;
    case 1uLL:
      -[NDTaskStorageDB _onqueue_updateResponseForTask:sessionUUID:]( self,  "_onqueue_updateResponseForTask:sessionUUID:",  v8,  v9);
      break;
    case 2uLL:
      -[NDTaskStorageDB _onqueue_updateResumableUploadDataForTask:sessionUUID:]( self,  "_onqueue_updateResumableUploadDataForTask:sessionUUID:",  v8,  v9);
      break;
    case 3uLL:
      -[NDTaskStorageDB _onqueue_updateDownloadFileURLForTask:sessionUUID:]( self,  "_onqueue_updateDownloadFileURLForTask:sessionUUID:",  v8,  v9);
      break;
    case 4uLL:
      -[NDTaskStorageDB _onqueue_updateLoadingPriorityForTask:sessionUUID:]( self,  "_onqueue_updateLoadingPriorityForTask:sessionUUID:",  v8,  v9);
      break;
    case 5uLL:
      -[NDTaskStorageDB _onqueue_updateBytesPerSecondLimitForTask:sessionUUID:]( self,  "_onqueue_updateBytesPerSecondLimitForTask:sessionUUID:",  v8,  v9);
      break;
    case 6uLL:
      -[NDTaskStorageDB _onqueue_updateExpectedProgressTargetForTask:sessionUUID:]( self,  "_onqueue_updateExpectedProgressTargetForTask:sessionUUID:",  v8,  v9);
      break;
    case 7uLL:
      -[NDTaskStorageDB _onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:]( self,  "_onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:",  v8,  v9);
      break;
    case 8uLL:
      -[NDTaskStorageDB _onqueue_updateCurrentRequestForTask:sessionUUID:]( self,  "_onqueue_updateCurrentRequestForTask:sessionUUID:",  v8,  v9);
      break;
    case 9uLL:
      -[NDTaskStorageDB _onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:]( self,  "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:",  v8,  v9);
      break;
    case 0xAuLL:
      -[NDTaskStorageDB _onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:]( self,  "_onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:",  v8,  v9);
      break;
    case 0xBuLL:
      -[NDTaskStorageDB _onqueue_updateSuspendPathEntriesForTask:sessionUUID:]( self,  "_onqueue_updateSuspendPathEntriesForTask:sessionUUID:",  v8,  v9);
      break;
    case 0xCuLL:
      -[NDTaskStorageDB _onqueue_updateSetPriorityEntriesForTask:sessionUUID:]( self,  "_onqueue_updateSetPriorityEntriesForTask:sessionUUID:",  v8,  v9);
      break;
    case 0xDuLL:
      id v12 = [v8 identifier];
      dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionID]);
      -[NDTaskStorageDB _onqueue_deleteEntryForTask:forSession:sessionUUID:]( self,  "_onqueue_deleteEntryForTask:forSession:sessionUUID:",  v12,  v13,  v9);

      break;
    case 0xEuLL:
      -[NDTaskStorageDB _onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:]( self,  "_onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:",  v8,  v9);
      break;
    default:
      dispatch_queue_attr_t v11 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134217984;
        id v15 = (id)a4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Invalid update type %lu",  (uint8_t *)&v14,  0xCu);
      }

      break;
  }
}

- (id)_getAllTasksFromDBForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000ED6C;
  v16[3] = &unk_100078FF0;
  id v17 = v7;
  __int16 v18 = self;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync((dispatch_queue_t)workQueue, v16);
  dispatch_queue_t v13 = v20;
  id v14 = v10;

  return v14;
}

- (void)_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ED5C;
  block[3] = &unk_100079968;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

- (void)_deleteAllTaskEntriesInDB
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)__int128 buf = 138412290;
    id v8 = path;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "_deleteAllTaskEntriesInDB at path: %@",  buf,  0xCu);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000ED54;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

- (void)_cleanupDB
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)__int128 buf = 138412290;
    id v8 = path;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cleanupDB at path: %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000EBE8;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)workQueue, block);
}

- (id)_getAllSessionIDsForBundle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000E914;
  block[3] = &unk_100079968;
  id v13 = v4;
  id v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  id v9 = v15;
  id v10 = v7;

  return v10;
}

- (void)_beginSqliteTransaction
{
  if (sqlite3_exec(self->_dbConnection, "BEGIN TRANSACTION", 0LL, 0LL, &errmsg))
  {
    v2 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v5 = errmsg;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Error beginning sqlite transaction: %s",  buf,  0xCu);
    }
  }

- (void)_commitSqliteTransaction
{
  if (sqlite3_exec(self->_dbConnection, "COMMIT TRANSACTION", 0LL, 0LL, &errmsg))
  {
    v2 = (os_log_s *)qword_100083990;
    if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v5 = errmsg;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Error committing sqlite transaction: %s",  buf,  0xCu);
    }
  }

- (void)_updateDBEntriesForTasksInSession:(id)a3 taskInfos:(id)a4 updates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v21 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "_updateDBEntriesForTasks for session %@",  buf,  0xCu);
  }

  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000E6CC;
  v16[3] = &unk_100078FF0;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync((dispatch_queue_t)workQueue, v16);
}

- (void)_deleteTaskEntriesWithIdentifiers:(id)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v21 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "_deleteEntriesWithIdentifiers for session %@",  buf,  0xCu);
  }

  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000E594;
  v16[3] = &unk_100078FF0;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync((dispatch_queue_t)workQueue, v16);
}

- (void).cxx_destruct
{
}

@end