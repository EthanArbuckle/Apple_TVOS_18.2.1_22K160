@interface AMDDODMLTask
- (AMDDODMLTask)initWithErrorDomain:(id)a3;
- (NSString)errorDomain;
- (id)performTask:(id)a3 error:(id *)a4;
- (void)setErrorDomain:(id)a3;
@end

@implementation AMDDODMLTask

- (AMDDODMLTask)initWithErrorDomain:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___AMDDODMLTask;
  v5 = -[AMDDODMLTask init](&v6, "init");
  id v8 = v5;
  objc_storeStrong(&v8, v5);
  if (v5)
  {
    [v8 setErrorDomain:location[0]];
    v9 = (AMDDODMLTask *)v8;
  }

  else
  {
    v9 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v8, 0LL);
  return v9;
}

- (id)performTask:(id)a3 error:(id *)a4
{
  v86 = a4;
  v102 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v100 = v86;
  id v87 = [location[0] parameters];
  id v84 = v87;
  id v85 = [v84 objectForKeyedSubscript:AttachmentInstructions];
  id v99 = v85;

  v83 = objc_alloc(&OBJC_CLASS___AMDDODMLAttachmentProcessor);
  id v82 = [location[0] attachments];
  id v78 = v82;
  id v79 = v99;
  v80 = v86;
  v81 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
  id v76 = v81;
  v77 = -[AMDDODMLAttachmentProcessor initWithAttachmentURLs:withInstructions:error:errorDomain:]( v83,  "initWithAttachmentURLs:withInstructions:error:errorDomain:",  v78,  v99,  v86);
  id v98 = v77;

  if (v77)
  {
    id v75 = [location[0] parameters];
    id v73 = v75;
    id v74 = [v73 objectForKeyedSubscript:DataProcessing];
    id v96 = v74;

    if (v96)
    {
      v68 = objc_alloc(&OBJC_CLASS___AMDDODMLDataProcessor);
      v67 = -[AMDDODMLDataProcessor initWithActionArray:withAttachmentProcessor:]( v68,  "initWithActionArray:withAttachmentProcessor:",  v96,  v98);
      id v95 = v67;
      if (v67)
      {
        id v60 = v95;
        v61 = v100;
        id v62 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
        id v58 = v62;
        id v59 = objc_msgSend(v95, "processRecipe:errorDomain:", v100);
        id v94 = v59;

        if (v94)
        {
          v57 = objc_alloc(&OBJC_CLASS___AMDDODMLModelMetadata);
          id v54 = location[0];
          v55 = v100;
          id v56 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
          id v52 = v56;
          id v53 = -[AMDDODMLModelMetadata initModelMetadata:error:errorDomain:]( v57,  "initModelMetadata:error:errorDomain:",  v54,  v100);
          id v93 = v53;

          id v92 = 0LL;
          id v51 = [v53 useCoreMLTrainer];
          id v49 = v51;
          id v50 = [v49 longValue];
          BOOL v48 = v50 != 0LL;

          if (v50)
          {
            v32 = objc_alloc(&OBJC_CLASS___AMDCoreMLDataProvider);
            id v31 = [v95 getInputSize];
            id v30 = [v95 getElementsInSampleDictionary];
            id v28 = v30;
            id v29 = [v95 getInputDictionary];
            id v26 = v29;
            v27 = -[AMDCoreMLDataProvider initWithInputs:featureSizeMap:inputDictionary:]( v32,  "initWithInputs:featureSizeMap:inputDictionary:",  v31,  v28);
            id v89 = v27;

            v25 = objc_alloc_init(&OBJC_CLASS___AMDCoreMLTrainer);
            id v88 = v25;
            v21 = v25;
            id v22 = location[0];
            v23 = v100;
            id v24 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
            id v19 = v24;
            id v20 = -[AMDCoreMLTrainer runTask:error:errorDomain:dataProvider:]( v25,  "runTask:error:errorDomain:dataProvider:",  v22,  v100);
            id v10 = v20;
            id v11 = v92;
            id v92 = v10;

            id v18 = 0LL;
            objc_storeStrong(&v88, 0LL);
            objc_storeStrong(&v89, 0LL);
          }

          else
          {
            v47 = objc_alloc(&OBJC_CLASS___AMDDODMLEspressoDataProvider);
            id v46 = [v95 getInputSize];
            id v45 = [v95 getElementsInSampleDictionary];
            id v43 = v45;
            id v44 = [v95 getInputDictionary];
            id v41 = v44;
            v42 = -[AMDDODMLEspressoDataProvider initWithInputs:featureSizeMap:inputDictionary:]( v47,  "initWithInputs:featureSizeMap:inputDictionary:",  v46,  v43);
            id v91 = v42;

            v40 = objc_alloc_init(&OBJC_CLASS___AMDDODMLTrainer);
            id v90 = v40;
            v36 = v40;
            id v37 = location[0];
            v38 = v100;
            id v39 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
            id v34 = v39;
            id v35 = -[AMDDODMLTrainer runTask:error:errorDomain:dataProvider:attachmentProcessor:]( v40,  "runTask:error:errorDomain:dataProvider:attachmentProcessor:",  v37,  v100);
            id v8 = v35;
            id v9 = v92;
            id v92 = v8;

            id obj = 0LL;
            objc_storeStrong(&v90, 0LL);
            objc_storeStrong(&v91, 0LL);
          }

          if (v92)
          {
            id v17 = [v92 JSONResult];
            id v16 = v17;
            NSLog(@"%@", v16);
          }

          else
          {
            NSLog(@"result is nil");
          }

          v14 = &v92;
          id v103 = v92;
          int v97 = 1;
          id v15 = 0LL;
          objc_storeStrong(v14, 0LL);
          objc_storeStrong(&v93, v15);
        }

        else
        {
          id v103 = 0LL;
          int v97 = 1;
        }

        objc_storeStrong(&v94, 0LL);
      }

      else
      {
        v66 = objc_alloc(&OBJC_CLASS___NSError);
        id v65 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
        id v63 = v65;
        id v64 = -[NSError initWithDomain:code:userInfo:](v66, "initWithDomain:code:userInfo:");
        id v6 = v64;
        id v7 = v63;
        id *v100 = v6;

        id v103 = 0LL;
        int v97 = 1;
      }

      objc_storeStrong(&v95, 0LL);
    }

    else
    {
      v72 = objc_alloc(&OBJC_CLASS___NSError);
      id v71 = -[AMDDODMLTask errorDomain](v102, "errorDomain");
      id v69 = v71;
      id v70 = -[NSError initWithDomain:code:userInfo:](v72, "initWithDomain:code:userInfo:");
      id v4 = v70;
      id v5 = v69;
      id *v100 = v4;

      id v103 = 0LL;
      int v97 = 1;
    }

    objc_storeStrong(&v96, 0LL);
  }

  else
  {
    id v103 = 0LL;
    int v97 = 1;
  }

  id v13 = 0LL;
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(&v99, v13);
  objc_storeStrong(location, 0LL);
  return v103;
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setErrorDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end