@interface PDAggregateMeasurement
- (BOOL)validMax;
- (BOOL)validMin;
- (NSMutableDictionary)labels;
- (NSMutableDictionary)variables;
- (NSString)metric;
- (NSString)unitString;
- (PDAggregateMeasurement)initWithContainer:(id)a3 metric:(id)a4 unitString:(id)a5;
- (PDContainer)container;
- (PDMeasurement)measurement;
- (double)max;
- (double)min;
- (pooled_mean)stats_mean;
- (running_mean)values_mean;
- (unint64_t)samples;
- (void)dealloc;
- (void)setContainer:(id)a3;
- (void)setLabels:(id)a3;
- (void)setMax:(double)a3;
- (void)setMetric:(id)a3;
- (void)setMin:(double)a3;
- (void)setSamples:(unint64_t)a3;
- (void)setStats_mean:(pooled_mean *)a3;
- (void)setUnitString:(id)a3;
- (void)setValidMax:(BOOL)a3;
- (void)setValidMin:(BOOL)a3;
- (void)setValues_mean:(running_mean *)a3;
- (void)setVariables:(id)a3;
- (void)updateWithMeasurement:(id)a3;
@end

@implementation PDAggregateMeasurement

- (PDAggregateMeasurement)initWithContainer:(id)a3 metric:(id)a4 unitString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDAggregateMeasurement;
  v11 = -[PDAggregateMeasurement init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PDAggregateMeasurement setContainer:](v11, "setContainer:", v8);
    -[PDAggregateMeasurement setMetric:](v12, "setMetric:", v9);
    -[PDAggregateMeasurement setUnitString:](v12, "setUnitString:", v10);
    -[PDAggregateMeasurement setValues_mean:](v12, "setValues_mean:", calloc(1uLL, 0x18uLL));
    -[PDAggregateMeasurement setStats_mean:](v12, "setStats_mean:", calloc(1uLL, 0x30uLL));
    -[PDAggregateMeasurement setValidMin:](v12, "setValidMin:", 1LL);
    -[PDAggregateMeasurement setMin:](v12, "setMin:", 1.79769313e308);
    -[PDAggregateMeasurement setValidMax:](v12, "setValidMax:", 1LL);
    -[PDAggregateMeasurement setMax:](v12, "setMax:", 2.22507386e-308);
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAggregateMeasurement;
  -[PDAggregateMeasurement dealloc](&v3, sel_dealloc);
}

- (void)updateWithMeasurement:(id)a3
{
  uint64_t v103 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[PDAggregateMeasurement variables](self, "variables");
  v90 = self;
  id v92 = v4;
  if (v5)
  {
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    v6 = -[PDAggregateMeasurement variables](self, "variables");
    [v6 allKeys];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [v7 countByEnumeratingWithState:&v97 objects:v102 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v98;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v98 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v97 + 1) + 8 * i);
          objc_msgSend(v4, "variables", v90);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 objectForKeyedSubscript:v12];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDAggregateMeasurement variables](self, "variables");
          objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKeyedSubscript:v12];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          char v17 = [v14 isEqual:v16];

          self = v90;
          if ((v17 & 1) == 0)
          {
            v18 = -[PDAggregateMeasurement variables](v90, "variables");
            [v18 removeObjectForKey:v12];
          }

          id v4 = v92;
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v97 objects:v102 count:16];
      }

      while (v9);
    }
  }

  else
  {
    [v4 variables];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)[v19 mutableCopy];
    -[PDAggregateMeasurement setVariables:](self, "setVariables:", v20);
  }
  v21 = -[PDAggregateMeasurement labels](self, "labels", v90);
  if (!v21)
  {
    [MEMORY[0x189603FC8] dictionary];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDAggregateMeasurement setLabels:](self, "setLabels:", v22);
  }

  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  [v4 labels];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 allKeys];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v24;
  uint64_t v26 = [v24 countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v94;
    do
    {
      for (uint64_t j = 0LL; j != v27; ++j)
      {
        if (*(void *)v94 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v93 + 1) + 8 * j);
        v31 = -[PDAggregateMeasurement labels](self, "labels");
        [v31 objectForKeyedSubscript:v30];
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          [v4 labels];
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 objectForKeyedSubscript:v30];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 unionSet:v34];
        }

        else
        {
          v33 = -[PDAggregateMeasurement labels](self, "labels");
          v35 = (void *)MEMORY[0x189603FE0];
          [v4 labels];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 objectForKeyedSubscript:v30];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 setWithSet:v36];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v33 setValue:v37 forKey:v30];

          self = v91;
          id v4 = v92;
        }
      }

      uint64_t v27 = [v25 countByEnumeratingWithState:&v93 objects:v101 count:16];
    }

    while (v27);
  }

  [v4 value];
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    [v4 value];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v40 doubleValue];
    uint64_t v41 = v39->var2 + 1;
    double v43 = v42 - v39->var0;
    double v44 = v39->var0 + v43 / (double)(unint64_t)v41;
    double v45 = v39->var1 + v43 * (v42 - v44);
    v39->var0 = v44;
    v39->var1 = v45;
    v39->var2 = v41;

    [v4 value];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 doubleValue];
    double v48 = v47;
    -[PDAggregateMeasurement min](self, "min");
    double v50 = v49;

    if (v48 < v50)
    {
      [v4 value];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      [v51 doubleValue];
      -[PDAggregateMeasurement setMin:](self, "setMin:");
    }

    [v4 value];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v52 doubleValue];
    double v54 = v53;
    -[PDAggregateMeasurement max](self, "max");
    double v56 = v55;

    if (v54 > v56)
    {
      [v4 value];
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      [v57 doubleValue];
      -[PDAggregateMeasurement setMax:](self, "setMax:");
    }

    -[PDAggregateMeasurement setSamples:](self, "setSamples:", -[PDAggregateMeasurement samples](self, "samples") + 1);
  }

  else
  {
    [v4 sampleCount];
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      uint64_t v59 = [v4 mean];
      if (v59)
      {
        v60 = (void *)v59;
        [v4 standardDeviation];
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          v62 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
          [v4 sampleCount];
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v64 = [v63 unsignedIntegerValue];
          [v4 mean];
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          [v65 doubleValue];
          double v67 = v66;
          [v4 standardDeviation];
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          [v68 doubleValue];
          int64x2_t v69 = vdupq_n_s64(1uLL);
          v69.i64[0] = v64;
          *(int64x2_t *)&v62->var2 = vaddq_s64(*(int64x2_t *)&v62->var2, v69);
          v69.i64[0] = *(void *)&v62->var1.var0;
          double v71 = v70 * v70 * (double)(v64 - 1) - v62->var1.var1;
          v62->var1.var0 = *(double *)v69.i64 + v71;
          v62->var1.var1 = *(double *)v69.i64 + v71 - *(double *)v69.i64 - v71;
          double v72 = v67 * (double)v64 - v62->var0.var1;
          double v73 = v62->var0.var0 + v72;
          double v74 = v73 - v62->var0.var0 - v72;
          v62->var0.var0 = v73;
          v62->var0.var1 = v74;
        }
      }

      [v4 minimum];
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        [v4 minimum];
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        [v76 doubleValue];
        double v78 = v77;
        -[PDAggregateMeasurement min](self, "min");
        double v80 = v79;

        if (v78 < v80)
        {
          [v4 minimum];
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          [v81 doubleValue];
          -[PDAggregateMeasurement setMin:](self, "setMin:");
        }
      }

      else
      {
        -[PDAggregateMeasurement setValidMin:](self, "setValidMin:", 0LL);
      }

      [v4 maximum];
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        [v4 maximum];
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        [v83 doubleValue];
        double v85 = v84;
        -[PDAggregateMeasurement max](self, "max");
        double v87 = v86;

        if (v85 > v87)
        {
          [v4 maximum];
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          [v88 doubleValue];
          -[PDAggregateMeasurement setMax:](self, "setMax:");
        }
      }

      else
      {
        -[PDAggregateMeasurement setValidMax:](self, "setValidMax:", 0LL);
      }

      [v4 sampleCount];
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDAggregateMeasurement setSamples:]( self,  "setSamples:",  -[PDAggregateMeasurement samples](self, "samples") + [v89 unsignedIntegerValue]);
    }
  }
}

- (PDMeasurement)measurement
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PDMeasurement);
  -[PDAggregateMeasurement container](self, "container");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setContainer:](v3, "setContainer:", v4);
  v5 = -[PDAggregateMeasurement metric](self, "metric");
  -[PDMeasurement setMetric:](v3, "setMetric:", v5);
  v6 = -[PDAggregateMeasurement unitString](self, "unitString");
  -[PDMeasurement setUnitString:](v3, "setUnitString:", v6);
  v7 = -[PDAggregateMeasurement variables](self, "variables");
  -[PDMeasurement setVariables:](v3, "setVariables:", v7);

  -[PDAggregateMeasurement labels](self, "labels");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setLabels:](v3, "setLabels:", v8);

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[PDAggregateMeasurement samples](self, "samples"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setSampleCount:](v3, "setSampleCount:", v9);

  if ((void)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40]
    && (void)-[PDAggregateMeasurement values_mean](self, "values_mean")[16])
  {
    unint64_t v10 = (unint64_t)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40];
    v11 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    double v12 = v11->var0.var0 / (double)v11->var2;
    v13 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    double v14 = sqrt(v13->var1.var0 / (double)(v13->var2 - v13->var3));
    double v15 = v14 * v14 * (double)(v10 - 1);
    double v16 = 0.0;
    double v17 = v15 + 0.0;
    double v18 = v15 + 0.0 - v15;
    double v19 = v12 * (double)v10;
    double v20 = v19 + 0.0;
    double v21 = v19 + 0.0 - v19;
    unint64_t v22 = (unint64_t)-[PDAggregateMeasurement values_mean](self, "values_mean")[16];
    double v23 = *(double *)-[PDAggregateMeasurement values_mean](self, "values_mean");
    v24 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    unint64_t var2 = v24->var2;
    if (var2 >= 2) {
      double v16 = sqrt(v24->var1 / (double)(var2 - 1));
    }
    unint64_t v26 = v22 + v10;
    [MEMORY[0x189607968] numberWithDouble:(v20 + v23 * (double)v22 - v21) / (double)(v22 + v10)];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v27);

    uint64_t v28 = (void *)MEMORY[0x189607968];
    double v29 = sqrt((v17 + v16 * v16 * (double)(v22 - 1) - v18) / (double)(v26 - 2));
    goto LABEL_10;
  }

  if ((void)-[PDAggregateMeasurement stats_mean](self, "stats_mean")[40])
  {
    uint64_t v30 = (void *)MEMORY[0x189607968];
    v31 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    [v30 numberWithDouble:v31->var0.var0 / (double)v31->var2];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v32);

    v33 = (void *)MEMORY[0x189607968];
    v34 = -[PDAggregateMeasurement stats_mean](self, "stats_mean");
    double var0 = v34->var1.var0;
    unint64_t v36 = v34->var2 - v34->var3;
  }

  else
  {
    if (!(void)-[PDAggregateMeasurement values_mean](self, "values_mean")[16])
    {
      double v48 = 0LL;
      goto LABEL_17;
    }

    objc_msgSend( MEMORY[0x189607968],  "numberWithDouble:",  *(double *)-[PDAggregateMeasurement values_mean](self, "values_mean"));
    double v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDMeasurement setMean:](v3, "setMean:", v50);

    v33 = (void *)MEMORY[0x189607968];
    v51 = -[PDAggregateMeasurement values_mean](self, "values_mean");
    unint64_t v52 = v51->var2;
    double v29 = 0.0;
    if (v52 < 2) {
      goto LABEL_9;
    }
    double var0 = v51->var1;
    unint64_t v36 = v52 - 1;
  }

  double v29 = sqrt(var0 / (double)v36);
LABEL_9:
  uint64_t v28 = v33;
LABEL_10:
  [v28 numberWithDouble:v29];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDMeasurement setStandardDeviation:](v3, "setStandardDeviation:", v37);

  uint64_t v38 = -[PDMeasurement sampleCount](v3, "sampleCount");
  if (v38)
  {
    v39 = (void *)v38;
    BOOL v40 = -[PDAggregateMeasurement validMin](self, "validMin");

    if (v40)
    {
      uint64_t v41 = (void *)MEMORY[0x189607968];
      -[PDAggregateMeasurement min](self, "min");
      objc_msgSend(v41, "numberWithDouble:");
      double v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setMinimum:](v3, "setMinimum:", v42);
    }
  }

  uint64_t v43 = -[PDMeasurement sampleCount](v3, "sampleCount");
  if (v43)
  {
    double v44 = (void *)v43;
    BOOL v45 = -[PDAggregateMeasurement validMax](self, "validMax");

    if (v45)
    {
      v46 = (void *)MEMORY[0x189607968];
      -[PDAggregateMeasurement max](self, "max");
      objc_msgSend(v46, "numberWithDouble:");
      double v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDMeasurement setMaximum:](v3, "setMaximum:", v47);
    }
  }

  double v48 = v3;
LABEL_17:

  return v48;
}

- (NSMutableDictionary)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (PDContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
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

- (NSMutableDictionary)variables
{
  return self->_variables;
}

- (void)setVariables:(id)a3
{
}

- (running_mean)values_mean
{
  return self->_values_mean;
}

- (void)setValues_mean:(running_mean *)a3
{
  self->_values_mean = a3;
}

- (pooled_mean)stats_mean
{
  return self->_stats_mean;
}

- (void)setStats_mean:(pooled_mean *)a3
{
  self->_stats_mean = a3;
}

- (BOOL)validMin
{
  return self->_validMin;
}

- (void)setValidMin:(BOOL)a3
{
  self->_validMin = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (BOOL)validMax
{
  return self->_validMax;
}

- (void)setValidMax:(BOOL)a3
{
  self->_validMax = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (unint64_t)samples
{
  return self->_samples;
}

- (void)setSamples:(unint64_t)a3
{
  self->_samples = a3;
}

- (void).cxx_destruct
{
}

@end