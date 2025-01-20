@interface TCCDIconGenerator
+ (id)_iconForService:(id)a3;
+ (id)_writeIcon:(id)a3 withDescriptor:(id)a4 toTempURL:(id)a5;
+ (id)createIconForTCCService:(id)a3 withTempDirectory:(id)a4;
@end

@implementation TCCDIconGenerator

+ (id)createIconForTCCService:(id)a3 withTempDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.png", v5));
  v17[0] = v6;
  v17[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    id v13 = v9;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDIconGenerator _iconForService:](&OBJC_CLASS___TCCDIconGenerator, "_iconForService:", v5));
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[ISImageDescriptor imageDescriptorNamed:]( &OBJC_CLASS___ISImageDescriptor,  "imageDescriptorNamed:",  kISImageDescriptorHomeScreen));
      id v13 = (id)objc_claimAutoreleasedReturnValue( +[TCCDIconGenerator _writeIcon:withDescriptor:toTempURL:]( &OBJC_CLASS___TCCDIconGenerator,  "_writeIcon:withDescriptor:toTempURL:",  v14,  v15,  v9));
    }

    else
    {
      id v13 = 0LL;
    }
  }

  return v13;
}

+ (id)_iconForService:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(@"kTCCService", "length")));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([&off_10006BD68 objectForKeyedSubscript:v4]);
  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___ISIcon);
    v7 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple." stringByAppendingString:v5]);
    id v8 = [v6 initWithBundleIdentifier:v7];
  }

  else
  {
    id v9 = tcc_access_log();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "+[TCCDIconGenerator _iconForService:]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s: No icon found for TCC service=%@",  (uint8_t *)&v12,  0x16u);
    }

    id v8 = 0LL;
  }

  return v8;
}

+ (id)_writeIcon:(id)a3 withDescriptor:(id)a4 toTempURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 imageForDescriptor:v8]);
  if ([v10 placeholder])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 prepareImageForDescriptor:v8]);

    v10 = (void *)v11;
  }

  id v12 = tcc_access_log();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "+[TCCDIconGenerator _writeIcon:withDescriptor:toTempURL:]";
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s: Attempting to write icon to %@",  (uint8_t *)&v18,  0x16u);
  }

  if ([v10 writeToURL:v9])
  {
    id v14 = v9;
  }

  else
  {
    id v15 = tcc_access_log();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10001B6E8((uint64_t)v9, v16);
    }

    id v14 = 0LL;
  }

  return v14;
}

@end