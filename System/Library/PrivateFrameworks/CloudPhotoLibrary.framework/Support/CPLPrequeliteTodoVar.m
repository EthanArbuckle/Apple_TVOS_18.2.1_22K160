@interface CPLPrequeliteTodoVar
+ (id)todoVariableWithName:(id)a3;
+ (id)todoVariableWithName:(id)a3 defaultExpirationInterval:(double)a4;
- (CPLPrequeliteTodoVar)initWithName:(id)a3 defaultExpirationInterval:(double)a4;
- (CPLPrequeliteVariable)currentGenerationVar;
- (CPLPrequeliteVariable)expirationIntervalVar;
- (CPLPrequeliteVariable)lastCompletionDateVar;
- (CPLPrequeliteVariable)targetGenerationVar;
- (PQLInjecting)hasSomethingTodo;
- (PQLInjecting)setHasSomethingTodo;
- (id)hasSomethingTodoNow:(id)a3;
- (id)setHasCompletedGeneration:(int64_t)a3;
- (id)setHasCompletedGeneration:(int64_t)a3 now:(id)a4;
@end

@implementation CPLPrequeliteTodoVar

+ (id)todoVariableWithName:(id)a3
{
  return [a1 todoVariableWithName:a3 defaultExpirationInterval:0.0];
}

+ (id)todoVariableWithName:(id)a3 defaultExpirationInterval:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithName:v6 defaultExpirationInterval:a4];

  return v7;
}

- (CPLPrequeliteTodoVar)initWithName:(id)a3 defaultExpirationInterval:(double)a4
{
  id v7 = a3;
  if (a4 != 0.0 && a4 < 60.0) {
    sub_10019D734((uint64_t)a2, (uint64_t)self);
  }
  v9 = v7;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"CurrentGeneration"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  v10,  &off_10025A4E8,  v11));

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"TargetGeneration"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  v13,  &off_10025A4E8,  v14));

  v51 = (void *)v13;
  v52 = (void *)v10;
  v50 = v9;
  if (a4 <= 0.0)
  {
    v54[0] = v12;
    v54[1] = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
    v24 = 0LL;
    v20 = 0LL;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"LastCompletionDate"]);
    v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType dateType](&OBJC_CLASS___CPLPrequeliteType, "dateType"));
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  v16,  0LL,  v18));

    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:@"ExpirationInterval"]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CPLPrequeliteType integerType](&OBJC_CLASS___CPLPrequeliteType, "integerType"));
    v15 = v17;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CPLPrequeliteVariable variableWithName:defaultValue:type:]( &OBJC_CLASS___CPLPrequeliteVariable,  "variableWithName:defaultValue:type:",  v21,  v22,  v23));

    v55[0] = v12;
    v55[1] = v17;
    v55[2] = v20;
    v55[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 4LL));
  }

  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___CPLPrequeliteTodoVar;
  v26 = -[CPLPrequeliteVariableGroup initWithVariables:](&v53, "initWithVariables:", v25);
  v27 = v26;
  if (v26)
  {
    -[CPLPrequeliteVariableGroup setShouldNotCacheValue:](v26, "setShouldNotCacheValue:", 1LL);
    v49 = v12;
    objc_storeStrong((id *)&v27->_currentGenerationVar, v12);
    v48 = v15;
    objc_storeStrong((id *)&v27->_targetGenerationVar, v15);
    p_lastCompletionDateVar = (id *)&v27->_lastCompletionDateVar;
    objc_storeStrong((id *)&v27->_lastCompletionDateVar, v20);
    objc_storeStrong((id *)&v27->_expirationIntervalVar, v24);
    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_targetGenerationVar, "sql"));
    -[NSMutableData appendData:](v29, "appendData:", v30);

    -[NSMutableData appendBytes:length:](v29, "appendBytes:length:", " = ", 3LL);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_targetGenerationVar, "sql"));
    -[NSMutableData appendData:](v29, "appendData:", v31);

    -[NSMutableData appendBytes:length:](v29, "appendBytes:length:", " + 1", 4LL);
    v32 = -[PQLRawInjection initWithData:](objc_alloc(&OBJC_CLASS___PQLRawInjection), "initWithData:", v29);
    setHasSomethingTodo = v27->_setHasSomethingTodo;
    v27->_setHasSomethingTodo = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_currentGenerationVar, "sql"));
    -[NSMutableData appendData:](v34, "appendData:", v35);

    -[NSMutableData appendBytes:length:](v34, "appendBytes:length:", " = ?", 4LL);
    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", "(", 1LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_currentGenerationVar, "sql"));
    -[NSMutableData appendData:](v36, "appendData:", v37);

    -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " != ", 4LL);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_targetGenerationVar, "sql"));
    -[NSMutableData appendData:](v36, "appendData:", v38);

    if (v27->_lastCompletionDateVar)
    {
      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " OR ", 4LL);
      v39 = (void *)objc_claimAutoreleasedReturnValue([*p_lastCompletionDateVar sql]);
      -[NSMutableData appendData:](v36, "appendData:", v39);

      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " IS NULL OR ", 12LL);
      v40 = (void *)objc_claimAutoreleasedReturnValue([*p_lastCompletionDateVar sql]);
      -[NSMutableData appendData:](v36, "appendData:", v40);

      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " > ? OR ", 8LL);
      v41 = (void *)objc_claimAutoreleasedReturnValue([*p_lastCompletionDateVar sql]);
      -[NSMutableData appendData:](v36, "appendData:", v41);

      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " + ", 3LL);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable sql](v27->_expirationIntervalVar, "sql"));
      -[NSMutableData appendData:](v36, "appendData:", v42);

      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", " < ?", 4LL);
      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", ")", 1LL);
      objc_storeStrong((id *)&v27->_hasSomethingTodoSQL, v36);
      -[NSMutableData appendBytes:length:](v34, "appendBytes:length:", ", ", 2LL);
      v43 = (void *)objc_claimAutoreleasedReturnValue([*p_lastCompletionDateVar sql]);
      -[NSMutableData appendData:](v34, "appendData:", v43);

      -[NSMutableData appendBytes:length:](v34, "appendBytes:length:", " = ?", 4LL);
    }

    else
    {
      -[NSMutableData appendBytes:length:](v36, "appendBytes:length:", ")", 1LL);
      v44 = -[PQLRawInjection initWithData:](objc_alloc(&OBJC_CLASS___PQLRawInjection), "initWithData:", v36);
      hasSomethingTodoConstantInjection = v27->_hasSomethingTodoConstantInjection;
      v27->_hasSomethingTodoConstantInjection = v44;
    }

    setHasCompletedGenerationSQL = v27->_setHasCompletedGenerationSQL;
    v27->_setHasCompletedGenerationSQL = &v34->super;

    v15 = v48;
    v12 = v49;
  }

  return v27;
}

- (PQLInjecting)hasSomethingTodo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteTodoVar hasSomethingTodoNow:](self, "hasSomethingTodoNow:", v3));

  return (PQLInjecting *)v4;
}

- (id)setHasCompletedGeneration:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteTodoVar setHasCompletedGeneration:now:](self, "setHasCompletedGeneration:now:", a3, v5));

  return v6;
}

- (id)hasSomethingTodoNow:(id)a3
{
  lastCompletionDateVar = self->_lastCompletionDateVar;
  if (lastCompletionDateVar)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable bindableValueForValue:](lastCompletionDateVar, "bindableValueForValue:", a3));
    id v6 = -[_CPLPrequeliteHasSomethingTodoNow initWithSQL:now:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteHasSomethingTodoNow),  "initWithSQL:now:",  self->_hasSomethingTodoSQL,  v5);
  }

  else
  {
    id v6 = self->_hasSomethingTodoConstantInjection;
  }

  return v6;
}

- (id)setHasCompletedGeneration:(int64_t)a3 now:(id)a4
{
  lastCompletionDateVar = self->_lastCompletionDateVar;
  if (lastCompletionDateVar)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariable bindableValueForValue:](lastCompletionDateVar, "bindableValueForValue:", a4));
    v8 = -[_CPLPrequeliteHasCompletedGeneration initWithSQL:generation:now:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteHasCompletedGeneration),  "initWithSQL:generation:now:",  self->_setHasCompletedGenerationSQL,  a3,  v7);
  }

  else
  {
    v8 = -[_CPLPrequeliteHasCompletedGeneration initWithSQL:generation:now:]( objc_alloc(&OBJC_CLASS____CPLPrequeliteHasCompletedGeneration),  "initWithSQL:generation:now:",  self->_setHasCompletedGenerationSQL,  a3,  0LL);
  }

  return v8;
}

- (PQLInjecting)setHasSomethingTodo
{
  return self->_setHasSomethingTodo;
}

- (CPLPrequeliteVariable)currentGenerationVar
{
  return self->_currentGenerationVar;
}

- (CPLPrequeliteVariable)targetGenerationVar
{
  return self->_targetGenerationVar;
}

- (CPLPrequeliteVariable)lastCompletionDateVar
{
  return self->_lastCompletionDateVar;
}

- (CPLPrequeliteVariable)expirationIntervalVar
{
  return self->_expirationIntervalVar;
}

- (void).cxx_destruct
{
}

@end