uint64_t DBHIsClassOverridingSelector(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  id v9;
  uint64_t v10;
  BOOL v11;
  v4 = [a1 superclass];
  if ((objc_opt_respondsToSelector(a1, a2) & 1) == 0) {
    return 0LL;
  }
  if (v4)
  {
    v6 = [a1 methodForSelector:a2];
    v7 = v6 != [v4 methodForSelector:a2];
  }

  else
  {
    v7 = 1;
  }

  if ((void *)objc_opt_class(&OBJC_CLASS___NSObject, v5) == a1)
  {
    v11 = 1;
  }

  else
  {
    v9 = [a1 methodForSelector:a2];
    v11 = v9 != objc_msgSend((id)objc_opt_class(NSObject, v10), "methodForSelector:", a2);
  }

  return v7 & v11;
}

BOOL DBHIsInstanceOverridingNSObjectSelector(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((objc_opt_respondsToSelector(v3, a2) & 1) != 0)
  {
    id v4 = [v3 methodForSelector:a2];
    BOOL v6 = v4 != objc_msgSend((id)objc_opt_class(NSObject, v5), "methodForSelector:", a2);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

BOOL DBHIsClassOverridingNSObjectSelector(void *a1, uint64_t a2)
{
  if ((objc_opt_respondsToSelector(a1, a2) & 1) == 0) {
    return 0LL;
  }
  id v4 = [a1 methodForSelector:a2];
  return v4 != objc_msgSend((id)objc_opt_class(NSObject, v5), "methodForSelector:", a2);
}

void sub_3600(_Unwind_Exception *a1)
{
}

NSString *DBGBoolString(unsigned int a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", a1);
}

NSString *DBGFloatString(float a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%a", a1);
}

NSString *DBGDoubleString(double a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%la", *(void *)&a1);
}

NSString *DBGIntString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", a1);
}

NSString *DBGUnsignedIntString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%u", a1);
}

NSString *DBGLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a1);
}

NSString *DBGUnsignedLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx", a1);
}

NSString *DBGLongLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", a1);
}

NSString *DBGUnsignedLongLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llx", a1);
}

NSString *DBGIntegerString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a1);
}

NSString *DBGUnsignedIntegerString(uint64_t a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lx", a1);
}

NSString *DBGCGFloatString(double a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%la", *(void *)&a1);
}

LABEL_11:
  return a4;
}

id DebugHierarchyClassesConformingToProtocol(void *a1)
{
  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint32_t v3 = _dyld_image_count();
  if (v3)
  {
    uint32_t v4 = v3;
    for (uint32_t i = 0; i != v4; ++i)
    {
      image_header = _dyld_get_image_header(i);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __DebugHierarchyClassesConformingToProtocol_block_invoke;
      block[3] = &unk_205C0;
      id v9 = v2;
      objc_enumerateClasses(image_header, 0LL, v1, 0LL, block);
    }
  }

  return v2;
}

id __DebugHierarchyClassesConformingToProtocol_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id DebugHierarchyEntryPointClasses()
{
  id v0 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyEntryPoint);
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyEntryPoint_Fallback);
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setByAddingObjectsFromArray:v3]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  return v6;
}

id DebugHierarchyMetaDataProviderClasses()
{
  id v0 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyMetaDataProvider);
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyMetaDataProvider_Fallback);
  uint32_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint32_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v1));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 setByAddingObjectsFromArray:v3]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);

  return v6;
}
}

id DBGGroupDict(void *a1, void *a2)
{
  v7[0] = @"groupingID";
  v7[1] = @"debugHierarchyObjects";
  v8[0] = a1;
  v8[1] = a2;
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return v5;
}

LABEL_20:
LABEL_23:
      v10 = v55;
      v16 = v57;
      v14 = v59;
      v25 = &CFArrayCreate_ptr;
    }

    else
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v16 setObject:v17 forKeyedSubscript:@"additionalGroups"];
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v25[56] arrayWithObject:v10]);
    v36 = DBGGroupDict(v11, v33);
    v19 = (id)objc_claimAutoreleasedReturnValue(v36);
LABEL_27:
    goto LABEL_47;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to find parent object in identifierToObjectDescriptionMap. DebugHierarchyObject dictionary will be ignored: %@ | Parent Object: %@",  v10,  v13));
  -[DebugHierarchyRequestExecutionContext logRequestErrorWithTitle:message:fromMethod:]( self,  "logRequestErrorWithTitle:message:fromMethod:",  @"Unable to find DebugHierarchyObject.",  v23,  "-[DebugHierarchyRequestExecutionContext _addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:]");

LABEL_49:
}

void sub_91E0(_Unwind_Exception *a1)
{
}

int64_t DebugHierarchyVisibilityForObject(void *a1, int64_t a2)
{
  id v3 = a1;
  if (+[DebugHierarchyObjectProtocolHelper objectImplements_debugHierarchyVisibility:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "objectImplements_debugHierarchyVisibility:",  v3))
  {
    int64_t v4 = +[DebugHierarchyObjectProtocolHelper debugHierarchyVisibilityOfObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyVisibilityOfObject:",  v3);
  }

  else
  {
    int64_t v4 = 1LL;
  }

  if (v4 > a2) {
    a2 = v4;
  }

  return a2;
}

void sub_A2B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 requestContext]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 request]);
    *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:]( &OBJC_CLASS___NSError,  "debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:",  v10,  v12,  "-[DebugHierarchyRequestExecutor runWithError:]"));

    objc_end_catch();
    JUMPOUT(0xA240LL);
  }

  _Unwind_Resume(exception_object);
}

LABEL_26:
}

id DebugHierarchyRequestsOSLog()
{
  if (DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate, &__block_literal_global_107);
  }
  return (id)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable;
}

id DebugHierarchyResponseDataForException(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 callStackSymbols]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v6, v7));

  id v9 = DebugHierarchyResponseDataForGenericError(@"Exception gathering debug hierarchy information.", v8, v5, a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

id DebugHierarchyResponseDataForGenericError(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v9;
  if (!v9) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRequest requestWithDiscoveryType:actions:completion:]( &OBJC_CLASS___DebugHierarchyRequest,  "requestWithDiscoveryType:actions:completion:",  0LL,  &__NSArray0__struct,  &__block_literal_global));
  }
  if (a4) {
    a4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a4,  4LL));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyLogEntry errorLogEntryWithTitle:message:methodSignature:]( &OBJC_CLASS___DebugHierarchyLogEntry,  "errorLogEntryWithTitle:message:methodSignature:",  v7,  v8,  a4));
  [v10 addLogEntry:v11];
  v21 = @"request";
  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));

  id v20 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 generateJSONDataWithError:&v20]);
  id v15 = v20;
  v16 = v15;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
    NSLog(@"DebugHierarchyFoundation encountered error generating request response data: %@", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v9 formattedResponseDataForRawRequestResultData:v14]);

  return v18;
}

BOOL DebugHierarchyBitMaskComparison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a3)
  {
    case 0LL:
      return 1LL;
    case 1LL:
      BOOL v4 = (a2 & ~a1) == 0;
      goto LABEL_8;
    case 2LL:
      return (a2 & a1) != 0;
    case 3LL:
      BOOL v4 = (a2 & a1) == 0;
      goto LABEL_8;
    case 4LL:
      BOOL v4 = a2 == a1;
LABEL_8:
      BOOL result = v4;
      break;
    default:
      BOOL result = 0LL;
      break;
  }

  return result;
}

LABEL_29:
      LOBYTE(v25) = 0;
LABEL_53:

      goto LABEL_54;
    }

    LOBYTE(v25) = 1;
  }

LABEL_54:
  return (char)v25;
}

id DebugHierarchyJSONProcessingOSLog()
{
  if (DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_predicate, &__block_literal_global_16);
  }
  return (id)DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_variable;
}

objc_class *DebugHierarchyRequestActionClassForDictionary(void *a1)
{
  v1 = (NSString *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"actionClass"]);
  Class v2 = NSClassFromString(v1);
  if (-[objc_class conformsToProtocol:]( v2,  "conformsToProtocol:",  &OBJC_PROTOCOL___DebugHierarchyRequestAction)) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id DebugHierarchyRequestActionForDictionary(void *a1)
{
  id v1 = a1;
  Class v2 = DebugHierarchyRequestActionClassForDictionary(v1);
  if (v2) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class actionWithDictionary:](v2, "actionWithDictionary:", v1));
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

LABEL_23:
    Mutable = 0LL;
    goto LABEL_31;
  }

  Mutable = (__CFDictionary *)v30;
LABEL_32:
  if (+[DebugHierarchyValueProtocolHelper objectImplementsRequiredDebugHierarchyValueMethods:]( &OBJC_CLASS___DebugHierarchyValueProtocolHelper,  "objectImplementsRequiredDebugHierarchyValueMethods:",  Mutable))
  {
    v75 = 0LL;
    v76 = 0LL;
    v46 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyValueProtocolHelper debugHierarchyValueWithOutOptions:outError:onObject:]( &OBJC_CLASS___DebugHierarchyValueProtocolHelper,  "debugHierarchyValueWithOutOptions:outError:onObject:",  &v76,  &v75,  Mutable));
    v47 = v76;
    v48 = v75;
    if (v48)
    {
      v49 = v48;

      v46 = 0LL;
    }

    else
    {
      v50 = v47;
      *v72 = v50;
    }
  }

  else
  {
    v46 = Mutable;
  }

LABEL_76:
  return v46;
}

void sub_DA08()
{
}

LABEL_8:
  return v6;
}

void sub_E934(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    void *v2 = (id)objc_claimAutoreleasedReturnValue( +[NSError debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:]( &OBJC_CLASS___NSError,  "debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:",  v3,  0LL,  "+[DebugHierarchyRequest(TargetHubAdditions) requestWithBase64Data:error:]"));

    objc_end_catch();
    JUMPOUT(0xE910LL);
  }

  _Unwind_Resume(exception_object);
}

id DebugHierarchyGzipOSLog()
{
  if (DebugHierarchyGzipOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyGzipOSLog___dvt_lazy_init_predicate, &__block_literal_global_47);
  }
  return (id)DebugHierarchyGzipOSLog___dvt_lazy_init_variable;
}

void sub_11368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void _DBGViewHierarchyInitialize()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  [v0 registerForDarwinNotifications];
}

id DebugHierarchyRequestsOSLog_0()
{
  if (DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate_0 != -1) {
    dispatch_once(&DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate_0, &__block_literal_global_132);
  }
  return (id)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable_0;
}

id _DBGStructureOfDictionaryDescriptionWithFormat(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"font"])
  {
    id v7 = @"familyName";
    id v8 = @"fontName";
    v16 = @"public.plain-text";
    v17 = @"public.plain-text";
    id v9 = @"pointSize";
    id v10 = @"ascender";
    v18 = @"CGf";
    v19 = @"CGf";
    v11 = @"descender";
    v12 = @"capHeight";
    id v20 = @"CGf";
    v21 = @"CGf";
    v13 = @"xHeight";
    v14 = @"lineHeight";
    v22 = @"CGf";
    v23 = @"CGf";
    id v15 = @"leading";
    v24 = @"CGf";
    uint64_t v2 = 9LL;
  }

  else
  {
    if (([v1 isEqualToString:@"color"] & 1) != 0
      || [v1 isEqualToString:@"patternImageColor"])
    {
      id v7 = @"componentValues";
      BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue([@"key:" stringByAppendingString:@"componentValuesFormat"]);
      v16 = v4;
      v17 = @"public.plain-text";
      id v8 = @"colorSpaceName";
      id v9 = @"patternImageData";
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([@"key:" stringByAppendingString:@"patternImageFormat"]);
      v18 = v5;
      v19 = @"public.plain-text";
      id v10 = @"colorName";
      v11 = @"catalogName";
      v12 = @"catalogBundleID";
      id v20 = @"public.plain-text";
      v21 = @"public.plain-text";
      id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v7,  6LL));

      goto LABEL_7;
    }

    if ([v1 isEqualToString:@"image"])
    {
      id v7 = @"imageData";
      id v8 = @"metadata";
      v16 = @"public.data";
      v17 = @"custom";
    }

    else
    {
      if (![v1 isEqualToString:@"objectInfo"])
      {
        id v3 = 0LL;
        goto LABEL_7;
      }

      id v7 = @"className";
      id v8 = @"memoryAddress";
      v16 = @"public.plain-text";
      v17 = @"public.plain-text";
    }

    uint64_t v2 = 2LL;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v7,  v2));
LABEL_7:

  return v3;
}

void DBGClearCachedFormatSpecifiers()
{
  id v0 = DBGCachedFormatSpecifiers();
  id v1 = (id)objc_claimAutoreleasedReturnValue(v0);
  [v1 removeAllObjects];
}

id DBGCachedFormatSpecifiers()
{
  if (DBGCachedFormatSpecifiers_onceToken != -1) {
    dispatch_once(&DBGCachedFormatSpecifiers_onceToken, &__block_literal_global_3);
  }
  return (id)DBGCachedFormatSpecifiers_dict;
}

id DBGSpecifiersFromFormatString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = DBGCachedFormatSpecifiers();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v1]);

    if (v4)
    {
      id v5 = v4;
LABEL_7:

      goto LABEL_8;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v1));
    [v6 setCharactersToBeSkipped:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @","));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @","));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @""));
    if ([v6 isAtEnd])
    {
LABEL_6:
      id v5 = [v7 copy];
      id v9 = DBGCachedFormatSpecifiers();
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      [v10 setObject:v5 forKeyedSubscript:v1];

      BOOL v4 = 0LL;
      goto LABEL_7;
    }

    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v28 = 0LL;
      [v6 scanUpToCharactersFromSet:v12 intoString:&v28];
      id v13 = v28;

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByTrimmingCharactersInSet:v14]);

      if ((unint64_t)[v15 length] < 2)
      {
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", (char *)objc_msgSend(v15, "length") - 1));
        if ([v16 isEqualToString:@","])
        {

LABEL_13:
          id v17 = v15;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByTrimmingCharactersInSet:v8]);
          goto LABEL_14;
        }

        unsigned __int8 v21 = [v6 isAtEnd];

        if ((v21 & 1) != 0) {
          goto LABEL_13;
        }
      }

      id v27 = 0LL;
      [v6 scanUpToCharactersFromSet:v25 intoString:&v27];
      id v17 = v27;
      v22 = 0LL;
      if ([v22 isEqualToString:@""])
      {
        objc_msgSend(v6, "setScanLocation:", (char *)objc_msgSend(v6, "scanLocation") + 1);
        id v26 = 0LL;
        [v6 scanUpToCharactersFromSet:v24 intoString:&v26];
        id v18 = v26;
        goto LABEL_27;
      }

      if ([v17 length])
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
        id v18 = (id)objc_claimAutoreleasedReturnValue([v17 stringByTrimmingCharactersInSet:v23]);

LABEL_27:
        if (v18) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }

LABEL_14:
LABEL_15:
      id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
LABEL_16:
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyFormatSpecifier specifierWithFormat:label:]( &OBJC_CLASS___DebugHierarchyFormatSpecifier,  "specifierWithFormat:label:",  v15,  v18));
      [v7 addObject:v19];

      if (([v6 isAtEnd] & 1) == 0)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "alphanumericCharacterSet"));
        [v6 scanUpToCharactersFromSet:v20 intoString:0];
      }
    }
  }

  id v5 = 0LL;
LABEL_8:

  return v5;
}

id DBGEncodeDictionaryAsJSONCompatibleDictionary(void *a1, void *a2)
{
  id v3 = a1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __DBGEncodeDictionaryAsJSONCompatibleDictionary_block_invoke;
  v9[3] = &unk_209A8;
  id v10 = a2;
  id v11 = v3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  id v4 = v12;
  id v5 = v3;
  id v6 = v10;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = [v4 copy];

  return v7;
}

void __DBGEncodeDictionaryAsJSONCompatibleDictionary_block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKeyedSubscript:v3]);
  if ([v4 hasPrefix:@"key:"])
  {
    id v5 = a1[5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 substringFromIndex:4]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

    id v4 = (void *)v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:v3]);
  id v12 = 0LL;
  uint64_t v9 = DBGEncodeValueAsJSONCompatibleValue(v8, v4, &v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v12;
  [a1[6] setObject:v10 forKeyedSubscript:v3];

  if (v11)
  {
    [a1[6] removeObjectForKey:v3];
    NSLog(@"Error: Failed to encode value as JSON compatible value. Key: %@ Format: %@", v3, v4);
  }
}

id DBGEncodeValueAsJSONCompatibleValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
  if ((objc_opt_isKindOfClass(v5, v10) & 1) != 0)
  {
    id v12 = v5;
    id v13 = DBGSpecifiersFromFormatString(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v12 count];
    if (v15 == [v14 count])
    {
      v51 = a3;
      id v52 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
      if ([v12 count])
      {
        uint64_t v17 = 0LL;
        while (1)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v17]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v17]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 format]);
          id v54 = 0LL;
          uint64_t v21 = DBGEncodeValueAsJSONCompatibleValue(v18, v20, &v54);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          id v23 = v54;
          [v16 addObject:v22];

          if (v23) {
            break;
          }
        }

        if (v51) {
          void *v51 = v23;
        }
      }

LABEL_30:
      id v9 = [v16 copy];
      id v6 = v52;
    }

    else
    {
      if (!a3)
      {
        id v9 = 0LL;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Mismatch between number of values (%lu) and number of format specifiers (%lu).\nValue: %@\nFormat: %@",  [v12 count],  objc_msgSend(v14, "count"),  v12,  v6));
      NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
      v60 = v16;
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONEncodingErrorDomain",  2LL,  v28));

      id v30 = v29;
      *a3 = v30;

      id v9 = 0LL;
    }

    goto LABEL_32;
  }

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
  if ((objc_opt_isKindOfClass(v5, v24) & 1) != 0)
  {
    id v26 = _DBGStructureOfDictionaryDescriptionWithFormat(v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v26);
    if (v12)
    {
      id v27 = DBGEncodeDictionaryAsJSONCompatibleDictionary(v5, v12);
      id v9 = (id)objc_claimAutoreleasedReturnValue(v27);
    }

    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported dictionary structure described with format: %@ for value: %@",  v6,  v5));
      NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
      v58 = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONEncodingErrorDomain",  1LL,  v37));

      if (a3 && v38) {
        *a3 = v38;
      }

      id v9 = 0LL;
    }

    goto LABEL_33;
  }

  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
  if ((objc_opt_isKindOfClass(v5, v31) & 1) != 0)
  {
    id v53 = 0LL;
    id v9 = (id)objc_claimAutoreleasedReturnValue([v5 dbgStringForType:v6 error:&v53]);
    id v33 = v53;
    id v12 = v33;
    if (a3 && v33) {
      *a3 = v33;
    }
    goto LABEL_33;
  }

  uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v32);
  if ((objc_opt_isKindOfClass(v5, v34) & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 string]);
    goto LABEL_3;
  }

  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString, v35);
  if ((objc_opt_isKindOfClass(v5, v40) & 1) != 0)
  {
LABEL_2:
    id v8 = v5;
LABEL_3:
    id v9 = v8;
    goto LABEL_34;
  }

  uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSData, v41);
  if ((objc_opt_isKindOfClass(v5, v42) & 1) != 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 base64EncodedStringWithOptions:0]);
    goto LABEL_3;
  }

  if (a3)
  {
    v44 = (objc_class *)objc_opt_class(v5, v43);
    v45 = NSStringFromClass(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported type: %@ of value: %@",  v46,  v5));

    NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
    v56 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONEncodingErrorDomain",  1LL,  v48));

    id v50 = v49;
    *a3 = v50;
  }

  id v9 = 0LL;
LABEL_34:

  return v9;
}

id DBGDecodeDictionaryFromJSONCompatibleDictionary(void *a1, void *a2)
{
  id v3 = a1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __DBGDecodeDictionaryFromJSONCompatibleDictionary_block_invoke;
  v9[3] = &unk_209A8;
  id v10 = a2;
  id v11 = v3;
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v3 count]));
  id v4 = v12;
  id v5 = v3;
  id v6 = v10;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = [v4 copy];

  return v7;
}

void __DBGDecodeDictionaryFromJSONCompatibleDictionary_block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1[4] objectForKeyedSubscript:v3]);
  if ([v4 hasPrefix:@"key:"])
  {
    id v5 = a1[5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 substringFromIndex:4]);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

    id v4 = (void *)v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:v3]);
  id v12 = 0LL;
  uint64_t v9 = DBGDecodeValueFromJSONCompatibleValue(v8, v4, &v12);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = v12;
  [a1[6] setObject:v10 forKeyedSubscript:v3];

  if (v11)
  {
    [a1[6] removeObjectForKey:v3];
    NSLog(@"Error: Failed to decode value from JSON compatible value. Key: %@ Format: %@", v3, v4);
  }
}

id DBGDecodeValueFromJSONCompatibleValue(void *a1, void *a2, NSAttributedString **a3)
{
  id v5 = a1;
  id v6 = a2;
  if (![v6 isEqualToString:@"custom"])
  {
    id v8 = DBGSpecifiersFromFormatString(v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((unint64_t)[v9 count] >= 2)
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
      if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
      {
        id v12 = v5;
        id v13 = [v12 count];
        if (v13 == [v9 count])
        {
          id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v12 count]));
          if ([v12 count])
          {
            v49 = a3;
            id v50 = v5;
            unint64_t v14 = 0LL;
            while (1)
            {
              id v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v14]);
              v16 = v9;
              uint64_t v17 = (NSAttributedString *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v14]);
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSAttributedString format](v17, "format"));
              id v51 = 0LL;
              uint64_t v19 = DBGDecodeValueFromJSONCompatibleValue(v15, v18, &v51);
              id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              id v21 = v51;
              [v7 addObject:v20];

              if (v21) {
                break;
              }

              ++v14;
              uint64_t v9 = v16;
              if ((unint64_t)[v12 count] <= v14)
              {
                id v5 = v50;
                goto LABEL_41;
              }
            }

            if (v49) {
              void *v49 = (NSAttributedString *)v21;
            }

            uint64_t v9 = v16;
            id v5 = v50;
            goto LABEL_32;
          }

LABEL_41:
          goto LABEL_42;
        }

        if (a3)
        {
          id v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Mismatch between number of values (%lu) and number of format specifiers (%lu).\nValue: %@\nFormat: %@",  [v12 count],  objc_msgSend(v9, "count"),  v12,  v6));
          NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
          v61 = v15;
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONDecodingErrorDomain",  2LL,  v29));

          uint64_t v17 = v30;
          id v7 = 0LL;
          *a3 = v17;
LABEL_32:

          goto LABEL_40;
        }

LABEL_28:
        id v7 = 0LL;
        goto LABEL_41;
      }

      if (a3)
      {
        id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Multiple format specifiers (%@) paired with non-array type value: %@",  v6,  v5));
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        id v59 = v12;
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONDecodingErrorDomain",  2LL,  v27));

        id v15 = v28;
        id v7 = 0LL;
        *a3 = v15;
LABEL_40:

        goto LABEL_41;
      }

LABEL_17:
      id v7 = 0LL;
LABEL_42:

      goto LABEL_43;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    id v12 = (id)objc_claimAutoreleasedReturnValue([v22 format]);

    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v23);
    if ((objc_opt_isKindOfClass(v5, v24) & 1) != 0)
    {
      id v15 = (NSAttributedString *)v5;
      if ([v12 isEqualToString:@"b"])
      {
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSAttributedString dbgBoolValue](v15, "dbgBoolValue")));
LABEL_35:
        id v7 = v26;
        goto LABEL_40;
      }

      if ([v12 isEqualToString:@"CGf"])
      {
        -[NSAttributedString dbgCGFloatValue](v15, "dbgCGFloatValue");
LABEL_25:
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"f"])
      {
        -[NSAttributedString dbgFloatValue](v15, "dbgFloatValue");
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"d"])
      {
        -[NSAttributedString dbgDoubleValue](v15, "dbgDoubleValue");
        goto LABEL_25;
      }

      if ([v12 isEqualToString:@"integer"])
      {
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSAttributedString dbgIntegerValue](v15, "dbgIntegerValue")));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"uinteger"])
      {
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSAttributedString dbgUnsignedIntegerValue](v15, "dbgUnsignedIntegerValue")));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"public.plain-text"])
      {
        id v26 = v15;
        id v15 = v26;
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"attrStr"])
      {
        id v26 = -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  v15);
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"public.data"])
      {
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[NSAttributedString dbgDataValue](v15, "dbgDataValue"));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"i"])
      {
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSAttributedString dbgIntValue](v15, "dbgIntValue")));
        goto LABEL_35;
      }

      if ([v12 isEqualToString:@"ui"])
      {
        uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NSAttributedString dbgUnsignedIntValue](v15, "dbgUnsignedIntValue")));
LABEL_68:
        id v7 = (id)v48;
        goto LABEL_40;
      }

      if ([v12 isEqualToString:@"l"])
      {
        uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[NSAttributedString dbgLongValue](v15, "dbgLongValue")));
        goto LABEL_68;
      }

      if ([v12 isEqualToString:@"ul"])
      {
        uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[NSAttributedString dbgUnsignedLongValue](v15, "dbgUnsignedLongValue")));
        goto LABEL_68;
      }

      if ([v12 isEqualToString:@"ll"])
      {
        uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[NSAttributedString dbgLongLongValue](v15, "dbgLongLongValue")));
        goto LABEL_68;
      }

      if ([v12 isEqualToString:@"ull"])
      {
        uint64_t v48 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[NSAttributedString dbgUnsignedLongLongValue](v15, "dbgUnsignedLongLongValue")));
        goto LABEL_68;
      }

      if (!a3)
      {
        id v7 = 0LL;
        goto LABEL_40;
      }

      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported typeSpecifier: %@ of string value: %@",  v12,  v15));
      NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v57 = v41;
      uint64_t v42 = &v57;
      uint64_t v43 = &v56;
      goto LABEL_38;
    }

    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary, v25);
    if ((objc_opt_isKindOfClass(v5, v31) & 1) != 0)
    {
      id v33 = _DBGStructureOfDictionaryDescriptionWithFormat(v6);
      id v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(v33);
      if (v15)
      {
        id v34 = DBGDecodeDictionaryFromJSONCompatibleDictionary(v5, v15);
        id v26 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(v34);
        goto LABEL_35;
      }

      if (a3)
      {
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported dictionary structure described with format: %@ for value: %@",  v6,  v5));
        NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v55 = v41;
        uint64_t v42 = &v55;
        uint64_t v43 = &v54;
LABEL_38:
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v43,  1LL));
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONDecodingErrorDomain",  1LL,  v44));

        v46 = v45;
        *a3 = v46;
      }
    }

    else
    {
      if (!a3) {
        goto LABEL_28;
      }
      uint64_t v35 = (objc_class *)objc_opt_class(v5, v32);
      v36 = NSStringFromClass(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      id v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported type: %@ of value: %@",  v37,  v5));

      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      id v53 = v15;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
      v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONDecodingErrorDomain",  1LL,  v38));

      uint64_t v40 = v39;
      *a3 = v40;
    }

    id v7 = 0LL;
    goto LABEL_40;
  }

  id v7 = v5;
LABEL_43:

  return v7;
}

id DBGSerializePropertyDescriptionAsJSON(void *a1, void *a2)
{
  id v3 = a1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyValue"]);
  id v6 = v3;
  if (v5)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNull, v4);
    id v6 = v3;
    if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyFormat"]);
      if ([v8 length])
      {
        id v18 = 0LL;
        id v9 = DBGEncodeValueAsJSONCompatibleValue(v5, v8, &v18);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = v18;
        id v12 = v11;
        if (a2 && v11) {
          *a2 = v11;
        }
        id v13 = [v3 mutableCopy];
        [v13 setObject:v10 forKeyedSubscript:@"propertyValue"];
        id v6 = [v13 copy];
      }

      else
      {
        id v12 = [v3 mutableCopy];
        [v12 removeObjectForKey:@"propertyValue"];
        id v6 = [v12 copy];

        if (!a2)
        {
LABEL_11:

          goto LABEL_12;
        }

        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyName"]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Format has zero length. Discarding value for property: %@.",  v14));

        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        id v20 = v10;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"DebugHierarchyJSONEncodingErrorDomain",  1LL,  v15));

        id v13 = v16;
        *a2 = v13;
      }

      goto LABEL_11;
    }
  }

LABEL_12:
  return v6;
}

id DBGSerializePropertyDescriptionsAsJSON(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        id v17 = 0LL;
        id v11 = DBGSerializePropertyDescriptionAsJSON(v10, &v17);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v13 = v17;
        if (v13)
        {
          id v15 = v13;
          if (a2) {
            *a2 = v13;
          }

          id v14 = 0LL;
          goto LABEL_15;
        }

        if (v12) {
          [v4 addObject:v12];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = [v4 copy];
LABEL_15:

  return v14;
}

id DBGDeserializePropertyDictionaryFromJSON(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyValue"]);
  id v5 = v3;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyFormat"]);
    id v5 = v3;
    if ([v6 length])
    {
      id v13 = 0LL;
      id v7 = DBGDecodeValueFromJSONCompatibleValue(v4, v6, &v13);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = v13;
      uint64_t v10 = v9;
      if (a2 && v9) {
        *a2 = v9;
      }
      id v11 = [v3 mutableCopy];
      [v11 setObject:v8 forKeyedSubscript:@"propertyValue"];
      id v5 = [v11 copy];
    }
  }

  return v5;
}

id DBGDeserializePropertyDictionariesFromJSON(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        id v17 = 0LL;
        id v11 = DBGDeserializePropertyDictionaryFromJSON(v10, &v17);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v13 = v17;
        if (v13)
        {
          id v15 = v13;
          if (a2) {
            *a2 = v13;
          }

          id v14 = 0LL;
          goto LABEL_15;
        }

        if (v12) {
          [v4 addObject:v12];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v14 = [v4 copy];
LABEL_15:

  return v14;
}

id objc_msgSend_addDebugHierarchyObject_withVisibility_fetchStatus_toGroupWithID_asDirectChild_belowParent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDebugHierarchyObject:withVisibility:fetchStatus:toGroupWithID:asDirectChild:belowParent:");
}

id objc_msgSend_addReferencedDebugHierarchyObject_withVisibility_toGroupWithID_asDirectChild_belowParent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferencedDebugHierarchyObject:withVisibility:toGroupWithID:asDirectChild:belowParent:");
}

id objc_msgSend_crawlDebugHierarchyObject_inGroupWithID_asDirectChild_belowParent_withParentDefinedVisibility_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "crawlDebugHierarchyObject:inGroupWithID:asDirectChild:belowParent:withParentDefinedVisibility:");
}

id objc_msgSend_debugHierarchyValueForPropertyWithName_onObject_vendingClass_outOptions_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugHierarchyValueForPropertyWithName:onObject:vendingClass:outOptions:outError:");
}

id objc_msgSend_enumerateDebugHierarchyObjects_inGroupWithID_options_asDirectChildren_belowParent_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateDebugHierarchyObjects:inGroupWithID:options:asDirectChildren:belowParent:");
}

id objc_msgSend_fallback_debugHierarchyValueForPropertyWithName_onObject_outOptions_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fallback_debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:");
}

id objc_msgSend_performRequestAndWriteResponseToFileDescriptorWithRequestInBase64_fileDescriptor_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}