@interface _HHDServiceListLoader
- (id)loadServices;
@end

@implementation _HHDServiceListLoader

- (id)loadServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/System/Library/HomeHub/SiriEndpointServices.plist"));
  id v8 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithContentsOfURL:error:]( &OBJC_CLASS___NSArray,  "arrayWithContentsOfURL:error:",  v2,  &v8));
  id v4 = v8;
  if (v4)
  {
    id v5 = sub_1000153D4();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = &stru_100024E50;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%@Failed to read services with error %@",  buf,  0x16u);
    }
  }

  return v3;
}

@end