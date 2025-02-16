@interface SDCompanionCommon
+ (id)myIPAddress;
@end

@implementation SDCompanionCommon

+ (id)myIPAddress
{
  v14 = 0LL;
  int v2 = getifaddrs(&v14);
  v3 = 0LL;
  v4 = v14;
  if (!v2 && v14)
  {
    v3 = 0LL;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4->ifa_name));
        unsigned int v6 = [v5 isEqualToString:@"en0"];

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          v8 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", inet_ntoa(v7));
          uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

          v3 = (void *)v9;
        }
      }

      v4 = v4->ifa_next;
    }

    while (v4);
    v4 = v14;
  }

  freeifaddrs(v4);
  uint64_t v11 = daemon_log(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000826A4((uint64_t)v3, v12);
  }

  return v3;
}

@end