@interface AMDDODMLEspressoModel
- (AMDDODMLEspressoModel)initWithModelMetadata:(id)a3 withAttachmentProcessor:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)_flattenedWeightsBeforeTraining;
- (id)createBufferDictionary:(id)a3;
- (id)finishInitializeManually:(id *)a3 errorDomain:(id)a4;
- (id)getNewDeltasContainer:(id)a3 withError:(id *)a4 errorDomain:(id)a5;
- (id)trainOnData:(id)a3 numLocalIterations:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (int64_t)_bindBuffers:(id *)a3 errorDomain:(id)a4;
- (int64_t)_buildPlan:(id *)a3 errorDomain:(id)a4;
- (int64_t)initializeManually:(id *)a3 errorDomain:(id)a4;
- (void)dealloc;
@end

@implementation AMDDODMLEspressoModel

- (AMDDODMLEspressoModel)initWithModelMetadata:(id)a3 withAttachmentProcessor:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v59 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v57 = 0LL;
  objc_storeStrong(&v57, a4);
  v56 = a5;
  id v55 = 0LL;
  objc_storeStrong(&v55, a6);
  id v6 = v59;
  id v59 = 0LL;
  v54.receiver = v6;
  v54.super_class = (Class)&OBJC_CLASS___AMDDODMLEspressoModel;
  v53 = -[AMDDODMLEspressoModel init](&v54, "init");
  id v59 = v53;
  objc_storeStrong(&v59, v53);
  if (!v53)
  {
    v60 = 0LL;
    goto LABEL_15;
  }

  id v7 = [location[0] modelPath];
  v8 = (void *)*((void *)v59 + 1);
  *((void *)v59 + 1) = v7;

  id v9 = [location[0] batchSize];
  *((void *)v59 + 7) = v9;
  id v10 = [location[0] inputNames];
  v11 = (void *)*((void *)v59 + 2);
  *((void *)v59 + 2) = v10;

  id v12 = [location[0] weightNames];
  v13 = (void *)*((void *)v59 + 5);
  *((void *)v59 + 5) = v12;

  id v14 = [v59 createBufferDictionary:*((void *)v59 + 2)];
  v15 = (void *)*((void *)v59 + 3);
  *((void *)v59 + 3) = v14;

  id v48 = v59;
  id v49 = [location[0] outputNames];
  id v16 = objc_msgSend(v48, "createBufferDictionary:");
  v17 = (void *)*((void *)v59 + 4);
  *((void *)v59 + 4) = v16;

  id v18 = [v59 createBufferDictionary:*((void *)v59 + 5)];
  v19 = (void *)*((void *)v59 + 6);
  *((void *)v59 + 6) = v18;

  id v20 = [location[0] learningRate];
  v21 = (void *)*((void *)v59 + 8);
  *((void *)v59 + 8) = v20;

  id v22 = [location[0] trainingModeBufferName];
  v23 = (void *)*((void *)v59 + 14);
  *((void *)v59 + 14) = v22;

  id v24 = [location[0] learningRateBufferName];
  v25 = (void *)*((void *)v59 + 36);
  *((void *)v59 + 36) = v24;

  id v26 = [location[0] lossName];
  v27 = (void *)*((void *)v59 + 58);
  *((void *)v59 + 58) = v26;

  id v28 = [location[0] metricsNames];
  v29 = (void *)*((void *)v59 + 9);
  *((void *)v59 + 9) = v28;

  id v30 = [location[0] shortenedEmbeddingNames];
  v31 = (void *)*((void *)v59 + 59);
  *((void *)v59 + 59) = v30;

  id v32 = [location[0] shortenedEmbeddingMappingKeys];
  v33 = (void *)*((void *)v59 + 63);
  *((void *)v59 + 63) = v32;

  id v34 = [location[0] shortenedEmbeddingNumberVectorsBefore];
  v35 = (void *)*((void *)v59 + 60);
  *((void *)v59 + 60) = v34;

  id v36 = [location[0] shortenedEmbeddingNumberVectorsAfter];
  v37 = (void *)*((void *)v59 + 61);
  *((void *)v59 + 61) = v36;

  id v38 = [location[0] shortenedEmbeddingSize];
  v39 = (void *)*((void *)v59 + 62);
  *((void *)v59 + 62) = v38;

  objc_storeStrong((id *)v59 + 64, v57);
  id v40 = [location[0] initializeManually];
  v41 = (void *)*((void *)v59 + 65);
  *((void *)v59 + 65) = v40;

  if ([v59 _buildPlan:v56 errorDomain:v55])
  {
    if ([v59 _bindBuffers:v56 errorDomain:v55])
    {
      if ([*((id *)v59 + 65) longValue])
      {
        if (![v59 initializeManually:v56 errorDomain:v55])
        {
          v60 = 0LL;
          goto LABEL_15;
        }
      }

      else
      {
        v45 = v59;
        id v46 = [location[0] initializationFunctionName];
        uint64_t v47 = (int)espresso_network_set_function_name( v45[12], v45[13], [v46 UTF8String]);

        if (v47 || espresso_plan_execute_sync(*((void *)v59 + 11)))
        {
          v42 = objc_alloc(&OBJC_CLASS___NSError);
          v43 = -[NSError initWithDomain:code:userInfo:](v42, "initWithDomain:code:userInfo:", v55, 77LL, 0LL);
          id *v56 = v43;
          v60 = 0LL;
          goto LABEL_15;
        }
      }

      v60 = (AMDDODMLEspressoModel *)v59;
      goto LABEL_15;
    }

    v60 = 0LL;
  }

  else
  {
    v60 = 0LL;
  }

- (id)createBufferDictionary:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(__b[1] + 8 * v7);
      v11 = +[NSMutableData dataWithBytes:length:](&OBJC_CLASS___NSMutableData, "dataWithBytes:length:", v12, 168LL);
      [v15 setObject:v11 forKey:v14];
      objc_storeStrong((id *)&v11, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v15;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (int64_t)_buildPlan:(id *)a3 errorDomain:(id)a4
{
  v33 = self;
  SEL v32 = a2;
  v31 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  uint64_t context = espresso_create_context(0LL, 0xFFFFFFFFLL);
  v33->_ctx = (void *)context;
  if (v33->_ctx)
  {
    uint64_t plan = espresso_create_plan(v33->_ctx, 0LL);
    v33->_uint64_t plan = (void *)plan;
    if (v33->_plan)
    {
      v25 = v33->_plan;
      id v10 = -[NSString UTF8String](v33->_modelPath, "UTF8String");
      int v11 = espresso_plan_add_network(v25, v10, 65568LL, &v33->_net);
      uint64_t v28 = v11;
      if (v11)
      {
        id v12 = objc_alloc(&OBJC_CLASS___NSError);
        v13 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", location, 67LL, 0LL);
        id *v31 = v13;
        int64_t v34 = 0LL;
        int v29 = 1;
      }

      else
      {
        memset(__b, 0, sizeof(__b));
        id obj = v33->_outputNameBufferMap;
        NSUInteger v24 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v35,  16LL);
        if (v24)
        {
          uint64_t v20 = *(void *)__b[2];
          uint64_t v21 = 0LL;
          NSUInteger v22 = v24;
          while (1)
          {
            uint64_t v19 = v21;
            if (*(void *)__b[2] != v20) {
              objc_enumerationMutation(obj);
            }
            id v27 = *(id *)(__b[1] + 8 * v21);
            if (espresso_network_declare_output( v33->_net.plan, *(void *)&v33->_net.network_index, [v27 UTF8String])) {
              break;
            }
            ++v21;
            if (v19 + 1 >= v22)
            {
              uint64_t v21 = 0LL;
              NSUInteger v22 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v35,  16LL);
              if (!v22) {
                goto LABEL_15;
              }
            }
          }

          uint64_t v14 = objc_alloc(&OBJC_CLASS___NSError);
          id v15 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", location, 70LL, 0LL);
          id *v31 = v15;
          int64_t v34 = 0LL;
          int v29 = 1;
        }

        else
        {
LABEL_15:
          int v29 = 0;
        }

        if (!v29)
        {
          if (espresso_plan_build(v33->_plan))
          {
            id v16 = objc_alloc(&OBJC_CLASS___NSError);
            v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", location, 71LL, 0LL);
            id *v31 = v17;
            int64_t v34 = 0LL;
          }

          else
          {
            int64_t v34 = 1LL;
          }

          int v29 = 1;
        }
      }
    }

    else
    {
      id v8 = objc_alloc(&OBJC_CLASS___NSError);
      id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", location, 69LL, 0LL);
      id *v31 = v9;
      int64_t v34 = 0LL;
      int v29 = 1;
    }
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", location, 68LL, 0LL);
    id *v31 = v6;
    int64_t v34 = 0LL;
    int v29 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v34;
}

- (int64_t)_bindBuffers:(id *)a3 errorDomain:(id)a4
{
  v67 = self;
  SEL v66 = a2;
  v65 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  id obj = v67->_inputNameBufferMap;
  NSUInteger v49 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v71,  16LL);
  if (v49)
  {
    uint64_t v45 = *(void *)__b[2];
    uint64_t v46 = 0LL;
    NSUInteger v47 = v49;
    while (1)
    {
      uint64_t v44 = v46;
      if (*(void *)__b[2] != v45) {
        objc_enumerationMutation(obj);
      }
      id v63 = *(id *)(__b[1] + 8 * v46);
      id v61 = -[NSDictionary objectForKeyedSubscript:](v67->_inputNameBufferMap, "objectForKeyedSubscript:", v63);
      v42 = v67;
      id v43 = [v63 UTF8String];
      int v4 = espresso_network_bind_buffer( v42->_net.plan, *(void *)&v42->_net.network_index, v43, [v61 mutableBytes], 0x10000, 0x10000);
      uint64_t v60 = v4;
      if (v4)
      {
        uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
        uint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", location, 72LL, 0LL);
        id *v65 = v6;
        int64_t v68 = 0LL;
        int v59 = 1;
      }

      else
      {
        int v59 = 0;
      }

      objc_storeStrong(&v61, 0LL);
      if (v59) {
        break;
      }
      ++v46;
      if (v44 + 1 >= v47)
      {
        uint64_t v46 = 0LL;
        NSUInteger v47 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v71,  16LL);
        if (!v47) {
          goto LABEL_11;
        }
      }
    }
  }

  else
  {
LABEL_11:
    int v59 = 0;
  }

  if (!v59)
  {
    memset(v57, 0, sizeof(v57));
    id v40 = v67->_outputNameBufferMap;
    NSUInteger v41 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  v57,  v70,  16LL);
    if (v41)
    {
      uint64_t v37 = *(void *)v57[2];
      uint64_t v38 = 0LL;
      NSUInteger v39 = v41;
      while (1)
      {
        uint64_t v36 = v38;
        if (*(void *)v57[2] != v37) {
          objc_enumerationMutation(v40);
        }
        id v58 = *(id *)(v57[1] + 8 * v38);
        id v56 = -[NSDictionary objectForKeyedSubscript:](v67->_outputNameBufferMap, "objectForKeyedSubscript:", v58);
        int64_t v34 = v67;
        id v35 = [v58 UTF8String];
        int v7 = espresso_network_bind_buffer( v34->_net.plan, *(void *)&v34->_net.network_index, v35, [v56 mutableBytes], 0x20000, 0x10000);
        uint64_t v55 = v7;
        if (v7)
        {
          id v8 = objc_alloc(&OBJC_CLASS___NSError);
          id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", location, 73LL, 0LL);
          id *v65 = v9;
          int64_t v68 = 0LL;
          int v59 = 1;
        }

        else
        {
          int v59 = 0;
        }

        objc_storeStrong(&v56, 0LL);
        if (v59) {
          break;
        }
        ++v38;
        if (v36 + 1 >= v39)
        {
          uint64_t v38 = 0LL;
          NSUInteger v39 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  v57,  v70,  16LL);
          if (!v39) {
            goto LABEL_23;
          }
        }
      }
    }

    else
    {
LABEL_23:
      int v59 = 0;
    }

    if (!v59)
    {
      v33 = v67;
      id v10 = -[NSString UTF8String](v67->_trainingModeBufferName, "UTF8String");
      int v11 = espresso_network_bind_buffer_to_global( v33->_net.plan,  *(void *)&v33->_net.network_index,  v10,  &v67->_bufIsTraining,  0x10000LL,  0x10000LL);
      uint64_t v54 = v11;
      if (v11)
      {
        id v12 = objc_alloc(&OBJC_CLASS___NSError);
        v13 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", location, 75LL, 0LL);
        id *v65 = v13;
        int64_t v68 = 0LL;
        int v59 = 1;
        goto LABEL_45;
      }

      SEL v32 = v67;
      uint64_t v14 = -[NSString UTF8String](v67->_learningRateBufferName, "UTF8String");
      int v15 = espresso_network_bind_buffer_to_global( v32->_net.plan,  *(void *)&v32->_net.network_index,  v14,  &v67->_bufLR,  0x10000LL,  0x10000LL);
      uint64_t v53 = v15;
      if (v15)
      {
        id v16 = objc_alloc(&OBJC_CLASS___NSError);
        v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", location, 76LL, 0LL);
        id *v65 = v17;
        int64_t v68 = 0LL;
        int v59 = 1;
        goto LABEL_45;
      }

      *(float *)v67->_bufIsTraining.data = 1.0;
      -[NSNumber floatValue](v67->_learningRate, "floatValue");
      *(_DWORD *)v67->_bufLR.data = v18;
      memset(v51, 0, sizeof(v51));
      id v30 = v67->_weightNameBufferMap;
      NSUInteger v31 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  v51,  v69,  16LL);
      if (v31)
      {
        uint64_t v27 = *(void *)v51[2];
        uint64_t v28 = 0LL;
        NSUInteger v29 = v31;
        while (1)
        {
          uint64_t v26 = v28;
          if (*(void *)v51[2] != v27) {
            objc_enumerationMutation(v30);
          }
          id v52 = *(id *)(v51[1] + 8 * v28);
          id v50 = -[NSDictionary objectForKeyedSubscript:](v67->_weightNameBufferMap, "objectForKeyedSubscript:", v52);
          if (-[NSNumber longValue](v67->_initializeManually, "longValue"))
          {
            NSUInteger v22 = v67;
            id v23 = [v52 UTF8String];
            if (!espresso_network_bind_buffer_to_global( v22->_net.plan, *(void *)&v22->_net.network_index, v23, [v50 mutableBytes], 0x10000, 0x10000))
            {
LABEL_38:
              int v59 = 0;
              goto LABEL_39;
            }
          }

          else
          {
            NSUInteger v24 = v67;
            id v25 = [v52 UTF8String];
            if (!espresso_network_bind_buffer_to_global( v24->_net.plan, *(void *)&v24->_net.network_index, v25, [v50 mutableBytes], 0x20000, 0x10000)) {
              goto LABEL_38;
            }
          }

          uint64_t v19 = objc_alloc(&OBJC_CLASS___NSError);
          uint64_t v20 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", location, 74LL, 0LL);
          id *v65 = v20;
          int64_t v68 = 0LL;
          int v59 = 1;
LABEL_39:
          objc_storeStrong(&v50, 0LL);
          if (v59) {
            goto LABEL_43;
          }
          ++v28;
          if (v26 + 1 >= v29)
          {
            uint64_t v28 = 0LL;
            NSUInteger v29 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  v51,  v69,  16LL);
            if (!v29) {
              break;
            }
          }
        }
      }

      int v59 = 0;
LABEL_43:

      if (!v59)
      {
        int64_t v68 = 1LL;
        int v59 = 1;
      }
    }
  }

- (id)_flattenedWeightsBeforeTraining
{
  int v15 = self;
  v14[1] = (id)a2;
  v14[0] = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  memset(__b, 0, sizeof(__b));
  id obj = v15->_weightNames;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      id v11 = -[NSDictionary objectForKeyedSubscript:](v15->_weightNameBufferMap, "objectForKeyedSubscript:", v13);
      [v11 getBytes:v10 length:168];
      [v14[0] appendBytes:v10[0] length:4 * v10[2] * v10[3] * v10[4] * v10[5]];
      objc_storeStrong(&v11, 0LL);
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0LL);
  return v3;
}

- (id)trainOnData:(id)a3 numLocalIterations:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  v77 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v75 = a4;
  v74 = a5;
  id v73 = 0LL;
  objc_storeStrong(&v73, a6);
  v42 = v77;
  uint64_t main_function_name = get_main_function_name();
  int v7 = espresso_network_set_function_name(v42->_net.plan, *(void *)&v42->_net.network_index, main_function_name);
  uint64_t v72 = v7;
  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSError);
    id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v73, 75LL, 0LL);
    id *v74 = v9;
    id v78 = 0LL;
    int v71 = 1;
  }

  else
  {
    id v70 = -[AMDDODMLEspressoModel _flattenedWeightsBeforeTraining](v77, "_flattenedWeightsBeforeTraining");
    id v69 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:");
    id v68 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    for (int64_t i = 0LL; i < v75; ++i)
    {
      id v66 =  [location[0] bindDataToInputsDirectly:v77->_inputNameBufferMap batchSize:v77->_batchSize error:v74 errorDomain:v73];
      if (v66)
      {
        int v10 = espresso_plan_execute_sync(v77->_plan);
        uint64_t v65 = v10;
        if (v10)
        {
          id v11 = objc_alloc(&OBJC_CLASS___NSError);
          id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v73, 79LL, 0LL);
          id *v74 = v12;
          id v78 = 0LL;
          int v71 = 1;
        }

        else
        {
          id v33 =  -[NSDictionary objectForKeyedSubscript:]( v77->_outputNameBufferMap,  "objectForKeyedSubscript:",  v77->_lossName);
          int64_t v34 = (float **)[v33 mutableBytes];

          v64 = v34;
          float v63 = **v34;
          id v35 = v69;
          *(float *)&double v13 = v63;
          uint64_t v36 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v13);
          objc_msgSend(v35, "addObject:");

          NSLog(@"Loss: %.4f", v63);
          memset(__b, 0, sizeof(__b));
          uint64_t v37 = v77->_metricNames;
          id v38 = -[NSArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  __b,  v88,  16LL);
          if (v38)
          {
            uint64_t v30 = *(void *)__b[2];
            uint64_t v31 = 0LL;
            id v32 = v38;
            while (1)
            {
              uint64_t v29 = v31;
              if (*(void *)__b[2] != v30) {
                objc_enumerationMutation(v37);
              }
              uint64_t v62 = *(void *)(__b[1] + 8 * v31);
              id v27 =  -[NSDictionary objectForKeyedSubscript:]( v77->_outputNameBufferMap,  "objectForKeyedSubscript:",  v62);
              uint64_t v28 = (int **)[v27 mutableBytes];

              uint64_t v60 = v28;
              int v59 = **v28;
              id v58 = [v68 valueForKey:v62];
              if (!v58)
              {
                int v15 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  0LL);
                id v16 = v58;
                id v58 = v15;

                [v68 setValue:v58 forKey:v62];
              }

              id v25 = v58;
              LODWORD(v14) = v59;
              uint64_t v26 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v14);
              objc_msgSend(v25, "addObject:");

              objc_storeStrong(&v58, 0LL);
              ++v31;
              if (v29 + 1 >= (unint64_t)v32)
              {
                uint64_t v31 = 0LL;
                id v32 = -[NSArray countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  __b,  v88,  16LL);
                if (!v32) {
                  break;
                }
              }
            }
          }

          if (!i && (id)-[NSNumber longValue](v77->_initializeManually, "longValue") == (id)1) {
            id v17 =  -[AMDDODMLEspressoModel finishInitializeManually:errorDomain:]( v77,  "finishInitializeManually:errorDomain:",  v74,  v73);
          }
          int v71 = 0;
        }
      }

      else
      {
        id v78 = 0LL;
        int v71 = 1;
      }

      objc_storeStrong(&v66, 0LL);
      if (v71) {
        goto LABEL_38;
      }
    }

    int v57 = 0;
    memset(v55, 0, sizeof(v55));
    id v23 = v77->_weightNames;
    id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  v55,  v87,  16LL);
    if (v24)
    {
      uint64_t v20 = *(void *)v55[2];
      uint64_t v21 = 0LL;
      id v22 = v24;
      while (1)
      {
        uint64_t v19 = v21;
        if (*(void *)v55[2] != v20) {
          objc_enumerationMutation(v23);
        }
        uint64_t v56 = *(void *)(v55[1] + 8 * v21);
        id v54 = -[NSDictionary objectForKeyedSubscript:](v77->_weightNameBufferMap, "objectForKeyedSubscript:", v56);
        [v54 getBytes:v53 length:168];
        unint64_t v52 = v53[2] * v53[3] * v53[4] * v53[5];
        for (int j = 0; j < v52; ++j)
        {
          uint64_t v84 = v57;
          uint64_t v83 = 4LL;
          uint64_t v85 = v57;
          uint64_t v86 = 4LL;
          uint64_t v47 = v57;
          uint64_t v48 = 4LL;
          objc_msgSend(v70, "getBytes:range:", &v51, v57, 4);
          float v50 = *(float *)(v53[0] + 4LL * j);
          float v46 = v50 - v51;
          uint64_t v80 = v57;
          uint64_t v79 = 4LL;
          uint64_t v81 = v57;
          uint64_t v82 = 4LL;
          v45[1] = (id)v57;
          v45[2] = (id)4;
          objc_msgSend(v70, "replaceBytesInRange:withBytes:", v57, 4, &v46);
          v57 += 4;
        }

        objc_storeStrong(&v54, 0LL);
        ++v21;
        if (v19 + 1 >= (unint64_t)v22)
        {
          uint64_t v21 = 0LL;
          id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  v55,  v87,  16LL);
          if (!v22) {
            break;
          }
        }
      }
    }

    if (-[NSNumber longValue](v77->_initializeManually, "longValue"))
    {
      id v44 =  -[AMDDODMLEspressoModel getNewDeltasContainer:withError:errorDomain:]( v77,  "getNewDeltasContainer:withError:errorDomain:",  v70,  v74,  v73);
      if (v44)
      {
        id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        [v43 setObject:v44 forKey:ModelDeltas];
        [v43 setObject:v77->_weightNames forKey:WeightNamesKeyInResponse];
        [v43 setObject:v69 forKey:LossesKeyInResponse];
        [v43 setObject:v68 forKey:ModelMetrics];
        id v78 = v43;
        int v71 = 1;
        objc_storeStrong(&v43, 0LL);
      }

      else
      {
        id v78 = 0LL;
        int v71 = 1;
      }

      objc_storeStrong(&v44, 0LL);
    }

    else
    {
      v45[0] = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      [v45[0] setObject:v70 forKey:ModelDeltas];
      [v45[0] setObject:v77->_weightNames forKey:WeightNamesKeyInResponse];
      [v45[0] setObject:v69 forKey:LossesKeyInResponse];
      [v45[0] setObject:v68 forKey:ModelMetrics];
      id v78 = v45[0];
      int v71 = 1;
      objc_storeStrong(v45, 0LL);
    }

- (int64_t)initializeManually:(id *)a3 errorDomain:(id)a4
{
  v116 = self;
  SEL v115 = a2;
  v114 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (v116->_attachmentProcessor)
  {
    id v111 = -[AMDDODMLAttachmentProcessor weightsArray](v116->_attachmentProcessor, "weightsArray");
    if (v111)
    {
      uint64_t v110 = 0LL;
      memset(__b, 0, sizeof(__b));
      id obj = v116->_weightNames;
      id v65 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v128,  16LL);
      if (v65)
      {
        uint64_t v61 = *(void *)__b[2];
        uint64_t v62 = 0LL;
        id v63 = v65;
        while (1)
        {
          uint64_t v60 = v62;
          if (*(void *)__b[2] != v61) {
            objc_enumerationMutation(obj);
          }
          uint64_t v109 = *(void *)(__b[1] + 8 * v62);
          id v59 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingNames, "objectForKey:", v109);

          if (v59)
          {
            id v107 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingSize, "objectForKey:", v109);
            id v106 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingNumberVectorsBefore, "objectForKey:", v109);
            id v105 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v109);
            id v104 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingMappingKeys, "objectForKey:", v109);
            if (v107 && v106 && v105 && v104)
            {
              id v58 = [v107 longValue];
              id v10 = [v106 longValue];
              v110 += (void)v58 * (void)v10;
              id v103 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v116->_attachmentProcessor, "hashMapForKey:", v104);
              if (v103)
              {
                id v57 = [v103 count];
                if (v57 <= [v105 longValue])
                {
                  int v112 = 0;
                }

                else
                {
                  double v13 = objc_alloc(&OBJC_CLASS___NSError);
                  double v14 =  -[NSError initWithDomain:code:userInfo:]( v13,  "initWithDomain:code:userInfo:",  location,  119LL,  0LL);
                  id *v114 = v14;
                  int64_t v117 = 0LL;
                  int v112 = 1;
                }
              }

              else
              {
                id v11 = objc_alloc(&OBJC_CLASS___NSError);
                id v12 =  -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  location,  118LL,  0LL);
                id *v114 = v12;
                int64_t v117 = 0LL;
                int v112 = 1;
              }

              objc_storeStrong(&v103, 0LL);
            }

            else
            {
              id v8 = objc_alloc(&OBJC_CLASS___NSError);
              id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", location, 117LL, 0LL);
              id *v114 = v9;
              int64_t v117 = 0LL;
              int v112 = 1;
            }

            objc_storeStrong(&v104, 0LL);
            objc_storeStrong(&v105, 0LL);
            objc_storeStrong(&v106, 0LL);
            objc_storeStrong(&v107, 0LL);
            if (v112) {
              goto LABEL_27;
            }
          }

          else
          {
            id v102 =  -[NSDictionary objectForKeyedSubscript:]( v116->_weightNameBufferMap,  "objectForKeyedSubscript:",  v109);
            [v102 getBytes:v97 length:168];
            uint64_t v96 = v98 * v99 * v100 * v101;
            v110 += v96;
            objc_storeStrong(&v102, 0LL);
          }

          ++v62;
          if (v60 + 1 >= (unint64_t)v63)
          {
            uint64_t v62 = 0LL;
            id v63 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v128,  16LL);
            if (!v63) {
              break;
            }
          }
        }
      }

      int v112 = 0;
LABEL_27:

      if (!v112)
      {
        unint64_t v15 = (unint64_t)[v111 length];
        if (v15 / 4 == v110)
        {
          uint64_t v95 = 0LL;
          memset(v93, 0, sizeof(v93));
          uint64_t v55 = v116->_weightNames;
          id v56 = -[NSArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  v93,  v127,  16LL);
          if (v56)
          {
            uint64_t v52 = *(void *)v93[2];
            uint64_t v53 = 0LL;
            id v54 = v56;
            while (1)
            {
              uint64_t v51 = v53;
              if (*(void *)v93[2] != v52) {
                objc_enumerationMutation(v55);
              }
              uint64_t v94 = *(void *)(v93[1] + 8 * v53);
              id v50 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingNames, "objectForKey:", v94);

              if (v50)
              {
                id v92 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingSize, "objectForKey:", v94);
                id v91 =  -[NSDictionary objectForKey:]( v116->_shortenedEmbeddingNumberVectorsBefore,  "objectForKey:",  v94);
                id v90 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v94);
                id v89 = -[NSDictionary objectForKey:](v116->_shortenedEmbeddingMappingKeys, "objectForKey:", v94);
                if (v92 && v91 && v90 && v89)
                {
                  id v88 =  -[AMDDODMLAttachmentProcessor hashMapForKey:]( v116->_attachmentProcessor,  "hashMapForKey:",  v89);
                  if (v88)
                  {
                    id v87 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    memset(v85, 0, sizeof(v85));
                    id v48 = v88;
                    id v49 = [v48 countByEnumeratingWithState:v85 objects:v126 count:16];
                    if (v49)
                    {
                      uint64_t v45 = *(void *)v85[2];
                      uint64_t v46 = 0LL;
                      id v47 = v49;
                      while (1)
                      {
                        uint64_t v44 = v46;
                        if (*(void *)v85[2] != v45) {
                          objc_enumerationMutation(v48);
                        }
                        uint64_t v86 = *(void *)(v85[1] + 8 * v46);
                        id v42 = v87;
                        uint64_t v41 = v86;
                        id v43 = [v88 objectForKey:v86];
                        objc_msgSend(v42, "setObject:forKey:", v41);

                        ++v46;
                        if (v44 + 1 >= (unint64_t)v47)
                        {
                          uint64_t v46 = 0LL;
                          id v47 = [v48 countByEnumeratingWithState:v85 objects:v126 count:16];
                          if (!v47) {
                            break;
                          }
                        }
                      }
                    }

                    id v84 =  -[NSDictionary objectForKeyedSubscript:]( v116->_weightNameBufferMap,  "objectForKeyedSubscript:",  v94);
                    [v84 getBytes:v83 length:168];
                    id v82 = (id)v83[2];
                    id v81 = (id)v83[3];
                    id v22 = [v92 longValue];
                    if (v22 == v82 && (id v23 = [v90 longValue], v23 == v81))
                    {
                      uint64_t v80 = v83[0];
                      for (unsigned int i = 0; ; ++i)
                      {
                        uint64_t v40 = (int)i;
                        id v38 = v87;
                        NSUInteger v39 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", i);
                        id v78 = objc_msgSend(v38, "objectForKey:");

                        if (v78)
                        {
                          for (int j = 0; ; ++j)
                          {
                            uint64_t v37 = j;
                            uint64_t v34 = (int)i;
                            id v26 = [v92 longValue];
                            uint64_t v76 = v34 * (void)v26 + j;
                            uint64_t v35 = v95;
                            id v36 = [v78 longValue];
                            id v27 = [v92 longValue];
                            uint64_t v75 = v35 + (void)v36 * (void)v27 + j;
                            uint64_t v123 = 4 * v75;
                            uint64_t v122 = 4LL;
                            uint64_t v124 = 4 * v75;
                            uint64_t v125 = 4LL;
                            uint64_t v73 = 4 * v75;
                            uint64_t v74 = 4LL;
                            objc_msgSend(v111, "getBytes:range:", v80 + 4 * v76, 4 * v75, 4);
                          }
                        }

                        else
                        {
                          for (int k = 0; ; ++k)
                          {
                            uint64_t v33 = k;
                            uint64_t v32 = (int)i;
                            id v28 = [v92 longValue];
                            uint64_t v71 = v32 * (void)v28 + k;
                            *(_DWORD *)(v80 + 4 * v71) = 0;
                          }
                        }

                        objc_storeStrong(&v78, 0LL);
                      }

                      id v31 = [v91 longValue];
                      id v29 = [v92 longValue];
                      v95 += (void)v31 * (void)v29;
                      int v112 = 0;
                    }

                    else
                    {
                      id v24 = objc_alloc(&OBJC_CLASS___NSError);
                      id v25 =  -[NSError initWithDomain:code:userInfo:]( v24,  "initWithDomain:code:userInfo:",  location,  121LL,  0LL);
                      id *v114 = v25;
                      int64_t v117 = 0LL;
                      int v112 = 1;
                    }

                    objc_storeStrong(&v84, 0LL);
                    objc_storeStrong(&v87, 0LL);
                  }

                  else
                  {
                    uint64_t v20 = objc_alloc(&OBJC_CLASS___NSError);
                    uint64_t v21 =  -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  location,  118LL,  0LL);
                    id *v114 = v21;
                    int64_t v117 = 0LL;
                    int v112 = 1;
                  }

                  objc_storeStrong(&v88, 0LL);
                }

                else
                {
                  int v18 = objc_alloc(&OBJC_CLASS___NSError);
                  uint64_t v19 =  -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  location,  117LL,  0LL);
                  id *v114 = v19;
                  int64_t v117 = 0LL;
                  int v112 = 1;
                }

                objc_storeStrong(&v89, 0LL);
                objc_storeStrong(&v90, 0LL);
                objc_storeStrong(&v91, 0LL);
                objc_storeStrong(&v92, 0LL);
                if (v112) {
                  goto LABEL_74;
                }
              }

              else
              {
                id v70 =  -[NSDictionary objectForKeyedSubscript:]( v116->_weightNameBufferMap,  "objectForKeyedSubscript:",  v94);
                [v70 getBytes:v69 length:168];
                unint64_t v68 = v69[2] * v69[3] * v69[4] * v69[5];
                for (int m = 0; m < v68; ++m)
                {
                  uint64_t v119 = 4 * (v95 + m);
                  uint64_t v118 = 4LL;
                  uint64_t v120 = v119;
                  uint64_t v121 = 4LL;
                  objc_msgSend(v111, "getBytes:range:", &v66, v119, 4);
                  *(_DWORD *)(v69[0] + 4LL * m) = v66;
                }

                v95 += v68;
                objc_storeStrong(&v70, 0LL);
              }

              ++v53;
              if (v51 + 1 >= (unint64_t)v54)
              {
                uint64_t v53 = 0LL;
                id v54 = -[NSArray countByEnumeratingWithState:objects:count:]( v55,  "countByEnumeratingWithState:objects:count:",  v93,  v127,  16LL);
                if (!v54) {
                  break;
                }
              }
            }
          }

          int v112 = 0;
LABEL_74:

          if (!v112)
          {
            int64_t v117 = 1LL;
            int v112 = 1;
          }
        }

        else
        {
          id v16 = objc_alloc(&OBJC_CLASS___NSError);
          id v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", location, 120LL, 0LL);
          id *v114 = v17;
          int64_t v117 = 0LL;
          int v112 = 1;
        }
      }
    }

    else
    {
      uint64_t v6 = objc_alloc(&OBJC_CLASS___NSError);
      int v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", location, 116LL, 0LL);
      id *v114 = v7;
      int64_t v117 = 0LL;
      int v112 = 1;
    }

    objc_storeStrong(&v111, 0LL);
  }

  else
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v5 = -[NSError initWithDomain:code:userInfo:](v4, "initWithDomain:code:userInfo:", location, 116LL, 0LL);
    id *v114 = v5;
    int64_t v117 = 0LL;
    int v112 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v117;
}

- (id)finishInitializeManually:(id *)a3 errorDomain:(id)a4
{
  id v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  memset(__b, 0, sizeof(__b));
  id obj = v26->_weightNameBufferMap;
  NSUInteger v17 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v28,  16LL);
  if (v17)
  {
    uint64_t v13 = *(void *)__b[2];
    uint64_t v14 = 0LL;
    NSUInteger v15 = v17;
    while (1)
    {
      uint64_t v12 = v14;
      if (*(void *)__b[2] != v13) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v14);
      int v4 = espresso_network_unbind_buffer_to_global( v26->_net.plan, *(void *)&v26->_net.network_index, [v22 UTF8String], 0x10000);
      uint64_t v20 = v4;
      if (v4) {
        break;
      }
      id v18 = -[NSDictionary objectForKeyedSubscript:](v26->_weightNameBufferMap, "objectForKeyedSubscript:", v22);
      id v10 = v26;
      id v11 = [v22 UTF8String];
      if (espresso_network_bind_buffer_to_global( v10->_net.plan, *(void *)&v10->_net.network_index, v11, [v18 mutableBytes], 0x20000, 0x10000))
      {
        int v7 = objc_alloc(&OBJC_CLASS___NSError);
        id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", location, 74LL, 0LL);
        *id v24 = v8;
        id v27 = 0LL;
        int v19 = 1;
      }

      else
      {
        int v19 = 0;
      }

      objc_storeStrong(&v18, 0LL);
      if (v19) {
        goto LABEL_14;
      }
      ++v14;
      if (v12 + 1 >= v15)
      {
        uint64_t v14 = 0LL;
        NSUInteger v15 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v28,  16LL);
        if (!v15) {
          goto LABEL_13;
        }
      }
    }

    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", location, 74LL, 0LL);
    *id v24 = v6;
    id v27 = 0LL;
    int v19 = 1;
  }

  else
  {
LABEL_13:
    int v19 = 0;
  }

- (id)getNewDeltasContainer:(id)a3 withError:(id *)a4 errorDomain:(id)a5
{
  uint64_t v60 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v58 = a4;
  id v57 = 0LL;
  objc_storeStrong(&v57, a5);
  id v56 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  uint64_t v55 = 0LL;
  memset(__b, 0, sizeof(__b));
  id v27 = v60->_weightNames;
  id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  __b,  v70,  16LL);
  if (v28)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0LL;
    id v24 = v28;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(v27);
      }
      uint64_t v54 = *(void *)(__b[1] + 8 * v23);
      id v20 = -[NSDictionary objectForKey:](v60->_shortenedEmbeddingNames, "objectForKey:", v54);

      if (v20)
      {
        id v52 = -[NSDictionary objectForKey:](v60->_shortenedEmbeddingSize, "objectForKey:", v54);
        id v51 = -[NSDictionary objectForKey:](v60->_shortenedEmbeddingNumberVectorsBefore, "objectForKey:", v54);
        id v50 = -[NSDictionary objectForKey:](v60->_shortenedEmbeddingNumberVectorsAfter, "objectForKey:", v54);
        id v49 = -[NSDictionary objectForKey:](v60->_shortenedEmbeddingMappingKeys, "objectForKey:", v54);
        if (v52 && v51 && v50 && v49)
        {
          id v47 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v60->_attachmentProcessor, "hashMapForKey:", v49);
          if (v47)
          {
            for (uint64_t i = 0LL; ; ++i)
            {
              uint64_t v19 = i;
              id v17 = v47;
              id v18 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", i);
              id v45 = objc_msgSend(v17, "objectForKey:");

              if (v45)
              {
                for (uint64_t j = 0LL; ; ++j)
                {
                  uint64_t v16 = j;
                  uint64_t v14 = v55;
                  id v15 = [v45 longValue];
                  id v9 = [v52 longValue];
                  uint64_t v43 = v14 + 4LL * (void)v15 * (void)v9 + 4 * j;
                  uint64_t v67 = v43;
                  uint64_t v66 = 4LL;
                  uint64_t v68 = v43;
                  uint64_t v69 = 4LL;
                  uint64_t v40 = v43;
                  uint64_t v41 = 4LL;
                  objc_msgSend(location[0], "getBytes:range:");
                  [v56 appendBytes:v42 length:4];
                }
              }

              else
              {
                for (uint64_t k = 0LL; ; ++k)
                {
                  uint64_t v13 = k;
                  int v38 = 0;
                  [v56 appendBytes:&v38 length:4];
                }
              }

              objc_storeStrong(&v45, 0LL);
            }

            id v12 = [v52 longValue];
            id v10 = [v50 longValue];
            v55 += 4LL * (void)v12 * (void)v10;
            int v48 = 0;
          }

          else
          {
            int v7 = objc_alloc(&OBJC_CLASS___NSError);
            id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v57, 124LL, 0LL);
            *id v58 = v8;
            id v61 = 0LL;
            int v48 = 1;
          }

          objc_storeStrong(&v47, 0LL);
        }

        else
        {
          uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
          uint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v57, 123LL, 0LL);
          *id v58 = v6;
          id v61 = 0LL;
          int v48 = 1;
        }

        objc_storeStrong(&v49, 0LL);
        objc_storeStrong(&v50, 0LL);
        objc_storeStrong(&v51, 0LL);
        objc_storeStrong(&v52, 0LL);
        if (v48) {
          goto LABEL_35;
        }
      }

      else
      {
        id v37 = -[NSDictionary objectForKeyedSubscript:](v60->_weightNameBufferMap, "objectForKeyedSubscript:", v54);
        [v37 getBytes:v32 length:168];
        unint64_t v31 = v33 * v34 * v35 * v36;
        for (unint64_t m = 0LL; m < v31; ++m)
        {
          uint64_t v63 = v55;
          uint64_t v62 = 4LL;
          uint64_t v64 = v55;
          uint64_t v65 = 4LL;
          objc_msgSend(location[0], "getBytes:range:");
          [v56 appendBytes:v29 length:4];
          v55 += 4LL;
        }

        objc_storeStrong(&v37, 0LL);
      }

      ++v23;
      if (v21 + 1 >= (unint64_t)v24)
      {
        uint64_t v23 = 0LL;
        id v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  __b,  v70,  16LL);
        if (!v24) {
          break;
        }
      }
    }
  }

  int v48 = 0;
LABEL_35:

  if (!v48)
  {
    id v61 = v56;
    int v48 = 1;
  }

  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(location, 0LL);
  return v61;
}

- (void)dealloc
{
  uint64_t v6 = self;
  SEL v5 = a2;
  if (self->_plan)
  {
    uint64_t v4 = (int)espresso_plan_destroy(v6->_plan);
    uint64_t v3 = (int)espresso_context_destroy(v6->_ctx);
  }

  v2.receiver = v6;
  v2.super_class = (Class)&OBJC_CLASS___AMDDODMLEspressoModel;
  -[AMDDODMLEspressoModel dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end