@interface MSDIpInterface
+ (id)getIpv4Interfaces;
@end

@implementation MSDIpInterface

+ (id)getIpv4Interfaces
{
  v31 = 0LL;
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (getifaddrs(&v31))
  {
    id v30 = sub_100021D84();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002CA0C();
    }
    goto LABEL_24;
  }

  v3 = v31;
  if (!v31) {
    goto LABEL_20;
  }
  do
  {
    id v4 = sub_100021D84();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int sa_family = v3->ifa_addr->sa_family;
      *(_DWORD *)buf = 136315394;
      v35 = "+[MSDIpInterface getIpv4Interfaces]";
      __int16 v36 = 1024;
      LODWORD(v37) = sa_family;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s - Address family:  %d", buf, 0x12u);
    }

    ifa_addr = v3->ifa_addr;
    if (ifa_addr->sa_family == 2)
    {
      v7 = inet_ntop(2, &ifa_addr->sa_data[2], v38, 0x10u);
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
        id v9 = sub_100021D84();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v35 = "+[MSDIpInterface getIpv4Interfaces]";
          __int16 v36 = 2114;
          v37 = v8;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s - Address:  %{public}@",  buf,  0x16u);
        }

        v11 = inet_ntop(2, &v3->ifa_netmask->sa_data[2], v38, 0x10u);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
          v13 = inet_ntop(2, &v3->ifa_dstaddr->sa_data[2], v38, 0x10u);
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
            uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3->ifa_name));
            v16 = (void *)v15;
            if (v15)
            {
              v32[0] = @"name";
              v32[1] = @"address";
              v33[0] = v15;
              v33[1] = v8;
              v32[2] = @"netMask";
              v32[3] = @"broadcastAddr";
              v33[2] = v12;
              v33[3] = v14;
              v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));
              id v18 = sub_100021D84();
              v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "+[MSDIpInterface getIpv4Interfaces]";
                __int16 v36 = 2114;
                v37 = v17;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s - interface:  %{public}@",  buf,  0x16u);
              }

              -[NSMutableArray addObject:](v2, "addObject:", v17);
LABEL_16:

              goto LABEL_17;
            }

            id v28 = sub_100021D84();
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_10002C9D0(buf, &buf[1], v29);
            }
          }

          else
          {
            id v26 = sub_100021D84();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              sub_10002C964();
            }
          }
        }

        else
        {
          id v25 = sub_100021D84();
          v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
            sub_10002C8F8();
          }
        }

        goto LABEL_34;
      }

      id v23 = sub_100021D84();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002C88C();
      }
LABEL_24:

LABEL_34:
      if (v31) {
        freeifaddrs(v31);
      }
      v21 = 0LL;
      goto LABEL_21;
    }

@end