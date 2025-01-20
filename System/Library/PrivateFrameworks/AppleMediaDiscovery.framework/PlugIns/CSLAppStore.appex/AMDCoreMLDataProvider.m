@interface AMDCoreMLDataProvider
- (AMDCoreMLDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5;
- (id)fetchData:(int64_t)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)count;
- (int64_t)numberOfDataPoints;
- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3;
@end

@implementation AMDCoreMLDataProvider

- (AMDCoreMLDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
{
  v12 = self;
  SEL v11 = a2;
  int64_t v10 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v8 = 0LL;
  objc_storeStrong(&v8, a5);
  v12->_length = v10;
  objc_storeStrong((id *)&v12->_inputDictionary, v8);
  objc_storeStrong((id *)&v12->_featureSizeMap, location);
  v12->_currentIndex = 0LL;
  v7 = v12;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v7;
}

- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3
{
  return (self->_length - self->_length % a3) / a3;
}

- (int64_t)numberOfDataPoints
{
  return self->_length;
}

- (int64_t)count
{
  return self->_length;
}

- (id)fetchData:(int64_t)a3 error:(id *)a4 errorDomain:(id)a5
{
  v46 = self;
  SEL v45 = a2;
  int64_t v44 = a3;
  v43 = a4;
  id location = 0LL;
  objc_storeStrong(&location, a5);
  id v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  obj = v46->_featureSizeMap;
  NSUInteger v25 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v53,  16LL);
  if (v25)
  {
    uint64_t v21 = *(void *)__b[2];
    uint64_t v22 = 0LL;
    NSUInteger v23 = v25;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)__b[2] != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v40 = *(void *)(__b[1] + 8 * v22);
      id v38 = -[NSDictionary objectForKey:](v46->_featureSizeMap, "objectForKey:", v40);
      if (v38)
      {
        id v36 = -[NSDictionary objectForKey:](v46->_inputDictionary, "objectForKey:", v40);
        if (v36)
        {
          int64_t currentIndex = v46->_currentIndex;
          uint64_t v35 = 4 * currentIndex * (void)[v38 longValue];
          int64_t v18 = v44;
          uint64_t v34 = 4 * v18 * (void)[v38 longValue];
          unint64_t v33 = v35 + v34;
          unint64_t v19 = v35;
          if (v19 < (unint64_t)[v36 length]
            && (unint64_t v16 = v33, v16 <= (unint64_t)[v36 length]))
          {
            v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            for (int i = v35; i < v33; i += 4)
            {
              uint64_t v49 = i;
              uint64_t v48 = 4LL;
              uint64_t v50 = i;
              uint64_t v51 = 4LL;
              v29[1] = (id)i;
              v29[2] = (id)4;
              objc_msgSend(v36, "getBytes:range:", &v30, i, 4);
              LODWORD(v11) = v30;
              v29[0] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11);
              -[NSMutableArray addObject:](v32, "addObject:", v29[0]);
              objc_storeStrong(v29, 0LL);
            }

            v15 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v44);
            v52[0] = v15;
            v52[1] = v38;
            v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL);
            id v28 =  +[MLMultiArray doubleMultiArrayWithShape:valueArray:error:]( &OBJC_CLASS___MLMultiArray,  "doubleMultiArrayWithShape:valueArray:error:");

            [v41 setObject:v28 forKey:v40];
            objc_storeStrong(&v28, 0LL);
            objc_storeStrong((id *)&v32, 0LL);
            int v37 = 0;
          }

          else
          {
            v9 = objc_alloc(&OBJC_CLASS___NSError);
            int64_t v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", location, 91LL, 0LL);
            id *v43 = v10;
            v47 = 0LL;
            int v37 = 1;
          }
        }

        else
        {
          v7 = objc_alloc(&OBJC_CLASS___NSError);
          id v8 = -[NSError initWithDomain:code:userInfo:](v7, "initWithDomain:code:userInfo:", location, 81LL, 0LL);
          id *v43 = v8;
          v47 = 0LL;
          int v37 = 1;
        }

        objc_storeStrong(&v36, 0LL);
      }

      else
      {
        v5 = objc_alloc(&OBJC_CLASS___NSError);
        v6 = -[NSError initWithDomain:code:userInfo:](v5, "initWithDomain:code:userInfo:", location, 80LL, 0LL);
        id *v43 = v6;
        v47 = 0LL;
        int v37 = 1;
      }

      objc_storeStrong(&v38, 0LL);
      if (v37) {
        break;
      }
      ++v22;
      if (v20 + 1 >= v23)
      {
        uint64_t v22 = 0LL;
        NSUInteger v23 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v53,  16LL);
        if (!v23) {
          goto LABEL_20;
        }
      }
    }
  }

  else
  {
LABEL_20:
    int v37 = 0;
  }

  if (!v37)
  {
    v12 = objc_alloc(&OBJC_CLASS___MLDictionaryFeatureProvider);
    id v27 = -[MLDictionaryFeatureProvider initWithDictionary:error:](v12, "initWithDictionary:error:", v41, v43);
    id v26 = [&__NSArray0__struct mutableCopy];
    [v26 addObject:v27];
    v46->_currentIndex += v44;
    if (v46->_currentIndex + v44 > v46->_length) {
      v46->_int64_t currentIndex = 0LL;
    }
    v47 = -[MLArrayBatchProvider initWithFeatureProviderArray:]( objc_alloc(&OBJC_CLASS___MLArrayBatchProvider),  "initWithFeatureProviderArray:",  v26);
    int v37 = 1;
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v27, 0LL);
  }

  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&location, 0LL);
  return v47;
}

- (void).cxx_destruct
{
}

@end