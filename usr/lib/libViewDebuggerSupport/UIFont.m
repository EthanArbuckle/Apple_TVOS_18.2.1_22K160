@interface UIFont
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIFont

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
    v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___UIFont);
    v12 = NSStringFromClass(v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }

  id v13 = v9;
LABEL_7:
  id v14 = v13;
  id v31 = v13;

  v36[0] = @"propertyFormat";
  v36[1] = @"propertyRuntimeType";
  v37[0] = @"font";
  v37[1] = v14;
  id v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2LL));
  *a3 = v15;
  id v33 = v15;
  v34[0] = @"familyName";
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[UIFont familyName](self, "familyName"));
  v17 = (void *)v16;
  if (v16) {
    v18 = (const __CFString *)v16;
  }
  else {
    v18 = &stru_34740;
  }
  v35[0] = v18;
  v34[1] = @"fontName";
  uint64_t v19 = objc_claimAutoreleasedReturnValue(-[UIFont fontName](self, "fontName", v31));
  v20 = (void *)v19;
  if (v19) {
    v21 = (const __CFString *)v19;
  }
  else {
    v21 = &stru_34740;
  }
  v35[1] = v21;
  v34[2] = @"pointSize";
  -[UIFont pointSize](self, "pointSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[2] = v22;
  v34[3] = @"ascender";
  -[UIFont ascender](self, "ascender");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[3] = v23;
  v34[4] = @"descender";
  -[UIFont descender](self, "descender");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[4] = v24;
  v34[5] = @"capHeight";
  -[UIFont capHeight](self, "capHeight");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[5] = v25;
  v34[6] = @"xHeight";
  -[UIFont xHeight](self, "xHeight");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[6] = v26;
  v34[7] = @"lineHeight";
  -[UIFont lineHeight](self, "lineHeight");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[7] = v27;
  v34[8] = @"leading";
  -[UIFont leading](self, "leading");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v35[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  9LL));

  return v29;
}

@end