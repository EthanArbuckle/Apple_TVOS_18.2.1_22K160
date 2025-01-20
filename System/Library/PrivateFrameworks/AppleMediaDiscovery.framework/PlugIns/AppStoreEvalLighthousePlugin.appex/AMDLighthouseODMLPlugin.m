@interface AMDLighthouseODMLPlugin
+ (void)initialize;
- (AMDLighthouseODMLPlugin)init;
- (AMDLighthouseODMLWorker)worker;
- (MLRTaskAttachments)attachments;
- (NSDictionary)recipe;
- (NSLocale)locale;
- (NSMutableArray)candidateModels;
- (NSNumber)taskShouldBeStopped;
- (TRIClient)client;
- (id)checkIfTaskShouldBeStopped:(id *)a3;
- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5;
- (id)downloadModel:(id)a3 outError:(id *)a4;
- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5;
- (id)getAttachmentURLByName:(id)a3 namespaceID:(id)a4 triClient:(id)a5 isDirectory:(BOOL)a6 error:(id *)a7;
- (id)performTask:(id)a3 outError:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (id)setUpForGenericTaskWithClient:(id)a3 outError:(id *)a4;
- (id)setupModelDirectoryWithTask:(id)a3 error:(id *)a4;
- (id)setupRecipeWithTask:(id)a3 error:(id *)a4;
- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4;
- (void)setAttachments:(id)a3;
- (void)setCandidateModels:(id)a3;
- (void)setClient:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setTaskShouldBeStopped:(id)a3;
- (void)setWorker:(id)a3;
- (void)stop;
@end

@implementation AMDLighthouseODMLPlugin

+ (void)initialize
{
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___AMDLighthouseODMLPlugin))
  {
    os_log_t v2 = os_log_create("com.apple.aiml.AMDLighthouseODMLPlugin", "AMDLighthouseODMLPlugin");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;
  }

- (id)getAttachmentURLByName:(id)a3 namespaceID:(id)a4 triClient:(id)a5 isDirectory:(BOOL)a6 error:(id *)a7
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = 0LL;
  objc_storeStrong(&v29, a4);
  id v28 = 0LL;
  objc_storeStrong(&v28, a5);
  BOOL v27 = a6;
  v26 = a7;
  id v25 = [v28 levelForFactor:location[0] withNamespaceName:v29];
  id v24 = 0LL;
  if (a6) {
    id v7 = [v25 directoryValue];
  }
  else {
    id v7 = [v25 fileValue];
  }
  id v8 = v24;
  id v24 = v7;

  id v14 = [v24 path];
  id v23 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:");

  id v22 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v15 = [v23 path];
  unsigned __int8 v16 = objc_msgSend(v22, "fileExistsAtPath:");

  if ((v16 & 1) != 0)
  {
    id v31 = v23;
  }

  else
  {
    id v21 = (id)sLog;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v34, (uint64_t)location[0], (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Failed to load '%@' from %@",  v34,  0x16u);
    }

    objc_storeStrong(&v21, 0LL);
    if (v26)
    {
      v11 = AMDLighthouseODMLPluginErrorDomain;
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'%@' level missing in Trial",  location[0]);
      v33 = v13;
      v12 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
      v9 =   +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  133LL);
      id *v26 = v9;
    }

    id v31 = 0LL;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
  return v31;
}

- (id)createMLRTaskAttachmentsObject:(id)a3 modelDirURL:(id)a4 error:(id *)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  v21[1] = a5;
  v21[0] = [location[0] objectForKey:AttachmentKeys];
  v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v14 = v21[0];
  id v15 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(__b[1] + 8 * v10);
      id v17 = [v22 URLByAppendingPathComponent:v19];
      -[NSMutableArray addObject:](v20, "addObject:", v17);
      objc_storeStrong(&v17, 0LL);
      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  v5 = objc_alloc(&OBJC_CLASS___MLRTaskAttachments);
  id v16 = -[MLRTaskAttachments initWithURLs:](v5, "initWithURLs:", v20);
  id v7 = v16;
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)setupRecipeWithTask:(id)a3 error:(id *)a4
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v29[1] = a4;
  -[AMDLighthouseODMLPlugin setClient:](v31, "setClient:", location[0]);
  id v17 = v31;
  id v15 = RecipeAttachmentKey;
  id v16 = TrialNamespace;
  v18 = -[AMDLighthouseODMLPlugin client](v31, "client");
  v29[0] =  -[AMDLighthouseODMLPlugin getAttachmentURLByName:namespaceID:triClient:isDirectory:error:]( v17,  "getAttachmentURLByName:namespaceID:triClient:isDirectory:error:",  v15,  v16);

  if (v29[0])
  {
    id v27 = (id)sLog;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      id v13 = [v29[0] path];
      __os_log_helper_16_2_1_8_64((uint64_t)v35, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, v26, "recipe path: %@", v35, 0xCu);
    }

    objc_storeStrong(&v27, 0LL);
    id v25 = 0LL;
    id v7 = objc_alloc(&OBJC_CLASS___NSData);
    id v9 = [v29[0] path];
    id v23 = v25;
    uint64_t v8 = -[NSData initWithContentsOfFile:options:error:](v7, "initWithContentsOfFile:options:error:");
    objc_storeStrong(&v25, v23);
    id v24 = v8;

    id v22 = v25;
    id v10 =  +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v24,  0LL,  &v22);
    objc_storeStrong(&v25, v22);
    -[AMDLighthouseODMLPlugin setRecipe:](v31, "setRecipe:", v10);

    id v11 = -[AMDLighthouseODMLPlugin recipe](v31, "recipe");
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v11, v4);

    if ((isKindOfClass & 1) != 0)
    {
      id v19 = (id)sLog;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
      {
        v6 = -[AMDLighthouseODMLPlugin recipe](v31, "recipe");
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v6);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Loaded JSON recipe: %@", v33, 0xCu);
      }

      objc_storeStrong(&v19, 0LL);
      NSErrorUserInfoKey v32 = &off_10002DF00;
      int v28 = 1;
    }

    else
    {
      id v21 = (id)sLog;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v34, (uint64_t)v25);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  v20,  "Failed to load recipe json with error: %@",  v34,  0xCu);
      }

      objc_storeStrong(&v21, 0LL);
      NSErrorUserInfoKey v32 = 0LL;
      int v28 = 1;
    }

    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v32 = 0LL;
    int v28 = 1;
  }

  objc_storeStrong(v29, 0LL);
  objc_storeStrong(location, 0LL);
  return v32;
}

- (id)setupModelDirectoryWithTask:(id)a3 error:(id *)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  v16[0] =  -[AMDLighthouseODMLPlugin getAttachmentURLByName:namespaceID:triClient:isDirectory:error:]( v18,  "getAttachmentURLByName:namespaceID:triClient:isDirectory:error:",  ModelsDirectoryKey,  TrialNamespace,  location[0],  1LL,  a4);
  if (v16[0])
  {
    id v9 = -[AMDLighthouseODMLPlugin worker](v18, "worker");
    -[AMDLighthouseODMLWorker setModelsURL:](v9, "setModelsURL:", v16[0]);

    id v14 = (id)sLog;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
    {
      id v8 = [v16[0] path];
      __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, v13, "model path: %@", v20, 0xCu);
    }

    objc_storeStrong(&v14, 0LL);
    id v12 = 0LL;
    v5 = v18;
    id v7 = -[AMDLighthouseODMLPlugin recipe](v18, "recipe");
    id obj = v12;
    id v6 =  -[AMDLighthouseODMLPlugin createMLRTaskAttachmentsObject:modelDirURL:error:]( v5,  "createMLRTaskAttachmentsObject:modelDirURL:error:");
    objc_storeStrong(&v12, obj);
    -[AMDLighthouseODMLPlugin setAttachments:](v18, "setAttachments:", v6);

    id v19 = &off_10002DF00;
    int v15 = 1;
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    id v19 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v19;
}

- (id)gatherGaussianResults:(id)a3 withPartitions:(id)a4 outError:(id *)a5
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v38 = 0LL;
  objc_storeStrong(&v38, a4);
  v37 = a5;
  id v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id v24 = location[0];
  id v25 = [v24 countByEnumeratingWithState:__b objects:v43 count:16];
  if (v25)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0LL;
    id v21 = v25;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(v24);
      }
      id v34 = *(id *)(__b[1] + 8 * v20);
      id v32 = [v34 objectForKey:ModelMetrics];
      id v31 = [v34 objectForKey:ModelName];
      memset(v29, 0, sizeof(v29));
      id v16 = v32;
      id v17 = [v16 countByEnumeratingWithState:v29 objects:v42 count:16];
      if (v17)
      {
        uint64_t v13 = *(void *)v29[2];
        uint64_t v14 = 0LL;
        id v15 = v17;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)v29[2] != v13) {
            objc_enumerationMutation(v16);
          }
          uint64_t v30 = *(void *)(v29[1] + 8 * v14);
          id v5 = -[AMDLighthouseODMLPlugin checkIfTaskShouldBeStopped:](v40, "checkIfTaskShouldBeStopped:", v37);
          BOOL v11 = v5 != 0LL;

          if (!v11) {
            break;
          }
          id v27 = [v32 objectForKey:v30];
          id v26 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v31, v30);
          if ([v38 containsObject:v26])
          {
            id v8 = v35;
            [v27 floatValue];
            id v9 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
            objc_msgSend(v8, "setObject:forKey:");
          }

          else
          {
            [v27 floatValue];
            id v10 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
            objc_msgSend(v36, "setObject:forKeyedSubscript:");
          }

          objc_storeStrong(&v26, 0LL);
          objc_storeStrong(&v27, 0LL);
          ++v14;
          if (v12 + 1 >= (unint64_t)v15)
          {
            uint64_t v14 = 0LL;
            id v15 = [v16 countByEnumeratingWithState:v29 objects:v42 count:16];
            if (!v15) {
              goto LABEL_16;
            }
          }
        }

        id v41 = 0LL;
        int v28 = 1;
      }

      else
      {
LABEL_16:
        int v28 = 0;
      }

      if (!v28) {
        int v28 = 0;
      }
      objc_storeStrong(&v31, 0LL);
      objc_storeStrong(&v32, 0LL);
      if (v28) {
        break;
      }
      ++v20;
      if (v18 + 1 >= (unint64_t)v21)
      {
        uint64_t v20 = 0LL;
        id v21 = [v24 countByEnumeratingWithState:__b objects:v43 count:16];
        if (!v21) {
          goto LABEL_22;
        }
      }
    }
  }

  else
  {
LABEL_22:
    int v28 = 0;
  }

  if (!v28)
  {
    id v6 = objc_alloc(&OBJC_CLASS___MLRTrialDediscoTaskResult);
    id v41 = [v6 initWithJSONResult:v36 namespaceName:TrialNamespace factorName:@"recipe" additionalKeyVariables:v35];
    int v28 = 1;
  }

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(location, 0LL);
  return v41;
}

- (id)downloadModel:(id)a3 outError:(id *)a4
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v25 = a4;
  id v24 = dispatch_semaphore_create(0LL);
  NSLog(@"Calling downloadLevelsForFactors");
  id v15 = -[AMDLighthouseODMLPlugin client](v27, "client");
  id v29 = location[0];
  uint64_t v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL);
  uint64_t v12 = TrialNamespace;
  id v13 = (id)objc_opt_new(&OBJC_CLASS___TRIDownloadOptions);
  id v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  uint64_t v20 = __50__AMDLighthouseODMLPlugin_downloadModel_outError___block_invoke;
  id v21 = &unk_10002C320;
  id v22 = location[0];
  id v23 = v24;
  -[TRIClient downloadLevelsForFactors:withNamespace:queue:options:progress:completion:]( v15,  "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:",  v14,  v12,  0LL,  v13,  0LL,  &v17);

  dsema = (dispatch_semaphore_s *)v24;
  dispatch_time_t v4 = dispatch_time(0LL, 600000000000LL);
  if (dispatch_semaphore_wait(dsema, v4))
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSError);
    id v6 =  -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  149LL,  0LL);
    *id v25 = v6;
    int v28 = 0LL;
  }

  else
  {
    id v7 = -[AMDLighthouseODMLPlugin checkIfTaskShouldBeStopped:](v27, "checkIfTaskShouldBeStopped:", v25);
    BOOL v10 = v7 != 0LL;

    if (v10)
    {
      id v9 = -[AMDLighthouseODMLPlugin client](v27, "client");
      -[TRIClient refresh](v9, "refresh");

      int v28 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
    }

    else
    {
      int v28 = 0LL;
    }
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v28;
}

void __50__AMDLighthouseODMLPlugin_downloadModel_outError___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0LL;
  objc_storeStrong(&location, obj);
  if ((v5 & 1) == 1) {
    NSLog(@"succeeded to download factor level %@", *(void *)(a1 + 32));
  }
  else {
    NSLog(@"failed to download factor level %@", *(void *)(a1 + 32));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_storeStrong(&location, 0LL);
}

- (id)targetingKeyValuePairsForKeys:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = objc_alloc_init(&OBJC_CLASS___AMDDODMLCustomTargetingHelper);
  id v6 = [v7[0] mainTargetingResolver:location[0] error:a4];
  objc_storeStrong(v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)checkIfTaskShouldBeStopped:(id *)a3
{
  v3 = objc_alloc(&OBJC_CLASS___NSError);
  *a3 =  -[NSError initWithDomain:code:userInfo:]( v3,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  148LL,  0LL);
  return 0LL;
}

- (id)setUpForGenericTaskWithClient:(id)a3 outError:(id *)a4
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = a4;
  dispatch_time_t v4 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
  taskShouldBeStopped = v26->_taskShouldBeStopped;
  v26->_taskShouldBeStopped = v4;

  id v23 = (id)sLog;
  char v22 = 1;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v23;
    os_log_type_t type = v22;
    __os_log_helper_16_0_0(v21);
    _os_log_impl((void *)&_mh_execute_header, log, type, "AMDLighthouseODMLPlugin: Start task", v21, 2u);
  }

  objc_storeStrong(&v23, 0LL);
  id v20 = -[AMDLighthouseODMLPlugin setupRecipeWithTask:error:](v26, "setupRecipeWithTask:error:", location[0], v24);
  if (v20)
  {
    id v9 = -[AMDLighthouseODMLPlugin worker](v26, "worker");
    id v8 = -[AMDLighthouseODMLPlugin recipe](v26, "recipe");
    id v18 =  -[AMDLighthouseODMLWorker checkIfModelShouldBeDownloaded:outError:]( v9,  "checkIfModelShouldBeDownloaded:outError:");

    id v17 = [v18 getCoreDictionary];
    if (v17)
    {
      id v16 = [v18 processRecipe:v24 errorDomain:AMDLighthouseODMLPluginErrorDomain];
      if (v16)
      {
        id v7 = -[AMDLighthouseODMLPlugin recipe](v26, "recipe");
        id v15 = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", ModelDirectoryName);

        if (!v15) {
          objc_storeStrong(&v15, ModelsDirectoryKey);
        }
        id v14 = -[AMDLighthouseODMLPlugin downloadModel:outError:](v26, "downloadModel:outError:", v15, v24);
        if (v14)
        {
          int v19 = 0;
        }

        else
        {
          id v27 = 0LL;
          int v19 = 1;
        }

        objc_storeStrong(&v14, 0LL);
        objc_storeStrong(&v15, 0LL);
        if (!v19)
        {
          id v13 =  -[AMDLighthouseODMLPlugin setupModelDirectoryWithTask:error:]( v26,  "setupModelDirectoryWithTask:error:",  location[0],  v24);
          if (v13) {
            id v27 = v17;
          }
          else {
            id v27 = 0LL;
          }
          int v19 = 1;
          objc_storeStrong(&v13, 0LL);
        }
      }

      else
      {
        id v27 = 0LL;
        int v19 = 1;
      }

      objc_storeStrong(&v16, 0LL);
    }

    else
    {
      id v27 = 0LL;
      int v19 = 1;
    }

    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
  }

  else
  {
    id v27 = 0LL;
    int v19 = 1;
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v27;
}

- (AMDLighthouseODMLPlugin)init
{
  SEL v4 = a2;
  id location = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AMDLighthouseODMLPlugin;
  id location = -[AMDLighthouseODMLPlugin init](&v3, "init");
  if (location) {
    id v6 = (AMDLighthouseODMLPlugin *)location;
  }
  else {
    id v6 = 0LL;
  }
  objc_storeStrong(&location, 0LL);
  return v6;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  v50 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v48 = (uint64_t *)a4;
  id v29 = objc_alloc_init(&OBJC_CLASS___AMDLighthouseODMLWorker);
  -[AMDLighthouseODMLPlugin setWorker:](v50, "setWorker:");

  id v47 = [location[0] triClient];
  id v46 =  -[AMDLighthouseODMLPlugin setUpForGenericTaskWithClient:outError:]( v50,  "setUpForGenericTaskWithClient:outError:",  v47,  a4);
  uint64_t v30 = -[AMDLighthouseODMLPlugin client](v50, "client");
  id v45 =  -[TRIClient experimentIdentifiersWithNamespaceName:]( v30,  "experimentIdentifiersWithNamespaceName:",  TrialNamespace);

  id v31 = -[AMDLighthouseODMLPlugin worker](v50, "worker");
  -[AMDLighthouseODMLWorker setTriExperimentIdentifiers:](v31, "setTriExperimentIdentifiers:", v45);

  if (*a4)
  {
    id v44 = (id)sLog;
    os_log_type_t v43 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v52, *v48);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v44,  v43,  "Encountered error when setting up for generic task: %@",  v52,  0xCu);
    }

    objc_storeStrong(&v44, 0LL);
    id v51 = 0LL;
    int v42 = 1;
  }

  else
  {
    id v27 = -[AMDLighthouseODMLPlugin worker](v50, "worker");
    id v26 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
    id v25 = -[AMDLighthouseODMLPlugin attachments](v50, "attachments");
    id v41 =  -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:]( v27,  "gatherMetricsToReturn:withRecipe:withAttachments:outError:",  v46,  v26);

    if (v41)
    {
      id v23 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
      id v22 = -[NSDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", LoggingStrategies);
      unsigned __int8 v24 = [v22 containsObject:GaussianDeDisco];

      if ((v24 & 1) != 0)
      {
        id v20 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
        id v19 = -[NSDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", LoggingStrategies);
        BOOL v21 = (unint64_t)[v19 count] <= 1;

        if (v21) {
          goto LABEL_15;
        }
        id v18 = -[AMDLighthouseODMLPlugin worker](v50, "worker");
        id v17 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
        id v16 = -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", LoggingStrategies);
        id v40 =  -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:]( v18,  "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:",  v41);

        if (v40)
        {
          id v39 = (id)sLog;
          char v38 = 1;
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_INFO))
          {
            id v14 = (os_log_s *)v39;
            os_log_type_t type = v38;
            __os_log_helper_16_0_0(v37);
            _os_log_impl((void *)&_mh_execute_header, v14, type, "AMDLighthouseODMLPlugin: Finished task", v37, 2u);
          }

          objc_storeStrong(&v39, 0LL);
          int v42 = 0;
        }

        else
        {
          id v51 = 0LL;
          int v42 = 1;
        }

        objc_storeStrong(&v40, 0LL);
        if (!v42)
        {
LABEL_15:
          BOOL v11 = v50;
          id v10 = v41;
          id v13 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
          id v12 = -[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", GaussianDeDiscoPartitions);
          id v36 =  -[AMDLighthouseODMLPlugin gatherGaussianResults:withPartitions:outError:]( v11,  "gatherGaussianResults:withPartitions:outError:",  v10);

          if (v36) {
            id v51 = v36;
          }
          else {
            id v51 = 0LL;
          }
          int v42 = 1;
          objc_storeStrong(&v36, 0LL);
        }
      }

      else
      {
        id v9 = -[AMDLighthouseODMLPlugin worker](v50, "worker");
        id v8 = -[AMDLighthouseODMLPlugin recipe](v50, "recipe");
        id v7 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", LoggingStrategies);
        id v35 =  -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:]( v9,  "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:",  v41);

        if (v35)
        {
          id v34 = (id)sLog;
          char v33 = 1;
          if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
          {
            char v5 = (os_log_s *)v34;
            os_log_type_t v6 = v33;
            __os_log_helper_16_0_0(v32);
            _os_log_impl((void *)&_mh_execute_header, v5, v6, "AMDLighthouseODMLPlugin: Finished task", v32, 2u);
          }

          objc_storeStrong(&v34, 0LL);
          id v51 = (id)objc_opt_new(&OBJC_CLASS___MLRTrialTaskResult);
          int v42 = 1;
        }

        else
        {
          id v51 = 0LL;
          int v42 = 1;
        }

        objc_storeStrong(&v35, 0LL);
      }
    }

    else
    {
      id v51 = 0LL;
      int v42 = 1;
    }

    objc_storeStrong(&v41, 0LL);
  }

  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
  return v51;
}

- (id)performTask:(id)a3 outError:(id *)a4
{
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v25 = (uint64_t *)a4;
  id v14 = objc_alloc_init(&OBJC_CLASS___AMDLighthouseODMLWorker);
  -[AMDLighthouseODMLPlugin setWorker:](v27, "setWorker:");

  id v24 = +[TRIClient mlr_clientWithMLRTask:](&OBJC_CLASS___TRIClient, "mlr_clientWithMLRTask:", location[0]);
  id v23 =  -[AMDLighthouseODMLPlugin setUpForGenericTaskWithClient:outError:]( v27,  "setUpForGenericTaskWithClient:outError:",  v24,  a4);
  if (*a4)
  {
    id v22 = (id)sLog;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v29, *v25);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v21,  "Encountered error when setting up for generic task: %@",  v29,  0xCu);
    }

    objc_storeStrong(&v22, 0LL);
    id v28 = 0LL;
    int v20 = 1;
  }

  else
  {
    id v12 = -[AMDLighthouseODMLPlugin worker](v27, "worker");
    BOOL v11 = -[AMDLighthouseODMLPlugin recipe](v27, "recipe");
    id v10 = -[AMDLighthouseODMLPlugin attachments](v27, "attachments");
    id v19 =  -[AMDLighthouseODMLWorker gatherMetricsToReturn:withRecipe:withAttachments:outError:]( v12,  "gatherMetricsToReturn:withRecipe:withAttachments:outError:",  v23,  v11);

    if (v19)
    {
      id v9 = -[AMDLighthouseODMLPlugin worker](v27, "worker");
      id v8 = -[AMDLighthouseODMLPlugin recipe](v27, "recipe");
      id v7 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", LoggingStrategies);
      id v18 =  -[AMDLighthouseODMLWorker logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:]( v9,  "logAllResultsToCoreAnalyticsOrDeDisco:withLoggingStrategies:outError:",  v19);

      if (v18)
      {
        id v17 = (id)sLog;
        char v16 = 1;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
        {
          char v5 = (os_log_s *)v17;
          os_log_type_t v6 = v16;
          __os_log_helper_16_0_0(v15);
          _os_log_impl((void *)&_mh_execute_header, v5, v6, "AMDLighthouseODMLPlugin: Finished task", v15, 2u);
        }

        objc_storeStrong(&v17, 0LL);
        id v28 = [[MLRTaskResult alloc] initWithJSONResult:&off_10002DF28 unprivatizedVector:0];
        int v20 = 1;
      }

      else
      {
        id v28 = 0LL;
        int v20 = 1;
      }

      objc_storeStrong(&v18, 0LL);
    }

    else
    {
      id v28 = 0LL;
      int v20 = 1;
    }

    objc_storeStrong(&v19, 0LL);
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v28;
}

- (void)stop
{
  os_log_t v2 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
  taskShouldBeStopped = self->_taskShouldBeStopped;
  self->_taskShouldBeStopped = v2;

  SEL v4 = -[AMDLighthouseODMLPlugin worker](self, "worker");
  BOOL v8 = v4 == 0LL;

  if (!v8)
  {
    id v7 = -[AMDLighthouseODMLPlugin worker](self, "worker");
    -[AMDLighthouseODMLWorker stop](v7, "stop");
  }

  os_log_type_t v6 = -[AMDLighthouseODMLPlugin client](self, "client");
  id v10 = ModelsDirectoryKey;
  char v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL);
  -[TRIClient removeLevelsForFactors:withNamespace:queue:completion:]( v6,  "removeLevelsForFactors:withNamespace:queue:completion:");
}

void __31__AMDLighthouseODMLPlugin_stop__block_invoke(id a1, BOOL a2, NSError *a3)
{
  id v5 = a1;
  BOOL v4 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (v4) {
    NSLog(@"succeeded cancel/undo download %@", ModelsDirectoryKey);
  }
  else {
    NSLog(@"failed to cancel/undo download %@", ModelsDirectoryKey);
  }
  objc_storeStrong(&location, 0LL);
}

- (NSMutableArray)candidateModels
{
  return self->_candidateModels;
}

- (void)setCandidateModels:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (MLRTaskAttachments)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (TRIClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSNumber)taskShouldBeStopped
{
  return self->_taskShouldBeStopped;
}

- (void)setTaskShouldBeStopped:(id)a3
{
}

- (AMDLighthouseODMLWorker)worker
{
  return self->_worker;
}

- (void)setWorker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end