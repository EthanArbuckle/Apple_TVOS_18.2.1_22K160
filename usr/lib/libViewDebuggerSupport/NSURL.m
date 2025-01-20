@interface NSURL
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation NSURL

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class(self);
  if (v6 && (v7 = v6, object_isClass(v6)))
  {
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      id v13 = v9;
      goto LABEL_7;
    }
  }

  else
  {
    v10 = 0LL;
  }

  v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSURL);
  v12 = NSStringFromClass(v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_7:
  v14 = v13;

  v18[0] = @"propertyFormat";
  v18[1] = @"propertyRuntimeType";
  v19[0] = @"public.plain-text";
  v19[1] = v14;
  id v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2LL));
  *a3 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));

  return v16;
}

@end