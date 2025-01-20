@interface NSValue
- (id)debugHierarchyValueForObjCType_CATransform3D;
- (id)debugHierarchyValueForObjCType_CGAffineTransform;
- (id)debugHierarchyValueForObjCType_CGPoint;
- (id)debugHierarchyValueForObjCType_CGRect;
- (id)debugHierarchyValueForObjCType_CGSize;
- (id)debugHierarchyValueForObjCType_CGVector;
- (id)debugHierarchyValueForObjCType_NSDirectionalEdgeInsets;
- (id)debugHierarchyValueForObjCType_UIEdgeInsets;
- (id)debugHierarchyValueForObjCType_UIOffset;
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation NSValue

- (id)debugHierarchyValueForObjCType_CGVector
{
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  v4 = (const void **)malloc(0x10uLL);
  *v4 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0LL, v4, 2LL, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGAffineTransform
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10));
  v16[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
  v16[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  v16[2] = v4;
  CFArrayRef v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v13));
  v16[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
  v16[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  v16[5] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 6LL));

  return v8;
}

- (id)debugHierarchyValueForObjCType_UIEdgeInsets
{
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));

  return v12;
}

- (id)debugHierarchyValueForObjCType_NSDirectionalEdgeInsets
{
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v14[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  v14[1] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  v14[2] = v10;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  v14[3] = v11;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));

  return v12;
}

- (id)debugHierarchyValueForObjCType_UIOffset
{
  double v3 = v2;
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v8[0] = v4;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v3));
  v8[1] = v5;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));

  return v6;
}

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(self, v6) & 1) != 0) {
    return self;
  }
  uint64_t v8 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  -[NSValue objCType](v8, "objCType"),  4LL));
  double v10 = (char *)[v9 rangeOfString:@"="];
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 1, v10 - 1));

    v9 = (void *)v12;
  }

  double v13 = (NSString *)objc_claimAutoreleasedReturnValue([@"debugHierarchyValueForObjCType_" stringByAppendingString:v9]);
  SEL v14 = NSSelectorFromString(v13);
  if ((objc_opt_respondsToSelector(v8, v14) & 1) != 0)
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue(-[NSValue performSelector:](v8, "performSelector:", v14));
  }

  else if (a4)
  {
    double v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to provide DebugHierarchy value for NSValue (%@). Dynamic method look up failed for: -%@.",  v9,  v13));
    if (v8) {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v8));
    }
    else {
      v16 = &stru_34740;
    }
    if (v15) {
      v17 = v15;
    }
    else {
      v17 = &stru_34740;
    }
    v22[0] = @"propertyName";
    v22[1] = @"objectDescription";
    v23[0] = &stru_34740;
    v23[1] = v16;
    v22[2] = @"errorDescription";
    v23[2] = v17;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  3LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyErrorDomain",  101LL,  v19));

    id v21 = v20;
    *a4 = v21;

    a4 = 0LL;
  }

  return a4;
}

- (id)debugHierarchyValueForObjCType_CGPoint
{
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  double v4 = (const void **)malloc(0x10uLL);
  void *v4 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0LL, v4, 2LL, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGSize
{
  uint64_t valuePtr = v2;
  uint64_t v8 = v3;
  double v4 = (const void **)malloc(0x10uLL);
  void *v4 = CFNumberCreate(0LL, kCFNumberCGFloatType, &valuePtr);
  v4[1] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v8);
  CFArrayRef v5 = CFArrayCreate(0LL, v4, 2LL, &kCFTypeArrayCallBacks);
  CFRelease(*v4);
  CFRelease(v4[1]);
  free(v4);
  return v5;
}

- (id)debugHierarchyValueForObjCType_CGRect
{
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  uint64_t v6 = (const void **)malloc(0x20uLL);
  for (uint64_t i = 0LL; i != 4; ++i)
    v6[i] = CFNumberCreate(0LL, kCFNumberCGFloatType, &v11[i]);
  CFArrayRef v8 = CFArrayCreate(0LL, v6, 4LL, &kCFTypeArrayCallBacks);
  for (uint64_t j = 0LL; j != 4; ++j)
    CFRelease(v6[j]);
  free(v6);
  return v8;
}

- (id)debugHierarchyValueForObjCType_CATransform3D
{
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
  v36[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v21));
  v36[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v22));
  v36[2] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
  v36[3] = v16;
  double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24));
  v36[4] = v15;
  SEL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v25));
  v36[5] = v14;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v26));
  v36[6] = v13;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27));
  v36[7] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v28));
  v36[8] = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
  v36[9] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v30));
  v36[10] = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v31));
  v36[11] = v6;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v32));
  v36[12] = v7;
  CFArrayRef v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33));
  v36[13] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v34));
  v36[14] = v9;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
  v36[15] = v10;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 16LL));

  return v11;
}

@end