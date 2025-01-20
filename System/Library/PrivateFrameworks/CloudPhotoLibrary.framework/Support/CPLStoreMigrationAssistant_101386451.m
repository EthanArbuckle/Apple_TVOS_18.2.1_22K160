@interface CPLStoreMigrationAssistant_101386451
- (BOOL)_isCloudScopedIdentifier:(id)a3 aSuspiciousRemappingToCloudScopedIdentifier:(id)a4 primaryScope:(id)a5;
- (BOOL)_isSuspiciousAsset:(id)a3 isBadAsset:(BOOL *)a4;
- (BOOL)_performMigrationForRemappedRecord:(id)a3 primaryScope:(id)a4 sharingScope:(id)a5 revertedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)_performMigrationWithPrimaryScope:(id)a3 sharingScope:(id)a4 error:(id *)a5;
- (BOOL)_revertRecordWithLocalScopedIdentifier:(id)a3 class:(Class)a4 revertedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)performMigrationWithError:(id *)a3;
- (CPLStoreMigrationAssistant_101386451)initWithStore:(id)a3;
- (NSString)migrationDescription;
- (int64_t)checkPushedChange:(id)a3;
@end

@implementation CPLStoreMigrationAssistant_101386451

- (CPLStoreMigrationAssistant_101386451)initWithStore:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CPLStoreMigrationAssistant_101386451;
  v5 = -[CPLStoreMigrationAssistant_101386451 initWithStore:](&v25, "initWithStore:", v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 scopes]);
    scopes = v5->_scopes;
    v5->_scopes = (CPLEngineScopeStorage *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 remappedRecords]);
    remappedRecords = v5->_remappedRecords;
    v5->_remappedRecords = (CPLEngineRemappedRecords *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 idMapping]);
    idMapping = v5->_idMapping;
    v5->_idMapping = (CPLEngineIDMapping *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 revertRecords]);
    revertRecords = v5->_revertRecords;
    v5->_revertRecords = (CPLEngineRevertRecords *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 cloudCache]);
    cloudCache = v5->_cloudCache;
    v5->_cloudCache = (CPLEngineCloudCache *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 pushRepository]);
    pushRepository = v5->_pushRepository;
    v5->_pushRepository = (CPLEnginePushRepository *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 pullQueue]);
    pullQueue = v5->_pullQueue;
    v5->_pullQueue = (CPLEngineChangePipe *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 platformObject]);
    pqStore = v5->_pqStore;
    v5->_pqStore = (CPLPrequeliteStore *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStore pqlConnection](v5->_pqStore, "pqlConnection"));
    db = v5->_db;
    v5->_db = (PQLConnection *)v22;
  }

  return v5;
}

- (BOOL)_isCloudScopedIdentifier:(id)a3 aSuspiciousRemappingToCloudScopedIdentifier:(id)a4 primaryScope:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);

  uint64_t v14 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v11,  "initWithScopeIdentifier:identifier:scopeIndex:",  v12,  v13,  [v8 cloudIndex]);
  v15 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 scopeIdentifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  id v18 = [v8 cloudIndex];
  v19 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v15,  "initWithScopeIdentifier:identifier:scopeIndex:",  v16,  v17,  v18);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:]( self->_idMapping,  "localScopedIdentifierForCloudScopedIdentifier:isFinal:",  v14,  &v24));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:]( self->_idMapping,  "localScopedIdentifierForCloudScopedIdentifier:isFinal:",  v19,  &v24));
    BOOL v22 = v21 != 0LL;
  }

  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)_isSuspiciousAsset:(id)a3 isBadAsset:(BOOL *)a4
{
  id v6 = a3;
  if ([v6 isAssetChange])
  {
    *a4 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScopeStorage mainScopeIdentifier](self->_scopes, "mainScopeIdentifier"));
    unsigned int v10 = [v8 isEqualToString:v9];

    BOOL v11 = 0;
    if (v10)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScopeStorage primaryScope](self->_scopes, "primaryScope"));
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CPLEngineScopeStorage sharingScopeForScope:](self->_scopes, "sharingScopeForScope:", v12));
      uint64_t v14 = (void *)v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        unsigned int v16 = 0;
      }

      else
      {
        uint64_t v17 = objc_claimAutoreleasedReturnValue( -[CPLEngineIDMapping cloudScopedIdentifierForLocalScopedIdentifier:isFinal:]( self->_idMapping,  "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:",  v7,  &v37));
        id v18 = (void *)v17;
        if (v17)
        {
          v19 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
          v32 = v18;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          BOOL v22 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v19,  "initWithScopeIdentifier:identifier:scopeIndex:",  v20,  v21,  [v14 cloudIndex]);

          v23 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineRemappedRecords realScopedIdentifierForRemappedScopedIdentifier:]( self->_remappedRecords,  "realScopedIdentifierForRemappedScopedIdentifier:",  v22));
          if ([v23 isEqual:v22])
          {
            v31 = v23;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            char v24 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineRemappedRecords scopedIdentifiersRemappedToScopedIdentifier:]( self->_remappedRecords,  "scopedIdentifiersRemappedToScopedIdentifier:",  v22));
            id v25 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
            if (v25)
            {
              id v26 = v25;
              v30 = v14;
              uint64_t v27 = *(void *)v34;
              while (2)
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v34 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  if (-[CPLStoreMigrationAssistant_101386451 _isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:]( self,  "_isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)i),  v22,  v12))
                  {
                    unsigned int v16 = 1;
                    *a4 = 1;
                    goto LABEL_24;
                  }
                }

                id v26 = [v24 countByEnumeratingWithState:&v33 objects:v38 count:16];
                if (v26) {
                  continue;
                }
                break;
              }

              unsigned int v16 = 0;
LABEL_24:
              uint64_t v14 = v30;
            }

            else
            {
              unsigned int v16 = 0;
            }

            v23 = v31;
            id v18 = v32;
          }

          else
          {
            unsigned int v16 = -[CPLStoreMigrationAssistant_101386451 _isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:]( self,  "_isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:",  v22,  v23,  v12);
          }
        }

        else
        {
          unsigned int v16 = 0;
        }
      }

      BOOL v11 = v16 != 0;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)checkPushedChange:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  if (-[CPLStoreMigrationAssistant_101386451 _isSuspiciousAsset:isBadAsset:]( self,  "_isSuspiciousAsset:isBadAsset:",  v4,  &v8))
  {
    if (v8)
    {
      int64_t v5 = 1LL;
    }

    else
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___CPLStoreMigrationAssistant_101386451;
      int64_t v5 = -[CPLStoreMigrationAssistant_101386451 checkPushedChange:](&v7, "checkPushedChange:", v4);
    }
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (BOOL)_revertRecordWithLocalScopedIdentifier:(id)a3 class:(Class)a4 revertedCount:(unint64_t *)a5 error:(id *)a6
{
  unsigned int v8 = -[CPLEngineRevertRecords addRecordsToRevertWithLocalScopedIdentifier:class:error:]( self->_revertRecords,  "addRecordsToRevertWithLocalScopedIdentifier:class:error:",  a3,  a4,  a6);
  if (v8) {
    *a5 += (unint64_t)-[PQLConnection changes](self->_db, "changes");
  }
  return v8;
}

- (BOOL)_performMigrationForRemappedRecord:(id)a3 primaryScope:(id)a4 sharingScope:(id)a5 revertedCount:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v13 = (os_log_s *)a3;
  id v14 = a4;
  id v15 = a5;
  pqStore = self->_pqStore;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 scopeIdentifier]);
  -[CPLPrequeliteStore recordUpgradeEvent:]( pqStore,  "recordUpgradeEvent:",  @"Inspecting local state for %@ + %@",  v17,  v18);

  uint64_t v19 = sub_100031EF8((uint64_t)v13);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  uint64_t v21 = sub_100031F10((uint64_t)v13);
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  LODWORD(v18) = -[CPLStoreMigrationAssistant_101386451 _isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:]( self,  "_isCloudScopedIdentifier:aSuspiciousRemappingToCloudScopedIdentifier:primaryScope:",  v20,  v22,  v14);

  if (!(_DWORD)v18)
  {
    __int128 v35 = 0LL;
    goto LABEL_62;
  }

  if (!_CPLSilentLogging)
  {
    id v23 = sub_10014E628();
    char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = sub_100031F10((uint64_t)v13);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138412546;
      v113 = v13;
      __int16 v114 = 2112;
      v115 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%@ is suspicious: will make sure to drop %@ in client",  buf,  0x16u);
    }
  }

  SEL log = a2;
  v94 = a6;
  uint64_t v27 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
  uint64_t v29 = sub_100031F10((uint64_t)v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
  v32 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v27,  "initWithScopeIdentifier:identifier:scopeIndex:",  v28,  v31,  [v14 cloudIndex]);

  __int128 v33 = v32;
  __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CPLEngineCloudCache recordWithScopedIdentifier:isFinal:]( self->_cloudCache,  "recordWithScopedIdentifier:isFinal:",  v32,  0LL));
  __int128 v35 = v34;
  v98 = v34;
  if (!v34) {
    goto LABEL_19;
  }
  if (!-[os_log_s isAssetChange](v34, "isAssetChange"))
  {
    __int128 v35 = 0LL;
LABEL_19:
    v97 = a7;
    v48 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
    uint64_t v50 = sub_100031EF8((uint64_t)v13);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 identifier]);
    v53 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:scopeIndex:]( v48,  "initWithScopeIdentifier:identifier:scopeIndex:",  v49,  v52,  [v14 cloudIndex]);

    v95 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:]( self->_idMapping,  "localScopedIdentifierForCloudScopedIdentifier:isFinal:",  v53,  &v107));
    objc_msgSend(v54, "setScopeIndex:", objc_msgSend(v14, "localIndex"));
    v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CPLEnginePushRepository changeWithScopedIdentifier:]( self->_pushRepository,  "changeWithScopedIdentifier:",  v54));
    if (!v55) {
      goto LABEL_38;
    }
    v106.receiver = self;
    v106.super_class = (Class)&OBJC_CLASS___CPLStoreMigrationAssistant_101386451;
    id v56 = -[CPLStoreMigrationAssistant_101386451 checkPushedChange:](&v106, "checkPushedChange:", v55);
    if (v56 == (id)2)
    {
      v90 = v33;
      if (!_CPLSilentLogging)
      {
        id v69 = sub_10014E628();
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v113 = v55;
          _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Modifying %@ in push repository and reverting in client",  buf,  0xCu);
        }
      }

      id v88 = v15;
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEnginePushRepository platformObject](self->_pushRepository, "platformObject"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s _pushContext](v55, "_pushContext"));
      v100 = v35;
      unsigned int v73 = [v71 _overwriteChange:v55 pushContext:v72 error:&v100];
      v74 = v100;

      if (!v73)
      {
        unsigned __int8 v67 = 0;
        __int128 v35 = v74;
        v68 = v95;
        a7 = v97;
        __int128 v33 = v90;
LABEL_59:
        id v15 = v88;
        goto LABEL_61;
      }

      v99 = v74;
      unsigned __int8 v67 = -[CPLStoreMigrationAssistant_101386451 _revertRecordWithLocalScopedIdentifier:class:revertedCount:error:]( self,  "_revertRecordWithLocalScopedIdentifier:class:revertedCount:error:",  v54,  objc_opt_class(&OBJC_CLASS___CPLAssetChange),  v94,  &v99);
      v75 = v99;
      goto LABEL_57;
    }

    if (v56 != (id)1)
    {
LABEL_38:
      unsigned __int8 v67 = 1;
      v68 = v95;
      a7 = v97;
      goto LABEL_61;
    }

    if (!_CPLSilentLogging)
    {
      id v57 = sub_10014E628();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v113 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Dropping %@ from push repository",  buf,  0xCu);
      }
    }

    v90 = v33;
    if (-[os_log_s isDelete](v55, "isDelete")
      && -[os_log_s isAssetChange](v55, "isAssetChange"))
    {
      id v88 = v15;
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEnginePushRepository platformObject](self->_pushRepository, "platformObject"));
      id v105 = 0LL;
      unsigned __int8 v60 = [v59 getRelatedScopedIdentifier:&v105 forRecordWithScopedIdentifier:v54];
      v61 = (os_log_s *)v105;

      if ((v60 & 1) == 0) {
        sub_10019993C((uint64_t)v54, (uint64_t)log, (uint64_t)self);
      }
      if (v61)
      {
        v62 = v61;
        v63 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[CPLEnginePushRepository changeWithScopedIdentifier:]( self->_pushRepository,  "changeWithScopedIdentifier:",  v61));
        if ((-[os_log_s isDelete](v63, "isDelete") & 1) != 0)
        {
          id v15 = v88;
          if (!_CPLSilentLogging)
          {
            id v64 = sub_10014E628();
            loga = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v113 = v63;
              __int16 v114 = 2112;
              v115 = (os_log_s *)v54;
              _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "Also dropping %@ (master of %@) from pushRepository",  buf,  0x16u);
            }
          }

          os_log_t logb = v63;
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEnginePushRepository platformObject](self->_pushRepository, "platformObject"));
          v104 = v35;
          v87 = v62;
          unsigned __int8 v66 = [v65 deleteChangeWithScopedIdentifier:v62 error:&v104];
          v86 = v104;

          if ((v66 & 1) == 0)
          {

            unsigned __int8 v67 = 0;
            v68 = v95;
            a7 = v97;
            __int128 v33 = v90;
            __int128 v35 = v86;
            v74 = v87;
            goto LABEL_58;
          }

          v103 = v86;
          unsigned __int8 v85 = -[CPLStoreMigrationAssistant_101386451 _revertRecordWithLocalScopedIdentifier:class:revertedCount:error:]( self,  "_revertRecordWithLocalScopedIdentifier:class:revertedCount:error:",  v87,  objc_opt_class(&OBJC_CLASS___CPLMasterChange),  v94,  &v103);
          __int128 v35 = v103;

          if ((v85 & 1) == 0) {
            goto LABEL_60;
          }
          goto LABEL_55;
        }
      }

      else
      {
        if (_CPLSilentLogging)
        {
          id v15 = v88;
          goto LABEL_55;
        }

        id v76 = sub_10014E628();
        v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v113 = v55;
          v62 = v77;
          _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_ERROR,  "%@ from push repository does not know its master",  buf,  0xCu);
        }

        else
        {
          v62 = v77;
        }
      }

      id v15 = v88;
    }

- (BOOL)_performMigrationWithPrimaryScope:(id)a3 sharingScope:(id)a4 error:(id *)a5
{
  v53 = (char *)a3;
  objc_super v7 = (char *)a4;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineRemappedRecords platformObject](self->_remappedRecords, "platformObject"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineIDMapping platformObject](self->_idMapping, "platformObject"));
  uint64_t v62 = 0LL;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v51 remappedRecordEnumeratorInScope:v7]);
  id v9 = (char *)[v8 countByEnumeratingWithState:&v58 objects:v67 count:16];
  id v47 = v9;
  unsigned int v10 = 0LL;
  id v11 = 0LL;
  if (v9)
  {
    uint64_t v12 = *(void *)v59;
    uint64_t v13 = v9;
    while (2)
    {
      id v14 = 0LL;
      v48 = &v13[(void)v10];
      id v15 = v11;
      do
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v14);
        uint64_t v17 = objc_autoreleasePoolPush();
        id v57 = v15;
        LODWORD(v16) = -[CPLStoreMigrationAssistant_101386451 _performMigrationForRemappedRecord:primaryScope:sharingScope:revertedCount:error:]( self,  "_performMigrationForRemappedRecord:primaryScope:sharingScope:revertedCount:error:",  v16,  v53,  v7,  &v62,  &v57);
        id v11 = v57;

        if (!(_DWORD)v16)
        {
          objc_autoreleasePoolPop(v17);

          id v23 = v11;
          id v18 = v51;
          goto LABEL_18;
        }

        [v52 _clearScopedIdentifiersCache];
        objc_autoreleasePoolPop(v17);
        ++v14;
        id v15 = v11;
      }

      while (v13 != v14);
      uint64_t v13 = (char *)[v8 countByEnumeratingWithState:&v58 objects:v67 count:16];
      unsigned int v10 = v48;
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v18 = v51;
  if (!_CPLSilentLogging)
  {
    id v19 = sub_10014E628();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v64 = v10;
      __int16 v65 = 2048;
      uint64_t v66 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Inspected %lu remapped records for migration and scheduled %lu reverted changes",  buf,  0x16u);
    }
  }

  -[CPLPrequeliteStore recordUpgradeEvent:]( self->_pqStore,  "recordUpgradeEvent:",  @"Inspected %lu remapped records for migration and scheduled %lu reverted changes",  v10,  v62);
  if (v62)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLStoreMigrationAssistant_101386451 store](self, "store"));
    id v56 = v11;
    unsigned int v22 = [v21 addPushPullGatekeeper:self error:&v56];
    id v23 = v56;

    if (!v47 || (v22 & 1) == 0)
    {
      if (!v22) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }

    id v11 = v23;
    goto LABEL_26;
  }

  id v23 = v11;
  if (v47)
  {
LABEL_26:
    if (!_CPLSilentLogging)
    {
      id v27 = sub_10014E628();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v64 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Resetting sync anchor for %@ to ensure all remapped records have been refreshed",  buf,  0xCu);
      }
    }

    -[CPLPrequeliteStore recordUpgradeEvent:]( self->_pqStore,  "recordUpgradeEvent:",  @"Resetting sync anchor for shared scope");
    scopes = self->_scopes;
    id v55 = v11;
    unsigned __int8 v30 = -[CPLEngineScopeStorage resetSyncAnchorForScope:error:]( scopes,  "resetSyncAnchorForScope:error:",  v7,  &v55);
    id v23 = v55;

    if ((v30 & 1) == 0) {
      goto LABEL_18;
    }
  }

- (BOOL)performMigrationWithError:(id *)a3
{
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLStoreMigrationAssistant_101386451 store](self, "store"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scopes]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 primaryScope]);
  if (v7
    && ([v6 valueForFlag:16 forScope:v7] & 1) == 0
    && (uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 sharingScopeForScope:v7])) != 0)
  {
    id v9 = (os_log_s *)v8;
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10014E628();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Migration is needed because store contains active %@/%@",  (uint8_t *)&v15,  0x16u);
      }
    }

    if ([v5 forceApplyPendingChangeSessionUpdateWithError:a3]) {
      BOOL v12 = -[CPLStoreMigrationAssistant_101386451 _performMigrationWithPrimaryScope:sharingScope:error:]( self,  "_performMigrationWithPrimaryScope:sharingScope:error:",  v7,  v9,  a3);
    }
    else {
      BOOL v12 = 0;
    }
  }

  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v12 = 1;
      goto LABEL_15;
    }

    id v13 = sub_10014E628();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No need to perform any migration work",  (uint8_t *)&v15,  2u);
    }

    BOOL v12 = 1;
  }

LABEL_15:
  return v12;
}

- (NSString)migrationDescription
{
  return (NSString *)@"Migration-101386451";
}

- (void).cxx_destruct
{
}

@end