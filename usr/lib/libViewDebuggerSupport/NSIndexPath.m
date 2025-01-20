@interface NSIndexPath
+ (NSIndexPath)indexPathWithDebugHierarchyValue:(id)a3;
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation NSIndexPath

+ (NSIndexPath)indexPathWithDebugHierarchyValue:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  id v5 = [v4 count];
  v6 = malloc(8LL * (void)v5);
  if (v5)
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:i]);
      v6[(void)i] = [v8 integerValue];
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([a1 indexPathWithIndexes:v6 length:v5]);
  free(v6);

  return (NSIndexPath *)v9;
}

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class(self);
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v10 = 0LL;
    goto LABEL_4;
  }

  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9)
  {
LABEL_4:
    v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSIndexPath);
    v12 = NSStringFromClass(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }

  id v13 = v9;
LABEL_7:
  v14 = v13;

  v20[0] = @"propertyFormat";
  v20[1] = @"propertyRuntimeType";
  v21[0] = @"public.plain-text";
  v21[1] = v14;
  id v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2LL));
  *a3 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0LL)));
  if (-[NSIndexPath length](self, "length") < 2)
  {
    v18 = v16;
  }

  else
  {
    unint64_t v17 = 1LL;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%lu",  v16,  -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v17)));

      ++v17;
      v16 = v18;
    }

    while (-[NSIndexPath length](self, "length") > v17);
  }

  return v18;
}

@end