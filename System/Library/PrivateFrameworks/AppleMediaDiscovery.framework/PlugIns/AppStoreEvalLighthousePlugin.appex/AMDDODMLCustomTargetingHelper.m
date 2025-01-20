@interface AMDDODMLCustomTargetingHelper
- (AMDDODMLCustomTargetingHelper)init;
- (id)callAMDClient:(id)a3 error:(id *)a4;
- (id)getDictionaryValueDataType:(id)a3 error:(id *)a4;
- (id)getOperationsArray;
- (id)mainTargetingResolver:(id)a3 error:(id *)a4;
- (id)parseData:(id)a3 withArray:(id)a4 error:(id *)a5;
- (id)performOperation:(id)a3 onArray:(id)a4 error:(id *)a5;
- (id)postProc:(id)a3 withDirections:(id)a4 error:(id *)a5;
@end

@implementation AMDDODMLCustomTargetingHelper

- (AMDDODMLCustomTargetingHelper)init
{
  SEL v5 = a2;
  v6 = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMDDODMLCustomTargetingHelper;
  v6 = -[AMDDODMLCustomTargetingHelper init](&v4, "init");
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0LL);
  return v3;
}

- (id)callAMDClient:(id)a3 error:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v28 = a4;
  id v27 = [location[0] objectAtIndex:0];
  id v26 = [location[0] objectAtIndex:1];
  id v25 = [location[0] objectAtIndex:2];
  id v24 = objc_alloc_init(&OBJC_CLASS___AMDClient);

  id v4 = objc_alloc(&OBJC_CLASS___AMDClientRequestEvent);
  id v23 = [v4 initWithFeatureName:v27 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v26 withCustomDescriptor:0 andSchemaVersion:v25];
  id v22 = 0LL;
  for (int i = 0; i < 3; ++i)
  {
    id v5 = [v24 getFeature:v23];
    id v6 = v22;
    id v22 = v5;

    char v19 = 0;
    unsigned __int8 v14 = 0;
    if (v22)
    {
      id v20 = [v22 objectForKey:AMD_CLIENT_STATUS];
      char v19 = 1;
      unsigned __int8 v14 = [v20 isEqual:AMD_CLIENT_STATUS_OK];
    }

    if ((v19 & 1) != 0) {

    }
    if ((v14 & 1) != 0) {
      break;
    }
  }

  if (v22)
  {
    id v17 = [v22 objectForKey:AMD_CLIENT_STATUS];
    if ([v17 isEqual:AMD_CLIENT_STATUS_OK])
    {
      id v16 = [v22 objectForKey:AMD_CLIENT_DATA];
      if (v16)
      {
        id v30 = v16;
      }

      else
      {
        v11 = objc_alloc(&OBJC_CLASS___NSError);
        v12 =  -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  154LL,  0LL);
        id *v28 = v12;
        id v30 = 0LL;
      }

      int v18 = 1;
      objc_storeStrong(&v16, 0LL);
    }

    else
    {
      v9 = objc_alloc(&OBJC_CLASS___NSError);
      v10 =  -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  153LL,  0LL);
      id *v28 = v10;
      id v30 = 0LL;
      int v18 = 1;
    }

    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___NSError);
    v8 =  -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  152LL,  0LL);
    id *v28 = v8;
    id v30 = 0LL;
    int v18 = 1;
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v30;
}

- (id)getOperationsArray
{
  v4[2] = self;
  v4[1] = (id)a2;
  v5[0] = CustomTargetingSum;
  v5[1] = CustomTargetingSumEmp;
  v5[2] = CustomTargetingConNum;
  v5[3] = CustomTargetingConStr;
  v5[4] = CustomTargetingMean;
  v5[5] = CustomTargetingMeanEmp;
  v5[6] = CustomTargetingLen;
  v5[7] = CustomTargetingFirst;
  v5[8] = CustomTargetingMax;
  v5[9] = CustomTargetingMaxEmp;
  v5[10] = CustomTargetingMin;
  v5[11] = CustomTargetingMinEmp;
  v4[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 12LL);
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)performOperation:(id)a3 onArray:(id)a4 error:(id *)a5
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v70 = 0LL;
  objc_storeStrong(&v70, a4);
  v69 = a5;
  if (([location[0] isEqual:CustomTargetingSum] & 1) != 0
    || ([location[0] isEqual:CustomTargetingSumEmp] & 1) != 0)
  {
    if ([v70 count])
    {
      double v67 = 0.0;
      for (unint64_t i = 0; i < (unint64_t)[v70 count]; ++i)
      {
        id v44 = [v70 objectAtIndex:i];
        [v44 doubleValue];
        double v67 = v67 + v6;
      }

      v72 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v67);
      int v68 = 1;
    }

    else
    {
      if ([location[0] isEqual:CustomTargetingSum])
      {
        id v5 = objc_alloc(&OBJC_CLASS___NSError);
        id *v69 =  -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  155LL,  0LL);
        v72 = 0LL;
      }

      else
      {
        v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      }

      int v68 = 1;
    }
  }

  else if ([location[0] containsString:CustomTargetingConNum])
  {
    id v65 = [location[0] componentsSeparatedByString:@"_"];
    if ([v65 count] == (id)2 || objc_msgSend(v65, "count") == (id)3)
    {
      double v64 = 0.00000001;
      if ([v65 count] == (id)3)
      {
        id v63 = [v65 objectAtIndex:2];
        unsigned int v62 = [v63 intValue];
        double v64 = (double)(1 / (int)(v62 ^ 0xA));
        objc_storeStrong(&v63, 0LL);
      }

      id v61 = [v65 objectAtIndex:1];
      for (unint64_t j = 0LL; ; ++j)
      {
        unint64_t v43 = j;
        id v59 = [v70 objectAtIndex:j];
        id v42 = v59;
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v42, v8) & 1) != 0)
        {
          id v58 = v59;
          [v58 doubleValue];
          double v41 = v11 - v64;
          [v61 doubleValue];
          if (v41 >= v12
            || (objc_msgSend(v58, "doubleValue", v41), double v40 = v13 + v64, objc_msgSend(v61, "doubleValue"), v40 <= v14))
          {
            int v68 = 0;
          }

          else
          {
            v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v40);
            int v68 = 1;
          }

          objc_storeStrong(&v58, 0LL);
          if (!v68) {
            int v68 = 0;
          }
        }

        else
        {
          v9 = objc_alloc(&OBJC_CLASS___NSError);
          v10 =  -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  157LL,  0LL);
          id *v69 = v10;
          v72 = 0LL;
          int v68 = 1;
        }

        objc_storeStrong(&v59, 0LL);
        if (v68) {
          goto LABEL_31;
        }
      }

      v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      int v68 = 1;
LABEL_31:
      objc_storeStrong(&v61, 0LL);
    }

    else
    {
      v7 = objc_alloc(&OBJC_CLASS___NSError);
      id *v69 =  -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  156LL,  0LL);
      v72 = 0LL;
      int v68 = 1;
    }

    objc_storeStrong(&v65, 0LL);
  }

  else if ([location[0] containsString:CustomTargetingConStr])
  {
    id v57 = [location[0] componentsSeparatedByString:@"_"];
    id v56 = [v57 objectAtIndex:1];
    for (unint64_t k = 0LL; ; ++k)
    {
      unint64_t v39 = k;
      id v54 = [v70 objectAtIndex:k];
      id v38 = v54;
      uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v38, v15) & 1) != 0)
      {
        id v53 = v54;
        if ([v53 isEqual:v56])
        {
          v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:");
          int v68 = 1;
        }

        else
        {
          int v68 = 0;
        }

        objc_storeStrong(&v53, 0LL);
        if (!v68) {
          int v68 = 0;
        }
      }

      else
      {
        id v16 = objc_alloc(&OBJC_CLASS___NSError);
        id v17 =  -[NSError initWithDomain:code:userInfo:]( v16,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  158LL,  0LL);
        id *v69 = v17;
        v72 = 0LL;
        int v68 = 1;
      }

      objc_storeStrong(&v54, 0LL);
      if (v68) {
        goto LABEL_46;
      }
    }

    v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
    int v68 = 1;
LABEL_46:
    objc_storeStrong(&v56, 0LL);
    objc_storeStrong(&v57, 0LL);
  }

  else if (([location[0] isEqual:CustomTargetingMean] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMeanEmp] & 1) != 0)
  }
  {
    if ([v70 count])
    {
      double v52 = 0.0;
      for (unint64_t m = 0; m < (unint64_t)[v70 count]; ++m)
      {
        id v37 = [v70 objectAtIndex:m];
        [v37 doubleValue];
        double v52 = v52 + v19;
      }

      v72 =  +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v52 / (double)(unint64_t)[v70 count]);
      int v68 = 1;
    }

    else
    {
      if ([location[0] isEqual:CustomTargetingMean])
      {
        int v18 = objc_alloc(&OBJC_CLASS___NSError);
        id *v69 =  -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  159LL,  0LL);
        v72 = 0LL;
      }

      else
      {
        v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      }

      int v68 = 1;
    }
  }

  else if ([location[0] isEqual:CustomTargetingLen])
  {
    v72 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v70 count]);
    int v68 = 1;
  }

  else if ([location[0] isEqual:CustomTargetingFirst])
  {
    if ([v70 count])
    {
      v72 = (NSNumber *)[v70 firstObject];
    }

    else
    {
      id v20 = objc_alloc(&OBJC_CLASS___NSError);
      id *v69 =  -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  180LL,  0LL);
      v72 = 0LL;
    }

    int v68 = 1;
  }

  else if (([location[0] isEqual:CustomTargetingMax] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMaxEmp] & 1) != 0)
  }
  {
    if ([v70 count])
    {
      id v35 = [v70 firstObject];
      [v35 doubleValue];
      double v36 = v22;

      double v50 = v36;
      for (unint64_t n = 0; n < (unint64_t)[v70 count]; ++n)
      {
        id v33 = [v70 objectAtIndex:n];
        [v33 doubleValue];
        double v34 = v23;

        if (v34 > v50) {
          double v50 = v34;
        }
      }

      v72 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v50);
      int v68 = 1;
    }

    else
    {
      if ([location[0] isEqual:CustomTargetingMax])
      {
        v21 = objc_alloc(&OBJC_CLASS___NSError);
        id *v69 =  -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  160LL,  0LL);
        v72 = 0LL;
      }

      else
      {
        v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      }

      int v68 = 1;
    }
  }

  else if (([location[0] isEqual:CustomTargetingMin] & 1) != 0 {
         || ([location[0] isEqual:CustomTargetingMinEmp] & 1) != 0)
  }
  {
    if ([v70 count])
    {
      id v31 = [v70 firstObject];
      [v31 doubleValue];
      double v32 = v25;

      double v48 = v32;
      for (iunint64_t i = 0; ii < (unint64_t)[v70 count]; ++ii)
      {
        id v29 = [v70 objectAtIndex:ii];
        [v29 doubleValue];
        double v30 = v26;

        if (v30 < v48) {
          double v48 = v30;
        }
      }

      v72 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v48);
      int v68 = 1;
    }

    else
    {
      if ([location[0] isEqual:CustomTargetingMin])
      {
        id v24 = objc_alloc(&OBJC_CLASS___NSError);
        id *v69 =  -[NSError initWithDomain:code:userInfo:]( v24,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  161LL,  0LL);
        v72 = 0LL;
      }

      else
      {
        v72 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL);
      }

      int v68 = 1;
    }
  }

  else
  {
    id v27 = objc_alloc(&OBJC_CLASS___NSError);
    id *v69 =  -[NSError initWithDomain:code:userInfo:]( v27,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  162LL,  0LL);
    v72 = 0LL;
    int v68 = 1;
  }

  objc_storeStrong(&v70, 0LL);
  objc_storeStrong(location, 0LL);
  return v72;
}

- (id)getDictionaryValueDataType:(id)a3 error:(id *)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = a4;
  id v28 = 0LL;
  memset(__b, 0, sizeof(__b));
  obunint64_t j = location[0];
  id v23 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
  if (v23)
  {
    uint64_t v18 = *(void *)__b[2];
    uint64_t v19 = 0LL;
    id v20 = v23;
    while (1)
    {
      uint64_t v17 = v19;
      if (*(void *)__b[2] != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void *)(__b[1] + 8 * v19);
      id v25 = [location[0] objectForKey:v27];
      id v16 = v25;
      uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v16, v4) & 1) != 0)
      {
        if (!v28)
        {
          objc_storeStrong(&v28, IsAnArray);
LABEL_28:
          int v24 = 0;
          goto LABEL_29;
        }
      }

      else
      {
        id v15 = v25;
        uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
        if ((objc_opt_isKindOfClass(v15, v5) & 1) != 0)
        {
          if (!v28)
          {
            objc_storeStrong(&v28, IsANumber);
            goto LABEL_28;
          }
        }

        else
        {
          id v14 = v25;
          uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
          {
            if (!v28)
            {
              objc_storeStrong(&v28, IsAString);
              goto LABEL_28;
            }
          }

          else
          {
            id v13 = v25;
            uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v13, v7) & 1) == 0)
            {
              v10 = objc_alloc(&OBJC_CLASS___NSError);
              double v11 =  -[NSError initWithDomain:code:userInfo:]( v10,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  164LL,  0LL);
              *id v29 = v11;
              id v31 = 0LL;
              int v24 = 1;
              goto LABEL_29;
            }

            if (!v28)
            {
              objc_storeStrong(&v28, IsADictionary);
              goto LABEL_28;
            }
          }
        }
      }

      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSError);
      v9 =  -[NSError initWithDomain:code:userInfo:]( v8,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  163LL,  0LL);
      *id v29 = v9;
      id v31 = 0LL;
      int v24 = 1;
LABEL_29:
      objc_storeStrong(&v25, 0LL);
      if (v24) {
        goto LABEL_33;
      }
      ++v19;
      if (v17 + 1 >= (unint64_t)v20)
      {
        uint64_t v19 = 0LL;
        id v20 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v20) {
          break;
        }
      }
    }
  }

  int v24 = 0;
LABEL_33:

  if (!v24) {
    id v31 = v28;
  }
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
  return v31;
}

- (id)parseData:(id)a3 withArray:(id)a4 error:(id *)a5
{
  v88 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v86 = 0LL;
  objc_storeStrong(&v86, a4);
  v85 = a5;
  id v47 = location[0];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v47, v5) & 1) != 0)
  {
    id v84 = location[0];
    if ([v86 count] == (id)2)
    {
      unint64_t v43 = v88;
      id v44 = [v86 objectAtIndex:1];
      id v83 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v43, "performOperation:onArray:error:");

      if (v83)
      {
        int v82 = 0;
      }

      else
      {
        id v89 = 0LL;
        int v82 = 1;
      }

      objc_storeStrong(&v83, 0LL);
      if (!v82) {
        int v82 = 0;
      }
    }

    else if ([v86 count] == (id)1)
    {
      id v81 = [v84 firstObject];
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v81, v6) & 1) != 0
        || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v81, v7) & 1) != 0))
      {
        id v89 = v81;
        int v82 = 1;
      }

      else
      {
        uint64_t v8 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v8,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  166LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
      }

      objc_storeStrong(&v81, 0LL);
    }

    else
    {
      v9 = objc_alloc(&OBJC_CLASS___NSError);
      id *v85 =  -[NSError initWithDomain:code:userInfo:]( v9,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  167LL,  0LL);
      id v89 = 0LL;
      int v82 = 1;
    }

    objc_storeStrong(&v84, 0LL);
    if (!v82) {
      goto LABEL_104;
    }
    goto LABEL_105;
  }

  id v42 = location[0];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v42, v10) & 1) == 0)
  {
    id v29 = objc_alloc(&OBJC_CLASS___NSError);
    id *v85 =  -[NSError initWithDomain:code:userInfo:]( v29,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  108LL,  0LL);
    id v89 = 0LL;
    int v82 = 1;
    goto LABEL_105;
  }

  id v80 = location[0];
  id v79 =  -[AMDDODMLCustomTargetingHelper getDictionaryValueDataType:error:]( v88,  "getDictionaryValueDataType:error:",  v80,  v85);
  if (!v79)
  {
    id v89 = 0LL;
    int v82 = 1;
    goto LABEL_101;
  }

  if ([v79 isEqual:IsAnArray])
  {
    if ([v86 count] == (id)3)
    {
      id v78 = [v86 objectAtIndex:1];
      id v77 = [v86 objectAtIndex:2];
      id v76 = [v80 objectForKey:v78];
      if (v76)
      {
        id v75 =  -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:]( v88,  "performOperation:onArray:error:",  v77,  v76,  v85);
        if (v75) {
          id v89 = v75;
        }
        else {
          id v89 = 0LL;
        }
        int v82 = 1;
        objc_storeStrong(&v75, 0LL);
      }

      else
      {
        double v11 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  168LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
      }

      objc_storeStrong(&v76, 0LL);
      objc_storeStrong(&v77, 0LL);
      objc_storeStrong(&v78, 0LL);
      goto LABEL_101;
    }

    if ([v86 count] == (id)2)
    {
      id v74 = [v86 objectAtIndex:1];
      id v73 = -[AMDDODMLCustomTargetingHelper getOperationsArray](v88, "getOperationsArray");
      if ([v73 containsObject:v74])
      {
        if ([v80 count] == (id)1)
        {
          memset(__b, 0, sizeof(__b));
          id v41 = v80;
          if ([v41 countByEnumeratingWithState:__b objects:v93 count:16])
          {
            uint64_t v72 = *(void *)__b[1];
            id v70 = [v80 objectForKey:v72];
            id v69 =  -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:]( v88,  "performOperation:onArray:error:",  v74,  v70,  v85);
            if (v69) {
              id v89 = v69;
            }
            else {
              id v89 = 0LL;
            }
            int v82 = 1;
            objc_storeStrong(&v69, 0LL);
            objc_storeStrong(&v70, 0LL);
          }

          else
          {
            int v82 = 0;
          }

          if (!v82) {
            int v82 = 0;
          }
        }

        else
        {
          double v12 = objc_alloc(&OBJC_CLASS___NSError);
          id *v85 =  -[NSError initWithDomain:code:userInfo:]( v12,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  169LL,  0LL);
          id v89 = 0LL;
          int v82 = 1;
        }
      }

      else
      {
        id v68 = [v86 objectAtIndex:1];
        id v67 = [v80 objectForKey:v68];
        id v66 = [v67 firstObject];
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v66, v13) & 1) != 0
          || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v66, v14) & 1) != 0))
        {
          id v89 = v66;
          int v82 = 1;
        }

        else
        {
          id v15 = objc_alloc(&OBJC_CLASS___NSError);
          id *v85 =  -[NSError initWithDomain:code:userInfo:]( v15,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  170LL,  0LL);
          id v89 = 0LL;
          int v82 = 1;
        }

        objc_storeStrong(&v66, 0LL);
        objc_storeStrong(&v67, 0LL);
        objc_storeStrong(&v68, 0LL);
      }

      objc_storeStrong(&v73, 0LL);
      objc_storeStrong(&v74, 0LL);
      if (!v82) {
        goto LABEL_100;
      }
    }

    else
    {
      if ([v86 count] != (id)1)
      {
        v21 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  172LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
        goto LABEL_101;
      }

      if ([v80 count] != (id)1)
      {
        id v20 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v20,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  169LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
        goto LABEL_101;
      }

      memset(v64, 0, sizeof(v64));
      id v40 = v80;
      if ([v40 countByEnumeratingWithState:v64 objects:v92 count:16])
      {
        uint64_t v65 = *(void *)v64[1];
        id v63 = [v80 objectForKey:v65];
        id v62 = [v63 firstObject];
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v62, v16) & 1) != 0
          || (uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v62, v17) & 1) != 0))
        {
          id v89 = v62;
          int v82 = 1;
        }

        else
        {
          uint64_t v18 = objc_alloc(&OBJC_CLASS___NSError);
          uint64_t v19 =  -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  171LL,  0LL);
          id *v85 = v19;
          id v89 = 0LL;
          int v82 = 1;
        }

        objc_storeStrong(&v62, 0LL);
        objc_storeStrong(&v63, 0LL);
      }

      else
      {
        int v82 = 0;
      }

      if (!v82) {
        goto LABEL_100;
      }
    }
  }

  else
  {
    if (([v79 isEqual:IsANumber] & 1) == 0
      && ([v79 isEqual:IsAString] & 1) == 0)
    {
      if ([v79 isEqual:IsADictionary])
      {
        uint64_t v27 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v27,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  177LL,  0LL);
      }

      else
      {
        id v28 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v28,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  178LL,  0LL);
      }

      id v89 = 0LL;
      int v82 = 1;
      goto LABEL_101;
    }

    if ([v86 count] == (id)3)
    {
      id v61 = [v86 objectAtIndex:1];
      id v60 = [v86 objectAtIndex:2];
      id v59 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v58 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      memset(v56, 0, sizeof(v56));
      id v38 = v80;
      id v39 = [v38 countByEnumeratingWithState:v56 objects:v91 count:16];
      if (v39)
      {
        uint64_t v35 = *(void *)v56[2];
        uint64_t v36 = 0LL;
        id v37 = v39;
        while (1)
        {
          uint64_t v34 = v36;
          if (*(void *)v56[2] != v35) {
            objc_enumerationMutation(v38);
          }
          uint64_t v57 = *(void *)(v56[1] + 8 * v36);
          id v55 = [v80 objectForKey:v57];
          [v59 addObject:v57];
          [v58 addObject:v55];
          objc_storeStrong(&v55, 0LL);
          ++v36;
          if (v34 + 1 >= (unint64_t)v37)
          {
            uint64_t v36 = 0LL;
            id v37 = [v38 countByEnumeratingWithState:v56 objects:v91 count:16];
            if (!v37) {
              break;
            }
          }
        }
      }

      if ([v61 isEqual:@"GETKEYS"])
      {
        id v54 =  -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:]( v88,  "performOperation:onArray:error:",  v60,  v59,  v85);
        if (v54) {
          id v89 = v54;
        }
        else {
          id v89 = 0LL;
        }
        int v82 = 1;
        objc_storeStrong(&v54, 0LL);
      }

      else if ([v61 isEqual:@"GETVALS"])
      {
        id v53 =  -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:]( v88,  "performOperation:onArray:error:",  v60,  v58,  v85);
        if (v53) {
          id v89 = v53;
        }
        else {
          id v89 = 0LL;
        }
        int v82 = 1;
        objc_storeStrong(&v53, 0LL);
      }

      else
      {
        double v22 = objc_alloc(&OBJC_CLASS___NSError);
        id v23 =  -[NSError initWithDomain:code:userInfo:]( v22,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  173LL,  0LL);
        id *v85 = v23;
        id v89 = 0LL;
        int v82 = 1;
      }

      objc_storeStrong(&v58, 0LL);
      objc_storeStrong(&v59, 0LL);
      objc_storeStrong(&v60, 0LL);
      objc_storeStrong(&v61, 0LL);
    }

    else
    {
      if ([v86 count] == (id)2)
      {
        id v52 = [v86 objectAtIndex:1];
        id v51 = [v80 objectForKey:v52];
        if (v51)
        {
          id v89 = v51;
        }

        else
        {
          int v24 = objc_alloc(&OBJC_CLASS___NSError);
          id *v85 =  -[NSError initWithDomain:code:userInfo:]( v24,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  174LL,  0LL);
          id v89 = 0LL;
        }

        int v82 = 1;
        objc_storeStrong(&v51, 0LL);
        objc_storeStrong(&v52, 0LL);
        goto LABEL_101;
      }

      if ([v86 count] != (id)1)
      {
        double v26 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v26,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  176LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
        goto LABEL_101;
      }

      if ([v80 count] != (id)1)
      {
        id v25 = objc_alloc(&OBJC_CLASS___NSError);
        id *v85 =  -[NSError initWithDomain:code:userInfo:]( v25,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  175LL,  0LL);
        id v89 = 0LL;
        int v82 = 1;
        goto LABEL_101;
      }

      memset(v49, 0, sizeof(v49));
      id v33 = v80;
      if ([v33 countByEnumeratingWithState:v49 objects:v90 count:16])
      {
        uint64_t v50 = *(void *)v49[1];
        id v48 = [v80 objectForKey:v50];
        id v89 = v48;
        int v82 = 1;
        objc_storeStrong(&v48, 0LL);
      }

      else
      {
        int v82 = 0;
      }

      if (!v82) {
LABEL_100:
      }
        int v82 = 0;
    }
  }

- (id)postProc:(id)a3 withDirections:(id)a4 error:(id *)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  uint64_t v18 = a5;
  id v17 = [v19 componentsSeparatedByString:@"_"];
  id v16 = [v17 firstObject];
  if ([v16 isEqual:CustomTargetingCutDown])
  {
    id v15 = [v17 lastObject];
    id v14 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    id v13 = [v14 numberFromString:v15];
    if (location[0] <= v13) {
      id v21 = location[0];
    }
    else {
      id v21 = v13;
    }
    int v12 = 1;
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
  }

  else if ([v16 isEqual:CustomTargetingCutUp])
  {
    id v11 = [v17 lastObject];
    id v10 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    id v9 = [v10 numberFromString:v11];
    if (location[0] >= v9) {
      id v21 = location[0];
    }
    else {
      id v21 = v9;
    }
    int v12 = 1;
    objc_storeStrong(&v9, 0LL);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong(&v11, 0LL);
  }

  else
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NSError);
    *uint64_t v18 =  -[NSError initWithDomain:code:userInfo:]( v5,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  181LL,  0LL);
    id v21 = 0LL;
    int v12 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v21;
}

- (id)mainTargetingResolver:(id)a3 error:(id *)a4
{
  unint64_t v43 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v41 = a4;
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  obunint64_t j = location[0];
  id v26 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
  if (v26)
  {
    uint64_t v21 = *(void *)__b[2];
    uint64_t v22 = 0LL;
    id v23 = v26;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)__b[2] != v21) {
        objc_enumerationMutation(obj);
      }
      id v39 = *(id *)(__b[1] + 8 * v22);
      id v37 = [v39 componentsSeparatedByString:@"______"];
      id v36 = [v37 firstObject];
      id v35 = [v36 componentsSeparatedByString:@"____"];
      id v34 = [v35 firstObject];
      id v33 = [v34 componentsSeparatedByString:@"__"];
      if ([v33 count] == (id)3) {
        break;
      }
      uint64_t v4 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v5 =  -[NSError initWithDomain:code:userInfo:]( v4,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  165LL,  0LL);
      *id v41 = v5;
      id v44 = 0LL;
      int v32 = 1;
LABEL_25:
      objc_storeStrong(&v33, 0LL);
      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v35, 0LL);
      objc_storeStrong(&v36, 0LL);
      objc_storeStrong(&v37, 0LL);
      if (v32) {
        goto LABEL_29;
      }
      ++v22;
      if (v20 + 1 >= (unint64_t)v23)
      {
        uint64_t v22 = 0LL;
        id v23 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
        if (!v23) {
          goto LABEL_28;
        }
      }
    }

    id v31 = -[AMDDODMLCustomTargetingHelper callAMDClient:error:](v43, "callAMDClient:error:", v33, v41);
    if (!v31)
    {
      id v44 = 0LL;
      int v32 = 1;
LABEL_24:
      objc_storeStrong(&v31, 0LL);
      goto LABEL_25;
    }

    id v30 =  -[AMDDODMLCustomTargetingHelper parseData:withArray:error:]( v43,  "parseData:withArray:error:",  v31,  v35,  v41);
    if (!v30)
    {
      id v44 = 0LL;
      int v32 = 1;
LABEL_23:
      objc_storeStrong(&v30, 0LL);
      goto LABEL_24;
    }

    id v19 = v30;
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v19, v6) & 1) != 0)
    {
      id v29 = v30;
      [v40 setObject:v29 forKey:v39];
      objc_storeStrong(&v29, 0LL);
    }

    else
    {
      id v18 = v30;
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v18, v7) & 1) == 0)
      {
        id v10 = objc_alloc(&OBJC_CLASS___NSError);
        id v11 =  -[NSError initWithDomain:code:userInfo:]( v10,  "initWithDomain:code:userInfo:",  AMDLighthouseODMLPluginErrorDomain,  165LL,  0LL);
        *id v41 = v11;
        id v44 = 0LL;
        int v32 = 1;
        goto LABEL_23;
      }

      id v28 = v30;
      id v27 = v28;
      if ([v37 count] == (id)2)
      {
        id v16 = v43;
        id v15 = v28;
        id v17 = [v37 lastObject];
        id v8 =  -[AMDDODMLCustomTargetingHelper postProc:withDirections:error:]( v16,  "postProc:withDirections:error:",  v15);
        id v9 = v27;
        id v27 = v8;
      }

      if (v27)
      {
        id v13 = v40;
        id v14 = [v27 stringValue];
        objc_msgSend(v13, "setObject:forKey:");

        int v32 = 0;
      }

      else
      {
        id v44 = 0LL;
        int v32 = 1;
      }

      objc_storeStrong(&v27, 0LL);
      objc_storeStrong(&v28, 0LL);
      if (v32) {
        goto LABEL_23;
      }
    }

    int v32 = 0;
    goto LABEL_23;
  }

@end