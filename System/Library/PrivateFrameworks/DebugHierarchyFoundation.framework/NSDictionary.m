@interface NSDictionary
+ (NSDictionary)dictionaryWithJSONData:(id)a3 error:(id *)a4;
- (id)generateJSONDataWithError:(id *)a3;
- (id)generateJSONStringWithError:(id *)a3;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithJSONData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = DebugHierarchyJSONProcessingOSLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, a1);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v22 = 134217984;
    id v23 = [v6 length];
    _os_signpost_emit_with_name_impl( &dword_0,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "JSON Data -> Dict",  "Begin with size: %{xcode:size-in-bytes}lu",  (uint8_t *)&v22,  0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  a4));
  if (v13)
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
      id v15 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"Error: Unarchived JSON object is not an NSDictionary.",  -1LL,  0LL);
    }
  }

  id v16 = DebugHierarchyJSONProcessingOSLog();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, a1);
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v20,  OS_SIGNPOST_INTERVAL_END,  v18,  "JSON Data -> Dict",  "Completed",  (uint8_t *)&v22,  2u);
  }

  return (NSDictionary *)v13;
}

- (id)generateJSONDataWithError:(id *)a3
{
  id v5 = DebugHierarchyJSONProcessingOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  v8 = v6;
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "Dict -> JSON Data",  "Begin",  (uint8_t *)&v18,  2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  self,  0LL,  a3));
  id v11 = DebugHierarchyJSONProcessingOSLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
  uint64_t v14 = v12;
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    id v16 = [v10 length];
    int v18 = 134217984;
    id v19 = v16;
    _os_signpost_emit_with_name_impl( &dword_0,  v15,  OS_SIGNPOST_INTERVAL_END,  v13,  "Dict -> JSON Data",  "Completed with size: %{xcode:size-in-bytes}lu",  (uint8_t *)&v18,  0xCu);
  }

  return v10;
}

- (id)generateJSONStringWithError:(id *)a3
{
  id v5 = DebugHierarchyJSONProcessingOSLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  v8 = v6;
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "Dict -> JSON String",  "Begin",  buf,  2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary generateJSONDataWithError:](self, "generateJSONDataWithError:", a3));
  id v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v10, 4LL);
  id v12 = DebugHierarchyJSONProcessingOSLog();
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
  id v15 = v13;
  id v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)int v18 = 0;
    _os_signpost_emit_with_name_impl( &dword_0,  v16,  OS_SIGNPOST_INTERVAL_END,  v14,  "Dict -> JSON String",  "Completed",  v18,  2u);
  }

  return v11;
}

@end