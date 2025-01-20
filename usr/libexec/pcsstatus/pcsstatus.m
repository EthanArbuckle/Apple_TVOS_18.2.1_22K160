BOOL sub_100003F10(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_100004108( FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v10, &a9);

  v12 = v11;
  fprintf(a1, "%s\n", -[NSString UTF8String](v12, "UTF8String"));
}

void sub_100004190(void *a1, int a2, int a3)
{
  id v5 = a1;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  sub_1000042C0(v6, v5, a3);

  v7 = v6;
  v8 = v7;
  if (a2)
  {
    id v16 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  3LL,  &v16));
    id v10 = v16;
    v11 = v10;
    if (v9)
    {
      id v12 = v9;
      id v13 = [v12 bytes];
      id v14 = [v12 length];
      fwrite(v13, (size_t)v14, 1uLL, __stdoutp);
      fputc(10, __stdoutp);
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      NSLog(@"error: %@", v15);
    }
  }

  else
  {
    sub_100004458(v7, 0);
  }
}

void sub_1000042C0(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0LL;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0LL;
      id v12 = v9;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v11);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
          id v16 = v13;
        }
        else {
          id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v13));
        }
        v9 = v16;

        v17 = sub_100007384(v14, a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        [v5 setObject:v18 forKeyedSubscript:v9];

        v11 = (char *)v11 + 1;
        id v12 = v9;
      }

      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }
}

void sub_100004458(void *a1, int a2)
{
  id v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v11, (void)v13));
        sub_100007130(v11, v12, a2);
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

void sub_1000045A8(void *a1, int a2)
{
}

NSMutableDictionary *sub_1000045B0(uint64_t a1)
{
  uint64_t IsICDP = PCSIdentitySetIsICDP(a1, 0LL);
  uint64_t IsICDPNetwork = PCSIdentitySetIsICDPNetwork(a1, 0LL);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, @"all_status");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsICDP));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, @"icdp_status");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsICDPNetwork));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v7,  @"icdp_status_network");

  if ((_DWORD)IsICDP)
  {
    id v37 = 0LL;
    uint64_t v8 = PCSIdentityiCDPWalrus(a1, 0LL, &v37);
    if (v37)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"icdp_status_w");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v37 description]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v9,  @"icdp_status_w_error");

      id v10 = v37;
      if (v37)
      {
        id v37 = 0LL;
        CFRelease(v10);
      }
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v11,  @"icdp_status_w");
    }

    uint64_t v12 = PCSIdentityiCDPPlesio(a1, 0LL, 0LL, &v37);
    if (v37)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"icdp_status_2");
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v37 description]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v13,  @"icdp_status_2_status");

      id v14 = v37;
      if (v37)
      {
        id v37 = 0LL;
        CFRelease(v14);
      }
    }

    else
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v15,  @"icdp_status_2");
    }
  }

  __int128 v16 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  PCSReportManateeStatus(@"Engram"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, @"CKKS_Engram");

  v18 = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  PCSReportManateeStatus(@"Manatee"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, @"CKKS_Manatee");

  __int128 v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v20,  @"current_identities");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000049A8;
  v34[3] = &unk_10000C670;
  uint64_t v36 = a1;
  __int128 v21 = v20;
  v35 = v21;
  PCSServiceItemsGetEachName(v34);
  __int128 v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v22,  @"current_identity_pointers");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100004A7C;
  v31[3] = &unk_10000C670;
  uint64_t v33 = a1;
  v23 = v22;
  v32 = v23;
  PCSServiceItemsGetEachName(v31);
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v24, @"identities");
  uint64_t v25 = PCSIdentitySetCopyIdentities(a1, 0LL);
  if (v25)
  {
    v26 = (const __CFDictionary *)v25;
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_100004BC0;
    context[3] = &unk_10000C698;
    v29 = v24;
    uint64_t v30 = a1;
    CFDictionaryApplyFunction(v26, (CFDictionaryApplierFunction)sub_100007590, context);
    CFRelease(v26);
  }

  return v4;
}

void sub_1000049A8(uint64_t a1, uint64_t a2)
{
  id v9 = 0LL;
  uint64_t v4 = PCSIdentitySetCopyCurrentIdentityWithError(*(void *)(a1 + 40), a2, &v9);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v4));
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:a2];

    id v7 = v5;
LABEL_3:
    CFRelease(v7);
    return;
  }

  if (!v9)
  {
    [*(id *)(a1 + 32) setObject:@"missing" forKeyedSubscript:a2];
    return;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:a2];

  id v7 = v9;
  if (v9)
  {
    id v9 = 0LL;
    goto LABEL_3;
  }
}

void sub_100004A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  CFTypeRef cf = 0LL;
  uint64_t v5 = PCSIdentitySetCopyCurrentIdentityPointer(*(void *)(a1 + 40), a2, &cf);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@",  [v6 identity]));
    [v4 setObject:v8 forKeyedSubscript:@"service"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 currentItemPointerModificationTime]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    [v4 setObject:v10 forKeyedSubscript:@"currentItemModificationTime"];
  }

  if (cf)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([(id)cf description]);
    [v4 setObject:v11 forKeyedSubscript:@"error"];
    CFTypeRef v12 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v12);
    }
  }

  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:a2];
}

void sub_100004BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29 = objc_autoreleasePoolPush();
  uint64_t v6 = _PCSIdentityCopyBAT(a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  ServiceName = (NSString *)PCSIdentityGetServiceName(a3);
  id v9 = (void *)PCSIdentityCopyCircleFingerPrint(a3, 0LL);
  KeyID = (const __CFData *)PCSIdentityGetKeyID(a3);
  if (!ServiceName) {
    ServiceName = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN-%d",  PCSIdentityGetServiceID(a3));
  }
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:ServiceName]);
  if (!v11)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:ServiceName];
  }

  CFTypeRef v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v13 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  PCSIdentityGetServiceID(a3));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, @"service_id");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", a2, @"public_key");
  BytePtr = CFDataGetBytePtr(KeyID);
  CFIndex Length = CFDataGetLength(KeyID);
  v17 = (void *)_PCSCreateHexString(BytePtr, Length);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, @"key_id");

  uint64_t v18 = PCSIdentityWebSafePublicKeyID(a3);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, @"key_id_websafe");

  __int128 v20 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  _PCSIdentitySetIsCurrentIdentityPreferCache(*(void *)(a1 + 40), a3));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v21, @"current");

  __int128 v22 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", _PCSIdentityIsManatee(a3));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v23, @"manatee");

  v24 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", PCSIdentityIsFullManatee(a3));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v25, @"manatee_full");

  if (v9)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v26,  @"circleFingerPrint");
  }

  if (v7) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v7, @"build_time");
  }
  Mutable = CFStringCreateMutable(0LL, 0LL);
  char v30 = 0;
  if (!_PCSIdentityValidate(a3, &v30, Mutable) || v30)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"key_valid");
    v28 = v29;
    goto LABEL_14;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"key_valid");
  v28 = v29;
  if (CFStringGetLength(Mutable) > 0) {
LABEL_14:
  }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  Mutable,  @"key_valid_status");
  if (Mutable) {
    CFRelease(Mutable);
  }
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  objc_autoreleasePoolPop(v28);
}

id sub_100004F28(uint64_t a1)
{
  unsigned int IsICDP = PCSIdentitySetIsICDP(a1, 0LL);
  uint64_t v28 = a1;
  v2 = (void *)PCSIdentitySetCopyIdentities(a1, 0LL);
  id v3 = &AKAuthenticationDSIDKey_ptr;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v29 = *(void *)v31;
    id v27 = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v9]);

        uint64_t ServiceID = PCSIdentityGetServiceID(v10);
        if ((_DWORD)ServiceID)
        {
          CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  ServiceID));
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v12]);
          if (!v13) {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v3[27] dictionary]);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v3[27] dictionary]);
          if (_PCSIdentityIsManatee(v10))
          {
            [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"manatee"];
            if ((PCSIdentityIsFullManatee(v10) & 1) == 0) {
              [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"fake-manatee"];
            }
          }

          else
          {
            id v15 = v7;
            __int128 v16 = v3;
            v17 = v4;
            uint64_t v18 = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  _PCSIdentitySetIsCurrentIdentityPreferCache(v28, v10));
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            [v14 setObject:v19 forKeyedSubscript:@"current"];

            uint64_t v4 = v17;
            id v3 = v16;
            id v7 = v15;
            id v5 = v27;
          }

          uint64_t v20 = _PCSIdentityCopyBAT(v10);
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21) {
            [v14 setObject:v21 forKeyedSubscript:@"bat"];
          }
          [v13 setObject:v14 forKeyedSubscript:v9];
          [v4 setObject:v13 forKeyedSubscript:v12];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v7);
  }

  v34[0] = @"iCDP";
  __int128 v22 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", IsICDP));
  v34[1] = @"services";
  v35[0] = v23;
  v35[1] = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));

  return v24;
}

NSMutableDictionary *sub_100005244(void *a1)
{
  id v110 = a1;
  if (v110)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v161 = 0LL;
    v162 = &v161;
    uint64_t v163 = 0x3032000000LL;
    v164 = sub_100006388;
    v165 = sub_100006398;
    v166 = @"ValidateIdentities";
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, v162[5]);

    uint64_t v155 = 0LL;
    v156 = &v155;
    uint64_t v157 = 0x3032000000LL;
    v158 = sub_100006388;
    v159 = sub_100006398;
    id v160 = 0LL;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    id v6 = (void *)v156[5];
    v156[5] = (uint64_t)v5;

    uint64_t v176 = kPCSSetupDSID;
    id v177 = v110;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v177,  &v176,  1LL));
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472LL;
    v151[2] = sub_1000063A0;
    v151[3] = &unk_10000C6C0;
    v128 = v3;
    v152 = v128;
    v153 = &v161;
    v154 = &v155;
    PCSGuitarfishValidateIdentities(v7, v151);

    dispatch_semaphore_wait((dispatch_semaphore_t)v156[5], 0xFFFFFFFFFFFFFFFFLL);
    v175[0] = kSecureBackupiCloudIdentityPublicDataKey;
    v175[1] = kPCSSecureBackupCFiCloudDataProtectionKey;
    v175[2] = kPCSSecureBackupCFSecureBackupKeyRegistry;
    v175[3] = kPCSSecureBackupCFStableMetadataKey;
    v175[4] = kPCSSecureBackupCFClientMetadataKey;
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v175, 5LL));
    uint64_t v8 = (void *)v162[5];
    v162[5] = (uint64_t)@"CurrentRecord";

    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v128, "setObject:forKeyedSubscript:", v9, v162[5]);

    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
    [v11 setObject:v10 forKeyedSubscript:@"PrimaryRecord"];

    v150 = 0LL;
    v173[0] = kPCSSetupDSID;
    v173[1] = kPCSSetupGuitarfish;
    v174[0] = v110;
    v174[1] = &__kCFBooleanTrue;
    v114 = (void *)__PCSCopyStingrayInfo( 0LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v174,  v173,  2LL),  &v150);
    CFTypeRef v12 = v150;
    if (v150)
    {
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"PrimaryRecord"]);
      [v14 setObject:v12 forKeyedSubscript:@"fetch_error"];
    }

    if (!v114
      || (uint64_t v124 = kSecureBackupStingrayMetadataKey,
          id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "objectForKeyedSubscript:")),
          BOOL v16 = v15 == 0LL,
          v15,
          v16))
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v54 = (void *)objc_claimAutoreleasedReturnValue([v111 objectForKeyedSubscript:@"PrimaryRecord"]);
      [v54 setObject:&__kCFBooleanFalse forKeyedSubscript:@"has_record"];
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"PrimaryRecord"]);
      [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:@"has_record"];

      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v124]);
      v111 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey]);

      v108 = (void *)objc_claimAutoreleasedReturnValue([v111 objectForKeyedSubscript:kPCSSecureBackupCFiCloudDataProtectionKey]);
      v106 = (void *)objc_claimAutoreleasedReturnValue([v108 objectForKeyedSubscript:kPCSSecureBackupMetaSecureBackupWrappedKeys]);
      uint64_t v20 = kPCSGuitarfishSecureBackupMetaDBRSeedAESPID;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v108 objectForKeyedSubscript:kPCSGuitarfishSecureBackupMetaDBRSeedAESPID]);
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 base64EncodedStringWithOptions:0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"PrimaryRecord"]);
      [v24 setObject:v22 forKeyedSubscript:v20];

      if (v111)
      {
        uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"PrimaryRecord"]);
        [v27 setObject:v25 forKeyedSubscript:@"clientMetadata"];

        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v146 = 0u;
        __int128 v147 = 0u;
        id v28 = v111;
        id v29 = [v28 countByEnumeratingWithState:&v146 objects:v172 count:16];
        if (v29)
        {
          uint64_t v121 = *(void *)v147;
          do
          {
            id v126 = v29;
            for (i = 0LL; i != v126; i = (char *)i + 1)
            {
              if (*(void *)v147 != v121) {
                objc_enumerationMutation(v28);
              }
              uint64_t v31 = *(void *)(*((void *)&v146 + 1) + 8LL * (void)i);
              if (([v129 containsObject:v31] & 1) == 0)
              {
                v2 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v31]);
                uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSData);
                char isKindOfClass = objc_opt_isKindOfClass(v2, v32);
                if ((isKindOfClass & 1) != 0)
                {
                  v1 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v31]);
                  uint64_t v34 = objc_claimAutoreleasedReturnValue([v1 base64EncodedStringWithOptions:0]);
                  v117 = (void *)v34;
                }

                else
                {
                  uint64_t v34 = objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:v31]);
                  v118 = (void *)v34;
                }

                v35 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v128,  "objectForKeyedSubscript:",  v162[5]));
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"PrimaryRecord"]);
                v24 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"clientMetadata"]);
                [v24 setObject:v34 forKeyedSubscript:v31];

                id v37 = v118;
                if ((isKindOfClass & 1) != 0)
                {

                  id v37 = v1;
                }
              }
            }

            id v29 = [v28 countByEnumeratingWithState:&v146 objects:v172 count:16];
          }

          while (v29);
        }

        v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"PrimaryRecord"]);
        [v40 setObject:v38 forKeyedSubscript:@"outerMetadata"];

        __int128 v144 = 0u;
        __int128 v145 = 0u;
        __int128 v142 = 0u;
        __int128 v143 = 0u;
        v41 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v124]);
        id v42 = [v41 countByEnumeratingWithState:&v142 objects:v171 count:16];
        if (v42)
        {
          uint64_t v122 = *(void *)v143;
          id obj = v41;
          do
          {
            id v126 = v42;
            for (j = 0LL; j != v126; j = (char *)j + 1)
            {
              if (*(void *)v143 != v122) {
                objc_enumerationMutation(obj);
              }
              uint64_t v44 = *(void *)(*((void *)&v142 + 1) + 8LL * (void)j);
              if (([v129 containsObject:v44] & 1) == 0)
              {
                v45 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v124]);
                v2 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v44]);
                uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSData);
                char v47 = objc_opt_isKindOfClass(v2, v46);
                if ((v47 & 1) != 0)
                {
                  v118 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v124]);
                  v117 = (void *)objc_claimAutoreleasedReturnValue([v118 objectForKeyedSubscript:v44]);
                  uint64_t v48 = objc_claimAutoreleasedReturnValue([v117 base64EncodedStringWithOptions:0]);
                  id v112 = (id)v48;
                }

                else
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue([v114 objectForKeyedSubscript:v124]);
                  uint64_t v48 = objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v44]);
                  v116 = (void *)v48;
                }

                v49 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v128,  "objectForKeyedSubscript:",  v162[5]));
                v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:@"PrimaryRecord"]);
                v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"outerMetadata"]);
                [v51 setObject:v48 forKeyedSubscript:v44];

                v52 = v116;
                v53 = v24;
                if ((v47 & 1) != 0)
                {

                  v52 = v117;
                  v53 = v118;
                }
              }
            }

            v41 = obj;
            id v42 = [obj countByEnumeratingWithState:&v142 objects:v171 count:16];
          }

          while (v42);
        }
      }

      v138[0] = _NSConcreteStackBlock;
      v138[1] = 3221225472LL;
      v138[2] = sub_100006530;
      v138[3] = &unk_10000C6E8;
      v141 = &v161;
      v139 = v128;
      v140 = @"PrimaryRecord";
      _PCSBackupGuitarfishDecodeOuterRecord(v106, v138);

      v54 = v108;
    }

    v55 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
    [v56 setObject:v55 forKeyedSubscript:@"RecoveryTokenRecord"];

    v150 = 0LL;
    v169[0] = kPCSSetupDSID;
    v169[1] = kPCSSetupGuitarfishToken;
    v170[0] = v110;
    v170[1] = &__kCFBooleanTrue;
    v125 = (void *)__PCSCopyStingrayInfo( 0LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v170,  v169,  2LL),  &v150);
    v57 = v150;
    if (v150)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
      [v59 setObject:v57 forKeyedSubscript:@"fetch_error"];
    }

    if (!v125
      || (uint64_t v123 = kSecureBackupGuitarfishRecoveryTokenMetadataKey,
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKeyedSubscript:")),
          BOOL v61 = v60 == 0LL,
          v60,
          v61))
    {
      v109 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v103 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
      [v103 setObject:&__kCFBooleanFalse forKeyedSubscript:@"has_record"];
    }

    else
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v63 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
      [v63 setObject:&__kCFBooleanTrue forKeyedSubscript:@"has_record"];

      v64 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
      v109 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey]);

      if (v109)
      {
        v65 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
        v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
        [v67 setObject:v65 forKeyedSubscript:@"clientMetadata"];

        __int128 v136 = 0u;
        __int128 v137 = 0u;
        __int128 v134 = 0u;
        __int128 v135 = 0u;
        id v68 = v109;
        id v69 = [v68 countByEnumeratingWithState:&v134 objects:v168 count:16];
        if (v69)
        {
          v117 = *(void **)v135;
          do
          {
            id v119 = v69;
            for (k = 0LL; k != v119; k = (char *)k + 1)
            {
              uint64_t v71 = *(void *)(*((void *)&v134 + 1) + 8LL * (void)k);
              v72 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v71]);
              uint64_t v73 = objc_opt_class(&OBJC_CLASS___NSData);
              char v74 = objc_opt_isKindOfClass(v72, v73);
              if ((v74 & 1) != 0)
              {
                v2 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v71]);
                uint64_t v75 = objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);
                v116 = (void *)v75;
              }

              else
              {
                uint64_t v75 = objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v71]);
                id v126 = (id)v75;
              }

              v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
              v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
              v78 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:@"clientMetadata"]);
              [v78 setObject:v75 forKeyedSubscript:v71];

              v79 = v126;
              if ((v74 & 1) != 0)
              {

                v79 = v2;
              }
            }

            id v69 = [v68 countByEnumeratingWithState:&v134 objects:v168 count:16];
          }

          while (v69);
        }
      }

      v80 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey]);
      v82 = (void *)objc_claimAutoreleasedReturnValue([v81 objectForKeyedSubscript:kPCSSecureBackupCFiCloudDataProtectionKey]);
      uint64_t v83 = kPCSGuitarfishSecureBackupMetaDBRSeedAESPID;
      v107 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:kPCSGuitarfishSecureBackupMetaDBRSeedAESPID]);

      if (v107)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue([v107 base64EncodedStringWithOptions:0]);
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
        v82 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
        [v82 setObject:v84 forKeyedSubscript:v83];
      }

      v86 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
      v88 = (void *)objc_claimAutoreleasedReturnValue([v87 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
      [v88 setObject:v86 forKeyedSubscript:@"outerMetadata"];

      __int128 v132 = 0u;
      __int128 v133 = 0u;
      __int128 v130 = 0u;
      __int128 v131 = 0u;
      v89 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
      id v90 = [v89 countByEnumeratingWithState:&v130 objects:v167 count:16];
      if (v90)
      {
        uint64_t v120 = *(void *)v131;
        id v113 = v89;
        do
        {
          id v127 = v90;
          for (m = 0LL; m != v127; m = (char *)m + 1)
          {
            if (*(void *)v131 != v120) {
              objc_enumerationMutation(v113);
            }
            uint64_t v92 = *(void *)(*((void *)&v130 + 1) + 8LL * (void)m);
            if (([v129 containsObject:v92] & 1) == 0)
            {
              v93 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
              v94 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKeyedSubscript:v92]);
              uint64_t v95 = objc_opt_class(&OBJC_CLASS___NSData);
              char v96 = objc_opt_isKindOfClass(v94, v95);
              if ((v96 & 1) != 0)
              {
                v117 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
                v116 = (void *)objc_claimAutoreleasedReturnValue([v117 objectForKeyedSubscript:v92]);
                uint64_t v97 = objc_claimAutoreleasedReturnValue([v116 base64EncodedStringWithOptions:0]);
                v111 = (void *)v97;
              }

              else
              {
                v82 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:v123]);
                uint64_t v97 = objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:v92]);
                id obj = (id)v97;
              }

              v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v128, "objectForKeyedSubscript:", v162[5]));
              v99 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"RecoveryTokenRecord"]);
              v100 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:@"outerMetadata"]);
              [v100 setObject:v97 forKeyedSubscript:v92];

              v101 = obj;
              v102 = v82;
              if ((v96 & 1) != 0)
              {

                v101 = v116;
                v102 = v117;
              }
            }
          }

          v89 = v113;
          id v90 = [v113 countByEnumeratingWithState:&v130 objects:v167 count:16];
        }

        while (v90);
      }

      v103 = v107;
    }

    v104 = v128;
    _Block_object_dispose(&v155, 8);

    _Block_object_dispose(&v161, 8);
  }

  else
  {
    v104 = (NSMutableDictionary *)&off_10000DA58;
  }

  return v104;
}

void sub_1000062F8(_Unwind_Exception *a1)
{
}

uint64_t sub_100006388(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100006398(uint64_t a1)
{
}

uint64_t sub_1000063A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  [v12 setObject:v11 forKeyedSubscript:@"status"];

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  [v14 setObject:v13 forKeyedSubscript:@"flags"];

  uint64_t v15 = _PCSGuitarfishPopulateFlagNamesToTelemetryArray(a3, 0LL);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  [v17 setObject:v16 forKeyedSubscript:@"flags_dict"];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  [v18 setObject:v10 forKeyedSubscript:@"telemetry"];

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  [v19 setObject:v9 forKeyedSubscript:@"error"];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
}

void sub_100006530(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v42 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a6)
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    id v16 = a6;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:*(void *)(a1 + 40)]);
    [v18 setObject:v16 forKeyedSubscript:@"decode_error"];
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v42 base64EncodedStringWithOptions:0]);
  uint64_t v20 = sub_100006834(v19, 0xCuLL);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v23 setObject:v21 forKeyedSubscript:@"wrappingkey_to_primary"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
  uint64_t v25 = sub_100006834(v24, 0xCuLL);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  id v27 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v28 setObject:v26 forKeyedSubscript:@"wrappingkey_to_rtderived"];

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
  __int128 v30 = sub_100006834(v29, 0xCuLL);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v33 setObject:v31 forKeyedSubscript:@"wrappingkey_to_escrowidentity"];

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v13 length]));
  v35 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v36 setObject:v34 forKeyedSubscript:@"encrypted_contents_length"];

  id v37 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
  v38 = sub_100006834(v37, 0x18uLL);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:*(void *)(a1 + 40)]);
  [v41 setObject:v39 forKeyedSubscript:@"encrypted_contents"];
}

__CFString *sub_100006834(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    if ((unint64_t)[v3 length] <= a2)
    {
      id v6 = v4;
    }

    else
    {
      dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 substringToIndex:a2]);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@…",  v5));
    }
  }

  else
  {
    id v6 = @"nil";
  }

  return v6;
}

NSMutableDictionary *sub_1000068D8()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (OctagonPlatformSupportsSOS())
  {
    uint64_t v18 = 0LL;
    unsigned int v1 = SOSCCThisDeviceIsInCircle(&v18) + 1;
    if (v1 > 4) {
      v2 = @"unknown";
    }
    else {
      v2 = off_10000C7A0[v1];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v0, "setObject:forKeyedSubscript:", v2, @"circle_status");
    v20[0] = kSOSViewPCSMasterKey;
    v20[1] = kSOSViewPCSiCloudDrive;
    v20[2] = kSOSViewPCSPhotos;
    v20[3] = kSOSViewPCSCloudKit;
    v20[4] = kSOSViewPCSEscrow;
    v20[5] = kSOSViewPCSFDE;
    v20[6] = kSOSViewPCSMailDrop;
    v20[7] = kSOSViewPCSiCloudBackup;
    v20[8] = kSOSViewPCSNotes;
    v20[9] = kSOSViewPCSiMessage;
    v20[10] = kSOSViewPCSFeldspar;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 11LL));
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v0, "setObject:forKeyedSubscript:", v4, @"view_status");
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          unsigned int v11 = SOSCCView(v10, 3LL, &v18) - 1;
          id v12 = @"unknown";
          if (v11 <= 3) {
            id v12 = off_10000C7C8[v11];
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v10, (void)v14);
        }

        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }

      while (v7);
    }
  }

  return v0;
}

NSMutableDictionary *sub_100006B44()
{
  return objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

NSMutableDictionary *sub_100006B60(const void *a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFDictionaryGetTypeID())
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_100006C0C;
      v5[3] = &unk_10000C698;
      id v6 = v2;
      id v7 = a1;
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100007590, v5);
    }
  }

  return v2;
}

void sub_100006C0C(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:a2];
  id v7 = *(const void **)(a1 + 40);
  if (!v7 || (CFTypeID v8 = CFGetTypeID(v7), v8 != CFDictionaryGetTypeID()))
  {
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: %@ is not a dictionary",  a3);
LABEL_8:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NSMutableArray addObject:](v6, "addObject:", v13);

    goto LABEL_9;
  }

  Value = (const __CFArray *)CFDictionaryGetValue(a3, kPCSSecureBackupCFKeyRegistryPublicIdentities);
  uint64_t v10 = Value;
  if (!Value || (CFTypeID v11 = CFGetTypeID(Value), v11 != CFArrayGetTypeID()))
  {
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: %@ is not an array",  v10);
    goto LABEL_8;
  }

  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472LL;
  context[2] = sub_100006D60;
  context[3] = &unk_10000C710;
  __int128 v15 = v6;
  v16.length = CFArrayGetCount(v10);
  v16.location = 0LL;
  CFArrayApplyFunction(v10, v16, (CFArrayApplierFunction)sub_1000075A8, context);

LABEL_9:
}

void sub_100006D60(uint64_t a1, uint64_t a2)
{
  id v9 = 0LL;
  uint64_t v3 = PCSPublicIdentityCreateWithPublicKeyInfo(a2, &v9);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = (const void *)v3;
    id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d/%@",  PCSPublicIdentityGetServiceID(),  v3);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v4 addObject:v7];
  }

  else
  {
    CFTypeID v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ERROR: PCSPublicIdentityCreateWithPublicKeyInfo error: %@",  v9));
    [v4 addObject:v8];

    id v5 = v9;
    if (!v9) {
      return;
    }
    id v9 = 0LL;
  }

  CFRelease(v5);
}

_UNKNOWN **sub_100006E2C()
{
  uint64_t v14 = 0LL;
  __int128 v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_100006388;
  uint64_t v18 = sub_100006398;
  id v19 = 0LL;
  CFTypeID v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_100006F98;
  CFTypeID v11 = &unk_10000C738;
  id v13 = &v14;
  v0 = dispatch_semaphore_create(0LL);
  id v12 = v0;
  PCSRestoreCKBackupWithCompletion(1LL, &v8);
  dispatch_time_t v1 = dispatch_time(0LL, 5000000000LL);
  if (dispatch_semaphore_wait(v0, v1))
  {
    v2 = &off_10000DA80;
  }

  else
  {
    uint64_t v3 = PCSReportKeyRollPending(@"Messages3");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3, v8, v9, v10, v11));
    [(id)v15[5] setObject:v4 forKeyedSubscript:@"rollPending"];

    v2 = (_UNKNOWN **)(id)v15[5];
  }

  id v5 = v12;
  id v6 = v2;

  _Block_object_dispose(&v14, 8);
  return v6;
}

void sub_100006F80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100006F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  v19[0] = @"RecoveryIssues";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a2));
  v20[0] = v14;
  v19[1] = @"RecoveredToIdentitySet";
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
  v20[1] = v15;
  v19[2] = @"AlreadyInRecoverySet";
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a4));
  v20[2] = v16;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
  [v13 addEntriesFromDictionary:v17];

  if (v9)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v18 forKeyedSubscript:@"error"];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007130(void *a1, void *a2, int a3)
{
  id v32 = a1;
  id v5 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a3 == 1)
    {
      sub_100004108(__stdoutp, @"\n%*s%@ -", v7, v8, v9, v10, v11, v12, 4LL);
      sub_100004108(__stdoutp, @"%*s------------------------", v26, v27, v28, v29, v30, v31, 4LL);
    }

    else if (a3)
    {
      sub_100004108(__stdoutp, @"%*s%@ -", v7, v8, v9, v10, v11, v12, (4 * a3));
    }

    else
    {
      sub_100004108(__stdoutp, @"\n%*s%@ -", v7, v8, v9, v10, v11, v12, 0LL);
      sub_100004108(__stdoutp, @"%*s========================", v13, v14, v15, v16, v17, v18, 0LL);
    }

    sub_100004458(v5, (a3 + 1));
  }

  else
  {
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v19) & 1) != 0)
    {
      sub_100004108(__stdoutp, @"%*s%@ -", v20, v21, v22, v23, v24, v25, (4 * a3));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_10000731C;
      v33[3] = &unk_10000C758;
      int v34 = a3 + 1;
      [v5 enumerateObjectsUsingBlock:v33];
    }

    else
    {
      sub_100004108(__stdoutp, @"%*s%@: %@", v20, v21, v22, v23, v24, v25, (4 * a3));
    }
  }
}

void sub_10000731C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  sub_100007130(v6, v5, *(unsigned int *)(a1 + 32));
}

NSMutableDictionary *sub_100007384(void *a1, int a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sub_1000042C0();
LABEL_13:

    uint64_t v3 = v5;
    return v3;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    uint64_t v7 = v3;
    id v5 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableDictionary count](v7, "count")));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000753C;
    v14[3] = &unk_10000C780;
    uint64_t v15 = v5;
    char v16 = a2;
    -[NSMutableDictionary enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v14);

    goto LABEL_13;
  }

  if (a2)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary base64EncodedStringWithOptions:](v3, "base64EncodedStringWithOptions:", 0LL));
LABEL_12:
      id v5 = (NSMutableDictionary *)v9;
      goto LABEL_13;
    }
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v10) & 1) == 0)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v11) & 1) == 0)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNull);
      if ((objc_opt_isKindOfClass(v3, v12) & 1) == 0)
      {
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3));
        goto LABEL_12;
      }
    }
  }

  return v3;
}

void sub_10000753C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100007384(a2, *(unsigned __int8 *)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  [*(id *)(a1 + 32) setObject:v6 atIndexedSubscript:a3];
}

uint64_t sub_100007590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

uint64_t sub_1000075A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t start(int a1, char **a2)
{
  uint64_t v83 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0LL;
  v86 = 0LL;
  char v4 = 0;
  char v81 = 0;
  uint64_t v82 = 0LL;
  v87 = 0LL;
  value = 0LL;
  v99 = 0LL;
  optind = 0;
  for (int i = 2; ; int i = 1)
  {
    while (1)
    {
      uint64_t v6 = getopt_long(a1, a2, "CDPdfjOsDRrc:hp:s:UuvwZy", (const option *)&off_100010888, 0LL);
      if ((int)v6 > 98)
      {
        switch((int)v6)
        {
          case 'c':
            uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));

            v87 = (void *)v7;
            continue;
          case 'd':
            LOBYTE(v84) = 1;
            continue;
          case 'f':
            LOBYTE(v82) = 1;
            continue;
          case 'h':
            int i = 3;
            continue;
          case 'j':
            BYTE4(v82) = 1;
            continue;
          case 'p':
            uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));

            value = (void *)v9;
            continue;
          case 'r':
            char v81 = 1;
            continue;
          case 's':
            char v4 = 1;
            if (optarg)
            {
              uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:"));

              v86 = (void *)v8;
            }

            continue;
          case 'u':
            continue;
          case 'v':
            BYTE4(v83) = 1;
            continue;
          case 'w':
            BYTE4(v84) = 1;
            continue;
          case 'y':
            LOBYTE(v85) = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }

      if ((int)v6 > 78)
      {
        switch((int)v6)
        {
          case 'O':
            int i = 2;
            continue;
          case 'P':
            BYTE4(v85) = 1;
            continue;
          case 'R':
            int i = 5;
            continue;
          case 'U':
            continue;
          case 'Z':
            LOBYTE(v83) = 1;
            continue;
          default:
            goto LABEL_83;
        }
      }

      if ((_DWORD)v6 != 67) {
        break;
      }
      int i = 4;
    }

    if ((_DWORD)v6 != 68) {
      break;
    }
  }

  if ((_DWORD)v6 != -1) {
LABEL_83:
  }
    errx(1, "unknown command: %c", v6);
  uint64_t v95 = 0LL;
  char v96 = &v95;
  uint64_t v97 = 0x2020000000LL;
  int v98 = 1;
  if ((v85 & 0x100000000LL) != 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
    uint64_t v11 = v10;
    if (!v10) {
      errx(1, "no accounts");
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aa_personID"));
    uint64_t v13 = (void *)v12;
    if (!v12) {
      errx(1, "no dsid");
    }
    uint64_t v104 = kPCSSetupDSID;
    uint64_t v105 = v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
    uint64_t v15 = PCSIdentitySetCreate(v14, 0LL, &v99);
    char v16 = (const void *)v15;
    if (!v15) {
      errx(1, "didn't find any identites in keychain");
    }
    id v17 = sub_100004F28(v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (!v18) {
      errx(1, "no status");
    }
    CFRelease(v16);
    id v94 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v18,  100LL,  0LL,  &v94));
    id v20 = v94;
    if (!v19)
    {
      v79 = (const char *)[objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString stringWithFormat:@"failed to make plist: %@", v20)), "UTF8String"];
      errx(1, "%s", v79);
    }

    id v21 = v19;
    id v22 = [v21 bytes];
    id v23 = [v21 length];
    fwrite(v22, (size_t)v23, 1uLL, __stdoutp);
    *((_DWORD *)v96 + 6) = 0;

    goto LABEL_40;
  }

  if ((v4 & 1) != 0)
  {
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472LL;
    v91[2] = sub_100008210;
    v91[3] = &unk_10000C7F0;
    v93 = &v95;
    uint64_t v24 = dispatch_semaphore_create(0LL);
    uint64_t v92 = v24;
    PCSSyncKeyRegistryWithServiceName(v86, v91);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

LABEL_36:
    uint64_t v11 = 0LL;
    goto LABEL_40;
  }

  if ((v85 & 1) != 0)
  {
    PCSKeySyncingTriggerDaily();
    uint64_t v11 = 0LL;
LABEL_39:
    *((_DWORD *)v96 + 6) = 0;
    goto LABEL_40;
  }

  if ((v84 & 0x100000000LL) != 0)
  {
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472LL;
    v89[2] = sub_100008268;
    v89[3] = &unk_10000C818;
    uint64_t v27 = dispatch_semaphore_create(0LL);
    id v90 = v27;
    PCSTriggerWatchSyncing(v89);
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    *((_DWORD *)v96 + 6) = 0;

    goto LABEL_36;
  }

  if ((v84 & 1) != 0)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
    uint64_t v11 = v28;
    if (v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "aa_personID"));
    }

    else
    {
      warnx("Failed to a configured account, will delete all PCS data");
      uint64_t v29 = 0LL;
    }

    *((_DWORD *)v96 + 6) = 0;
    if ((__PCSDeleteFromKeychainICDP(v29, &v99) & 1) == 0)
    {
      id v48 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to delete from icloud keychain: %@", v99));
      warnx("%s", (const char *)[v48 UTF8String]);

      v49 = v99;
      if (v99)
      {
        v99 = 0LL;
        CFRelease(v49);
      }

      *((_DWORD *)v96 + 6) = 1;
    }

    if ((__PCSDeleteFromKeychain(0LL, &v99) & 1) == 0)
    {
      id v50 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to delete from keychain: %@", v99));
      warnx("%s", (const char *)[v50 UTF8String]);

      v51 = v99;
      if (v99)
      {
        v99 = 0LL;
        CFRelease(v51);
      }

      *((_DWORD *)v96 + 6) = 1;
    }

    if ((__PCSDeleteKeyfile(v29, 0LL) & 1) == 0)
    {
      id v52 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"Failed to delete from keyfile: %@", v99));
      warnx("%s", (const char *)[v52 UTF8String]);

      v53 = v99;
      if (v99)
      {
        v99 = 0LL;
        CFRelease(v53);
      }

      *((_DWORD *)v96 + 6) = 1;
    }

    goto LABEL_40;
  }

  if (v87)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
    if (!value) {
      errx(1, "password missing");
    }
    uint64_t v11 = v30;
    uint64_t v31 = __stdoutp;
    id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "aa_personID"));
    sub_100004108(v31, @"converting dsid %@\n", v33, v34, v35, v36, v37, v38, (uint64_t)v32);

    v39 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    sub_10000895C(i, v39, value, v40, BYTE4(v83) & 1);

    goto LABEL_39;
  }

  if ((v83 & 1) != 0)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v42 = Mutable;
    if (!Mutable) {
      errx(1, "out of memory");
    }
    if (value) {
      CFDictionarySetValue(Mutable, kPCSSetupPassword, value);
    }
    if ((v82 & 1) != 0) {
      CFDictionarySetValue(v42, kPCSSetupForceUpdate, kCFBooleanTrue);
    }
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
    v43 = (const void *)kPCSSetupUsername;
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
    CFDictionarySetValue(v42, v43, v44);

    v45 = (const void *)kPCSSetupDSID;
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    CFDictionarySetValue(v42, v45, v46);

    if ((PCSIdentitySynchronizeKeys(v42, &v99) & 1) == 0)
    {
      v80 = (const char *)[objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString stringWithFormat:@"PCSIdentitySynchronizeKeys: %@", v99)), "UTF8String"];
      errx(1, "%s", v80);
    }

    CFRelease(v42);
    char v47 = v99;
    if (v99)
    {
      v99 = 0LL;
      CFRelease(v47);
    }

    goto LABEL_39;
  }

  if ((v81 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
    uint64_t v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
    v55 = (void *)v54;
    if (!v54) {
      errx(1, "no iCloud primary account");
    }
    uint64_t v102 = kPCSSetupDSID;
    uint64_t v103 = v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
    v57 = (void *)__PCSCopyStingrayInfo(0LL, v56, 0LL);
    v58 = v57;
    if (!v57) {
      errx(1, "metadata");
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:kSecureBackupStingrayMetadataKey]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:kPCSSecureBackupCFClientMetadataKey]);
    BOOL v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:kPCSSecureBackupCFSecureBackupKeyRegistry]);

    v62 = sub_100006B60(v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    sub_1000045A8(v63, BYTE4(v82) & 1);

    *((_DWORD *)v96 + 6) = 0;
    goto LABEL_40;
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel accountForCurrentPersona]( &OBJC_CLASS___PCSAccountsModel,  "accountForCurrentPersona"));
  uint64_t v11 = v64;
  if (!v64)
  {
    warnx("no accounts");
    goto LABEL_80;
  }

  id v65 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "aa_personID"));
  if (!v65)
  {
    warnx("no dsid");
LABEL_80:
    id v65 = kPCSSetupDSIDAny;
  }

  uint64_t v100 = kPCSSetupDSID;
  id v101 = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
  v67 = (const void *)PCSIdentitySetCreate(v66, 0LL, &v99);
  if (!v67) {
    errx(1, "didn't find any identites in keychain");
  }
  id v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v69 = sub_1000045B0((uint64_t)v67);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v70, @"status");

  CFRelease(v67);
  uint64_t v71 = sub_1000068D8();
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v68,  "setObject:forKeyedSubscript:",  v72,  @"status_keychain");

  uint64_t v73 = sub_100006B44();
  char v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v68, "setObject:forKeyedSubscript:", v74, @"status_keysync");

  uint64_t v75 = sub_100005244(v65);
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v68,  "setObject:forKeyedSubscript:",  v76,  @"status_guitarfish");

  v77 = sub_100006E2C();
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v68,  "setObject:forKeyedSubscript:",  v78,  @"status_messages");

  sub_1000045A8(v68, BYTE4(v82) & 1);
  *((_DWORD *)v96 + 6) = 0;

LABEL_40:
  uint64_t v25 = *((unsigned int *)v96 + 6);
  _Block_object_dispose(&v95, 8);

  return v25;
}

void sub_10000819C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t sub_100008210( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }
  else {
    sub_100004108(__stderrp, @"error: %@", a3, a4, a5, a6, a7, a8, a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100008268(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000083A8()
{
  if (qword_1000109F0 != -1) {
    dispatch_once(&qword_1000109F0, &stru_10000C8F8);
  }
  return (id)qword_1000109E8;
}

void sub_1000083E8(uint64_t a1)
{
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[7]);
    dispatch_object_t v3 = v2[3];
    if (v3)
    {
      char v4 = objc_retainBlock(v3);
      v16[0] = 0LL;
      v16[1] = v16;
      v16[2] = 0x3032000000LL;
      v16[3] = sub_100008570;
      v16[4] = sub_100008580;
      id v17 = v2[8];
      dispatch_object_t v5 = v2[8];
      v2[8] = 0LL;

      dispatch_object_t v6 = v2[6];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100008588;
      v13[3] = &unk_10000C840;
      uint64_t v7 = v4;
      uint64_t v14 = v7;
      uint64_t v15 = v16;
      -[dispatch_object_s addOperationWithBlock:](v6, "addOperationWithBlock:", v13);

      _Block_object_dispose(v16, 8);
    }

    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * (void)v2[4]);
    id v9 = sub_1000083A8();
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000085E0;
    block[3] = &unk_10000C818;
    uint64_t v12 = v2;
    dispatch_after(v8, v10, block);
  }
}

void sub_100008558( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100008570(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008580(uint64_t a1)
{
}

void sub_100008588(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  char v4 = *(void **)(v3 + 40);
  if (v4)
  {
    *(void *)(v3 + 40) = 0LL;
  }

void sub_1000085E0(uint64_t a1)
{
}

uint64_t sub_1000086B8(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72LL) = *(_BYTE *)(result + 40) == 0;
  return result;
}

void sub_100008778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_object_t v6 = WeakRetained;
  if (!*((void *)WeakRetained + 9) && !*((void *)WeakRetained + 8))
  {
    id v3 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) label]);
    uint64_t v4 = os_transaction_create([v3 UTF8String]);
    dispatch_object_t v5 = (void *)v6[8];
    v6[8] = v4;

    id WeakRetained = v6;
  }

  dispatch_source_merge_data(*((dispatch_source_t *)WeakRetained + 7), 1uLL);
}

void sub_10000890C(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("PCSDelayedActionQueue", v4);
  id v3 = (void *)qword_1000109E8;
  qword_1000109E8 = (uint64_t)v2;
}

uint64_t sub_10000895C(int a1, void *a2, void *a3, void *a4, int a5)
{
  CFTypeRef cf = 0LL;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  sub_100008DA8(v12, v9, v11, v10);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel guitarfishStateForDSID:]( &OBJC_CLASS___PCSAccountsModel,  "guitarfishStateForDSID:",  v9));
  if (v13)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 BOOLValue]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v20, kPCSSetupGuitarfish);

    switch(a1)
    {
      case 1:
        if (a5)
        {
          sub_100004108(__stdoutp, @"Calling PCSIdentityMigrateDropStingray", v14, v15, v16, v17, v18, v19, v33);
          if ((PCSIdentityMigrateDropStingray(v12, &cf) & 1) != 0)
          {
            id v21 = __stdoutp;
            id v22 = @"PCSIdentityMigrateDropStingray succeeded";
            goto LABEL_20;
          }
        }

        else if ((PCSIdentityMigrateDropStingray(v12, &cf) & 1) != 0)
        {
          goto LABEL_39;
        }

        sub_100004108(__stderrp, @"PCSIdentityMigrateDropStingray: %@", v14, v15, v16, v17, v18, v19, (uint64_t)cf);
        break;
      case 2:
        if (a5)
        {
          sub_100004108(__stdoutp, @"Calling PCSIdentityMigrateToiCDP", v14, v15, v16, v17, v18, v19, v33);
          if ((PCSIdentityMigrateToiCDP(v12, &cf) & 1) != 0)
          {
            id v21 = __stdoutp;
            id v22 = @"PCSIdentityMigrateToiCDP succeeded";
            goto LABEL_20;
          }
        }

        else if ((PCSIdentityMigrateToiCDP(v12, &cf) & 1) != 0)
        {
          goto LABEL_39;
        }

        sub_100004108(__stderrp, @"PCSIdentityMigrateToiCDP: %@", v14, v15, v16, v17, v18, v19, (uint64_t)cf);
        break;
      case 3:
        id v23 = __stderrp;
        uint64_t v24 = @"Convert HSM no longer supported";
        goto LABEL_7;
      case 4:
        if (a5)
        {
          sub_100004108(__stdoutp, @"Calling PCSIdentityMigrateCloseDoor", v14, v15, v16, v17, v18, v19, v33);
          if ((PCSIdentityMigrateCloseDoor(v12, &cf) & 1) != 0)
          {
            id v21 = __stdoutp;
            id v22 = @"PCSIdentityMigrateCloseDoor succeeded";
            goto LABEL_20;
          }
        }

        else if ((PCSIdentityMigrateCloseDoor(v12, &cf) & 1) != 0)
        {
          goto LABEL_39;
        }

        sub_100004108(__stderrp, @"PCSIdentityMigrateCloseDoor: %@", v14, v15, v16, v17, v18, v19, (uint64_t)cf);
        break;
      case 5:
        if (a5)
        {
          sub_100004108(__stdoutp, @"Calling PCSIdentityMigrateRestoreHSM", v14, v15, v16, v17, v18, v19, v33);
          if ((PCSIdentityMigrateRestoreHSM(v12, &cf) & 1) != 0)
          {
            id v21 = __stdoutp;
            id v22 = @"PCSIdentityMigrateRestoreHSM succeeded";
LABEL_20:
            sub_100004108(v21, v22, v14, v15, v16, v17, v18, v19, v34);
            goto LABEL_39;
          }
        }

        else if ((PCSIdentityMigrateRestoreHSM(v12, &cf) & 1) != 0)
        {
LABEL_39:
          id v25 = 0LL;
          goto LABEL_40;
        }

        sub_100004108(__stderrp, @"PCSIdentityMigrateRestoreHSM: %@", v14, v15, v16, v17, v18, v19, (uint64_t)cf);
        break;
      case 6:
        if (a5) {
          sub_100004108(__stdoutp, @"Calling PCSAccountEnableWalrus", v14, v15, v16, v17, v18, v19, v33);
        }
        id v36 = 0LL;
        char v27 = PCSAccountEnableWalrus(0LL, v12, &v36);
        id v25 = v36;
        if ((v27 & 1) == 0)
        {
          sub_100004108(__stderrp, @"PCSAccountEnableWalrus: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v25);
          goto LABEL_9;
        }

        if (!a5) {
          goto LABEL_40;
        }
        uint64_t v28 = __stdoutp;
        uint64_t v29 = @"PCSAccountEnableWalrus succeeded";
        goto LABEL_31;
      case 7:
        if (a5) {
          sub_100004108(__stdoutp, @"Calling PCSAccountDisableWalrus", v14, v15, v16, v17, v18, v19, v33);
        }
        id v35 = 0LL;
        char v30 = PCSAccountDisableWalrus(0LL, v12, &v35);
        id v25 = v35;
        if ((v30 & 1) == 0)
        {
          sub_100004108(__stderrp, @"PCSAccountDisableWalrus: %@", v14, v15, v16, v17, v18, v19, (uint64_t)v25);
          goto LABEL_9;
        }

        if (a5)
        {
          uint64_t v28 = __stdoutp;
          uint64_t v29 = @"PCSAccountDisableWalrus succeeded";
LABEL_31:
          sub_100004108(v28, v29, v14, v15, v16, v17, v18, v19, v33);
        }

LABEL_40:
        uint64_t v26 = 0LL;
        goto LABEL_41;
      default:
        break;
    }
  }

  else
  {
    id v23 = __stderrp;
    uint64_t v24 = @"Failed to get Guitarfish state.";
LABEL_7:
    sub_100004108(v23, v24, v14, v15, v16, v17, v18, v19, v33);
  }

  id v25 = 0LL;
LABEL_9:
  uint64_t v26 = 1LL;
LABEL_41:
  CFTypeRef v31 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v31);
  }

  if (a5) {
    sub_100004108(__stderrp, @"convert returning: %d", v14, v15, v16, v17, v18, v19, v26);
  }

  return v26;
}

void sub_100008DA8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    NSLog(@"Must provide either an AppleID to fetch a PET");
    exit(1);
  }

  id v11 = v10;
  id v12 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationContext);
  [v12 setUsername:v9];
  if (v11) {
    [v12 _setPassword:v11];
  }
  [v12 setAuthenticationType:1];
  [v12 setIsUsernameEditable:0];
  uint64_t v30 = 0LL;
  CFTypeRef v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = sub_100009038;
  uint64_t v34 = sub_100009048;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  char v27 = sub_100009038;
  uint64_t v28 = sub_100009048;
  id v29 = 0LL;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  id v14 = objc_alloc_init(&OBJC_CLASS___AKAppleIDAuthenticationController);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100009050;
  v18[3] = &unk_10000C920;
  id v15 = v8;
  id v19 = v15;
  id v16 = v9;
  id v20 = v16;
  id v22 = &v30;
  id v23 = &v24;
  uint64_t v17 = v13;
  id v21 = v17;
  [v14 authenticateWithContext:v12 completion:v18];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  [v7 setObject:v16 forKeyedSubscript:kPCSSetupUsername];
  [v7 setObject:v31[5] forKeyedSubscript:kPCSSetupPassword];
  [v7 setObject:v15 forKeyedSubscript:kPCSSetupDSID];
  [v7 setObject:v11 forKeyedSubscript:kPCSSetupRawPassword];
  [v7 setObject:v25[5] forKeyedSubscript:kPCSSetupPasswordGeneration];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void sub_100009014( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009038(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009048(uint64_t a1)
{
}

void sub_100009050(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  if (v5)
  {
    sub_100004108(__stderrp, @"authentication error: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    goto LABEL_9;
  }

  uint64_t v12 = *(void **)(a1 + 32);
  dispatch_semaphore_t v13 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:AKAuthenticationDSIDKey]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  LOBYTE(v12) = [v12 isEqualToString:v14];

  if ((v12 & 1) == 0)
  {
    id v29 = __stderrp;
    uint64_t v30 = @"authentication error: dsid mismatch";
LABEL_8:
    sub_100004108(v29, v30, v15, v16, v17, v18, v19, v20, v31);
LABEL_9:
    exit(1);
  }

  id v21 = *(void **)(a1 + 40);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:AKAuthenticationUsernameKey]);
  LOBYTE(v21) = [v21 isEqualToString:v22];

  if ((v21 & 1) == 0)
  {
    id v29 = __stderrp;
    uint64_t v30 = @"authentication error: username mismatch";
    goto LABEL_8;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
  uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:AKPasswordVersionKey]);
  uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}