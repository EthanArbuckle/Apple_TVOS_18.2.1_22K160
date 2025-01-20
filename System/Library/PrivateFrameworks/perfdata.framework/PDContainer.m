@interface PDContainer
+ (PDContainer)containerWithFileURL:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithJSONData:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithJSONDictionary:(id)a3 error:(id *)a4;
+ (PDContainer)containerWithPath:(id)a3 error:(id *)a4;
- (BOOL)enumerateAggregatedMeasurementsIgnoringVariables:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateAggregatedMeasurementsMatchingNullableFilter:(id)a3 ignoringVariables:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateMeasurementsMatchingNullableFilter:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)enumerateMeasurementsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)isComparableTo:(id)a3;
- (BOOL)isLike:(id)a3;
- (BOOL)largerBetter;
- (NSDictionary)configuration;
- (NSDictionary)labels;
- (NSDictionary)variables;
- (NSMutableDictionary)extensions;
- (NSMutableDictionary)perfdata;
- (NSString)generator;
- (NSString)name;
- (NSString)notes;
- (NSString)primaryMetricFilter;
- (NSString)testDescription;
- (PDContainer)initWithFileURL:(id)a3 error:(id *)a4;
- (PDContainer)initWithJSONData:(id)a3 error:(id *)a4;
- (PDContainer)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (PDContainer)initWithPath:(id)a3 error:(id *)a4;
- (id)aggregateMeasurementsMatchingFilter:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)measurementCount;
- (unint64_t)version;
- (void)setConfiguration:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setLabels:(id)a3;
- (void)setLargerBetter:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNotes:(id)a3;
- (void)setPerfdata:(id)a3;
- (void)setPrimaryMetricFilter:(id)a3;
- (void)setTestDescription:(id)a3;
- (void)setVariables:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PDContainer

- (PDContainer)initWithPath:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PDContainer initWithFileURL:error:](self, "initWithFileURL:error:", v6, a4);

  return v7;
}

+ (PDContainer)containerWithPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = -[PDContainer initWithPath:error:](objc_alloc(&OBJC_CLASS___PDContainer), "initWithPath:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PDContainer;
  v7 = -[PDContainer init](&v13, sel_init);
  if (v7)
  {
    v8 = v7;
    [MEMORY[0x189603F80] inputStreamWithURL:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 open];
    [MEMORY[0x1896078D8] JSONObjectWithStream:v9 options:3 error:a4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 close];
    if (v10)
    {
      v8 = -[PDContainer initWithJSONDictionary:error:](v8, "initWithJSONDictionary:error:", v10, a4);
      v11 = v8;
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

+ (PDContainer)containerWithFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[PDContainer initWithFileURL:error:](objc_alloc(&OBJC_CLASS___PDContainer), "initWithFileURL:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithJSONData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDContainer;
  v7 = -[PDContainer init](&v12, sel_init);
  if (v7)
  {
    v8 = v7;
    [MEMORY[0x1896078D8] JSONObjectWithData:v6 options:3 error:a4];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = -[PDContainer initWithJSONDictionary:error:](v8, "initWithJSONDictionary:error:", v9, a4);
      v10 = v8;
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

+ (PDContainer)containerWithJSONData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[PDContainer initWithJSONData:error:](objc_alloc(&OBJC_CLASS___PDContainer), "initWithJSONData:error:", v5, a4);

  return v6;
}

- (PDContainer)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v56[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDContainer setPerfdata:](self, "setPerfdata:", v6);
    v7 = -[PDContainer perfdata](self, "perfdata");
    [v7 objectForKeyedSubscript:@"$schema"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v8 hasPrefix:@"https://perfdata.apple.com/schema/"] & 1) == 0)
    {
      if (p_isa)
      {
        v26 = (void *)MEMORY[0x189607870];
        uint64_t v55 = *MEMORY[0x1896075E0];
        v56[0] = @"schema is not perfdata";
        [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:&v55 count:1];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 errorWithDomain:@"PDError" code:3 userInfo:v27];
        *p_isa = (id)objc_claimAutoreleasedReturnValue();

        p_isa = 0LL;
      }

      goto LABEL_17;
    }
    v9 = -[PDContainer perfdata](self, "perfdata");
    [v9 objectForKeyedSubscript:@"name"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDContainer setName:](self, "setName:", v10);

    uint64_t v11 = -[PDContainer name](self, "name");
    if (!v11
      || (objc_super v12 = (void *)v11,
          -[PDContainer name](self, "name"),
          objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v13,
          v12,
          (isKindOfClass & 1) == 0))
    {
      handle_malformed_data(p_isa, @"perfdata name");
      p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v15 = -[PDContainer perfdata](self, "perfdata");
    [v15 objectForKeyedSubscript:@"version"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PDContainer setVersion:](self, "setVersion:", [v16 unsignedIntegerValue]);
      v17 = -[PDContainer perfdata](self, "perfdata");
      [v17 objectForKeyedSubscript:@"description"];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDContainer setTestDescription:](self, "setTestDescription:", v18);

      uint64_t v19 = -[PDContainer testDescription](self, "testDescription");
      if (!v19
        || (v20 = (void *)v19,
        v23 = -[PDContainer testDescription](self, "testDescription"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v22 = objc_opt_isKindOfClass(),
            v21,
            v20,
            (v22 & 1) != 0))
      {
        -[PDContainer perfdata](self, "perfdata");
        [v23 objectForKeyedSubscript:@"larger_better"];
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v41 = @"perfdata larger_better";
            goto LABEL_31;
          }

          uint64_t v25 = [v24 BOOLValue];
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        -[PDContainer setLargerBetter:](self, "setLargerBetter:", v25);
        v30 = -[PDContainer perfdata](self, "perfdata");
        [v30 objectForKeyedSubscript:@"primary_metric"];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setPrimaryMetricFilter:](self, "setPrimaryMetricFilter:", v31);

        uint64_t v32 = -[PDContainer primaryMetricFilter](self, "primaryMetricFilter");
        if (v32)
        {
          v33 = (void *)v32;
          v34 = -[PDContainer primaryMetricFilter](self, "primaryMetricFilter");
          objc_opt_class();
          char v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            v41 = @"perfdata primary_metric";
            goto LABEL_31;
          }
        }
        v36 = -[PDContainer perfdata](self, "perfdata");
        [v36 objectForKeyedSubscript:@"generator"];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setGenerator:](self, "setGenerator:", v37);
        v38 = -[PDContainer generator](self, "generator");
        if (v38)
        {
          v39 = -[PDContainer generator](self, "generator");
          objc_opt_class();
          char v40 = objc_opt_isKindOfClass();

          if ((v40 & 1) == 0)
          {
            v41 = @"perfdata generator";
            goto LABEL_31;
          }
        }

        else
        {
          -[PDContainer setGenerator:](self, "setGenerator:", @"<unknown>");
        }
        v43 = -[PDContainer perfdata](self, "perfdata");
        expect_dictionary(v43, (uint64_t)@"variables", p_isa, @"perfdata variables");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setVariables:](self, "setVariables:", v44);
        v45 = -[PDContainer variables](self, "variables");
        if (!v45) {
          goto LABEL_41;
        }
        v46 = -[PDContainer perfdata](self, "perfdata");
        expect_dictionary(v46, (uint64_t)@"configuration", p_isa, @"perfdata configuration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setConfiguration:](self, "setConfiguration:", v47);
        v48 = -[PDContainer configuration](self, "configuration");
        if (!v48)
        {
LABEL_41:
          p_isa = 0LL;
          goto LABEL_33;
        }
        v49 = -[PDContainer perfdata](self, "perfdata");
        [v49 objectForKeyedSubscript:@"notes"];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDContainer setNotes:](self, "setNotes:", v50);

        uint64_t v51 = -[PDContainer notes](self, "notes");
        if (!v51
          || (v52 = (void *)v51,
              -[PDContainer notes](self, "notes"),
              v53 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char v54 = objc_opt_isKindOfClass(),
              v53,
              v52,
              (v54 & 1) != 0))
        {
          v42 = self;
          goto LABEL_32;
        }

        v41 = @"perfdata notes";
LABEL_31:
        handle_malformed_data(p_isa, v41);
        v42 = (PDContainer *)objc_claimAutoreleasedReturnValue();
LABEL_32:
        p_isa = (id *)&v42->super.isa;
LABEL_33:

        goto LABEL_34;
      }

      v29 = @"perfdata description";
    }

    else
    {
      v29 = @"perfdata version";
    }

    handle_malformed_data(p_isa, v29);
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_34:

    goto LABEL_17;
  }

  handle_malformed_data(p_isa, @"perfdata object");
  p_isa = (id *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return (PDContainer *)p_isa;
}

+ (PDContainer)containerWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[PDContainer initWithJSONDictionary:error:]( objc_alloc(&OBJC_CLASS___PDContainer),  "initWithJSONDictionary:error:",  v5,  a4);

  return v6;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PDContainer name](self, "name");
  [v3 stringWithFormat:@"PerfData: %@ v%lu", v4, -[PDContainer version](self, "version")];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isComparableTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PDContainer version](self, "version");
  if (v5 == [v4 version])
  {
    -[PDContainer name](self, "name");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 name];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v6 isEqualToString:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isLike:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || -[PDContainer isComparableTo:](self, "isComparableTo:", v4);

  return v5;
}

- (unint64_t)measurementCount
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v2 = -[PDContainer perfdata](self, "perfdata");
  [v2 objectForKeyedSubscript:@"data"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0LL;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0) {
              v7 += objc_msgSend(v10, "count", (void)v12);
            }
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }

    else
    {
      unint64_t v7 = 0LL;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)enumerateMeasurementsWithError:(id *)a3 usingBlock:(id)a4
{
  return -[PDContainer enumerateMeasurementsMatchingNullableFilter:error:usingBlock:]( self,  "enumerateMeasurementsMatchingNullableFilter:error:usingBlock:",  0LL,  a3,  a4);
}

- (BOOL)enumerateMeasurementsMatchingNullableFilter:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  v10 = -[PDContainer perfdata](self, "perfdata");
  [v10 objectForKeyedSubscript:@"data"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!v8)
      {
        v44 = 0LL;
        __int128 v14 = 0LL;
        goto LABEL_10;
      }

      if ([v8 length])
      {
        strip_container_prefix(self, v8);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

        get_metric_filter_metric(v12);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = get_metric_filter_variables(v12, a4);
        if (!v13)
        {
          BOOL v15 = 0;
          id v8 = v12;
LABEL_42:

          goto LABEL_43;
        }

        __int128 v14 = (void *)v13;
        id v8 = v12;
LABEL_10:
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id v17 = v11;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v18)
        {
          uint64_t v43 = 0LL;
          uint64_t v19 = *(void *)v51;
          v39 = v17;
          uint64_t v37 = *(void *)v51;
          while (2)
          {
            uint64_t v20 = 0LL;
            uint64_t v36 = v18;
            do
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v17);
              }
              v21 = *(void **)(*((void *)&v50 + 1) + 8 * v20);
              if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                id v34 = (id)handle_malformed_data(a4, @"perfdata group");
                BOOL v15 = 0;
                id v17 = v39;
                goto LABEL_41;
              }

              __int128 v48 = 0u;
              __int128 v49 = 0u;
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              id obj = v21;
              uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v42 = *(void *)v47;
                id v40 = v9;
                id v38 = v8;
                uint64_t v35 = v20;
                while (2)
                {
                  for (uint64_t i = 0LL; i != v23; ++i)
                  {
                    if (*(void *)v47 != v42) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                    if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      id v32 = (id)handle_malformed_data( a4,  @"perfdata measurement");
                      BOOL v15 = 0;
LABEL_40:

                      id v17 = v39;
                      id v9 = v40;
                      id v8 = v38;
                      goto LABEL_41;
                    }

                    v26 = a4;
                    v27 = -[PDMeasurement initWithContainer:dictionary:group:error:]( objc_alloc(&OBJC_CLASS___PDMeasurement),  "initWithContainer:dictionary:group:error:",  self,  v25,  v43,  a4);
                    v28 = v27;
                    BOOL v15 = v27 != 0LL;
                    if (!v27) {
                      goto LABEL_39;
                    }
                    if (!v44
                      || (-[PDMeasurement metric](v27, "metric"),
                          v29 = v14,
                          v30 = (void *)objc_claimAutoreleasedReturnValue(),
                          int v31 = [v30 isEqualToString:v44],
                          v30,
                          __int128 v14 = v29,
                          v31))
                    {
                      if (!v14
                        || -[PDMeasurement matchesVariables:ignoringMissing:]( v28,  "matchesVariables:ignoringMissing:",  v14,  0LL))
                      {
                        char v45 = 0;
                        (*((void (**)(id, PDMeasurement *, char *))v40 + 2))(v40, v28, &v45);
                        if (v45)
                        {
LABEL_39:

                          goto LABEL_40;
                        }
                      }
                    }

                    a4 = v26;
                  }

                  uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
                  id v9 = v40;
                  id v8 = v38;
                  uint64_t v20 = v35;
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              ++v43;
              ++v20;
              uint64_t v19 = v37;
              id v17 = v39;
            }

            while (v20 != v36);
            uint64_t v18 = [v39 countByEnumeratingWithState:&v50 objects:v55 count:16];
            uint64_t v19 = v37;
            BOOL v15 = 1;
            if (v18) {
              continue;
            }
            break;
          }
        }

        else
        {
          BOOL v15 = 1;
        }

- (BOOL)enumerateAggregatedMeasurementsIgnoringVariables:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  return -[PDContainer enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:]( self,  "enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:",  0LL,  a3,  a4,  a5);
}

- (BOOL)enumerateAggregatedMeasurementsMatchingNullableFilter:(id)a3 ignoringVariables:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  __int128 v12 = (void (**)(id, void *, _BYTE *))a6;
  uint64_t v13 = (void *)objc_opt_new();
  __int128 v14 = (void *)objc_opt_new();
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke;
  v35[3] = &unk_189E48928;
  id v15 = v11;
  id v36 = v15;
  id v16 = v13;
  id v37 = v16;
  id v38 = self;
  id v17 = v14;
  id v39 = v17;
  BOOL v18 = -[PDContainer enumerateMeasurementsMatchingNullableFilter:error:usingBlock:]( self,  "enumerateMeasurementsMatchingNullableFilter:error:usingBlock:",  v10,  a5,  v35);
  if (v18)
  {
    id v28 = v15;
    id v29 = v10;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
LABEL_4:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        [v16 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * v23)];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24) {
          -[PDContainer enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:].cold.1();
        }
        uint64_t v25 = v24;
        unsigned __int8 v30 = 0;
        [v24 measurement];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v26, &v30);

        LODWORD(v26) = v30;
        if ((_DWORD)v26) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v21) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v15 = v28;
    id v10 = v29;
  }

  return v18;
}

void __104__PDContainer_enumerateAggregatedMeasurementsMatchingNullableFilter_ignoringVariables_error_usingBlock___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "metricFilterIgnoringVariables:");
  }
  else {
    [v3 metricFilter];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
  uint64_t v5 = (PDAggregateMeasurement *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    unint64_t v7 = objc_alloc(&OBJC_CLASS___PDAggregateMeasurement);
    uint64_t v8 = *(void *)(a1 + 48);
    [v11 metric];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 unitString];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = -[PDAggregateMeasurement initWithContainer:metric:unitString:]( v7,  "initWithContainer:metric:unitString:",  v8,  v9,  v10);
    [v6 setObject:v5 forKeyedSubscript:v4];

    [*(id *)(a1 + 56) addObject:v4];
  }

  -[PDAggregateMeasurement updateWithMeasurement:](v5, "updateWithMeasurement:", v11);
}

- (id)aggregateMeasurementsMatchingFilter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy_;
  __int128 v14 = __Block_byref_object_dispose_;
  id v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke;
  v9[3] = &unk_189E48950;
  v9[4] = self;
  v9[5] = &v10;
  if (-[PDContainer enumerateMeasurementsMatchingFilter:error:usingBlock:]( self,  "enumerateMeasurementsMatchingFilter:error:usingBlock:",  v6,  a4,  v9))
  {
    [(id)v11[5] measurement];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  _Block_object_dispose(&v10, 8);

  return v7;
}

void __57__PDContainer_aggregateMeasurementsMatchingFilter_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v3)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PDAggregateMeasurement);
    uint64_t v5 = *(void *)(a1 + 32);
    [v11 metric];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 unitString];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[PDAggregateMeasurement initWithContainer:metric:unitString:]( v4,  "initWithContainer:metric:unitString:",  v5,  v6,  v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  [v3 updateWithMeasurement:v11];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSString)testDescription
{
  return self->_testDescription;
}

- (void)setTestDescription:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSString)primaryMetricFilter
{
  return self->_primaryMetricFilter;
}

- (void)setPrimaryMetricFilter:(id)a3
{
}

- (NSString)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (BOOL)largerBetter
{
  return self->_largerBetter;
}

- (void)setLargerBetter:(BOOL)a3
{
  self->_largerBetter = a3;
}

- (NSMutableDictionary)perfdata
{
  return self->_perfdata;
}

- (void)setPerfdata:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)enumerateAggregatedMeasurementsMatchingNullableFilter:ignoringVariables:error:usingBlock:.cold.1()
{
  v0 = (const __CFArray *)_os_crash();
  __break(1u);
  CFArrayGetCount(v0);
}

@end