@interface HomographyPowerSpectrumPlugin
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation HomographyPowerSpectrumPlugin

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v7 = a5;
  v18[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v18[1] = objc_opt_class(&OBJC_CLASS___NSValue);
  v18[2] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v18[3] = objc_opt_class(&OBJC_CLASS___NSMutableString);
  v18[4] = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  v18[5] = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  v18[6] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v18[7] = objc_opt_class(&OBJC_CLASS___NSArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 8LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  id v15 = 0LL;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v7,  &v15));

  id v11 = v15;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = &__NSDictionary0__struct;
  }
  if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v12))
  {
    v16 = @"homography-data";
    v17 = v12;
    v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  }

  else
  {
    v13 = &off_4130;
  }

  return v13;
}

@end