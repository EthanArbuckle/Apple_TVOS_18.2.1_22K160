@interface MCMSQLiteDB
+ (BOOL)moveDBWithURL:(id)a3 toURL:(id)a4 queue:(id)a5 error:(id *)a6;
+ (sqlite3)openDBWithURL:(id)a3 queue:(id)a4 error:(id *)a5;
- (BOOL)_deleteCodeSigningWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_insertChildIdentifier:(id)a3 forParentIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_insertCodeSigningData:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_insertCodeSigningInfo:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_performInsertOrUpdateQuery:(const char *)a3 withCodeSigningEntry:(id)a4 forIdentifier:(id)a5 isUpdate:(BOOL)a6 error:(id *)a7;
- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 error:(id *)a5;
- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 expectedChanges:(int)a5 error:(id *)a6;
- (BOOL)_performTwoParameterQuery:(const char *)a3 withTextInputOne:(id)a4 andTextInputTwo:(id)a5 expectedChanges:(int)a6 error:(id *)a7;
- (BOOL)_sqliteExec:(id)a3 error:(id *)a4;
- (BOOL)addCodeSigningEntry:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (BOOL)deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:(id *)a3;
- (BOOL)deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:(int *)a3 error:(id *)a4;
- (BOOL)deleteCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)invalidateCodeSigningForIdentifierAndAllChildren:(id)a3 error:(id *)a4;
- (BOOL)invalidateCodeSigningWithIdentifier:(id)a3 error:(id *)a4;
- (MCMSQLiteDB)initWithURL:(id)a3 queue:(id)a4 error:(id *)a5;
- (MCMSQLiteDBCodeSigningPeerageDelegate)peerageDelegate;
- (NSURL)url;
- (OS_dispatch_queue)queue;
- (id)_codeSigningEntryFromStatementRow:(sqlite3_stmt *)a3 error:(id *)a4;
- (id)_selectCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (id)childIdentifiersForParentIdentifier:(id)a3 error:(id *)a4;
- (id)childParentMapWithError:(id *)a3;
- (id)codeSigningEntryWithIdentifier:(id)a3 error:(id *)a4;
- (id)enumerateIdentifiersAndCodeSigningInfoUsingBlock:(id)a3;
- (id)identifiersWithError:(id *)a3;
- (id)parentIdentifierForChildIdentifier:(id)a3 error:(id *)a4;
- (sqlite3)db;
- (void)closeDB;
- (void)dealloc;
- (void)setDb:(sqlite3 *)a3;
- (void)setPeerageDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MCMSQLiteDB

- (MCMSQLiteDB)initWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v10 = (dispatch_queue_s *)a4;
  dispatch_assert_queue_V2(v10);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMSQLiteDB;
  v11 = -[MCMSQLiteDB init](&v17, sel_init);
  v12 = v11;
  if (v11
    && ((objc_storeStrong((id *)&v11->_queue, a4), objc_storeStrong((id *)&v12->_url, a3), !v12->_url)
     || ((uint64_t v13 = [(id)objc_opt_class() openDBWithURL:v12->_url queue:v10 error:a5],
          v12->_db = (sqlite3 *)v13,
          v12->_url)
       ? (BOOL v14 = v13 == 0)
       : (BOOL v14 = 1),
         v14)))
  {
    v15 = 0LL;
  }

  else
  {
    v15 = v12;
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[MCMSQLiteDB closeDB](self, "closeDB");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMSQLiteDB;
  -[MCMSQLiteDB dealloc](&v3, sel_dealloc);
}

- (BOOL)_sqliteExec:(id)a3 error:(id *)a4
{
  errmsg[1] = *(char **)MEMORY[0x1895F89C0];
  id v6 = a3;
  errmsg[0] = 0LL;
  v7 = -[MCMSQLiteDB db](self, "db");
  id v8 = v6;
  int v9 = sqlite3_exec(v7, (const char *)[v8 UTF8String], 0, 0, errmsg);
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __33__MCMSQLiteDB__sqliteExec_error___block_invoke;
    v12[3] = &unk_18A29E078;
    id v13 = v8;
    BOOL v14 = self;
    v15 = errmsg[0];
    __33__MCMSQLiteDB__sqliteExec_error___block_invoke((uint64_t)v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_free(errmsg[0]);

    if (a4)
    {
      id v10 = v10;
      *a4 = v10;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v9 == 0;
}

- (void)closeDB
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  container_log_handle_for_category();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = -[MCMSQLiteDB url](self, "url");
    [v7 path];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412290;
    v12 = v8;
    _os_log_debug_impl(&dword_188846000, v3, OS_LOG_TYPE_DEBUG, "closing %@", (uint8_t *)&v11, 0xCu);
  }

  int v4 = sqlite3_close(-[MCMSQLiteDB db](self, "db"));
  if (v4)
  {
    int v5 = v4;
    container_log_handle_for_category();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 path];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412546;
      v12 = v10;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_error_impl( &dword_188846000,  v6,  OS_LOG_TYPE_ERROR,  "sqlite3_close for %@ failed: %d",  (uint8_t *)&v11,  0x12u);
    }
  }

  -[MCMSQLiteDB setDb:](self, "setDb:", 0LL);
}

- (BOOL)_performTwoParameterQuery:(const char *)a3 withTextInputOne:(id)a4 andTextInputTwo:(id)a5 expectedChanges:(int)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a5;
  ppStmt = 0LL;
  int v14 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0LL))
  {
    objc_super v17 = ppStmt;
    id v18 = v12;
    if (sqlite3_bind_text( v17,  1,  (const char *)[v18 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v38[0] = MEMORY[0x1895F87A8];
      v38[1] = 3221225472LL;
      v38[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21;
      v38[3] = &unk_18A29E078;
      id v39 = v18;
      v40 = self;
      v41 = v14;
      __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21((uint64_t)v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v39;
    }

    else
    {
      if (!v13
        || (v24 = ppStmt,
            id v25 = v13,
            !sqlite3_bind_text( v24,  2,  (const char *)[v25 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)))
      {
        if (sqlite3_step(ppStmt) == 101)
        {
          if (a6 == -1 || (int v26 = sqlite3_changes(v14), v26 == a6))
          {
            v16 = 0LL;
            BOOL v20 = 1;
            goto LABEL_8;
          }

          v30[0] = MEMORY[0x1895F87A8];
          v30[1] = 3221225472LL;
          v30[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31;
          v30[3] = &unk_18A29E0C8;
          v30[4] = self;
          v30[5] = a3;
          int v31 = v26;
          int v32 = a6;
          uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31((uint64_t)v30);
        }

        else
        {
          v33[0] = MEMORY[0x1895F87A8];
          v33[1] = 3221225472LL;
          v33[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27;
          v33[3] = &unk_18A29E0A0;
          v33[4] = self;
          v33[5] = v14;
          uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27((uint64_t)v33);
        }

        goto LABEL_3;
      }

      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25;
      v34[3] = &unk_18A29E078;
      id v35 = v25;
      v36 = self;
      v37 = v14;
      __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25((uint64_t)v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;
    }

    goto LABEL_7;
  }

  v42[0] = MEMORY[0x1895F87A8];
  v42[1] = 3221225472LL;
  v42[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke;
  v42[3] = &unk_18A29E0A0;
  v42[4] = self;
  v42[5] = v14;
  uint64_t v15 = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke((uint64_t)v42);
LABEL_3:
  v16 = (void *)v15;
LABEL_7:
  BOOL v20 = 0;
LABEL_8:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = -[MCMSQLiteDB url](self, "url");
      [v27 path];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      int v29 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      v45 = v28;
      __int16 v46 = 1024;
      int v47 = v29;
      _os_log_error_impl(&dword_188846000, v21, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a7) {
    char v22 = v20;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0) {
    *a7 = v16;
  }

  return v20;
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 expectedChanges:(int)a5 error:(id *)a6
{
  return -[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]( self,  "_performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:",  a3,  a4,  0LL,  *(void *)&a5,  a6);
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 error:(id *)a5
{
  return -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:expectedChanges:error:]( self,  "_performSingleParameterQuery:withTextInput:expectedChanges:error:",  a3,  a4,  0xFFFFFFFFLL,  a5);
}

- (BOOL)_insertChildIdentifier:(id)a3 forParentIdentifier:(id)a4 error:(id *)a5
{
  v17[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v17[0] = 0LL;
  BOOL v10 = -[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]( self,  "_performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:",  "INSERT OR REPLACE INTO child_bundles (parent_id, child_code_signing_id_text) SELECT id, ? FROM code_signing_in fo WHERE code_signing_id_text = ?;",
          v8,
          v9,
          0xFFFFFFFFLL,
          v17);
  id v11 = v17[0];
  if (v10)
  {
    -[MCMSQLiteDB peerageDelegate](self, "peerageDelegate");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 codeSigningDB:self addChildIdentifier:v8 forParentIdentifier:v9];
  }

  else
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke;
    v15[3] = &unk_18A29E6D8;
    id v16 = v8;
    __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke((uint64_t)v15);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v11 = v13;
      *a5 = v11;
    }

    else
    {
      id v11 = v13;
    }
  }

  return v10;
}

- (BOOL)_performInsertOrUpdateQuery:(const char *)a3 withCodeSigningEntry:(id)a4 forIdentifier:(id)a5 isUpdate:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v63 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a5;
  ppStmt = 0LL;
  int v14 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0LL))
  {
    if (sqlite3_bind_int(ppStmt, 1, [v12 isInvalid]))
    {
      v53[0] = MEMORY[0x1895F87A8];
      v53[1] = 3221225472LL;
      v53[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40;
      v53[3] = &unk_18A29E078;
      id v54 = v12;
      v55 = self;
      v56 = v14;
      __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40((uint64_t)v53);
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v17 = v54;
    }

    else
    {
      int v18 = [v12 isPlaceholder];
      else {
        int v19 = 0;
      }
      int v20 = v19 | v18;
      else {
        int v21 = 0;
      }
      int v22 = v20 | v21;
      if (sqlite3_bind_int(ppStmt, 2, v22))
      {
        v48[0] = MEMORY[0x1895F87A8];
        v48[1] = 3221225472LL;
        v48[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44;
        v48[3] = &unk_18A29E0F0;
        int v52 = v22;
        id v49 = v12;
        v50 = self;
        v51 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44((uint64_t)v48);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v17 = v49;
      }

      else if (sqlite3_bind_int(ppStmt, 3, [v12 isRegisteredByCaller]))
      {
        v44[0] = MEMORY[0x1895F87A8];
        v44[1] = 3221225472LL;
        v44[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48;
        v44[3] = &unk_18A29E078;
        id v45 = v12;
        __int16 v46 = self;
        int v47 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48((uint64_t)v44);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v17 = v45;
      }

      else if (sqlite3_bind_int(ppStmt, 4, [v12 dataContainerClass]))
      {
        v40[0] = MEMORY[0x1895F87A8];
        v40[1] = 3221225472LL;
        v40[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52;
        v40[3] = &unk_18A29E078;
        id v41 = v12;
        v42 = self;
        v43 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52((uint64_t)v40);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v17 = v41;
      }

      else
      {
        v23 = ppStmt;
        id v24 = v13;
        if (!sqlite3_bind_text( v23,  5,  (const char *)[v24 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          if (sqlite3_step(ppStmt) == 101)
          {
            if (!v8 || (int v32 = sqlite3_changes(v14), v32 == 1))
            {
              id v16 = 0LL;
              BOOL v25 = 1;
              goto LABEL_22;
            }

            v33[0] = MEMORY[0x1895F87A8];
            v33[1] = 3221225472LL;
            v33[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62;
            v33[3] = &unk_18A29E050;
            v33[4] = self;
            v33[5] = a3;
            int v34 = v32;
            uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62((uint64_t)v33);
          }

          else
          {
            v35[0] = MEMORY[0x1895F87A8];
            v35[1] = 3221225472LL;
            v35[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60;
            v35[3] = &unk_18A29E0A0;
            v35[4] = self;
            v35[5] = v14;
            uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60((uint64_t)v35);
          }

          goto LABEL_3;
        }

        v36[0] = MEMORY[0x1895F87A8];
        v36[1] = 3221225472LL;
        v36[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56;
        v36[3] = &unk_18A29E078;
        id v37 = v24;
        v38 = self;
        id v39 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56((uint64_t)v36);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v17 = v37;
      }
    }

    goto LABEL_21;
  }

  v57[0] = MEMORY[0x1895F87A8];
  v57[1] = 3221225472LL;
  v57[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke;
  v57[3] = &unk_18A29E0A0;
  v57[4] = self;
  v57[5] = v14;
  uint64_t v15 = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke((uint64_t)v57);
LABEL_3:
  id v16 = (void *)v15;
LABEL_21:
  BOOL v25 = 0;
LABEL_22:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 path];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      v60 = v30;
      __int16 v61 = 1024;
      int v62 = v31;
      _os_log_error_impl(&dword_188846000, v26, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a7) {
    char v27 = v25;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0) {
    *a7 = v16;
  }

  return v25;
}

- (BOOL)_insertCodeSigningInfo:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  v26[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v26[0] = 0LL;
  BOOL v10 = 1;
  BOOL v11 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]( self,  "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:",  "UPDATE code_signing_info SET invalid=?, placeholder=?, registered_by_caller=?, data_container_class=? WHERE co de_signing_id_text=?;",
          v8,
          v9,
          1LL,
          v26);
  id v12 = v26[0];
  id v13 = v12;
  if (!v11)
  {
    [v12 domain];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v14 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v15 = [v13 code];

      if (v15 == 68)
      {

        id v23 = 0LL;
        BOOL v16 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]( self,  "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:",  "INSERT INTO code_signing_info (invalid, placeholder, registered_by_caller, data_container_class, code_si gning_id_text) VALUES (?, ?, ?, ?, ?);",
                v8,
                v9,
                0LL,
                &v23);
        id v13 = v23;
        if (v16)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }

        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        v21[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71;
        v21[3] = &unk_18A29E6D8;
        objc_super v17 = &v22;
        id v22 = v9;
        uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71((uint64_t)v21);
        goto LABEL_8;
      }
    }

    else
    {
    }

    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke;
    v24[3] = &unk_18A29E6D8;
    objc_super v17 = &v25;
    id v25 = v9;
    uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke((uint64_t)v24);
LABEL_8:
    int v19 = (void *)v18;

    if (a5)
    {
      id v13 = v19;
      BOOL v10 = 0;
      *a5 = v13;
    }

    else
    {
      BOOL v10 = 0;
      id v13 = v19;
    }
  }

- (BOOL)_insertCodeSigningData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  ppStmt = 0LL;
  BOOL v10 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2( v10,  "INSERT OR REPLACE INTO code_signing_data (cs_info_id, data) SELECT id, ? FROM code_signing_info WHERE code_sig ning_id_text = ?;",
          -1,
          &ppStmt,
          0LL))
  {
    int v14 = (void *)MEMORY[0x1896079E8];
    [v8 codeSigningInfo];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v38 = 0LL;
    [v14 dataWithPropertyList:v15 format:200 options:0 error:&v38];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v38;

    if (!v16)
    {
      v35[0] = MEMORY[0x1895F87A8];
      v35[1] = 3221225472LL;
      v35[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78;
      v35[3] = &unk_18A29E118;
      id v36 = v8;
      id v37 = v11;
      id v20 = v11;
      __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78((uint64_t)v35);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    }

    objc_super v17 = ppStmt;
    id v12 = v16;
    if (sqlite3_bind_blob64( v17,  1,  (const void *)[v12 bytes],  objc_msgSend(v12, "length"),  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82;
      v34[3] = &unk_18A29E0A0;
      void v34[4] = self;
      v34[5] = v10;
      uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82((uint64_t)v34);
    }

    else
    {
      int v21 = ppStmt;
      id v22 = v9;
      if (sqlite3_bind_text( v21,  2,  (const char *)[v22 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 3221225472LL;
        v30[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86;
        v30[3] = &unk_18A29E078;
        id v31 = v22;
        int v32 = self;
        v33 = v10;
        uint64_t v19 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86((uint64_t)v30);

        goto LABEL_11;
      }

      if (sqlite3_step(ppStmt) == 101)
      {
        BOOL v13 = 1;
        goto LABEL_12;
      }

      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90;
      v29[3] = &unk_18A29E0A0;
      v29[4] = self;
      v29[5] = v10;
      uint64_t v18 = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90((uint64_t)v29);
    }

    uint64_t v19 = v18;

LABEL_11:
    BOOL v13 = 0;
    id v11 = (id)v19;
    goto LABEL_12;
  }

  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke;
  v39[3] = &unk_18A29E0A0;
  v39[4] = self;
  v39[5] = v10;
  __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke((uint64_t)v39);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  id v12 = 0LL;
  BOOL v13 = 0;
LABEL_12:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 path];
      char v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v28 = sqlite3_extended_errcode(v10);
      *(_DWORD *)buf = 138412546;
      v42 = v27;
      __int16 v43 = 1024;
      int v44 = v28;
      _os_log_error_impl(&dword_188846000, v23, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a5) {
    char v24 = v13;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a5 = v11;
  }

  return v13;
}

- (BOOL)_deleteCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  id v6 = a3;
  v15[0] = 0LL;
  BOOL v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:expectedChanges:error:]( self,  "_performSingleParameterQuery:withTextInput:expectedChanges:error:",  "DELETE FROM code_signing_info WHERE code_signing_id_text=?;",
         v6,
         1LL,
         v15);
  id v8 = v15[0];
  id v9 = v8;
  if (v7)
  {
    -[MCMSQLiteDB peerageDelegate](self, "peerageDelegate");
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 codeSigningDB:self removeParentIdentifier:v6];
  }

  else
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke;
    v13[3] = &unk_18A29E6D8;
    id v14 = v8;
    id v11 = v8;
    __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke((uint64_t)v13);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v9 = v9;
      *a4 = v9;
    }
  }

  return v7;
}

- (id)_codeSigningEntryFromStatementRow:(sqlite3_stmt *)a3 error:(id *)a4
{
  v31[3] = *MEMORY[0x1895F89C0];
  id v6 = sqlite3_column_blob(a3, 0);
  if (v6)
  {
    BOOL v7 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603F48]),  "initWithBytesNoCopy:length:freeWhenDone:",  v6,  sqlite3_column_bytes(a3, 0),  0);
    id v27 = 0LL;
    [MEMORY[0x1896079E8] propertyListWithData:v7 options:0 format:0 error:&v27];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v27;
    objc_opt_class();
    id v10 = v8;
    id v11 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }

    if (v11)
    {
      id v12 = -[MCMCodeSigningEntry initWithCodeSigningInfo:]( objc_alloc(&OBJC_CLASS___MCMCodeSigningEntry),  "initWithCodeSigningInfo:",  v10);
      if (v12)
      {
        BOOL v13 = v12;
        -[MCMCodeSigningEntry setInvalid:](v12, "setInvalid:", sqlite3_column_int(a3, 1) != 0);
        unsigned int v14 = sqlite3_column_int(a3, 2);
        -[MCMCodeSigningEntry setPlaceholder:](v13, "setPlaceholder:", v14 & 1);
        -[MCMCodeSigningEntry setAdvanceCopy:](v13, "setAdvanceCopy:", (v14 >> 1) & 1);
        -[MCMCodeSigningEntry setRegisteredByKernel:](v13, "setRegisteredByKernel:", (v14 >> 2) & 1);
        -[MCMCodeSigningEntry setRegisteredByCaller:](v13, "setRegisteredByCaller:", sqlite3_column_int(a3, 3) != 0);
        -[MCMCodeSigningEntry setDataContainerClass:](v13, "setDataContainerClass:", sqlite3_column_int(a3, 4));

        goto LABEL_16;
      }

      objc_super v17 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to allocate codeSigningEntry"];
      v30[0] = @"FunctionName";
      [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      v31[1] = &unk_18A2BE380;
      uint64_t v19 = *MEMORY[0x1896075E0];
      v30[1] = @"SourceFileLine";
      v30[2] = v19;
      v31[2] = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:3];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        int v29 = v17;
        _os_log_error_impl(&dword_188846000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      uint64_t v16 = [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v20];
    }

    else
    {
      uint64_t v15 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:2048 userInfo:0];

      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke;
      v25[3] = &unk_18A29E6D8;
      int v26 = (void *)v15;
      uint64_t v16 = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke((uint64_t)v25);
      id v9 = v26;
    }

    id v9 = (id)v16;
  }

  else
  {
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105;
    v23[3] = &unk_18A29E6D8;
    char v24 = 0LL;
    __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105((uint64_t)v23);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v24;
  }

  if (a4)
  {
    id v9 = v9;
    BOOL v13 = 0LL;
    *a4 = v9;
  }

  else
  {
    BOOL v13 = 0LL;
  }

- (id)_selectCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  ppStmt = 0LL;
  BOOL v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2( v7,  "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.regi stered_by_caller, code_signing_info.data_container_class FROM code_signing_info, code_signing_data WHERE code_s igning_info.id = code_signing_data.cs_info_id AND code_signing_info.code_signing_id_text = ?;",
         -1,
         &ppStmt,
         0LL))
  {
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke;
    v25[3] = &unk_18A29E0A0;
    void v25[4] = self;
    v25[5] = v7;
    uint64_t v8 = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v25);
LABEL_3:
    id v9 = (id)v8;
    goto LABEL_6;
  }

  id v10 = ppStmt;
  id v11 = v6;
  if (sqlite3_bind_text( v10,  1,  (const char *)[v11 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113;
    v21[3] = &unk_18A29E078;
    id v22 = v11;
    id v23 = self;
    char v24 = v7;
    __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113((uint64_t)v21);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }

  int v15 = sqlite3_step(ppStmt);
  if ((v15 - 102) <= 0xFFFFFFFD)
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115;
    v20[3] = &unk_18A29E0A0;
    v20[4] = self;
    v20[5] = v7;
    uint64_t v8 = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115((uint64_t)v20);
    goto LABEL_3;
  }

  if (v15 == 100)
  {
    id v19 = 0LL;
    -[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]( self,  "_codeSigningEntryFromStatementRow:error:",  ppStmt,  &v19);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v19;
    goto LABEL_7;
  }

  id v9 = 0LL;
LABEL_6:
  id v12 = 0LL;
LABEL_7:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 path];
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      int v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_error_impl(&dword_188846000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a4 && !v12) {
    *a4 = v9;
  }

  return v12;
}

- (BOOL)addCodeSigningEntry:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8 || !v9)
  {
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke;
    v34[3] = &unk_18A29E118;
    id v35 = v8;
    id v36 = v9;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke((uint64_t)v34);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v35;
    id v22 = v36;
LABEL_22:

    goto LABEL_23;
  }

  id v33 = 0LL;
  BOOL v10 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", @"BEGIN;", &v33);
  id v11 = v33;
  id v12 = v11;
  if (!v10)
  {
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122;
    v31[3] = &unk_18A29E6D8;
    id v22 = v11;
    id v32 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122((uint64_t)v31);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v32;
    goto LABEL_22;
  }

  if (-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]( self,  "_insertCodeSigningInfo:forIdentifier:error:",  v8,  v9,  a5)
    && -[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]( self,  "_insertCodeSigningData:forIdentifier:error:",  v8,  v9,  a5))
  {
    [v8 childBundleIdentifiers];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      [v8 childBundleIdentifiers];
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v39;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v14);
            }
            -[MCMSQLiteDB _insertChildIdentifier:forParentIdentifier:error:]( self,  "_insertChildIdentifier:forParentIdentifier:error:",  *(void *)(*((void *)&v38 + 1) + 8 * i),  v9,  0LL);
          }

          uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v37 count:16];
        }

        while (v15);
      }
    }

    v30[0] = v12;
    BOOL v18 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", @"COMMIT;", v30);
    id v19 = v30[0];

    if (!v18)
    {
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132;
      v28[3] = &unk_18A29E6D8;
      id v29 = v19;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132((uint64_t)v28);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v20 = 1;
    goto LABEL_26;
  }

  id v27 = v12;
  BOOL v23 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", @"ROLLBACK;", &v27);
  id v19 = v27;

  if (!v23)
  {
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138;
    v25[3] = &unk_18A29E6D8;
    id v22 = v19;
    id v26 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138((uint64_t)v25);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v21 = &v26;
    goto LABEL_22;
  }

- (BOOL)deleteCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    BOOL v7 = -[MCMSQLiteDB _deleteCodeSigningWithIdentifier:error:](self, "_deleteCodeSigningWithIdentifier:error:", v6, a4);
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_7;
    }
  }

  else
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke;
    v10[3] = &unk_18A29E6D8;
    id v11 = 0LL;
    __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v10);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a4 = v8;
  }
LABEL_7:

  return v7;
}

- (id)codeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v19 = 0LL;
  -[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]( self,  "_selectCodeSigningEntryWithIdentifier:error:",  v6,  &v19);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v19;
  id v9 = v8;
  if (v7)
  {
    id v16 = v8;
    -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]( self,  "childIdentifiersForParentIdentifier:error:",  v6,  &v16);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v16;

    if (v10)
    {
LABEL_3:
      [v7 setChildBundleIdentifiers:v10];
      goto LABEL_19;
    }

    [v11 domain];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 67)
      {

        id v11 = 0LL;
        goto LABEL_3;
      }
    }

    else
    {
    }

    container_log_handle_for_category();
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_error_impl(&dword_188846000, v14, OS_LOG_TYPE_ERROR, "Error retrieving childBundleIds: %@", buf, 0xCu);
    }
  }

  else if (v8)
  {
    container_log_handle_for_category();
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "Error retrieving code signing entry: %@",  buf,  0xCu);
    }

    id v11 = v9;
  }

  else
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    id v17[2] = __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke;
    v17[3] = &unk_18A29E6D8;
    id v18 = v6;
    __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v17);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v7 = v18;
  }

  if (a4)
  {
    id v11 = v11;
    BOOL v10 = 0LL;
    BOOL v7 = 0LL;
    *a4 = v11;
  }

  else
  {
    BOOL v10 = 0LL;
    BOOL v7 = 0LL;
  }

- (BOOL)invalidateCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  v14[1] = *(id *)MEMORY[0x1895F89C0];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14[0] = 0LL;
  BOOL v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:error:]( self,  "_performSingleParameterQuery:withTextInput:error:",  "UPDATE code_signing_info SET invalid=1 WHERE code_signing_id_text = ?;",
         v6,
         v14);
  id v8 = v14[0];
  if (!v7)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke;
    v11[3] = &unk_18A29E118;
    id v12 = v6;
    id v13 = v8;
    id v9 = v8;
    __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke((uint64_t)v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v8 = v8;
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)invalidateCodeSigningForIdentifierAndAllChildren:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v31 = (void *)objc_opt_new();
  id v43 = 0LL;
  id v32 = v5;
  uint64_t v6 = -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]( self,  "childIdentifiersForParentIdentifier:error:",  v5,  &v43);
  id v7 = v43;
  id v8 = v7;
  int v30 = (void *)v6;
  if (v6) {
    goto LABEL_2;
  }
  [v7 domain];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v23 isEqualToString:@"MCMErrorDomain"])
  {

    goto LABEL_27;
  }

  BOOL v24 = [v8 code] == 67;

  if (!v24)
  {
LABEL_27:
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v40[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke;
    v40[3] = &unk_18A29E118;
    id v41 = v32;
    id v27 = v8;
    id v42 = v27;
    __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke((uint64_t)v40);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    int v30 = 0LL;
    id v26 = &v41;
    id v25 = v42;
    goto LABEL_28;
  }

  id v8 = 0LL;
  uint64_t v6 = 0LL;
LABEL_2:
  [v31 addObject:v32];
  if (v6) {
    [v31 addObjectsFromArray:v6];
  }
  id v39 = v8;
  BOOL v9 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", @"BEGIN;", &v39);
  id v10 = v39;

  if (v9)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v11 = v31;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v50 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v52;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          id v36 = v10;
          BOOL v16 = -[MCMSQLiteDB invalidateCodeSigningWithIdentifier:error:]( self,  "invalidateCodeSigningWithIdentifier:error:",  v15,  &v36);
          id v17 = v36;

          if (v16)
          {
            container_log_handle_for_category();
            id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v45 = v32;
              __int16 v46 = 2112;
              uint64_t v47 = v15;
              _os_log_debug_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEBUG,  "Invalidating code signing info for %@ child: %@",  buf,  0x16u);
            }

            id v10 = v17;
          }

          else
          {
            container_log_handle_for_category();
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v45 = v32;
              __int16 v46 = 2112;
              uint64_t v47 = v15;
              __int16 v48 = 2112;
              id v49 = v17;
              _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to invalidate code signing info for %@ child %@ : %@",  buf,  0x20u);
            }

            id v10 = 0LL;
            id v18 = (os_log_s *)v17;
          }
        }

        uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v50 count:16];
      }

      while (v12);
    }

    v35[0] = v10;
    BOOL v20 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", @"COMMIT;", v35);
    id v21 = v35[0];

    if (!v20)
    {
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160;
      v33[3] = &unk_18A29E6D8;
      id v34 = v21;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160((uint64_t)v33);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v22 = 1;
    goto LABEL_31;
  }

  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156;
  v37[3] = &unk_18A29E6D8;
  id v25 = v10;
  id v38 = v25;
  __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156((uint64_t)v37);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = &v38;
LABEL_28:

  if (a4)
  {
    id v21 = v21;
    *a4 = v21;
  }

  BOOL v22 = 0;
LABEL_31:

  return v22;
}

- (id)enumerateIdentifiersAndCodeSigningInfoUsingBlock:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v34 = (void (**)(id, void *, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0LL;
  int v4 = -[MCMSQLiteDB db](self, "db");
  db = v4;
  if (!sqlite3_prepare_v2( v4,  "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.reg istered_by_caller, code_signing_info.data_container_class, code_signing_info.code_signing_id_text FROM code_si gning_info, code_signing_data WHERE code_signing_info.id = code_signing_data.cs_info_id;",
          -1,
          &ppStmt,
          0LL))
  {
    uint64_t v6 = 0LL;
    uint64_t v33 = *MEMORY[0x1896075E0];
    *(void *)&__int128 v5 = 138543362LL;
    __int128 v31 = v5;
    while (1)
    {
      BOOL v9 = (void *)MEMORY[0x1895CE3A8]();
      int v10 = sqlite3_step(ppStmt);
      if ((v10 - 102) <= 0xFFFFFFFD)
      {
        v40[0] = MEMORY[0x1895F87A8];
        v40[1] = 3221225472LL;
        v40[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166;
        v40[3] = &unk_18A29E0A0;
        void v40[4] = self;
        v40[5] = db;
        uint64_t v27 = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166((uint64_t)v40);

        objc_autoreleasePoolPop(v9);
        uint64_t v6 = (void *)v27;
        goto LABEL_3;
      }

      if (v10 != 100)
      {
        objc_autoreleasePoolPop(v9);
        goto LABEL_3;
      }

      id v39 = 0LL;
      -[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]( self,  "_codeSigningEntryFromStatementRow:error:",  ppStmt,  &v39);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v39;
      if (v11) {
        break;
      }
      int v20 = 4;
LABEL_29:

      objc_autoreleasePoolPop(v9);
      if (v20 == 3) {
        goto LABEL_3;
      }
    }

    uint64_t v13 = sqlite3_column_text(ppStmt, 5);
    if (!v13)
    {
      id v17 = v6;
      id v21 = (void *)[objc_alloc(NSString) initWithFormat:@"Error retrieving code_signing_id_text from DB"];
      v45[0] = @"FunctionName";
      [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)__int16 v46 = v22;
      *(void *)&v46[8] = &unk_18A2BE560;
      v45[1] = @"SourceFileLine";
      v45[2] = v33;
      *(void *)&v46[16] = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:3];
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        int v44 = v21;
        _os_log_error_impl(&dword_188846000, v24, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v23];
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      int v20 = 4;
      BOOL v16 = v12;
      goto LABEL_21;
    }

    unsigned int v14 = v13;
    uint64_t v15 = [objc_alloc(NSString) initWithUTF8String:v13];
    if (!v15)
    {
      v38[0] = MEMORY[0x1895F87A8];
      v38[1] = 3221225472LL;
      v38[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173;
      v38[3] = &__block_descriptor_40_e14___NSError_8__0l;
      void v38[4] = v14;
      __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173((uint64_t)v38);
      BOOL v16 = v6;
      int v20 = 3;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }

    BOOL v16 = (void *)v15;
    id v17 = v6;
    id v37 = v12;
    uint64_t v18 = -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]( self,  "childIdentifiersForParentIdentifier:error:",  v15,  &v37);
    id v19 = v37;

    if (v18)
    {
LABEL_16:
      objc_msgSend(v11, "setChildBundleIdentifiers:", v18, v31);
      v34[2](v34, v16, v11);

      int v20 = 0;
      BOOL v16 = (void *)v18;
LABEL_21:
      id v12 = v19;
      uint64_t v6 = v17;
LABEL_28:

      goto LABEL_29;
    }

    [v19 domain];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v25 isEqualToString:@"MCMErrorDomain"])
    {
      uint64_t v26 = [v19 code];

      if (v26 == 67)
      {

        id v19 = 0LL;
        goto LABEL_16;
      }
    }

    else
    {
    }

    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177;
    v35[3] = &unk_18A29E6D8;
    id v12 = v19;
    id v36 = v12;
    __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177((uint64_t)v35);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    int v20 = 4;
    goto LABEL_28;
  }

  v41[0] = MEMORY[0x1895F87A8];
  v41[1] = 3221225472LL;
  v41[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke;
  v41[3] = &unk_18A29E0A0;
  v41[4] = self;
  v41[5] = v4;
  __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke((uint64_t)v41);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 path];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = sqlite3_extended_errcode(db);
      *(_DWORD *)__int16 v46 = 138412546;
      *(void *)&v46[4] = v29;
      *(_WORD *)&v46[12] = 1024;
      *(_DWORD *)&v46[14] = v30;
      _os_log_error_impl(&dword_188846000, v7, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", v46, 0x12u);
    }
  }

  return v6;
}

- (id)identifiersWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0LL;
  __int128 v5 = -[MCMSQLiteDB db](self, "db");
  [MEMORY[0x189603FE0] set];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sqlite3_prepare_v2( v5,  "SELECT code_signing_info.code_signing_id_text FROM code_signing_info;",
          -1,
          &ppStmt,
          0LL))
  {
    while (1)
    {
      int v13 = sqlite3_step(ppStmt);
      if ((v13 - 102) <= 0xFFFFFFFD)
      {
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_184;
        v22[3] = &unk_18A29E0A0;
        v22[4] = self;
        v22[5] = v5;
        uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke_184((uint64_t)v22);
        goto LABEL_3;
      }

      if (v13 != 100)
      {
        id v8 = 0LL;
        goto LABEL_4;
      }

      unsigned int v14 = sqlite3_column_text(ppStmt, 0);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = [objc_alloc(NSString) initWithUTF8String:v14];
        if (!v16)
        {
          v21[0] = MEMORY[0x1895F87A8];
          v21[1] = 3221225472LL;
          v21[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_186;
          v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
          void v21[4] = v15;
          uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke_186((uint64_t)v21);
          goto LABEL_3;
        }

        id v17 = (os_log_s *)v16;
        [v6 addObject:v16];
      }

      else
      {
        container_log_handle_for_category();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_188846000,  v17,  OS_LOG_TYPE_ERROR,  "Error retrieving code_signing_id_text from DB",  buf,  2u);
        }
      }
    }
  }

  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke;
  v23[3] = &unk_18A29E0A0;
  void v23[4] = self;
  v23[5] = v5;
  uint64_t v7 = __36__MCMSQLiteDB_identifiersWithError___block_invoke((uint64_t)v23);
LABEL_3:
  id v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 path];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v19;
      __int16 v27 = 1024;
      int v28 = v20;
      _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  uint64_t v10 = [v6 count];
  if (a3 && !v10)
  {

    uint64_t v6 = 0LL;
    *a3 = v8;
  }

  id v11 = (void *)[v6 copy];

  return v11;
}

- (id)childIdentifiersForParentIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0LL;
  uint64_t v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2( v7,  "SELECT child_bundles.child_code_signing_id_text FROM child_bundles, code_signing_info WHERE code_signing_info.c ode_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0LL))
  {
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke;
    v34[3] = &unk_18A29E0A0;
    void v34[4] = self;
    v34[5] = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke((uint64_t)v34);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v11 = 0LL;
    goto LABEL_6;
  }

  BOOL v9 = ppStmt;
  id v10 = v6;
  if (sqlite3_bind_text( v9,  1,  (const char *)[v10 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190;
    void v30[3] = &unk_18A29E078;
    id v31 = v10;
    id v32 = self;
    uint64_t v33 = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190((uint64_t)v30);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  id v11 = 0LL;
  while (1)
  {
    do
    {
      int v15 = sqlite3_step(ppStmt);
      if ((v15 - 102) <= 0xFFFFFFFD)
      {
        v29[0] = MEMORY[0x1895F87A8];
        v29[1] = 3221225472LL;
        v29[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192;
        v29[3] = &unk_18A29E0A0;
        v29[4] = self;
        v29[5] = v7;
        __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192((uint64_t)v29);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }

      if (v15 != 100)
      {
        id v8 = 0LL;
        goto LABEL_6;
      }

      uint64_t v16 = sqlite3_column_text(ppStmt, 0);
    }

    while (!v16);
    id v17 = v16;
    uint64_t v18 = (void *)[objc_alloc(NSString) initWithUTF8String:v16];
    if (!v18)
    {
      v28[0] = MEMORY[0x1895F87A8];
      v28[1] = 3221225472LL;
      v28[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194;
      v28[3] = &__block_descriptor_40_e14___NSError_8__0l;
      void v28[4] = v17;
      uint64_t v22 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194((uint64_t)v28);
      goto LABEL_31;
    }

    if (!v11)
    {
      id v11 = (void *)objc_opt_new();
      if (!v11) {
        break;
      }
    }

    [v11 addObject:v18];
  }

  uint64_t v22 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_198();
LABEL_31:
  id v8 = (id)v22;

LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 path];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      id v37 = v20;
      __int16 v38 = 1024;
      int v39 = v21;
      _os_log_error_impl(&dword_188846000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (!v8)
  {
    if (v11)
    {
      id v8 = 0LL;
      goto LABEL_17;
    }

    uint64_t v23 = MEMORY[0x1895F87A8];
    uint64_t v24 = 3221225472LL;
    id v25 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203;
    uint64_t v26 = &unk_18A29E6D8;
    id v27 = v6;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203((uint64_t)&v23);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v27;
  }

  if (a4)
  {
    id v8 = v8;
    id v11 = 0LL;
    *a4 = v8;
  }

  else
  {
    id v11 = 0LL;
  }

- (id)parentIdentifierForChildIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0LL;
  uint64_t v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2( v7,  "SELECT code_signing_info.code_signing_id_text FROM child_bundles, code_signing_info WHERE child_bundles.child_c ode_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0LL))
  {
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke;
    void v30[3] = &unk_18A29E0A0;
    void v30[4] = self;
    v30[5] = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke((uint64_t)v30);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v11 = 0LL;
    goto LABEL_6;
  }

  BOOL v9 = ppStmt;
  id v10 = v6;
  if (sqlite3_bind_text( v9,  1,  (const char *)[v10 UTF8String],  -1,  (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    id v26[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209;
    v26[3] = &unk_18A29E078;
    id v27 = v10;
    int v28 = self;
    uint64_t v29 = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209((uint64_t)v26);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  id v11 = 0LL;
  while (1)
  {
    int v14 = sqlite3_step(ppStmt);
    if ((v14 - 102) <= 0xFFFFFFFD)
    {
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213;
      v25[3] = &unk_18A29E0A0;
      void v25[4] = self;
      v25[5] = v7;
      uint64_t v18 = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213((uint64_t)v25);
      goto LABEL_26;
    }

    if (v14 != 100) {
      break;
    }
    int v15 = sqlite3_column_text(ppStmt, 0);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = [objc_alloc(NSString) initWithUTF8String:v15];

      id v11 = (void *)v17;
      if (!v17)
      {
        v24[0] = MEMORY[0x1895F87A8];
        v24[1] = 3221225472LL;
        v24[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215;
        v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
        void v24[4] = v16;
        uint64_t v18 = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215((uint64_t)v24);
LABEL_26:
        id v8 = (id)v18;
        goto LABEL_6;
      }
    }
  }

  id v8 = 0LL;
LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 path];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      int v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = v20;
      __int16 v34 = 1024;
      int v35 = v21;
      _os_log_error_impl(&dword_188846000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (!v8)
  {
    if (v11)
    {
      id v8 = 0LL;
      goto LABEL_17;
    }

    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219;
    v22[3] = &unk_18A29E6D8;
    id v23 = v6;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219((uint64_t)v22);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v23;
  }

  if (a4)
  {
    id v8 = v8;
    id v11 = 0LL;
    *a4 = v8;
  }

  else
  {
    id v11 = 0LL;
  }

- (BOOL)deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0LL;
  __int128 v5 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v5, "DELETE FROM code_signing_info WHERE (placeholder & ?) > 0;", -1, &ppStmt, 0LL))
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke;
    v20[3] = &unk_18A29E0A0;
    v20[4] = self;
    v20[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke((uint64_t)v20);
LABEL_12:
    id v10 = (void *)v6;
    BOOL v11 = 0;
    goto LABEL_13;
  }

  if (sqlite3_bind_int(ppStmt, 1, 2))
  {
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227;
    v19[3] = &unk_18A29E0A0;
    v19[4] = self;
    v19[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227((uint64_t)v19);
    goto LABEL_12;
  }

  if (sqlite3_step(ppStmt) != 101)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231;
    v18[3] = &unk_18A29E0A0;
    v18[4] = self;
    v18[5] = v5;
    uint64_t v6 = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231((uint64_t)v18);
    goto LABEL_12;
  }

  int v7 = sqlite3_changes(v5);
  if (v7 >= 1)
  {
    int v8 = v7;
    container_log_handle_for_category();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v8;
      _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Deleted %d advance copies of code signing info.",  buf,  8u);
    }
  }

  id v10 = 0LL;
  BOOL v11 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      id v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      _os_log_error_impl(&dword_188846000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a3) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    *a3 = v10;
  }

  return v11;
}

- (id)childParentMapWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __int128 v5 = (void *)objc_opt_new();
  ppStmt = 0LL;
  uint64_t v6 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2( v6,  "SELECT child_code_signing_id_text, code_signing_info.code_signing_id_text FROM child_bundles, code_signing_inf o WHERE child_bundles.parent_id=code_signing_info.id;",
          -1,
          &ppStmt,
          0LL))
  {
    while (1)
    {
      int v12 = sqlite3_step(ppStmt);
      if ((v12 - 102) <= 0xFFFFFFFD)
      {
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 3221225472LL;
        v25[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236;
        v25[3] = &unk_18A29E0A0;
        void v25[4] = self;
        v25[5] = v6;
        uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236((uint64_t)v25);
        goto LABEL_3;
      }

      if (v12 != 100)
      {
        int v8 = 0LL;
        goto LABEL_4;
      }

      char v13 = sqlite3_column_text(ppStmt, 0);
      if (v13)
      {
        int v14 = v13;
        int v15 = (void *)[objc_alloc(NSString) initWithUTF8String:v13];
        if (!v15)
        {
          v24[0] = MEMORY[0x1895F87A8];
          v24[1] = 3221225472LL;
          v24[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238;
          v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
          void v24[4] = v14;
          uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238((uint64_t)v24);
          goto LABEL_3;
        }
      }

      else
      {
        int v15 = 0LL;
      }

      uint64_t v16 = sqlite3_column_text(ppStmt, 1);
      if (v16)
      {
        int v17 = v16;
        uint64_t v18 = [objc_alloc(NSString) initWithUTF8String:v16];
        if (!v18)
        {
          v23[0] = MEMORY[0x1895F87A8];
          v23[1] = 3221225472LL;
          v23[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242;
          v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
          void v23[4] = v17;
          __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242((uint64_t)v23);
          int v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_4;
        }

        id v19 = (void *)v18;
        if (v15) {
          [v5 setObject:v18 forKeyedSubscript:v15];
        }
      }

      else
      {
        id v19 = 0LL;
      }
    }
  }

  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  id v26[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke;
  v26[3] = &unk_18A29E0A0;
  void v26[4] = self;
  v26[5] = v6;
  uint64_t v7 = __39__MCMSQLiteDB_childParentMapWithError___block_invoke((uint64_t)v26);
LABEL_3:
  int v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 path];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = sqlite3_extended_errcode(v6);
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v21;
      __int16 v30 = 1024;
      int v31 = v22;
      _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);
    }
  }

  if (a3 && !v5) {
    *a3 = v8;
  }
  id v10 = (void *)[v5 copy];

  return v10;
}

- (BOOL)deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:(int *)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  ppStmt = 0LL;
  uint64_t v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2( v7,  "DELETE FROM code_signing_info WHERE placeholder = 0 AND invalid = 1 AND data_container_class = ?;",
         -1,
         &ppStmt,
         0LL))
  {
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke;
    v22[3] = &unk_18A29E0A0;
    void v22[4] = self;
    v22[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke((uint64_t)v22);
LABEL_12:
    BOOL v11 = (void *)v8;
    int v9 = 0;
    BOOL v12 = 0;
    goto LABEL_13;
  }

  if (sqlite3_bind_int(ppStmt, 1, 4))
  {
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248;
    v21[3] = &unk_18A29E0A0;
    void v21[4] = self;
    void v21[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248((uint64_t)v21);
    goto LABEL_12;
  }

  if (sqlite3_step(ppStmt) != 101)
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252;
    v20[3] = &unk_18A29E0A0;
    v20[4] = self;
    v20[5] = v7;
    uint64_t v8 = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252((uint64_t)v20);
    goto LABEL_12;
  }

  int v9 = sqlite3_changes(v7);
  if (v9 >= 1)
  {
    container_log_handle_for_category();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v9;
      _os_log_impl( &dword_188846000,  v10,  OS_LOG_TYPE_DEFAULT,  "Deleted %d invalid plugin code signing entries.",  buf,  8u);
    }
  }

  BOOL v11 = 0LL;
  BOOL v12 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 path];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = sqlite3_errmsg(v7);
      *(_DWORD *)buf = 138412546;
      int v25 = v18;
      __int16 v26 = 2080;
      id v27 = v19;
      _os_log_error_impl(&dword_188846000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %s", buf, 0x16u);
    }
  }

  char v14 = !v12;
  if (!a3) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    *a3 = v9;
  }
  if (a4) {
    char v15 = v12;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    *a4 = v11;
  }

  return v12;
}

- (MCMSQLiteDBCodeSigningPeerageDelegate)peerageDelegate
{
  return (MCMSQLiteDBCodeSigningPeerageDelegate *)objc_loadWeakRetained((id *)&self->_peerageDelegate);
}

- (void)setPeerageDelegate:(id)a3
{
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(delete) for %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE7A0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248( uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for plugin data container class at %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE7B8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252( uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %s", v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE7D0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE740;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE758;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate childIdentifier for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE770;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate parentIdentifier for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childParentMapWithError:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE788;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(delete) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE6F8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for flags=%d at %@ failed: %d", 2, v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE710;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE728;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE680;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for child_code_signing_id_text=%@ at %@ failed: %s", v3, v5, sqlite3_errmsg(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE698;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE6B0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate parentIdentifier for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE6C8;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219(uint64_t a1)
{
  v8[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Parent identifier for: %@ Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_18A2BE6E0;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE5F0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE608;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE620;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate thisChildBundleId for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE638;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_198()
{
  void v10[3] = *MEMORY[0x1895F89C0];
  v0 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to allocate childBundleIds"];
  v9[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  v10[1] = &unk_18A2BE650;
  uint64_t v2 = *MEMORY[0x1896075E0];
  v9[1] = @"SourceFileLine";
  v9[2] = v2;
  v10[2] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:3];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    uint64_t v8 = v0;
    _os_log_error_impl(&dword_188846000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203(uint64_t a1)
{
  v8[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Children for parent identifier: %@ Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke"];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_18A2BE668;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE5A8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_184(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE5C0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_186(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate identifier for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB identifiersWithError:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE5D8;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE530;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE548;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Failed to allocate identifier for text: %s",  *(void *)(a1 + 32));
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE578;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    int v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:73 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Error retrieving childBundleIds: %@", *(void *)(a1 + 32)];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE590;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Error retrieving child bundles ids from DB with identifier %@ : %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE4B8;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 40))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec begin"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE4D0;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec commit"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE500;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void **)(a1 + 32);
  [v3 callStackSymbols];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE4E8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec rollback"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE518;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to invalidate identifier %@", *(void *)(a1 + 32)];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB invalidateCodeSigningWithIdentifier:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE4A0;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 40))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Identifier: %@ Not Found in DB", *(void *)(a1 + 32)];
  v7[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB codeSigningEntryWithIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_18A2BE488;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v7[1] = @"SourceFileLine";
  v7[2] = v3;
  v8[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:67 userInfo:v4];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"\bidentifier %@ cannot be nil", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB deleteCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE470;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:38 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"codeSigningEntry %@ and identifier %@ cannot be nil", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE3F8;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:38 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec begin"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE410;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec commit"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE440;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void **)(a1 + 32);
  [v3 callStackSymbols];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"Got exception: %@ : %@", v3, v4];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE428;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:40 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed _sqliteExec rollback"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE458;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(select) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE3B0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE3C8;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE3E0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Error formatting info data from DB"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE368;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to create code signing entry from statement row"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE398;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  v20[3] = *MEMORY[0x1895F89C0];
  id v2 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to delete from code_signing_info"];
  v19[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _deleteCodeSigningWithIdentifier:error:]_block_invoke"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_18A2BE350;
  uint64_t v4 = *MEMORY[0x1896075E0];
  v19[1] = @"SourceFileLine";
  v19[2] = v4;
  v20[2] = v2;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:3];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v7 = (void *)[v6 copy];

    if (*(void *)(a1 + 32))
    {
      container_log_handle_for_category();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v15 = 138543618;
        uint64_t v16 = v2;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        id v10 = "%{public}@ (%{public}@)";
        BOOL v11 = v8;
        uint32_t v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v7 = v5;
  }

  container_log_handle_for_category();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543362;
    uint64_t v16 = v2;
    id v10 = "%{public}@";
    BOOL v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_9;
  }

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE2D8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78(uint64_t a1)
{
  v22[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) codeSigningInfo];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)[v2 initWithFormat:@"Error creating NSData from code signing info: %@", v3];

  v21[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_18A2BE2F0;
  uint64_t v6 = *MEMORY[0x1896075E0];
  v21[1] = @"SourceFileLine";
  v21[2] = v6;
  v22[2] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x189607798]];
    uint64_t v9 = (void *)[v8 copy];

    if (*(void *)(a1 + 40))
    {
      container_log_handle_for_category();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v4;
        __int16 v19 = 2114;
        uint64_t v20 = v11;
        uint32_t v12 = "%{public}@ (%{public}@)";
        char v13 = v10;
        uint32_t v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_188846000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }

      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v9 = v7;
  }

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v4;
    uint32_t v12 = "%{public}@";
    char v13 = v10;
    uint32_t v14 = 12;
    goto LABEL_9;
  }

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_bind_blob64 for codeSigningInfoData at %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE308;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86(uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE320;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE338;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Error performing UPDATE operation for %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE2A8;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Error performing INSERT operation for %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE2C0;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  __int128 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke( uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE1E8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  unsigned int v3 = [*(id *)(a1 + 32) isInvalid];
  [*(id *)(a1 + 40) url];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for invalid=%d at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE200;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44( uint64_t a1)
{
  v18[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  unsigned int v3 = [*(id *)(a1 + 32) isPlaceholder];
  unsigned int v4 = [*(id *)(a1 + 32) isAdvanceCopy];
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  [*(id *)(a1 + 40) url];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 path];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for placeholder=%d, advance_copy=%d (flags=%d) at %@ failed: %d", v3, v4, v5, v7, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v17[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = &unk_18A2BE218;
  uint64_t v10 = *MEMORY[0x1896075E0];
  v17[1] = @"SourceFileLine";
  id v17[2] = v10;
  v18[2] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v8;
    _os_log_error_impl(&dword_188846000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v11];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  unsigned int v3 = [*(id *)(a1 + 32) isRegisteredByCaller];
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for registered_by_caller=%d at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE230;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = [*(id *)(a1 + 32) dataContainerClass];
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_int for data_container_class=%llu at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE248;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for code_signing_id=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE260;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60( uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE278;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62( uint64_t a1)
{
  v13[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_changes for %s in %@: %d, but expecting 1", v3, v5, *(unsigned int *)(a1 + 48)];

  v12[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_18A2BE290;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:68 userInfo:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x1895F89C0];
  v1 = (void *)[objc_alloc(NSString) initWithFormat:@"Error performing INSERT operation for child %@", *(void *)(a1 + 32)];
  v10[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _insertChildIdentifier:forParentIdentifier:error:]_block_invoke"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_18A2BE1D0;
  uint64_t v3 = *MEMORY[0x1896075E0];
  v10[1] = @"SourceFileLine";
  v10[2] = v3;
  v11[2] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:3];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v1;
    _os_log_error_impl(&dword_188846000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke( uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_prepare(insert) for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE158;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for identifier=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE170;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25( uint64_t a1)
{
  v16[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_bind_text for identifier=%@ at %@ failed: %d", v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48))];

  v15[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_18A2BE188;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v15[1] = @"SourceFileLine";
  id v15[2] = v8;
  v16[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint32_t v14 = v6;
    _os_log_error_impl(&dword_188846000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27( uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) url];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v2 initWithFormat:@"sqlite3_step for %@ failed: %d", v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40))];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE1A0;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31( uint64_t a1)
{
  v13[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v2 initWithFormat:@"sqlite3_changes for %s in %@: %d, but expecting %d", v3, v5, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52)];

  v12[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_18A2BE1B8;
  uint64_t v8 = *MEMORY[0x1896075E0];
  v12[1] = @"SourceFileLine";
  v12[2] = v8;
  v13[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:68 userInfo:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __33__MCMSQLiteDB__sqliteExec_error___block_invoke(uint64_t a1)
{
  void v15[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) url];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v2 initWithFormat:@"%@ on %@ failed: %s", v3, v4, *(void *)(a1 + 48)];

  v14[0] = @"FunctionName";
  [NSString stringWithUTF8String:"-[MCMSQLiteDB _sqliteExec:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_18A2BE140;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v14[1] = @"SourceFileLine";
  id v14[2] = v7;
  id v15[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    char v13 = v5;
    _os_log_error_impl(&dword_188846000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:66 userInfo:v8];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)moveDBWithURL:(id)a3 toURL:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a5);
  ppDb = 0LL;
  id v11 = v9;
  if (sqlite3_open_v2((const char *)[v11 fileSystemRepresentation], &ppDb, 1, 0))
  {
    int v12 = sqlite3_extended_errcode(ppDb);
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke;
    v33[3] = &unk_18A29E050;
    int v35 = ppDb;
    char v13 = (os_log_s *)v11;
    __int16 v34 = v13;
    int v36 = v12;
    __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke((uint64_t)v33);
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[os_log_s path](v13, "path");
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      int v39 = v26;
      __int16 v40 = 1024;
      LODWORD(v41) = v12;
      _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);
    }

    BOOL v16 = 0;
    __int16 v17 = v34;
  }

  else
  {
    id v18 = v10;
    [v18 fileSystemRepresentation];
    if (_sqlite3_db_copy_compact())
    {
      int v19 = sqlite3_extended_errcode(ppDb);
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7;
      v29[3] = &unk_18A29E050;
      int v31 = ppDb;
      uint64_t v20 = (os_log_s *)v11;
      __int16 v30 = v20;
      int v32 = v19;
      __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7((uint64_t)v29);
      uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[os_log_s path](v20, "path");
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 path];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        int v39 = v27;
        __int16 v40 = 2112;
        id v41 = v28;
        __int16 v42 = 1024;
        int v43 = v19;
        _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "copying [%@] to [%@] failed: xerr = %d",  buf,  0x1Cu);
      }

      BOOL v16 = 0;
      __int16 v17 = v30;
    }

    else
    {
      container_log_handle_for_category();
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v11 path];
        int v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 path];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        int v39 = v22;
        __int16 v40 = 2112;
        id v41 = v23;
        _os_log_impl(&dword_188846000, v17, OS_LOG_TYPE_DEFAULT, "Moved [%@] to [%@]", buf, 0x16u);
      }

      uint32_t v14 = 0LL;
      BOOL v16 = 1;
    }
  }

  if (ppDb) {
    sqlite3_close(ppDb);
  }
  if (a6) {
    char v24 = v16;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0) {
    *a6 = v14;
  }

  return v16;
}

+ (sqlite3)openDBWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v8 = (dispatch_queue_s *)a4;
  dispatch_assert_queue_V2(v8);
  ppDb = 0LL;
  container_log_handle_for_category();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v7 path];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_188846000, v9, OS_LOG_TYPE_DEFAULT, "Opening [%@]", buf, 0xCu);
  }

  id v11 = v7;
  if (sqlite3_open_v2((const char *)[v11 fileSystemRepresentation], &ppDb, 4194310, 0))
  {
    int v12 = sqlite3_extended_errcode(ppDb);
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke;
    v25[3] = &unk_18A29E050;
    id v27 = ppDb;
    id v13 = v11;
    id v26 = v13;
    int v28 = v12;
    __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke((uint64_t)v25);
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v13 path];
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);
    }

    sqlite3_close(ppDb);
    goto LABEL_8;
  }

  errmsg = 0LL;
  int v16 = sqlite3_exec( ppDb,  "PRAGMA locking_mode = EXCLUSIVE;PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;PRAGMA auto_vacuum = FULL;C"
          "REATE TABLE IF NOT EXISTS code_signing_info(id INTEGER PRIMARY KEY AUTOINCREMENT,code_signing_id_text TEXT NOT"
          " NULL UNIQUE,invalid INTEGER NOT NULL DEFAULT 0,placeholder INTEGER NOT NULL DEFAULT 0,registered_by_caller IN"
          "TEGER NOT NULL DEFAULT 0,data_container_class INTEGER NOT NULL DEFAULT 0);CREATE TABLE IF NOT EXISTS code_sign"
          "ing_data(id INTEGER PRIMARY KEY AUTOINCREMENT,cs_info_id INTEGER NOT NULL UNIQUE,data BLOB NOT NULL,FOREIGN KE"
          "Y(cs_info_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE TABLE IF NOT EXISTS child_bundles(id "
          "INTEGER PRIMARY KEY AUTOINCREMENT,child_code_signing_id_text TEXT NOT NULL UNIQUE,parent_id INTEGER NOT NULL,F"
          "OREIGN KEY(parent_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE INDEX IF NOT EXISTS code_sign"
          "ing_id_text_idx ON code_signing_info(code_signing_id_text);CREATE INDEX IF NOT EXISTS cs_info_id_idx ON code_s"
          "igning_data(cs_info_id);CREATE INDEX IF NOT EXISTS parent_id_idx ON child_bundles(parent_id);",
          0LL,
          0LL,
          &errmsg);
  uint32_t v14 = 0LL;
  if (!v16)
  {
LABEL_8:
    __int16 v17 = ppDb;
    if (a5)
    {
      if (!ppDb)
      {
        *a5 = v14;
        __int16 v17 = ppDb;
      }
    }

    return v17;
  }

  int v20 = v16;
  int v21 = sqlite3_extended_errcode(ppDb);
  container_log_handle_for_category();
  int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    [v11 path];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = errmsg;
    _os_log_error_impl(&dword_188846000, v22, OS_LOG_TYPE_ERROR, "table create for %@ failed: %s", buf, 0x16u);
  }

  sqlite3_free(errmsg);
  int v35 = 0;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  memset(buf, 0, sizeof(buf));
  snprintf((char *)buf, 0x64uLL, "Failed to initialize database, err = %d, xerr = %d", v20, v21);
  sqlite3_close(ppDb);
  result = (sqlite3 *)_os_crash();
  __break(1u);
  return result;
}

id __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  objc_msgSend( @"opening %@ failed: xerr = %d",  "stringByAppendingFormat:",  @", errmsg: %s",  sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMSQLiteDB openDBWithURL:queue:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_18A2BE128;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  objc_msgSend( @"opening %@ failed: xerr = %x",  "stringByAppendingFormat:",  @", errmsg: %s",  sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_18A2BE0F8;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7(uint64_t a1)
{
  void v12[3] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc(NSString);
  objc_msgSend( @"opening %@ failed: xerr = %x",  "stringByAppendingFormat:",  @", errmsg: %s",  sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) path];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = @"FunctionName";
  [NSString stringWithUTF8String:"+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_18A2BE110;
  uint64_t v7 = *MEMORY[0x1896075E0];
  v11[1] = @"SourceFileLine";
  v11[2] = v7;
  v12[2] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.containermanagerd.SQLite" code:sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)) userInfo:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end