uint64_t start()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFStringRef v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFArrayRef v45;
  CFStringRef *v46;
  const void *v47;
  const void *v48;
  uint64_t PeerID;
  const void *v50;
  const void *v51;
  CFErrorDomain Domain;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  CFDictionaryRef v70;
  const void *v71;
  const void *v72;
  const void *v73;
  CFDictionaryRef v74;
  const void *v75;
  CFDictionaryRef v76;
  const void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *i;
  id v84;
  void *v85;
  char IsInternalRelease;
  char v87;
  void *v88;
  CFTypeRef v89;
  NSXPCConnection *v90;
  void *v91;
  dispatch_semaphore_t v92;
  dispatch_semaphore_s *v93;
  void *v94;
  dispatch_semaphore_s *v95;
  dispatch_time_t v96;
  dispatch_queue_t v97;
  dispatch_group_t v98;
  dispatch_queue_s *v99;
  dispatch_group_s *v100;
  dispatch_semaphore_t v101;
  dispatch_time_t v102;
  dispatch_group_s *v103;
  dispatch_semaphore_s *v104;
  CFStringRef *v105;
  const void *v106;
  CFTypeID v107;
  uint64_t v108;
  os_log_s *v109;
  uint64_t v110;
  CFDictionaryRef v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v120;
  char v121;
  char v122;
  char v123;
  void *v124;
  CFDictionaryRef query;
  void *v126;
  CFTypeRef cf;
  CFStringRef context;
  uint64_t v129;
  CFBooleanRef v130;
  void *v131;
  __CFString *v132;
  dispatch_semaphore_s *v133;
  __int128 *v134;
  __int128 v135;
  __int128 v136;
  unsigned __int128 v137;
  __int128 v138;
  void v139[6];
  __int128 result;
  CFStringRef v141;
  CFStringRef v142;
  void *v143;
  void *v144;
  CFRange v145;
  v124 = objc_autoreleasePoolPush();
  puts("sysdiagnose keychain");
  qword_10000C2D0 = (uint64_t)__stdoutp;
  *(void *)&result = 0LL;
  *(void *)&v135 = 0LL;
  *((void *)&v135 + 1) = &v135;
  *(void *)&v136 = 0x2020000000LL;
  DWORD2(v136) = 0;
  v0 = SOSCCThisDeviceIsInCircle(&result);
  if (v0 == -1)
  {
    if (CFErrorGetCode((CFErrorRef)result) == 1050)
    {
      v12 = qword_10000C2D0;
      v13 = @"SOS is not supported on this platform\n";
    }

    else
    {
      v51 = (const void *)sSecXPCErrorDomain;
      Domain = CFErrorGetDomain((CFErrorRef)result);
      v53 = CFEqual(v51, Domain);
      v12 = qword_10000C2D0;
      if (v53)
      {
        v13 = @"SOS status is kSOSCCError due to XPC error\n";
      }

      else
      {
        v120 = result;
        v13 = @"SOS status is kSOSCCError (%@)\n";
      }
    }

    sub_10000656C(v12, 0LL, v13, v7, v8, v9, v10, v11, v120);
    sub_10000656C(qword_10000C2D0, 0LL, @"\n", v54, v55, v56, v57, v58, v123);
  }

  else
  {
    if (v0 > 3) {
      v6 = "<unknown ccstatus>";
    }
    else {
      v6 = off_1000086D8[v0];
    }
    sub_10000656C(qword_10000C2D0, 0LL, @"ccstatus: %s (%d)\n", v1, v2, v3, v4, v5, (char)v6);
    if ((void)result)
    {
      sub_10000656C(qword_10000C2D0, 0LL, @"Error checking circle status: %@\n", v14, v15, v16, v17, v18, result);
      v19 = (const void *)result;
      if ((void)result)
      {
        *(void *)&result = 0LL;
        CFRelease(v19);
      }
    }

    v25 = SOSCCGetLastDepartureReason(&result);
    if (v25 > 8) {
      v26 = "Unknown";
    }
    else {
      v26 = off_1000086F8[v25];
    }
    sub_10000656C(qword_10000C2D0, 0LL, @"LastDepartureReason: %s (%d)\n", v20, v21, v22, v23, v24, (char)v26);
    if ((void)result)
    {
      sub_10000656C( qword_10000C2D0,  0LL,  @"Error checking last departure reason error: %@\n",  v27,  v28,  v29,  v30,  v31,  result);
      v32 = (const void *)result;
      if ((void)result)
      {
        *(void *)&result = 0LL;
        CFRelease(v32);
      }
    }

    if (SOSCCValidateUserPublic(&result))
    {
      v38 = @"Account user public is trusted\n";
    }

    else
    {
      v121 = result;
      v38 = @"Account user public is not trusted error:(%@)\n";
    }

    sub_10000656C(qword_10000C2D0, 0LL, v38, v33, v34, v35, v36, v37, v121);
    v39 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0LL;
      CFRelease(v39);
    }

    v45 = (const __CFArray *)SOSCCCopyGenerationPeerInfo(&result);
    if (v45)
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v129 = 3221225472LL;
      v130 = (CFBooleanRef)sub_100005520;
      v131 = &unk_100008520;
      v132 = (__CFString *)&v135;
      v46 = &context;
      v145.length = CFArrayGetCount(v45);
      v145.location = 0LL;
      CFArrayApplyFunction(v45, v145, (CFArrayApplierFunction)sub_1000055F0, v46);

      CFRelease(v45);
    }

    else
    {
      sub_10000656C(qword_10000C2D0, 0LL, @"No generation count: %@\n", v40, v41, v42, v43, v44, result);
    }

    v47 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0LL;
      CFRelease(v47);
    }

    v48 = (const void *)SOSCCCopyMyPeerInfo(0LL);
    PeerID = SOSPeerInfoGetPeerID(v48);
    sub_100005604((uint64_t)"     Peers", PeerID, (uint64_t)&stru_100008560);
    sub_100005604((uint64_t)"   Invalid", PeerID, (uint64_t)&stru_100008580);
    sub_100005604((uint64_t)"   Retired", PeerID, (uint64_t)&stru_1000085A0);
    sub_100005604((uint64_t)"    Concur", PeerID, (uint64_t)&stru_1000085C0);
    sub_100005604((uint64_t)"Applicants", PeerID, (uint64_t)&stru_1000085E0);
    if (v48) {
      CFRelease(v48);
    }
    v50 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0LL;
      CFRelease(v50);
    }
  }

  _Block_object_dispose(&v135, 8);
  context = 0LL;
  sub_10000656C(qword_10000C2D0, 0LL, @"Engine state:\n", v59, v60, v61, v62, v63, v122);
  if ((SOSCCForEachEngineStateAsString(&context, &stru_100008620) & 1) == 0) {
    sub_10000656C( qword_10000C2D0,  0LL,  @"No engine state, got error: %@\n",  v64,  v65,  v66,  v67,  v68,  (char)context);
  }
  [@"HomeKit keychain state:\n" writeToStdOut];
  *(void *)&v135 = kSecClass;
  *((void *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)@"com.apple.hap.pairing";
  *(void *)&v136 = kSecAttrSynchronizable;
  *((void *)&v136 + 1) = kSecMatchLimit;
  v130 = kCFBooleanTrue;
  v131 = (void *)kSecMatchLimitAll;
  v137 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v132 = (__CFString *)&__kCFBooleanTrue;
  v133 = (dispatch_semaphore_s *)&__kCFBooleanFalse;
  *(void *)&v138 = kSecUseDataProtectionKeychain;
  v134 = (__int128 *)&__kCFBooleanTrue;
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &context,  &v135,  7LL));
  v70 = (const __CFDictionary *)[v69 mutableCopy];

  *(void *)&result = 0LL;
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004EB0(@"HomeKit", (void *)result);
  }
  v71 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0LL;
    CFRelease(v71);
  }

  -[__CFDictionary setObject:forKeyedSubscript:]( v70,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  kSecAttrSynchronizable);
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004EB0(@"HomeKit", (void *)result);
  }
  v72 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0LL;
    CFRelease(v72);
  }

  -[__CFDictionary setObject:forKeyedSubscript:]( v70,  "setObject:forKeyedSubscript:",  @"com.apple.hap.metadata",  kSecAttrAccessGroup);
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004EB0(@"HomeKit", (void *)result);
  }
  v73 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0LL;
    CFRelease(v73);
  }

  [@"AutoUnlock keychain state:\n" writeToStdOut];
  *(void *)&v135 = kSecClass;
  *((void *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)@"com.apple.continuity.unlock";
  *(void *)&v136 = kSecAttrAccount;
  *((void *)&v136 + 1) = kSecAttrSynchronizable;
  v130 = (CFBooleanRef)@"com.apple.continuity.auto-unlock.sync";
  v131 = kCFBooleanTrue;
  *(void *)&v137 = kSecMatchLimit;
  *((void *)&v137 + 1) = kSecReturnAttributes;
  v132 = (__CFString *)kSecMatchLimitAll;
  v133 = (dispatch_semaphore_s *)&__kCFBooleanTrue;
  *(void *)&v138 = kSecReturnData;
  v134 = (__int128 *)&__kCFBooleanFalse;
  v74 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &context,  &v135,  7LL));
  *(void *)&result = 0LL;
  if (!SecItemCopyMatching(v74, (CFTypeRef *)&result)) {
    sub_100004EB0(@"AutoUnlock", (void *)result);
  }
  v75 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0LL;
    CFRelease(v75);
  }

  [@"Rapport keychain state:\n" writeToStdOut];
  *(void *)&v135 = kSecClass;
  *((void *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)@"com.apple.rapport";
  *(void *)&v136 = kSecAttrSynchronizable;
  *((void *)&v136 + 1) = kSecMatchLimit;
  v130 = kCFBooleanTrue;
  v131 = (void *)kSecMatchLimitAll;
  v137 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v132 = (__CFString *)&__kCFBooleanTrue;
  v133 = (dispatch_semaphore_s *)&__kCFBooleanFalse;
  v76 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &context,  &v135,  6LL));
  *(void *)&result = 0LL;
  if (!SecItemCopyMatching(v76, (CFTypeRef *)&result)) {
    sub_100004EB0(@"rapport", (void *)result);
  }
  v77 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0LL;
    CFRelease(v77);
  }

  [@"Notes keychain state:\n" writeToStdOut];
  v139[0] = kSecClass;
  v139[1] = kSecAttrAccessGroup;
  *(void *)&result = kSecClassGenericPassword;
  *((void *)&result + 1) = @"group.com.apple.notes";
  v139[2] = kSecAttrSynchronizable;
  v139[3] = kSecMatchLimit;
  v141 = kSecAttrSynchronizableAny;
  v142 = kSecMatchLimitAll;
  v139[4] = kSecReturnAttributes;
  v139[5] = kSecReturnData;
  v143 = &__kCFBooleanTrue;
  v144 = &__kCFBooleanFalse;
  query = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &result,  v139,  6LL));
  cf = 0LL;
  if (!SecItemCopyMatching(query, &cf))
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v79 = (id)cf;
    v80 = [v79 countByEnumeratingWithState:&v135 objects:&context count:16];
    if (v80)
    {
      v81 = *(void *)v136;
      v82 = 1LL;
      do
      {
        for (i = 0LL; i != v80; i = (char *)i + 1)
        {
          if (*(void *)v136 != v81) {
            objc_enumerationMutation(v79);
          }
          v84 = [*(id *)(*((void *)&v135 + 1) + 8 * (void)i) mutableCopy];
          v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:kSecAttrLabel]);
          IsInternalRelease = SecIsInternalRelease();
          if (v85) {
            v87 = IsInternalRelease;
          }
          else {
            v87 = 1;
          }
          if ((v87 & 1) == 0 && ([v85 isEqual:@"local"] & 1) == 0)
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue([v126 objectForKeyedSubscript:v85]);
            if (!v88)
            {
              v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<REDACTED-LABL-%llu>",  v82));
              [v126 setObject:v88 forKeyedSubscript:v85];
              ++v82;
            }

            [v84 setObject:v88 forKeyedSubscript:kSecAttrLabel];
          }

          [v78 addObject:v84];
        }

        v80 = [v79 countByEnumeratingWithState:&v135 objects:&context count:16];
      }

      while (v80);
    }

    sub_100004EB0(@"notes", v78);
  }

  v89 = cf;
  if (cf)
  {
    cf = 0LL;
    CFRelease(v89);
  }

  v90 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.securityuploadd",  0LL);
  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___supdProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v90, "setRemoteObjectInterface:", v91);

    -[NSXPCConnection resume](v90, "resume");
    v92 = dispatch_semaphore_create(0LL);
    context = (CFStringRef)_NSConcreteStackBlock;
    v129 = 3221225472LL;
    v130 = (CFBooleanRef)sub_100005170;
    v131 = &unk_1000084A8;
    v93 = v92;
    v132 = (__CFString *)v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( v90,  "remoteObjectProxyWithErrorHandler:",  &context));
    *(void *)&v135 = _NSConcreteStackBlock;
    *((void *)&v135 + 1) = 3221225472LL;
    *(void *)&v136 = sub_1000051C0;
    *((void *)&v136 + 1) = &unk_1000084D0;
    v95 = v93;
    *(void *)&v137 = v95;
    [v94 getSysdiagnoseDumpWithReply:&v135];

    v96 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_semaphore_wait(v95, v96)) {
      [@"\n\nError: timed out waiting for response\n" writeToStdErr];
    }
  }

  else
  {
    [@"failed to setup xpc connection for securityuploadd\n" writeToStdErr];
  }

  qword_10000C2D0 = (uint64_t)__stdoutp;
  v97 = dispatch_queue_create("general", 0LL);
  v98 = dispatch_group_create();
  v99 = v97;
  v100 = v98;
  *(void *)&v135 = 0LL;
  *((void *)&v135 + 1) = &v135;
  v136 = 0x2020000000uLL;
  v101 = dispatch_semaphore_create(0LL);
  v102 = dispatch_time(0LL, 30000000000LL);
  dispatch_group_enter(v100);
  context = (CFStringRef)_NSConcreteStackBlock;
  v129 = 3221225472LL;
  v130 = (CFBooleanRef)sub_100005C14;
  v131 = &unk_100008668;
  v134 = &v135;
  v103 = v100;
  v132 = (__CFString *)v103;
  v104 = v101;
  v133 = v104;
  v105 = objc_retainBlock(&context);
  SOSCloudKeychainGetAllObjectsFromCloud(v99, v105);
  dispatch_semaphore_wait(v104, v102);
  v106 = *(const void **)(*((void *)&v135 + 1) + 24LL);
  if (v106)
  {
    v107 = CFGetTypeID(v106);
    if (v107 == CFNullGetTypeID())
    {
      CFRelease(*(CFTypeRef *)(*((void *)&v135 + 1) + 24LL));
      *(void *)(*((void *)&v135 + 1) + 24LL) = 0LL;
    }
  }

  v108 = secLogObjForScope("SecError");
  v109 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = *(void *)(*((void *)&v135 + 1) + 24LL);
    LODWORD(result) = 138412290;
    *(void *)((char *)&result + 4) = v110;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "returned: %@", (uint8_t *)&result, 0xCu);
  }

  v111 = *(const __CFDictionary **)(*((void *)&v135 + 1) + 24LL);
  _Block_object_dispose(&v135, 8);

  if (v111)
  {
    fwrite("\nAll values in decoded form...\n", 0x1FuLL, 1uLL, (FILE *)qword_10000C2D0);
    v112 = 0;
    *(void *)&v135 = 0LL;
    *((void *)&v135 + 1) = &v135;
    *(void *)&v136 = 0x2020000000LL;
    BYTE8(v136) = 0;
    do
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v129 = 3221225472LL;
      v130 = (CFBooleanRef)sub_100005DC4;
      v131 = &unk_100008690;
      LODWORD(v133) = v112;
      v132 = (__CFString *)&v135;
      CFDictionaryApplyFunction(v111, (CFDictionaryApplierFunction)sub_100006258, &context);
      v118 = *((void *)&v135 + 1);
      if (*(_BYTE *)(*((void *)&v135 + 1) + 24LL))
      {
        sub_10000656C(qword_10000C2D0, 0LL, @"%@\n", v113, v114, v115, v116, v117, (char)&stru_100008D50);
        v118 = *((void *)&v135 + 1);
      }

      *(_BYTE *)(v118 + 24) = 0;
      ++v112;
    }

    while (v112 != 11);
    _Block_object_dispose(&v135, 8);
  }

  fputc(10, (FILE *)qword_10000C2D0);

  objc_autoreleasePoolPop(v124);
  return 0LL;
}

void sub_100004E5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_100004EB0(void *a1, void *a2)
{
  id v23 = a1;
  if (a2)
  {
    CFTypeID v3 = CFGetTypeID(a2);
    CFTypeID TypeID = CFArrayGetTypeID();
    id v5 = a2;
    id v6 = v5;
    if (v3 == TypeID)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v6 = v6;
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        id v9 = v8;
        id v10 = 0LL;
        uint64_t v11 = *(void *)v29;
        do
        {
          v12 = 0LL;
          v13 = v10;
          do
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(id *)(*((void *)&v28 + 1) + 8LL * (void)v12);

            if ((objc_opt_respondsToSelector(v10, "asOneLineString") & 1) != 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue([v10 asOneLineString]);
              v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@\n",  v23,  v14));
              [v7 addObject:v15];
            }

            v12 = (char *)v12 + 1;
            v13 = v10;
          }

          while (v9 != v12);
          id v9 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }

        while (v9);
      }

      [v7 sortUsingSelector:"compare:"];
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      id v16 = v7;
      id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * (void)i) writeToStdOut];
          }

          id v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }

        while (v18);
      }
    }

    else if ((objc_opt_respondsToSelector(v5, "asOneLineString") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 asOneLineString]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@\n",  v23,  v21));
      [v22 writeToStdOut];
    }
  }
}

uint64_t sub_100005170(uint64_t a1, uint64_t a2)
{
  CFTypeID v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error talking with daemon: %@\n",  a2));
  [v3 writeToStdErr];

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000051C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFTypeID v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\nAnalytics sysdiagnose:\n\n%@\n",  a2));
    [v3 writeToStdOut];
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

CFDataRef sub_100005214(CFDataRef theData)
{
  v1 = theData;
  if (theData)
  {
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    uint64_t v36 = 0LL;
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(v1);
    v4 = &BytePtr[Length];
    v40 = 0LL;
    uint64_t v5 = ccder_decode_constructed_tl(0x2000000000000010LL, &v40, BytePtr, &BytePtr[Length]);
    if (v40 == v4) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0LL;
    }
    uint64_t v39 = 0LL;
    v7 = (const UInt8 *)ccder_decode_tl(4LL, &v39, v6);
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    uint64_t v8 = ccder_decode_uint64(&v38, &v7[v39], v40);
    if (HIDWORD(v38)) {
      uint64_t v9 = 0LL;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = ccder_decode_uint64(&v37, v9, v40);
    if (HIDWORD(v37)) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v41 = 0LL;
    v12 = (char *)ccder_decode_tl(6LL, &v41, v11);
    if (CSSMOID_PKCS5_HMAC_SHA1.Length == v41
      && (v13 = v12, !memcmp(CSSMOID_PKCS5_HMAC_SHA1.Data, v12, CSSMOID_PKCS5_HMAC_SHA1.Length))
      && v13)
    {
      id v16 = (const UInt8 *)&v13[CSSMOID_PKCS5_HMAC_SHA1.Length];
      uint64_t v15 = v37;
      uint64_t v14 = v38;
    }

    else
    {
      v7 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v15 = 0LL;
      id v16 = 0LL;
    }

    if (v16 == v4)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      __int128 v28 = sub_1000054C8;
      __int128 v29 = &unk_1000084F8;
      __int128 v30 = &v33;
      uint64_t v31 = v14;
      uint64_t v32 = v15;
      id v17 = v27;
      id v18 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, 4LL, kCFAllocatorNull);
      uint64_t v19 = v17;
      v20 = v19;
      if (v18)
      {
        CFIndex v21 = CFDataGetLength(v18);
        Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * v21);
        id v23 = CFDataGetBytePtr(v18);
        CFIndex v24 = CFDataGetLength(v18);
        if (v24 >= 1)
        {
          do
          {
            unsigned int v25 = *v23++;
            CFStringAppendFormat(Mutable, 0LL, @"%02X", v25);
            --v24;
          }

          while (v24);
        }

        v28(v20, (uint64_t)Mutable);
        CFRelease(Mutable);

        CFRelease(v18);
      }

      else
      {
        v28(v19, (uint64_t)@"(null)");
        CFRelease(@"(null)");
      }

      v1 = (const __CFData *)v34[3];
    }

    else
    {
      v1 = 0LL;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v1;
}

void sub_1000054A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

CFStringRef sub_1000054C8(void *a1, uint64_t a2)
{
  CFStringRef result = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"<Params: iter: %zd, size: %zd, salt: %@>",  a1[5],  a1[6],  a2);
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

void sub_100005520( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) & 1) != 0
    || (sub_10000656C(qword_10000C2D0, 0LL, @"Circle name: %@, ", a4, a5, a6, a7, a8, a2),
        (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) & 1) != 0))
  {
    uint64_t v15 = (const void *)SOSGenerationCountCopyDescription(a2);
    sub_10000656C(qword_10000C2D0, 0LL, @"Generation Count: %@", v16, v17, v18, v19, v20, (char)v15);
    if (v15) {
      CFRelease(v15);
    }
  }

  sub_10000656C(qword_10000C2D0, 0LL, @"%s\n", v10, v11, v12, v13, v14, (char)"");
}

uint64_t sub_1000055F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_100005604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = 0LL;
  uint64_t v5 = (const __CFArray *)(*(uint64_t (**)(uint64_t, const void **))(a3 + 16))(a3, &v20);
  uint64_t v11 = qword_10000C2D0;
  if (v5)
  {
    uint64_t v12 = v5;
    CFArrayGetCount(v5);
    sub_10000656C(v11, 0LL, @"%s count: %ld\n", v13, v14, v15, v16, v17, a1);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_100005720;
    context[3] = &unk_100008640;
    context[4] = a2;
    context[5] = a1;
    v21.length = CFArrayGetCount(v12);
    v21.location = 0LL;
    CFArrayApplyFunction(v12, v21, (CFArrayApplierFunction)sub_1000055F0, context);
    CFRelease(v12);
  }

  else
  {
    sub_10000656C(qword_10000C2D0, 0LL, @"No %s, error: %@\n", v6, v7, v8, v9, v10, a1);
  }

  uint64_t v18 = v20;
  if (v20)
  {
    uint64_t v20 = 0LL;
    CFRelease(v18);
  }
}

__CFArray *__cdecl sub_100005700(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyApplicantPeerInfo(a2);
}

__CFArray *__cdecl sub_100005708(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyConcurringPeerPeerInfo(a2);
}

__CFArray *__cdecl sub_100005710(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyRetirementPeerInfo(a2);
}

__CFArray *__cdecl sub_100005718(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyNotValidPeerPeerInfo(a2);
}

void sub_100005720(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return;
  }
  PeerName = (const __CFString *)SOSPeerInfoGetPeerName(a2);
  PeerDeviceType = (const __CFString *)SOSPeerInfoGetPeerDeviceType(a2);
  CFTypeRef cf2 = (CFTypeRef)SOSPeerInfoGetPeerID(a2);
  uint64_t v6 = (const __CFDictionary *)SOSPeerInfoCopyPeerGestalt(a2);
  uint64_t v7 = v6;
  if (v6) {
    CFDictionaryGetValue(v6, @"OSVersion");
  }
  uint64_t v8 = &stru_100008D50;
  if (SOSPeerInfoVersionHasV2Data(a2))
  {
    uint64_t v9 = *(const __CFDictionary **)(a2 + 80);
    if (v9)
    {
      Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 80), @"TransportType");
      uint64_t v8 = (const __CFString *)CFDictionaryGetValue(v9, @"DeviceID");
      uint64_t v11 = (const __CFString *)CFDictionaryGetValue(v9, @"MachineIDKey");
      if (!PeerName)
      {
LABEL_25:
        uint64_t v14 = strdup("");
        if (!PeerDeviceType) {
          goto LABEL_26;
        }
        goto LABEL_12;
      }
    }

    else
    {
      Value = @"KVS";
      uint64_t v11 = &stru_100008D50;
      uint64_t v8 = &stru_100008D50;
      if (!PeerName) {
        goto LABEL_25;
      }
    }
  }

  else
  {
    Value = @"KVS";
    uint64_t v11 = &stru_100008D50;
    if (!PeerName) {
      goto LABEL_25;
    }
  }

  CFRetain(PeerName);
  CFIndex Length = CFStringGetLength(PeerName);
  CFIndex v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v14 = (char *)malloc(v13);
  if (!CFStringGetCString(PeerName, v14, v13, 0x8000100u)) {
    char *v14 = 0;
  }
  CFRelease(PeerName);
  if (!PeerDeviceType)
  {
LABEL_26:
    uint64_t v17 = strdup("");
    if (!Value) {
      goto LABEL_27;
    }
    goto LABEL_15;
  }

LABEL_12:
  CFRetain(PeerDeviceType);
  CFIndex v15 = CFStringGetLength(PeerDeviceType);
  CFIndex v16 = CFStringGetMaximumSizeForEncoding(v15, 0x8000100u) + 1;
  uint64_t v17 = (char *)malloc(v16);
  if (!CFStringGetCString(PeerDeviceType, v17, v16, 0x8000100u)) {
    *uint64_t v17 = 0;
  }
  CFRelease(PeerDeviceType);
  if (!Value)
  {
LABEL_27:
    uint64_t v20 = strdup("");
    if (!v8) {
      goto LABEL_28;
    }
LABEL_18:
    CFRetain(v8);
    CFIndex v21 = CFStringGetLength(v8);
    CFIndex v22 = CFStringGetMaximumSizeForEncoding(v21, 0x8000100u) + 1;
    id v23 = (char *)malloc(v22);
    if (!CFStringGetCString(v8, v23, v22, 0x8000100u)) {
      *id v23 = 0;
    }
    CFRelease(v8);
    if (!v11) {
      goto LABEL_29;
    }
LABEL_21:
    CFRetain(v11);
    CFIndex v24 = CFStringGetLength(v11);
    CFIndex v25 = CFStringGetMaximumSizeForEncoding(v24, 0x8000100u) + 1;
    __int128 v26 = (char *)malloc(v25);
    if (!CFStringGetCString(v11, v26, v25, 0x8000100u)) {
      *__int128 v26 = 0;
    }
    CFRelease(v11);
    goto LABEL_30;
  }

LABEL_15:
  CFRetain(Value);
  CFIndex v18 = CFStringGetLength(Value);
  CFIndex v19 = CFStringGetMaximumSizeForEncoding(v18, 0x8000100u) + 1;
  uint64_t v20 = (char *)malloc(v19);
  if (!CFStringGetCString(Value, v20, v19, 0x8000100u)) {
    char *v20 = 0;
  }
  CFRelease(Value);
  if (v8) {
    goto LABEL_18;
  }
LABEL_28:
  id v23 = strdup("");
  if (v11) {
    goto LABEL_21;
  }
LABEL_29:
  __int128 v26 = strdup("");
LABEL_30:
  CFTypeRef v27 = *(CFTypeRef *)(a1 + 32);
  if (cf2 && v27) {
    BOOL v28 = CFEqual(v27, cf2) != 0;
  }
  else {
    BOOL v28 = v27 == cf2;
  }
  *(void *)&__int128 v29 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v46 = v29;
  __int128 v47 = v29;
  __int128 v44 = v29;
  __int128 v45 = v29;
  __int128 v42 = v29;
  __int128 v43 = v29;
  __int128 v40 = v29;
  __int128 v41 = v29;
  *(_OWORD *)__str = v29;
  __int128 v39 = v29;
  if (v28) {
    __int128 v30 = "me>";
  }
  else {
    __int128 v30 = "   ";
  }
  snprintf( __str,  0xA0uLL,  "%s %s: %-16s dev:%-16s trn:%-16s devid:%-36s mid: %-36s",  v30,  *(const char **)(a1 + 40),  v14,  v17,  v20,  v23,  v26);
  free(v14);
  free(v17);
  free(v20);
  free(v23);
  free(v26);
  CFStringRef v31 = CFStringCreateWithCString(0LL, __str, 0x8000100u);
  SOSPeerInfoGetPeerID(a2);
  SOSPeerInfoGetVersion(a2);
  SOSPeerInfoSupportsCKKSForAll(a2);
  sub_10000656C(qword_10000C2D0, 0LL, @"%@ pid:%@ V%d %@ OS:%@\n", v32, v33, v34, v35, v36, (char)v31);
  CFRelease(v31);
  if (v7) {
    CFRelease(v7);
  }
}

__CFArray *__cdecl sub_100005BD8(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyValidPeerPeerInfo(a2);
}

void sub_100005BE0(id a1, __CFString *a2)
{
}

uint64_t sub_100005C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = secLogObjForScope("sync");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    uint64_t v16 = a2;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "SOSCloudKeychainGetObjectsFromCloud returned: %@",  (uint8_t *)&v15,  0xCu);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  uint64_t v8 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v8) {
    CFRetain(v8);
  }
  if (a3)
  {
    uint64_t v9 = secLogObjForScope("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "SOSCloudKeychainGetObjectsFromCloud returned error: %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v11 = secLogObjForScope("sync");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "SOSCloudKeychainGetObjectsFromCloud block exit: %@",  (uint8_t *)&v15,  0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005DC4(uint64_t a1, uint64_t a2, const void *a3)
{
  char v4 = a2;
  int KeyType = SOSKVSKeyGetKeyType(a2);
  if (KeyType != *(_DWORD *)(a1 + 40)) {
    return;
  }
  switch(KeyType)
  {
    case 0:
      v86 = 0LL;
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v19 = CFGetTypeID(a3);
      if (v19 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      uint64_t valuePtr = 5LL;
      uint64_t v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
      BOOL v28 = sub_100006270( kCFAllocatorDefault,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)@"SyncD",  (uint64_t)@"SyncD");
      uint64_t v29 = SOSCircleCreateFromData(0LL, a3, &v86);
      sub_10000656C(qword_10000C2D0, v28, @"%@: %@\n", v30, v31, v32, v33, v34, v4);
      if (!v29) {
        goto LABEL_48;
      }
      uint64_t v35 = (const void *)v29;
      goto LABEL_47;
    case 1:
    case 4:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v12 = CFGetTypeID(a3);
      if (v12 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      SecOTRPacketTypeString(a3);
      uint64_t v13 = qword_10000C2D0;
      CFDataGetLength((CFDataRef)a3);
      sub_10000656C(v13, 0LL, @"%@: %s: %ld\n", v14, v15, v16, v17, v18, v4);
      goto LABEL_29;
    case 2:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v36 = CFGetTypeID(a3);
      if (v36 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      uint64_t v37 = sub_100005214((CFDataRef)a3);
      uint64_t v38 = qword_10000C2D0;
      if (!v37) {
        goto LABEL_28;
      }
      sub_10000656C(qword_10000C2D0, 0LL, @"%@: %@\n", v7, v8, v9, v10, v11, v4);
      __int128 v39 = v37;
      goto LABEL_52;
    case 8:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v40 = CFGetTypeID(a3);
      if (v40 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      v86 = 0LL;
      BytePtr = CFDataGetBytePtr((CFDataRef)a3);
      __int128 v42 = CFDataCreate(kCFAllocatorDefault, BytePtr, 18LL);
      CFIndex v43 = CFDataGetLength((CFDataRef)a3) - 18;
      __int128 v44 = CFDataGetBytePtr((CFDataRef)a3);
      __int128 v45 = CFDataCreate(kCFAllocatorDefault, v44 + 18, v43);
      CFStringRef v46 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v42, 0x8000100u);
      __int128 v47 = (const void *)SOSCircleCreateFromData(0LL, v45, &v86);
      if (v47)
      {
        uint64_t valuePtr = 5LL;
        CFNumberRef v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
        v56 = sub_100006270( kCFAllocatorDefault,  v49,  v50,  v51,  v52,  v53,  v54,  v55,  (uint64_t)@"SyncD",  (uint64_t)@"SyncD");
        sub_10000656C(qword_10000C2D0, v56, @"%@: %@: %@\n", v57, v58, v59, v60, v61, v4);
        if (v48) {
          CFRelease(v48);
        }
        if (v56) {
          CFRelease(v56);
        }
      }

      else
      {
        uint64_t v74 = qword_10000C2D0;
        sub_100006360(v45);
        sub_10000656C(v74, 0LL, @"%@: %@\n", v75, v76, v77, v78, v79, v4);
      }

      if (v46) {
        CFRelease(v46);
      }
      if (v45) {
        CFRelease(v45);
      }
      if (v47) {
        CFRelease(v47);
      }
      if (v42) {
        CFRelease(v42);
      }
      __int128 v39 = v86;
      if (!v86) {
        goto LABEL_29;
      }
      v86 = 0LL;
      goto LABEL_52;
    case 9:
      if (!a3)
      {
LABEL_27:
        uint64_t v38 = qword_10000C2D0;
LABEL_28:
        sub_10000656C(v38, 0LL, @"%@: %@\n", v7, v8, v9, v10, v11, v4);
        goto LABEL_29;
      }

      CFTypeID v62 = CFGetTypeID(a3);
      if (v62 != CFDataGetTypeID())
      {
LABEL_25:
        uint64_t v38 = qword_10000C2D0;
        goto LABEL_28;
      }

      v63 = CFDataGetBytePtr((CFDataRef)a3);
      uint64_t v20 = CFDataCreate(kCFAllocatorDefault, v63, 18LL);
      CFIndex v64 = CFDataGetLength((CFDataRef)a3) - 18;
      v65 = CFDataGetBytePtr((CFDataRef)a3);
      v66 = CFDataCreate(kCFAllocatorDefault, v65 + 18, v64);
      CFStringRef v67 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v20, 0x8000100u);
      BOOL v28 = sub_100005214(v66);
      uint64_t v73 = qword_10000C2D0;
      if (v28)
      {
        sub_10000656C(qword_10000C2D0, 0LL, @"%@: %@: %@\n", v68, v69, v70, v71, v72, v4);
      }

      else
      {
        sub_100006360((const __CFData *)a3);
        sub_10000656C(v73, 0LL, @"%@: %@\n", v80, v81, v82, v83, v84, v4);
      }

      if (v67) {
        CFRelease(v67);
      }
      if (v66)
      {
        uint64_t v35 = v66;
LABEL_47:
        CFRelease(v35);
      }

LABEL_48:
      if (v20) {
        CFRelease(v20);
      }
      if (v28)
      {
        __int128 v39 = v28;
LABEL_52:
        CFRelease(v39);
      }

LABEL_29:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      return;
    default:
      goto LABEL_25;
  }

uint64_t sub_100006258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFDictionaryRef sub_100006270( CFAllocatorRef allocator, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  int v22 = &a10;
  unint64_t v11 = 0LL;
  if (a9)
  {
    do
    {
      v11 += 2LL;
      CFTypeID v12 = v22;
      v22 += 2;
    }

    while (v12[1]);
  }

  unint64_t v13 = v11 >> 1;
  int v23 = (const void **)&a9;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( allocator,  v11 >> 1,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0LL;
  }
  uint64_t v15 = Mutable;
  if (v11)
  {
    do
    {
      uint64_t v16 = v23;
      uint64_t v17 = *v23;
      v23 += 2;
      uint64_t v18 = (const __CFNull *)v16[1];
      if (v18) {
        CFNullRef v19 = v18;
      }
      else {
        CFNullRef v19 = kCFNull;
      }
      CFDictionarySetValue(v15, v17, v19);
      --v13;
    }

    while (v13);
  }

  CFDictionaryRef Copy = CFDictionaryCreateCopy(allocator, v15);
  CFRelease(v15);
  return Copy;
}

uint64_t sub_100006360(const __CFData *a1)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  uint64_t v16 = sub_10000651C;
  uint64_t v17 = &unk_1000086B8;
  uint64_t v18 = &v19;
  char v4 = v15;
  uint64_t v5 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, BytePtr, Length, kCFAllocatorNull);
  uint64_t v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    CFIndex v8 = CFDataGetLength(v5);
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * v8);
    uint64_t v10 = CFDataGetBytePtr(v5);
    CFIndex v11 = CFDataGetLength(v5);
    if (v11 >= 1)
    {
      do
      {
        unsigned int v12 = *v10++;
        CFStringAppendFormat(Mutable, 0LL, @"%02X", v12);
        --v11;
      }

      while (v11);
    }

    v16((uint64_t)v7, (uint64_t)Mutable);
    CFRelease(Mutable);

    CFRelease(v5);
  }

  else
  {
    v16((uint64_t)v6, (uint64_t)@"(null)");
    CFRelease(@"(null)");
  }

  uint64_t v13 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_100006500( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

CFStringRef sub_10000651C(uint64_t a1, uint64_t a2)
{
  CFStringRef result = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void sub_10000656C( uint64_t a1, const __CFDictionary *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v13[5] = &a9;
  uint64_t v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, a2, a3, &a9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000LL;
  v13[2] = sub_1000066C4;
  v13[3] = &unk_100008740;
  v13[4] = a1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  v14[2] = sub_100006748;
  v14[3] = &unk_100008790;
  v14[4] = v13;
  CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
  if (CStringPtr)
  {
    strlen(CStringPtr);
    sub_100006748((uint64_t)v14);
  }

  else
  {
    CFIndex usedBufLen = 0LL;
    CFIndex Length = CFStringGetLength(v10);
    v17.location = 0LL;
    v17.length = Length;
    CFStringGetBytes(v10, v17, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000LL;
    void v15[2] = sub_1000066D4;
    v15[3] = &unk_100008768;
    v15[6] = 0LL;
    v15[7] = Length;
    v15[8] = usedBufLen;
    v15[4] = v14;
    v15[5] = v10;
    sub_100006754(usedBufLen + 1, (uint64_t)v15);
  }

  CFRelease(v10);
}

uint64_t sub_1000066C4(uint64_t a1, char *a2)
{
  return fputs(a2, *(FILE **)(a1 + 32));
}

uint64_t sub_1000066D4(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
  }

  return result;
}

uint64_t sub_100006748(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006754(size_t __size, uint64_t a2)
{
  if (__size)
  {
    if (__size > 0x800)
    {
      uint64_t v4 = malloc(__size);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, __size, v4);
      if (v4) {
        free(v4);
      }
    }

    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL), 170, __size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))( a2,  __size,  (char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  }

id objc_msgSend_writeToStdOut(void *a1, const char *a2, ...)
{
  return [a1 writeToStdOut];
}