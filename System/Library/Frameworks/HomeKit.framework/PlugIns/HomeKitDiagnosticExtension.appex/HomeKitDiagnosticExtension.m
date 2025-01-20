void sub_10000194C(uint64_t a1, void *a2, uint64_t a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v26;
  v26 = a2;
  v3 = [v26 mutableCopy];
  v4 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:MTRAttributePathKey]);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hmf_numberForKey:", HMEndpointIDKey));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hmf_numberForKey:", HMClusterIDKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hmf_numberForKey:", HMAttributeIDKey));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTRAttributePath attributePathWithEndpointID:clusterID:attributeID:]( &OBJC_CLASS___MTRAttributePath,  "attributePathWithEndpointID:clusterID:attributeID:",  v6,  v7,  v8));

    [v3 setObject:v9 forKey:MTRAttributePathKey];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:MTRCommandPathKey]);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hmf_numberForKey:", HMEndpointIDKey));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_numberForKey:", HMClusterIDKey));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hmf_numberForKey:", HMCommandIDKey));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[MTRCommandPath commandPathWithEndpointID:clusterID:commandID:]( &OBJC_CLASS___MTRCommandPath,  "commandPathWithEndpointID:clusterID:commandID:",  v12,  v13,  v14));

    [v3 setObject:v15 forKey:MTRCommandPathKey];
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:MTREventPathKey]);
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "hmf_numberForKey:", HMEndpointIDKey));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hmf_numberForKey:", HMClusterIDKey));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hmf_numberForKey:", HMEventIDKey));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[MTREventPath eventPathWithEndpointID:clusterID:eventID:]( &OBJC_CLASS___MTREventPath,  "eventPathWithEndpointID:clusterID:eventID:",  v18,  v19,  v20));

    [v3 setObject:v21 forKey:MTREventPathKey];
  }

  v22 = *(void **)(a1 + 32);
  v23 = [v3 copy];
  [v22 replaceObjectAtIndex:a3 withObject:v23];
}

void sub_100001BF0(uint64_t a1, void *a2, uint64_t a3)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:MTRAttributePathKey]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTRAttributePath, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    v8 = v5;
  }
  else {
    v8 = 0LL;
  }
  id v9 = v8;

  if (v9)
  {
    v41[0] = HMAttributeIDKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 attribute]);
    v42[0] = v10;
    v41[1] = HMClusterIDKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cluster]);
    v42[1] = v11;
    v41[2] = HMEndpointIDKey;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 endpoint]);
    v42[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  3LL));

    [v4 setObject:v13 forKey:MTRAttributePathKey];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", MTRCommandPathKey, a1));
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___MTRCommandPath, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
    v17 = v14;
  }
  else {
    v17 = 0LL;
  }
  id v18 = v17;

  if (v18)
  {
    v39[0] = HMCommandIDKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 command]);
    v40[0] = v19;
    v39[1] = HMClusterIDKey;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 cluster]);
    v40[1] = v20;
    v39[2] = HMEndpointIDKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v18 endpoint]);
    v40[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  3LL));

    [v4 setObject:v22 forKey:MTRCommandPathKey];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:MTREventPathKey]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___MTREventPath, v24);
  if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0) {
    v26 = v23;
  }
  else {
    v26 = 0LL;
  }
  id v27 = v26;

  if (v27)
  {
    v37[0] = HMEventIDKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 event]);
    v38[0] = v28;
    v37[1] = HMClusterIDKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v27 cluster]);
    v38[1] = v29;
    v37[2] = HMEndpointIDKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue([v27 endpoint]);
    v38[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));

    [v4 setObject:v31 forKey:MTREventPathKey];
  }

  v32 = *(void **)(v35 + 32);
  id v33 = [v4 copy];
  [v32 replaceObjectAtIndex:a3 withObject:v33];
}

void sub_100003748(_Unwind_Exception *a1)
{
}

void sub_1000037C8(id a1)
{
  v1 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"8FCBC859-A091-41C8-A50D-A7652422D734");
  v2 = (void *)qword_100032C30;
  qword_100032C30 = (uint64_t)v1;
}

void sub_100004334(id a1)
{
  v1 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"DCD43BD3-6928-461D-9C9B-1BC859E81BC7");
  v2 = (void *)qword_100032C40;
  qword_100032C40 = (uint64_t)v1;
}

void sub_100004368( FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v10, &a9);

  v12 = v11;
  fputs(-[NSString UTF8String](v12, "UTF8String"), a1);
  fflush(a1);
}

void sub_10000486C(id a1)
{
  v1 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"A08F6CA5-EC1E-4DD6-A068-377BA45247B6");
  v2 = (void *)qword_100032C50;
  qword_100032C50 = (uint64_t)v1;
}

uint64_t sub_100005170(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    id v12 = [v11 rangeOfString:@"/"];
    v13 = v11;
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 substringToIndex:v12]);
    }

    if ([v13 containsString:@"self-token:"])
    {
      id v14 = [v13 mutableCopy];
      objc_msgSend( v14,  "replaceOccurrencesOfString:withString:options:range:",  @"self-token:",  @"token:",  1,  0,  objc_msgSend(v14, "length"));
      id v15 = [v14 copy];

      v13 = v15;
    }

    if (([v13 hasPrefix:@"token:"] & 1) == 0)
    {
      if (a5)
      {
        uint64_t v22 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmErrorWithCode:description:reason:suggestion:]( &OBJC_CLASS___NSError,  "hmErrorWithCode:description:reason:suggestion:",  19LL,  @"Invalid destination.",  @"Missing token prefix.",  0LL));
LABEL_28:

        goto LABEL_29;
      }

LABEL_27:
      uint64_t v22 = 0LL;
      goto LABEL_28;
    }

    if (a2)
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___NSUUID);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[_HMDDeviceHandle identifierNamespace](&OBJC_CLASS____HMDDeviceHandle, "identifierNamespace"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);
      *a2 = -[NSUUID initWithNamespace:data:](v16, "initWithNamespace:data:", v17, v18);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "substringFromIndex:", objc_msgSend(@"token:", "length")));
    if ([v19 length])
    {
      v20 = objc_alloc(&OBJC_CLASS___NSData);
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSData hmf_initWithHexadecimalString:options:]( v20,  "hmf_initWithHexadecimalString:options:",  v19,  0LL));

      if (v21)
      {
        if (a3) {
          *a3 = v21;
        }

        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[HMDAccountHandle accountHandleForDestination:]( &OBJC_CLASS___HMDAccountHandle,  "accountHandleForDestination:",  v11));
        }
        uint64_t v22 = 1LL;
        goto LABEL_28;
      }

      if (!a5) {
        goto LABEL_26;
      }
      v23 = @"Invalid token string.";
      uint64_t v24 = 3LL;
    }

    else
    {
      if (!a5)
      {
LABEL_26:

        goto LABEL_27;
      }

      v23 = @"Missing token string.";
      uint64_t v24 = 19LL;
    }

    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmErrorWithCode:description:reason:suggestion:]( &OBJC_CLASS___NSError,  "hmErrorWithCode:description:reason:suggestion:",  v24,  @"Invalid destination.",  v23,  0LL));
    goto LABEL_26;
  }

  uint64_t v22 = 0LL;
  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmErrorWithCode:](&OBJC_CLASS___NSError, "hmErrorWithCode:", 20LL));
  }
LABEL_29:

  return v22;
}

NSUUID *sub_100005B50(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmErrorWithCode:](&OBJC_CLASS___NSError, "hmErrorWithCode:", 20LL));
LABEL_10:
      uint64_t v7 = 0LL;
      *a2 = v9;
      goto LABEL_18;
    }

LABEL_11:
    uint64_t v7 = 0LL;
    goto LABEL_18;
  }

  if (([v3 hasPrefix:@"device:"] & 1) == 0)
  {
    if (a2)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError hmErrorWithCode:description:reason:suggestion:]( &OBJC_CLASS___NSError,  "hmErrorWithCode:description:reason:suggestion:",  19LL,  @"Invalid destination.",  @"Missing local device prefix.",  0LL));
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"device:", "length")));
  if ([v5 length])
  {
    uint64_t v6 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
    uint64_t v7 = v6;
    if (v6)
    {
      v8 = v6;
    }

    else if (a2)
    {
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmErrorWithCode:description:reason:suggestion:]( &OBJC_CLASS___NSError,  "hmErrorWithCode:description:reason:suggestion:",  19LL,  @"Invalid destination.",  @"Invalid device identifier",  0LL));
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    if (a2) {
      *a2 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmErrorWithCode:description:reason:suggestion:]( &OBJC_CLASS___NSError,  "hmErrorWithCode:description:reason:suggestion:",  19LL,  @"Invalid destination.",  @"Missing device identifier.",  0LL));
    }
  }

LABEL_18:
  return v7;
}

    goto LABEL_12;
  }

  id v9 = 0LL;
LABEL_12:

  return v9;
}

LABEL_12:
    objc_autoreleasePoolPop(v11);
LABEL_13:
    id v10 = 0LL;
    goto LABEL_14;
  }

  uint64_t v6 = (void *)IDSCopyAddressDestinationForDestination(v4);

  if (!v6)
  {
    id v11 = objc_autoreleasePoolPush();
    id v12 = a1;
    v21 = HMFGetOSLogHandle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier(v12);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = 138543618;
      uint64_t v25 = v16;
      v26 = 2112;
      id v27 = v5;
      v17 = "%{public}@Invalid device destination: %@";
      id v18 = v14;
      v19 = OS_LOG_TYPE_INFO;
      v20 = 22;
      goto LABEL_11;
    }

    goto LABEL_12;
  }

  uint64_t v7 = &off_100028420;
  if (!+[_HMDLocalDeviceHandle isValidDestination:](&OBJC_CLASS____HMDLocalDeviceHandle, "isValidDestination:", v5))
  {
    uint64_t v7 = off_100028418;
    if (!+[_HMDGlobalDeviceHandle isValidDestination:](&OBJC_CLASS____HMDGlobalDeviceHandle, "isValidDestination:", v5)) {
      goto LABEL_13;
    }
  }

  v8 = [objc_alloc(*v7) initWithDestination:v5];
  if (!v8) {
    goto LABEL_13;
  }
  id v9 = v8;
  id v10 = -[HMDDeviceHandle initWithInternal:](objc_alloc(&OBJC_CLASS___HMDDeviceHandle), "initWithInternal:", v8);

LABEL_14:
  return v10;
}

id sub_10000895C()
{
  if (qword_100032C70 != -1) {
    dispatch_once(&qword_100032C70, &stru_100028850);
  }
  return (id)qword_100032C78;
}

void sub_10000899C(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890._-"));
  v2 = (void *)qword_100032C78;
  qword_100032C78 = v1;
}

void sub_1000089D0(id a1)
{
  id v1 = sub_10000895C();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = [v2 mutableCopy];

  [v3 addCharactersInString:@"%0123456789abcdefABCDEF"];
  id v4 = [v3 copy];

  v5 = (void *)qword_100032C68;
  qword_100032C68 = (uint64_t)v4;
}

void sub_100008D4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100008DC0(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = &CC_SHA256_Final_ptr;
  id v4 = &selRef_then_;
  if (v2)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v6 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = v5;

    uint64_t v7 = objc_autoreleasePoolPush();
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentHistoryChange fetchRequest](&OBJC_CLASS___NSPersistentHistoryChange, "fetchRequest"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"changeType",  &off_10002B428));
    [v8 setPredicate:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentHistoryChangeRequest fetchHistoryWithFetchRequest:]( &OBJC_CLASS___NSPersistentHistoryChangeRequest,  "fetchHistoryWithFetchRequest:",  v8));
    [v10 setResultType:4];
    uint64_t v11 = *(void **)(v2 + 16);
    id v198 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 executeRequest:v10 error:&v198]);
    id v13 = v198;
    v20 = v13;
    if (v12)
    {
      id v172 = v13;
      v174 = v10;
      v176 = v8;
      v178 = v7;
      __int128 v196 = 0u;
      __int128 v197 = 0u;
      __int128 v194 = 0u;
      __int128 v195 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v12 result]);
      id v22 = [v21 countByEnumeratingWithState:&v194 objects:v202 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v195;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v195 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v194 + 1) + 8LL * (void)i);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 tombstone]);
            if ([v27 count])
            {
              v28 = *(void **)(v2 + 24);
              v29 = (void *)objc_claimAutoreleasedReturnValue([v26 changedObjectID]);
              [v28 setObject:v27 forKeyedSubscript:v29];
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v194 objects:v202 count:16];
        }

        while (v23);
      }

      id v4 = &selRef_then_;
      id v3 = &CC_SHA256_Final_ptr;
      v8 = v176;
      uint64_t v7 = v178;
      v20 = v172;
      id v10 = v174;
    }

    else
    {
      sub_100004368(__stderrp, @"Failed to deletion history: %@\n", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }

    objc_autoreleasePoolPop(v7);
  }

  v30 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue([v3[110] fetchHistoryAfterToken:0]);
  -[NSDateFormatter setResultType:](v30, "setResultType:", 5LL);
  uint64_t v163 = *((int *)v4 + 231);
  v31 = *(void **)(a1[4] + v163);
  id v193 = 0LL;
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 executeRequest:v30 error:&v193]);
  id v39 = v193;
  if (v32)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue([v32 result]);

    v30 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v30, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss.SSSZZZ");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
    -[NSDateFormatter setTimeZone:](v30, "setTimeZone:", v41);

    __int128 v191 = 0u;
    __int128 v192 = 0u;
    __int128 v189 = 0u;
    __int128 v190 = 0u;
    id obj = v40;
    id v160 = [obj countByEnumeratingWithState:&v189 objects:v201 count:16];
    if (!v160) {
      goto LABEL_72;
    }
    uint64_t v158 = *(void *)v190;
    v159 = v30;
    while (1)
    {
      uint64_t v42 = 0LL;
      do
      {
        if (*(void *)v190 != v158) {
          objc_enumerationMutation(obj);
        }
        uint64_t v162 = v42;
        v43 = *(void **)(*((void *)&v189 + 1) + 8 * v42);
        context = objc_autoreleasePoolPush();
        v44 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
        id v45 = [v43 transactionNumber];
        v46 = (void *)objc_claimAutoreleasedReturnValue([v43 processID]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v43 author]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v43 timestamp]);
        v155 = v48;
        v156 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v30, "stringFromDate:", v49));
        v154 = v47;
        sub_100004368(v44, @"Transaction (%lld): %@:%@:%@ at %@\n", v50, v51, v52, v53, v54, v55, (uint64_t)v45);

        __int128 v187 = 0u;
        __int128 v188 = 0u;
        __int128 v185 = 0u;
        __int128 v186 = 0u;
        id v164 = (id)objc_claimAutoreleasedReturnValue([v43 changes]);
        v56 = @"modelID";
        id v166 = [v164 countByEnumeratingWithState:&v185 objects:v200 count:16];
        if (v166)
        {
          uint64_t v165 = *(void *)v186;
          do
          {
            v57 = 0LL;
            do
            {
              if (*(void *)v186 != v165) {
                objc_enumerationMutation(v164);
              }
              v58 = *(void **)(*((void *)&v185 + 1) + 8LL * (void)v57);
              v59 = objc_autoreleasePoolPush();
              unint64_t v60 = (unint64_t)[v58 changeType];
              v179 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
              id v61 = [v58 changeID];
              uint64_t v62 = a1[4];
              uint64_t v177 = (uint64_t)v61;
              unint64_t v173 = v60;
              if (v62)
              {
                if (v60 >= 3)
                {
                  v175 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%zd",  v60));
                  uint64_t v62 = a1[4];
                }

                else
                {
                  v175 = off_100028898[v60];
                }
              }

              else
              {
                v175 = 0LL;
              }

              id v63 = (id)objc_claimAutoreleasedReturnValue([v58 changedObjectID]);
              v64 = v63;
              if (v62)
              {
                v171 = v58;
                v65 = (void *)objc_claimAutoreleasedReturnValue([v63 entity]);
                v66 = (void *)objc_claimAutoreleasedReturnValue([v65 attributesByName]);

                v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v56]);
                if (v67)
                {
                  v167 = v59;
                  uint64_t v68 = objc_claimAutoreleasedReturnValue([*(id *)(v62 + 24) objectForKeyedSubscript:v64]);
                  v69 = (void *)v68;
                  v169 = v57;
                  if (v68)
                  {
                    v70 = 0LL;
                    v71 = (void *)v68;
                  }

                  else
                  {
                    v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v62 + v163) existingObjectWithID:v64 error:0]);
                    v71 = v70;
                  }

                  uint64_t v74 = objc_claimAutoreleasedReturnValue([v71 valueForKey:v56]);
                  v75 = (void *)v74;
                  v76 = @"???";
                  if (v74) {
                    v76 = (__CFString *)v74;
                  }
                  v77 = v76;

                  if (*(_BYTE *)(v62 + 8))
                  {
                    v78 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"homeModelID"]);

                    if (v78)
                    {
                      uint64_t v79 = objc_claimAutoreleasedReturnValue([v71 valueForKey:@"homeModelID"]);
                      v80 = (void *)v79;
                      v81 = @"???";
                      if (v79) {
                        v81 = (__CFString *)v79;
                      }
                      v82 = v81;

                      uint64_t v83 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@[H:%@]",  v77,  v82,  v154,  v155,  v156));
                      v77 = (__CFString *)v83;
                    }
                  }

                  id v84 = sub_10000A984(v64, v77);
                  v73 = (void *)objc_claimAutoreleasedReturnValue(v84);

                  v56 = @"modelID";
                  v59 = v167;
                  v57 = v169;
                }

                else
                {
                  id v72 = sub_10000A984(v64, 0LL);
                  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                }

                v85 = v179;
                v86 = v56;

                v58 = v171;
              }

              else
              {
                v86 = v56;
                v73 = 0LL;
                v85 = v179;
              }

              v154 = v73;
              sub_100004368(v85, @"    Change (%lld): %@ %@", v87, v88, v89, v90, v91, v92, v177);

              if (v173 != 2)
              {
                v56 = v86;
                v99 = v59;
                if (v173 != 1) {
                  goto LABEL_54;
                }
                v100 = (void *)objc_claimAutoreleasedReturnValue([v58 updatedProperties]);
                id v101 = [v100 count];

                if (v101)
                {
                  v102 = (void *)objc_claimAutoreleasedReturnValue([v58 updatedProperties]);
                  v103 = (void *)objc_claimAutoreleasedReturnValue([v102 allObjects]);
                  v104 = (void *)objc_claimAutoreleasedReturnValue([v103 valueForKey:@"name"]);

                  v105 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
                  v106 = (void *)objc_claimAutoreleasedReturnValue([v104 sortedArrayUsingSelector:"compare:"]);
                  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "componentsJoinedByString:", @", "));
                  sub_100004368(v105, @" - %@\n", v108, v109, v110, v111, v112, v113, (uint64_t)v107);

                  goto LABEL_56;
                }

                v124 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
                v125 = @" - (no property changes)\n";
                goto LABEL_55;
              }

              v114 = (void *)objc_claimAutoreleasedReturnValue([v58 tombstone]);
              v56 = v86;
              v99 = v59;
              if (![v114 count]) {
                goto LABEL_53;
              }
              v115 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
              if ((unint64_t)[v115 count] <= 1)
              {
                v122 = (void *)objc_claimAutoreleasedReturnValue([v115 firstObject]);
                unsigned int v123 = [v122 isEqualToString:v56];

                if (v123)
                {

LABEL_53:
LABEL_54:
                  v124 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
                  v125 = @"\n";
LABEL_55:
                  sub_100004368(v124, v125, v93, v94, v95, v96, v97, v98, v152);
                  goto LABEL_56;
                }
              }

              v180 = v115;
              v168 = v99;
              v170 = v57;
              sub_100004368( *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL),  @" with tombstone\n",  v116,  v117,  v118,  v119,  v120,  v121,  v152);
              __int128 v183 = 0u;
              __int128 v184 = 0u;
              __int128 v181 = 0u;
              __int128 v182 = 0u;
              v126 = (void *)objc_claimAutoreleasedReturnValue([v114 allKeys]);
              v127 = (void *)objc_claimAutoreleasedReturnValue([v126 sortedArrayUsingSelector:"compare:"]);

              id v128 = [v127 countByEnumeratingWithState:&v181 objects:v199 count:16];
              if (v128)
              {
                id v129 = v128;
                uint64_t v130 = *(void *)v182;
                do
                {
                  for (j = 0LL; j != v129; j = (char *)j + 1)
                  {
                    if (*(void *)v182 != v130) {
                      objc_enumerationMutation(v127);
                    }
                    uint64_t v132 = *(void *)(*((void *)&v181 + 1) + 8LL * (void)j);
                    v133 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
                    v153 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v132]);
                    sub_100004368(v133, @"        %@ = %@\n", v134, v135, v136, v137, v138, v139, v132);
                  }

                  id v129 = [v127 countByEnumeratingWithState:&v181 objects:v199 count:16];
                }

                while (v129);
              }

              v56 = @"modelID";
              v99 = v168;
              v57 = v170;
LABEL_56:
              objc_autoreleasePoolPop(v99);
              v57 = (char *)v57 + 1;
            }

            while (v57 != v166);
            id v140 = [v164 countByEnumeratingWithState:&v185 objects:v200 count:16];
            id v166 = v140;
          }

          while (v140);
        }

        sub_100004368( *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL),  @"\n",  v141,  v142,  v143,  v144,  v145,  v146,  v151);
        objc_autoreleasePoolPop(context);
        uint64_t v42 = v162 + 1;
        v30 = v159;
      }

      while ((id)(v162 + 1) != v160);
      id v160 = [obj countByEnumeratingWithState:&v189 objects:v201 count:16];
      if (!v160)
      {
LABEL_72:
        id v39 = obj;

        goto LABEL_84;
      }
    }
  }

  sub_100004368( __stderrp,  @"Failed to fetch persistent history: %@\n",  v33,  v34,  v35,  v36,  v37,  v38,  (uint64_t)v39);
  *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = 2;
  v147 = *(FILE **)(*(void *)(a1[6] + 8LL) + 24LL);
  if (v147) {
    BOOL v148 = v147 == __stdoutp;
  }
  else {
    BOOL v148 = 1;
  }
  if (!v148 && v147 != __stderrp && v147 != __stdinp)
  {
    fflush(v147);
    fclose(*(FILE **)(*(void *)(a1[6] + 8LL) + 24LL));
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 0LL;
  }

LABEL_84:
}

void sub_100009B88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100009BA4(uint64_t a1)
{
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  __int128 v142 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) entities]);
  id v115 = [obj countByEnumeratingWithState:&v139 objects:v146 count:16];
  if (v115)
  {
    uint64_t v112 = *(void *)v140;
    do
    {
      uint64_t v2 = 0LL;
      do
      {
        if (*(void *)v140 != v112)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }

        uint64_t v116 = v2;
        id v4 = *(void **)(*((void *)&v139 + 1) + 8 * v2);
        uint64_t v117 = objc_autoreleasePoolPush();
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superentity]);

        if (!v5)
        {
          uint64_t v6 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          uint64_t v113 = -[NSFetchRequest initWithEntityName:](v6, "initWithEntityName:", v7);

          -[NSFetchRequest setReturnsObjectsAsFaults:](v113, "setReturnsObjectsAsFaults:", 0LL);
          v8 = *(void **)(a1 + 40);
          id v138 = 0LL;
          uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue([v8 executeFetchRequest:v113 error:&v138]);
          id v107 = v138;
          if (v109)
          {
            __int128 v136 = 0u;
            __int128 v137 = 0u;
            __int128 v134 = 0u;
            __int128 v135 = 0u;
            id v106 = v109;
            id v111 = [v106 countByEnumeratingWithState:&v134 objects:v145 count:16];
            if (!v111) {
              goto LABEL_61;
            }
            uint64_t v108 = *(void *)v135;
            while (1)
            {
              uint64_t v118 = 0LL;
              do
              {
                if (*(void *)v135 != v108) {
                  objc_enumerationMutation(v106);
                }
                uint64_t v121 = *(void **)(*((void *)&v134 + 1) + 8LL * (void)v118);
                v114 = objc_autoreleasePoolPush();
                id v9 = *(FILE **)(a1 + 64);
                id v10 = sub_10000A8B4(*(void *)(a1 + 48), v121);
                uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
                sub_100004368(v9, @"%@ {\n", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

                __int128 v132 = 0u;
                __int128 v133 = 0u;
                __int128 v130 = 0u;
                __int128 v131 = 0u;
                uint64_t v18 = *(void *)(a1 + 48);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v121 entity]);
                v20 = v19;
                if (v18)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 propertiesByName]);
                  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allValues]);
                  id v119 = (id)objc_claimAutoreleasedReturnValue([v22 sortedArrayUsingComparator:&stru_1000288F8]);
                }

                else
                {
                  id v119 = 0LL;
                }

                id v122 = [v119 countByEnumeratingWithState:&v130 objects:v144 count:16];
                if (v122)
                {
                  uint64_t v120 = *(void *)v131;
                  do
                  {
                    id v23 = 0LL;
                    do
                    {
                      if (*(void *)v131 != v120) {
                        objc_enumerationMutation(v119);
                      }
                      uint64_t v24 = *(void **)(*((void *)&v130 + 1) + 8LL * (void)v23);
                      context = objc_autoreleasePoolPush();
                      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
                      id v26 = (id)objc_claimAutoreleasedReturnValue([v121 valueForKey:v25]);

                      id v27 = v24;
                      uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSRelationshipDescription, v28);
                      if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0) {
                        v30 = v27;
                      }
                      else {
                        v30 = 0LL;
                      }
                      id v31 = v30;

                      if (!v31)
                      {
                        unint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v27 userInfo]);
                        unsigned int v123 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:@"HMKTTransformerNameKey"]);

                        uint64_t v61 = *(void *)(a1 + 48);
                        if (v123 && v26)
                        {
                          if (*(_BYTE *)(v61 + 8))
                          {
                            id v26 = v26;
                            goto LABEL_48;
                          }

                          id v72 = (void *)objc_claimAutoreleasedReturnValue( +[HMDValueTransformer valueTransformerForName:]( &OBJC_CLASS___HMDValueTransformer,  "valueTransformerForName:",  v123));
                          v73 = v72;
                          if (v72)
                          {
                            id v129 = 0LL;
                            v71 = (void *)objc_claimAutoreleasedReturnValue([v72 reverseTransformedValue:v26 error:&v129]);
                            id v74 = v129;

                            if (!v71) {
                              v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[[%@: %@]]",  v123,  v74));
                            }
                            id v26 = v74;
                          }

                          else
                          {
                            v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[[%@: transformer not found]]",  v123));
                          }

                          uint64_t v61 = *(void *)(a1 + 48);
                        }

                        else
                        {
                          v71 = v26;
                        }

                        id v26 = v71;
                        if (v61)
                        {
LABEL_48:
                          uint64_t v75 = HMFDescribeCollection(v26);
                          v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
                        }

                        else
                        {
                          v76 = 0LL;
                        }

                        v77 = (void *)objc_claimAutoreleasedReturnValue( [v76 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n    "]);
                        v78 = *(FILE **)(a1 + 64);
                        uint64_t v79 = objc_claimAutoreleasedReturnValue([v27 name]);
                        v86 = (void *)v79;
                        if (v123) {
                          sub_100004368(v78, @"    %@ (%@) = %@\n", v80, v81, v82, v83, v84, v85, v79);
                        }
                        else {
                          sub_100004368(v78, @"    %@ = %@\n", v80, v81, v82, v83, v84, v85, v79);
                        }

                        goto LABEL_53;
                      }

                      if ([v31 isToMany])
                      {
                        BOOL v32 = [v26 count] == 0;
                        uint64_t v33 = *(FILE **)(a1 + 64);
                        uint64_t v34 = objc_claimAutoreleasedReturnValue([v27 name]);
                        v41 = (void *)v34;
                        if (v32)
                        {
                          sub_100004368(v33, @"    %@ -> []\n", v35, v36, v37, v38, v39, v40, v34);
                        }

                        else
                        {
                          sub_100004368(v33, @"    %@ -> [\n", v35, v36, v37, v38, v39, v40, v34);

                          __int128 v127 = 0u;
                          __int128 v128 = 0u;
                          __int128 v125 = 0u;
                          __int128 v126 = 0u;
                          id v26 = v26;
                          id v42 = [v26 countByEnumeratingWithState:&v125 objects:v143 count:16];
                          if (v42)
                          {
                            uint64_t v43 = *(void *)v126;
                            do
                            {
                              for (i = 0LL; i != v42; i = (char *)i + 1)
                              {
                                if (*(void *)v126 != v43) {
                                  objc_enumerationMutation(v26);
                                }
                                id v45 = *(FILE **)(a1 + 64);
                                id v46 = sub_10000A8B4( *(void *)(a1 + 48),  *(void **)(*((void *)&v125 + 1) + 8LL * (void)i));
                                v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                                sub_100004368(v45, @"        %@\n", v48, v49, v50, v51, v52, v53, (uint64_t)v47);
                              }

                              id v42 = [v26 countByEnumeratingWithState:&v125 objects:v143 count:16];
                            }

                            while (v42);
                          }

                          sub_100004368(*(FILE **)(a1 + 64), @"    ]\n", v54, v55, v56, v57, v58, v59, v104);
                        }
                      }

                      else
                      {
                        uint64_t v62 = *(FILE **)(a1 + 64);
                        id v63 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
                        id v64 = sub_10000A8B4(*(void *)(a1 + 48), v26);
                        v105 = (void *)objc_claimAutoreleasedReturnValue(v64);
                        sub_100004368(v62, @"    %@ -> %@\n", v65, v66, v67, v68, v69, v70, (uint64_t)v63);
                      }

LABEL_53:
                      objc_autoreleasePoolPop(context);
                      id v23 = (char *)v23 + 1;
                    }

                    while (v23 != v122);
                    id v87 = [v119 countByEnumeratingWithState:&v130 objects:v144 count:16];
                    id v122 = v87;
                  }

                  while (v87);
                }

                sub_100004368(*(FILE **)(a1 + 64), @"}\n\n", v88, v89, v90, v91, v92, v93, v103);
                objc_autoreleasePoolPop(v114);
                uint64_t v118 = (char *)v118 + 1;
              }

              while (v118 != v111);
              id v94 = [v106 countByEnumeratingWithState:&v134 objects:v145 count:16];
              id v111 = v94;
              if (!v94)
              {
LABEL_61:

                goto LABEL_63;
              }
            }
          }

          uint64_t v95 = __stderrp;
          uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          sub_100004368(v95, @"Failed to fetch %@ objects: %@\n", v97, v98, v99, v100, v101, v102, (uint64_t)v96);

          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 2;
LABEL_63:
        }

        objc_autoreleasePoolPop(v117);
        uint64_t v2 = v116 + 1;
      }

      while ((id)(v116 + 1) != v115);
      id v115 = [obj countByEnumeratingWithState:&v139 objects:v146 count:16];
    }

    while (v115);
  }
}

void sub_10000A3D0(_Unwind_Exception *a1)
{
}
}

id sub_10000A4D4(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", a2));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:]( &OBJC_CLASS___NSPersistentStoreDescription,  "persistentStoreDescriptionWithURL:",  v2));
  [v3 setReadOnly:1];
  [v3 setUsesPersistentHistoryTracking:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  id v47 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:]( &OBJC_CLASS___NSPersistentStore,  "cachedModelForPersistentStoreWithURL:options:error:",  v2,  v4,  &v47));
  id v6 = v47;

  if (v5)
  {
    uint64_t v39 = v2;
    uint64_t v40 = v6;
    v41 = v5;
    id v42 = v3;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v5 entities]);
    id v45 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v53 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
          uint64_t v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___NSManagedObject, v13);
          uint64_t v17 = NSStringFromClass(v16);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          [v15 setManagedObjectClassName:v18];

          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 attributesByName]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 allValues]);

          id v21 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v49;
            do
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v49 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)j);
                if ([v25 attributeType] == (id)1800)
                {
                  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 userInfo]);
                  id v27 = [v26 mutableCopy];

                  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v25 valueTransformerName]);
                  [v27 setObject:v28 forKeyedSubscript:@"HMKTTransformerNameKey"];

                  [v25 setUserInfo:v27];
                  [v25 setValueTransformerName:@"HMDIdentityTransformer"];
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }

            while (v22);
          }
        }

        id v45 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }

      while (v45);
    }

    v5 = v41;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPersistentContainer persistentContainerWithName:managedObjectModel:]( &OBJC_CLASS___NSPersistentContainer,  "persistentContainerWithName:managedObjectModel:",  @"hmktool",  v41));
    uint64_t v3 = v42;
    uint64_t v56 = v42;
    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
    [v29 setPersistentStoreDescriptions:v30];

    id v46 = v40;
    LOBYTE(v30) = [v29 load:&v46];
    id v6 = v46;

    if ((v30 & 1) != 0)
    {
      id v37 = v29;
    }

    else
    {
      sub_100004368( __stderrp,  @"Failed to load CoreData container: %@\n",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v6);
      id v37 = 0LL;
    }

    uint64_t v2 = v39;
  }

  else
  {
    sub_100004368(__stderrp, @"Failed to read cached model: %@\n", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    id v37 = 0LL;
  }

  return v37;
}

id sub_10000A8B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  v5 = 0LL;
  if (a1 && v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 entity]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attributesByName]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"modelID"]);
    if (v8) {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"modelID"]);
    }
    else {
      uint64_t v9 = 0LL;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectID]);
    id v11 = sub_10000A984(v10, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v5;
}

id sub_10000A984(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 URIRepresentation]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"/"]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:1]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:2]);
  uint64_t v9 = (void *)v8;
  if (v3) {
    uint64_t v10 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@/%@/%@>", v7, v8, v3);
  }
  else {
    uint64_t v10 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@/%@>", v7, v8, v13);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

int64_t sub_10000AA70(id a1, NSPropertyDescription *a2, NSPropertyDescription *a3)
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPropertyDescription name](a2, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPropertyDescription name](v4, "name"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t sub_10000B338(uint64_t a1, uint64_t a2, void *a3)
{
  char isKindOfClass = objc_opt_isKindOfClass(a1, a2);
  char v6 = isKindOfClass;
  if (a3 && (isKindOfClass & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Expected %@", a2));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v7));
  }

  return v6 & 1;
}

id sub_10000B9FC()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"class methods are not supported when adapting NSValueTransformers",  0LL));
  objc_exception_throw(v0);
  return -[HMDValueTransformerReversingAdapter transformedValue:](v1, v2, v3);
}

void sub_10000BA54(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSCache);
  SEL v2 = (void *)qword_100032C80;
  qword_100032C80 = (uint64_t)v1;

  id v4 = (objc_class *)objc_opt_class(&OBJC_CLASS___HMDValueTransformer, v3);
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@".adaptersByName"]);
  [(id)qword_100032C80 setName:v6];
}

HMDHomeKitVersion *sub_10000BC28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_self(a1) valueTransformerForName:v3];
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    char v6 = (void *)v5;

    return (HMDHomeKitVersion *)v6;
  }

  else
  {
    uint64_t v8 = (void *)_HMFPreconditionFailureWithFormat(@"Invalid transformer name '%@'");
    return +[HMDHomeKitVersion currentVersion](v8, v9);
  }

void sub_10000C1BC(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"Accounts.Device.RPIdentity", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100032C98;
  qword_100032C98 = v2;
}

LABEL_25:
    objc_autoreleasePoolPop(v13);
    uint64_t v39 = 0LL;
    goto LABEL_26;
  }

  id v64 = v10;
  v75[0] = objc_opt_class(&OBJC_CLASS___NSArray, v11);
  v75[1] = objc_opt_class(&OBJC_CLASS___NSData, v41);
  id v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));

  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v43 forKey:@"HNLCurve.tpk"]);
  if (v44)
  {
    id v63 = v9;
    uint64_t v66 = v43;
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v70 = 0u;
    v71 = 0u;
    id v72 = 0u;
    v73 = 0u;
    uint64_t v65 = v44;
    id obj = v44;
    id v45 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v45)
    {
      id v46 = v45;
      id v47 = *(void *)v71;
      while (2)
      {
        for (i = 0LL; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v71 != v47) {
            objc_enumerationMutation(obj);
          }
          __int128 v49 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
          uint64_t v69 = 0LL;
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:error:]( &OBJC_CLASS___HAPCharacteristicValueLinearDerivedTransitionPoint,  "parsedFromData:error:",  v49,  &v69));
          __int128 v51 = v69;
          if (!v50)
          {
            __int128 v53 = objc_autoreleasePoolPush();
            self = self;
            __int128 v54 = HMFGetOSLogHandle(self);
            __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              uint64_t v56 = HMFGetLogIdentifier(self);
              uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
              *(_DWORD *)buf = 138543874;
              v77 = v57;
              v78 = 2112;
              uint64_t v79 = v49;
              uint64_t v80 = 2112;
              uint64_t v81 = (uint64_t)v51;
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to parse encoded transition point %@:%@",  buf,  0x20u);
            }

            objc_autoreleasePoolPop(v53);
            uint64_t v39 = 0LL;
            uint64_t v44 = v65;
            uint64_t v43 = v66;
            __int128 v52 = v68;
            goto LABEL_46;
          }

          [v68 addObject:v50];
        }

        id v46 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }

    __int128 v52 = v68;
    if ([v68 count])
    {
      self =  -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:]( self,  "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:",  1LL,  v68,  v8,  v6,  v63,  v64);
      -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:]( self,  "setColorTemperatureNotifyValueChangeThreshold:",  [v4 decodeIntegerForKey:@"HNLCurve.ctnvctk"]);
      -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:]( self,  "setColorTemperatureNotifyIntervalThresholdInMilliseconds:",  [v4 decodeInt64ForKey:@"HNLCurve.ctnitk"]);
      -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:]( self,  "setColorTemperatureUpdateIntervalInMilliseconds:",  [v4 decodeInt64ForKey:@"HNLCurve.ctuik"]);
      uint64_t v39 = self;
    }

    else
    {
      uint64_t v39 = 0LL;
    }

    uint64_t v44 = v65;
    uint64_t v43 = v66;
LABEL_46:
  }

  else
  {
    uint64_t v58 = objc_autoreleasePoolPush();
    self = self;
    uint64_t v59 = HMFGetOSLogHandle(self);
    unint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      uint64_t v61 = HMFGetLogIdentifier(self);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      *(_DWORD *)buf = 138543362;
      v77 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to decode transition points",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v58);
    uint64_t v39 = 0LL;
  }

LABEL_26:
  return v39;
}

LABEL_8:
  id v11 = objc_autoreleasePoolPush();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle(v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = HMFGetLogIdentifier(v12);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v18 = 138543874;
    uint64_t v19 = v16;
    v20 = 2048;
    id v21 = a4;
    id v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%{public}@Transition point for milliseconds elapsed since start of day %llums is %@",  (uint8_t *)&v18,  0x20u);
  }

  objc_autoreleasePoolPop(v11);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 colorTemperatureForBrightness:a3]));
LABEL_11:

  return v10;
}

void sub_10000EE68(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"light.natural.curve", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100032CA8;
  qword_100032CA8 = v2;
}

LABEL_13:
  uint64_t v12 = 0LL;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  @"Expected OPACK-compatible value"));
  }
LABEL_17:

  return v12;
}

void sub_10000F0DC(id a1)
{
  qword_100032CB0 = CFArrayGetTypeID();
  qword_100032CB8 = CFDictionaryGetTypeID();
  qword_100032CC0 = CFNullGetTypeID();
  qword_100032CC8 = CFBooleanGetTypeID();
  qword_100032CD0 = CFStringGetTypeID();
  qword_100032CD8 = CFNumberGetTypeID();
  qword_100032CE0 = CFDataGetTypeID();
  qword_100032CE8 = CFDateGetTypeID();
}

void sub_10000FF4C(id a1)
{
  uint64_t v1 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"297A1FDB-8A3E-443F-A8A8-1F3360785587");
  uint64_t v2 = (void *)qword_100032D08;
  qword_100032D08 = (uint64_t)v1;
}

void sub_100010030(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"Accounts.Handle", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100032D00;
  qword_100032D00 = v2;
}

void sub_100010634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001064C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v13 = a2;
  id v7 = a3;
  if ([v13 isEqual:@"$top"])
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    char isKindOfClass = objc_opt_isKindOfClass(v7, v9);

    if ((isKindOfClass & 1) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100032D30 objectForKeyedSubscript:v13]);
  unsigned __int8 v12 = [v7 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }

LABEL_6:
}

void sub_100010720(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:",  0LL));
  if (v1)
  {
    id v10 = v1;
    qword_100032D28 = (uint64_t)[v1 length];
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  0LL,  0LL,  0LL));
    id v4 = (void *)qword_100032D30;
    qword_100032D30 = v3;

    uint64_t v5 = qword_100032D30;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {

      return;
    }
  }

  else
  {
    _HMFPreconditionFailure(@"encodedNil != nil", v2);
  }

  uint64_t v9 = (void *)_HMFPreconditionFailure(@"[encodedNilPList isKindOfClass:NSDictionary.class]", v8);
  sub_1000107D4(v9);
}

void sub_1000107D4(id a1)
{
  v3[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v3[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v3[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v3[3] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v3[4] = objc_opt_class(&OBJC_CLASS___NSDate);
  v3[5] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v3[6] = objc_opt_class(&OBJC_CLASS___NSNull);
  v3[7] = objc_opt_class(&OBJC_CLASS___NSURL);
  v3[8] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v3[9] = objc_opt_class(&OBJC_CLASS___NSSet);
  v3[10] = objc_opt_class(&OBJC_CLASS___HMDAccountHandle);
  v3[11] = objc_opt_class(&OBJC_CLASS___HMDAccountIdentifier);
  v3[12] = objc_opt_class(&OBJC_CLASS___HMDDeviceHandle);
  v3[13] = objc_opt_class(&OBJC_CLASS___HMDHomeKitVersion);
  v3[14] = objc_opt_class(&OBJC_CLASS___HMDNaturalLightingContext);
  v3[15] = objc_opt_class(&OBJC_CLASS___HMDHomeManagerHomeHandle);
  v3[16] = objc_opt_class(&OBJC_CLASS___HMDRPIdentity);
  v3[17] = objc_opt_class(&OBJC_CLASS___HMFConnectivityInfo);
  v3[18] = objc_opt_class(&OBJC_CLASS___HMFPairingIdentity);
  v3[19] = objc_opt_class(&OBJC_CLASS___HMFProductInfo);
  v3[20] = objc_opt_class(&OBJC_CLASS___HMFSoftwareVersion);
  v3[21] = objc_opt_class(&OBJC_CLASS___HMFWiFiNetworkInfo);
  v3[22] = objc_opt_class(&OBJC_CLASS___HMSoftwareUpdateDocumentationMetadata);
  v3[23] = objc_opt_class(&OBJC_CLASS___IDSURI);
  v3[24] = objc_opt_class(&OBJC_CLASS___MPPlaybackArchive);
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 25LL));
  uint64_t v2 = (void *)qword_100032D20;
  qword_100032D20 = v1;
}

LABEL_19:
    v20 = 0LL;
    goto LABEL_20;
  }

  if ((unint64_t)[v8 count] > 5)
  {
    if (([v9 count] & 1) == 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (unint64_t)[v9 count] >> 1));
      if ([v9 count])
      {
        unsigned __int8 v12 = 0LL;
        do
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v12]);
          [v13 floatValue];
          uint64_t v15 = v14;
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v12 + 1]);
          [v16 floatValue];
          uint64_t v18 = v17;

          uint64_t v19 = objc_msgSend([HMPoint alloc], "initWithPoint:", v15, v18);
          [v11 addObject:v19];

          v12 += 2LL;
        }

        while (v12 < (unint64_t)[v9 count]);
      }

      v20 = [[HMCameraActivityZone alloc] initWithPoints:v11];
      goto LABEL_18;
    }

    if (a4)
    {
      id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSArray of even length to create HMCameraActivityZone: %@",  v5);
      goto LABEL_17;
    }

    goto LABEL_19;
  }

  if (!a4) {
    goto LABEL_19;
  }
  id v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSArray of at least 6 elements to create HMCameraActivityZone: %@",  v5);
LABEL_17:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v11));
LABEL_18:

LABEL_20:
  return v20;
}

void sub_100010CD4(uint64_t a1, void *a2)
{
  double v4 = v3;
  uint64_t v5 = *(void **)(a1 + 32);
  *(float *)&double v6 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6));
  [v5 addObject:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  *(float *)&double v9 = v4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
  [v8 addObject:v10];
}

void sub_100010E8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011064( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100011088(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100011098(uint64_t a1)
{
}

void sub_1000110A0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[HMDCoreDataTransformerHMCameraActivityZone valueFromOPACK:error:]( &OBJC_CLASS___HMDCoreDataTransformerHMCameraActivityZone,  "valueFromOPACK:error:",  v6,  &obj));
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }

  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to create HMCameraActivityZone: %@",  v6));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:reason:](&OBJC_CLASS___NSError, "hmfErrorWithCode:reason:", 15LL, v9));
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
      unsigned __int8 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    *a4 = 1;
  }
}

void sub_1000111A0(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[HMDCoreDataTransformerHMCameraActivityZone OPACKFromValue:error:]( &OBJC_CLASS___HMDCoreDataTransformerHMCameraActivityZone,  "OPACKFromValue:error:",  v5,  &obj));
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to opack HMCameraActivityZone: %@",  v5));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:reason:](&OBJC_CLASS___NSError, "hmfErrorWithCode:reason:", 15LL, v8));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

void sub_1000118C8(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"light.natural.curve.context", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  double v3 = (void *)qword_100032D48;
  qword_100032D48 = v2;
}

void sub_100011BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(dispatch_queue_s **)(v4 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100012534;
  block[3] = &unk_100028B08;
  block[4] = v4;
  id v9 = v5;
  id v10 = v3;
  id v7 = v3;
  dispatch_async(v6, block);
}

uint64_t sub_10001207C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001208C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = a2;
  if (!a2) {
    id v3 = *(void **)(a1 + 32);
  }
  uint64_t v6 = v3;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void sub_100012134(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  if (!a2) {
    id v5 = *(void **)(a1 + 32);
  }
  v10[0] = v5;
  uint64_t v6 = a3;
  if (!a3) {
    uint64_t v6 = *(void **)(a1 + 32);
  }
  v10[1] = v6;
  id v7 = a3;
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);
}

void sub_1000121FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = a2;
  if (!a2) {
    uint64_t v6 = *(void **)(a1 + 32);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v14[0] = v6;
  id v8 = a3;
  if (!a3) {
    id v8 = *(void **)(a1 + 32);
  }
  v14[1] = v8;
  id v9 = a4;
  if (!a4) {
    id v9 = *(void **)(a1 + 32);
  }
  v14[2] = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 3LL));
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v13);
}

void sub_1000122EC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  if (!a2) {
    id v8 = *(void **)(a1 + 32);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v18[0] = v8;
  id v10 = a3;
  if (!a3) {
    id v10 = *(void **)(a1 + 32);
  }
  v18[1] = v10;
  id v11 = a4;
  if (!a4) {
    id v11 = *(void **)(a1 + 32);
  }
  v18[2] = v11;
  id v12 = a5;
  if (!a5) {
    id v12 = *(void **)(a1 + 32);
  }
  v18[3] = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = a2;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v17);
}

void sub_1000123FC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a2;
  if (!a2) {
    id v10 = *(void **)(a1 + 32);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  v22[0] = v10;
  id v12 = a3;
  if (!a3) {
    id v12 = *(void **)(a1 + 32);
  }
  v22[1] = v12;
  id v13 = a4;
  if (!a4) {
    id v13 = *(void **)(a1 + 32);
  }
  v22[2] = v13;
  id v14 = a5;
  if (!a5) {
    id v14 = *(void **)(a1 + 32);
  }
  v22[3] = v14;
  id v15 = a6;
  if (!a6) {
    id v15 = *(void **)(a1 + 32);
  }
  v22[4] = v15;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = a2;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 5LL));
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v21);
}

void sub_100012534(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 16) isValid];
  id v3 = objc_autoreleasePoolPush();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier(v4);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@Forwarding block from server for key %@.",  (uint8_t *)&v15,  0x16u);
    }

    objc_autoreleasePoolPop(v3);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy]);
    [v11 _fireActualBlockWithArguments:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }

  else
  {
    if (v7)
    {
      uint64_t v12 = HMFGetLogIdentifier(v4);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%{public}@Dropping request to forward block to remote for key %@, connection is invalid.",  (uint8_t *)&v15,  0x16u);
    }

    objc_autoreleasePoolPop(v3);
  }

uint64_t sub_1000126CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000126DC(uint64_t a1)
{
}

void sub_1000126E4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

void sub_100012750(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isValid])
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy]);
    [v9 _removeActualBlockForKey:*(void *)(a1 + 40)];
  }

  else
  {
    unsigned int v2 = objc_autoreleasePoolPush();
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = HMFGetOSLogHandle(v3);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v3);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@Dropping request to remove remote block for key %@, connection is invalid.",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v2);
  }

void sub_100012E14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100012FD0(_Unwind_Exception *a1)
{
}

void sub_1000133A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10001354C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_100013B14(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]),
        unsigned int v6 = [v5 containsObject:@"argument-is-block"],
        v5,
        v6))
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"uniqueKey"]);
    id v8 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"encoding"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( NSMethodSignature,  "signatureWithObjCTypes:",  [v8 UTF8String]));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)((char *)a1[4] + 65),  "forwardingBlockWithArgumentCount:forKey:",  (char *)objc_msgSend(v9, "numberOfArguments") - 1,  v7));
    if (v10)
    {
      [*(id *)((char *)a1[4] + 65) addBlockNoCopy:v10 forKey:v7];
      uint64_t v11 = objc_autoreleasePoolPush();
      id v12 = a1[4];
      uint64_t v13 = HMFGetOSLogHandle(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier(v12);
        id v25 = v8;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        id v17 = [*(id *)((char *)a1[4] + 65) count];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v16;
        __int16 v29 = 2048;
        id v30 = v17;
        __int16 v31 = 2112;
        uint64_t v32 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%{public}@Added block (%lu) on server for key %@.",  buf,  0x20u);

        id v8 = v25;
      }

      objc_autoreleasePoolPop(v11);
      [a1[5] addObject:v10];
      objc_setAssociatedObject(v10, &unk_100032D50, v7, (void *)0x301);
      [a1[6] addObject:v10];
    }

    else
    {
      uint64_t v18 = objc_autoreleasePoolPush();
      id v19 = a1[4];
      uint64_t v20 = HMFGetOSLogHandle(v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier(v19);
        id v26 = v8;
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        id v24 = [*(id *)((char *)a1[4] + 65) count];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v23;
        __int16 v29 = 2048;
        id v30 = v24;
        __int16 v31 = 2112;
        uint64_t v32 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%{public}@Failed to construct dummy block (%lu) on client for key %@.",  buf,  0x20u);

        id v8 = v26;
      }

      objc_autoreleasePoolPop(v18);
    }
  }

  else
  {
    [a1[6] addObject:v3];
  }
}

id sub_100013E1C(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:]( &OBJC_CLASS___HMCAMDEmbeddedDeviceService,  "confirmSemaphoreAndSignal:",  *(void *)(a1 + 32));
}

id sub_100013E3C(uint64_t a1, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:]( &OBJC_CLASS___HMCAMDEmbeddedDeviceService,  "confirmSemaphoreAndSignal:",  *(void *)(a1 + 32));
}

id sub_100013E5C(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:]( &OBJC_CLASS___HMCAMDEmbeddedDeviceService,  "confirmSemaphoreAndSignal:",  *(void *)(a1 + 32));
}

id sub_100013EA0(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1[5] + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1[6] + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return +[HMCAMDEmbeddedDeviceService confirmSemaphoreAndSignal:]( &OBJC_CLASS___HMCAMDEmbeddedDeviceService,  "confirmSemaphoreAndSignal:",  a1[4]);
}

void sub_100013F1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier(v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@XPC communication error: %@.",  (uint8_t *)&v11,  0x16u);
  }

  objc_autoreleasePoolPop(v4);
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

void sub_10001402C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = objc_autoreleasePoolPush();
  id v3 = (char *)WeakRetained;
  uint64_t v4 = HMFGetOSLogHandle(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@Service invalidated, it may have crashed.",  buf,  0xCu);
  }

  objc_autoreleasePoolPop(v2);
  v3[34] = 0;
  uint64_t v8 = *(void *)(v3 + 57);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL * *(void *)(v3 + 25));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001460C;
  block[3] = &unk_100028DA8;
  block[4] = v3;
  dispatch_after(v9, &_dispatch_main_q, block);
}

void sub_100014194(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = objc_autoreleasePoolPush();
  id v3 = (char *)WeakRetained;
  uint64_t v4 = HMFGetOSLogHandle(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    unsigned int v8 = [*(id *)(v3 + 17) processIdentifier];
    *(_DWORD *)buf = 138543618;
    id v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@Service interrupted, it may have crashed, pid %u.",  buf,  0x12u);
  }

  objc_autoreleasePoolPop(v2);
  v3[34] = 0;
  uint64_t v9 = *(void *)(v3 + 49);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  uint64_t v10 = objc_autoreleasePoolPush();
  int v11 = v3;
  uint64_t v12 = HMFGetOSLogHandle(v11);
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier(v11);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543362;
    id v19 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%{public}@Will attempt to re-establish communication after 10 seconds.",  buf,  0xCu);
  }

  objc_autoreleasePoolPop(v10);
  dispatch_time_t v16 = dispatch_time(0LL, 10000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001438C;
  block[3] = &unk_100028DA8;
  block[4] = v11;
  dispatch_after(v16, &_dispatch_main_q, block);
}

void sub_10001438C(uint64_t a1)
{
  unsigned int v2 = objc_autoreleasePoolPush();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle(v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier(v3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@Attempting to re-establish communication.",  buf,  0xCu);
  }

  objc_autoreleasePoolPop(v2);
  if ([*(id *)(a1 + 32) testCommunication])
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 34LL) = 1;
    unsigned int v8 = objc_autoreleasePoolPush();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle(v9);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier(v9);
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}@Successfully re-established communication.",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v8);
  }

  else
  {
    uint64_t v14 = objc_autoreleasePoolPush();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier(v15);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%{public}@Failed to re-establish communication.",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v14);
    dispatch_time_t v20 = dispatch_time(0LL, 1000000000LL * *(void *)(*(void *)(a1 + 32) + 25LL));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014604;
    block[3] = &unk_100028DA8;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v20, &_dispatch_main_q, block);
  }

id sub_100014604(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetConnection];
}

id sub_10001460C(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetConnection];
}

void sub_100014614(uint64_t a1, void *a2)
{
  id v3 = a2;
  id AssociatedObject = objc_getAssociatedObject(v3, &unk_100032D50);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  [*(id *)(*(void *)(a1 + 32) + 65) removeBlock:v3];
  uint64_t v6 = objc_autoreleasePoolPush();
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = HMFGetOSLogHandle(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier(v7);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [*(id *)(*(void *)(a1 + 32) + 65) count];
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    id v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%{public}@Removed block (%lu) on server for key %@.",  (uint8_t *)&v13,  0x20u);
  }

  objc_autoreleasePoolPop(v6);
}

void sub_1000148CC(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"CAMEmbeddedDeviceService", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100032D60;
  qword_100032D60 = v2;
}

void sub_100014A10(_Unwind_Exception *a1)
{
}

void sub_1000152A4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = objc_autoreleasePoolPush();
    id v3 = v1;
    uint64_t v4 = HMFGetOSLogHandle(v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v3);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@Preparing homed for the diagnostic extension.",  (uint8_t *)&buf,  0xCu);
    }

    objc_autoreleasePoolPop(v2);
    uint64_t v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    id v9 = (void *)v3[1];
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    unsigned int v21 = sub_10001A780;
    uint64_t v22 = &unk_100028D80;
    uint64_t v23 = v3;
    uint64_t v10 = v8;
    id v24 = v10;
    [v9 prepareForDiagnosticExtensionWithCompletion:&buf];
    dispatch_time_t v11 = dispatch_time(0LL, 120000000000LL);
    if (dispatch_group_wait(v10, v11))
    {
      id v12 = objc_autoreleasePoolPush();
      int v13 = v3;
      uint64_t v14 = HMFGetOSLogHandle(v13);
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier(v13);
        __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        int v18 = 138543362;
        id v19 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@Timed out preparing.",  (uint8_t *)&v18,  0xCu);
      }

      objc_autoreleasePoolPop(v12);
    }
  }

void sub_100015498(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v8 = objc_autoreleasePoolPush();
    id v9 = a1;
    uint64_t v10 = HMFGetOSLogHandle(v9);
    dispatch_time_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier(v9);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v23 = 138543618;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%{public}@Phase Started: %@",  (uint8_t *)&v23,  0x16u);
    }

    objc_autoreleasePoolPop(v8);
    v6[2](v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v14 timeIntervalSinceDate:v7];
    uint64_t v16 = v15;

    __int16 v17 = objc_autoreleasePoolPush();
    id v18 = v9;
    uint64_t v19 = HMFGetOSLogHandle(v18);
    dispatch_time_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier(v18);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      int v23 = 138543874;
      id v24 = v22;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2048;
      uint64_t v28 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%{public}@Phase Finished: %@, elapsed: %fs",  (uint8_t *)&v23,  0x20u);
    }

    objc_autoreleasePoolPop(v17);
  }
}

void sub_100015690(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = objc_opt_self(&OBJC_CLASS___HomeKitDiagnosticExtension);
    objc_opt_self(v3);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/mobile/Library/Logs/CrashReporter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"DiagnosticLogs"]);

    objc_opt_self(&OBJC_CLASS___HomeKitDiagnosticExtension);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"HomeKit.(.)*.log(.gz)?",  1LL,  0LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 filesInDir:v5 matchingPattern:v6 excludingPattern:0]);
    id v8 = [v7 mutableCopy];

    [v8 sortUsingComparator:&stru_100028E38];
    id v9 = (char *)[v8 count];
    else {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v11 = (uint64_t)v9;
    }
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", v10, v11));

    [v1 addObjectsFromArray:v12];
  }

  else
  {
    id v12 = 0LL;
    [v1 addObjectsFromArray:0];
  }
}

void sub_1000157BC(uint64_t a1)
{
  uint64_t v39 = *(void **)(a1 + 32);
  id v42 = *(void **)(a1 + 40);
  if (v42)
  {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_(homed)_.*memgraph$"));
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:"));
    uint64_t v2 = MREExceptionTypeToString(2LL);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v55[0] = v3;
    uint64_t v4 = MREExceptionTypeToString(3LL);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v55[1] = v5;
    uint64_t v6 = MREExceptionTypeToString(4LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v55[2] = v7;
    uint64_t v8 = MREExceptionTypeToString(5LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v55[3] = v9;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 4LL));

    uint64_t v11 = (void *)v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMECacheEnumerator getLogPathsSortedByTime]( &OBJC_CLASS___RMECacheEnumerator,  "getLogPathsSortedByTime"));
    id v15 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v47;
      uint64_t v40 = v14;
      uint64_t v41 = *(void *)v47;
      do
      {
        id v18 = 0LL;
        id v43 = v16;
        do
        {
          if (*(void *)v47 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v18);
          dispatch_time_t v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v1,  "firstMatchInString:options:range:",  v19,  0,  0,  objc_msgSend(v19, "length")));

          if (v20)
          {
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472LL;
            v45[2] = sub_10001A708;
            v45[3] = &unk_100028DF8;
            v45[4] = v19;
            unsigned __int8 v21 = objc_msgSend(v11, "na_any:", v45);
            id v22 = [v12 count];
            if ((v21 & 1) != 0 || !v22)
            {
              id v24 = objc_autoreleasePoolPush();
              id v25 = v42;
              uint64_t v26 = HMFGetOSLogHandle(v25);
              __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v28 = HMFGetLogIdentifier(v25);
                __int16 v29 = v13;
                id v30 = v12;
                __int16 v31 = v1;
                uint64_t v32 = v11;
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v28);
                *(_DWORD *)__int128 buf = 138543618;
                __int128 v51 = v33;
                __int16 v52 = 2112;
                __int128 v53 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%{public}@Prioritizing %@",  buf,  0x16u);

                uint64_t v11 = v32;
                uint64_t v1 = v31;
                id v12 = v30;
                int v13 = v29;
                uint64_t v14 = v40;
              }

              objc_autoreleasePoolPop(v24);
              int v23 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v19));
              [v12 addObject:v23];
              uint64_t v17 = v41;
              id v16 = v43;
            }

            else
            {
              int v23 = (void *)objc_claimAutoreleasedReturnValue( +[DEAttachmentItem attachmentWithPath:]( &OBJC_CLASS___DEAttachmentItem,  "attachmentWithPath:",  v19));
              [v13 addObject:v23];
            }
          }

          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }

      while (v16);
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:v13]);
    id v35 = [v34 count];
    else {
      uint64_t v36 = (uint64_t)v35;
    }
    id v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subarrayWithRange:", 0, v36));
    id v44 = [v37 copy];

    [v39 addObjectsFromArray:v44];
  }

  else
  {
    id v44 = 0LL;
    [v39 addObjectsFromArray:0];
  }
}

void sub_100015BC8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1)
  {
LABEL_14:

    return;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HMFProductInfo productInfo](&OBJC_CLASS___HMFProductInfo, "productInfo"));
  if ([v3 productVariant] != (id)3)
  {

    goto LABEL_11;
  }

  uint64_t v4 = v1[2];

  if (!v4)
  {
LABEL_11:
    __int16 v27 = objc_autoreleasePoolPush();
    uint64_t v28 = v1;
    uint64_t v29 = HMFGetOSLogHandle(v28);
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = HMFGetLogIdentifier(v28);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@Not retrieving endpoint assignments",  (uint8_t *)&buf,  0xCu);
    }

    objc_autoreleasePoolPop(v27);
    goto LABEL_14;
  }

  id v5 = objc_autoreleasePoolPush();
  uint64_t v6 = v1;
  uint64_t v7 = HMFGetOSLogHandle(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%{public}@Starting to fetch endpoint assignments.",  (uint8_t *)&buf,  0xCu);
  }

  objc_autoreleasePoolPop(v5);
  uint64_t v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v57 = 0x3032000000LL;
  uint64_t v58 = sub_100019E78;
  uint64_t v59 = sub_100019E88;
  id v12 = objc_alloc(&OBJC_CLASS___NSString);
  id v13 = v6[2];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v6[2] device]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 idsIdentifier]);
  unint64_t v60 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"Endpoint Assignments Requested from %@ [%@]",  v14,  v16);

  id v17 = v6[2];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100019E90;
  v49[3] = &unk_100028FB8;
  v49[4] = v6;
  id v18 = v11;
  __int128 v50 = v18;
  p___int128 buf = &buf;
  [v17 fetchEndpointAssignmentsWithCompletion:v49];

  dispatch_time_t v19 = dispatch_time(0LL, 60000000000LL);
  if (dispatch_group_wait(v18, v19))
  {
    dispatch_time_t v20 = objc_autoreleasePoolPush();
    unsigned __int8 v21 = v6;
    uint64_t v22 = HMFGetOSLogHandle(v21);
    int v23 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier(v21);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)__int16 v52 = 138543362;
      __int128 v53 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@Timed out trying to fetch endpoint assignments.",  v52,  0xCu);
    }

    objc_autoreleasePoolPop(v20);
    id v26 = 0LL;
  }

  else
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HomeKit-Endpoint-Assignments-%@.txt",  v34));

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v33 temporaryDirectory]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 URLByAppendingPathComponent:v35]);

    uint64_t v38 = *(void **)(*((void *)&buf + 1) + 40LL);
    id v48 = 0LL;
    [v38 writeToURL:v37 atomically:1 encoding:4 error:&v48];
    id v39 = v48;
    if (v39)
    {
      uint64_t v40 = objc_autoreleasePoolPush();
      uint64_t v41 = v6;
      uint64_t v42 = HMFGetOSLogHandle(v41);
      id v43 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = HMFGetLogIdentifier(v41);
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        *(_DWORD *)__int16 v52 = 138543618;
        __int128 v53 = v45;
        __int16 v54 = 2112;
        id v55 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to write out assignments with error %@",  v52,  0x16u);
      }

      objc_autoreleasePoolPop(v40);
      id v26 = 0LL;
    }

    else
    {
      id v26 = [[DEAttachmentItem alloc] initWithPathURL:v37];
    }
  }

  id v47 = v26;

  _Block_object_dispose(&buf, 8);
  __int128 v46 = v47;
  if (v47)
  {
    [*(id *)(a1 + 40) addObject:v47];
    __int128 v46 = v47;
  }
}

void sub_1000160F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_100016130(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1) {
    goto LABEL_39;
  }
  id v3 = -[HMCAMDEmbeddedDeviceService initAsRoot](objc_alloc(&OBJC_CLASS___HMCAMDEmbeddedDeviceService), "initAsRoot");
  [v3 setDirectInvocations:0];
  [v3 start];
  uint64_t v70 = @"ddt homed";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL));
  id v63 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v3 performCommandFromClass:@"os" method:@"executeShellCommand:" arguments:v4 error:&v63]);
  id v6 = v63;

  if (v5 && v6 == 0LL)
  {
    id v14 = v5;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    int v16 = objc_opt_isKindOfClass(v14, v15) & 1;
    id v17 = v16 ? v14 : 0LL;
    id v18 = v17;

    if (v16)
    {
      id v19 = (id)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"standardOutput"]);
      dispatch_time_t v20 = (void *)objc_opt_self(&OBJC_CLASS___HomeKitDiagnosticExtension);
      char v65 = 0;
      NSStringEncodingDetectionOptionsKey v71 = NSStringEncodingDetectionSuggestedEncodingsKey;
      id v72 = &off_10002B478;
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
      id v64 = 0LL;
      NSStringEncoding v22 = +[NSString stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:]( &OBJC_CLASS___NSString,  "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:",  v19,  v21,  &v64,  &v65);
      id v23 = v64;

      if (v22)
      {
        if (v65)
        {
          uint64_t v24 = objc_autoreleasePoolPush();
          id v25 = v20;
          uint64_t v26 = HMFGetOSLogHandle(v25);
          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = HMFGetLogIdentifier(v25);
            id v59 = v18;
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            *(_DWORD *)__int128 buf = 138543362;
            uint64_t v67 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%{public}@Lossy conversion was required to convert task data to a string.",  buf,  0xCu);

            id v18 = v59;
          }

          objc_autoreleasePoolPop(v24);
        }

        id v30 = v23;
      }

      else
      {
        id v37 = objc_autoreleasePoolPush();
        id v38 = v20;
        uint64_t v39 = HMFGetOSLogHandle(v38);
        uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = HMFGetLogIdentifier(v38);
          id v60 = v18;
          uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)__int128 buf = 138543362;
          uint64_t v67 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@Unable to convert task data to a string.",  buf,  0xCu);

          id v18 = v60;
        }

        objc_autoreleasePoolPop(v37);
        id v30 = 0LL;
      }

      if (v30)
      {
        id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 temporaryDirectory]);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 URLByAppendingPathComponent:@"homed-ddt.txt"]);

        id v62 = 0LL;
        [v30 writeToURL:v45 atomically:1 encoding:4 error:&v62];
        id v6 = v62;
        if (v6)
        {
          context = objc_autoreleasePoolPush();
          id v46 = v1;
          uint64_t v47 = HMFGetOSLogHandle(v46);
          id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            uint64_t v49 = HMFGetLogIdentifier(v46);
            id v61 = v18;
            __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
            *(_DWORD *)__int128 buf = 138543618;
            uint64_t v67 = v50;
            __int16 v68 = 2112;
            id v69 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to write ddt stdOut, error: %@",  buf,  0x16u);

            id v18 = v61;
          }

          objc_autoreleasePoolPop(context);
          id v58 = 0LL;
        }

        else
        {
          id v58 = [[DEAttachmentItem alloc] initWithPathURL:v45];
          [v58 setShouldCompress:&__kCFBooleanTrue];
          [v58 setDeleteOnAttach:&__kCFBooleanTrue];
        }
      }

      else
      {
        __int128 v51 = objc_autoreleasePoolPush();
        id v52 = v1;
        uint64_t v53 = HMFGetOSLogHandle(v52);
        __int16 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          uint64_t v55 = HMFGetLogIdentifier(v52);
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          *(_DWORD *)__int128 buf = 138543362;
          uint64_t v67 = v56;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}@no stdout for ddt", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v51);
        id v6 = 0LL;
        id v58 = 0LL;
      }
    }

    else
    {
      uint64_t v31 = objc_autoreleasePoolPush();
      id v32 = v1;
      uint64_t v33 = HMFGetOSLogHandle(v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = HMFGetLogIdentifier(v32);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v67 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}@ddt shell result is not a dictionary",  buf,  0xCu);
      }

      objc_autoreleasePoolPop(v31);
      id v6 = 0LL;
      id v58 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = objc_autoreleasePoolPush();
    id v9 = v1;
    uint64_t v10 = HMFGetOSLogHandle(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier(v9);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v67 = v13;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ddt shell error: %@", buf, 0x16u);
    }

    objc_autoreleasePoolPop(v8);
    id v58 = 0LL;
  }

  if (v58) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else {
LABEL_39:
  }
    id v58 = 0LL;
}

void sub_10001676C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v179 = *(id *)(a1 + 40);
  if (!v179)
  {
    id v180 = 0LL;
    [v1 addObjectsFromArray:0];
    goto LABEL_68;
  }

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!v2)
  {
    uint64_t v118 = objc_autoreleasePoolPush();
    id v119 = v179;
    uint64_t v120 = HMFGetOSLogHandle(v119);
    uint64_t v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
    {
      uint64_t v122 = HMFGetLogIdentifier(v119);
      unsigned int v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
      *(_DWORD *)id v198 = 138543362;
      *(void *)&v198[4] = v123;
      _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to get NSFileManager",  v198,  0xCu);
    }

    objc_autoreleasePoolPop(v118);
    uint64_t v117 = 0LL;
    goto LABEL_65;
  }

  uid_t v3 = getuid();
  uint64_t v4 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", getpwuid(v3)->pw_dir);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"Library"]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByAppendingPathComponent:@"homed"]);
  if (!v8)
  {
LABEL_63:
    uint64_t v117 = 0LL;
    goto LABEL_64;
  }

  char v183 = 0;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
  unsigned __int8 v10 = [v2 fileExistsAtPath:v9 isDirectory:&v183];

  if ((v10 & 1) == 0)
  {
    v124 = objc_autoreleasePoolPush();
    id v125 = v179;
    uint64_t v126 = HMFGetOSLogHandle(v125);
    __int128 v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
    {
      uint64_t v128 = HMFGetLogIdentifier(v125);
      id v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
      *(_DWORD *)id v198 = 138543618;
      *(void *)&v198[4] = v129;
      __int16 v199 = 2112;
      v200 = v8;
      __int128 v130 = "%{public}@Database path doesn't exist: '%@'";
      __int128 v131 = v127;
      os_log_type_t v132 = OS_LOG_TYPE_INFO;
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, v131, v132, v130, v198, 0x16u);
    }

LABEL_62:
    objc_autoreleasePoolPop(v124);
    goto LABEL_63;
  }

  if (!v183)
  {
    v124 = objc_autoreleasePoolPush();
    id v125 = v179;
    uint64_t v133 = HMFGetOSLogHandle(v125);
    __int128 v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v133);
    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
    {
      uint64_t v134 = HMFGetLogIdentifier(v125);
      id v129 = (void *)objc_claimAutoreleasedReturnValue(v134);
      *(_DWORD *)id v198 = 138543618;
      *(void *)&v198[4] = v129;
      __int16 v199 = 2112;
      v200 = v8;
      __int128 v130 = "%{public}@Database path is not a directory: '%@'";
      __int128 v131 = v127;
      os_log_type_t v132 = OS_LOG_TYPE_ERROR;
      goto LABEL_61;
    }

    goto LABEL_62;
  }

  id v182 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v2 URLForDirectory:99 inDomain:1 appropriateForURL:v8 create:1 error:&v182]);
  id v12 = v182;
  if (!v11)
  {
    __int128 v136 = objc_autoreleasePoolPush();
    id v137 = v179;
    uint64_t v138 = HMFGetOSLogHandle(v137);
    __int128 v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      uint64_t v140 = HMFGetLogIdentifier(v137);
      __int128 v141 = (void *)objc_claimAutoreleasedReturnValue(v140);
      *(_DWORD *)id v198 = 138543874;
      *(void *)&v198[4] = v141;
      __int16 v199 = 2112;
      v200 = v8;
      __int16 v201 = 2112;
      id v202 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to create temporary directory %@: %@",  v198,  0x20u);
    }

    objc_autoreleasePoolPop(v136);
    uint64_t v117 = 0LL;
    id v15 = v12;
    goto LABEL_81;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"homed-database"]);
  id v181 = v12;
  unsigned __int8 v14 = [v2 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v181];
  id v15 = v181;

  if ((v14 & 1) == 0)
  {
    __int128 v142 = objc_autoreleasePoolPush();
    id v143 = v179;
    uint64_t v144 = HMFGetOSLogHandle(v143);
    uint64_t v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
    if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
    {
      uint64_t v146 = HMFGetLogIdentifier(v143);
      v147 = (void *)objc_claimAutoreleasedReturnValue(v146);
      *(_DWORD *)id v198 = 138543874;
      *(void *)&v198[4] = v147;
      __int16 v199 = 2112;
      v200 = v13;
      __int16 v201 = 2112;
      id v202 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to create target directory %@: %@",  v198,  0x20u);
    }

    objc_autoreleasePoolPop(v142);
    uint64_t v117 = 0LL;
    goto LABEL_80;
  }

  id v160 = v15;
  id v16 = v2;
  id v17 = v8;
  v161 = v13;
  id v178 = v13;
  v189[0] = _NSConcreteStackBlock;
  v189[1] = 3221225472LL;
  v189[2] = sub_100019D5C;
  v189[3] = &unk_100028E60;
  v189[4] = v179;
  v175 = v16;
  uint64_t v158 = objc_retainBlock(v189);
  v159 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v17, 0, 7));
  __int128 v185 = 0u;
  __int128 v186 = 0u;
  __int128 v187 = 0u;
  __int128 v188 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v185 objects:v198 count:16];
  v174 = v19;
  if (!v20)
  {

    goto LABEL_76;
  }

  id v21 = v20;
  v154 = v11;
  v155 = v8;
  v156 = v2;
  v157 = v1;
  char v22 = 0;
  uint64_t v23 = *(void *)v186;
  uint64_t v24 = v19;
  uint64_t v176 = *(void *)v186;
  do
  {
    id v25 = 0LL;
    id v177 = v21;
    do
    {
      if (*(void *)v186 != v23) {
        objc_enumerationMutation(v24);
      }
      uint64_t v26 = *(void **)(*((void *)&v185 + 1) + 8LL * (void)v25);
      __int16 v27 = objc_autoreleasePoolPush();
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 pathExtension]);
      unsigned int v29 = [v28 hasPrefix:@"sqlite"];

      if (v29)
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
        if ([v31 hasPrefix:@"core"])
        {

LABEL_17:
        }

        else
        {
          uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
          unsigned __int8 v103 = [v102 hasPrefix:@"eventstore"];

          if ((v103 & 1) == 0)
          {
            uint64_t v23 = v176;
            id v21 = v177;
            goto LABEL_50;
          }
        }

        id v32 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v178 URLByAppendingPathComponent:v32]);

        if (v33)
        {
          id v184 = 0LL;
          unsigned __int8 v34 = [v175 copyItemAtURL:v26 toURL:v33 error:&v184];
          id v35 = v184;
          if ((v34 & 1) != 0)
          {
            if ((v22 & 1) == 0)
            {
              uint64_t v36 = objc_autoreleasePoolPush();
              id v37 = v179;
              uint64_t v38 = HMFGetOSLogHandle(v37);
              uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                uint64_t v40 = HMFGetLogIdentifier(v37);
                uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                *(_DWORD *)__int128 buf = 138543618;
                __int128 v191 = v41;
                __int16 v192 = 2112;
                id v193 = v178;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "%{public}@Copying database files to '%@'",  buf,  0x16u);

                uint64_t v24 = v174;
              }

              objc_autoreleasePoolPop(v36);
            }

            uint64_t v42 = objc_autoreleasePoolPush();
            id v43 = v179;
            uint64_t v44 = HMFGetOSLogHandle(v43);
            id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              uint64_t v46 = HMFGetLogIdentifier(v43);
              uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
              *(_DWORD *)__int128 buf = 138543618;
              __int128 v191 = v47;
              __int16 v192 = 2112;
              id v193 = v26;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%{public}@Copied '%@'", buf, 0x16u);

              uint64_t v24 = v174;
            }

            objc_autoreleasePoolPop(v42);
            id v48 = v26;
            id v49 = v33;
            __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v48 pathExtension]);
            unsigned __int8 v51 = [v50 isEqualToString:@"sqlite"];

            if ((v51 & 1) != 0)
            {
              id v52 = (void *)objc_claimAutoreleasedReturnValue([v48 absoluteString]);
              uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 lastPathComponent]);
              unsigned __int8 v54 = [v53 hasPrefix:@"core"];

              if ((v54 & 1) != 0)
              {
                id v170 = v48;
                id v171 = v35;
                id v55 = v48;
                id v169 = v49;
                id v56 = v49;
                context = objc_autoreleasePoolPush();
                uint64_t v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v55 path]);
                [v163 addObject:v57];

                id v172 = v56;
                uint64_t v165 = (void *)objc_claimAutoreleasedReturnValue([v56 path]);
                uint64_t v162 = (void *)objc_claimAutoreleasedReturnValue([v165 stringByDeletingLastPathComponent]);
                unint64_t v173 = v55;
                id v58 = (void *)objc_claimAutoreleasedReturnValue([v55 lastPathComponent]);
                id v59 = (void *)objc_claimAutoreleasedReturnValue([v58 pathComponents]);
                id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 firstObject]);
                id v61 = (void *)objc_claimAutoreleasedReturnValue([v60 stringByDeletingPathExtension]);
                id v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@-dumpobjects.txt",  v162,  v61));
                [v163 addObject:v62];

                id v63 = objc_alloc_init(&OBJC_CLASS___HMKTDumpObjects);
                id v64 = (id)-[HMKTDumpObjects main:](v63, "main:", v163);

                char v65 = objc_autoreleasePoolPush();
                id v66 = v43;
                uint64_t v67 = HMFGetOSLogHandle(v66);
                __int16 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                {
                  uint64_t v69 = HMFGetLogIdentifier(v66);
                  uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
                  NSStringEncodingDetectionOptionsKey v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v64));
                  *(_DWORD *)__int128 buf = 138543874;
                  __int128 v191 = v70;
                  __int16 v192 = 2112;
                  id v193 = v163;
                  __int16 v194 = 2112;
                  __int128 v195 = v71;
                  _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_INFO,  "%{public}@dumpObject for [%@] finished with %@",  buf,  0x20u);
                }

                objc_autoreleasePoolPop(v65);
                objc_autoreleasePoolPop(context);
                contexta = objc_autoreleasePoolPush();
                id v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                v73 = (void *)objc_claimAutoreleasedReturnValue([v173 path]);
                [v72 addObject:v73];

                id v164 = (void *)objc_claimAutoreleasedReturnValue([v172 path]);
                id v74 = (void *)objc_claimAutoreleasedReturnValue([v164 stringByDeletingLastPathComponent]);
                uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v173 lastPathComponent]);
                v76 = (void *)objc_claimAutoreleasedReturnValue([v75 pathComponents]);
                v77 = (void *)objc_claimAutoreleasedReturnValue([v76 firstObject]);
                id v166 = v66;
                v78 = (void *)objc_claimAutoreleasedReturnValue([v77 stringByDeletingPathExtension]);
                uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@-dumphistory.txt",  v74,  v78));
                [v72 addObject:v79];

                uint64_t v80 = objc_alloc_init(&OBJC_CLASS___HMKTDumpHistory);
                id v81 = (id)-[HMKTDumpHistory main:](v80, "main:", v72);

                uint64_t v82 = objc_autoreleasePoolPush();
                id v83 = v166;
                uint64_t v84 = HMFGetOSLogHandle(v83);
                uint64_t v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                {
                  uint64_t v86 = HMFGetLogIdentifier(v83);
                  id v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
                  uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v81));
                  *(_DWORD *)__int128 buf = 138543874;
                  __int128 v191 = v87;
                  __int16 v192 = 2112;
                  id v193 = v72;
                  __int16 v194 = 2112;
                  __int128 v195 = v88;
                  _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_INFO,  "%{public}@dumpHistory for [%@] finished with %@",  buf,  0x20u);
                }

                objc_autoreleasePoolPop(v82);
                objc_autoreleasePoolPop(contexta);

                uint64_t v24 = v174;
                id v48 = v170;
                id v35 = v171;
                id v49 = v169;
              }

              else
              {
                uint64_t v110 = objc_autoreleasePoolPush();
                id v111 = v43;
                uint64_t v112 = HMFGetOSLogHandle(v111);
                uint64_t v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
                if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v114 = HMFGetLogIdentifier(v111);
                  id v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
                  *(_DWORD *)__int128 buf = 138543618;
                  __int128 v191 = v115;
                  __int16 v192 = 2112;
                  id v193 = v48;
                  _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_ERROR,  "%{public}@%@ is not core data database file. Skipping dumpobjects on it.",  buf,  0x16u);
                }

                objc_autoreleasePoolPop(v110);
                uint64_t v24 = v174;
              }
            }

            else
            {
              uint64_t v104 = objc_autoreleasePoolPush();
              id v105 = v43;
              uint64_t v106 = HMFGetOSLogHandle(v105);
              id v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
              {
                uint64_t v108 = HMFGetLogIdentifier(v105);
                uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
                *(_DWORD *)__int128 buf = 138543618;
                __int128 v191 = v109;
                __int16 v192 = 2112;
                id v193 = v48;
                _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_ERROR,  "%{public}@%@ is not sqlite file",  buf,  0x16u);

                uint64_t v24 = v174;
              }

              objc_autoreleasePoolPop(v104);
            }

            char v22 = 1;
          }

          else
          {
            uint64_t v96 = objc_autoreleasePoolPush();
            id v97 = v179;
            uint64_t v98 = HMFGetOSLogHandle(v97);
            uint64_t v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              uint64_t v100 = HMFGetLogIdentifier(v97);
              uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
              *(_DWORD *)__int128 buf = 138544130;
              __int128 v191 = v101;
              __int16 v192 = 2112;
              id v193 = v26;
              __int16 v194 = 2112;
              __int128 v195 = v33;
              __int16 v196 = 2112;
              id v197 = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to copy '%@' to '%@': %@",  buf,  0x2Au);

              uint64_t v24 = v174;
            }

            objc_autoreleasePoolPop(v96);
          }

          uint64_t v23 = v176;
          id v21 = v177;
        }

        else
        {
          uint64_t v89 = objc_autoreleasePoolPush();
          id v90 = v179;
          uint64_t v91 = HMFGetOSLogHandle(v90);
          uint64_t v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            uint64_t v93 = HMFGetLogIdentifier(v90);
            id v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
            uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue([v26 lastPathComponent]);
            *(_DWORD *)__int128 buf = 138543874;
            __int128 v191 = v94;
            __int16 v192 = 2112;
            id v193 = v178;
            __int16 v194 = 2112;
            __int128 v195 = v95;
            _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to create temporary file URL: '%@' '%@'",  buf,  0x20u);
          }

          objc_autoreleasePoolPop(v89);
          uint64_t v23 = v176;
          id v21 = v177;
        }
      }

LABEL_50:
      objc_autoreleasePoolPop(v27);
      id v25 = (char *)v25 + 1;
    }

    while (v21 != v25);
    id v21 = [v24 countByEnumeratingWithState:&v185 objects:v198 count:16];
  }

  while (v21);

  uint64_t v2 = v156;
  uint64_t v1 = v157;
  uint64_t v11 = v154;
  uint64_t v8 = v155;
  if ((v22 & 1) != 0)
  {

    id v116 = [[DEAttachmentItem alloc] initWithPathURL:v178];
    [v116 setShouldCompress:&__kCFBooleanTrue];
    [v116 setDeleteOnAttach:&__kCFBooleanTrue];
    *(void *)id v198 = v116;
    uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v198, 1LL));

    goto LABEL_79;
  }

LABEL_76:
  BOOL v148 = objc_autoreleasePoolPush();
  id v149 = v179;
  uint64_t v150 = HMFGetOSLogHandle(v149);
  uint64_t v151 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);
  if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
  {
    uint64_t v152 = HMFGetLogIdentifier(v149);
    v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
    *(_DWORD *)__int128 buf = 138543362;
    __int128 v191 = v153;
    _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_INFO, "%{public}@No files copied", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v148);
  uint64_t v117 = 0LL;
LABEL_79:
  id v15 = v160;
  id v13 = v161;
LABEL_80:

LABEL_81:
LABEL_64:

LABEL_65:
  __int128 v135 = &__NSArray0__struct;
  if (v117) {
    __int128 v135 = v117;
  }
  id v180 = v135;

  [v1 addObjectsFromArray:v180];
LABEL_68:
}

void sub_100017828(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v60 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v3 = objc_opt_class(v1);
    objc_opt_self(v3);
    if (qword_100032D68 != -1) {
      dispatch_once(&qword_100032D68, &stru_100028EA0);
    }
    id v4 = (id)qword_100032D70;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringFromDate:v5]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 temporaryDirectory]);
    id v59 = (void *)v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HK_Network_Diagnostics_%@",  v6));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v9]);

    id v11 = objc_alloc(&OBJC_CLASS___HMFNetworkDiagnosticCollector);
    id v13 = objc_msgSend(v11, "initWithQueue:", objc_getProperty(v1, v12, 32, 1));
    unsigned __int8 v14 = objc_autoreleasePoolPush();
    id v15 = v1;
    uint64_t v16 = HMFGetOSLogHandle(v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier(v15);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)__int128 buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%{public}@Starting network diagnostics session: %@",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v14);
    id v20 = objc_alloc(&OBJC_CLASS___HMFDispatchContext);
    id v22 = objc_msgSend(v20, "initWithQueue:", objc_getProperty(v15, v21, 32, 1));
    *(void *)__int128 buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_100018F34;
    v78 = &unk_100028F18;
    id v79 = v15;
    id v23 = v2;
    id v80 = v23;
    id v24 = v10;
    id v81 = v24;
    id v25 = v13;
    id v82 = v25;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[HMFFuture inContext:perform:](&OBJC_CLASS___HMFFuture, "inContext:perform:", v22, buf));

    id location = 0LL;
    id v66 = 0LL;
    id v58 = v26;
    [v26 waitForResult:&v66 orError:&location withTimeout:150.0];
    [v25 stop];
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v25 diagnosticReport]);
    __int16 v27 = objc_autoreleasePoolPush();
    id v28 = v15;
    uint64_t v29 = HMFGetOSLogHandle(v28);
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = HMFGetLogIdentifier(v28);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)v73 = 138544130;
      *(void *)&v73[4] = v32;
      *(_WORD *)&v73[12] = 2112;
      *(void *)&v73[14] = v66;
      *(_WORD *)&v73[22] = 2112;
      id v74 = location;
      LOWORD(v75) = 2112;
      *(void *)((char *)&v75 + 2) = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "%{public}@Completed network diagnostics with result/error: %@/%@. Report:\n%@",  v73,  0x2Au);
    }

    objc_autoreleasePoolPop(v27);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
    unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
    unsigned __int8 v36 = [v34 fileExistsAtPath:v35 isDirectory:0];

    if ((v36 & 1) == 0)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v37 createDirectoryAtURL:v24 withIntermediateDirectories:1 attributes:0 error:0];
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v24 URLByAppendingPathComponent:@"bonjour_records.txt"]);
    id obj = location;
    [v62 writeToURL:v38 atomically:1 encoding:4 error:&obj];
    objc_storeStrong(&location, obj);
    if (location)
    {
      uint64_t v39 = objc_autoreleasePoolPush();
      id v40 = v28;
      uint64_t v41 = HMFGetOSLogHandle(v40);
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = HMFGetLogIdentifier(v40);
        id v44 = v23;
        id v45 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)v73 = 138543618;
        *(void *)&v73[4] = v45;
        *(_WORD *)&v73[12] = 2112;
        *(void *)&v73[14] = location;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to write network diagnostics report to file with error: %@",  v73,  0x16u);

        id v23 = v44;
      }

      objc_autoreleasePoolPop(v39);
    }

    id v46 = [[DEAttachmentItem alloc] initWithPathURL:v38];
    [v33 addObject:v46];

    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v48 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
    id v63 = location;
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v47 contentsOfDirectoryAtPath:v48 error:&v63]);
    objc_storeStrong(&location, v63);
    *(void *)v73 = _NSConcreteStackBlock;
    *(void *)&v73[8] = 3221225472LL;
    *(void *)&v73[16] = sub_1000193E8;
    id v74 = &unk_100028F40;
    *(void *)&__int128 v75 = v28;
    id v50 = v24;
    *((void *)&v75 + 1) = v50;
    id v51 = v33;
    id v76 = v51;
    objc_msgSend(v49, "na_each:", v73);

    id v52 = objc_autoreleasePoolPush();
    id v53 = v28;
    uint64_t v54 = HMFGetOSLogHandle(v53);
    id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      uint64_t v56 = HMFGetLogIdentifier(v53);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
      *(_DWORD *)uint64_t v67 = 138543874;
      __int16 v68 = v57;
      __int16 v69 = 2112;
      id v70 = v51;
      __int16 v71 = 2112;
      id v72 = location;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_ERROR,  "%{public}@Done with diagnostic attachments %@. Error: %@",  v67,  0x20u);
    }

    objc_autoreleasePoolPop(v52);
    id v61 = [v51 copy];

    [v60 addObjectsFromArray:v61];
  }

  else
  {
    id v61 = 0LL;
    [v60 addObjectsFromArray:0];
  }
}

void sub_100017F30(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_41;
  }
  uint64_t v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", @"/tmp"));
  uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue([v98 URLByAppendingPathComponent:@"HKSV" isDirectory:1]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v101 path]);
  unsigned __int8 v3 = [v100 fileExistsAtPath:v2];

  if ((v3 & 1) != 0)
  {
    uint64_t v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObject:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObject:",  @"VideoAnalysisSessionLogs"));
    uint64_t v91 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v91, "setDateFormat:", @"yyyy-MM-dd_HH-mm-ss");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v91, "stringFromDate:", v4));
    [v99 addObject:v5];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSMutableCharacterSet,  "alphanumericCharacterSet"));
    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v6 invertedSet]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 8) currentHome]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByCharactersInSet:v96]);
    id v90 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:&stru_10002AEC0]);

    objc_msgSend(v99, "na_safeAddObject:", v90);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 16) name]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByCharactersInSet:v96]);
    uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:&stru_10002AEC0]);

    objc_msgSend(v99, "na_safeAddObject:", v89);
    uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(+[HMFSystemInfo systemInfo](&OBJC_CLASS___HMFSystemInfo, "systemInfo"));
    uint64_t v12 = HMFProductClassToString([v95 productClass]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v99, "na_safeAddObject:", v13);

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v95 softwareVersion]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 buildVersion]);
    objc_msgSend(v99, "na_safeAddObject:", v15);

    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([v99 componentsJoinedByString:@"_"]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v100 temporaryDirectory]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v16 URLByAppendingPathComponent:v88]);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\.jsonl$",  1LL,  0LL));
    id v86 = v101;
    id v97 = v17;
    id v93 = v18;
    id v87 = (void *)objc_opt_self(&OBJC_CLASS___HomeKitDiagnosticExtension);
    id v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    [v94 removeItemAtURL:v97 error:0];
    id v121 = 0LL;
    LOBYTE(v16) = [v94 createDirectoryAtURL:v97 withIntermediateDirectories:1 attributes:0 error:&v121];
    id v85 = v121;
    if ((v16 & 1) != 0)
    {
      uint64_t v117 = 0LL;
      uint64_t v118 = &v117;
      uint64_t v119 = 0x2020000000LL;
      uint64_t v120 = 0LL;
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      id v111 = sub_100018BA8;
      uint64_t v112 = &unk_100029000;
      id v82 = v97;
      id v113 = v82;
      id v115 = &v117;
      id v116 = v87;
      id v81 = v94;
      id v114 = v81;
      id v84 = v86;
      id v103 = v93;
      uint64_t v102 = v110;
      id v105 = (void *)objc_opt_self(&OBJC_CLASS___HomeKitDiagnosticExtension);
      v130[0] = _NSConcreteStackBlock;
      v130[1] = 3221225472LL;
      v130[2] = sub_100018E00;
      v130[3] = &unk_100028FD8;
      v130[4] = v105;
      id v83 = objc_retainBlock(v130);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v143[0] = NSURLNameKey;
      v143[1] = NSURLIsDirectoryKey;
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v143, 2LL));
      SEL v21 = (void *)objc_claimAutoreleasedReturnValue( [v19 enumeratorAtURL:v84 includingPropertiesForKeys:v20 options:4 errorHandler:v83]);

      __int128 v128 = 0u;
      __int128 v129 = 0u;
      __int128 v126 = 0u;
      __int128 v127 = 0u;
      id obj = v21;
      id v22 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
      if (v22)
      {
        uint64_t v106 = *(void *)v127;
        do
        {
          id v107 = v22;
          for (i = 0LL; i != v107; i = (char *)i + 1)
          {
            if (*(void *)v127 != v106) {
              objc_enumerationMutation(obj);
            }
            id v24 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)i);
            id v25 = objc_autoreleasePoolPush();
            id v124 = 0LL;
            id v125 = 0LL;
            unsigned __int8 v26 = [v24 getResourceValue:&v125 forKey:NSURLNameKey error:&v124];
            id v27 = v125;
            id v28 = v124;
            if ((v26 & 1) != 0)
            {
              id v122 = 0LL;
              id v123 = 0LL;
              unsigned __int8 v29 = [v24 getResourceValue:&v123 forKey:NSURLIsDirectoryKey error:&v122];
              id v30 = v123;
              id v108 = v122;
              if ((v29 & 1) != 0)
              {
                if (([v30 BOOLValue] & 1) == 0)
                {
                  if (!v103
                    || (uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v103,  "firstMatchInString:options:range:",  v27,  0,  0,  objc_msgSend(v27, "length"))),  v32 = v31 == 0,  v31,  !v32))
                  {
                    v111((uint64_t)v102, v24);
                  }
                }
              }

              else
              {
                id v40 = objc_autoreleasePoolPush();
                id v41 = v105;
                uint64_t v42 = HMFGetOSLogHandle(v41);
                uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v44 = HMFGetLogIdentifier(v41);
                  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                  id v46 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
                  *(_DWORD *)__int128 buf = 138543874;
                  os_log_type_t v132 = v45;
                  __int16 v133 = 2112;
                  uint64_t v134 = v46;
                  __int16 v135 = 2112;
                  id v136 = v108;
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}@Could not get NSURLIsDirectoryKey for '%@': %@",  buf,  0x20u);
                }

                objc_autoreleasePoolPop(v40);
              }
            }

            else
            {
              uint64_t v33 = objc_autoreleasePoolPush();
              id v34 = v105;
              uint64_t v35 = HMFGetOSLogHandle(v34);
              unsigned __int8 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                uint64_t v37 = HMFGetLogIdentifier(v34);
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
                *(_DWORD *)__int128 buf = 138543874;
                os_log_type_t v132 = v38;
                __int16 v133 = 2112;
                uint64_t v134 = v39;
                __int16 v135 = 2112;
                id v136 = v28;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@Could not get NSURLNameKey for '%@': %@",  buf,  0x20u);
              }

              objc_autoreleasePoolPop(v33);
            }

            objc_autoreleasePoolPop(v25);
          }

          id v22 = [obj countByEnumeratingWithState:&v126 objects:v137 count:16];
        }

        while (v22);
      }

      BOOL v47 = v118[3] == 0;
      id v48 = objc_autoreleasePoolPush();
      id v49 = v87;
      id v50 = v49;
      if (v47)
      {
        uint64_t v76 = HMFGetOSLogHandle(v49);
        v77 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v76);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          uint64_t v78 = HMFGetLogIdentifier(v50);
          id v79 = (id)objc_claimAutoreleasedReturnValue(v78);
          id v80 = (void *)objc_claimAutoreleasedReturnValue([v84 path]);
          *(_DWORD *)id v137 = 138543618;
          id v138 = v79;
          __int16 v139 = 2112;
          uint64_t v140 = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_INFO,  "%{public}@Did not find any files matching inclusion/exclusion regexes in '%@'",  v137,  0x16u);
        }

        objc_autoreleasePoolPop(v48);
        [v81 removeItemAtURL:v82 error:0];
        id v57 = 0LL;
      }

      else
      {
        uint64_t v51 = HMFGetOSLogHandle(v49);
        id v52 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          uint64_t v53 = HMFGetLogIdentifier(v50);
          id v54 = (id)objc_claimAutoreleasedReturnValue(v53);
          id v55 = (void *)v118[3];
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v84 path]);
          *(_DWORD *)id v137 = 138543874;
          id v138 = v54;
          __int16 v139 = 2048;
          uint64_t v140 = v55;
          __int16 v141 = 2112;
          id v142 = v56;
          _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_INFO,  "%{public}@Found %lu files matching inclusion/exclusion regexes in '%@'",  v137,  0x20u);
        }

        objc_autoreleasePoolPop(v48);
        id v57 = [[DEAttachmentItem alloc] initWithPathURL:v82];
        id v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v57 setShouldCompress:v58];

        id v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        [v57 setDeleteOnAttach:v59];
      }

      id v75 = v57;

      _Block_object_dispose(&v117, 8);
    }

    else
    {
      __int16 v68 = objc_autoreleasePoolPush();
      id v69 = v87;
      uint64_t v70 = HMFGetOSLogHandle(v69);
      __int16 v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        uint64_t v72 = HMFGetLogIdentifier(v69);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        id v74 = (void *)objc_claimAutoreleasedReturnValue([v97 path]);
        *(_DWORD *)id v137 = 138543874;
        id v138 = v73;
        __int16 v139 = 2112;
        uint64_t v140 = v74;
        __int16 v141 = 2112;
        id v142 = v85;
        _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_ERROR,  "%{public}@Could not create directory at '%@': %@",  v137,  0x20u);
      }

      objc_autoreleasePoolPop(v68);
      id v75 = 0LL;
    }

    id v109 = v75;
  }

  else
  {
    id v60 = objc_autoreleasePoolPush();
    uint64_t v61 = objc_opt_class(v1);
    id v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    uint64_t v63 = HMFGetOSLogHandle(v62);
    id v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      uint64_t v65 = HMFGetLogIdentifier(v62);
      id v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v101 path]);
      *(_DWORD *)id v137 = 138543618;
      id v138 = v66;
      __int16 v139 = 2112;
      uint64_t v140 = v67;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_INFO,  "%{public}@No HKSV directory exists at '%@'",  v137,  0x16u);
    }

    objc_autoreleasePoolPop(v60);
    id v109 = 0LL;
  }

  if (v109) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else {
LABEL_41:
  }
    id v109 = 0LL;
}

void sub_100018B70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

void sub_100018BA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v5]);

  uint64_t v7 = *(void **)(a1 + 40);
  id v23 = 0LL;
  unsigned int v8 = [v7 copyItemAtURL:v3 toURL:v6 error:&v23];
  id v9 = v23;
  unsigned __int8 v10 = objc_autoreleasePoolPush();
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = HMFGetOSLogHandle(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  unsigned __int8 v14 = v13;
  if (v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier(v11);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)__int128 buf = 138543874;
      id v25 = v16;
      __int16 v26 = 2112;
      id v27 = v17;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Copied '%@' to '%@'", buf, 0x20u);
    }

    objc_autoreleasePoolPop(v10);
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier(v11);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      SEL v21 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)__int128 buf = 138544130;
      id v25 = v20;
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2112;
      unsigned __int8 v29 = v22;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to copy '%@' to '%@': %@",  buf,  0x2Au);
    }

    objc_autoreleasePoolPop(v10);
  }
}

uint64_t sub_100018E00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle(v8);
  unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier(v8);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
    int v15 = 138543874;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to read '%@': %@",  (uint8_t *)&v15,  0x20u);
  }

  objc_autoreleasePoolPop(v7);
  return 1LL;
}

uint64_t sub_100018F34(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v45 = v3;
  id v5 = &off_10001F000;
  if (!v2) {
    goto LABEL_13;
  }
  id v6 = [sub_100019770() sharedClient];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    id v8 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", getpid());
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 substringToIndex:8]);
    uint64_t v42 = v7;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HKExtension[%@][%@]",  v9,  v11));

    id v13 = sub_10001994C();
    id v62 = @"UUID";
    id v63 = v4;
    id v44 = v4;
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 requestWithItemID:24 configuration:v14]);
    v64[0] = v15;
    id v16 = sub_10001994C();
    id v60 = @"Delay";
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 150000.0));
    uint64_t v61 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 requestWithItemID:69 configuration:v18]);
    v64[1] = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 2LL));

    v58[0] = @"Reason";
    v58[1] = @"OutputDirectory";
    uint64_t v43 = (void *)v12;
    v59[0] = v12;
    uint64_t v7 = v42;
    v59[1] = v45;
    SEL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2LL));
    *(void *)&__int128 v54 = _NSConcreteStackBlock;
    id v5 = &off_10001F000;
    *((void *)&v54 + 1) = 3221225472LL;
    id v55 = sub_100019A00;
    uint64_t v56 = &unk_100028F68;
    id v57 = v2;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100019AFC;
    v49[3] = &unk_100028F90;
    v49[4] = v2;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v42 collectLogs:v20 configuration:v21 update:&v54 reply:v49]);
    id v23 = objc_autoreleasePoolPush();
    id v24 = v2;
    uint64_t v25 = HMFGetOSLogHandle(v24);
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier(v24);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v51 = v28;
      __int16 v52 = 2112;
      uint64_t v53 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%{public}@Started W5Client with UUID: %@",  buf,  0x16u);

      id v5 = &off_10001F000;
    }

    objc_autoreleasePoolPop(v23);
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(+[HMFFuture futureWithValue:](&OBJC_CLASS___HMFFuture, "futureWithValue:", v22));

    id v4 = v44;
  }

  else
  {
    __int16 v30 = objc_autoreleasePoolPush();
    id v31 = v2;
    uint64_t v32 = HMFGetOSLogHandle(v31);
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier(v31);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      LODWORD(v54) = 138543362;
      *(void *)((char *)&v54 + 4) = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@No W5Client!", (uint8_t *)&v54, 0xCu);
    }

    objc_autoreleasePoolPop(v30);
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(+[HMFFuture futureWithNoValue](&OBJC_CLASS___HMFFuture, "futureWithNoValue"));
    id v5 = &off_10001F000;
  }

  while (1)
  {

    v46[0] = _NSConcreteStackBlock;
    v46[1] = *((void *)v5 + 504);
    v46[2] = sub_100019584;
    v46[3] = &unk_100028EF0;
    id v36 = *(id *)(a1 + 56);
    uint64_t v37 = *(void *)(a1 + 32);
    id v47 = v36;
    uint64_t v48 = v37;
    id v38 = (id)objc_claimAutoreleasedReturnValue([v29 then:v46]);
    if (v38) {
      break;
    }
    _HMFPreconditionFailure(@"future", v39);
LABEL_13:
    unsigned __int8 v29 = 0LL;
  }

  id v40 = v38;

  return 3LL;
}

void sub_1000193E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  unsigned int v5 = [v4 isEqualToString:@"pcap"];

  if (v5)
  {
    id v6 = objc_autoreleasePoolPush();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier(v7);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URLByAppendingPathComponent:v3]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      int v18 = 138543618;
      __int16 v19 = v11;
      __int16 v20 = 2112;
      SEL v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%{public}@Adding pcap file: %@",  (uint8_t *)&v18,  0x16u);
    }

    objc_autoreleasePoolPop(v6);
    unsigned __int8 v14 = *(void **)(a1 + 48);
    id v15 = objc_alloc(&OBJC_CLASS___DEAttachmentItem);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) URLByAppendingPathComponent:v3]);
    id v17 = [v15 initWithPathURL:v16];
    [v14 addObject:v17];
  }
}

uint64_t sub_100019584(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) run]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100019650;
  v12[3] = &unk_100028EC8;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 finally:v12]);
  if (v7)
  {
    uint64_t v9 = v7;

    return 3LL;
  }

  else
  {
    uint64_t v11 = _HMFPreconditionFailure(@"future", v8);
    return sub_100019650(v11);
  }

uint64_t sub_100019650(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [sub_100019770() sharedClient];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    [v3 cancelRequestWithUUID:*(void *)(a1 + 32)];

    id v4 = objc_autoreleasePoolPush();
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = HMFGetOSLogHandle(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier(v5);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%{public}@Stopped W5Client with UUID: %@",  (uint8_t *)&v12,  0x16u);
    }

    objc_autoreleasePoolPop(v4);
  }

  return 1LL;
}

id sub_100019770()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  id v0 = (void *)qword_100032D88;
  uint64_t v7 = qword_100032D88;
  if (!qword_100032D88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100019824;
    v3[3] = &unk_100029048;
    v3[4] = &v4;
    sub_100019824((uint64_t)v3);
    id v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10001980C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100019824(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100032D88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    abort_report_np("Unable to find class %s", "W5Client");
    sub_100019890();
  }

void sub_100019890()
{
  id v1 = 0LL;
  if (!qword_100032D90)
  {
    __int128 v2 = off_100029068;
    uint64_t v3 = 0LL;
    qword_100032D90 = _sl_dlopen(&v2, &v1);
    id v0 = v1;
    if (qword_100032D90)
    {
      if (!v1) {
        return;
      }
    }

    else
    {
      id v0 = (char *)abort_report_np("%s", v1);
    }

    free(v0);
  }

id sub_10001994C()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  id v0 = (void *)qword_100032D98;
  uint64_t v7 = qword_100032D98;
  if (!qword_100032D98)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100019C80;
    v3[3] = &unk_100029048;
    v3[4] = &v4;
    sub_100019C80((uint64_t)v3);
    id v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000199E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100019A00(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v5);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@Received event update: %@",  (uint8_t *)&v10,  0x16u);
  }

  objc_autoreleasePoolPop(v4);
}

void sub_100019AFC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = objc_autoreleasePoolPush();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier(v11);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
    uint64_t v18 = HMFBooleanToString([v16 isReadableFileAtPath:v17]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    int v20 = 138544130;
    SEL v21 = v15;
    __int16 v22 = 2112;
    id v23 = v19;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%{public}@Received URL(Readable: %@): %@ with error: %@",  (uint8_t *)&v20,  0x2Au);
  }

  objc_autoreleasePoolPop(v10);
}

void sub_100019C80(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("W5LogItemRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100032D98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    __int128 v2 = (void *)abort_report_np("Unable to find class %s", "W5LogItemRequest");
    sub_100019CEC(v2);
  }

void sub_100019CEC(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  __int128 v2 = (void *)qword_100032D70;
  qword_100032D70 = (uint64_t)v1;

  [(id)qword_100032D70 setDateFormat:@"yyyy-MM-dd_HH:mm:ss.SSSZZZ"];
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  [(id)qword_100032D70 setTimeZone:v3];
}

uint64_t sub_100019D5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  uint64_t v9 = objc_opt_class(*(void *)(a1 + 32), v8);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = HMFGetLogIdentifier(v10);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v16 = 138543874;
    id v17 = v14;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to read '%@': %@",  (uint8_t *)&v16,  0x20u);
  }

  objc_autoreleasePoolPop(v7);
  return 1LL;
}

uint64_t sub_100019E78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100019E88(uint64_t a1)
{
}

void sub_100019E90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v60 = objc_autoreleasePoolPush();
    id v61 = *(id *)(a1 + 32);
    uint64_t v62 = HMFGetOSLogHandle(v61);
    id v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      uint64_t v64 = HMFGetLogIdentifier(v61);
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      *(_DWORD *)__int128 buf = 138543618;
      uint64_t v98 = v65;
      __int16 v99 = 2112;
      id v100 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "%{public}@Fetch assignments failed with error %@",  buf,  0x16u);
    }

    objc_autoreleasePoolPop(v60);
    id v66 = *(dispatch_group_s **)(a1 + 40);
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v72 = a1;
    id v9 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v10 = v7;
    v73 = v10;
    if (v8)
    {
      uint64_t v11 = v10;
      __int16 v71 = v7;
      v77 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v8 + 16) home]);
      uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v11 hubs]);
      uint64_t v76 = v12;
      id v78 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
      if (v78)
      {
        uint64_t v75 = *(void *)v91;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v91 != v75) {
              objc_enumerationMutation(obj);
            }
            uint64_t v81 = v13;
            uint64_t v14 = *(void **)(*((void *)&v90 + 1) + 8 * v13);
            uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
            int v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v16,  @"endpoints");

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 idsUUID]);
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v77 accessoryWithIdsIdentifier:v17]);

            uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 name]);
            __int16 v20 = (void *)v19;
            if (v19) {
              id v21 = (const __CFString *)v19;
            }
            else {
              id v21 = @"Not Found";
            }
            __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v14 idsUUID]);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v14 info]);
            uint64_t v24 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingFormat:@"\nHub %@ [%@]: %@", v21, v22, v23]);

            id v79 = v18;
            uint64_t v25 = objc_claimAutoreleasedReturnValue([v18 name]);
            __int16 v26 = (void *)v25;
            if (v25) {
              id v27 = (const __CFString *)v25;
            }
            else {
              id v27 = @"Not Found";
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v27, @"name");

            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v14 info]);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v15,  "setObject:forKeyedSubscript:",  v28,  @"description");

            __int128 v88 = 0u;
            __int128 v89 = 0u;
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            id v80 = v14;
            unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue([v14 endpoints]);
            id v30 = [v29 countByEnumeratingWithState:&v86 objects:v96 count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v87;
              id v9 = (id)v24;
              do
              {
                uint64_t v33 = 0LL;
                uint64_t v34 = v9;
                do
                {
                  if (*(void *)v87 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v35 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)v33);
                  id v36 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                  id v37 = sub_10001A58C(v8, v35, v34, v36);
                  id v9 = (id)objc_claimAutoreleasedReturnValue(v37);

                  id v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15,  "objectForKeyedSubscript:",  @"endpoints"));
                  [v38 addObject:v36];

                  uint64_t v33 = (char *)v33 + 1;
                  uint64_t v34 = v9;
                }

                while (v31 != v33);
                id v31 = [v29 countByEnumeratingWithState:&v86 objects:v96 count:16];
              }

              while (v31);
            }

            else
            {
              id v9 = (id)v24;
            }

            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v80 idsUUID]);
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 UUIDString]);
            uint64_t v12 = v76;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", v15, v40);

            uint64_t v13 = v81 + 1;
          }

          while ((id)(v81 + 1) != v78);
          id v78 = [obj countByEnumeratingWithState:&v90 objects:buf count:16];
        }

        while (v78);
      }

      id v41 = (void *)objc_claimAutoreleasedReturnValue([v73 unassignedEndpoints]);
      id v42 = [v41 count];

      if (v42)
      {
        uint64_t v43 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v44 = objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"\nUnassigned Endpoints:"]);

        __int128 v84 = 0u;
        __int128 v85 = 0u;
        __int128 v82 = 0u;
        __int128 v83 = 0u;
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v73 unassignedEndpoints]);
        id v46 = [v45 countByEnumeratingWithState:&v82 objects:v95 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v83;
          do
          {
            id v49 = 0LL;
            id v50 = (void *)v44;
            do
            {
              if (*(void *)v83 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v51 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)v49);
              __int16 v52 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
              id v53 = sub_10001A58C(v8, v51, v50, v52);
              uint64_t v44 = objc_claimAutoreleasedReturnValue(v53);

              __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v51 endpointUUID]);
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 UUIDString]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v52, v55);

              id v49 = (char *)v49 + 1;
              id v50 = (void *)v44;
            }

            while (v47 != v49);
            id v47 = [v45 countByEnumeratingWithState:&v82 objects:v95 count:16];
          }

          while (v47);
        }

        uint64_t v12 = v76;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v76,  "setObject:forKeyedSubscript:",  v43,  @"unassigned");

        id v9 = (id)v44;
      }

      id v9 = v9;
      uint64_t v56 = v12;
      id v57 = (id)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:@"\n\n\n\n====== JSON START ====\n"]);
      uint64_t v94 = 0LL;
      id v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v56,  1LL,  &v94));

      id v7 = v71;
      id v5 = 0LL;
      if (v94)
      {
        id v59 = v9;
      }

      else
      {
        uint64_t v67 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v58, 4LL);
        __int16 v68 = (void *)objc_claimAutoreleasedReturnValue([v57 stringByAppendingString:v67]);

        id v57 = v68;
        id v59 = v57;
      }
    }

    else
    {
      id v59 = 0LL;
    }

    uint64_t v69 = *(void *)(*(void *)(v72 + 48) + 8LL);
    uint64_t v70 = *(void **)(v69 + 40);
    *(void *)(v69 + 40) = v59;

    id v66 = *(dispatch_group_s **)(v72 + 40);
  }

  dispatch_group_leave(v66);
}

id sub_10001A58C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 16);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointUUID]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryWithUniqueIdentifier:v11]);

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 name]);
  uint64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (const __CFString *)v13;
  }
  else {
    uint64_t v15 = @"Not Found";
  }
  int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointUUID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingFormat:@"\n   Endpoint %@ [%@]: %@", v15, v16, v17]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 info]);
  [v7 setObject:v19 forKeyedSubscript:@"description"];

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v12 name]);
  id v21 = (void *)v20;
  if (v20) {
    __int16 v22 = (const __CFString *)v20;
  }
  else {
    __int16 v22 = @"Not Found";
  }
  [v7 setObject:v22 forKeyedSubscript:@"name"];

  return v18;
}

id sub_10001A708(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsString:a2];
}

int64_t sub_10001A714(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 modificationDate]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 modificationDate]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10001A780(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_autoreleasePoolPush();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier(v5);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@Failed to prepare for diagnostic extension, error: %@",  (uint8_t *)&v10,  0x16u);
    }

    objc_autoreleasePoolPop(v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10001A8C8(id a1)
{
  uint64_t v1 = HMFCreateOSLogHandle(@"HomeKitDiagnosticExtension", HMFHomeKitLoggingSubsystem);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)qword_100032D80;
  qword_100032D80 = v2;
}

id objc_msgSend_initWithVersion_transitionPoints_minimumBrightness_maximumBrightness_minimumColorTemperature_maximumColorTemperature_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:");
}

id objc_msgSend_initWithWakeVersion_wakePort_wakeAddress_wakeType_wakePacketType_wakePattern_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWakeVersion:wakePort:wakeAddress:wakeType:wakePacketType:wakePattern:");
}

id objc_msgSend_stringEncodingForData_encodingOptions_convertedString_usedLossyConversion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:");
}

id objc_msgSend_transitionPointWithMinimumBrightness_minimumBrightnessColorTemperature_maximumBrightness_maximumBrightnessColorTemperature_targetCompletionDuration_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessCol orTemperature:targetCompletionDuration:");
}

id objc_msgSend_transitionPointWithPreviousTransitionPoint_nextTransitionPoint_timeElapsedSincePreviousTransitionPoint_minimumBrightness_maximumBrightness_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "transitionPointWithPreviousTransitionPoint:nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimu mBrightness:maximumBrightness:");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}