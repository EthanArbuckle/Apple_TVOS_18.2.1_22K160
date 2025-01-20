int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  os_log_t v5;
  void *v6;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  v5 = os_log_create("com.apple.DASDelegateService", "DASDelegateService");
  v6 = (void *)qword_100008818;
  qword_100008818 = (uint64_t)v5;

  [v4 resume];
  return 0;
}

  ;
}

id sub_1000026B4()
{
  return [v0 processIdentifier];
}
}

void sub_100002C40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

void sub_100002C74(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  if (v4)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v8 = 0LL;
    [v3 cpuTimeNs:&v10 cpuInstructions:&v9 cpuCycles:&v8 betweenStartTime:0 endTime:0];
    if ((v10 & 0x8000000000000000LL) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
      v6 = (char *)[v5 unsignedLongLongValue];
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v6[v10]));
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v10;
    }
  }
}

id sub_100002D5C(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:a3]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v6]);

  id v9 = [v7 compare:v8];
  return v9;
}

  ;
}

void sub_100002DE0(void *a1)
{
  id v2 = a1;
  v3[0] = 67109120;
  v3[1] = sub_1000026B4();
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Listener rejected new connection from PID %d (no entitlement)\n",  (uint8_t *)v3,  8u);

  sub_1000026A8();
}

void sub_100002E68(void *a1)
{
  id v2 = a1;
  v3[0] = 67109120;
  v3[1] = sub_1000026B4();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Listener accepted new connection from PID %d\n",  (uint8_t *)v3,  8u);

  sub_1000026A8();
}

void sub_100002EF0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Evaluation of %{public}@ complete, exemption = %@",  (uint8_t *)&v2,  0x16u);
  sub_100002DD8();
}

void sub_100002F6C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "SASampleStore failed to parse %{public}@: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_100002DD8();
}

void sub_100002FEC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@", (uint8_t *)&v2, 0xCu);
  sub_100002DD8();
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
YPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v50 = v33;
            v51 = 2114;
            v52 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%{public}@, %{public}@ on allow list",  buf,  0x16u);
          }

          v32[2](v32, v28, v19, 0LL);

          goto LABEL_26;
        }

        if (v20 == (id)++v23)
        {
          v20 = [v19 countByEnumeratingWithState:&v35 objects:v53 count:16];
          if (v20) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    v27 = (os_log_s *)qword_100008820;
    if (os_log_type_enabled((os_log_t)qword_100008820, OS_LOG_TYPE_DEBUG)) {
      sub_100002EF0((uint64_t)v33, v27);
    }
    v32[2](v32, 0LL, v19, 0LL);
LABEL_26:

    _Block_object_dispose(&v44, 8);
  }

  else
  {
    v14 = (uint64_t)v8;
    v15 = (os_log_s *)qword_100008820;
    if (os_log_type_enabled((os_log_t)qword_100008820, OS_LOG_TYPE_ERROR)) {
      sub_100002F6C((uint64_t)v33, v14, v15);
    }
    v54 = NSDebugDescriptionErrorKey;
    v55 = v14;
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL,  v30));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  79LL,  v11));
    ((void (**)(id, id, id, void *))v32)[2](v32, 0LL, 0LL, v16);
  }
}

@end