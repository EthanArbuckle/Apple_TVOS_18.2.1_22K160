@interface TISweepSource
+ (id)sharedInstance;
- (BOOL)finished;
- (NSMutableDictionary)debugValues;
- (id)sweepStateHeader;
- (id)sweepStateValues;
- (int)stepCount;
- (void)addValue:(id)a3 withMin:(float)a4 withMax:(float)a5;
- (void)addValue:(id)a3 withValue:(float)a4;
- (void)advanceSweep;
- (void)setStepCount:(int)a3;
@end

@implementation TISweepSource

+ (id)sharedInstance
{
  v2 = (void *)qword_AA2E8;
  if (!qword_AA2E8)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TISweepSource);
    v4 = (void *)qword_AA2E8;
    qword_AA2E8 = (uint64_t)v3;

    v2 = (void *)qword_AA2E8;
  }

  return v2;
}

- (void)addValue:(id)a3 withMin:(float)a4 withMax:(float)a5
{
  id v17 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___TIDebugValue);
  *(float *)&double v9 = (float)(a4 + a5) * 0.5;
  -[TIDebugValue setDefaultValue:](v8, "setDefaultValue:", v9);
  *(float *)&double v10 = a4;
  -[TIDebugValue setSweepValue:](v8, "setSweepValue:", v10);
  *(float *)&double v11 = a4;
  -[TIDebugValue setSweepMin:](v8, "setSweepMin:", v11);
  *(float *)&double v12 = a5;
  -[TIDebugValue setSweepMax:](v8, "setSweepMax:", v12);
  *(float *)&double v13 = (float)(a5 - a4) / (float)self->stepCount;
  -[TIDebugValue setStepSize:](v8, "setStepSize:", v13);
  debugValues = self->debugValues;
  if (!debugValues)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v16 = self->debugValues;
    self->debugValues = v15;

    debugValues = self->debugValues;
  }

  -[NSMutableDictionary setObject:forKey:](debugValues, "setObject:forKey:", v8, v17);
}

- (void)addValue:(id)a3 withValue:(float)a4
{
  id v15 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___TIDebugValue);
  *(float *)&double v7 = a4;
  -[TIDebugValue setDefaultValue:](v6, "setDefaultValue:", v7);
  *(float *)&double v8 = a4;
  -[TIDebugValue setSweepValue:](v6, "setSweepValue:", v8);
  *(float *)&double v9 = a4;
  -[TIDebugValue setSweepMin:](v6, "setSweepMin:", v9);
  *(float *)&double v10 = a4;
  -[TIDebugValue setSweepMax:](v6, "setSweepMax:", v10);
  LODWORD(v11) = 0;
  -[TIDebugValue setStepSize:](v6, "setStepSize:", v11);
  debugValues = self->debugValues;
  if (!debugValues)
  {
    double v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v14 = self->debugValues;
    self->debugValues = v13;

    debugValues = self->debugValues;
  }

  -[NSMutableDictionary setObject:forKey:](debugValues, "setObject:forKey:", v6, v15);
}

- (id)sweepStateHeader
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v4 = self->debugValues;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@,", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)sweepStateValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v4 = self->debugValues;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      double v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->debugValues,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v8)));
        [v9 sweepValue];
        objc_msgSend(v3, "appendFormat:", @"%f,", v10);

        double v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (void)advanceSweep
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v3 = self->debugValues;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->debugValues,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16));
        [v8 sweepMax];
        float v10 = v9;
        [v8 sweepValue];
        if ((float)(v10 - v11) > 0.00000011921)
        {
          [v8 stepSize];
          float v13 = v12;
          [v8 sweepValue];
          *(float *)&double v15 = v13 + v14;
          [v8 setSweepValue:v15];

          goto LABEL_11;
        }

        [v8 sweepMin];
        objc_msgSend(v8, "setSweepValue:");
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

- (BOOL)finished
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  v3 = self->debugValues;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->debugValues,  "objectForKey:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  (void)v15));
        [v8 sweepMax];
        float v10 = v9;
        [v8 sweepValue];
        float v12 = v10 - v11;

        if (v12 > 0.00000011921)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (int)stepCount
{
  return self->stepCount;
}

- (void)setStepCount:(int)a3
{
  self->stepCount = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = self->debugValues;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    float v9 = (float)a3;
    do
    {
      float v10 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        float v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->debugValues,  "objectForKey:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10),  (void)v16));
        [v11 sweepMax];
        float v13 = v12;
        [v11 sweepMin];
        *(float *)&double v15 = (float)(v13 - v14) / v9;
        [v11 setStepSize:v15];

        float v10 = (char *)v10 + 1;
      }

      while (v7 != v10);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v7);
  }
}

- (NSMutableDictionary)debugValues
{
  return self->debugValues;
}

- (void).cxx_destruct
{
}

@end