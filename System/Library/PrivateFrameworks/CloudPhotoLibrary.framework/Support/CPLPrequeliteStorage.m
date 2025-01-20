@interface CPLPrequeliteStorage
- (BOOL)_checkSuperWasCalled;
- (BOOL)addColumnVariable:(id)a3 error:(id *)a4;
- (BOOL)addColumnVariableGroup:(id)a3 error:(id *)a4;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)createIndex:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7;
- (BOOL)createIndexOnColumn:(id)a3 error:(id *)a4;
- (BOOL)createIndexOnColumnVariable:(id)a3 error:(id *)a4;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6;
- (BOOL)createMainTableWithColumnVariables:(id)a3 error:(id *)a4;
- (BOOL)createMainTableWithDefinition:(id)a3 error:(id *)a4;
- (BOOL)createStorage;
- (BOOL)createVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5;
- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)isAlive;
- (BOOL)isCloudScopeIndexValid:(int64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isLocalScopeIndexValid:(int64_t)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)recreateMainTableWithCopyInstructions:(id)a3 oldFields:(id)a4 error:(id *)a5;
- (BOOL)resetValueForVariable:(id)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forVariable:(id)a4 error:(id *)a5;
- (BOOL)shouldIncludeInStatus;
- (BOOL)shouldUpgradeSchema;
- (CPLPrequeliteStorage)initWithAbstractObject:(id)a3;
- (NSString)mainScopeIdentifier;
- (id)_scopes;
- (id)_statusPerScopeIndex;
- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4;
- (id)columnVariableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5;
- (id)columnVariableWithName:(id)a3 type:(id)a4;
- (id)engineLibrary;
- (id)filterForExcludedScopeIdentifiers:(id)a3;
- (id)filterForIncludedScopeIdentifiers:(id)a3;
- (id)mainTable;
- (id)pqStore;
- (id)recordsDesignation;
- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3;
- (id)scopeIndexColumnName;
- (id)scopedIdentifierForCloudIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)scopedIdentifierForLocalIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndexWithGroupProperty:(id)a3 valueDescription:(id)a4;
- (id)valueForVariable:(id)a3;
- (id)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5;
- (id)variableWithName:(id)a3 type:(id)a4;
- (int64_t)cloudScopeIndexForScopeIdentifier:(id)a3;
- (int64_t)localScopeIndexForScopeIdentifier:(id)a3;
- (int64_t)scopeIndexForCloudScopedIdentifier:(id)a3;
- (int64_t)scopeIndexForLocalScopedIdentifier:(id)a3;
- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3;
- (void)_beforeInitializeStorage;
- (void)transactionDidFinish;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteStorage

- (CPLPrequeliteStorage)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CPLPrequeliteStorage;
  v3 = -[CPLPrequeliteStorage initWithAbstractObject:](&v10, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](v3, "abstractObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[CPLPrequeliteTable tableWithName:](&OBJC_CLASS___CPLPrequeliteTable, "tableWithName:", v6));
    mainTable = v4->_mainTable;
    v4->_mainTable = (CPLPrequeliteTable *)v7;

    objc_storeStrong((id *)&v4->_nameTable, v4->_mainTable);
    v4->_shouldUpgradeSchema = 1;
  }

  return v4;
}

- (NSString)mainScopeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainScopeIdentifier]);

  return (NSString *)v3;
}

- (id)pqStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineStore]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 platformObject]);

  return v4;
}

- (id)engineLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineStore]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 engineLibrary]);

  return v4;
}

- (void)_beforeInitializeStorage
{
  self->_initializingStorage = 1;
}

- (BOOL)createStorage
{
  if (!-[CPLPrequeliteStorage isAlive](self, "isAlive") && !_CPLSilentLogging)
  {
    id v3 = sub_10014F0EC();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
      int v8 = 138412290;
      v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Creating storage for %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  -[CPLPrequeliteStorage _beforeInitializeStorage](self, "_beforeInitializeStorage");
  BOOL v6 = -[CPLPrequeliteStorage initializeStorage](self, "initializeStorage");
  -[CPLPrequeliteStorage _afterInitializeStorage](self, "_afterInitializeStorage");
  return v6;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  return 1;
}

- (id)mainTable
{
  return self->_mainTable;
}

- (BOOL)createMainTableWithColumnVariables:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10014F0EC();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (self->_tempTable) {
        v9 = "temporary ";
      }
      else {
        v9 = "";
      }
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 variables]);
      *(_DWORD *)buf = 136315394;
      v18 = v9;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Creating %stable with variables: %@",  buf,  0x16u);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 pqlConnection]);

  mainTable = self->_mainTable;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 definitionInjection]);
  unsigned __int8 v15 = [v12 cplExecute:@"CREATE TABLE %@ (%@)", mainTable, v14];

  if (a4 && (v15 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v12 lastCPLError]);
  }

  return v15;
}

- (BOOL)createMainTableWithDefinition:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10014F0EC();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (self->_tempTable) {
        v9 = "temporary ";
      }
      else {
        v9 = "";
      }
      *(_DWORD *)buf = 136315394;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Creating %stable with definition: %@",  buf,  0x16u);
    }
  }

  objc_super v10 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  v12 = -[PQLRawInjection initWithData:](v10, "initWithData:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);

  unsigned __int8 v15 = [v14 cplExecute:@"CREATE TABLE %@ (%@)", self->_mainTable, v12];
  BOOL v16 = v15;
  if (a4 && (v15 & 1) == 0) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
  }

  return v16;
}

- (id)columnVariableWithName:(id)a3 type:(id)a4
{
  return +[CPLPrequeliteVariable variableWithName:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:type:",  a3,  a4);
}

- (id)columnVariableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5
{
  return +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  a3,  a4,  a5);
}

- (BOOL)addColumnVariable:(id)a3 error:(id *)a4
{
  id v7 = a3;
  int v8 = v7;
  if (self->_initializingStorage)
  {
    sub_100199D58(v7, self, a2);
LABEL_19:
    sub_100199C6C(v8, self, a2);
  }

  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
    goto LABEL_19;
  }
  if (self->_initializingStorage)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10014F0EC();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = "temporary ";
        mainTable = self->_mainTable;
        if (!self->_tempTable) {
          v11 = "";
        }
        *(_DWORD *)buf = 138412802;
        v26 = v8;
        __int16 v27 = 2080;
        v28 = (void *)v11;
        __int16 v29 = 2112;
        v30 = mainTable;
        v13 = "Creating column %@ on %s%@";
        v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
        uint32_t v16 = 32;
        goto LABEL_12;
      }

      goto LABEL_13;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v17 = sub_10014F0EC();
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_mainTable;
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      __int16 v27 = 2112;
      v28 = v18;
      v13 = "Adding column %@ on %@";
      v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
    }

- (BOOL)addColumnVariableGroup:(id)a3 error:(id *)a4
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "variables", 0));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!-[CPLPrequeliteStorage addColumnVariable:error:]( self,  "addColumnVariable:error:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i),  a4))
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)createIndex:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (self->_initializingStorage) {
    goto LABEL_4;
  }
  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
    sub_100199E44(v13, self, a2);
  }
  if (self->_initializingStorage)
  {
LABEL_4:
    if (_CPLSilentLogging) {
      goto LABEL_11;
    }
    id v16 = sub_10014F0EC();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    v18 = "temporary ";
    mainTable = self->_mainTable;
    if (!self->_tempTable) {
      v18 = "";
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v37 = mainTable;
    __int16 v20 = "Creating index %@ on %s%@";
    id v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    uint32_t v23 = 32;
    goto LABEL_9;
  }

  if (!_CPLSilentLogging)
  {
    id v33 = sub_10014F0EC();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    v34 = self->_mainTable;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v34;
    __int16 v20 = "Adding index %@ on %@";
    id v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    uint32_t v23 = 22;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
LABEL_10:
  }

- (BOOL)createIndexOnColumnVariable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 variableName]);
  LOBYTE(a4) = -[CPLPrequeliteStorage createIndex:withDefinition:condition:unique:error:]( self,  "createIndex:withDefinition:condition:unique:error:",  v7,  v6,  0LL,  0LL,  a4);

  return (char)a4;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);

  id v14 = -[PQLRawInjection initWithData:](v12, "initWithData:", v13);
  LOBYTE(a6) = -[CPLPrequeliteStorage createIndex:withDefinition:condition:unique:error:]( self,  "createIndex:withDefinition:condition:unique:error:",  v11,  v14,  0LL,  v7,  a6);

  return (char)a6;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);

  id v17 = -[PQLRawInjection initWithData:](v15, "initWithData:", v16);
  v18 = objc_alloc(&OBJC_CLASS___PQLRawInjection);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);

  __int16 v20 = -[PQLRawInjection initWithData:](v18, "initWithData:", v19);
  LOBYTE(a7) = -[CPLPrequeliteStorage createIndex:withDefinition:condition:unique:error:]( self,  "createIndex:withDefinition:condition:unique:error:",  v14,  v17,  v20,  v8,  a7);

  return (char)a7;
}

- (BOOL)createIndexOnColumn:(id)a3 error:(id *)a4
{
  unsigned __int8 v6 = -[CPLPrequeliteStorage createIndexWithName:withDefinition:unique:error:]( self,  "createIndexWithName:withDefinition:unique:error:",  a3,  a3,  0LL,  a4);
  BOOL v7 = v6;
  if (a4 && (v6 & 1) == 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pqlConnection]);
    *a4 = (id)objc_claimAutoreleasedReturnValue([v9 lastCPLError]);
  }

  return v7;
}

- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10014F0EC();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Dropping index %@", buf, 0xCu);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable indexVariableForVariableWithName:forTable:]( &OBJC_CLASS___CPLPrequeliteVariable,  "indexVariableForVariableWithName:forTable:",  v6,  self->_nameTable));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pqlConnection]);
  unsigned __int8 v12 = [v11 cplExecute:@"DROP INDEX IF EXISTS %@", v9];

  if (a4 && (v12 & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pqlConnection]);
    *a4 = (id)objc_claimAutoreleasedReturnValue([v14 lastCPLError]);
  }

  return v12;
}

- (id)variableWithName:(id)a3 type:(id)a4
{
  return -[CPLPrequeliteStorage variableWithName:defaultValue:type:]( self,  "variableWithName:defaultValue:type:",  a3,  0LL,  a4);
}

- (id)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_tempTable)
  {
    id v15 = (CPLPrequeliteStorage *)sub_100199F30(v9, self, a2);
    return (id)-[CPLPrequeliteStorage createVariable:defaultValue:error:](v15, v16, v17, v18, v19);
  }

  else
  {
    unsigned __int8 v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:forTable:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:forTable:type:",  v9,  self->_mainTable,  v11));

    return v13;
  }

- (BOOL)createVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = (CPLPrequeliteTable *)a4;
  if (self->_tempTable)
  {
    unsigned __int8 v11 = 1;
    goto LABEL_15;
  }

  unsigned __int8 v12 = (CPLPrequeliteTable *)objc_claimAutoreleasedReturnValue([v9 table]);
  mainTable = self->_mainTable;

  if (v12 != mainTable)
  {
    sub_10019A01C(v9, a2, self);
    goto LABEL_20;
  }

  if (self->_initializingStorage) {
    goto LABEL_7;
  }
  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema"))
  {
LABEL_20:
    if (!_CPLSilentLogging)
    {
      id v24 = sub_10014F0EC();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_mainTable;
        *(_DWORD *)buf = 138412546;
        id v30 = v9;
        __int16 v31 = 2112;
        v32 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Trying to create variable %@ for %@ but the table has just been created",  buf,  0x16u);
      }
    }

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/Prequeli teStore/CPLPrequeliteStorage.m"));
    [v27 handleFailureInMethod:a2, self, v28, 240, @"Trying to create variable %@ for %@ but the table has just been created", v9, self->_mainTable object file lineNumber description];

    abort();
  }

  if (!self->_initializingStorage)
  {
    if (_CPLSilentLogging) {
      goto LABEL_12;
    }
    id v23 = sub_10014F0EC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v10;
    SEL v16 = "Adding variable %@ with default value %@";
    id v17 = v15;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }

- (BOOL)setValue:(id)a3 forVariable:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  unsigned __int8 v11 = (CPLPrequeliteTable *)objc_claimAutoreleasedReturnValue([v10 table]);
  mainTable = self->_mainTable;

  if (v11 == mainTable)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v14 = [v13 setValue:v9 forGlobalVariable:v10 error:a5];

    return v14;
  }

  else
  {
    SEL v16 = (CPLPrequeliteStorage *)sub_10019A0F0(v10, a2, self);
    return -[CPLPrequeliteStorage valueForVariable:](v16, v17, v18);
  }

- (id)valueForVariable:(id)a3
{
  id v5 = a3;
  id v6 = (CPLPrequeliteTable *)objc_claimAutoreleasedReturnValue([v5 table]);
  mainTable = self->_mainTable;

  if (v6 == mainTable)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForGlobalVariable:v5]);

    return v9;
  }

  else
  {
    unsigned __int8 v11 = (CPLPrequeliteStorage *)sub_10019A1C4(v5, a2, self);
    return (id)-[CPLPrequeliteStorage resetValueForVariable:error:](v11, v12, v13, v14);
  }

- (BOOL)resetValueForVariable:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = (CPLPrequeliteTable *)objc_claimAutoreleasedReturnValue([v7 table]);
  mainTable = self->_mainTable;

  if (v8 == mainTable)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v11 = [v10 resetValueForGlobalVariable:v7 error:a4];

    return v11;
  }

  else
  {
    id v13 = (CPLPrequeliteStorage *)sub_10019A298(v7, a2, self);
    return -[CPLPrequeliteStorage openWithError:](v13, v14, v15);
  }

- (BOOL)openWithError:(id *)a3
{
  self->_superWasCalled = 1;
  return 1;
}

- (BOOL)closeWithError:(id *)a3
{
  self->_superWasCalled = 1;
  return 1;
}

- (void)writeTransactionDidFail
{
  self->_superWasCalled = 1;
}

- (void)writeTransactionDidSucceed
{
  self->_superWasCalled = 1;
}

- (void)transactionDidFinish
{
  self->_superWasCalled = 1;
}

- (BOOL)isEmpty
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  if (![v3 shouldBeCreatedDynamically])
  {

    goto LABEL_5;
  }

  unsigned __int8 v4 = -[CPLPrequeliteStorage isAlive](self, "isAlive");

  if ((v4 & 1) != 0)
  {
LABEL_5:
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v5 = [v6 tableHasRecords:v7] ^ 1;

    return v5;
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isAlive
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v5 = [v3 hasTable:v4];

  return v5;
}

- (BOOL)shouldIncludeInStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  unsigned int v4 = [v3 shouldBeCreatedDynamically];

  if (!v4) {
    return 1;
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned __int8 v7 = [v5 hasTable:v6];

  return v7;
}

- (id)recordsDesignation
{
  return @"records";
}

- (id)status
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  if (([v3 shouldBeCreatedDynamically] & 1) == 0)
  {

    goto LABEL_5;
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v6 = [v4 hasTable:v5];

  if (v6)
  {
LABEL_5:
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    id v10 = [v8 tableCountOfRecords:v9];

    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage recordsDesignation](self, "recordsDesignation"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu %@", v10, v11));

    return v7;
  }

  unsigned __int8 v7 = 0LL;
  return v7;
}

- (id)statusDictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  if ([v3 shouldBeCreatedDynamically])
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
    unsigned int v6 = [v4 hasTable:v5];

    if (!v6) {
      return 0LL;
    }
  }

  else
  {
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v10 = [v8 tableCountOfRecords:v9];

  id v13 = @"records";
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  SEL v14 = v11;
  SEL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));

  return v12;
}

- (id)scopeIndexColumnName
{
  return @"scopeIndex";
}

- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4
{
  return 0LL;
}

- (id)_statusPerScopeIndex
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage scopeIndexColumnName](self, "scopeIndexColumnName"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100150CA4;
  v11[3] = &unk_1002473A8;
  v11[4] = self;
  unsigned __int8 v7 = v3;
  SEL v12 = v7;
  [v4 table:v5 enumerateCountGroupedByProperty:v6 block:v11];

  BOOL v8 = v12;
  id v9 = v7;

  return v9;
}

- (id)statusPerScopeIndexWithGroupProperty:(id)a3 valueDescription:(id)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (uint64_t (**)(id, void *))a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _statusPerScopeIndex](self, "_statusPerScopeIndex"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 pqlConnection]);

  id v25 = v6;
  unsigned __int8 v11 = (const char *)[v25 UTF8String];
  id v12 = +[PQLRawInjection rawInjection:length:](&OBJC_CLASS___PQLRawInjection, "rawInjection:length:", v11, strlen(v11));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  SEL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage mainTable](self, "mainTable"));
  id v24 = (void *)v13;
  id v15 = [v10 cplFetch:@"SELECT scopeIndex, %@, count(%@) FROM %@ GROUP BY scopeIndex, %@", v13, v13, v14, v13];

  if ([v15 next])
  {
    do
    {
      id v16 = [v15 integerAtIndex:0];
      SEL v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:1]);
      id v18 = [v15 unsignedIntegerAtIndex:2];
      if (v17)
      {
        uint64_t v19 = v7[2](v7, v17);
        __int16 v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);
      }

      else
      {
        __int16 v20 = @"(nil)";
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
      os_log_type_t v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v21]);

      [v22 appendFormat:@"\n\t%@: %lu", v20, v18];
    }

    while (([v15 next] & 1) != 0);
  }

  return v8;
}

- (BOOL)_checkSuperWasCalled
{
  BOOL superWasCalled = self->_superWasCalled;
  self->_BOOL superWasCalled = 0;
  return superWasCalled;
}

- (id)_scopes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 abstractObject]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scopes]);

  return v4;
}

- (int64_t)scopeIndexForLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scopedIdentifierForLocalScopedIdentifier:v4]);

  if (v6) {
    int64_t v7 = (int64_t)[v6 scopeIndex];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)scopeIndexForCloudScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scopedIdentifierForCloudScopedIdentifier:v4]);

  if (v6) {
    int64_t v7 = (int64_t)[v6 scopeIndex];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)localScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = [v5 indexForLocalScopeIdentifier:v4];

  return (int64_t)v6;
}

- (int64_t)cloudScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = [v5 indexForCloudScopeIdentifier:v4];

  return (int64_t)v6;
}

- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = [v5 stableScopeIndexForScopeIdentifier:v4];

  return (int64_t)v6;
}

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filterForIncludedScopeIdentifiers:v4]);

  return v6;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filterForExcludedScopeIdentifiers:v4]);

  return v6;
}

- (id)scopedIdentifierForLocalIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifierForLocalScopeIndex:a4]);

  if (v8)
  {
    id v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:",  v8,  v6);
    -[CPLScopedIdentifier setScopeIndex:](v9, "setScopeIndex:", a4);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)scopedIdentifierForCloudIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scopeIdentifierForCloudScopeIndex:a4]);

  if (v8)
  {
    id v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]( objc_alloc(&OBJC_CLASS___CPLScopedIdentifier),  "initWithScopeIdentifier:identifier:",  v8,  v6);
    -[CPLScopedIdentifier setScopeIndex:](v9, "setScopeIndex:", a4);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifierForCloudScopeIndex:a3]);

  return v5;
}

- (BOOL)isLocalScopeIndexValid:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 validLocalScopeIndexes]);
  LOBYTE(a3) = [v5 containsIndex:a3];

  return a3;
}

- (BOOL)isCloudScopeIndexValid:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage _scopes](self, "_scopes"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 validCloudScopeIndexes]);
  LOBYTE(a3) = [v5 containsIndex:a3];

  return a3;
}

- (BOOL)recreateMainTableWithCopyInstructions:(id)a3 oldFields:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self->_tempTable) {
    sub_10019A460( (uint64_t)self,  (uint64_t)a2,  v11,  v12,  v13,  v14,  v15,  v16,  v68,  v69,  v70,  v71,  v72,  v74,  (uint64_t)v76,  v78,  v80,  (uint64_t)v82,  v84,  v85,  *((uint64_t *)&v85 + 1));
  }
  id v17 = v10;
  if (!-[CPLPrequeliteStorage shouldUpgradeSchema](self, "shouldUpgradeSchema")) {
    sub_10019A36C((uint64_t)self, (uint64_t)a2);
  }
  v79 = a5;
  id v83 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage abstractObject](self, "abstractObject"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 name]);
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:@"_temp"]);

  v81 = (void *)v20;
  id v21 = (CPLPrequeliteTable *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteTable tableWithName:]( &OBJC_CLASS___CPLPrequeliteTable,  "tableWithName:",  v20));
  tempTable = self->_tempTable;
  self->_tempTable = v21;

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](self, "pqStore"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pqlConnection]);

  id v77 = v9;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteTable tableName](self->_mainTable, "tableName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingString:@"."]);

  __int16 v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  p_mainTable = &self->_mainTable;
  id v28 = [v24 cplFetch:@"SELECT name FROM sqlite_master WHERE type = index AND tbl_name = %@", self->_mainTable];
  id v29 = [v28 enumerateObjectsOfClass:objc_opt_class(NSString)];
  id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  id v31 = [v30 countByEnumeratingWithState:&v89 objects:v102 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v90;
    do
    {
      for (i = 0LL; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v90 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
      }

      id v32 = [v30 countByEnumeratingWithState:&v89 objects:v102 count:16];
    }

    while (v32);
  }

  v75 = self;

  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  v36 = v27;
  id v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v85,  v101,  16LL);
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v86;
    while (2)
    {
      for (j = 0LL; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v86 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[PQLNameInjection nameWithString:]( &OBJC_CLASS___PQLNameInjection,  "nameWithString:",  *(void *)(*((void *)&v85 + 1) + 8LL * (void)j)));
        unsigned __int8 v42 = [v24 cplExecute:@"DROP INDEX %@", v41];

        if ((v42 & 1) == 0)
        {

          self = v75;
          id v9 = v77;
          goto LABEL_31;
        }
      }

      id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v36,  "countByEnumeratingWithState:objects:count:",  &v85,  v101,  16LL);
      if (v38) {
        continue;
      }
      break;
    }
  }

  v43 = *p_mainTable;
  self = v75;
  objc_storeStrong((id *)p_mainTable, v75->_tempTable);
  unsigned int v44 = -[CPLPrequeliteStorage createStorage](v75, "createStorage");
  v45 = *p_mainTable;
  *p_mainTable = v43;

  id v9 = v77;
  if (!v44) {
    goto LABEL_31;
  }
  id v46 = v77;
  v47 = (const char *)[v46 UTF8String];
  id v48 = +[PQLRawInjection rawInjection:length:](&OBJC_CLASS___PQLRawInjection, "rawInjection:length:", v47, strlen(v47));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  id v50 = v83;
  v51 = (const char *)[v50 UTF8String];
  id v52 = +[PQLRawInjection rawInjection:length:](&OBJC_CLASS___PQLRawInjection, "rawInjection:length:", v51, strlen(v51));
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  unsigned int v54 = [v24 cplExecute:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", v75->_tempTable, v49, v53, *p_mainTable];
  id v55 = [v24 changes];

  if (!v54) {
    goto LABEL_31;
  }
  if ([v24 cplExecute:@"DROP TABLE %@", *p_mainTable]
    && ([v24 cplExecute:@"ALTER TABLE %@ RENAME TO %@", v75->_tempTable, *p_mainTable] & 1) != 0)
  {
    v56 = v83;
    if (!_CPLSilentLogging)
    {
      id v57 = sub_10014F0EC();
      v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = *p_mainTable;
        *(_DWORD *)buf = 138413058;
        v94 = v59;
        __int16 v95 = 2112;
        id v96 = v50;
        __int16 v97 = 2112;
        id v98 = v46;
        __int16 v99 = 2048;
        id v100 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "successfully recreated %@ using copy %@ -> %@ (%lld records copied)",  buf,  0x2Au);
      }
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteStorage pqStore](v75, "pqStore"));
    [v60 recordUpgradeEvent:@"successfully recreated %@ using copy %@ -> %@ (%lld records copied)", *p_mainTable, v50, v46, v55];

    BOOL v61 = 1;
  }

  else
  {
LABEL_31:
    v56 = v83;
    if (!_CPLSilentLogging)
    {
      id v62 = sub_10014F0EC();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        mainTable = self->_mainTable;
        v65 = (void *)objc_claimAutoreleasedReturnValue([v24 lastError]);
        *(_DWORD *)buf = 138413058;
        v94 = mainTable;
        __int16 v95 = 2112;
        id v96 = v83;
        __int16 v97 = 2112;
        id v98 = v9;
        __int16 v99 = 2112;
        id v100 = v65;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "Failed to recreate %@ using copy %@ -> %@: %@",  buf,  0x2Au);
      }
    }

    BOOL v61 = 0;
    if (v79) {
      id *v79 = (id)objc_claimAutoreleasedReturnValue([v24 lastError]);
    }
  }

  v66 = self->_tempTable;
  self->_tempTable = 0LL;

  return v61;
}

- (BOOL)shouldUpgradeSchema
{
  return self->_shouldUpgradeSchema;
}

- (void).cxx_destruct
{
}

@end