@interface PDMeasurement
- (BOOL)enumerateHistogramBucketsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)enumeratePercentilesWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)isComparableTo:(id)a3;
- (BOOL)isComparableTo:(id)a3 ignoringNullableVariables:(id)a4;
- (BOOL)isContext;
- (BOOL)isLike:(id)a3;
- (BOOL)isSummary;
- (BOOL)largerBetter;
- (BOOL)matchesMetricFilter:(id)a3;
- (BOOL)matchesVariables:(id)a3 ignoringMissing:(BOOL)a4;
- (NSDictionary)labels;
- (NSDictionary)measurement;
- (NSDictionary)variables;
- (NSNumber)maximum;
- (NSNumber)mean;
- (NSNumber)minimum;
- (NSNumber)sampleCount;
- (NSNumber)standardDeviation;
- (NSNumber)value;
- (NSString)cachedMetricFilter;
- (NSString)metric;
- (NSString)unitString;
- (PDContainer)container;
- (PDMeasurement)initWithContainer:(id)a3 dictionary:(id)a4 group:(unint64_t)a5 error:(id *)a6;
- (id)description;
- (id)metricFilter;
- (id)metricFilterIgnoringNullableVariables:(id)a3;
- (unint64_t)group;
- (unint64_t)histogramBucketCount;
- (unint64_t)percentileCount;
- (void)setCachedMetricFilter:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContext:(BOOL)a3;
- (void)setGroup:(unint64_t)a3;
- (void)setLabels:(id)a3;
- (void)setLargerBetter:(BOOL)a3;
- (void)setMaximum:(id)a3;
- (void)setMean:(id)a3;
- (void)setMeasurement:(id)a3;
- (void)setMetric:(id)a3;
- (void)setMinimum:(id)a3;
- (void)setSampleCount:(id)a3;
- (void)setStandardDeviation:(id)a3;
- (void)setSummary:(BOOL)a3;
- (void)setUnitString:(id)a3;
- (void)setValue:(id)a3;
- (void)setVariables:(id)a3;
@end

@implementation PDMeasurement

- (PDMeasurement)initWithContainer:(id)a3 dictionary:(id)a4 group:(unint64_t)a5 error:(id *)a6
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  v95.receiver = self;
  v95.super_class = (Class)&OBJC_CLASS___PDMeasurement;
  v12 = -[PDMeasurement init](&v95, sel_init);
  v13 = v12;
  if (v12)
  {
    -[PDMeasurement setContainer:](v12, "setContainer:", v10);
    -[PDMeasurement setMeasurement:](v13, "setMeasurement:", v11);
    -[PDMeasurement setGroup:](v13, "setGroup:", a5);
    [v11 objectForKeyedSubscript:@"metric"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || (unint64_t v15 = 0x189607000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, @"measurement metric");
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }

    -[PDMeasurement setMetric:](v13, "setMetric:", v14);
    [v11 objectForKeyedSubscript:@"unit"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handle_malformed_data(a6, @"measurement unit");
      v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_53:

      goto LABEL_54;
    }

    v79 = a6;
    -[PDMeasurement setUnitString:](v13, "setUnitString:", v16);
    uint64_t v17 = [v11 objectForKeyedSubscript:@"variables"];
    v78 = (void *)v17;
    if (v17)
    {
      uint64_t v18 = v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        handle_malformed_data(a6, @"measurement variables");
        v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_52:

        goto LABEL_53;
      }

      [v10 variables];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        -[PDMeasurement setVariables:](v13, "setVariables:", v18);
LABEL_15:
        [v11 objectForKeyedSubscript:@"labels"];
        id v86 = v11;
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v80)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            handle_malformed_data(v79, @"measurement labels");
            v24 = (PDMeasurement *)objc_claimAutoreleasedReturnValue();
LABEL_51:

            goto LABEL_52;
          }

          [v10 labels];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v25 count];

          id v76 = v10;
          if (v26)
          {
            [v10 labels];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)[v27 mutableCopy];
            -[PDMeasurement setLabels:](v13, "setLabels:", v28);
          }

          else
          {
            [MEMORY[0x189603FC8] dictionary];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDMeasurement setLabels:](v13, "setLabels:", v27);
          }

          __int128 v93 = 0u;
          __int128 v94 = 0u;
          __int128 v91 = 0u;
          __int128 v92 = 0u;
          v30 = v80;
          [v80 allKeys];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v84 = [v29 countByEnumeratingWithState:&v91 objects:v97 count:16];
          if (v84)
          {
            v81 = v29;
            uint64_t v82 = *(void *)v92;
            while (2)
            {
              uint64_t v31 = 0LL;
              do
              {
                if (*(void *)v92 != v82) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v32 = *(void *)(*((void *)&v91 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  handle_malformed_data(v79, @"measurement label key");
                  objc_claimAutoreleasedReturnValue();

                  v24 = 0LL;
                  id v10 = v76;
                  goto LABEL_51;
                }

                unint64_t v33 = v15;
                [v30 objectForKeyedSubscript:v32];
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = -[PDMeasurement labels](v13, "labels");
                [v35 objectForKeyedSubscript:v32];
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (v36)
                {
                  [v36 addObject:v34];
                }

                else
                {
                  v37 = -[PDMeasurement labels](v13, "labels");
                  [MEMORY[0x189603FE0] setWithObject:v34];
                  v38 = v14;
                  v39 = v16;
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  [v37 setValue:v40 forKey:v32];

                  v16 = v39;
                  v14 = v38;
                  v30 = v80;
                }

                ++v31;
                unint64_t v15 = v33;
                id v11 = v86;
                v29 = v81;
              }

              while (v84 != v31);
              uint64_t v84 = [v81 countByEnumeratingWithState:&v91 objects:v97 count:16];
              if (v84) {
                continue;
              }
              break;
            }
          }

          id v10 = v76;
        }

        else
        {
          [v10 labels];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setLabels:](v13, "setLabels:", v29);
        }

        [v11 objectForKeyedSubscript:@"larger_better"];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if ((not_a_number(v41, v79, @"measurement larger_better") & 1) != 0)
        {
          v24 = 0LL;
        }

        else
        {
          v85 = v41;
          unint64_t v42 = v15;
          if (v41) {
            uint64_t v43 = [v41 BOOLValue];
          }
          else {
            uint64_t v43 = 0LL;
          }
          -[PDMeasurement setLargerBetter:](v13, "setLargerBetter:", v43, v10, v78);
          [v11 objectForKeyedSubscript:@"value"];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setValue:](v13, "setValue:", v44);
          v45 = -[PDMeasurement value](v13, "value");
          char v46 = not_a_number(v45, v79, @"measurement value");

          if ((v46 & 1) != 0) {
            goto LABEL_48;
          }
          [v11 objectForKeyedSubscript:@"samples"];
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setSampleCount:](v13, "setSampleCount:", v47);
          v48 = -[PDMeasurement sampleCount](v13, "sampleCount");
          char v49 = not_a_number(v48, v79, @"measurement samples");

          if ((v49 & 1) != 0) {
            goto LABEL_48;
          }
          [v11 objectForKeyedSubscript:@"mean"];
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMean:](v13, "setMean:", v50);
          v51 = -[PDMeasurement mean](v13, "mean");
          char v52 = not_a_number(v51, v79, @"measurement mean");

          if ((v52 & 1) != 0) {
            goto LABEL_48;
          }
          [v11 objectForKeyedSubscript:@"std_dev"];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setStandardDeviation:](v13, "setStandardDeviation:", v53);
          v54 = -[PDMeasurement standardDeviation](v13, "standardDeviation");
          char v55 = not_a_number(v54, v79, @"measurement std_dev");

          if ((v55 & 1) != 0) {
            goto LABEL_48;
          }
          [v11 objectForKeyedSubscript:@"minimum"];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMinimum:](v13, "setMinimum:", v56);
          v57 = -[PDMeasurement minimum](v13, "minimum");
          char v58 = not_a_number(v57, v79, @"measurement minimum");

          if ((v58 & 1) != 0) {
            goto LABEL_48;
          }
          [v11 objectForKeyedSubscript:@"maximum"];
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDMeasurement setMaximum:](v13, "setMaximum:", v59);
          v60 = -[PDMeasurement maximum](v13, "maximum");
          char v61 = not_a_number(v60, v79, @"measurement maximum");

          if ((v61 & 1) != 0)
          {
LABEL_48:
            v24 = 0LL;
          }

          else
          {
            v83 = v16;
            __int128 v89 = 0u;
            __int128 v90 = 0u;
            __int128 v87 = 0u;
            __int128 v88 = 0u;
            v63 = -[PDMeasurement measurement](v13, "measurement");
            [v63 objectForKeyedSubscript:@"tags"];
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = v64;
            uint64_t v66 = [v64 countByEnumeratingWithState:&v87 objects:v96 count:16];
            if (v66)
            {
              uint64_t v67 = v66;
              uint64_t v68 = *(void *)v88;
              do
              {
                for (uint64_t i = 0LL; i != v67; ++i)
                {
                  if (*(void *)v88 != v68) {
                    objc_enumerationMutation(v65);
                  }
                  v70 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    [*(id *)(v42 + 2600) stringWithUTF8String:pdtag_summary];
                    unint64_t v71 = v42;
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    int v73 = [v70 isEqualToString:v72];

                    if (v73)
                    {
                      -[PDMeasurement setSummary:](v13, "setSummary:", 1LL);
                      unint64_t v42 = v71;
                      id v11 = v86;
                    }

                    else
                    {
                      [*(id *)(v71 + 2600) stringWithUTF8String:pdtag_context];
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      int v75 = [v70 isEqualToString:v74];

                      unint64_t v42 = v71;
                      id v11 = v86;
                      if (v75) {
                        -[PDMeasurement setContext:](v13, "setContext:", 1LL);
                      }
                    }
                  }
                }

                uint64_t v67 = [v65 countByEnumeratingWithState:&v87 objects:v96 count:16];
              }

              while (v67);
            }

            v24 = v13;
            v16 = v83;
          }

          id v10 = v77;
          v41 = v85;
        }

        goto LABEL_51;
      }

      [v10 variables];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)[v21 mutableCopy];
      -[PDMeasurement setVariables:](v13, "setVariables:", v22);
      v23 = -[PDMeasurement variables](v13, "variables");
      [v23 setValuesForKeysWithDictionary:v18];
    }

    else
    {
      [v10 variables];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setVariables:](v13, "setVariables:", v23);
    }

    goto LABEL_15;
  }

  v24 = 0LL;
LABEL_55:

  return v24;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PDMeasurement metric](self, "metric");
  v5 = -[PDMeasurement unitString](self, "unitString");
  [v3 stringWithFormat:@"PDMeasurement: %@ (%@)", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)matchesMetricFilter:(id)a3
{
  id v4 = a3;
  v5 = -[PDMeasurement container](self, "container");
  strip_container_prefix(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  get_metric_filter_metric(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PDMeasurement metric](self, "metric");
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    get_metric_filter_variables(v6, 0LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      BOOL v11 = -[PDMeasurement matchesVariables:ignoringMissing:](self, "matchesVariables:ignoringMissing:", v10, 0LL);
    }
    else {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)matchesVariables:(id)a3 ignoringMissing:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = -[PDMeasurement variables](self, "variables", (void)v18);
        [v12 objectForKeyedSubscript:v11];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a4 && !v13
          || v13
          && ([v6 objectForKeyedSubscript:v11],
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              char v15 = [v13 isEqual:v14],
              v14,
              (v15 & 1) == 0))
        {

          BOOL v16 = 0;
          goto LABEL_15;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v16 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v16 = 1;
  }

- (id)metricFilter
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PDMeasurement metricFilterIgnoringNullableVariables:](self, "metricFilterIgnoringNullableVariables:", 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setCachedMetricFilter:](self, "setCachedMetricFilter:", v4);
  }

  return -[PDMeasurement cachedMetricFilter](self, "cachedMetricFilter");
}

- (id)metricFilterIgnoringNullableVariables:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[PDMeasurement container](self, "container");
  [v5 name];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v6 mutableCopy];

  -[PDMeasurement metric](self, "metric");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendFormat:@".%@", v8];

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[PDMeasurement variables](self, "variables");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 allKeys];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 sortedArrayUsingSelector:sel_compare_];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        if (!v4 || ([v4 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * v15)] & 1) == 0)
        {
          -[PDMeasurement variables](self, "variables");
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 objectForKeyedSubscript:v16];
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 appendFormat:@",%@=%@", v16, v18];
        }

        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v13);
  }

  return v7;
}

- (BOOL)isComparableTo:(id)a3
{
  return -[PDMeasurement isComparableTo:ignoringNullableVariables:]( self,  "isComparableTo:ignoringNullableVariables:",  a3,  0LL);
}

- (BOOL)isLike:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0 || -[PDMeasurement isComparableTo:](self, "isComparableTo:", v4);

  return v5;
}

- (BOOL)isComparableTo:(id)a3 ignoringNullableVariables:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PDMeasurement metric](self, "metric");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 metric];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v8 isEqualToString:v9])
  {
    char v15 = 0;
LABEL_10:

    goto LABEL_11;
  }

  -[PDMeasurement container](self, "container");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 container];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v10 isComparableTo:v11];

  if (v12)
  {
    if (v7 && [v7 count])
    {
      -[PDMeasurement variables](self, "variables");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = (void *)[v13 mutableCopy];

      [v8 removeObjectsForKeys:v7];
      [v6 variables];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (void *)[v14 mutableCopy];

      [v9 removeObjectsForKeys:v7];
    }

    else
    {
      -[PDMeasurement variables](self, "variables");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 variables];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    char v15 = [v8 isEqualToDictionary:v9];
    goto LABEL_10;
  }

  char v15 = 0;
LABEL_11:

  return v15;
}

- (unint64_t)histogramBucketCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"histogram"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 1);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      BOOL v5 = -[PDBucket initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___PDBucket),  "initWithDictionary:error:",  v4,  0LL);
      id v6 = v5;
      if (v5)
      {
        BOOL v7 = -[PDBucket count](v5, "count") == 0;
        unint64_t v8 = [v3 count] - v7;
      }

      else
      {
        unint64_t v8 = 0LL;
      }
    }

    else
    {
      unint64_t v8 = 0LL;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)enumerateHistogramBucketsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v6 = (void (**)(id, void *, _BYTE *))a4;
  -[PDMeasurement measurement](self, "measurement");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"histogram"];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = [v8 count];
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v15 = *(void *)v35;
        uint64_t v16 = v9 - 1;
        char v31 = 1;
        id obj = v10;
        v28 = self;
        uint64_t v29 = v9 - 1;
        while (2)
        {
          uint64_t v17 = 0LL;
          uint64_t v18 = v16 - v13;
          uint64_t v30 = v13 + v12;
          __int128 v19 = v14;
          do
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * v17);
            if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              id v26 = (id)handle_malformed_data(a3, @"histogram bucket");
              BOOL v22 = 0;
LABEL_25:

              goto LABEL_26;
            }

            __int128 v21 = -[PDBucket initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___PDBucket),  "initWithDictionary:error:",  v20,  a3);
            uint64_t v14 = v21;
            BOOL v22 = v21 != 0LL;
            if (!v21) {
              goto LABEL_24;
            }
            if (v19)
            {
              if (v18 == v17) {
                v31 &= -[PDBucket count](v21, "count") != 0;
              }
              -[PDBucket lowerInclusiveBound](v14, "lowerInclusiveBound", v28);
              -[PDBucket setUpperBound:](v19, "setUpperBound:");
              -[PDBucket setHasInclusiveUpperBound:](v19, "setHasInclusiveUpperBound:", 0LL);
              char v33 = 0;
              v6[2](v6, v19, &v33);
              if (v33)
              {
LABEL_24:

                goto LABEL_25;
              }
            }

            ++v17;
            __int128 v19 = v14;
          }

          while (v12 != v17);
          uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
          uint64_t v16 = v29;
          uint64_t v13 = v30;
          if (v12) {
            continue;
          }
          break;
        }

        if ((v31 & 1) != 0)
        {
          -[PDMeasurement maximum](v28, "maximum");
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[PDMeasurement maximum](v28, "maximum");
            [v24 doubleValue];
            -[PDBucket setUpperBound:](v14, "setUpperBound:");
          }

          else
          {
            -[PDBucket setUpperBound:](v14, "setUpperBound:", 1.79769313e308);
          }

          BOOL v22 = 1;
          -[PDBucket setHasInclusiveUpperBound:](v14, "setHasInclusiveUpperBound:", 1LL);
          char v33 = 0;
          v6[2](v6, v14, &v33);
        }

        else
        {
          BOOL v22 = 1;
        }

        __int128 v19 = v14;
      }

      else
      {

        __int128 v19 = 0LL;
        BOOL v22 = 1;
      }

- (unint64_t)percentileCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"percentiles"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 count];
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (BOOL)enumeratePercentilesWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  BOOL v7 = (void (**)(id, _BYTE *, double, double))a4;
  -[PDMeasurement measurement](self, "measurement");
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"percentiles"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    char v21 = 1;
    goto LABEL_28;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = (id)handle_malformed_data(a3, @"measurement percentiles");
    char v21 = 0;
    goto LABEL_28;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v11)
  {
    char v20 = 1;
    goto LABEL_27;
  }

  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0LL; i != v12; ++i)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v23 = (id)handle_malformed_data(a3, @"measurement percentile");
LABEL_23:
        char v20 = 0;
        LOBYTE(i) = 0;
        goto LABEL_27;
      }

      [v14 objectForKeyedSubscript:@"%"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v24 = (id)handle_malformed_data(a3, @"percentile %");

        goto LABEL_23;
      }

      [v14 objectForKeyedSubscript:@"value"];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v25 = (id)handle_malformed_data(a3, @"percentile value");
        LOBYTE(i) = 0;
LABEL_26:

        char v20 = 0;
        goto LABEL_27;
      }

      char v27 = 0;
      [v15 doubleValue];
      double v18 = v17;
      [v16 doubleValue];
      v7[2](v7, &v27, v18, v19);
      if (v27)
      {
        LOBYTE(i) = 1;
        goto LABEL_26;
      }
    }

    uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    char v20 = 1;
    if (v12) {
      continue;
    }
    break;
  }

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
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

- (unint64_t)group
{
  return self->_group;
}

- (void)setGroup:(unint64_t)a3
{
  self->_group = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(id)a3
{
}

- (NSNumber)mean
{
  return self->_mean;
}

- (void)setMean:(id)a3
{
}

- (NSNumber)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(id)a3
{
}

- (NSNumber)minimum
{
  return self->_minimum;
}

- (void)setMinimum:(id)a3
{
}

- (NSNumber)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(id)a3
{
}

- (BOOL)isSummary
{
  return self->_summary;
}

- (void)setSummary:(BOOL)a3
{
  self->_summary = a3;
}

- (BOOL)isContext
{
  return self->_context;
}

- (void)setContext:(BOOL)a3
{
  self->_context = a3;
}

- (NSDictionary)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(id)a3
{
}

- (PDContainer)container
{
  return (PDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
}

- (NSString)cachedMetricFilter
{
  return self->_cachedMetricFilter;
}

- (void)setCachedMetricFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end