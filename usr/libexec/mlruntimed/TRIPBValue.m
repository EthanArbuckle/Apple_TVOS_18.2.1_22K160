@interface TRIPBValue
+ (id)mlr_listValueWithNSArray:(id)a3;
+ (id)mlr_valueWithBoolValue:(BOOL)a3;
+ (id)mlr_valueWithNullValue;
+ (id)mlr_valueWithObject:(id)a3;
@end

@implementation TRIPBValue

+ (id)mlr_listValueWithNSArray:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new(&OBJC_CLASS___TRIPBListValue);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valuesArray", (void)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[TRIPBValue mlr_valueWithObject:](&OBJC_CLASS___TRIPBValue, "mlr_valueWithObject:", v10));
        [v11 addObject:v12];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  return v4;
}

+ (id)mlr_valueWithObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___TRIPBValue);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    [v5 setStringValue:v4];
LABEL_12:

    return v5;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    [v4 doubleValue];
    objc_msgSend(v5, "setNumberValue:");
    goto LABEL_12;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TRIPBStruct mlr_structWithDictionary:](&OBJC_CLASS___TRIPBStruct, "mlr_structWithDictionary:", v4));
    [v5 setStructValue:v9];
LABEL_9:

    goto LABEL_12;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mlr_listValueWithNSArray:", v4));
    [v5 setListValue:v9];
    goto LABEL_9;
  }

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___TRIPBValue);
  if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
  {
    id v12 = v4;

    id v5 = v12;
    goto LABEL_12;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"obj=%@",  v4,  NSLocalizedDescriptionKey));
  v21 = v14;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Unexpected type in obj",  v15));

  objc_exception_throw(v16);
  return +[TRIPBValue mlr_valueWithBoolValue:](v17, v18, v19);
}

+ (id)mlr_valueWithBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___TRIPBValue);
  [v4 setBoolValue:v3];
  return v4;
}

+ (id)mlr_valueWithNullValue
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___TRIPBValue);
  [v2 setNullValue:0];
  return v2;
}

@end