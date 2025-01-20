@interface AMDDODMLEspressoDataProvider
- (AMDDODMLEspressoDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5;
- (id)bindDataToInputsDirectly:(id)a3 batchSize:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (int64_t)count;
- (int64_t)numberOfDataPoints;
- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3;
@end

@implementation AMDDODMLEspressoDataProvider

- (AMDDODMLEspressoDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
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

- (id)bindDataToInputsDirectly:(id)a3 batchSize:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v41 = a4;
  v40 = a5;
  id v39 = 0LL;
  objc_storeStrong(&v39, a6);
  memset(__b, 0, sizeof(__b));
  id v25 = location[0];
  id v26 = [v25 countByEnumeratingWithState:__b objects:v49 count:16];
  if (v26)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0LL;
    id v21 = v26;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(v25);
      }
      uint64_t v38 = *(void *)(__b[1] + 8 * v20);
      id v16 = [location[0] objectForKeyedSubscript:v38];
      v17 = (uint64_t *)[v16 mutableBytes];

      v36 = v17;
      id v35 = -[NSDictionary objectForKey:](v43->_inputDictionary, "objectForKey:", v38);
      if (v35)
      {
        id v33 = -[NSDictionary objectForKey:](v43->_featureSizeMap, "objectForKey:", v38);
        if (v33)
        {
          id v10 = [v33 longValue];
          if (v36[2] * v36[3] * v36[4] * v36[5] == (void)v10 * v41)
          {
            uint64_t v32 = *v36;
            unint64_t v31 = (unint64_t)[v35 length] / 4;
            for (unint64_t i = 0LL; i < v41; ++i)
            {
              unint64_t v29 = (unint64_t)[v33 longValue];
              for (unint64_t j = 0LL; j < v29; ++j)
              {
                unint64_t v27 = v43->_currentIndex * v29 + i * v29 + j;
                if (v27 >= v31)
                {
                  v13 = objc_alloc(&OBJC_CLASS___NSError);
                  v14 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", v39, 91LL, 0LL);
                  id *v40 = v14;
                  v44 = 0LL;
                  int v34 = 1;
                  goto LABEL_20;
                }

                uint64_t v46 = 4 * v27;
                uint64_t v45 = 4LL;
                uint64_t v47 = 4 * v27;
                uint64_t v48 = 4LL;
                objc_msgSend(v35, "getBytes:range:", v32 + 4 * (i * v29 + j), 4 * v27, 4);
              }
            }

            int v34 = 0;
          }

          else
          {
            SEL v11 = objc_alloc(&OBJC_CLASS___NSError);
            v12 = -[NSError initWithDomain:code:userInfo:](v11, "initWithDomain:code:userInfo:", v39, 82LL, 0LL);
            id *v40 = v12;
            v44 = 0LL;
            int v34 = 1;
          }
        }

        else
        {
          id v8 = objc_alloc(&OBJC_CLASS___NSError);
          v9 = -[NSError initWithDomain:code:userInfo:](v8, "initWithDomain:code:userInfo:", v39, 80LL, 0LL);
          id *v40 = v9;
          v44 = 0LL;
          int v34 = 1;
        }

- (void).cxx_destruct
{
}

@end