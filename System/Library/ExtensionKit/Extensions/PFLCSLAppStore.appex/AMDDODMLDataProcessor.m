@interface AMDDODMLDataProcessor
- (AMDDODMLDataProcessor)initWithActionArray:(id)a3 withAttachmentProcessor:(id)a4;
- (id)aggregateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)bindToBuffer:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)checkIfArrayEmptyAndThrowError:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)combineArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)constantValueMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)destroyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)downSampleData:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)filterArrayOnNumber:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)generateHashFromInputs:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)getCoreDictionary;
- (id)getCurrentTime:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)getElementInCoreDictionary:(id)a3;
- (id)getElementInInputDictionary:(id)a3;
- (id)getElementInNumberInputsBounds:(id)a3;
- (id)getElementsInSampleDictionary;
- (id)getInputDictionary;
- (id)hashAdamIdsToIndices:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)hashFromCoreDictionary:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)ifStatement:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)insertArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)insertRawArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)padArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)parseAndCall:(id)a3 withInputs:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)processForLoop:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)processForLoopHelper:(id)a3 withNumber:(id)a4 withDictionary:(id)a5;
- (id)processRecipe:(id *)a3 errorDomain:(id)a4;
- (id)randomizeArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)replicateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)requestData:(id)a3 withUseStubs:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)sampleFromDistribution:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)sortArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)spliceArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)strideCopyAndSplitArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)strideCopyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)twoArrayMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)windowFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)getInputSize;
- (void)resetDataProcessorWithRecipe:(id)a3;
- (void)setElementInCoreDictionary:(id)a3 withKey:(id)a4;
- (void)setElementsInCoreDictionary:(id)a3;
@end

@implementation AMDDODMLDataProcessor

- (AMDDODMLDataProcessor)initWithActionArray:(id)a3 withAttachmentProcessor:(id)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  v4 = v22;
  v22 = 0LL;
  v19.receiver = v4;
  v19.super_class = (Class)&OBJC_CLASS___AMDDODMLDataProcessor;
  v18 = -[AMDDODMLDataProcessor init](&v19, "init");
  v22 = v18;
  objc_storeStrong((id *)&v22, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v22->_actionArray, location[0]);
    objc_storeStrong((id *)&v22->_attachmentsProcessor, v20);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    coreDictionary = v22->_coreDictionary;
    v22->_coreDictionary = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    inputDictionary = v22->_inputDictionary;
    v22->_inputDictionary = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    numberInputsBound = v22->_numberInputsBound;
    v22->_numberInputsBound = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    elementsInSample = v22->_elementsInSample;
    v22->_elementsInSample = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___AMDClient);
    myAMDClient = v22->_myAMDClient;
    v22->_myAMDClient = v13;
  }

  v16 = v22;
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  return v16;
}

- (void)resetDataProcessorWithRecipe:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_actionArray, location[0]);
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  inputDictionary = v12->_inputDictionary;
  v12->_inputDictionary = v3;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  numberInputsBound = v12->_numberInputsBound;
  v12->_numberInputsBound = v5;

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  elementsInSample = v12->_elementsInSample;
  v12->_elementsInSample = v7;

  v9 = objc_alloc_init(&OBJC_CLASS___AMDClient);
  myAMDClient = v12->_myAMDClient;
  v12->_myAMDClient = v9;

  objc_storeStrong(location, 0LL);
}

- (void)setElementInCoreDictionary:(id)a3 withKey:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[NSMutableDictionary setObject:forKey:](v7->_coreDictionary, "setObject:forKey:", location[0], v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)getCoreDictionary
{
  return self->_coreDictionary;
}

- (void)setElementsInCoreDictionary:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
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
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      v3 = v14;
      id v4 = [location[0] objectForKey:v12];
      -[AMDDODMLDataProcessor setElementInCoreDictionary:withKey:](v3, "setElementInCoreDictionary:withKey:");

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0LL);
}

- (id)getElementInCoreDictionary:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_coreDictionary, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)getElementInInputDictionary:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_inputDictionary, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)getElementInNumberInputsBounds:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[NSMutableDictionary objectForKey:](v6->_numberInputsBound, "objectForKey:", location[0]);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)getInputDictionary
{
  return self->_inputDictionary;
}

- (int64_t)getInputSize
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = -1LL;
  memset(__b, 0, sizeof(__b));
  id obj = v15->_numberInputsBound;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
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
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      id v3 = -[NSMutableDictionary objectForKey:](v15->_numberInputsBound, "objectForKey:", v12);
      id v4 = [v3 longValue];

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v16,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }

  return v13;
}

- (id)getElementsInSampleDictionary
{
  return self->_elementsInSample;
}

- (id)processRecipe:(id *)a3 errorDomain:(id)a4
{
  SEL v14 = self;
  SEL v13 = a2;
  uint64_t v12 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v5 = i;
    if (v5 >= -[NSArray count](v14->_actionArray, "count")) {
      break;
    }
    id v9 = -[NSArray objectAtIndex:](v14->_actionArray, "objectAtIndex:", i);
    id v8 = [v9 objectForKey:FunctionName];
    id v7 =  -[AMDDODMLDataProcessor parseAndCall:withInputs:error:errorDomain:]( v14,  "parseAndCall:withInputs:error:errorDomain:",  v8,  v9,  v12,  location);
    if (v7)
    {
      int v6 = 0;
    }

    else
    {
      v15 = 0LL;
      int v6 = 1;
    }

    objc_storeStrong(&v7, 0LL);
    objc_storeStrong(&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
    if (v6) {
      goto LABEL_9;
    }
  }

  v15 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
LABEL_9:
  objc_storeStrong(&location, 0LL);
  return v15;
}

- (id)parseAndCall:(id)a3 withInputs:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  SEL v13 = a5;
  id v12 = 0LL;
  objc_storeStrong(&v12, a6);
  if ([location[0] isEqual:AggregateArray])
  {
    id v17 =  -[AMDDODMLDataProcessor aggregateArray:error:errorDomain:]( v16,  "aggregateArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:BindToBuffer])
  {
    id v17 =  -[AMDDODMLDataProcessor bindToBuffer:error:errorDomain:]( v16,  "bindToBuffer:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:CheckIfArrayEmptyAndThrowError])
  {
    id v17 =  -[AMDDODMLDataProcessor checkIfArrayEmptyAndThrowError:error:errorDomain:]( v16,  "checkIfArrayEmptyAndThrowError:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:CombineArray])
  {
    id v17 =  -[AMDDODMLDataProcessor combineArray:error:errorDomain:]( v16,  "combineArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:ConstantValueMathFunction])
  {
    id v17 =  -[AMDDODMLDataProcessor constantValueMathFunction:error:errorDomain:]( v16,  "constantValueMathFunction:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:DownSampleData])
  {
    id v17 =  -[AMDDODMLDataProcessor downSampleData:error:errorDomain:]( v16,  "downSampleData:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:DestroyArray])
  {
    id v17 =  -[AMDDODMLDataProcessor destroyArray:error:errorDomain:]( v16,  "destroyArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:FilterArrayOnNumber])
  {
    id v17 =  -[AMDDODMLDataProcessor filterArrayOnNumber:error:errorDomain:]( v16,  "filterArrayOnNumber:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:IfStatement])
  {
    id v17 =  -[AMDDODMLDataProcessor ifStatement:error:errorDomain:]( v16,  "ifStatement:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:GenerateHashFromInputs])
  {
    id v17 =  -[AMDDODMLDataProcessor generateHashFromInputs:error:errorDomain:]( v16,  "generateHashFromInputs:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:GetCurrentTime])
  {
    id v17 =  -[AMDDODMLDataProcessor getCurrentTime:error:errorDomain:]( v16,  "getCurrentTime:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:HashAdamIdsToIndices])
  {
    id v17 =  -[AMDDODMLDataProcessor hashAdamIdsToIndices:error:errorDomain:]( v16,  "hashAdamIdsToIndices:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:HashFromCoreDictionary])
  {
    id v17 =  -[AMDDODMLDataProcessor hashFromCoreDictionary:error:errorDomain:]( v16,  "hashFromCoreDictionary:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:InsertArray])
  {
    id v17 =  -[AMDDODMLDataProcessor insertArray:error:errorDomain:]( v16,  "insertArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:InsertRawArray])
  {
    id v17 =  -[AMDDODMLDataProcessor insertRawArray:error:errorDomain:]( v16,  "insertRawArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:PadArray])
  {
    id v17 = -[AMDDODMLDataProcessor padArray:error:errorDomain:](v16, "padArray:error:errorDomain:", v14, v13, v12);
  }

  else if ([location[0] isEqual:ProcessForLoop])
  {
    id v17 =  -[AMDDODMLDataProcessor processForLoop:error:errorDomain:]( v16,  "processForLoop:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:RandomizeArray])
  {
    id v17 =  -[AMDDODMLDataProcessor randomizeArray:error:errorDomain:]( v16,  "randomizeArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:ReplicateArray])
  {
    id v17 =  -[AMDDODMLDataProcessor replicateArray:error:errorDomain:]( v16,  "replicateArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:RequestData])
  {
    id v17 =  -[AMDDODMLDataProcessor requestData:withUseStubs:error:errorDomain:]( v16,  "requestData:withUseStubs:error:errorDomain:",  v14,  0LL,  v13,  v12);
  }

  else if ([location[0] isEqual:RequestDummyData])
  {
    id v17 =  -[AMDDODMLDataProcessor requestData:withUseStubs:error:errorDomain:]( v16,  "requestData:withUseStubs:error:errorDomain:",  v14,  1LL,  v13,  v12);
  }

  else if ([location[0] isEqual:SampleFromDistribution])
  {
    id v17 =  -[AMDDODMLDataProcessor sampleFromDistribution:error:errorDomain:]( v16,  "sampleFromDistribution:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:SortArray])
  {
    id v17 = -[AMDDODMLDataProcessor sortArray:error:errorDomain:](v16, "sortArray:error:errorDomain:", v14, v13, v12);
  }

  else if ([location[0] isEqual:SpliceArray])
  {
    id v17 =  -[AMDDODMLDataProcessor spliceArray:error:errorDomain:]( v16,  "spliceArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:StrideCopyAndSplitArray])
  {
    id v17 =  -[AMDDODMLDataProcessor strideCopyAndSplitArray:error:errorDomain:]( v16,  "strideCopyAndSplitArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:StrideArrayCopy])
  {
    id v17 =  -[AMDDODMLDataProcessor strideCopyArray:error:errorDomain:]( v16,  "strideCopyArray:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:TwoArrayMathFunction])
  {
    id v17 =  -[AMDDODMLDataProcessor twoArrayMathFunction:error:errorDomain:]( v16,  "twoArrayMathFunction:error:errorDomain:",  v14,  v13,  v12);
  }

  else if ([location[0] isEqual:WindowFunction])
  {
    id v17 =  -[AMDDODMLDataProcessor windowFunction:error:errorDomain:]( v16,  "windowFunction:error:errorDomain:",  v14,  v13,  v12);
  }

  else
  {
    int v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v12, 24LL, 0LL);
    id *v13 = v7;
    id v17 = 0LL;
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v17;
}

- (id)processForLoopHelper:(id)a3 withNumber:(id)a4 withDictionary:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v32 = 0LL;
  objc_storeStrong(&v32, a4);
  id v31 = 0LL;
  objc_storeStrong(&v31, a5);
  memset(__b, 0, sizeof(__b));
  id v24 = v31;
  id v25 = [v24 countByEnumeratingWithState:__b objects:v34 count:16];
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
      uint64_t v30 = *(void *)(__b[1] + 8 * v20);
      id v28 = [v31 objectForKey:v30];
      id v27 = [v28 objectForKey:Multiplier];
      id v26 = [v28 objectForKey:Adder];
      [v32 doubleValue];
      double v13 = v5;
      [v27 doubleValue];
      double v12 = v6;
      [v26 doubleValue];
      id v15 = location[0];
      uint64_t v14 = v30;
      id v17 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7 + v13 * v12);
      v16 = -[NSNumber stringValue](v17, "stringValue");
      id v8 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v14);
      id v9 = location[0];
      location[0] = v8;

      objc_storeStrong(&v26, 0LL);
      objc_storeStrong(&v27, 0LL);
      objc_storeStrong(&v28, 0LL);
      ++v20;
      if (v18 + 1 >= (unint64_t)v21)
      {
        uint64_t v20 = 0LL;
        id v21 = [v24 countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  id v11 = location[0];
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (id)processForLoop:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v102 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v100 = a4;
  id v99 = 0LL;
  objc_storeStrong(&v99, a5);
  id v98 = [location[0] objectForKey:Starting];
  id v97 = [location[0] objectForKey:Ending];
  id v96 = [location[0] objectForKey:StartingLikeOtherArray];
  id v95 = [location[0] objectForKey:EndingLikeOtherArray];
  if (!v96) {
    goto LABEL_73;
  }
  id v94 = -[NSMutableDictionary objectForKey:](v102->_coreDictionary, "objectForKey:", v96);
  id v93 = [location[0] objectForKey:StartingLikeOtherArrayMultiplier];
  id v92 = [location[0] objectForKey:StartingLikeOtherArrayOffset];
  if (v94 && v93 && v92)
  {
    double v7 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v92 longValue]
           + (void)[v94 count] * (void)objc_msgSend(v93, "longValue")));
    id v8 = v98;
    id v98 = v7;

    int v91 = 0;
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v99, 47LL, 0LL);
    id *v100 = v6;
    v103 = 0LL;
    int v91 = 1;
  }

  objc_storeStrong(&v92, 0LL);
  objc_storeStrong(&v93, 0LL);
  objc_storeStrong(&v94, 0LL);
  if (!v91)
  {
LABEL_73:
    if (!v95) {
      goto LABEL_15;
    }
    id v90 = -[NSMutableDictionary objectForKey:](v102->_coreDictionary, "objectForKey:", v95);
    id v89 = [location[0] objectForKey:EndingLikeOtherArrayMultiplier];
    id v88 = [location[0] objectForKey:EndingLikeOtherArrayOffset];
    if (v90 && v89 && v88)
    {
      id v11 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v88 longValue]
              + (void)[v90 count] * (void)objc_msgSend(v89, "longValue")));
      id v12 = v97;
      id v97 = v11;

      int v91 = 0;
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v99, 146LL, 0LL);
      id *v100 = v10;
      v103 = 0LL;
      int v91 = 1;
    }

    objc_storeStrong(&v88, 0LL);
    objc_storeStrong(&v89, 0LL);
    objc_storeStrong(&v90, 0LL);
    if (!v91)
    {
LABEL_15:
      id v87 = [location[0] objectForKey:InsideLoop];
      for (uint64_t i = (int)[v98 intValue]; ; ++i)
      {
        uint64_t v56 = i;
        id v85 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", i);
        for (unint64_t j = 0LL; ; ++j)
        {
          unint64_t v55 = j;
          id v83 = [v87 objectAtIndex:j];
          id v82 = [v83 objectForKey:OverrideKey];
          id v81 = [v83 objectForKey:OverrideNumberKeys];
          if (!v82)
          {
            double v13 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
            id v14 = v82;
            id v82 = v13;
          }

          if (!v81)
          {
            id v15 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
            id v16 = v81;
            id v81 = v15;
          }

          id v80 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          memset(__b, 0, sizeof(__b));
          id v53 = v83;
          id v54 = [v53 countByEnumeratingWithState:__b objects:v106 count:16];
          if (v54)
          {
            uint64_t v50 = *(void *)__b[2];
            uint64_t v51 = 0LL;
            id v52 = v54;
            while (1)
            {
              uint64_t v49 = v51;
              if (*(void *)__b[2] != v50) {
                objc_enumerationMutation(v53);
              }
              uint64_t v79 = *(void *)(__b[1] + 8 * v51);
              id v77 = [v83 objectForKey:v79];
              id v48 = v77;
              uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
              if ((objc_opt_isKindOfClass(v48, v17) & 1) != 0) {
                break;
              }
              id v47 = v77;
              uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSValue);
              if ((objc_opt_isKindOfClass(v47, v18) & 1) != 0)
              {
                id v74 = v77;
                memset(v72, 0, sizeof(v72));
                id v45 = v81;
                id v46 = [v45 countByEnumeratingWithState:v72 objects:v105 count:16];
                if (v46)
                {
                  uint64_t v42 = *(void *)v72[2];
                  uint64_t v43 = 0LL;
                  id v44 = v46;
                  while (1)
                  {
                    uint64_t v41 = v43;
                    if (*(void *)v72[2] != v42) {
                      objc_enumerationMutation(v45);
                    }
                    id v73 = *(id *)(v72[1] + 8 * v43);
                    if ([v73 isEqual:v79])
                    {
                      id v71 = [v81 objectForKey:v73];
                      id v70 = [v71 objectForKey:Multiplier];
                      id v69 = [v71 objectForKey:Adder];
                      [v85 doubleValue];
                      double v68 = v19;
                      double v40 = v19;
                      [v70 doubleValue];
                      double v39 = v20;
                      [v69 doubleValue];
                      double v68 = v21 + v40 * v39;
                      v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v68);
                      id v23 = v74;
                      id v74 = v22;

                      objc_storeStrong(&v69, 0LL);
                      objc_storeStrong(&v70, 0LL);
                      objc_storeStrong(&v71, 0LL);
                    }

                    ++v43;
                    if (v41 + 1 >= (unint64_t)v44)
                    {
                      uint64_t v43 = 0LL;
                      id v44 = [v45 countByEnumeratingWithState:v72 objects:v105 count:16];
                      if (!v44) {
                        break;
                      }
                    }
                  }
                }

                [v80 setObject:v74 forKey:v79];
                objc_storeStrong(&v74, 0LL);
                goto LABEL_53;
              }

              id v38 = v77;
              uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v38, v24) & 1) != 0)
              {
                id v67 = v77;
                v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                memset(v64, 0, sizeof(v64));
                id v36 = v67;
                id v37 = [v36 countByEnumeratingWithState:v64 objects:v104 count:16];
                if (v37)
                {
                  uint64_t v33 = *(void *)v64[2];
                  uint64_t v34 = 0LL;
                  id v35 = v37;
                  while (1)
                  {
                    uint64_t v32 = v34;
                    if (*(void *)v64[2] != v33) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v65 = *(void *)(v64[1] + 8 * v34);
                    id v63 =  -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:]( v102,  "processForLoopHelper:withNumber:withDictionary:",  v65,  v85,  v82);
                    id v62 = [v67 objectForKey:v65];
                    id v31 = v62;
                    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString);
                    if ((objc_opt_isKindOfClass(v31, v25) & 1) != 0)
                    {
                      id v61 =  -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:]( v102,  "processForLoopHelper:withNumber:withDictionary:",  v62,  v85,  v82);
                      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v61, v63);
                      objc_storeStrong(&v61, 0LL);
                    }

                    else
                    {
                      -[NSMutableDictionary setObject:forKey:](v66, "setObject:forKey:", v62, v63);
                    }

                    objc_storeStrong(&v62, 0LL);
                    objc_storeStrong(&v63, 0LL);
                    ++v34;
                    if (v32 + 1 >= (unint64_t)v35)
                    {
                      uint64_t v34 = 0LL;
                      id v35 = [v36 countByEnumeratingWithState:v64 objects:v104 count:16];
                      if (!v35) {
                        break;
                      }
                    }
                  }
                }

                [v80 setObject:v66 forKey:v79];
                objc_storeStrong((id *)&v66, 0LL);
                objc_storeStrong(&v67, 0LL);
                goto LABEL_53;
              }

              id v30 = v77;
              uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
              if ((objc_opt_isKindOfClass(v30, v26) & 1) != 0)
              {
                [v80 setObject:v77 forKey:v79];
                goto LABEL_53;
              }

              id v27 = objc_alloc(&OBJC_CLASS___NSError);
              id v28 = -[NSError initWithDomain:code:userInfo:](v27, "initWithDomain:code:userInfo:", v99, 147LL, 0LL);
              id *v100 = v28;
              v103 = 0LL;
              int v91 = 1;
LABEL_54:
              objc_storeStrong(&v77, 0LL);
              if (v91) {
                goto LABEL_58;
              }
              ++v51;
              if (v49 + 1 >= (unint64_t)v52)
              {
                uint64_t v51 = 0LL;
                id v52 = [v53 countByEnumeratingWithState:__b objects:v106 count:16];
                if (!v52) {
                  goto LABEL_57;
                }
              }
            }

            id v76 = v77;
            id v75 =  -[AMDDODMLDataProcessor processForLoopHelper:withNumber:withDictionary:]( v102,  "processForLoopHelper:withNumber:withDictionary:",  v76,  v85,  v82);
            [v80 setObject:v75 forKey:v79];
            objc_storeStrong(&v75, 0LL);
            objc_storeStrong(&v76, 0LL);
LABEL_53:
            int v91 = 0;
            goto LABEL_54;
          }

- (id)aggregateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v29 = a4;
  id v28 = 0LL;
  objc_storeStrong(&v28, a5);
  id v27 = [location[0] objectForKey:InputArray];
  id v26 = [location[0] objectForKey:OutputArray];
  id v25 = [location[0] objectForKey:AggregationMethod];
  if (v27 && v26 && v25)
  {
    id v23 = -[NSMutableDictionary objectForKey:](v31->_coreDictionary, "objectForKey:", v27);
    if (v23)
    {
      v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if ([v25 isEqual:AggregateSum])
      {
        double v21 = 0.0;
        for (unint64_t i = 0; i < (unint64_t)[v23 count]; ++i)
        {
          id v15 = [v23 objectAtIndex:i];
          [v15 doubleValue];
          double v21 = v21 + v9;
        }

        id v14 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21);
        -[NSMutableArray addObject:](v22, "addObject:");
      }

      else if ([v25 isEqual:AggregateAverage])
      {
        double v19 = 0.0;
        for (unint64_t j = 0; j < (unint64_t)[v23 count]; ++j)
        {
          id v13 = [v23 objectAtIndex:j];
          [v13 doubleValue];
          double v19 = v19 + v10;
        }

        id v12 =  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v19 / (double)(unint64_t)[v23 count]);
        -[NSMutableArray addObject:](v22, "addObject:");
      }

      -[NSMutableDictionary setObject:forKey:](v31->_coreDictionary, "setObject:forKey:", v22, v26);
      uint64_t v32 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v24 = 1;
      objc_storeStrong((id *)&v22, 0LL);
    }

    else
    {
      double v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v28, 142LL, 0LL);
      id *v29 = v8;
      uint64_t v32 = 0LL;
      int v24 = 1;
    }

    objc_storeStrong(&v23, 0LL);
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v28, 141LL, 0LL);
    id *v29 = v6;
    uint64_t v32 = 0LL;
    int v24 = 1;
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
  return v32;
}

- (id)bindToBuffer:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v31 = a4;
  id v30 = 0LL;
  objc_storeStrong(&v30, a5);
  id v29 = [location[0] objectForKey:InputArray];
  id v28 = [location[0] objectForKey:OutputArray];
  id v27 = [location[0] objectForKey:ElementsInSample];
  if (v29 && v28 && v27)
  {
    id v25 = -[NSMutableDictionary objectForKey:](v33->_coreDictionary, "objectForKey:", v29);
    if (v25)
    {
      id v15 = [v25 count];
      if (v15 >= [v27 longValue])
      {
        int v24 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
        uint64_t v23 = (uint64_t)[v25 count];
        uint64_t v22 = v23 % (uint64_t)[v27 longValue];
        uint64_t v21 = (v23 - v22) / (uint64_t)[v27 longValue];
        for (uint64_t i = 0LL; i < v23 - v22; ++i)
        {
          id v19 = [v25 objectAtIndex:i];
          [v19 floatValue];
          int v18 = v11;
          -[NSMutableData appendBytes:length:](v24, "appendBytes:length:", &v18, 4LL);
          objc_storeStrong(&v19, 0LL);
        }

        numberInputsBound = v33->_numberInputsBound;
        id v14 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v21);
        -[NSMutableDictionary setObject:forKey:](numberInputsBound, "setObject:forKey:");

        -[NSMutableDictionary setObject:forKey:](v33->_elementsInSample, "setObject:forKey:", v27, v28);
        -[NSMutableDictionary setObject:forKey:](v33->_inputDictionary, "setObject:forKey:", v24, v28);
        uint64_t v34 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v26 = 1;
        objc_storeStrong((id *)&v24, 0LL);
      }

      else
      {
        double v9 = objc_alloc(&OBJC_CLASS___NSError);
        double v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v30, 92LL, 0LL);
        *id v31 = v10;
        uint64_t v34 = 0LL;
        int v26 = 1;
      }
    }

    else
    {
      double v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v30, 27LL, 0LL);
      *id v31 = v8;
      uint64_t v34 = 0LL;
      int v26 = 1;
    }

    objc_storeStrong(&v25, 0LL);
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v30, 38LL, 0LL);
    *id v31 = v6;
    uint64_t v34 = 0LL;
    int v26 = 1;
  }

  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
  return v34;
}

- (id)checkIfArrayEmptyAndThrowError:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v18 = a4;
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v16 = [location[0] objectForKey:InputArray];
  if (v16)
  {
    id v14 = -[NSMutableDictionary objectForKey:](v20->_coreDictionary, "objectForKey:", v16);
    if (v14)
    {
      if ([v14 count])
      {
        uint64_t v21 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      }

      else
      {
        double v9 = objc_alloc(&OBJC_CLASS___NSError);
        double v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v17, 97LL, 0LL);
        id *v18 = v10;
        uint64_t v21 = 0LL;
      }

      int v15 = 1;
    }

    else
    {
      double v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v17, 98LL, 0LL);
      id *v18 = v8;
      uint64_t v21 = 0LL;
      int v15 = 1;
    }

    objc_storeStrong(&v14, 0LL);
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v17, 99LL, 0LL);
    id *v18 = v6;
    uint64_t v21 = 0LL;
    int v15 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v21;
}

- (id)combineArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  int v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v24 = a4;
  id v23 = 0LL;
  objc_storeStrong(&v23, a5);
  id v22 = [location[0] objectForKey:InputArray];
  id v21 = [location[0] objectForKey:SecondArray];
  id v20 = [location[0] objectForKey:OutputArray];
  if (v22 && v20 && v21)
  {
    id v18 = -[NSMutableDictionary objectForKey:](v26->_coreDictionary, "objectForKey:", v22);
    id v17 = -[NSMutableDictionary objectForKey:](v26->_coreDictionary, "objectForKey:", v21);
    if (v18 && v17)
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      for (unint64_t i = 0; i < (unint64_t)[v18 count]; ++i)
      {
        id v11 = [v18 objectAtIndex:i];
        -[NSMutableArray addObject:](v16, "addObject:");
      }

      for (unint64_t j = 0; j < (unint64_t)[v17 count]; ++j)
      {
        id v10 = [v17 objectAtIndex:j];
        -[NSMutableArray addObject:](v16, "addObject:");
      }

      -[NSMutableDictionary setObject:forKey:](v26->_coreDictionary, "setObject:forKey:", v16, v20);
      id v27 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v19 = 1;
      objc_storeStrong((id *)&v16, 0LL);
    }

    else
    {
      double v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v23, 28LL, 0LL);
      *int v24 = v8;
      id v27 = 0LL;
      int v19 = 1;
    }

    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v18, 0LL);
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v23, 39LL, 0LL);
    *int v24 = v6;
    id v27 = 0LL;
    int v19 = 1;
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
  return v27;
}

- (id)destroyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = a4;
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = [location[0] objectForKey:InputArray];
  if (v14)
  {
    id v12 = -[NSMutableDictionary objectForKey:](v18->_coreDictionary, "objectForKey:", v14);
    if (v12)
    {
      -[NSMutableDictionary removeObjectForKey:](v18->_coreDictionary, "removeObjectForKey:", v14);
      int v19 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
    }

    else
    {
      double v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v15, 37LL, 0LL);
      id *v16 = v8;
      int v19 = 0LL;
    }

    int v13 = 1;
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v15, 57LL, 0LL);
    id *v16 = v6;
    int v19 = 0LL;
    int v13 = 1;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v19;
}

- (id)downSampleData:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v107 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v105 = a4;
  id v104 = 0LL;
  objc_storeStrong(&v104, a5);
  id v103 = [location[0] objectForKey:InputArray];
  id v102 = [location[0] objectForKey:OutputArray];
  id v101 = [location[0] objectForKey:DefaultRatio];
  id v100 = [location[0] objectForKey:Mapping];
  *((void *)&v99 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&__int128 v99 = [location[0] objectForKey:OtherAffectedVectors];
  if (v99 == 0)
  {
    *((void *)&v99 + 1) = objc_alloc_init(&OBJC_CLASS___NSDictionary);

    *(void *)&__int128 v99 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
LABEL_31:
    if (v103 && v102 && v100 && v101 && *((void *)&v99 + 1) && (void)v99)
    {
      id v92 =  -[AMDDODMLAttachmentProcessor downSampleDictionaryForKey:]( v107->_attachmentsProcessor,  "downSampleDictionaryForKey:",  v100);
      if (v92)
      {
        id v91 = -[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v103);
        if (v91)
        {
          id v90 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          memset(v88, 0, sizeof(v88));
          id v50 = *((id *)&v99 + 1);
          id v51 = [v50 countByEnumeratingWithState:v88 objects:v111 count:16];
          if (v51)
          {
            uint64_t v47 = *(void *)v88[2];
            uint64_t v48 = 0LL;
            id v49 = v51;
            while (1)
            {
              uint64_t v46 = v48;
              if (*(void *)v88[2] != v47) {
                objc_enumerationMutation(v50);
              }
              uint64_t v89 = *(void *)(v88[1] + 8 * v48);
              id v87 = [*((id *)&v99 + 1) objectForKey:v89];
              id v44 = v90;
              id v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              objc_msgSend(v44, "setObject:forKey:");

              objc_storeStrong(&v87, 0LL);
              ++v48;
              if (v46 + 1 >= (unint64_t)v49)
              {
                uint64_t v48 = 0LL;
                id v49 = [v50 countByEnumeratingWithState:v88 objects:v111 count:16];
                if (!v49) {
                  break;
                }
              }
            }
          }

          id v86 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          for (unint64_t i = 0LL; ; ++i)
          {
            unint64_t v43 = i;
            id v84 = [v91 objectAtIndex:i];
            id v83 = [v92 objectForKey:v84];
            if (!v83) {
              objc_storeStrong(&v83, v101);
            }
            [v83 doubleValue];
            double v82 = v21;
            double v81 = (double)(arc4random() % 0x80000000) / 2147483650.0;
            if (v81 >= v82) {
              goto LABEL_70;
            }
            [v86 addObject:v84];
            memset(v79, 0, sizeof(v79));
            id v41 = *((id *)&v99 + 1);
            id v42 = [v41 countByEnumeratingWithState:v79 objects:v110 count:16];
            if (v42)
            {
              uint64_t v38 = *(void *)v79[2];
              uint64_t v39 = 0LL;
              id v40 = v42;
              while (1)
              {
                uint64_t v37 = v39;
                if (*(void *)v79[2] != v38) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v80 = *(void *)(v79[1] + 8 * v39);
                id v78 = [(id)v99 objectForKey:v80];
                id v77 = [*((id *)&v99 + 1) objectForKey:v80];
                id v76 = [v90 objectForKey:v77];
                for (uint64_t j = 0LL; ; ++j)
                {
                  uint64_t v36 = j;
                  unint64_t v34 = i;
                  id v22 = [v78 longValue];
                  unint64_t v74 = v34 * (void)v22 + j;
                  id v73 = -[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v80);
                  unint64_t v35 = v74;
                  if (v35 < (unint64_t)[v73 count])
                  {
                    id v72 = [v73 objectAtIndex:v74];
                    [v76 addObject:v72];
                    objc_storeStrong(&v72, 0LL);
                    int v98 = 0;
                  }

                  else
                  {
                    id v23 = objc_alloc(&OBJC_CLASS___NSError);
                    int v24 =  -[NSError initWithDomain:code:userInfo:]( v23,  "initWithDomain:code:userInfo:",  v104,  25LL,  0LL);
                    id *v105 = v24;
                    v108 = 0LL;
                    int v98 = 1;
                  }

                  objc_storeStrong(&v73, 0LL);
                  if (v98) {
                    goto LABEL_65;
                  }
                }

                int v98 = 0;
LABEL_65:
                objc_storeStrong(&v76, 0LL);
                objc_storeStrong(&v77, 0LL);
                objc_storeStrong(&v78, 0LL);
                if (v98) {
                  break;
                }
                ++v39;
                if (v37 + 1 >= (unint64_t)v40)
                {
                  uint64_t v39 = 0LL;
                  id v40 = [v41 countByEnumeratingWithState:v79 objects:v110 count:16];
                  if (!v40) {
                    goto LABEL_68;
                  }
                }
              }
            }

            else
            {
LABEL_68:
              int v98 = 0;
            }

            if (!v98) {
LABEL_70:
            }
              int v98 = 0;
            objc_storeStrong(&v83, 0LL);
            objc_storeStrong(&v84, 0LL);
            if (v98) {
              goto LABEL_80;
            }
          }

          memset(v70, 0, sizeof(v70));
          id v32 = v90;
          id v33 = [v32 countByEnumeratingWithState:v70 objects:v109 count:16];
          if (v33)
          {
            uint64_t v29 = *(void *)v70[2];
            uint64_t v30 = 0LL;
            id v31 = v33;
            while (1)
            {
              uint64_t v28 = v30;
              if (*(void *)v70[2] != v29) {
                objc_enumerationMutation(v32);
              }
              uint64_t v71 = *(void *)(v70[1] + 8 * v30);
              coreDictionary = v107->_coreDictionary;
              id v27 = [v90 objectForKey:v71];
              -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

              ++v30;
              if (v28 + 1 >= (unint64_t)v31)
              {
                uint64_t v30 = 0LL;
                id v31 = [v32 countByEnumeratingWithState:v70 objects:v109 count:16];
                if (!v31) {
                  break;
                }
              }
            }
          }

          -[NSMutableDictionary setObject:forKey:](v107->_coreDictionary, "setObject:forKey:", v86, v102);
          v108 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
          int v98 = 1;
LABEL_80:
          objc_storeStrong(&v86, 0LL);
          objc_storeStrong(&v90, 0LL);
        }

        else
        {
          int v19 = objc_alloc(&OBJC_CLASS___NSError);
          id v20 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", v104, 29LL, 0LL);
          id *v105 = v20;
          v108 = 0LL;
          int v98 = 1;
        }

        objc_storeStrong(&v91, 0LL);
      }

      else
      {
        id v17 = objc_alloc(&OBJC_CLASS___NSError);
        id v18 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v104, 21LL, 0LL);
        id *v105 = v18;
        v108 = 0LL;
        int v98 = 1;
      }

      objc_storeStrong(&v92, 0LL);
    }

    else
    {
      id v15 = objc_alloc(&OBJC_CLASS___NSError);
      id v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v104, 40LL, 0LL);
      id *v105 = v16;
      v108 = 0LL;
      int v98 = 1;
    }

    goto LABEL_83;
  }

  if (!*((void *)&v99 + 1) || !(void)v99)
  {
    double v5 = objc_alloc(&OBJC_CLASS___NSError);
    double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v104, 40LL, 0LL);
    id *v105 = v6;
    v108 = 0LL;
    int v98 = 1;
    goto LABEL_83;
  }

  memset(__b, 0, sizeof(__b));
  id v66 = *((id *)&v99 + 1);
  id v67 = [v66 countByEnumeratingWithState:__b objects:v113 count:16];
  if (v67)
  {
    uint64_t v63 = *(void *)__b[2];
    uint64_t v64 = 0LL;
    id v65 = v67;
    while (1)
    {
      uint64_t v62 = v64;
      if (*(void *)__b[2] != v63) {
        objc_enumerationMutation(v66);
      }
      uint64_t v97 = *(void *)(__b[1] + 8 * v64);
      id v7 = [(id)v99 objectForKey:v97];
      BOOL v61 = v7 != 0LL;

      if (!v61) {
        break;
      }
      id v59 = [(id)v99 objectForKey:v97];
      BOOL v60 = (uint64_t)[v59 longValue] >= 1;

      if (!v60) {
        break;
      }
      ++v64;
      if (v62 + 1 >= (unint64_t)v65)
      {
        uint64_t v64 = 0LL;
        id v65 = [v66 countByEnumeratingWithState:__b objects:v113 count:16];
        if (!v65) {
          goto LABEL_15;
        }
      }
    }

    id v8 = objc_alloc(&OBJC_CLASS___NSError);
    double v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v104, 40LL, 0LL);
    id *v105 = v9;
    v108 = 0LL;
    int v98 = 1;
  }

  else
  {
LABEL_15:
    int v98 = 0;
  }

  if (!v98)
  {
    memset(v94, 0, sizeof(v94));
    id v57 = (id)v99;
    id v58 = [v57 countByEnumeratingWithState:v94 objects:v112 count:16];
    if (v58)
    {
      uint64_t v54 = *(void *)v94[2];
      uint64_t v55 = 0LL;
      id v56 = v58;
      while (1)
      {
        uint64_t v53 = v55;
        if (*(void *)v94[2] != v54) {
          objc_enumerationMutation(v57);
        }
        uint64_t v95 = *(void *)(v94[1] + 8 * v55);
        id v10 = [*((id *)&v99 + 1) objectForKey:v95];
        BOOL v52 = v10 != 0LL;

        if (!v52) {
          break;
        }
        id v93 = -[NSMutableDictionary objectForKey:](v107->_coreDictionary, "objectForKey:", v95);
        if (v93)
        {
          int v98 = 0;
        }

        else
        {
          int v13 = objc_alloc(&OBJC_CLASS___NSError);
          id v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v104, 29LL, 0LL);
          id *v105 = v14;
          v108 = 0LL;
          int v98 = 1;
        }

        objc_storeStrong(&v93, 0LL);
        if (v98) {
          goto LABEL_30;
        }
        ++v55;
        if (v53 + 1 >= (unint64_t)v56)
        {
          uint64_t v55 = 0LL;
          id v56 = [v57 countByEnumeratingWithState:v94 objects:v112 count:16];
          if (!v56) {
            goto LABEL_29;
          }
        }
      }

      id v11 = objc_alloc(&OBJC_CLASS___NSError);
      id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v104, 40LL, 0LL);
      id *v105 = v12;
      v108 = 0LL;
      int v98 = 1;
    }

    else
    {
LABEL_29:
      int v98 = 0;
    }

- (id)constantValueMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  BOOL v52 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v50 = a4;
  id v49 = 0LL;
  objc_storeStrong(&v49, a5);
  id v48 = [location[0] objectForKey:InputArray];
  id v47 = [location[0] objectForKey:OutputArray];
  id v46 = [location[0] objectForKey:ConstantValue];
  id v45 = [location[0] objectForKey:Operation];
  if (!v48
    || !v47
    || !v46
    || !v45
    || ([v46 doubleValue], v5 == 0.0)
    && (([v45 isEqual:Modulo] & 1) != 0
     || ([v45 isEqual:Division] & 1) != 0))
  {
    double v6 = objc_alloc(&OBJC_CLASS___NSError);
    id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v49, 86LL, 0LL);
    *id v50 = v7;
    uint64_t v53 = 0LL;
    int v44 = 1;
    goto LABEL_31;
  }

  id v43 = -[NSMutableDictionary objectForKey:](v52->_coreDictionary, "objectForKey:", v48);
  if (!v43)
  {
    id v8 = objc_alloc(&OBJC_CLASS___NSError);
    double v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v49, 85LL, 0LL);
    *id v50 = v9;
    uint64_t v53 = 0LL;
    int v44 = 1;
    goto LABEL_30;
  }

  id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v36 = i;
    id v40 = [v43 objectAtIndex:i];
    id v39 = 0LL;
    if ([v45 isEqual:Modulo])
    {
      uint64_t v35 = (uint64_t)[v40 longValue];
      id v10 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  v35 % (uint64_t)[v46 longValue]);
      id v11 = v39;
      id v39 = v10;
    }

    else if ([v45 isEqual:Division])
    {
      [v40 doubleValue];
      double v34 = v12;
      [v46 doubleValue];
      id v14 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v34 / v13);
      id v15 = v39;
      id v39 = v14;
    }

    else if ([v45 isEqual:Multiplication])
    {
      [v40 doubleValue];
      double v33 = v16;
      [v46 doubleValue];
      id v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33 * v17);
      id v19 = v39;
      id v39 = v18;
    }

    else if ([v45 isEqual:Addition])
    {
      [v40 doubleValue];
      double v32 = v20;
      [v46 doubleValue];
      id v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v32 + v21);
      id v23 = v39;
      id v39 = v22;
    }

    else
    {
      if (([v45 isEqual:Subtraction] & 1) == 0)
      {
        uint64_t v28 = objc_alloc(&OBJC_CLASS___NSError);
        uint64_t v29 = -[NSError initWithDomain:code:userInfo:](v28, "initWithDomain:code:userInfo:", v49, 83LL, 0LL);
        *id v50 = v29;
        uint64_t v53 = 0LL;
        int v44 = 1;
        goto LABEL_26;
      }

      [v40 doubleValue];
      double v31 = v24;
      [v46 doubleValue];
      int v26 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31 - v25);
      id v27 = v39;
      id v39 = v26;
    }

    [v42 addObject:v39];
    int v44 = 0;
LABEL_26:
    objc_storeStrong(&v39, 0LL);
    objc_storeStrong(&v40, 0LL);
    if (v44) {
      goto LABEL_29;
    }
  }

  -[NSMutableDictionary setObject:forKey:](v52->_coreDictionary, "setObject:forKey:", v42, v47);
  uint64_t v53 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  int v44 = 1;
LABEL_29:
  objc_storeStrong(&v42, 0LL);
LABEL_30:
  objc_storeStrong(&v43, 0LL);
LABEL_31:
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(location, 0LL);
  return v53;
}

- (id)filterArrayOnNumber:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v120 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v118 = a4;
  id v117 = 0LL;
  objc_storeStrong(&v117, a5);
  id v116 = [location[0] objectForKey:InputArray];
  id v115 = [location[0] objectForKey:OutputArray];
  id v114 = [location[0] objectForKey:FilterOperation];
  id v113 = [location[0] objectForKey:ConstantValue];
  *((void *)&v112 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&__int128 v112 = [location[0] objectForKey:OtherAffectedVectors];
  if (v112 == 0)
  {
    *((void *)&v112 + 1) = objc_alloc_init(&OBJC_CLASS___NSDictionary);

    *(void *)&__int128 v112 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  }

  else
  {
    if (!*((void *)&v112 + 1) || !(void)v112)
    {
      double v5 = objc_alloc(&OBJC_CLASS___NSError);
      double v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v117, 102LL, 0LL);
      id *v118 = v6;
      v121 = 0LL;
      int v111 = 1;
      goto LABEL_95;
    }

    memset(__b, 0, sizeof(__b));
    id v82 = *((id *)&v112 + 1);
    id v83 = [v82 countByEnumeratingWithState:__b objects:v126 count:16];
    if (v83)
    {
      uint64_t v79 = *(void *)__b[2];
      uint64_t v80 = 0LL;
      id v81 = v83;
      while (1)
      {
        uint64_t v78 = v80;
        if (*(void *)__b[2] != v79) {
          objc_enumerationMutation(v82);
        }
        uint64_t v110 = *(void *)(__b[1] + 8 * v80);
        id v7 = [(id)v112 objectForKey:v110];
        BOOL v77 = v7 != 0LL;

        if (!v77) {
          break;
        }
        id v75 = [(id)v112 objectForKey:v110];
        BOOL v76 = (uint64_t)[v75 longValue] >= 1;

        if (!v76) {
          break;
        }
        ++v80;
        if (v78 + 1 >= (unint64_t)v81)
        {
          uint64_t v80 = 0LL;
          id v81 = [v82 countByEnumeratingWithState:__b objects:v126 count:16];
          if (!v81) {
            goto LABEL_15;
          }
        }
      }

      id v8 = objc_alloc(&OBJC_CLASS___NSError);
      double v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v117, 102LL, 0LL);
      id *v118 = v9;
      v121 = 0LL;
      int v111 = 1;
    }

    else
    {
LABEL_15:
      int v111 = 0;
    }

    if (v111) {
      goto LABEL_95;
    }
    memset(v107, 0, sizeof(v107));
    id v73 = (id)v112;
    id v74 = [v73 countByEnumeratingWithState:v107 objects:v125 count:16];
    if (v74)
    {
      uint64_t v70 = *(void *)v107[2];
      uint64_t v71 = 0LL;
      id v72 = v74;
      while (1)
      {
        uint64_t v69 = v71;
        if (*(void *)v107[2] != v70) {
          objc_enumerationMutation(v73);
        }
        uint64_t v108 = *(void *)(v107[1] + 8 * v71);
        id v10 = [*((id *)&v112 + 1) objectForKey:v108];
        BOOL v68 = v10 != 0LL;

        if (!v68) {
          break;
        }
        id v106 = -[NSMutableDictionary objectForKey:](v120->_coreDictionary, "objectForKey:", v108);
        if (v106)
        {
          int v111 = 0;
        }

        else
        {
          double v13 = objc_alloc(&OBJC_CLASS___NSError);
          id v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v117, 101LL, 0LL);
          id *v118 = v14;
          v121 = 0LL;
          int v111 = 1;
        }

        objc_storeStrong(&v106, 0LL);
        if (v111) {
          goto LABEL_30;
        }
        ++v71;
        if (v69 + 1 >= (unint64_t)v72)
        {
          uint64_t v71 = 0LL;
          id v72 = [v73 countByEnumeratingWithState:v107 objects:v125 count:16];
          if (!v72) {
            goto LABEL_29;
          }
        }
      }

      id v11 = objc_alloc(&OBJC_CLASS___NSError);
      double v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v117, 102LL, 0LL);
      id *v118 = v12;
      v121 = 0LL;
      int v111 = 1;
    }

    else
    {
LABEL_29:
      int v111 = 0;
    }

- (id)getCurrentTime:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18[1] = a4;
  v18[0] = 0LL;
  objc_storeStrong(v18, a5);
  id v17 = [location[0] objectForKey:OutputArray];
  mach_timebase_info(&info);
  uint64_t v5 = mach_absolute_time();
  LODWORD(v6) = info.numer;
  LODWORD(v7) = info.denom;
  double v15 = (double)v5 * ((double)v6 / (1000000000.0 * (double)v7));
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v11 = v14;
  double v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15);
  -[NSMutableArray addObject:](v11, "addObject:");

  -[NSMutableDictionary setObject:forKey:](v20->_coreDictionary, "setObject:forKey:", v14, v17);
  double v13 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

- (id)hashFromCoreDictionary:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  unint64_t v36 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v34 = a4;
  id v33 = 0LL;
  objc_storeStrong(&v33, a5);
  id v32 = [location[0] objectForKey:InputArray];
  id v31 = [location[0] objectForKey:OutputArray];
  id v30 = [location[0] objectForKey:InputArrayMappingKey];
  id v29 = [location[0] objectForKey:InputArrayMappingValue];
  id v28 = [location[0] objectForKey:DefaultValue];
  if (v32 && v31 && v30 && v29)
  {
    id v26 = -[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v32);
    id v25 = -[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v30);
    id v24 = -[NSMutableDictionary objectForKey:](v36->_coreDictionary, "objectForKey:", v29);
    if (v26 && v25 && v24)
    {
      id v15 = [v25 count];
      if (v15 == [v24 count])
      {
        id v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        for (unint64_t i = 0; i < (unint64_t)[v25 count]; ++i)
        {
          id v14 = [v24 objectAtIndex:i];
          id v13 = [v25 objectAtIndex:i];
          objc_msgSend(v23, "setObject:forKey:", v14);
        }

        double v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t j = 0LL; ; ++j)
        {
          unint64_t v12 = j;
          id v19 = [v26 objectAtIndex:j];
          id v18 = [v23 objectForKey:v19];
          if (v18)
          {
            -[NSMutableArray addObject:](v21, "addObject:", v18);
          }

          else if (v28)
          {
            -[NSMutableArray addObject:](v21, "addObject:", v28);
          }

          objc_storeStrong(&v18, 0LL);
          objc_storeStrong(&v19, 0LL);
        }

        -[NSMutableDictionary setObject:forKey:](v36->_coreDictionary, "setObject:forKey:", v21, v31);
        uint64_t v37 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v27 = 1;
        objc_storeStrong((id *)&v21, 0LL);
        objc_storeStrong(&v23, 0LL);
      }

      else
      {
        double v9 = objc_alloc(&OBJC_CLASS___NSError);
        id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v33, 130LL, 0LL);
        *id v34 = v10;
        uint64_t v37 = 0LL;
        int v27 = 1;
      }
    }

    else
    {
      unint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v33, 129LL, 0LL);
      *id v34 = v8;
      uint64_t v37 = 0LL;
      int v27 = 1;
    }

    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v33, 128LL, 0LL);
    *id v34 = v6;
    uint64_t v37 = 0LL;
    int v27 = 1;
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(location, 0LL);
  return v37;
}

- (id)hashAdamIdsToIndices:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v27 = a4;
  id v26 = 0LL;
  objc_storeStrong(&v26, a5);
  id v25 = [location[0] objectForKey:InputArray];
  id v24 = [location[0] objectForKey:OutputArray];
  id v23 = [location[0] objectForKey:Mapping];
  id v22 = [location[0] objectForKey:DefaultValue];
  if (v25 && v24 && v23)
  {
    id v20 = -[AMDDODMLAttachmentProcessor hashMapForKey:](v29->_attachmentsProcessor, "hashMapForKey:", v23);
    if (v20)
    {
      id v19 = -[NSMutableDictionary objectForKey:](v29->_coreDictionary, "objectForKey:", v25);
      if (v19)
      {
        id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t i = 0LL; ; ++i)
        {
          unint64_t v12 = i;
          id v16 = [v19 objectAtIndex:i];
          id v15 = [v20 objectForKey:v16];
          if (v15)
          {
            -[NSMutableArray addObject:](v18, "addObject:", v15);
          }

          else if (v22)
          {
            -[NSMutableArray addObject:](v18, "addObject:", v22);
          }

          objc_storeStrong(&v15, 0LL);
          objc_storeStrong(&v16, 0LL);
        }

        -[NSMutableDictionary setObject:forKey:](v29->_coreDictionary, "setObject:forKey:", v18, v24);
        id v30 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v21 = 1;
        objc_storeStrong((id *)&v18, 0LL);
      }

      else
      {
        double v9 = objc_alloc(&OBJC_CLASS___NSError);
        id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v26, 30LL, 0LL);
        *int v27 = v10;
        id v30 = 0LL;
        int v21 = 1;
      }

      objc_storeStrong(&v19, 0LL);
    }

    else
    {
      unint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v26, 22LL, 0LL);
      *int v27 = v8;
      id v30 = 0LL;
      int v21 = 1;
    }

    objc_storeStrong(&v20, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v26, 41LL, 0LL);
    *int v27 = v6;
    id v30 = 0LL;
    int v21 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v30;
}

- (id)ifStatement:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  __int128 v112 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v110 = a4;
  id v109 = 0LL;
  objc_storeStrong(&v109, a5);
  id v108 = [location[0] objectForKey:IfStatement];
  id v107 = [location[0] objectForKey:OutputArray];
  id v106 = [location[0] objectForKey:AllowedIterationNumber];
  id v105 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v104 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v103 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v108 || !v107)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v109, 151LL, 0LL);
    *uint64_t v110 = v6;
    id v113 = 0LL;
    int v102 = 1;
    goto LABEL_100;
  }

  if (!v106)
  {
    id v106 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 10000LL);
  }

  id v101 = 0LL;
  uint64_t v100 = 0LL;
  while (1)
  {
    if ([v103 count] || (BOOL v62 = 0, !v101))
    {
      uint64_t v61 = v100;
      BOOL v62 = v61 < (uint64_t)[v106 longValue];
    }

    if (!v62) {
      break;
    }
    ++v100;
    id v99 = [v108 copy];
    id v98 = (char *)[v105 count] - 1;
    for (uint64_t i = 0LL; i < (uint64_t)v98; ++i)
    {
      id v96 = [v105 objectAtIndex:i];
      id v95 = [v99 objectForKey:Statements];
      id v7 = objc_msgSend(v95, "objectAtIndex:", (int)objc_msgSend(v96, "intValue"));
      id v8 = v99;
      id v99 = v7;

      objc_storeStrong(&v95, 0LL);
      objc_storeStrong(&v96, 0LL);
    }

    id v94 = [v105 count];
    id v59 = [v105 lastObject];
    uint64_t v60 = (int)[v59 intValue];

    uint64_t v93 = v60;
    id v92 = [v99 objectForKey:Statements];
    id v91 = [v92 count];
    if (v93 < (uint64_t)v91)
    {
      id v9 = [v92 objectAtIndex:v93];
      id v10 = v99;
      id v99 = v9;

      int v102 = 0;
    }

    else
    {
      [v105 removeLastObject];
      [v104 removeLastObject];
      id v90 = [v103 lastObject];
      [v103 removeLastObject];
      id v89 = [v103 count];
      if ((uint64_t)v89 <= 0)
      {
        objc_storeStrong(&v101, v90);
      }

      else
      {
        id v57 = [v103 lastObject];
        unsigned __int8 v58 = [v57 BOOLValue];

        char v88 = v58 & 1;
        id v87 = [v104 lastObject];
        [v103 removeLastObject];
        if ([v87 isEqual:andKey])
        {
          unsigned __int8 v56 = 0;
          if ((v88 & 1) != 0) {
            unsigned __int8 v56 = [v90 BOOLValue];
          }
          char v88 = v56 & 1;
        }

        else if ([v87 isEqual:orKey])
        {
          unsigned __int8 v55 = 1;
          if ((v88 & 1) == 0) {
            unsigned __int8 v55 = [v90 BOOLValue];
          }
          char v88 = v55 & 1;
        }

        id v49 = v103;
        uint64_t v50 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v88 & 1);
        objc_msgSend(v49, "addObject:");

        id v51 = [v105 lastObject];
        unsigned int v52 = [v51 intValue] + 1;

        unsigned int v86 = v52;
        [v105 removeLastObject];
        id v53 = v105;
        id v54 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v86);
        objc_msgSend(v53, "addObject:");

        objc_storeStrong(&v87, 0LL);
      }

      int v102 = 2;
      objc_storeStrong(&v90, 0LL);
    }

    objc_storeStrong(&v92, 0LL);
    if (!v102)
    {
LABEL_30:
      id v85 = [v99 objectForKey:Operation];
      if (([v85 isEqual:NAKey] & 1) == 0)
      {
        if ([v85 isEqual:andKey])
        {
          [v103 addObject:&off_10002E0C8];
        }

        else if ([v85 isEqual:orKey])
        {
          [v103 addObject:&off_10002E0E0];
        }

        [v104 addObject:v85];
        [v105 addObject:&off_10002E0E0];
        goto LABEL_67;
      }

      id v84 = [v99 objectForKey:Statement];
      id v83 = [v84 objectForKey:InputArray];
      id v82 = -[NSMutableDictionary objectForKey:](v112->_coreDictionary, "objectForKey:", v83);
      id v81 = [v84 objectForKey:ComparisonOp];
      id v80 = [v84 objectForKey:ComparisonNumber];
      id v79 = 0LL;
      if ([v81 isEqual:HasLengthEqualTo])
      {
        id v48 = [v82 count];
        else {
          objc_storeStrong(&v79, &off_10002E0E0);
        }
LABEL_50:
        if ([v103 count])
        {
          id v42 = [v103 lastObject];
          unsigned __int8 v43 = [v42 BOOLValue];

          char v77 = v43 & 1;
          id v76 = [v104 lastObject];
          [v103 removeLastObject];
          if ([v76 isEqual:andKey])
          {
            unsigned __int8 v41 = 0;
            if ((v77 & 1) != 0) {
              unsigned __int8 v41 = [v79 BOOLValue];
            }
            char v77 = v41 & 1;
          }

          else if ([v76 isEqual:orKey])
          {
            unsigned __int8 v40 = 1;
            if ((v77 & 1) == 0) {
              unsigned __int8 v40 = [v79 BOOLValue];
            }
            char v77 = v40 & 1;
          }

          id v34 = v103;
          uint64_t v35 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v77 & 1);
          objc_msgSend(v34, "addObject:");

          id v36 = [v105 lastObject];
          unsigned int v37 = [v36 intValue] + 1;

          unsigned int v75 = v37;
          [v105 removeLastObject];
          id v38 = v105;
          id v39 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v37);
          objc_msgSend(v38, "addObject:");

          objc_storeStrong(&v76, 0LL);
        }

        else
        {
          objc_storeStrong(&v101, v79);
        }

        objc_storeStrong(&v79, 0LL);
        objc_storeStrong(&v80, 0LL);
        objc_storeStrong(&v81, 0LL);
        objc_storeStrong(&v82, 0LL);
        objc_storeStrong(&v83, 0LL);
        objc_storeStrong(&v84, 0LL);
LABEL_67:
        objc_storeStrong(&v85, 0LL);
        int v102 = 0;
        goto LABEL_68;
      }

      id v78 = [v82 firstObject];
      if ([v81 isEqual:IsEqualTo])
      {
        [v78 doubleValue];
        double v47 = v11;
        [v80 doubleValue];
        if (v47 == v12) {
          goto LABEL_47;
        }
LABEL_48:
        objc_storeStrong(&v79, &off_10002E0E0);
      }

      else if ([v81 isEqual:GreaterThan])
      {
        [v78 doubleValue];
        double v46 = v13;
        [v80 doubleValue];
        if (v46 <= v14) {
          goto LABEL_48;
        }
LABEL_47:
        objc_storeStrong(&v79, &off_10002E0C8);
      }

      else
      {
        if ([v81 isEqual:LessThan])
        {
          [v78 doubleValue];
          double v45 = v15;
          [v80 doubleValue];
          if (v45 < v16) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }

        if ([v81 isEqual:NotEqualTo])
        {
          [v78 doubleValue];
          double v44 = v17;
          [v80 doubleValue];
          if (v44 != v18) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
      }

      objc_storeStrong(&v78, 0LL);
      goto LABEL_50;
    }

- (id)generateHashFromInputs:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned int v37 = a4;
  id v36 = 0LL;
  objc_storeStrong(&v36, a5);
  id v35 = [location[0] objectForKey:InputArray];
  id v34 = [location[0] objectForKey:Mapping];
  id v33 = [location[0] objectForKey:MaxHashValue];
  if (v35 && v34 && v33)
  {
    id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    for (unint64_t i = 0LL; ; ++i)
    {
      unint64_t v22 = i;
      id v29 = [v35 objectAtIndex:i];
      id v28 = -[NSMutableDictionary objectForKey:](v39->_coreDictionary, "objectForKey:", v29);
      if (v28)
      {
        [v31 addObjectsFromArray:v28];
        int v32 = 0;
      }

      else
      {
        id v7 = objc_alloc(&OBJC_CLASS___NSError);
        id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v36, 110LL, 0LL);
        *unsigned int v37 = v8;
        unsigned __int8 v40 = 0LL;
        int v32 = 1;
      }

      objc_storeStrong(&v28, 0LL);
      objc_storeStrong(&v29, 0LL);
      if (v32) {
        goto LABEL_21;
      }
    }

    id v21 = [v31 count];
    if (v21 <= [v33 longValue])
    {
      uint64_t v27 = 0LL;
      id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      memset(__b, 0, 0x40uLL);
      id v19 = v31;
      id v20 = [v19 countByEnumeratingWithState:__b objects:v41 count:16];
      if (v20)
      {
        uint64_t v16 = *(void *)__b[2];
        uint64_t v17 = 0LL;
        id v18 = v20;
        while (1)
        {
          uint64_t v15 = v17;
          if (*(void *)__b[2] != v16) {
            objc_enumerationMutation(v19);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v17);
          double v13 = v26;
          double v14 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v27);
          -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:");

          ++v27;
          ++v17;
          if (v15 + 1 >= (unint64_t)v18)
          {
            uint64_t v17 = 0LL;
            id v18 = [v19 countByEnumeratingWithState:__b objects:v41 count:16];
            if (!v18) {
              break;
            }
          }
        }
      }

      id v11 =  -[AMDDODMLAttachmentProcessor setHashMap:forKey:]( v39->_attachmentsProcessor,  "setHashMap:forKey:",  v26,  v34);
      unsigned __int8 v40 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v32 = 1;
      objc_storeStrong((id *)&v26, 0LL);
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v36, 112LL, 0LL);
      *unsigned int v37 = v10;
      unsigned __int8 v40 = 0LL;
      int v32 = 1;
    }

- (id)insertArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v25 = a4;
  id v24 = 0LL;
  objc_storeStrong(&v24, a5);
  id v23 = [location[0] objectForKey:ConstantValue];
  id v22 = [location[0] objectForKey:FinalLength];
  id v21 = [location[0] objectForKey:OutputArray];
  id v20 = [location[0] objectForKey:FinalLengthLikeOtherArray];
  if (!v20) {
    goto LABEL_10;
  }
  id v19 = -[NSMutableDictionary objectForKey:](v27->_coreDictionary, "objectForKey:", v20);
  id v18 = [location[0] objectForKey:FinalLengthLikeOtherArrayMultiplier];
  id v17 = [location[0] objectForKey:FinalLengthLikeOtherArrayOffset];
  if (v19 && v18 && v17)
  {
    id v7 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v17 longValue]
           + (void)[v19 count] * (void)objc_msgSend(v18, "longValue")));
    id v8 = v22;
    id v22 = v7;

    int v16 = 0;
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v24, 42LL, 0LL);
    *id v25 = v6;
    id v28 = 0LL;
    int v16 = 1;
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  if (!v16)
  {
LABEL_10:
    if (v21 && v22 && v23)
    {
      uint64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      -[NSMutableDictionary setObject:forKey:](v27->_coreDictionary, "setObject:forKey:", v15, v21);
      id v28 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v16 = 1;
      objc_storeStrong((id *)&v15, 0LL);
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v24, 42LL, 0LL);
      *id v25 = v10;
      id v28 = 0LL;
      int v16 = 1;
    }
  }

  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v28;
}

- (id)insertRawArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v13 = a4;
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  id v11 = [location[0] objectForKey:InputArray];
  id v10 = [location[0] objectForKey:OutputArray];
  if (v10 && v11)
  {
    -[NSMutableDictionary setObject:forKey:](v15->_coreDictionary, "setObject:forKey:", v11, v10);
    int v16 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v12, 150LL, 0LL);
    id *v13 = v6;
    int v16 = 0LL;
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

- (id)padArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  unsigned int v37 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v35 = a4;
  id v34 = 0LL;
  objc_storeStrong(&v34, a5);
  id v33 = [location[0] objectForKey:InputArray];
  id v32 = [location[0] objectForKey:OutputArray];
  id v31 = [location[0] objectForKey:PaddingValue];
  id v30 = [location[0] objectForKey:PadEnd];
  id v29 = [location[0] objectForKey:FinalLength];
  id v28 = [location[0] objectForKey:FinalLengthLikeOtherArray];
  if (!v28) {
    goto LABEL_15;
  }
  id v27 = -[NSMutableDictionary objectForKey:](v37->_coreDictionary, "objectForKey:", v28);
  id v26 = [location[0] objectForKey:FinalLengthLikeOtherArrayMultiplier];
  id v25 = [location[0] objectForKey:FinalLengthLikeOtherArrayOffset];
  if (v27 && v26 && v25)
  {
    id v7 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v25 longValue]
           + (void)[v27 count] * (void)objc_msgSend(v26, "longValue")));
    id v8 = v29;
    id v29 = v7;

    int v24 = 0;
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v34, 43LL, 0LL);
    *id v35 = v6;
    id v38 = 0LL;
    int v24 = 1;
  }

  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  if (!v24)
  {
LABEL_15:
    if (v33
      && v32
      && v31
      && v30
      && v29
      && (([v30 isEqual:&off_10002E0E0] & 1) != 0
       || ([v30 isEqual:&off_10002E0C8] & 1) != 0))
    {
      id v23 = -[NSMutableDictionary objectForKey:](v37->_coreDictionary, "objectForKey:", v33);
      if (v23)
      {
        id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        int v16 = [v29 longValue];
        int64_t v15 = v16 - (_BYTE *)[v23 count];
        if ([v30 isEqual:&off_10002E0E0])
        {
          for (int64_t i = 0LL; i < v15; ++i)
            -[NSMutableArray addObject:](v22, "addObject:", v31);
        }

        for (unint64_t j = 0; j < (unint64_t)[v23 count]; ++j)
        {
          id v14 = [v23 objectAtIndex:j];
          -[NSMutableArray addObject:](v22, "addObject:");
        }

        if ([v30 isEqual:&off_10002E0C8])
        {
          for (int64_t k = 0LL; k < v15; ++k)
            -[NSMutableArray addObject:](v22, "addObject:", v31);
        }

        -[NSMutableDictionary setObject:forKey:](v37->_coreDictionary, "setObject:forKey:", v22, v32);
        id v38 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v24 = 1;
        objc_storeStrong((id *)&v22, 0LL);
      }

      else
      {
        id v11 = objc_alloc(&OBJC_CLASS___NSError);
        id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v34, 31LL, 0LL);
        *id v35 = v12;
        id v38 = 0LL;
        int v24 = 1;
      }

      objc_storeStrong(&v23, 0LL);
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v34, 43LL, 0LL);
      *id v35 = v10;
      id v38 = 0LL;
      int v24 = 1;
    }
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(location, 0LL);
  return v38;
}

- (id)randomizeArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v109 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v107 = a4;
  id v106 = 0LL;
  objc_storeStrong(&v106, a5);
  id v105 = [location[0] objectForKey:InputArray];
  id v104 = [location[0] objectForKey:OutputArray];
  *((void *)&v103 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&__int128 v103 = [location[0] objectForKey:OtherAffectedVectors];
  if (v103 == 0)
  {
    *((void *)&v103 + 1) = objc_alloc_init(&OBJC_CLASS___NSDictionary);

    *(void *)&__int128 v103 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
LABEL_31:
    if (v105 && v104)
    {
      id v96 = -[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v105);
      if (v96)
      {
        id v95 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        memset(v93, 0, sizeof(v93));
        id v52 = *((id *)&v103 + 1);
        id v53 = [v52 countByEnumeratingWithState:v93 objects:v113 count:16];
        if (v53)
        {
          uint64_t v49 = *(void *)v93[2];
          uint64_t v50 = 0LL;
          id v51 = v53;
          while (1)
          {
            uint64_t v48 = v50;
            if (*(void *)v93[2] != v49) {
              objc_enumerationMutation(v52);
            }
            uint64_t v94 = *(void *)(v93[1] + 8 * v50);
            id v92 = [*((id *)&v103 + 1) objectForKey:v94];
            id v46 = v95;
            double v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            objc_msgSend(v46, "setObject:forKey:");

            objc_storeStrong(&v92, 0LL);
            ++v50;
            if (v48 + 1 >= (unint64_t)v51)
            {
              uint64_t v50 = 0LL;
              id v51 = [v52 countByEnumeratingWithState:v93 objects:v113 count:16];
              if (!v51) {
                break;
              }
            }
          }
        }

        id v91 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t i = 0; i < (unint64_t)[v96 count]; ++i)
        {
          double v45 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", i);
          objc_msgSend(v91, "addObject:");
        }

        id v89 = (char *)[v91 count];
        for (uint64_t j = 0LL; j < (uint64_t)v89; ++j)
        {
          id v87 = &v89[-j];
          uint64_t v86 = arc4random() % (uint64_t)&v89[-j] + j;
          [v91 exchangeObjectAtIndex:j withObjectAtIndex:v86];
        }

        id v85 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t k = 0LL; ; ++k)
        {
          unint64_t v44 = k;
          id v38 = [v91 objectAtIndex:k];
          id v39 = [v38 longValue];

          id v83 = v39;
          id v40 = v85;
          id v41 = [v96 objectAtIndex:v39];
          objc_msgSend(v40, "addObject:");

          memset(v81, 0, sizeof(v81));
          id v42 = *((id *)&v103 + 1);
          id v43 = [v42 countByEnumeratingWithState:v81 objects:v112 count:16];
          if (v43)
          {
            uint64_t v35 = *(void *)v81[2];
            uint64_t v36 = 0LL;
            id v37 = v43;
            while (1)
            {
              uint64_t v34 = v36;
              if (*(void *)v81[2] != v35) {
                objc_enumerationMutation(v42);
              }
              uint64_t v82 = *(void *)(v81[1] + 8 * v36);
              id v80 = [(id)v103 objectForKey:v82];
              id v79 = [*((id *)&v103 + 1) objectForKey:v82];
              id v78 = [v95 objectForKey:v79];
              for (uint64_t m = 0LL; ; ++m)
              {
                uint64_t v33 = m;
                id v31 = v83;
                id v19 = [v80 longValue];
                unint64_t v76 = (void)v31 * (void)v19 + m;
                id v75 = -[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v82);
                unint64_t v32 = v76;
                if (v32 < (unint64_t)[v75 count])
                {
                  id v74 = [v75 objectAtIndex:v76];
                  [v78 addObject:v74];
                  objc_storeStrong(&v74, 0LL);
                  int v102 = 0;
                }

                else
                {
                  id v20 = objc_alloc(&OBJC_CLASS___NSError);
                  id v21 =  -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  v106,  26LL,  0LL);
                  id *v107 = v21;
                  uint64_t v110 = 0LL;
                  int v102 = 1;
                }

                objc_storeStrong(&v75, 0LL);
                if (v102) {
                  goto LABEL_62;
                }
              }

              int v102 = 0;
LABEL_62:
              objc_storeStrong(&v78, 0LL);
              objc_storeStrong(&v79, 0LL);
              objc_storeStrong(&v80, 0LL);
              if (v102) {
                break;
              }
              ++v36;
              if (v34 + 1 >= (unint64_t)v37)
              {
                uint64_t v36 = 0LL;
                id v37 = [v42 countByEnumeratingWithState:v81 objects:v112 count:16];
                if (!v37) {
                  goto LABEL_65;
                }
              }
            }
          }

          else
          {
LABEL_65:
            int v102 = 0;
          }

          if (v102) {
            goto LABEL_75;
          }
        }

        memset(v72, 0, sizeof(v72));
        id v29 = v95;
        id v30 = [v29 countByEnumeratingWithState:v72 objects:v111 count:16];
        if (v30)
        {
          uint64_t v26 = *(void *)v72[2];
          uint64_t v27 = 0LL;
          id v28 = v30;
          while (1)
          {
            uint64_t v25 = v27;
            if (*(void *)v72[2] != v26) {
              objc_enumerationMutation(v29);
            }
            uint64_t v73 = *(void *)(v72[1] + 8 * v27);
            coreDictionary = v109->_coreDictionary;
            id v24 = [v95 objectForKey:v73];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v27;
            if (v25 + 1 >= (unint64_t)v28)
            {
              uint64_t v27 = 0LL;
              id v28 = [v29 countByEnumeratingWithState:v72 objects:v111 count:16];
              if (!v28) {
                break;
              }
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v109->_coreDictionary, "setObject:forKey:", v85, v104);
        uint64_t v110 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v102 = 1;
LABEL_75:
        objc_storeStrong(&v85, 0LL);
        objc_storeStrong(&v91, 0LL);
        objc_storeStrong(&v95, 0LL);
      }

      else
      {
        id v17 = objc_alloc(&OBJC_CLASS___NSError);
        id v18 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v106, 32LL, 0LL);
        id *v107 = v18;
        uint64_t v110 = 0LL;
        int v102 = 1;
      }

      objc_storeStrong(&v96, 0LL);
    }

    else
    {
      int64_t v15 = objc_alloc(&OBJC_CLASS___NSError);
      int v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v106, 44LL, 0LL);
      id *v107 = v16;
      uint64_t v110 = 0LL;
      int v102 = 1;
    }

    goto LABEL_77;
  }

  if (!*((void *)&v103 + 1) || !(void)v103)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v106, 44LL, 0LL);
    id *v107 = v6;
    uint64_t v110 = 0LL;
    int v102 = 1;
    goto LABEL_77;
  }

  memset(__b, 0, sizeof(__b));
  id v68 = *((id *)&v103 + 1);
  id v69 = [v68 countByEnumeratingWithState:__b objects:v115 count:16];
  if (v69)
  {
    uint64_t v65 = *(void *)__b[2];
    uint64_t v66 = 0LL;
    id v67 = v69;
    while (1)
    {
      uint64_t v64 = v66;
      if (*(void *)__b[2] != v65) {
        objc_enumerationMutation(v68);
      }
      uint64_t v101 = *(void *)(__b[1] + 8 * v66);
      id v7 = [(id)v103 objectForKey:v101];
      BOOL v63 = v7 != 0LL;

      if (!v63) {
        break;
      }
      id v61 = [(id)v103 objectForKey:v101];
      BOOL v62 = (uint64_t)[v61 longValue] >= 1;

      if (!v62) {
        break;
      }
      ++v66;
      if (v64 + 1 >= (unint64_t)v67)
      {
        uint64_t v66 = 0LL;
        id v67 = [v68 countByEnumeratingWithState:__b objects:v115 count:16];
        if (!v67) {
          goto LABEL_15;
        }
      }
    }

    id v8 = objc_alloc(&OBJC_CLASS___NSError);
    id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v106, 44LL, 0LL);
    id *v107 = v9;
    uint64_t v110 = 0LL;
    int v102 = 1;
  }

  else
  {
LABEL_15:
    int v102 = 0;
  }

  if (!v102)
  {
    memset(v98, 0, sizeof(v98));
    id v59 = (id)v103;
    id v60 = [v59 countByEnumeratingWithState:v98 objects:v114 count:16];
    if (v60)
    {
      uint64_t v56 = *(void *)v98[2];
      uint64_t v57 = 0LL;
      id v58 = v60;
      while (1)
      {
        uint64_t v55 = v57;
        if (*(void *)v98[2] != v56) {
          objc_enumerationMutation(v59);
        }
        uint64_t v99 = *(void *)(v98[1] + 8 * v57);
        id v10 = [*((id *)&v103 + 1) objectForKey:v99];
        BOOL v54 = v10 != 0LL;

        if (!v54) {
          break;
        }
        id v97 = -[NSMutableDictionary objectForKey:](v109->_coreDictionary, "objectForKey:", v99);
        if (v97)
        {
          int v102 = 0;
        }

        else
        {
          double v13 = objc_alloc(&OBJC_CLASS___NSError);
          id v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v106, 44LL, 0LL);
          id *v107 = v14;
          uint64_t v110 = 0LL;
          int v102 = 1;
        }

        objc_storeStrong(&v97, 0LL);
        if (v102) {
          goto LABEL_30;
        }
        ++v57;
        if (v55 + 1 >= (unint64_t)v58)
        {
          uint64_t v57 = 0LL;
          id v58 = [v59 countByEnumeratingWithState:v98 objects:v114 count:16];
          if (!v58) {
            goto LABEL_29;
          }
        }
      }

      id v11 = objc_alloc(&OBJC_CLASS___NSError);
      id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v106, 44LL, 0LL);
      id *v107 = v12;
      uint64_t v110 = 0LL;
      int v102 = 1;
    }

    else
    {
LABEL_29:
      int v102 = 0;
    }

- (id)replicateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = a4;
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  id v20 = [location[0] objectForKey:InputArray];
  id v19 = [location[0] objectForKey:NumberOfCopies];
  id v18 = [location[0] objectForKey:OutputArray];
  if (v20 && v18 && v19)
  {
    id v16 = -[NSMutableDictionary objectForKey:](v24->_coreDictionary, "objectForKey:", v20);
    if (v16)
    {
      int64_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      for (uint64_t i = 0; i < (uint64_t)[v19 longValue]; ++i)
      {
        for (unint64_t j = 0; j < (unint64_t)[v16 count]; ++j)
        {
          id v10 = [v16 objectAtIndex:j];
          -[NSMutableArray addObject:](v15, "addObject:");
        }
      }

      -[NSMutableDictionary setObject:forKey:](v24->_coreDictionary, "setObject:forKey:", v15, v18);
      uint64_t v25 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v17 = 1;
      objc_storeStrong((id *)&v15, 0LL);
    }

    else
    {
      id v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v21, 33LL, 0LL);
      id *v22 = v8;
      uint64_t v25 = 0LL;
      int v17 = 1;
    }

    objc_storeStrong(&v16, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v21, 45LL, 0LL);
    id *v22 = v6;
    uint64_t v25 = 0LL;
    int v17 = 1;
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
  return v25;
}

- (id)requestData:(id)a3 withUseStubs:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  v133 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v131 = a4;
  v130 = a5;
  id v129 = 0LL;
  objc_storeStrong(&v129, a6);
  id v128 = [location[0] objectForKey:FeatureName];
  id v127 = [location[0] objectForKey:OutputArray];
  id v126 = [location[0] objectForKey:Domain];
  id v125 = [location[0] objectForKey:CustomDescriptor];
  id v124 = [location[0] objectForKey:SchemaVersion];
  id v123 = [location[0] objectForKey:KeySuffix];
  id v122 = [location[0] objectForKey:ValueSuffix];
  id v121 = [location[0] objectForKey:DictOfArraysPrefix];
  id v120 = [location[0] objectForKey:IterateOverNumbers];
  if (v128 && v127 && v126)
  {
    if (!v123 || !v122)
    {
      objc_storeStrong(&v123, DefaultKeySuffix);
      objc_storeStrong(&v122, DefaultValueSuffix);
    }

    if (!v121)
    {
      id v121 = [v127 stringByAppendingString:Underscore];
    }

    id v8 = objc_alloc(&OBJC_CLASS___AMDClientRequestEvent);
    id v118 = [v8 initWithFeatureName:v128 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v126 withCustomDescriptor:v125 andSchemaVersion:v124];
    if (!v118)
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v129, 63LL, 0LL);
      id *v130 = v10;
      v134 = 0LL;
      int v119 = 1;
LABEL_119:
      objc_storeStrong(&v118, 0LL);
      goto LABEL_120;
    }

    id v117 = 0LL;
    if (v131)
    {
      id v11 = -[AMDClient getFeatureStub:](v133->_myAMDClient, "getFeatureStub:", v118);
      id v12 = v117;
      id v117 = v11;
    }

    else
    {
      for (int i = 0; i < 3; ++i)
      {
        id v13 = -[AMDClient getFeature:](v133->_myAMDClient, "getFeature:", v118);
        id v14 = v117;
        id v117 = v13;

        char v114 = 0;
        unsigned __int8 v80 = 0;
        if (v117)
        {
          id v115 = [v117 objectForKey:AMD_CLIENT_STATUS];
          char v114 = 1;
          unsigned __int8 v80 = [v115 isEqual:AMD_CLIENT_STATUS_OK];
        }

        if ((v114 & 1) != 0) {

        }
        if ((v80 & 1) != 0) {
          break;
        }
      }
    }

    if (!v117)
    {
      int64_t v15 = objc_alloc(&OBJC_CLASS___NSError);
      id v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v129, 64LL, 0LL);
      id *v130 = v16;
      v134 = 0LL;
      int v119 = 1;
LABEL_118:
      objc_storeStrong(&v117, 0LL);
      goto LABEL_119;
    }

    id v113 = [v117 objectForKey:AMD_CLIENT_STATUS];
    if (([v113 isEqual:AMD_CLIENT_STATUS_OK] & 1) == 0)
    {
      int v17 = objc_alloc(&OBJC_CLASS___NSError);
      id v18 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v129, 65LL, 0LL);
      id *v130 = v18;
      v134 = 0LL;
      int v119 = 1;
LABEL_117:
      objc_storeStrong(&v113, 0LL);
      goto LABEL_118;
    }

    id v112 = [v117 objectForKey:AMD_CLIENT_DATA];
    if (!v112)
    {
      id v19 = objc_alloc(&OBJC_CLASS___NSError);
      id v20 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", v129, 66LL, 0LL);
      id *v130 = v20;
      v134 = 0LL;
      int v119 = 1;
LABEL_116:
      objc_storeStrong(&v112, 0LL);
      goto LABEL_117;
    }

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v112, v21) & 1) != 0)
    {
      id v111 = v112;
      -[NSMutableDictionary setObject:forKey:](v133->_coreDictionary, "setObject:forKey:", v111, v127);
      v134 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v119 = 1;
      objc_storeStrong(&v111, 0LL);
      goto LABEL_116;
    }

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v112, v22) & 1) == 0)
    {
      uint64_t v36 = objc_alloc(&OBJC_CLASS___NSError);
      id v37 = -[NSError initWithDomain:code:userInfo:](v36, "initWithDomain:code:userInfo:", v129, 108LL, 0LL);
      id *v130 = v37;
      v134 = 0LL;
      int v119 = 1;
      goto LABEL_116;
    }

    id v110 = v112;
    id v109 = 0LL;
    memset(__b, 0, sizeof(__b));
    id v78 = v110;
    id v79 = [v78 countByEnumeratingWithState:__b objects:v139 count:16];
    if (v79)
    {
      uint64_t v75 = *(void *)__b[2];
      uint64_t v76 = 0LL;
      id v77 = v79;
      while (1)
      {
        uint64_t v74 = v76;
        if (*(void *)__b[2] != v75) {
          objc_enumerationMutation(v78);
        }
        uint64_t v108 = *(void *)(__b[1] + 8 * v76);
        id v106 = [v110 objectForKey:v108];
        id v73 = v106;
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v73, v23) & 1) != 0)
        {
          if (!v109)
          {
            objc_storeStrong(&v109, IsAnArray);
LABEL_53:
            int v119 = 0;
            goto LABEL_54;
          }
        }

        else
        {
          id v72 = v106;
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v72, v24) & 1) != 0)
          {
            if (!v109)
            {
              objc_storeStrong(&v109, IsANumber);
              goto LABEL_53;
            }
          }

          else
          {
            id v71 = v106;
            uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v71, v25) & 1) == 0)
            {
              id v28 = objc_alloc(&OBJC_CLASS___NSError);
              id v29 = -[NSError initWithDomain:code:userInfo:](v28, "initWithDomain:code:userInfo:", v129, 108LL, 0LL);
              id *v130 = v29;
              v134 = 0LL;
              int v119 = 1;
              goto LABEL_54;
            }

            if (!v109)
            {
              objc_storeStrong(&v109, IsADictionary);
              goto LABEL_53;
            }
          }
        }

        uint64_t v26 = objc_alloc(&OBJC_CLASS___NSError);
        uint64_t v27 = -[NSError initWithDomain:code:userInfo:](v26, "initWithDomain:code:userInfo:", v129, 107LL, 0LL);
        id *v130 = v27;
        v134 = 0LL;
        int v119 = 1;
LABEL_54:
        objc_storeStrong(&v106, 0LL);
        if (v119) {
          goto LABEL_58;
        }
        ++v76;
        if (v74 + 1 >= (unint64_t)v77)
        {
          uint64_t v76 = 0LL;
          id v77 = [v78 countByEnumeratingWithState:__b objects:v139 count:16];
          if (!v77) {
            break;
          }
        }
      }
    }

    int v119 = 0;
LABEL_58:

    if (v119)
    {
LABEL_113:
      objc_storeStrong(&v109, 0LL);
      objc_storeStrong(&v110, 0LL);
      if (!v119)
      {
        v134 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v119 = 1;
      }

      goto LABEL_116;
    }

    if ([v109 isEqual:IsANumber])
    {
      id v105 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v104 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if (v120 && ([v120 isEqual:IterateOverNumbers] & 1) != 0)
      {
        memset(v102, 0, sizeof(v102));
        id v69 = v110;
        id v70 = [v69 countByEnumeratingWithState:v102 objects:v138 count:16];
        if (v70)
        {
          uint64_t v66 = *(void *)v102[2];
          uint64_t v67 = 0LL;
          id v68 = v70;
          while (1)
          {
            uint64_t v65 = v67;
            if (*(void *)v102[2] != v66) {
              objc_enumerationMutation(v69);
            }
            uint64_t v103 = *(void *)(v102[1] + 8 * v67);
            -[NSMutableArray addObject:](v105, "addObject:", v103);
            id v101 = [v110 objectForKey:v103];
            -[NSMutableArray addObject:](v104, "addObject:", v101);
            objc_storeStrong(&v101, 0LL);
            ++v67;
            if (v65 + 1 >= (unint64_t)v68)
            {
              uint64_t v67 = 0LL;
              id v68 = [v69 countByEnumeratingWithState:v102 objects:v138 count:16];
              if (!v68) {
                break;
              }
            }
          }
        }
      }

      else
      {
        memset(v99, 0, sizeof(v99));
        id v63 = v110;
        id v64 = [v63 countByEnumeratingWithState:v99 objects:v137 count:16];
        if (v64)
        {
          uint64_t v60 = *(void *)v99[2];
          uint64_t v61 = 0LL;
          id v62 = v64;
          while (1)
          {
            uint64_t v59 = v61;
            if (*(void *)v99[2] != v60) {
              objc_enumerationMutation(v63);
            }
            id v100 = *(id *)(v99[1] + 8 * v61);
            uint64_t v57 = v105;
            id v58 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v100 longLongValue]);
            -[NSMutableArray addObject:](v57, "addObject:");

            id v98 = [v110 objectForKey:v100];
            -[NSMutableArray addObject:](v104, "addObject:", v98);
            objc_storeStrong(&v98, 0LL);
            ++v61;
            if (v59 + 1 >= (unint64_t)v62)
            {
              uint64_t v61 = 0LL;
              id v62 = [v63 countByEnumeratingWithState:v99 objects:v137 count:16];
              if (!v62) {
                break;
              }
            }
          }
        }
      }

      id v97 = [v127 stringByAppendingString:v123];
      id v96 = [v127 stringByAppendingString:v122];
      -[NSMutableDictionary setObject:forKey:](v133->_coreDictionary, "setObject:forKey:", v105, v97);
      -[NSMutableDictionary setObject:forKey:](v133->_coreDictionary, "setObject:forKey:", v104, v96);
      objc_storeStrong(&v96, 0LL);
      objc_storeStrong(&v97, 0LL);
      objc_storeStrong((id *)&v104, 0LL);
      objc_storeStrong((id *)&v105, 0LL);
LABEL_112:
      int v119 = 0;
      goto LABEL_113;
    }

    if ([v109 isEqual:IsAnArray])
    {
      memset(v94, 0, sizeof(v94));
      id v55 = v110;
      id v56 = [v55 countByEnumeratingWithState:v94 objects:v136 count:16];
      if (v56)
      {
        uint64_t v52 = *(void *)v94[2];
        uint64_t v53 = 0LL;
        id v54 = v56;
        while (1)
        {
          uint64_t v51 = v53;
          if (*(void *)v94[2] != v52) {
            objc_enumerationMutation(v55);
          }
          uint64_t v95 = *(void *)(v94[1] + 8 * v53);
          id v93 = [v121 stringByAppendingString:v95];
          coreDictionary = v133->_coreDictionary;
          id v50 = [v110 objectForKey:v95];
          -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

          objc_storeStrong(&v93, 0LL);
          ++v53;
          if (v51 + 1 >= (unint64_t)v54)
          {
            uint64_t v53 = 0LL;
            id v54 = [v55 countByEnumeratingWithState:v94 objects:v136 count:16];
            if (!v54) {
              break;
            }
          }
        }
      }

      goto LABEL_112;
    }

    if (([v109 isEqual:IsADictionary] & 1) == 0)
    {
      uint64_t v34 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v35 = -[NSError initWithDomain:code:userInfo:](v34, "initWithDomain:code:userInfo:", v129, 108LL, 0LL);
      id *v130 = v35;
      v134 = 0LL;
      int v119 = 1;
      goto LABEL_113;
    }

    id v92 = [location[0] objectForKey:SubKeyDictOfDicts];
    if (!v92)
    {
      id v30 = objc_alloc(&OBJC_CLASS___NSError);
      id v31 = -[NSError initWithDomain:code:userInfo:](v30, "initWithDomain:code:userInfo:", v129, 62LL, 0LL);
      id *v130 = v31;
      v134 = 0LL;
      int v119 = 1;
      goto LABEL_109;
    }

    id v91 = [location[0] objectForKey:SubKeyForSkippingTypes];
    id v90 = [location[0] objectForKey:TypesToSkip];
    memset(v88, 0, sizeof(v88));
    id v47 = v110;
    id v48 = [v47 countByEnumeratingWithState:v88 objects:v135 count:16];
    if (!v48)
    {
LABEL_105:
      int v119 = 0;
LABEL_106:

      if (!v119) {
        int v119 = 0;
      }
      objc_storeStrong(&v90, 0LL);
      objc_storeStrong(&v91, 0LL);
LABEL_109:
      objc_storeStrong(&v92, 0LL);
      if (v119) {
        goto LABEL_113;
      }
      goto LABEL_112;
    }

    uint64_t v44 = *(void *)v88[2];
    uint64_t v45 = 0LL;
    id v46 = v48;
    while (1)
    {
      uint64_t v43 = v45;
      if (*(void *)v88[2] != v44) {
        objc_enumerationMutation(v47);
      }
      uint64_t v89 = *(void *)(v88[1] + 8 * v45);
      id v87 = [v110 objectForKey:v89];
      if (!v91 && !v90) {
        break;
      }
      if (v91 && v90)
      {
        id v85 = [v87 objectForKey:v91];
        if (([v90 containsObject:v85] & 1) == 0)
        {
          id v84 = [v121 stringByAppendingString:v89];
          id v39 = v133->_coreDictionary;
          id v40 = [v87 objectForKey:v92];
          -[NSMutableDictionary setObject:forKey:](v39, "setObject:forKey:");

          objc_storeStrong(&v84, 0LL);
        }

        objc_storeStrong(&v85, 0LL);
        goto LABEL_101;
      }

      unint64_t v32 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v33 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v129, 62LL, 0LL);
      id *v130 = v33;
      v134 = 0LL;
      int v119 = 1;
LABEL_102:
      objc_storeStrong(&v87, 0LL);
      if (v119) {
        goto LABEL_106;
      }
      ++v45;
      if (v43 + 1 >= (unint64_t)v46)
      {
        uint64_t v45 = 0LL;
        id v46 = [v47 countByEnumeratingWithState:v88 objects:v135 count:16];
        if (!v46) {
          goto LABEL_105;
        }
      }
    }

    id v86 = [v121 stringByAppendingString:v89];
    id v41 = v133->_coreDictionary;
    id v42 = [v87 objectForKey:v92];
    -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:");

    objc_storeStrong(&v86, 0LL);
LABEL_101:
    int v119 = 0;
    goto LABEL_102;
  }

  unint64_t v6 = objc_alloc(&OBJC_CLASS___NSError);
  id v7 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", v129, 62LL, 0LL);
  id *v130 = v7;
  v134 = 0LL;
  int v119 = 1;
LABEL_120:
  objc_storeStrong(&v120, 0LL);
  objc_storeStrong(&v121, 0LL);
  objc_storeStrong(&v122, 0LL);
  objc_storeStrong(&v123, 0LL);
  objc_storeStrong(&v124, 0LL);
  objc_storeStrong(&v125, 0LL);
  objc_storeStrong(&v126, 0LL);
  objc_storeStrong(&v127, 0LL);
  objc_storeStrong(&v128, 0LL);
  objc_storeStrong(&v129, 0LL);
  objc_storeStrong(location, 0LL);
  return v134;
}

- (id)sampleFromDistribution:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v44 = a4;
  id v43 = 0LL;
  objc_storeStrong(&v43, a5);
  id v42 = [location[0] objectForKey:OutputArray];
  id v41 = [location[0] objectForKey:Mapping];
  id v40 = [location[0] objectForKey:NumNegSamps];
  id v39 = [location[0] objectForKey:NumNegSampsLikeOtherArray];
  if (!v39) {
    goto LABEL_10;
  }
  id v38 = -[NSMutableDictionary objectForKey:](v46->_coreDictionary, "objectForKey:", v39);
  id v37 = [location[0] objectForKey:NumNegSampsLikeOtherArrayMultiplier];
  id v36 = [location[0] objectForKey:NumNegSampsLikeOtherArrayOffset];
  if (v38 && v37 && v36)
  {
    id v7 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v36 longValue]
           + (void)[v38 count] * (void)objc_msgSend(v37, "longValue")));
    id v8 = v40;
    id v40 = v7;

    int v35 = 0;
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v43, 46LL, 0LL);
    *uint64_t v44 = v6;
    id v47 = 0LL;
    int v35 = 1;
  }

  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  if (!v35)
  {
LABEL_10:
    if (v42 && v41 && v40)
    {
      id v34 =  -[AMDDODMLAttachmentProcessor negSampleArrayForKey:]( v46->_attachmentsProcessor,  "negSampleArrayForKey:",  v41);
      if (v34)
      {
        id v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (int i = 0; i < (uint64_t)[v40 longValue]; ++i)
        {
          double v31 = (double)(arc4random() % 0x80000000) / 2147483650.0;
          uint64_t v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31);
          objc_msgSend(v33, "addObject:");
        }

        id v30 =  +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"self",  1LL);
        id v48 = v30;
        uint64_t v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v48, 1LL);
        id v29 = objc_msgSend(v33, "sortedArrayUsingDescriptors:");

        uint64_t v28 = 0LL;
        uint64_t v27 = 0LL;
        id v26 = [v29 count];
        uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        while (v27 < (uint64_t)v26)
        {
          id v19 = [v29 objectAtIndexedSubscript:v27];
          [v19 doubleValue];
          double v18 = v13;
          id v17 = [v34 objectAtIndexedSubscript:v28];
          [v17 doubleValue];
          BOOL v20 = v18 > v14;

          if (v20)
          {
            ++v28;
          }

          else
          {
            id v16 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v28);
            -[NSMutableArray addObject:](v25, "addObject:");

            ++v27;
          }
        }

        -[NSMutableDictionary setObject:forKey:](v46->_coreDictionary, "setObject:forKey:", v25, v42);
        id v47 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v35 = 1;
        objc_storeStrong((id *)&v25, 0LL);
        objc_storeStrong(&v29, 0LL);
        objc_storeStrong(&v30, 0LL);
        objc_storeStrong(&v33, 0LL);
      }

      else
      {
        id v11 = objc_alloc(&OBJC_CLASS___NSError);
        id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v43, 23LL, 0LL);
        *uint64_t v44 = v12;
        id v47 = 0LL;
        int v35 = 1;
      }

      objc_storeStrong(&v34, 0LL);
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v43, 46LL, 0LL);
      *uint64_t v44 = v10;
      id v47 = 0LL;
      int v35 = 1;
    }
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(location, 0LL);
  return v47;
}

- (id)sortArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v115 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v113 = a4;
  id v112 = 0LL;
  objc_storeStrong(&v112, a5);
  id v111 = [location[0] objectForKey:InputArray];
  id v110 = [location[0] objectForKey:OutputArray];
  *((void *)&v109 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&__int128 v109 = [location[0] objectForKey:OtherAffectedVectors];
  if (v109 == 0)
  {
    *((void *)&v109 + 1) = objc_alloc_init(&OBJC_CLASS___NSDictionary);

    *(void *)&__int128 v109 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
LABEL_31:
    if (v111 && v110)
    {
      id v102 = -[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v111);
      if (v102)
      {
        id v101 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        memset(v99, 0, sizeof(v99));
        id v57 = *((id *)&v109 + 1);
        id v58 = [v57 countByEnumeratingWithState:v99 objects:v120 count:16];
        if (v58)
        {
          uint64_t v54 = *(void *)v99[2];
          uint64_t v55 = 0LL;
          id v56 = v58;
          while (1)
          {
            uint64_t v53 = v55;
            if (*(void *)v99[2] != v54) {
              objc_enumerationMutation(v57);
            }
            uint64_t v100 = *(void *)(v99[1] + 8 * v55);
            id v98 = [*((id *)&v109 + 1) objectForKey:v100];
            id v51 = v101;
            uint64_t v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            objc_msgSend(v51, "setObject:forKey:");

            objc_storeStrong(&v98, 0LL);
            ++v55;
            if (v53 + 1 >= (unint64_t)v56)
            {
              uint64_t v55 = 0LL;
              id v56 = [v57 countByEnumeratingWithState:v99 objects:v120 count:16];
              if (!v56) {
                break;
              }
            }
          }
        }

        id v97 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t i = 0LL; ; ++i)
        {
          unint64_t v50 = i;
          id v49 = [v102 objectAtIndex:i];
          v119[0] = v49;
          id v48 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", i);
          v119[1] = v48;
          uint64_t v95 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v119, 2LL);

          [v97 addObject:v95];
          objc_storeStrong((id *)&v95, 0LL);
        }

        id v94 = [v97 sortedArrayUsingComparator:&stru_10002C628];
        id v93 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t j = 0LL; ; ++j)
        {
          unint64_t v47 = j;
          id v91 = [v94 objectAtIndex:j];
          id v45 = v93;
          id v46 = [v91 lastObject];
          objc_msgSend(v45, "addObject:");

          objc_storeStrong(&v91, 0LL);
        }

        id v90 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        for (unint64_t k = 0LL; ; ++k)
        {
          unint64_t v44 = k;
          id v38 = [v93 objectAtIndex:k];
          id v39 = [v38 longValue];

          id v88 = v39;
          id v40 = v90;
          id v41 = [v102 objectAtIndex:v39];
          objc_msgSend(v40, "addObject:");

          memset(v86, 0, sizeof(v86));
          id v42 = *((id *)&v109 + 1);
          id v43 = [v42 countByEnumeratingWithState:v86 objects:v118 count:16];
          if (v43)
          {
            uint64_t v35 = *(void *)v86[2];
            uint64_t v36 = 0LL;
            id v37 = v43;
            while (1)
            {
              uint64_t v34 = v36;
              if (*(void *)v86[2] != v35) {
                objc_enumerationMutation(v42);
              }
              uint64_t v87 = *(void *)(v86[1] + 8 * v36);
              id v85 = [(id)v109 objectForKey:v87];
              id v84 = [*((id *)&v109 + 1) objectForKey:v87];
              id v83 = [v101 objectForKey:v84];
              for (uint64_t m = 0LL; ; ++m)
              {
                uint64_t v33 = m;
                id v31 = v88;
                id v19 = [v85 longValue];
                unint64_t v81 = (void)v31 * (void)v19 + m;
                id v80 = -[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v87);
                unint64_t v32 = v81;
                if (v32 < (unint64_t)[v80 count])
                {
                  id v79 = [v80 objectAtIndex:v81];
                  [v83 addObject:v79];
                  objc_storeStrong(&v79, 0LL);
                  int v108 = 0;
                }

                else
                {
                  BOOL v20 = objc_alloc(&OBJC_CLASS___NSError);
                  uint64_t v21 =  -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  v112,  26LL,  0LL);
                  *id v113 = v21;
                  id v116 = 0LL;
                  int v108 = 1;
                }

                objc_storeStrong(&v80, 0LL);
                if (v108) {
                  goto LABEL_62;
                }
              }

              int v108 = 0;
LABEL_62:
              objc_storeStrong(&v83, 0LL);
              objc_storeStrong(&v84, 0LL);
              objc_storeStrong(&v85, 0LL);
              if (v108) {
                break;
              }
              ++v36;
              if (v34 + 1 >= (unint64_t)v37)
              {
                uint64_t v36 = 0LL;
                id v37 = [v42 countByEnumeratingWithState:v86 objects:v118 count:16];
                if (!v37) {
                  goto LABEL_65;
                }
              }
            }
          }

          else
          {
LABEL_65:
            int v108 = 0;
          }

          if (v108) {
            goto LABEL_75;
          }
        }

        memset(v77, 0, sizeof(v77));
        id v29 = v101;
        id v30 = [v29 countByEnumeratingWithState:v77 objects:v117 count:16];
        if (v30)
        {
          uint64_t v26 = *(void *)v77[2];
          uint64_t v27 = 0LL;
          id v28 = v30;
          while (1)
          {
            uint64_t v25 = v27;
            if (*(void *)v77[2] != v26) {
              objc_enumerationMutation(v29);
            }
            uint64_t v78 = *(void *)(v77[1] + 8 * v27);
            coreDictionary = v115->_coreDictionary;
            id v24 = [v101 objectForKey:v78];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v27;
            if (v25 + 1 >= (unint64_t)v28)
            {
              uint64_t v27 = 0LL;
              id v28 = [v29 countByEnumeratingWithState:v77 objects:v117 count:16];
              if (!v28) {
                break;
              }
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v115->_coreDictionary, "setObject:forKey:", v90, v110);
        id v116 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v108 = 1;
LABEL_75:
        objc_storeStrong(&v90, 0LL);
        objc_storeStrong(&v93, 0LL);
        objc_storeStrong(&v94, 0LL);
        objc_storeStrong(&v97, 0LL);
        objc_storeStrong(&v101, 0LL);
      }

      else
      {
        id v17 = objc_alloc(&OBJC_CLASS___NSError);
        double v18 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v112, 104LL, 0LL);
        *id v113 = v18;
        id v116 = 0LL;
        int v108 = 1;
      }

      objc_storeStrong(&v102, 0LL);
    }

    else
    {
      int64_t v15 = objc_alloc(&OBJC_CLASS___NSError);
      id v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v112, 103LL, 0LL);
      *id v113 = v16;
      id v116 = 0LL;
      int v108 = 1;
    }

    goto LABEL_77;
  }

  if (!*((void *)&v109 + 1) || !(void)v109)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v112, 103LL, 0LL);
    *id v113 = v6;
    id v116 = 0LL;
    int v108 = 1;
    goto LABEL_77;
  }

  memset(__b, 0, sizeof(__b));
  id v73 = *((id *)&v109 + 1);
  id v74 = [v73 countByEnumeratingWithState:__b objects:v122 count:16];
  if (v74)
  {
    uint64_t v70 = *(void *)__b[2];
    uint64_t v71 = 0LL;
    id v72 = v74;
    while (1)
    {
      uint64_t v69 = v71;
      if (*(void *)__b[2] != v70) {
        objc_enumerationMutation(v73);
      }
      uint64_t v107 = *(void *)(__b[1] + 8 * v71);
      id v7 = [(id)v109 objectForKey:v107];
      BOOL v68 = v7 != 0LL;

      if (!v68) {
        break;
      }
      id v66 = [(id)v109 objectForKey:v107];
      BOOL v67 = (uint64_t)[v66 longValue] >= 1;

      if (!v67) {
        break;
      }
      ++v71;
      if (v69 + 1 >= (unint64_t)v72)
      {
        uint64_t v71 = 0LL;
        id v72 = [v73 countByEnumeratingWithState:__b objects:v122 count:16];
        if (!v72) {
          goto LABEL_15;
        }
      }
    }

    id v8 = objc_alloc(&OBJC_CLASS___NSError);
    id v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v112, 103LL, 0LL);
    *id v113 = v9;
    id v116 = 0LL;
    int v108 = 1;
  }

  else
  {
LABEL_15:
    int v108 = 0;
  }

  if (!v108)
  {
    memset(v104, 0, sizeof(v104));
    id v64 = (id)v109;
    id v65 = [v64 countByEnumeratingWithState:v104 objects:v121 count:16];
    if (v65)
    {
      uint64_t v61 = *(void *)v104[2];
      uint64_t v62 = 0LL;
      id v63 = v65;
      while (1)
      {
        uint64_t v60 = v62;
        if (*(void *)v104[2] != v61) {
          objc_enumerationMutation(v64);
        }
        uint64_t v105 = *(void *)(v104[1] + 8 * v62);
        id v10 = [*((id *)&v109 + 1) objectForKey:v105];
        BOOL v59 = v10 != 0LL;

        if (!v59) {
          break;
        }
        id v103 = -[NSMutableDictionary objectForKey:](v115->_coreDictionary, "objectForKey:", v105);
        if (v103)
        {
          int v108 = 0;
        }

        else
        {
          double v13 = objc_alloc(&OBJC_CLASS___NSError);
          double v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v112, 103LL, 0LL);
          *id v113 = v14;
          id v116 = 0LL;
          int v108 = 1;
        }

        objc_storeStrong(&v103, 0LL);
        if (v108) {
          goto LABEL_30;
        }
        ++v62;
        if (v60 + 1 >= (unint64_t)v63)
        {
          uint64_t v62 = 0LL;
          id v63 = [v64 countByEnumeratingWithState:v104 objects:v121 count:16];
          if (!v63) {
            goto LABEL_29;
          }
        }
      }

      id v11 = objc_alloc(&OBJC_CLASS___NSError);
      id v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v112, 103LL, 0LL);
      *id v113 = v12;
      id v116 = 0LL;
      int v108 = 1;
    }

    else
    {
LABEL_29:
      int v108 = 0;
    }

- (id)spliceArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v38 = a4;
  id v37 = 0LL;
  objc_storeStrong(&v37, a5);
  id v36 = [location[0] objectForKey:Starting];
  id v35 = [location[0] objectForKey:Ending];
  id v34 = [location[0] objectForKey:InputArray];
  id v33 = [location[0] objectForKey:OutputArray];
  id v32 = [location[0] objectForKey:StartingLikeOtherArray];
  id v31 = [location[0] objectForKey:EndingLikeOtherArray];
  if (!v32) {
    goto LABEL_34;
  }
  id v30 = -[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v32);
  id v29 = [location[0] objectForKey:StartingLikeOtherArrayMultiplier];
  id v28 = [location[0] objectForKey:StartingLikeOtherArrayOffset];
  if (v30 && v29 && v28)
  {
    id v7 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v28 longValue]
           + (void)[v30 count] * (void)objc_msgSend(v29, "longValue")));
    id v8 = v36;
    id v36 = v7;

    int v27 = 0;
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v37, 47LL, 0LL);
    *id v38 = v6;
    id v41 = 0LL;
    int v27 = 1;
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  if (!v27)
  {
LABEL_34:
    if (!v31) {
      goto LABEL_18;
    }
    id v26 = -[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v31);
    id v25 = [location[0] objectForKey:EndingLikeOtherArrayMultiplier];
    id v24 = [location[0] objectForKey:EndingLikeOtherArrayOffset];
    if (v26 && v25 && v24)
    {
      id v11 = objc_retainAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v24 longValue]
              + (void)[v26 count] * (void)objc_msgSend(v25, "longValue")));
      id v12 = v35;
      id v35 = v11;

      int v27 = 0;
    }

    else
    {
      id v9 = objc_alloc(&OBJC_CLASS___NSError);
      id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v37, 47LL, 0LL);
      *id v38 = v10;
      id v41 = 0LL;
      int v27 = 1;
    }

    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v25, 0LL);
    objc_storeStrong(&v26, 0LL);
    if (!v27)
    {
LABEL_18:
      if (v34 && v33 && v36 && v35)
      {
        id v23 = -[NSMutableDictionary objectForKey:](v40->_coreDictionary, "objectForKey:", v34);
        if (v23)
        {
          uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          for (uint64_t i = 0; i < (unint64_t)[v23 count]; ++i)
          {
            if (i >= (uint64_t)[v36 longValue] && i < (uint64_t)objc_msgSend(v35, "longValue"))
            {
              id v18 = [v23 objectAtIndex:i];
              -[NSMutableArray addObject:](v22, "addObject:");
            }
          }

          -[NSMutableDictionary setObject:forKey:](v40->_coreDictionary, "setObject:forKey:", v22, v33);
          id v41 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
          int v27 = 1;
          objc_storeStrong((id *)&v22, 0LL);
        }

        else
        {
          int64_t v15 = objc_alloc(&OBJC_CLASS___NSError);
          id v16 = -[NSError initWithDomain:code:userInfo:](v15, "initWithDomain:code:userInfo:", v37, 34LL, 0LL);
          *id v38 = v16;
          id v41 = 0LL;
          int v27 = 1;
        }

        objc_storeStrong(&v23, 0LL);
      }

      else
      {
        double v13 = objc_alloc(&OBJC_CLASS___NSError);
        double v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v37, 47LL, 0LL);
        *id v38 = v14;
        id v41 = 0LL;
        int v27 = 1;
      }
    }
  }

  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(location, 0LL);
  return v41;
}

- (id)strideCopyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = a4;
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  id v26 = [location[0] objectForKey:StridesForSample];
  id v25 = [location[0] objectForKey:ElementsInSample];
  id v24 = [location[0] objectForKey:InputArray];
  id v23 = [location[0] objectForKey:OutputArray];
  id v22 = [location[0] objectForKey:Starting];
  if (!v22) {
    objc_storeStrong(&v22, &off_10002E0E0);
  }
  if (v24 && v23 && v25 && v26)
  {
    id v20 = -[NSMutableDictionary objectForKey:](v30->_coreDictionary, "objectForKey:", v24);
    if (v20)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v12 = [v20 count];
      int64_t v18 = v12 - (_BYTE *)[v25 longValue];
      for (uint64_t i = (uint64_t)[v22 longValue]; i <= v18; i += (uint64_t)v9)
      {
        for (uint64_t j = 0LL; ; ++j)
        {
          uint64_t v11 = j;
          id v15 = [v20 objectAtIndex:i + j];
          -[NSMutableArray addObject:](v19, "addObject:", v15);
          objc_storeStrong(&v15, 0LL);
        }

        id v9 = [v26 longValue];
      }

      -[NSMutableDictionary setObject:forKey:](v30->_coreDictionary, "setObject:forKey:", v19, v23);
      id v31 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
      int v21 = 1;
      objc_storeStrong((id *)&v19, 0LL);
    }

    else
    {
      id v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v27, 35LL, 0LL);
      *id v28 = v8;
      id v31 = 0LL;
      int v21 = 1;
    }

    objc_storeStrong(&v20, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v27, 48LL, 0LL);
    *id v28 = v6;
    id v31 = 0LL;
    int v21 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v31;
}

- (id)strideCopyAndSplitArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v66 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v64 = a4;
  id v63 = 0LL;
  objc_storeStrong(&v63, a5);
  id v62 = [location[0] objectForKey:StridesForSample];
  id v61 = [location[0] objectForKey:ElementsInSample];
  id v60 = [location[0] objectForKey:InputArray];
  id v59 = [location[0] objectForKey:Starting];
  if (!v59) {
    objc_storeStrong(&v59, &off_10002E0E0);
  }
  id v58 = [location[0] objectForKey:SplitArrayInstructions];
  if (v58 && v60 && v61 && v62)
  {
    id v56 = 0LL;
    for (unint64_t i = 0LL; ; ++i)
    {
      unint64_t v33 = i;
      id v54 = [v58 objectAtIndex:i];
      if ([v54 count] == (id)2)
      {
        id v53 = [v54 objectAtIndex:1];
        if ((uint64_t)[v53 longValue] >= 1)
        {
          uint64_t v11 = (char *)[v53 longValue];
          id v56 = &v11[(void)v56];
          int v57 = 0;
        }

        else
        {
          id v9 = objc_alloc(&OBJC_CLASS___NSError);
          id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v63, 87LL, 0LL);
          *id v64 = v10;
          BOOL v67 = 0LL;
          int v57 = 1;
        }

        objc_storeStrong(&v53, 0LL);
      }

      else
      {
        id v7 = objc_alloc(&OBJC_CLASS___NSError);
        id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v63, 87LL, 0LL);
        *id v64 = v8;
        BOOL v67 = 0LL;
        int v57 = 1;
      }

      objc_storeStrong(&v54, 0LL);
      if (v57) {
        goto LABEL_42;
      }
    }

    id v32 = v56;
    if (v32 == [v61 longValue])
    {
      id v52 = -[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v60);
      if (v52)
      {
        id v51 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        for (unint64_t j = 0LL; ; ++j)
        {
          unint64_t v31 = j;
          id v49 = [v58 objectAtIndex:j];
          id v48 = [v49 objectAtIndex:0];
          id v29 = v51;
          id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          objc_msgSend(v29, "setObject:forKey:");

          objc_storeStrong(&v48, 0LL);
          objc_storeStrong(&v49, 0LL);
        }

        id v28 = (char *)[v52 count];
        unint64_t v47 = &v28[-(int)[v61 intValue]];
        for (unint64_t k = (char *)[v59 longValue]; (uint64_t)k <= (uint64_t)v47; unint64_t k = &v16[(void)k])
        {
          id v45 = k;
          for (unint64_t m = 0LL; ; ++m)
          {
            unint64_t v27 = m;
            id v43 = [v58 objectAtIndex:m];
            id v42 = [v43 objectAtIndex:0];
            id v41 = [v43 objectAtIndex:1];
            id v40 = [v51 objectForKey:v42];
            for (uint64_t n = 0LL; ; ++n)
            {
              uint64_t v26 = n;
              id v38 = [v52 objectAtIndex:v45];
              [v40 addObject:v38];
              ++v45;
              objc_storeStrong(&v38, 0LL);
            }

            objc_storeStrong(&v40, 0LL);
            objc_storeStrong(&v41, 0LL);
            objc_storeStrong(&v42, 0LL);
            objc_storeStrong(&v43, 0LL);
          }

          id v16 = (char *)[v62 longValue];
        }

        memset(__b, 0, sizeof(__b));
        id v24 = v51;
        id v25 = [v24 countByEnumeratingWithState:__b objects:v68 count:16];
        if (v25)
        {
          uint64_t v21 = *(void *)__b[2];
          uint64_t v22 = 0LL;
          id v23 = v25;
          while (1)
          {
            uint64_t v20 = v22;
            if (*(void *)__b[2] != v21) {
              objc_enumerationMutation(v24);
            }
            uint64_t v37 = *(void *)(__b[1] + 8 * v22);
            coreDictionary = v66->_coreDictionary;
            id v19 = [v51 objectForKey:v37];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v22;
            if (v20 + 1 >= (unint64_t)v23)
            {
              uint64_t v22 = 0LL;
              id v23 = [v24 countByEnumeratingWithState:__b objects:v68 count:16];
              if (!v23) {
                break;
              }
            }
          }
        }

        BOOL v67 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
        int v57 = 1;
        objc_storeStrong(&v51, 0LL);
      }

      else
      {
        double v14 = objc_alloc(&OBJC_CLASS___NSError);
        id v15 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", v63, 84LL, 0LL);
        *id v64 = v15;
        BOOL v67 = 0LL;
        int v57 = 1;
      }

      objc_storeStrong(&v52, 0LL);
    }

    else
    {
      id v12 = objc_alloc(&OBJC_CLASS___NSError);
      double v13 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", v63, 87LL, 0LL);
      *id v64 = v13;
      BOOL v67 = 0LL;
      int v57 = 1;
    }
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v63, 87LL, 0LL);
    *id v64 = v6;
    BOOL v67 = 0LL;
    int v57 = 1;
  }

- (id)twoArrayMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v59 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v57 = a4;
  id v56 = 0LL;
  objc_storeStrong(&v56, a5);
  id v55 = [location[0] objectForKey:InputArray];
  id v54 = [location[0] objectForKey:OutputArray];
  id v53 = [location[0] objectForKey:SecondArray];
  id v52 = [location[0] objectForKey:Operation];
  if (!v55 || !v54 || !v53 || !v52)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v56, 88LL, 0LL);
    *int v57 = v6;
    id v60 = 0LL;
    int v51 = 1;
    goto LABEL_35;
  }

  id v50 = -[NSMutableDictionary objectForKey:](v59->_coreDictionary, "objectForKey:", v55);
  id v49 = -[NSMutableDictionary objectForKey:](v59->_coreDictionary, "objectForKey:", v53);
  if (!v50 || !v49)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSError);
    id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v56, 89LL, 0LL);
    *int v57 = v8;
    id v60 = 0LL;
    int v51 = 1;
    goto LABEL_34;
  }

  id v41 = [v50 count];
  if (v41 != [v49 count])
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSError);
    id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v56, 93LL, 0LL);
    *int v57 = v10;
    id v60 = 0LL;
    int v51 = 1;
    goto LABEL_34;
  }

  id v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  for (unint64_t i = 0LL; ; ++i)
  {
    unint64_t v40 = i;
    id v46 = [v50 objectAtIndex:i];
    id v45 = [v49 objectAtIndex:i];
    [v45 doubleValue];
    if (v11 == 0.0
      && (([v52 isEqual:Modulo] & 1) != 0
       || ([v52 isEqual:Division] & 1) != 0))
    {
      id v12 = objc_alloc(&OBJC_CLASS___NSError);
      double v13 = -[NSError initWithDomain:code:userInfo:](v12, "initWithDomain:code:userInfo:", v56, 90LL, 0LL);
      *int v57 = v13;
      id v60 = 0LL;
      int v51 = 1;
      goto LABEL_30;
    }

    id v44 = 0LL;
    if ([v52 isEqual:Modulo])
    {
      uint64_t v39 = (uint64_t)[v46 longValue];
      double v14 =  +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  v39 % (uint64_t)[v45 longValue]);
      id v15 = v44;
      id v44 = v14;

LABEL_28:
      [v48 addObject:v44];
      int v51 = 0;
      goto LABEL_29;
    }

    if ([v52 isEqual:Division])
    {
      [v46 doubleValue];
      double v38 = v16;
      [v45 doubleValue];
      int64_t v18 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v38 / v17);
      id v19 = v44;
      id v44 = v18;

      goto LABEL_28;
    }

    if ([v52 isEqual:Multiplication])
    {
      [v46 doubleValue];
      double v37 = v20;
      [v45 doubleValue];
      uint64_t v22 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v37 * v21);
      id v23 = v44;
      id v44 = v22;

      goto LABEL_28;
    }

    if ([v52 isEqual:Addition])
    {
      [v46 doubleValue];
      double v36 = v24;
      [v45 doubleValue];
      uint64_t v26 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v36 + v25);
      id v27 = v44;
      id v44 = v26;

      goto LABEL_28;
    }

    if ([v52 isEqual:Subtraction])
    {
      [v46 doubleValue];
      double v35 = v28;
      [v45 doubleValue];
      id v30 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35 - v29);
      id v31 = v44;
      id v44 = v30;

      goto LABEL_28;
    }

    id v32 = objc_alloc(&OBJC_CLASS___NSError);
    unint64_t v33 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v56, 83LL, 0LL);
    *int v57 = v33;
    id v60 = 0LL;
    int v51 = 1;
LABEL_29:
    objc_storeStrong(&v44, 0LL);
LABEL_30:
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v46, 0LL);
    if (v51) {
      goto LABEL_33;
    }
  }

  -[NSMutableDictionary setObject:forKey:](v59->_coreDictionary, "setObject:forKey:", v48, v54);
  id v60 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
  int v51 = 1;
LABEL_33:
  objc_storeStrong(&v48, 0LL);
LABEL_34:
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
LABEL_35:
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v53, 0LL);
  objc_storeStrong(&v54, 0LL);
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(location, 0LL);
  return v60;
}

- (id)windowFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v66 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v64 = a4;
  id v63 = 0LL;
  objc_storeStrong(&v63, a5);
  id v62 = [location[0] objectForKey:WindowSize];
  id v61 = [location[0] objectForKey:InputArray];
  id v60 = [location[0] objectForKey:FeatureOutput];
  id v59 = [location[0] objectForKey:ContextOutput];
  id v58 = [location[0] objectForKey:LabelOutput];
  id v57 = [location[0] objectForKey:TimeStampArrayKey];
  id v56 = [location[0] objectForKey:TimeStampMaxDistKey];
  if (v62 && v61 && v60 && v59 && v58)
  {
    id v54 = -[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v61);
    if (!v54)
    {
      id v7 = objc_alloc(&OBJC_CLASS___NSError);
      id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", v63, 36LL, 0LL);
      *id v64 = v8;
      BOOL v67 = 0LL;
      int v55 = 1;
LABEL_39:
      objc_storeStrong(&v54, 0LL);
      goto LABEL_40;
    }

    id v53 = 0LL;
    if (v57)
    {
      if (!v56 || ([v56 doubleValue], v11 <= 0.0))
      {
        id v9 = objc_alloc(&OBJC_CLASS___NSError);
        id v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v63, 49LL, 0LL);
        *id v64 = v10;
        BOOL v67 = 0LL;
        int v55 = 1;
LABEL_38:
        objc_storeStrong(&v53, 0LL);
        goto LABEL_39;
      }

      id v12 = -[NSMutableDictionary objectForKey:](v66->_coreDictionary, "objectForKey:", v57);
      id v13 = v53;
      id v53 = v12;

      if (!v53)
      {
        double v14 = objc_alloc(&OBJC_CLASS___NSError);
        id v15 = -[NSError initWithDomain:code:userInfo:](v14, "initWithDomain:code:userInfo:", v63, 36LL, 0LL);
        *id v64 = v15;
        BOOL v67 = 0LL;
        int v55 = 1;
        goto LABEL_38;
      }

      id v34 = [v53 count];
      if (v34 != [v54 count])
      {
        double v16 = objc_alloc(&OBJC_CLASS___NSError);
        double v17 = -[NSError initWithDomain:code:userInfo:](v16, "initWithDomain:code:userInfo:", v63, 96LL, 0LL);
        *id v64 = v17;
        BOOL v67 = 0LL;
        int v55 = 1;
        goto LABEL_38;
      }
    }

    id v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    int v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    for (unint64_t i = 0LL; ; ++i)
    {
      unint64_t v33 = i;
      id v48 = [v54 objectAtIndex:i];
      for (uint64_t j = 1LL; ; ++j)
      {
        uint64_t v32 = j;
        if ((uint64_t)(i - j) >= 0)
        {
          uint64_t v46 = 1LL;
          if (v53)
          {
            id v45 = [v53 objectAtIndex:i];
            id v44 = [v53 objectAtIndex:i - j];
            [v45 doubleValue];
            double v31 = v18;
            [v44 doubleValue];
            double v43 = vabdd_f64(v31, v19);
            [v56 doubleValue];
            if (v20 < v43) {
              uint64_t v46 = 0LL;
            }
            objc_storeStrong(&v44, 0LL);
            objc_storeStrong(&v45, 0LL);
          }

          if (v46 == 1)
          {
            id v42 = [v54 objectAtIndex:i - j];
            -[NSMutableArray addObject:](v50, "addObject:", v48);
            -[NSMutableArray addObject:](v52, "addObject:", v42);
            double v29 = v51;
            id v30 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
            -[NSMutableArray addObject:](v29, "addObject:");

            objc_storeStrong(&v42, 0LL);
          }
        }

        unint64_t v28 = i + j;
        if (v28 < (unint64_t)[v54 count])
        {
          uint64_t v41 = 1LL;
          if (v53)
          {
            id v40 = [v53 objectAtIndex:i];
            id v39 = [v53 objectAtIndex:i + j];
            [v40 doubleValue];
            double v27 = v21;
            [v39 doubleValue];
            double v38 = vabdd_f64(v27, v22);
            [v56 doubleValue];
            if (v23 < v38) {
              uint64_t v41 = 0LL;
            }
            objc_storeStrong(&v39, 0LL);
            objc_storeStrong(&v40, 0LL);
          }

          if (v41 == 1)
          {
            id v37 = [v54 objectAtIndex:i + j];
            -[NSMutableArray addObject:](v50, "addObject:", v48);
            -[NSMutableArray addObject:](v52, "addObject:", v37);
            double v25 = v51;
            uint64_t v26 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL);
            -[NSMutableArray addObject:](v25, "addObject:");

            objc_storeStrong(&v37, 0LL);
          }
        }
      }

      objc_storeStrong(&v48, 0LL);
    }

    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v50, v60);
    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v52, v59);
    -[NSMutableDictionary setObject:forKey:](v66->_coreDictionary, "setObject:forKey:", v51, v58);
    BOOL v67 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", 1LL);
    int v55 = 1;
    objc_storeStrong((id *)&v50, 0LL);
    objc_storeStrong((id *)&v51, 0LL);
    objc_storeStrong((id *)&v52, 0LL);
    goto LABEL_38;
  }

  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
  unint64_t v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", v63, 49LL, 0LL);
  *id v64 = v6;
  BOOL v67 = 0LL;
  int v55 = 1;
LABEL_40:
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(location, 0LL);
  return v67;
}

- (void).cxx_destruct
{
}

@end