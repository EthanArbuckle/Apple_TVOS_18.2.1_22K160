@interface AMDDODMLTrainer
- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6 attachmentProcessor:(id)a7;
- (id)taskResultFromDict:(id)a3;
@end

@implementation AMDDODMLTrainer

- (id)runTask:(id)a3 error:(id *)a4 errorDomain:(id)a5 dataProvider:(id)a6 attachmentProcessor:(id)a7
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v25 = a4;
  id v24 = 0LL;
  objc_storeStrong(&v24, a5);
  id v23 = 0LL;
  objc_storeStrong(&v23, a6);
  id v22 = 0LL;
  objc_storeStrong(&v22, a7);
  v7 = objc_alloc(&OBJC_CLASS___AMDDODMLModelMetadata);
  id v21 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:]( v7,  "initModelMetadata:error:errorDomain:",  location[0],  v25,  v24);
  if (v21)
  {
    v8 = objc_alloc(&OBJC_CLASS___AMDDODMLEspressoModel);
    id v19 = -[AMDDODMLEspressoModel initWithModelMetadata:withAttachmentProcessor:error:errorDomain:]( v8,  "initWithModelMetadata:withAttachmentProcessor:error:errorDomain:",  v21,  v22,  v25,  v24);
    if (v19)
    {
      id v18 = objc_msgSend(v23, "numberOfIterationsPerEpoch:", objc_msgSend(v21, "batchSize"));
      if (v18)
      {
        id v17 = [v21 numLocalIterations];
        id v16 = [v19 trainOnData:v23 numLocalIterations:v17 error:v25 errorDomain:v24];
        if (v16) {
          id v28 = -[AMDDODMLTrainer taskResultFromDict:](v27, "taskResultFromDict:", v16);
        }
        else {
          id v28 = 0LL;
        }
        int v20 = 1;
        objc_storeStrong(&v16, 0LL);
      }

      else
      {
        v9 = objc_alloc(&OBJC_CLASS___NSError);
        v10 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", v24, 127LL, 0LL);
        id *v25 = v10;
        id v28 = 0LL;
        int v20 = 1;
      }
    }

    else
    {
      id v28 = 0LL;
      int v20 = 1;
    }

    objc_storeStrong(&v19, 0LL);
  }

  else
  {
    id v28 = 0LL;
    int v20 = 1;
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v28;
}

- (id)taskResultFromDict:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] mutableCopy];
  id v6 = [v7 objectForKeyedSubscript:ModelDeltas];
  [v7 removeObjectForKey:ModelDeltas];
  id v3 = objc_alloc(&OBJC_CLASS___MLRTaskResult);
  id v5 = [v3 initWithJSONResult:v7 unprivatizedVector:v6];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

@end