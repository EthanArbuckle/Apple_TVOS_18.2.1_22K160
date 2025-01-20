@interface RMStoreController
+ (RMStoreController)sharedController;
+ (void)start;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)clientByIdentifier;
- (NSPersistentContainer)persistentContainer;
- (RMDebounceTimer)debouncer;
- (RMStoreController)initWithPersistentContainer:(id)a3 context:(id)a4;
- (id)_activeConfigurationsAndAssetsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5;
- (id)_activeConfigurationsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 includeAssets:(BOOL)a5 error:(id *)a6;
- (id)_activeConfigurationsForStoreIdentifier:(id)a3 error:(id *)a4;
- (id)_activeConfigurationsOnlyForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5;
- (id)_allManagementSourcesReturningError:(id *)a3;
- (id)_buildFlattenedConfigurations:(id)a3 includeAssets:(BOOL)a4 error:(id *)a5;
- (id)_clientForIdentifier:(id)a3;
- (id)_configurationsWithVisibleUIForConfigurationTypes:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_declarationsForStoreIdentifier:(id)a3 declarationTypes:(id)a4 identifier:(id)a5 error:(id *)a6;
- (id)_declarationsOfClass:(Class)a3 managementSource:(id)a4 declarationTypes:(id)a5 identifier:(id)a6 error:(id *)a7;
- (id)_makeClientWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 persistentContainer:(id)a5;
- (id)_managementSourceWithIdentifier:(id)a3 error:(id *)a4;
- (id)_newPayloadWithDeclaration:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_observerStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)_payloadsForDeclarationIdentifier:(id)a3 managementSource:(id)a4 error:(id *)a5;
- (id)_payloadsForPayloadClass:(Class)a3 identifier:(id)a4 managementSource:(id)a5 error:(id *)a6;
- (id)_providerStoreWithIdentifier:(id)a3 error:(id *)a4;
- (id)_startClientForSourceIdentifier:(id)a3 objectID:(id)a4;
- (id)_subscriberStoreWithIdentifier:(id)a3 error:(id *)a4;
- (void)_addOptionsToManagementSource:(id)a3 options:(id)a4;
- (void)_observerStoresDidChange;
- (void)_start;
- (void)_stopClientForIdentifier:(id)a3;
- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7;
- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)observerStoresDidChange;
- (void)observerStoresWithCompletionHandler:(id)a3;
- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)providerStoresWithCompletionHandler:(id)a3;
- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setClientByIdentifier:(id)a3;
- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8;
- (void)setDebouncer:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoresWithCompletionHandler:(id)a3;
- (void)triggerAggregatingTimerAction;
- (void)unassignAssets:(id)a3 completionHandler:(id)a4;
@end

@implementation RMStoreController

+ (RMStoreController)sharedController
{
  if (qword_1000CF3B0 != -1) {
    dispatch_once(&qword_1000CF3B0, &stru_1000BAB18);
  }
  return (RMStoreController *)(id)qword_1000CF3A8;
}

- (RMStoreController)initWithPersistentContainer:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___RMStoreController;
  v9 = -[RMStoreController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentContainer, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    clientByIdentifier = v10->_clientByIdentifier;
    v10->_clientByIdentifier = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[RMDebounceTimer debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:]( &OBJC_CLASS___RMDebounceTimer,  "debounceTimerWithMinimumInterval:maximumInterval:delegate:identifier:",  v10,  @"RMStoreController",  1.0,  10.0));
    debouncer = v10->_debouncer;
    v10->_debouncer = (RMDebounceTimer *)v13;
  }

  return v10;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100066530;
  block[3] = &unk_1000B9100;
  block[4] = a1;
  if (qword_1000CF3B8 != -1) {
    dispatch_once(&qword_1000CF3B8, block);
  }
}

- (void)_start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = sub_100066698;
  uint64_t v13 = sub_1000666A8;
  id v14 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000666B0;
  v6[3] = &unk_1000BAB40;
  v6[4] = self;
  id v8 = &v9;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v7 = v4;
  [v3 performBlockAndWait:v6];
  if (!v10[5])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000668A0;
    v5[3] = &unk_1000BAB68;
    v5[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v4, "enumerateKeysAndObjectsUsingBlock:", v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (id)_startClientForSourceIdentifier:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController persistentContainer](self, "persistentContainer"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _makeClientWithManagementSourceObjectID:storeIdentifier:persistentContainer:]( self,  "_makeClientWithManagementSourceObjectID:storeIdentifier:persistentContainer:",  v6,  v7,  v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController clientByIdentifier](self, "clientByIdentifier"));
  [v10 setObject:v9 forKeyedSubscript:v7];

  [v9 start];
  return v9;
}

- (id)_makeClientWithManagementSourceObjectID:(id)a3 storeIdentifier:(id)a4 persistentContainer:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___RMStoreClient);
  v10 = objc_opt_new(&OBJC_CLASS___RMStatusQuerier);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController persistentContainer](self, "persistentContainer"));
  v12 = -[RMStoreClient initWithManagementSourceObjectID:storeIdentifier:statusQuerier:persistentContainer:]( v9,  "initWithManagementSourceObjectID:storeIdentifier:statusQuerier:persistentContainer:",  v8,  v7,  v10,  v11);

  return v12;
}

- (void)_stopClientForIdentifier:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController clientByIdentifier](self, "clientByIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);

  if (v5)
  {
    [v5 remove];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController clientByIdentifier](self, "clientByIdentifier"));
    [v6 removeObjectForKey:v7];
  }
}

- (id)_clientForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController clientByIdentifier](self, "clientByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ObserverStoreWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_100066698;
  v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100066698;
  v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100066CF8;
  v11[3] = &unk_1000BAB90;
  uint64_t v13 = &v15;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)observerStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ObserverStoresWithCompletionHandler...",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100066698;
  v18 = sub_1000666A8;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_100066698;
  id v12 = sub_1000666A8;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100066F1C;
  v7[3] = &unk_1000B9738;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0LL);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DeclarationWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000LL;
  v29 = sub_100066698;
  v30 = sub_1000666A8;
  id v31 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_100066698;
  id v25 = sub_1000666A8;
  id v26 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100067380;
  v16[3] = &unk_1000BABB8;
  id v19 = &v21;
  v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  p___int128 buf = &buf;
  [v12 performBlockAndWait:v16];
  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    v10[2](v10, 0LL);
  }

  else
  {
    if ([(id)v22[5] count])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v22[5] objectAtIndexedSubscript:0]);
      ((void (*)(void (**)(id, void), void *, void))v10[2])(v10, v15, 0LL);
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createDeclarationNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createDeclarationNotFoundErrorWithIdentifier:",  v14));
      ((void (*)(void (**)(id, void), void, void *))v10[2])(v10, 0LL, v15);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DeclarationsForStoreIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100066698;
  id v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006761C;
  v11[3] = &unk_1000BAB90;
  id v13 = &v15;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DeclarationsWithTypes with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100066698;
  v29 = sub_1000666A8;
  id v30 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  v24 = sub_1000666A8;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000678E8;
  v15[3] = &unk_1000BABB8;
  id v18 = &v20;
  v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  p___int128 buf = &buf;
  [v12 performBlockAndWait:v15];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v10[2](v10, 0LL);
  }
  else {
    v10[2](v10, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "DeclarationManifestForStoreIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100066698;
  v29 = sub_1000666A8;
  id v30 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  v24 = sub_1000666A8;
  id v25 = 0LL;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100067BA4;
  uint64_t v15 = &unk_1000BAB90;
  id v18 = &v20;
  id v16 = self;
  id v10 = v6;
  id v17 = v10;
  p___int128 buf = &buf;
  [v9 performBlockAndWait:&v12];
  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    v7[2](v7, 0LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMDeclarationManifest declarationManifestWithDeclarations:]( &OBJC_CLASS___RMDeclarationManifest,  "declarationManifestWithDeclarations:",  v21[5],  v12,  v13,  v14,  v15,  v16));
    ((void (*)(void (**)(id, void), void *, void))v7[2])(v7, v11, 0LL);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ConfigurationUIsForStoreIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  +[RMConfigurationPublisher fetchVisibleConfigurationUIs]( &OBJC_CLASS___RMConfigurationPublisher,  "fetchVisibleConfigurationUIs");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100066698;
  id v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100067E48;
  v11[3] = &unk_1000B9738;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v20 = (void (**)(void))a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DisplayableProfileConfigurations", buf, 2u);
  }

  v45[0] = RMConfigurationTypeLegacyProfiles;
  v45[1] = RMConfigurationTypeLegacyInteractiveProfiles;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  v39 = buf;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_100066698;
  v42 = sub_1000666A8;
  id v43 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = sub_100066698;
  v36 = sub_1000666A8;
  id v37 = 0LL;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10006856C;
  v27[3] = &unk_1000BABB8;
  id v30 = &v32;
  v27[4] = self;
  id v19 = v9;
  id v28 = v19;
  id v10 = v6;
  id v29 = v10;
  id v31 = buf;
  [v21 performBlockAndWait:v27];
  uint64_t v22 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = (id)v33[5];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "declarationIdentifier", v19));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 declarationServerToken]);
        unsigned __int8 v18 = +[RMConfigurationStatusArchiver validStatusForStoreIdentifier:declarationIdentifier:serverToken:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "validStatusForStoreIdentifier:declarationIdentifier:serverToken:",  v10,  v16,  v17);

        if ((v18 & 1) != 0) {
          -[NSMutableArray addObject:](v22, "addObject:", v15);
        }
      }

      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v44 count:16];
    }

    while (v12);
  }

  v20[2]();
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(buf, 8);
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a6;
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 declarationIdentifier]);
    int v12 = 138543362;
    uint64_t v13 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SetShouldInstallConfiguration with %{public}@...",  (uint8_t *)&v12,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createNotImplementedErrorForFeature:]( &OBJC_CLASS___RMErrorUtilities,  "createNotImplementedErrorForFeature:",  @"SetShouldInstallConfiguration"));
  v8[2](v8, v11);
}

- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "fetchDataAtURL with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000LL;
  id v29 = sub_100066698;
  id v30 = sub_1000666A8;
  id v31 = 0LL;
  uint64_t v23 = 0LL;
  __int128 v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100068994;
  v19[3] = &unk_1000B9408;
  v19[4] = self;
  id v13 = v9;
  id v20 = v13;
  p___int128 buf = &buf;
  uint64_t v22 = &v23;
  [v12 performBlockAndWait:v19];
  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    v10[2](v10, 0LL);
  }

  else
  {
    id v14 = objc_opt_new(&OBJC_CLASS___RMStoreDataFetcher);
    uint64_t v15 = *((unsigned __int8 *)v24 + 24);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100068A48;
    v16[3] = &unk_1000BABE0;
    id v17 = v8;
    unsigned __int8 v18 = v10;
    -[RMStoreDataFetcher fetchDataAtURL:useDDM:completionHandler:]( v14,  "fetchDataAtURL:useDDM:completionHandler:",  v17,  v15,  v16);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)triggerAggregatingTimerAction
{
}

- (void)observerStoresDidChange
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[RMStoreController debouncer](self, "debouncer"));
  [v2 trigger];
}

- (void)_observerStoresDidChange
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100070818();
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v3 postNotificationName:RMObserverStoreStoreDidChangeNotification object:0 userInfo:0 options:3];
}

- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7
{
  id v10 = a6;
  id v11 = (void (**)(id, void, uint64_t))a7;
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CreateStoreWithType...", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  v48 = buf;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_100066698;
  v51 = sub_1000666A8;
  id v52 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_100066698;
  v45 = sub_1000666A8;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_100066698;
  v39 = sub_1000666A8;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_100066698;
  v33 = sub_1000666A8;
  id v34 = 0LL;
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_100068E4C;
  id v20 = &unk_1000BAC08;
  int64_t v28 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  id v21 = v13;
  __int128 v24 = &v29;
  id v14 = v10;
  id v22 = v14;
  uint64_t v23 = self;
  uint64_t v25 = buf;
  char v26 = &v41;
  uint64_t v27 = &v35;
  [v13 performBlockAndWait:&v17];
  if (*((void *)v48 + 5))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _startClientForSourceIdentifier:objectID:]( self,  "_startClientForSourceIdentifier:objectID:",  v42[5],  v36[5],  v17,  v18,  v19,  v20,  v21));
    [v15 create];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMClientController sharedController]( &OBJC_CLASS___RMClientController,  "sharedController",  v17,  v18,  v19,  v20));
  [v16 managementChannelsChanged];

  v11[2](v11, *((void *)v48 + 5), v30[5]);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(buf, 8);
}

- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "RemoveStoreWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  -[RMStoreController _stopClientForIdentifier:](self, "_stopClientForIdentifier:", v6);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000LL;
  __int128 v24 = sub_100066698;
  uint64_t v25 = sub_1000666A8;
  id v26 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_100069370;
  id v17 = &unk_1000BAC30;
  uint64_t v18 = self;
  id v10 = v6;
  id v19 = v10;
  p___int128 buf = &buf;
  id v11 = v9;
  id v20 = v11;
  [v11 performBlockAndWait:&v14];
  +[RMConfigurationStatusArchiver removeAllStatusForStoreIdentifier:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "removeAllStatusForStoreIdentifier:error:",  v10,  0LL,  v14,  v15,  v16,  v17,  v18);
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
  [v12 listenToNotificationsForAllKeyPaths];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
  [v13 managementChannelsChanged];

  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40LL));
  _Block_object_dispose(&buf, 8);
}

- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ProviderStoreWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  __int128 v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_100066698;
  id v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006968C;
  v11[3] = &unk_1000BAB90;
  id v13 = &v15;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)providerStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ProviderStoresWithCompletionHandler...",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100066698;
  uint64_t v18 = sub_1000666A8;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100066698;
  id v12 = sub_1000666A8;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000698B0;
  v7[3] = &unk_1000B9738;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0LL);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 declarationIdentifier]);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SaveDeclaration with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000LL;
  __int128 v24 = sub_100066698;
  id v25 = sub_1000666A8;
  id v26 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100069C7C;
  v17[3] = &unk_1000BAC58;
  v17[4] = self;
  id v14 = v9;
  id v18 = v14;
  p___int128 buf = &buf;
  id v15 = v8;
  id v19 = v15;
  id v16 = v13;
  id v20 = v16;
  [v16 performBlockAndWait:v17];
  v10[2](v10, *(void *)(*((void *)&buf + 1) + 40LL));

  _Block_object_dispose(&buf, 8);
}

- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "DeleteDeclarationWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  __int128 v24 = sub_1000666A8;
  id v25 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006A314;
  v16[3] = &unk_1000BAC58;
  void v16[4] = self;
  id v13 = v9;
  id v17 = v13;
  p___int128 buf = &buf;
  id v14 = v8;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  [v15 performBlockAndWait:v16];
  v10[2](v10, *(void *)(*((void *)&buf + 1) + 40LL));

  _Block_object_dispose(&buf, 8);
}

- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ApplyChangesForStoreIdentifier with %{public}@...",  (uint8_t *)&v12,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController _clientForIdentifier:](self, "_clientForIdentifier:", v6));
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 syncWithCompletionHandler:v7];
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
    [v11 applyNowWithIdentifier:v6 completionHandler:v7];
  }
}

- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SubscriberStoreWithIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  __int128 v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100066698;
  id v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006A95C;
  v11[3] = &unk_1000BAB90;
  id v13 = &v15;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  [v9 performBlockAndWait:v11];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v7[2](v7, 0LL);
  }
  else {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)subscriberStoresWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SubscriberStoresWithCompletionHandler...",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  uint64_t v15 = buf;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_100066698;
  id v18 = sub_1000666A8;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_100066698;
  id v12 = sub_1000666A8;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006AB80;
  v7[3] = &unk_1000B9738;
  v7[4] = self;
  v7[5] = buf;
  v7[6] = &v8;
  [v6 performBlockAndWait:v7];
  if (*((void *)v15 + 5)) {
    v4[2](v4, 0LL);
  }
  else {
    v4[2](v4, v9[5]);
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(buf, 8);
}

- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SubscribedStoreDeclarationsWithTypes...",  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100066698;
  uint64_t v32 = sub_1000666A8;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_100066698;
  id v26 = sub_1000666A8;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100066698;
  id v20 = sub_1000666A8;
  id v21 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006AF5C;
  v11[3] = &unk_1000BAC80;
  void v11[4] = self;
  id v13 = buf;
  id v14 = &v22;
  uint64_t v15 = &v16;
  id v10 = v6;
  id v12 = v10;
  [v9 performBlockAndWait:v11];
  if (*((void *)v29 + 5)) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
  else {
    (*((void (**)(id, uint64_t, uint64_t))v7 + 2))(v7, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
}

- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "SubscribedDeclarationsWithTypes with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000LL;
  int64_t v28 = sub_100066698;
  uint64_t v29 = sub_1000666A8;
  id v30 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_100066698;
  uint64_t v24 = sub_1000666A8;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006B440;
  v15[3] = &unk_1000BABB8;
  uint64_t v18 = &v20;
  v15[4] = self;
  id v13 = v8;
  id v16 = v13;
  id v14 = v9;
  id v17 = v14;
  p___int128 buf = &buf;
  [v12 performBlockAndWait:v15];
  if (*(void *)(*((void *)&buf + 1) + 40LL)) {
    v10[2](v10, 0LL);
  }
  else {
    v10[2](v10, v21[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SubscribedStoreConfigurationsVisibleUIWithTypes...",  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_100066698;
  uint64_t v32 = sub_1000666A8;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_100066698;
  id v26 = sub_1000666A8;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100066698;
  uint64_t v20 = sub_1000666A8;
  id v21 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006B6D8;
  v11[3] = &unk_1000BAC80;
  void v11[4] = self;
  id v13 = buf;
  id v14 = &v22;
  uint64_t v15 = &v16;
  id v10 = v6;
  id v12 = v10;
  [v9 performBlockAndWait:v11];
  if (*((void *)v29 + 5)) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
  else {
    (*((void (**)(id, uint64_t, uint64_t))v7 + 2))(v7, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
}

- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ResolveAsset with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_100066698;
  v54 = sub_1000666A8;
  id v55 = 0LL;
  uint64_t v45 = 0LL;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = sub_100066698;
  uint64_t v49 = sub_1000666A8;
  id v50 = 0LL;
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_100066698;
  uint64_t v43 = sub_1000666A8;
  id v44 = 0LL;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  id v12 = (void *)v11;
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006BCB8;
  v23[3] = &unk_1000BACA8;
  v23[4] = self;
  id v13 = v8;
  id v24 = v13;
  id v14 = v19;
  id v25 = v14;
  p___int128 buf = &buf;
  id v27 = &v45;
  int64_t v28 = &v39;
  uint64_t v29 = &v35;
  uint64_t v30 = &v31;
  [v12 performBlockAndWait:v23];
  if (*(void *)(*((void *)&buf + 1) + 40LL))
  {
    v9[2](v9, 0LL);
  }

  else
  {
    uint64_t v15 = v46[5];
    uint64_t v16 = v40[5];
    uint64_t v17 = *((unsigned __int8 *)v36 + 24);
    uint64_t v18 = v32[3];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10006BF8C;
    v20[3] = &unk_1000BA9A8;
    id v21 = v14;
    uint64_t v22 = v9;
    +[RMStoreAssetResolver resolveAsset:unresolvedAsset:personaID:isDDM:enrollmentType:completionHandler:]( &OBJC_CLASS___RMStoreAssetResolver,  "resolveAsset:unresolvedAsset:personaID:isDDM:enrollmentType:completionHandler:",  v15,  v21,  v16,  v17,  v18,  v20);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)unassignAssets:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100066698;
  uint64_t v23 = sub_1000666A8;
  id v24 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006C1CC;
  v16[3] = &unk_1000B8DA8;
  void v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  uint64_t v18 = &v19;
  [v8 performBlockAndWait:v16];
  uint64_t v10 = v20[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10006C274;
  v13[3] = &unk_1000B8EE0;
  id v11 = v9;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  +[RMStoreAssetResolver unassignAssets:personaID:completionHandler:]( &OBJC_CLASS___RMStoreAssetResolver,  "unassignAssets:personaID:completionHandler:",  v11,  v10,  v13);

  _Block_object_dispose(&v19, 8);
}

- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, void))a8;
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "SetConfigurationUIWithStoreIdentifier with %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000LL;
  v42 = sub_100066698;
  uint64_t v43 = sub_1000666A8;
  id v44 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  char v39 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10006C5A4;
  v27[3] = &unk_1000BACD0;
  v27[4] = self;
  id v21 = v14;
  id v28 = v21;
  p___int128 buf = &buf;
  id v22 = v15;
  id v29 = v22;
  id v23 = v16;
  id v30 = v23;
  BOOL v35 = a6;
  id v24 = v17;
  id v31 = v24;
  uint64_t v34 = &v36;
  id v25 = v20;
  id v32 = v25;
  [v25 performBlockAndWait:v27];
  uint64_t v26 = *((void *)&buf + 1);
  if (*((_BYTE *)v37 + 24) && !*(void *)(*((void *)&buf + 1) + 40LL))
  {
    -[RMStoreController observerStoresDidChange](self, "observerStoresDidChange");
    uint64_t v26 = *((void *)&buf + 1);
  }

  v18[2](v18, *(void *)(v26 + 40));

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_100066698;
  uint64_t v34 = sub_1000666A8;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_100066698;
  id v28 = sub_1000666A8;
  id v29 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006CBB8;
  v20[3] = &unk_1000B9408;
  void v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  id v22 = &v30;
  id v23 = &v24;
  [v13 performBlockAndWait:v20];
  if (v31[5])
  {
    v12[2](v12);
  }

  else
  {
    int64_t v15 = +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope");
    id v16 = +[RMManagedTrustStoreController newManagedTrustStoreControllerProtocolForScope:personaID:]( &OBJC_CLASS___RMManagedTrustStoreController,  "newManagedTrustStoreControllerProtocolForScope:personaID:",  v15,  v25[5]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
    uint64_t v18 = (id *)(v31 + 5);
    id obj = (id)v31[5];
    [v16 setTrustForCertificateRef:v10 configurationKey:v17 fullTrust:v7 error:&obj];
    objc_storeStrong(v18, obj);

    ((void (*)(void (**)(void), uint64_t))v12[2])(v12, v31[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_100066698;
  id v27 = sub_1000666A8;
  id v28 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006CE10;
  v20[3] = &unk_1000B8DA8;
  void v20[4] = self;
  id v14 = v11;
  id v21 = v14;
  id v22 = &v23;
  [v13 performBlockAndWait:v20];
  int64_t v15 = +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope");
  id v16 = +[RMManagedTrustStoreController newManagedTrustStoreControllerProtocolForScope:personaID:]( &OBJC_CLASS___RMManagedTrustStoreController,  "newManagedTrustStoreControllerProtocolForScope:personaID:",  v15,  v24[5]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
  id v19 = 0LL;
  [v16 removeTrustForCertificateRef:v10 configurationKey:v17 fullTrust:v7 error:&v19];
  id v18 = v19;

  v12[2](v12, v18);
  _Block_object_dispose(&v23, 8);
}

- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_100066698;
  uint64_t v32 = sub_1000666A8;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100066698;
  uint64_t v26 = sub_1000666A8;
  id v27 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10006D0AC;
  v18[3] = &unk_1000B9408;
  v18[4] = self;
  id v12 = v9;
  id v19 = v12;
  uint64_t v20 = &v28;
  id v21 = &v22;
  [v11 performBlockAndWait:v18];
  if (v29[5])
  {
    v10[2](v10, 0LL);
  }

  else
  {
    int64_t v13 = +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope");
    id v14 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:]( &OBJC_CLASS___RMManagedKeychainController,  "newManagedKeychainControllerForScope:personaID:",  v13,  v23[5]);
    id v17 = 0LL;
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 certificatePersistentRefForAssetKey:v8 error:&v17]);
    id v16 = v17;
    ((void (*)(void (**)(id, void), void *, id))v10[2])(v10, v15, v16);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
}

- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v33 = (void (**)(id, void))a4;
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_100066698;
  v62 = sub_1000666A8;
  id v63 = 0LL;
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  id v55 = sub_100066698;
  v56 = sub_1000666A8;
  id v57 = 0LL;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10006D69C;
  v48[3] = &unk_1000B9408;
  v48[4] = self;
  id v7 = v6;
  id v49 = v7;
  id v50 = &v58;
  v51 = &v52;
  [v34 performBlockAndWait:v48];
  if (v59[5])
  {
    v33[2](v33, 0LL);
  }

  else
  {
    int64_t v8 = +[RMStoreHelper storeScope](&OBJC_CLASS___RMStoreHelper, "storeScope");
    id v9 = +[RMManagedKeychainController newManagedKeychainControllerForScope:personaID:]( &OBJC_CLASS___RMManagedKeychainController,  "newManagedKeychainControllerForScope:personaID:",  v8,  v53[5]);
    id v47 = 0LL;
    uint64_t v32 = v9;
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v9 assetKeysForCertificatesAndReturnError:&v47]);
    id v10 = v47;
    if (v10)
    {
      id v11 = v10;
      ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0LL, v10);
    }

    else
    {
      id v46 = 0LL;
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v32 assetKeysForIdentitiesAndReturnError:&v46]);
      id v12 = v46;
      if (v12)
      {
        id v11 = v12;
        ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0LL, v12);
      }

      else
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v30));
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v31 count]));
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v13 = v31;
        id v14 = [v13 countByEnumeratingWithState:&v42 objects:v65 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v43 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
              id v18 = +[RMStoreDeclarationKey newDeclarationKey:]( &OBJC_CLASS___RMStoreDeclarationKey,  "newDeclarationKey:",  v17);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 storeIdentifier]);
              unsigned int v20 = [v19 isEqualToString:v7];

              if (v20) {
                [v36 addObject:v17];
              }
            }

            id v14 = [v13 countByEnumeratingWithState:&v42 objects:v65 count:16];
          }

          while (v14);
        }

        if ([v36 count])
        {
          id v41 = 0LL;
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v32 certificatePersistentRefsForAssetKeys:v36 error:&v41]);
          id v11 = v41;
          if (v11)
          {
            ((void (*)(void (**)(id, void), void, id))v33[2])(v33, 0LL, v11);
          }

          else
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v29 count]));
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            id v22 = v29;
            id v23 = [v22 countByEnumeratingWithState:&v37 objects:v64 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v38;
              do
              {
                for (j = 0LL; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)j);
                  id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v26, v29));
                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[RMCertificateStatusItem certificateStatusItemWithPersistentRef:isIdentity:]( RMCertificateStatusItem,  "certificateStatusItemWithPersistentRef:isIdentity:",  v27,  [v35 containsObject:v26]));
                  [v21 setObject:v28 forKeyedSubscript:v26];
                }

                id v23 = [v22 countByEnumeratingWithState:&v37 objects:v64 count:16];
              }

              while (v23);
            }

            ((void (*)(void (**)(id, void), void *, void))v33[2])(v33, v21, 0LL);
          }
        }

        else
        {
          ((void (*)(void (**)(id, void), void *, void))v33[2])( v33,  &__NSDictionary0__struct,  0LL);
          id v11 = 0LL;
        }
      }
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
}

- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "MetadataForStoreIdentifier in store %{public}@...",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100066698;
  uint64_t v24 = sub_1000666A8;
  id v25 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100066698;
  id v19 = sub_1000666A8;
  id v20 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006D920;
  v11[3] = &unk_1000B9408;
  void v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  p___int128 buf = &buf;
  id v14 = &v15;
  [v9 performBlockAndWait:v11];
  v7[2](v7, v16[5], *(void *)(*((void *)&buf + 1) + 40LL));

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "MetadataValueForKey with key %{public}@ in store %{public}@...",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v27 = sub_100066698;
  uint64_t v28 = sub_1000666A8;
  id v29 = 0LL;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_100066698;
  uint64_t v24 = sub_1000666A8;
  id v25 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006DDF8;
  v15[3] = &unk_1000BACF8;
  v15[4] = self;
  id v13 = v9;
  id v16 = v13;
  id v18 = buf;
  id v14 = v8;
  id v17 = v14;
  id v19 = &v20;
  [v12 performBlockAndWait:v15];
  v10[2](v10, v21[5], *(void *)(*(void *)&buf[8] + 40LL));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SetMetadataValue with key %{public}@ in store %{public}@...",  buf,  0x16u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController context](self, "context"));
  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v27 = sub_100066698;
  uint64_t v28 = sub_1000666A8;
  id v29 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006E24C;
  v20[3] = &unk_1000BAD20;
  void v20[4] = self;
  id v16 = v12;
  id v21 = v16;
  id v25 = buf;
  id v17 = v11;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  id v19 = v15;
  id v24 = v19;
  [v19 performBlockAndWait:v20];
  v13[2](v13, *(void *)(*(void *)&buf[8] + 40LL));

  _Block_object_dispose(buf, 8);
}

- (id)_observerStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a3,  &v10));
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMObserverStore storeFromManagementSource:]( &OBJC_CLASS___RMObserverStore,  "storeFromManagementSource:",  v5));
  }

  else
  {
    id v8 = 0LL;
    if (a4 && v6)
    {
      id v8 = 0LL;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_providerStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a3,  &v10));
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMProviderStore storeFromManagementSource:]( &OBJC_CLASS___RMProviderStore,  "storeFromManagementSource:",  v5));
  }

  else
  {
    id v8 = 0LL;
    if (a4 && v6)
    {
      id v8 = 0LL;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_subscriberStoreWithIdentifier:(id)a3 error:(id *)a4
{
  id v10 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a3,  &v10));
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMSubscriberStore storeFromManagementSource:]( &OBJC_CLASS___RMSubscriberStore,  "storeFromManagementSource:",  v5));
  }

  else
  {
    id v8 = 0LL;
    if (a4 && v6)
    {
      id v8 = 0LL;
      *a4 = v6;
    }
  }

  return v8;
}

- (id)_managementSourceWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RMManagementSource fetchRequestWithIdentifier:]( &OBJC_CLASS___RMManagementSource,  "fetchRequestWithIdentifier:",  v5));
  id v15 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v15]);
  id v8 = v15;
  if (v7)
  {
    if ([v7 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
    }

    else
    {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100071104();
      }

      if (a4)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v5));
        id v13 = v12;
        if (v12) {
          *a4 = v12;
        }
      }

      id v9 = 0LL;
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1000710A4();
    }

    id v9 = 0LL;
    if (a4 && v8)
    {
      id v9 = 0LL;
      *a4 = v8;
    }
  }

  return v9;
}

- (id)_allManagementSourcesReturningError:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagementSource fetchRequest](&OBJC_CLASS___RMManagementSource, "fetchRequest"));
  id v19 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 execute:&v19]);
  id v6 = v19;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v12), (void)v15);
          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v10);
    }
  }

  else
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10001860C();
    }

    id v7 = 0LL;
    if (a3 && v6)
    {
      id v7 = 0LL;
      *a3 = v6;
    }
  }

  return v7;
}

- (void)_addOptionsToManagementSource:(id)a3 options:(id)a4
{
  uint64_t v5 = RMStoreOptionName;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);
  [v7 setName:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMStoreOptionDescription]);
  [v7 setStoreDescription:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMStoreOptionAccountIdentifier]);
  [v7 setAccountIdentifier:v10];

  id v11 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:RMStoreOptionPersonaIdentifier]);
  [v7 setPersonaIdentifier:v11];
}

- (id)_declarationsForStoreIdentifier:(id)a3 declarationTypes:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v26 = a4;
  id v25 = a5;
  id v32 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a3,  &v32));
  id v11 = v32;
  id v12 = v11;
  if (v10)
  {
    id v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v33[0] = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
    v33[1] = objc_opt_class(&OBJC_CLASS___RMConfigurationPayload);
    v33[2] = objc_opt_class(&OBJC_CLASS___RMAssetPayload);
    v33[3] = objc_opt_class(&OBJC_CLASS___RMManagementPayload);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 4LL));
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      id v24 = a6;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        __int128 v18 = 0LL;
        id v19 = v12;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v18);
          id v27 = v19;
          id v21 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _declarationsOfClass:managementSource:declarationTypes:identifier:error:]( self,  "_declarationsOfClass:managementSource:declarationTypes:identifier:error:",  v20,  v10,  v26,  v25,  &v27,  v24));
          id v12 = v27;

          if (!v21)
          {
            if (v24 && v12) {
              *id v24 = v12;
            }

            id v22 = 0LL;
            goto LABEL_15;
          }

          -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v21);

          __int128 v18 = (char *)v18 + 1;
          id v19 = v12;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v22 = v13;
LABEL_15:
  }

  else
  {
    id v22 = 0LL;
    if (a6 && v11)
    {
      id v12 = v11;
      id v22 = 0LL;
      *a6 = v12;
    }
  }

  return v22;
}

- (id)_declarationsOfClass:(Class)a3 managementSource:(id)a4 declarationTypes:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMActivationPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMConfigurationPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMAssetPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMManagementPayload)) & 1) != 0)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[objc_class fetchRequest](a3, "fetchRequest"));
    if (v12)
    {
      id v35 = @"declarationType";
      id v37 = v12;
      id v15 = @"(%K == %@) && ((%K == %d) || (%K == %d)) && (%K in %@)";
    }

    else
    {
      if (!v13)
      {
        id v16 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && ((%K == %d) || (%K == %d))",  @"managementSource",  v11,  @"loadState",  1LL,  @"loadState",  4LL,  v34,  v36);
        goto LABEL_10;
      }

      id v35 = @"identifier";
      id v37 = v13;
      id v15 = @"(%K == %@) && ((%K == %d) || (%K == %d)) && (%K == %@)";
    }

    id v16 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  v15,  @"managementSource",  v11,  @"loadState",  1LL,  @"loadState",  4LL,  v35,  v37);
LABEL_10:
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v14 setPredicate:v17];

    id v48 = 0LL;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v14 execute:&v48]);
    id v19 = v48;
    if (v18)
    {
      id v40 = v13;
      id v41 = v12;
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v18 count]));
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      __int128 v39 = v18;
      id obj = v18;
      id v21 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v21)
      {
        id v22 = v21;
        __int128 v38 = a7;
        uint64_t v23 = *(void *)v45;
        while (2)
        {
          id v24 = 0LL;
          id v25 = v19;
          do
          {
            if (*(void *)v45 != v23) {
              objc_enumerationMutation(obj);
            }
            id v43 = v25;
            id v27 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelDeclarationBase loadData:serializationType:error:]( &OBJC_CLASS___RMModelDeclarationBase,  "loadData:serializationType:error:",  v26,  0LL,  &v43));
            id v19 = v43;

            if (!v27)
            {
              __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                sub_1000711C8();
              }

              id v13 = v40;
              id v12 = v41;
              __int128 v18 = v39;
              if (v38 && v19) {
                *__int128 v38 = v19;
              }

              id v28 = 0LL;
              goto LABEL_26;
            }

            [v20 addObject:v27];

            id v24 = (char *)v24 + 1;
            id v25 = v19;
          }

          while (v22 != v24);
          id v22 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      id v28 = v20;
      id v12 = v41;
      id v13 = v40;
      __int128 v18 = v39;
LABEL_26:
    }

    else
    {
      __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_100071168();
      }

      id v28 = 0LL;
      if (a7 && v19)
      {
        id v19 = v19;
        id v28 = 0LL;
        *a7 = v19;
      }
    }

    goto LABEL_33;
  }

  id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_100071244(a3, v32);
  }

  if (!a7)
  {
    id v28 = 0LL;
    goto LABEL_34;
  }

  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
  id v14 = v33;
  if (v33)
  {
    id v14 = v33;
    id v28 = 0LL;
    *a7 = v14;
  }

  else
  {
    id v28 = 0LL;
  }

- (id)_activeConfigurationsAndAssetsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  return -[RMStoreController _activeConfigurationsForConfigurationTypes:storeIdentifier:includeAssets:error:]( self,  "_activeConfigurationsForConfigurationTypes:storeIdentifier:includeAssets:error:",  a3,  a4,  1LL,  a5);
}

- (id)_activeConfigurationsOnlyForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  return -[RMStoreController _activeConfigurationsForConfigurationTypes:storeIdentifier:includeAssets:error:]( self,  "_activeConfigurationsForConfigurationTypes:storeIdentifier:includeAssets:error:",  a3,  a4,  0LL,  a5);
}

- (id)_activeConfigurationsForConfigurationTypes:(id)a3 storeIdentifier:(id)a4 includeAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v35 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a4,  &v35));
  id v12 = v35;
  id v13 = v12;
  if (v11)
  {
    BOOL v28 = v7;
    id v29 = v12;
    id v14 = objc_alloc(&OBJC_CLASS___RMConfigurationQuerier);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController persistentContainer](self, "persistentContainer"));
    id v16 = -[RMConfigurationQuerier initWithPersistentContainer:](v14, "initWithPersistentContainer:", v15);

    id v30 = v10;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[RMConfigurationQuerier activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:]( v16,  "activeConfigurationsByTypeForTypes:managementSourceIdentifier:error:",  v17,  v18,  a6));

    uint64_t v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);
    id v22 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        id v25 = 0LL;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          -[NSMutableArray addObjectsFromArray:]( v20,  "addObjectsFromArray:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)v25));
          id v25 = (char *)v25 + 1;
        }

        while (v23 != v25);
        id v23 = [v21 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }

      while (v23);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _buildFlattenedConfigurations:includeAssets:error:]( self,  "_buildFlattenedConfigurations:includeAssets:error:",  v20,  v28,  a6));
    id v13 = v29;
    id v10 = v30;
  }

  else
  {
    id v26 = 0LL;
    if (a6 && v12)
    {
      id v26 = 0LL;
      *a6 = v12;
    }
  }

  return v26;
}

- (id)_activeConfigurationsForStoreIdentifier:(id)a3 error:(id *)a4
{
  id v16 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _managementSourceWithIdentifier:error:]( self,  "_managementSourceWithIdentifier:error:",  a3,  &v16));
  id v7 = v16;
  id v8 = v7;
  if (v6)
  {
    id v9 = objc_alloc(&OBJC_CLASS___RMConfigurationQuerier);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController persistentContainer](self, "persistentContainer"));
    id v11 = -[RMConfigurationQuerier initWithPersistentContainer:](v9, "initWithPersistentContainer:", v10);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[RMConfigurationQuerier activeConfigurationsForManagementSourceIdentifier:error:]( v11,  "activeConfigurationsForManagementSourceIdentifier:error:",  v12,  a4));

    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _buildFlattenedConfigurations:includeAssets:error:]( self,  "_buildFlattenedConfigurations:includeAssets:error:",  v13,  0LL,  a4));
  }

  else
  {
    id v14 = 0LL;
    if (a4 && v7)
    {
      id v14 = 0LL;
      *a4 = v7;
    }
  }

  return v14;
}

- (id)_configurationsWithVisibleUIForConfigurationTypes:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(&OBJC_CLASS___RMConfigurationQuerier);
  __int128 v33 = self;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMStoreController persistentContainer](self, "persistentContainer"));
  id v12 = -[RMConfigurationQuerier initWithPersistentContainer:](v10, "initWithPersistentContainer:", v11);

  uint64_t v36 = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  id v35 = v9;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  __int128 v32 = v12;
  __int128 v34 = a5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[RMConfigurationQuerier configurationUIsByTypeForTypes:managementSourceIdentifier:error:]( v12,  "configurationUIsByTypeForTypes:managementSourceIdentifier:error:",  v13,  v14,  a5));

  id v41 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v31 = v15;
  id obj = (id)objc_claimAutoreleasedReturnValue([v15 allValues]);
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v47;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v16;
        uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v18 = v17;
        id v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v43;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v43 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 channel]);
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
              id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 serverToken]);
              unsigned int v28 = +[RMConfigurationStatusArchiver validStatusForStoreIdentifier:declarationIdentifier:serverToken:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "validStatusForStoreIdentifier:declarationIdentifier:serverToken:",  v25,  v26,  v27);

              if (v28) {
                -[NSMutableArray addObject:](v41, "addObject:", v23);
              }
            }

            id v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }

          while (v20);
        }

        uint64_t v16 = v40 + 1;
      }

      while ((id)(v40 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v39);
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _buildFlattenedConfigurations:includeAssets:error:]( v33,  "_buildFlattenedConfigurations:includeAssets:error:",  v41,  1LL,  v34));
  return v29;
}

- (id)_buildFlattenedConfigurations:(id)a3 includeAssets:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  if (v5)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v51 + 1) + 8 * (void)i) assetByIdentifier]);
          id v14 = v13;
          if (v13)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);
            -[NSMutableSet addObjectsFromArray:](v7, "addObjectsFromArray:", v15);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }

      while (v10);
    }
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v6 count] + (void)-[NSMutableSet count](v7, "count")));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:v56 count:16];
  id obj = v16;
  if (v17)
  {
    id v18 = v17;
    id v19 = 0LL;
    uint64_t v20 = *(void *)v48;
    while (2)
    {
      uint64_t v21 = 0LL;
      id v22 = v19;
      do
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(obj);
        }
        id v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v47 + 1) + 8 * (void)v21) content]);
        id v46 = v22;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelDeclarationBase loadData:serializationType:error:]( &OBJC_CLASS___RMModelDeclarationBase,  "loadData:serializationType:error:",  v23,  0LL,  &v46));
        id v19 = v46;

        if (!v24)
        {
          id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_100071340();
          }

          id v26 = obj;
          if (a5 && v19) {
            *a5 = v19;
          }

LABEL_43:
          id v34 = 0LL;
          goto LABEL_44;
        }

        [v40 addObject:v24];

        uint64_t v21 = (char *)v21 + 1;
        id v22 = v19;
      }

      while (v18 != v21);
      id v16 = obj;
      id v18 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v19 = 0LL;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v38 = v7;
  id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v42,  v55,  16LL);
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v43;
    while (2)
    {
      id v30 = 0LL;
      __int128 v31 = v19;
      do
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v38);
        }
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)v30) content]);
        id v41 = v31;
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelDeclarationBase loadData:serializationType:error:]( &OBJC_CLASS___RMModelDeclarationBase,  "loadData:serializationType:error:",  v32,  0LL,  &v41));
        id v19 = v41;

        if (!v33)
        {
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_1000712C4();
          }

          id v26 = obj;
          if (a5 && v19) {
            *a5 = v19;
          }

          goto LABEL_43;
        }

        [v40 addObject:v33];

        id v30 = (char *)v30 + 1;
        __int128 v31 = v19;
      }

      while (v28 != v30);
      id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v42,  v55,  16LL);
      if (v28) {
        continue;
      }
      break;
    }
  }

  id v34 = v40;
  id v26 = obj;
LABEL_44:

  return v34;
}

- (id)_payloadsForDeclarationIdentifier:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  v28[0] = objc_opt_class(&OBJC_CLASS___RMActivationPayload);
  v28[1] = objc_opt_class(&OBJC_CLASS___RMConfigurationPayload);
  v28[2] = objc_opt_class(&OBJC_CLASS___RMAssetPayload);
  v28[3] = objc_opt_class(&OBJC_CLASS___RMManagementPayload);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL));
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v21 = a5;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      id v15 = 0LL;
      id v16 = v13;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v15);
        id v23 = v16;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[RMStoreController _payloadsForPayloadClass:identifier:managementSource:error:]( self,  "_payloadsForPayloadClass:identifier:managementSource:error:",  v17,  v22,  v8,  &v23));
        id v13 = v23;

        if (!v18)
        {
          if (v21 && v13) {
            *uint64_t v21 = v13;
          }

          id v19 = 0LL;
          goto LABEL_16;
        }

        -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v18);

        id v15 = (char *)v15 + 1;
        id v16 = v13;
      }

      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v19 = v9;
LABEL_16:

  return v19;
}

- (id)_payloadsForPayloadClass:(Class)a3 identifier:(id)a4 managementSource:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if ((-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMActivationPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMConfigurationPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMAssetPayload)) & 1) != 0
    || (-[objc_class isEqual:](a3, "isEqual:", objc_opt_class(&OBJC_CLASS___RMManagementPayload)) & 1) != 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[objc_class fetchRequest](a3, "fetchRequest"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %@)",  @"managementSource",  v10,  @"identifier",  v9));
    [v11 setPredicate:v12];

    id v22 = @"declarationType";
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v11 setPropertiesToFetch:v13];

    id v21 = 0LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 execute:&v21]);
    id v15 = v21;
    if (v14)
    {
      id v16 = v14;
    }

    else
    {
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100070DC4();
      }

      if (a6 && v15) {
        *a6 = v15;
      }
    }
  }

  else
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100071244(a3, v19);
    }

    if (!a6)
    {
      uint64_t v14 = 0LL;
      goto LABEL_14;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    id v11 = v20;
    if (v20)
    {
      id v11 = v20;
      uint64_t v14 = 0LL;
      *a6 = v11;
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

LABEL_14:
  return v14;
}

- (id)_newPayloadWithDeclaration:(id)a3 managementSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___RMModelAnyDeclaration);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
LABEL_4:
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___RMModelActivationBase);
    if ((objc_opt_isKindOfClass(v7, v14) & 1) != 0)
    {
      id v15 = &off_1000B8328;
    }

    else
    {
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___RMModelConfigurationBase);
      if ((objc_opt_isKindOfClass(v7, v16) & 1) != 0)
      {
        id v15 = &off_1000B8358;
      }

      else
      {
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___RMModelAssetBase);
        if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
        {
          id v15 = &off_1000B8338;
        }

        else
        {
          uint64_t v19 = objc_opt_class(&OBJC_CLASS___RMModelManagementBase);
          if ((objc_opt_isKindOfClass(v7, v19) & 1) == 0)
          {
            __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_100071420((uint64_t)v7, v25);
            }

            if (a5)
            {
              __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createInternalError]( &OBJC_CLASS___RMErrorUtilities,  "createInternalError"));
              __int128 v27 = v26;
              if (v26) {
                *a5 = v26;
              }
            }

            id v20 = 0LL;
            id v10 = 0LL;
            id v18 = 0LL;
            goto LABEL_30;
          }

          id v15 = &off_1000B8418;
        }
      }
    }

    id v20 = [objc_alloc(*v15) initWithContext:v13];
    [v20 setManagementSource:v8];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 declarationIdentifier]);
    [v20 setIdentifier:v21];

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 declarationServerToken]);
    [v20 setServerToken:v22];

    id v29 = 0LL;
    unsigned __int8 v23 = [v20 loadPayload:v7 error:&v29];
    id v10 = v29;
    if ((v23 & 1) != 0)
    {
      id v20 = v20;
      id v18 = v20;
    }

    else
    {
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog storeController](&OBJC_CLASS___RMLog, "storeController"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1000713BC();
      }

      id v18 = 0LL;
      if (a5 && v10)
      {
        id v10 = v10;
        id v18 = 0LL;
        *a5 = v10;
      }
    }

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSMutableDictionary)clientByIdentifier
{
  return self->_clientByIdentifier;
}

- (void)setClientByIdentifier:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end