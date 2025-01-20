void sub_1000045B4(uint64_t a1)
{
  id v1;
  void *v2;
  v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  v2 = (void *)qword_100095A50;
  qword_100095A50 = (uint64_t)v1;
}

id sub_100004988()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  v0 = (void *)qword_100095A60;
  uint64_t v7 = qword_100095A60;
  if (!qword_100095A60)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100005A78;
    v3[3] = &unk_100080CB0;
    v3[4] = &v4;
    sub_100005A78((uint64_t)v3);
    v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004A24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100004AB0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  unsigned __int8 v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

void sub_100004BA4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  unsigned __int8 v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

void sub_100004C98(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0LL;
  unsigned __int8 v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  id v3 = v4;
}

void sub_100004E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100004EAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004EBC(uint64_t a1)
{
}

void sub_100004EC4(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personaAttributesMap]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);

    if (v6)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }

    else
    {
      id v8 = sub_1000130F4( (uint64_t)"-[MIUserManagement isKnownPersonaUniqueString:error:]_block_invoke",  173LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Client provided persona %@ is not among available personas on the system",  v7,  *(void *)(a1 + 40));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

void sub_1000050D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000050F4(void *a1)
{
  unsigned __int8 v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)a1[4];
    uint64_t v6 = (void *)v5[3];
    if (v6)
    {
      id v7 = v6;
      id v8 = (id)objc_claimAutoreleasedReturnValue([v5 personaAttributesMap]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 bundleIDs]);
      uint64_t v11 = *(void *)(a1[6] + 8LL);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }

    else
    {
      id v8 = 0LL;
      v13 = objc_opt_new(&OBJC_CLASS___NSSet);
      uint64_t v14 = *(void *)(a1[6] + 8LL);
      uint64_t v9 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

void sub_1000053EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000541C(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v11 = *(id *)(v3 + 40);
  unsigned __int8 v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &v11);
  objc_storeStrong((id *)(v3 + 40), v11);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personaAttributesMap]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000054F4;
    v8[3] = &unk_100080C60;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }

void sub_1000054F4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v8 = a3;
  if (((unint64_t)[v8 personaType] & 0xFFFFFFFFFFFFFFFBLL) == 2)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIDs]);
    if ([v9 containsObject:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
      *a4 = 1;
    }
  }
}

void sub_1000058B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000058D4(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) personaAttributesMap]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:*(void *)(a1 + 40)]);

    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIDs]);
      id v9 = [v8 copy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }

    else
    {
      id v12 = sub_1000130F4( (uint64_t)"-[MIUserManagement bundleIDsAssociatedWithPersonaUniqueString:error:]_block_invoke",  294LL,  MIInstallerErrorDomain,  4LL,  *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  0LL,  @"Failed to find persona %@ when checking associated bundleIDs for it",  v7,  *(void *)(a1 + 40));
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v8 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }

Class sub_100005A78(uint64_t a1)
{
  uint64_t v3 = 0LL;
  if (!qword_100095A68)
  {
    __int128 v4 = off_100080CD0;
    uint64_t v5 = 0LL;
    qword_100095A68 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_100095A68) {
    sub_10004FFE4(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_100050060();
  }
  qword_100095A60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

LABEL_9:
    uint64_t v15 = v15;
    uint64_t v17 = 0;
    *a4 = v15;
    goto LABEL_14;
  }

  self->_isNew = container_is_new(self->_mcmContainer);
  is_transient = container_is_transient(-[MIMCMContainer mcmContainer](self, "mcmContainer"), &v28);
  if (is_transient != 1)
  {
    v19 = is_transient;
    error_description = container_get_error_description();
    v22 = "(container_get_error_description returned NULL)";
    if (error_description) {
      v22 = (const char *)error_description;
    }
    v23 = sub_1000130C8( (uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]",  141LL,  MIContainerManagerErrorDomain,  v19,  0LL,  0LL,  @"%s",  v21,  (uint64_t)v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);

    uint64_t v15 = (id)v24;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }

  self->_isTransient = v28;
  uint64_t v17 = 1;
LABEL_14:

  return v17;
}

  return v6;
}

    uint64_t v14 = 0LL;
    goto LABEL_10;
  }

  uint64_t v14 = v7;
LABEL_10:

  return v14;
}

  if ((v17 & 1) != 0) {
    sub_10004D608(v18);
  }
  if (v19) {
    v13[2](v13, 0LL);
  }
  else {
    ((void (**)(id, id))v13)[2](v13, v16);
  }
}

  if (a3)
  {
    v18 = v18;
    v29 = 0;
    *a3 = v18;
  }

  else
  {
    v29 = 0;
  }

  uint64_t v13 = (void *)v18[5];
  if (a3 && v13) {
    *a3 = v13;
  }

  _Block_object_dispose(&v17, 8);
  return v13 == 0LL;
}

  return v13;
}

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"UserDataOnly"]);
    uint64_t v15 = [v14 isEqual:&__kCFBooleanTrue];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Placeholder"]);
    v181 = [v17 isEqual:&__kCFBooleanTrue];

    if (v181)
    {
      v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientName]);
        sub_100050E64(v20, v233, v19);
      }

      v21 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v149 = (void *)objc_claimAutoreleasedReturnValue([v22 clientName]);
        v154 = @"Placeholder";
        MOLogWrite(v21);
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options", v149, v154));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"ParallelPlaceholderOnlyIfExists"]);
    HIDWORD(v180) = [v24 isEqual:&__kCFBooleanTrue];

    if (HIDWORD(v180))
    {
      v25 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 clientName]);
        sub_100050DF8(v27, v232, v26);
      }

      v28 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v150 = (void *)objc_claimAutoreleasedReturnValue([v29 clientName]);
        v155 = @"ParallelPlaceholderOnlyIfExists";
        MOLogWrite(v28);
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options", v150, v155));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:kMIUninstallParallelPlaceholderKey]);
    LODWORD(v180) = [v31 isEqual:&__kCFBooleanTrue];

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"]);
    v172 = [v33 isEqual:&__kCFBooleanTrue];

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"WaitForStorageDeletion"]);
    v159 = [v35 isEqual:&__kCFBooleanTrue];

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"UninstallReason"]);
    objc_opt_class(&OBJC_CLASS___NSString);
    v38 = v37;
    if ((objc_opt_isKindOfClass(v38) & 1) != 0) {
      v160 = v38;
    }
    else {
      v160 = 0LL;
    }

    if (v15)
    {
      if ((v181 | v180 | HIDWORD(v180) | v172) == 1)
      {
        v40 = sub_1000130F4( (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]",  492LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Illegal option combination passed to MobileInstallationUninstall. Can't uninstall user stuff only and uninstall placeholders.",  v39,  (uint64_t)v149);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        v169 = 0LL;
        v157 = 0LL;
        __int128 v4 = (void *)v223[5];
        v223[5] = v41;
        goto LABEL_181;
      }

      v180 = 0LL;
      v181 = 0;
      v172 = 0;
      v167 = 1;
    }

    else
    {
      v167 = 0;
    }
  }

  else
  {
    v167 = 0;
    v180 = 0LL;
    v181 = 0;
    v172 = 0;
    v159 = 0;
    v160 = 0LL;
  }

  -[NSMutableSet addObjectsFromArray:](v184, "addObjectsFromArray:", v164);
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  v185 = v164;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v213,  v231,  16LL);
  if (v42)
  {
    v43 = *(void *)v214;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v214 != v43) {
          objc_enumerationMutation(v185);
        }
        v45 = *(void **)(*((void *)&v213 + 1) + 8LL * (void)i);
        v212 = 0LL;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "childrenForParentBundleID:error:", v45, &v212, v149));
        v47 = (__CFString *)v212;
        v48 = v47;
        if (v46)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v175, "setObject:forKeyedSubscript:", v46, v45);
          -[NSMutableSet unionSet:](v184, "unionSet:", v46);
        }

        else if (v47 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
        {
          v151 = v45;
          v154 = v47;
          MOLogWrite(qword_100095BF8);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  2LL,  v151,  v154));
        v211 = 0LL;
        v210 = 0LL;
        v50 = [v49 getLinkedParent:&v211 forChild:v45 error:&v210];
        v51 = v211;
        v52 = (__CFString *)v210;

        if (v51) {
          v53 = v50;
        }
        else {
          v53 = 0;
        }
        if (v53 == 1)
        {
          -[NSMutableSet addObject:](v184, "addObject:", v51);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v174, "setObject:forKeyedSubscript:", v51, v45);
        }

        else if (v52 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
        {
          v149 = v45;
          v154 = v52;
          MOLogWrite(qword_100095BF8);
        }
      }

      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v185,  "countByEnumeratingWithState:objects:count:",  &v213,  v231,  16LL);
    }

    while (v42);
  }

  v157 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v184, "allObjects"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  v169 = (void *)objc_claimAutoreleasedReturnValue([v54 builtInApplicationBundleIDs]);

  sub_10004D4EC(v157);
  -[MIUninstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"RemovingApplication",  50LL);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  v56 = [v55 allowDeletableSystemApps];

  if ((v56 & 1) != 0)
  {
    v163 = 0LL;
  }

  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    v163 = (void *)objc_claimAutoreleasedReturnValue([v57 systemAppPlaceholderBundleIDs]);
  }

  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller identities](self, "identities", v149));
  v59 = [v58 countByEnumeratingWithState:&v206 objects:v230 count:16];
  if (v59)
  {
    v60 = v180 | HIDWORD(v180) | v172;
    v178 = v60 | v181;
    v179 = *(void *)v207;
    v61 = 11LL;
    if (v167) {
      v61 = 12LL;
    }
    v177 = v61;
    v168 = MIContainerManagerErrorDomain;
    v176 = v181 ^ 1;
    v170 = (v181 ^ 1) & v60;
    v158 = MIInstallerErrorDomain;
    v173 = v58;
    do
    {
      v182 = v59;
      for (j = 0LL; j != v182; j = (char *)j + 1)
      {
        if (*(void *)v207 != v179) {
          objc_enumerationMutation(v173);
        }
        v63 = *(void **)(*((void *)&v206 + 1) + 8LL * (void)j);
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[MIAppReferenceManager defaultManager]( &OBJC_CLASS___MIAppReferenceManager,  "defaultManager",  v152));
        v65 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleID]);
        v66 = [v64 personaUniqueStringsForAppWithBundleID:v65 domain:2 forUserWithID:sub_10000D79C() error:0];
        v186 = (id)objc_claimAutoreleasedReturnValue(v66);

        if (v186 && [v186 count])
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleID]);
          -[NSMutableSet addObject:](v171, "addObject:", v67);
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue([v63 personaUniqueString]);
        v71 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleID]);
        if (v178)
        {
          v72 = +[ICLFeatureFlags appReferencesEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "appReferencesEnabled");
          v73 = (id *)(v223 + 5);
          if (v72)
          {
            v205 = (id)v223[5];
            v74 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v71,  3LL,  &v205));
            objc_storeStrong(v73, v205);
            if (!v74)
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue([(id)v223[5] domain]);
              if ([v75 isEqualToString:v168])
              {
                v76 = [(id)v223[5] code] == (id)21;

                if (v76)
                {
                  v77 = (void *)v223[5];
                  v223[5] = 0LL;

                  v73 = (id *)(v223 + 5);
                  v204 = (void *)v223[5];
                  v74 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v71,  2LL,  &v204));
                  v78 = v204;
                  goto LABEL_75;
                }
              }

              else
              {
              }

              goto LABEL_96;
            }

  return v15;
}

  return v13;
}

LABEL_23:
    uint64_t v16 = 0;
    goto LABEL_24;
  }

  v55 = 0LL;
  uint64_t v16 = -[MIMCMContainer _doInitWithContainer:error:](v10, "_doInitWithContainer:error:", single_result, &v55);
  uint64_t v17 = v55;
LABEL_24:
  container_free_object(v13, v9);
  container_query_free(v14);
  if (a5 && (v16 & 1) == 0) {
    *a5 = v17;
  }

  return v10;
}

  v32 = 0LL;
LABEL_24:
  if (qword_100095B28 != -1) {
    dispatch_once(&qword_100095B28, &stru_100081480);
  }
  v33 = (os_log_s *)qword_100095B20;
  if (os_signpost_enabled((os_log_t)qword_100095B20))
  {
    v36 = "failed";
    if ((_DWORD)v32) {
      v36 = "succeeded";
    }
    *(_DWORD *)buf = 136315138;
    v70 = v36;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "InstallStagedUpdate",  "End staging update installation [%s]",  buf,  0xCu);
  }

  _MILogTransactionStep(14LL, 2LL, v32, v7, v10, 0LL, v34, v35, v45);
  if ((v32 & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
      sub_10004D608(v38);

      -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
    }

    if (!-[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      [v39 releaseTerminationAssertion];
    }

    if (v14)
    {
      v51 = 0LL;
      v40 = [v11 purgeJournalEntry:v14 withError:&v51];
      v41 = v51;
    }

    else
    {
      v41 = 0LL;
    }

    if (a4) {
      *a4 = v64[5];
    }
  }

  _Block_object_dispose(&v63, 8);
  return v32;
}

  v25 = v19 ^ 1;
  if (a4 == 2) {
    v25 = 1;
  }
  if ((v25 & 1) != 0)
  {
    if (a4 == 2) {
      v33 = v19;
    }
    else {
      v33 = 1;
    }
    if ((v33 & 1) != 0) {
      goto LABEL_31;
    }
    v35 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1456LL,  MIInstallerErrorDomain,  169LL,  0LL,  &off_10008AE30,  @"App %@ with the %@ entitlement set to a value prefixed by swift-playgrounds did not specify a linkage to the Swift Playgrounds app.",  v16,  (uint64_t)v13);
LABEL_41:
    v32 = objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_42;
  }

  v26 = (void *)MIInstallerErrorDomain;
  v27 = (uint64_t)v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 entitlements]);
  v29 = sub_1000459A8(v28);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1453LL,  v26,  168LL,  0LL,  &off_10008AE08,  @"App %@ linked to Swift Playgrounds did not have the %@ entitlement set to a value prefixed by swift-playgrounds (found %@).",  v30,  v27);
  v32 = objc_claimAutoreleasedReturnValue(v31);

  uint64_t v17 = v28;
  uint64_t v13 = (void *)v27;
LABEL_42:
  a5 = v40;

  uint64_t v17 = (id)v32;
LABEL_43:
  if (a5)
  {
    uint64_t v17 = v17;
    v34 = 0;
    *a5 = v17;
  }

  else
  {
    v34 = 0;
  }

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      v38 = [v10 countByEnumeratingWithState:&v46 objects:v56 count:16];
      id v12 = v38;
    }

    while (v38);
  }

  *a4 = -[NSMutableSet copy](v7, "copy");
  *a5 = -[NSMutableSet copy](v8, "copy");
  *a6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v9, "allValues"));
}

              v24 = v43;
              if (v43)
              {
                while (1)
                {
                  v25 = v24 >= 0x10000 ? 0x10000LL : v24;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))( a5,  2LL,  v18,  v25,  v20) != v25) {
                    goto LABEL_60;
                  }
                  v20 += v25;
                  v24 -= v25;
                  if (!v24) {
                    goto LABEL_30;
                  }
                }

                v40 = qword_100095BF8;
                goto LABEL_72;
              }

id sub_100006150()
{
  uint64_t path = container_error_get_path();
  if (path) {
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFileSystemRepresentation:]( &OBJC_CLASS___NSString,  "stringWithFileSystemRepresentation:",  path));
  }
  else {
    id v1 = @"Failed to read container error path";
  }
  NSErrorUserInfoKey v4 = NSFilePathErrorKey;
  uint64_t v5 = v1;
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

__CFString *sub_100006344()
{
  v0 = (void *)container_copy_unlocalized_description();
  if (v0) {
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
  }
  else {
    id v1 = @"<No container description>";
  }
  free(v0);
  return v1;
}

LABEL_15:
  return v17;
}
  }
}

  if ((-[NSMutableArray containsObject:](v16, "containsObject:", v10, v35) & 1) == 0)
  {
    v37 = a6;
    -[NSMutableArray addObject:](v16, "addObject:", v10);
    v25 = -[NSMutableArray copy](v16, "copy");
    -[MIAppReferenceMetadata setPersonas:](v12, "setPersonas:", v25);

    v38 = v14;
    LOBYTE(v25) = -[MIAppReferenceMetadata serializeToURL:error:](v12, "serializeToURL:error:", v9, &v38);
    v23 = v38;

    if ((v25 & 1) != 0)
    {
      uint64_t v14 = v23;
      goto LABEL_18;
    }

    v33 = qword_100095BF8;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
LABEL_32:
      uint64_t v14 = v23;
      if (v37)
      {
        uint64_t v14 = v23;
        v26 = 0;
        *v37 = v14;
      }

      else
      {
        v26 = 0;
      }

      goto LABEL_35;
    }

    v20 = (id)objc_claimAutoreleasedReturnValue([v9 path]);
    MOLogWrite(v33);
LABEL_31:

    goto LABEL_32;
  }

LABEL_17:
  return v11;
}

  return v17;
}

  v31 = v13;

  return v31;
}

    v24 = 0LL;
    v23 = v17;
    goto LABEL_18;
  }

  v40 = v17;
  v19 = (void *)v13;
  v22 = [v16 itemIsFileAtURL:v13 error:&v40];
  v23 = v40;

  if (v22)
  {
    *a5 = 2;
    v18 = v19;
    goto LABEL_15;
  }

  *a5 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v23 domain]);
  if (([v28 isEqualToString:NSPOSIXErrorDomain] & 1) == 0)
  {

LABEL_32:
    goto LABEL_33;
  }

  v37 = [v23 code];

  if (v37 != (id)2)
  {
LABEL_33:
    v29 = (void *)objc_claimAutoreleasedReturnValue([v21 domain]);
    if ([v29 isEqualToString:NSPOSIXErrorDomain])
    {
      v30 = [v21 code];

      if (v30 == (id)2) {
        v31 = v23;
      }
      else {
        v31 = v21;
      }
      if (v30 == (id)2) {
        v32 = v19;
      }
      else {
        v32 = v39;
      }
    }

    else
    {

      v31 = v21;
      v32 = v39;
    }

    v33 = v31;
    v34 = v32;
    v36 = sub_1000130F4( (uint64_t)"-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]",  400LL,  MIInstallerErrorDomain,  8LL,  v33,  &off_10008AA20,  @"Failed to determine if patch URL %@ for application %@ exists. Failing.",  v35,  (uint64_t)v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v18 = 0LL;
LABEL_18:
    v25 = a6;
    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if (!qword_100095BF8)
  {
    v18 = 0LL;
LABEL_15:
    v24 = 0LL;
    goto LABEL_18;
  }

  v25 = a6;
  v18 = 0LL;
  v24 = 0LL;
  if (a6)
  {
LABEL_19:
    if (!v18) {
      *v25 = v24;
    }
  }

    v51 = 0LL;
    goto LABEL_16;
  }

  if (!a13) {
    goto LABEL_17;
  }
  v53 = (void *)MIInstallerErrorDomain;
  v54 = @"No manifest supplied for patch update.";
  v55 = 53LL;
LABEL_13:
  v56 = sub_1000130F4( (uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions: manifestURL:existingBundleContainer:patchType:operationType:error:]",  v55,  v53,  4LL,  0LL,  0LL,  v54,  v21,  (uint64_t)a10);
  v51 = 0LL;
  *a13 = (id)objc_claimAutoreleasedReturnValue(v56);
LABEL_16:

  return v51;
}

  if (v9)
  {
    if (a4 != 1 || v15) {
      goto LABEL_23;
    }
LABEL_31:
    v34 = 1;
    goto LABEL_46;
  }

  if (v14 != (id)5) {
    goto LABEL_31;
  }
  if ((v11 & 1) == 0)
  {
    if (a4 == 1 && !v15)
    {
      v35 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1434LL,  MIInstallerErrorDomain,  170LL,  0LL,  &off_10008AD90,  @"App %@ was signed with a local key but did not specify either the %@ entitlement or a linked parent bundle ID.",  v16,  (uint64_t)v13);
      goto LABEL_41;
    }

    if (!v15)
    {
      v35 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1437LL,  MIInstallerErrorDomain,  196LL,  0LL,  &off_10008ADB8,  @"App %@ was signed with a local key but did not have linked parent bundle ID specified.",  v16,  (uint64_t)v13);
      goto LABEL_41;
    }

    if (a4 == 1)
    {
      v35 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateLinkedParentForSigningInfo:appManagementDomainValue:error:]",  1440LL,  MIInstallerErrorDomain,  197LL,  0LL,  &off_10008ADE0,  @"App %@ was signed with a local key but did not have the %@ entitlement.",  v16,  (uint64_t)v13);
      goto LABEL_41;
    }
  }

  return v19;
}

    uint64_t v7 = 0;
  }

  return v15;
}

LABEL_11:
  return v14;
}

  return v16;
}

  return v17;
}

  v24 = v88;
LABEL_12:
  v25 = v22;
  v112 = v22;
  v88 = v24;
  v26 = objc_claimAutoreleasedReturnValue( +[MIContainer allContainersForIdentifier:persona:options:error:]( &OBJC_CLASS___MIContainer,  "allContainersForIdentifier:persona:options:error:",  v19));
  v22 = v22;

  if (!v26) {
    goto LABEL_34;
  }
  -[NSMutableArray addObjectsFromArray:](v92, "addObjectsFromArray:", v26);
  v83 = v18;
  v84 = v16;
  v90 = v17;
  v87 = (void *)v26;
  v85 = v19;
  if ([v17 count])
  {
    v27 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    id obj = v17;
    v28 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
    if (v28)
    {
      v29 = v28;
      v30 = *(void *)v109;
      v95 = MIContainerManagerErrorDomain;
      v31 = v88;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          v33 = v22;
          if (*(void *)v109 != v30) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)i);
          v107 = v22;
          v35 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainer allContainersForIdentifier:persona:options:error:]( &OBJC_CLASS___MIContainer,  "allContainersForIdentifier:persona:options:error:",  v34,  v31,  v23,  &v107,  v79,  v81));
          v22 = v107;

          if (v35)
          {
LABEL_20:
            -[NSMutableArray addObjectsFromArray:](v92, "addObjectsFromArray:", v35);
            -[NSMutableSet addObject:](v27, "addObject:", v34);
            goto LABEL_28;
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet domain](v22, "domain"));
          if ([v36 isEqualToString:v95])
          {
            v37 = -[NSMutableSet code](v22, "code");

            v38 = v37 == (id)21;
            v31 = v88;
            if (v38) {
              goto LABEL_20;
            }
          }

          else
          {
          }

          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            v79 = v34;
            v81 = v22;
            MOLogWrite(qword_100095BF8);
          }

  return v20;
}

  if (!v17) {
    *a5 = v11;
  }
LABEL_13:
  v20 = v17;

  return v20;
}

LABEL_36:
  container_query_free(v19);
  v53 = (id)v70[5];
  _Block_object_dispose(&v69, 8);

  return v53;
}

void sub_10000736C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

uint64_t sub_1000073C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000073D4(uint64_t a1)
{
}

uint64_t sub_1000073DC(void *a1, uint64_t a2)
{
  NSErrorUserInfoKey v4 = objc_autoreleasePoolPush();
  id v5 = objc_alloc((Class)objc_opt_class(a1[6]));
  id v14 = 0LL;
  id v6 = [v5 initWithContainer:a2 error:&v14];
  id v7 = v14;
  id v8 = v14;
  if (v6)
  {
    uint64_t v9 = (*(uint64_t (**)(void))(a1[4] + 16LL))();
  }

  else
  {
    uint64_t v10 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v11 = sub_100006344();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
      MOLogWrite(v10);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v7);
    uint64_t v9 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100007704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000771C(uint64_t a1, uint64_t a2)
{
  return 1LL;
}

uint64_t sub_1000082AC( char *a1, const char *a2, const char *a3, const char *a4, const char *a5, const void *a6, uint64_t a7, const __CFArray *a8, void *a9, CFErrorRef *a10)
{
  v238[0] = a1;
  v238[1] = 0LL;
  uint64_t v17 = fts_open_b(v238, 85, &stru_100080D58);
  if (!v17)
  {
    v32 = __error();
    strerror(*v32);
    CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  746,  v33,  v34,  0LL,  v35,  @"fts_open of %s failed: %s",  v36,  (char)a1);
    goto LABEL_24;
  }

  v18 = v17;
  if (!a3)
  {
    bzero(__str, 0x400uLL);
    if ((unint64_t)__strlcpy_chk(__str, a2, 1024LL, 1024LL) < 0x400)
    {
      LOWORD(v235.st_dev) = 0;
      cf[0] = 0LL;
      if ((sub_100009C0C(__str, v241, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
      {
        CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  786,  v46,  v47,  cf[0],  v48,  @"Failed to realpath parent of %s",  v49,  (char)__str);
        CFErrorRef v55 = (CFErrorRef)cf[0];
        if (cf[0]) {
LABEL_22:
        }
          CFRelease(v55);
LABEL_23:
        fts_close(v18);
        goto LABEL_24;
      }

      if (!LOWORD(v235.st_dev) || (v235.st_dev & 0xF000) == 0x4000)
      {
        v234 = 0LL;
        BOOL v75 = 0LL;
        goto LABEL_41;
      }

      CFErrorRef v45 = sub_100009828( "hardlink_copy_hierarchy",  792,  v46,  v47,  0LL,  v48,  @"Entity exists at %s but it's not a directory",  v49,  (char)v241);
LABEL_14:
      CFErrorRef v37 = v45;
      goto LABEL_23;
    }

    v42 = @"Destination path was too long";
    int v43 = 779;
LABEL_13:
    CFErrorRef v45 = sub_100009828("hardlink_copy_hierarchy", v43, v38, v39, 0LL, v40, v42, v41, (char)fts_path);
    goto LABEL_14;
  }

  if (!realpath_DARWIN_EXTSN(a2, v241))
  {
    v44 = __error();
    strerror(*v44);
    LOBYTE(fts_path) = (_BYTE)a2;
    v42 = @"realpath of '%s' failed at element '%s': %s";
    int v43 = 752;
    goto LABEL_13;
  }

  memset(&v235, 0, sizeof(v235));
  int v19 = open(a3, 256);
  if (v19 < 0)
  {
    v50 = __error();
    strerror(*v50);
    CFErrorRef v27 = sub_100009828("open_delta_manifest", 416, v51, v52, 0LL, v53, @"Could not open %s: %s", v54, (char)a3);
    goto LABEL_20;
  }

  int v20 = v19;
  if (fstat(v19, &v235))
  {
    v21 = __error();
    strerror(*v21);
    CFErrorRef v26 = sub_100009828("open_delta_manifest", 421, v22, v23, 0LL, v24, @"Could not stat %s: %s", v25, (char)a3);
LABEL_7:
    CFErrorRef v27 = v26;
    goto LABEL_8;
  }

  v57 = mmap(0LL, v235.st_size, 1, 1026, v20, 0LL);
  if (v57 == (void *)-1LL)
  {
    v143 = __error();
    strerror(*v143);
    CFErrorRef v26 = sub_100009828( "open_delta_manifest",  435,  v144,  v145,  0LL,  v146,  @"Failed to map file at %s; error %s",
            v147,
            (char)a3);
    goto LABEL_7;
  }

  v58 = v57;
  if (madvise(v57, v235.st_size, 2))
  {
    uint64_t v59 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      v60 = __error();
      LOBYTE(fts_path) = strerror(*v60);
      MOLogWrite(v59);
    }
  }

  v61 = calloc(1uLL, 0x18uLL);
  if (!v61)
  {
    CFErrorRef v27 = sub_100009828( "open_delta_manifest",  446,  v62,  v63,  0LL,  v64,  @"Failed to allocate command stream object",  v65,  (char)fts_path);
    munmap(v58, v235.st_size);
    goto LABEL_8;
  }

  void *v61 = v58;
  v61[1] = v235.st_size;
  v61[2] = 0LL;
  __int128 v310 = 0u;
  __int128 v309 = 0u;
  __int128 v308 = 0u;
  __int128 v307 = 0u;
  __int128 v306 = 0u;
  __int128 v305 = 0u;
  __int128 v304 = 0u;
  __int128 v303 = 0u;
  __int128 v302 = 0u;
  __int128 v301 = 0u;
  __int128 v300 = 0u;
  __int128 v299 = 0u;
  __int128 v298 = 0u;
  __int128 v297 = 0u;
  __int128 v296 = 0u;
  __int128 v295 = 0u;
  __int128 v294 = 0u;
  __int128 v293 = 0u;
  __int128 v292 = 0u;
  __int128 v291 = 0u;
  __int128 v290 = 0u;
  __int128 v289 = 0u;
  __int128 v288 = 0u;
  __int128 v287 = 0u;
  __int128 v286 = 0u;
  __int128 v285 = 0u;
  __int128 v284 = 0u;
  __int128 v283 = 0u;
  __int128 v282 = 0u;
  __int128 v281 = 0u;
  __int128 v280 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v278 = 0u;
  __int128 v277 = 0u;
  __int128 v276 = 0u;
  __int128 v275 = 0u;
  __int128 v274 = 0u;
  __int128 v273 = 0u;
  __int128 v272 = 0u;
  __int128 v271 = 0u;
  __int128 v270 = 0u;
  __int128 v269 = 0u;
  __int128 v268 = 0u;
  __int128 v267 = 0u;
  __int128 v266 = 0u;
  __int128 v265 = 0u;
  __int128 v264 = 0u;
  __int128 v263 = 0u;
  __int128 v262 = 0u;
  __int128 v261 = 0u;
  __int128 v260 = 0u;
  __int128 v259 = 0u;
  __int128 v258 = 0u;
  __int128 v257 = 0u;
  __int128 v256 = 0u;
  __int128 v255 = 0u;
  __int128 v254 = 0u;
  __int128 v253 = 0u;
  __int128 v252 = 0u;
  __int128 v251 = 0u;
  __int128 v250 = 0u;
  __int128 v249 = 0u;
  __int128 v248 = 0u;
  *(_OWORD *)cf = 0u;
  __int16 v237 = 0;
  int v236 = 0;
  __int16 v246 = 0;
  *(void *)v245 = 0LL;
  v234 = v61;
  if ((sub_100009F28(v61, 0, (uint64_t)&v236, 6uLL) & 1) == 0)
  {
    v148 = @"Failed to read magic";
    int v149 = 299;
    goto LABEL_146;
  }

  if (v236 ^ 0x44617069 | v237)
  {
    CFErrorRef v70 = sub_100009828( "validate_stream",  305,  v66,  v67,  0LL,  v68,  @"Stream had invalid magic: %s",  v69,  (char)&v236);
LABEL_147:
    CFErrorRef v150 = v70;
    goto LABEL_148;
  }

  if ((sub_100009F28(v234, 0, (uint64_t)v245, 0xAuLL) & 1) == 0)
  {
    v148 = @"Failed to read version from manifest header";
    int v149 = 310;
    goto LABEL_146;
  }

  uint64_t v155 = strtol(v245, 0LL, 10);
  uint64_t v160 = v155;
  if ((unint64_t)(v155 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    CFErrorRef v70 = sub_100009828( "validate_stream",  318,  v156,  v157,  0LL,  v158,  @"Manifest had invalid version: %ld; expected 1, 2, or 3",
            v159,
            v155);
    goto LABEL_147;
  }

  if ((sub_100009F28(v234, 0, (uint64_t)__str, 0x200uLL) & 1) == 0)
  {
    v148 = @"Failed to read manifest source version";
    int v149 = 323;
    goto LABEL_146;
  }

  uint64_t cStr = v160;
  if (a4) {
    v163 = a5;
  }
  else {
    v163 = "";
  }
  if (a4) {
    v164 = a4;
  }
  else {
    v164 = "0";
  }
  if (a4) {
    v165 = " ";
  }
  else {
    v165 = "";
  }
  if (v163) {
    v166 = v163;
  }
  else {
    v166 = "";
  }
  if (snprintf((char *)cf, 0x200uLL, "%s%s%s", v164, v165, v166) > 0x1FF)
  {
    CFErrorRef v70 = sub_100009828( "validate_stream",  350,  v167,  v168,  0LL,  v169,  @"Incoming expected source version string %s%s%s was too long",  v170,  (char)v164);
    goto LABEL_147;
  }

  v191 = cf;
  v151 = v234;
  while (*(_BYTE *)v191 == 10)
  {
    *(_BYTE *)v191 = 32;
LABEL_219:
    v191 = (CFTypeRef *)((char *)v191 + 1);
  }

  if (*(_BYTE *)v191) {
    goto LABEL_219;
  }
  if (strcmp((const char *)cf, __str))
  {
    CFErrorRef v150 = sub_100009828( "validate_stream",  357,  v193,  v194,  0LL,  v195,  @"Got manifest for version %s, but expected version %s",  v196,  (char)__str);
LABEL_149:
    CFErrorRef v27 = sub_100009828( "open_delta_manifest",  456,  v71,  v72,  v150,  v73,  @"Invalid manifest file at %s",  v74,  (char)a3);
    if (v150) {
      CFRelease(v150);
    }
    munmap(v58, v235.st_size);
    free(v151);
LABEL_8:
    close(v20);
LABEL_20:
    CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  758,  v28,  v29,  v27,  v30,  @"Failed to open manifest %s",  v31,  (char)a3);
    if (v27)
    {
      CFErrorRef v55 = v27;
      goto LABEL_22;
    }

    goto LABEL_23;
  }

  if (cStr < 2) {
    goto LABEL_242;
  }
  char v244 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!sub_100009F28(v234, 0, (uint64_t)__s2, 0x41uLL))
  {
    v148 = @"Failed to read stream";
    int v149 = 375;
LABEL_146:
    CFErrorRef v70 = sub_100009828("validate_stream", v149, v66, v67, 0LL, v68, v148, v69, (char)fts_path);
    goto LABEL_147;
  }

  if (!a6)
  {
    v148 = @"expected_infoplisthash is NULL";
    int v149 = 371;
    goto LABEL_146;
  }

  if (memcmp(a6, __s2, 0x41uLL))
  {
    v148 = @"Compare of info plist hash failed";
    int v149 = 367;
    goto LABEL_146;
  }

  v151 = v234;
  if ((unint64_t)cStr >= 3)
  {
    *(void *)&__s2[0] = 0LL;
    if ((sub_100009F9C(v234, a8, (CFErrorRef *)__s2) & 1) != 0)
    {
      v151 = v234;
      goto LABEL_242;
    }

    CFErrorRef v150 = sub_100009828( "validate_stream",  384,  v219,  v220,  *(const void **)&__s2[0],  v221,  @"Failed to validate supported devices",  v222,  (char)fts_path);
    if (*(void *)&__s2[0]) {
      CFRelease(*(CFTypeRef *)&__s2[0]);
    }
LABEL_148:
    v151 = v234;
    goto LABEL_149;
  }

LABEL_242:
  close(v20);
  *(void *)__str = 0LL;
  if ((sub_1000099B0(v151, &v239, (CFErrorRef *)__str, v223, v224, v225, v226, v227) & 1) == 0)
  {
    CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  765,  v228,  v229,  *(const void **)__str,  v230,  @"Failed to read first manifest command",  v231,  (char)fts_path);
    if (*(void *)__str) {
      CFRelease(*(CFTypeRef *)__str);
    }
    goto LABEL_168;
  }

  BOOL v75 = v239 != 120;
LABEL_41:
  size_t v76 = strlen(a1);
  v77 = fts_read(v18);
  if (!v77)
  {
    uint64_t v85 = 0LL;
LABEL_153:
    if (!a3 || v239 == 120)
    {
      v132 = (void **)v234;
      CFErrorRef v37 = 0LL;
      if (a9) {
        *a9 = v85 << 9;
      }
      char v154 = 1;
      goto LABEL_225;
    }

    v152 = @"Got done processing bundle but there were still commands remaining in manifest.";
    int v153 = 1110;
LABEL_166:
    CFErrorRef v142 = sub_100009828("hardlink_copy_hierarchy", v153, v78, v79, 0LL, v81, v152, v83, (char)fts_path);
    goto LABEL_167;
  }

  v84 = v77;
  uint64_t v85 = 0LL;
  while (2)
  {
    __new[0] = 0;
    unsigned int fts_info = v84->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v91 = 0LL;
      int v92 = 0;
    }

    else
    {
      v88 = &v84->fts_path[v76];
      int v90 = *v88;
      v89 = v88 + 1;
      if (v90 == 47) {
        v91 = v89;
      }
      else {
        v91 = &v84->fts_path[v76];
      }
      if (fts_info != 6 && v75 && !sub_10000971C(v240, v91))
      {
        if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
        {
          LOBYTE(fts_path) = v239;
          MOLogWrite(qword_100095BF8);
        }

        int v92 = 1;
      }

      else
      {
        int v92 = 0;
      }

      unsigned int fts_info = v84->fts_info;
    }

    switch(fts_info)
    {
      case 1u:
        if (v92 && (v239 == 45 || v239 == 43))
        {
          if (!fts_set(v18, v84, 4))
          {
            if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v91;
              MOLogWrite(qword_100095BF8);
            }

LABEL_125:
            *(void *)__str = 0LL;
            v132 = (void **)v234;
            if ((sub_1000099B0(v234, &v239, (CFErrorRef *)__str, v79, v80, v81, v82, v83) & 1) != 0)
            {
              if (v239 == 120)
              {
                BOOL v75 = 0LL;
              }

              goto LABEL_131;
            }

            CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  1094,  v133,  v134,  *(const void **)__str,  v135,  @"Failed to read next manifest command",  v136,  (char)fts_path);
            CFTypeRef v161 = *(CFTypeRef *)__str;
            if (!*(void *)__str) {
              goto LABEL_224;
            }
LABEL_211:
            CFRelease(v161);
            goto LABEL_224;
          }

          v203 = __error();
          strerror(*v203);
          CFErrorRef v142 = sub_100009828( "hardlink_copy_hierarchy",  1012,  v204,  v205,  0LL,  v206,  @"Failed to skip directory %s: %s",  v207,  (char)v91);
          goto LABEL_167;
        }

        LOWORD(cf[0]) = 0;
        *(void *)__str = 0LL;
        if ((sub_100009DB8(v241, v91, __new, (mode_t *)cf, (CFErrorRef *)__str) & 1) == 0)
        {
          CFErrorRef v190 = sub_100009828( "hardlink_copy_hierarchy",  1023,  v121,  v79,  *(const void **)__str,  v81,  @"Failed to make dest path for directory %s",  v83,  (char)v91);
LABEL_209:
          CFErrorRef v37 = v190;
          CFTypeRef v161 = *(CFTypeRef *)__str;
LABEL_210:
          v132 = (void **)v234;
          if (!v161) {
            goto LABEL_224;
          }
          goto LABEL_211;
        }

        if (LOWORD(cf[0]) && ((uint64_t)cf[0] & 0xF000) != 0x4000)
        {
          CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  1030,  v121,  v79,  0LL,  v81,  @"Non-directory entity with mode 0%o exists at directory location in dest path %s",  v83,  (char)cf[0]);
          goto LABEL_223;
        }

        if (LOWORD(cf[0]))
        {
          if (LOWORD(cf[0]) != (v84->fts_statp->st_mode | 0x80) && chmod(__new, v84->fts_statp->st_mode | 0x80))
          {
            v213 = __error();
            strerror(*v213);
            CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  1043,  v214,  v215,  0LL,  v216,  @"Failed to make destination directory %s writable: %s",  v217,  (char)__new);
            goto LABEL_223;
          }
        }

        else
        {
          if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
          {
            fts_uint64_t path = __new;
            MOLogWrite(qword_100095BF8);
          }

          if (mkdir(__new, v84->fts_statp->st_mode | 0x80))
          {
            v208 = __error();
            strerror(*v208);
            CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  1038,  v209,  v210,  0LL,  v211,  @"mkdir of '%s' failed: %s",  v212,  (char)__new);
            goto LABEL_223;
          }
        }

        goto LABEL_124;
      case 3u:
      case 8u:
        if (v239 == 94) {
          int v93 = v92;
        }
        else {
          int v93 = 0;
        }
        if (v93 != 1)
        {
          if (v92 && (v239 == 45 || v239 == 43))
          {
            if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v91;
              MOLogWrite(qword_100095BF8);
            }
          }

          else
          {
            LOWORD(cf[0]) = 0;
            *(void *)__str = 0LL;
            if ((sub_100009DB8(v241, v91, __new, (mode_t *)cf, (CFErrorRef *)__str) & 1) == 0)
            {
              CFErrorRef v190 = sub_100009828( "hardlink_copy_hierarchy",  975,  v122,  v123,  *(const void **)__str,  v124,  @"Failed to make dest path for file %s",  v125,  (char)v91);
              goto LABEL_209;
            }

            if (LOWORD(cf[0]))
            {
              CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  982,  v122,  v123,  0LL,  v124,  @"Entity with mode 0%o exists at file location in dest path %s",  v125,  (char)cf[0]);
              goto LABEL_223;
            }

            if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
            {
              fts_uint64_t path = v84->fts_path;
              MOLogWrite(qword_100095BF8);
            }

            if (link(v84->fts_path, __new))
            {
              uint64_t v126 = qword_100095BF8;
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                BOOL v127 = v75;
                v128 = v84->fts_path;
                v129 = __error();
                strerror(*v129);
                LOBYTE(fts_path) = (_BYTE)v128;
                BOOL v75 = v127;
                MOLogWrite(v126);
              }

              if (copyfile(v84->fts_path, __new, 0LL, 0xC000Fu))
              {
                v197 = v84->fts_path;
                v198 = __error();
                strerror(*v198);
                CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  991,  v199,  v200,  0LL,  v201,  @"copyfile of %s to %s failed: %s",  v202,  (char)v197);
                goto LABEL_223;
              }
            }
          }

          goto LABEL_123;
        }

        int v94 = v92;
        LOWORD(v235.st_dev) = 0;
        bzero(__str, 0x400uLL);
        cf[0] = 0LL;
        if ((sub_100009DB8(v241, v91, __new, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  882,  v95,  v96,  cf[0],  v97,  @"Failed to make dest path for file %s",  v98,  (char)v91);
          v132 = (void **)v234;
          if (cf[0]) {
            CFRelease(cf[0]);
          }
          int v162 = -1;
          goto LABEL_205;
        }

        BOOL v99 = v75;
        mode_t st_dev = v235.st_dev;
        if (LOWORD(v235.st_dev))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", __new) >= 0x400)
          {
            CFErrorRef v173 = sub_100009828( "hardlink_copy_hierarchy",  894,  v101,  v102,  0LL,  v103,  @"failed to make newfile path: %s.XXXXXXX",  v104,  (char)__new);
          }

          else
          {
            int v105 = mkstemp(__str);
            if (v105 != -1)
            {
              int v106 = v105;
              v107 = v84->fts_path;
              if (sub_10004CDB8(v107, __new, v105))
              {
                int v162 = v106;
                CFErrorRef v179 = sub_100009828( "hardlink_copy_hierarchy",  934,  v108,  v109,  0LL,  v110,  @"patch_file failed for:\n\t%s\n\t%s\n\t%s",  v111,  (char)v107);
              }

              else
              {
                if (!fchmod(v106, st_dev))
                {
                  close(v106);
                  if (!rename(__str, __new))
                  {
                    BOOL v75 = v99;
                    int v92 = v94;
LABEL_123:
                    v85 += v84->fts_statp->st_blocks;
                    goto LABEL_124;
                  }

                  v185 = __error();
                  strerror(*v185);
                  CFErrorRef v173 = sub_100009828( "hardlink_copy_hierarchy",  948,  v186,  v187,  0LL,  v188,  @"rename of %s to %s failed: %s",  v189,  (char)__str);
                  goto LABEL_203;
                }

                int v162 = v106;
                v180 = __error();
                strerror(*v180);
                CFErrorRef v179 = sub_100009828( "hardlink_copy_hierarchy",  939,  v181,  v182,  0LL,  v183,  @"chmod failed for %s : %s",  v184,  (char)__str);
              }

              CFErrorRef v37 = v179;
LABEL_204:
              v132 = (void **)v234;
LABEL_205:
              char v154 = 0;
              goto LABEL_226;
            }

            v174 = __error();
            strerror(*v174);
            CFErrorRef v173 = sub_100009828( "hardlink_copy_hierarchy",  899,  v175,  v176,  0LL,  v177,  @"mktemp failed for %s : %s",  v178,  (char)__str);
          }
        }

        else
        {
          CFErrorRef v173 = sub_100009828( "hardlink_copy_hierarchy",  889,  v95,  v96,  0LL,  v97,  @"Entity does not exist at file location in dest path %s",  v98,  (char)__new);
        }

LABEL_203:
        CFErrorRef v37 = v173;
        int v162 = -1;
        goto LABEL_204;
      case 4u:
      case 7u:
      case 0xAu:
        fts_uint64_t path = "hardlink_copy_hierarchy";
        v152 = @"FTS in %s returned an error %d for path '%s'";
        int v153 = 1078;
        goto LABEL_166;
      case 6u:
        *(_WORD *)__str = 0;
        if ((*(_WORD *)__str & 0xF000) == 0x4000
          && (int st_mode = v84->fts_statp->st_mode, st_mode != *(unsigned __int16 *)__str))
        {
          if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
          {
            fts_uint64_t path = __new;
            MOLogWrite(qword_100095BF8);
            LOWORD(st_mode) = v84->fts_statp->st_mode;
          }

          if (chmod(__new, st_mode))
          {
            v137 = __error();
            strerror(*v137);
            CFErrorRef v142 = sub_100009828( "hardlink_copy_hierarchy",  1060,  v138,  v139,  0LL,  v140,  @"chmod of '%s' failed: %s",  v141,  (char)__new);
LABEL_167:
            CFErrorRef v37 = v142;
LABEL_168:
            char v154 = 0;
            int v162 = -1;
            v132 = (void **)v234;
            goto LABEL_226;
          }
        }

        else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
        {
          LOBYTE(fts_path) = __str[0];
          MOLogWrite(qword_100095BF8);
        }

LABEL_124:
        if (v92) {
          goto LABEL_125;
        }
LABEL_131:
        v84 = fts_read(v18);
        if (!v84) {
          goto LABEL_153;
        }
        continue;
      case 0xCu:
      case 0xDu:
        if (v92 && (v239 == 43 || v239 == 45)) {
          goto LABEL_123;
        }
        LOWORD(v235.st_dev) = 0;
        cf[0] = 0LL;
        if ((sub_100009DB8(v241, v91, __new, (mode_t *)&v235, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v37 = sub_100009828( "hardlink_copy_hierarchy",  848,  v112,  v113,  cf[0],  v114,  @"Failed to make dest path for symlink %s",  v115,  (char)v91);
          CFTypeRef v161 = cf[0];
          goto LABEL_210;
        }

        if (LOWORD(v235.st_dev))
        {
          CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  855,  v112,  v113,  0LL,  v114,  @"Entity with mode 0%o exists at symlink location in dest path %s",  v115,  v235.st_dev);
          goto LABEL_223;
        }

        BOOL v116 = v75;
        uint64_t v117 = qword_100095BF8;
        if (qword_100095BF8)
        {
          p_fts_uint64_t path = (const char **)&v84->fts_path;
          v118 = v84->fts_path;
          if (*(int *)(qword_100095BF8 + 44) <= 6
            || (fts_uint64_t path = v84->fts_path,
                MOLogWrite(qword_100095BF8),
                uint64_t v117 = qword_100095BF8,
                v118 = *p_fts_path,
                qword_100095BF8))
          {
            if (*(int *)(v117 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v118;
              MOLogWrite(v117);
            }
          }
        }

        else
        {
          p_fts_uint64_t path = (const char **)&v84->fts_path;
          v118 = v84->fts_path;
        }

        ssize_t v130 = readlink(v118, __str, 0x400uLL);
        if ((v130 & 0x8000000000000000LL) == 0)
        {
          __str[v130] = 0;
          if (symlink(__str, __new))
          {
            uint64_t v171 = qword_100095BF8;
            goto LABEL_192;
          }

          BOOL v75 = v116;
          goto LABEL_123;
        }

        uint64_t v171 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
LABEL_191:
          v172 = __error();
          strerror(*v172);
          MOLogWrite(v171);
        }

LABEL_192:
        CFErrorRef v218 = sub_100009828( "hardlink_copy_hierarchy",  862,  v131,  v79,  0LL,  v81,  @"Failed to copy symlink %s to %s",  v83,  (char)*p_fts_path);
LABEL_223:
        CFErrorRef v37 = v218;
        v132 = (void **)v234;
LABEL_224:
        char v154 = 0;
LABEL_225:
        int v162 = -1;
LABEL_226:
        if (v132)
        {
          munmap(*v132, (size_t)v132[1]);
          free(v132);
        }

        fts_close(v18);
        if ((v162 & 0x80000000) == 0) {
          close(v162);
        }
        if ((v154 & 1) != 0) {
          return 1LL;
        }
LABEL_24:
        if (a10)
        {
          uint64_t result = 0LL;
          *a10 = v37;
        }

        else
        {
          if (v37) {
            CFRelease(v37);
          }
          return 0LL;
        }

        return result;
      default:
        goto LABEL_124;
    }
  }

int sub_100009708(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return sub_10000971C((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_10000971C(char *cStr, const char *a2)
{
  uint64_t v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  NSErrorUserInfoKey v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v3, buffer, 1024LL)
    || !CFStringGetFileSystemRepresentation(v4, __s2, 1024LL))
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  uint64_t v5 = strcmp(buffer, __s2);
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

CFErrorRef sub_100009828( const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  int valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v13 = CFStringCreateWithCString(0LL, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"FunctionName", v13);
  if (v13) {
    CFRelease(v13);
  }
  CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"SourceFileLine", v14);
  if (v14) {
    CFRelease(v14);
  }
  if (a5) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, a5);
  }
  CFStringRef v15 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a7, &a9);
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v15);
  if (v15) {
    CFRelease(v15);
  }
  CFErrorRef v16 = CFErrorCreate(0LL, @"MIInstallerDeltaErrorDomain", 1LL, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t sub_1000099B0( void *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  if (v8 >= v9) {
    sub_1000500D8();
  }
  if (v8 + 1 >= v9)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite(qword_100095BF8);
    }

    CFErrorRef v26 = @"Failed to read command from manifest";
    int v27 = 508;
  }

  else
  {
    int v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    BOOL v14 = (v13 - 43) > 0x33 || ((1LL << (v13 - 43)) & 0x8000000040005LL) == 0;
    if (v14 && v13 != 120)
    {
      CFErrorRef v28 = sub_100009828( "read_next_manifest_command",  514,  (uint64_t)a3,  a4,  0LL,  a6,  @"Stream had invalid command: %hhu",  a8,  v13);
      goto LABEL_26;
    }

    char v15 = sub_100009F28(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    int v20 = *a2;
    if ((v15 & 1) == 0)
    {
      CFErrorRef v28 = sub_100009828( "read_next_manifest_command",  520,  v16,  v17,  0LL,  v18,  @"Failed to read arg1 of command %hhu",  v19,  *a2);
      goto LABEL_26;
    }

    if (v20 != 61) {
      goto LABEL_12;
    }
    *(void *)__str = 0LL;
    uint64_t v33 = 0LL;
    char v35 = 0;
    uint64_t v34 = 0LL;
    if ((sub_100009F28(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      CFErrorRef v28 = sub_100009828( "read_next_manifest_command",  528,  v21,  v22,  0LL,  v23,  @"Failed to read arg2 of command %hhu",  v24,  *a2);
      goto LABEL_26;
    }

    uint64_t v25 = strtoll(__str, 0LL, 10);
    *((void *)a2 + 129) = v25;
    if (v25)
    {
      int v20 = *a2;
LABEL_12:
      CFErrorRef v26 = @"Got malformed EOF marker";
      int v27 = 542;
      goto LABEL_25;
    }

    uint64_t v31 = __str;
    CFErrorRef v26 = @"Invalid touch time %s found for path %s";
    int v27 = 535;
  }

LABEL_25:
  CFErrorRef v28 = sub_100009828("read_next_manifest_command", v27, (uint64_t)a3, a4, 0LL, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    uint64_t v29 = 0LL;
    *a3 = v28;
  }

  else
  {
    if (v28) {
      CFRelease(v28);
    }
    return 0LL;
  }

  return v29;
}

  uint64_t v16 = v16;
  v42 = 0LL;
  *a3 = v16;
LABEL_67:

  return v42;
}

  uint64_t v34 = v34;
  char v35 = 0;
  *a4 = v34;
LABEL_73:

  return v35;
}

      MOLogWrite(v22);
LABEL_26:
      CFErrorRef v26 = 0LL;
      uint64_t v23 = 0LL;
      goto LABEL_27;
    }

    if (!v20)
    {
      uint64_t v22 = qword_100095BF8;
      goto LABEL_25;
    }

    uint64_t v23 = (void *)_CFXPCCreateCFObjectFromXPCObject(v20);
    if (!v23
      || ((objc_opt_class(&OBJC_CLASS___NSDictionary), uint64_t v24 = v23, (objc_opt_isKindOfClass(v24) & 1) == 0)
        ? (uint64_t v25 = 0LL)
        : (uint64_t v25 = v24),
          v24,
          v25,
          !v25))
    {
      CFErrorRef v26 = 0LL;
LABEL_27:

      uint64_t v16 = v26;
      if (!a5) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }

    CFErrorRef v28 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_DEVICE_CLASS"]);
    objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v29 = v28;
    if ((objc_opt_isKindOfClass(v29) & 1) != 0) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0LL;
    }

    uint64_t v41 = [v30 unsignedLongLongValue];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"]);
    objc_opt_class(&OBJC_CLASS___NSNumber);
    v32 = v31;
    if ((objc_opt_isKindOfClass(v32) & 1) != 0) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 0LL;
    }

    uint64_t v40 = [v33 unsignedLongLongValue];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"]);
    objc_opt_class(&OBJC_CLASS___NSNumber);
    char v35 = v34;
    if ((objc_opt_isKindOfClass(v35) & 1) != 0) {
      uint64_t v36 = v35;
    }
    else {
      uint64_t v36 = 0LL;
    }

    CFErrorRef v37 = [v36 unsignedLongLongValue];
    if (v41 == (id)3)
    {
      if (v40 != (id)3 && v37 != (id)3)
      {
        uint64_t v38 = @"This device is not eligible based on the country or region it is located in and the country or region of the Apple ID signed in.";
        uint64_t v39 = @"This device is not eligible based on the country or region it is located in and without an Apple ID signed in.";
LABEL_51:
        if (v37 == (id)7) {
          CFErrorRef v26 = (__CFString *)v39;
        }
        else {
          CFErrorRef v26 = (__CFString *)v38;
        }
        goto LABEL_55;
      }

      if (v40 == (id)3)
      {
        if (v37 == (id)3)
        {
          CFErrorRef v26 = 0LL;
          goto LABEL_55;
        }

        uint64_t v38 = @"This device is not eligible based on the country or region of the Apple ID signed in.";
        uint64_t v39 = @"This device is not eligible without an Apple ID signed in.";
        goto LABEL_51;
      }

      CFErrorRef v26 = @"This device is not eligible based on the country or region it is located in.";
    }

    else
    {
      CFErrorRef v26 = @"This device type is not eligible.";
    }

uint64_t sub_100009C0C(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8 = strlen(a1);
  size_t v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    size_t v13 = v8 - 2;
  }

  if ((v13 & 0x8000000000000000LL) != 0)
  {
LABEL_6:
    char v30 = (char)a1;
    BOOL v14 = @"Failed to find parent of '%s'";
    int v15 = 588;
LABEL_7:
    CFErrorRef v16 = sub_100009828("realpath_parent_no_symlink", v15, v9, v10, 0LL, v11, v14, v12, v30);
    goto LABEL_8;
  }

  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1) {
      goto LABEL_6;
    }
  }

  if (v13)
  {
    uint64_t v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      uint64_t v24 = __error();
      strerror(*v24);
      CFErrorRef v16 = sub_100009828( "realpath_parent_no_symlink",  599,  v25,  v26,  0LL,  v27,  @"realpath of '%s' failed at element '%s': %s",  v28,  (char)a1);
      char *v18 = 47;
      if (a4) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }

    char *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      BOOL v14 = @"Path was too long";
      int v15 = 608;
      goto LABEL_7;
    }
  }

  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }

  if (lstat(a2, &v31))
  {
    mode_t st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1LL;
  }

  mode_t st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000) {
    goto LABEL_23;
  }
  CFErrorRef v16 = sub_100009828( "realpath_parent_no_symlink",  618,  v19,  v20,  0LL,  v21,  @"Found symlink at destination path %s; this is not allowed.",
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    uint64_t v17 = 0LL;
    *a4 = v16;
    return v17;
  }

LABEL_18:
  if (v16) {
    CFRelease(v16);
  }
  return 0LL;
}

  uint64_t v34 = v84.st_mode & 0xF000;
  if (v34 != 0x4000)
  {
    if (v34 != 0x8000)
    {
      uint64_t v49 = (void *)MIInstallerErrorDomain;
      v86 = MIPathArgumentErrorKey;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      v87 = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
      uint64_t v51 = sub_1000130F4( (uint64_t)"-[MIInstaller _setupPackageStateWithError:]",  277LL,  v49,  3LL,  0LL,  v11,  @"Unrecognized package file type 0%o",  v50,  v84.st_mode);
      uint64_t v18 = (id)objc_claimAutoreleasedReturnValue(v51);
      goto LABEL_3;
    }

    if (!v84.st_size)
    {
      uint64_t v54 = (void *)MIInstallerErrorDomain;
      v88[0] = MIPathArgumentErrorKey;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      v88[1] = @"LegacyErrorString";
      v89[0] = v23;
      v89[1] = @"PackageExtractionFailed";
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
      uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      size_t v76 = [v25 fileSystemRepresentation];
      uint64_t v27 = sub_1000130F4( (uint64_t)"-[MIInstaller _setupPackageStateWithError:]",  243LL,  v54,  3LL,  0LL,  v24,  @"Archive we've been requested to install at %s is 0 bytes. That can't be a valid ipa.",  v55,  (uint64_t)v76);
      goto LABEL_7;
    }

    char v35 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    value = 0;
    uint64_t v36 = v35;
    CFErrorRef v37 = open((const char *)[v36 fileSystemRepresentation], 256);
    if (v37 < 0)
    {
      v56 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v57 = [v36 fileSystemRepresentation];
        v58 = __error();
        uint64_t v73 = (uint64_t)v57;
        v77 = strerror(*v58);
        MOLogWrite(v56);
      }

      goto LABEL_45;
    }

    uint64_t v38 = v37;
    uint64_t v39 = read(v37, &value, 4uLL);
    if (v39 == 4)
    {
      if (value == 67324752)
      {
        close(v38);

        goto LABEL_48;
      }

      uint64_t v63 = qword_100095BF8;
      uint64_t v82 = 3LL;
      uint64_t v83 = 4LL;
      uint64_t v80 = 80LL;
      uint64_t v81 = 75LL;
      uint64_t v78 = (char *)(value << 8 >> 24);
      uint64_t v79 = (char *)(value >> 24);
      uint64_t v73 = (char)value;
      v77 = (char *)((__int16)value >> 8);
    }

    else
    {
      uint64_t v59 = (char *)v39;
      v60 = qword_100095BF8;
      v61 = (char *)[v36 fileSystemRepresentation];
      uint64_t v62 = __error();
      uint64_t v78 = v61;
      uint64_t v79 = strerror(*v62);
      uint64_t v73 = 4LL;
      v77 = v59;
      uint64_t v63 = v60;
    }

    MOLogWrite(v63);
LABEL_44:
    close(v38);
LABEL_45:

    uint64_t v64 = qword_100095BF8;
    uint64_t v36 = objc_claimAutoreleasedReturnValue( -[MIInstaller installURL]( self, "installURL", v73, v77, v78, v79, v80, v81, v82, v83));
    uint64_t v73 = (uint64_t)[v36 fileSystemRepresentation];
    MOLogWrite(v64);
LABEL_48:

LABEL_49:
    -[MIInstaller setPackageFormat:](self, "setPackageFormat:", 1LL, v73);
    goto LABEL_50;
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 URLByAppendingPathComponent:@"Payload" isDirectory:1]);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  int v43 = (void *)objc_claimAutoreleasedReturnValue([v42 URLByAppendingPathComponent:@"AssetData" isDirectory:1]);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  CFErrorRef v45 = [v44 isSystemAppInstall];

  if (v45
    && (uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager")),
        uint64_t v47 = [v46 itemExistsAtURL:v43],
        v46,
        (v47 & 1) != 0))
  {
    uint64_t v48 = 4;
  }

  else
  {
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v73, v77, v78));
    uint64_t v53 = [v52 itemExistsAtURL:v41];

    if (v53) {
      uint64_t v48 = 3;
    }
    else {
      uint64_t v48 = 2;
    }
  }

  -[MIInstaller setPackageFormat:](self, "setPackageFormat:", v48, v73);

LABEL_50:
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v65 stagingRootForSystemContent]);

  if (v28)
  {
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 URLByDeletingLastPathComponent]);
    -[MIInstaller setStagingRoot:](self, "setStagingRoot:", v68);

    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
    if (v69)
    {
      CFErrorRef v70 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
      uint64_t v29 = 1;
      uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v70 URLByAppendingPathComponent:@"extracted" isDirectory:1]);
      -[MIInstaller setStagingURL:](self, "setStagingURL:", v71);

      uint64_t v18 = 0LL;
      goto LABEL_12;
    }

    uint64_t v18 = 0LL;
  }

  else
  {
    uint64_t v72 = sub_1000130F4( (uint64_t)"-[MIInstaller _setupPackageStateWithError:]",  285LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to get staging root path",  v66,  v75);
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue(v72);
  }

  return v14;
}

  return v7;
}

      if (a4) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }

    size_t v13 = objc_claimAutoreleasedReturnValue([v11 linkedParentBundleID]);
    BOOL v14 = (void *)v13;
    if (v8)
    {
      if (v13)
      {
        if (([v8 isEqualToString:v13] & 1) == 0)
        {
          CFErrorRef v37 = (void *)MIInstallerErrorDomain;
          int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          CFErrorRef v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          uint64_t v18 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]",  3191LL,  v37,  4LL,  0LL,  0LL,  @"Existing installation of %@ is linked to %@, but the client supplied a linked parent bundle ID of %@ for the update. Changing linkage of an already installed app is not supported",  v17,  (uint64_t)v16);
          uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

          uint64_t v12 = v15;
          goto LABEL_27;
        }
      }

      else
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 bundle]);
        char v30 = [v29 isPlaceholder];

        if ((v30 & 1) == 0)
        {
          v32 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _setLinkageInBundleMetadata:error:]",  3186LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Client specified a linked parent bundle ID for an upgrade to %@ when a parent linkage was not originally specified when the app was installed. Linkage cannot be established by updating an app",  v31,  (uint64_t)v8);
          uint64_t v19 = objc_claimAutoreleasedReturnValue(v32);
LABEL_27:

          uint64_t v12 = (id)v19;
          if (!a4) {
            goto LABEL_16;
          }
          goto LABEL_19;
        }
      }
    }

    else if (v13)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        char v35 = @"LinkedParentBundleID";
        uint64_t v36 = (id)v13;
        MOLogWrite(qword_100095BF8);
      }

      size_t v8 = v14;
    }

    else
    {
      size_t v8 = 0LL;
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "linkedChildBundleIDs", v35, v36));
    [v6 setLinkedChildBundleIDs:v33];

    if (!v8)
    {
LABEL_31:
      uint64_t v28 = 1;
      goto LABEL_32;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    if (!v8) {
      goto LABEL_31;
    }
  }

  uint64_t v38 = v6;
  uint64_t v20 = a4;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  -[MIInstallable installationDomain](self, "installationDomain")));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
  uint64_t v39 = v12;
  uint64_t v24 = [v21 preflightLinkingChild:v23 toParent:v8 error:&v39];
  uint64_t v25 = v39;

  if (!v24)
  {

    uint64_t v12 = v25;
    a4 = v20;
    id v6 = v38;
    goto LABEL_18;
  }

  uint64_t v26 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    char v35 = (__CFString *)objc_claimAutoreleasedReturnValue([v27 identifier]);
    uint64_t v36 = v8;
    MOLogWrite(v26);
  }

  id v6 = v38;
  objc_msgSend(v38, "setLinkedParentBundleID:", v8, v35, v36);

  uint64_t v28 = 1;
LABEL_33:

  return v28;
}

  stat v31 = 0LL;
  uint64_t v22 = 1;
  uint64_t v24 = [@"1" writeToURL:v5 atomically:1 encoding:4 error:&v31];
  size_t v8 = v31;
  if ((v24 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100051358(v5);
    }
    uint64_t v25 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path", v27, v30));
      MOLogWrite(v25);
    }

    goto LABEL_24;
  }

  if (a5) {
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
  }
  uint64_t v26 = 1;
LABEL_35:

  return v26;
}

uint64_t sub_100009DB8(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    CFTypeRef cf = 0LL;
    if ((sub_100009C0C(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      CFErrorRef v23 = sub_100009828( "make_and_check_dest_path",  701,  v15,  v16,  cf,  v17,  @"Failed to realpath parent of %s",  v18,  (char)__str);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      goto LABEL_7;
    }

    CFErrorRef v14 = sub_100009828( "make_and_check_dest_path",  709,  v19,  v20,  0LL,  v21,  @"realpath'd destpath '%s' is different from non-realpath '%s'",  v22,  (char)a3);
  }

  else
  {
    CFErrorRef v14 = sub_100009828( "make_and_check_dest_path",  695,  v10,  v11,  0LL,  v12,  @"Dest path '%s/%s' was too long",  v13,  (char)a1);
  }

  CFErrorRef v23 = v14;
LABEL_7:
  if (a5)
  {
    uint64_t result = 0LL;
    *a5 = v23;
  }

  else
  {
    if (v23) {
      CFRelease(v23);
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_100009F28(void *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[2];
  if (v4 >= a1[1]) {
    sub_100050100();
  }
  if (!a4) {
    return 0LL;
  }
  unint64_t v5 = 0LL;
  while (1)
  {
    int v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    int v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0) {
      break;
    }
    *(_BYTE *)(a3 + v5++) = v6;
    uint64_t v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4) {
      return 0LL;
    }
  }

  *(_BYTE *)(a3 + v5) = 0;
  return 1LL;
}

uint64_t sub_100009F9C(void *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v10 = calloc(1uLL, 0x800uLL);
  if (!v10)
  {
    v32 = @"Failed to malloc buffer for line";
    int v33 = 200;
LABEL_23:
    CFErrorRef v34 = sub_100009828("validate_supported_devices", v33, v6, v7, 0LL, v8, v32, v9, v42);
    free(v10);
    goto LABEL_24;
  }

  if ((sub_100009F28(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    v32 = @"Failed to read supported devices from stream";
    int v33 = 205;
    goto LABEL_23;
  }

  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1LL;
    }

    v32 = @"Existing app lists supported devices but there were none in the manifest";
    int v33 = 211;
    goto LABEL_23;
  }

  uint64_t v11 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v11)
  {
    v32 = @"Failed to create patch supported devices string";
    int v33 = 222;
    goto LABEL_23;
  }

  uint64_t v12 = v11;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v11, @" ");
  uint64_t v18 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    CFErrorRef v36 = sub_100009828( "validate_supported_devices",  228,  v14,  v15,  0LL,  v16,  @"Failed to split patch supported devices string",  v17,  v42);
LABEL_32:
    CFErrorRef v34 = v36;
    free(v10);
    char v37 = 0;
    Mutable = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_42;
  }

  if (!a2)
  {
    CFErrorRef v36 = sub_100009828( "validate_supported_devices",  234,  v14,  v15,  0LL,  v16,  @"Target app had no supported devices but patch did: %@",  v17,  (char)v18);
    goto LABEL_32;
  }

  int v43 = v12;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t v20 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  uint64_t Count = CFArrayGetCount(a2);
  uint64_t v22 = CFArrayGetCount(v18);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v44.location = 0LL;
      v44.length = v22;
      if (!CFArrayContainsValue(v18, v44, ValueAtIndex)) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }

  if (v22 >= 1)
  {
    for (CFIndex j = 0LL; j != v22; ++j)
    {
      uint64_t v26 = CFArrayGetValueAtIndex(v18, j);
      v45.location = 0LL;
      v45.length = Count;
      if (!CFArrayContainsValue(a2, v45, v26)) {
        CFArrayAppendValue(v20, v26);
      }
    }
  }

  if (Mutable && CFArrayGetCount(Mutable))
  {
    CFErrorRef v31 = sub_100009828( "validate_supported_devices",  242,  v27,  v28,  0LL,  v29,  @"Expected supported devices had devices that were not in patch: %@",  v30,  (char)Mutable);
  }

  else
  {
    if (!v20 || !CFArrayGetCount(v20))
    {
      CFErrorRef v34 = 0LL;
      char v37 = 1;
      goto LABEL_41;
    }

    CFErrorRef v31 = sub_100009828( "validate_supported_devices",  247,  v38,  v39,  0LL,  v40,  @"Patch listed devices that were not in expected supported devices: %@",  v41,  (char)v20);
  }

  CFErrorRef v34 = v31;
  char v37 = 0;
LABEL_41:
  uint64_t v12 = v43;
  free(v10);
LABEL_42:
  CFRelease(v12);
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if ((v37 & 1) != 0) {
    return 1LL;
  }
LABEL_24:
  if (a3)
  {
    uint64_t result = 0LL;
    *a3 = v34;
  }

  else
  {
    if (v34) {
      CFRelease(v34);
    }
    return 0LL;
  }

  return result;
}

id sub_10000A2FC()
{
  id WeakRetained = objc_loadWeakRetained(&qword_100095A78);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileInstallationHelperServiceProtocol));
    objc_storeWeak(&qword_100095A78, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100095A70);
  return WeakRetained;
}

id sub_10000A370()
{
  id WeakRetained = objc_loadWeakRetained(&qword_100095A88);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileInstallerDelegateProtocol));
    objc_storeWeak(&qword_100095A88, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100095A80);
  return WeakRetained;
}

id sub_10000A3E4()
{
  id WeakRetained = objc_loadWeakRetained(&qword_100095A98);
  if (!WeakRetained)
  {
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MobileInstallerProtocol));
    uint64_t v1 = ICLKnownBundleRecordClasses();
    unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    id v3 = [v2 setByAddingObject:objc_opt_class(NSArray)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v6,  v7,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [WeakRetained setClasses:v9 forSelector:"checkCapabilities:withOptions:completion:" argumentIndex:0 ofReply:0];

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___ICLUninstallRecord),  0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [WeakRetained setClasses:v12 forSelector:"uninstallIdentifiers:withOptions:completion:" argumentIndex:0 ofReply:1];

    [WeakRetained setClasses:v4 forSelector:"installURL:identity:targetingDomain:options:returningResultInfo:completion:" argumentIndex:1 ofReply:1];
    [WeakRetained setClasses:v4 forSelector:"fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v4 forSelector:"fetchInfoForFrameworkAtURL:options:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v4 forSelector:"cancelUpdateForStagedUUID:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v4 forSelector:"finalizeStagedInstallForUUID:returningResultInfo:completion:" argumentIndex:1 ofReply:1];
    objc_storeWeak(&qword_100095A98, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100095A90);
  return WeakRetained;
}

void sub_10000A648(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MIIPAPatcherFileManager);
  unsigned __int8 v2 = (void *)qword_100095AA0;
  qword_100095AA0 = (uint64_t)v1;
}

LABEL_8:
      if (!a4) {
        goto LABEL_15;
      }
      switch(d_type)
      {
        case 4:
          if ((a4 & 2) != 0) {
            goto LABEL_15;
          }
          break;
        case 10:
          if ((a4 & 4) != 0) {
            goto LABEL_15;
          }
          break;
        case 8:
          if ((a4 & 1) != 0) {
            goto LABEL_15;
          }
          break;
        default:
          if ((a4 & 8) != 0)
          {
LABEL_15:
            uint64_t v27 = v12;
            uint64_t v17 = v9[2](v9, v16, &v27);
            uint64_t v18 = v27;

            uint64_t v12 = v18;
            goto LABEL_16;
          }

          break;
      }

      uint64_t v17 = 1;
LABEL_16:

      if (!v17) {
        break;
      }
    }
  }

  closedir(v11);
LABEL_30:

  return v11 != 0LL;
}

  if (a3)
  {
    uint64_t v15 = v15;
    uint64_t v16 = 0;
    *a3 = v15;
  }

  else
  {
    uint64_t v16 = 0;
  }

  return v12;
}

    uint64_t v26 = 0;
    goto LABEL_52;
  }

  int v43 = [v14 mutableCopy];
  uint64_t v49 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v10,  0LL,  0LL,  &v49));
  uint64_t v17 = v49;

  if (!v16)
  {
    uint64_t v27 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]",  376LL,  MIInstallerErrorDomain,  162LL,  v17,  0LL,  @"Failed to locate installed app for requested parent bundle %@",  v18,  (uint64_t)v10);
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue(v27);

    uint64_t v19 = 0LL;
    CFErrorRef v23 = 0LL;
    goto LABEL_50;
  }

  char v42 = v11;
  uint64_t v48 = v17;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleMetadataWithError:&v48]);
  uint64_t v20 = v48;

  if (!v19)
  {
    uint64_t v28 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]",  382LL,  MIInstallerErrorDomain,  4LL,  v20,  0LL,  @"Failed to read bundle metadata for requested parent bundle %@",  v21,  (uint64_t)v10);
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue(v28);

    CFErrorRef v23 = 0LL;
    goto LABEL_49;
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 linkedChildBundleIDs]);
  CFErrorRef v23 = (NSMutableSet *)[v22 mutableCopy];

  if (v44)
  {
    if ((-[NSMutableSet isEqualToSet:](v23, "isEqualToSet:") & 1) != 0)
    {
      uint64_t v41 = 0;
      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050C50();
    }
  }

  uint64_t v41 = 1;
LABEL_14:
  if (a5 == 1)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v38 = v42;
      uint64_t v40 = v10;
      MOLogWrite(qword_100095BF8);
    }

    if (-[NSMutableSet containsObject:](v23, "containsObject:", v42, v38, v40))
    {
      -[NSMutableSet removeObject:](v23, "removeObject:", v42);
      uint64_t v41 = 1;
    }

    if (!-[NSMutableSet count](v23, "count")) {
      [v43 removeObject:v10];
    }
    uint64_t v30 = v20;
  }

  else
  {
    if (a5)
    {
      CFErrorRef v36 = sub_1000130F4( (uint64_t)"-[MIContainerLinkManager _onQueue_updateLinkForParent:toChild:operationType:error:]",  443LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Container link manager invoked with invalid operation type %lu",  v24,  a5);
      uint64_t v15 = (id)objc_claimAutoreleasedReturnValue(v36);

      goto LABEL_49;
    }

    uint64_t v47 = v20;
    uint64_t v29 = -[MIContainerLinkManager _onQueue_isValidLinkForParent:toChild:error:]( self,  "_onQueue_isValidLinkForParent:toChild:error:",  v10,  v42,  &v47);
    uint64_t v30 = v47;

    if (!v29)
    {
      uint64_t v15 = v30;
      goto LABEL_49;
    }

    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v38 = v10;
      uint64_t v40 = v42;
      MOLogWrite(qword_100095BF8);
    }

    if ((-[NSMutableSet containsObject:](v23, "containsObject:", v42, v38, v40) & 1) == 0)
    {
      if (!v23) {
        CFErrorRef v23 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
      }
      -[NSMutableSet addObject:](v23, "addObject:", v42);
      uint64_t v41 = 1;
    }
  }

  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    uint64_t v39 = v23;
    MOLogWrite(qword_100095BF8);
  }

  CFErrorRef v31 = -[NSMutableSet copy](v23, "copy", v39);
  [v19 setLinkedChildBundleIDs:v31];

  if (v41)
  {
    uint64_t v46 = v30;
    v32 = [v16 saveBundleMetadata:v19 withError:&v46];
    uint64_t v15 = v46;

    if ((v32 & 1) == 0)
    {
      goto LABEL_49;
    }

    uint64_t v30 = v15;
  }

  CFRange v45 = v30;
  int v33 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]( self,  "_onQueue_setLinkedParentBundleIDList:error:",  v43,  &v45);
  uint64_t v15 = v45;

  if (!v33)
  {
LABEL_49:
    uint64_t v11 = v42;
LABEL_50:
    uint64_t v25 = v43;
    if (a6) {
      goto LABEL_51;
    }
    goto LABEL_8;
  }

  if (v41)
  {
    CFErrorRef v34 = -[NSMutableSet copy](v23, "copy");
    char v35 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
    [v35 setObject:v34 forKeyedSubscript:v10];
  }

  uint64_t v26 = 1;
  uint64_t v11 = v42;
  uint64_t v25 = v43;
LABEL_52:

  return v26;
}

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](self, "bundleSigningInfo", v29, v30));
    uint64_t v19 = [v18 profileValidationType];

    if (v19 == (id)3)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](self, "bundleSigningInfo"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 entitlements]);
      uint64_t v22 = sub_100045820(v21);
      CFErrorRef v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

      if (v23)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
        v32 = v13;
        uint64_t v25 = [v6 addReferenceForApplicationIdentifier:v23 bundle:v24 error:&v32];
        uint64_t v26 = v32;

        if (!v25)
        {
          uint64_t v27 = 0;
LABEL_14:

          uint64_t v13 = v26;
          if (!a3) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }

        uint64_t v13 = v26;
      }
    }

    CFErrorRef v31 = v13;
    uint64_t v27 = -[MIInstallationJournalEntry _linkToParentApplication:](self, "_linkToParentApplication:", &v31);
    uint64_t v26 = v31;
    CFErrorRef v23 = v13;
    goto LABEL_14;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  int v33 = 0LL;
  uint64_t v17 = [v5 addReferencesForBundle:v16 error:&v33];
  uint64_t v13 = v33;

  if (v17) {
    goto LABEL_8;
  }
  uint64_t v27 = 0;
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v27) {
    *a3 = v13;
  }
LABEL_17:

  return v27;
}

  if (-[MIInstallationJournalEntry shouldModifyExistingContainers](self, "shouldModifyExistingContainers", v25, v26)
    && !-[MIInstallationJournalEntry isPlaceholderInstall](self, "isPlaceholderInstall"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _containerProtectionManager](self, "_containerProtectionManager"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
      [v6 setDataProtectionOnDataContainer:v8 forNewBundle:v9 retryIfLocked:1];
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
    uint64_t v11 = (char *)[v10 count];

    if (v11)
    {
      for (CFIndex i = 0LL; i != v11; ++i)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:i]);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:i]);

        [v6 setDataProtectionOnDataContainer:v14 forNewBundle:v16 retryIfLocked:1];
      }
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _uninstalledAppList](self, "_uninstalledAppList"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
  uint64_t v28 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  [v17 removeIdentifiers:v20];

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  uint64_t v22 = -[MIInstallationJournalEntry operationType](self, "operationType");

  if (v22 != 4)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _systemAppState](self, "_systemAppState"));
    CFErrorRef v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
    [v21 addIdentifier:v24 withState:1];

LABEL_19:
  }
}

  return v12;
}

  return v14;
}

LABEL_7:
  return v5;
}
}

  uint64_t v16 = v15;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v16;
}

  return v15;
}

  if (a4) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a4 = (id) v104[5];
  }

  _Block_object_dispose(&v103, 8);
  return v18;
}

  return v19;
}

void sub_10000B548(id a1)
{
  uint64_t v1 = (void *)qword_100095AB0;
  qword_100095AB0 = (uint64_t)&off_10008A0E0;
}

LABEL_13:
    uint64_t v16 = 0LL;
    goto LABEL_25;
  }

  uint64_t v20 = a4;
  uint64_t v30 = v8;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 _arrayFromPlistRepresentation:v6 key:@"commandLineArgs" sub:0 index:-1 withError:&v30]);
  uint64_t v11 = v30;

  if (!v10)
  {
    uint64_t v21 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_15;
  }

  objc_opt_class(&OBJC_CLASS___NSString);
  if ((sub_100013434(v10) & 1) == 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"commandLineArgs"]);
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue( [a1 _manifestErrorForKey:@"commandLineArgs" sub:0 index:-1 expected:@"NSArray<NSString>" value:v17]);

    uint64_t v21 = 0LL;
    uint64_t v12 = 0LL;
LABEL_20:
    uint64_t v14 = 0LL;
    goto LABEL_21;
  }

  uint64_t v29 = v11;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [a1 _arrayFromPlistRepresentation:v6 key:@"targets" sub:0 index:-1 withError:&v29]);
  uint64_t v9 = v29;

  if (!v12)
  {
    uint64_t v21 = 0LL;
    goto LABEL_20;
  }

  uint64_t v28 = v9;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _targetsFromPlistRepresentationV1:v12 withError:&v28]);
  uint64_t v11 = v28;

  if (!v13)
  {
    uint64_t v21 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_16;
  }

  uint64_t v27 = v11;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v6 key:@"toolVersion" sub:0 index:-1 withError:&v27]);
  uint64_t v9 = v27;

  uint64_t v21 = v13;
  if (!v14)
  {
LABEL_21:
    uint64_t v15 = 0LL;
    uint64_t v13 = 0LL;
    goto LABEL_22;
  }

  uint64_t v26 = v9;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v6 key:@"toolArch" sub:0 index:-1 withError:&v26]);
  uint64_t v11 = v26;

  if (!v15)
  {
LABEL_15:
    uint64_t v13 = 0LL;
LABEL_16:
    uint64_t v7 = 0LL;
    goto LABEL_17;
  }

  uint64_t v25 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v6 key:@"toolBuiltWithSDKVersion" sub:0 index:-1 withError:&v25]);
  uint64_t v9 = v25;

  if (!v13)
  {
LABEL_22:
    uint64_t v7 = 0LL;
LABEL_23:
    a4 = v20;
    if (v20) {
      goto LABEL_24;
    }
    goto LABEL_13;
  }

  uint64_t v24 = v9;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v6 key:@"toolBuiltWithXcodeVersion" sub:0 index:-1 withError:&v24]);
  uint64_t v11 = v24;

  if (!v7)
  {
LABEL_17:
    uint64_t v9 = v11;
    goto LABEL_23;
  }

  CFErrorRef v23 = v11;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 _stringFromPlistRepresentation:v6 key:@"hostVersion" sub:0 index:-1 withError:&v23]);
  uint64_t v9 = v23;

  if (!v16) {
    goto LABEL_23;
  }
  a4 = -[MIIPAPatcherManifest initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:]( objc_alloc(&OBJC_CLASS___MIIPAPatcherManifest),  "initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:",  v10,  v21,  v14,  v15,  v13,  v7,  v16);
  objc_storeStrong(a4 + 2, obj);
LABEL_25:

  return a4;
}

    MOLogWrite(v12);
    goto LABEL_18;
  }

  uint64_t v11 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
    uint64_t v12 = v11;
    goto LABEL_13;
  }

    uint64_t v19 = v19;
    uint64_t v20 = 0;
    *a3 = v19;
  }

  uint64_t v22 = v22;
  uint64_t v27 = 0LL;
  *a9 = v22;
LABEL_18:

  return v27;
}

  if (a4)
  {
    uint64_t v13 = v13;
    uint64_t v14 = 0;
    *a4 = v13;
  }

  else
  {
    uint64_t v14 = 0;
  }

  return v16;
}

    MOLogWrite(v9);
    goto LABEL_14;
  }

  if ((sub_100013434(v4) & 1) == 0)
  {
    uint64_t v9 = qword_100095BF8;
    goto LABEL_13;
  }

  uint64_t v6 = v4;
LABEL_7:
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

LABEL_16:
  return v8;
}

    uint64_t v17 = v13;
    goto LABEL_14;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:]( self,  "_referenceURLForUserWithID:inBundleContainer:",  v9,  v11));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v21 = v13;
  uint64_t v16 = [v15 removeItemAtURL:v14 error:&v21];
  uint64_t v17 = v21;

  if (!v16)
  {
    uint64_t v18 = 0;
    uint64_t v13 = v17;
    if (!a7) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  uint64_t v18 = 1;
  if (a6) {
    *a6 = 1;
  }
LABEL_14:

  return v18;
}

LABEL_39:
  return v13;
}

          CFErrorRef v36 = (void *)-[MILaunchServicesOperationManager targetUID](self, "targetUID", v39, v40, v41);
          uint64_t v40 = v28;
          uint64_t v41 = v31;
          uint64_t v39 = v36;
          MOLogWrite(v32);
          goto LABEL_40;
        }

        objc_opt_class(&OBJC_CLASS___MILaunchServicesUnregisterOperation);
        if ((objc_opt_isKindOfClass(v26) & 1) == 0) {
          goto LABEL_41;
        }
        int v33 = v26;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v33 bundleID]);
        CFErrorRef v34 = [v33 domain];
        uint64_t v47 = 0LL;
        char v35 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]( self,  "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:",  v28,  v34,  0LL,  &v47);
        CFErrorRef v31 = v47;
        if ((v35 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            uint64_t v38 = -[MILaunchServicesOperationManager targetUID](self, "targetUID");
            *(_DWORD *)buf = 136315906;
            uint64_t v66 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            uint64_t v67 = 1024;
            *(_DWORD *)uint64_t v68 = v38;
            *(_WORD *)&v68[4] = 2112;
            *(void *)&v68[6] = v28;
            *(_WORD *)&v68[14] = 2112;
            *(void *)&v68[16] = v31;
            _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to restart unregister operation for %u/%@ : %@",  buf,  0x26u);
          }

          v32 = qword_100095BF8;
        }

LABEL_32:
  uint64_t v59 = v17;
  v60 = sub_1000130F4( (uint64_t)"+[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResul tURL:onDevice:onBehalfOf:withError:]",  146LL,  MIInstallerErrorDomain,  175LL,  v17,  0LL,  @"Failed to create a serialized placeholder for %@/%@",  v18,  (uint64_t)v12);
  uint64_t v17 = (id)objc_claimAutoreleasedReturnValue(v60);

  if (a8)
  {
    uint64_t v17 = v17;
    uint64_t v74 = 0;
    *a8 = v17;
  }

  else
  {
    uint64_t v74 = 0;
  }

  uint64_t v96 = v3;
  qword_100095BF8 = MOLogOpen("com.apple.mobile.installd", 5LL);
  if (!qword_100095BF8) {
    syslog( 3, "Failed to set up rotating logs at path %s", (const char *)[v34 fileSystemRepresentation]);
  }
  int v43 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", v91));
  CFRange v44 = [v43 allowsInternalSecurityPolicy];

  if (v44) {
    CFRange v45 = 4LL;
  }
  else {
    CFRange v45 = 1LL;
  }
  uint64_t v46 = qword_100095BF8;
  uint64_t v47 = v34;
  MOLogEnableDiskLogging(v46, [v47 fileSystemRepresentation], v45, 0x40000);
  ICLSetLoggingHandle(qword_100095BF8);
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](&OBJC_CLASS___MIHelperServiceClient, "sharedInstance"));
  uint64_t v103 = v42;
  LOBYTE(v46) = [v48 wipeStagingRootAndSetUpPerUserDataDirWithError:&v103];
  uint64_t v49 = v103;

  if ((v46 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      int v92 = v49;
      MOLogWrite(qword_100095BF8);
    }

    uint64_t v49 = 0LL;
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", v92));
  uint64_t v51 = objc_claimAutoreleasedReturnValue([v50 stagingRootForSystemContent]);
  sub_100028B6C(v4, (void *)v51, 1LL);

  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  LOBYTE(v51) = [v52 isSharediPad];

  if ((v51 & 1) == 0)
  {
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 currentUserJournalStorageBaseURL]);
    sub_100028B6C(v4, v54, 0LL);

    CFErrorRef v55 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 currentUserLaunchServicesOperationStorageBaseURL]);
    sub_100028B6C(v4, v56, 0LL);
  }

  if (+[ICLFeatureFlags transientBundleCleanupEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "transientBundleCleanupEnabled"))
  {
    uint64_t v102 = v49;
    v57 = +[MIBundleContainer purgeTransientBundleContainersWithError:]( &OBJC_CLASS___MIBundleContainer,  "purgeTransientBundleContainersWithError:",  &v102);
    v58 = v102;

    if ((v57 & 1) != 0)
    {
      uint64_t v49 = v58;
    }

    else
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        int v93 = (const char *)v58;
        MOLogWrite(qword_100095BF8);
      }

      uint64_t v49 = 0LL;
    }
  }

  if (v36 != (sem_t *)-1LL)
  {
    uint64_t v59 = v49;
LABEL_70:
    uint64_t v80 = &BZ2_bzRead_ptr;
    goto LABEL_71;
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance", v93));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v60 lastBuildInfoFileURL]);

  uint64_t v101 = 0LL;
  uint64_t v62 = MIIsBuildUpgrade(v61, &v101);
  uint64_t v63 = v101;
  if (v62)
  {
    uint64_t v64 = objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  2LL));
    if (!v64
      || (uint64_t v65 = (void *)v64,
          uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  3LL)),  v66,  v65,  !v66))
    {
    }

    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 dataDirectory]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( [v68 URLByAppendingPathComponent:@"DeveloperDiskImageInfo.plist" isDirectory:0]);
    [v4 removeItemAtURL:v69 error:0];

    CFErrorRef v70 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v70 dataDirectory]);
    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v71 URLByAppendingPathComponent:@"DiskImagesInfo.plist" isDirectory:0]);
    [v4 removeItemAtURL:v72 error:0];

    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue( +[MIKeychainAccessGroupTracker sharedTracker]( &OBJC_CLASS___MIKeychainAccessGroupTracker,  "sharedTracker"));
    [v73 reconcile];

    uint64_t v74 = objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    BOOL v75 = (void *)objc_claimAutoreleasedReturnValue([(id)v74 dataDirectory]);
    size_t v76 = (void *)objc_claimAutoreleasedReturnValue( [v75 URLByAppendingPathComponent:@"ArchivedApplications.plist" isDirectory:0]);
    [v4 removeItemAtURL:v76 error:0];

    v100 = v49;
    LOBYTE(v74) = +[MIObsoleteUpgradeCleaner cleanUpgradesWithError:]( &OBJC_CLASS___MIObsoleteUpgradeCleaner,  "cleanUpgradesWithError:",  &v100);
    uint64_t v59 = v100;

    if ((v74 & 1) == 0 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
    {
      int v94 = v59;
      MOLogWrite(qword_100095BF8);
    }

    MIRecordCurrentBuildVersion(v61);
    v0 = v99;
  }

  else
  {
    uint64_t v59 = v49;
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](&OBJC_CLASS___MIUninstalledAppList, "sharedList", v94));
  [v77 preflightUninstalledMap];

  uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](&OBJC_CLASS___MIDiskImageManager, "sharedInstance"));
  [v78 resetMountPaths];

  uint64_t v79 = sem_open("installd.firstboot_check", 512, 256LL, 0LL);
  if (v79 != (sem_t *)-1LL)
  {
    sem_close(v79);
    goto LABEL_70;
  }

  v89 = qword_100095BF8;
  uint64_t v80 = &BZ2_bzRead_ptr;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    int v90 = __error();
    int v93 = "installd.firstboot_check";
    uint64_t v95 = strerror(*v90);
    MOLogWrite(v89);
  }

  return v22;
}

LABEL_35:
  return v74;
}

    if ((v34 & 1) == 0)
    {
      uint64_t v12 = v22;
      *a3 = v12;
      goto LABEL_38;
    }

    goto LABEL_37;
  }

  uint64_t v8 = v6;
LABEL_39:

  return v8;
}

      objc_autoreleasePoolPop(v16);
      uint64_t v13 = (char *)v13 + 1;
      uint64_t v14 = v12;
    }

    while (v10 != v13);
    uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  }

  while (v10);
LABEL_41:

  uint64_t v27 = [v35 copy];
  uint64_t v9 = obj;
LABEL_42:

LABEL_43:
  if (a5 && !v27) {
    *a5 = v12;
  }

  if (a3 <= 7 && ((1LL << a3) & 0x94) != 0) {
    sub_10004DBC8(v29, v30);
  }

  return v27;
}

uint64_t sub_10000D79C()
{
  if (qword_100095AC8 != -1) {
    dispatch_once(&qword_100095AC8, &stru_100080E38);
  }
  return dword_100095AC0;
}

void sub_10000D7DC(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([v1 currentUser]);
  dword_100095AC0 = [v2 uid];
}

id sub_10000D874()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 allUsers]);

  return v1;
}

id sub_10000D8B4()
{
  if (qword_100095AD8 != -1) {
    dispatch_once(&qword_100095AD8, &stru_100080E58);
  }
  return (id)qword_100095AD0;
}

void sub_10000D8F4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.installd.LaunchServicesRegistrationQueue", v4);
  id v3 = (void *)qword_100095AD0;
  qword_100095AD0 = (uint64_t)v2;
}

id sub_10000D944(void *a1)
{
  dispatch_queue_attr_t v1 = a1;
  dispatch_queue_t v2 = 0LL;
  unint64_t v3 = 0LL;
  while (1)
  {
    uint64_t v4 = v1[2](v1);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (!v5) {
      break;
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    if ([v6 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v5, "code") == (id)4097)
    {

      if (v3 >= 5) {
        break;
      }
    }

    else
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain", v9));
      if (![v7 isEqualToString:NSCocoaErrorDomain]
        || [v5 code] != (id)4099)
      {

        break;
      }

      if (v3 > 4) {
        break;
      }
    }

    ++v3;
    dispatch_queue_t v2 = v5;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v9 = v5;
      MOLogWrite(qword_100095BF8);
    }

    sleep(1u);
  }

  return v5;
}

void sub_10000DAA4(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  id v14 = objc_alloc_init(&OBJC_CLASS___SDRDiagnosticReporter);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 signatureWithDomain:v13 type:v12 subType:v11 subtypeContext:v10 detectedProcess:@"installd" triggerThresholdValues:0]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000DC3C;
  v18[3] = &unk_100080E80;
  id v16 = v15;
  id v19 = v16;
  id v17 = v9;
  id v20 = v17;
  if (([v14 snapshotWithSignature:v16 delay:0 events:v17 payload:0 actions:v18 reply:0.0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050128((uint64_t)v16);
    }
  }
}

void sub_10000DC3C(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([a2 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess]);
  unint64_t v3 = (void *)v2;
  uint64_t v7 = (void *)v2;
  if (v2 && (char v4 = objc_opt_respondsToSelector(v2, "BOOLValue"), v3 = v7, (v4 & 1) != 0))
  {
    unsigned int v5 = [v7 BOOLValue];
    uint64_t v6 = qword_100095BF8;
    if (v5)
    {
      unint64_t v3 = v7;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
LABEL_9:
        MOLogWrite(v6);
        unint64_t v3 = v7;
      }
    }

    else
    {
      unint64_t v3 = v7;
    }
  }

  else
  {
    uint64_t v6 = qword_100095BF8;
  }
}

void sub_10000E010(void *a1)
{
  id v1 = a1;
  if ([v1 isTransient])
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
    id v5 = 0LL;
    unsigned __int8 v3 = [v1 removeUnderlyingContainerWaitingForDeletion:0 error:&v5];
    id v4 = v5;
    if ((v3 & 1) != 0)
    {
    }

    else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
      goto LABEL_9;
    }

    MOLogWrite(qword_100095BF8);
LABEL_9:
  }
}

LABEL_16:
  return v13;
}

  uint64_t v29 = v26;

  return v29;
}

  uint64_t v30 = (void *)v24;
  -[MIClientConnection sendDelegateMessagesComplete](self, "sendDelegateMessagesComplete");
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100017028;
  v44[3] = &unk_100081180;
  CFErrorRef v31 = v41;
  uint64_t v48 = v31;
  v32 = v23;
  CFRange v45 = v32;
  int v33 = v30;
  uint64_t v46 = v33;
  CFErrorRef v34 = v21;
  uint64_t v47 = v34;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.installation-for-staged-update-complete",  v44);
}

LABEL_17:
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  [v20 removeSinf];

LABEL_18:
  uint64_t v21 = 1;
LABEL_25:

  return v21;
}

  uint64_t v6 = v12;
LABEL_17:
  if (a3)
  {
    uint64_t v6 = v6;
    id v16 = 0;
    *a3 = v6;
  }

  else
  {
    id v16 = 0;
  }

        uint64_t v28 = 0;
LABEL_32:
        uint64_t v25 = v12;
        goto LABEL_33;
      }

  return v14;
}

  return v17;
}

LABEL_68:
    uint64_t v51 = v44;
LABEL_69:
    if (a3)
    {
      uint64_t v51 = v51;
      uint64_t v72 = 0;
      *a3 = v51;
    }

    else
    {
      uint64_t v72 = 0;
    }

    goto LABEL_72;
  }

LABEL_61:
  if ([v6 count])
  {
    uint64_t v96 = v51;
    uint64_t v65 = +[MIContainer removeContainers:waitForDeletion:error:]( &OBJC_CLASS___MIContainer,  "removeContainers:waitForDeletion:error:",  v6,  0LL,  &v96);
    uint64_t v66 = v96;

    uint64_t v67 = v95;
    if ((v65 & 1) != 0)
    {
      uint64_t v51 = v66;
    }

    else
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v86 = v6;
        v88 = v66;
        MOLogWrite(qword_100095BF8);
      }

      uint64_t v51 = 0LL;
    }
  }

  else
  {
    uint64_t v67 = v95;
  }

  uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v67, "dataContainer", v86, v88));

  if (v74)
  {
    BOOL v75 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerProtectionManager defaultManager]( &OBJC_CLASS___MIContainerProtectionManager,  "defaultManager"));
    size_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v67, "dataContainer"));
    [v75 setDataProtectionOnDataContainer:v76 forNewBundle:v5 retryIfLocked:1];
  }

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v67, "appExtensionBundles"));
  uint64_t v78 = (char *)[v77 count];

  if (v78)
  {
    for (CFIndex j = 0LL; j != v78; ++j)
    {
      uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v67, "appExtensionDataContainers"));
      uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectAtIndexedSubscript:j]);

      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v67, "appExtensionBundles"));
      uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndexedSubscript:j]);

      v84 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerProtectionManager defaultManager]( &OBJC_CLASS___MIContainerProtectionManager,  "defaultManager"));
      uint64_t v72 = 1;
      [v84 setDataProtectionOnDataContainer:v81 forNewBundle:v83 retryIfLocked:1];

      uint64_t v67 = v95;
    }
  }

  else
  {
    uint64_t v72 = 1;
  }

    id v12 = v30;
    goto LABEL_79;
  }

  uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v132 = (void *)objc_claimAutoreleasedReturnValue([v131 bundle]);
  uint64_t v133 = v132;
  if (!v131)
  {
    uint64_t v175 = qword_100095BF8;
LABEL_195:
    uint64_t v202 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v203 = (void *)objc_claimAutoreleasedReturnValue([v202 identifier]);
    MOLogWrite(v175);
    goto LABEL_218;
  }

  if (([v132 isPlaceholder] & 1) == 0 && objc_msgSend(v262, "installTargetType") != (id)3)
  {
    uint64_t v175 = qword_100095BF8;
    goto LABEL_195;
  }

  uint64_t v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v273, "entitlements", v253));
  uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue( [v133 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 checki ngTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0]);
  uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue([v135 entitlements]);
  v137 = v136;
  __int128 v277 = v134;
  __int128 v272 = v135;
  if (v136)
  {
    if (sub_100045408(v136) && [v262 installTargetType] == (id)3)
    {
      uint64_t v138 = (void *)MIInstallerErrorDomain;
      uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue([v133 displayName]);
      uint64_t v141 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2303LL,  v138,  172LL,  0LL,  0LL,  @"Offloading is not allowed for the marketplace %@.",  v140,  (uint64_t)v139);
      CFErrorRef v142 = objc_claimAutoreleasedReturnValue(v141);
      goto LABEL_254;
    }

    if (v134)
    {
      uint64_t v184 = sub_100045820(v137);
      v185 = (void *)objc_claimAutoreleasedReturnValue(v184);
      uint64_t v186 = sub_100045820(v134);
      uint64_t v187 = (void *)objc_claimAutoreleasedReturnValue(v186);
      uint64_t v188 = v187;
      if (v185)
      {
        if (v187)
        {
          if ([v187 isEqualToString:v185])
          {
            uint64_t v189 = v12;
            goto LABEL_251;
          }

          CFErrorRef v218 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
          {
            uint64_t v219 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            uint64_t v220 = (void *)objc_claimAutoreleasedReturnValue([v219 identifier]);
            __int128 v256 = v188;
            __int128 v258 = v185;
            __int128 v254 = v220;
LABEL_247:
            MOLogWrite(v218);
          }
        }

        else
        {
          CFErrorRef v218 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
          {
            uint64_t v219 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            uint64_t v220 = (void *)objc_claimAutoreleasedReturnValue([v219 identifier]);
            __int128 v254 = v220;
            goto LABEL_247;
          }
        }

  return v48;
}

LABEL_72:
  return v72;
}

void sub_1000100BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

uint64_t sub_1000100EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000100FC(uint64_t a1)
{
}

void sub_100010104(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0LL;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]( &OBJC_CLASS___MILaunchServicesOperationManager,  "registerInstalledInfo:forIdentity:inDomain:error:",  v2,  v3,  1LL,  &v9));
  id v5 = v9;
  id v6 = v9;
  uint64_t v7 = *(void *)(a1[6] + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), v5);
  }
}

void sub_100010388(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100095AE0;
  qword_100095AE0 = (uint64_t)v1;
}

LABEL_20:
  if (!self->_mountInfo) {
    -[MIDiskImageManager resetMountPaths](self, "resetMountPaths");
  }
}

  v12[2](v12, v14);
}

  uint64_t v15 = v25;
  sub_10004D608(v9);
LABEL_21:
  CFErrorRef v36 = v55[5];
  if (v36) {
    v7[2](v7, v36, 0LL);
  }
  else {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0LL, v61[5]);
  }

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
}

      uint64_t v12 = 0;
      goto LABEL_21;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIJournal _journalStorageURLForUniqueIdentifier:]( self,  "_journalStorageURLForUniqueIdentifier:",  v15));

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v17 = [v16 uid];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    uint64_t v24 = v14;
    uint64_t v12 = 1;
    id v19 = objc_msgSend( v10,  "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:",  v11,  420,  v17,  objc_msgSend(v18, "gid"),  4,  1,  &v24);
    id v9 = v24;

    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100050614((uint64_t)v6, v11);
      }
      id v20 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        CFErrorRef v23 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
        MOLogWrite(v20);
      }

      if (a4) {
        goto LABEL_18;
      }
      goto LABEL_20;
    }
  }

  return v15;
}

  return v16;
}

    id v17 = v17;
    char v35 = 0;
    *a3 = v17;
    goto LABEL_23;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
  int v33 = [v32 preservePlaceholderAsParallel];

  if (!v33)
  {
    char v35 = 1;
    goto LABEL_23;
  }

  uint64_t v46 = v17;
  CFErrorRef v34 = -[MIInstallableBundle _preserveExistingPlaceholderAsParallelPlaceholderWithError:]( self,  "_preserveExistingPlaceholderAsParallelPlaceholderWithError:",  &v46);
  CFErrorRef v23 = v46;

  if ((v34 & 1) == 0)
  {
LABEL_21:
    id v17 = v23;
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }

  char v35 = 1;
  id v17 = v23;
LABEL_23:

  return v35;
}

  if (a6 && (v24 & 1) == 0)
  {
    id v13 = v13;
    *a6 = v13;
  }

LABEL_21:
  id v14 = v20;
  if (a6)
  {
    id v14 = v20;
    v32 = 0;
    *a6 = v14;
  }

  else
  {
    v32 = 0;
  }

id sub_1000105E8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 dataDirectory]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 URLByAppendingPathComponent:@"DiskImageMountPaths.plist" isDirectory:0]);

  return v2;
}

id sub_10001064C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_configureMountInfoForPaths:", *(void *)(a1 + 40));
}

void sub_1000107B0(uint64_t a1)
{
  id v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v4 = [v3 hasInternalContent];

  if (v4)
  {
    uint64_t v16 = a1;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 developerDirectories]);

    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          if ([v2 itemExistsAtURL:v11])
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"Applications" isDirectory:1]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 _bundleIDMapForAppsInDirectory:v13]);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v14, v15);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v8);
    }

    a1 = v16;
  }

  [*(id *)(a1 + 32) setMountInfo:v17];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");
}

void sub_100010E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100010E5C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }
}

id sub_100010F78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");
}

void sub_100011090( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000110A8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:*(void *)(a1 + 40)]);

  if (v3)
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void sub_1000111C4(uint64_t a1)
{
}

void sub_10001123C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0LL;
}

void sub_100011380( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100011398(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pendingMountPath]);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo", 0));
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      while (2)
      {
        for (CFIndex i = 0LL; i != v5; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(a1 + 40) hasPrefix:*(void *)(*((void *)&v8 + 1) + 8 * (void)i)])
          {
            *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
            goto LABEL_15;
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

void sub_1000115BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000115D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000115E4(uint64_t a1)
{
}

void sub_1000115EC(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100011758( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100011770(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000117F4;
  v5[3] = &unk_100080F70;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_1000117F4(uint64_t a1, uint64_t a2, void *a3, char *a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:*(void *)(a1 + 32)]);
  if (v6)
  {
    __int128 v11 = v6;
    id v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int128 v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v11;
    char v10 = 1;
  }

  else
  {
    char v10 = 0;
  }

  *a4 = v10;
}

void sub_100011930( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100011948(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000119CC;
  v5[3] = &unk_100080F70;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_1000119CC(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:*(void *)(a1 + 32)]);

  if (v6)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    *a4 = 0;
  }

void sub_100011AE0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mountInfo]);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100011B60;
  v3[3] = &unk_100080F98;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100011B60(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 allKeys]);
  [v5 addObjectsFromArray:v6];

  *a4 = 0;
}

uint64_t sub_100011D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  if ([v4 isEqualToString:@"app"])
  {
    id v55 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MIExecutableBundle bundleForURL:error:]( &OBJC_CLASS___MIExecutableBundle,  "bundleForURL:error:",  v3,  &v55));
    id v6 = v55;
    id v7 = v6;
    if (!v5)
    {
      if (sub_1000132A4(v6)) {
        goto LABEL_30;
      }
      uint64_t v19 = qword_100095BF8;
      if (qword_100095BF8)
      {
      }

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
      MOLogWrite(v19);
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 primaryPersonaString]);
    id v54 = v7;
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "entryForBundle:inContainer:forPersona:withError:",  v5,  0LL,  v10,  &v54));
    id v12 = v54;

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v8]);

      if (!v13)
      {
        uint64_t v41 = v12;
        __int128 v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        uint64_t v46 = v8;
        [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:v8];
        char v37 = v20;
        CFRange v44 = v11;
        -[NSMutableArray addObject:](v20, "addObject:", v11);
        __int128 v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        char v42 = v5;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 infoPlistSubset]);
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        uint64_t v39 = a1;
        id v23 = *(id *)(a1 + 40);
        id v24 = [v23 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v51;
          do
          {
            for (CFIndex i = 0LL; i != v25; CFIndex i = (char *)i + 1)
            {
              if (*(void *)v51 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v28]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, v28);
            }

            id v25 = [v23 countByEnumeratingWithState:&v50 objects:v56 count:16];
          }

          while (v25);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v3,  @"com.apple.MobileInstallation.bundleURL");
        id v30 = -[NSMutableDictionary copy](v21, "copy");
        [*(id *)(v39 + 48) setObject:v30 forKeyedSubscript:v46];

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_1000122A4;
        v48[3] = &unk_100080FC0;
        uint64_t v40 = v37;
        uint64_t v49 = v40;
        CFErrorRef v31 = objc_retainBlock(v48);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 primaryPersonaString]);
        id v47 = v41;
        uint64_t v38 = v31;
        char v35 = v31;
        id v5 = v42;
        LOBYTE(v30) = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:]( &OBJC_CLASS___MILaunchServicesDatabaseGatherer,  "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAp pExtensionsAreExecutable:installProfiles:error:enumerator:",  v42,  v33,  0LL,  0LL,  0LL,  &v47,  v35);
        id v7 = v47;

        __int128 v11 = v44;
        uint64_t v8 = v46;
        goto LABEL_28;
      }

      uint64_t v14 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
        CFRange v45 = v8;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleURL]);
        int v43 = v11;
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleURL]);
        id v7 = v12;
        CFErrorRef v36 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
        MOLogWrite(v14);

        __int128 v11 = v43;
        uint64_t v8 = v45;

LABEL_28:
        goto LABEL_29;
      }
    }

    else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      MOLogWrite(qword_100095BF8);
    }

    id v7 = v12;
    goto LABEL_28;
  }

LABEL_31:
  return 1LL;
}

  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 identifier]);
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v50]);

  if (v51)
  {
    __int128 v52 = (void *)MIInstallerErrorDomain;
    id obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray identifier](obj, "identifier"));
    id v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 identifier]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v56]);
    BOOL v99 = (void *)objc_claimAutoreleasedReturnValue([v57 path]);
    uint64_t v59 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performPreflightWithError:]",  625LL,  v52,  57LL,  0LL,  &off_10008ACC8,  @"The parent bundle has the same identifier (%@) as sub-bundle at %@",  v58,  (uint64_t)v53);
    v60 = objc_claimAutoreleasedReturnValue(v59);

    v61 = 0;
    uint64_t v8 = (id)v60;
    goto LABEL_37;
  }

  if (v5)
  {
    uint64_t v73 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
    -[NSMutableArray addObjectsFromArray:](v73, "addObjectsFromArray:", v74);

    BOOL v75 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    -[NSMutableArray addObjectsFromArray:](v73, "addObjectsFromArray:", v75);

    uint64_t v112 = 0u;
    uint64_t v113 = 0u;
    uint64_t v110 = 0u;
    uint64_t v111 = 0u;
    id obj = v73;
    size_t v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v110,  v132,  16LL);
    if (v76)
    {
      v77 = v76;
      uint64_t v78 = *(void *)v111;
      a3 = v100;
      while (2)
      {
        uint64_t v79 = 0LL;
        uint64_t v80 = v8;
        do
        {
          if (*(void *)v111 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v81 = *(void **)(*((void *)&v110 + 1) + 8LL * (void)v79);
          uint64_t v109 = v80;
          uint64_t v82 = [v81 setIsPlaceholderWithError:&v109];
          uint64_t v8 = v109;

          if (!v82)
          {

            v61 = 0;
            goto LABEL_38;
          }

          uint64_t v79 = (char *)v79 + 1;
          uint64_t v80 = v8;
        }

        while (v77 != v79);
        v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v110,  v132,  16LL);
        if (v77) {
          continue;
        }
        break;
      }
    }
  }

  uint64_t v83 = v8;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v85 = [v84 bundleType];

  if (v85 - 1 < 5 || v85 == 9)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v88 = v87;
    if (v86)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      int v90 = (void *)objc_claimAutoreleasedReturnValue([v89 bundle]);
      uint64_t v108 = v83;
      v91 = [v88 transferInstallationIdentityFromBundle:v90 error:&v108];
      uint64_t v8 = v108;

      if ((v91 & 1) == 0) {
        goto LABEL_69;
      }
    }

    else
    {
      v107 = v83;
      int v92 = [v87 makeAndSetNewInstallationIdentityWithError:&v107];
      uint64_t v8 = v107;

      if (!v92) {
        goto LABEL_69;
      }
    }

    uint64_t v83 = v8;
  }

  int v106 = v83;
  int v93 = -[MIInstallableBundle _verifyBundleMetadataWithError:](self, "_verifyBundleMetadataWithError:", &v106);
  uint64_t v8 = v106;

  if (v93)
  {
    int v94 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    int v105 = v8;
    uint64_t v95 = [v94 validatePluginKitMetadataWithError:&v105];
    id v12 = v105;

    a3 = v100;
    if (!v95) {
      goto LABEL_65;
    }
    uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    uint64_t v104 = v12;
    uint64_t v97 = [v96 validateExtensionKitMetadataWithError:&v104];
    uint64_t v8 = v104;

    if (v97)
    {
      uint64_t v103 = v8;
      v61 = -[MIInstallableBundle _installEmbeddedProfilesWithError:](self, "_installEmbeddedProfilesWithError:", &v103);
      obja = v8;
      uint64_t v8 = v103;

      goto LABEL_39;
    }

    goto LABEL_63;
  }

  return v13;
}

  __break(1u);
LABEL_32:
  __clrex();
  __break(1u);
  return result;
}

id sub_1000122A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_100012390(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100012410;
  v4[3] = &unk_100081010;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }
}

void sub_100012410(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    id v13 = v7;
    MOLogWrite(qword_100095BF8);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser",  v13));
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = 0LL;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 registerInstalledInfo:v8 onMountPoint:v10 forAppBundleID:v7 error:&v14]);
  id v12 = v14;

  if (v11)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5) {
LABEL_10:
    }
      MOLogWrite(qword_100095BF8);
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    goto LABEL_10;
  }

  *a4 = 0;
}

void sub_10001260C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v18 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v18]);
  id v5 = v18;

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    if ([*(id *)(a1 + 40) _isKnownPath:v6])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
    }

    else
    {
      [*(id *)(a1 + 40) _setPendingMountPath:v6];
      id v12 = *(void **)(a1 + 40);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Applications" isDirectory:1]);
      id v17 = 0LL;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_onQueue_scanApps:returnMapInfo:", v13, &v17));
      id v15 = v17;

      if ([v14 count])
      {
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          uint64_t v16 = v6;
          MOLogWrite(qword_100095BF8);
        }

        objc_msgSend(*(id *)(a1 + 40), "_addMountPath:withInfo:", v6, v15, v16);
        [*(id *)(a1 + 40) _clearPendingMountPath];
        objc_msgSend( *(id *)(a1 + 40),  "_onQueue_registerDiscoveredAppEntries:onMountPoint:completion:",  v14,  v4,  *(void *)(a1 + 48));
      }

      else
      {
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          uint64_t v16 = v6;
          MOLogWrite(qword_100095BF8);
        }

        objc_msgSend(*(id *)(a1 + 40), "_clearPendingMountPath", v16);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }
    }
  }

  else
  {
    id v7 = (void *)MIInstallerErrorDomain;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) path]);
    id v10 = sub_1000130F4( (uint64_t)"-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke",  409LL,  v7,  25LL,  v5,  0LL,  @"Failed to realpath image mount %@",  v9,  (uint64_t)v8);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v5 = (id)v11;
  }
}

void sub_100012928(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v15]);
  id v5 = v15;

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    if ([*(id *)(a1 + 40) _isKnownPath:v6])
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"Applications" isDirectory:1]);
      id v14 = 0LL;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_onQueue_scanApps:returnMapInfo:", v8, &v14));
      id v10 = v14;

      if ([v9 count])
      {
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v13 = v6;
          MOLogWrite(qword_100095BF8);
        }

        objc_msgSend( *(id *)(a1 + 40),  "_onQueue_registerDiscoveredAppEntries:onMountPoint:completion:",  v9,  v4,  0,  v13);
      }

      else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        MOLogWrite(qword_100095BF8);
      }

      goto LABEL_18;
    }

    uint64_t v12 = qword_100095BF8;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
    {
LABEL_18:

      goto LABEL_19;
    }

LABEL_19:
}

void sub_100012BFC(id *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v3 = a1[4];
  id v17 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v17]);
  id v5 = v17;

  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    if ([a1[5] _removeMountPath:v6])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([a1[5] lsRegisterQueue]);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100012DE8;
      v13[3] = &unk_100081038;
      id v14 = v4;
      id v15 = v6;
      id v16 = a1[6];
      MIRunTransactionalTask(v7, "com.apple.installd.unregister-content-diskImage", v13);
    }

    else
    {
      (*((void (**)(id))a1[6] + 2))(a1[6]);
    }
  }

  else
  {
    id v8 = (void *)MIInstallerErrorDomain;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] path]);
    id v11 = sub_1000130F4( (uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke",  481LL,  v8,  25LL,  v5,  0LL,  @"Failed to realpath image mount %@",  v10,  (uint64_t)v9);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);

    (*((void (**)(void))a1[6] + 2))();
    id v5 = (id)v12;
  }
}

void sub_100012DE8(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
  uint64_t v3 = a1[4];
  id v9 = 0LL;
  unsigned __int8 v4 = [v2 unregisterAppsAtMountPoint:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    id v7 = sub_1000130F4( (uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke_2",  499LL,  MIInstallerErrorDomain,  4LL,  v5,  0LL,  @"Unregistering applications failed for mount point %@",  v6,  a1[5]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);

    id v5 = (id)v8;
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

id sub_100012F40(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    uint64_t v19 = (NSMutableDictionary *)[v17 mutableCopy];
  }
  else {
    uint64_t v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  __int128 v20 = v19;
  if (v18)
  {
    __int128 v21 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  a8);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  NSLocalizedDescriptionKey);
  }

  if (v16) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  }
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, MIFunctionNameErrorKey);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v23,  MISourceFileLineErrorKey);

  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  a4,  v20));
  return v24;
}

id sub_1000130C8( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = sub_100012F40(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_1000130F4( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9 = sub_100013120(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_100013120(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id v16 = sub_100012F40(a1, a2, a3, a4, v15, a6, a7, a8);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocalizedDescriptionKey]);

  uint64_t v20 = qword_100095BF8;
  if (v15)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
      [v15 code];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
      MOLogWrite(v20);
    }
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    MOLogWrite(qword_100095BF8);
  }

  return v17;
}

BOOL sub_1000132A4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain] && objc_msgSend(v1, "code") == (id)12)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (id)11)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 domain]);
      else {
        BOOL v4 = 0LL;
      }
    }
  }

  return v4;
}

__CFString *sub_10001338C()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
    free(v1);
  }

  else
  {
    uint64_t v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

id sub_1000133E0(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3) & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t sub_100013434(void *a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass(*(void *)(*((void *)&v8 + 1) + 8LL * (void)v5)) & 1) == 0)
        {
          uint64_t v6 = 0LL;
          goto LABEL_11;
        }

        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = 1LL;
LABEL_11:

  return v6;
}

id sub_10001353C(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v1 count]));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (CFIndex i = 0LL; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v8) & 1) != 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  id v9 = [v2 copy];
  return v9;
}

uint64_t sub_100013684(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100013748;
  v8[3] = &unk_100081088;
  void v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_100013730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100013748(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass(v8) & 1) == 0 || a1[6] && (objc_opt_isKindOfClass(v7) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

id sub_1000137D0(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0) {
      id v2 = v1;
    }
    else {
      id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v1));
    }
    id v3 = v2;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10001384C(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_11;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    if (sub_100013434(v1))
    {
      id v2 = v1;
LABEL_7:
      id v3 = v2;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    id v6 = v1;
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    goto LABEL_7;
  }

  objc_opt_class(&OBJC_CLASS___NSSet);
  if ((objc_opt_isKindOfClass(v1) & 1) == 0)
  {
LABEL_11:
    id v3 = 0LL;
    goto LABEL_12;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 allObjects]);
  else {
    id v3 = 0LL;
  }

LABEL_12:
  return v3;
}

BOOL sub_100013970(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

void sub_100013EFC(id a1, NSError *a2)
{
  id v2 = a2;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v3 = v2;
    MOLogWrite(qword_100095BF8);
    id v2 = v3;
  }
}

void sub_1000140D0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v3 = v4;
    MOLogWrite(qword_100095BF8);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);
}

void sub_1000141CC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v3 = v4;
    MOLogWrite(qword_100095BF8);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);
}

uint64_t sub_10001430C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000148C0()
{
}

uint64_t sub_1000148CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32) != 0LL);
}

uint64_t sub_10001499C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 40)) {
    a3 = 0LL;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2,  a3);
}

void sub_100014CBC()
{
}

id sub_100014CC8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 xpcConnection]);
  id v7 = v5;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.mobileinstall.allowedSPI"]);
    if (v8)
    {
      objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v8) & 1) != 0)
      {
      }

      else
      {
        objc_opt_class(&OBJC_CLASS___NSArray);
      }

      __int128 v10 = 0LL;
LABEL_11:

      goto LABEL_12;
    }

LABEL_10:
    uint64_t v11 = (void *)MIInstallerErrorDomain;
    char v12 = (void *)objc_claimAutoreleasedReturnValue([v3 clientName]);
    id v14 = sub_1000130F4( (uint64_t)"_ValidateMIAllowedSPIEntitlement",  190LL,  v11,  2LL,  0LL,  &off_10008A9A8,  @"Process %@ is required to have an entitlement named %@ with an array containing %@ to call the MobileInstallation SPI.",  v13,  (uint64_t)v12);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v14);

    goto LABEL_11;
  }

  id v9 = sub_1000130F4( (uint64_t)"_ValidateMIAllowedSPIEntitlement",  192LL,  MIInstallerErrorDomain,  2LL,  0LL,  &off_10008A9D0,  @"XPCConnection object was nil so failing entitlement check",  v6,  v16);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_12:

  return v10;
}

  v9[2](v9, v11);
}

  uint64_t v126 = v12;
  id v17 = -[MIInstallableBundle _checkCanInstallWithError:](self, "_checkCanInstallWithError:", &v126);
  id v8 = v126;

  if (!v17) {
    goto LABEL_63;
  }
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v125 = v8;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 frameworkBundlesWithError:&v125]);
  char v12 = v125;

  -[MIInstallableBundle setFrameworkBundles:](self, "setFrameworkBundles:", v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));

  if (!v20) {
    goto LABEL_65;
  }
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v124 = v12;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 appExtensionBundlesWithError:&v124]);
  id v8 = v124;

  -[MIInstallableBundle setAppExtensionBundles:](self, "setAppExtensionBundles:", v22);
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));

  if (!v23) {
    goto LABEL_63;
  }
  v100 = a3;
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  -[MIInstallableBundle setIdentifiersMap:](self, "setIdentifiersMap:", v24);

  uint64_t v122 = 0u;
  uint64_t v123 = 0u;
  v120 = 0u;
  uint64_t v121 = 0u;
  id obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v120,  v134,  16LL);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v121;
LABEL_15:
    uint64_t v28 = 0LL;
    uint64_t v29 = v8;
    while (1)
    {
      if (*(void *)v121 != v27) {
        objc_enumerationMutation(obj);
      }
      id v30 = *(void **)(*((void *)&v120 + 1) + 8LL * (void)v28);
      v119 = v29;
      CFErrorRef v31 = [v30 executableExistsWithError:&v119];
      id v8 = v119;

      if (!v31) {
        goto LABEL_33;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 identifier]);
      int v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      CFErrorRef v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v32]);

      if (v34)
      {
        uint64_t v62 = (void *)MIInstallerErrorDomain;
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleURL]);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 path]);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v32]);
        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v66 path]);
        uint64_t v69 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performPreflightWithError:]",  603LL,  v62,  57LL,  0LL,  &off_10008AC78,  @"Found bundle at %@ with the same identifier (%@) as bundle at %@",  v68,  (uint64_t)v64);
LABEL_36:
        uint64_t v72 = objc_claimAutoreleasedReturnValue(v69);

        v61 = 0;
        id v8 = (id)v72;
        goto LABEL_37;
      }

      char v35 = (void *)objc_claimAutoreleasedReturnValue([v30 bundleURL]);
      CFErrorRef v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      [v36 setObject:v35 forKeyedSubscript:v32];

      uint64_t v28 = (char *)v28 + 1;
      uint64_t v29 = v8;
      if (v26 == v28)
      {
        uint64_t v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v120,  v134,  16LL);
        if (v26) {
          goto LABEL_15;
        }
        break;
      }
    }
  }

  uint64_t v117 = 0u;
  v118 = 0u;
  uint64_t v115 = 0u;
  BOOL v116 = 0u;
  id obj = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  char v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v115,  v133,  16LL);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v116;
LABEL_24:
    uint64_t v40 = 0LL;
    uint64_t v41 = v8;
    while (1)
    {
      if (*(void *)v116 != v39) {
        objc_enumerationMutation(obj);
      }
      char v42 = *(void **)(*((void *)&v115 + 1) + 8LL * (void)v40);
      uint64_t v114 = v41;
      int v43 = [v42 executableExistsWithError:&v114];
      id v8 = v114;

      if (!v43) {
        break;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue([v42 identifier]);
      CFRange v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      CFRange v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v32]);

      if (v45)
      {
        CFErrorRef v70 = (void *)MIInstallerErrorDomain;
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v42 bundleURL]);
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v63 path]);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v32]);
        uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v66 path]);
        uint64_t v69 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performPreflightWithError:]",  618LL,  v70,  57LL,  0LL,  &off_10008ACA0,  @"Found bundle at %@ with the same identifier (%@) as bundle at %@",  v71,  (uint64_t)v64);
        goto LABEL_36;
      }

      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v42 bundleURL]);
      id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle identifiersMap](self, "identifiersMap"));
      [v47 setObject:v46 forKeyedSubscript:v32];

      uint64_t v40 = (char *)v40 + 1;
      uint64_t v41 = v8;
      if (v38 == v40)
      {
        uint64_t v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v115,  v133,  16LL);
        if (v38) {
          goto LABEL_24;
        }
        goto LABEL_31;
      }
    }

  id v17 = 1;
LABEL_28:

  return v17;
}

  return v19;
}

void sub_100015908(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100015880LL);
  }

  JUMPOUT(0x10001591CLL);
}

uint64_t sub_100015924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100015934(uint64_t a1)
{
}

void sub_10001593C(uint64_t a1)
{
  uint64_t v11 = *(void *)(a1 + 32);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) identity]);
  id v4 = [*(id *)(a1 + 40) domain];
  id v10 = 0LL;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]( &OBJC_CLASS___MILaunchServicesOperationManager,  "registerInstalledInfo:forIdentity:inDomain:error:",  v2,  v3,  v4,  &v10));
  id v6 = v10;
  id v7 = v10;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v6);
  }
}

LABEL_21:
  return v33;
}

  id v25 = v24 == 0LL;

  return v25;
}

  return v18;
}

  return v12;
}

    uint64_t v5 = v5;
    __int128 v21 = 0;
    *a3 = v5;
    goto LABEL_25;
  }
    }

    id v30 = v12;
    uint64_t v28 = -[MIInstallableBundle _setLaunchWarningDataWithError:](self, "_setLaunchWarningDataWithError:", &v30);
    id v14 = v30;

    if ((v28 & 1) != 0) {
      goto LABEL_10;
    }
LABEL_23:
    char v12 = v14;
LABEL_24:
    if (a3) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }

id sub_100015E2C(void *a1)
{
  id v1 = a1;
  if ((objc_opt_isKindOfClass(v1) & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id sub_100015E74(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 xpcConnection]);
  id v2 = v1;
  if (v1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 valueForEntitlement:@"com.apple.private.installcoordinationd.daemon"]);
    id v4 = sub_1000133E0(v3, 0LL);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100016170()
{
  if (qword_100095AF8 != -1) {
    dispatch_once(&qword_100095AF8, &stru_100081358);
  }
  return (id)qword_100095AF0;
}

id sub_1000161B0(int a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  unsigned int v3 = [v2 installQOSOverride];

  if (v3)
  {
    uint64_t v4 = v3;
  }

  else if (a1)
  {
    uint64_t v4 = 25LL;
  }

  else
  {
    uint64_t v4 = 17LL;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v4, 0LL);
  return (id)objc_claimAutoreleasedReturnValue(global_queue);
}

uint64_t sub_100016290(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t sub_1000162C8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

LABEL_14:
  uint64_t v28 = (void *)v21;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10001672C;
  v41[3] = &unk_1000811F8;
  uint64_t v29 = v37;
  CFRange v44 = v29;
  id v30 = v28;
  char v42 = v30;
  CFErrorRef v31 = v20;
  int v43 = v31;
  -[MIClientConnection _callBlockAfterDelegateMessagesSend:dispatchBlock:]( self,  "_callBlockAfterDelegateMessagesSend:dispatchBlock:",  "com.apple.installd.staging-url-complete",  v41);
}

  return v18;
}

  return v21;
}

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
      id v30 = objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v29]);
LABEL_15:
      id v18 = (void *)v30;

      if (!v18) {
        goto LABEL_39;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"]);
      objc_opt_class(&OBJC_CLASS___NSURL);
      int v33 = v32;
      if ((objc_opt_isKindOfClass(v33) & 1) != 0) {
        CFErrorRef v34 = v33;
      }
      else {
        CFErrorRef v34 = 0LL;
      }

      char v35 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:kCFBundleVersionKey]);
      objc_opt_class(&OBJC_CLASS___NSString);
      CFErrorRef v36 = v35;
      if ((objc_opt_isKindOfClass(v36) & 1) != 0) {
        char v37 = v36;
      }
      else {
        char v37 = 0LL;
      }

      if (!v37)
      {
        int v43 = (void *)MIInstallerErrorDomain;
        CFRange v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        CFRange v45 = (void *)objc_claimAutoreleasedReturnValue([v44 identifier]);
        id v47 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]",  431LL,  v43,  4LL,  0LL,  0LL,  @"Failed to get CFBundleVersion from Info.plist of installed OS app with bundle ID %@",  v46,  (uint64_t)v45);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v47);

        goto LABEL_4;
      }

      uint64_t v67 = v34;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 infoPlistSubset]);
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:kCFBundleVersionKey]);
      objc_opt_class(&OBJC_CLASS___NSString);
      uint64_t v41 = v40;
      if ((objc_opt_isKindOfClass(v41) & 1) != 0) {
        char v42 = v41;
      }
      else {
        char v42 = 0LL;
      }

      if (v42)
      {
        uint64_t v48 = [v42 compare:v37 options:64];
        uint64_t v49 = -[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall");
        else {
          __int128 v50 = 0;
        }
        if ((v50 & 1) != 0 || v48 == (id)1) {
          goto LABEL_38;
        }
        __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
        __int128 v52 = [v51 allowsInternalSecurityPolicy];

        if (v52 && !v48)
        {
          __int128 v53 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
          {
            id v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v54 identifier]);
            MOLogWrite(v53);
          }

  return v21;
}

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier", v25));
        MOLogWrite(v22);

        goto LABEL_15;
      }

      id v25 = v21;
      MOLogWrite(qword_100095BF8);
      uint64_t v22 = qword_100095BF8;
    }

    if (!v22) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

void sub_100016720()
{
}

uint64_t sub_10001672C(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100016A40(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t sub_100016A74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_10001701C()
{
}

uint64_t sub_100017028(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32) != 0LL);
}

void sub_1000172F0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100017380;
  v4[3] = &unk_1000811A8;
  id v5 = *(id *)(a1 + 56);
  char v6 = *(_BYTE *)(a1 + 64);
  [v2 _finalizeStagedUpdateForUUID:v3 completion:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_100017380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 40)) {
    a3 = 0LL;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2,  a3);
}

uint64_t sub_10001739C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_100017448(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000178A4()
{
}

uint64_t sub_1000178B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16LL))( *(void *)(a1 + 56),  *(void *)(a1 + 32) != 0LL);
}

void sub_100017FBC()
{
}

uint64_t sub_100017FC8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1000180E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000183A4()
{
}

void sub_100018664()
{
}

void sub_100018954()
{
}

void sub_100018C68(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100018BE4LL);
  }

  JUMPOUT(0x100018C7CLL);
}

void sub_1000191DC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  id v5 = v2;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100021104;
  v39[3] = &unk_1000813C0;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 xpcConnection]);
  id v40 = v6;
  id v7 = objc_retainBlock(v39);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataDirectory]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"LastLaunchServicesMap.plist"]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  [v11 removeItemAtURL:v10 error:0];

  id v12 = sub_100014CC8(v3, @"EnumerateInstalledAppsForLaunchServices");
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    char v14 = 0;
  }

  else if (v4 {
         && ((objc_opt_class(&OBJC_CLASS___NSDictionary), id v15 = v4, (objc_opt_isKindOfClass(v15) & 1) == 0)
  }
           ? (id v16 = 0LL)
           : (id v16 = v15),
             v15,
             v16,
             !v16))
  {
    char v14 = 0;
    id v25 = sub_1000130F4( (uint64_t)"_DoEnumerationOfInstalledAppsWithOptions",  1327LL,  MIInstallerErrorDomain,  25LL,  0LL,  0LL,  @"Options provided was not a dictionary",  v17,  (uint64_t)v30);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v25);
  }

  else
  {
    uint64_t v18 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v3 clientName]);
      id v32 = v4;
      MOLogWrite(v18);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", @"UserRequestedAppDBRebuild", v30, v32));
    unsigned int v20 = sub_1000133E0(v19, 0LL);

    if (v20)
    {
      v33[0] = 1LL;
      if ((container_invalidate_code_signing_cache(v33) & 1) == 0
        && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
      {
        uint64_t v31 = v33[0];
        MOLogWrite(qword_100095BF8);
      }
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", @"OnlyScanPluginsUnderFrameworks", v31));
    unsigned int v22 = sub_1000133E0(v21, 0LL);

    if (v22)
    {
      uint64_t v23 = 1LL;
    }

    else
    {
      uint64_t v23 = 0LL;
    }

    sub_10004DBC0();
    char v14 = 1;
    id v24 = -[MILaunchServicesDatabaseGatherer initWithOptions:enumerator:]( objc_alloc(&OBJC_CLASS___MILaunchServicesDatabaseGatherer),  "initWithOptions:enumerator:",  v23,  v7);
    id v38 = 0LL;
    -[MILaunchServicesDatabaseGatherer performGatherWithError:](v24, "performGatherWithError:", &v38);
    id v13 = v38;
  }

  if ((v14 & 1) != 0) {
    sub_10004DBC8();
  }
  [v3 sendDelegateMessagesComplete];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000211E8;
  v33[3] = &unk_1000813E8;
  id v26 = v3;
  id v34 = v26;
  id v27 = v4;
  id v35 = v27;
  id v28 = v5;
  id v37 = v28;
  id v29 = v13;
  id v36 = v29;
  [v26 _callBlockAfterDelegateMessagesSend:"com.apple.installd.enumerate-installed-apps-complete" dispatchBlock:v33];
}

void sub_1000196E4()
{
}

void sub_100019C84()
{
}

void sub_100019C90(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v13]);

  if (v6)
  {
    uint64_t v7 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13, v13));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleURL]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleURL]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      MOLogWrite(v7);
    }
  }

  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v13];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10001A22C()
{
}

LABEL_27:
  ((void (**)(id, id, id))v10)[2](v10, v37, v81[5]);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v80, 8);
}

    unsigned int v22 = 1LL;
    goto LABEL_28;
  }

  unsigned int v22 = 1LL;
LABEL_29:

  return v22;
}

    uint64_t v17 = 0;
    char v14 = v12;
    goto LABEL_28;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  uint64_t v7 = [v6 needsDataContainer];

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personaUniqueString]);
    id v38 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dataContainerCreatingIfNeeded:1 forPersona:v10 makeLive:0 created:0 error:&v38]);
    id v12 = v38;

    if (!v11) {
      goto LABEL_24;
    }
    -[MIInstallableBundle setDataContainer:](self, "setDataContainer:", v11);
  }

  else
  {
    id v12 = 0LL;
  }

  id v37 = v12;
  id v13 = -[MIInstallableBundle _postFlightAppExtensionsWithError:](self, "_postFlightAppExtensionsWithError:", &v37);
  char v14 = v37;

  if (!v13) {
    goto LABEL_23;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  id v16 = [v15 isPlaceholder];

  if ((v16 & 1) == 0)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    id v36 = v14;
    uint64_t v19 = [v18 makeExecutableWithError:&v36];
    id v12 = v36;

    if (!v19) {
      goto LABEL_24;
    }
    if (-[MIInstallableBundle xpcServiceBundlesEnabled](self, "xpcServiceBundlesEnabled"))
    {
      id v34 = 0u;
      id v35 = 0u;
      id v32 = 0u;
      int v33 = 0u;
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
      __int128 v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21)
      {
        unsigned int v22 = v21;
        uint64_t v23 = *(void *)v33;
LABEL_15:
        id v24 = 0LL;
        id v25 = v12;
        while (1)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          id v26 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v24);
          uint64_t v31 = v25;
          id v27 = [v26 makeExecutableWithError:&v31];
          id v12 = v31;

          if (!v27) {
            break;
          }
          id v24 = (char *)v24 + 1;
          id v25 = v12;
          if (v22 == v24)
          {
            unsigned int v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v22) {
              goto LABEL_15;
            }
            goto LABEL_21;
          }
        }

        if (a3) {
          goto LABEL_25;
        }
        goto LABEL_27;
      }

  return v24;
}

void sub_10001ADF0()
{
}

void sub_10001ADFC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) legacySinfInfoDictionary]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v7 + 40);
  LOBYTE(v3) = [v2 updateSINFMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 parsedSINF Info:v6 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

void sub_10001B608()
{
}

void sub_10001B614(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_opt_new(&OBJC_CLASS___NSUUID);
  id v5 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dictionaryRepresentation]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v7 + 40);
  LOBYTE(v3) = [v2 updateiTunesMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 metadata Plist:v6 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

void sub_10001B9D8()
{
}

LABEL_2:
  v15[2](v15, v17);
}

  if (v14)
  {
    uint64_t v71 = v20;
    __int128 v21 = [v15 revokeTemporaryReference:v14 wasLastReference:&v74 error:&v71];
    unsigned int v22 = v71;

    if ((v21 & 1) != 0)
    {
      v58 = v17;
      uint64_t v23 = 0LL;
      id v24 = 0LL;
      id v25 = 0LL;
LABEL_5:
      *a8 = v23;
      *a7 = v74;
      id v26 = 1;
      uint64_t v17 = v58;
      goto LABEL_52;
    }

    id v30 = v18;
    goto LABEL_25;
  }

  uint64_t v69 = v20;
  CFErrorRef v70 = 0LL;
  id v29 = [v15 removeReferenceForIdentity:v13 inDomain:v62 forUserWithID:v16 wasLastReference:&v74 resultingPersonaUniqueStrings:&v70 error:&v69];
  v57 = v70;
  v56 = v69;

  if ((v29 & 1) != 0)
  {
    id v55 = v15;
    v58 = v17;
    id v54 = a7;
    if (v74)
    {
      id v24 = 0LL;
      uint64_t v23 = 0LL;
    }

    else
    {
      uint64_t v31 = objc_opt_new(&OBJC_CLASS___MIUninstallRecord);
      __int128 v53 = v13;
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
      -[MIUninstallRecord setBundleIdentifier:](v31, "setBundleIdentifier:", v32);

      int v33 = (void *)objc_claimAutoreleasedReturnValue([v18 bundle]);
      -[MIUninstallRecord setIsPlaceholder:](v31, "setIsPlaceholder:", [v33 isPlaceholder]);

      __int128 v52 = v18;
      -[MIUninstallRecord setHasParallelPlaceholder:]( v31,  "setHasParallelPlaceholder:",  [v18 hasParallelPlaceholder]);
      [v61 addObject:v31];
      uint64_t v67 = 0u;
      uint64_t v68 = 0u;
      uint64_t v65 = 0u;
      uint64_t v66 = 0u;
      id v34 = v60;
      id v35 = [v34 countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v35)
      {
        id v36 = v35;
        id v24 = 0LL;
        id v37 = *(void *)v66;
        do
        {
          for (CFIndex i = 0LL; i != v36; CFIndex i = (char *)i + 1)
          {
            uint64_t v39 = v24;
            if (*(void *)v66 != v37) {
              objc_enumerationMutation(v34);
            }
            id v40 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
            uint64_t v64 = 0LL;
            id v24 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v40,  v62,  &v64,  v50,  v51));
            uint64_t v41 = v64;

            if (v24)
            {
              char v42 = (void *)objc_claimAutoreleasedReturnValue([v24 bundle]);
              int v43 = objc_opt_new(&OBJC_CLASS___MIUninstallRecord);
              CFRange v44 = (void *)objc_claimAutoreleasedReturnValue([v42 identifier]);
              -[MIUninstallRecord setBundleIdentifier:](v31, "setBundleIdentifier:", v44);

              -[MIUninstallRecord setIsPlaceholder:](v31, "setIsPlaceholder:", [v42 isPlaceholder]);
              -[MIUninstallRecord setHasParallelPlaceholder:]( v31,  "setHasParallelPlaceholder:",  [v24 hasParallelPlaceholder]);
              [v61 addObject:v43];
            }

            else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              __int128 v50 = v40;
              __int128 v51 = v41;
              MOLogWrite(qword_100095BF8);
            }
          }

          id v36 = [v34 countByEnumeratingWithState:&v65 objects:v75 count:16];
        }

        while (v36);
      }

      else
      {
        id v24 = 0LL;
      }

      uint64_t v23 = 2LL;
      uint64_t v18 = v52;
      id v13 = v53;
      id v15 = v55;
      char v14 = 0LL;
      a7 = v54;
    }

    if (!v57)
    {
      id v25 = 0LL;
      unsigned int v22 = v56;
      goto LABEL_5;
    }

    id v30 = v18;
    CFRange v45 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
    uint64_t v63 = v56;
    id v47 = [v45 setPersonaUniqueStrings:v57 forAppBundleID:v46 inDomain:v62 error:&v63];
    unsigned int v22 = v63;

    if ((v47 & 1) != 0)
    {
      id v15 = v55;
      char v14 = 0LL;
      uint64_t v18 = v30;
      a7 = v54;
      id v25 = v57;
      goto LABEL_5;
    }

    id v15 = v55;
    char v14 = 0LL;
    uint64_t v17 = v58;
  }

  else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
  {
    id v30 = v18;
    id v24 = 0LL;
    unsigned int v22 = v56;
  }

  else
  {
    id v30 = v18;
    unsigned int v22 = v56;
    MOLogWrite(qword_100095BF8);
    id v24 = 0LL;
  }

  id v25 = v57;
LABEL_48:
  if (a9)
  {
    uint64_t v48 = v25;
    unsigned int v22 = v22;
    id v25 = v48;
    id v26 = 0;
    *a9 = v22;
  }

  else
  {
    id v26 = 0;
  }

  uint64_t v18 = v30;
LABEL_52:

  return v26;
}

      id v10 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer", v56));
      if (!v10
        || (uint64_t v11 = (void *)v10,
            id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer")),
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundle]),
            v13,
            v12,
            v11,
            !v9)
        || !v13)
      {
        id v26 = qword_100095BF8;
        if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v57 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
          MOLogWrite(v26);
        }

        goto LABEL_72;
      }

      char v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundle]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:0 che ckingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0]);

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 entitlements]);
      uint64_t v18 = sub_100045820(v17);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v16 && v19)
      {
        unsigned int v20 = [v6 codeSignerType];
        __int128 v21 = [v16 codeSignerType];
        if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall")) {
          goto LABEL_8;
        }
        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 bundle]);
        if ([v39 isPlaceholder])
        {
          if (v20 == (id)2)
          {

LABEL_53:
            uint64_t v48 = qword_100095BF8;
            goto LABEL_70;
          }

          __int128 v50 = sub_1000458E0(v7);

          if ((v50 & 1) != 0) {
            goto LABEL_53;
          }
          id v47 = 0;
          CFRange v45 = v21 == (id)2;
        }

        else
        {

          CFRange v45 = v21 == (id)2;
          uint64_t v46 = v20 == (id)2;
          id v47 = v20 == (id)2;
          if (v46 && v21 == (id)2)
          {
            uint64_t v48 = qword_100095BF8;
            goto LABEL_70;
          }
        }

        if (sub_1000458E0(v7)
          && (__int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v16 entitlements]),
              __int128 v52 = sub_1000458E0(v51),
              v51,
              v52))
        {
          uint64_t v48 = qword_100095BF8;
        }

        else if (v47 {
               && (__int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v16 entitlements]),
        }
                   id v54 = sub_1000458E0(v53),
                   v53,
                   v54))
        {
          uint64_t v48 = qword_100095BF8;
        }

        else
        {
          if ((sub_1000458E0(v7) & v45) != 1)
          {
LABEL_8:
            if ([v9 isEqualToString:v19])
            {
LABEL_71:

LABEL_72:
              id v34 = 0LL;
              id v35 = 1;
              goto LABEL_73;
            }

            unsigned int v22 = sub_10004588C(v7);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            id v25 = v23;
            if (v23 && [v23 containsObject:v19])
            {

              goto LABEL_71;
            }

            uint64_t v49 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]",  1207LL,  MIInstallerErrorDomain,  64LL,  0LL,  &off_10008AD40,  @"Upgrade's application-identifier entitlement string (%@) does not match installed application's application-identifier string (%@); rejecting upgrade.",
                    v24,
                    (uint64_t)v9);
            id v34 = (id)objc_claimAutoreleasedReturnValue(v49);

            if (!a4) {
              goto LABEL_51;
            }
            goto LABEL_25;
          }

          uint64_t v48 = qword_100095BF8;
        }

void sub_10001BE2C()
{
}

void sub_10001C1CC()
{
}

void sub_10001C4E0()
{
}

void sub_10001C848(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001C7C4LL);
  }

  JUMPOUT(0x10001C85CLL);
}

LABEL_4:
  if (*((_BYTE *)v61 + 24))
  {
    if (!v21) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  uint64_t v49 = 0LL;
  unsigned int v22 = [v20 saveBundleMetadata:v18 withError:&v49];
  uint64_t v23 = v49;

  if (v21) {
LABEL_12:
  }
    sub_10004D608(v13);
LABEL_13:
  ((void (**)(id, id))v14)[2](v14, v65[5]);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
}

  id v12 = v5;
LABEL_8:

  return v12;
}

void sub_10001CE6C()
{
}

void sub_10001CE78(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  uint64_t v3 = a1[4];
  id v4 = objc_opt_new(&OBJC_CLASS___NSUUID);
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v8 + 40);
  LOBYTE(v3) = [v2 updatePlaceholderMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 ins tallType:v6 failure:v7 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v3;
}

void sub_10001D224()
{
}

void sub_10001D3D8()
{
}

void sub_10001D73C()
{
}

void sub_10001DD84()
{
}

void sub_10001DDA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) domain];
  id v11 = 0LL;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:]( &OBJC_CLASS___MILaunchServicesOperationManager,  "registerInstalledInfo:forAppBundleID:personas:inDomain:error:",  v2,  v3,  v4,  v5,  &v11));
  id v7 = v11;
  id v8 = v11;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL), v7);
  }
}

void sub_10001E4DC()
{
}

void sub_10001EC40(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001EBBCLL);
  }

  JUMPOUT(0x10001EC54LL);
}

void sub_10001F140(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001F0B8LL);
  }

  JUMPOUT(0x10001F154LL);
}

void sub_10001F640(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001F5B8LL);
  }

  JUMPOUT(0x10001F654LL);
}

void sub_10001F92C()
{
}

void sub_10001FB5C(_Unwind_Exception *a1)
{
}

void sub_100020468()
{
}

void sub_100020474( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000204A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
  }

  else
  {
    id v7 = (void *)objc_opt_new(&OBJC_CLASS___LSOperationRequestContext);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 40)));
    [v7 setTargetUserID:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 legacyRecordDictionary]);
    __int128 v21 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v20 = 0LL;
    unsigned __int8 v12 = [v9 registerApplicationForRebuildWithInfoDictionaries:v11 requestContext:v7 registrationError:&v20];
    id v13 = v20;
    id v14 = v20;

    uint64_t v15 = qword_100095BF8;
    if ((v12 & 1) != 0)
    {
    }

    else
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
        MOLogWrite(v15);
      }

      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v18 = *(void *)(v16 + 40);
      uint64_t v17 = (id *)(v16 + 40);
      if (!v18) {
        objc_storeStrong(v17, v13);
      }
    }
  }
}

void sub_100020A70()
{
}

void sub_10002100C()
{
}

void sub_100021018(_Unwind_Exception *a1)
{
}

void sub_10002106C(id a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  dispatch_semaphore_t v1 = dispatch_semaphore_create((uint64_t)[v3 nSimultaneousInstallations]);
  uint64_t v2 = (void *)qword_100095AF0;
  qword_100095AF0 = (uint64_t)v1;
}

void sub_1000210B4(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobileinstallation.enumeration", v4);
  id v3 = (void *)qword_100095B08;
  qword_100095B08 = (uint64_t)v2;
}

void sub_100021104(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:&stru_100081398]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 legacyRecordDictionary]);

  [v8 enumerateAppDictionary:v7 error:v5];
}

void sub_10002118C(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v3 = v2;
    MOLogWrite(qword_100095BF8);
    dispatch_queue_t v2 = v3;
  }
}

uint64_t sub_1000211E8(uint64_t a1)
{
  uint64_t v2 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientName]);
    MOLogWrite(v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10002192C(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100095B10;
  qword_100095B10 = (uint64_t)v1;
}

void sub_100021EDC()
{
}

LABEL_12:
  return v29;
}

void sub_100023C2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100023C54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100023C64(uint64_t a1)
{
}

uint64_t sub_100023C6C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    if ([v7 isEqualToString:@"app"])
    {
      id v36 = 0LL;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MIExecutableBundle bundleForURL:error:]( &OBJC_CLASS___MIExecutableBundle,  "bundleForURL:error:",  v6,  &v36));
      id v9 = v36;
      if (!v8)
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8LL);
        id v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v9;

        goto LABEL_20;
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      if ([v10 isEqualToString:*(void *)(a1 + 32)])
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8LL);
        id v14 = *(void **)(v11 + 40);
        uint64_t v13 = (id *)(v11 + 40);
        unsigned __int8 v12 = v14;
        if (v14)
        {
          id v35 = (void *)MIInstallerErrorDomain;
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleURL]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
          id v18 = sub_1000130F4( (uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke",  437LL,  v35,  181LL,  0LL,  &off_10008AA48,  @"Multiple .app bundles with the bundle ID %@ were found within the installable: both %@ and %@ have this bundle ID.",  v17,  v15);
          uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
          uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8LL);
          __int128 v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

LABEL_20:
          uint64_t v22 = 0LL;
LABEL_28:

          goto LABEL_29;
        }

        objc_storeStrong(v13, v8);
      }

      else
      {
        uint64_t v27 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
          uint64_t v31 = v10;
          int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) path]);
          id v30 = v28;
          MOLogWrite(v27);
        }

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v10, v30, v31, v33);
      }
    }

    else
    {
      if ([v7 isEqualToString:@"bundle"])
      {
        uint64_t v23 = qword_100095BF8;
      }

      else
      {
        uint64_t v23 = qword_100095BF8;
        if (qword_100095BF8)
        {
        }
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      MOLogWrite(v23);
    }

LABEL_70:
                char v42 = v37;
                goto LABEL_67;
              }

              v100 = (unint64_t)v20;
              uint64_t v103 = v29;
              if (v20 == (id)3)
              {
                id v47 = (void *)objc_claimAutoreleasedReturnValue([v29 bundle]);
                uint64_t v48 = [v47 isPlaceholder];

                if ((v48 & 1) == 0)
                {
                  uint64_t v49 = qword_100095BF8;
                  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
                  {
                    v84 = objc_claimAutoreleasedReturnValue([v18 identifier]);
                    MOLogWrite(v49);
                  }
                }
              }

              uint64_t v96 = 0;
LABEL_45:
              v107 = 0;
              id v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL", v84, v85));
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
              int v106 = v30;
              v56 = objc_claimAutoreleasedReturnValue( -[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]( self,  "_manifestPathForBase:withIdentifier:patchType:error:",  v54,  v55,  &v107,  &v106));
              uint64_t v16 = v106;

              v57 = (void *)v56;
              if (v56)
              {
                if (v96)
                {
                  v58 = (void *)MIInstallerErrorDomain;
                  uint64_t v59 = v107 - 1;
                  if (v59 > 2) {
                    v60 = @"Invalid";
                  }
                  else {
                    v60 = *(&off_1000814A0 + (char)v59);
                  }
                  uint64_t v73 = objc_claimAutoreleasedReturnValue([v18 identifier]);
                  BOOL v75 = sub_1000130F4( (uint64_t)"-[MIInstaller _discoverInstallableWithError:]",  771LL,  v58,  8LL,  0LL,  &off_10008AA98,  @"%@ patch submitted for application %@ that's not installed. Failing.",  v74,  (uint64_t)v60);
LABEL_62:
                  uint64_t v79 = objc_claimAutoreleasedReturnValue(v75);

                  uint64_t v16 = (id)v73;
                  id v29 = v103;
LABEL_63:

                  uint64_t v16 = (id)v79;
LABEL_64:

                  goto LABEL_65;
                }

                uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v103 bundle]);
                uint64_t v68 = [v67 isPlaceholder];

                if (v68)
                {
                  CFErrorRef v70 = (void *)MIInstallerErrorDomain;
                  uint64_t v71 = v107 - 1;
                  if (v71 > 2) {
                    uint64_t v72 = @"Invalid";
                  }
                  else {
                    uint64_t v72 = *(&off_1000814A0 + (char)v71);
                  }
                  uint64_t v73 = objc_claimAutoreleasedReturnValue([v18 identifier]);
                  BOOL v75 = sub_1000130F4( (uint64_t)"-[MIInstaller _discoverInstallableWithError:]",  774LL,  v70,  8LL,  0LL,  &off_10008AAC0,  @"%@ patch submitted for application %@ that's just a placeholder. Failing.",  v78,  (uint64_t)v72);
                  goto LABEL_62;
                }

                if ((v100 & 0xFFFFFFFFFFFFFFFELL) == 2)
                {
                  size_t v76 = v107 - 1;
                  if (v76 > 2) {
                    v77 = @"Invalid";
                  }
                  else {
                    v77 = *(&off_1000814A0 + (char)v76);
                  }
                  id v29 = v103;
                  uint64_t v83 = sub_1000130F4( (uint64_t)"-[MIInstaller _discoverInstallableWithError:]",  777LL,  MIInstallerErrorDomain,  25LL,  v16,  0LL,  @"%@ patch supplied but install target type was placeholder or downgrade. This doesn't make sense.",  v69,  (uint64_t)v77);
                  uint64_t v79 = objc_claimAutoreleasedReturnValue(v83);
                  goto LABEL_63;
                }

                int v93 = objc_alloc(&OBJC_CLASS___MIInstallableBundlePatch);
                uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
                int v90 = -[MIInstaller packageFormat](self, "packageFormat");
                uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
                v88 = -[MIInstaller installationDomain](self, "installationDomain");
                uint64_t v102 = (void *)v56;
                uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
                int v105 = v16;
                LOBYTE(v87) = v107;
                id v29 = v103;
                id v37 = -[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:]( v93,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBu ndleContainer:patchType:operationType:error:",  v18,  v98,  v90,  v81,  v88,  v82,  v56,  v103,  v87,  -[MIInstaller installOperationType](self, "installOperationType"),  &v105);
                uint64_t v66 = v105;

                v57 = v102;
                uint64_t v16 = v66;
                if (!v37) {
                  goto LABEL_64;
                }
              }

              else
              {
                id v29 = v103;
                if (v16) {
                  goto LABEL_64;
                }
                uint64_t v101 = objc_alloc(&OBJC_CLASS___MIInstallableBundle);
                int v92 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
                uint64_t v97 = -[MIInstaller packageFormat](self, "packageFormat");
                v61 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
                uint64_t v62 = -[MIInstaller installationDomain](self, "installationDomain");
                uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
                uint64_t v64 = -[MIInstaller installOperationType](self, "installOperationType");
                uint64_t v104 = 0LL;
                uint64_t v65 = v62;
                v57 = 0LL;
                id v37 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:]( v101,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContaine r:operationType:error:",  v18,  v92,  v97,  v61,  v65,  v63,  v103,  v64,  &v104);
                uint64_t v16 = v104;

                id v29 = v103;
                uint64_t v66 = v16;
                if (!v37) {
                  goto LABEL_64;
                }
              }

              uint64_t v16 = v66;
              goto LABEL_70;
            }

            int v43 = qword_100095BF8;
            if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              v84 = objc_claimAutoreleasedReturnValue([v18 identifier]);
              MOLogWrite(v43);
            }

            uint64_t v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v84));
            uint64_t v109 = v30;
            CFRange v44 = [v29 removeUnderlyingContainerWaitingForDeletion:0 error:&v109];
            CFRange v45 = v109;

            if ((v44 & 1) != 0)
            {
              uint64_t v46 = (void *)v95;
            }

            else
            {
              uint64_t v46 = (void *)v95;
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                v84 = v95;
                uint64_t v85 = v45;
                MOLogWrite(qword_100095BF8);
              }

              CFRange v45 = 0LL;
            }

            id v30 = v45;
          }

          if (v20 == (id)3)
          {
            __int128 v50 = (void *)MIInstallerErrorDomain;
            __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
            __int128 v53 = sub_1000130F4( (uint64_t)"-[MIInstaller _discoverInstallableWithError:]",  760LL,  v50,  26LL,  0LL,  0LL,  @"Application %@ not found to downgrade to placeholder.",  v52,  (uint64_t)v51);
            uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(v53);

            id v29 = 0LL;
            goto LABEL_65;
          }

          v100 = (unint64_t)v20;
          uint64_t v103 = 0LL;
          uint64_t v96 = 1;
          goto LABEL_45;
        }

        id v38 = (void *)MIInstallerErrorDomain;
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleURL]);
        v86 = (void *)objc_claimAutoreleasedReturnValue([v39 path]);
        uint64_t v41 = sub_1000130F4( (uint64_t)"-[MIInstaller _discoverInstallableWithError:]",  819LL,  v38,  4LL,  0LL,  0LL,  @"Got unexpected bundle type %d at %@",  v40,  v27);
        uint64_t v23 = (id)objc_claimAutoreleasedReturnValue(v41);

LABEL_23:
        uint64_t v16 = v23;
LABEL_24:
        if (a3) {
          goto LABEL_25;
        }
        goto LABEL_66;
      default:
        id v14 = (void *)MIInstallerErrorDomain;
        v84 = -[MIInstaller packageFormat](self, "packageFormat");
        unsigned __int8 v12 = @"Unknown package format: %hhu";
        uint64_t v13 = 689LL;
        uint64_t v11 = v14;
        goto LABEL_6;
    }
  }

  uint64_t v11 = (void *)MIInstallerErrorDomain;
  unsigned __int8 v12 = @"Caller did not supply bundle identifer in install options";
  uint64_t v13 = 672LL;
LABEL_6:
  uint64_t v15 = sub_1000130F4((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", v13, v11, 4LL, 0LL, 0LL, v12, v7, v84);
  uint64_t v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = 0LL;
  id v18 = 0LL;
  if (!a3)
  {
LABEL_66:
    char v42 = 0LL;
    goto LABEL_67;
  }

        MOLogWrite(v48);
        goto LABEL_71;
      }

      if (-[MIInstallableBundle isPlaceholderInstall](self, "isPlaceholderInstall"))
      {
        id v36 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          v58 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
          MOLogWrite(v36);
        }

        goto LABEL_71;
      }

      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 identifier]);

      char v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
      int v43 = (void *)objc_claimAutoreleasedReturnValue([v42 bundle]);
      CFRange v44 = [v43 isPlaceholder];

      if (v44)
      {
      }

      else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
      {
        goto LABEL_46;
      }

      MOLogWrite(qword_100095BF8);
LABEL_46:

      goto LABEL_71;
    }
  }

  else
  {
  }

  int v33 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]",  1129LL,  MIInstallerErrorDomain,  63LL,  0LL,  &off_10008AD18,  @"Application is missing the application-identifier entitlement.",  v30,  (uint64_t)v56);
  id v34 = (id)objc_claimAutoreleasedReturnValue(v33);
  if (!a4)
  {
LABEL_51:
    id v35 = 0;
    goto LABEL_73;
  }

    __int128 v21 = (void *)v65;
LABEL_71:
    uint64_t v41 = a6;
LABEL_72:

    id v10 = v63;
    if (v41)
    {
      id v18 = v18;
      uint64_t v20 = 0;
      *uint64_t v41 = v18;
    }

    else
    {
      uint64_t v20 = 0;
    }

    goto LABEL_5;
  }

  if (v19)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      int v33 = "install";
      if (v12 == 1) {
        int v33 = "update";
      }
      if (v12 == 2) {
        int v33 = "restore";
      }
      v58 = v19;
      uint64_t v59 = v66;
      v57 = (const __CFString *)v33;
      MOLogWrite(qword_100095BF8);
    }
  }

  else
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      id v38 = "install";
      if (v12 == 1) {
        id v38 = "update";
      }
      if (v12 == 2) {
        id v38 = "restore";
      }
      v57 = v66;
      v58 = (const __CFString *)v38;
      MOLogWrite(qword_100095BF8);
    }

    uint64_t v19 = 0LL;
  }

  id v28 = 1;
LABEL_61:
  if (!v23) {
    goto LABEL_3;
  }
  if (!v28) {
    goto LABEL_67;
  }
  if (v19)
  {
    __int128 v21 = (void *)v65;
  }

  else
  {
    __int128 v21 = (void *)v65;
    uint64_t v19 = 0LL;
  }

  uint64_t v20 = 1;
LABEL_5:

  return v20;
}

void sub_1000250E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100025108(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    if ([v7 isEqualToString:@"mobileprovision"]
      && (uint64_t v8 = MIInstallProfileAtURL(v6),
          MIIsFatalMISProfileInstallationError(v8, *(unsigned __int8 *)(a1 + 48))))
    {
      id v9 = (void *)MIInstallerErrorDomain;
      v22[0] = @"LegacyErrorString";
      v22[1] = MILibMISErrorNumberKey;
      v23[0] = @"ApplicationVerificationFailed";
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
      v23[1] = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installURL]);
      uint64_t v13 = MIErrorStringForMISError(v8);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = sub_1000130F4( (uint64_t)"-[MIInstaller _installProvisioningProfilesAtStagingRootWithError:]_block_invoke",  887LL,  v9,  13LL,  0LL,  v11,  @"Failed to install local provisioning profile at staging root for %@ : 0x%08x (%@)",  v14,  (uint64_t)v12);
      uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = 0LL;
    }

    else
    {
      uint64_t v19 = 1LL;
    }
  }

  else
  {
    uint64_t v19 = 1LL;
  }

  return v19;
}

LABEL_22:
    id v15 = 5LL;
    goto LABEL_34;
  }

  uint64_t v16 = 0LL;
LABEL_35:
  v100 = v16;
  _MILogTransactionStep(v16, 1LL, 1LL, v9, v101, 0LL, v11, v12, v96);
  id v35 = mach_absolute_time();
  if (v5)
  {
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 bundleURL]);
    uint64_t v39 = v121;
    id obj = v121[5];
    id v40 = [v36 validateSymlinksInURLDoNotEscapeURL:v38 error:&obj];
    objc_storeStrong(v39 + 5, obj);

    if ((v40 & 1) == 0)
    {
      v57 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 bundleURL]);
        uint64_t v97 = (id)objc_claimAutoreleasedReturnValue([v59 path]);
        MOLogWrite(v57);
      }

      uint64_t v49 = 0LL;
      goto LABEL_119;
    }
  }

  int v43 = objc_autoreleasePoolPush();
  if (qword_100095B28 != -1) {
    dispatch_once(&qword_100095B28, &stru_100081480);
  }
  CFRange v44 = (os_log_s *)(id)qword_100095B20;
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "PreflightAndPatch",  "Start preflighting and patching",  buf,  2u);
  }

  CFRange v45 = v121 + 5;
  uint64_t v117 = v121[5];
  uint64_t v46 = [v7 performPreflightWithError:&v117];
  objc_storeStrong(v45, v117);
  if ((v46 & 1) != 0)
  {
    -[MIInstaller setPreflightAndPatchTime:]( self,  "setPreflightAndPatchTime:",  (mach_absolute_time() - v35) * qword_100095C00 / HIDWORD(qword_100095C00));
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    id v47 = (os_log_s *)(id)qword_100095B20;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "PreflightAndPatch",  "End preflighting and patching [succeeded]",  buf,  2u);
    }

    uint64_t v48 = 0;
  }

  else
  {
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    id v47 = (os_log_s *)(id)qword_100095B20;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v47,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "PreflightAndPatch",  "End preflighting and patching [failed]",  buf,  2u);
    }

    uint64_t v48 = 10;
  }

  objc_autoreleasePoolPop(v43);
  uint64_t v49 = 0LL;
  if (v48 != 10)
  {
    __int128 v50 = mach_absolute_time();
    __int128 v51 = objc_autoreleasePoolPush();
    if (qword_100095B28 != -1) {
      dispatch_once(&qword_100095B28, &stru_100081480);
    }
    __int128 v52 = (os_log_s *)(id)qword_100095B20;
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v52,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Verification",  "Start code sign verification",  buf,  2u);
    }

    __int128 v53 = v121 + 5;
    BOOL v116 = v121[5];
    id v54 = [v7 performVerificationWithError:&v116];
    objc_storeStrong(v53, v116);
    if ((v54 & 1) != 0)
    {
      -[MIInstaller setVerificationTime:]( self,  "setVerificationTime:",  (mach_absolute_time() - v50) * qword_100095C00 / HIDWORD(qword_100095C00));
      if (qword_100095B28 != -1) {
        dispatch_once(&qword_100095B28, &stru_100081480);
      }
      id v55 = (os_log_s *)(id)qword_100095B20;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Verification",  "End code sign verification [succeeded]",  buf,  2u);
      }

      v56 = 0;
    }

    else
    {
      if (qword_100095B28 != -1) {
        dispatch_once(&qword_100095B28, &stru_100081480);
      }
      id v55 = (os_log_s *)(id)qword_100095B20;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v55,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Verification",  "End code sign verification [failed]",  buf,  2u);
      }

      v56 = 10;
    }

    objc_autoreleasePoolPop(v51);
    uint64_t v49 = 0LL;
    if (v56 != 10)
    {
      v60 = objc_autoreleasePoolPush();
      v61 = v121 + 5;
      uint64_t v115 = v121[5];
      uint64_t v62 = [v7 performInstallationWithError:&v115];
      objc_storeStrong(v61, v115);
      if ((v62 & 1) != 0)
      {
        uint64_t v63 = 0;
      }

      else
      {
        uint64_t v63 = 10;
      }

      objc_autoreleasePoolPop(v60);
      uint64_t v49 = 0LL;
      if (v63 != 10)
      {
        uint64_t v64 = objc_autoreleasePoolPush();
        uint64_t v65 = v121 + 5;
        uint64_t v114 = v121[5];
        uint64_t v66 = [v7 postFlightInstallationWithError:&v114];
        objc_storeStrong(v65, v114);
        if ((v66 & 1) != 0)
        {
          uint64_t v67 = 0;
        }

        else
        {
          uint64_t v67 = 10;
        }

        objc_autoreleasePoolPop(v64);
        uint64_t v49 = 0LL;
        if (v67 != 10)
        {
          uint64_t v68 = objc_autoreleasePoolPush();
          if (v98 == 1)
          {
            uint64_t v69 = v121;
            uint64_t v112 = v121[5];
            uint64_t v113 = 0LL;
            CFErrorRef v70 = [v7 stageBackgroundUpdate:&v113 withError:&v112];
            uint64_t v71 = v113;
            uint64_t v72 = v113;
            objc_storeStrong(v69 + 5, v112);
            if ((v70 & 1) != 0)
            {
              objc_storeStrong((id *)&self->_stagedJournalEntryUniqueID, v71);
              uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

              if (v73)
              {
                uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
                sub_10004D608(v74);

                -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
              }

              BOOL v75 = 39;
            }

            else
            {
              BOOL v75 = 10;
            }
          }

          else
          {
            size_t v76 = v121 + 5;
            uint64_t v111 = v121[5];
            v77 = [v7 finalizeInstallationWithError:&v111];
            objc_storeStrong(v76, v111);
            if ((v77 & 1) != 0)
            {
              BOOL v75 = 0;
            }

            else
            {
              BOOL v75 = 10;
            }
          }

          objc_autoreleasePoolPop(v68);
          uint64_t v49 = 0LL;
          if (v75 != 39)
          {
            if (v75 == 10) {
              goto LABEL_119;
            }
            uint64_t v78 = objc_autoreleasePoolPush();
            uint64_t v79 = v121;
            uint64_t v110 = v121[5];
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v7 launchServicesBundleRecordsWithError:&v110]);
            objc_storeStrong(v79 + 5, v110);
            if (v49)
            {
              uint64_t v80 = 0;
            }

            else
            {
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                uint64_t v97 = v121[5];
                MOLogWrite(qword_100095BF8);
              }

              uint64_t v80 = 10;
            }

            objc_autoreleasePoolPop(v78);
            if (v80 == 10) {
              goto LABEL_119;
            }
            uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

            if (v81)
            {
              uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
              sub_10004D608(v82);

              -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0LL);
            }

            uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client", v97));
            [v83 releaseTerminationAssertion];

            -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1LL);
            *(void *)buf = 0LL;
            v107 = buf;
            uint64_t v108 = 0x2020000000LL;
            uint64_t v109 = 0;
            v84 = sub_10000D8B4();
            uint64_t v85 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v84);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1000260B0;
            block[3] = &unk_100080C38;
            v86 = v7;
            uint64_t v103 = v86;
            uint64_t v104 = &v120;
            int v105 = buf;
            dispatch_sync(v85, block);

            if (v107[24])
            {

              _Block_object_dispose(buf, 8);
              goto LABEL_119;
            }

            v89 = (LSRecordPromise *)objc_claimAutoreleasedReturnValue([v86 recordPromise]);
            recordPromise = self->_recordPromise;
            self->_recordPromise = v89;

            _Block_object_dispose(buf, 8);
          }

          if ([v49 count]) {
            v91 = v49;
          }
          else {
            v91 = (NSArray *)&__NSArray0__struct;
          }
          receipt = self->_receipt;
          self->_receipt = v91;

          v87 = 1;
          _MILogTransactionStep(v100, 2LL, 1LL, v9, v101, 0LL, v93, v94, (uint64_t)v97);
          goto LABEL_124;
        }
      }
    }
  }

  uint64_t v25 = v18;

  return v25;
}

LABEL_119:
  if (v9 && v100) {
    _MILogTransactionStep(v100, 2LL, 0LL, v9, v101, 0LL, v41, v42, (uint64_t)v97);
  }
  v87 = 0;
  if (a5) {
    *a5 = v121[5];
  }
LABEL_124:

  _Block_object_dispose(&v120, 8);
  return v87 & 1;
}

void sub_10002606C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id sub_1000260A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fireCallbackWithStatus:a2 percentComplete:a3];
}

void sub_1000260B0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = 0LL;
  unsigned __int8 v3 = [v2 performLaunchServicesRegistrationWithError:&v6];
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v4);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
}

void sub_100027340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

id sub_100027380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fireCallbackWithStatus:a2 percentComplete:a3];
}

void sub_100027390(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = 0LL;
  unsigned __int8 v3 = [v2 performLaunchServicesRegistrationWithError:&v6];
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v4);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
}

void sub_1000275A0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.installd", "Signpost");
  uint64_t v2 = (void *)qword_100095B20;
  qword_100095B20 = (uint64_t)v1;
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  uint64_t v1 = os_transaction_create("com.apple.installd.startup");
  if (mach_timebase_info((mach_timebase_info_t)&qword_100095C00))
  {
    syslog(3, "Failed to get timebase info\n");
    qword_100095C00 = (uint64_t)&_mh_execute_header;
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v98 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  unsigned __int8 v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v98);
  dispatch_source_set_event_handler(v3, &stru_1000814B8);
  dispatch_activate(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  memset(&v105, 0, sizeof(v105));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 installdPath]);

  id v7 = v6;
  if (stat((const char *)[v7 fileSystemRepresentation], &v105))
  {
    int v8 = *__error();
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByDeletingLastPathComponent]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 debugDescriptionForItemAtURL:v9]);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050408(v7, v8, (uint64_t)v10);
    }
  }

  else
  {
    int st_mode = v105.st_mode;
    if ((v105.st_mode & 0xF000) != 0x4000 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050378(v7, st_mode);
    }
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    unsigned int v13 = [v12 uid];

    if (v13 != v105.st_uid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000502EC(v7);
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    unsigned int v15 = [v14 gid];

    if (v15 != v105.st_gid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050260(v7);
    }
    if ((st_mode & 0xFFF) != 0x1ED && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000501D0(v7);
    }
  }

  BOOL v99 = v0;

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentUserDataDirectory]);

  if (!v17) {
    sub_1000501B8();
  }
  uint64_t v97 = (void *)v1;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 installdLibraryPath]);
  sub_100028B6C(v4, v19, 0LL);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 logDirectory]);
  sub_100028B6C(v4, v21, 1LL);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dataDirectory]);
  sub_100028B6C(v4, v23, 0LL);

  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 backedUpStateDirectory]);
  sub_100028B6C(v4, v25, 0LL);

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 cachesDirectory]);
  sub_100028B6C(v4, v27, 0LL);

  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 journalStorageBaseURL]);
  sub_100028B6C(v4, v29, 0LL);

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 launchServicesOperationStorageBaseURL]);
  sub_100028B6C(v4, v31, 0LL);

  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 logDirectory]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:@"mobile_installation.log" isDirectory:0]);

  id v35 = sem_open("installd.firstboot_check", 0);
  id v36 = v35;
  if (v35 != (sem_t *)-1LL)
  {
    sem_close(v35);
LABEL_31:
    id v42 = 0LL;
    goto LABEL_32;
  }

  id v37 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 roleUserMigrationMarkerFilePath]);
  unsigned int v39 = [v4 itemDoesNotExistAtURL:v38];

  if (!v39) {
    goto LABEL_31;
  }
  id v40 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](&OBJC_CLASS___MIHelperServiceClient, "sharedInstance"));
  id v104 = 0LL;
  unsigned __int8 v41 = [v40 migrateMobileContentWithError:&v104];
  id v42 = v104;

  if ((v41 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v91 = v42;
      MOLogWrite(qword_100095BF8);
    }

    goto LABEL_31;
  }

LABEL_71:
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80[94], "sharedInstance", v93, v95));
  unsigned __int8 v82 = [v81 isSharediPad];

  if ((v82 & 1) != 0) {
    uint64_t v83 = 0LL;
  }
  else {
    uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForSystemSharedContent]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForSystemSharedContent"));
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
  if (v36 == (sem_t *)-1LL)
  {
    [v83 purge];
    [v84 purge];
  }

  else
  {
    [v83 reconcile];
    [v84 reconcile];
  }

  uint64_t v85 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance"));
  [v85 reconcile];
  v86 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mobile.installd");
  v87 = objc_opt_new(&OBJC_CLASS___MobileInstallationServiceDelegate);
  -[NSXPCListener setDelegate:](v86, "setDelegate:", v87);
  -[NSXPCListener resume](v86, "resume");

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();

  return 0LL;
}

void sub_100028B2C(id a1)
{
  uint64_t v1 = qword_100095BF8;
  xpc_transaction_exit_clean(v1);
}

void sub_100028B6C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v12 = 0LL;
  unsigned __int8 v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:a3 mode:493 class:4 error:&v12];
  id v8 = v12;
  id v9 = v8;
  if ((v7 & 1) != 0) {
    goto LABEL_9;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  if ([v10 isEqualToString:NSPOSIXErrorDomain])
  {
    id v11 = [v9 code];

    if (v11 == (id)28)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000504CC(v6, (uint64_t)v9, v5);
      }
      goto LABEL_9;
    }
  }

  else
  {
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100050570(v6, (uint64_t)v9, v5);
  }
LABEL_9:
}

  ;
}

void sub_100028C94( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100028CE4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_100028D98(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100095B30;
  qword_100095B30 = (uint64_t)v1;
}

uint64_t sub_100029438(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8
    && (unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]),
        unsigned int v8 = [v7 isEqualToString:@"plist"],
        v7,
        v8))
  {
    id v22 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v6,  3LL,  &v22));
    id v10 = v22;
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v21 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v11,  v9,  &v21));
      id v13 = v21;

      uint64_t v14 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
      if (v12)
      {
        uint64_t v15 = v14();
      }

      else
      {
        v14();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_1000507D0(v6);
        }
        uint64_t v17 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          MOLogWrite(v17);
        }

        uint64_t v15 = *(_BYTE *)(a1 + 48) != 0;
      }

      id v10 = v13;
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100050744(v6);
      }
      uint64_t v16 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        MOLogWrite(v16);
      }

      uint64_t v15 = *(_BYTE *)(a1 + 48) != 0;
    }
  }

  else
  {
    uint64_t v15 = 1LL;
  }

  return v15;
}

BOOL sub_100029708(id a1, MIJournalEntry *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v15 = v4;
      MOLogWrite(qword_100095BF8);
    }

    id v16 = 0LL;
    unsigned __int8 v6 = -[MIJournalEntry finalizeWithError:](v4, "finalizeWithError:", &v16, v15);
    id v7 = v16;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_10005085C((uint64_t)v4, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  return 1;
}

void sub_1000298E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100029900(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100029910(uint64_t a1)
{
}

uint64_t sub_100029918(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  return v6 ^ 1;
}

void sub_100029AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100029AB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  }

  return 1LL;
}

  ;
}

  ;
}

  ;
}

void sub_100029B6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100029B88()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 migrationPlistURL]);
  uint64_t v2 = MIIsBuildUpgrade(v1, 0LL) ^ 1;

  return v2;
}

LABEL_5:
  uint64_t v17 = (MILaunchServicesSetPersonasOperation *)v5;
LABEL_11:

  return v17;
}

void sub_10002A874(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10002A7ECLL);
  }

  _Unwind_Resume(a1);
}

void sub_10002A890(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10002A89CLL);
}

void sub_10002AC20(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MISystemAppMigrationState);
  uint64_t v2 = (void *)qword_100095B48;
  qword_100095B48 = (uint64_t)v1;
}

void sub_10002ACC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + _Block_object_dispose(va, 8) = *(_BYTE *)(a1 + 40);
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 migrationPlistURL]);
    MIRecordCurrentBuildVersion(v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) blockArray]);
    if (v5)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "blockArray", 0));
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          for (CFIndex i = 0LL; i != v8; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)i) + 16LL))();
          }

          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v8);
      }

      [*(id *)(a1 + 32) setBlockArray:0];
    }
  }

void sub_10002AEF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10002AF10(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 8LL);
  return result;
}

void sub_10002AFBC(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 blockArray]);

    if (v3
      || (id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray),
          [*(id *)(a1 + 32) setBlockArray:v4],
          v4,
          id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) blockArray]),
          v5,
          v5))
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) blockArray]);
      id v7 = objc_retainBlock(*(id *)(a1 + 40));
      [v11 addObject:v7];
    }

    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = sub_1000130F4( (uint64_t)"-[MISystemAppMigrationState waitForSystemAppMigrationToComplete:]_block_invoke",  118LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Failed to create an array",  v6,  v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);
    }
  }

void sub_10002B1B0(id a1, NSString *a2, NSDictionary *a3, BOOL *a4)
{
  uint64_t v6 = a2;
  id v7 = a3;
  *a4 = 0;
  uint64_t v8 = v6;
  id v45 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v8,  0LL,  0LL,  &v45));
  id v10 = v45;
  id v11 = v10;
  if (v9)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kCFBundleVersionKey));
    objc_opt_class(&OBJC_CLASS___NSString);
    id v13 = v12;
    if ((objc_opt_isKindOfClass(v13) & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    if (!v14)
    {
      goto LABEL_47;
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 bundle]);

    if (!v17)
    {
      uint64_t v23 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 containerURL]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v24 path]);
        MOLogWrite(v23);
      }

      goto LABEL_47;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 bundle]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 infoPlistSubset]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:kCFBundleVersionKey]);
    objc_opt_class(&OBJC_CLASS___NSString);
    id v21 = v20;
    if ((objc_opt_isKindOfClass(v21) & 1) != 0) {
      id v22 = v21;
    }
    else {
      id v22 = 0LL;
    }

    uint64_t v25 = qword_100095BF8;
    if (v22)
    {
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 containerURL]);
        id v41 = v22;
        id v43 = v14;
        id v36 = v8;
        unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v26 path]);
        MOLogWrite(v25);
      }

      id v27 = objc_msgSend(v22, "compare:options:", v14, 64, v36, v39, v41, v43);
      if (v27 == (id)-1LL) {
        goto LABEL_35;
      }
      id v28 = v27;
      id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      unsigned __int8 v30 = [v29 allowsInternalSecurityPolicy];
      if (!v28 && (v30 & 1) == 0)
      {

        goto LABEL_35;
      }

      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
      unsigned int v33 = [v32 allowsInternalSecurityPolicy];

      if (v33)
      {
LABEL_35:
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v40 = v22;
          id v42 = v14;
          id v38 = v8;
          MOLogWrite(qword_100095BF8);
        }

        id v44 = v11;
        unsigned __int8 v34 = objc_msgSend( v9,  "removeUnderlyingContainerWaitingForDeletion:error:",  0,  &v44,  v38,  v40,  v42);
        id v35 = v44;

        id v11 = v35;
        goto LABEL_46;
      }

      uint64_t v31 = qword_100095BF8;
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 5)
      {
LABEL_46:

LABEL_47:
        goto LABEL_48;
      }
    }

    else
    {
      uint64_t v31 = qword_100095BF8;
    }

    MOLogWrite(v31);
    goto LABEL_46;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  if ([v15 isEqualToString:MIContainerManagerErrorDomain])
  {
    id v16 = [v11 code];

    if (v16 == (id)21) {
      goto LABEL_48;
    }
  }

  else
  {
  }

LABEL_48:
}

LABEL_49:
  id v43 = v12;
  unsigned int v33 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]( v2,  "_onQueue_setLinkedParentBundleIDList:error:",  v4,  &v43,  v35);
  unsigned __int8 v34 = v43;

  if ((v33 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000508E8();
  }
}

id sub_10002BE24()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 dataDirectory]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 URLByAppendingPathComponent:@"LinkedParentBundles.plist" isDirectory:0]);

  return v2;
}

id sub_10002BE88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migratePlaygroundsBundleMetadata");
}

void sub_10002BF04(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initWithDomain:2];
  uint64_t v2 = (void *)qword_100095B58;
  qword_100095B58 = (uint64_t)v1;
}

void sub_10002BFA8(uint64_t a1)
{
  id v1 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initWithDomain:3];
  uint64_t v2 = (void *)qword_100095B68;
  qword_100095B68 = (uint64_t)v1;
}

LABEL_26:
      id v42 = v22;
      unsigned __int8 v34 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]( self,  "_onQueue_setLinkedParentBundleIDList:error:",  v41,  &v42);
      id v35 = v42;

      id v22 = v35;
      id v10 = v40;
      id v7 = 0LL;
      id v11 = v38;
      a3 = v39;
      id v18 = v37;
      if (!v39)
      {
LABEL_37:
        __int128 v12 = v22;
        goto LABEL_38;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100050AF0();
      }
      unsigned __int8 v34 = 0;
      if (!a3) {
        goto LABEL_37;
      }
    }

void sub_10002CE68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10002CE8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002CE9C(uint64_t a1)
{
}

void sub_10002CEA4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0LL;
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_isValidLinkForParent:toChild:error:", v3, v4, &obj);
  id v6 = obj;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), v6);
}

void sub_10002D070( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10002D094(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0LL;
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_updateLinkForParent:toChild:operationType:error:", v3, v4, 0, &obj);
  id v6 = obj;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), v6);
}

void sub_10002D264( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10002D288(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0LL;
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_updateLinkForParent:toChild:operationType:error:", v3, v4, 1, &obj);
  id v6 = obj;
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8LL) + 40LL), v6);
}

void sub_10002D7E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10002D808(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0LL;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_onQueue_childrenForParentBundleID:error:", v3, &v10));
  id v5 = v10;
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[7] + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

LABEL_6:
    uint64_t v9 = v9;
    id v14 = 0;
    *a4 = v9;
    goto LABEL_13;
  }

  if (![v8 containsObject:v6])
  {
    id v10 = 0LL;
    id v14 = 1;
    goto LABEL_13;
  }

  id v10 = [v8 mutableCopy];
  [v10 removeObject:v6];
  id v16 = v9;
  uint64_t v11 = -[MIContainerLinkManager _onQueue_setLinkedParentBundleIDList:error:]( self,  "_onQueue_setLinkedParentBundleIDList:error:",  v10,  &v16);
  __int128 v12 = v16;

  if ((v11 & 1) == 0)
  {
    uint64_t v9 = v12;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_6;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIContainerLinkManager parentToLinkedChildrenMap](self, "parentToLinkedChildrenMap"));
  [v13 removeObjectForKey:v6];

  id v14 = 1;
  uint64_t v9 = v12;
LABEL_13:

  return v14;
}

LABEL_8:
  notify_post("com.apple.mobile.application_deletion_complete");
}

    id v13 = v13;
    uint64_t v15 = 0;
    *a4 = v13;
    goto LABEL_17;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle _createJournalEntry](self, "_createJournalEntry"));
  id v22 = v10;
  __int128 v12 = [v11 stageUpdateForLater:&v22];
  id v13 = v22;

  if ((v12 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v20 = v11;
      MOLogWrite(qword_100095BF8);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](&OBJC_CLASS___MIJournal, "sharedInstance", v20));
    id v21 = 0LL;
    uint64_t v17 = [v16 purgeJournalEntry:v11 withError:&v21];
    id v18 = v21;

    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }

  -[MIInstallableBundle setJournalEntry:](self, "setJournalEntry:", v11);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);

  if (a3)
  {
    uint64_t v8 = v14;
    *a3 = v8;
    uint64_t v15 = 1;
  }

  else
  {
    uint64_t v15 = 1;
    uint64_t v8 = v14;
  }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
    uint64_t v31 = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v18));

    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    uint64_t v25 = MIStringForInstallationDomain(a5);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 136316162;
    unsigned int v33 = "+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]";
    unsigned __int8 v34 = 2112;
    id v35 = v10;
    id v36 = 2112;
    id v37 = v26;
    id v38 = 1024;
    unsigned int v39 = v12;
    id v40 = 2112;
    id v41 = v16;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to add reference for %@ in %@ for client with uid %u : %@",  buf,  0x30u);
  }

  uint64_t v23 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    id v24 = MIStringForInstallationDomain(a5);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
    MOLogWrite(v23);
    uint64_t v19 = 0LL;
LABEL_8:
    id v21 = a6;

    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  uint64_t v19 = 0LL;
  id v21 = a6;
  if (!a6) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v19) {
    void *v21 = v16;
  }
LABEL_11:

  return v19;
}

void sub_10002DB50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10002DB74(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0LL;
  unsigned __int8 v4 = objc_msgSend(v2, "_onQueue_removeParent:error:", v3, &obj);
  id v5 = obj;
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), v5);
}

void sub_10002DC48( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10002DC6C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void _MILogTransactionStep( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = v16;
  switch(a2)
  {
    case 1LL:
      id v18 = "Start";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    case 2LL:
      if (!v16)
      {
        uint64_t v19 = "Fail";
        if ((_DWORD)a3) {
          uint64_t v19 = "Success";
        }
        else {
          uint64_t v20 = off_100081640[a1 - 1];
        }
        uint64_t v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s (%s) : %s",  v19,  "End",  v20);
        goto LABEL_21;
      }

      break;
    case 3LL:
      id v18 = "Start (Asynch)";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    default:
      id v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        else {
          id v22 = off_100081640[a1 - 1];
        }
        uint64_t v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s : %s",  v18,  v22,  v25);
LABEL_21:
        id v21 = (NSString *)objc_claimAutoreleasedReturnValue(v23);
        goto LABEL_22;
      }

      break;
  }

  id v21 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v16, &a9);
LABEL_22:
  id v24 = v21;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:persona:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:persona:description:",  a1,  7LL,  a2,  a3,  v14,  v15,  v21);
}

__CFString *sub_10002F280(unint64_t a1)
{
  if (a1 >= 9) {
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown phase: %lu",  a1));
  }
  else {
    return off_1000816B0[a1];
  }
}

LABEL_60:
    LOBYTE(v23) = 0;
    id v16 = v8;
    goto LABEL_29;
  }

  v61 = 0LL;
  id v24 = -[MIInstallationJournalEntry _refreshUUIDForContainer:withError:]( self,  "_refreshUUIDForContainer:withError:",  v5,  &v61);
  uint64_t v25 = v61;
  id v16 = v25;
  if (v24)
  {
    uint64_t v46 = a3;
    v60 = v25;
    id v26 = [v5 makeContainerLiveWithError:&v60];
    uint64_t v8 = v60;

    if (!v26) {
      goto LABEL_60;
    }
    goto LABEL_4;
  }

  LOBYTE(v23) = 0;
  if (!a3) {
    goto LABEL_32;
  }
LABEL_30:
  if ((v23 & 1) == 0) {
    *a3 = v16;
  }
LABEL_32:

  return v23;
}

LABEL_40:
        id v29 = v14;
        uint64_t v46 = v14;
        unsigned __int8 v30 = -[MIInstallationJournalEntry _beginLaunchServicesRegistrationWithError:]( self,  "_beginLaunchServicesRegistrationWithError:",  &v46,  v42);
        id v14 = v46;

        id v15 = v15;
        if (v30)
        {
          -[MIInstallationJournalEntry setJournalPhase:](self, "setJournalPhase:", 6LL);
          -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
          goto LABEL_19;
        }

        break;
      case 3uLL:
        goto LABEL_29;
      case 4uLL:
        goto LABEL_35;
      case 5uLL:
        goto LABEL_40;
      case 6uLL:
        id v37 = (void *)MIInstallerErrorDomain;
        id v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
        id v40 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]",  1060LL,  v37,  4LL,  0LL,  0LL,  @"Called again after install journal entry was already complete for %@",  v39,  (uint64_t)v38);
        id v14 = (id)objc_claimAutoreleasedReturnValue(v40);

        goto LABEL_9;
      case 7uLL:
        id v41 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
          MOLogWrite(v41);
        }

        id v14 = 0LL;
        goto LABEL_19;
      default:
        unsigned __int8 v34 = v21;
        id v35 = (void *)MIInstallerErrorDomain;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
        id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]",  1070LL,  v35,  4LL,  0LL,  0LL,  @"Unknown journal phase %lu when finalizing %@",  v36,  v34);
        goto LABEL_8;
    }
  }

  else
  {
    uint64_t v8 = v7;
    -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100050D4C(self, v8);
    }
    uint64_t v9 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
      id v45 = v8;
      MOLogWrite(v9);
    }

    id v10 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity", v42, v45));
    id v13 = sub_1000130F4( (uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]",  972LL,  v10,  4LL,  0LL,  0LL,  @"Tried %lu times to replay journal entry for %@; assuming something is wrong; failing.",
            v12,
            v8);
LABEL_8:
    id v14 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_9:
    id v15 = 0;
  }

  id v16 = 0;
LABEL_11:
  if (a4 && (v16 & 1) == 0) {
    *a4 = v14;
  }
  if ((v15 || v5) && ((v16 ^ 1) & 1) != 0)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

    if (v17)
    {
      id v18 = (void *)objc_opt_class(self);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
      objc_msgSend( v18,  "_attemptLSUpdateWithDiscoveredStateForIdentity:domain:",  v19,  -[MIInstallationJournalEntry installationDomain](self, "installationDomain"));
    }
  }

  if ((v16 & 1) != 0)
  {
LABEL_19:
    uint64_t v20 = 1;
  }

  else
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _keychainAccessGroupTracker](self, "_keychainAccessGroupTracker"));
    [v31 invalidateCache];

    id v32 = (void *)objc_claimAutoreleasedReturnValue( -[MIInstallationJournalEntry _freeProfileValidatedAppTracker]( self,  "_freeProfileValidatedAppTracker"));
    [v32 invalidateCache];

    -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
    uint64_t v20 = 0;
  }

  return v20;
}

LABEL_41:
        uint64_t v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }

    while (v23);
  }
}

LABEL_30:
  return v22;
}

              v19 += v44;
              id v26 = 1LL;
              id v14 = (void *)v41;
              if (v20 >= v48) {
                goto LABEL_73;
              }
            }

            id v26 = 0LL;
          }

          else
          {
            id v26 = 1LL;
          }

LABEL_28:
        }

        id v29 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
      }

      while (v29);
    }

    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v79 = v85;
      uint64_t v81 = v27;
      MOLogWrite(qword_100095BF8);
    }

    uint64_t v17 = v90;
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    uint64_t v79 = v19;
    MOLogWrite(qword_100095BF8);
  }

  stat v105 = 0u;
  int v106 = 0u;
  id v103 = 0u;
  id v104 = 0u;
  int v93 = v92;
  obja = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v103,  v115,  16LL);
  id v40 = 0LL;
  if (obja)
  {
    uint64_t v96 = *(void *)v104;
    do
    {
      id v41 = 0LL;
      id v42 = v40;
      do
      {
        if (*(void *)v104 != v96) {
          objc_enumerationMutation(v93);
        }
        id v43 = *(void **)(*((void *)&v103 + 1) + 8LL * (void)v41);
        id v44 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          id v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v103 + 1) + 8 * (void)v41), "identifier", v79, v81, v82));
          uint64_t v46 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v43 personaUniqueString]);
          id v47 = (void *)objc_claimAutoreleasedReturnValue([v43 containerURL]);
          uint64_t v81 = v46;
          unsigned __int8 v82 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v47 path]);
          uint64_t v79 = v45;
          MOLogWrite(v44);
        }

        objc_opt_class(&OBJC_CLASS___MIBundleContainer);
        if ((objc_opt_isKindOfClass(v43) & 1) != 0)
        {
          id v40 = v43;

          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v40 bundle]);
          id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 identifier]);

          if (v49)
          {
            __int128 v50 = (void *)objc_claimAutoreleasedReturnValue( +[MIFreeProfileValidatedAppTracker sharedTracker]( &OBJC_CLASS___MIFreeProfileValidatedAppTracker,  "sharedTracker"));
            uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v40 bundle]);
            id v102 = v22;
            __int128 v52 = [v50 removeReferenceForBundle:v51 error:&v102];
            __int128 v53 = v102;

            id v94 = v50;
            if ((v52 & 1) == 0)
            {
              id v54 = qword_100095BF8;
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                id v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundle", v79, v81, v82));
                v56 = (void *)objc_claimAutoreleasedReturnValue([v55 bundleURL]);
                uint64_t v81 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v56 path]);
                unsigned __int8 v82 = v53;
                uint64_t v79 = v49;
                MOLogWrite(v54);
              }

              [v50 invalidateCache];
              __int128 v53 = 0LL;
            }

            unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundle", v79));
            id v58 = [v57 isPlaceholder];

            id v59 = [v40 hasParallelPlaceholder];
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[MIKeychainAccessGroupTracker sharedTracker]( &OBJC_CLASS___MIKeychainAccessGroupTracker,  "sharedTracker"));
            v61 = (void *)objc_claimAutoreleasedReturnValue([v40 bundle]);
            id v101 = v53;
            int v62 = [v60 removeReferencesForBundle:v61 error:&v101];
            id v22 = v101;

            if ((v62 & 1) == 0)
            {
              id v63 = qword_100095BF8;
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v40 bundle]);
                uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue([v64 identifier]);
                uint64_t v81 = v22;
                MOLogWrite(v63);
              }

              [v60 invalidateCache];
              id v22 = 0LL;
            }

            uint64_t v17 = v90;
            uint64_t v65 = objc_msgSend(v90, "containsObject:", v49, v80);
            uint64_t v66 = objc_opt_new(&OBJC_CLASS___MIUninstallRecord);
            -[MIUninstallRecord setBundleIdentifier:](v66, "setBundleIdentifier:", v49);
            -[MIUninstallRecord setIsPlaceholder:](v66, "setIsPlaceholder:", v58);
            -[MIUninstallRecord setHasParallelPlaceholder:](v66, "setHasParallelPlaceholder:", v59);
            -[MIUninstallRecord setIsLinked:](v66, "setIsLinked:", v65);
            -[MIUninstallRecord setIsLastReference:](v66, "setIsLastReference:", v114);
            -[NSMutableArray addObject:](v91, "addObject:", v66);
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](&OBJC_CLASS___MIUninstalledAppList, "sharedList"));
            [v67 addIdentifier:v49];

            uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v40 bundle]);
            uint64_t v69 = [v68 bundleType];

            if (v69 == 1)
            {
              if (v89)
              {
                else {
                  CFErrorRef v70 = 2LL;
                }
              }

              else
              {
                CFErrorRef v70 = 2LL;
              }

              uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](&OBJC_CLASS___MISystemAppState, "sharedList"));
              [v71 addIdentifier:v49 withState:v70];
            }
          }

          else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            uint64_t v79 = v40;
            MOLogWrite(qword_100095BF8);
          }

          id v42 = v40;
        }

        else
        {
          id v40 = v42;
        }

        id v41 = (char *)v41 + 1;
      }

      while (obja != v41);
      obja = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v93,  "countByEnumeratingWithState:objects:count:",  &v103,  v115,  16LL);
    }

    while (obja);
  }

  uint64_t v72 = -[NSMutableArray copy](v93, "copy");
  id v100 = v22;
  uint64_t v73 = +[MIContainer removeContainers:waitForDeletion:error:]( &OBJC_CLASS___MIContainer,  "removeContainers:waitForDeletion:error:",  v72,  v86,  &v100);
  uint64_t v74 = v100;

  if ((v73 & 1) == 0)
  {
    id v18 = v83;
    id v16 = v84;
    uint64_t v19 = v85;
    id v15 = a10;
    goto LABEL_82;
  }

  BOOL v75 = (void *)objc_claimAutoreleasedReturnValue( +[MIContainerLinkManager sharedInstanceForDomain:]( &OBJC_CLASS___MIContainerLinkManager,  "sharedInstanceForDomain:",  2LL));
  BOOL v99 = v74;
  uint64_t v19 = v85;
  size_t v76 = [v75 removeParent:v85 error:&v99];
  id v22 = v99;

  id v18 = v83;
  id v16 = v84;
  id v15 = a10;
  if (!v76)
  {
    uint64_t v74 = v22;
LABEL_82:
    sub_1000338A4(v74);
    unsigned int v39 = 0LL;
    id v22 = v74;
    goto LABEL_83;
  }

  sub_1000338A4(0LL);
  unsigned int v39 = -[NSMutableArray copy](v91, "copy");
  if (a9 && v39)
  {
    *a9 = v114;
    goto LABEL_86;
  }

LABEL_83:
  if (v15 && !v39)
  {
    id v22 = v22;
    unsigned int v39 = 0LL;
    *id v15 = v22;
  }

LABEL_86:
  v77 = v39;
  return v77;
}

void sub_1000338A4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = qword_100095BF8;
  id v3 = v1;
  if (!v1)
  {
LABEL_5:
    if (!v2) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }

  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    MOLogWrite(qword_100095BF8);
    uint64_t v2 = qword_100095BF8;
    goto LABEL_5;
  }

LABEL_76:
            v87 = (void *)objc_claimAutoreleasedReturnValue([v74 bundle]);
            uint64_t v81 = [v87 isPlaceholder];

            if (v170)
            {
              _MILogTransactionStep(9LL, 1LL, 1LL, v71, v68, 0LL, v88, v89, (uint64_t)v153);
              if (([v169 containsObject:v71] & v81) == 1)
              {
                int v90 = qword_100095BF8;
                if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
                {
                  id v91 = (void *)objc_claimAutoreleasedReturnValue([v74 containerURL]);
                  int v153 = v71;
                  char v154 = (__CFString *)objc_claimAutoreleasedReturnValue([v91 path]);
                  MOLogWrite(v90);
                }

                id v92 = (id *)(v223 + 5);
                uint64_t v202 = (id)v223[5];
                int v93 = objc_msgSend( v74,  "removeUnderlyingContainerWaitingForDeletion:error:",  0,  &v202,  v153,  v154);
                objc_storeStrong(v92, v202);
                if ((v93 & 1) == 0)
                {
                  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                  {
                    int v153 = v71;
                    char v154 = (__CFString *)v223[5];
                    MOLogWrite(qword_100095BF8);
                  }

                  uint64_t v83 = 0LL;
                  id v94 = (MIUninstallRecord *)v223[5];
                  v223[5] = 0LL;
                  uint64_t v81 = 1;
LABEL_93:

                  goto LABEL_94;
                }

LABEL_92:
                id v94 = objc_opt_new(&OBJC_CLASS___MIUninstallRecord);
                -[MIUninstallRecord setBundleIdentifier:](v94, "setBundleIdentifier:", v71);
                -[MIUninstallRecord setHasParallelPlaceholder:](v94, "setHasParallelPlaceholder:", 1LL);
                -[MIUninstallRecord setIsPlaceholder:](v94, "setIsPlaceholder:", 1LL);
                -[NSMutableArray addObject:](v165, "addObject:", v94);
                uint64_t v83 = 1LL;
                goto LABEL_93;
              }

              if ([v74 hasParallelPlaceholder])
              {
                if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
                {
                  int v153 = v71;
                  MOLogWrite(qword_100095BF8);
                }

                uint64_t v95 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager", v153));
                uint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([v74 parallelPlaceholderURL]);
                uint64_t v97 = (id *)(v223 + 5);
                uint64_t v201 = (id)v223[5];
                uint64_t v98 = [v95 removeItemAtURL:v96 error:&v201];
                objc_storeStrong(v97, v201);

                if ((v98 & 1) != 0) {
                  goto LABEL_92;
                }
                uint64_t v115 = qword_100095BF8;
                if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                {
                  id v94 = (MIUninstallRecord *)objc_claimAutoreleasedReturnValue([v74 parallelPlaceholderURL]);
                  int v153 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstallRecord path](v94, "path"));
                  char v154 = (__CFString *)v223[5];
                  MOLogWrite(v115);

                  uint64_t v83 = 0LL;
                  goto LABEL_93;
                }

                uint64_t v83 = 0LL;
LABEL_94:
                unsigned __int8 v82 = 1;
              }

              else
              {
                unsigned __int8 v82 = 0;
                uint64_t v83 = 0LL;
              }

              v84 = 9LL;
            }

            else
            {
              _MILogTransactionStep(10LL, 1LL, 1LL, v71, v68, 0LL, v88, v89, (uint64_t)v153);
              unsigned __int8 v82 = 0;
              uint64_t v83 = 0LL;
              v84 = 10LL;
            }

LABEL_106:
            goto LABEL_107;
          }

          v203 = (void *)v223[5];
          uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  v71,  0LL,  0LL,  &v203));
          uint64_t v78 = v203;
LABEL_75:
          uint64_t v85 = v78;
          v86 = *v73;
          *uint64_t v73 = v85;

          if (v74) {
            goto LABEL_76;
          }
LABEL_96:
          BOOL v99 = (void *)objc_claimAutoreleasedReturnValue([(id)v223[5] domain]);
          if ([v99 isEqualToString:v168])
          {
            id v100 = [(id)v223[5] code] == (id)21;

            if (v100)
            {
LABEL_103:
              uint64_t v74 = 0LL;
              uint64_t v81 = 0;
              unsigned __int8 v82 = 0;
              uint64_t v83 = 0LL;
              v84 = 0LL;
              goto LABEL_106;
            }
          }

          else
          {
          }

          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            int v153 = v71;
            char v154 = (__CFString *)v223[5];
            MOLogWrite(qword_100095BF8);
          }

          goto LABEL_103;
        }

        _MILogTransactionStep(v177, 1LL, 1LL, v71, v68, 0LL, v69, v70, (uint64_t)v153);
        uint64_t v81 = 0;
        unsigned __int8 v82 = 0;
        uint64_t v83 = 0LL;
        v84 = v177;
LABEL_107:
        id v101 = 1LL;
        if (!(v176 | v81)) {
          goto LABEL_165;
        }
        id v101 = v83;
        if ((v172 & (v82 | v81 ^ 1) & 1) != 0) {
          goto LABEL_165;
        }
        if ((v167 & 1) != 0)
        {
          -[MIUninstaller _uninstallUserStuffForIdentity:error:]( self,  "_uninstallUserStuffForIdentity:error:",  v63,  0LL);
          id v101 = 1LL;
LABEL_165:
          _MILogTransactionStep(v84, 2LL, v101, v71, v68, 0LL, v79, v80, (uint64_t)v153);
          goto LABEL_166;
        }

        id v102 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
        id v103 = [v102 allowsInternalSecurityPolicy];

        if ((v103 & 1) == 0)
        {
          uint64_t v114 = qword_100095BF8;
          goto LABEL_163;
        }

        id v104 = (id *)(v223 + 5);
        uint64_t v200 = (id)v223[5];
        stat v105 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v71,  2LL,  &v200));
        objc_storeStrong(v104, v200);
        if (v105)
        {
          uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
          uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue([v108 systemAppBundleIDToInfoMap]);
          uint64_t v110 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:v71]);

          if (v110)
          {
            uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
            uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v111 systemAppBundleIDToInfoMap]);
            uint64_t v113 = objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:v71]);
            goto LABEL_133;
          }

          BOOL v116 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
          uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue([v116 internalAppBundleIDToInfoMap]);
          v118 = (void *)objc_claimAutoreleasedReturnValue([v117 objectForKeyedSubscript:v71]);

          if (v118)
          {
            uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
            uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v111 internalAppBundleIDToInfoMap]);
            uint64_t v113 = objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:v71]);
            goto LABEL_133;
          }

          v119 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
          v120 = (void *)objc_claimAutoreleasedReturnValue([v119 coreServicesAppBundleIDToInfoMap]);
          uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKeyedSubscript:v71]);

          if (v121)
          {
            uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
            uint64_t v112 = (void *)objc_claimAutoreleasedReturnValue([v111 coreServicesAppBundleIDToInfoMap]);
            uint64_t v113 = objc_claimAutoreleasedReturnValue([v112 objectForKeyedSubscript:v71]);
LABEL_133:
            uint64_t v122 = (void *)v113;
          }

          else
          {
            uint64_t v122 = 0LL;
          }

          uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v122,  "objectForKeyedSubscript:",  @"com.apple.MobileInstallation.bundleURL",  v153));
          objc_opt_class(&OBJC_CLASS___NSURL);
          uint64_t v124 = v123;
          if ((objc_opt_isKindOfClass(v124) & 1) != 0) {
            uint64_t v125 = v124;
          }
          else {
            uint64_t v125 = 0LL;
          }

          if (!v125)
          {
            _MILogTransactionStep(v84, 2LL, 0LL, v71, v68, 0LL, v126, v127, (uint64_t)v153);

            goto LABEL_162;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v162, "setObject:forKeyedSubscript:", v125, v71);
          v128 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
          {
            int v153 = v71;
            char v154 = (__CFString *)objc_claimAutoreleasedReturnValue([v125 path]);
            MOLogWrite(v128);
          }

LABEL_142:
          if (!v163 || ![v163 containsObject:v71])
          {
            stat v105 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v175,  "objectForKeyedSubscript:",  v71,  v153));
            LOBYTE(v195) = 0;
            v129 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v162, "objectForKeyedSubscript:", v71));
            ssize_t v130 = v129 == 0LL;

            uint64_t v199 = 0LL;
            char v154 = (__CFString *)&v199;
            uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue( -[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]( self,  "_uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryRe ference:deleteDataContainers:wasLastReference:error:",  v63,  v105,  v159,  v160,  v161,  v130));
            v132 = (__CFString *)v199;
            _MILogTransactionStep(v84, 2LL, v131 != 0LL, v71, v68, 0LL, v133, v134, (uint64_t)&v195);
            if (v131) {
              goto LABEL_148;
            }
            uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v132, "domain"));
            if ([v136 isEqualToString:v158]
              && -[__CFString code](v132, "code") == (id)26)
            {

LABEL_156:
              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                v152 = v63;
                char v154 = v132;
                MOLogWrite(qword_100095BF8);
              }

              uint64_t v135 = objc_opt_new(&OBJC_CLASS___MIUninstallRecord);
              uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue([v63 bundleID]);
              -[MIUninstallRecord setBundleIdentifier:](v135, "setBundleIdentifier:", v139);

              -[MIUninstallRecord setIsLastReference:](v135, "setIsLastReference:", 1LL);
              -[MIUninstallRecord setHasParallelPlaceholder:](v135, "setHasParallelPlaceholder:", 1LL);
              -[MIUninstallRecord setDoesNotHaveBundleContainer:](v135, "setDoesNotHaveBundleContainer:", 1LL);
              -[NSMutableArray addObject:](v165, "addObject:", v135);
LABEL_160:
            }

            else
            {
              v137 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v132, "domain"));
              if ([v137 isEqualToString:v168])
              {
                uint64_t v138 = -[__CFString code](v132, "code") == (id)21;

                if (v138) {
                  goto LABEL_156;
                }
              }

              else
              {
              }

              uint64_t v140 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v63;
                *(_WORD *)&buf[22] = 2112;
                uint64_t v229 = v132;
                _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to uninstall %@ : %@",  buf,  0x20u);
              }

              if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
              {
                v152 = v63;
                char v154 = v132;
                MOLogWrite(qword_100095BF8);
              }

LABEL_148:
              -[NSMutableArray addObjectsFromArray:](v165, "addObjectsFromArray:", v131, v152);
              if ((_BYTE)v195)
              {
                uint64_t v135 = (MIUninstallRecord *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v174,  "objectForKeyedSubscript:",  v71));
                if (v135) {
                  [v183 unlinkChild:v71 fromParent:v135 error:0];
                }
                goto LABEL_160;
              }
            }

LABEL_162:
            goto LABEL_166;
          }

          uint64_t v114 = qword_100095BF8;
LABEL_163:
          int v153 = v71;
          MOLogWrite(v114);
LABEL_164:
          id v101 = 0LL;
          goto LABEL_165;
        }

        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          int v153 = v71;
          MOLogWrite(qword_100095BF8);
        }

        _MILogTransactionStep(v84, 2LL, 0LL, v71, v68, 0LL, v106, v107, (uint64_t)v153);
LABEL_166:
      }

      id v58 = v173;
      id v59 = [v173 countByEnumeratingWithState:&v206 objects:v230 count:16];
    }

    while (v59);
  }

  -[MIUninstaller _fireCallbackWithStatus:percentComplete:]( self,  "_fireCallbackWithStatus:percentComplete:",  @"GeneratingApplicationMap",  90LL);
  sub_10004D608(v157);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v229) = 0;
  uint64_t v195 = 0LL;
  uint64_t v196 = &v195;
  v197 = 0x2020000000LL;
  v198 = 0;
  uint64_t v141 = sub_10000D8B4();
  CFErrorRef v142 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v141);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035350;
  block[3] = &unk_100081718;
  v143 = v165;
  uint64_t v188 = v143;
  v192 = &v222;
  uint64_t v193 = &v195;
  uint64_t v189 = v162;
  CFErrorRef v190 = self;
  v191 = v171;
  uint64_t v194 = buf;
  dispatch_sync(v142, block);

  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {

    _Block_object_dispose(&v195, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v144 = *((_BYTE *)v196 + 24) == 0;

    _Block_object_dispose(&v195, 8);
    _Block_object_dispose(buf, 8);
    if (v144)
    {
      uint64_t v147 = (NSArray *)objc_claimAutoreleasedReturnValue( +[MIUninstallRecord uninstallRecordArrayToICLUninstallRecordArray:]( &OBJC_CLASS___MIUninstallRecord,  "uninstallRecordArrayToICLUninstallRecordArray:",  v143));
      receipt = self->_receipt;
      self->_receipt = v147;

      uint64_t v145 = 1;
      goto LABEL_183;
    }
  }

  unsigned __int8 v4 = v163;
LABEL_181:

  uint64_t v145 = 0;
  if (a4) {
    *a4 = (id) v223[5];
  }
LABEL_183:

  _Block_object_dispose(&v222, 8);
  return v145;
}

void sub_100035180(_Unwind_Exception *a1)
{
}

uint64_t sub_100035338(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100035348(uint64_t a1)
{
}

void sub_100035350(uint64_t a1)
{
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v51;
    uint64_t v42 = kMIUninstallParallelPlaceholderKey;
    uint64_t v43 = *(void *)v51;
    do
    {
      id v5 = 0LL;
      id v44 = v3;
      do
      {
        if (*(void *)v51 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v5);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier", v40, v41));
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:v7]);
        uint64_t v9 = v8;
        if (v8)
        {
          uint64_t v10 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
          {
            id v40 = v7;
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
            MOLogWrite(v10);
          }

          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser",  v40,  v41));
          uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
          id v49 = *(id *)(v12 + 40);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 registerInstalledInfoForBuiltInAppAtURL:v9 error:&v49]);
          objc_storeStrong((id *)(v12 + 40), v49);

          if (!v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              id v36 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
              uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
              *(_DWORD *)buf = 136315650;
              id v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              __int16 v56 = 2112;
              unsigned __int8 v57 = v36;
              __int16 v58 = 2112;
              uint64_t v59 = v37;
              _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to re-register built-in app at %@ : %@",  buf,  0x20u);
            }

            uint64_t v14 = qword_100095BF8;
            if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
              id v41 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
              MOLogWrite(v14);
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
          }

          goto LABEL_55;
        }

        if (![v6 doesNotHaveBundleContainer])
        {
          if ([v6 hasParallelPlaceholder])
          {
            id v16 = v7;
            uint64_t v17 = &__kCFBooleanTrue;
            goto LABEL_24;
          }

          unsigned int v18 = [v6 isPlaceholder];
          id v16 = v7;
          if (v18)
          {
            uint64_t v17 = &__kCFBooleanTrue;
            uint64_t v19 = &__kCFBooleanFalse;
          }

          else
          {
            uint64_t v17 = &__kCFBooleanFalse;
LABEL_24:
            uint64_t v19 = &__kCFBooleanTrue;
          }

          uint64_t v15 = objc_claimAutoreleasedReturnValue( +[LSPrecondition registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:]( &OBJC_CLASS___LSPrecondition,  "registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:",  v16,  v17,  v19));
          goto LABEL_26;
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[LSPrecondition emptyPrecondition](&OBJC_CLASS___LSPrecondition, "emptyPrecondition"));
LABEL_26:
        uint64_t v46 = (void *)v15;
        if ([v6 isLinked])
        {
          unsigned int v20 = 0;
          uint64_t v21 = 3LL;
        }

        else
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) options]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"]);
          unsigned __int8 v24 = [v23 isEqual:&__kCFBooleanTrue];

          if ((v24 & 1) != 0)
          {
            unsigned int v20 = 1;
            uint64_t v21 = 1LL;
          }

          else
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) options]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v42]);
            unsigned int v20 = [v26 isEqual:&__kCFBooleanTrue];

            if (v20) {
              uint64_t v21 = 4LL;
            }
            else {
              uint64_t v21 = 3LL;
            }
          }
        }

        int v27 = sub_10000D79C();
        if (+[ICLFeatureFlags appReferencesEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "appReferencesEnabled"))
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
          unsigned __int8 v29 = [v28 isSharediPad];

          if ((v29 & 1) == 0)
          {
            if (v27)
            {
              if ([v6 isLastReference])
              {
                if ([*(id *)(a1 + 56) containsObject:v7])
                {
                  unsigned __int8 v30 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForSystemSharedContent]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForSystemSharedContent"));
                  uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8LL);
                  id v48 = *(id *)(v31 + 40);
                  unsigned __int8 v32 = [v30 unregisterAppForBundleID:v7 inDomain:1 operationType:v21 precondition:v46 error:&v48];
                  objc_storeStrong((id *)(v31 + 40), v48);

                  if ((v32 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                    {
                      uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
                      *(_DWORD *)buf = 136315650;
                      id v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
                      __int16 v56 = 2112;
                      unsigned __int8 v57 = v7;
                      __int16 v58 = 2112;
                      uint64_t v59 = v39;
                      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to unregister record for %@ in system domain: %@",  buf,  0x20u);
                    }

                    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                    {
                      id v40 = v7;
                      id v41 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
                      MOLogWrite(qword_100095BF8);
                    }

                    *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
                  }
                }
              }
            }
          }
        }

        if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL)
          && (v20 | [v6 isLastReference]) == 1)
        {
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
          uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8LL);
          id v47 = *(id *)(v34 + 40);
          unsigned __int8 v35 = [v33 unregisterAppForBundleID:v7 inDomain:1 operationType:v21 precondition:v46 error:&v47];
          objc_storeStrong((id *)(v34 + 40), v47);

          if ((v35 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
              *(_DWORD *)buf = 136315650;
              id v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              __int16 v56 = 2112;
              unsigned __int8 v57 = v7;
              __int16 v58 = 2112;
              uint64_t v59 = v38;
              _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to unregister record for %@ in user domain: %@",  buf,  0x20u);
            }

            if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
            {
              id v40 = v7;
              id v41 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
              MOLogWrite(qword_100095BF8);
            }

            *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
          }
        }

        uint64_t v4 = v43;
        id v3 = v44;
LABEL_55:

        id v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
    }

    while (v3);
  }
}

uint64_t sub_100035AAC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2112;
  return result;
}

void sub_100035AC4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100035B44(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100095B78;
  qword_100095B78 = (uint64_t)v1;
}

void sub_100035BC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100035DE8(_Unwind_Exception *a1)
{
}

void sub_100035E28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void sub_100035E54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void sub_1000360F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10003610C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003611C(uint64_t a1)
{
}

void sub_100036124(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003618C(uint64_t a1, void *a2)
{
}

void sub_1000362A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000362C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100036328(uint64_t a1, void *a2)
{
}

void sub_1000364FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10003652C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100036594(void *a1, void *a2, char a3, void *a4)
{
  id v9 = a2;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), a4);
  if (!v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a2);
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = a3;
  }
}

void sub_100036788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000367A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100036808(uint64_t a1, void *a2)
{
}

void sub_1000369AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000369D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100036A38(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  if (!v4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void sub_100036B28(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100095B80;
  qword_100095B80 = (uint64_t)v1;
}

id sub_100036C88(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRefs:0];
}

void sub_100036DE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100036DF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100036E08(uint64_t a1)
{
}

uint64_t sub_100036E10(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3 == 4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    unsigned int v8 = [v7 isEqualToString:@"app"];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
      id v19 = 0LL;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:v6 error:&v19]);
      id v11 = v19;

      if (v10)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) refs]);
        [v12 addObject:v10];
      }

      else
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
        if ([v14 isEqualToString:NSPOSIXErrorDomain])
        {
          id v15 = [v11 code];

          if (v15 == (id)93) {
            goto LABEL_12;
          }
        }

        else
        {
        }

        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
        id v17 = v11;
        uint64_t v12 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v17;
      }

LABEL_12:
      uint64_t v13 = 0LL;
      goto LABEL_13;
    }
  }

  uint64_t v13 = 1LL;
LABEL_13:

  return v13;
}

void sub_1000370D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000370F0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v8 = 0LL;
  id v4 = objc_msgSend(v3, "_onQueue_addAppIdentifierIfCachedOnContainer:error:", a2, &v8);
  id v5 = v8;
  id v6 = v8;

  return v4;
}

void sub_1000375E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100037608(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = objc_msgSend(v2, "_onQueue_addReferenceForApplicationIdentifier:bundle:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v6;
}

void sub_100037A40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100037A64(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_removeReferenceForBundle:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v5;
}

void sub_100038884(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100095B90;
  qword_100095B90 = (uint64_t)v1;
}

BOOL sub_100038C14()
{
  BOOL result = 0;
  if (!lstat("/var/mobile/Library/ApplicationSync", &v2))
  {
    __darwin_time_t tv_sec = v2.st_mtimespec.tv_sec;
    if (tv_sec > time(0LL) - 31536000) {
      return 1;
    }
  }

  return result;
}

void sub_100038D3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100038D54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100038D64(uint64_t a1)
{
}

void sub_100038D6C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100038E40(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUninstalledList:", v3);
}

void sub_100038F48(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUninstalledList:", v2);
}

void sub_10003926C(void *a1)
{
  id v1 = a1;
  char v12 = 0;
  if (![v1 isTransient])
  {
    id v5 = 0LL;
    goto LABEL_18;
  }

  id v11 = 0LL;
  unsigned __int8 v2 = [v1 isStagedUpdateContainer:&v12 withError:&v11];
  id v3 = v11;
  uint64_t v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v8 = v1;
      id v9 = v3;
      MOLogWrite(qword_100095BF8);
    }

    char v12 = 0;
LABEL_10:
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier", v8, v9));
    id v10 = v4;
    unsigned __int8 v7 = [v1 removeUnderlyingContainerWaitingForDeletion:0 error:&v10];
    id v5 = v10;

    if ((v7 & 1) != 0)
    {
    }

    else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
      goto LABEL_17;
    }

    MOLogWrite(qword_100095BF8);
LABEL_17:

    goto LABEL_18;
  }

  if (!v12) {
    goto LABEL_10;
  }
  id v5 = v3;
LABEL_18:
}

LABEL_38:
          -[MIInstallableBundle setUpgradingBuiltInAppAtURL:](self, "setUpgradingBuiltInAppAtURL:", v67, v65);
LABEL_39:
          id v17 = 0LL;
          id v19 = 1;
          goto LABEL_41;
        }

        int v62 = (void *)MIInstallerErrorDomain;
        unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 identifier]);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v67 path]);
        uint64_t v64 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]",  458LL,  v62,  34LL,  0LL,  &off_10008AC00,  @"Rejecting downgrade of system/internal app %@ at %@: installed version is %@, proposed version is %@",  v63,  (uint64_t)v58);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v64);
      }

      else
      {
        __int16 v56 = (void *)MIInstallerErrorDomain;
        unsigned __int8 v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v57 identifier]);
        v60 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkCanInstallWithError:]",  437LL,  v56,  33LL,  0LL,  0LL,  @"Failed to get CFBundleVersion from Info.plist for incoming OS app upgrade for bundle ID %@",  v59,  (uint64_t)v58);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v60);
      }

LABEL_4:
      if (a3)
      {
        id v17 = v17;
        id v19 = 0;
        *a3 = v17;
      }

      else
      {
        id v19 = 0;
      }

  if (!v16) {
    goto LABEL_61;
  }
  if (!v28)
  {
LABEL_48:
    uint64_t v34 = v18;
    LOBYTE(v75.val[0]) = 0;
    uint64_t v69 = v18;
    CFErrorRef v70 = 0LL;
    unsigned __int8 v35 = objc_msgSend( v13,  "_getEligibilityForDomain:forBundle:isEligible:ineligibilityReason:error:",  v16,  v11,  &v75,  &v70,  &v69,  v57,  v58);
    id v36 = (__CFString *)v70;
    uint64_t v18 = v69;

    if (!v35) {
      goto LABEL_70;
    }
    id v10 = v63;
    if (!LOBYTE(v75.val[0]))
    {
      uint64_t v21 = (void *)v65;
      if (v36)
      {
        uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@", v36));

        id v36 = (__CFString *)v42;
      }

      else
      {
        id v36 = &stru_100082BD0;
      }

      id v41 = a6;
      id v44 = "install";
      if (v12 == 1) {
        id v44 = "update";
      }
      if (v12 == 2) {
        id v44 = "restore";
      }
      id v45 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]",  2976LL,  MIInstallerErrorDomain,  208LL,  0LL,  0LL,  @"This device is not eligible to %s the browser engine app %@.%@",  v37,  (uint64_t)v44);
      uint64_t v46 = objc_claimAutoreleasedReturnValue(v45);

      uint64_t v18 = (__CFString *)v46;
      goto LABEL_72;
    }

    if (!v23) {
      goto LABEL_3;
    }
LABEL_67:
    uint64_t v39 = v18;
    LOBYTE(v75.val[0]) = 0;
    uint64_t v67 = v18;
    uint64_t v68 = 0LL;
    id v40 = objc_msgSend( v13,  "_getEligibilityForDomain:forBundle:isEligible:ineligibilityReason:error:",  v23,  v11,  &v75,  &v68,  &v67,  v57,  v58,  v59);
    id v36 = (__CFString *)v68;
    uint64_t v18 = v67;

    if (v40)
    {
      uint64_t v21 = (void *)v65;
      if (LOBYTE(v75.val[0]))
      {

        unsigned int v20 = 1;
        id v10 = v63;
        goto LABEL_5;
      }

      if (v36)
      {
        uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" %@", v36));

        id v36 = (__CFString *)v43;
      }

      else
      {
        id v36 = &stru_100082BD0;
      }

      id v47 = (void *)objc_claimAutoreleasedReturnValue([v9 entitlements]);
      id v48 = sub_100045408(v47);

      __int128 v50 = (void *)MIInstallerErrorDomain;
      __int128 v51 = "install";
      if (v12 == 1) {
        __int128 v51 = "update";
      }
      if (v12 == 2) {
        __int128 v52 = "restore";
      }
      else {
        __int128 v52 = v51;
      }
      if (v48)
      {
        __int128 v53 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]",  3005LL,  MIInstallerErrorDomain,  208LL,  0LL,  0LL,  @"This device is not eligible to %s the marketplace %@.%@",  v49,  (uint64_t)v52);
        id v54 = objc_claimAutoreleasedReturnValue(v53);
      }

      else
      {
        v60 = objc_claimAutoreleasedReturnValue([v63 distributorNameForCurrentLocale]);
        __int16 v56 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:]",  3007LL,  v50,  208LL,  0LL,  0LL,  @"This device is not eligible to %s the app %@ distributed by %@.%@",  v55,  (uint64_t)v52);
        id v54 = objc_claimAutoreleasedReturnValue(v56);

        uint64_t v18 = (__CFString *)v60;
      }

      uint64_t v18 = (__CFString *)v54;
      goto LABEL_71;
    }

  return v32;
}

LABEL_41:
      return v19;
    default:
      uint64_t v18 = 0LL;
      goto LABEL_41;
  }

LABEL_63:
    v61 = 0;
    if (!a3) {
      goto LABEL_68;
    }
    goto LABEL_66;
  }

LABEL_33:
    v61 = 0;
LABEL_37:
    a3 = v100;
LABEL_38:

LABEL_39:
    if (!a3) {
      goto LABEL_68;
    }
    goto LABEL_66;
  }

LABEL_69:
  v61 = 0;
  a3 = v100;
  if (!v100) {
    goto LABEL_68;
  }
LABEL_66:
  if (!v61) {
    *a3 = v8;
  }
LABEL_68:

  return v61;
}

LABEL_46:
  return v34;
}

LABEL_44:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath", v79));
      id v48 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1669LL,  MIInstallerErrorDomain,  201LL,  0LL,  0LL,  @"%@ has the %@ entitlement but must also have the %@ entitlement.",  v47,  (uint64_t)v11);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v48);
      goto LABEL_5;
    }

    uint64_t v23 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      MOLogWrite(v23);
    }
  }

  if ((v8 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_22:
  unsigned __int8 v24 = 0;
LABEL_23:
  v87 = 0u;
  v88 = 0u;
  uint64_t v85 = 0u;
  v86 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles", v79));
  uint64_t v25 = [v11 countByEnumeratingWithState:&v85 objects:v109 count:16];
  if (v25)
  {
    id v26 = *(void *)v86;
    while (2)
    {
      for (k = 0LL; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v86 != v26) {
          objc_enumerationMutation(v11);
        }
        id v28 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)k);
        if (v24)
        {
          unsigned __int8 v29 = (id *)(v104 + 5);
          id obj = (id)v104[5];
          unsigned __int8 v30 = [v28 hasExecutableSliceForCPUType:16777228 subtype:2 error:&obj];
          objc_storeStrong(v29, obj);
          if ((v30 & 1) == 0)
          {
            uint64_t v31 = (void *)v104[5];
            id v17 = (id)objc_claimAutoreleasedReturnValue([v28 relativePath]);
            unsigned int v33 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1748LL,  MIInstallerErrorDomain,  202LL,  v31,  0LL,  @"%@ is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.",  v32,  (uint64_t)v17);
            uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
            unsigned __int8 v35 = (void *)v104[5];
            v104[5] = v34;
LABEL_38:

            goto LABEL_6;
          }
        }

        if ((v9 & 1) == 0 && [v28 targetsBrowserExtensionPoint])
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue([v28 relativePath]);
          unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v28 extensionPointIdentifier]);
          uint64_t v37 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]",  1754LL,  MIInstallerErrorDomain,  203LL,  0LL,  0LL,  @"The app extension at %@ targets the extension point %@, which is not allowed in a non-browser app. Either add the entitlement %@ to the containing app, or remove this app extension.",  v36,  (uint64_t)v17);
          uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
          uint64_t v39 = (void *)v104[5];
          v104[5] = v38;

          goto LABEL_38;
        }
      }

      uint64_t v25 = [v11 countByEnumeratingWithState:&v85 objects:v109 count:16];
      uint64_t v18 = 1;
      if (v25) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v18 = 1;
  }

void sub_10003C8B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

uint64_t sub_10003C904(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003C914(uint64_t a1)
{
}

uint64_t sub_10003C91C(uint64_t a1, void *a2)
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  id v3 = a2;
  v19[4] = &v21;
  id v20 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10003CAC8;
  v19[3] = &unk_100081830;
  char v4 = MIMachOFileIterateImageVersions([v3 fileSystemRepresentation], &v20, v19);
  id v5 = v20;
  unsigned __int8 v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v17 = v5;
    id v10 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
    goto LABEL_5;
  }

  if (!*((_BYTE *)v22 + 24))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleURL]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length")));

    id v12 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]_block_invoke",  1698LL,  MIInstallerErrorDomain,  202LL,  0LL,  0LL,  @"%@ is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.",  v11,  (uint64_t)v10);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

LABEL_5:
  }

  _Block_object_dispose(&v21, 8);

  return 1LL;
}

void sub_10003CAAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10003CAC8(uint64_t a1, int a2, int a3)
{
  BOOL v4 = a2 == 16777228 && (a3 & 0xFFFFFF) == 2;
  uint64_t result = !v4;
  if (v4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t sub_10003CD6C(void *a1)
{
  id v1 = a1;
  if ((sub_100045350(v1) & 1) != 0)
  {
    uint64_t v2 = 1LL;
  }

  else if (sub_100045360(v1))
  {
    uint64_t v2 = (uint64_t)sub_1000453B8(v1);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

LABEL_81:
                uint64_t v72 = 0;
                goto LABEL_82;
              }
            }
          }
        }

        BOOL v99 = [v276 countByEnumeratingWithState:&v302 objects:v347 count:16];
      }

      while (v99);
    }

    uint64_t v110 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      uint64_t v111 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      __int128 v253 = (id *)objc_claimAutoreleasedReturnValue([v111 identifier]);
      MOLogWrite(v110);
    }

    -[MIInstallableBundle setXpcServiceBundlesEnabled:](self, "setXpcServiceBundlesEnabled:", 1LL, v253);
  }

  __int128 v300 = 0u;
  __int128 v301 = 0u;
  __int128 v298 = 0u;
  __int128 v299 = 0u;
  __int128 v276 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
  uint64_t v112 = [v276 countByEnumeratingWithState:&v298 objects:v346 count:16];
  if (!v112) {
    goto LABEL_149;
  }
  uint64_t v113 = v112;
  uint64_t v114 = *(void *)v299;
  __int128 v269 = MIContainerManagerErrorDomain;
  while (2)
  {
    uint64_t v115 = 0LL;
    BOOL v116 = v12;
    while (2)
    {
      if (*(void *)v299 != v114) {
        objc_enumerationMutation(v276);
      }
      uint64_t v117 = *(void **)(*((void *)&v298 + 1) + 8LL * (void)v115);
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable identity](self, "identity", v253));
      v119 = (void *)objc_claimAutoreleasedReturnValue([v118 personaUniqueString]);
      __int128 v297 = v116;
      v120 = (void *)objc_claimAutoreleasedReturnValue([v117 dataContainerForPersona:v119 error:&v297]);
      id v12 = v297;

      if (v120)
      {
        uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue([v120 parentBundleID]);
        if (v121)
        {
          uint64_t v122 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
          uint64_t v123 = (void *)objc_claimAutoreleasedReturnValue([v122 identifier]);
          uint64_t v124 = [v121 isEqualToString:v123];

          if ((v124 & 1) == 0)
          {
            v143 = (void *)MIInstallerErrorDomain;
            uint64_t v144 = (void *)objc_claimAutoreleasedReturnValue([v120 identifier]);
            uint64_t v146 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2203LL,  v143,  88LL,  0LL,  &off_10008AF20,  @"An app extension with the identifier %@ is already installed as part of the bundle with identifier %@",  v145,  (uint64_t)v144);
            uint64_t v147 = objc_claimAutoreleasedReturnValue(v146);
            v148 = v12;
            id v12 = (id)v147;

            goto LABEL_160;
          }
        }

        else if ([v120 status] != (id)3 && (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3))
        {
          __int128 v253 = (id *)v120;
          MOLogWrite(qword_100095BF8);
        }
      }

      else
      {
        uint64_t v125 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
        if (![v125 isEqualToString:v269])
        {

LABEL_159:
          int v149 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2211LL,  MIInstallerErrorDomain,  4LL,  v12,  0LL,  @"Failed to look up data container for app extension %@",  v127,  (uint64_t)v117);
          uint64_t v121 = v12;
          id v12 = (id)objc_claimAutoreleasedReturnValue(v149);
LABEL_160:

          goto LABEL_161;
        }

        uint64_t v126 = [v12 code];

        if (v126 != (id)21) {
          goto LABEL_159;
        }
      }

      uint64_t v115 = (char *)v115 + 1;
      BOOL v116 = v12;
      if (v113 != v115) {
        continue;
      }
      break;
    }

    uint64_t v113 = [v276 countByEnumeratingWithState:&v298 objects:v346 count:16];
    if (v113) {
      continue;
    }
    break;
  }

LABEL_149:
  uint64_t v11 = v273;
  __int128 v296 = v12;
  v128 = -[MIInstallableBundle _validateAppManagementDomainForSigningInfo:error:]( self,  "_validateAppManagementDomainForSigningInfo:error:",  v273,  &v296);
  v129 = v296;
  ssize_t v130 = v12;
  id v12 = v129;

  id v5 = v262;
  a3 = v274;
  if (!v128) {
    goto LABEL_79;
  }
  if (!v271)
  {
    __int128 v293 = v12;
    uint64_t v158 = -[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]( self,  "_validateApplicationIdentifierForNewBundleSigningInfo:error:",  v273,  &v293);
    unsigned __int8 v30 = v293;

    if (v158)
    {
      uint64_t v159 = (void *)objc_claimAutoreleasedReturnValue([v273 entitlements]);
      __int128 v292 = 0;
      __int128 v291 = v30;
      uint64_t v160 = -[MIInstallableBundle _performAppClipSpecificValidationForEntitlements:isAppClip:withError:]( self,  "_performAppClipSpecificValidationForEntitlements:isAppClip:withError:",  v159,  &v292,  &v291);
      CFTypeRef v161 = v291;

      if (v160)
      {
        __int128 v290 = v161;
        int v162 = -[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]( self,  "_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:",  v273,  &v290);
        v163 = v290;

        if (v162)
        {
          if (sub_100045408(v159))
          {
            v164 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            v165 = [v164 isLaunchProhibited];

            if (v165)
            {
              v166 = (void *)MIInstallerErrorDomain;
              uint64_t v167 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
              uint64_t v168 = (void *)objc_claimAutoreleasedReturnValue([v167 displayName]);
              uint64_t v170 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2395LL,  v166,  209LL,  0LL,  0LL,  @"The marketplace %@ has the key %@ = TRUE in its Info.plist. This is not allowed.",  v169,  (uint64_t)v168);
              id v12 = (id)objc_claimAutoreleasedReturnValue(v170);

              v163 = v167;
              goto LABEL_261;
            }
          }

          uint64_t v204 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance",  v253));
          if (([v204 codeSigningEnforcementIsDisabled] & 1) != 0
            || (uint64_t v205 = objc_claimAutoreleasedReturnValue(-[MIInstallableBundle upgradingBuiltInAppAtURL](self, "upgradingBuiltInAppAtURL"))) == 0)
          {
          }

          else
          {
            uint64_t v206 = (void *)v205;
            uint64_t v207 = sub_100045340(v159);

            if ((v207 & 1) == 0)
            {
              v208 = (void *)objc_claimAutoreleasedReturnValue( +[MIDaemonConfiguration sharedInstance]( &OBJC_CLASS___MIDaemonConfiguration,  "sharedInstance"));
              uint64_t v209 = [v208 hasInternalContent];

              uint64_t v211 = (void *)MIInstallerErrorDomain;
              if (v209)
              {
                uint64_t v212 = &off_10008AF48;
                v213 = @"System app upgrade is missing upgrade entitlement (disable code signing enforcement via boot-args to avoid this).";
                uint64_t v214 = 2401LL;
              }

              else
              {
                uint64_t v212 = &off_10008AF70;
                v213 = @"System app upgrade is missing upgrade entitlement.";
                uint64_t v214 = 2403LL;
              }

              __int128 v250 = 16LL;
              goto LABEL_260;
            }
          }

          if (!v270 || (sub_1000453E8(v159) & 1) != 0)
          {
            uint64_t v216 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            if ([v216 isRemovableSystemApp])
            {
              uint64_t v217 = sub_1000453E8(v159);

              if ((v217 & 1) == 0)
              {
                uint64_t v211 = (void *)MIInstallerErrorDomain;
                uint64_t v212 = &off_10008AFC0;
                v213 = @"Install of known system app missing system app entitlement";
                uint64_t v214 = 2416LL;
LABEL_257:
                __int128 v250 = 127LL;
LABEL_260:
                __int128 v251 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  v214,  v211,  v250,  0LL,  v212,  v213,  v210,  v255);
                id v12 = (id)objc_claimAutoreleasedReturnValue(v251);
                goto LABEL_261;
              }
            }

            else
            {
            }

            __int128 v289 = v163;
            uint64_t v221 = -[MIInstallableBundle _performBuiltInAppUpgradeValidationWithSigningInfo:error:]( self,  "_performBuiltInAppUpgradeValidationWithSigningInfo:error:",  v273,  &v289);
            CFTypeRef v161 = v289;

            if (!v221)
            {
LABEL_263:
              uint64_t v11 = v273;
              a3 = v274;
              goto LABEL_264;
            }

            uint64_t v222 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
            uint64_t v223 = objc_claimAutoreleasedReturnValue([v222 executableURL]);
            uint64_t v224 = [v223 fileSystemRepresentation];
            __int128 v288 = v161;
            uint64_t v225 = MIMachOFileMatchesMyArchitecture(v224, &v288);
            id v12 = v288;

            if (!v225)
            {
LABEL_262:
              CFTypeRef v161 = v12;
              goto LABEL_263;
            }

            __int128 v287 = 0u;
            __int128 v285 = 0u;
            __int128 v286 = 0u;
            __int128 v284 = 0u;
            v163 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
            uint64_t v226 = [v163 countByEnumeratingWithState:&v284 objects:v345 count:16];
            if (!v226)
            {
LABEL_235:

              __int128 v281 = 0u;
              __int128 v282 = 0u;
              v279 = 0u;
              __int128 v280 = 0u;
              v234 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle xpcServiceBundles](self, "xpcServiceBundles"));
              stat v235 = [v234 countByEnumeratingWithState:&v279 objects:v344 count:16];
              if (v235)
              {
                int v236 = v235;
                __int16 v237 = *(void *)v280;
                while (2)
                {
                  v238 = 0LL;
                  unsigned __int8 v239 = v12;
                  do
                  {
                    if (*(void *)v280 != v237) {
                      objc_enumerationMutation(v234);
                    }
                    v240 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v279 + 1) + 8 * (void)v238) executableURL]);
                    v241 = [v240 fileSystemRepresentation];
                    __int128 v278 = v239;
                    v242 = MIMachOFileMatchesMyArchitecture(v241, &v278);
                    id v12 = v278;

                    if (!v242)
                    {

                      goto LABEL_57;
                    }

                    v238 = (char *)v238 + 1;
                    unsigned __int8 v239 = v12;
                  }

                  while (v236 != v238);
                  int v236 = [v234 countByEnumeratingWithState:&v279 objects:v344 count:16];
                  if (v236) {
                    continue;
                  }
                  break;
                }
              }

              goto LABEL_220;
            }

            uint64_t v227 = v226;
            uint64_t v228 = *(void *)v285;
LABEL_229:
            uint64_t v229 = 0LL;
            uint64_t v230 = v12;
            while (1)
            {
              if (*(void *)v285 != v228) {
                objc_enumerationMutation(v163);
              }
              uint64_t v231 = objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v284 + 1) + 8 * (void)v229) executableURL]);
              v232 = [v231 fileSystemRepresentation];
              __int128 v283 = v230;
              v233 = MIMachOFileMatchesMyArchitecture(v232, &v283);
              id v12 = v283;

              if (!v233) {
                break;
              }
              uint64_t v229 = (char *)v229 + 1;
              uint64_t v230 = v12;
              if (v227 == v229)
              {
                uint64_t v227 = [v163 countByEnumeratingWithState:&v284 objects:v345 count:16];
                if (v227) {
                  goto LABEL_229;
                }
                goto LABEL_235;
              }
            }

LABEL_261:
            goto LABEL_262;
          }

          uint64_t v211 = (void *)MIInstallerErrorDomain;
          uint64_t v212 = &off_10008AF98;
          v213 = @"System app install missing system app entitlement";
          uint64_t v214 = 2410LL;
          goto LABEL_257;
        }

        CFTypeRef v161 = v163;
      }

LABEL_264:
      id v12 = v161;
      id v5 = v262;
      goto LABEL_79;
    }

LABEL_248:
        goto LABEL_249;
      }

      CFErrorRef v190 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        v191 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
        v192 = (void *)objc_claimAutoreleasedReturnValue([v191 identifier]);
LABEL_214:
        MOLogWrite(v190);
      }

      goto LABEL_216;
    }

    uint64_t v215 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      v185 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      uint64_t v188 = (void *)objc_claimAutoreleasedReturnValue([v185 identifier]);
      __int128 v254 = v188;
      MOLogWrite(v215);
      goto LABEL_248;
    }

LABEL_249:
    v243 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle", v254, v256, v258));
    char v244 = (void *)objc_claimAutoreleasedReturnValue([v243 bundleURL]);
    __int128 v295 = v12;
    v245 = sub_100045468(v244, v137, (uint64_t)&v295);
    uint64_t v189 = v295;

    if ((v245 & 1) == 0)
    {
      v247 = (void *)MIInstallerErrorDomain;
      uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      id v12 = (id)objc_claimAutoreleasedReturnValue([v139 identifier]);
      __int128 v249 = sub_1000130F4( (uint64_t)"-[MIInstallableBundle performVerificationWithError:]",  2328LL,  v247,  4LL,  v189,  0LL,  @"%@: Unable to write placeholder entitlements into downgrade placeholder: %@",  v248,  (uint64_t)v12);
      CFErrorRef v142 = objc_claimAutoreleasedReturnValue(v249);

LABEL_254:
      id v12 = (id)v142;
      uint64_t v202 = v277;
      v203 = v272;
      goto LABEL_255;
    }

    v185 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    uint64_t v188 = v273;
    __int128 v273 = (void *)objc_claimAutoreleasedReturnValue( [v185 codeSigningInfoByValidatingResources:0 performingOnlineAuthorization:0 ignoringCachedSigningInfo:1 chec kingTrustCacheIfApplicable:0 skippingProfileIDValidation:0 error:0]);
LABEL_251:

    __int128 v294 = v189;
    __int16 v246 = -[MIInstallableBundle _validateApplicationIdentifierForNewBundleSigningInfo:error:]( self,  "_validateApplicationIdentifierForNewBundleSigningInfo:error:",  v273,  &v294);
    id v12 = v294;

    uint64_t v202 = v277;
    v203 = v272;
    if ((v246 & 1) == 0)
    {
LABEL_255:

      goto LABEL_57;
    }
  }

  else
  {
    CFErrorRef v190 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
    {
      v185 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
      uint64_t v188 = (void *)objc_claimAutoreleasedReturnValue([v185 identifier]);
      v191 = (void *)objc_claimAutoreleasedReturnValue([v133 bundleURL]);
      v192 = (void *)objc_claimAutoreleasedReturnValue([v191 path]);
      goto LABEL_214;
    }

LABEL_216:
    uint64_t v202 = v277;
    v203 = v272;
  }

LABEL_218:
LABEL_219:

LABEL_220:
  uint64_t v72 = 1;
  id v5 = v262;
  uint64_t v11 = v273;
LABEL_82:

  return v72;
}

uint64_t sub_10003EC48(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned __int8 v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 bundleTypeDescription]);
  unsigned int v8 = [v5 bundleType];
  if (v8 - 1 < 5 || v8 == 9)
  {

    unsigned __int8 v7 = @"app";
  }

  if (sub_100045E80(v6))
  {
    id v10 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
    id v13 = sub_1000130F4( (uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements",  1779LL,  v10,  205LL,  0LL,  0LL,  @"The %@ at %@ has the entitlement %@, which is only allowed on app extensions targeting the extension point %@.",  v12,  (uint64_t)v7);
  }

  else if (sub_100045E70(v6))
  {
    uint64_t v14 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
    id v13 = sub_1000130F4( (uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements",  1784LL,  v14,  205LL,  0LL,  0LL,  @"The %@ at %@ has the entitlement %@, which is only allowed on app extensions targeting the extension point %@.",  v15,  (uint64_t)v7);
  }

  else
  {
    if (!sub_100045E60(v6))
    {
      id v18 = 0LL;
      uint64_t v19 = 1LL;
      goto LABEL_17;
    }

    uint64_t v16 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
    id v13 = sub_1000130F4( (uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements",  1789LL,  v16,  205LL,  0LL,  0LL,  @"The %@ at %@ has the entitlement %@, which is only allowed on app extensions targeting the extension point %@.",  v17,  (uint64_t)v7);
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(v13);

  if (a3)
  {
    id v18 = v18;
    uint64_t v19 = 0LL;
    *a3 = v18;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

uint64_t sub_10003EE28(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleTypeDescription]);
  if (sub_100045E40(v6))
  {
    unsigned int v8 = (void *)MIInstallerErrorDomain;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
    id v11 = sub_1000130F4( (uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements",  1809LL,  v8,  204LL,  0LL,  0LL,  @"The %@ at %@ has the %@ entitlement, which is only allowed on the browser app itself.",  v10,  (uint64_t)v7);
  }

  else
  {
    if (!sub_100045E50(v6))
    {
      id v14 = 0LL;
      uint64_t v15 = 1LL;
      goto LABEL_9;
    }

    uint64_t v12 = (void *)MIInstallerErrorDomain;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 relativePath]);
    id v11 = sub_1000130F4( (uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements",  1815LL,  v12,  213LL,  0LL,  0LL,  @"The %@ at %@ has the %@ entitlement, which is only allowed on the app itself.",  v13,  (uint64_t)v7);
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(v11);

  if (a3)
  {
    id v14 = v14;
    uint64_t v15 = 0LL;
    *a3 = v14;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

LABEL_55:
    uint64_t v23 = v24;
    goto LABEL_27;
  }

  uint64_t v16 = 0LL;
  if (a5) {
LABEL_28:
  }
    *a5 = v46 == 4;
LABEL_29:
  if (a6)
  {
    uint64_t v16 = v16;
    *a6 = v16;
  }

void sub_100044064(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  uint64_t v2 = (void *)qword_100095BA0;
  qword_100095BA0 = (uint64_t)v1;
}

void sub_1000442FC()
{
}

void sub_100044700()
{
}

void sub_100044CD4(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100044C4CLL);
  }

  _Unwind_Resume(a1);
}

void sub_100044CF0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x100044CFCLL);
}

id sub_10004512C(void *a1, void *a2, id a3)
{
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:v5]);
    if (v6)
    {
      objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v6) & 1) != 0)
      {
        a3 = [v6 BOOLValue];
      }

      else if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
      {
        MOLogWrite(qword_100095BF8);
      }
    }

    else
    {
      a3 = 0LL;
    }
  }

  else
  {
    a3 = 0LL;
  }

  return a3;
}

uint64_t sub_10004521C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((sub_10004512C(v5, *(void **)(*((void *)&v13 + 1) + 8LL * (void)v10), a3) & 1) != 0)
        {
          uint64_t v11 = 1LL;
          goto LABEL_11;
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = 0LL;
LABEL_11:

  return v11;
}

id sub_100045340(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0LL);
}

id sub_100045350(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.security.container-required", (id)1);
}

id sub_100045360(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.security.no-container", 0LL);
}

id sub_100045370(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.security.no-sandbox", 0LL);
}

BOOL sub_100045380(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"seatbelt-profiles"]);
  BOOL v2 = v1 != 0LL;

  return v2;
}

id sub_1000453B8(void *a1)
{
  return sub_10004512C(a1, @"platform-application", 0LL);
}

id sub_1000453C8(void *a1)
{
  return sub_10004512C(a1, @"com.apple.security.system-container", 0LL);
}

id sub_1000453D8(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0LL);
}

id sub_1000453E8(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.security.system-application", 0LL);
}

id sub_1000453F8(void *a1)
{
  return sub_10004512C(a1, @"com.apple.private.webkit.pushbundle", 0LL);
}

id sub_100045408(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.marketplace.app-installation", 0LL);
}

id sub_100045418(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v1));

  return v2;
}

id sub_100045468(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0]);
  id v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id sub_1000454E0(void *a1)
{
  return sub_1000454EC(a1, @"com.apple.security.application-groups");
}

id sub_1000454EC(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:v3]);
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v4);
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      uint64_t v11 = v4;
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
      if (v6) {
        goto LABEL_7;
      }
LABEL_15:
      id v8 = 0LL;
      goto LABEL_16;
    }

    uint64_t v9 = qword_100095BF8;
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
    {
LABEL_14:
      id v6 = 0LL;
      goto LABEL_15;
    }

BOOL sub_10004568C(void *a1)
{
  id v1 = sub_1000454EC(a1, @"com.apple.security.application-groups");
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  BOOL v3 = v2 != 0LL;

  return v3;
}

id sub_1000456C4(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000454EC(v1, @"com.apple.security.system-groups");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v5 = sub_1000454EC(v1, @"com.apple.security.system-group-containers");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    BOOL v4 = (void *)v6;
  }

  return v4;
}

BOOL sub_100045738(void *a1)
{
  id v1 = sub_1000456C4(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  BOOL v3 = v2 != 0LL;

  return v3;
}

id sub_100045768(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.on-demand-install-capable", 0LL);
}

id sub_100045778(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.parent-application-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100045820(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"application-identifier"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_10004588C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"previous-application-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = sub_10001384C(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id sub_1000458E0(void *a1)
{
  return sub_10004512C(a1, @"beta-reports-active", 0LL);
}

id sub_1000458F0(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"keychain-access-groups"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100045998(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.swift-playgrounds-app", 0LL);
}

id sub_1000459A8(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t sub_100045A14(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2LL;
    }

    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3LL;
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  return v3;
}

uint64_t sub_100045A80(void *a1)
{
  id v1 = sub_1000459A8(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = sub_100045A14(v2);

  return v3;
}

id sub_100045AB4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.networking.networkextension"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100045B5C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.associated-appclip-app-identifiers"]);
  objc_opt_class(&OBJC_CLASS___NSArray);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100045C04(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.driverkit", 0LL);
}

id sub_100045C14(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v3 = v2;
  if ((objc_opt_isKindOfClass(v3) & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"data-protection-class"]);
    objc_opt_class(&OBJC_CLASS___NSString);
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass(v6) & 1) != 0 ? v6 : 0LL;

    if (!v4)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"DataProtectionClass"]);
      objc_opt_class(&OBJC_CLASS___NSString);
      id v8 = v7;
      if ((objc_opt_isKindOfClass(v8) & 1) != 0) {
        id v4 = v8;
      }
      else {
        id v4 = 0LL;
      }
    }
  }

  return v4;
}

id sub_100045D44(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( [a1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  if (v3)
  {
    id v4 = v2;
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___NSArray);
    id v5 = v2;
    if ((objc_opt_isKindOfClass(v5) & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class(&OBJC_CLASS___NSString);
      id v8 = sub_10001353C(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue(v8);
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

id sub_100045E40(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.web-browser-engine.host", 0LL);
}

id sub_100045E50(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.embedded-web-browser-engine", 0LL);
}

id sub_100045E60(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.web-browser-engine.rendering", 0LL);
}

id sub_100045E70(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.web-browser-engine.networking", 0LL);
}

id sub_100045E80(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.web-browser-engine.webcontent", 0LL);
}

id sub_100045E90(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-accept"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100045EFC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-send"]);
  objc_opt_class(&OBJC_CLASS___NSString);
  id v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id sub_100045F68(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.web-browser", 0LL);
}

id sub_100045F78(void *a1)
{
  return sub_10004512C(a1, @"com.apple.developer.browser.app-installation", 0LL);
}

void sub_100047718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

uint64_t sub_100047754(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100047764(uint64_t a1)
{
}

uint64_t sub_10004776C(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (a3 == 4)
  {
    id v7 = objc_alloc(&OBJC_CLASS___NSUUID);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    uint64_t v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v18 = 0LL;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 modificationDateForURL:v6 error:&v18]);
      id v12 = v18;
      if (v11)
      {
        if ([v11 compare:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] == (id)1)
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
            objc_msgSend(*(id *)(a1 + 40), "addObject:");
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v11);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), a2);
        }

        else
        {
          [*(id *)(a1 + 40) addObject:v6];
        }
      }

      else
      {
        uint64_t v14 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          MOLogWrite(v14);
        }
      }
    }

    else
    {
      uint64_t v13 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        MOLogWrite(v13);
      }
    }
  }

  return 1LL;
}

void sub_100047FA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

BOOL sub_100047FD0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 8) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return a3 != 8;
}

uint64_t sub_100048694(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    unsigned __int8 v8 = [v7 isEqualToString:@"plist"];

    if ((v8 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_opt_class(*(void *)(a1 + 40));
      id v16 = 0LL;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 _operationFromURL:v6 error:&v16]);
      id v11 = v16;
      if (v10)
      {
        [*(id *)(a1 + 32) addObject:v10];
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_1000514D8(v6);
        }
        uint64_t v13 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
          MOLogWrite(v13);
        }
      }

      goto LABEL_14;
    }

    uint64_t v12 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
      MOLogWrite(v12);
LABEL_14:
    }
  }

  return 1LL;
}

int64_t sub_100048818(id a1, MILaunchServicesOperation *a2, MILaunchServicesOperation *a3)
{
  id v4 = a3;
  unint64_t v5 = -[MILaunchServicesOperation serialNumber](a2, "serialNumber");
  unint64_t v6 = -[MILaunchServicesOperation serialNumber](v4, "serialNumber");

  if (v5 >= v6) {
    int64_t v7 = 0LL;
  }
  else {
    int64_t v7 = -1LL;
  }
  if (v5 > v6) {
    return 1LL;
  }
  else {
    return v7;
  }
}

void sub_100049E04(_Unwind_Exception *a1)
{
}

id sub_100049E40(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _lsApplicationWorkspaceInstance]);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v13 = 0LL;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( [v2 registerContainerizedApplicationWithInfoDictionaries:v5 operationUUID:v3 requestContext:v4 saveObserver:v6 registrationError:&v13]);
  id v8 = v13;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  id v11 = 0LL;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
    id v11 = v8;
  }

  return v11;
}

void sub_10004A0B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_10004A0D4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[11];
  id v13 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( objc_msgSend( v2,  "_onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:",  v3,  v4,  v5,  v7,  v6,  &v13));
  id v9 = v13;
  id v10 = v13;
  uint64_t v11 = *(void *)(a1[9] + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;

  if (!*(void *)(*(void *)(a1[9] + 8LL) + 40LL)) {
    objc_storeStrong((id *)(*(void *)(a1[10] + 8LL) + 40LL), v9);
  }
}

LABEL_24:
  a6 = v37;
  if (v38 && v24)
  {
    uint64_t v23 = v23;
    *uint64_t v38 = v23;
    LOBYTE(v24) = 1;
    goto LABEL_27;
  }

  id v28 = *((unsigned __int8 *)v45 + 24);
  if (a7 && !*((_BYTE *)v45 + 24))
  {
    *a7 = v17;
    id v28 = *((unsigned __int8 *)v45 + 24);
  }

  unsigned __int8 v29 = v28 != 0;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v44, 8);

  return v29;
}

  uint64_t result = qword_100095BF8;
  if (qword_100095BF8)
  {
  }

  return result;
}

void sub_10004AA94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_10004AAB4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _lsApplicationWorkspaceInstance]);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0LL;
  unsigned __int8 v8 = [v2 setPersonaUniqueStrings:v6 forApplicationWithBundleIdentifier:v3 operationUUID:v4 requestContext:v5 saveObserver:v7 error:&v12];
  id v9 = v12;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v8;

  id v10 = 0LL;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
    id v10 = v9;
  }

  return v10;
}

void sub_10004ACC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004ACE8(void *a1)
{
  uint64_t v3 = a1 + 6;
  uint64_t v2 = a1[6];
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 1);
  uint64_t v6 = v3[3];
  id v15 = 0LL;
  unsigned __int8 v7 = objc_msgSend( v4,  "_onQueue_setPersonaUniqueStrings:forAppBundleID:inDomain:error:",  v5,  v2,  v6,  &v15);
  id v8 = v15;
  id v9 = v15;
  *(_BYTE *)(*(void *)(v3[1] + 8) + 24LL) = v7;
  if (!*(_BYTE *)(*(void *)(v3[1] + 8) + 24LL))
  {
    uint64_t v11 = a1[8];
    uint64_t v10 = (uint64_t)(a1 + 8);
    objc_storeStrong((id *)(*(void *)(v11 + 8) + 40LL), v8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005184C(v3, v3 + 3, v10);
    }
    uint64_t v12 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      uint64_t v13 = MIStringForInstallationDomain(v3[3]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      MOLogWrite(v12);
    }
  }
}

void sub_10004B0C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

id sub_10004B0E0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _lsApplicationWorkspaceInstance]);
  uint64_t v3 = *(unsigned int *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = 0LL;
  unsigned __int8 v9 = [v2 unregisterContainerizedApplicationWithBundleIdentifier:v7 operationUUID:v4 unregistrationOperation:v3 p recondition:v5 requestContext:v6 saveObserver:v8 unregistrationError:&v13];
  id v10 = v13;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v9;

  id v11 = 0LL;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
    id v11 = v10;
  }

  return v11;
}

void sub_10004B588( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_10004B5BC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = objc_msgSend( v2,  "_onQueue_unregisterAppForBundleID:domain:operationType:precondition:error:",  v3,  v6,  v5,  v4,  &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v8;
}

void sub_10004B9EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10004BA10(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0LL;
  unsigned __int8 v4 = objc_msgSend(v2, "_onQueue_unregisterApplicationsAtMountPoint:error:", v3, &v7);
  id v5 = v7;
  id v6 = v7;
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = v4;
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), v5);
  }
}

id sub_10004BB34(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:",  *(void *)(a1 + 40),  1);
}

id sub_10004BC08(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_onQueue_handleLaunchServicesOperationFailureForUUID:error:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

void sub_10004BCB8(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10004BDA4(uint64_t a1)
{
  id v2 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initForInstallationDomain:2];
  uint64_t v3 = (void *)qword_100095BC0;
  qword_100095BC0 = (uint64_t)v2;

  id v4 = [objc_alloc((Class)objc_opt_class(*(void *)(a1 + 32))) initForInstallationDomain:3];
  id v5 = (void *)qword_100095BC8;
  qword_100095BC8 = (uint64_t)v4;
}

void sub_10004C1E8(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  id v2 = (void *)qword_100095BD8;
  qword_100095BD8 = (uint64_t)v1;
}

uint64_t sub_10004C578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void))(a3 + 16))(a3, 3LL, &v45, 32LL, 0LL) != 32)
  {
    uint64_t v27 = qword_100095BF8;
LABEL_34:
    id v28 = __error();
    strerror(*v28);
    uint64_t v29 = v27;
LABEL_37:
    MOLogWrite(v29);
    return 0LL;
  }

  if (v45 != 0x3034464649445342LL)
  {
    uint64_t v29 = qword_100095BF8;
    goto LABEL_37;
  }

  uint64_t v9 = sub_10004CB74(a3, 4, a4, 32LL);
  if (!v9)
  {
    uint64_t v27 = qword_100095BF8;
    goto LABEL_34;
  }

  id v10 = v9;
  id v11 = sub_10004CB74(a3, 5, a4, v46 + 32);
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = sub_10004CB74(a3, 6, a4, v46 + v47 + 32);
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = malloc(0x10000uLL);
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = malloc(0x10000uLL);
        if (v17)
        {
          id v18 = v17;
          if (v48)
          {
            uint64_t v19 = 0LL;
            unint64_t v20 = 0LL;
            uint64_t v41 = (uint64_t)v14;
            while (sub_10004CCF0((uint64_t)v10, &buf, 24) == 24)
            {
              if (v44 < 0) {
                uint64_t v44 = -(v44 & 0x7FFFFFFFFFFFFFFFLL);
              }
              unint64_t v21 = buf;
              if (buf)
              {
                while (1)
                {
                  if (v21 >= 0x10000) {
                    uint64_t v22 = 0x10000LL;
                  }
                  else {
                    uint64_t v22 = v21;
                  }
                  if ((*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(a1 + 16))( a1,  1LL,  v16,  v22,  v19) != v22)
                  {
                    uint64_t v39 = qword_100095BF8;
                    goto LABEL_72;
                  }

                  uint64_t v23 = 0LL;
                  do
                  {
                    *((_BYTE *)v18 + v23) += v16[v23];
                    ++v23;
                  }

                  while (v22 != v23);
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))( a5,  2LL,  v18,  v22,  v20) != v22)
                  {
LABEL_60:
                    uint64_t v39 = qword_100095BF8;
                    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
                    {
LABEL_65:
                      uint64_t v40 = v39;
                      goto LABEL_71;
                    }

                    goto LABEL_72;
                  }

                  v19 += v22;
                  v20 += v22;
                  v21 -= v22;
                  if (!v21) {
                    goto LABEL_23;
                  }
                }

                uint64_t v40 = qword_100095BF8;
LABEL_71:
                MOLogWrite(v40);
LABEL_72:
                uint64_t v26 = 0LL;
                uint64_t v14 = (void *)v41;
                goto LABEL_73;
              }

LABEL_73:
          free(v18);
        }

        else
        {
          uint64_t v37 = qword_100095BF8;
          if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
          {
            uint64_t v38 = __error();
            strerror(*v38);
            MOLogWrite(v37);
          }

          uint64_t v26 = 0LL;
        }

        free(v16);
      }

      else
      {
        uint64_t v35 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          id v36 = __error();
          strerror(*v36);
          MOLogWrite(v35);
        }

        uint64_t v26 = 0LL;
      }

      sub_10004CD68(v14);
    }

    else
    {
      uint64_t v33 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        uint64_t v34 = __error();
        strerror(*v34);
        MOLogWrite(v33);
      }

      uint64_t v26 = 0LL;
    }

    sub_10004CD68(v12);
  }

  else
  {
    uint64_t v31 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      unsigned __int8 v32 = __error();
      strerror(*v32);
      MOLogWrite(v31);
    }

    uint64_t v26 = 0LL;
  }

  sub_10004CD68(v10);
  return v26;
}

void *sub_10004CB74(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int bzerror = 0;
  unsigned __int8 v8 = calloc(1uLL, 0x30uLL);
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = qword_100095BF8;
LABEL_12:
    uint64_t v14 = __error();
    strerror(*v14);
    uint64_t v12 = v13;
LABEL_13:
    MOLogWrite(v12);
LABEL_14:
    sub_10004CD68(v9);
    return 0LL;
  }

  *(_DWORD *)unsigned __int8 v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  id v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))sub_10004D080, 0LL, 0LL, 0LL);
  v9[4] = v10;
  if (!v10)
  {
    uint64_t v13 = qword_100095BF8;
    goto LABEL_12;
  }

  id v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0LL, 0);
  v9[5] = v11;
  if (!v11)
  {
    uint64_t v12 = qword_100095BF8;
    goto LABEL_13;
  }

  return v9;
}

uint64_t sub_10004CCF0(uint64_t a1, void *buf, int len)
{
  int bzerror = 0;
  uint64_t result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    return 0xFFFFFFFFLL;
  }

  return result;
}

void sub_10004CD68(void *a1)
{
  int bzerror = 0;
  if (a1)
  {
    id v2 = (BZFILE *)a1[5];
    if (v2) {
      BZ2_bzReadClose(&bzerror, v2);
    }
    uint64_t v3 = (FILE *)a1[4];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }

uint64_t sub_10004CDB8(const char *a1, const char *a2, int a3)
{
  int v5 = open(a1, 256);
  if (v5 != -1)
  {
    int v6 = v5;
    if (fstat(v5, &v29) == -1)
    {
      uint64_t v13 = qword_100095BF8;
      uint64_t v14 = __error();
      strerror(*v14);
      uint64_t v15 = v13;
    }

    else
    {
      int v7 = open(a2, 256);
      if (v7 != -1)
      {
        int v8 = v7;
        if (fstat(v7, &v28) == -1)
        {
          uint64_t v18 = qword_100095BF8;
          uint64_t v19 = __error();
          strerror(*v19);
          uint64_t v20 = v18;
        }

        else
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 0x40000000LL;
          v26[2] = sub_10004D044;
          v26[3] = &unk_100081A20;
          int v27 = v6;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 0x40000000LL;
          v24[2] = sub_10004D058;
          v24[3] = &unk_100081A40;
          int v25 = v8;
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 0x40000000LL;
          void v22[2] = sub_10004D06C;
          v22[3] = &unk_100081A60;
          int v23 = a3;
          if ((sub_10004C578((uint64_t)v26, v9, (uint64_t)v24, v28.st_size, (uint64_t)v22) & 1) != 0)
          {
            uint64_t v10 = 0LL;
LABEL_26:
            close(v8);
            goto LABEL_27;
          }

          uint64_t v20 = qword_100095BF8;
          if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
          {
LABEL_25:
            uint64_t v10 = 0xFFFFFFFFLL;
            goto LABEL_26;
          }
        }

        MOLogWrite(v20);
        goto LABEL_25;
      }

      uint64_t v16 = qword_100095BF8;
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
      {
LABEL_18:
        uint64_t v10 = 0xFFFFFFFFLL;
LABEL_27:
        close(v6);
        return v10;
      }

      uint64_t v17 = __error();
      strerror(*v17);
      uint64_t v15 = v16;
    }

    MOLogWrite(v15);
    goto LABEL_18;
  }

  uint64_t v11 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    uint64_t v12 = __error();
    strerror(*v12);
    MOLogWrite(v11);
  }

  return 0xFFFFFFFFLL;
}

ssize_t sub_10004D044(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10004D058(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10004D06C(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t sub_10004D080(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
  if (result == -1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) += result;
  return result;
}

void sub_10004D4E4(const void *a1)
{
}

void sub_10004D4EC(const void *a1)
{
}

void sub_10004D4F4(const void *a1, int a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v4)
  {
    MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, (CFArrayRef)a1);
    v9.length = CFArrayGetCount(MutableCopy);
    v9.location = 0LL;
    CFArraySortValues(MutableCopy, v9, (CFComparatorFunction)sub_10004D708, 0LL);
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004DCD0;
    v7[3] = &unk_100081AA0;
    v7[4] = Mutable;
    char v8 = a2;
    sub_10004D798(MutableCopy, v7);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }

  else
  {
    if (CFStringGetTypeID() != v4) {
      sub_100051B94();
    }
    sub_10004DD1C(a1, a2);
  }

void sub_10004D60C(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v2)
  {
    MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, (CFArrayRef)a1);
    v6.length = CFArrayGetCount(MutableCopy);
    v6.location = 0LL;
    CFArraySortValues(MutableCopy, v6, (CFComparatorFunction)sub_10004D708, (void *)1);
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10004D7F4;
    v5[3] = &unk_100081A80;
    void v5[4] = Mutable;
    sub_10004D798(MutableCopy, v5);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }

  else
  {
    if (CFStringGetTypeID() != v2) {
      sub_100051BD4();
    }
    sub_10004D83C(a1);
  }

CFComparisonResult sub_10004D708(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a1)) {
    return 0LL;
  }
  CFTypeID v7 = CFStringGetTypeID();
  if (v7 != CFGetTypeID(a2)) {
    return 0LL;
  }
  CFComparisonResult result = CFStringCompare(a1, a2, 0LL);
  uint64_t v9 = 1LL;
  if (result == kCFCompareGreaterThan) {
    uint64_t v10 = -1LL;
  }
  else {
    uint64_t v10 = result;
  }
  if (result != kCFCompareLessThan) {
    uint64_t v9 = v10;
  }
  if (a3) {
    return v9;
  }
  return result;
}

void sub_10004D798(const __CFArray *a1, void *a2)
{
  if (a1)
  {
    id context = a2;
    v4.length = CFArrayGetCount(a1);
    v4.location = 0LL;
    CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)sub_10004DF10, context);
  }

void sub_10004D7F4(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_10004D83C(a2);
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
  }

char *sub_10004D83C(const void *a1)
{
  CFComparisonResult result = (char *)qword_100095A38;
  if (qword_100095A38)
  {
    CFComparisonResult result = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100095A38, a1);
    if (result)
    {
      uint64_t v3 = (pthread_rwlock_t *)result;
      CFRange v4 = (unsigned int *)(result + 208);
      if (*((_DWORD *)result + 52))
      {
        if (*v4 == -1)
        {
          while (1)
          {
            unsigned int v7 = __ldaxr(v4);
            if (v7 != -1) {
              goto LABEL_32;
            }
            if (!__stlxr(0, v4))
            {
              if (dword_100095A48 || !dword_100095A44) {
                goto LABEL_31;
              }
              int v8 = dword_100095A44 - 1;
              dword_100095A44 = v8;
              if (dword_100095A40 | v8)
              {
                BOOL v9 = 1;
                if (v8) {
                  goto LABEL_21;
                }
              }

              else
              {
                pthread_cond_signal(&stru_100095978);
                BOOL v9 = dword_100095A48 != -1;
                if (dword_100095A44) {
                  goto LABEL_21;
                }
              }

              if (v9) {
                pthread_cond_broadcast(&stru_1000959A8);
              }
              goto LABEL_21;
            }
          }
        }

        do
          int v5 = __ldaxr(v4);
        while (__stlxr(v5 - 1, v4));
        if (v5 > 0 && (dword_100095A48 & 0x80000000) == 0)
        {
          int v6 = dword_100095A40;
          if (dword_100095A40)
          {
            --dword_100095A40;
            if (!((v6 - 1) | dword_100095A44 | dword_100095A48)) {
              pthread_cond_signal(&stru_100095978);
            }
LABEL_21:
            --v3[1].__sig;
            pthread_rwlock_unlock(v3);
            if (v3[1].__sig) {
              return (char *)pthread_mutex_unlock(&stru_100095938);
            }
            CFComparisonResult result = (char *)qword_100095BF8;
            if (qword_100095BF8)
            {
            }

            if (!*v4)
            {
              pthread_rwlock_destroy(v3);
              free(v3);
              CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100095A38, a1);
              return (char *)pthread_mutex_unlock(&stru_100095938);
            }
          }
        }
      }
    }
  }

uint64_t sub_10004DA4C()
{
  return sub_10004DA54(0);
}

uint64_t sub_10004DA54(char a1)
{
  if ((a1 & 1) != 0)
  {
    if (dword_100095A40) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = dword_100095A44 == 0;
    }
    if (!v2 || dword_100095A48 != 0)
    {
      do
      {
        pthread_cond_wait(&stru_100095978, &stru_100095938);
        if (dword_100095A40) {
          BOOL v4 = 0;
        }
        else {
          BOOL v4 = dword_100095A44 == 0;
        }
      }

      while (!v4 || dword_100095A48 != 0);
    }

    int v6 = -1;
  }

  else
  {
    int v8 = dword_100095A44;
    for (int i = dword_100095A48; v8 || i == -1; int i = dword_100095A48)
    {
      pthread_cond_wait(&stru_1000959A8, &stru_100095938);
      int v8 = dword_100095A44;
    }

    int v6 = i + 1;
  }

  dword_100095A48 = v6;
  return pthread_mutex_unlock(&stru_100095938);
}

uint64_t sub_10004DBC0()
{
  return sub_10004DA54(1);
}

uint64_t sub_10004DBCC()
{
  uint64_t result = pthread_mutex_lock(&stru_100095938);
  if (dword_100095A48 == -1)
  {
    dword_100095A48 = 0;
    pthread_cond_signal(&stru_100095978);
    pthread_cond_broadcast(&stru_1000959A8);
    pthread_cond_broadcast(&stru_1000959D8);
    pthread_cond_broadcast(&stru_100095A08);
  }

  else
  {
    if (dword_100095A48 <= 0)
    {
      __break(1u);
      return result;
    }

    int v1 = dword_100095A48 - 1;
    dword_100095A48 = v1;
    if (!v1)
    {
      pthread_cond_broadcast(&stru_1000959D8);
      int v1 = dword_100095A48;
    }

    if (dword_100095A40) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = dword_100095A44 == 0;
    }
    if (v2 && v1 == 0) {
      pthread_cond_signal(&stru_100095978);
    }
  }

  pthread_mutex_unlock(&stru_100095938);
  uint64_t result = qword_100095BF8;
  if (qword_100095BF8)
  {
  }

  return result;
}

void sub_10004DCD0(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_10004DD1C(a2, *(unsigned __int8 *)(a1 + 40));
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
  }

uint64_t sub_10004DD1C(const void *a1, int a2)
{
  int v4 = dword_100095A48;
  if ((a2 & 1) != 0)
  {
    while (dword_100095A48)
      pthread_cond_wait(&stru_1000959D8, &stru_100095938);
    ++dword_100095A44;
  }

  else
  {
    while (v4 == -1)
    {
      pthread_cond_wait(&stru_100095A08, &stru_100095938);
      int v4 = dword_100095A48;
    }

    ++dword_100095A40;
  }

  if (!qword_100095A38)
  {
    qword_100095A38 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    goto LABEL_12;
  }

  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100095A38, a1);
  if (!Value)
  {
LABEL_12:
    int v6 = (char *)malloc(0xD8uLL);
    pthread_rwlock_init((pthread_rwlock_t *)v6, 0LL);
    *((void *)v6 + 25) = 1LL;
    *((_DWORD *)v6 + 52) = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_100095A38, a1, v6);
    goto LABEL_13;
  }

  int v6 = Value;
  ++*((void *)Value + 25);
LABEL_13:
  pthread_mutex_unlock(&stru_100095938);
  unsigned int v7 = (unsigned int *)(v6 + 208);
  if (a2)
  {
    uint64_t result = pthread_rwlock_wrlock((pthread_rwlock_t *)v6);
    while (!__ldaxr(v7))
    {
      if (!__stlxr(0xFFFFFFFF, v7)) {
        goto LABEL_24;
      }
    }

    goto LABEL_29;
  }

  uint64_t result = pthread_rwlock_rdlock((pthread_rwlock_t *)v6);
  do
    unsigned int v10 = __ldaxr(v7);
  while (__stlxr(v10 + 1, v7));
  if ((v10 & 0x80000000) != 0)
  {
    __break(1u);
LABEL_29:
    __clrex();
    __break(1u);
    return result;
  }

void sub_10004DF10(uint64_t a1, id a2)
{
  uint64_t v3 = (void (**)(id, void))objc_retainBlock(a2);
  v3[2](v3, a1);
}

void sub_10004DFC4(uint64_t a1)
{
  id v1 = objc_alloc_init((Class)objc_opt_class(*(void *)(a1 + 32)));
  BOOL v2 = (void *)qword_100095BE8;
  qword_100095BE8 = (uint64_t)v1;
}

LABEL_34:
      if (a5)
      {
        int v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
        goto LABEL_36;
      }

LABEL_37:
      unsigned __int8 v32 = 1;
      goto LABEL_38;
    }

    unint64_t v43 = v14;
    uint64_t v19 = [v12 serializeToURL:v9 error:&v43];
    uint64_t v20 = v43;

    if ((v19 & 1) != 0)
    {
      uint64_t v14 = v20;
      goto LABEL_34;
    }

    uint64_t v35 = qword_100095BF8;
    int v25 = (id)objc_claimAutoreleasedReturnValue([v9 path]);
    MOLogWrite(v35);
  }

  else
  {
    unint64_t v24 = sub_1000130F4( (uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]",  289LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Persona %@ not found in %@",  v17,  (uint64_t)v10);
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue(v24);
    int v25 = v14;
  }

void sub_10004F1C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10004F1EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004F1FC(uint64_t a1)
{
}

uint64_t sub_10004F204(uint64_t a1, void *a2, int a3, _BYTE *a4)
{
  id v7 = a2;
  int v8 = v7;
  if (a3 != 4)
  {
    int v10 = *(_DWORD *)(a1 + 48);
    if (v10 == 1)
    {
      a4 = (_BYTE *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
      if ([a4 isEqualToString:@"TemporaryAppReferences"])
      {

LABEL_13:
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
        id obj = *(id *)(v13 + 40);
        a4 = (_BYTE *)objc_claimAutoreleasedReturnValue( +[MIAppReferenceMetadata referenceMetadataFromURL:error:]( &OBJC_CLASS___MIAppReferenceMetadata,  "referenceMetadataFromURL:error:",  v8,  &obj));
        objc_storeStrong((id *)(v13 + 40), obj);
        if (!a4)
        {
          uint64_t v9 = 0LL;
          goto LABEL_20;
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a4 personas]);
        id v15 = [v14 count];

        uint64_t v16 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a4 personas]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
          MOLogWrite(v16);
        }

        *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v15;
        goto LABEL_18;
      }

      if (*(_DWORD *)(a1 + 48) != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }

    else if (v10 != 2)
    {
      goto LABEL_19;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    unsigned int v12 = [v11 isEqualToString:@"AppReferences"];

    if (v10 == 1)
    {

      if ((v12 & 1) == 0) {
        goto LABEL_19;
      }
    }

    else if (!v12)
    {
LABEL_19:
      uint64_t v9 = 1LL;
      goto LABEL_20;
    }

    goto LABEL_13;
  }

  uint64_t v9 = 1LL;
  *a4 = 1;
LABEL_20:

  return v9;
}

void sub_10004FFE4(void *a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *UserManagementLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"ICLSoftLinking.h",  38,  @"%s",  *a1);

  __break(1u);
}

void sub_100050060()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getUMUserManagerClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"ICLSoftLinking.h",  39,  @"Unable to find class %s",  "UMUserManager");

  __break(1u);
}

void sub_1000500D8()
{
}

void sub_100050100()
{
}

void sub_100050128(uint64_t a1)
{
  int v1 = 136315394;
  BOOL v2 = "MIReportIssueUsingAutoBugCapture";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to report using ABC with signature: %@",  (uint8_t *)&v1,  0x16u);
}

void sub_1000501B8()
{
}

void sub_1000501D0(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100028D10();
  sub_100028C94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Daemon's home directory at %@ should have perms 0%ho, but found 0%ho",  v3,  v4,  v5,  v6,  v7);

  sub_100028D04();
}

void sub_100050260(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100028CC4();
  sub_100028C94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Daemon's home directory at %@ should have gid %u, but found %u",  v3,  v4,  v5,  v6,  v7);

  sub_100028CF4();
}

void sub_1000502EC(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100028CC4();
  sub_100028C94( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Daemon's home directory at %@ should be owned by uid %u, but found %u",  v3,  v4,  v5,  v6,  v7);

  sub_100028CF4();
}

void sub_100050378(void *a1, int a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100028D10();
  int v5 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Daemon's home directory at %@ was not a directory; found mode: 0%ho",
    v4,
    0x12u);

  sub_100028D04();
}

void sub_100050408(void *a1, int a2, uint64_t a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v6 = 138413058;
  uint8_t v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 2080;
  uint64_t v11 = strerror(a2);
  __int16 v12 = 2112;
  uint64_t v13 = a3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to stat daemon's home directory at %@ : %d (%s); parentInfo: %@",
    (uint8_t *)&v6,
    0x26u);

  sub_100028C84();
}

void sub_1000504CC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 URLByDeletingLastPathComponent]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a3 debugDescriptionForItemAtURL:v4]);
  sub_100028CA4();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "No space to create directory at %@: %@; parentInfo: %@",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_100028C84();
}

void sub_100050570(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 URLByDeletingLastPathComponent]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a3 debugDescriptionForItemAtURL:v4]);
  sub_100028CA4();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "Failed to create directory at %@: %@; parentInfo: %@",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_100028C84();
}

void sub_100050614(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  sub_100029B1C();
  sub_100029B6C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%s: Failed to write journal entry for %@ to %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100029B5C();
}

void sub_1000506AC(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  sub_100029B1C();
  sub_100029B6C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%s: Failed to remove journal entry for %@ from %@ : %@",  v4,  v5,  v6,  v7,  2u);

  sub_100029B5C();
}

void sub_100050744(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to read journal entry data from %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_1000507D0(void *a1)
{
  int v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to unarchive journal entry data from %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_10005085C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000508E8()
{
}

void sub_100050950()
{
}

void sub_1000509B8()
{
}

void sub_100050A20()
{
}

void sub_100050A88()
{
}

void sub_100050AF0()
{
}

void sub_100050B58()
{
}

void sub_100050BC4(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_10002DC7C();
  sub_10002DC6C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "Failed to read linked parent bundles file at %@ : %@",  v3,  v4,  v5,  v6,  v7);
}

void sub_100050C50()
{
}

void sub_100050CB8()
{
  v3[0] = 136315906;
  sub_100031344();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  __int16 v6 = v0;
  uint64_t v7 = v2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to recover install for %@/%@ : %@",  (uint8_t *)v3,  0x2Au);
}

void sub_100050D4C(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identity]);
  v4[0] = 136315650;
  sub_100031344();
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Failed to replay journal entry for %@ after %lu attempts",  (uint8_t *)v4,  0x20u);
}

void sub_100050DF8(void *a1, _DWORD *a2, void *a3)
{
  *a2 = 136315650;
  sub_100035AAC( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(void *)(v5 + 24) = @"ParallelPlaceholderOnlyIfExists";
  sub_100035AC4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "%s: Process %@ is using an unsupported key: %@",  v7);
}

void sub_100050E64(void *a1, _DWORD *a2, void *a3)
{
  *a2 = 136315650;
  sub_100035AAC( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(void *)(v5 + 24) = @"Placeholder";
  sub_100035AC4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v6,  "%s: Process %@ is using an unsupported key: %@",  v7);
}

void sub_100050ED0()
{
}

void sub_100050F44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100050FB8()
{
}

void sub_10005102C()
{
}

void sub_1000510A0()
{
}

void sub_100051114()
{
}

void sub_100051188()
{
}

void sub_1000511FC()
{
}

void sub_100051270( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10002DC58();
}

void sub_1000512E4()
{
}

void sub_100051358(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to write previous attempts file to %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_1000513E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10002DC58();
}

void sub_100051464()
{
}

void sub_1000514D8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to unarchive operation data from %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_100051564()
{
}

void sub_1000515D8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to purge registration dir at %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_100051664(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_100029B40();
  sub_100028CE4( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v2,  "%s: Failed to purge registration lookaside dir at %@ : %@",  v3,  v4,  v5,  v6,  2u);

  sub_100029B7C();
}

void sub_1000516F0()
{
}

void sub_100051764()
{
}

void sub_1000517D8()
{
}

void sub_10005184C(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = MIStringForInstallationDomain(*a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = *(void *)(*(void *)(*(void *)a3 + 8LL) + 40LL);
  int v9 = 136315906;
  uint64_t v10 = "-[MILaunchServicesOperationManager setPersonaUniqueStrings:forAppBundleID:inDomain:error:]_block_invoke";
  __int16 v11 = 2112;
  uint64_t v12 = v4;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  sub_10004BCB8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "%s: Failed to set persona unique strings for %@/%@ : %@",  (uint8_t *)&v9);
}

void sub_10005191C()
{
}

void sub_100051990(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 40LL);
  int v4 = 136315906;
  uint64_t v5 = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = a3;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Successfully registered the record for %@ from on-disk state after failing to unregister (Operation type %d) due to precondition validation failure %@",  (uint8_t *)&v4,  0x26u);
  sub_10004BCB0();
}

void sub_100051A38()
{
}

void sub_100051AAC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)a4 = 136315906;
  *(void *)(a4 + 4) = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  *(_WORD *)(a4 + 12) = 2112;
  *(void *)(a4 + 14) = a1;
  *(_WORD *)(a4 + 22) = 2112;
  *(void *)(a4 + 24) = a2;
  *(_WORD *)(a4 + 32) = 2112;
  *(void *)(a4 + 34) = a3;
  sub_10004BCB8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "%s: Failed to unregister record for %@ in domain %@ : %@",  (uint8_t *)a4);
}

void sub_100051B20()
{
}

void sub_100051B94()
{
}

void sub_100051BD4()
{
}

void sub_100051C14(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v2 = 136315394;
  uint64_t v3 = "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "%s: Unexpectedly found no personas in : %@",  (uint8_t *)&v2,  0x16u);
}

id objc_msgSend_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:");
}

id objc_msgSend__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:");
}

id objc_msgSend__checkEligibilityForAppWithSigningInfo_distributorInfo_isWebDistribution_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkEligibilityForAppWithSigningInfo:distributorInfo:isWebDistribution:withError:");
}

id objc_msgSend__domainForBrowserEligibilityForApp_withSigningInfo_distributorInfo_isWebDistribution_operationType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_domainForBrowserEligibilityForApp:withSigningInfo:distributorInfo:isWebDistribution:operationType:");
}

id objc_msgSend__domainForMarketplaceEligibilityForApp_withSigningInfo_isWebDistribution_distributorInfo_operationType_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_domainForMarketplaceEligibilityForApp:withSigningInfo:isWebDistribution:distributorInfo:operationType:");
}

id objc_msgSend__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:");
}

id objc_msgSend__onQueue_registerApplicationInfo_onMountPoint_forAppBundleID_domain_personas_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:");
}

id objc_msgSend__onQueue_unregisterAppForBundleID_domain_operationType_precondition_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_unregisterAppForBundleID:domain:operationType:precondition:error:");
}

id objc_msgSend__performBrowserAppEntitlementAndArchitectureValidationForSigningInfo_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:");
}

id objc_msgSend__reconcileOperations_unregisterMountPoints_registerMountPoints_restartUniqueOperations_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:");
}

id objc_msgSend__registerApplicationInfo_onMountPoint_forAppBundleID_domain_personas_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:");
}

id objc_msgSend__removeReferenceAtURL_personaUniqueString_inBundleContainer_wasLastReference_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__shouldSkipEligibilityChecksForInstallRequestorWithAuditToken_persona_authorizingBundleID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSkipEligibilityChecksForInstallRequestorWithAuditToken:persona:authorizingBundleID:");
}

id objc_msgSend__uninstallBundleWithIdentity_linkedToChildren_waitForDeletion_uninstallReason_temporaryReference_deleteDataContainers_wasLastReference_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataCo ntainers:wasLastReference:error:");
}

id objc_msgSend__updateReferenceAtURL_byAddingPersonaUniqueString_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__updateReferenceAtURL_byRemovingPersonaUniqueString_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__validateArgsForMethodWithName_bundleIdentifier_data_optionalOptions_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:");
}

id objc_msgSend__validateBundle_validatingResources_performingOnlineAuthorization_checkingTrustCacheIfApplicable_allowingFreeProfileValidation_skippingProfileIDValidation_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFree ProfileValidation:skippingProfileIDValidation:error:");
}

id objc_msgSend__validateInstallRequestForURL_identity_targetingDomain_options_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateInstallRequestForURL:identity:targetingDomain:options:withError:");
}

id objc_msgSend_addReferenceForIdentity_inDomain_forUserWithID_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferenceForIdentity:inDomain:forUserWithID:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_addReferenceForUserWithID_personaUniqueString_byRemovingTemporaryReference_inBundleContainer_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersona UniqueStrings:error:");
}

id objc_msgSend_addTemporaryReferenceForUserWithID_personaUniqueString_inBundleContainer_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:");
}

id objc_msgSend_captureStoreDataFromDirectory_doCopy_failureIsFatal_includeiTunesMetadata_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:");
}

id objc_msgSend_codeSigningInfoByValidatingResources_performingOnlineAuthorization_ignoringCachedSigningInfo_checkingTrustCacheIfApplicable_skippingProfileIDValidation_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCac heIfApplicable:skippingProfileIDValidation:error:");
}

id objc_msgSend_containerWithIdentifier_forPersona_ofContentClass_createIfNeeded_created_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:");
}

id objc_msgSend_createSafeHarborWithIdentifier_forPersona_containerType_andMigrateDataFrom_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:");
}

id objc_msgSend_createSafeHarborWithIdentifier_forPersona_containerType_andMigrateDataFrom_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:withError:");
}

id objc_msgSend_dataContainerForExecutableBundle_forPersona_createIfNeeded_temporary_created_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:");
}

id objc_msgSend_enumerateAppExtensionsInBundle_forPersona_updatingAppExtensionParentID_ensureAppExtensionsAreExecutable_installProfiles_error_enumerator_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:insta llProfiles:error:enumerator:");
}

id objc_msgSend_enumerateContainersWithClass_forPersona_isTransient_identifiers_groupIdentifiers_usingBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:");
}

id objc_msgSend_initWithBundle_inStagingRoot_packageFormat_identity_domain_installOptions_existingBundleContainer_operationType_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:");
}

id objc_msgSend_initWithBundle_inStagingRoot_packageFormat_identity_domain_installOptions_manifestURL_existingBundleContainer_patchType_operationType_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer :patchType:operationType:error:");
}

id objc_msgSend_initWithCFBundleVersion_cfBundleShortVersion_bundleIdentifier_uiSupportedDevices_infoPlistHash_infoPlistHashAlgorithm_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:");
}

id objc_msgSend_initWithCommandLineArgs_targets_toolVersion_toolArch_toolBuiltWithSDKVersion_toolBuiltWithXcodeVersion_hostVersion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:");
}

id objc_msgSend_initWithIdentity_bundleContainer_existingBundleContainer_installationDomain_operationType_installOptions_bundleSigningInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:");
}

id objc_msgSend_moveItemInStagingDirectory_atRelativePath_toDestinationURL_onBehalfOf_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:");
}

id objc_msgSend_moveItemInStagingDirectory_atRelativePath_toDestinationURL_onBehalfOf_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:withError:");
}

id objc_msgSend_registerApplicationForRebuildWithInfoDictionaries_requestContext_registrationError_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerApplicationForRebuildWithInfoDictionaries:requestContext:registrationError:");
}

id objc_msgSend_registerContainerizedApplicationWithInfoDictionaries_operationUUID_requestContext_saveObserver_registrationError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:");
}

id objc_msgSend_registerSafeHarborAtURL_withOptions_forIdentifier_forPersona_ofType_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:");
}

id objc_msgSend_registerUsingDiscoveredInformationForAppBundleID_inDomain_resultingRecordPromise_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:");
}

id objc_msgSend_registrationStatePreconditionForBundleWithIdentifier_placeholderInstalled_fullApplicationInstalled_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:");
}

id objc_msgSend_removeAllReferencesForIdentifier_inDomain_forUserWithID_wasLastReference_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllReferencesForIdentifier:inDomain:forUserWithID:wasLastReference:error:");
}

id objc_msgSend_removeReferenceForIdentity_inDomain_forUserWithID_wasLastReference_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeReferenceForIdentity:inDomain:forUserWithID:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_removeReferenceForUserWithID_personaUniqueString_inBundleContainer_wasLastReference_resultingPersonaUniqueStrings_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_removeTemporaryReferenceForUserWithID_personaUniqueString_inBundleContainer_wasLastReference_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:");
}

id objc_msgSend_serializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_onBehalfOf_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:");
}

id objc_msgSend_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setPersonaUniqueStrings:forApplicationWithBundleIdentifier:operationUUID:requestContext:saveObserver:error:");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardizeOwnershipAtURL:toUID:GID:removeACLs:setProtectionClass:foundSymlink:error:");
}

id objc_msgSend_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:");
}

id objc_msgSend_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:req uestContext:saveObserver:unregistrationError:");
}

id objc_msgSend_updatePlaceholderMetadataForApplicationWithIdentifier_operationUUID_requestContext_installType_failure_saveObserver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updatePlaceholderMetadataForApplicationWithIdentifier:operationUUID:requestContext:installType:failure:saveObserver:error:");
}

id objc_msgSend_updateSINFMetadataForApplicationWithIdentifier_operationUUID_requestContext_parsedSINFInfo_saveObserver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateSINFMetadataForApplicationWithIdentifier:operationUUID:requestContext:parsedSINFInfo:saveObserver:error:");
}

id objc_msgSend_updateiTunesMetadataForApplicationWithIdentifier_operationUUID_requestContext_metadataPlist_saveObserver_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateiTunesMetadataForApplicationWithIdentifier:operationUUID:requestContext:metadataPlist:saveObserver:error:");
}

id objc_msgSend_xpcServiceBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcServiceBundlesWithError:");
}