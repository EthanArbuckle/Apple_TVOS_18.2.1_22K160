@interface DownloadDatabaseSchema
+ (BOOL)_migrateToCurrentUserVersionUsingDatabase:(id)a3;
+ (id)databasePath;
+ (void)createFunctionsInDatabase:(id)a3;
+ (void)createSchemaInDatabase:(id)a3;
@end

@implementation DownloadDatabaseSchema

+ (void)createFunctionsInDatabase:(id)a3
{
}

+ (void)createSchemaInDatabase:(id)a3
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CA5A8;
  v5[3] = &unk_10034DAD8;
  v5[4] = &v6;
  objc_msgSend( a3,  "prepareStatementForSQL:cache:usingBlock:",  @"SELECT name FROM sqlite_master WHERE name='download';",
    0LL,
    v5);
  [a3 executeSQL:@"PRAGMA legacy_file_format = 0;"];
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS application_id (effective_client_id INTEGER, bundle_id TEXT NOT NULL, UNIQUE (bundle_id))");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS asset (pid INTEGER, download_id INTEGER, asset_order INTEGER DEFAULT 0, asset_type TEXT, bytes_total INTEGER, url TEXT, local_path TEXT, destination_url TEXT, path_extension TEXT, retry_count INTEGER, http_method TEXT, initial_odr_size INTEGER, is_discretionary INTEGER DEFAULT 0, is_downloaded INTEGER DEFAULT 0, is_drm_free INTEGER DEFAULT 0, is_external INTEGER DEFAULT 0, is_hls INTEGER DEFAULT 0, is_local_cache_server INTEGER DEFAULT 0, is_zip_streamable INTEGER DEFAULT 0, processing_types INTEGER DEFAULT 0, video_dimensions TEXT, timeout_interval REAL, store_flavor TEXT, download_token INTEGER DEFAULT 0, blocked_reason INTEGER DEFAULT 0, avfoundation_blocked INTEGER DEFAULT 0, service_type INTEGER DEFAULT 0, protection_type INTEGER DEFAULT 0,store_download_key TEXT, etag TEXT, bytes_to_hash INTEGER, hash_type INTEGER DEFAULT 0, server_guid TEXT, file_protection TEXT, variant_id TEXT, hash_array BLOB, http_headers BLOB, request_parameters BLOB, body_data BLOB, body_data_file_path TEXT,sinfs_data BLOB, dpinfo_data BLOB, uncompressed_size INTEGER DEFAULT 0, url_session_task_id INTEGER DEFAULT -1, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS download (pid INTEGER, airplay_content_type TEXT, artist_name TEXT, artwork_is_prerendered INTEGER DEFAULT 0, artwork_template_name TEXT, auto_update_time INTEGER, beta_external_version_identifier INTEGER DEFAULT 0, bundle_id TEXT, bundle_version TEXT, cancel_if_duplicate INTEGER DEFAULT 0, cancel_on_failure INTEGER DEFAULT 0, cancel_url TEXT, client_id TEXT, collection_artist_name TEXT, collection_group_count INTEGER, collection_item_count INTEGER, collection_name TEXT, composer_name TEXT, diverted_job_id INTEGER, document_target_id TEXT, download_permalink TEXT, duet_transfer_type INTEGER DEFAULT 0, duration_in_ms INTEGER DEFAULT 0, effective_client_id INTEGER DEFAULT 0, enable_extensions INTEGER DEFAULT 0, episode_id TEXT, episode_sort_id INTEGER, handler_id INTEGER DEFAULT 0, has_4k INTEGER DEFAULT 0, has_dolby_vision INTEGER DEFAULT 0, has_hdr INTEGER DEFAULT 0, has_messages_extension INTEGER DEFAULT 0, hls_playlist_url TEXT, genre_name TEXT, index_in_collection INTEGER DEFAULT 0, index_in_collection_group INTEGER, is_automatic INTEGER DEFAULT 0, is_compilation INTEGER DEFAULT 0, is_device_based_vpp INTEGER DEFAULT 0, is_diverted INTEGER DEFAULT 0, is_explicit INTEGER DEFAULT 0, is_from_store INTEGER DEFAULT 0, is_hd INTEGER DEFAULT 0, is_hls INTEGER DEFAULT 0, is_premium INTEGER DEFAULT 0, is_private INTEGER DEFAULT 0, is_purchase INTEGER DEFAULT 0, is_redownload INTEGER DEFAULT 0, is_restore INTEGER DEFAULT 0, is_rental INTEGER DEFAULT 0, is_sample INTEGER DEFAULT 0, is_shared INTEGER DEFAULT 0, is_store_queued INTEGER DEFAULT 0, is_tv_template INTEGER DEFAULT 0, is_music_show INTEGER DEFAULT 0, kind TEXT, launch_prohibited INTEGER DEFAULT 0, library_id TEXT, loading_priority REAL, long_description TEXT, long_season_description TEXT, messages_artwork_url TEXT, network_name TEXT, order_key DOUBLE DEFAULT 0, order_seed INTEGER DEFAULT 0, override_audit_token_data BLOB, page_progression_direction TEXT, podcast_episode_guid TEXT, podcast_feed_url TEXT, podcast_type TEXT, policy_id INTEGER DEFAULT 0, priority INTEGER DEFAULT 0, preferred_asset_flavor TEXT, purchase_id INTEGER DEFAULT 0, rate_limit INTEGER, reason INTEGER DEFAULT 0,ref_app TEXT, ref_url TEXT, release_date INTEGER, release_year INTEGER, rental_id INTEGER, resource_timeout_interval REAL, season_number INTEGER, series_name TEXT, software_type TEXT, short_description TEXT, show_composer INTEGER DEFAULT 0, suppress_error_dialogs INTEGER NOT NULL DEFAULT 0, store_account_id INTEGER, store_account_name TEXT, store_artist_id INTEGER, store_cohort TEXT, store_collection_id INTEGER, store_composer_id INTEGER, store_download_key TEXT, store_front_id TEXT, store_genre_id INTEGER, store_item_id INTEGER, store_match_status INTEGER NOT NULL DEFAULT 0, store_publication_version INTEGER DEFAULT 0, store_preorder_id INTEGER, store_purchase_date INTEGER, store_redownload_parameters TEXT, store_redownload_status INTEGER NOT NULL DEFAULT 0, store_saga_id INTEGER, store_software_version_id INTEGER, store_transaction_id TEXT, store_url TEXT, store_xid TEXT, thumbnail_newsstand_binding_edge TEXT, thumbnail_newsstand_binding_type TEXT, thumbnail_url TEXT, timeout_interval REAL, timestamp INTEGER DEFAULT (strftime('%s', 'now')), title TEXT, transaction_id INTEGER DEFAULT 0, variant_id TEXT, work_name TEXT, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS download_policy (pid INTEGER, policy_data BLOB, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS download_state (pid INTEGER, download_id INTEGER, phase TEXT, is_restricted INTEGER DEFAULT 0, restore_state INTEGER DEFAULT 0, blocked_reason INTEGER NOT NULL DEFAULT 0, can_pause INTEGER DEFAULT 1, can_cancel INTEGER DEFAULT 1, can_prioritize INTEGER DEFAULT 1, is_server_finished INTEGER DEFAULT 0, has_restore_data INTEGER DEFAULT -1, last_odr_action INTEGER DEFAULT 0, restore_data_size INTEGER DEFAULT 0, store_queue_refresh_count INTEGER DEFAULT 0, did_restore_data INTEGER DEFAULT 0, auto_update_state INTEGER NOT NULL DEFAULT 0, download_error BLOB, restore_error BLOB, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS finished_download (pid INTEGER, finish_url TEXT, store_account_id INTEGER NOT NULL, store_item_id INTEGER, store_transaction_id TEXT, PRIMARY KEY(pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS persistent_download (download_id INTEGER, manager_id INTEGER, PRIMARY KEY (download_id, manager_id));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS persistent_manager (pid INTEGER, client_id TEXT, filters_external_downloads INTEGER DEFAULT 0, migration_version INTEGER DEFAULT 0, wake_up_on_finish INTEGER DEFAULT 0, persistence_id TEXT, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS persistent_manager_kind (pid INTEGER, manager_id INTEGER, download_kind TEXT, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS preorder (pid INTEGER, artist_name TEXT, kind TEXT, release_date INTEGER, release_date_string TEXT, store_account_id INTEGER, store_item_id INTEGER, store_preorder_id INTEGER, title TEXT, image_collection_data BLOB, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS canceled_preorder (pid INTEGER, store_account_id INTEGER NOT NULL DEFAULT 0, store_item_id INTEGER NOT NULL DEFAULT 0, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS client (pid INTEGER, audit_token_data BLOB, client_type INTEGER DEFAULT 0, client_id TEXT NOT NULL, PRIMARY KEY (pid), UNIQUE (client_id));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS purchase (pid INTEGER, batch_id INTEGER DEFAULT 0, client_id INTEGER DEFAULT 0, order_id DOUBLE DEFAULT 0, state INTEGER DEFAULT 0, encoded_data BLOB, encoded_error BLOB, encoded_response BLOB, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS purchase_manager (pid INTEGER, client_id_header TEXT, manager_id TEXT, process_id TEXT, url_bag_type TEXT, PRIMARY KEY (pid));");
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS application_workspace_state (pid INTEGER, bundle_id TEXT NOT NULL, download_id INTEGER, expected_phase TEXT NOT NULL DEFAULT 0, retry_count INTEGER NOT NULL DEFAULT 0, time_updated INTEGER NOT NULL DEFAULT 0, transaction_id INTEGER, PRIMARY KEY (pid), UNIQUE (bundle_id));");
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS application_workspace_state_bundle_id ON application_workspace_state (bundle_id);"];
  objc_msgSend( a3,  "executeSQL:",  @"CREATE TABLE IF NOT EXISTS trnsaction (pid INTEGER, bundle_id TEXT, type INTEGER DEFAULT 0, PRIMARY KEY (pid));");
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS asset_download_id ON asset (download_id);"];
  objc_msgSend( a3,  "executeSQL:",  @"CREATE INDEX IF NOT EXISTS download_priority_order_key ON download (priority DESC, order_key ASC);");
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS download_is_restore ON download (is_restore);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS download_kind ON download (kind);"];
  [a3 executeSQL:@"CREATE INDEX IF NOT EXISTS preorder_preorder_id ON preorder (store_preorder_id);"];
  if (*((_BYTE *)v7 + 24))
  {
    [a1 _migrateToCurrentUserVersionUsingDatabase:a3];
  }

  else
  {
    sub_1000CA5E0(a3);
    [a3 setUserVersion:13000];
  }

  _Block_object_dispose(&v6, 8);
}

+ (id)databasePath
{
  v2 = objc_alloc(&OBJC_CLASS___NSArray);
  v3 = -[NSArray initWithObjects:]( v2,  "initWithObjects:",  CPSharedResourcesDirectory(v2),  @"Media",  @"Downloads",  @"downloads.28.sqlitedb",  0LL);
  v4 = +[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v3);

  return v4;
}

+ (BOOL)_migrateToCurrentUserVersionUsingDatabase:(id)a3
{
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  int v29 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000CAFD4;
  v25[3] = &unk_10034DAD8;
  v25[4] = &v26;
  [a3 prepareStatementForSQL:@"PRAGMA user_version;" cache:0 usingBlock:v25];
  do
  {
    v4 = (char *)(v27 + 3);
    int v5 = *((_DWORD *)v27 + 6);
    unsigned int v6 = v5 >> 3;
    if (v5 > 7099)
    {
      if (v5 > 9299)
      {
        if (v5 > 10099)
        {
          if (v5 > 10999)
          {
            if (v5 == 11000)
            {
              unsigned __int8 v7 = sub_1000CC8BC(a3, v4);
            }

            else
            {
              if (v5 != 11200)
              {
LABEL_121:
                id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
                if (!v9) {
                  id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
                }
                unsigned int v19 = [v9 shouldLog];
                unsigned int v20 = [v9 shouldLogToDisk];
                v21 = (os_log_s *)[v9 OSLogObject];
                v22 = v21;
                if (v20) {
                  v19 |= 2u;
                }
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                  uint64_t v23 = v19;
                }
                else {
                  uint64_t v23 = v19 & 2;
                }
                if ((_DWORD)v23)
                {
                  int v24 = *((_DWORD *)v27 + 6);
                  int v30 = 67109376;
                  int v31 = v24;
                  __int16 v32 = 1024;
                  int v33 = 13000;
                  uint64_t v16 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  16LL,  "No database migration function for %d => %d",  &v30,  14);
                  if (v16) {
                    goto LABEL_119;
                  }
                }

                goto LABEL_120;
              }

              unsigned __int8 v7 = sub_1000CC908(a3, v4);
            }
          }

          else if (v5 == 10100)
          {
            unsigned __int8 v7 = sub_1000CC7F4(a3, v4);
          }

          else
          {
            if (v5 != 10300) {
              goto LABEL_121;
            }
            unsigned __int8 v7 = sub_1000CC850(a3, v4);
          }
        }

        else
        {
          if (v5 > 9999)
          {
            switch(v5)
            {
              case 10000:
                unsigned __int8 v7 = sub_1000CC668(a3, v4);
                continue;
              case 10001:
                unsigned __int8 v7 = sub_1000CC6B4(a3, v4);
                continue;
              case 10002:
                unsigned __int8 v7 = sub_1000CC710(a3, v4);
                continue;
              case 10003:
                unsigned __int8 v7 = sub_1000CC74C(a3, v4);
                continue;
              case 10004:
                unsigned __int8 v7 = sub_1000CC788(a3, v4);
                continue;
              default:
                goto LABEL_121;
            }
          }

          switch(v5)
          {
            case 9300:
              unsigned __int8 v7 = sub_1000CC584(a3, v4);
              break;
            case 9301:
              unsigned __int8 v7 = sub_1000CC5D0(a3, v4);
              break;
            case 9302:
              unsigned __int8 v7 = sub_1000CC61C(a3, v4);
              break;
            default:
              goto LABEL_121;
          }
        }
      }

      else
      {
        if (v5 > 8999)
        {
          switch(v5)
          {
            case 9000:
              unsigned __int8 v7 = sub_1000CC358(a3, v4);
              continue;
            case 9001:
              unsigned __int8 v7 = sub_1000CC3D4(a3, v4);
              continue;
            case 9002:
              unsigned __int8 v7 = sub_1000CC3D8(a3, v4);
              continue;
            case 9003:
              unsigned __int8 v7 = sub_1000CC3DC(a3, v4);
              continue;
            case 9004:
              unsigned __int8 v7 = sub_1000CC438(a3, v4);
              continue;
            case 9005:
              unsigned __int8 v7 = sub_1000CC484(a3, v4);
              continue;
            case 9006:
              unsigned __int8 v7 = sub_1000CC4C0(a3, v4);
              continue;
            case 9007:
              unsigned __int8 v7 = sub_1000CC4FC(a3, v4);
              continue;
            case 9008:
              unsigned __int8 v7 = sub_1000CC548(a3, v4);
              continue;
            default:
              goto LABEL_121;
          }
        }

        switch(v5)
        {
          case 8000:
            unsigned __int8 v7 = sub_1000CC090(a3, v4);
            break;
          case 8001:
            unsigned __int8 v7 = sub_1000CC0CC(a3, v4);
            break;
          case 8002:
            unsigned __int8 v7 = sub_1000CC108(a3, v4);
            break;
          case 8003:
            unsigned __int8 v7 = sub_1000CC144(a3, v4);
            break;
          case 8004:
            unsigned __int8 v7 = sub_1000CC180(a3, v4);
            break;
          case 8005:
            unsigned __int8 v7 = sub_1000CC1BC(a3, v4);
            break;
          case 8006:
            unsigned __int8 v7 = sub_1000CC1F8(a3, v4);
            break;
          default:
            switch(v5)
            {
              case 8300:
                unsigned __int8 v7 = sub_1000CC244(a3, v4);
                continue;
              case 8301:
                unsigned __int8 v7 = sub_1000CC280(a3, v4);
                continue;
              case 8302:
                unsigned __int8 v7 = sub_1000CC2E0(a3, v4);
                continue;
              case 8303:
                unsigned __int8 v7 = sub_1000CC31C(a3, v4);
                continue;
              default:
                if (v5 != 7100) {
                  goto LABEL_121;
                }
                unsigned __int8 v7 = sub_1000CC054(a3, v4);
                break;
            }

            break;
        }
      }
    }

    else if (v5 > 6099)
    {
      switch(v5)
      {
        case 7000:
          unsigned __int8 v7 = sub_1000CBC0C(a3, v4);
          break;
        case 7001:
          unsigned __int8 v7 = sub_1000CBC48(a3, v4);
          break;
        case 7002:
          unsigned __int8 v7 = sub_1000CBC84(a3, v4);
          break;
        case 7003:
          unsigned __int8 v7 = sub_1000CBCD0(a3, v4);
          break;
        case 7004:
          unsigned __int8 v7 = sub_1000CBD0C(a3, v4);
          break;
        case 7005:
          unsigned __int8 v7 = sub_1000CBD58(a3, v4);
          break;
        case 7006:
          unsigned __int8 v7 = sub_1000CBD94(a3, v4);
          break;
        case 7007:
          unsigned __int8 v7 = sub_1000CBDD0(a3, v4);
          break;
        case 7008:
          unsigned __int8 v7 = sub_1000CBE0C(a3, v4);
          break;
        case 7009:
          unsigned __int8 v7 = sub_1000CBE58(a3, v4);
          break;
        case 7010:
          unsigned __int8 v7 = sub_1000CBE94(a3, v4);
          break;
        case 7011:
          unsigned __int8 v7 = sub_1000CBEE0(a3, v4);
          break;
        case 7012:
          unsigned __int8 v7 = sub_1000CBF64(a3, v4);
          break;
        case 7013:
          unsigned __int8 v7 = sub_1000CBFA0(a3, v4);
          break;
        case 7014:
          unsigned __int8 v7 = sub_1000CBFDC(a3, v4);
          break;
        case 7015:
          unsigned __int8 v7 = sub_1000CC018(a3, v4);
          break;
        default:
          if (v5 != 6100) {
            goto LABEL_121;
          }
          unsigned __int8 v7 = sub_1000CBBB0(a3, v4);
          break;
      }
    }

    else if (v5 > 5100)
    {
      switch(v5)
      {
        case 6000:
          unsigned __int8 v7 = sub_1000CB3D0(a3, v4);
          break;
        case 6001:
          unsigned __int8 v7 = sub_1000CB848(a3, v4);
          break;
        case 6002:
          unsigned __int8 v7 = sub_1000CB884(a3, v4);
          break;
        case 6003:
          unsigned __int8 v7 = sub_1000CB8C0(a3, v4);
          break;
        case 6004:
          unsigned __int8 v7 = sub_1000CB8FC(a3, v4);
          break;
        case 6005:
          unsigned __int8 v7 = sub_1000CB938(a3, v4);
          break;
        case 6006:
          unsigned __int8 v7 = sub_1000CB984(a3, v4);
          break;
        case 6007:
          unsigned __int8 v7 = sub_1000CB9C0(a3, v4);
          break;
        case 6008:
          unsigned __int8 v7 = sub_1000CB9FC(a3, v4);
          break;
        case 6009:
          unsigned __int8 v7 = sub_1000CBA38(a3, v4);
          break;
        case 6010:
          unsigned __int8 v7 = sub_1000CBA74(a3, v4);
          break;
        case 6011:
          unsigned __int8 v7 = sub_1000CBAC0(a3, v4);
          break;
        case 6012:
          unsigned __int8 v7 = sub_1000CBAFC(a3, v4);
          break;
        case 6013:
          uint64_t v8 = (id (*)(void *, const char *))sub_1000CBB38;
LABEL_108:
          unsigned __int8 v7 = v8(a3, v4);
          break;
        case 6014:
          unsigned __int8 v7 = sub_1000CBB74(a3, v4);
          break;
        default:
          unsigned __int8 v7 = sub_1000CB394(a3, v4);
          break;
      }
    }

    else
    {
      switch(v5)
      {
        case 5000:
          unsigned __int8 v7 = sub_1000CB054(a3, v4);
          break;
        case 5001:
          unsigned __int8 v7 = sub_1000CB090(a3, v4);
          break;
        case 5002:
          unsigned __int8 v7 = sub_1000CB0CC(a3, v4);
          break;
        case 5003:
          unsigned __int8 v7 = sub_1000CB108(a3, v4);
          break;
        case 5004:
          unsigned __int8 v7 = sub_1000CB154(a3, v4);
          break;
        case 5005:
          unsigned __int8 v7 = sub_1000CB190(a3, v4);
          break;
        case 5006:
          unsigned __int8 v7 = sub_1000CB1CC(a3, v4);
          break;
        case 5007:
          unsigned __int8 v7 = sub_1000CB218(a3, v4);
          break;
        case 5008:
          unsigned __int8 v7 = sub_1000CB254(a3, v4);
          break;
        case 5009:
          unsigned __int8 v7 = sub_1000CB290(a3, v4);
          break;
        case 5010:
          unsigned __int8 v7 = sub_1000CB2CC(a3, v4);
          break;
        default:
          uint64_t v8 = sub_1000CB044;
          if (!v5) {
            goto LABEL_108;
          }
          if (v5 != 5100) {
            goto LABEL_121;
          }
          unsigned __int8 v7 = sub_1000CB358(a3, v4);
          break;
      }
    }
  }

  while ((v7 & 1) != 0);
  id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v10 = [v9 shouldLog];
  unsigned int v11 = [v9 shouldLogToDisk];
  v12 = (os_log_s *)[v9 OSLogObject];
  v13 = v12;
  if (v11) {
    v10 |= 2u;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = v10 & 2;
  }
  if ((_DWORD)v14)
  {
    int v15 = *((_DWORD *)v27 + 6);
    int v30 = 67109120;
    int v31 = v15;
    uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  16LL,  "Database migration failed for version: %d",  &v30);
    if (v16)
    {
LABEL_119:
      v17 = (void *)v16;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
      free(v17);
      SSFileLog(v9, @"%@");
    }
  }

@end